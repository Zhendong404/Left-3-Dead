///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    09/Dec/2014  13:51:41 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  D:\IAR_TEST\Sirius\Sirius V2.3.5                        /
//                    66ms\src\Sources\C\Function_C\ImageGet.c                /
//    Command line =  "D:\IAR_TEST\Sirius\Sirius V2.3.5                       /
//                    66ms\src\Sources\C\Function_C\ImageGet.c" -D IAR -D     /
//                    TWR_K60N512 -lCN "D:\IAR_TEST\Sirius\Sirius V2.3.5      /
//                    66ms\bin\Ram\List\" -lB "D:\IAR_TEST\Sirius\Sirius      /
//                    V2.3.5  66ms\bin\Ram\List\" -o                          /
//                    "D:\IAR_TEST\Sirius\Sirius V2.3.5  66ms\bin\Ram\Obj\"   /
//                    --no_cse --no_unroll --no_inline --no_code_motion       /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M4 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.3\arm\INC\c\DLib_Config_Normal.h" -I                  /
//                    "D:\IAR_TEST\Sirius\Sirius V2.3.5                       /
//                    66ms\src\Sources\H\" -I "D:\IAR_TEST\Sirius\Sirius      /
//                    V2.3.5  66ms\src\Sources\H\Component_H\" -I             /
//                    "D:\IAR_TEST\Sirius\Sirius V2.3.5                       /
//                    66ms\src\Sources\H\Frame_H\" -I                         /
//                    "D:\IAR_TEST\Sirius\Sirius V2.3.5                       /
//                    66ms\src\Sources\H\Function_H\" -I                      /
//                    "D:\IAR_TEST\Sirius\Sirius V2.3.5                       /
//                    66ms\src\Sources\H\SD_H\" -Ol --use_c++_inline          /
//    List file    =  D:\IAR_TEST\Sirius\Sirius V2.3.5                        /
//                    66ms\bin\Ram\List\ImageGet.s                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ImageGet

        #define SHT_PROGBITS 0x1

        EXTERN ImgRaw
        EXTERN ImgStatus
        EXTERN enable_irq
        EXTERN uart_sendN

        PUBLIC FieldIsr
        PUBLIC ImageGet
        PUBLIC LineCount
        PUBLIC LineIsr
        PUBLIC LineRealCount
        PUBLIC LineRealCountVal03
        PUBLIC LineRealCountVal120_01

// D:\IAR_TEST\Sirius\Sirius V2.3.5  66ms\src\Sources\C\Function_C\ImageGet.c
//    1 /******************************************************************************/
//    2 /*******************************************************************************
//    3   文件名：图像采集程序IamgeGet.c
//    4   功  能：图像采集
//    5   日  期：2014.10.09
//    6   作  者：HJZ
//    7   备  注：
//    8 
//    9 *******************************************************************************/
//   10 /******************************************************************************/
//   11 
//   12 #include "ImageGet.h"
//   13 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   14 uint16 LineCount;          //当前采集的行的计数值
LineCount:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   15 uint16 LineRealCount;      //当前实际的行的计数值
LineRealCount:
        DS8 2

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nError In FieldIsr()!">`:
        DATA
        DC8 "\012Error In FieldIsr()!"
        DC8 0, 0
//   16 //uint8 LineCount_Index;
//   17 /*
//   18 uint8 const LineRealCountVal01[CameraHight] = //当前实际的行的初始值，隔3行取1行
//   19 {
//   20 3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60,63,66,69,72,75,78,81,
//   21 84,87,90,93,96,99,102,105,108,111,114,117,120,123,126,129,132,135,138,141,144,
//   22 147,150,153,156,159,162,165,168,171,174,177,180,183,186,189,192,195,198,201,
//   23 204,207,210,213,216,219,222,225,228,231,234,237,238
//   24 };
//   25 uint8 const LineRealCountVal02[CameraHight] = //当前实际的行的初始值，连续取中间的80行，效果不如隔行取好
//   26 {
//   27 151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,
//   28 171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,
//   29 191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,
//   30 211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230  
//   31 };
//   32 */
//   33 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   34 uint8 const LineRealCountVal03[CameraHight] = 
LineRealCountVal03:
        DATA
        DC8 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63
        DC8 66, 69, 72, 75, 78, 81, 84, 87, 90, 93, 96, 99, 102, 105, 108, 111
        DC8 114, 117, 120, 123, 126, 129, 132, 135, 138, 141, 144, 147, 150
        DC8 153, 156, 159, 162, 0, 0
//   35 {
//   36 15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60,63,66,69,72,75,78,81,84,87,90,
//   37 93,96,99,102,105,108,111,114,117,120,123,126,129,132,135,138,141,144,147,150,
//   38 153,156,159,162
//   39 };
//   40 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   41 uint8 const LineRealCountVal120_01[CameraHight] = 
LineRealCountVal120_01:
        DATA
        DC8 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38
        DC8 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72
        DC8 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100, 102, 0, 0
//   42 {
//   43 4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,
//   44 58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100,102
//   45 };
//   46 
//   47 
//   48 
//   49 
//   50 //场中断服务函数,下降沿触发中断，暂定为PTD1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   51 void FieldIsr(void)  
//   52 {
FieldIsr:
        PUSH     {R7,LR}
//   53     if(ImgStatus == ImgGetStart)  //如果的确是在ImageGet()中置了开始位，则继续。
        LDR.N    R0,??DataTable2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BNE.N    ??FieldIsr_0
//   54     {
//   55       //进来前已经清过标志位
//   56       enable_irq(LINE_IRQ);         //使能行中断IRQ
        MOVS     R0,#+89
        BL       enable_irq
//   57       enable_irq(DMA0_IRQ);         //使能DMA0的IRQ
        MOVS     R0,#+0
        BL       enable_irq
//   58       
//   59       LineCount = 0;               //采集行数初始值为1，后面的溢出判断就用">"而不是">="
        LDR.N    R0,??DataTable2_1
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//   60       LineRealCount = 0;
        LDR.N    R0,??DataTable2_2
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//   61       //LineCount_Index = 0;
//   62 
//   63       DMA_BASE_PTR->TCD[0].DADDR = (uint32)ImgRaw[0];     //目的地址恢复为数组开头
        LDR.N    R0,??DataTable2_3  ;; 0x40009010
        LDR.N    R1,??DataTable2_4
        STR      R1,[R0, #+0]
//   64 
//   65       
//   66       DMA_ERQ &= ~(1 << 0);      //DMA硬件禁用
        LDR.N    R0,??DataTable2_5  ;; 0x4000800c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable2_5  ;; 0x4000800c
        STR      R0,[R1, #+0]
        B.N      ??FieldIsr_1
//   67     }
//   68     else
//   69     {
//   70         uart_sendN(UART0, (uint8 *)"\nError In FieldIsr()!", 21);  //错误警报
??FieldIsr_0:
        MOVS     R2,#+21
        LDR.N    R1,??DataTable2_6
        LDR.N    R0,??DataTable2_7  ;; 0x4006a000
        BL       uart_sendN
//   71     }
//   72 }
??FieldIsr_1:
        POP      {R0,PC}          ;; return
//   73 
//   74 
//   75 
//   76 //行中断服务函数,上升沿触发中断，暂定为PTC8

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   77 void LineIsr(void)
//   78 {
//   79     LineRealCount++;             //实际行计数
LineIsr:
        LDR.N    R0,??DataTable2_2
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable2_2
        STRH     R0,[R1, #+0]
//   80     if(LineRealCount == LineRealCountVal120_01[LineCount])  //如果是需要采集的行，就采集，不是的话就跳过
        LDR.N    R0,??DataTable2_2
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable2_1
        LDRH     R1,[R1, #+0]
        LDR.N    R2,??DataTable2_8
        LDRB     R1,[R1, R2]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R0,R1
        BNE.N    ??LineIsr_0
//   81     {
//   82        //LineCount_Index++;
//   83         //DMA_INT |= (1<<0);        //清DMA传输完成标志位
//   84         DMA_ERQ |= (1 << 0);      //DMA硬件使能
        LDR.N    R0,??DataTable2_5  ;; 0x4000800c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable2_5  ;; 0x4000800c
        STR      R0,[R1, #+0]
//   85     }    
//   86 }
??LineIsr_0:
        BX       LR               ;; return
//   87 
//   88 
//   89 
//   90 
//   91 
//   92 
//   93 //图像获取函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   94 void ImageGet(void)
//   95 {
ImageGet:
        PUSH     {R7,LR}
//   96     
//   97     ImgStatus = ImgGetStart;        //图像采集标志位置为开始
        LDR.N    R0,??DataTable2
        MOVS     R1,#+4
        STRB     R1,[R0, #+0]
//   98     enable_irq(FIELD_IRQ);         //开启图像采集
        MOVS     R0,#+90
        BL       enable_irq
//   99     
//  100     while(ImgStatus != ImgGetFinish) ; //如果图像采集未结束，则一直等待。
??ImageGet_0:
        LDR.N    R0,??DataTable2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??ImageGet_0
//  101         
//  102 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     ImgStatus

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     LineCount

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     LineRealCount

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x40009010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     ImgRaw

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x4000800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     `?<Constant "\\nError In FieldIsr()!">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     LineRealCountVal120_01

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  103 
//  104 
//  105 
//  106 
//  107 
//  108 
//  109 
//  110 
//  111 
//  112 
//  113 
//  114 
//  115 
//  116 
//  117 
//  118 
//  119 
//  120 
//  121 
//  122 
//  123 
//  124 
// 
//   4 bytes in section .bss
// 128 bytes in section .rodata
// 168 bytes in section .text
// 
// 168 bytes of CODE  memory
// 128 bytes of CONST memory
//   4 bytes of DATA  memory
//
//Errors: none
//Warnings: none
