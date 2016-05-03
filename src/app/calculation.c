
#include "common.h"
#include "include.h"
#include "FTM.h"
#include "calculation.h"
#define CenterPosition 72

//#define DebugSpeed
//#define DebugDirection
//#define AutoSpeed

s16 CountTemp;
s16 Speed;
float SpeedKc = 3.0f;
s16 SpeedSp = 10;
float SI = 1.0f;//�ٶȿ����еĻ�������ǿ����Խ��Խǿ

extern uint8 CenterLine[CameraHight];      //������λ�ô洢����, 255Ϊ��Чֵ
s16 DirectionKc = 2;
float DirectionErrorMan = 0;


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
	static s16 e0=0, e1=0;
	static float DutyStd = 50;
	static u32 duty = 150;
	//printf("SC: Speed = %d\n", Speed);
	e1 = SpeedSp - Speed;
	if (e1 < 5 && e1>-5)
	{
		#ifdef DebugSpeed
		printf("SpeedPIcontrol: duty = %ld, SpeedSp = %d, Speed = %d, e1 = %d, e0 = %d\n", duty, SpeedSp, Speed, e1, e0);
		#endif
		duty = (u32)DutyStd + 100;
		return duty;
    }
	/*
	ʵ�ʵ�PI�㷨Ӧ��������
	delta = SpeedKc * (e1 - e0 + Ts/Ti*e1);
	DutyStd += delta;
	����Ts=200ms��Ti=195ms����Ts/Ti��1
	*/
	DutyStd += SpeedKc * (e1 + SI * (e1 - e0));
	
	e0 = e1;

	//�����λ��������0-100��׼�ź�
	if (DutyStd >100)	DutyStd = 100;
	if (DutyStd <0)		DutyStd = 0;

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

	//����15��24�����׼��ƽ��ƫ������ٶȿ���
	ErrorS = 0;
	count = 0;
	for(k=0; k<10; k++)
	{
		if(CenterLine[15 + k] != NullValue){ ErrorS += (ErrorF - CenterLine[30+k]); count++;}
	}
	if(count != 0) ErrorS /= count;
	#ifdef AutoSpeed
	if (ErrorS >= 20)		SpeedSp = 15;
	else if (ErrorS <= 5)	SpeedSp = 60;
	else					SpeedSp = 75 - 3 * ErrorS;
	#endif
        
	//����30��39�����׼��ƽ��ƫ��
	Error1 = 0;
	count = 0;
	for(k=0; k<10; k++)
	{
		if(CenterLine[30 + k] != NullValue){ Error1 += (ErrorF - CenterLine[30+k]); count++;}
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
	//if(Error2 > Error22) Error = 16 * Error2;
	//else Error = 16 * Error22;
	Error = Error2;

	//���б�׼����ʹƫ�����ڣ�-50��50���У�������Χ��ֱ�Ӻ���
	DirectionError = Error * 4.0f;
	if (DirectionError < -50)	DirectionError = -50;
	if (DirectionError > 50)	DirectionError = 50;
	//DirectionError =  DirectionErrorMan;
	#ifdef DebugDirection	
	printf("\nErrorF = %d\tError1 = %d\tError2 = %d\tError = %d\tDirectionError = %d\n", (s16)ErrorF, (s16)Error1, (s16)Error2, (s16)Error, (s16)DirectionError);
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
	static float DutyStd = 50;
	static u32 duty = 146;
	static u32 dutysave[5];
	static u32 count;
	static u32 midduty;
	static u32 sumduty;

	sumduty = dutysave[0] + dutysave[1] + dutysave[2] + dutysave[3] + dutysave[4];
	midduty = sumduty / 5;
	if(DirectionError < 5 && DirectionError > -5)
	{
		duty = 146;
		if(count < 5) count++;
		for(u8 i = 0; i < 3;i++)dutysave[i] = dutysave[i + 1];
		dutysave[4] = duty;
		return duty;
	}
	
	//��ƫ�����һ�������Ե�ӳ��
	if (DirectionError > 0 )
	{
		DirectionError = DirectionError * DirectionError / 50;
	}
	else
	{
		DirectionError = -1 * DirectionError * DirectionError / 50;
	}
	

	//ƫ�����5��Ӧ����ת
	if(DirectionError >= 5)
	{
		DutyStd = 1.0f * DirectionError;
	}
	//ƫ��С��-5��Ӧ����ת
	if(DirectionError <= -5)
	{
		DutyStd = 1.0f * DirectionError;
	}
	//DutyStd += (e2 - e1  + (e2 - 2 * e1 + e0)) * DirectionKc;
	//printf("DirectionPIDcontrol: e2=%d, e1=%d, e0=%d\n", e2, e1, e0);
	//printf("DutyStd = %ld\t", DutyStd);

	if (DutyStd > 45)	DutyStd = 45;	//��ת���޷�
	if (DutyStd < -41)	DutyStd = -41;	//��ת���޷�
	//printf("Error = %ld\tDutyStd = %ld\t", DirectionError, DutyStd);

	duty = (u32)(DutyStd * 0.8f + 146);	//�õ�ʵ�����ڿ��Ƶ����ռ�ձȣ���Ҫ����PWM_precision=1000��
	
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
	#ifdef DebugDirection
	printf("duty = %ld\n", duty);
	#endif

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
	if(ImageProFlag==1)
	{
		FTM_PWM_Duty(FTM1, CH0, DirectionPIDcontrol(DirectionTransmitter()));	//PID�㷨�Զ����Ʒ���
	}
}
