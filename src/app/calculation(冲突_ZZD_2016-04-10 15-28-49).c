
#include "common.h"
#include "include.h"
#include "FTM.h"
#include "calculation.h"

#define FTM0_CH5        PTD5
#define FTM0_CH6        PTD6

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
    FTM_PWM_init(FTM0 , CH5, 5000,0);                          //���ռ�ձ����ó�ʼ��    ռ�ձ� = duty /(MOD +1 ) ;FTM_CnV_REG(FTMx[ftmn], ch) = cv;
    FTM_PWM_init(FTM0 , CH6, 5000,0);                          //���ռ�ձ����ó�ʼ��    ռ�ձ� = duty /(MOD +1 ) ;FTM_CnV_REG(FTMx[ftmn], ch) = cv;
    gpio_set (PORTD, 7, 1);                      //H��ʹ��
}

void Servo_init(void)
{
	u32 clk_hz = (bus_clk_khz * 1000) >> 1;       //busƵ��/2  bus_clk_khz = 50000
	u16 mod;
	u8 sc_ps;
	u16 cv;

	ASSERT( (ftmn == FTM0) || ( (ftmn == FTM1 || ftmn == FTM2 ) && (ch <= CH1))   ); //��鴫�ݽ�����ͨ���Ƿ���ȷ
	ASSERT( freq <= (clk_hz >> 1) );              //�ö��Լ�� Ƶ�� �Ƿ����� ,Ƶ�ʱ���С��ʱ�Ӷ���֮һ

	/*       �����Ƶ����       */
	mod = (clk_hz >> 16 ) / freq ;
	for(sc_ps = 0; (mod >> sc_ps) >= 1; sc_ps++);
	if(freq < 1000)sc_ps++;

	mod = (clk_hz >> sc_ps) / freq;               //Ƶ����������,clk_hz = 25000000

	cv = (50 * (mod - 0 + 1)) / FTM_PRECISON;		//ռ�ձ���������

	SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;				//ʹ��FTM1ʱ��
	SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;				//ʹ��PORTAʱ��
	PORT_PCR_REG(PORTA_BASE_PTR, 12) = PORT_PCR_MUX(3);  // PTA12��ӦFTM1_CH0

	FTM_CnSC_REG(FTMx[ftmn], ch) &= ~FTM_CnSC_ELSA_MASK;
        FTM_CnSC_REG(FTMx[ftmn], ch) = FTM_CnSC_MSB_MASK | FTM_CnSC_ELSB_MASK;
    //MSnB:MSnA = 1x
    // ELSnB:ELSnA = 10   High-true pulses  (clear Output on match)
    // ELSnB:ELSnA = 11   Low-true pulses   (set Output on match)
    // Edge-aligned PWM  ���ض���PWM��   ��k16 reference manual.pdf��  P944  ����  ��K60P144M100SF2RM.pdf��P1001


    /******************** ����ʱ�Ӻͷ�Ƶ ********************/
    FTM_SC_REG(FTMx[ftmn])    = FTM_SC_CPWMS_MASK | FTM_SC_PS(sc_ps) | FTM_SC_CLKS(1);  //û��ʹ������ж�
    FTM_CNTIN_REG(FTMx[ftmn]) = 0;                                                      // Channel (n) Value  �����������ȣ�(CnV - CNTIN).
    FTM_MOD_REG(FTMx[ftmn])   = mod;                                                    //Modulo valueģ��, EPWM������Ϊ ��MOD - CNTIN + 0x0001
    FTM_CNTIN_REG(FTMx[ftmn]) = 0;                                                      //Counter Initial Value ��������ʼ��ֵ
    FTM_CnV_REG(FTMx[ftmn], ch) = cv;
    FTM_CNT_REG(FTMx[ftmn])   = 0;                                                      //��������ֻ�е�16λ����
}

void Turn(u32 drc)
{
	
}

