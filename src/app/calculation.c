
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
float SI = 2.0f;//�ٶȿ����еĻ�������ǿ����Խ��Խǿ
float SD = 1.0f;//�ٶȿ����е�΢������ǿ����Խ��Խǿ
float DD = 1.0f;//��������е�΢������ǿ����Խ��Խǿ

extern uint8 CenterLine[CameraHight];      //������λ�ô洢����, 255Ϊ��Чֵ
extern uint8 CrossFlag;
s16 DirectionKc = 2;
float DirectionErrorMan = 0;
float KL = 1.1f, KR = 1.0f;
float SpeedStraight = 30, SpeedTurn = 0;

/*********************************************************** 
�������ƣ�CCD_init
�������ܣ�
��ڲ�����
���ڲ������� 
�� ע�� 
***********************************************************/
extern u8  BUFF[500] ;
extern u8  ADdata[DATALINE][DATACOUNT];

void CCD_INC (void){
	gpio_Interrupt_init(PORTD,1, GPI_UP,FALLING);				//���ж�
	gpio_Interrupt_init(PORTC,8, GPI_DOWN, RING);				//���ж� 
	DMA_PORTx2BUFF_Init (DMA_CH4, (void *)&PTB_BYTE0_IN, ADdata, PTB9, DMA_BYTE1, DATACOUNT, DMA_rising_down);
}

void  DCMoto_init(void)
{   
	//lptmr_counter_init(LPT0_ALT2, LIN_COUT, 2, LPT_Rising);	//��ʼ����������� ��PTC5���벶��ţ�LIN_cout =100��Ԥ����Ϊ2�������ز��� 
	FTM_PWM_init(FTM0 , CH5, 8000,0);							//���ռ�ձ����ó�ʼ��    ռ�ձ� = duty /(MOD +1 ) ;FTM_CnV_REG(FTMx[ftmn], ch) = cv;
	FTM_PWM_init(FTM0 , CH6, 8000,0);							//���ռ�ձ����ó�ʼ��    ռ�ձ� = duty /(MOD +1 ) ;FTM_CnV_REG(FTMx[ftmn], ch) = cv;
	gpio_set (PORTD, 7, 1);										//H��ʹ��
}

/*********************************************************** 
�������ƣ�MaPan_init
�������ܣ���������ص����š�FTM2���벶����ر����ĳ�ʼ��
��ڲ�������
���ڲ������� 
�� ע�� 
***********************************************************/
void MaPan_init()
{ 
	gpio_init (PORTA, 10, GPI_UP, 0);
	//PTA10��������PA�������
	FTM_Input_init(FTM2, CH0, Rising);
	//ʹ��FTM2�����벶�������ز��񣨺�ʹ�ܣ�
	CountTemp = 0;
	Speed = 0;
}

/*********************************************************** 
�������ƣ�SpeedTransmitter
�������ܣ����ٶȵļ�������
��ڲ�������
���ڲ������� 
�� ע��ʵ���ٶȴ洢��CountTemp�У�����ת����Ϊ0-100�ı�׼�źţ��洢��Speed��
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
�������ƣ�SpeedPIcontrol
�������ܣ����ٶȵ�PI�㷨����ռ�ձ�
��ڲ������ٶȼ��ֵ��0-100��׼�ź�
���ڲ�����ʵ��Ӧ�е�ռ�ձȣ������������
�� ע��
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
	ʵ�ʵ�PID�㷨Ӧ��������
	delta = SpeedKc * (e2 - e1 + Ts/Ti*e2 + Td/Ts*(e2 - 2 * e1 + e0));
	DutyStd += delta;
	����Ts=200ms��Ti=195ms����Ts/Ti��1
	*/
	
	DutyStd += SpeedKc * (e2 + SI * (e2 - e1) - SD * (s2 - 2 * s1 + s0));
	
	e0 = e1;
	e1 = e2;
	s0 = s1;
	s1 = s2;

	//�����λ��������0-100��׼�ź�
	if (DutyStd > 100)	DutyStd = 100;
	if (DutyStd < -20)	DutyStd = -20;

	duty = (u32)(DutyStd + 100);	//�õ�ʵ�����ڿ��Ƶ����ռ�ձȣ���Ҫ����PWM_precision=1000��
	
	#ifdef DebugSpeed
	printf("SpeedPIcontrol: duty = %ld, SpeedSp = %d, Speed = %d, e1 = %d, e0 = %d\n", duty, SpeedSp, Speed, e1, e0);
	#endif
	
	return duty;
}


/*********************************************************** 
�������ƣ�DirectionTransmitter
�������ܣ��Է���ļ�������
��ڲ�������
���ڲ�������
�� ע��ͨ���޸�ȫ�ֱ���DirectionError�����ݲ���
***********************************************************/
float DirectionTransmitter()
{
	//printf("Into DirectionTransmitter\n");
	static float Error1, Error2, ErrorF, Error, DirectionError;
	static float ErrorS; //�����ٶȿ��Ƶ�ƫ�����ʱȡ�ȽϿ��ϵ���

	u16 k;
	u8 count;

	//��0����������
	//�����ܵ�������ͼ�����ĵĻ�׼ƫ��
	ErrorF = 0;
	count = 0;
	for(k=0; k<5; k++)
	{
		if(CenterLine[40 + k] != NullValue){ ErrorF += CenterLine[40+k]; count++;}
	}
	if(count != 0) ErrorF /= count;

	//����15��20�����׼��ƽ��ƫ������ٶȿ���
	ErrorS = 0;
	count = 0;
	for(k=0; k<15; k++)
	{
		if(CenterLine[15 + k] != NullValue){ ErrorS += (CenterPosition - CenterLine[15+k]); count++;}
	}
	if(count != 0) ErrorS /= count;
	if(ErrorS > 50)		ErrorS = 50;
	if(ErrorS < -50)	ErrorS = -50;
	
        
	//����30��39�������ĵ�ƽ��ƫ��
	Error1 = 0;
	count = 0;
	for(k=0; k<10; k++)
	{
		if(CenterLine[30 + k] != NullValue){ Error1 += (CenterPosition - CenterLine[30+k]); count++;}
	}
	if(count != 0) Error1 /= count;
        
	//����30��39�������ĵ�ƽ��ƫ��
	Error2 = 0;
	count = 0;
	for(k=0; k<10; k++)
	{
		if(CenterLine[30 + k] != NullValue){ Error2 += (CenterPosition - CenterLine[30+k]); count++;}
	}
	if(count != 0) Error2 /= count;

	//�ü�Ȩƽ��������ƫ��
	Error = 0.2 * ErrorS + 0.8 * Error2;

	//���б�׼����ʹƫ�����ڣ�-50��50���У�������Χ��ֱ�Ӻ���
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
�������ƣ�DirectionPIDcontrol
�������ܣ��Է����PID����
��ڲ���������ļ��ֵ��-50��50���ź�
���ڲ�����ʵ��Ӧ�е�ռ�ձȣ������������������ת��
�� ע�����ڶ����Դ��������ԣ��������ʹ��PD��ȥ����������
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
	//��ƫ�����һ�������Ե�ӳ��
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

	//ƫ�����5��Ӧ����ת
	if(DirectionError > 0)
	{
		DutyStd += = KL * (DirectionError - e1 + DD * (DirectionError - 2 * e1 + e0));
	}
	//ƫ��С��-5��Ӧ����ת
	if(DirectionError < 0)
	{
		DutyStd += = KR * (DirectionError - e1 + DD * (DirectionError - 2 * e1 + e0));
	}

	e0 = e1;
	e1 = DirectionError;

	//DutyStd += (e2 - e1  + (e2 - 2 * e1 + e0)) * DirectionKc;
	//printf("DirectionPIDcontrol: e2=%d, e1=%d, e0=%d\n", e2, e1, e0);
	//printf("DutyStd = %ld\t", DutyStd);

	if (DutyStd > 60)	DutyStd = 60;	//��ת���޷�
	if (DutyStd < -50)	DutyStd = -50;	//��ת���޷�
	//printf("Error = %ld\tDutyStd = %ld\t", DirectionError, DutyStd);

	duty = (u32)(DutyStd * 0.8f + 150);	//�õ�ʵ�����ڿ��Ƶ����ռ�ձȣ���Ҫ����PWM_precision=1000��
	
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
�������ƣ�TURNPWM_init
�������ܣ�
��ڲ�����
���ڲ������� 
�� ע�� 
***********************************************************/
void  TURNPWM_init(void)
{
	FTM_PWM_init(FTM1, CH0 , 100,75);                           //���ռ�ձ����ó�ʼ��   MOD =17361
	FTM_CnV_REG(FTMx[FTM1], CH0) = MIDSTRING ; 
}

/*********************************************************** 
�������ƣ�Control
�������ܣ����ٶȺͷ�����е���
��ڲ�������
���ڲ������� 
�� ע�� 
***********************************************************/
void Control()
{
	//printf("Into Control\n");
	//SpeedTransmitter();
	FTM_PWM_Duty(FTM0, CH5, SpeedPIcontrol(SpeedTransmitter()));		//PI�㷨�Զ������ٶ�
	//SpeedPIcontrol(SpeedSp, Speed);	//main()������ֱ��ָ���ٶ�
	//���ٶȵ�PI����

	//�Է����PID����
	//if(ImageProFlag==1)
	{
		FTM_PWM_Duty(FTM1, CH0, DirectionPIDcontrol(DirectionTransmitter()));	//PID�㷨�Զ����Ʒ���
	}
}


/**************************************
*���ܣ���ȡ���뿪��״̬
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
