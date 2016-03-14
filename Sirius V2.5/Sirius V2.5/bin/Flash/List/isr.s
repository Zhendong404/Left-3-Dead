///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       12/Mar/2016  23:02:57
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\Sirius V2.5\src\Sources\C\isr.c
//    Command line =  
//        "E:\Sirius V2.5\src\Sources\C\isr.c" -D IAR -D TWR_K60N512 -lCN
//        "E:\Sirius V2.5\bin\Flash\List\" -lB "E:\Sirius V2.5\bin\Flash\List\"
//        -o "E:\Sirius V2.5\bin\Flash\Obj\" --no_cse --no_unroll --no_inline
//        --no_code_motion --no_tbaa --no_clustering --no_scheduling --debug
//        --endian=little --cpu=Cortex-M4 -e --fpu=None --dlib_config
//        "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I "E:\Sirius
//        V2.5\src\Sources\H\" -I "E:\Sirius V2.5\src\Sources\H\Component_H\"
//        -I "E:\Sirius V2.5\src\Sources\H\Frame_H\" -I "E:\Sirius
//        V2.5\src\Sources\H\Function_H\" -I "E:\Sirius
//        V2.5\src\Sources\H\SD_H\" -Ol --use_c++_inline
//    List file    =  E:\Sirius V2.5\bin\Flash\List\isr.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN FieldIsr
        EXTERN ImgStatus
        EXTERN LineCount
        EXTERN LineIsr
        EXTERN disable_irq
        EXTERN gpio_reverse
        EXTERN uart_re1
        EXTERN uart_send1
        EXTERN uart_sendN

        PUBLIC DMA0_Isr
        PUBLIC PIT0_Isr
        PUBLIC PORTA_Isr
        PUBLIC PORTB_Isr
        PUBLIC PORTC_Isr
        PUBLIC PORTD_Isr
        PUBLIC PORTE_Isr
        PUBLIC uart0_isr

// E:\Sirius V2.5\src\Sources\C\isr.c
//    1 //-------------------------------------------------------------------------*
//    2 // 文件名: isr.c                                                           *
//    3 // 说  明: 中断处理例程                                                    *
//    4 //---------------苏州大学飞思卡尔嵌入式系统实验室2011年--------------------*
//    5 
//    6 #include "includes.h"
//    7 #include "common.h"
//    8 #include "DMA.h"
//    9 #include "ImageGet.h"
//   10 
//   11 
//   12 //-------------------------------------------------------------------------*
//   13 //函数名: uart3_isr                                                        *
//   14 //功  能: 串口3数据接收中断例程                                            *
//   15 //说  明: 无                                                               *
//   16 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   17 void uart0_isr(void)
//   18 {
uart0_isr:
        PUSH     {R7,LR}
//   19     uint8 ch;
//   20     DisableInterrupts;		//关总中断
        CPSID i
//   21     //接收一个字节数据并回发
//   22 	if(uart_re1 (UART0,&ch))
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7  ;; 0x4006a000
        BL       uart_re1
        CMP      R0,#+0
        BEQ.N    ??uart0_isr_0
//   23 		uart_send1(UART0,ch);
        LDRB     R1,[SP, #+0]
        LDR.N    R0,??DataTable7  ;; 0x4006a000
        BL       uart_send1
//   24 	EnableInterrupts;		//开总中断
??uart0_isr_0:
        CPSIE i
//   25 }
        POP      {R0,PC}          ;; return
//   26 
//   27 //------------------------------------------------------------------------------
//   28 //函数名：PIT0_Isr
//   29 //功  能：周期中断定时器PIT中断服务函数
//   30 //参  数：无
//   31 //返  回：无
//   32 //说  明：
//   33 //------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   34 void PIT0_Isr(void)
//   35 {
PIT0_Isr:
        PUSH     {R7,LR}
//   36     if((PIT_TFLG(0)&PIT_TFLG_TIF_MASK)!=0)
        LDR.N    R0,??DataTable7_1  ;; 0x4003710c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??PIT0_Isr_0
//   37     {
//   38       PIT_TFLG(0) |= PIT_TFLG_TIF_MASK;  //清中断标志
        LDR.N    R0,??DataTable7_1  ;; 0x4003710c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable7_1  ;; 0x4003710c
        STR      R0,[R1, #+0]
//   39     }
//   40     
//   41     gpio_reverse(PORTA, 10);
??PIT0_Isr_0:
        MOVS     R1,#+10
        LDR.N    R0,??DataTable7_2  ;; 0x400ff000
        BL       gpio_reverse
//   42 }
        POP      {R0,PC}          ;; return
//   43 
//   44 //DMA0传输结束函数，由PCLK触发，B9
//   45 //这些处理放在这里，而不是放在LineIsr的原因是LineIsr进入后要马上开始采数据，来不及

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   46 void DMA0_Isr(void)
//   47 {
DMA0_Isr:
        PUSH     {R7,LR}
//   48     uint8 DMACHno = 0;
        MOVS     R0,#+0
//   49     DMA_INT |= (1 << DMACHno);    //清DMA0通道传输完成中断标志位
        LDR.N    R1,??DataTable7_3  ;; 0x40008024
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R0,R2,R0
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable7_3  ;; 0x40008024
        STR      R0,[R1, #+0]
//   50     LineCount++;              //采集行计数值加1
        LDR.N    R0,??DataTable7_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable7_4
        STRH     R0,[R1, #+0]
//   51     
//   52     if(LineCount >= CameraHight)   //如果采集完成
        LDR.N    R0,??DataTable7_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+50
        BLT.N    ??DMA0_Isr_0
//   53     {
//   54         ImgStatus = ImgGetFinish;    //图像采集结束标志位
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_5
        STRB     R0,[R1, #+0]
//   55         disable_irq(FIELD_IRQ);   //场中断IRQ禁用，等待下一次ImgGet()函数再开启
        MOVS     R0,#+90
        BL       disable_irq
//   56         disable_irq(LINE_IRQ);    //行中断IRQ禁用
        MOVS     R0,#+89
        BL       disable_irq
//   57         disable_irq(DMA0_IRQ);    //DMA0的IRQ禁用
        MOVS     R0,#+0
        BL       disable_irq
//   58           
//   59     }   
//   60     
//   61 }
??DMA0_Isr_0:
        POP      {R0,PC}          ;; return
//   62 
//   63 
//   64 //PORTA中断服务函数
//   65 //这个的IRQ不会打开，正常情况不会进来。

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   66 void PORTA_Isr(void)  
//   67 {
PORTA_Isr:
        PUSH     {R7,LR}
//   68     PORTA_ISFR = ~0;
        MOVS     R0,#-1
        LDR.N    R1,??DataTable7_6  ;; 0x400490a0
        STR      R0,[R1, #+0]
//   69     uart_sendN(UART0, (uint8 *)"\nError In PORTA_Isr()!", 22); //错误警告
        MOVS     R2,#+22
        LDR.N    R1,??DataTable7_7
        LDR.N    R0,??DataTable7  ;; 0x4006a000
        BL       uart_sendN
//   70 }
        POP      {R0,PC}          ;; return
//   71 
//   72 
//   73 //PORTB中断服务函数，含PCLK引发的DMA，B9
//   74 //这个的IRQ不会打开，正常情况不会进来。

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   75 void PORTB_Isr(void)  
//   76 {
PORTB_Isr:
        PUSH     {R7,LR}
//   77     PORTB_ISFR = ~0;
        MOVS     R0,#-1
        LDR.N    R1,??DataTable7_8  ;; 0x4004a0a0
        STR      R0,[R1, #+0]
//   78     uart_sendN(UART0, (uint8 *)"\nError In PORTB_Isr()!", 22);  //错误警告
        MOVS     R2,#+22
        LDR.N    R1,??DataTable7_9
        LDR.N    R0,??DataTable7  ;; 0x4006a000
        BL       uart_sendN
//   79 }
        POP      {R0,PC}          ;; return
//   80 
//   81 
//   82 //PORTC中断服务函数，含行中断，C8

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   83 void PORTC_Isr(void)  
//   84 {
PORTC_Isr:
        PUSH     {R7,LR}
//   85     uint32 FlagTmp = PORTC_ISFR;  
        LDR.N    R0,??DataTable7_10  ;; 0x4004b0a0
        LDR      R0,[R0, #+0]
//   86     PORTC_ISFR =  ~0;             //清除PORTC的所有中断标志位
        MOVS     R1,#-1
        LDR.N    R2,??DataTable7_10  ;; 0x4004b0a0
        STR      R1,[R2, #+0]
//   87     
//   88     if(FlagTmp & (1 << PIN_LINE))   //如果确认是行中断的
        LSLS     R0,R0,#+23
        BPL.N    ??PORTC_Isr_0
//   89     {
//   90         LineIsr();                    //进行中断处理函数
        BL       LineIsr
//   91     }  
//   92 }
??PORTC_Isr_0:
        POP      {R0,PC}          ;; return
//   93 
//   94 
//   95 
//   96 //PORTD中断服务函数，含场中断，D1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   97 void PORTD_Isr(void)  
//   98 {
PORTD_Isr:
        PUSH     {R7,LR}
//   99     uint32 FlagTmp = PORTD_ISFR;  
        LDR.N    R0,??DataTable7_11  ;; 0x4004c0a0
        LDR      R0,[R0, #+0]
//  100     PORTD_ISFR =  ~0;             //清除PORTD的所有中断标志位
        MOVS     R1,#-1
        LDR.N    R2,??DataTable7_11  ;; 0x4004c0a0
        STR      R1,[R2, #+0]
//  101     
//  102     if(FlagTmp & (1 << PIN_FIELD))   //如果确认是场中断的
        LSLS     R0,R0,#+30
        BPL.N    ??PORTD_Isr_0
//  103     {
//  104         FieldIsr();                    //进场中断处理函数
        BL       FieldIsr
//  105     }
//  106 
//  107 }
??PORTD_Isr_0:
        POP      {R0,PC}          ;; return
//  108 
//  109 
//  110 
//  111 //PORTE中断服务函数
//  112 //这个的IRQ不会打开，正常情况不会进来。

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  113 void PORTE_Isr(void)  
//  114 {
PORTE_Isr:
        PUSH     {R7,LR}
//  115     PORTE_ISFR = ~0;
        MOVS     R0,#-1
        LDR.N    R1,??DataTable7_12  ;; 0x4004d0a0
        STR      R0,[R1, #+0]
//  116     uart_sendN(UART0, (uint8 *)"\nError In PORTE_Isr()!", 22);   //错误警告
        MOVS     R2,#+22
        LDR.N    R1,??DataTable7_13
        LDR.N    R0,??DataTable7  ;; 0x4006a000
        BL       uart_sendN
//  117 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0x4003710c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     0x40008024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     LineCount

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     ImgStatus

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     0x400490a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     `?<Constant "\\nError In PORTA_Isr()!">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     0x4004a0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     `?<Constant "\\nError In PORTB_Isr()!">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_10:
        DC32     0x4004b0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_11:
        DC32     0x4004c0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_12:
        DC32     0x4004d0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_13:
        DC32     `?<Constant "\\nError In PORTE_Isr()!">`

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nError In PORTA_Isr()!">`:
        DATA
        DC8 "\012Error In PORTA_Isr()!"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nError In PORTB_Isr()!">`:
        DATA
        DC8 "\012Error In PORTB_Isr()!"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nError In PORTE_Isr()!">`:
        DATA
        DC8 "\012Error In PORTE_Isr()!"
        DC8 0

        END
//  118 
//  119 
//  120 
//  121   
//  122 
//  123 /*
//  124 void porta_isr(void)//场中断，A24，下降沿中断
//  125 {
//  126   
//  127 	PORTA_PCR24 |= PORT_PCR_ISF_MASK;//清除中断标志
//  128 	DMA0_Init();
//  129 	enable_irq(0);//使能DMA通道0完成中断
//  130 	row=0;//初始化行
//  131 	imagerow=0;//初始化采集行
//  132 	enable_irq (88);//使能B口中断 ，B10行中断
//  133 
//  134 }
//  135 */
// 
//  72 bytes in section .rodata
// 296 bytes in section .text
// 
// 296 bytes of CODE  memory
//  72 bytes of CONST memory
//
//Errors: none
//Warnings: none
