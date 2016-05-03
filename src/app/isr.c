/******************** (C) COPYRIGHT 2011 ������ӹ����� ********************
 * �ļ���       ��isr.c
 * ����         ���жϴ�������
 *
 * ʵ��ƽ̨     ��
 * ��汾       ��
 * Ƕ��ϵͳ     ��
 *
 * ����         ��������ӹ�����
 * �Ա���       ��http://landzo.taobao.com/
**********************************************************************************/



/******************** (C) COPYRIGHT 2011 ������ӹ����� ********************
 * �ļ���       ��isr.c
 * ����         ���жϴ�������
 *
 * ʵ��ƽ̨     ��
 * ��汾       ��
 * Ƕ��ϵͳ     ��
 *
 * ����         ��������ӹ�����
 * �Ա���       ��http://landzo.taobao.com/
**********************************************************************************/



#include "common.h"
#include "include.h"
#include "calculation.h"

extern void delayms(uint32 ms);
extern uint8 ImgNew[CameraHeight][CameraWidth];

u8 TIME0flag_5ms  = 0 ;
u8 TIME0flag_10ms = 0 ;
u8 TIME0flag_15ms = 0 ;
u8 TIME0flag_20ms = 0 ;
u8 TIME0flag_50ms = 0 ;
u8 TIME0flag_200ms = 0 ; 
u8 TIME1flag_1s   = 0 ;
u8  TimeCount = 0 ;




/*************************************************************************
*                             ������ӹ�����
*
*  �������ƣ�USART1_IRQHandler
*  ����˵��������1 �ж� ���� ������
*  ����˵������
*  �������أ���
*  �޸�ʱ�䣺2012-2-14    �Ѳ���
*  ��    ע��
*************************************************************************/


void USART1_IRQHandler(void)
{
    uint8 ch;

    DisableInterrupts;		    //�����ж�

    //����һ���ֽ����ݲ��ط�
    ch = uart_getchar (UART1);      //���յ�һ������
    uart_sendStr  (UART1, "\n�㷢�͵�����Ϊ��");
    uart_putchar (UART1, ch);       //�ͷ��ͳ�ȥ

    EnableInterrupts;		    //�����ж�
}
/*************************************************************************
*                             ����Ƕ��ʽ����������
*
*  �������ƣ�PIT1_IRQHandler
*  ����˵����PIT1��ʱ�жϷ�����
*  ����˵������
*  �������أ���
*  �޸�ʱ�䣺2012-9-18    �Ѳ���
*  ��    ע��
*************************************************************************/

void PIT1_IRQHandler(void)
{
   PIT_Flag_Clear(PIT1);       //���жϱ�־λ
   TIME1flag_1s = 1 ;
   
}

/*************************************************************************
*                             ������ӹ�����
*
*  �������ƣ�PIT0_IRQHandler
*  ����˵����PIT0 ��ʱ�жϷ�����
*  ����˵������
*  �������أ���
*  �޸�ʱ�䣺2012-2-18    �Ѳ���
*  ��    ע��
*************************************************************************/



void PIT0_IRQHandler(void)
{
   PIT_Flag_Clear(PIT0);       //���жϱ�־λ
   
   TimeCount ++ ;

  if(TimeCount%1 == 0 ){
     TIME0flag_5ms = 1;

 } 
  if(TimeCount%2 == 0 ){
     TIME0flag_10ms = 1;

  } 
  if(TimeCount%3 == 0 ){
     TIME0flag_15ms = 1;
  }
  if(TimeCount%4 == 0 ){
     TIME0flag_20ms = 1;
  }
  if(TimeCount%10 == 0 )
  {
    TIME0flag_50ms = 1;
  }
  if(TimeCount%40 == 0 ){
     TIME0flag_200ms = 1;
  }
  
  if(TimeCount == 120)
  {
    TimeCount = 0 ;
  }

   
}



/*************************************************************************
*                             ������ӹ�����
*
*  �������ƣ�SysTick_Handler
*  ����˵����ϵͳ�δ�ʱ���жϷ�����
*  ����˵������
*  �������أ���
*  �޸�ʱ�䣺2012-2-18    �Ѳ���
*  ��    ע��ucos���õõ�
*************************************************************************/
void SysTick_Handler(void)
{
    //    OSIntEnter();
    //    OSTimeTick();
    //    OSIntExit();
}

/*************************************************************************
*                             ������ӹ�����
*
*  �������ƣ�PendSV_Handler
*  ����˵����PendSV��������ϵͳ���ã��жϷ�����
*  ����˵������
*  �������أ���
*  �޸�ʱ�䣺2012-2-15    �Ѳ���
*  ��    ע��uC/OS�����л�����
*************************************************************************/
void PendSV_Handler(void)
{
}
/*************************************************************************
*                             ������ӹ�����
*
*  �������ƣ�HardFault_Handler
*  ����˵����Ӳ���Ϸ��жϷ�����
*  ����˵������
*  �������أ���
*  �޸�ʱ�䣺2012-2-4    �Ѳ���
*  ��    ע��������LED��˸��ָʾ������Ӳ���Ϸ�
*************************************************************************/
void HardFault_Handler(void)
{
        printf("\n****Ӳ���Ϸô���!!!*****\r\n\n");
        SendImage(ImgNew);
        while(1);
}

/*****************************************************************
* ����˵������ʱ����������
*************************************************************/
void dlay(void)
{
    volatile uint16_t dlaycount;
    for(dlaycount = 0; dlaycount < 125; dlaycount++)
      ;
}

/*************************************************************************
*                             ������ӹ�����
*
*  �������ƣ�PORTA_IRQHandler
*  ����˵����PORTA�˿��жϷ�����
*  ����˵������
*  �������أ���
*  �޸�ʱ�䣺2012-1-25    �Ѳ���
*  ��    ע�����ź���Ҫ�Լ���ʼ�������
*************************************************************************/

  
/**************************
����ͷ���ñ���
***************************/
u8  DMA_Over_Flg = 0 ;     //���ɼ���ɱ�־λ
u16 LinCout =0;
u16 LinADCout =0;
u8 AcqFlg =0 ;
u16 *linarrycot = 0;
u16 AcqAryy[] = {0X110 ,0XFFFF ,0XFFFF};
u16 makcout = 0 ;
extern u8  BUFF[500] ;
extern u8  DMA_Over_Flg ;
extern u8  ADdata[DATALINE][DATACOUNT];
void PORTD_IRQHandler(){
    //BFdelay_1us(200);
    if(PORTD_ISFR & 0x0002)         //PTD1�����ж�,�ɼ��ĳ��жϡ�
    {
        PORTD_ISFR  |= 0x0002;        //д1���жϱ�־λ
       
    //  uart_putchar(UART0,LinCout>>8);      //��������
     //   uart_putchar(UART0,LinCout);       //��������
      //uart_sendStr(UART0, (const u8*)"portDirq\n");
        LinCout = 0 ;
        LinADCout=0;
        gpio_Interrupt_init(PORTC,8, GPI_DOWN, RING) ;          //�������ж�         
    }
   
}
u16 delaytime = 335;
void PORTC_IRQHandler()
{
      //BFdelay_1us(100);
        if(PORTC_ISFR & 0x0100)            //PTC8�����жϣ��ɼ������ж�
    { 
        PORTC_ISFR  |= 0x0100;         //д1���жϱ�־λ
        LinCout ++ ; 
        DMA_IRQ_CLEAN(DMA_CH4);                             //���ͨ�������жϱ�־λ    (���������ٴν����ж�)
        if((LinCout%(480/DATALINE)==0)&&(LinADCout<DATALINE))
        {
          for(int i = 0; i < delaytime; i++);
          DMA_DADDR(CH4) = (u32)(&ADdata[ LinADCout][0]);
          DMA_EN(DMA_CH4);                                    //ʹ��ͨ��CHn Ӳ������      (�������ܼ�������DMA����) 
          DMA_IRQ_EN(DMA_CH4) ;                             //����DMAͨ������
        //  PTA16_OUT = ~PTA16_OUT ;
          LinADCout ++ ;
        }
      
         if(LinADCout==DATALINE)
         {
            DMA_Over_Flg = 1 ;
            //gpio_Interrupt_init(PORTC,8, GPI_DOWN, GPI_DISAB) ;          //���ж�
         }
    }
}

/*************************************************************************
*                             ������ӹ�����
*
*  �������ƣ�PORTB_IRQHandler
*  ����˵����PORTB�˿��жϷ�����
*  ����˵������
*  �������أ���
*  �޸�ʱ�䣺2012-1-25    �Ѳ���
*  ��    ע�����ź���Ҫ�����Լ���ʼ�����޸�
*************************************************************************/
void PORTB_IRQHandler()
{
    
  //  PORT_PCR_REG(PORTB , 10) |= PORT_PCR_ISF(1);
    u8  n = 0;    //���ź�
    n = 0;
    if(PORTB_ISFR & (1 << n))         //PTB0�����ж�
    {
        PORTB_ISFR  |= (1 << n);        //д1���жϱ�־λ
        /*  �û�����  */

    }

    n = 10;
    if(PORTB_ISFR & (1 << n))         //PTB10�����ж�
    {
        PORTB_ISFR  |= (1 << n);        //д1���жϱ�־λ
        /*  �û�����  */



    }
}

void PORTE_IRQHandler()
{
	//  PORT_PCR_REG(PORTE, 10) |= PORT_PCR_ISF(1);
    u8  n = 0;    //���ź�
	u8	State = 0;		//�����жϲ��뿪�ص�״̬��4λ�����ƣ�1��2��3��4λ�Ӹߵ���

	gpio_Interrupt_init(PORTE, 1, GPI_DOWN, GPI_DISAB);
    n = 1;
    if(PORTE_ISFR & (1 << n))			//PTE1�����ж�
	{
		PORTE_ISFR  |= (1 << n);		//д1���жϱ�־λ
		if (gpio_get(PORTE, 6) == 1)	State += 8;
		if (gpio_get(PORTE, 7) == 1)	State += 4;
		if (gpio_get(PORTE, 8) == 1)	State += 2;
		if (gpio_get(PORTE, 9) == 1)	State += 1;
		SpeedSp = State * 7;
		if (SpeedSp > 100)	SpeedSp = 100;	//���ٶȵ��趨ֵ������λ�����ձ�֤��0-100
	}
	else if(PORTE_ISFR & (1 << 2))		//K3�����ж�
	{
		PORTE_ISFR  |= (1 << 2);
		DirectionErrorMan ++;
		delaytime ++;
                if (DirectionErrorMan > 50)	DirectionErrorMan = 50;
		printf("DirectionErrorMan = %d\n", (s16)DirectionErrorMan);
	}
	else if(PORTE_ISFR & (1 << 3))		//K4�����ж�
	{
		PORTE_ISFR  |= (1 << 3);
		DirectionErrorMan --;
		delaytime--;
                if (DirectionErrorMan < -50)	DirectionErrorMan = -50;
		printf("DirectionErrorMan = %d\n", (s16)DirectionErrorMan);
	}
	delayms(20);
	//printf("State = %d\n", State);
	gpio_Interrupt_init(PORTE, 1, GPI_DOWN, RING);
}

/*************************************************************************
*                             ����Ƕ��ʽ����������
*
*  �������ƣ�PIT2_IRQHandler
*  ����˵����PIT2��ʱ�жϷ�����
*  ����˵������
*  �������أ���
*  �޸�ʱ�䣺2012-9-18    �Ѳ���
*  ��    ע��
*************************************************************************/

void PIT2_IRQHandler(void)
{
   PIT_Flag_Clear(PIT2);       //���жϱ�־λ
   
}
/*************************************************************************
*                             ������ӹ�����
*
*  �������ƣ�FTM0_IRQHandler
*  ����˵����FTM0���벶׽�жϷ�����
*  ����˵������
*  �������أ���
*  �޸�ʱ�䣺2012-2-25
*  ��    ע�����ź���Ҫ�����Լ���ʼ�����޸ģ��ο����еĴ�������Լ��Ĺ���
*************************************************************************/
void FTM0_IRQHandler()
{


}

/*************************************************************************
*                             ������ӹ�����
*
*  �������ƣ�FTM1_IRQHandler
*  ����˵����FTM1���벶׽�жϷ�����
*  ����˵������
*  �������أ���
*  �޸�ʱ�䣺2012-2-25
*  ��    ע�����ź���Ҫ�����Լ���ʼ�����޸ģ��ο����еĴ�������Լ��Ĺ���
*************************************************************************/
void FTM1_IRQHandler()
{
    u8 s = FTM1_STATUS;             //��ȡ��׽�ͱȽ�״̬  All CHnF bits can be checked using only one read of STATUS.
    u8 n;
    FTM1_STATUS = 0x00;               //���жϱ�־λ

    n = 0;
    if( s & (1 << n) )
    {
        FTM_CnSC_REG(FTM1_BASE_PTR, n) &= ~FTM_CnSC_CHIE_MASK; //��ֹ���벶׽�ж�
        /*     �û�����       */

        printf("\nFTM1�����ж�\n");

        /*********************/
        //�����������￪�����벶׽�жϣ�������main�����������Ҫ������
        //ͨ�� CH0��CH1��Ch2��Ch3 ���˲���
        //FTM_CnSC_REG(FTM1_BASE_PTR,n) |= FTM_CnSC_CHIE_MASK;  //�������벶׽�ж�
        //delayms(10);        //��Ϊ������ź�������̲��ȶ������״���������벶׽�����������ʱ
        //�����ǵ��жϲ�Ӧ�ù�����ʱ�����Կ����벶׽�жϾͷ���main�����������Ҫ������
    }

    n = 1;
    if( s & (1 << n) )
    {
        FTM_CnSC_REG(FTM1_BASE_PTR, n) &= ~FTM_CnSC_CHIE_MASK; //��ֹ���벶׽�ж�
        /*     �û�����       */


        /*********************/
        //�����������￪�����벶׽�ж�
        //FTM_CnSC_REG(FTM1_BASE_PTR,n) |= FTM_CnSC_CHIE_MASK;  //�������벶׽�ж�
    }

}


/*************************************************************************
*                             ������ӹ�����
*
*  �������ƣ�FTM2_IRQHandler
*  ����˵����FTM2���벶׽�жϷ�����
*
*************************************************************************/
void FTM2_IRQHandler()
{
    //u8 s = FTM2_STATUS;             //��ȡ��׽�ͱȽ�״̬  All CHnF bits can be checked using only one read of STATUS.
    FTM2_STATUS = 0x00;               //���жϱ�־λ
    
        FTM_CnSC_REG(FTM2_BASE_PTR, 0) &= ~FTM_CnSC_CHIE_MASK; //��ֹ���벶׽�ж�
        /*     �û�����       */

        //printf("\nFTM2�����ж�\n");
        CountTemp++;
        //printf("Into FTM2_IRQ: CountTemp = %d\n", CountTemp);
        //printf("%d\t", CountTemp++);

        /*********************/
        //�����������￪�����벶׽�жϣ�������main�����������Ҫ������
        FTM_CnSC_REG(FTM2_BASE_PTR,0) |= FTM_CnSC_CHIE_MASK;  //�������벶׽�ж�
        //delayms(10);        //��Ϊ������ź�������̲��ȶ������״���������벶׽�����������ʱ
        //�����ǵ��жϲ�Ӧ�ù�����ʱ�����Կ����벶׽�жϾͷ���main�����������Ҫ������
}

volatile u8  pit_flag = 0;
volatile u32 dma_int_count = 0;


/*************************************************************************
*                             ������ӹ�����
*
*  �������ƣ�DMA_CH4_Handler
*  ����˵����DMAͨ��4���жϷ�����
*  ����˵�����ǲɼ�����ͷ���ݣ�������Ϊ����ͷAD���ݣ����Բɼ���300���㡣
             ���ñ�־λ�ܹ���ʱ���ơ�
*  �������أ���
*  �޸�ʱ�䣺2012-3-18    �Ѳ���
*  ��    ע��
*************************************************************************/

void DMA_CH4_Handler(void)
{
  //DMAͨ��4

  //  PTA16_OUT = ~PTA16_OUT ;
    DMA_IRQ_DIS(DMA_CH4);
    DMA_IRQ_CLEAN(DMA_CH4) ;
    DMA_DIS(DMA_CH4);
   //uart_sendStr(UART0, (const u8*)"DMA4irq\n");
 
}

/*************************************************************************
*                             ������ӹ�����
*
*  �������ƣ�DMA_CH4_Handler
*  ����˵����DMAͨ��4���жϷ�����
*  ����˵�����ǲɼ�����ͷ���ݣ�������λ����ͷAD���ݣ����Բɼ���300���㡣
             ���ñ�־λ�ܹ���ʱ���ơ�
*  �������أ���
*  �޸�ʱ�䣺2012-3-18    �Ѳ���
*  ��    ע��
*************************************************************************/
void DMA_CH0_Handler(void)
{

    //DMAͨ��0
    printf("DMA_CH0_Handler\n");
    DMA_IRQ_CLEAN(DMA_CH0);                             //���ͨ�������жϱ�־λ    (���������ٴν����ж�)
    DMA_EN(DMA_CH0);                                    //ʹ��ͨ��CHn Ӳ������      (�������ܼ�������DMA����)
  //   uart_putchar(UART0,0XAA);
}



volatile u8 LPT_INT_count = 0;
void  LPT_Handler(void)
{
    LPTMR0_CSR |= LPTMR_CSR_TCF_MASK;   //���LPTMR�Ƚϱ�־
    LPT_INT_count++;                    //�ж������1
}