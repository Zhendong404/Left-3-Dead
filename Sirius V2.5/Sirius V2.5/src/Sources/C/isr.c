//-------------------------------------------------------------------------*
// 文件名: isr.c                                                           *
// 说  明: 中断处理例程                                                    *
//---------------苏州大学飞思卡尔嵌入式系统实验室2011年--------------------*

#include "includes.h"
#include "common.h"
#include "DMA.h"
#include "ImageGet.h"


//-------------------------------------------------------------------------*
//函数名: uart3_isr                                                        *
//功  能: 串口3数据接收中断例程                                            *
//说  明: 无                                                               *
//-------------------------------------------------------------------------*
void uart0_isr(void)
{
    uint8 ch;
    DisableInterrupts;		//关总中断
    //接收一个字节数据并回发
	if(uart_re1 (UART0,&ch))
		uart_send1(UART0,ch);
	EnableInterrupts;		//开总中断
}

//------------------------------------------------------------------------------
//函数名：PIT0_Isr
//功  能：周期中断定时器PIT中断服务函数
//参  数：无
//返  回：无
//说  明：
//------------------------------------------------------------------------------
void PIT0_Isr(void)
{
    if((PIT_TFLG(0)&PIT_TFLG_TIF_MASK)!=0)
    {
      PIT_TFLG(0) |= PIT_TFLG_TIF_MASK;  //清中断标志
    }
    
    gpio_reverse(PORTA, 10);
}

//DMA0传输结束函数，由PCLK触发，B9
//这些处理放在这里，而不是放在LineIsr的原因是LineIsr进入后要马上开始采数据，来不及
void DMA0_Isr(void)
{
    uint8 DMACHno = 0;
    DMA_INT |= (1 << DMACHno);    //清DMA0通道传输完成中断标志位
    LineCount++;              //采集行计数值加1
    
    if(LineCount >= CameraHight)   //如果采集完成
    {
        ImgStatus = ImgGetFinish;    //图像采集结束标志位
        disable_irq(FIELD_IRQ);   //场中断IRQ禁用，等待下一次ImgGet()函数再开启
        disable_irq(LINE_IRQ);    //行中断IRQ禁用
        disable_irq(DMA0_IRQ);    //DMA0的IRQ禁用
          
    }   
    
}


//PORTA中断服务函数
//这个的IRQ不会打开，正常情况不会进来。
void PORTA_Isr(void)  
{
    PORTA_ISFR = ~0;
    uart_sendN(UART0, (uint8 *)"\nError In PORTA_Isr()!", 22); //错误警告
}


//PORTB中断服务函数，含PCLK引发的DMA，B9
//这个的IRQ不会打开，正常情况不会进来。
void PORTB_Isr(void)  
{
    PORTB_ISFR = ~0;
    uart_sendN(UART0, (uint8 *)"\nError In PORTB_Isr()!", 22);  //错误警告
}


//PORTC中断服务函数，含行中断，C8
void PORTC_Isr(void)  
{
    uint32 FlagTmp = PORTC_ISFR;  
    PORTC_ISFR =  ~0;             //清除PORTC的所有中断标志位
    
    if(FlagTmp & (1 << PIN_LINE))   //如果确认是行中断的
    {
        LineIsr();                    //进行中断处理函数
    }  
}



//PORTD中断服务函数，含场中断，D1
void PORTD_Isr(void)  
{
    uint32 FlagTmp = PORTD_ISFR;  
    PORTD_ISFR =  ~0;             //清除PORTD的所有中断标志位
    
    if(FlagTmp & (1 << PIN_FIELD))   //如果确认是场中断的
    {
        FieldIsr();                    //进场中断处理函数
    }

}



//PORTE中断服务函数
//这个的IRQ不会打开，正常情况不会进来。
void PORTE_Isr(void)  
{
    PORTE_ISFR = ~0;
    uart_sendN(UART0, (uint8 *)"\nError In PORTE_Isr()!", 22);   //错误警告
}



  

/*
void porta_isr(void)//场中断，A24，下降沿中断
{
  
	PORTA_PCR24 |= PORT_PCR_ISF_MASK;//清除中断标志
	DMA0_Init();
	enable_irq(0);//使能DMA通道0完成中断
	row=0;//初始化行
	imagerow=0;//初始化采集行
	enable_irq (88);//使能B口中断 ，B10行中断

}
*/