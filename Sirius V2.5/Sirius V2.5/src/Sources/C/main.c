/******************************************************************************/
/*******************************************************************************
【文件名】：浙江大学智能车Sirius主程序Main
【功  能】：Run+Faster+Fly
【日  期】：2014.10.09
【作  者】：HJZ/LYX/YCR
【备  注】：
*******************************************************************************/
/******************************************************************************/
/*********************************
【dev.env.】IAR EWARM 6.30.1.3142
【Target  】MK60-DN512-VLQ10
【Crystal 】50.000  MHz
【busclock】75.000  MHz
【pllclock】150.000 MHz
*********************************/

// 硬件外设有：电机，舵机，编码器，OLED, 摄像头

/************************************************************/
//#define MAIN_PROGRAM    //主程序测试
//#define PINREAD_DEBUG   //引脚输入测试
//#define CLOCK_DEBUG     //时钟引脚测试
//#define CAMERA_DEBUG_7725  //OV7725摄像头测试
#define CAMERA_DEBUG_7620    //OV7620摄像头测试
//#define C_DEBUG            //C语言语法测试
//#define DAQ_DEBUG          //DAQ测试
//#define DMA_DEBUG          //DMA测试
//#define BLUETOOTH_DEBUG    //蓝牙测试
//#define MOTOR_DEBUG           //电机测试      
//#define SERVO_DEBUG           //舵机测试
//#define QUAD_DEBUG            //编码器测试
//#define VIRTURL_DEBUG         //虚拟示波器测试


/************************************************************/
//#define ERROR_PIC

//=================================主函数================================
//引脚分配：
//PORT     FUNCTION
//  A0     TCLK
//  A1     TDI
//  A2     TDO
//  A3     TMS
//  A8     编码器FTM1_QD_PHA
//  A9     编码器FTM1_QD_PHB
//  A10    编码器FTM2_QD_PHA
//  A11    编码器FTM2_QD_PHB
//  A12    舵机FTM1_CH0
//  A25    SCCB_SDA
//  A26    SCCB_SCL
//  B0~B7  摄像头数据
//  B9     PCLK
//  B16    UART0_RX
//  B17    UART0_TX
//  C8     HREF
//  C16    OLED_D0
//  C17    OLED_D1
//  C18    OLED_RST
//  C19    OLED_DC
//  D1     VSYNC
//  D4     电机FTM0_CH4左正
//  D5     电机FTM0_CH5左反
//  D6     电机FTM0_CH6右正
//  D7     电机FTM0_CH7右反
//  E0~E5  按钮（核心板上的那种小按钮）
//  E6~E9  拨码开头
//  E26    工作指示灯

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
    DisableInterrupts;                                    //关闭所有中断
    
    gpio_init(PORTA,10,1,0);                              //时间测试引脚初始化
    light_init(PORTE, 26, Light_ON);                      //单片机工作指示灯
    uart_init(UART0, periph_clk_khz, 115200);             //串口初始化
    pit_init(PIT0,75000);                                   //初始化PIT1周期为1ms*20*4   测试监控控制周期
    //enable_pit_interrupt(PIT0);                         //开PIT1中断
    
    MotorInit();          //初始化电机
    ServoInit();          // 初始化舵机
    //QuadInit();           //初始化编码器
    //OLEDInit();           //初始化OLED
    //CameraInit();         //初始化摄像头
    
    while(!CameraInit())         //初始化摄像头
    {
      uart_sendN(UART0, (uint8 *)"\nCamera Initial Failed!", 23);  
    }
    
    //DMA通道0， DMA触发源为PORTB， DMA源地址为B0~B7, DMA目的地址为ImgRaw数组
    while(!DMAInit(DMACH00, DMASOURCE_PORTB, CameraWidth, GPIOB_DIR_ADDR, (uint32)(ImgRaw[0])))
    {
      uart_sendN(UART0, (uint8 *)"\nDMA Initial Failed!", 20);     
    }
    
    //这儿的优先级设置的正确性有待验证============================
    //set_irq_priority(FIELD_IRQ, 2);
    //set_irq_priority(LINE_IRQ, 1);
    //set_irq_priority(DMA0_IRQ, 0);
    
    PORTD_ISFR = PORT_ISFR_ISF_MASK;       //清场所在PORT的标志位
    PORTC_ISFR = PORT_ISFR_ISF_MASK;       //清行所在PORT的标志位
    PORTB_ISFR = PORT_ISFR_ISF_MASK;       //清PCLK所在PORT的标志位
    disable_irq(LINE_IRQ);                 //关行中断IRQ
    disable_irq(DMA0_IRQ);                 //关DMA传输完成中断IRQ
    disable_irq(FIELD_IRQ);                //关场中断IRQ
    
    EnableInterrupts;                                     //打开所有中断


    while(1)
    {
      ImageGet();        //图像获取
      //SpeedGet();        //速度获取
             //图像处理
      
      SportControl(ImagePro());    //运动控制   
      
    }  // end of while(1)
}      // end of main()
#endif // end of MAIN_PROGRAM



//==========================外设时钟测试===========================
/*
外设时钟测试成功，2014.10.09
用myDAQ测PORTA10的引脚频率就行，PIT设成1ms一次中断，测得频率为500Hz
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
    DisableInterrupts;                                    //关闭所有中断
    
    gpio_init(PORTA,10,1,0);                              //时间测试引脚初始化
    light_init(PORTE, 26, Light_ON);                      //单片机工作指示灯
    uart_init(UART0, periph_clk_khz, 115200);             //串口初始化
    pit_init(PIT0,75000);                                   //初始化PIT1周期为1ms*20*4   测试监控控制周期
    enable_pit_interrupt(PIT0);                         //开PIT1中断
    
    EnableInterrupts;                                     //打开所有中断

    
    
    
    while(1)
    { 
      
      
    }  // end of while(1) 
}      // end of main()
#endif // end of CLOCK_DEBUG










//=======================================蓝牙串口测试===========================

//蓝牙串口测试成功。2014.10.10
//注意TX,RX对应的端口即可，龙丘板上的丝印容易看错位。


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
    
    uint8 first[] = {"\nDMA触发后 BUFF[10]={"};
    uint8 last[] = {"10}"};
    uint8 DMA_error[] = {"DMA初始化失败"};
    uint8 helloworld[] = {"Hello World!"};
   */ 
    //float a1 = 60000;
    //float a2 = 60000.3;
    //float a3 = 
    uint32 runcount;
    DisableInterrupts;                                    //关闭所有中断
    
    gpio_init(PORTA,6,1,0);                              //时间测试引脚初始化
    light_init(PORTE, 26, Light_ON);                      //单片机工作指示灯
    uart_init(UART0, periph_clk_khz, 115200);             //串口初始化
    //pit_init(PIT0,75000);                                   //初始化PIT1周期为1ms*20*4   测试监控控制周期
    //enable_pit_interrupt(PIT0);                         //开PIT1中断
    
    EnableInterrupts;


    while(1)
    {
      //if(uart_re1(UART0, &ch))//此处应把uart_re1函数中的计数错误检测去掉
      //{
        runcount++;
        if(runcount>=1000000)
        {
            light_change(PORTE, 26);//指示灯的亮、暗状态切换
            uart_sendN(UART0,(uint8*)"\nHello World!",13);
            runcount=0;
        }
       //}// end of if接收成功
    }  // end of while(1) 
}      // end of main()
#endif // end of BLUETOOTH_DEBUG























//============================DMA测试=============================
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
    uint8 first[] = {"\nDMA触发后 BUFF[10]={"};
    uint8 last[] = {"10}"};
    uint8 DMA_error[] = {"DMA初始化失败"};
    
    DisableInterrupts;                                    //关闭所有中断
    
    gpio_init(PORTA,6,1,0);                              //时间测试引脚初始化
    light_init(PORTE, 26, Light_ON);                      //单片机工作指示灯
    uart_init(UART0, periph_clk_khz, 9600);             //串口初始化
    //pit_init(PIT0,75000);                                   //初始化PIT1周期为1ms*20*4   测试监控控制周期
    //enable_pit_interrupt(PIT0);                         //开PIT1中断
    
    
    
    //DMA触发引脚 和 数据输入引脚 设置
    DMAPORTInit();
    
    if(!DMAInit(DMACH00, DMASOURCE_PORTA, GPIOB_DIR_ADDR, (uint32)BUFF))
    {
      while(1)
      {
      uart_sendN(UART0, DMA_error, sizeof(DMA_error));     
      }
    }
    
    enable_DMA_irq(DMACH00);              //开启DMA通道0的IRQ中断
    
    EnableInterrupts;                                     //打开所有中断
    
    DMA_ERQ |= (1 << 0);                            //打开DMA硬件触发使能


    while(1)
    {
      if(uart_re1(UART0, &ch))            //此处应把uart_re1函数中的计数错误检测去掉
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
  
      

      
      
      
      }// end of if接收成功
    }  // end of while(1) 
}      // end of main()
#endif // end of DMA_DEBUG





//=======================引脚输入读取测试==============================
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
	//开启各个GPIO口的转换时钟
	SIM_SCGC5 = SIM_SCGC5_PORTA_MASK | SIM_SCGC5_PORTB_MASK | SIM_SCGC5_PORTC_MASK | SIM_SCGC5_PORTD_MASK | SIM_SCGC5_PORTE_MASK;
	
        //输入引脚PA15的初始化，GPIO输入，漏极开路，上拉电阻
        PORT_PCR_REG(PORTA_BASE_PTR, 15) |= ( 0
                                  |  PORT_PCR_MUX(0x01) 
                                  | PORT_PCR_PE_MASK 
                                  | PORT_PCR_ODE_MASK
                                  );
        GPIO_PDDR_REG(PTA_BASE_PTR) |= (1 << 15);
        GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 15);
        GPIO_PDDR_REG(PTA_BASE_PTR) &= ~(1 << 15);

        //输入引脚PA17和PC0的初始化，GPIO输出
	PORTA_PCR17 |= (0 | PORT_PCR_MUX(1));         
        PORTC_PCR0 |= (0 | PORT_PCR_MUX(1));
        
        GPIO_PDDR_REG(PTC_BASE_PTR) |= (1 << 0);
        GPIO_PDOR_REG(PTC_BASE_PTR) &= ~(1 << 0);
	
	GPIO_PDDR_REG(PTA_BASE_PTR) |= (1 << 17);
	GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 17);   
        
	for(;;)  
	{	//检测到高电平，PA17亮，PC0灭   	
		if( GPIO_PDIR_REG(PTA_BASE_PTR) & (1 << 15) )
		{
		    GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 17);
                    GPIO_PDOR_REG(PTC_BASE_PTR) |= (1 << 0);	
		}
                //检测到低电平，PA17灭，PC0亮   
		else
                {		
                    GPIO_PDOR_REG(PTC_BASE_PTR) &= ~(1 << 0);
                    GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 17);		
		}	 
	}
	
}

#endif // end of PINREAD_DEBUG








//=========================DAQ的边沿捕捉测试============================
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



//==========================OV7620摄像头测试==================================
//引脚分配：
//PORT     FUNCTION
//  A0     TCLK
//  A1     TDI
//  A2     TDO
//  A3     TMS
//  A8     编码器FTM1_QD_PHA
//  A9     编码器FTM1_QD_PHB
//  A10    编码器FTM2_QD_PHA
//  A11    编码器FTM2_QD_PHB
//  A12    舵机FTM1_CH0
//  A25    SCCB_SDA
//  A26    SCCB_SCL
//  B0~B7  摄像头数据
//  B9     PCLK
//  B16    UART0_RX
//  B17    UART0_TX
//  C8     HREF
//  C16    OLED_D0
//  C17    OLED_D1
//  C18    OLED_RST
//  C19    OLED_DC
//  D1     VSYNC
//  D4     电机FTM0_CH4左正
//  D5     电机FTM0_CH5左反
//  D6     电机FTM0_CH6右正
//  D7     电机FTM0_CH7右反
//  E0~E5  按钮（核心板上的那种小按钮）
//  E6~E9  拨码开头
//  E26    工作指示灯

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
    DisableInterrupts;                                    //关闭所有中断
    
    gpio_init(PORTA,10,1,0);                              //时间测试引脚初始化
    light_init(PORTE, 26, Light_ON);                      //单片机工作指示灯
    uart_init(UART0, periph_clk_khz, 115200);             //串口初始化
    pit_init(PIT0,75000);                                   //初始化PIT1周期为1ms*20*4   测试监控控制周期
    //enable_pit_interrupt(PIT0);                         //开PIT1中断

    while(!CameraInit())         //初始化摄像头
    {
      uart_sendN(UART0, (uint8 *)"\nCamera Initial Failed!", 23);  
    }
    
    //DMA通道0， DMA触发源为PORTB， DMA源地址为B0~B7, DMA目的地址为ImgStore1数组
    while(!DMAInit(DMACH00, DMASOURCE_PORTB, CameraWidth, GPIOB_DIR_ADDR, (uint32)(ImgRaw[0])))
    {
      uart_sendN(UART0, (uint8 *)"\nDMA Initial Failed!", 20);     
    }
    
    //这儿的优先级设置的正确性有待验证============================
    //set_irq_priority(FIELD_IRQ, 2);
    //set_irq_priority(LINE_IRQ, 1);
    //set_irq_priority(DMA0_IRQ, 0);
    
    PORTD_ISFR = PORT_ISFR_ISF_MASK;       //清场所在PORT的标志位
    PORTC_ISFR = PORT_ISFR_ISF_MASK;       //清行所在PORT的标志位
    PORTB_ISFR = PORT_ISFR_ISF_MASK;       //清PCLK所在PORT的标志位
    disable_irq(LINE_IRQ);                 //关行中断IRQ
    disable_irq(DMA0_IRQ);                 //关DMA传输完成中断IRQ
    disable_irq(FIELD_IRQ);                //关场中断IRQ
    
    EnableInterrupts;                                     //打开所有中断
    while(1)
    {
      ImageGet();        //图像获取
      ImageProSend();        //图像处理
      //SendImg();  
      
    }  // end of while(1)
}      // end of main()



#endif // end of CAMERA_DEBUG_7620



//==========================C语言语法测试==================================
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






//==========================电机测试==================================
//引脚分配：
//PORT     FUNCTION
//  A0     TCLK
//  A1     TDI
//  A2     TDO
//  A3     TMS
//  A8     编码器FTM1_QD_PHA
//  A9     编码器FTM1_QD_PHB
//  A10    编码器FTM2_QD_PHA
//  A11    编码器FTM2_QD_PHB
//  A12    舵机FTM1_CH0
//  A25    SCCB_SDA
//  A26    SCCB_SCL
//  B0~B7  摄像头数据
//  B9     PCLK
//  B16    UART0_RX
//  B17    UART0_TX
//  C8     HREF
//  C16    OLED_D0
//  C17    OLED_D1
//  C18    OLED_RST
//  C19    OLED_DC
//  D1     VSYNC
//  D4     电机FTM0_CH4左正
//  D5     电机FTM0_CH5左反
//  D6     电机FTM0_CH6右正
//  D7     电机FTM0_CH7右反
//  E0~E5  按钮（核心板上的那种小按钮）
//  E6~E9  拨码开头
//  E26    工作指示灯

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
    DisableInterrupts;                                    //关闭所有中断
    
    gpio_init(PORTA,10,1,0);                              //时间测试引脚初始化
    light_init(PORTE, 26, Light_ON);                      //单片机工作指示灯
    uart_init(UART0, periph_clk_khz, 115200);             //串口初始化
    pit_init(PIT0,75000);                                   //初始化PIT1周期为1ms*20*4   测试监控控制周期
    //enable_pit_interrupt(PIT0);                         //开PIT1中断
    
    EnableInterrupts;
    
    MotorInit();
    while(1)
    {
      uart_sendN(UART0, (uint8 *)"\nHello Motor!", 13);
    }  // end of while(1)   
}      // end of main()
#endif // end of MOTOR_DEBUG




//==========================舵机测试==================================
//引脚分配：
//PORT     FUNCTION
//  A0     TCLK
//  A1     TDI
//  A2     TDO
//  A3     TMS
//  A8     编码器FTM1_QD_PHA
//  A9     编码器FTM1_QD_PHB
//  A10    编码器FTM2_QD_PHA
//  A11    编码器FTM2_QD_PHB
//  A12    舵机FTM1_CH0
//  A25    SCCB_SDA
//  A26    SCCB_SCL
//  B0~B7  摄像头数据
//  B9     PCLK
//  B16    UART0_RX
//  B17    UART0_TX
//  C8     HREF
//  C16    OLED_D0
//  C17    OLED_D1
//  C18    OLED_RST
//  C19    OLED_DC
//  D1     VSYNC
//  D4     电机FTM0_CH4左正
//  D5     电机FTM0_CH5左反
//  D6     电机FTM0_CH6右正
//  D7     电机FTM0_CH7右反
//  E0~E5  按钮（核心板上的那种小按钮）
//  E6~E9  拨码开头
//  E26    工作指示灯

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
    DisableInterrupts;                                    //关闭所有中断
    
    gpio_init(PORTA,10,1,0);                              //时间测试引脚初始化
    light_init(PORTE, 26, Light_ON);                      //单片机工作指示灯
    uart_init(UART0, periph_clk_khz, 115200);             //串口初始化
    pit_init(PIT0,75000);                                   //初始化PIT1周期为1ms*20*4   测试监控控制周期
    //enable_pit_interrupt(PIT0);                         //开PIT1中断
    
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
  
 
  
//==========================虚拟示波器测试===========================
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
    DisableInterrupts;                                    //关闭所有中断
    
    gpio_init(PORTA,10,1,0);                              //时间测试引脚初始化
    light_init(PORTE, 26, Light_ON);                      //单片机工作指示灯
    uart_init(UART0, periph_clk_khz, 115200);             //串口初始化
    pit_init(PIT0,75000);                                   //初始化PIT1周期为1ms*20*4   测试监控控制周期
    //enable_pit_interrupt(PIT0);                         //开PIT1中断
    
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













