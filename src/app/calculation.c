
#include "common.h"
#include "include.h"
#include "FTM.h"
#include "calculation.h"
#define CenterPosition 72

//#define DebugSpeed
#define DebugDirection
#define AutoSpeed

s16 CountTemp;
s16 Speed;
float SpeedKc = 3.0f;
s16 SpeedSp = 10;
float SI = 2.0f;//速度控制中的积分作用强弱，越大越强
float SD = 1.0f;//速度控制中的微分作用强弱，越大越强
float DD = 1.0f;//方向控制中的微分作用强弱，越大越强

extern uint8 CenterLine[CameraHight];      //中心线位置存储数组, 255为无效值
extern uint8 CrossFlag;
s16 DirectionKc = 2;
float DirectionErrorMan = 0;
float KL = 1.1f, KR = 1.0f;
float SpeedStraight = 30, SpeedTurn = 0;

/*********************************************************** 
函数名称：CCD_init
函数功能：
入口参数：
出口参数：无 
备 注： 
***********************************************************/
extern u8  BUFF[500] ;
extern u8  ADdata[DATALINE][DATACOUNT];

void CCD_INC (void){
	gpio_Interrupt_init(PORTD,1, GPI_UP,FALLING);				//场中断
	gpio_Interrupt_init(PORTC,8, GPI_DOWN, RING);				//行中断 
	DMA_PORTx2BUFF_Init (DMA_CH4, (void *)&PTB_BYTE0_IN, ADdata, PTB9, DMA_BYTE1, DATACOUNT, DMA_rising_down);
}

void  DCMoto_init(void)
{   
	//lptmr_counter_init(LPT0_ALT2, LIN_COUT, 2, LPT_Rising);	//初始化脉冲计数器 ，PTC5输入捕获脚，LIN_cout =100，预处理为2，上升沿捕获 
	FTM_PWM_init(FTM0 , CH5, 8000,0);							//电机占空比设置初始化    占空比 = duty /(MOD +1 ) ;FTM_CnV_REG(FTMx[ftmn], ch) = cv;
	FTM_PWM_init(FTM0 , CH6, 8000,0);							//电机占空比设置初始化    占空比 = duty /(MOD +1 ) ;FTM_CnV_REG(FTMx[ftmn], ch) = cv;
	gpio_set (PORTD, 7, 1);										//H桥使能
}

/*********************************************************** 
函数名称：MaPan_init
函数功能：与码盘相关的引脚、FTM2输入捕获、相关变量的初始化
入口参数：无
出口参数：无 
备 注： 
***********************************************************/
void MaPan_init()
{ 
	gpio_init (PORTA, 10, GPI_UP, 0);
	//PTA10用于码盘PA相的输入
	FTM_Input_init(FTM2, CH0, Rising);
	//使用FTM2的输入捕获，上升沿捕获（含使能）
	CountTemp = 0;
	Speed = 0;
}

/*********************************************************** 
函数名称：SpeedTransmitter
函数功能：对速度的检测与变送
入口参数：无
出口参数：无 
备 注：实际速度存储在CountTemp中，经过转换变为0-100的标准信号，存储在Speed中
***********************************************************/
s16 SpeedTransmitter()
{
	//printf("Into SpeedTransmitter: ");
	if (CountTemp > 80)	CountTemp = 80;
	if (CountTemp < 30)	CountTemp = 30;
	Speed = 2 * CountTemp - 60;
	CountTemp = 0;
	//printf("ST: Speed = %d\t", Speed);
	return Speed;
}

/*********************************************************** 
函数名称：SpeedPIcontrol
函数功能：对速度的PI算法计算占空比
入口参数：速度检测值，0-100标准信号
出口参数：实际应有的占空比，用于驱动电机
备 注：
***********************************************************/
u32 SpeedPIcontrol(s16 Speed)
{
	//printf("Into SpeedPIcontrol\n");
	static s16 e0=0, e1=0, e2=0, s2, s1, s0;
	static float DutyStd = 50;
	static u32 duty = 150;
	//printf("SC: Speed = %d\n", Speed);
	e2 = SpeedSp - Speed;
	s2 = Speed;
	if (e2 < 5 && e2>-5)
	{
		#ifdef DebugSpeed
		printf("SpeedPIcontrol: duty = %ld, SpeedSp = %d, Speed = %d, e2 = %d, e1 = %d, e0 = %d\n", duty, SpeedSp, Speed, e2, ,e1, e0);
		#endif
		duty = (u32)DutyStd + 100;
		return duty;
    }
	/*
	实际的PID算法应该是这样
	delta = SpeedKc * (e2 - e1 + Ts/Ti*e2 + Td/Ts*(e2 - 2 * e1 + e0));
	DutyStd += delta;
	其中Ts=200ms，Ti=195ms，则Ts/Ti≈1
	*/
	
	DutyStd += SpeedKc * (e2 + SI * (e2 - e1) - SD * (s2 - 2 * s1 + s0));
	
	e0 = e1;
	e1 = e2;
	s0 = s1;
	s1 = s2;

	//输出限位，限制在0-100标准信号
	if (DutyStd > 100)	DutyStd = 100;
	if (DutyStd < -20)	DutyStd = -20;

	duty = (u32)(DutyStd + 100);	//得到实际用于控制电机的占空比（还要除以PWM_precision=1000）
	
	#ifdef DebugSpeed
	printf("SpeedPIcontrol: duty = %ld, SpeedSp = %d, Speed = %d, e1 = %d, e0 = %d\n", duty, SpeedSp, Speed, e1, e0);
	#endif
	
	return duty;
}


/*********************************************************** 
函数名称：DirectionTransmitter
函数功能：对方向的检测与变送
入口参数：无
出口参数：无
备 注：通过修改全局变量DirectionError来传递参数
***********************************************************/
float DirectionTransmitter()
{
	//printf("Into DirectionTransmitter\n");
	static float Error1, Error2, ErrorF, Error, DirectionError;
	static float ErrorS; //用于速度控制的偏差，计算时取比较靠上的行

	u16 k;
	u8 count;

	//第0行是最上面
	//计算跑道中心与图像中心的基准偏差
	ErrorF = 0;
	count = 0;
	for(k=0; k<5; k++)
	{
		if(CenterLine[40 + k] != NullValue){ ErrorF += CenterLine[40+k]; count++;}
	}
	if(count != 0) ErrorF /= count;

	//计算15至20行与基准的平均偏差，用于速度控制
	ErrorS = 0;
	count = 0;
	for(k=0; k<15; k++)
	{
		if(CenterLine[15 + k] != NullValue){ ErrorS += (CenterPosition - CenterLine[15+k]); count++;}
	}
	if(count != 0) ErrorS /= count;
	if(ErrorS > 50)		ErrorS = 50;
	if(ErrorS < -50)	ErrorS = -50;
	
        
	//计算30至39行与中心的平均偏差
	Error1 = 0;
	count = 0;
	for(k=0; k<10; k++)
	{
		if(CenterLine[30 + k] != NullValue){ Error1 += (CenterPosition - CenterLine[30+k]); count++;}
	}
	if(count != 0) Error1 /= count;
        
	//计算30至39行与中心的平均偏差
	Error2 = 0;
	count = 0;
	for(k=0; k<10; k++)
	{
		if(CenterLine[30 + k] != NullValue){ Error2 += (CenterPosition - CenterLine[30+k]); count++;}
	}
	if(count != 0) Error2 /= count;

	//用加权平均计算总偏差
	Error = 0.2 * ErrorS + 0.8 * Error2;

	//进行标准化，使偏差落在（-50，50）中，超出范围则直接忽略
	DirectionError = Error * 4.0f;
	if (DirectionError < -50)	DirectionError = -50;
	if (DirectionError > 50)	DirectionError = 50;
	//DirectionError =  DirectionErrorMan;
	
	#ifdef AutoSpeed
	//SpeedSp = (s16)((SpeedStraight - SpeedTurn) / 2500 * DirectionError * DirectionError + SpeedStraight);
	if (DirectionError > 0)	SpeedSp = (s16)((SpeedTurn - SpeedStraight) / 50 * DirectionError + SpeedStraight);
	else					SpeedSp = (s16)((SpeedStraight - SpeedTurn) / 50 * DirectionError + SpeedStraight);
	KL = DirectionError * DirectionError * 0.8 / 2500;
	KR = DirectionError * DirectionError * 0.8 / 2500;
	//if (ErrorS >= 2 || ErrorS <= -2)	{SpeedSp = 10; KL=1.2; KR=1.1;}
	//else			{SpeedSp = 30; KL=0.9; KR=0.8;}
	#endif
	
	#ifdef DebugDirection	
	printf("\nError = %d\tDirectionError = %d\tErrorS = %d\tKL = %d\n", (s16)Error, (s16)DirectionError, (s16)ErrorS, (s16)(100 * KL));
	#endif
	/*
	for(k=0; k<10; k++)
	{
		printf("CenterLine[%d] = %d\n", k, CenterLine[35+k]);
	}
	printf("\n\n\n");
	*/
	return DirectionError;
}

/*********************************************************** 
函数名称：DirectionPIDcontrol
函数功能：对方向的PID控制
入口参数：方向的检测值，-50到50的信号
出口参数：实际应有的占空比，用于驱动舵机，控制转向
备 注：由于对象自带积分特性，因此这里使用PD而去除积分作用
***********************************************************/
u32 DirectionPIDcontrol(float DirectionError)
{
	//printf("Into DirectionPIDcontrol\n");
	static float DutyStd = 50, e1, e0;
	static u32 duty = 146;
	static u32 dutysave[5];
	static u32 count;
	static u32 midduty;
	static u32 sumduty;
	static float Er[5];
	static u8 k;

	sumduty = dutysave[0] + dutysave[1] + dutysave[2] + dutysave[3] + dutysave[4];
	midduty = sumduty / 5;
	if(ImageProFlag == 1)
	{
		for (k=0; k<4; k++)
		{
			Er[k] = Er[k+1];
		}
		Er[4] = DirectionError;
		DirectionError = (Er[0] + Er[1] + Er[2] + Er[3] + Er[4]) / 5.0f;
		/*
		if(DirectionError < 2 && DirectionError > -2)
		{
			duty = 150;
			if(count < 5) count++;
			for(u8 i = 0; i < 3;i++)dutysave[i] = dutysave[i + 1];
			dutysave[4] = duty;
			return duty;
		}
		*/
	//对偏差进行一个非线性的映射
	/*
	if (DirectionError > 0 )
	{
		DirectionError = DirectionError * DirectionError / 50;
	}
	else
	{
		DirectionError = -1 * DirectionError * DirectionError / 50;
	}
	*/

	//偏差大于5，应该左转
	if(DirectionError > 0)
	{
		DutyStd += = KL * (DirectionError - e1 + DD * (DirectionError - 2 * e1 + e0));
	}
	//偏差小于-5，应该右转
	if(DirectionError < 0)
	{
		DutyStd += = KR * (DirectionError - e1 + DD * (DirectionError - 2 * e1 + e0));
	}

	e0 = e1;
	e1 = DirectionError;

	//DutyStd += (e2 - e1  + (e2 - 2 * e1 + e0)) * DirectionKc;
	//printf("DirectionPIDcontrol: e2=%d, e1=%d, e0=%d\n", e2, e1, e0);
	//printf("DutyStd = %ld\t", DutyStd);

	if (DutyStd > 60)	DutyStd = 60;	//左转的限幅
	if (DutyStd < -50)	DutyStd = -50;	//右转的限幅
	//printf("Error = %ld\tDutyStd = %ld\t", DirectionError, DutyStd);

	duty = (u32)(DutyStd * 0.8f + 150);	//得到实际用于控制电机的占空比（还要除以PWM_precision=1000）
	
	if(count > 5)
	{
		if(duty - midduty < 15 || midduty - duty < 15)
		{
			if(count < 5) count++;
			for(u8 i = 0; i < 3;i++)dutysave[i] = dutysave[i + 1];
			dutysave[4] = duty;
		}
		else
			duty = dutysave[4];
	}
  }
        if(CrossFlag) duty = 146;
        printf("CrossFlag = %d\n", CrossFlag);
	#ifdef DebugDirection
	printf("duty = %ld\n", duty);
	#endif
        //if(!ImageProFlag)duty = 146;
	return duty;
}



/*********************************************************** 
函数名称：TURNPWM_init
函数功能：
入口参数：
出口参数：无 
备 注： 
***********************************************************/
void  TURNPWM_init(void)
{
	FTM_PWM_init(FTM1, CH0 , 100,75);                           //舵机占空比设置初始化   MOD =17361
	FTM_CnV_REG(FTMx[FTM1], CH0) = MIDSTRING ; 
}

/*********************************************************** 
函数名称：Control
函数功能：对速度和方向进行调节
入口参数：无
出口参数：无 
备 注： 
***********************************************************/
void Control()
{
	//printf("Into Control\n");
	//SpeedTransmitter();
	FTM_PWM_Duty(FTM0, CH5, SpeedPIcontrol(SpeedTransmitter()));		//PI算法自动控制速度
	//SpeedPIcontrol(SpeedSp, Speed);	//main()函数中直接指定速度
	//对速度的PI控制

	//对方向的PID控制
	//if(ImageProFlag==1)
	{
		FTM_PWM_Duty(FTM1, CH0, DirectionPIDcontrol(DirectionTransmitter()));	//PID算法自动控制方向
	}
}


/**************************************
*功能：获取拨码开关状态
***************************************/
u8 getCode(void)
{
    u8 State = 0;
    if (gpio_get(PORTE, 6) == 1)	State += 8;
    if (gpio_get(PORTE, 7) == 1)	State += 4;
    if (gpio_get(PORTE, 8) == 1)	State += 2;
    if (gpio_get(PORTE, 9) == 1)	State += 1;
    return State;
}
