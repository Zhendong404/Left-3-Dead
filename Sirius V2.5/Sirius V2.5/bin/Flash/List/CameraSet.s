///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       12/Mar/2016  23:02:55
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\Sirius V2.5\src\Sources\C\Function_C\CameraSet.c
//    Command line =  
//        "E:\Sirius V2.5\src\Sources\C\Function_C\CameraSet.c" -D IAR -D
//        TWR_K60N512 -lCN "E:\Sirius V2.5\bin\Flash\List\" -lB "E:\Sirius
//        V2.5\bin\Flash\List\" -o "E:\Sirius V2.5\bin\Flash\Obj\" --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I "E:\Sirius
//        V2.5\src\Sources\H\" -I "E:\Sirius V2.5\src\Sources\H\Component_H\"
//        -I "E:\Sirius V2.5\src\Sources\H\Frame_H\" -I "E:\Sirius
//        V2.5\src\Sources\H\Function_H\" -I "E:\Sirius
//        V2.5\src\Sources\H\SD_H\" -Ol --use_c++_inline
//    List file    =  E:\Sirius V2.5\bin\Flash\List\CameraSet.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN SCCBPortInit
        EXTERN SCCBWriteByte
        EXTERN uart_sendN

        PUBLIC CameraDelay
        PUBLIC CameraInit
        PUBLIC CameraPortInit
        PUBLIC CameraRegInit
        PUBLIC ImgRaw
        PUBLIC ImgStatus
        PUBLIC OV7620Regs
        PUBLIC OV7725Regs

// E:\Sirius V2.5\src\Sources\C\Function_C\CameraSet.c
//    1 /******************************************************************************/
//    2 /*******************************************************************************
//    3   文件名：摄像头寄存器设置文件CameraSet.c
//    4   功  能：摄像头特性控制
//    5   日  期：2014.10.09
//    6   作  者：HJZ
//    7   备  注：
//    8 *******************************************************************************/
//    9 /******************************************************************************/
//   10 //头文件
//   11 #include "CameraSet.h"
//   12 
//   13 
//   14 //全局变量声明

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   15 volatile ImgStatusDef ImgStatus = ImgGetFinish;   //当前图像状态标志标志位
ImgStatus:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 uint8 ImgRaw[CameraHight][CameraWidth];           //原始数据储存数组
ImgRaw:
        DS8 16000
//   17 
//   18 //uint8 ImgSend[CameraWidth * CameraHight];      //要传送到上位机的数组，由于鹰眼摄像头是一字节8个像素，因而需要解压为 1字节1个像素，方便处理
//   19 
//   20 //OV7725寄存器专用初始值，全局变量

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   21 CameraRegs OV7725Regs[] =
OV7725Regs:
        DATA
        DC8 13, 193, 17, 0, 9, 3, 12, 208, 18, 64, 23, 63, 24, 80, 25, 3, 26
        DC8 120, 50, 0, 160, 10, 99, 224, 172, 255, 101, 12, 102, 0, 103, 0, 41
        DC8 80, 42, 0, 126, 12, 127, 22, 128, 42, 129, 78, 130, 97, 131, 111
        DC8 132, 123, 133, 134, 134, 142, 135, 151, 136, 164, 137, 175, 138
        DC8 197, 139, 215, 140, 232, 141, 32, 74, 0, 73, 19, 71, 8, 75, 20, 76
        DC8 23, 70, 5, 34, 153, 35, 3, 166, 4, 155, 0, 156, 255, 171, 6, 158
        DC8 17, 159, 2
//   22 {
//   23     //寄存器地址，寄存器值
//   24     {OV7725_COM4         , 0xC1},//01
//   25     {OV7725_CLKRC        , 0x00},//02
//   26     {OV7725_COM2         , 0x03},//03
//   27     {OV7725_COM3         , 0xD0},//04
//   28     {OV7725_COM7         , 0x40},//05
//   29     {OV7725_HSTART       , 0x3F},//06
//   30     {OV7725_HSIZE        , 0x50},//07
//   31     {OV7725_VSTRT        , 0x03},//08
//   32     {OV7725_VSIZE        , 0x78},//09
//   33     {OV7725_HREF         , 0x00},//10
//   34     {OV7725_SCAL0        , 0x0A},//11
//   35     {OV7725_AWB_Ctrl0    , 0xE0},//12
//   36     {OV7725_DSPAuto      , 0xff},//13
//   37     {OV7725_DSP_Ctrl2    , 0x0C},//14
//   38     {OV7725_DSP_Ctrl3    , 0x00},//15
//   39     {OV7725_DSP_Ctrl4    , 0x00},//16
//   40 
//   41 #if (CameraWidth == 80)             //17
//   42     {OV7725_HOutSize     , 0x14},   //共10位，此为高8位，低2位在OV7725_EXHCH中，为00。80，即0x50,右移2位，即0x14
//   43 #elif (CameraWidth == 160)
//   44     {OV7725_HOutSize     , 0x28},
//   45 #elif (CameraWidth == 240)
//   46     {OV7725_HOutSize     , 0x3c},
//   47 #elif (CameraWidth == 320)
//   48     {OV7725_HOutSize     , 0x50},
//   49 #else
//   50 
//   51 #endif
//   52 
//   53 #if (CameraHight == 60 )             //18
//   54     {OV7725_VOutSize     , 0x1E},   //共9位，此为高8位，低1位在OV7725_EXHCH中，为0。 60，即0x3C,右移1位，即0x1E
//   55 #elif (CameraHight == 120 )
//   56     {OV7725_VOutSize     , 0x3c},
//   57 #elif (CameraHight == 180 )
//   58     {OV7725_VOutSize     , 0x5a},
//   59 #elif (CameraHight == 240 )
//   60     {OV7725_VOutSize     , 0x78},
//   61 #else
//   62 
//   63 #endif
//   64 
//   65     {OV7725_EXHCH        , 0x00},//19
//   66     {OV7725_GAM1         , 0x0c},//20
//   67     {OV7725_GAM2         , 0x16},//21
//   68     {OV7725_GAM3         , 0x2a},//22
//   69     {OV7725_GAM4         , 0x4e},//23
//   70     {OV7725_GAM5         , 0x61},//24
//   71     {OV7725_GAM6         , 0x6f},//25
//   72     {OV7725_GAM7         , 0x7b},//26
//   73     {OV7725_GAM8         , 0x86},//27
//   74     {OV7725_GAM9         , 0x8e},//28
//   75     {OV7725_GAM10        , 0x97},//29
//   76     {OV7725_GAM11        , 0xa4},//30
//   77     {OV7725_GAM12        , 0xaf},//31
//   78     {OV7725_GAM13        , 0xc5},//32
//   79     {OV7725_GAM14        , 0xd7},//33
//   80     {OV7725_GAM15        , 0xe8},//34
//   81     {OV7725_SLOP         , 0x20},//35
//   82     {OV7725_LC_RADI      , 0x00},//36
//   83     {OV7725_LC_COEF      , 0x13},//37
//   84     {OV7725_LC_XC        , 0x08},//38
//   85     {OV7725_LC_COEFB     , 0x14},//39
//   86     {OV7725_LC_COEFR     , 0x17},//40
//   87     {OV7725_LC_CTR       , 0x05},//41
//   88     {OV7725_BDBase       , 0x99},//42
//   89     {OV7725_BDMStep      , 0x03},//43
//   90     {OV7725_SDE          , 0x04},//44
//   91     {OV7725_BRIGHT       , 0x00},//45
//   92     {OV7725_CNST         , 0xFF},//46
//   93     {OV7725_SIGN         , 0x06},//47
//   94     {OV7725_UVADJ0       , 0x11},//48
//   95     {OV7725_UVADJ1       , 0x02},//49
//   96 
//   97 };
//   98 
//   99 //OV7620寄存器专用初始值，全局变量

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  100 CameraRegs OV7620Regs[] =
OV7620Regs:
        DATA
        DC8 13, 193, 17, 0
//  101 {
//  102       //寄存器地址，寄存器值
//  103     {OV7725_COM4         , 0xC1},//01
//  104     {OV7725_CLKRC        , 0x00},//02
//  105 };
//  106 
//  107 
//  108 
//  109 
//  110 
//  111 //函数
//  112 
//  113 //CameraDelay函数
//  114 //5步 * 30000 * 1 = 150000 次运算，也就是1ms，不一定准。

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  115 void CameraDelay(uint32 time)
//  116 {
CameraDelay:
        SUB      SP,SP,#+4
//  117   volatile uint32 timecount = time * 30000;
        MOVW     R1,#+30000
        MULS     R0,R1,R0
        STR      R0,[SP, #+0]
        B.N      ??CameraDelay_0
//  118   while(timecount--)
//  119   {
//  120     asm("nop");  
??CameraDelay_1:
        nop
//  121     asm("nop");  
        nop
//  122     asm("nop");  
        nop
//  123     asm("nop");  
        nop
//  124   }
??CameraDelay_0:
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??CameraDelay_1
//  125 }
        ADD      SP,SP,#+4
        BX       LR               ;; return
//  126 
//  127 
//  128 //摄像头所需端口配置

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  129 void CameraPortInit(void)
//  130 {
CameraPortInit:
        SUB      SP,SP,#+8
//  131     uint8 i;                                  
//  132     uint8 IMAGE_PIN_IN[8] = {0,1,2,3,4,5,6,7};    
        ADD      R0,SP,#+0
        LDR.N    R1,??DataTable1
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//  133     PORT_MemMapPtr p = PORT_IMAGE_DATA_BASE_PTR;
        LDR.N    R1,??DataTable1_1  ;; 0x4004a000
//  134     
//  135     //图像数据输入口初始化， PTB0~PTB7均设置为摄像头数据输入，下拉电阻 
//  136     //SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
//  137     for(i = 0;i < 8;i++)
        MOVS     R0,#+0
        B.N      ??CameraPortInit_0
//  138     {
//  139         //相应的端口引脚初始化,不用输入，
//  140         //gpio_init(PORT_IMAGE_DATA,IMAGE_PIN_IN[i],0,0);
//  141         //设置端口为GPIO模式，默认上拉电阻
//  142         PORT_PCR_REG(p,IMAGE_PIN_IN[i]) |= PORT_PCR_MUX(0x01) | PORT_PCR_PE_MASK;
??CameraPortInit_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R2,SP,#+0
        LDRB     R2,[R0, R2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R3,SP,#+0
        LDRB     R3,[R0, R3]
        LDR      R3,[R1, R3, LSL #+2]
        ORRS     R3,R3,#0x102
        STR      R3,[R1, R2, LSL #+2]
//  143         //设置为下拉电阻
//  144         PORT_PCR_REG(p,IMAGE_PIN_IN[i]) &= ~PORT_PCR_PS_MASK;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R2,SP,#+0
        LDRB     R2,[R0, R2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R3,SP,#+0
        LDRB     R3,[R0, R3]
        LDR      R3,[R1, R3, LSL #+2]
        LSRS     R3,R3,#+1
        LSLS     R3,R3,#+1
        STR      R3,[R1, R2, LSL #+2]
//  145         
//  146     }
        ADDS     R0,R0,#+1
??CameraPortInit_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+8
        BLT.N    ??CameraPortInit_1
//  147     
//  148     
//  149     //场中断输入引脚初始化, 下降沿触发中断，暂定为PTD1
//  150     //无上下拉电阻，无滤波
//  151     PORT_PCR_REG(PORT_FIELD_BASE_PTR, PIN_FIELD) |= (
//  152                                                     PORT_PCR_MUX(0x01)    //GPIO
//  153                                                //   | PORT_PCR_PE_MASK    //上拉电阻
//  154                                                   | PORT_PCR_IRQC(0xA)   //下降沿触发中断
//  155                                                //   | PORT_PCR_PFE_MASK   //滤波
//  156                                                     );    
        LDR.N    R0,??DataTable1_2  ;; 0x4004c004
        LDR      R0,[R0, #+0]
        ORR      R0,R0,#0xA0000
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable1_2  ;; 0x4004c004
        STR      R0,[R1, #+0]
//  157     //行中断输入引脚初始化, 上升沿触发中断，暂定为PTC8
//  158     //无上下拉电阻，无滤波
//  159     PORT_PCR_REG(PORT_LINE_BASE_PTR, PIN_LINE) |= (
//  160                                                     PORT_PCR_MUX(0x01)    //GPIO
//  161                                                //   | PORT_PCR_PE_MASK    //上拉电阻
//  162                                                   | PORT_PCR_IRQC(0x9)    //上升沿触发中断
//  163                                                //   | PORT_PCR_PFE_MASK   //滤波
//  164                                                     );   
        LDR.N    R0,??DataTable1_3  ;; 0x4004b020
        LDR      R0,[R0, #+0]
        ORR      R0,R0,#0x90000
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable1_3  ;; 0x4004b020
        STR      R0,[R1, #+0]
//  165     
//  166     //PCLK输入引脚初始化，上升沿触发DMA， 暂定为PTB9
//  167     //无上下拉电阻，无滤波
//  168     PORT_PCR_REG(PORT_PCLK_BASE_PTR, PIN_PCLK) |= (
//  169                                                     PORT_PCR_MUX(0x01) //GPIO
//  170                                                 //  | PORT_PCR_PE_MASK   //上拉电阻
//  171                                                   | PORT_PCR_IRQC(0x1) //上升沿触发DMA
//  172                                                    );         
        LDR.N    R0,??DataTable1_4  ;; 0x4004a024
        LDR      R0,[R0, #+0]
        ORR      R0,R0,#0x10000
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable1_4  ;; 0x4004a024
        STR      R0,[R1, #+0]
//  173 }
        ADD      SP,SP,#+8
        BX       LR               ;; return
//  174 
//  175 
//  176 
//  177 //OV7620摄像头寄存器初始化 成功返回1 失败返回0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  178 uint8 CameraRegInit(void)
//  179 {
CameraRegInit:
        PUSH     {R7,LR}
//  180     //uint8 i;
//  181     //uint8 SensorID = 1;
//  182     //uint8 Send_Tmp[1] = {"1"};
//  183     
//  184     //SCCB信号引脚配置
//  185     SCCBPortInit();
        BL       SCCBPortInit
//  186     
//  187     //复位摄像头所有寄存器
//  188     if(SCCBWriteByte(OV7620_COMCTRLA, 0x80) == 0)
        MOVS     R1,#+128
        MOVS     R0,#+18
        BL       SCCBWriteByte
        CMP      R0,#+0
        BNE.N    ??CameraRegInit_0
//  189     {
//  190         uart_sendN(UART0, (uint8 *)"\nCamera Registers Reset Failed!", 31);
        MOVS     R2,#+31
        LDR.N    R1,??DataTable1_5
        LDR.N    R0,??DataTable1_6  ;; 0x4006a000
        BL       uart_sendN
//  191         return 0;
        MOVS     R0,#+0
        B.N      ??CameraRegInit_1
//  192     }
//  193     
//  194     //延时
//  195     CameraDelay(50);    
??CameraRegInit_0:
        MOVS     R0,#+50
        BL       CameraDelay
//  196     
//  197     //QVGA模式设置。
//  198     if( 0 == SCCBWriteByte(OV7620_COMCTRLC,0x24))
        MOVS     R1,#+36
        MOVS     R0,#+20
        BL       SCCBWriteByte
        CMP      R0,#+0
        BNE.N    ??CameraRegInit_2
//  199     {
//  200         uart_sendN(UART0, (uint8 *)"\nCamera Writing OV7620_COMCTRLC Failed!", 39);
        MOVS     R2,#+39
        LDR.N    R1,??DataTable1_7
        LDR.N    R0,??DataTable1_6  ;; 0x4006a000
        BL       uart_sendN
//  201         return 0;
        MOVS     R0,#+0
        B.N      ??CameraRegInit_1
//  202     }
//  203     
//  204     //配置Camera各寄存器均成功
//  205     uart_sendN(UART0, (uint8 *)"\nCamera Registers Initial Finally Succeed!", 42);
??CameraRegInit_2:
        MOVS     R2,#+42
        LDR.N    R1,??DataTable1_8
        LDR.N    R0,??DataTable1_6  ;; 0x4006a000
        BL       uart_sendN
//  206     return 1;
        MOVS     R0,#+1
??CameraRegInit_1:
        POP      {R1,PC}          ;; return
//  207 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     `?<Constant {0, 1, 2, 3, 4, 5, 6, 7}>`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x4004c004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x4004b020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x4004a024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     `?<Constant "\\nCamera Registers Res...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     `?<Constant "\\nCamera Writing OV762...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     `?<Constant "\\nCamera Registers Ini...">`
//  208 
//  209 
//  210 
//  211 
//  212 
//  213 //摄像头初始化函数 成功返回1 失败返回0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  214 uint8 CameraInit(void)
//  215 {
CameraInit:
        PUSH     {R7,LR}
//  216   
//  217     if(!CameraRegInit()) return 0; //摄像头寄存器初始化若失败，直接返回0
        BL       CameraRegInit
        CMP      R0,#+0
        BNE.N    ??CameraInit_0
        MOVS     R0,#+0
        B.N      ??CameraInit_1
//  218     CameraPortInit();              //摄像头所需端口配置
??CameraInit_0:
        BL       CameraPortInit
//  219     return 1;
        MOVS     R0,#+1
??CameraInit_1:
        POP      {R1,PC}          ;; return
//  220 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {0, 1, 2, 3, 4, 5, 6, 7}>`:
        DATA
        DC8 0, 1, 2, 3, 4, 5, 6, 7

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nCamera Registers Res...">`:
        DATA
        DC8 "\012Camera Registers Reset Failed!"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nCamera Writing OV762...">`:
        DATA
        DC8 "\012Camera Writing OV7620_COMCTRLC Failed!"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nCamera Registers Ini...">`:
        DATA
        DC8 "\012Camera Registers Initial Finally Succeed!"
        DC8 0

        END
//  221 
// 
// 16 000 bytes in section .bss
//    101 bytes in section .data
//    124 bytes in section .rodata
//    298 bytes in section .text
// 
//    298 bytes of CODE  memory
//    124 bytes of CONST memory
// 16 101 bytes of DATA  memory
//
//Errors: none
//Warnings: none
