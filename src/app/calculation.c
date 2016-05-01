
#include "common.h"
#include "include.h"
#include "FTM.h"
#include "calculation.h"

s16 CountTemp;
s16 Speed;
s16 SpeedKc = 3;
s16 SpeedSp = 30;

extern uint8 CenterLine[CameraHight];      //������λ�ô洢����, 255Ϊ��Чֵ
s16 DirectionKc = 2;
s16 DirectionErrorMan = 0;


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
	gpio_Interrupt_init(PORTD,1, GPI_UP,FALLING) ;          //���ж�
	gpio_Interrupt_init(PORTC,8, GPI_DOWN, RING) ;          //���ж� 
	DMA_PORTx2BUFF_Init (DMA_CH4, (void *)&PTB_BYTE0_IN, ADdata, PTB9, DMA_BYTE1, DATACOUNT, DMA_rising_down);
}

void  DCMoto_init(void)
{   
	//lptmr_counter_init(LPT0_ALT2, LIN_COUT, 2, LPT_Rising)  ;   //��ʼ����������� ��PTC5���벶��ţ�LIN_cout =100��Ԥ����Ϊ2�������ز��� 
	FTM_PWM_init(FTM0 , CH5, 8000,0);                          //���ռ�ձ����ó�ʼ��    ռ�ձ� = duty /(MOD +1 ) ;FTM_CnV_REG(FTMx[ftmn], ch) = cv;
	FTM_PWM_init(FTM0 , CH6, 8000,0);                          //���ռ�ձ����ó�ʼ��    ռ�ձ� = duty /(MOD +1 ) ;FTM_CnV_REG(FTMx[ftmn], ch) = cv;
	gpio_set (PORTD, 7, 1);                      //H��ʹ��
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
	static s32 DutyStd = 50;
	static u32 duty = 150;
        //printf("SC: Speed = %d\n", Speed);
	e1 = SpeedSp - Speed;
        if (e1 < 3 && e1>-3)
        {
          //printf("SpeedPIcontrol: duty = %ld, SpeedSp = %d, Speed = %d, e1 = %d, e0 = %d\n", duty, SpeedSp, Speed, e1, e0);
          duty = DutyStd + 100;
          return duty;
        }
	/*
	ʵ�ʵ�PI�㷨Ӧ��������
	delta = SpeedKc * (e1 - e0 + Ts/Ti*e1);
	DutyStd += delta;
	����Ts=200ms��Ti=195ms����Ts/Ti��1
	*/
	DutyStd += (2 * e1 - e0) / SpeedKc;
	
	e0 = e1;
	//�����λ��������0-100��׼�ź�
	if (DutyStd >100)	DutyStd = 100;
	if (DutyStd <0)		DutyStd = 0;

	duty = DutyStd + 100;	//�õ�ʵ�����ڿ��Ƶ����ռ�ձȣ���Ҫ����PWM_precision=1000��

	//printf("SpeedPIcontrol: duty = %ld, SpeedSp = %d, Speed = %d, e1 = %d, e0 = %d\n", duty, SpeedSp, Speed, e1, e0);

	return duty;
}


/*********************************************************** 
�������ƣ�DirectionTransmitter
�������ܣ��Է���ļ�������
��ڲ�������
���ڲ�������
�� ע��ͨ���޸�ȫ�ֱ���DirectionError�����ݲ���
***********************************************************/
s16 DirectionTransmitter()
{
	//printf("Into DirectionTransmitter\n");
	static s16 Error, Error1, Error2, ErrorF, et, DirectionError;
	u16 k;
	//��0����������
	//�����ܵ����ĵĻ�׼
	ErrorF = 0;
	for(k=0; k<5; k++)
	{
		ErrorF += CenterLine[40+k];
	}
	ErrorF /= 5;
	//����15��24�����׼��ƽ��ƫ��
	Error1 = 0;
	for(k=0; k<10; k++)
	{
		Error1 += (ErrorF - CenterLine[15+k]);
	}
	Error1 /= 10;
	//����20��29�����׼��ƽ��ƫ��
	Error2 = 0;
	for(k=0; k<10; k++)
	{
          et = CenterLine[35+k];
		Error2 += (ErrorF - et);
	}
	Error2 /= 10;
	//�ü�Ȩƽ��������ƫ��
	Error = 16 * Error2;
	//���б�׼����ʹƫ�����ڣ�-50��50���У�������Χ��ֱ�Ӻ���
	DirectionError = Error * 2 / 3;
	if (DirectionError < -50)	DirectionError = -50;
	if (DirectionError > 50)	DirectionError = 50;
	//DirectionError =  DirectionErrorMan;
        printf("\nErrorF = %d\tError1 = %d\tError2 = %d\tError = %d\tDirectionError = %d\tet = %d\n", ErrorF, Error1, Error2, Error, DirectionError, et);
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
u32 DirectionPIDcontrol(s16 DirectionError)
{
	//printf("Into DirectionPIDcontrol\n");
	static s16 e0=0, e1=0, e2=0;
	static u32 DutyStd = 50;
	static u32 duty = 79;

	e2 = DirectionError;
        if(e2-e1 <= 20 && e2 - e0 <= 20)
        {
	//��ƫ�����һ�������Ե�ӳ��
	//e2 = e2 * e2 / 50;

	/*
	ʵ�ʵ�PID�㷨Ӧ��������
	delta = SpeedKc * (e2 - e1 + Ts/Ti*e2 + Td/Ts * (e2 - 2 * e2 + e0));
	DutyStd += delta;
	������ȥ���������ã���Ϊ�����Դ���������
	*/

	//DutyStd += (e2 - e1  + (e2 - 2 * e1 + e0)) * DirectionKc;
	DutyStd = e2 + 50;
	//printf("DirectionPIDcontrol: e2=%d, e1=%d, e0=%d\n", e2, e1, e0);
	e0 = e1;
	e1 = e2;
	//printf("DutyStd = %ld\t", DutyStd);
        }
	//�����λ��������0-100��׼�ź�
	if (DutyStd > 100)	DutyStd = 100;
	if (DutyStd < 0)	DutyStd = 0;
	//printf("Error = %ld\tDutyStd = %ld\t", DirectionError, DutyStd);
	duty = DutyStd * 2 / 5 + 53;	//�õ�ʵ�����ڿ��Ƶ����ռ�ձȣ���Ҫ����PWM_precision=1000��
	printf("duty = %ld\n", duty);

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
	FTM_PWM_init(FTM1, CH0 , 50,75);                           //���ռ�ձ����ó�ʼ��   MOD =17361
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
