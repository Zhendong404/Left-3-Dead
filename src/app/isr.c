/******************** (C) COPYRIGHT 2011 蓝宙电子工作室 ********************
 * 文件名       ：isr.c
 * 描述         ：中断处理例程
 *
 * 实验平台     ：
 * 库版本       ：
 * 嵌入系统     ：
 *
 * 作者         ：蓝宙电子工作室
 * 淘宝店       ：http://landzo.taobao.com/
**********************************************************************************/



/******************** (C) COPYRIGHT 2011 蓝宙电子工作室 ********************
 * 文件名       ：isr.c
 * 描述         ：中断处理例程
 *
 * 实验平台     ：
 * 库版本       ：
 * 嵌入系统     ：
 *
 * 作者         ：蓝宙电子工作室
 * 淘宝店       ：http://landzo.taobao.com/
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
*                             蓝宙电子工作室
*
*  函数名称：USART1_IRQHandler
*  功能说明：串口1 中断 接收 服务函数
*  参数说明：无
*  函数返回：无
*  修改时间：2012-2-14    已测试
*  备    注：
*************************************************************************/


void USART1_IRQHandler(void)
{
    uint8 ch;

    DisableInterrupts;		    //关总中断

    //接收一个字节数据并回发
    ch = uart_getchar (UART1);      //接收到一个数据
    uart_sendStr  (UART1, "\n你发送的数据为：");
    uart_putchar (UART1, ch);       //就发送出去

    EnableInterrupts;		    //开总中断
}
/*************************************************************************
*                             蓝宙嵌入式开发工作室
*
*  函数名称：PIT1_IRQHandler
*  功能说明：PIT1定时中断服务函数
*  参数说明：无
*  函数返回：无
*  修改时间：2012-9-18    已测试
*  备    注：
*************************************************************************/

void PIT1_IRQHandler(void)
{
   PIT_Flag_Clear(PIT1);       //清中断标志位
   TIME1flag_1s = 1 ;
   
}

/*************************************************************************
*                             蓝宙电子工作室
*
*  函数名称：PIT0_IRQHandler
*  功能说明：PIT0 定时中断服务函数
*  参数说明：无
*  函数返回：无
*  修改时间：2012-2-18    已测试
*  备    注：
*************************************************************************/



void PIT0_IRQHandler(void)
{
   PIT_Flag_Clear(PIT0);       //清中断标志位
   
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
*                             蓝宙电子工作室
*
*  函数名称：SysTick_Handler
*  功能说明：系统滴答定时器中断服务函数
*  参数说明：无
*  函数返回：无
*  修改时间：2012-2-18    已测试
*  备    注：ucos里用得到
*************************************************************************/
void SysTick_Handler(void)
{
    //    OSIntEnter();
    //    OSTimeTick();
    //    OSIntExit();
}

/*************************************************************************
*                             蓝宙电子工作室
*
*  函数名称：PendSV_Handler
*  功能说明：PendSV（可悬起系统调用）中断服务函数
*  参数说明：无
*  函数返回：无
*  修改时间：2012-2-15    已测试
*  备    注：uC/OS用来切换任务
*************************************************************************/
void PendSV_Handler(void)
{
}
/*************************************************************************
*                             蓝宙电子工作室
*
*  函数名称：HardFault_Handler
*  功能说明：硬件上访中断服务函数
*  参数说明：无
*  函数返回：无
*  修改时间：2012-2-4    已测试
*  备    注：可以用LED闪烁来指示发生了硬件上访
*************************************************************************/
void HardFault_Handler(void)
{
        printf("\n****硬件上访错误!!!*****\r\n\n");
        SendImage(ImgNew);
        while(1);
}

/*****************************************************************
* 函数说明：延时消除消隐区
*************************************************************/
void dlay(void)
{
    volatile uint16_t dlaycount;
    for(dlaycount = 0; dlaycount < 125; dlaycount++)
      ;
}

/*************************************************************************
*                             蓝宙电子工作室
*
*  函数名称：PORTA_IRQHandler
*  功能说明：PORTA端口中断服务函数
*  参数说明：无
*  函数返回：无
*  修改时间：2012-1-25    已测试
*  备    注：引脚号需要自己初始化来清除
*************************************************************************/

  
/**************************
摄像头采用变量
***************************/
u8  DMA_Over_Flg = 0 ;     //场采集完成标志位
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
    if(PORTD_ISFR & 0x0002)         //PTD1触发中断,采集的场中断。
    {
        PORTD_ISFR  |= 0x0002;        //写1清中断标志位
       
    //  uart_putchar(UART0,LinCout>>8);      //采样行数
     //   uart_putchar(UART0,LinCout);       //采样行数
      //uart_sendStr(UART0, (const u8*)"portDirq\n");
        LinCout = 0 ;
        LinADCout=0;
        gpio_Interrupt_init(PORTC,8, GPI_DOWN, RING) ;          //开启行中断         
    }
   
}
u16 delaytime = 335;
void PORTC_IRQHandler()
{
      //BFdelay_1us(100);
        if(PORTC_ISFR & 0x0100)            //PTC8触发中断，采集的行中断
    { 
        PORTC_ISFR  |= 0x0100;         //写1清中断标志位
        LinCout ++ ; 
        DMA_IRQ_CLEAN(DMA_CH4);                             //清除通道传输中断标志位    (这样才能再次进入中断)
        if((LinCout%(480/DATALINE)==0)&&(LinADCout<DATALINE))
        {
          for(int i = 0; i < delaytime; i++);
          DMA_DADDR(CH4) = (u32)(&ADdata[ LinADCout][0]);
          DMA_EN(DMA_CH4);                                    //使能通道CHn 硬件请求      (这样才能继续触发DMA传输) 
          DMA_IRQ_EN(DMA_CH4) ;                             //允许DMA通道传输
        //  PTA16_OUT = ~PTA16_OUT ;
          LinADCout ++ ;
        }
      
         if(LinADCout==DATALINE)
         {
            DMA_Over_Flg = 1 ;
            //gpio_Interrupt_init(PORTC,8, GPI_DOWN, GPI_DISAB) ;          //行中断
         }
    }
}

/*************************************************************************
*                             蓝宙电子工作室
*
*  函数名称：PORTB_IRQHandler
*  功能说明：PORTB端口中断服务函数
*  参数说明：无
*  函数返回：无
*  修改时间：2012-1-25    已测试
*  备    注：引脚号需要根据自己初始化来修改
*************************************************************************/
void PORTB_IRQHandler()
{
    
  //  PORT_PCR_REG(PORTB , 10) |= PORT_PCR_ISF(1);
    u8  n = 0;    //引脚号
    n = 0;
    if(PORTB_ISFR & (1 << n))         //PTB0触发中断
    {
        PORTB_ISFR  |= (1 << n);        //写1清中断标志位
        /*  用户任务  */

    }

    n = 10;
    if(PORTB_ISFR & (1 << n))         //PTB10触发中断
    {
        PORTB_ISFR  |= (1 << n);        //写1清中断标志位
        /*  用户任务  */



    }
}

void PORTE_IRQHandler()
{
	//  PORT_PCR_REG(PORTE, 10) |= PORT_PCR_ISF(1);
    u8  n = 0;    //引脚号
	u8	State = 0;		//用于判断拨码开关的状态，4位二进制，1、2、3、4位从高到低

	gpio_Interrupt_init(PORTE, 1, GPI_DOWN, GPI_DISAB);
    n = 1;
    if(PORTE_ISFR & (1 << n))			//PTE1触发中断
	{
		PORTE_ISFR  |= (1 << n);		//写1清中断标志位
		if (gpio_get(PORTE, 6) == 1)	State += 8;
		if (gpio_get(PORTE, 7) == 1)	State += 4;
		if (gpio_get(PORTE, 8) == 1)	State += 2;
		if (gpio_get(PORTE, 9) == 1)	State += 1;
		SpeedSp = State * 7;
		if (SpeedSp > 100)	SpeedSp = 100;	//对速度的设定值进行限位，最终保证在0-100
	}
	else if(PORTE_ISFR & (1 << 2))		//K3触发中断
	{
		PORTE_ISFR  |= (1 << 2);
		DirectionErrorMan ++;
		delaytime ++;
                if (DirectionErrorMan > 50)	DirectionErrorMan = 50;
		printf("DirectionErrorMan = %d\n", (s16)DirectionErrorMan);
	}
	else if(PORTE_ISFR & (1 << 3))		//K4触发中断
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
*                             蓝宙嵌入式开发工作室
*
*  函数名称：PIT2_IRQHandler
*  功能说明：PIT2定时中断服务函数
*  参数说明：无
*  函数返回：无
*  修改时间：2012-9-18    已测试
*  备    注：
*************************************************************************/

void PIT2_IRQHandler(void)
{
   PIT_Flag_Clear(PIT2);       //清中断标志位
   
}
/*************************************************************************
*                             蓝宙电子工作室
*
*  函数名称：FTM0_IRQHandler
*  功能说明：FTM0输入捕捉中断服务函数
*  参数说明：无
*  函数返回：无
*  修改时间：2012-2-25
*  备    注：引脚号需要根据自己初始化来修改，参考现有的代码添加自己的功能
*************************************************************************/
void FTM0_IRQHandler()
{


}

/*************************************************************************
*                             蓝宙电子工作室
*
*  函数名称：FTM1_IRQHandler
*  功能说明：FTM1输入捕捉中断服务函数
*  参数说明：无
*  函数返回：无
*  修改时间：2012-2-25
*  备    注：引脚号需要根据自己初始化来修改，参考现有的代码添加自己的功能
*************************************************************************/
void FTM1_IRQHandler()
{
    u8 s = FTM1_STATUS;             //读取捕捉和比较状态  All CHnF bits can be checked using only one read of STATUS.
    u8 n;
    FTM1_STATUS = 0x00;               //清中断标志位

    n = 0;
    if( s & (1 << n) )
    {
        FTM_CnSC_REG(FTM1_BASE_PTR, n) &= ~FTM_CnSC_CHIE_MASK; //禁止输入捕捉中断
        /*     用户任务       */

        printf("\nFTM1发送中断\n");

        /*********************/
        //不建议在这里开启输入捕捉中断，而是在main函数里根据需要来开启
        //通道 CH0、CH1、Ch2、Ch3 有滤波器
        //FTM_CnSC_REG(FTM1_BASE_PTR,n) |= FTM_CnSC_CHIE_MASK;  //开启输入捕捉中断
        //delayms(10);        //因为输入的信号跳变过程不稳定，容易触发多次输入捕捉，所以添加延时
        //但考虑到中断不应该过长延时，所以开输入捕捉中断就放在main函数里，根据需要来开启
    }

    n = 1;
    if( s & (1 << n) )
    {
        FTM_CnSC_REG(FTM1_BASE_PTR, n) &= ~FTM_CnSC_CHIE_MASK; //禁止输入捕捉中断
        /*     用户任务       */


        /*********************/
        //不建议在这里开启输入捕捉中断
        //FTM_CnSC_REG(FTM1_BASE_PTR,n) |= FTM_CnSC_CHIE_MASK;  //开启输入捕捉中断
    }

}


/*************************************************************************
*                             蓝宙电子工作室
*
*  函数名称：FTM2_IRQHandler
*  功能说明：FTM2输入捕捉中断服务函数
*
*************************************************************************/
void FTM2_IRQHandler()
{
    //u8 s = FTM2_STATUS;             //读取捕捉和比较状态  All CHnF bits can be checked using only one read of STATUS.
    FTM2_STATUS = 0x00;               //清中断标志位
    
        FTM_CnSC_REG(FTM2_BASE_PTR, 0) &= ~FTM_CnSC_CHIE_MASK; //禁止输入捕捉中断
        /*     用户任务       */

        //printf("\nFTM2发送中断\n");
        CountTemp++;
        //printf("Into FTM2_IRQ: CountTemp = %d\n", CountTemp);
        //printf("%d\t", CountTemp++);

        /*********************/
        //不建议在这里开启输入捕捉中断，而是在main函数里根据需要来开启
        FTM_CnSC_REG(FTM2_BASE_PTR,0) |= FTM_CnSC_CHIE_MASK;  //开启输入捕捉中断
        //delayms(10);        //因为输入的信号跳变过程不稳定，容易触发多次输入捕捉，所以添加延时
        //但考虑到中断不应该过长延时，所以开输入捕捉中断就放在main函数里，根据需要来开启
}

volatile u8  pit_flag = 0;
volatile u32 dma_int_count = 0;


/*************************************************************************
*                             蓝宙电子工作室
*
*  函数名称：DMA_CH4_Handler
*  功能说明：DMA通道4的中断服务函数
*  参数说明：是采集摄像头数据，本数据为摄像头AD数据，可以采集到300个点。
             设置标志位能够及时搬移。
*  函数返回：无
*  修改时间：2012-3-18    已测试
*  备    注：
*************************************************************************/

void DMA_CH4_Handler(void)
{
  //DMA通道4

  //  PTA16_OUT = ~PTA16_OUT ;
    DMA_IRQ_DIS(DMA_CH4);
    DMA_IRQ_CLEAN(DMA_CH4) ;
    DMA_DIS(DMA_CH4);
   //uart_sendStr(UART0, (const u8*)"DMA4irq\n");
 
}

/*************************************************************************
*                             蓝宙电子工作室
*
*  函数名称：DMA_CH4_Handler
*  功能说明：DMA通道4的中断服务函数
*  参数说明：是采集摄像头数据，本数据位摄像头AD数据，可以采集到300个点。
             设置标志位能够及时搬移。
*  函数返回：无
*  修改时间：2012-3-18    已测试
*  备    注：
*************************************************************************/
void DMA_CH0_Handler(void)
{

    //DMA通道0
    printf("DMA_CH0_Handler\n");
    DMA_IRQ_CLEAN(DMA_CH0);                             //清除通道传输中断标志位    (这样才能再次进入中断)
    DMA_EN(DMA_CH0);                                    //使能通道CHn 硬件请求      (这样才能继续触发DMA传输)
  //   uart_putchar(UART0,0XAA);
}



volatile u8 LPT_INT_count = 0;
void  LPT_Handler(void)
{
    LPTMR0_CSR |= LPTMR_CSR_TCF_MASK;   //清除LPTMR比较标志
    LPT_INT_count++;                    //中断溢出加1
}