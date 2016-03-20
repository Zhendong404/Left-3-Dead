//-------------------------------------------------------------------------*
// 文件名: uart.h                                                          *
// 说  明: uart构件头文件                                                  *
//-------------------------------------------------------------------------*

#ifndef __UART_H__
#define __UART_H__
	
    //1 头文件
    #include "common.h"
    
    //2 宏定义
    //2.1 串口号宏定义
    #define UART0 UART0_BASE_PTR
    #define UART1 UART1_BASE_PTR
    #define UART2 UART2_BASE_PTR
    #define UART3 UART3_BASE_PTR
    #define UART4 UART4_BASE_PTR
    #define UART5 UART5_BASE_PTR

    //2.2 接收引脚irq号宏定义
    #define UART0irq 45
    #define UART1irq 47
    #define UART2irq 49
    #define UART3irq 51
    #define UART4irq 53
    #define UART5irq 55


    //3 函数声明
    //-------------------------------------------------------------------------*
    //函数名: uart_init                                                        *
    //功  能: 初始化uartx模块。                                                *
    //参  数: uartch:串口号                                                    *
    //        sysclk:系统总线时钟，以MHz为单位                                 *
    //        baud:波特率，如9600，38400等，一般来说，速度越慢，通信越稳       *
    //返  回: 无                                                               *
    //说  明:                                                                  *
    //-------------------------------------------------------------------------*
    void uart_init (UART_MemMapPtr uartch, uint32 sysclk, uint32 baud);
    
    //-------------------------------------------------------------------------*
    //函数名: uart_re1                                                         *
    //功  能: 串行接受1个字节                                                  *
    //参  数: uartch: 串口号                                                   *
    //         ch:    接收到的字节                                             *
    //返  回: 成功:1;失败:0                                                    *
    //说  明:                                                                  *
    //-------------------------------------------------------------------------*
    uint8 uart_re1 (UART_MemMapPtr uartch,uint8 *ch);
    
    //-------------------------------------------------------------------------*
    //函数名: uart_send1                                                       *
    //功  能: 串行发送1个字节                                                  *
    //参  数: uartch: 串口号                                                   *
    //         ch:    要发送的字节                                             *
    //返  回: 无                                                               *
    //说  明:                                                                  *
    //-------------------------------------------------------------------------*
    void uart_send1 (UART_MemMapPtr uartch, uint8 ch);
    
    //-------------------------------------------------------------------------*
    //函数名: uart_reN                                                         *
    //功  能: 串行 接收n个字节                                                 *
    //参  数: uartch: 串口号                                                   *
    //        buff: 接收缓冲区                                                 *
    //		  len:接收长度                                                 *
    //返  回: 1:成功;0:失败                                                    *
    //说  明:                                                                  *
    //-------------------------------------------------------------------------*
    uint8  uart_reN (UART_MemMapPtr uartch ,uint8* buff,uint16 len);
    
    //-------------------------------------------------------------------------*
    //函数名: uart_sendN                                                       *
    //功  能: 串行 接收n个字节                                                 *
    //参  数: uartch: 串口号                                                   *
    //        buff: 发送缓冲区                                                 *
    //		  len:发送长度                                                 *
    //返  回: 无                                                               *
    //说  明:                                                                  *
    //-------------------------------------------------------------------------*
    void uart_sendN (UART_MemMapPtr uartch ,uint8* buff,uint16 len);

    //-------------------------------------------------------------------------*
    //函数名: enableuartreint                                                  *
    //功  能: 开串口接收中断                                                   *
    //参  数: uartch: 串口号                                                   *
    //        irqno: 对应irq号                                                 *
    //返  回: 无                                                               *
    //说  明:                                                                  *
    //-------------------------------------------------------------------------*
    void enableuartreint(UART_MemMapPtr uartch,uint8 irqno);
    
    //-------------------------------------------------------------------------*
    //函数名: disableuartreint                                                 *
    //功  能: 关串口接收中断                                                   *
    //参  数: uartch: 串口号                                                   *
    //        irqno: 对应irq号                                                 *
    //返  回: 无                                                               *
    //说  明:                                                                  *
    //-------------------------------------------------------------------------*
    void disableuartreint(UART_MemMapPtr uartch,uint8 irqno);
	
#endif 
