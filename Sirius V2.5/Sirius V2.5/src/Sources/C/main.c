/******************************************************************************/
/*******************************************************************************
���ļ��������㽭��ѧ���ܳ�Sirius������Main
����  �ܡ���Run+Faster+Fly
����  �ڡ���2014.10.09
����  �ߡ���HJZ/LYX/YCR
����  ע����
*******************************************************************************/
/******************************************************************************/
/*********************************
��dev.env.��IAR EWARM 6.30.1.3142
��Target  ��MK60-DN512-VLQ10
��Crystal ��50.000  MHz
��busclock��75.000  MHz
��pllclock��150.000 MHz
*********************************/

// Ӳ�������У�������������������OLED, ����ͷ

/************************************************************/
//#define MAIN_PROGRAM    //���������
//#define PINREAD_DEBUG   //�����������
//#define CLOCK_DEBUG     //ʱ�����Ų���
//#define CAMERA_DEBUG_7725  //OV7725����ͷ����
#define CAMERA_DEBUG_7620    //OV7620����ͷ����
//#define C_DEBUG            //C�����﷨����
//#define DAQ_DEBUG          //DAQ����
//#define DMA_DEBUG          //DMA����
//#define BLUETOOTH_DEBUG    //��������
//#define MOTOR_DEBUG           //�������      
//#define SERVO_DEBUG           //�������
//#define QUAD_DEBUG            //����������
//#define VIRTURL_DEBUG         //����ʾ��������


/************************************************************/
//#define ERROR_PIC

//=================================������================================
//���ŷ��䣺
//PORT     FUNCTION
//  A0     TCLK
//  A1     TDI
//  A2     TDO
//  A3     TMS
//  A8     ������FTM1_QD_PHA
//  A9     ������FTM1_QD_PHB
//  A10    ������FTM2_QD_PHA
//  A11    ������FTM2_QD_PHB
//  A12    ���FTM1_CH0
//  A25    SCCB_SDA
//  A26    SCCB_SCL
//  B0~B7  ����ͷ����
//  B9     PCLK
//  B16    UART0_RX
//  B17    UART0_TX
//  C8     HREF
//  C16    OLED_D0
//  C17    OLED_D1
//  C18    OLED_RST
//  C19    OLED_DC
//  D1     VSYNC
//  D4     ���FTM0_CH4����
//  D5     ���FTM0_CH5��
//  D6     ���FTM0_CH6����
//  D7     ���FTM0_CH7�ҷ�
//  E0~E5  ��ť�����İ��ϵ�����С��ť��
//  E6~E9  ���뿪ͷ
//  E26    ����ָʾ��

#ifdef MAIN_PROGRAM

#include "math.h"
#include "common.h"
#include "sysinit.h"
#include "gpio.h"
#include "light.h"
#include "uart.h"
#include "wdog.h"
#include "Pit.h"
#include "DMA.h"
#include "ImageGet.h"
#include "ImagePro.h"
#include "CameraSet.h"
#include "vectors.h"
#include "MK60N512VMD100.h"
#include "Ftm.h"
#include "RunControl.h"
#include "VirtualScope.h"

void main(void)
{
    DisableInterrupts;                                    //�ر������ж�
    
    gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
    light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
    uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
    pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
    //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
    
    MotorInit();          //��ʼ�����
    ServoInit();          // ��ʼ�����
    //QuadInit();           //��ʼ��������
    //OLEDInit();           //��ʼ��OLED
    //CameraInit();         //��ʼ������ͷ
    
    while(!CameraInit())         //��ʼ������ͷ
    {
      uart_sendN(UART0, (uint8 *)"\nCamera Initial Failed!", 23);  
    }
    
    //DMAͨ��0�� DMA����ԴΪPORTB�� DMAԴ��ַΪB0~B7, DMAĿ�ĵ�ַΪImgRaw����
    while(!DMAInit(DMACH00, DMASOURCE_PORTB, CameraWidth, GPIOB_DIR_ADDR, (uint32)(ImgRaw[0])))
    {
      uart_sendN(UART0, (uint8 *)"\nDMA Initial Failed!", 20);     
    }
    
    //��������ȼ����õ���ȷ���д���֤============================
    //set_irq_priority(FIELD_IRQ, 2);
    //set_irq_priority(LINE_IRQ, 1);
    //set_irq_priority(DMA0_IRQ, 0);
    
    PORTD_ISFR = PORT_ISFR_ISF_MASK;       //�峡����PORT�ı�־λ
    PORTC_ISFR = PORT_ISFR_ISF_MASK;       //��������PORT�ı�־λ
    PORTB_ISFR = PORT_ISFR_ISF_MASK;       //��PCLK����PORT�ı�־λ
    disable_irq(LINE_IRQ);                 //�����ж�IRQ
    disable_irq(DMA0_IRQ);                 //��DMA��������ж�IRQ
    disable_irq(FIELD_IRQ);                //�س��ж�IRQ
    
    EnableInterrupts;                                     //�������ж�


    while(1)
    {
      ImageGet();        //ͼ���ȡ
      //SpeedGet();        //�ٶȻ�ȡ
             //ͼ����
      
      SportControl(ImagePro());    //�˶�����   
      
    }  // end of while(1)
}      // end of main()
#endif // end of MAIN_PROGRAM



//==========================����ʱ�Ӳ���===========================
/*
����ʱ�Ӳ��Գɹ���2014.10.09
��myDAQ��PORTA10������Ƶ�ʾ��У�PIT���1msһ���жϣ����Ƶ��Ϊ500Hz
*/
#ifdef CLOCK_DEBUG

#include "common.h"
#include "sysinit.h"
#include "gpio.h"
#include "light.h"
#include "uart.h"
#include "wdog.h"
#include "Pit.h"

void main(void)
{
    DisableInterrupts;                                    //�ر������ж�
    
    gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
    light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
    uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
    pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
    enable_pit_interrupt(PIT0);                         //��PIT1�ж�
    
    EnableInterrupts;                                     //�������ж�

    
    
    
    while(1)
    { 
      
      
    }  // end of while(1) 
}      // end of main()
#endif // end of CLOCK_DEBUG










//=======================================�������ڲ���===========================

//�������ڲ��Գɹ���2014.10.10
//ע��TX,RX��Ӧ�Ķ˿ڼ��ɣ�������ϵ�˿ӡ���׿���λ��


#ifdef  BLUETOOTH_DEBUG

#include "common.h"
#include "sysinit.h"
#include "gpio.h"
#include "light.h"
#include "uart.h"
#include "wdog.h"
#include "Pit.h"
#include "DMA.h"

volatile uint8 BUFF[11] = {0};


void main(void)
{/*
    uint8 ch;
    
    uint8 first[] = {"\nDMA������ BUFF[10]={"};
    uint8 last[] = {"10}"};
    uint8 DMA_error[] = {"DMA��ʼ��ʧ��"};
    uint8 helloworld[] = {"Hello World!"};
   */ 
    //float a1 = 60000;
    //float a2 = 60000.3;
    //float a3 = 
    uint32 runcount;
    DisableInterrupts;                                    //�ر������ж�
    
    gpio_init(PORTA,6,1,0);                              //ʱ��������ų�ʼ��
    light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
    uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
    //pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
    //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
    
    EnableInterrupts;


    while(1)
    {
      //if(uart_re1(UART0, &ch))//�˴�Ӧ��uart_re1�����еļ���������ȥ��
      //{
        runcount++;
        if(runcount>=1000000)
        {
            light_change(PORTE, 26);//ָʾ�Ƶ�������״̬�л�
            uart_sendN(UART0,(uint8*)"\nHello World!",13);
            runcount=0;
        }
       //}// end of if���ճɹ�
    }  // end of while(1) 
}      // end of main()
#endif // end of BLUETOOTH_DEBUG























//============================DMA����=============================
#ifdef DMA_DEBUG

#include "common.h"
#include "sysinit.h"
#include "gpio.h"
#include "light.h"
#include "uart.h"
#include "wdog.h"
#include "Pit.h"
#include "DMA.h"

uint8 BUFF[11] = {0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b};


void main(void)
{
    uint8 ch, chh;
    uint32 i;
    uint8 first[] = {"\nDMA������ BUFF[10]={"};
    uint8 last[] = {"10}"};
    uint8 DMA_error[] = {"DMA��ʼ��ʧ��"};
    
    DisableInterrupts;                                    //�ر������ж�
    
    gpio_init(PORTA,6,1,0);                              //ʱ��������ų�ʼ��
    light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
    uart_init(UART0, periph_clk_khz, 9600);             //���ڳ�ʼ��
    //pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
    //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
    
    
    
    //DMA�������� �� ������������ ����
    DMAPORTInit();
    
    if(!DMAInit(DMACH00, DMASOURCE_PORTA, GPIOB_DIR_ADDR, (uint32)BUFF))
    {
      while(1)
      {
      uart_sendN(UART0, DMA_error, sizeof(DMA_error));     
      }
    }
    
    enable_DMA_irq(DMACH00);              //����DMAͨ��0��IRQ�ж�
    
    EnableInterrupts;                                     //�������ж�
    
    DMA_ERQ |= (1 << 0);                            //��DMAӲ������ʹ��


    while(1)
    {
      if(uart_re1(UART0, &ch))            //�˴�Ӧ��uart_re1�����еļ���������ȥ��
      {
      gpio_reverse(PORTA, 8);
      for(i=0;i<150000;i++)
      {
        asm("nop");  
      }
      gpio_reverse(PORTA, 8);
      
      uart_sendN(UART0, (uint8 *)"Hello World!", 12);
      for(i = 0; i <= 10; i++)
      {
        chh = BUFF[i];
        uart_send1(UART0, chh);
      }
  
      

      
      
      
      }// end of if���ճɹ�
    }  // end of while(1) 
}      // end of main()
#endif // end of DMA_DEBUG





//=======================���������ȡ����==============================
#ifdef PINREAD_DEBUG

#include "math.h"
#include "common.h"
#include "sysinit.h"
#include "gpio.h"
#include "light.h"
#include "uart.h"
#include "wdog.h"
#include "Pit.h"
#include "DMA.h"
#include "ImageGet.h"
#include "ImagePro.h"
#include "CameraSet.h"
#include "vectors.h"
#include "MK60N512VMD100.h"



void main(void)
{	
	//��������GPIO�ڵ�ת��ʱ��
	SIM_SCGC5 = SIM_SCGC5_PORTA_MASK | SIM_SCGC5_PORTB_MASK | SIM_SCGC5_PORTC_MASK | SIM_SCGC5_PORTD_MASK | SIM_SCGC5_PORTE_MASK;
	
        //��������PA15�ĳ�ʼ����GPIO���룬©����·����������
        PORT_PCR_REG(PORTA_BASE_PTR, 15) |= ( 0
                                  |  PORT_PCR_MUX(0x01) 
                                  | PORT_PCR_PE_MASK 
                                  | PORT_PCR_ODE_MASK
                                  );
        GPIO_PDDR_REG(PTA_BASE_PTR) |= (1 << 15);
        GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 15);
        GPIO_PDDR_REG(PTA_BASE_PTR) &= ~(1 << 15);

        //��������PA17��PC0�ĳ�ʼ����GPIO���
	PORTA_PCR17 |= (0 | PORT_PCR_MUX(1));         
        PORTC_PCR0 |= (0 | PORT_PCR_MUX(1));
        
        GPIO_PDDR_REG(PTC_BASE_PTR) |= (1 << 0);
        GPIO_PDOR_REG(PTC_BASE_PTR) &= ~(1 << 0);
	
	GPIO_PDDR_REG(PTA_BASE_PTR) |= (1 << 17);
	GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 17);   
        
	for(;;)  
	{	//��⵽�ߵ�ƽ��PA17����PC0��   	
		if( GPIO_PDIR_REG(PTA_BASE_PTR) & (1 << 15) )
		{
		    GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 17);
                    GPIO_PDOR_REG(PTC_BASE_PTR) |= (1 << 0);	
		}
                //��⵽�͵�ƽ��PA17��PC0��   
		else
                {		
                    GPIO_PDOR_REG(PTC_BASE_PTR) &= ~(1 << 0);
                    GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 17);		
		}	 
	}
	
}

#endif // end of PINREAD_DEBUG








//=========================DAQ�ı��ز�׽����============================
#ifdef DAQ_DEBUG

#include "MK60N512VMD100.h"
#include "gpio.h"

void Delay(volatile uint16 time)
{
    while(time)
    {
        time--;  
    }
}


void main(void)
{
  
  SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK | SIM_SCGC5_PORTB_MASK | SIM_SCGC5_PORTC_MASK | SIM_SCGC5_PORTD_MASK | SIM_SCGC5_PORTE_MASK);
  
  gpio_init(PORTA, 14, 1, 1);
  gpio_init(PORTA, 15, 1, 1);
  //PORTA_PCR15 |= (0 | PORT_PCR_MUX(1));
  
  
  //PORTA_PCR14 |= PORT_PCR_DSE_MASK;
 //PORTA_PCR15 |= PORT_PCR_DSE_MASK;
  
  

  GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 14); 
  Delay(1000);
  
  GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 15); 
  Delay(1000);
  
  GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 14);   
  Delay(1000);
  
  GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 15);
  Delay(1000);
  
    GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 14); 
  Delay(1000);
  
  GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 15); 
  Delay(1000);
  
  GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 14);   
  Delay(1000);
  
  GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 15);
  Delay(1000);

  
    GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 14); 
  Delay(1000);
  
  GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 15); 
  Delay(1000);
  
  GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 14);   
  Delay(1000);
  
  GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 15);
  Delay(1000);


  
  while(1) ; 

}

#endif // end of DAQ_DEBUG



//==========================OV7620����ͷ����==================================
//���ŷ��䣺
//PORT     FUNCTION
//  A0     TCLK
//  A1     TDI
//  A2     TDO
//  A3     TMS
//  A8     ������FTM1_QD_PHA
//  A9     ������FTM1_QD_PHB
//  A10    ������FTM2_QD_PHA
//  A11    ������FTM2_QD_PHB
//  A12    ���FTM1_CH0
//  A25    SCCB_SDA
//  A26    SCCB_SCL
//  B0~B7  ����ͷ����
//  B9     PCLK
//  B16    UART0_RX
//  B17    UART0_TX
//  C8     HREF
//  C16    OLED_D0
//  C17    OLED_D1
//  C18    OLED_RST
//  C19    OLED_DC
//  D1     VSYNC
//  D4     ���FTM0_CH4����
//  D5     ���FTM0_CH5��
//  D6     ���FTM0_CH6����
//  D7     ���FTM0_CH7�ҷ�
//  E0~E5  ��ť�����İ��ϵ�����С��ť��
//  E6~E9  ���뿪ͷ
//  E26    ����ָʾ��

#ifdef CAMERA_DEBUG_7620

#include "math.h"
#include "common.h"
#include "sysinit.h"
#include "gpio.h"
#include "light.h"
#include "uart.h"
#include "wdog.h"
#include "Pit.h"
#include "DMA.h"
#include "ImageGet.h"
#include "ImagePro.h"
#include "CameraSet.h"
#include "vectors.h"
#include "MK60N512VMD100.h"

void main(void)
{
    DisableInterrupts;                                    //�ر������ж�
    
    gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
    light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
    uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
    pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
    //enable_pit_interrupt(PIT0);                         //��PIT1�ж�

    while(!CameraInit())         //��ʼ������ͷ
    {
      uart_sendN(UART0, (uint8 *)"\nCamera Initial Failed!", 23);  
    }
    
    //DMAͨ��0�� DMA����ԴΪPORTB�� DMAԴ��ַΪB0~B7, DMAĿ�ĵ�ַΪImgStore1����
    while(!DMAInit(DMACH00, DMASOURCE_PORTB, CameraWidth, GPIOB_DIR_ADDR, (uint32)(ImgRaw[0])))
    {
      uart_sendN(UART0, (uint8 *)"\nDMA Initial Failed!", 20);     
    }
    
    //��������ȼ����õ���ȷ���д���֤============================
    //set_irq_priority(FIELD_IRQ, 2);
    //set_irq_priority(LINE_IRQ, 1);
    //set_irq_priority(DMA0_IRQ, 0);
    
    PORTD_ISFR = PORT_ISFR_ISF_MASK;       //�峡����PORT�ı�־λ
    PORTC_ISFR = PORT_ISFR_ISF_MASK;       //��������PORT�ı�־λ
    PORTB_ISFR = PORT_ISFR_ISF_MASK;       //��PCLK����PORT�ı�־λ
    disable_irq(LINE_IRQ);                 //�����ж�IRQ
    disable_irq(DMA0_IRQ);                 //��DMA��������ж�IRQ
    disable_irq(FIELD_IRQ);                //�س��ж�IRQ
    
    EnableInterrupts;                                     //�������ж�
    while(1)
    {
      ImageGet();        //ͼ���ȡ
      ImageProSend();        //ͼ����
      //SendImg();  
      
    }  // end of while(1)
}      // end of main()



#endif // end of CAMERA_DEBUG_7620



//==========================C�����﷨����==================================
#ifdef C_DEBUG

#include "common.h"
#include "sysinit.h"
#include "vectors.h"
#include "MK60N512VMD100.h"
#include "math.h"

void main(void)
{
    uint8 i, j, k;
    uint8 x, y;
    uint8 temp1, temp2, temp3, temp4, temp5, temp6, temp7;
    int8 x1;
    int8 x2;
    int16 x3;
   
    
    i = 200;
    j = 100;
    k = 250;
    if((i + j) > k)
    {
      temp1 = 1;  
    }
    else
    {
      temp1 = 0;  
    }
    
    if((j - i) < 0)
    {
      temp2 = 1; 
    }
    else
    {
      temp2 = 0;  
    }
    
    x = i + j;
    if(x > k)
    {
      temp3 = 1;
    }
    else
    {
      temp3 = 0;
    }
    
    y = j - i;
    if(y < 0)
    {
      temp4 = 1;
    }
    else
    {
      temp4 = 0;  
    }
    
    
    
    x1 = (int8)(j - i);
    if(x1 < 0)
    {
      temp5 = 1;
    }
    else
    {
      temp5 = 0;  
    } 
    
    x2 = -1;
    if(x2 < 0)
      temp6 = 1;
    else
      temp6 = 0;
    
    x3 = -1;
    if(x3 < 0)
      temp7 = 1;
    else
      temp7 = 0;    
   
    
    while(1)
    {
    }
}

#endif // end of C_DEBUG
//==========================================================================






//==========================�������==================================
//���ŷ��䣺
//PORT     FUNCTION
//  A0     TCLK
//  A1     TDI
//  A2     TDO
//  A3     TMS
//  A8     ������FTM1_QD_PHA
//  A9     ������FTM1_QD_PHB
//  A10    ������FTM2_QD_PHA
//  A11    ������FTM2_QD_PHB
//  A12    ���FTM1_CH0
//  A25    SCCB_SDA
//  A26    SCCB_SCL
//  B0~B7  ����ͷ����
//  B9     PCLK
//  B16    UART0_RX
//  B17    UART0_TX
//  C8     HREF
//  C16    OLED_D0
//  C17    OLED_D1
//  C18    OLED_RST
//  C19    OLED_DC
//  D1     VSYNC
//  D4     ���FTM0_CH4����
//  D5     ���FTM0_CH5��
//  D6     ���FTM0_CH6����
//  D7     ���FTM0_CH7�ҷ�
//  E0~E5  ��ť�����İ��ϵ�����С��ť��
//  E6~E9  ���뿪ͷ
//  E26    ����ָʾ��

#ifdef MOTOR_DEBUG

#include "math.h"
#include "common.h"
#include "sysinit.h"
#include "gpio.h"
#include "light.h"
#include "uart.h"
#include "wdog.h"
#include "Pit.h"
#include "DMA.h"
#include "ImageGet.h"
#include "ImagePro.h"
#include "CameraSet.h"
#include "vectors.h"
#include "MK60N512VMD100.h"
#include "Ftm.h"

void main(void)
{
    DisableInterrupts;                                    //�ر������ж�
    
    gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
    light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
    uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
    pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
    //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
    
    EnableInterrupts;
    
    MotorInit();
    while(1)
    {
      uart_sendN(UART0, (uint8 *)"\nHello Motor!", 13);
    }  // end of while(1)   
}      // end of main()
#endif // end of MOTOR_DEBUG




//==========================�������==================================
//���ŷ��䣺
//PORT     FUNCTION
//  A0     TCLK
//  A1     TDI
//  A2     TDO
//  A3     TMS
//  A8     ������FTM1_QD_PHA
//  A9     ������FTM1_QD_PHB
//  A10    ������FTM2_QD_PHA
//  A11    ������FTM2_QD_PHB
//  A12    ���FTM1_CH0
//  A25    SCCB_SDA
//  A26    SCCB_SCL
//  B0~B7  ����ͷ����
//  B9     PCLK
//  B16    UART0_RX
//  B17    UART0_TX
//  C8     HREF
//  C16    OLED_D0
//  C17    OLED_D1
//  C18    OLED_RST
//  C19    OLED_DC
//  D1     VSYNC
//  D4     ���FTM0_CH4����
//  D5     ���FTM0_CH5��
//  D6     ���FTM0_CH6����
//  D7     ���FTM0_CH7�ҷ�
//  E0~E5  ��ť�����İ��ϵ�����С��ť��
//  E6~E9  ���뿪ͷ
//  E26    ����ָʾ��

#ifdef SERVO_DEBUG

#include "math.h"
#include "common.h"
#include "sysinit.h"
#include "gpio.h"
#include "light.h"
#include "uart.h"
#include "wdog.h"
#include "Pit.h"
#include "DMA.h"
#include "ImageGet.h"
#include "ImagePro.h"
#include "CameraSet.h"
#include "vectors.h"
#include "MK60N512VMD100.h"
#include "Ftm.h"


void main(void)
{
    int i, j;
    DisableInterrupts;                                    //�ر������ж�
    
    gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
    light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
    uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
    pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
    //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
    
    EnableInterrupts;
    
    ServoInit();
    while(1)
    {
      /*
      FTM1_C0V = 1828;
      for(i = 0; i < 10000; i++)
        for(j = 0; j < 10000; j++)
        {}
      FTM1_C0V = 1810;
      for(i = 0; i < 10000; i++)
        for(j = 0; j < 10000; j++)
        {}
      FTM1_C0V = 2039;
      for(i = 0; i < 10000; i++)
        for(j = 0; j < 10000; j++)
        {}
      */
      uart_sendN(UART0, (uint8 *)"\nHello Servo!", 13);
    }  // end of while(1)   
}      // end of main()
#endif // end of SERVO_DEBUG
  
 
  
//==========================����ʾ��������===========================
#ifdef VIRTURL_DEBUG

#include "common.h"
#include "sysinit.h"
#include "gpio.h"
#include "light.h"
#include "uart.h"
#include "wdog.h"
#include "Pit.h"  
#include "VirtualScope.h"


void main(void)
{
    DisableInterrupts;                                    //�ر������ж�
    
    gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
    light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
    uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
    pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
    //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
    
    EnableInterrupts;
    
    VirtualOutData[0] = 0;
    VirtualOutData[1] = 0;
    VirtualOutData[2] = 10000;
    VirtualOutData[3] = -10000;
    while(1)
    {
      VirtualOutPut_Data();     
    }  // end of while(1) 
}      // end of main
#endif // end of VIRTURL_DEBUG













