///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    06/Dec/2014  16:42:33 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  D:\IAR_TEST\Sirius\Sirius V2.3\src\Sources\C\Function_C /
//                    \ImagePro.c                                             /
//    Command line =  "D:\IAR_TEST\Sirius\Sirius                              /
//                    V2.3\src\Sources\C\Function_C\ImagePro.c" -D IAR -D     /
//                    TWR_K60N512 -lCN "D:\IAR_TEST\Sirius\Sirius             /
//                    V2.3\bin\Ram\List\" -lB "D:\IAR_TEST\Sirius\Sirius      /
//                    V2.3\bin\Ram\List\" -o "D:\IAR_TEST\Sirius\Sirius       /
//                    V2.3\bin\Ram\Obj\" --no_cse --no_unroll --no_inline     /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.3\arm\INC\c\DLib_Config_Normal.h" -I                  /
//                    "D:\IAR_TEST\Sirius\Sirius V2.3\src\Sources\H\" -I      /
//                    "D:\IAR_TEST\Sirius\Sirius                              /
//                    V2.3\src\Sources\H\Component_H\" -I                     /
//                    "D:\IAR_TEST\Sirius\Sirius                              /
//                    V2.3\src\Sources\H\Frame_H\" -I                         /
//                    "D:\IAR_TEST\Sirius\Sirius                              /
//                    V2.3\src\Sources\H\Function_H\" -I                      /
//                    "D:\IAR_TEST\Sirius\Sirius V2.3\src\Sources\H\SD_H\"    /
//                    -Ol --use_c++_inline                                    /
//    List file    =  D:\IAR_TEST\Sirius\Sirius V2.3\bin\Ram\List\ImagePro.s  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ImagePro

        #define SHT_PROGBITS 0x1

        EXTERN ImgRaw
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2f
        EXTERN uart_send1
        EXTERN uart_sendN

        PUBLIC AbsRe
        PUBLIC AbsSelf
        PUBLIC BlackGet
        PUBLIC BlackGetLeft
        PUBLIC BlackGetLeftStep1Edge
        PUBLIC BlackGetLeftStep1Scan
        PUBLIC BlackGetLeftStep2Win
        PUBLIC BlackGetRight
        PUBLIC BlackGetRightStep1Edge
        PUBLIC BlackGetRightStep1Scan
        PUBLIC BlackGetRightStep2Win
        PUBLIC BlackLeft3ResetCount
        PUBLIC BlackLeftAgainForCross
        PUBLIC BlackLeftCrossConfirm
        PUBLIC BlackLeftCrossDone
        PUBLIC BlackLeftCrossStep3
        PUBLIC BlackLeftCrossTooLowLine
        PUBLIC BlackLeftDone
        PUBLIC BlackLeftHeadLine
        PUBLIC BlackLeftLoc
        PUBLIC BlackLeftRealB
        PUBLIC BlackLeftRealClear
        PUBLIC BlackLeftRealW
        PUBLIC BlackLeftRealWB
        PUBLIC BlackLeftStep4BackLine
        PUBLIC BlackRight3ResetCount
        PUBLIC BlackRightAgainForCross
        PUBLIC BlackRightCrossConfirm
        PUBLIC BlackRightCrossDone
        PUBLIC BlackRightCrossStep3
        PUBLIC BlackRightCrossTooLowLine
        PUBLIC BlackRightDone
        PUBLIC BlackRightHeadLine
        PUBLIC BlackRightLoc
        PUBLIC BlackRightRealB
        PUBLIC BlackRightRealClear
        PUBLIC BlackRightRealW
        PUBLIC BlackRightRealWB
        PUBLIC BlackRightStep4BackLine
        PUBLIC CURVEC
        PUBLIC CURVEL
        PUBLIC CURVER
        PUBLIC CenterKeyLine
        PUBLIC CenterLineGet
        PUBLIC CenterLineGetCom
        PUBLIC CenterLineHalfWidth
        PUBLIC CenterLineHalfWidth02
        PUBLIC CenterLineLoc
        PUBLIC CenterLineResult
        PUBLIC CenterLocStore
        PUBLIC CurveGet
        PUBLIC CurveGetCompen
        PUBLIC CurveLineChosenC1
        PUBLIC CurveLineChosenC2
        PUBLIC CurveLineChosenC3
        PUBLIC CurveLineChosenL1
        PUBLIC CurveLineChosenL2
        PUBLIC CurveLineChosenL3
        PUBLIC CurveLineChosenR1
        PUBLIC CurveLineChosenR2
        PUBLIC CurveLineChosenR3
        PUBLIC CurveSignGet
        PUBLIC ErrorGet
        PUBLIC ErrorGetCen
        PUBLIC ErrorGetSelf
        PUBLIC ImagePro
        PUBLIC ImageProSend
        PUBLIC ImgNew
        PUBLIC ImgPut
        PUBLIC LeastSquarea0
        PUBLIC LeastSquarea1
        PUBLIC LimitLeftB
        PUBLIC LimitLeftW
        PUBLIC LimitLeftWB
        PUBLIC LimitRightB
        PUBLIC LimitRightW
        PUBLIC LimitRightWB
        PUBLIC MathSqrt
        PUBLIC MaxRe
        PUBLIC MinRe
        PUBLIC PathJudge
        PUBLIC PathStraightLimitC
        PUBLIC PathStraightLimitL
        PUBLIC PathStraightLimitR
        PUBLIC PathType
        PUBLIC SABCC
        PUBLIC SABCGet
        PUBLIC SABCL
        PUBLIC SABCR
        PUBLIC SendCenterLineLoc
        PUBLIC SendImage


        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {0, 255, 1, 255}>`:
        DATA
        DC8 0, 255, 1, 255

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {0, 255, 1, 0}>`:
        DATA
        DC8 0, 255, 1, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nError In BlackLeftCr...">`:
        DATA
        DC8 "\012Error In BlackLeftCrossStep3!"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nError In BlackRightC...">`:
        DATA
        DC8 "\012Error In BlackRightCrossStep3!"
// D:\IAR_TEST\Sirius\Sirius V2.3\src\Sources\C\Function_C\ImagePro.c
//    1 /******************************************************************************/
//    2 /*******************************************************************************
//    3   文件名：图像处理程序文件ImagePro.c
//    4   功  能：图像处理
//    5   日  期：2014.10.09
//    6   作  者：HJZ
//    7   备  注：
//    8 *******************************************************************************/
//    9 /******************************************************************************/
//   10 
//   11 #include "ImagePro.h"
//   12 
//   13 //中心线提取时，实际赛道宽度的一半对应的像素点数。是固定角度后测得的值。

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   14 uint8 const CenterLineHalfWidth[CameraHight] =  
CenterLineHalfWidth:
        DATA
        DC8 26, 27, 28, 30, 31, 33, 34, 36, 37, 38, 40, 41, 43, 44, 46, 47, 48
        DC8 49, 51, 52, 53, 54, 55, 57, 58, 59, 60, 61, 62, 63, 65, 66, 67, 68
        DC8 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84
        DC8 0, 0
//   15 {
//   16 26,27,28,30,31,33,34,36,37,38,40,41,43,44,46,47,48,49,51,52,53,54,55,57,58,
//   17 59,60,61,62,63,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84
//   18 };
//   19 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   20 uint8 const CenterLineHalfWidth02[CameraHight] =  
CenterLineHalfWidth02:
        DATA
        DC8 46, 47, 48, 50, 51, 53, 54, 56, 57, 58, 60, 61, 63, 64, 66, 67, 68
        DC8 69, 71, 72, 73, 74, 75, 77, 78, 79, 80, 81, 82, 83, 85, 86, 87, 88
        DC8 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104
        DC8 0, 0
//   21 {
//   22 46,47,48,50,51,53,54,56,57,58,60,61,63,64,66,67,68,69,71,72,73,74,75,77,78,
//   23 79,80,81,82,83,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104
//   24 };
//   25 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 uint8 ImgNew[CameraHight][CameraRealWidth];       //重新处理后的数据储存数组
ImgNew:
        DS8 12500

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 uint8 BlackLeftLoc[CameraHight][3];       //左黑线位置存储数组,每行3个可疑点， 255为无效值
BlackLeftLoc:
        DS8 152

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 uint8 BlackRightLoc[CameraHight][3];      //右黑线位置存储数组,每行3个可疑点， 255为无效值
BlackRightLoc:
        DS8 152

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   29 uint8 CenterLineLoc[CameraHight];      //中心线位置存储数组, 255为无效值
CenterLineLoc:
        DS8 52
//   30 //uint8 MaxValUint8 = 255;             //自定义的无效值

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   31 uint8 CenterLineResult = 1;             //中心线提取成功标志
CenterLineResult:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   32 uint8 CenterKeyLine = 25;                  //固定的要选取的行。
CenterKeyLine:
        DATA
        DC8 25

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   33 uint8 CenterLocStore = MaxValUint8;         //左右黑线都提取到的时候，保存的CenterLineLoc[CameraHight - 1]。
CenterLocStore:
        DATA
        DC8 255
//   34 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   35 uint8 PathType = 0;                       //0未知 1直道 2左中 3右中 4左内 5左外 6右内 7右外
PathType:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   36 uint8 CurveLineChosenC1 = 0;               //曲率求取时，中心线选取的第1行。
CurveLineChosenC1:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   37 uint8 CurveLineChosenC2 = 0;               //曲率求取时，中心线选取的第1行。
CurveLineChosenC2:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   38 uint8 CurveLineChosenC3 = 0;               //曲率求取时，中心线选取的第1行。
CurveLineChosenC3:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   39 uint8 CurveLineChosenL1 = 0;               //曲率求取时，左黑线选取的第1行。
CurveLineChosenL1:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   40 uint8 CurveLineChosenL2 = 0;               //曲率求取时，左黑线选取的第1行。
CurveLineChosenL2:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   41 uint8 CurveLineChosenL3 = 0;               //曲率求取时，左黑线选取的第1行。
CurveLineChosenL3:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   42 uint8 CurveLineChosenR1 = 0;               //曲率求取时，右黑线选取的第1行。
CurveLineChosenR1:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   43 uint8 CurveLineChosenR2 = 0;               //曲率求取时，右黑线选取的第1行。
CurveLineChosenR2:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   44 uint8 CurveLineChosenR3 = 0;               //曲率求取时，右黑线选取的第1行。
CurveLineChosenR3:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   45 int16 SABCL = 0;                          //曲率求取时，左黑线曲率三角形的面积，顺时针为负，逆时针为正。
SABCL:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   46 int16 SABCC = 0;                          //曲率求取时，中心线曲率三角形的面积，顺时针为负，逆时针为正。
SABCC:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   47 int16 SABCR = 0;                          //曲率求取时，右黑线曲率三角形的面积，顺时针为负，逆时针为正。
SABCR:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   48 int16 CURVEL = 0;                          //曲率求取时，左黑线的曲率，顺时钟为负，逆时针为正。
CURVEL:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   49 int16 CURVEC = 0;                          //曲率求取时，中心线的曲率，顺时钟为负，逆时针为正。
CURVEC:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   50 int16 CURVER = 0;                          //曲率求取时，右黑线的曲率，顺时钟为负，逆时针为正。
CURVER:
        DS8 2

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   51 int16 PathStraightLimitL = 20;           //赛道类型判断时，左黑线判断为直线的阈值，这里乱写的，需要用C#测定。
PathStraightLimitL:
        DATA
        DC16 20

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   52 int16 PathStraightLimitC = 20;           //赛道类型判断时，中心线判断为直线的阈值，这里乱写的，需要用C#测定。
PathStraightLimitC:
        DATA
        DC16 20

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   53 int16 PathStraightLimitR = 20;           //赛道类型判断时，右黑线判断为直线的阈值，这里乱写的，需要用C#测定。
PathStraightLimitR:
        DATA
        DC16 20

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   54 int16 CurveGetCompen = 2000;             //曲率求取时，为了不使数太小，乘的补偿量。
CurveGetCompen:
        DATA
        DC16 2000
//   55 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   56 uint8 ErrorGetSelf;                 //平均值与自身的偏差，也就是curve
ErrorGetSelf:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   57 uint8 ErrorGetCen;                 //平均值与物理中心线的偏差。
ErrorGetCen:
        DS8 1
//   58 
//   59 //左

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   60 uint8 BlackLeftRealWB[2];                  //黑线的实际黑白差值的存储数组，用于计算实际黑白差值的阈值。替代LimitLeftWB
BlackLeftRealWB:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   61 uint8 BlackLeftRealB[2];                   //黑线的实际黑点值存储数组，用于计算实际黑点阈值。替代LimitLeftB
BlackLeftRealB:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   62 uint8 BlackLeftRealW[2];                   //黑线的实际白点值存储数组，用于计算实际白点阈值。替代LimitLeftW
BlackLeftRealW:
        DS8 2
//   63 //右

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   64 uint8 BlackRightRealWB[2];                  //黑线的实际黑白差值的存储数组，用于计算实际黑白差值的阈值。替代LimitRightWB
BlackRightRealWB:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   65 uint8 BlackRightRealB[2];                   //黑线的实际黑点值存储数组，用于计算实际黑点阈值。替代LimitRightB
BlackRightRealB:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   66 uint8 BlackRightRealW[2];                   //黑线的实际白点值存储数组，用于计算实际白点阈值。替代LimitRightW
BlackRightRealW:
        DS8 2
//   67 
//   68 
//   69 //左
//   70 //3个关键值的可改值，可由自适应性算法更改。

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   71 uint8 LimitLeftWB = LimitOriLeftWB;    //黑白像素点的差值，两个点的差必须要大于这个值，才能认为有跳变。
LimitLeftWB:
        DATA
        DC8 80

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   72 uint8 LimitLeftW = LimitOriLeftW;      //白点必须要大于此值
LimitLeftW:
        DATA
        DC8 150

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   73 uint8 LimitLeftB = LimitOriLeftB;      //黑点必须要小于此值
LimitLeftB:
        DATA
        DC8 80
//   74 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   75 uint8 BlackLeftCrossDone = 0;    //左黑线十字检测标志位 0未进入 1失败 2成功
BlackLeftCrossDone:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   76 uint8 BlackLeftDone = 1;          //左黑线提取成功标示位 1成功 0失败
BlackLeftDone:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   77 uint8 BlackLeft3ResetCount = 0;       //由于光线变化太大引起的3个关键值重置的次数。
BlackLeft3ResetCount:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   78 uint8 BlackLeftCrossTooLowLine = 3;    //十字再检测时，低于该行就没必要启动再检测程序了。
BlackLeftCrossTooLowLine:
        DATA
        DC8 3
//   79 //uint8 BlackLeftStep4Flag = 0;          //左黑线需要执行第4阶段的标志位，1需执行，0不需执行。
//   80 //uint8 BlackLeftStep4StartLine = 0;     //左黑线第4阶段起始行

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   81 uint8 BlackLeftHeadLine = MaxValUint8;   //左黑线的线头，从上往下。
BlackLeftHeadLine:
        DATA
        DC8 255
//   82 
//   83 //右
//   84 //3个关键值的可改值，可由自适应性算法更改。

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   85 uint8 LimitRightWB = LimitOriRightWB;    //黑白像素点的差值，两个点的差必须要大于这个值，才能认为有跳变。
LimitRightWB:
        DATA
        DC8 80

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   86 uint8 LimitRightW = LimitOriRightW;      //白点必须要大于此值
LimitRightW:
        DATA
        DC8 150

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   87 uint8 LimitRightB = LimitOriRightB;      //黑点必须要小于此值
LimitRightB:
        DATA
        DC8 80
//   88 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   89 uint8 BlackRightCrossDone = 0;   //右黑线十字检测标志位 0未进入 1失败 2成功
BlackRightCrossDone:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   90 uint8 BlackRightDone = 1;          //右黑线提取成功标示位 1成功 0失败
BlackRightDone:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   91 uint8 BlackRight3ResetCount = 0;       //由于光线变化太大引起的3个关键值重置的次数。
BlackRight3ResetCount:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   92 uint8 BlackRightCrossTooLowLine = 3;    //十字再检测时，低于该行就没必要启动再检测程序了。
BlackRightCrossTooLowLine:
        DATA
        DC8 3
//   93 //uint8 BlackRightStep4Flag = 0;          //右黑线需要执行第4阶段的标志位，1需执行，0不需执行。
//   94 //uint8 BlackRightStep4StartLine = 0;     //右黑线第4阶段起始行

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   95 uint8 BlackRightHeadLine = MaxValUint8;   //左黑线的线头，从上往下。
BlackRightHeadLine:
        DATA
        DC8 255
//   96 
//   97 
//   98 
//   99 //自身绝对值求值，只适合于int16型变量，返回int16型变量。

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  100 int16 AbsSelf(int16 x)
//  101 {
//  102   if(x < 0) return (0-x);
AbsSelf:
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BPL.N    ??AbsSelf_0
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        RSBS     R0,R0,#+0
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??AbsSelf_1
//  103   else return x;  
??AbsSelf_0:
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
??AbsSelf_1:
        BX       LR               ;; return
//  104 }
//  105 
//  106 
//  107 //======================================================================
//  108 //函数名：MaxRe
//  109 //功  能：求取两数最大值
//  110 //参  数：第1个数num1, 第2个数num2。
//  111 //返  回：2个数中的最大值
//  112 //影  响：无
//  113 //说  明：1. 两个输入参数无先后顺序。
//  114 //        2. 只能处理两个uint8型的数据，其它数据类型会出错。
//  115 //        3. 返回值的类型也是uint8.
//  116 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  117 uint8 MaxRe(uint8 num1, uint8 num2)
//  118 {
//  119   if(num1 >= num2)
MaxRe:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BCC.N    ??MaxRe_0
//  120   {
//  121     return num1;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??MaxRe_1
//  122   }
//  123   else
//  124   {
//  125     return num2;
??MaxRe_0:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??MaxRe_1:
        BX       LR               ;; return
//  126   }
//  127 }
//  128 
//  129 //======================================================================
//  130 //函数名：MinRe
//  131 //功  能：求取两数最小值
//  132 //参  数：第1个数num1, 第2个数num2。
//  133 //返  回：2个数中的最小值
//  134 //影  响：无
//  135 //说  明：1. 两个输入参数无先后顺序。
//  136 //        2. 只能处理两个uint8型的数据，其它数据类型会出错。
//  137 //        3. 返回值的类型也是uint8.     
//  138 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  139 uint8 MinRe(uint8 num1, uint8 num2)
//  140 {
//  141   if(num1 <= num2)
MinRe:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCC.N    ??MinRe_0
//  142   {
//  143     return num1;  
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??MinRe_1
//  144   }
//  145   else
//  146   {
//  147     return num2;  
??MinRe_0:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??MinRe_1:
        BX       LR               ;; return
//  148   }
//  149 }
//  150 
//  151 //======================================================================
//  152 //函数名：AbsRe
//  153 //功  能：求取两数差值的绝对值
//  154 //参  数：第1个数num1, 第2个数num2。
//  155 //返  回：2个数的绝对值。
//  156 //影  响：无
//  157 //说  明：1. 两个输入参数无先后顺序。
//  158 //        2. 只能处理两个uint8型的数据，其它数据类型会出错。
//  159 //        3. 返回值的类型也是uint8.     
//  160 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  161 uint8 AbsRe(uint8 num1, uint8 num2)
//  162 {
//  163   if(num1 >= num2)
AbsRe:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BCC.N    ??AbsRe_0
//  164   {
//  165     return (num1 - num2);  
        SUBS     R0,R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??AbsRe_1
//  166   }
//  167   else
//  168   {
//  169     return (num2 - num1);  
??AbsRe_0:
        SUBS     R0,R1,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??AbsRe_1:
        BX       LR               ;; return
//  170   }
//  171 }
//  172 
//  173 
//  174 //======================================================================
//  175 //函数名：LeastSquarea1
//  176 //功  能：最小二乘法的a1值的求取
//  177 //参  数：x数组，y数组，num基于的有效数据个数
//  178 //返  回：a1
//  179 //影  响：无
//  180 //说  明：1. y = a0 + a1 * x;
//  181 //        2. a1 = (N * Σxy - Σx * Σy) / (N * Σx^2 - Σx * Σx);
//  182 //        ////////////////////////////////////////////////////////////////////可以考虑把所有有float型的地方乘以1000改成int     
//  183 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  184 float LeastSquarea1(uint8 x[], uint8 y[], uint8 num)
//  185 {
LeastSquarea1:
        PUSH     {R4-R11,LR}
        MOVS     R7,R0
        MOV      R8,R1
        MOVS     R4,R2
//  186   float andxy = 0, andx = 0, andy = 0, andx2 = 0;
        MOVS     R9,#+0
        MOVS     R5,#+0
        MOVS     R10,#+0
        MOVS     R6,#+0
//  187   float a1;
//  188   uint8 i;
//  189  
//  190   for(i = 0; i < num; i++)
        MOVS     R11,#+0
        B.N      ??LeastSquarea1_0
//  191   {
//  192     andxy += x[i] * y[i];
??LeastSquarea1_1:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        LDRB     R0,[R11, R7]
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        LDRB     R1,[R11, R8]
        MULS     R0,R1,R0
        BL       __aeabi_i2f
        MOV      R1,R9
        BL       __aeabi_fadd
        MOV      R9,R0
//  193     andx += x[i];
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        LDRB     R0,[R11, R7]
        BL       __aeabi_ui2f
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R5,R0
//  194     andy += y[i];
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        LDRB     R0,[R11, R8]
        BL       __aeabi_ui2f
        MOV      R1,R10
        BL       __aeabi_fadd
        MOV      R10,R0
//  195     andx2 += x[i] * x[i];
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        LDRB     R0,[R11, R7]
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        LDRB     R1,[R11, R7]
        MULS     R0,R1,R0
        BL       __aeabi_i2f
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R6,R0
//  196   }
        ADDS     R11,R11,#+1
??LeastSquarea1_0:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R11,R4
        BCC.N    ??LeastSquarea1_1
//  197   
//  198   a1 = (num * andxy - andx * andy) * 1.0 / (num * andx2 - andx * andx);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        BL       __aeabi_ui2f
        MOV      R1,R9
        BL       __aeabi_fmul
        MOVS     R7,R0
        MOVS     R0,R5
        MOV      R1,R10
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable10  ;; 0x3ff00000
        BL       __aeabi_dmul
        MOV      R8,R0
        MOV      R9,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        BL       __aeabi_ui2f
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R4,R0
        MOVS     R0,R5
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R8
        MOV      R1,R9
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
//  199   return a1;  
        POP      {R4-R11,PC}      ;; return
//  200 }
//  201 
//  202 
//  203 //======================================================================
//  204 //函数名：LeastSquarea0
//  205 //功  能：最小二乘法的a0值的求取
//  206 //参  数：x数组，y数组，a1参数，num基于的有效数据个数
//  207 //返  回：a0
//  208 //影  响：无
//  209 //说  明：1. y = a0 + a1 * x;
//  210 //        2. a0 = Σy / N - a1 * Σx / N;
//  211 //             
//  212 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  213 float LeastSquarea0(uint8 x[], uint8 y[], float a1, uint8 num)
//  214 {
LeastSquarea0:
        PUSH     {R4-R10,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOVS     R4,R3
//  215   float andx = 0, andy = 0;
        MOVS     R8,#+0
        MOVS     R9,#+0
//  216   float a0;
//  217   uint8 i;
//  218   for(i = 0; i < num; i++)
        MOVS     R10,#+0
        B.N      ??LeastSquarea0_0
//  219   {
//  220     andx += x[i];
??LeastSquarea0_1:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        LDRB     R0,[R10, R5]
        BL       __aeabi_ui2f
        MOV      R1,R8
        BL       __aeabi_fadd
        MOV      R8,R0
//  221     andy += y[i];
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        LDRB     R0,[R10, R6]
        BL       __aeabi_ui2f
        MOV      R1,R9
        BL       __aeabi_fadd
        MOV      R9,R0
//  222   }
        ADDS     R10,R10,#+1
??LeastSquarea0_0:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R10,R4
        BCC.N    ??LeastSquarea0_1
//  223   
//  224   a0 = andy / num - a1 * andx / num;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOV      R0,R9
        BL       __aeabi_fdiv
        MOVS     R5,R0
        MOVS     R0,R7
        MOV      R1,R8
        BL       __aeabi_fmul
        MOVS     R6,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
//  225   return a0;
        POP      {R4-R10,PC}      ;; return
//  226 }
//  227 
//  228 
//  229 
//  230 
//  231 /*
//  232 //二值化图像解压函数
//  233 //dst             图像解压目的地址
//  234 //src             图像解压源地址
//  235 //srclen          二值化图像的占用空间大小
//  236 void ImageExtract(uint8 *dst, uint8 *src, uint32 srclen)
//  237 {
//  238     uint8 colour[2] = {255, 0}; //0 和 1 分别对应的颜色
//  239     //注：山外的摄像头 0 表示 白色，1表示 黑色
//  240     uint8 tmpsrc;
//  241     while(srclen --)
//  242     {
//  243         tmpsrc = *src++;
//  244         *dst++ = colour[ (tmpsrc >> 7 ) & 0x01 ];
//  245         *dst++ = colour[ (tmpsrc >> 6 ) & 0x01 ];
//  246         *dst++ = colour[ (tmpsrc >> 5 ) & 0x01 ];
//  247         *dst++ = colour[ (tmpsrc >> 4 ) & 0x01 ];
//  248         *dst++ = colour[ (tmpsrc >> 3 ) & 0x01 ];
//  249         *dst++ = colour[ (tmpsrc >> 2 ) & 0x01 ];
//  250         *dst++ = colour[ (tmpsrc >> 1 ) & 0x01 ];
//  251         *dst++ = colour[ (tmpsrc >> 0 ) & 0x01 ];
//  252     }
//  253 }
//  254 
//  255 
//  256 */
//  257 
//  258 /*          //OV7725的图像发送函数
//  259 //图像发送到上位机
//  260 void SendImage(uint8 *imgaddr, uint32 imgsize)
//  261 {                                                                                   
//  262     uint8 cmd[4] = {0, 255, 1, 0 };    //yy_摄像头串口调试 使用的命令
//  263 
//  264     //uint8 cmd[1] = {255};       //DEMOK上位机使用的命令   
//  265   
//  266     uart_sendN(UART0, cmd, sizeof(cmd));    //先发送命令
//  267 
//  268     uart_sendN(UART0, imgaddr, imgsize); //再发送图像
//  269 }
//  270 
//  271 */
//  272 
//  273 //======================================================================
//  274 //函数名：SendCenterLineLoc
//  275 //功  能：中心线数组发送函数
//  276 //参  数：img待发送的一维图像数组
//  277 //返  回：无
//  278 //影  响：无
//  279 //说  明：1. 这里的命令头和图像数组发送函数的命令头不一样。
//  280 //      
//  281 //          
//  282 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  283 void SendCenterLineLoc(uint8 img[CameraHight])
//  284 {
SendCenterLineLoc:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  285     uint8 i;
//  286     uint8 cmd[4] = {0, 255, 1, 255 };   //中心线数组的数据头
        ADD      R0,SP,#+0
        LDR.W    R1,??DataTable10_1
        LDR      R2,[R1, #0]
        STR      R2,[R0, #+0]
//  287     uart_sendN(UART0, cmd, sizeof(cmd));    //先发送命令
        MOVS     R2,#+4
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable12  ;; 0x4006a000
        BL       uart_sendN
//  288     for(i = 0; i < CameraHight; i++)
        MOVS     R5,#+0
        B.N      ??SendCenterLineLoc_0
//  289     {
//  290       uart_send1(UART0, img[i]); //发送中心线数组
??SendCenterLineLoc_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R1,[R5, R4]
        LDR.W    R0,??DataTable12  ;; 0x4006a000
        BL       uart_send1
//  291     }
        ADDS     R5,R5,#+1
??SendCenterLineLoc_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+50
        BCC.N    ??SendCenterLineLoc_1
//  292     
//  293 }
        POP      {R0,R4,R5,PC}    ;; return
//  294 
//  295 
//  296 
//  297 
//  298 //======================================================================
//  299 //函数名：SendImage
//  300 //功  能：OV7620的图像发送函数
//  301 //参  数：待发送的二维图像数组imgaddr
//  302 //返  回：无
//  303 //影  响：无
//  304 //说  明：1. 修改图像数组大小时需要把内部两个for的内容也改掉
//  305 //        2. 这里的命令头与中心线数组发送函数的命令头不一样。
//  306 //          
//  307 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  308 void SendImage(uint8 imgaddr[CameraHight][CameraRealWidth])
//  309 {                            
SendImage:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
//  310     uint8 i, j;
//  311     uint8 cmd[4] = {0, 255, 1, 0 };    //图像数组的数据头
        ADD      R0,SP,#+0
        LDR.W    R1,??DataTable11
        LDR      R2,[R1, #0]
        STR      R2,[R0, #+0]
//  312 
//  313     //uint8 cmd[1] = {255};       //DEMOK上位机使用的命令   
//  314   
//  315     uart_sendN(UART0, cmd, sizeof(cmd));    //先发送命令
        MOVS     R2,#+4
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable12  ;; 0x4006a000
        BL       uart_sendN
//  316     
//  317     //这里不能用uart_sendN(UART0, imgaddr, CameraSize)来代替，因为uart_sendN函数里的buff[i].
//  318     for(i = 0; i < CameraHight; i++)
        MOVS     R5,#+0
        B.N      ??SendImage_0
//  319         for(j = 0; j < CameraRealWidth; j++)
//  320             uart_send1(UART0, imgaddr[i][j]); //发送图像
??SendImage_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+250
        MLA      R0,R0,R5,R4
        LDRB     R1,[R6, R0]
        LDR.W    R0,??DataTable12  ;; 0x4006a000
        BL       uart_send1
        ADDS     R6,R6,#+1
??SendImage_2:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+250
        BCC.N    ??SendImage_1
        ADDS     R5,R5,#+1
??SendImage_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+50
        BCS.N    ??SendImage_3
        MOVS     R6,#+0
        B.N      ??SendImage_2
//  321 }
??SendImage_3:
        POP      {R0,R1,R4-R6,PC}  ;; return
//  322 
//  323 
//  324 
//  325 //====================================左左左左左左左左左左左左左左左左左============================
//  326 
//  327 //======================================================================
//  328 //函数名：BlackLeftRealClear
//  329 //功  能：左黑线提取中，对3个关键值的实际值清零
//  330 //参  数：无
//  331 //返  回：无
//  332 //影  响：BlackLeftRealWB[], BlackLeftRealW[], BlackLeftRealB[]
//  333 //说  明：
//  334 //      
//  335 //             
//  336 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  337 void BlackLeftRealClear(void)
//  338 {
//  339     BlackLeftRealWB[0] = 0;
BlackLeftRealClear:
        LDR.W    R0,??DataTable12_1
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  340     BlackLeftRealWB[1] = 0;
        LDR.W    R0,??DataTable12_1
        MOVS     R1,#+0
        STRB     R1,[R0, #+1]
//  341     BlackLeftRealW[0] = 0;
        LDR.W    R0,??DataTable12_2
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  342     BlackLeftRealW[1] = 0;
        LDR.W    R0,??DataTable12_2
        MOVS     R1,#+0
        STRB     R1,[R0, #+1]
//  343     BlackLeftRealB[0] = 0;
        LDR.W    R0,??DataTable12_3
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  344     BlackLeftRealB[1] = 0;
        LDR.W    R0,??DataTable12_3
        MOVS     R1,#+0
        STRB     R1,[R0, #+1]
//  345 }
        BX       LR               ;; return
//  346 
//  347 
//  348 
//  349 
//  350 //======================================================================
//  351 //函数名：BlackGetLeftStep1Edge
//  352 //功  能：左黑线提取中，第1阶段跳变检测函数,处理该行左线的可疑黑点
//  353 //参  数：待检测的行号row, 第几次使用use, 是否为十字再检测调用标志位CrossFlag
//  354 //返  回：1成功 0失败
//  355 //影  响：BlackLeftRealWB[], BlackLeftRealW[], BlackLeftRealB[]
//  356 //        BlackLeftLoc[][]
//  357 //说  明：1. 对第row行的跳变向左进行白到黑检测，成功就赋相应的值（有3个备用值），失败则赋255
//  358 //        2. 两批条件均满足时。则检测成功。会有最多3个值进行记录，现阶段只用到了第1个值
//  359 //        3. 里面有涉及3个关键值的实际值的记录，CrossFlag的情况就不用记录（也就不用更改）
//  360 //        4. 若1个黑点也没有，或者超过3个黑点，则检测失败。
//  361 //        5. 若要改成黑到白的检测，或者任意检测，只需更改第一批条件即可，很方便。
//  362 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  363 uint8 BlackGetLeftStep1Edge(uint8 row, uint8 use, uint8 CrossFlag)
//  364 {
BlackGetLeftStep1Edge:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  365   uint8 index, col, temp, temp1;
//  366   uint8 abs1;
//  367   
//  368   //左线检测跳变时的起始列，允许在中心线的基础上向右偏移BlackLeftEdgeStartColOffset这么多列。
//  369   temp = CameraRealWidth/2 - 1 + BlackLeftEdgeStartColOffset;
        MOVS     R8,#+174
//  370   
//  371   index = 0;         //可疑点的序号
        MOVS     R7,#+0
//  372   //从中间到最左边扫描，隔1个点求差
//  373   for(col = temp; col >= 4+BlackLeftEdgeNum; col--) 
        B.N      ??BlackGetLeftStep1Edge_0
//  374   {
//  375       abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col-1-BlackLeftEdgeNum]); //取差值的绝对值。
//  376       
//  377       if( //跳变沿的第一批条件：
//  378           //黑够黑，白够白，差够大。
//  379           //这里的3个阈值为初始值，不是自适应之后调整的值。
//  380           (abs1 > LimitLeftWB) //两者的差够大
//  381         //后面两个条件改一下，就可以实现黑到白的跳变检测，或者任意检测。
//  382         &&(ImgNew[row][col] > LimitLeftW)                     //白点够白
//  383         &&(ImgNew[row][col-1-BlackLeftEdgeNum] < LimitLeftB)                   //黑点够黑
//  384          )
//  385       {         
//  386           //跳变沿的第二批条件：
//  387           //近处的行，向左3个点仍为黑点
//  388           if(row > BlackMiddleLine)
//  389           {
//  390             temp1 = (
//  391                       (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB)
//  392                     &&(ImgNew[row][col-3-BlackLeftEdgeNum] < LimitLeftB)
//  393                     &&(ImgNew[row][col-4-BlackLeftEdgeNum] < LimitLeftB)
//  394                     );
//  395           }          
//  396           else
//  397           {
//  398             //远处的行 ，向左2个点为仍为黑点
//  399             if(row > BlackFarLine)
//  400             {
//  401               temp1 = (
//  402                         (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB)
//  403                       &&(ImgNew[row][col-3-BlackLeftEdgeNum] < LimitLeftB)
//  404                       );
//  405             }
//  406             //远处的行 ，向左1个点为仍为黑点
//  407             else
//  408             {
//  409               temp1 = (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB);
//  410             }
//  411           }
//  412 
//  413           if(temp1)
//  414           {
//  415                             
//  416               //超过3个可疑黑点，则报错
//  417               if(index == 3)       
//  418               {
//  419                 //如果是十字再检测的调用，就不用更新这几个值。
//  420                 if(CrossFlag)
//  421                 {
//  422                   //对3个关键值的实际值清零
//  423                   BlackLeftRealClear();
//  424                 }
//  425                 //该行定位黑线失败，赋无效值
//  426                 BlackLeftLoc[row][0] = MaxValUint8;
//  427                 return 0;
//  428               }
//  429               
//  430               //如果是十字再检测的调用，就不用更新这几个值。
//  431               if(CrossFlag)
//  432               {
//  433                 //进入这里说明跳变沿的二批条件均满足，进入黑点记录阶段
//  434                 //记录3个关键值的实际信息，作为后面的参考。
//  435                 if(use == 1)
//  436                 {
//  437                   BlackLeftRealWB[0] = ImgNew[row][col] - ImgNew[row][col-1-BlackLeftEdgeNum]; 
//  438                   BlackLeftRealW[0] = ImgNew[row][col];
//  439                   BlackLeftRealB[0] = ImgNew[row][col-1-BlackLeftEdgeNum];
//  440                 }
//  441                 else if(use == 2)
??BlackGetLeftStep1Edge_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+2
        BNE.N    ??BlackGetLeftStep1Edge_2
//  442                 {
//  443                   BlackLeftRealWB[1] = ImgNew[row][col] - ImgNew[row][col-1-BlackLeftEdgeNum]; 
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable12_4
        MLA      R1,R1,R4,R2
        ADDS     R1,R8,R1
        LDRB     R1,[R1, #-3]
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable12_1
        STRB     R0,[R1, #+1]
//  444                   BlackLeftRealW[1] = ImgNew[row][col];
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        LDR.W    R1,??DataTable12_2
        STRB     R0,[R1, #+1]
//  445                   BlackLeftRealB[1] = ImgNew[row][col-1-BlackLeftEdgeNum];
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-3]
        LDR.W    R1,??DataTable12_3
        STRB     R0,[R1, #+1]
//  446                 }
//  447                 else
//  448                 {
//  449                 }
//  450               }
//  451               //跳变检测成功，取黑点
//  452               BlackLeftLoc[row][index] = col - 1 - BlackLeftEdgeNum;          
??BlackGetLeftStep1Edge_2:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable12_5
        MLA      R0,R0,R4,R1
        SUBS     R1,R8,#+3
        STRB     R1,[R7, R0]
//  453               index++;
        ADDS     R7,R7,#+1
??BlackGetLeftStep1Edge_3:
        SUBS     R8,R8,#+1
??BlackGetLeftStep1Edge_0:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+6
        BCC.W    ??BlackGetLeftStep1Edge_4
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R1,[R0, #-3]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R2,??DataTable12_4
        MLA      R0,R0,R4,R2
        LDRB     R0,[R8, R0]
        BL       AbsRe
        LDR.W    R1,??DataTable12_6
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCS.N    ??BlackGetLeftStep1Edge_3
        LDR.W    R0,??DataTable12_7
        LDRB     R0,[R0, #+0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable12_4
        MLA      R1,R1,R4,R2
        LDRB     R1,[R8, R1]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep1Edge_3
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-3]
        LDR.W    R1,??DataTable12_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep1Edge_3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+31
        BCC.N    ??BlackGetLeftStep1Edge_5
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-4]
        LDR.W    R1,??DataTable12_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep1Edge_6
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-5]
        LDR.W    R1,??DataTable12_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep1Edge_6
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-6]
        LDR.W    R1,??DataTable12_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep1Edge_6
        MOVS     R0,#+1
        B.N      ??BlackGetLeftStep1Edge_7
??BlackGetLeftStep1Edge_6:
        MOVS     R0,#+0
??BlackGetLeftStep1Edge_7:
        B.N      ??BlackGetLeftStep1Edge_8
??BlackGetLeftStep1Edge_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+21
        BCC.N    ??BlackGetLeftStep1Edge_9
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-4]
        LDR.W    R1,??DataTable12_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep1Edge_10
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-5]
        LDR.W    R1,??DataTable12_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep1Edge_10
        MOVS     R0,#+1
        B.N      ??BlackGetLeftStep1Edge_11
??BlackGetLeftStep1Edge_10:
        MOVS     R0,#+0
??BlackGetLeftStep1Edge_11:
        B.N      ??BlackGetLeftStep1Edge_8
??BlackGetLeftStep1Edge_9:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-4]
        LDR.W    R1,??DataTable12_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep1Edge_12
        MOVS     R0,#+1
        B.N      ??BlackGetLeftStep1Edge_13
??BlackGetLeftStep1Edge_12:
        MOVS     R0,#+0
??BlackGetLeftStep1Edge_13:
??BlackGetLeftStep1Edge_8:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.W    ??BlackGetLeftStep1Edge_3
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+3
        BNE.N    ??BlackGetLeftStep1Edge_14
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??BlackGetLeftStep1Edge_15
        BL       BlackLeftRealClear
??BlackGetLeftStep1Edge_15:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable12_5
        MLA      R0,R0,R4,R1
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        MOVS     R0,#+0
        B.N      ??BlackGetLeftStep1Edge_16
??BlackGetLeftStep1Edge_14:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.W    ??BlackGetLeftStep1Edge_2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.W    ??BlackGetLeftStep1Edge_1
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable12_4
        MLA      R1,R1,R4,R2
        ADDS     R1,R8,R1
        LDRB     R1,[R1, #-3]
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable12_1
        STRB     R0,[R1, #+0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        LDR.W    R1,??DataTable12_2
        STRB     R0,[R1, #+0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-3]
        LDR.W    R1,??DataTable12_3
        STRB     R0,[R1, #+0]
        B.N      ??BlackGetLeftStep1Edge_2
//  454             
//  455           }    //end of 跳变沿的第二批条件
//  456       }   //end of 跳变沿的第一批条件
//  457   }// end of 从中间到最左边扫描，隔1个点求差
//  458   
//  459   //1个可疑黑点也没有，则报错。
//  460   if(index == 0)
??BlackGetLeftStep1Edge_4:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??BlackGetLeftStep1Edge_17
//  461   {
//  462     //如果是十字再检测的调用，就不用更新这几个值。
//  463     if(CrossFlag)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??BlackGetLeftStep1Edge_18
//  464     {
//  465       //对3个关键值的实际值清零
//  466       BlackLeftRealClear();
        BL       BlackLeftRealClear
//  467     }
//  468     //该行定位黑线失败，赋无效值
//  469     BlackLeftLoc[row][0] = MaxValUint8;
??BlackGetLeftStep1Edge_18:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable12_5
        MLA      R0,R0,R4,R1
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
//  470     return 0;
        MOVS     R0,#+0
        B.N      ??BlackGetLeftStep1Edge_16
//  471   }
//  472   
//  473   //没有报错，就会走到这里，黑点查找成功，会有1，2，3个黑点
//  474   return 1;
??BlackGetLeftStep1Edge_17:
        MOVS     R0,#+1
??BlackGetLeftStep1Edge_16:
        POP      {R4-R8,PC}       ;; return
//  475 }
//  476 
//  477 
//  478 
//  479 //======================================================================
//  480 //函数名：BlackGetLeftStep2Win
//  481 //功  能：左黑线提取中，第2阶段窗口内跳变检测函数
//  482 //参  数：待处理行号row, 窗口大小win, 预测的跳变点的位置predict
//  483 //返  回：1成功  0失败
//  484 //影  响：BlackLeftLoc[][0]
//  485 //说  明：1. 满足两批条件，才能检测成功。只有一个点的记录。
//  486 //        2. 窗口内没有检测到，则检测失败。
//  487 //        3. 窗缩小可以减少一定的时间，但如果遇到斜率过大的情况，就有可能检测不到。     
//  488 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  489 uint8 BlackGetLeftStep2Win(uint8 row, uint8 win, uint8 predict)
//  490 {
BlackGetLeftStep2Win:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//  491   uint8 col, temp, temp1;
//  492   uint8 abs1;
//  493 
//  494   //在规划好的窗口内，从右往左查找跳变沿
//  495   //防止溢出
//  496   
//  497   //对左边界的限制
//  498   if(predict <= win)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R1,R2
        BCC.N    ??BlackGetLeftStep2Win_0
//  499   {
//  500     temp = 4 + BlackLeftEdgeNum;
        MOVS     R5,#+6
        B.N      ??BlackGetLeftStep2Win_1
//  501   }  
//  502   else
//  503   {
//  504     temp = predict - win;
??BlackGetLeftStep2Win_0:
        SUBS     R5,R2,R1
//  505     if(temp < 4 + BlackLeftEdgeNum)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+6
        BCS.N    ??BlackGetLeftStep2Win_1
//  506     {
//  507       temp = 4 + BlackLeftEdgeNum;
        MOVS     R5,#+6
//  508     }
//  509     else 
//  510     {
//  511     } 
//  512   }
//  513   
//  514   //对右边界的限制
//  515   if(predict + win > CameraRealWidth - 1)
??BlackGetLeftStep2Win_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R0,R1,R2
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+250
        BCC.N    ??BlackGetLeftStep2Win_2
//  516   {
//  517     col = CameraRealWidth - 1;  
        MOVS     R6,#+249
        B.N      ??BlackGetLeftStep2Win_3
//  518   }
//  519   else
//  520   {
//  521     col = predict + win;  
??BlackGetLeftStep2Win_2:
        ADDS     R6,R1,R2
        B.N      ??BlackGetLeftStep2Win_3
//  522   }
//  523   
//  524   //判断条件里的">"很关键，没有写">="是考虑temp = 0的情况，这样可以防止产生负数（uint8中为正数），即无限循环。
//  525   for( ; col > temp; col--) 
??BlackGetLeftStep2Win_4:
        SUBS     R6,R6,#+1
??BlackGetLeftStep2Win_3:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R5,R6
        BCS.W    ??BlackGetLeftStep2Win_5
//  526   {
//  527     abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col-1-BlackLeftEdgeNum]);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R1,[R0, #-3]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R2,??DataTable12_4
        MLA      R0,R0,R4,R2
        LDRB     R0,[R6, R0]
        BL       AbsRe
//  528     if( //跳变沿的第一批条件：
//  529         //黑够黑，白够白，差够大。
//  530         //这里的3个阈值是自适应之后调整的值
//  531           (abs1 > LimitLeftWB) //两者的差够大
//  532         &&(ImgNew[row][col] > LimitLeftW)                     //白点够白
//  533         &&(ImgNew[row][col-1-BlackLeftEdgeNum] < LimitLeftB)                   //黑点够黑
//  534        )
        LDR.W    R1,??DataTable12_6
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCS.N    ??BlackGetLeftStep2Win_4
        LDR.W    R0,??DataTable12_7
        LDRB     R0,[R0, #+0]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable12_4
        MLA      R1,R1,R4,R2
        LDRB     R1,[R6, R1]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_4
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #-3]
        LDR.W    R1,??DataTable12_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_4
//  535     {
//  536           //近处的行，向左3个点仍为黑点
//  537           if(row > BlackMiddleLine)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+31
        BCC.N    ??BlackGetLeftStep2Win_6
//  538           {
//  539             temp1 = (
//  540                       (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB)
//  541                     &&(ImgNew[row][col-3-BlackLeftEdgeNum] < LimitLeftB)
//  542                     &&(ImgNew[row][col-4-BlackLeftEdgeNum] < LimitLeftB)
//  543                     );
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #-4]
        LDR.W    R1,??DataTable12_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_7
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #-5]
        LDR.W    R1,??DataTable12_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_7
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #-6]
        LDR.W    R1,??DataTable12_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_7
        MOVS     R0,#+1
        B.N      ??BlackGetLeftStep2Win_8
??BlackGetLeftStep2Win_7:
        MOVS     R0,#+0
??BlackGetLeftStep2Win_8:
        B.N      ??BlackGetLeftStep2Win_9
//  544           }
//  545           else
//  546           {
//  547             //中间的行 ，向左2个点为仍为黑点
//  548             if(row > BlackFarLine)
??BlackGetLeftStep2Win_6:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+21
        BCC.N    ??BlackGetLeftStep2Win_10
//  549             {
//  550               temp1 = (
//  551                         (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB)
//  552                       &&(ImgNew[row][col-3-BlackLeftEdgeNum] < LimitLeftB)
//  553                       );
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #-4]
        LDR.W    R1,??DataTable12_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_11
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #-5]
        LDR.W    R1,??DataTable12_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_11
        MOVS     R0,#+1
        B.N      ??BlackGetLeftStep2Win_12
??BlackGetLeftStep2Win_11:
        MOVS     R0,#+0
??BlackGetLeftStep2Win_12:
        B.N      ??BlackGetLeftStep2Win_9
//  554             }
//  555             //远处的行 ，向左1个点为仍为黑点
//  556             else
//  557             {
//  558               temp1 = (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB);
??BlackGetLeftStep2Win_10:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_4
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #-4]
        LDR.W    R1,??DataTable12_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_13
        MOVS     R0,#+1
        B.N      ??BlackGetLeftStep2Win_14
??BlackGetLeftStep2Win_13:
        MOVS     R0,#+0
//  559             }
//  560           }
//  561           
//  562           //跳变沿的第二批条件：
//  563           if(temp1)
??BlackGetLeftStep2Win_14:
??BlackGetLeftStep2Win_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.W    ??BlackGetLeftStep2Win_4
//  564           {
//  565             //两批条件均满足，直接记录该点为黑线，返回即可
//  566             BlackLeftLoc[row][0] = col - 1 - BlackLeftEdgeNum;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        SUBS     R1,R6,#+3
        STRB     R1,[R0, #+0]
//  567             return 1;
        MOVS     R0,#+1
        B.N      ??BlackGetLeftStep2Win_15
//  568             //break;          
//  569           }// end of 跳变沿检测的第2批条件
//  570     }// end of 跳变沿检测的第1批条件
//  571     
//  572     
//  573     
//  574   }// end of for循环
//  575   
//  576   //如果一直到窗口最左边还没有找到跳变沿，
//  577   
//  578   BlackLeftLoc[row][0] = MaxValUint8;   //该行的黑线位置记为无效值
??BlackGetLeftStep2Win_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
//  579   return 0;
        MOVS     R0,#+0
??BlackGetLeftStep2Win_15:
        POP      {R4-R6,PC}       ;; return
//  580 
//  581   
//  582 }
//  583 
//  584 
//  585 //======================================================================
//  586 //函数名：BlackGetLeftStep1Scan
//  587 //功  能：左黑线提取中，第1阶段的行扫描函数
//  588 //参  数：扫描起始行FirstLine, 扫描结束行LastLine, 十字再检测标志CrossFlag
//  589 //返  回：0~CameraHight-1行数 255采集失败
//  590 //影  响：BlackLeftRealWB[], BlackLeftRealW[], BlackLeftRealB[], BlackLeftLoc[][],
//  591 //        LimitLeftWB, LimitLeftW, LimitLeftB
//  592 //说  明：1. 可用于正常地第1阶段行扫描，也可用于十字再检测时的行扫描
//  593 //        2. 正常第1阶段扫描时，会更改3个关键阈值的值。
//  594 //             
//  595 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  596 uint8 BlackGetLeftStep1Scan(uint8 FirstLine, uint8 LastLine, uint8 CrossFlag)
//  597 {
BlackGetLeftStep1Scan:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,R2
//  598     uint8 row, temp1, temp2;
//  599     uint8 abs1;
//  600     uint8 tempWB, tempW, tempB;
//  601   //最近的BlackStep1Size行用差值法找黑线
//  602     for(row = FirstLine; row > LastLine; row -= 2)
        B.N      ??BlackGetLeftStep1Scan_0
??BlackGetLeftStep1Scan_1:
        SUBS     R5,R5,#+2
??BlackGetLeftStep1Scan_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R4,R5
        BCS.N    ??BlackGetLeftStep1Scan_2
//  603     {
//  604       //判断是否连续两行检测到跳变，可疑黑点有3个点，暂取其中一个
//  605       temp1 = BlackGetLeftStep1Edge(row, 1, CrossFlag);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetLeftStep1Edge
        MOVS     R7,R0
//  606       temp2 = BlackGetLeftStep1Edge(row-1, 2, CrossFlag);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+2
        SUBS     R0,R5,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetLeftStep1Edge
//  607       if(temp1 && temp2)//这里可以这么写，不用嵌套if，因为&&的特点
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??BlackGetLeftStep1Scan_1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BlackGetLeftStep1Scan_1
//  608       {
//  609         abs1 = AbsRe(BlackLeftLoc[row-1][0], BlackLeftLoc[row][0]);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable12_5
        MLA      R0,R0,R5,R1
        LDRB     R1,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R2,??DataTable12_5
        MLA      R0,R0,R5,R2
        LDRB     R0,[R0, #-3]
        BL       AbsRe
//  610         //进一步判断连续两行的黑点的间隔是否够小，且暂取第1个可疑黑点。
//  611         if(abs1 < BlackLeftStep1ScanMinus)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BCS.N    ??BlackGetLeftStep1Scan_1
//  612         {
//  613           //检测到了连续的黑线，停止差值法找跳变沿，节省时间，下面进入第2阶段
//  614           //如果不是十字再检测的情况，就更新一下实际的3个关键值，否则不更新。
//  615           if(CrossFlag)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??BlackGetLeftStep1Scan_3
//  616             {
//  617               //差值的处理，留有裕度，且有上下界。
//  618               tempWB = (BlackLeftRealWB[0] + BlackLeftRealWB[1]) / 2 - LimitLeftWBMargin; 
        LDR.W    R0,??DataTable12_1
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable12_1
        LDRB     R1,[R1, #+1]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        SUBS     R0,R0,#+20
//  619               if(tempWB < LimitLeftWBMin) tempWB = LimitLeftWBMin;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+75
        BCS.N    ??BlackGetLeftStep1Scan_4
        MOVS     R0,#+75
        B.N      ??BlackGetLeftStep1Scan_5
//  620               else if(tempWB > LimitLeftWBMax) tempWB = LimitLeftWBMax;
??BlackGetLeftStep1Scan_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+106
        BCC.N    ??BlackGetLeftStep1Scan_5
        MOVS     R0,#+105
//  621               else ;
//  622               LimitLeftWB = tempWB;
??BlackGetLeftStep1Scan_5:
        LDR.W    R1,??DataTable12_6
        STRB     R0,[R1, #+0]
//  623               
//  624               //白点的处理，留有裕度，且有上下界。
//  625               tempW = (BlackLeftRealW[0] + BlackLeftRealW[1]) / 2 - LimitLeftWMargin;
        LDR.W    R0,??DataTable12_2
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable12_2
        LDRB     R1,[R1, #+1]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        SUBS     R0,R0,#+30
//  626               if(tempW < LimitLeftWMin) tempW = LimitLeftWMin;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+150
        BCS.N    ??BlackGetLeftStep1Scan_6
        MOVS     R0,#+150
        B.N      ??BlackGetLeftStep1Scan_7
//  627               else if(tempW > LimitLeftWMax) tempW = LimitLeftWMax;
??BlackGetLeftStep1Scan_6:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+201
        BCC.N    ??BlackGetLeftStep1Scan_7
        MOVS     R0,#+200
//  628               else ;
//  629               LimitLeftW = tempW;
??BlackGetLeftStep1Scan_7:
        LDR.W    R1,??DataTable12_7
        STRB     R0,[R1, #+0]
//  630               
//  631               //黑点的处理，留有裕度，且有上下界。
//  632               tempB = (BlackLeftRealB[0] + BlackLeftRealB[1]) / 2 + LimitLeftBMargin;
        LDR.W    R0,??DataTable12_3
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable12_3
        LDRB     R1,[R1, #+1]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+30
//  633               if(tempB < LimitLeftBMin) tempB = LimitLeftBMin;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+85
        BCS.N    ??BlackGetLeftStep1Scan_8
        MOVS     R0,#+85
        B.N      ??BlackGetLeftStep1Scan_9
//  634               else if(tempB > LimitLeftBMax) tempB = LimitLeftBMax;
??BlackGetLeftStep1Scan_8:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+101
        BCC.N    ??BlackGetLeftStep1Scan_9
        MOVS     R0,#+100
//  635               else ;
//  636               LimitLeftB = tempB;
??BlackGetLeftStep1Scan_9:
        LDR.W    R1,??DataTable12_8
        STRB     R0,[R1, #+0]
//  637             }
//  638           break;
//  639         }
//  640       }      
//  641     }   
//  642     
//  643     //检测了BlackStep1Size行也没有检测到连续的黑线，说明黑线检测失败
//  644     if(row <= LastLine)
??BlackGetLeftStep1Scan_3:
??BlackGetLeftStep1Scan_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R4,R5
        BCC.N    ??BlackGetLeftStep1Scan_10
//  645       return MaxValUint8;
        MOVS     R0,#+255
        B.N      ??BlackGetLeftStep1Scan_11
//  646     else 
//  647       return row;
??BlackGetLeftStep1Scan_10:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??BlackGetLeftStep1Scan_11:
        POP      {R1,R4-R7,PC}    ;; return
//  648   
//  649 }
//  650 
//  651 //======================================================================
//  652 //函数名：BlackLeftCrossStep3
//  653 //功  能：左线提取中，十字检测第3阶段，脑补线函数
//  654 //参  数：第1段有效黑线的最后一行FirstLine， 第2段有效黑线的第一行LastLine
//  655 //返  回：1成功 0失败
//  656 //影  响：BlackLeftLoc[][0]
//  657 //说  明：1. 这里有一些浮点运算，会占时间，在调用本函数时要慎重，尽量不要用。
//  658 //        2. 这里的两点间连线的思路很不错，float强转和uint8强转用得很好。
//  659 //             
//  660 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  661 uint8 BlackLeftCrossStep3(uint8 FirstLine, uint8 LastLine)
//  662 {
BlackLeftCrossStep3:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R7,R1
//  663   float delta_x, delta_y, delta, index;
//  664   uint8 row, temp1, temp2;
//  665   //uint8 temp3, temp4, flag1, flag2;
//  666   
//  667   //超始行比结束行还高，报错！
//  668   if(LastLine >= FirstLine)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R7,R4
        BCC.N    ??BlackLeftCrossStep3_0
//  669   {
//  670     uart_sendN(UART0, (uint8 *)"\nError In BlackLeftCrossStep3!", 30);
        MOVS     R2,#+30
        LDR.W    R1,??DataTable15
        LDR.W    R0,??DataTable12  ;; 0x4006a000
        BL       uart_sendN
//  671     return 0;  
        MOVS     R0,#+0
        B.N      ??BlackLeftCrossStep3_1
//  672   }
//  673   
//  674   temp1 = BlackLeftLoc[FirstLine][0];
??BlackLeftCrossStep3_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        LDRB     R5,[R0, #+0]
//  675   temp2 = BlackLeftLoc[LastLine][0];
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R7,R1
        LDRB     R8,[R0, #+0]
//  676   
//  677   /*
//  678   flag = 1;
//  679   flag = 2;
//  680   //确认这两个点是直角处的点，也就是往左6个点仍为黑点
//  681   if(temp1 <= (CameraRealWidth - 9))
//  682   {
//  683     temp3 = (
//  684             (ImgNew[FirstLine+1][temp1+6] < LimitLeftB)
//  685           &&(ImgNew[FirstLine+1][temp1+7] < LimitLeftB)
//  686           &&(ImgNew[FirstLine+1][temp1+8] < LimitLeftB)
//  687           );
//  688     if(temp3)
//  689     {
//  690       flag1 = 0;  
//  691     }
//  692   }
//  693   
//  694   if(temp2 <= (CameraRealWidth - 9))
//  695   {
//  696     temp4 = (
//  697             (ImgNew[LastLine-1][temp2+6] < LimitLeftB)
//  698           &&(ImgNew[LastLine-1][temp2+7] < LimitLeftB)
//  699           &&(ImgNew[LastLine-1][temp2+8] < LimitLeftB)
//  700           );
//  701     if(temp4)
//  702     {
//  703       flag2 = 0;  
//  704     }
//  705   }
//  706   
//  707   if((flag1 == 0) || (flag2 == 0))
//  708   {
//  709     return 0;  
//  710   }
//  711   
//  712   */
//  713   
//  714   delta_y = FirstLine - LastLine;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        SUBS     R0,R4,R7
        BL       __aeabi_i2f
        MOVS     R6,R0
//  715   
//  716   
//  717   //斜率向右
//  718   if(temp1 < temp2)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R5,R8
        BCS.N    ??BlackLeftCrossStep3_2
//  719   {
//  720     delta_x = temp2 - temp1;
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        SUBS     R0,R8,R5
        BL       __aeabi_i2f
//  721     delta = delta_x / delta_y; //这是1个浮点数
        MOVS     R1,R6
        BL       __aeabi_fdiv
        MOVS     R5,R0
//  722     
//  723     index = 1.0;
        MOVS     R8,#+1065353216
//  724     for(row = FirstLine - 1; row >= LastLine + 1; row-- )
        SUBS     R6,R4,#+1
??BlackLeftCrossStep3_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADDS     R0,R7,#+1
        CMP      R6,R0
        BLT.N    ??BlackLeftCrossStep3_4
//  725     {
//  726       //每次右移一点点
//  727       BlackLeftLoc[row][0] = (uint8)((float)BlackLeftLoc[FirstLine][0] + delta * index);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOV      R9,R0
        MOVS     R0,R5
        MOV      R1,R8
        BL       __aeabi_fmul
        MOV      R1,R9
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable14
        MLA      R1,R1,R6,R2
        STRB     R0,[R1, #+0]
//  728       index += 1.0;
        MOV      R0,R8
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10  ;; 0x3ff00000
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        MOV      R8,R0
//  729     }
        SUBS     R6,R6,#+1
        B.N      ??BlackLeftCrossStep3_3
//  730   }
//  731   //斜率向左
//  732   else if(temp1 > temp2)
??BlackLeftCrossStep3_2:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R8,R5
        BCS.N    ??BlackLeftCrossStep3_5
//  733   {
//  734     delta_x = temp1 - temp2;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        SUBS     R0,R5,R8
        BL       __aeabi_i2f
//  735     delta = delta_x / delta_y;
        MOVS     R1,R6
        BL       __aeabi_fdiv
        MOVS     R5,R0
//  736     
//  737     index = 1.0;
        MOVS     R8,#+1065353216
//  738     for(row = FirstLine - 1; row >= LastLine + 1; row-- )
        SUBS     R6,R4,#+1
??BlackLeftCrossStep3_6:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADDS     R0,R7,#+1
        CMP      R6,R0
        BLT.N    ??BlackLeftCrossStep3_4
//  739     {
//  740       //每次右移一点点
//  741       BlackLeftLoc[row][0] = (uint8)((float)BlackLeftLoc[FirstLine][0] - delta * index);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOV      R9,R0
        MOVS     R0,R5
        MOV      R1,R8
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R9
        BL       __aeabi_fsub
        BL       __aeabi_f2iz
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable14
        MLA      R1,R1,R6,R2
        STRB     R0,[R1, #+0]
//  742       index += 1.0;
        MOV      R0,R8
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10  ;; 0x3ff00000
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        MOV      R8,R0
//  743     }
        SUBS     R6,R6,#+1
        B.N      ??BlackLeftCrossStep3_6
//  744   }
//  745   //斜率直走，这个不太可能出现
//  746   else
//  747   {
//  748     for(row = FirstLine - 1; row >= LastLine + 1; row-- )
??BlackLeftCrossStep3_5:
        SUBS     R6,R4,#+1
        B.N      ??BlackLeftCrossStep3_7
//  749     {
//  750       //赋相同的值
//  751       BlackLeftLoc[row][0] = temp1;
??BlackLeftCrossStep3_8:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R6,R1
        STRB     R5,[R0, #+0]
//  752     }
        SUBS     R6,R6,#+1
??BlackLeftCrossStep3_7:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADDS     R0,R7,#+1
        CMP      R6,R0
        BGE.N    ??BlackLeftCrossStep3_8
//  753   }
//  754   
//  755   return 1;
??BlackLeftCrossStep3_4:
        MOVS     R0,#+1
??BlackLeftCrossStep3_1:
        POP      {R1,R4-R9,PC}    ;; return
//  756     
//  757 }
//  758 
//  759 //======================================================================
//  760 //函数名：BlackLeftCrossConfirm
//  761 //功  能：十字再检测时 ，线头有效性的确认。
//  762 //参  数：第1段黑线的真实结束行Row1RealLastLine，第2段黑线的真实起始行Row2RealFirstLine
//  763 //返  回：1成功 0失败
//  764 //影  响：无
//  765 //说  明：1. 为了应对270度弯道十字误检测而诞生，编写过程中没有过多考虑其它情况。
//  766 //      
//  767 //             
//  768 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  769 uint8 BlackLeftCrossConfirm(uint8 Row1RealLastLine, uint8 Row2RealFirstLine)
//  770 {
BlackLeftCrossConfirm:
        PUSH     {R2-R6,LR}
        MOVS     R4,R1
//  771   uint8 row, index;
//  772   uint8 x[BlackCrossConfirmNum];
//  773   uint8 y[BlackCrossConfirmNum];
//  774   
//  775   float a0, a1, temp;
//  776   
//  777   //第一段黑线太短，无法检测正确性。直接返回1.
//  778   if(Row1RealLastLine < 5) return 1;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BCS.N    ??BlackLeftCrossConfirm_0
        MOVS     R0,#+1
        B.N      ??BlackLeftCrossConfirm_1
//  779   
//  780   //以左上角为原点，向下为x轴正方向（0~49），向右为y轴正方向(0~249)
//  781   index = 0;
??BlackLeftCrossConfirm_0:
        MOVS     R1,#+0
//  782   for(row = Row1RealLastLine; ; row++)
        B.N      ??BlackLeftCrossConfirm_2
??BlackLeftCrossConfirm_3:
        ADDS     R0,R0,#+1
//  783   {
//  784     //有效行的记录
//  785     if(BlackLeftLoc[row][0] != MaxValUint8)
??BlackLeftCrossConfirm_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable12_5
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        CMP      R2,#+255
        BEQ.N    ??BlackLeftCrossConfirm_4
//  786     {
//  787       y[index] = BlackLeftLoc[row][0];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable12_5
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R3,SP,#+0
        STRB     R2,[R1, R3]
//  788       x[index] = row;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R2,SP,#+4
        STRB     R0,[R1, R2]
//  789       index++;
        ADDS     R1,R1,#+1
//  790     }
//  791     //点数够多，则跳出。
//  792     if(index == BlackCrossConfirmNum) break;
??BlackLeftCrossConfirm_4:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+3
        BNE.N    ??BlackLeftCrossConfirm_5
//  793     //直到最低行仍没有凑够足够的点数，说明第一段有效黑线太短，无法检测正确性，直接返回1.
//  794     if(row == CameraHight - 1) return 1;
//  795   }
//  796   
//  797   //最小二乘法
//  798   //y = a0 + a1 * x
//  799   a1 = LeastSquarea1(x, y, BlackCrossConfirmNum);
        MOVS     R2,#+3
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea1
        MOVS     R6,R0
//  800   a0 = LeastSquarea0(x, y, a1, BlackCrossConfirmNum);
        MOVS     R3,#+3
        MOVS     R2,R6
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea0
        MOVS     R5,R0
//  801   
//  802   //temp为第2段黑线起始行本应该在的位置。
//  803   temp = a0 + a1 * Row2RealFirstLine;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        BL       __aeabi_ui2f
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
//  804   //如果这个位置本来就超出了左右边界的范围，那说明不可能有第2段黑线存在了。
//  805   //也就不用检测第2段黑线了，直接返回0.
//  806   if((temp < 0) || (temp > CameraRealWidth - 1)) 
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCC.N    ??BlackLeftCrossConfirm_6
        LDR.W    R1,??DataTable17  ;; 0x43790001
        BL       __aeabi_cfrcmple
        BHI.N    ??BlackLeftCrossConfirm_7
//  807   {
//  808     return 0;
??BlackLeftCrossConfirm_6:
        MOVS     R0,#+0
        B.N      ??BlackLeftCrossConfirm_1
//  809   }
??BlackLeftCrossConfirm_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??BlackLeftCrossConfirm_3
        MOVS     R0,#+1
        B.N      ??BlackLeftCrossConfirm_1
//  810   else
//  811   { //这里本来应该加上把这个点限定在窗内，但是似乎没必要。
//  812     //if(
//  813     //  (BlackLeftLoc[Row2RealFirstLine][0] > temp - BlackCrossConfirmWin) 
//  814     //&&(BlackLeftLoc[Row2RealFirstLine][0] < temp + BlackCrossConfirmWin)
//  815     //  )
//  816     return 1;
??BlackLeftCrossConfirm_7:
        MOVS     R0,#+1
??BlackLeftCrossConfirm_1:
        POP      {R1,R2,R4-R6,PC}  ;; return
//  817   }  
//  818 }
//  819 
//  820 
//  821 
//  822 //======================================================================
//  823 //函数名：BlackLeftAgainForCross
//  824 //功  能：左黑线提取中，针对十字的再检测程序
//  825 //参  数：第2段黑线的预测起始行Row2FirstLine， 第2段黑线的预测结束行Row2LastLine，
//  826 //        第1段黑线的实际结束行Row1RealLastLine
//  827 //返  回：1成功 0失败
//  828 //影  响：BlackLeftLoc[][]。 （不会影响那几个阈值。）
//  829 //说  明：1. 本函数会调用浮点运算的函数，预计花费较多时间，调用入口需谨慎。
//  830 //        2. 本函数仅影响了BlackLeftLoc[][]，以后也应该保持。
//  831 //             
//  832 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  833 uint8 BlackLeftAgainForCross(uint8 Row2FirstLine, uint8 Row2LastLine, uint8 Row1RealLastLine)
//  834 {
BlackLeftAgainForCross:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  835     uint8 row, temp, temp1, temp2;
//  836     uint8 Row2RealFirstLine; //第2段黑线的真实起始行
//  837     uint8 i;
//  838     
//  839     //十字再检测第1阶段，找线头。
//  840     temp = BlackGetLeftStep1Scan(Row2FirstLine, Row2LastLine, 0); //第3个参数0表示是十字再检测，不用更新3个关键值
        MOVS     R2,#+0
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetLeftStep1Scan
        MOV      R8,R0
//  841     if(temp == MaxValUint8)  
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+255
        BNE.N    ??BlackLeftAgainForCross_0
//  842     {
//  843       //扫屁股工作。       //i >= Row2LastLine
//  844       for(i = Row2FirstLine; ; i--)
        B.N      ??BlackLeftAgainForCross_1
??BlackLeftAgainForCross_2:
        SUBS     R4,R4,#+1
//  845       {
//  846         BlackLeftLoc[i][0] = MaxValUint8;
??BlackLeftAgainForCross_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
//  847         if(i == 0) break;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??BlackLeftAgainForCross_2
//  848       }
//  849       return 0;  
        MOVS     R0,#+0
        B.N      ??BlackLeftAgainForCross_3
//  850     }
//  851     else 
//  852     {
//  853       ////////////////如果要注释，就从这里开始注释
//  854       //十字再检测的线头不在限定的范围内，认为是干扰点，不用顺着线头找线了，直接退出。
//  855       if(!BlackLeftCrossConfirm(Row1RealLastLine, temp))
??BlackLeftAgainForCross_0:
        MOV      R1,R8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackLeftCrossConfirm
        CMP      R0,#+0
        BNE.N    ??BlackLeftAgainForCross_4
//  856       { //扫屁股工作。       //i >= (temp-1)
//  857         for(i = Row2FirstLine; ; i--)
        B.N      ??BlackLeftAgainForCross_5
??BlackLeftAgainForCross_6:
        SUBS     R4,R4,#+1
//  858         {
//  859           BlackLeftLoc[i][0] = MaxValUint8;
??BlackLeftAgainForCross_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
//  860           if(i == 0) break;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??BlackLeftAgainForCross_6
//  861         }
//  862         return 0;
        MOVS     R0,#+0
        B.N      ??BlackLeftAgainForCross_3
//  863       }
//  864       //十字再检测的线头的确在限定的范围内，可以继续。
//  865       else
//  866       {
//  867       row = temp;
??BlackLeftAgainForCross_4:
        MOV      R4,R8
//  868       }
//  869       ////////////////如果要注释，就从这里结束注释
//  870       
//  871       //暂时不用confirm函数，如果要用的话 ，就把后面这句话去掉，前面注释去掉。
//  872       //row = temp;
//  873     }
//  874     
//  875     Row2RealFirstLine = row; //记录第2段黑线的真实起始行
        MOVS     R7,R4
//  876     
//  877     //十字再检测第2阶段，顺着线头找线。
//  878     //temp为预测的黑点位置
//  879     temp = BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0];
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #-3]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable14
        MLA      R1,R1,R4,R2
        LDRB     R1,[R1, #-3]
        ADDS     R0,R1,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable14
        MLA      R1,R1,R4,R2
        LDRB     R1,[R1, #+0]
        SUBS     R8,R0,R1
//  880     //从最近的认证行到取最远的行
//  881     for(row -= 2; ; row -= 2)
        SUBS     R4,R4,#+2
        B.N      ??BlackLeftAgainForCross_7
??BlackLeftAgainForCross_8:
        SUBS     R4,R4,#+2
//  882     {
//  883       //如果连续两行的黑点检测成功，则更新预测点的位置
//  884       temp1 = BlackGetLeftStep2Win(row, BlackLeftWinVal, temp);
??BlackLeftAgainForCross_7:
        MOV      R2,R8
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetLeftStep2Win
        MOV      R9,R0
//  885       temp2 = BlackGetLeftStep2Win(row-1, BlackLeftWinVal, temp);
        MOV      R2,R8
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        SUBS     R0,R4,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetLeftStep2Win
//  886       if(temp1 && temp2) 
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??BlackLeftAgainForCross_9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BlackLeftAgainForCross_9
//  887       {
//  888         temp = BlackLeftLoc[row - 1][0] + BlackLeftLoc[row - 1][0] - BlackLeftLoc[row][0];
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #-3]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable14
        MLA      R1,R1,R4,R2
        LDRB     R1,[R1, #-3]
        ADDS     R0,R1,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable14
        MLA      R1,R1,R4,R2
        LDRB     R1,[R1, #+0]
        SUBS     R8,R0,R1
//  889       }
//  890       //如果没能连续两行检测黑点成功，则不更新预测点位置，采用原位置。
//  891       else
//  892       {
//  893       }       
//  894       
//  895       if((row == Row2LastLine) || (row == Row2LastLine+1)) break;      
??BlackLeftAgainForCross_9:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R4,R5
        BEQ.N    ??BlackLeftAgainForCross_10
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,#+1
        CMP      R4,R0
        BNE.N    ??BlackLeftAgainForCross_8
//  896     }
//  897     
//  898      //十字再检测第3阶段，脑补两段线的接线。
//  899     if(!BlackLeftCrossStep3(Row1RealLastLine, Row2RealFirstLine))
??BlackLeftAgainForCross_10:
        MOVS     R1,R7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackLeftCrossStep3
        CMP      R0,#+0
        BNE.N    ??BlackLeftAgainForCross_11
//  900     {
//  901       return 0;
        MOVS     R0,#+0
        B.N      ??BlackLeftAgainForCross_3
//  902     }
//  903     
//  904     return 1;
??BlackLeftAgainForCross_11:
        MOVS     R0,#+1
??BlackLeftAgainForCross_3:
        POP      {R1,R4-R9,PC}    ;; return
//  905         
//  906 }
//  907 
//  908 //======================================================================
//  909 //函数名：BlackLeftStep4BackLine
//  910 //功  能：左黑线提取中，第4阶段十字向后补线函数。
//  911 //参  数：Step4StartLine开始行
//  912 //返  回：1成功 0失败
//  913 //影  响：BlackLeftLoc[][0]
//  914 //说  明：1. 这里引用了float型的函数，有可能占用较长的时间。
//  915 //        2. 想要减少时间，可以把宏定义BlackBackLineNum减至3或者2.
//  916 //             
//  917 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  918 uint8 BlackLeftStep4BackLine(uint8 Step4StartLine)
//  919 {
BlackLeftStep4BackLine:
        PUSH     {R2-R6,LR}
        MOVS     R4,R0
//  920   uint8 row;
//  921   uint8 i, index;
//  922   uint8 x[BlackBackLineNum];   //取多少个点在一开始有定义。
//  923   uint8 y[BlackBackLineNum];
//  924   uint8 j;
//  925   
//  926   float temp;
//  927   float a0, a1;
//  928   
//  929   //取BlackBackLineNum个点作为最小二乘法的基准点。
//  930   //以左上角为原点，向下为x轴正方向，向右为y轴正方向
//  931   index = 0;
        MOVS     R1,#+0
//  932   for(i = Step4StartLine; ; i--)
        MOVS     R0,R4
        B.N      ??BlackLeftStep4BackLine_0
??BlackLeftStep4BackLine_1:
        SUBS     R0,R0,#+1
//  933   {
//  934     if(BlackLeftLoc[i][0] != MaxValUint8)
??BlackLeftStep4BackLine_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable14
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        CMP      R2,#+255
        BEQ.N    ??BlackLeftStep4BackLine_2
//  935     {
//  936       y[index] = BlackLeftLoc[i][0];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable14
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R3,SP,#+0
        STRB     R2,[R1, R3]
//  937       x[index] = i;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R2,SP,#+4
        STRB     R0,[R1, R2]
//  938       index++;
        ADDS     R1,R1,#+1
//  939     }
//  940     if(index == BlackBackLineNum)
??BlackLeftStep4BackLine_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+4
        BNE.N    ??BlackLeftStep4BackLine_3
//  941     {
//  942       break;  
//  943     }
//  944     if(i == 0)
//  945     {
//  946       return 0;
//  947     }
//  948   }
//  949   
//  950   //最小二乘法
//  951   //y = a0 + a1 * x
//  952   a1 = LeastSquarea1(x, y, BlackBackLineNum);
        MOVS     R2,#+4
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea1
        MOVS     R6,R0
//  953   a0 = LeastSquarea0(x, y, a1, BlackBackLineNum);
        MOVS     R3,#+4
        MOVS     R2,R6
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea0
        MOVS     R5,R0
//  954   
//  955   for(row = Step4StartLine + 1; row <= CameraHight - 1; row++)
        ADDS     R4,R4,#+1
        B.N      ??BlackLeftStep4BackLine_4
??BlackLeftStep4BackLine_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??BlackLeftStep4BackLine_1
        MOVS     R0,#+0
        B.N      ??BlackLeftStep4BackLine_5
//  956   {
//  957     //补线也有个度，向左向右都不能补出范围。
//  958     temp = a0 + a1 * row;
//  959     if(temp >= CameraRealWidth)
//  960     {
//  961       //BlackLeftLoc[row][0] = CameraRealWidth - 1;
//  962       //超过左右界限时，原策略为置边界值，现在的策略是从该行起置无效值。
//  963       for(j = row; ; j++)
//  964       {
//  965         BlackLeftLoc[row][0] = MaxValUint8;
//  966         if(j == CameraHight - 1) break;
//  967       }
//  968       break;
//  969     }
//  970     else if(temp <= 0)
//  971     {
//  972       //BlackLeftLoc[row][0] = 0;
//  973       //超过左右界限时，原策略为置边界值，现在的策略是从该行起置无效值。
//  974       for(j = row; ; j++)
//  975       {
//  976         BlackLeftLoc[row][0] = MaxValUint8;
//  977         if(j == CameraHight - 1) break;
//  978       }
//  979       break;
//  980     }
//  981     else
//  982     {
//  983       BlackLeftLoc[row][0] = (uint8)(temp); 
??BlackLeftStep4BackLine_6:
        BL       __aeabi_f2iz
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable14
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  984     }
        ADDS     R4,R4,#+1
??BlackLeftStep4BackLine_4:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+50
        BCS.N    ??BlackLeftStep4BackLine_7
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        BL       __aeabi_ui2f
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable18  ;; 0x437a0000
        BL       __aeabi_cfrcmple
        BHI.N    ??BlackLeftStep4BackLine_8
        MOVS     R0,R4
        B.N      ??BlackLeftStep4BackLine_9
??BlackLeftStep4BackLine_10:
        ADDS     R0,R0,#+1
??BlackLeftStep4BackLine_9:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable14
        MLA      R1,R1,R4,R2
        MOVS     R2,#+255
        STRB     R2,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??BlackLeftStep4BackLine_10
        B.N      ??BlackLeftStep4BackLine_7
??BlackLeftStep4BackLine_8:
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BHI.N    ??BlackLeftStep4BackLine_6
        MOVS     R0,R4
        B.N      ??BlackLeftStep4BackLine_11
??BlackLeftStep4BackLine_12:
        ADDS     R0,R0,#+1
??BlackLeftStep4BackLine_11:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable14
        MLA      R1,R1,R4,R2
        MOVS     R2,#+255
        STRB     R2,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??BlackLeftStep4BackLine_12
//  985   }
//  986   
//  987   return 1;
??BlackLeftStep4BackLine_7:
        MOVS     R0,#+1
??BlackLeftStep4BackLine_5:
        POP      {R1,R2,R4-R6,PC}  ;; return
//  988   
//  989 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x3ff00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     `?<Constant {0, 255, 1, 255}>`
//  990 
//  991 
//  992 
//  993 
//  994 //======================================================================
//  995 //函数名：BlackGetLeft
//  996 //功  能：左黑线提取算法
//  997 //参  数：无
//  998 //返  回：1成功 0失败
//  999 //影  响：BlackLeftCrossDone，BlackLeftLoc[][],
// 1000 //        BlackLeftRealWB[], BlackLeftRealW[], BlackLeftRealB[],
// 1001 //        LimitLeftWB, LimitLeftW, LimitLeftB
// 1002 //说  明：1. 暂时可以处理直道，弯道，十字路口3种情况。2014.11.10
// 1003 //      
// 1004 //             
// 1005 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1006 uint8 BlackGetLeft(void)
// 1007 {
BlackGetLeft:
        PUSH     {R3-R11,LR}
// 1008     uint8 row, temp, temp1, temp2, temp3, i;
// 1009     uint8 GapCount, Row1RealLastLine, index;
// 1010     uint8 Step4Flag, Step4StartLine;  
// 1011     
// 1012     //第4阶段进入标志。
// 1013     Step4Flag = 0;
        MOVS     R5,#+0
// 1014     //默认十字检测标志置为未进入。
// 1015     BlackLeftCrossDone = 0;    
        LDR.W    R0,??DataTable19
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 1016     
// 1017     //第1阶段。这1阶段有可能会返回黑线提取失败
// 1018     temp = BlackGetLeftStep1Scan(CameraHight - 1, CameraHight - BlackStep1Size - 1, 1);
        MOVS     R2,#+1
        MOVS     R1,#+14
        MOVS     R0,#+49
        BL       BlackGetLeftStep1Scan
        MOVS     R7,R0
// 1019     if(temp == MaxValUint8)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+255
        BNE.N    ??BlackGetLeft_0
// 1020     {
// 1021       return 0;
        MOVS     R0,#+0
        B.N      ??BlackGetLeft_1
// 1022     }    
// 1023     else 
// 1024     {
// 1025       row = temp;
??BlackGetLeft_0:
        MOV      R10,R7
// 1026       //如果起始线头的位置非常高，就认为是十字的前两个角，需要进入第4阶段向后补线。    
// 1027       if(row < CameraHight - BlackLeftBackLineStart)
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+42
        BCS.N    ??BlackGetLeft_2
// 1028       {
// 1029         Step4Flag = 1;
        MOVS     R5,#+1
// 1030         Step4StartLine = row;
        MOV      R6,R10
// 1031       }
// 1032     }
// 1033     
// 1034     //第2阶段。到了这一阶段，已经不会返回黑线提取失败 
// 1035     //下面开始利用斜率找黑点。
// 1036     //上次已经处理完了第row-1行，下一次要处理第row-2行
// 1037     //BlackLeftSlope();
// 1038     
// 1039     //temp为预测的黑点位置
// 1040 
// 1041     //对预测值的大小限定
// 1042     if((BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0]) < 0)
??BlackGetLeft_2:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable12_5
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_5
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_5
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+0
        BPL.N    ??BlackGetLeft_3
// 1043     {
// 1044       temp = 0;
        MOVS     R7,#+0
        B.N      ??BlackGetLeft_4
// 1045     }
// 1046     else if((BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0]) >= CameraRealWidth)
??BlackGetLeft_3:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable12_5
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_5
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_5
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+250
        BLT.N    ??BlackGetLeft_5
// 1047     {
// 1048       temp = CameraRealWidth - 1;
        MOVS     R7,#+249
        B.N      ??BlackGetLeft_4
// 1049     }
// 1050     else
// 1051     {
// 1052       temp = BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0];  
??BlackGetLeft_5:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable12_5
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_5
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        ADDS     R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_5
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R7,R0,R1
// 1053     }
// 1054 
// 1055     index = 0;
??BlackGetLeft_4:
        MOVS     R8,#+0
// 1056     
// 1057     GapCount = 0;  //连续多少行没有采集到黑线
        MOVS     R9,#+0
// 1058     //从最近的认证行到取最远的行
// 1059     for(row -= 2; ; row -= 2)
        SUBS     R10,R10,#+2
        B.N      ??BlackGetLeft_6
??BlackGetLeft_7:
        SUBS     R10,R10,#+2
// 1060     {
// 1061       //如果连续两行的黑点检测成功，则更新预测点的位置
// 1062       temp1 = BlackGetLeftStep2Win(row, BlackLeftWinVal, temp);
??BlackGetLeft_6:
        MOVS     R2,R7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        MOV      R0,R10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetLeftStep2Win
        MOV      R11,R0
// 1063       temp2 = BlackGetLeftStep2Win(row-1, BlackLeftWinVal, temp);
        MOVS     R2,R7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        SUBS     R0,R10,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetLeftStep2Win
// 1064       temp3 = (
// 1065               (!temp1)
// 1066             &&(!temp2)
// 1067             &&(!Step4Flag)
// 1068               );
        ORRS     R1,R0,R11
        ORRS     R1,R5,R1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??BlackGetLeft_8
        MOVS     R1,#+1
        B.N      ??BlackGetLeft_9
??BlackGetLeft_8:
        MOVS     R1,#+0
// 1069       if(temp1 && temp2) 
??BlackGetLeft_9:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+0
        BEQ.N    ??BlackGetLeft_10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BlackGetLeft_10
// 1070       {   //对预测值的大小限定
// 1071           if((BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0]) < 0)
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable12_5
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_5
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_5
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+0
        BPL.N    ??BlackGetLeft_11
// 1072           {
// 1073             temp = 0;
        MOVS     R7,#+0
        B.N      ??BlackGetLeft_12
// 1074           }
// 1075           else if((BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0]) >= CameraRealWidth)
??BlackGetLeft_11:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable12_5
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_5
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_5
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+250
        BLT.N    ??BlackGetLeft_13
// 1076           {
// 1077             temp = CameraRealWidth - 1;
        MOVS     R7,#+249
        B.N      ??BlackGetLeft_12
// 1078           }
// 1079           else
// 1080           {
// 1081             temp = BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0];  
??BlackGetLeft_13:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable12_5
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_5
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        ADDS     R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_5
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R7,R0,R1
        B.N      ??BlackGetLeft_12
// 1082           }
// 1083       }
// 1084       //如果没能连续两行检测黑点成功，则不更新预测点位置，采用原位置。
// 1085       //如果连续两行均采集黑线失败，则记数，记到一定值就再来一次Step1
// 1086       //如果第4阶段检测标志置位，就不用进入十字检测了。
// 1087       else if(temp3)
??BlackGetLeft_10:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??BlackGetLeft_12
// 1088       {       
// 1089         //Row1RealLastLine记录第1段黑线的最后一行。
// 1090         if(index == 0)
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??BlackGetLeft_14
// 1091         {
// 1092           //进来一次后，就再也不会进来了。
// 1093           index++;
        ADDS     R8,R8,#+1
// 1094           for(i = row; i < (row + 5); i++)
        MOV      R0,R10
        B.N      ??BlackGetLeft_15
??BlackGetLeft_16:
        ADDS     R0,R0,#+1
??BlackGetLeft_15:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        ADDS     R1,R10,#+5
        CMP      R0,R1
        BGE.N    ??BlackGetLeft_17
// 1095           {
// 1096             if(BlackLeftLoc[i][0] != MaxValUint8)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_5
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??BlackGetLeft_16
// 1097             {
// 1098               Row1RealLastLine = i;
        MOVS     R4,R0
// 1099               break;
// 1100             }
// 1101           }
// 1102           if(Row1RealLastLine >= CameraHight - 1)
??BlackGetLeft_17:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+49
        BCC.N    ??BlackGetLeft_14
// 1103           {
// 1104             Row1RealLastLine = CameraHight - 1;
        MOVS     R4,#+49
// 1105           }
// 1106           else
// 1107           {
// 1108           }
// 1109         }
// 1110         
// 1111         GapCount += 2;
??BlackGetLeft_14:
        ADDS     R9,R9,#+2
// 1112         ///////////////////////////////进入十字重新检测的条件还要再严格一些，减少没必要的时间，比如说前面最多只允许检测到多少行。
// 1113         if(GapCount > BlackCrossGapLine)
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+11
        BCC.N    ??BlackGetLeft_18
// 1114         {
// 1115           //再检测时的行太远了，就没必要检测了。
// 1116           if(row < BlackLeftCrossTooLowLine)
        LDR.W    R0,??DataTable19_1
        LDRB     R0,[R0, #+0]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,R0
        BCC.N    ??BlackGetLeft_19
// 1117           {
// 1118             break;
// 1119           }
// 1120           else
// 1121           {
// 1122           }
// 1123           
// 1124           //这个的行怎么取？？？？？？？？？？？？？？？
// 1125           if(!BlackLeftAgainForCross(row - 2, 1, Row1RealLastLine))
??BlackGetLeft_20:
        MOVS     R2,R4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+1
        SUBS     R0,R10,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackLeftAgainForCross
        CMP      R0,#+0
        BNE.N    ??BlackGetLeft_21
// 1126           {
// 1127             BlackLeftCrossDone = 1;  //十字检测失败           
        LDR.W    R0,??DataTable19
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        B.N      ??BlackGetLeft_22
// 1128           }
// 1129           else
// 1130           {
// 1131             BlackLeftCrossDone = 2;  //十字检测成功
??BlackGetLeft_21:
        LDR.W    R0,??DataTable19
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
// 1132           }
// 1133           break;  //十字再检测里会开窗检测到指定的最后一行，所以不用再循环了，直接跳出
??BlackGetLeft_22:
        B.N      ??BlackGetLeft_19
// 1134           
// 1135         }
// 1136         else
// 1137         {
// 1138           BlackLeftCrossDone = 0;   //十字检测未进入
??BlackGetLeft_18:
        LDR.W    R0,??DataTable19
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 1139         }
// 1140       }
// 1141       else
// 1142       {        
// 1143       }
// 1144       
// 1145       
// 1146       if((row == 0) || (row == 1)) break;
??BlackGetLeft_12:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BEQ.N    ??BlackGetLeft_23
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+1
        BNE.W    ??BlackGetLeft_7
// 1147       
// 1148     }
// 1149     
// 1150     
// 1151     //第4阶段，采集到十字的前两个角，向后补线。这里有浮点运算，要严格控制调用。
// 1152     //////////////////////////其实想想，向后补线有用吗，方便人看，但似乎对车没太大用。
// 1153     if(Step4Flag)
??BlackGetLeft_23:
??BlackGetLeft_19:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??BlackGetLeft_24
// 1154     {
// 1155       if(!BlackLeftStep4BackLine(Step4StartLine))
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackLeftStep4BackLine
        CMP      R0,#+0
        BNE.N    ??BlackGetLeft_24
// 1156       {
// 1157         return 0;  
        MOVS     R0,#+0
        B.N      ??BlackGetLeft_1
// 1158       }
// 1159     }
// 1160     
// 1161     
// 1162     return 1;
??BlackGetLeft_24:
        MOVS     R0,#+1
??BlackGetLeft_1:
        POP      {R1,R4-R11,PC}   ;; return
// 1163 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     `?<Constant {0, 255, 1, 0}>`
// 1164 
// 1165 
// 1166 
// 1167 //====================================右右右右右右右右右右右右右右右右右============================
// 1168 
// 1169 
// 1170 
// 1171 //======================================================================
// 1172 //函数名：BlackRightRealClear
// 1173 //功  能：右黑线提取中，对3个关键值的实际值清零
// 1174 //参  数：无
// 1175 //返  回：无
// 1176 //影  响：BlackRightRealWB[], BlackRightRealW[], BlackRightRealB[]
// 1177 //说  明：
// 1178 //      
// 1179 //             
// 1180 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1181 void BlackRightRealClear(void)
// 1182 {
// 1183     BlackRightRealWB[0] = 0;
BlackRightRealClear:
        LDR.W    R0,??DataTable20
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 1184     BlackRightRealWB[1] = 0;
        LDR.W    R0,??DataTable20
        MOVS     R1,#+0
        STRB     R1,[R0, #+1]
// 1185     BlackRightRealW[0] = 0;
        LDR.W    R0,??DataTable20_1
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 1186     BlackRightRealW[1] = 0;
        LDR.W    R0,??DataTable20_1
        MOVS     R1,#+0
        STRB     R1,[R0, #+1]
// 1187     BlackRightRealB[0] = 0;
        LDR.W    R0,??DataTable21
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 1188     BlackRightRealB[1] = 0;
        LDR.W    R0,??DataTable21
        MOVS     R1,#+0
        STRB     R1,[R0, #+1]
// 1189 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     BlackLeftRealWB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     BlackLeftRealW

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     BlackLeftRealB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     ImgNew

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     BlackLeftLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     LimitLeftWB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     LimitLeftW

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_8:
        DC32     LimitLeftB
// 1190 
// 1191 
// 1192 
// 1193 //======================================================================
// 1194 //函数名：BlackGetRightStep1Edge
// 1195 //功  能：右黑线提取中，第1阶段跳变检测函数,处理该右左线的可疑黑点
// 1196 //参  数：待检测的行号row, 第几次使用use, 是否为十字再检测调用标志位CrossFlag
// 1197 //返  回：1成功 0失败
// 1198 //影  响：BlackRightRealWB[], BlackRightRealW[], BlackRightRealB[]
// 1199 //        BlackRightLoc[][]
// 1200 //说  明：1. 对第row行的跳变向右进行检测，成功就赋相应的值（有3个备用值），失败则赋255
// 1201 //        2. 两批条件均满足时。则检测成功。会有最多3个值进行记录，现阶段只用到了第1个值
// 1202 //        3. 里面有涉及3个关键值的实际值的记录，CrossFlag的情况就不用记录（也就不用更改）
// 1203 //        4. 若1个黑点也没有，或者超过3个黑点，则检测失败。
// 1204 //        5. 若要检测黑到白的跳变，或者任意跳变，改变第一批条件即可。
// 1205 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1206 uint8 BlackGetRightStep1Edge(uint8 row, uint8 use, uint8 CrossFlag)
// 1207 {
BlackGetRightStep1Edge:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
// 1208   uint8 index, col, temp1;
// 1209   uint8 abs1;
// 1210   uint8 RightBeginCol; //右线跳变检测起点
// 1211   
// 1212   //左黑线检测成功时
// 1213   if(BlackLeftDone == 1)
        LDR.W    R0,??DataTable20_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??BlackGetRightStep1Edge_0
// 1214   {
// 1215       //右线跳变检测的起点至少要比该行左线的跳变点要靠右。
// 1216     if(BlackLeftLoc[row][0] == MaxValUint8)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BNE.N    ??BlackGetRightStep1Edge_1
// 1217     {
// 1218       RightBeginCol = CameraRealWidth/2;
        MOVS     R8,#+125
        B.N      ??BlackGetRightStep1Edge_2
// 1219     }
// 1220     else
// 1221     {
// 1222       //至少要在左跳变向右4+BlackRightEdgeNum个点
// 1223       RightBeginCol = MaxRe(CameraRealWidth/2, BlackLeftLoc[row][0] + 4 + BlackRightEdgeNum);
??BlackGetRightStep1Edge_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        ADDS     R1,R0,#+6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+125
        BL       MaxRe
        MOV      R8,R0
// 1224       //同时，也不能超过数组界限219，其实是不能超过CameraRealWidth - 5 - BlackRightEdgeNum，下面for循环里。
// 1225       RightBeginCol = MinRe(RightBeginCol, CameraRealWidth - 5 - BlackRightEdgeNum);
        MOVS     R1,#+243
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       MinRe
        MOV      R8,R0
        B.N      ??BlackGetRightStep1Edge_2
// 1226     }
// 1227   }
// 1228   //左黑线检测失败时，右黑线检测的起点要比中心线靠左BlackRightEdgeStartColOffset这么多列。
// 1229   else
// 1230   {
// 1231     RightBeginCol = CameraRealWidth/2 - BlackRightEdgeStartColOffset;  
??BlackGetRightStep1Edge_0:
        MOVS     R8,#+75
// 1232   }
// 1233   
// 1234   index = 0;         //可疑点的序号
??BlackGetRightStep1Edge_2:
        MOVS     R7,#+0
// 1235   //从中间到最右边扫描，隔1个点求差
// 1236   for(col = RightBeginCol; col <= CameraRealWidth - 5 - BlackRightEdgeNum; col++) 
        B.N      ??BlackGetRightStep1Edge_3
// 1237   {
// 1238       abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col+1+BlackRightEdgeNum]);
// 1239       if( //跳变沿的第一批条件：
// 1240           //黑够黑，白够白，差够大。
// 1241           //这里的3个阈值为初始值，不是自适应之后调整的值。
// 1242           (abs1 > LimitRightWB) //两者的差够大
// 1243         &&(ImgNew[row][col] > LimitRightW)                     //白点够白
// 1244         &&(ImgNew[row][col+1+BlackRightEdgeNum] < LimitRightB) //黑点够黑
// 1245          )
// 1246       {         
// 1247           //跳变沿的第二批条件：
// 1248           //近处的行，向右3个点仍为黑点
// 1249           if(row > BlackMiddleLine)
// 1250           {
// 1251             temp1 = (
// 1252                       (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB)
// 1253                     &&(ImgNew[row][col+3+BlackRightEdgeNum] < LimitRightB)
// 1254                     &&(ImgNew[row][col+4+BlackRightEdgeNum] < LimitRightB)
// 1255                     );
// 1256           }
// 1257           else
// 1258           {
// 1259             if(row > BlackFarLine)
// 1260             {
// 1261               //中间的行，向右2个点仍为黑点。
// 1262               temp1 = (
// 1263                         (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB)
// 1264                       &&(ImgNew[row][col+3+BlackRightEdgeNum] < LimitRightB)
// 1265                       );
// 1266             }
// 1267             //远处的行，向右1个点仍为黑点。
// 1268             else
// 1269             {
// 1270               temp1 = (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB);
// 1271             }
// 1272           }
// 1273           
// 1274           if(temp1)
// 1275           {
// 1276                             
// 1277               //超过3个可疑黑点，则报错
// 1278               if(index == 3)       
// 1279               {
// 1280                 //如果是十字再检测的调用，就不用更新这几个值。
// 1281                 if(CrossFlag)
// 1282                 {
// 1283                   //对3个关键值的实际值清零
// 1284                   BlackRightRealClear();
// 1285                 }
// 1286                 //该行定位黑线失败，赋无效值
// 1287                 BlackRightLoc[row][0] = MaxValUint8;
// 1288                 return 0;
// 1289               }
// 1290               
// 1291               //如果是十字再检测的调用，就不用更新这几个值。
// 1292               if(CrossFlag)
// 1293               {
// 1294                 //进入这里说明跳变沿的二批条件均满足，进入黑点记录阶段
// 1295                 //记录3个关键值的实际信息，作为后面的参考。
// 1296                 if(use == 1)
// 1297                 {
// 1298                   BlackRightRealWB[0] = ImgNew[row][col] - ImgNew[row][col+1+BlackRightEdgeNum]; 
// 1299                   BlackRightRealW[0] = ImgNew[row][col];
// 1300                   BlackRightRealB[0] = ImgNew[row][col+1+BlackRightEdgeNum];
// 1301                 }
// 1302                 else if(use == 2)
??BlackGetRightStep1Edge_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+2
        BNE.N    ??BlackGetRightStep1Edge_5
// 1303                 {
// 1304                   BlackRightRealWB[1] = ImgNew[row][col] - ImgNew[row][col+1+BlackRightEdgeNum]; 
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable20_3
        MLA      R1,R1,R4,R2
        ADDS     R1,R8,R1
        LDRB     R1,[R1, #+3]
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable20
        STRB     R0,[R1, #+1]
// 1305                   BlackRightRealW[1] = ImgNew[row][col];
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        LDR.W    R1,??DataTable20_1
        STRB     R0,[R1, #+1]
// 1306                   BlackRightRealB[1] = ImgNew[row][col+1+BlackRightEdgeNum];
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable21
        STRB     R0,[R1, #+1]
// 1307                 }
// 1308                 else
// 1309                 {
// 1310                 }
// 1311               }
// 1312               //跳变检测成功，取黑点
// 1313               BlackRightLoc[row][index] = col + 1 + BlackRightEdgeNum;          
??BlackGetRightStep1Edge_5:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21_1
        MLA      R0,R0,R4,R1
        ADDS     R1,R8,#+3
        STRB     R1,[R7, R0]
// 1314               index++;
        ADDS     R7,R7,#+1
??BlackGetRightStep1Edge_6:
        ADDS     R8,R8,#+1
??BlackGetRightStep1Edge_3:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+244
        BCS.W    ??BlackGetRightStep1Edge_7
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R1,[R0, #+3]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R2,??DataTable20_3
        MLA      R0,R0,R4,R2
        LDRB     R0,[R8, R0]
        BL       AbsRe
        LDR.W    R1,??DataTable21_2
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCS.N    ??BlackGetRightStep1Edge_6
        LDR.W    R0,??DataTable21_3
        LDRB     R0,[R0, #+0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable20_3
        MLA      R1,R1,R4,R2
        LDRB     R1,[R8, R1]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep1Edge_6
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable21_4
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep1Edge_6
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+31
        BCC.N    ??BlackGetRightStep1Edge_8
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+4]
        LDR.W    R1,??DataTable21_4
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep1Edge_9
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+5]
        LDR.W    R1,??DataTable21_4
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep1Edge_9
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+6]
        LDR.W    R1,??DataTable21_4
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep1Edge_9
        MOVS     R0,#+1
        B.N      ??BlackGetRightStep1Edge_10
??BlackGetRightStep1Edge_9:
        MOVS     R0,#+0
??BlackGetRightStep1Edge_10:
        B.N      ??BlackGetRightStep1Edge_11
??BlackGetRightStep1Edge_8:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+21
        BCC.N    ??BlackGetRightStep1Edge_12
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+4]
        LDR.W    R1,??DataTable21_4
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep1Edge_13
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+5]
        LDR.W    R1,??DataTable21_4
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep1Edge_13
        MOVS     R0,#+1
        B.N      ??BlackGetRightStep1Edge_14
??BlackGetRightStep1Edge_13:
        MOVS     R0,#+0
??BlackGetRightStep1Edge_14:
        B.N      ??BlackGetRightStep1Edge_11
??BlackGetRightStep1Edge_12:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+4]
        LDR.W    R1,??DataTable21_4
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep1Edge_15
        MOVS     R0,#+1
        B.N      ??BlackGetRightStep1Edge_16
??BlackGetRightStep1Edge_15:
        MOVS     R0,#+0
??BlackGetRightStep1Edge_16:
??BlackGetRightStep1Edge_11:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.W    ??BlackGetRightStep1Edge_6
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+3
        BNE.N    ??BlackGetRightStep1Edge_17
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??BlackGetRightStep1Edge_18
        BL       BlackRightRealClear
??BlackGetRightStep1Edge_18:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21_1
        MLA      R0,R0,R4,R1
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        MOVS     R0,#+0
        B.N      ??BlackGetRightStep1Edge_19
??BlackGetRightStep1Edge_17:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.W    ??BlackGetRightStep1Edge_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.W    ??BlackGetRightStep1Edge_4
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable20_3
        MLA      R1,R1,R4,R2
        ADDS     R1,R8,R1
        LDRB     R1,[R1, #+3]
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable20
        STRB     R0,[R1, #+0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        LDR.W    R1,??DataTable20_1
        STRB     R0,[R1, #+0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable21
        STRB     R0,[R1, #+0]
        B.N      ??BlackGetRightStep1Edge_5
// 1315             
// 1316           }    //end of 跳变沿的第二批条件
// 1317       }   //end of 跳变沿的第一批条件
// 1318   }// end of 从中间到最左边扫描，隔1个点求差
// 1319   
// 1320   //1个可疑黑点也没有，则报错。
// 1321   if(index == 0)
??BlackGetRightStep1Edge_7:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??BlackGetRightStep1Edge_20
// 1322   {
// 1323     //如果是十字再检测的调用，就不用更新这几个值。
// 1324     if(CrossFlag)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??BlackGetRightStep1Edge_21
// 1325     {
// 1326       //对3个关键值的实际值清零
// 1327       BlackRightRealClear();
        BL       BlackRightRealClear
// 1328     }
// 1329     //该行定位黑线失败，赋无效值
// 1330     BlackRightLoc[row][0] = MaxValUint8;
??BlackGetRightStep1Edge_21:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21_1
        MLA      R0,R0,R4,R1
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 1331     return 0;
        MOVS     R0,#+0
        B.N      ??BlackGetRightStep1Edge_19
// 1332   }
// 1333   
// 1334   //没有报错，就会走到这里，黑点查找成功，会有1，2，3个黑点
// 1335   return 1;
??BlackGetRightStep1Edge_20:
        MOVS     R0,#+1
??BlackGetRightStep1Edge_19:
        POP      {R4-R8,PC}       ;; return
// 1336 }
// 1337 
// 1338 
// 1339 
// 1340 //======================================================================
// 1341 //函数名：BlackGetRightStep2Win
// 1342 //功  能：右黑线提取中，第2阶段窗口内跳变检测函数
// 1343 //参  数：待处理行号row, 窗口大小win, 预测的跳变点的位置predict
// 1344 //返  回：1成功  0失败
// 1345 //影  响：BlackRightLoc[][0]
// 1346 //说  明：1. 满足两批条件，才能检测成功。只有一个点的记录。
// 1347 //        2. 窗口内没有检测到，则检测失败。
// 1348 //        3. 窗缩小可以减少一定的时间，但如果遇到斜率过大的情况，就有可能检测不到。     
// 1349 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1350 uint8 BlackGetRightStep2Win(uint8 row, uint8 win, uint8 predict)
// 1351 {
BlackGetRightStep2Win:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
// 1352   uint8 col, temp, temp1;
// 1353   uint8 abs1;
// 1354 
// 1355   //在规划好的窗口内，从左往右查找跳变沿
// 1356   //防止溢出
// 1357   //对右边界的限制 
// 1358   if((predict + win) >= (CameraRealWidth - 5 - BlackRightEdgeNum)) 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R0,R1,R2
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+243
        BCC.N    ??BlackGetRightStep2Win_0
// 1359   {
// 1360     temp = CameraRealWidth - 5 - BlackRightEdgeNum;
        MOVS     R5,#+243
        B.N      ??BlackGetRightStep2Win_1
// 1361   }  
// 1362   else
// 1363   {
// 1364     temp = predict + win;
??BlackGetRightStep2Win_0:
        ADDS     R5,R1,R2
// 1365   }
// 1366   //对左边界的限制
// 1367   if(predict <= win)
??BlackGetRightStep2Win_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R1,R2
        BCC.N    ??BlackGetRightStep2Win_2
// 1368   {
// 1369     col = 0;
        MOVS     R6,#+0
        B.N      ??BlackGetRightStep2Win_3
// 1370   }
// 1371   else
// 1372   {
// 1373     col = predict - win;  
??BlackGetRightStep2Win_2:
        SUBS     R6,R2,R1
        B.N      ??BlackGetRightStep2Win_3
// 1374   }
// 1375    
// 1376   for(; col < temp; col++) 
??BlackGetRightStep2Win_4:
        ADDS     R6,R6,#+1
??BlackGetRightStep2Win_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R6,R5
        BCS.W    ??BlackGetRightStep2Win_5
// 1377   {
// 1378     abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col+1+BlackRightEdgeNum]);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R1,[R0, #+3]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R2,??DataTable20_3
        MLA      R0,R0,R4,R2
        LDRB     R0,[R6, R0]
        BL       AbsRe
// 1379     if( //跳变沿的第一批条件：
// 1380         //黑够黑，白够白，差够大。
// 1381         //这里的3个阈值是自适应之后调整的值
// 1382           (abs1 > LimitRightWB) //两者的差够大
// 1383         &&(ImgNew[row][col] > LimitRightW)                     //白点够白
// 1384         &&(ImgNew[row][col+1+BlackRightEdgeNum] < LimitRightB)                   //黑点够黑
// 1385        )
        LDR.W    R1,??DataTable21_2
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCS.N    ??BlackGetRightStep2Win_4
        LDR.W    R0,??DataTable21_3
        LDRB     R0,[R0, #+0]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable20_3
        MLA      R1,R1,R4,R2
        LDRB     R1,[R6, R1]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_4
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable21_4
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_4
// 1386     {
// 1387         
// 1388           //近处的行，向右3个点仍为黑点
// 1389           if(row > BlackMiddleLine)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+31
        BCC.N    ??BlackGetRightStep2Win_6
// 1390           {
// 1391             temp1 = (
// 1392                       (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB)
// 1393                     &&(ImgNew[row][col+3+BlackRightEdgeNum] < LimitRightB)
// 1394                     &&(ImgNew[row][col+4+BlackRightEdgeNum] < LimitRightB)
// 1395                     );
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #+4]
        LDR.W    R1,??DataTable21_4
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_7
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #+5]
        LDR.W    R1,??DataTable21_4
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_7
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #+6]
        LDR.W    R1,??DataTable21_4
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_7
        MOVS     R0,#+1
        B.N      ??BlackGetRightStep2Win_8
??BlackGetRightStep2Win_7:
        MOVS     R0,#+0
??BlackGetRightStep2Win_8:
        B.N      ??BlackGetRightStep2Win_9
// 1396           }
// 1397           else
// 1398           {
// 1399             //中间的行 ，向右2个点为仍为黑点
// 1400             if(row > BlackFarLine)
??BlackGetRightStep2Win_6:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+21
        BCC.N    ??BlackGetRightStep2Win_10
// 1401             {
// 1402               temp1 = (
// 1403                         (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB)
// 1404                       &&(ImgNew[row][col+3+BlackRightEdgeNum] < LimitRightB)
// 1405                       );
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #+4]
        LDR.W    R1,??DataTable21_4
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_11
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #+5]
        LDR.W    R1,??DataTable21_4
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_11
        MOVS     R0,#+1
        B.N      ??BlackGetRightStep2Win_12
??BlackGetRightStep2Win_11:
        MOVS     R0,#+0
??BlackGetRightStep2Win_12:
        B.N      ??BlackGetRightStep2Win_9
// 1406             }
// 1407             //远处的行，向右1个点仍为黑点
// 1408             else
// 1409             {
// 1410               temp1 = (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB);
??BlackGetRightStep2Win_10:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_3
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #+4]
        LDR.W    R1,??DataTable21_4
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_13
        MOVS     R0,#+1
        B.N      ??BlackGetRightStep2Win_14
??BlackGetRightStep2Win_13:
        MOVS     R0,#+0
// 1411             }
// 1412           }
// 1413           
// 1414           //跳变沿的第二批条件：
// 1415           if(temp1)
??BlackGetRightStep2Win_14:
??BlackGetRightStep2Win_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.W    ??BlackGetRightStep2Win_4
// 1416           {
// 1417           //两批条件均满足，直接记录该点为黑线，返回即可
// 1418           BlackRightLoc[row][0] = col + 1 + BlackRightEdgeNum;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21_1
        MLA      R0,R0,R4,R1
        ADDS     R1,R6,#+3
        STRB     R1,[R0, #+0]
// 1419           return 1;
        MOVS     R0,#+1
        B.N      ??BlackGetRightStep2Win_15
// 1420           //break;               
// 1421           }// end of 跳变沿检测的第2批条件
// 1422     }// end of 跳变沿检测的第1批条件
// 1423     
// 1424     
// 1425     
// 1426   }// end of for循环
// 1427   
// 1428   //如果一直到窗口最左边还没有找到跳变沿，
// 1429   
// 1430   BlackRightLoc[row][0] = MaxValUint8;   //该行的黑线位置记为无效值
??BlackGetRightStep2Win_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21_1
        MLA      R0,R0,R4,R1
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 1431   return 0;
        MOVS     R0,#+0
??BlackGetRightStep2Win_15:
        POP      {R4-R6,PC}       ;; return
// 1432   
// 1433 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     BlackLeftLoc
// 1434 
// 1435 
// 1436 
// 1437 //======================================================================
// 1438 //函数名：BlackGetRightStep1Scan
// 1439 //功  能：右黑线提取中，第1阶段的行扫描函数
// 1440 //参  数：扫描起始行FirstLine, 扫描结束行LastLine, 十字再检测标志CrossFlag
// 1441 //返  回：0~CameraHight - 1行数 255采集失败
// 1442 //影  响：BlackRightRealWB[], BlackRightRealW[], BlackRightRealB[], BlackRightLoc[][],
// 1443 //        LimitRightWB, LimitRightW, LimitRightB
// 1444 //说  明：1. 可用于正常地第1阶段行扫描，也可用于十字再检测时的行扫描
// 1445 //        2. 正常第1阶段扫描时，会更改3个关键阈值的值。
// 1446 //             
// 1447 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1448 uint8 BlackGetRightStep1Scan(uint8 FirstLine, uint8 LastLine, uint8 CrossFlag)
// 1449 {
BlackGetRightStep1Scan:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,R2
// 1450     uint8 row, temp1, temp2;
// 1451     uint8 abs1;
// 1452     uint8 tempWB, tempW, tempB;
// 1453     
// 1454   //最近的BlackStep1Size行用差值法找黑线
// 1455     for(row = FirstLine; row > LastLine; row -= 2)
        B.N      ??BlackGetRightStep1Scan_0
??BlackGetRightStep1Scan_1:
        SUBS     R5,R5,#+2
??BlackGetRightStep1Scan_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R4,R5
        BCS.N    ??BlackGetRightStep1Scan_2
// 1456     {
// 1457       //判断是否连续两行检测到跳变，可疑黑点有3个点，暂取其中一个
// 1458       temp1 = BlackGetRightStep1Edge(row, 1, CrossFlag);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetRightStep1Edge
        MOVS     R7,R0
// 1459       temp2 = BlackGetRightStep1Edge(row-1, 2, CrossFlag);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+2
        SUBS     R0,R5,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetRightStep1Edge
// 1460       if(temp1 && temp2)//这里可以这么写，不用嵌套if，因为&&的特点
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??BlackGetRightStep1Scan_1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BlackGetRightStep1Scan_1
// 1461       {
// 1462         abs1 = AbsRe(BlackRightLoc[row-1][0], BlackRightLoc[row][0]);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21_1
        MLA      R0,R0,R5,R1
        LDRB     R1,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R2,??DataTable21_1
        MLA      R0,R0,R5,R2
        LDRB     R0,[R0, #-3]
        BL       AbsRe
// 1463         //进一步判断连续两行的黑点的间隔是否够小，且暂取第1个可疑黑点。
// 1464         if(abs1 < BlackRightStep1ScanMinus)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BCS.N    ??BlackGetRightStep1Scan_1
// 1465         {
// 1466           //检测到了连续的黑线，停止差值法找跳变沿，节省时间，下面进入第2阶段                                     
// 1467           //如果不是十字再检测的情况，就更新一下实际的3个关键值，否则不更新。
// 1468           if(CrossFlag)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??BlackGetRightStep1Scan_3
// 1469             {           
// 1470               //差值的处理，留有裕度，且有上下界。
// 1471               tempWB = (BlackRightRealWB[0] + BlackRightRealWB[1]) / 2 - LimitRightWBMargin; 
        LDR.W    R0,??DataTable20
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable20
        LDRB     R1,[R1, #+1]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        SUBS     R0,R0,#+20
// 1472               if(tempWB < LimitRightWBMin) tempWB = LimitRightWBMin;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+75
        BCS.N    ??BlackGetRightStep1Scan_4
        MOVS     R0,#+75
        B.N      ??BlackGetRightStep1Scan_5
// 1473               else if(tempWB > LimitRightWBMax) tempWB = LimitRightWBMax;
??BlackGetRightStep1Scan_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+106
        BCC.N    ??BlackGetRightStep1Scan_5
        MOVS     R0,#+105
// 1474               else ;
// 1475               LimitRightWB = tempWB;
??BlackGetRightStep1Scan_5:
        LDR.W    R1,??DataTable21_2
        STRB     R0,[R1, #+0]
// 1476               
// 1477               //白点的处理，留有裕度，且有上下界。
// 1478               tempW = (BlackRightRealW[0] + BlackRightRealW[1]) / 2 - LimitRightWMargin;
        LDR.W    R0,??DataTable20_1
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable20_1
        LDRB     R1,[R1, #+1]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        SUBS     R0,R0,#+30
// 1479               if(tempW < LimitRightWMin) tempW = LimitRightWMin;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+150
        BCS.N    ??BlackGetRightStep1Scan_6
        MOVS     R0,#+150
        B.N      ??BlackGetRightStep1Scan_7
// 1480               else if(tempW > LimitRightWMax) tempW = LimitRightWMax;
??BlackGetRightStep1Scan_6:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+201
        BCC.N    ??BlackGetRightStep1Scan_7
        MOVS     R0,#+200
// 1481               else ;
// 1482               LimitRightW = tempW;
??BlackGetRightStep1Scan_7:
        LDR.W    R1,??DataTable21_3
        STRB     R0,[R1, #+0]
// 1483               
// 1484               //黑点的处理，留有裕度，且有上下界。
// 1485               tempB = (BlackRightRealB[0] + BlackRightRealB[1]) / 2 + LimitRightBMargin;
        LDR.W    R0,??DataTable21
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable21
        LDRB     R1,[R1, #+1]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+30
// 1486               if(tempB < LimitRightBMin) tempB = LimitRightBMin;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+85
        BCS.N    ??BlackGetRightStep1Scan_8
        MOVS     R0,#+85
        B.N      ??BlackGetRightStep1Scan_9
// 1487               else if(tempB > LimitRightBMax) tempB = LimitRightBMax;
??BlackGetRightStep1Scan_8:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+101
        BCC.N    ??BlackGetRightStep1Scan_9
        MOVS     R0,#+100
// 1488               else ;
// 1489               LimitRightB = tempB;           
??BlackGetRightStep1Scan_9:
        LDR.W    R1,??DataTable21_4
        STRB     R0,[R1, #+0]
// 1490             }
// 1491           break;
// 1492         }
// 1493       }      
// 1494     }   
// 1495     
// 1496     //检测了BlackStep1Size行也没有检测到连续的黑线，说明黑线检测失败
// 1497     if(row <= LastLine)
??BlackGetRightStep1Scan_3:
??BlackGetRightStep1Scan_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R4,R5
        BCC.N    ??BlackGetRightStep1Scan_10
// 1498       return MaxValUint8;
        MOVS     R0,#+255
        B.N      ??BlackGetRightStep1Scan_11
// 1499     else
// 1500       return row;
??BlackGetRightStep1Scan_10:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??BlackGetRightStep1Scan_11:
        POP      {R1,R4-R7,PC}    ;; return
// 1501   
// 1502 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     `?<Constant "\\nError In BlackLeftCr...">`
// 1503 
// 1504 
// 1505 //======================================================================
// 1506 //函数名：BlackRightCrossStep3
// 1507 //功  能：右线提取中，十字检测第3阶段，脑补线函数
// 1508 //参  数：第1段有效黑线的最后一行FirstLine， 第2段有效黑线的第一行LastLine
// 1509 //返  回：1成功 0失败
// 1510 //影  响：BlackRightLoc[][0]
// 1511 //说  明：1. 这里有一些浮点运算，会占时间，在调用本函数时要慎重，尽量不要用。
// 1512 //        2. 这里的两点间连线的思路很不错，float强转和uint8强转用得很好。
// 1513 //             
// 1514 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1515 uint8 BlackRightCrossStep3(uint8 FirstLine, uint8 LastLine)
// 1516 {
BlackRightCrossStep3:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R7,R1
// 1517   float delta_x, delta_y, delta, index;
// 1518   uint8 row, temp1, temp2;
// 1519   //uint8 temp3, temp4, flag1, flag2;
// 1520   
// 1521   //超始行比结束行还高，报错！
// 1522   if(LastLine >= FirstLine)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R7,R4
        BCC.N    ??BlackRightCrossStep3_0
// 1523   {
// 1524     uart_sendN(UART0, (uint8 *)"\nError In BlackRightCrossStep3!", 31);
        MOVS     R2,#+31
        LDR.W    R1,??DataTable21_5
        LDR.W    R0,??DataTable21_6  ;; 0x4006a000
        BL       uart_sendN
// 1525     return 0;  
        MOVS     R0,#+0
        B.N      ??BlackRightCrossStep3_1
// 1526   }
// 1527   
// 1528   temp1 = BlackRightLoc[FirstLine][0];
??BlackRightCrossStep3_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21_1
        MLA      R0,R0,R4,R1
        LDRB     R5,[R0, #+0]
// 1529   temp2 = BlackRightLoc[LastLine][0];
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21_1
        MLA      R0,R0,R7,R1
        LDRB     R8,[R0, #+0]
// 1530   
// 1531   /*
// 1532   flag1 = 1;
// 1533   flag2 = 1;
// 1534   //确认这两个点是直角处的点，也就是往右6个点仍为黑点
// 1535   if(temp1 <= (CameraRealWidth - 9))
// 1536   {
// 1537     temp3 = (
// 1538             (ImgNew[FirstLine+1][temp1+6] < LimitRightB)
// 1539           &&(ImgNew[FirstLine+1][temp1+7] < LimitRightB)
// 1540           &&(ImgNew[FirstLine+1][temp1+8] < LimitRightB)
// 1541           );
// 1542     if(temp3)
// 1543     {
// 1544       flag1 = 0;  
// 1545     }
// 1546   }
// 1547   
// 1548   if(temp2 <= (CameraRealWidth - 9))
// 1549   {
// 1550     temp4 = (
// 1551             (ImgNew[LastLine-1][temp2+6] < LimitRightB)
// 1552           &&(ImgNew[LastLine-1][temp2+7] < LimitRightB)
// 1553           &&(ImgNew[LastLine-1][temp2+8] < LimitRightB)
// 1554           );
// 1555     if(temp4)
// 1556     {
// 1557       flag2 = 0;  
// 1558     }
// 1559   }
// 1560   
// 1561   if((flag1 == 0) || (flag2 == 0))
// 1562   {
// 1563     return 0;  
// 1564   }
// 1565   
// 1566   */
// 1567   
// 1568   delta_y = FirstLine - LastLine;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        SUBS     R0,R4,R7
        BL       __aeabi_i2f
        MOVS     R6,R0
// 1569   
// 1570   
// 1571   //斜率向右
// 1572   if(temp1 < temp2)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R5,R8
        BCS.N    ??BlackRightCrossStep3_2
// 1573   {
// 1574     delta_x = temp2 - temp1;
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        SUBS     R0,R8,R5
        BL       __aeabi_i2f
// 1575     delta = delta_x / delta_y; //这是1个浮点数
        MOVS     R1,R6
        BL       __aeabi_fdiv
        MOVS     R5,R0
// 1576     
// 1577     index = 1.0;
        MOVS     R8,#+1065353216
// 1578     for(row = FirstLine - 1; row >= LastLine + 1; row-- )
        SUBS     R6,R4,#+1
??BlackRightCrossStep3_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADDS     R0,R7,#+1
        CMP      R6,R0
        BLT.N    ??BlackRightCrossStep3_4
// 1579     {
// 1580       //每次右移一点点
// 1581       BlackRightLoc[row][0] = (uint8)((float)BlackRightLoc[FirstLine][0] + delta * index);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21_1
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOV      R9,R0
        MOVS     R0,R5
        MOV      R1,R8
        BL       __aeabi_fmul
        MOV      R1,R9
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21_1
        MLA      R1,R1,R6,R2
        STRB     R0,[R1, #+0]
// 1582       index += 1.0;
        MOV      R0,R8
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.W    R1,??DataTable21_7  ;; 0x3ff00000
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        MOV      R8,R0
// 1583     }
        SUBS     R6,R6,#+1
        B.N      ??BlackRightCrossStep3_3
// 1584   }
// 1585   //斜率向左
// 1586   else if(temp1 > temp2)
??BlackRightCrossStep3_2:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R8,R5
        BCS.N    ??BlackRightCrossStep3_5
// 1587   {
// 1588     delta_x = temp1 - temp2;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        SUBS     R0,R5,R8
        BL       __aeabi_i2f
// 1589     delta = delta_x / delta_y;
        MOVS     R1,R6
        BL       __aeabi_fdiv
        MOVS     R5,R0
// 1590     
// 1591     index = 1.0;
        MOVS     R8,#+1065353216
// 1592     for(row = FirstLine - 1; row >= LastLine + 1; row-- )
        SUBS     R6,R4,#+1
??BlackRightCrossStep3_6:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADDS     R0,R7,#+1
        CMP      R6,R0
        BLT.N    ??BlackRightCrossStep3_4
// 1593     {
// 1594       //每次右移一点点
// 1595       BlackRightLoc[row][0] = (uint8)((float)BlackRightLoc[FirstLine][0] - delta * index);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21_1
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOV      R9,R0
        MOVS     R0,R5
        MOV      R1,R8
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R9
        BL       __aeabi_fsub
        BL       __aeabi_f2iz
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21_1
        MLA      R1,R1,R6,R2
        STRB     R0,[R1, #+0]
// 1596       index += 1.0;
        MOV      R0,R8
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.W    R1,??DataTable21_7  ;; 0x3ff00000
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        MOV      R8,R0
// 1597     }
        SUBS     R6,R6,#+1
        B.N      ??BlackRightCrossStep3_6
// 1598   }
// 1599   //斜率直走，这个不太可能出现
// 1600   else
// 1601   {
// 1602     for(row = FirstLine - 1; row >= LastLine + 1; row-- )
??BlackRightCrossStep3_5:
        SUBS     R6,R4,#+1
        B.N      ??BlackRightCrossStep3_7
// 1603     {
// 1604       //赋相同的值
// 1605       BlackRightLoc[row][0] = temp1;
??BlackRightCrossStep3_8:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21_1
        MLA      R0,R0,R6,R1
        STRB     R5,[R0, #+0]
// 1606     }
        SUBS     R6,R6,#+1
??BlackRightCrossStep3_7:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADDS     R0,R7,#+1
        CMP      R6,R0
        BGE.N    ??BlackRightCrossStep3_8
// 1607   }
// 1608   
// 1609   return 1;
??BlackRightCrossStep3_4:
        MOVS     R0,#+1
??BlackRightCrossStep3_1:
        POP      {R1,R4-R9,PC}    ;; return
// 1610     
// 1611 }
// 1612 
// 1613 //======================================================================
// 1614 //函数名：BlackRightCrossConfirm
// 1615 //功  能：十字再检测时 ，线头有效性的确认。
// 1616 //参  数：第1段黑线的真实结束行Row1RealLastLine，第2段黑线的真实起始行Row2RealFirstLine
// 1617 //返  回：1成功 0失败
// 1618 //影  响：无
// 1619 //说  明：1. 为了应对270度弯道十字误检测而诞生，编写过程中没有过多考虑其它情况。
// 1620 //      
// 1621 //             
// 1622 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1623 uint8 BlackRightCrossConfirm(uint8 Row1RealLastLine, uint8 Row2RealFirstLine)
// 1624 {
BlackRightCrossConfirm:
        PUSH     {R2-R6,LR}
        MOVS     R4,R1
// 1625   uint8 row, index;
// 1626   uint8 x[BlackCrossConfirmNum];
// 1627   uint8 y[BlackCrossConfirmNum];
// 1628   
// 1629   float a0, a1, temp;
// 1630   
// 1631   //第一段黑线太短，无法检测正确性。直接返回1.
// 1632   if(Row1RealLastLine < 5) return 1;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BCS.N    ??BlackRightCrossConfirm_0
        MOVS     R0,#+1
        B.N      ??BlackRightCrossConfirm_1
// 1633   
// 1634   //以左上角为原点，向下为x轴正方向（0~49），向右为y轴正方向(0~249)
// 1635   index = 0;
??BlackRightCrossConfirm_0:
        MOVS     R1,#+0
// 1636   for(row = Row1RealLastLine; ; row++)
        B.N      ??BlackRightCrossConfirm_2
??BlackRightCrossConfirm_3:
        ADDS     R0,R0,#+1
// 1637   {
// 1638     //有效行的记录
// 1639     if(BlackRightLoc[row][0] != MaxValUint8)
??BlackRightCrossConfirm_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable21_1
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        CMP      R2,#+255
        BEQ.N    ??BlackRightCrossConfirm_4
// 1640     {
// 1641       y[index] = BlackRightLoc[row][0];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable21_1
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R3,SP,#+0
        STRB     R2,[R1, R3]
// 1642       x[index] = row;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R2,SP,#+4
        STRB     R0,[R1, R2]
// 1643       index++;
        ADDS     R1,R1,#+1
// 1644     }
// 1645     //点数够多，则跳出。
// 1646     if(index == BlackCrossConfirmNum) break;
??BlackRightCrossConfirm_4:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+3
        BNE.N    ??BlackRightCrossConfirm_5
// 1647     //直到最低行仍没有凑够足够的点数，说明第一段有效黑线太短，无法检测正确性，直接返回1.
// 1648     if(row == CameraHight - 1) return 1;
// 1649   }
// 1650   
// 1651   //最小二乘法
// 1652   //y = a0 + a1 * x
// 1653   a1 = LeastSquarea1(x, y, BlackCrossConfirmNum);
        MOVS     R2,#+3
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea1
        MOVS     R6,R0
// 1654   a0 = LeastSquarea0(x, y, a1, BlackCrossConfirmNum);
        MOVS     R3,#+3
        MOVS     R2,R6
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea0
        MOVS     R5,R0
// 1655   
// 1656   //temp为第2段黑线起始行本应该在的位置。
// 1657   temp = a0 + a1 * Row2RealFirstLine;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        BL       __aeabi_ui2f
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
// 1658   //如果这个位置本来就超出了左右边界的范围，那说明不可能有第2段黑线存在了。
// 1659   //也就不用检测第2段黑线了，直接返回0.
// 1660   if((temp < 0) || (temp > CameraRealWidth - 1)) 
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCC.N    ??BlackRightCrossConfirm_6
        LDR.N    R1,??DataTable17  ;; 0x43790001
        BL       __aeabi_cfrcmple
        BHI.N    ??BlackRightCrossConfirm_7
// 1661   {
// 1662     return 0;
??BlackRightCrossConfirm_6:
        MOVS     R0,#+0
        B.N      ??BlackRightCrossConfirm_1
// 1663   }
??BlackRightCrossConfirm_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??BlackRightCrossConfirm_3
        MOVS     R0,#+1
        B.N      ??BlackRightCrossConfirm_1
// 1664   else
// 1665   { //这里本来应该加上把这个点限定在窗内，但是似乎没必要。
// 1666     //if(
// 1667     //  (BlackRightLoc[Row2RealFirstLine][0] > temp - BlackCrossConfirmWin) 
// 1668     //&&(BlackRightLoc[Row2RealFirstLine][0] < temp + BlackCrossConfirmWin)
// 1669     //  )
// 1670     return 1;
??BlackRightCrossConfirm_7:
        MOVS     R0,#+1
??BlackRightCrossConfirm_1:
        POP      {R1,R2,R4-R6,PC}  ;; return
// 1671   }  
// 1672 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     0x43790001
// 1673 
// 1674 
// 1675 //======================================================================
// 1676 //函数名：BlackRightAgainForCross
// 1677 //功  能：右黑线提取中，针对十字的再检测程序
// 1678 //参  数：第2段黑线的预测起始行Row2FirstLine， 第2段黑线的预测结束行Row2LastLine，
// 1679 //        第1段黑线的实际结束行Row1RealLastLine
// 1680 //返  回：1成功 0失败
// 1681 //影  响：BlackRightLoc[][]。 （不会影响那几个阈值。）
// 1682 //说  明：1. 本函数会调用浮点运算的函数，预计花费较多时间，调用入口需谨慎。
// 1683 //        2. 本函数仅影响了BlackRightLoc[][]，以后也应该保持。
// 1684 //             
// 1685 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1686 uint8 BlackRightAgainForCross(uint8 Row2FirstLine, uint8 Row2LastLine, uint8 Row1RealLastLine)
// 1687 {
BlackRightAgainForCross:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
// 1688     uint8 row, temp, temp1, temp2;
// 1689     uint8 Row2RealFirstLine; //第2段黑线的真实起始行
// 1690     uint8 i;
// 1691     
// 1692     //十字再检测第1阶段，找线头。
// 1693     temp = BlackGetRightStep1Scan(Row2FirstLine, Row2LastLine, 0); //第3个参数0表示是十字再检测，不用更新3个关键值
        MOVS     R2,#+0
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetRightStep1Scan
        MOV      R8,R0
// 1694     if(temp == MaxValUint8)  
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+255
        BNE.N    ??BlackRightAgainForCross_0
// 1695     {
// 1696       //扫屁股工作。        //i >= Row2LastLine
// 1697       for(i = Row2FirstLine; ; i--)
        B.N      ??BlackRightAgainForCross_1
??BlackRightAgainForCross_2:
        SUBS     R4,R4,#+1
// 1698       {
// 1699         BlackRightLoc[i][0] = MaxValUint8;
??BlackRightAgainForCross_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21_1
        MLA      R0,R0,R4,R1
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 1700         if(i == 0) break;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??BlackRightAgainForCross_2
// 1701       }
// 1702       return 0;  
        MOVS     R0,#+0
        B.N      ??BlackRightAgainForCross_3
// 1703     }
// 1704     else 
// 1705     {
// 1706       ////////////////如果要注释，就从这里开始注释
// 1707       //十字再检测的线头不在限定的范围内，认为是干扰点，不用顺着线头找线了，直接退出。
// 1708       if(!BlackRightCrossConfirm(Row1RealLastLine, temp))
??BlackRightAgainForCross_0:
        MOV      R1,R8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackRightCrossConfirm
        CMP      R0,#+0
        BNE.N    ??BlackRightAgainForCross_4
// 1709       { //扫屁股工作。         //i >= (temp-1)
// 1710         for(i = Row2FirstLine; ; i--)
        B.N      ??BlackRightAgainForCross_5
??BlackRightAgainForCross_6:
        SUBS     R4,R4,#+1
// 1711         {
// 1712           BlackRightLoc[i][0] = MaxValUint8;
??BlackRightAgainForCross_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21_1
        MLA      R0,R0,R4,R1
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 1713           if(i == 0) break;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??BlackRightAgainForCross_6
// 1714         }
// 1715         return 0;
        MOVS     R0,#+0
        B.N      ??BlackRightAgainForCross_3
// 1716       }
// 1717       //十字再检测的线头的确在限定的范围内，可以继续。
// 1718       else
// 1719       {
// 1720       row = temp;
??BlackRightAgainForCross_4:
        MOV      R4,R8
// 1721       }
// 1722       ////////////////如果要注释，就从这里结束注释
// 1723       
// 1724       //暂时不用confirm函数，如果要用的话 ，就把后面这句话去掉，前面注释去掉。
// 1725       //row = temp;
// 1726     }
// 1727     
// 1728     Row2RealFirstLine = row; //记录第2段黑线的真实起始行
        MOVS     R7,R4
// 1729     
// 1730     //十字再检测第2阶段，顺着线头找线。
// 1731     //temp为预测的黑点位置
// 1732     temp = BlackRightLoc[row-1][0] + BlackRightLoc[row-1][0] - BlackRightLoc[row][0];
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21_1
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #-3]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21_1
        MLA      R1,R1,R4,R2
        LDRB     R1,[R1, #-3]
        ADDS     R0,R1,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21_1
        MLA      R1,R1,R4,R2
        LDRB     R1,[R1, #+0]
        SUBS     R8,R0,R1
// 1733     //从最近的认证行到取最远的行
// 1734     for(row -= 2; ; row -= 2)
        SUBS     R4,R4,#+2
        B.N      ??BlackRightAgainForCross_7
??BlackRightAgainForCross_8:
        SUBS     R4,R4,#+2
// 1735     {
// 1736       //如果连续两行的黑点检测成功，则更新预测点的位置
// 1737       temp1 = BlackGetRightStep2Win(row, BlackRightWinVal, temp);
??BlackRightAgainForCross_7:
        MOV      R2,R8
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetRightStep2Win
        MOV      R9,R0
// 1738       temp2 = BlackGetRightStep2Win(row-1, BlackRightWinVal, temp);
        MOV      R2,R8
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        SUBS     R0,R4,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetRightStep2Win
// 1739       if(temp1 && temp2) 
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??BlackRightAgainForCross_9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BlackRightAgainForCross_9
// 1740       {
// 1741         temp = BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0];
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21_1
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #-3]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21_1
        MLA      R1,R1,R4,R2
        LDRB     R1,[R1, #-3]
        ADDS     R0,R1,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21_1
        MLA      R1,R1,R4,R2
        LDRB     R1,[R1, #+0]
        SUBS     R8,R0,R1
// 1742       }
// 1743       //如果没能连续两行检测黑点成功，则不更新预测点位置，采用原位置。
// 1744       else
// 1745       {
// 1746       }       
// 1747       
// 1748       if((row == Row2LastLine) || (row == Row2LastLine+1)) break;      
??BlackRightAgainForCross_9:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R4,R5
        BEQ.N    ??BlackRightAgainForCross_10
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,#+1
        CMP      R4,R0
        BNE.N    ??BlackRightAgainForCross_8
// 1749     }
// 1750     
// 1751     //十字再检测第3阶段，脑补两段线的接线。
// 1752     if(!BlackRightCrossStep3(Row1RealLastLine, Row2RealFirstLine))
??BlackRightAgainForCross_10:
        MOVS     R1,R7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackRightCrossStep3
        CMP      R0,#+0
        BNE.N    ??BlackRightAgainForCross_11
// 1753     {
// 1754       return 0;
        MOVS     R0,#+0
        B.N      ??BlackRightAgainForCross_3
// 1755     }
// 1756     
// 1757     return 1;
??BlackRightAgainForCross_11:
        MOVS     R0,#+1
??BlackRightAgainForCross_3:
        POP      {R1,R4-R9,PC}    ;; return
// 1758         
// 1759 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     0x437a0000
// 1760 
// 1761 
// 1762 //======================================================================
// 1763 //函数名：BlackRightStep4BackLine
// 1764 //功  能：右黑线提取中，第4阶段十字向后补线函数。
// 1765 //参  数：Step4StartLine开始行
// 1766 //返  回：1成功 0失败
// 1767 //影  响：BlackRightLoc[][0]
// 1768 //说  明：1. 这里引用了float型的函数，有可能占用较长的时间。
// 1769 //        2. 想要减少时间，可以把宏定义BlackBackLineNum减至3或者2.
// 1770 //             
// 1771 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1772 uint8 BlackRightStep4BackLine(uint8 Step4StartLine)
// 1773 {
BlackRightStep4BackLine:
        PUSH     {R2-R6,LR}
        MOVS     R4,R0
// 1774   uint8 row;
// 1775   uint8 i, index;
// 1776   uint8 x[BlackBackLineNum];   //取多少个点在一开始有定义。
// 1777   uint8 y[BlackBackLineNum];
// 1778   uint8 j;
// 1779   float temp;
// 1780     
// 1781   float a0, a1;
// 1782   
// 1783   //取BlackBackLineNum个点作为最小二乘法的基准点。
// 1784   //以左上角为原点，向下为x轴正方向，向右为y轴正方向
// 1785   index = 0;
        MOVS     R1,#+0
// 1786   for(i = Step4StartLine; ; i--)
        MOVS     R0,R4
        B.N      ??BlackRightStep4BackLine_0
??BlackRightStep4BackLine_1:
        SUBS     R0,R0,#+1
// 1787   {
// 1788     if(BlackRightLoc[i][0] != MaxValUint8)
??BlackRightStep4BackLine_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable21_1
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        CMP      R2,#+255
        BEQ.N    ??BlackRightStep4BackLine_2
// 1789     {
// 1790       y[index] = BlackRightLoc[i][0];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable21_1
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R3,SP,#+0
        STRB     R2,[R1, R3]
// 1791       x[index] = i;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R2,SP,#+4
        STRB     R0,[R1, R2]
// 1792       index++;
        ADDS     R1,R1,#+1
// 1793     }
// 1794     if(index == BlackBackLineNum)
??BlackRightStep4BackLine_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+4
        BNE.N    ??BlackRightStep4BackLine_3
// 1795     {
// 1796       break;  
// 1797     }
// 1798     if(i == 0)
// 1799     {
// 1800       return 0;
// 1801     }
// 1802   }
// 1803   
// 1804   //最小二乘法
// 1805   //y = a0 + a1 * x
// 1806   a1 = LeastSquarea1(x, y, BlackBackLineNum);
        MOVS     R2,#+4
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea1
        MOVS     R6,R0
// 1807   a0 = LeastSquarea0(x, y, a1, BlackBackLineNum);
        MOVS     R3,#+4
        MOVS     R2,R6
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea0
        MOVS     R5,R0
// 1808   
// 1809   for(row = Step4StartLine + 1; row <= CameraHight - 1; row++)
        ADDS     R4,R4,#+1
        B.N      ??BlackRightStep4BackLine_4
??BlackRightStep4BackLine_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??BlackRightStep4BackLine_1
        MOVS     R0,#+0
        B.N      ??BlackRightStep4BackLine_5
// 1810   {
// 1811     //补线也有个度，向右和向左都不能补出范围。
// 1812     temp = a0 + a1 * row;
// 1813     if(temp > CameraRealWidth)
// 1814     {
// 1815       //BlackRightLoc[row][0] = CameraRealWidth - 1;
// 1816       //超过左右界限时，原策略为置边界值，现在的策略是从该行起置无效值。
// 1817       for(j = row; ; j++)
// 1818       {
// 1819         BlackRightLoc[row][0] = MaxValUint8;
// 1820         if(j == CameraHight - 1) break;
// 1821       }
// 1822       break;
// 1823     }
// 1824     else if(temp < 0)
// 1825     {
// 1826       //BlackRightLoc[row][0] = 0;
// 1827       //超过左右界限时，原策略为置边界值，现在的策略是从该行起置无效值。我
// 1828       for(j = row; ; j++)
// 1829       {
// 1830         BlackRightLoc[row][0] = MaxValUint8;
// 1831         if(j == CameraHight - 1) break;
// 1832       }
// 1833       break;
// 1834     }
// 1835     else
// 1836     {
// 1837       BlackRightLoc[row][0] = (uint8)(temp); 
??BlackRightStep4BackLine_6:
        BL       __aeabi_f2iz
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21_1
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
// 1838     }
        ADDS     R4,R4,#+1
??BlackRightStep4BackLine_4:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+50
        BCS.N    ??BlackRightStep4BackLine_7
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        BL       __aeabi_ui2f
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable24  ;; 0x437a0001
        BL       __aeabi_cfrcmple
        BHI.N    ??BlackRightStep4BackLine_8
        MOVS     R0,R4
        B.N      ??BlackRightStep4BackLine_9
??BlackRightStep4BackLine_10:
        ADDS     R0,R0,#+1
??BlackRightStep4BackLine_9:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21_1
        MLA      R1,R1,R4,R2
        MOVS     R2,#+255
        STRB     R2,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??BlackRightStep4BackLine_10
        B.N      ??BlackRightStep4BackLine_7
??BlackRightStep4BackLine_8:
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??BlackRightStep4BackLine_6
        MOVS     R0,R4
        B.N      ??BlackRightStep4BackLine_11
??BlackRightStep4BackLine_12:
        ADDS     R0,R0,#+1
??BlackRightStep4BackLine_11:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21_1
        MLA      R1,R1,R4,R2
        MOVS     R2,#+255
        STRB     R2,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??BlackRightStep4BackLine_12
// 1839   }
// 1840   
// 1841   return 1;
??BlackRightStep4BackLine_7:
        MOVS     R0,#+1
??BlackRightStep4BackLine_5:
        POP      {R1,R2,R4-R6,PC}  ;; return
// 1842   
// 1843 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     BlackLeftCrossDone

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_1:
        DC32     BlackLeftCrossTooLowLine
// 1844 
// 1845 
// 1846 //======================================================================
// 1847 //函数名：BlackGetRight
// 1848 //功  能：右黑线提取算法
// 1849 //参  数：无
// 1850 //返  回：1成功 0失败
// 1851 //影  响：BlackRightCrossDone，BlackRightLoc[][],
// 1852 //        BlackRightRealWB[], BlackRightRealW[], BlackRightRealB[],
// 1853 //        LimitRightWB, LimitRightW, LimitRightB
// 1854 //说  明：1. 暂时可以处理直道，弯道，十字路口3种情况。2014.11.10
// 1855 //      
// 1856 //       
// 1857 //       
// 1858 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1859 uint8 BlackGetRight(void)
// 1860 {
BlackGetRight:
        PUSH     {R3-R11,LR}
// 1861     uint8 row, temp, temp1, temp2, temp3, i;
// 1862     uint8 GapCount, Row1RealLastLine, index;
// 1863     uint8 Step4Flag, Step4StartLine;
// 1864     
// 1865     //第4阶段进入标志。
// 1866     Step4Flag = 0;
        MOVS     R5,#+0
// 1867 
// 1868     //默认十字检测标志置为未进入。
// 1869     BlackRightCrossDone = 0;
        LDR.W    R0,??DataTable25
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 1870     
// 1871     
// 1872     //第1阶段。这1阶段有可能会返回黑线提取失败
// 1873     temp = BlackGetRightStep1Scan(CameraHight - 1, CameraHight - BlackStep1Size - 1, 1);
        MOVS     R2,#+1
        MOVS     R1,#+14
        MOVS     R0,#+49
        BL       BlackGetRightStep1Scan
        MOVS     R7,R0
// 1874     if(temp == MaxValUint8)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+255
        BNE.N    ??BlackGetRight_0
// 1875     {
// 1876       return 0;
        MOVS     R0,#+0
        B.N      ??BlackGetRight_1
// 1877     }
// 1878     else
// 1879     {
// 1880       row = temp;
??BlackGetRight_0:
        MOV      R10,R7
// 1881       //如果起始线头的位置非常高，就认为是十字的前两个角，需要进入第4阶段向后补线。    
// 1882       if(row < CameraHight - BlackRightBackLineStart)
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+42
        BCS.N    ??BlackGetRight_2
// 1883       {
// 1884         Step4Flag = 1;
        MOVS     R5,#+1
// 1885         Step4StartLine = row;
        MOV      R6,R10
// 1886       }
// 1887 
// 1888     }
// 1889     
// 1890     
// 1891     //第2阶段。到了这一阶段，已经不会返回黑线提取失败 
// 1892     //下面开始利用斜率找黑点。
// 1893     //上次已经处理完了第row-1行，下一次要处理第row-2行
// 1894     //BlackRightSlope();
// 1895     
// 1896     //temp为预测的黑点位置
// 1897     //对预测值进行限定。
// 1898     if((BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0]) < 0)
??BlackGetRight_2:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable21_1
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21_1
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21_1
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+0
        BPL.N    ??BlackGetRight_3
// 1899     {
// 1900       temp = 0;
        MOVS     R7,#+0
        B.N      ??BlackGetRight_4
// 1901     }
// 1902     else if((BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0]) >= CameraRealWidth) 
??BlackGetRight_3:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable21_1
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21_1
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21_1
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+250
        BLT.N    ??BlackGetRight_5
// 1903     {         
// 1904       temp = CameraRealWidth - 1; 
        MOVS     R7,#+249
        B.N      ??BlackGetRight_4
// 1905     }
// 1906     else
// 1907     {
// 1908       temp = BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0];
??BlackGetRight_5:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable21_1
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21_1
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        ADDS     R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21_1
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R7,R0,R1
// 1909     }
// 1910     
// 1911     index = 0;
??BlackGetRight_4:
        MOVS     R8,#+0
// 1912     
// 1913     GapCount = 0;  //连续多少行没有采到黑线
        MOVS     R9,#+0
// 1914     //从最近的认证行到取最远的行
// 1915     for(row -= 2; ; row -= 2)
        SUBS     R10,R10,#+2
        B.N      ??BlackGetRight_6
??BlackGetRight_7:
        SUBS     R10,R10,#+2
// 1916     {
// 1917       //如果连续两行的黑点检测成功，则更新预测点的位置
// 1918       temp1 = BlackGetRightStep2Win(row, BlackRightWinVal, temp);
??BlackGetRight_6:
        MOVS     R2,R7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        MOV      R0,R10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetRightStep2Win
        MOV      R11,R0
// 1919       temp2 = BlackGetRightStep2Win(row-1, BlackRightWinVal, temp);
        MOVS     R2,R7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        SUBS     R0,R10,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetRightStep2Win
// 1920       temp3 = (
// 1921               (!temp1)
// 1922             &&(!temp2)
// 1923             &&(!Step4Flag)
// 1924               );
        ORRS     R1,R0,R11
        ORRS     R1,R5,R1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??BlackGetRight_8
        MOVS     R1,#+1
        B.N      ??BlackGetRight_9
??BlackGetRight_8:
        MOVS     R1,#+0
// 1925       if(temp1 && temp2) 
??BlackGetRight_9:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+0
        BEQ.N    ??BlackGetRight_10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BlackGetRight_10
// 1926       {
// 1927         //对预测值进行限定。
// 1928         if((BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0]) < 0)
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable21_1
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21_1
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21_1
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+0
        BPL.N    ??BlackGetRight_11
// 1929         {
// 1930           temp = 0;
        MOVS     R7,#+0
        B.N      ??BlackGetRight_12
// 1931         }
// 1932         else if((BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0]) >= CameraRealWidth) 
??BlackGetRight_11:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable21_1
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21_1
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21_1
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+250
        BLT.N    ??BlackGetRight_13
// 1933         {         
// 1934           temp = CameraRealWidth - 1; 
        MOVS     R7,#+249
        B.N      ??BlackGetRight_12
// 1935         }
// 1936         else
// 1937         {
// 1938           temp = BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0];
??BlackGetRight_13:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable21_1
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21_1
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        ADDS     R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21_1
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R7,R0,R1
        B.N      ??BlackGetRight_12
// 1939         }
// 1940       }
// 1941       //如果没能连续两行检测黑点成功，则不更新预测点位置，采用原位置。
// 1942       //如果连续两行均采集黑线失败，则记数，记到一定值就再来一次Step1
// 1943       //如果第4阶段检测标志置位，就不用进入十字检测了。
// 1944       else if(temp3)
??BlackGetRight_10:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??BlackGetRight_12
// 1945       {       
// 1946         //Row1RealLastLine记录第1段黑线的最后一行。
// 1947         if(index == 0)
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??BlackGetRight_14
// 1948         {
// 1949           //进来一次后，就再也不会进来了。
// 1950           index++;
        ADDS     R8,R8,#+1
// 1951           for(i = row; i < (row + 5); i++)
        MOV      R0,R10
        B.N      ??BlackGetRight_15
??BlackGetRight_16:
        ADDS     R0,R0,#+1
??BlackGetRight_15:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        ADDS     R1,R10,#+5
        CMP      R0,R1
        BGE.N    ??BlackGetRight_17
// 1952           {
// 1953             if(BlackRightLoc[i][0] != MaxValUint8)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21_1
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??BlackGetRight_16
// 1954             {
// 1955               Row1RealLastLine = i;
        MOVS     R4,R0
// 1956               break;
// 1957             }
// 1958           }
// 1959           if(Row1RealLastLine >= CameraHight - 1)
??BlackGetRight_17:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+49
        BCC.N    ??BlackGetRight_14
// 1960           {
// 1961             Row1RealLastLine = CameraHight - 1;
        MOVS     R4,#+49
// 1962           }
// 1963           else
// 1964           {
// 1965           }
// 1966         }
// 1967         
// 1968         GapCount += 2;
??BlackGetRight_14:
        ADDS     R9,R9,#+2
// 1969         ///////////////////////////////进入十字重新检测的条件还要再严格一些，减少没必要的时间，比如说前面最多只允许检测到多少行。
// 1970         if(GapCount > BlackCrossGapLine)
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+11
        BCC.N    ??BlackGetRight_18
// 1971         {
// 1972           //再检测时的行太远了，就没必要检测了。
// 1973           if(row < BlackRightCrossTooLowLine)
        LDR.W    R0,??DataTable26
        LDRB     R0,[R0, #+0]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,R0
        BCC.N    ??BlackGetRight_19
// 1974           {
// 1975             break;
// 1976           }
// 1977           else
// 1978           {
// 1979           }
// 1980           
// 1981           //这个的行怎么取？？？？？？？？？？？？？？？
// 1982           if(!BlackRightAgainForCross(row - 2, 1, Row1RealLastLine))
??BlackGetRight_20:
        MOVS     R2,R4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+1
        SUBS     R0,R10,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackRightAgainForCross
        CMP      R0,#+0
        BNE.N    ??BlackGetRight_21
// 1983           {
// 1984             BlackRightCrossDone = 1;  //十字检测失败            
        LDR.W    R0,??DataTable25
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        B.N      ??BlackGetRight_22
// 1985           }
// 1986           else
// 1987           {
// 1988             BlackRightCrossDone = 2;  //十字检测成功
??BlackGetRight_21:
        LDR.W    R0,??DataTable25
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
// 1989           }
// 1990           break;  //十字再检测里会开窗检测到指定的最后一行，所以不用再循环了，直接跳出
??BlackGetRight_22:
        B.N      ??BlackGetRight_19
// 1991         }
// 1992         else
// 1993         {
// 1994            BlackRightCrossDone = 0;    //十字检测未进入
??BlackGetRight_18:
        LDR.W    R0,??DataTable25
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 1995         }
// 1996       
// 1997       }
// 1998       else
// 1999       {       
// 2000       }
// 2001       
// 2002       
// 2003       if((row == 0) || (row == 1)) break;
??BlackGetRight_12:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BEQ.N    ??BlackGetRight_23
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+1
        BNE.W    ??BlackGetRight_7
// 2004       
// 2005     }
// 2006     
// 2007     
// 2008     //第4阶段，采集到十字的前两个角，向后补线。这里有浮点运算，要严格控制调用。
// 2009     //////////////////////////其实想想，向后补线有用吗，方便人看，但似乎对车没太大用。
// 2010     if(Step4Flag)
??BlackGetRight_23:
??BlackGetRight_19:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??BlackGetRight_24
// 2011     {
// 2012       if(!BlackRightStep4BackLine(Step4StartLine))
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackRightStep4BackLine
        CMP      R0,#+0
        BNE.N    ??BlackGetRight_24
// 2013       {
// 2014         return 0;  
        MOVS     R0,#+0
        B.N      ??BlackGetRight_1
// 2015       }
// 2016     }
// 2017     
// 2018     
// 2019     return 1;
??BlackGetRight_24:
        MOVS     R0,#+1
??BlackGetRight_1:
        POP      {R1,R4-R11,PC}   ;; return
// 2020 
// 2021   
// 2022   
// 2023 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     BlackRightRealWB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_1:
        DC32     BlackRightRealW

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_2:
        DC32     BlackLeftDone

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_3:
        DC32     ImgNew
// 2024 
// 2025 
// 2026 //======================================================================
// 2027 //函数名：BlackGet
// 2028 //功  能：黑线提取程序
// 2029 //参  数：无
// 2030 //返  回：1成功 0失败
// 2031 //影  响：见具体的左、右黑线算法
// 2032 //说  明：1. 学长的黑线提取算法有很多输入参数，用以对不同环境下的黑线进行提取，可以效仿
// 2033 //        2. 左右黑线分开提取，但右黑线提取的起始点以左黑线提取的结果为准（前提是左黑线提取成功）。
// 2034 //        3. 为了防止光线的突变，左右黑线各有2次机会，第2次机会将会把3个关键值赋成原始值再试一次。
// 2035 //           如果不是光线的原因，3个关键值会变回来。
// 2036 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2037 uint8 BlackGet(void)
// 2038 {
BlackGet:
        PUSH     {R4-R6,LR}
// 2039     uint8 tempLWB, tempLW, tempLB;
// 2040     uint8 tempRWB, tempRW, tempRB;
// 2041     //采集成功标志位
// 2042     BlackLeftDone = 1;
        LDR.W    R0,??DataTable26_1
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
// 2043     BlackRightDone = 1;
        LDR.W    R0,??DataTable26_2
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
// 2044     
// 2045     //左黑线提取，成功则返回1，失败则返回0.
// 2046     if(!BlackGetLeft())
        BL       BlackGetLeft
        CMP      R0,#+0
        BNE.N    ??BlackGet_0
// 2047     {
// 2048       //暂存3个关键值。如果不是光线的原因，值就变回来。
// 2049       tempLWB = LimitLeftWB;
        LDR.W    R0,??DataTable26_3
        LDRB     R4,[R0, #+0]
// 2050       tempLW = LimitLeftW;
        LDR.W    R0,??DataTable26_4
        LDRB     R5,[R0, #+0]
// 2051       tempLB = LimitLeftB;
        LDR.W    R0,??DataTable26_5
        LDRB     R6,[R0, #+0]
// 2052       
// 2053       //有可能是光线变化太大，3个关键值改回原来的值，再给1次机会。
// 2054       LimitLeftWB = LimitOriLeftWB;                 
        LDR.W    R0,??DataTable26_3
        MOVS     R1,#+80
        STRB     R1,[R0, #+0]
// 2055       LimitLeftW = LimitOriLeftW;
        LDR.W    R0,??DataTable26_4
        MOVS     R1,#+150
        STRB     R1,[R0, #+0]
// 2056       LimitLeftB = LimitOriLeftB;
        LDR.W    R0,??DataTable26_5
        MOVS     R1,#+80
        STRB     R1,[R0, #+0]
// 2057       
// 2058       //不是光线的原因。
// 2059       if(!BlackGetLeft())
        BL       BlackGetLeft
        CMP      R0,#+0
        BNE.N    ??BlackGet_1
// 2060       {
// 2061         //不是光线的原因的情况下，把3个关键值变回来。
// 2062         LimitLeftWB = tempLWB;
        LDR.W    R0,??DataTable26_3
        STRB     R4,[R0, #+0]
// 2063         LimitLeftW = tempLW;
        LDR.W    R0,??DataTable26_4
        STRB     R5,[R0, #+0]
// 2064         LimitLeftB = tempLB;
        LDR.W    R0,??DataTable26_5
        STRB     R6,[R0, #+0]
// 2065         
// 2066         //uart_sendN(UART0, (uint8 *)"\nFailed In BlackGetLeft!", 24);  
// 2067         BlackLeftDone = 0;
        LDR.W    R0,??DataTable26_1
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        B.N      ??BlackGet_0
// 2068       }
// 2069       //的确是光线的原因。
// 2070       else
// 2071       {
// 2072         BlackLeft3ResetCount++;    //由于光线变化太大引起的3个关键值重置的次数。
??BlackGet_1:
        LDR.W    R0,??DataTable26_6
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable26_6
        STRB     R0,[R1, #+0]
// 2073       }
// 2074     }
// 2075     
// 2076     
// 2077     //右黑线提取，成功则返回1，失败则返回0.
// 2078     if(!BlackGetRight())
??BlackGet_0:
        BL       BlackGetRight
        CMP      R0,#+0
        BNE.N    ??BlackGet_2
// 2079     {
// 2080       //暂存3个关键值。如果不是光线的原因，值就变回来。
// 2081       tempRWB = LimitRightWB;
        LDR.N    R0,??DataTable21_2
        LDRB     R4,[R0, #+0]
// 2082       tempRW = LimitRightW;
        LDR.N    R0,??DataTable21_3
        LDRB     R5,[R0, #+0]
// 2083       tempRB = LimitRightB;
        LDR.N    R0,??DataTable21_4
        LDRB     R6,[R0, #+0]
// 2084       
// 2085       //有可能是光线变化太大，3个关键值改回原来的值，再给1次机会。
// 2086       LimitRightWB = LimitOriRightWB;                 
        LDR.N    R0,??DataTable21_2
        MOVS     R1,#+80
        STRB     R1,[R0, #+0]
// 2087       LimitRightW = LimitOriRightW;
        LDR.N    R0,??DataTable21_3
        MOVS     R1,#+150
        STRB     R1,[R0, #+0]
// 2088       LimitRightB = LimitOriRightB;
        LDR.N    R0,??DataTable21_4
        MOVS     R1,#+80
        STRB     R1,[R0, #+0]
// 2089 
// 2090       //不是光线的原因的情况下，把3个关键值变回来。
// 2091       if(!BlackGetRight())
        BL       BlackGetRight
        CMP      R0,#+0
        BNE.N    ??BlackGet_3
// 2092       {
// 2093         LimitRightWB = tempRWB;
        LDR.N    R0,??DataTable21_2
        STRB     R4,[R0, #+0]
// 2094         LimitRightW = tempRW;
        LDR.N    R0,??DataTable21_3
        STRB     R5,[R0, #+0]
// 2095         LimitRightB = tempRB;
        LDR.N    R0,??DataTable21_4
        STRB     R6,[R0, #+0]
// 2096       
// 2097         //uart_sendN(UART0, (uint8 *)"\nFailed In BlackGetRight!", 25);  
// 2098         BlackRightDone = 0;
        LDR.W    R0,??DataTable26_2
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        B.N      ??BlackGet_2
// 2099       }
// 2100       //的确是光线的原因。
// 2101       else
// 2102       {
// 2103         BlackRight3ResetCount++;    //由于光线变化太大引起的3个关键值重置的次数。
??BlackGet_3:
        LDR.W    R0,??DataTable26_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable26_7
        STRB     R0,[R1, #+0]
// 2104       }
// 2105     }
// 2106     
// 2107     //左、右黑线均提取失败，则黑线提取失败。
// 2108     if((BlackLeftDone == 0) && (BlackRightDone == 0))
??BlackGet_2:
        LDR.W    R0,??DataTable26_1
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable26_2
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??BlackGet_4
// 2109     {
// 2110       return 0;
        MOVS     R0,#+0
        B.N      ??BlackGet_5
// 2111     }    
// 2112     //暂时还是不采取这种向后补线的方式，因为的确存在一边是十字补线，一边是向后补线的情况。
// 2113     /*
// 2114     //左、右黑线均提取成功，则看一下是否需要向后补线。
// 2115     else if((BlackLeftDone == 1) && (BlackRightDone == 1))
// 2116     {
// 2117       //左、右黑线均要求向后补线时，才执行补线程序。否则有可能是弯道使线头上浮的情况。
// 2118       if((BlackLeftStep4Flag == 1) && (BlackRightStep4Flag == 1))
// 2119       {
// 2120         BlackLeftStep4BackLine(BlackLeftStep4StartLine);
// 2121         BlackRightStep4BackLine(BlackRightStep4StartLine);
// 2122       }
// 2123       
// 2124     }
// 2125     */
// 2126     else
// 2127     {
// 2128       
// 2129     }
// 2130     
// 2131     return 1;
??BlackGet_4:
        MOVS     R0,#+1
??BlackGet_5:
        POP      {R4-R6,PC}       ;; return
// 2132 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21:
        DC32     BlackRightRealB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_1:
        DC32     BlackRightLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_2:
        DC32     LimitRightWB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_3:
        DC32     LimitRightW

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_4:
        DC32     LimitRightB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_5:
        DC32     `?<Constant "\\nError In BlackRightC...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_6:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_7:
        DC32     0x3ff00000
// 2133 
// 2134 
// 2135 
// 2136 
// 2137 
// 2138 
// 2139 
// 2140 
// 2141 
// 2142 /*
// 2143 //======================================================================
// 2144 //函数名：CenterLineGet
// 2145 //功  能：中心线提取函数
// 2146 //参  数：无
// 2147 //返  回：1成功 0失败
// 2148 //影  响：CenterLineLoc[]
// 2149 //说  明：1. 暂定为取左右有效黑线的中点，为基础版本。2014.11.11
// 2150 //      
// 2151 //             
// 2152 //======================================================================
// 2153 uint8 CenterLineGet(void)
// 2154 {
// 2155   uint8 row;
// 2156   uint8 templ, tempr;
// 2157     
// 2158   //左、右黑线均提取失败。
// 2159   if((BlackLeftDone == 0) && (BlackRightDone ==  0))
// 2160   {
// 2161     return 0;  
// 2162   }
// 2163   
// 2164   for(row = CameraHight - 1; ; row--)
// 2165   {
// 2166     templ = BlackLeftLoc[row][0];
// 2167     tempr = BlackRightLoc[row][0];
// 2168     
// 2169     //左、右黑线均提取成功。
// 2170     if((BlackLeftDone == 1) && (BlackRightDone ==  1))
// 2171     {   
// 2172       //该行左右黑线都提取到了。
// 2173       if((templ != MaxValUint8) && (tempr != MaxValUint8))  
// 2174       {
// 2175         CenterLineLoc[row] = (templ + tempr) / 2;
// 2176       }
// 2177       //该行左黑线提取到了，右黑线提取失败。
// 2178       else if((templ != MaxValUint8) && (tempr == MaxValUint8))
// 2179       {
// 2180         CenterLineLoc[row] = templ + CenterLineHalfWidth[row];
// 2181       }
// 2182       //该行右黑线提取到了，左黑线提取失败。
// 2183       else if((tempr != MaxValUint8) && (templ == MaxValUint8))  
// 2184       {
// 2185         CenterLineLoc[row] = tempr - CenterLineHalfWidth[row];
// 2186       }
// 2187       //该行左、右黑线均提取失败，该行中心点赋无效值。
// 2188       else 
// 2189       {
// 2190         CenterLineLoc[row] = MaxValUint8;  
// 2191       }
// 2192     }
// 2193     //左黑线提取成功，右黑线提取失败
// 2194     else if((BlackLeftDone == 1) && (BlackRightDone ==  0))
// 2195     {
// 2196       if(templ != MaxValUint8)
// 2197       {
// 2198         CenterLineLoc[row] = templ + CenterLineHalfWidth[row];
// 2199       }
// 2200       else 
// 2201       {
// 2202         CenterLineLoc[row] = MaxValUint8;
// 2203       }
// 2204     }
// 2205     //右黑线提取成功，左黑线提取失败
// 2206     else if((BlackLeftDone == 0) && (BlackRightDone ==  1))
// 2207     {
// 2208       if(tempr != MaxValUint8)
// 2209       {
// 2210         CenterLineLoc[row] = tempr - CenterLineHalfWidth[row];
// 2211       }
// 2212       else 
// 2213       {
// 2214         CenterLineLoc[row] = MaxValUint8;
// 2215       }
// 2216     }
// 2217     else
// 2218     {
// 2219       
// 2220     }
// 2221     
// 2222     //如果处理到了最后一行，就跳出for循环。
// 2223     if(row == 0) break;
// 2224   }
// 2225   return 1;
// 2226   
// 2227 }
// 2228 */
// 2229 
// 2230 
// 2231 
// 2232 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2233 uint8 CenterLineGet(void)
// 2234 {
CenterLineGet:
        PUSH     {R4-R6,LR}
// 2235   uint8 row, i, j;
// 2236   uint8 templ, tempr;
// 2237   uint8 FailCount;
// 2238   uint8 tempmax;
// 2239   //uint8 flag001 = 0;
// 2240   //左、右黑线均提取失败。
// 2241   if((BlackLeftDone == 0) && (BlackRightDone ==  0))
        LDR.W    R0,??DataTable26_1
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable26_2
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??CenterLineGet_0
// 2242   {
// 2243     return 0;  
        MOVS     R0,#+0
        B.N      ??CenterLineGet_1
// 2244   }
// 2245     
// 2246   //左、右黑线均提取成功。
// 2247   if((BlackLeftDone == 1) && (BlackRightDone ==  1))
??CenterLineGet_0:
        LDR.W    R0,??DataTable26_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??CenterLineGet_2
        LDR.W    R0,??DataTable26_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??CenterLineGet_2
// 2248   {
// 2249     FailCount = 0;
        MOVS     R4,#+0
// 2250     for(row = CameraHight - 1; ; row--)
        MOVS     R5,#+49
        B.N      ??CenterLineGet_3
??CenterLineGet_4:
        SUBS     R5,R5,#+1
// 2251     {
// 2252       templ = BlackLeftLoc[row][0];
??CenterLineGet_3:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable26_8
        MLA      R0,R0,R5,R1
        LDRB     R2,[R0, #+0]
// 2253       tempr = BlackRightLoc[row][0];
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable26_9
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
// 2254       //该行左右黑线都提取到了。
// 2255       if((templ != MaxValUint8) && (tempr != MaxValUint8))  
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+255
        BEQ.N    ??CenterLineGet_5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_5
// 2256       {        
// 2257         CenterLineLoc[row] = (templ + tempr) / 2;    
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTAB    R0,R0,R2
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2258       }
// 2259       //该行左黑线提取失败，右黑线提取成功。
// 2260       else if((templ == MaxValUint8) && (tempr != MaxValUint8))
??CenterLineGet_5:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+255
        BNE.W    ??CenterLineGet_7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+255
        BEQ.W    ??CenterLineGet_7
// 2261       {
// 2262         //根据右线来估计中心线的走向，前提是上一行的右黑线有有效值。
// 2263         if((row != (CameraHight-1))&&(BlackRightLoc[row+1][0] != MaxValUint8))
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+49
        BEQ.W    ??CenterLineGet_8
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable26_9
        MLA      R1,R1,R5,R2
        LDRB     R1,[R1, #+3]
        CMP      R1,#+255
        BEQ.W    ??CenterLineGet_8
// 2264         { //前一行的中心线有效。
// 2265           if(CenterLineLoc[row+1] != MaxValUint8)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        ADDS     R1,R5,R1
        LDRB     R1,[R1, #+1]
        CMP      R1,#+255
        BEQ.N    ??CenterLineGet_9
// 2266           {
// 2267             CenterLineLoc[row] = CenterLineLoc[row+1] + tempr - BlackRightLoc[row+1][0];
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        ADDS     R1,R5,R1
        LDRB     R1,[R1, #+1]
        ADDS     R0,R0,R1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable26_9
        MLA      R1,R1,R5,R2
        LDRB     R1,[R1, #+3]
        SUBS     R0,R0,R1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2268           }
// 2269           //前一行的中心线无效。
// 2270           //如果是近处的行，那就有可能是270度左右黑线错位的情况。
// 2271           else if(row > CameraHight - 5)
??CenterLineGet_9:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+46
        BCC.N    ??CenterLineGet_10
// 2272           {
// 2273             if(CenterLocStore != MaxValUint8)
        LDR.W    R0,??DataTable26_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_11
// 2274             {
// 2275               CenterLineLoc[row] = BlackRightLoc[row][0] - CenterLocStore;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable26_9
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable26_11
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2276             }
// 2277             else
// 2278             {
// 2279               CenterLineLoc[row] = BlackRightLoc[row][0] - CenterLineHalfWidth[row];
??CenterLineGet_11:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable26_9
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_12
        LDRB     R1,[R5, R1]
        SUBS     R0,R0,R1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2280             }
// 2281             //flag001 = 1; //flag001是标志位，用以防止开头几行的中心线不连续的情况。
// 2282           }
// 2283           else
// 2284           { //行数够低才处理，否则不考虑。
// 2285             if(row <= CameraHight - 3)
??CenterLineGet_10:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+48
        BCS.N    ??CenterLineGet_12
// 2286             { //连续3行找符合要求的行。
// 2287               for(i = 2; i <= 4; i++)
        MOVS     R1,#+2
        B.N      ??CenterLineGet_13
??CenterLineGet_14:
        ADDS     R1,R1,#+1
??CenterLineGet_13:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+5
        BCS.N    ??CenterLineGet_15
// 2288               {
// 2289                 if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackRightLoc[row+i][0] != MaxValUint8))
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R2,R1,R5
        LDR.W    R3,??DataTable26_10
        LDRB     R2,[R2, R3]
        CMP      R2,#+255
        BEQ.N    ??CenterLineGet_14
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R2,R1,R5
        MOVS     R3,#+3
        LDR.W    R6,??DataTable26_9
        MLA      R2,R3,R2,R6
        LDRB     R2,[R2, #+0]
        CMP      R2,#+255
        BEQ.N    ??CenterLineGet_14
// 2290                 {
// 2291                    CenterLineLoc[row] = CenterLineLoc[row+i] + tempr - BlackRightLoc[row+i][0]; 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R2,R1,R5
        LDR.W    R3,??DataTable26_10
        LDRB     R2,[R2, R3]
        ADDS     R0,R0,R2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R2,R1,R5
        MOVS     R3,#+3
        LDR.W    R6,??DataTable26_9
        MLA      R2,R3,R2,R6
        LDRB     R2,[R2, #+0]
        SUBS     R0,R0,R2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R2,??DataTable26_10
        STRB     R0,[R5, R2]
// 2292                    break;
// 2293                 }
// 2294               }
// 2295               //连续3行没有找到符合要求的行。
// 2296               if(i == 5) CenterLineLoc[row] = MaxValUint8; //置无效值
??CenterLineGet_15:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+5
        BNE.W    ??CenterLineGet_6
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
        B.N      ??CenterLineGet_6
// 2297             }        
// 2298             else
// 2299             {   //行数过高，不考虑这种情况。
// 2300                 CenterLineLoc[row] = MaxValUint8; //置无效值
??CenterLineGet_12:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
        B.N      ??CenterLineGet_6
// 2301             }
// 2302           }
// 2303         }
// 2304         else
// 2305         {
// 2306           CenterLineLoc[row] = MaxValUint8; //置无效值
??CenterLineGet_8:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
        B.N      ??CenterLineGet_6
// 2307         }
// 2308       }
// 2309       //该行右黑线提取失败，左黑线提取成功。
// 2310       else if((templ != MaxValUint8) && (tempr == MaxValUint8))
??CenterLineGet_7:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+255
        BEQ.W    ??CenterLineGet_16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+255
        BNE.W    ??CenterLineGet_16
// 2311       {
// 2312         //根据左线来估计中心线的走向，前提是上一行的左黑线有有效值。
// 2313         if((row != CameraHight - 1)&&(BlackLeftLoc[row+1][0] != MaxValUint8))
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+49
        BEQ.W    ??CenterLineGet_17
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable26_8
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+3]
        CMP      R0,#+255
        BEQ.W    ??CenterLineGet_17
// 2314         {  //上一行的中心线有效。
// 2315           if(CenterLineLoc[row+1] != MaxValUint8)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_18
// 2316           {
// 2317             CenterLineLoc[row] = CenterLineLoc[row + 1] + templ - BlackLeftLoc[row+1][0];
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        ADDS     R0,R2,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable26_8
        MLA      R1,R1,R5,R2
        LDRB     R1,[R1, #+3]
        SUBS     R0,R0,R1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2318           }
// 2319           //上一行的中心线无效。
// 2320           //如果是近处的行，那就有可能是270度左右黑线错位的情况。
// 2321           else if(row > CameraHight - 3)
??CenterLineGet_18:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+48
        BCC.N    ??CenterLineGet_19
// 2322           { 
// 2323             if(CenterLocStore != MaxValUint8)
        LDR.W    R0,??DataTable26_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_20
// 2324             {
// 2325               CenterLineLoc[row] = BlackLeftLoc[row][0] + CenterLocStore;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable26_8
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable26_11
        LDRB     R1,[R1, #+0]
        ADDS     R0,R1,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2326             }
// 2327             else
// 2328             {
// 2329               CenterLineLoc[row] = BlackLeftLoc[row][0] + CenterLineHalfWidth[row];
??CenterLineGet_20:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable26_8
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_12
        LDRB     R1,[R5, R1]
        ADDS     R0,R1,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2330             }
// 2331             //flag001 = 1; //flag001是标志位，用以防止开头几行的中心线不连续的情况。
// 2332           }
// 2333           else
// 2334           { //连续3行找符合条件的行
// 2335             if(row <= CameraHight - 5)
??CenterLineGet_19:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+46
        BCS.N    ??CenterLineGet_21
// 2336             {
// 2337               for(i = 2; i <= 4; i++)
        MOVS     R1,#+2
        B.N      ??CenterLineGet_22
??CenterLineGet_23:
        ADDS     R1,R1,#+1
??CenterLineGet_22:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+5
        BCS.N    ??CenterLineGet_24
// 2338               {
// 2339                 if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackLeftLoc[row+i][0] != MaxValUint8))
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R0,R1,R5
        LDR.W    R3,??DataTable26_10
        LDRB     R0,[R0, R3]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_23
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R0,R1,R5
        MOVS     R3,#+3
        LDR.W    R6,??DataTable26_8
        MLA      R0,R3,R0,R6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_23
// 2340                 { //找到了符合条件的行。
// 2341                   CenterLineLoc[row] = CenterLineLoc[row+i] + templ - BlackLeftLoc[row+i][0];
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R0,R1,R5
        LDR.W    R3,??DataTable26_10
        LDRB     R0,[R0, R3]
        ADDS     R0,R2,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R2,R1,R5
        MOVS     R3,#+3
        LDR.W    R6,??DataTable26_8
        MLA      R2,R3,R2,R6
        LDRB     R2,[R2, #+0]
        SUBS     R0,R0,R2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R2,??DataTable26_10
        STRB     R0,[R5, R2]
// 2342                   break;
// 2343                 }
// 2344               }
// 2345               if(i == 5) CenterLineLoc[row] = MaxValUint8; ////连续3行没有找到符合条件的行.置无效值
??CenterLineGet_24:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+5
        BNE.N    ??CenterLineGet_6
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
        B.N      ??CenterLineGet_6
// 2346             }
// 2347             else
// 2348             { //行数太高，不考虑这种情况。 
// 2349               CenterLineLoc[row] = MaxValUint8; //置无效值
??CenterLineGet_21:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
        B.N      ??CenterLineGet_6
// 2350             }
// 2351           }
// 2352         }
// 2353         else
// 2354         {
// 2355           CenterLineLoc[row] = MaxValUint8; //置无效值
??CenterLineGet_17:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
        B.N      ??CenterLineGet_6
// 2356         }
// 2357       }
// 2358       //该行左右线均提取失败。
// 2359       else 
// 2360       {
// 2361         CenterLineLoc[row] = MaxValUint8; //置无效值
??CenterLineGet_16:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
// 2362       }
// 2363     if(CenterLineLoc[row] == MaxValUint8) 
??CenterLineGet_6:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        LDRB     R0,[R5, R0]
        CMP      R0,#+255
        BNE.N    ??CenterLineGet_25
// 2364     {
// 2365       FailCount++;
        ADDS     R4,R4,#+1
// 2366       //对无效值的再处理。
// 2367       tempmax = MinRe(BlackLeftHeadLine, BlackRightHeadLine);
        LDR.W    R0,??DataTable27
        LDRB     R1,[R0, #+0]
        LDR.W    R0,??DataTable27_1
        LDRB     R0,[R0, #+0]
        BL       MinRe
// 2368       //第一批条件，行数够远，前3行之外。
// 2369       if(row <= CameraHight-3 && CenterLineLoc[row+1] != MaxValUint8 && CenterLineLoc[row+2] != MaxValUint8)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+48
        BCS.N    ??CenterLineGet_25
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        ADDS     R1,R5,R1
        LDRB     R1,[R1, #+1]
        CMP      R1,#+255
        BEQ.N    ??CenterLineGet_25
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        ADDS     R1,R5,R1
        LDRB     R1,[R1, #+2]
        CMP      R1,#+255
        BEQ.N    ??CenterLineGet_25
// 2370       {
// 2371         //第二批条件，在左右线头之内，超过左右线头则不处理。
// 2372         if(row >= tempmax)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R5,R0
        BCC.N    ??CenterLineGet_25
// 2373         {
// 2374           //第三批条件，补的黑线不超过左右边界。
// 2375           if(CenterLineLoc[row+1] + CenterLineLoc[row+1] - CenterLineLoc[row+2] < 0
// 2376            ||CenterLineLoc[row+1] + CenterLineLoc[row+1] - CenterLineLoc[row+2] > CameraRealWidth - 1)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        ADDS     R1,R5,R1
        LDRB     R1,[R1, #+1]
        UXTAB    R0,R1,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        ADDS     R1,R5,R1
        LDRB     R1,[R1, #+2]
        SUBS     R0,R0,R1
        SUBS     R0,R0,#+0
        CMP      R0,#+250
        BCS.N    ??CenterLineGet_25
// 2377           {           
// 2378           }
// 2379           else
// 2380           {
// 2381             //三批条件均满足
// 2382             CenterLineLoc[row] = CenterLineLoc[row+1] + CenterLineLoc[row+1] - CenterLineLoc[row+2];
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        ADDS     R1,R5,R1
        LDRB     R1,[R1, #+1]
        ADDS     R0,R1,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        ADDS     R1,R5,R1
        LDRB     R1,[R1, #+2]
        SUBS     R0,R0,R1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        STRB     R0,[R5, R1]
// 2383           }
// 2384         }
// 2385         else
// 2386         {
// 2387         }
// 2388       }
// 2389       else
// 2390       {
// 2391       }
// 2392     }
// 2393     if(row == 0) break;
??CenterLineGet_25:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.W    ??CenterLineGet_4
// 2394     }// end of for 
// 2395     
// 2396     if(FailCount >= CameraHight) return 0;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+50
        BCC.N    ??CenterLineGet_26
        MOVS     R0,#+0
        B.N      ??CenterLineGet_1
// 2397     //中心线提取成功，记录线头，作为后面的单线线头。
// 2398     if(row == 0) 
??CenterLineGet_26:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??CenterLineGet_2
// 2399     {
// 2400       for(j = CameraHight - 1; ; j--)
        MOVS     R0,#+49
        B.N      ??CenterLineGet_27
??CenterLineGet_28:
        SUBS     R0,R0,#+1
// 2401       { //最近的3行找线头。
// 2402         if(CenterLineLoc[j] != MaxValUint8 && BlackLeftLoc[j][0] != MaxValUint8 && BlackRightLoc[j][0] != MaxValUint8)
??CenterLineGet_27:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable26_10
        LDRB     R1,[R0, R1]
        CMP      R1,#+255
        BEQ.N    ??CenterLineGet_29
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable26_8
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??CenterLineGet_29
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable26_9
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??CenterLineGet_29
// 2403         {
// 2404           CenterLocStore = (BlackRightLoc[j][0] - BlackLeftLoc[j][0]) / 2;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable26_9
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable26_8
        MLA      R0,R2,R0,R3
        LDRB     R0,[R0, #+0]
        SUBS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        LDR.W    R1,??DataTable26_11
        STRB     R0,[R1, #+0]
// 2405           break;
        B.N      ??CenterLineGet_30
// 2406         }
// 2407         if(j <= CameraHight - 4)
??CenterLineGet_29:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+47
        BCS.N    ??CenterLineGet_28
// 2408         {
// 2409           //CenterLocStore = MaxValUint8;
// 2410           break;
// 2411         }
// 2412       }
// 2413       return 1;
??CenterLineGet_30:
        MOVS     R0,#+1
        B.N      ??CenterLineGet_1
// 2414     }
// 2415   } // end of if
// 2416   
// 2417   
// 2418   
// 2419   //左黑线提取成功，右黑线提取失败。就基本上按左线来估计中心线。
// 2420   if((BlackLeftDone == 1) && (BlackRightDone == 0))
??CenterLineGet_2:
        LDR.W    R0,??DataTable26_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??CenterLineGet_31
        LDR.W    R0,??DataTable26_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.W    ??CenterLineGet_31
// 2421   {
// 2422     //找中心线的线头。
// 2423     for(row = CameraHight - 1; row > CameraHight - BlackStep1Size; row --)
        MOVS     R5,#+49
        B.N      ??CenterLineGet_32
// 2424     {
// 2425       //找左线有效值。 //原为连续两行找有效值，现改为一行。
// 2426       if(BlackLeftLoc[row][0] != MaxValUint8)
// 2427       {
// 2428         if(CenterLocStore != MaxValUint8)
// 2429         {
// 2430           CenterLineLoc[row] = BlackLeftLoc[row][0] + CenterLocStore;
// 2431         }
// 2432         else
// 2433         {
// 2434           CenterLineLoc[row] = BlackLeftLoc[row][0] + CenterLineHalfWidth[row];
// 2435         }
// 2436         break;
// 2437       }
// 2438       else
// 2439       {
// 2440         CenterLineLoc[row] = MaxValUint8;
??CenterLineGet_33:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
// 2441       }
        SUBS     R5,R5,#+1
??CenterLineGet_32:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+16
        BCC.N    ??CenterLineGet_34
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable26_8
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_33
        LDR.W    R0,??DataTable26_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_35
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable26_8
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable26_11
        LDRB     R1,[R1, #+0]
        ADDS     R0,R1,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_36
??CenterLineGet_35:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable26_8
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_12
        LDRB     R1,[R5, R1]
        ADDS     R0,R1,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        STRB     R0,[R5, R1]
// 2442     }
// 2443     //没有找到中心线线头，中心线提取失败。
// 2444     if(row <= CameraHight - BlackStep1Size) return 0;
??CenterLineGet_36:
??CenterLineGet_34:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+16
        BCS.N    ??CenterLineGet_37
        MOVS     R0,#+0
        B.N      ??CenterLineGet_1
// 2445     
// 2446     //找到线头，按照左线的趋势进行中心线的估计。
// 2447     for(row --; ; row--)
??CenterLineGet_37:
        SUBS     R5,R5,#+1
        B.N      ??CenterLineGet_38
??CenterLineGet_39:
        SUBS     R5,R5,#+1
// 2448     {
// 2449       if(BlackLeftLoc[row][0] != MaxValUint8)
??CenterLineGet_38:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable26_8
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_40
// 2450       {   //上一行的中心线有效。
// 2451           if(CenterLineLoc[row+1] != MaxValUint8)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_41
// 2452           {
// 2453             CenterLineLoc[row] = CenterLineLoc[row + 1] + BlackLeftLoc[row][0] - BlackLeftLoc[row+1][0];
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable26_8
        MLA      R1,R1,R5,R2
        LDRB     R1,[R1, #+0]
        ADDS     R0,R1,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable26_8
        MLA      R1,R1,R5,R2
        LDRB     R1,[R1, #+3]
        SUBS     R0,R0,R1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_42
// 2454           }
// 2455           //上一行的中心线无效。
// 2456           else
// 2457           { //连续3行找符合条件的行
// 2458             if(row <= CameraHight - 5)
??CenterLineGet_41:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+46
        BCS.N    ??CenterLineGet_43
// 2459             {
// 2460               for(i = 2; i <= 4; i++)
        MOVS     R1,#+2
        B.N      ??CenterLineGet_44
??CenterLineGet_45:
        ADDS     R1,R1,#+1
??CenterLineGet_44:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+5
        BCS.N    ??CenterLineGet_46
// 2461               {
// 2462                 if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackLeftLoc[row+i][0] != MaxValUint8))
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R0,R1,R5
        LDR.W    R2,??DataTable26_10
        LDRB     R0,[R0, R2]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_45
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R0,R1,R5
        MOVS     R2,#+3
        LDR.W    R3,??DataTable26_8
        MLA      R0,R2,R0,R3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_45
// 2463                 { //找到了符合条件的行。
// 2464                   CenterLineLoc[row] = CenterLineLoc[row+i] + BlackLeftLoc[row][0] - BlackLeftLoc[row+i][0];
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R0,R1,R5
        LDR.W    R2,??DataTable26_10
        LDRB     R0,[R0, R2]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable26_8
        MLA      R2,R2,R5,R3
        LDRB     R2,[R2, #+0]
        ADDS     R0,R2,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R2,R1,R5
        MOVS     R3,#+3
        LDR.W    R4,??DataTable26_8
        MLA      R2,R3,R2,R4
        LDRB     R2,[R2, #+0]
        SUBS     R0,R0,R2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R2,??DataTable26_10
        STRB     R0,[R5, R2]
// 2465                   break;
// 2466                 }
// 2467               }
// 2468               if(i == 5) CenterLineLoc[row] = MaxValUint8; ////连续3行没有找到符合条件的行.置无效值
??CenterLineGet_46:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+5
        BNE.N    ??CenterLineGet_42
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
        B.N      ??CenterLineGet_42
// 2469             }
// 2470             else
// 2471             { //行数太高，不考虑这种情况。 
// 2472               CenterLineLoc[row] = MaxValUint8; //置无效值
??CenterLineGet_43:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
        B.N      ??CenterLineGet_42
// 2473             }
// 2474           }
// 2475       }
// 2476       else
// 2477       {
// 2478         CenterLineLoc[row] = MaxValUint8; //置无效值  
??CenterLineGet_40:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
// 2479       }
// 2480       
// 2481       if(row == 0) break;
??CenterLineGet_42:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??CenterLineGet_39
// 2482     }       
// 2483     if(row == 0) return 1;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??CenterLineGet_31
        MOVS     R0,#+1
        B.N      ??CenterLineGet_1
// 2484   } // end of if
// 2485   
// 2486   //右黑线提取成功，左黑线提取失败。就基本上按右线来估计中心线。
// 2487   if((BlackLeftDone == 0) && (BlackRightDone == 1))
??CenterLineGet_31:
        LDR.W    R0,??DataTable26_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.W    ??CenterLineGet_47
        LDR.W    R0,??DataTable26_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??CenterLineGet_47
// 2488   {
// 2489     //找中心线的线头。
// 2490     for(row = CameraHight - 1; row > CameraHight - BlackStep1Size; row --)
        MOVS     R5,#+49
        B.N      ??CenterLineGet_48
// 2491     {
// 2492       //找右线有效值。 //原为连续两行找有效值，现改为一行。
// 2493       if(BlackRightLoc[row][0] != MaxValUint8)
// 2494       {
// 2495         if(CenterLocStore != MaxValUint8)
// 2496         {
// 2497           CenterLineLoc[row] = BlackRightLoc[row][0] - CenterLocStore;
// 2498         }
// 2499         else
// 2500         {
// 2501           CenterLineLoc[row] = BlackRightLoc[row][0] - CenterLineHalfWidth[row];
// 2502         }
// 2503         break;
// 2504       }
// 2505       else
// 2506       {
// 2507         CenterLineLoc[row] = MaxValUint8;
??CenterLineGet_49:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
// 2508       }
        SUBS     R5,R5,#+1
??CenterLineGet_48:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+16
        BCC.N    ??CenterLineGet_50
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable26_9
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_49
        LDR.W    R0,??DataTable26_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_51
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable26_9
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable26_11
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_52
??CenterLineGet_51:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable26_9
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_12
        LDRB     R1,[R5, R1]
        SUBS     R0,R0,R1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        STRB     R0,[R5, R1]
// 2509     }
// 2510     //没有找到中心线线头，中心线提取失败。
// 2511     if(row <= CameraHight - BlackStep1Size) return 0;
??CenterLineGet_52:
??CenterLineGet_50:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+16
        BCS.N    ??CenterLineGet_53
        MOVS     R0,#+0
        B.N      ??CenterLineGet_1
// 2512     
// 2513     //找到线头，按照左线的趋势进行中心线的估计。
// 2514     for(row--; ; row--)
??CenterLineGet_53:
        SUBS     R5,R5,#+1
        B.N      ??CenterLineGet_54
??CenterLineGet_55:
        SUBS     R5,R5,#+1
// 2515     {
// 2516       if(BlackRightLoc[row][0] != MaxValUint8)
??CenterLineGet_54:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable26_9
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_56
// 2517       {
// 2518         //前一行的中心点有效的情况。
// 2519         if(CenterLineLoc[row+1] != MaxValUint8)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_57
// 2520         {
// 2521           CenterLineLoc[row] = CenterLineLoc[row+1] + BlackRightLoc[row][0] - BlackRightLoc[row+1][0];
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable26_9
        MLA      R1,R1,R5,R2
        LDRB     R1,[R1, #+0]
        ADDS     R0,R1,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable26_9
        MLA      R1,R1,R5,R2
        LDRB     R1,[R1, #+3]
        SUBS     R0,R0,R1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable26_10
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_58
// 2522         }
// 2523         //前一行的中心点无效的情况。
// 2524         else
// 2525         { //首先行数要够小。
// 2526           if(row <= CameraHight - 5)
??CenterLineGet_57:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+46
        BCS.N    ??CenterLineGet_59
// 2527           { //连续3行查找是否有中心线有效的行。
// 2528             for(i = 2; i <= 4; i++)
        MOVS     R1,#+2
        B.N      ??CenterLineGet_60
??CenterLineGet_61:
        ADDS     R1,R1,#+1
??CenterLineGet_60:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+5
        BCS.N    ??CenterLineGet_62
// 2529             {
// 2530               if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackRightLoc[row+i][0] != MaxValUint8))
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R0,R1,R5
        LDR.W    R2,??DataTable26_10
        LDRB     R0,[R0, R2]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_61
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R0,R1,R5
        MOVS     R2,#+3
        LDR.W    R3,??DataTable26_9
        MLA      R0,R2,R0,R3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_61
// 2531               {
// 2532                 CenterLineLoc[row] = CenterLineLoc[row+i] + BlackRightLoc[row][0] - BlackRightLoc[row+i][0];
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R0,R1,R5
        LDR.W    R2,??DataTable26_10
        LDRB     R0,[R0, R2]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable26_9
        MLA      R2,R2,R5,R3
        LDRB     R2,[R2, #+0]
        ADDS     R0,R2,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R2,R1,R5
        MOVS     R3,#+3
        LDR.W    R4,??DataTable26_9
        MLA      R2,R3,R2,R4
        LDRB     R2,[R2, #+0]
        SUBS     R0,R0,R2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R2,??DataTable26_10
        STRB     R0,[R5, R2]
// 2533                 break;
// 2534               }
// 2535             }
// 2536             //连续3行没找到符合要求的行，置无效值。
// 2537             if(i == 5) CenterLineLoc[row] = MaxValUint8; 
??CenterLineGet_62:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+5
        BNE.N    ??CenterLineGet_58
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
        B.N      ??CenterLineGet_58
// 2538           }
// 2539           //行数太高，处理不了。
// 2540           else
// 2541           {
// 2542             CenterLineLoc[row] = MaxValUint8; //置无效值  
??CenterLineGet_59:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
        B.N      ??CenterLineGet_58
// 2543           }
// 2544         }
// 2545       }
// 2546       else
// 2547       {
// 2548         CenterLineLoc[row] = MaxValUint8; //置无效值  
??CenterLineGet_56:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
// 2549       }
// 2550       
// 2551       if(row == 0) break;
??CenterLineGet_58:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??CenterLineGet_55
// 2552     }       
// 2553     if(row == 0) return 1;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??CenterLineGet_47
        MOVS     R0,#+1
        B.N      ??CenterLineGet_1
// 2554   } // end of if
// 2555   
// 2556   return 0; 
??CenterLineGet_47:
        MOVS     R0,#+0
??CenterLineGet_1:
        POP      {R4-R6,PC}       ;; return
// 2557 }
// 2558 
// 2559 //中心线补充处理，若到不了第25行，就补到第25行。超过250就置成250。

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2560 uint8 CenterLineGetCom(void)
// 2561 {
// 2562   uint8 row;
// 2563   
// 2564   for(row = 0; ; row++)
CenterLineGetCom:
        MOVS     R0,#+0
        B.N      ??CenterLineGetCom_0
??CenterLineGetCom_1:
        ADDS     R0,R0,#+1
// 2565   {
// 2566     if(CenterLineLoc[row] != MaxValUint8)
??CenterLineGetCom_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable26_10
        LDRB     R1,[R0, R1]
        CMP      R1,#+255
        BEQ.N    ??CenterLineGetCom_1
// 2567     {
// 2568       if(row < CenterKeyLine)
        LDR.W    R1,??DataTable30
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R1
        BCS.N    ??CenterLineGetCom_2
// 2569       {
// 2570         break;
        B.N      ??CenterLineGetCom_3
// 2571       }
// 2572       else
// 2573       {
// 2574         for(; ; row--)
??CenterLineGetCom_4:
        SUBS     R0,R0,#+1
// 2575         {
// 2576           if(CenterLineLoc[row] + CenterLineLoc[row] - CenterLineLoc[row+1] < 0)
??CenterLineGetCom_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable26_10
        LDRB     R1,[R0, R1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable26_10
        LDRB     R2,[R0, R2]
        ADDS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable26_10
        ADDS     R2,R0,R2
        LDRB     R2,[R2, #+1]
        SUBS     R1,R1,R2
        CMP      R1,#+0
        BPL.N    ??CenterLineGetCom_5
// 2577           {
// 2578             CenterLineLoc[row-1] = 0;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable26_10
        ADDS     R1,R0,R1
        MOVS     R2,#+0
        STRB     R2,[R1, #-1]
        B.N      ??CenterLineGetCom_6
// 2579           }
// 2580           else if(CenterLineLoc[row] + CenterLineLoc[row] - CenterLineLoc[row+1] > CameraRealWidth - 1)
??CenterLineGetCom_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable26_10
        LDRB     R1,[R0, R1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable26_10
        LDRB     R2,[R0, R2]
        ADDS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable26_10
        ADDS     R2,R0,R2
        LDRB     R2,[R2, #+1]
        SUBS     R1,R1,R2
        CMP      R1,#+250
        BLT.N    ??CenterLineGetCom_7
// 2581           {
// 2582             CenterLineLoc[row-1] = CameraRealWidth - 1;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable26_10
        ADDS     R1,R0,R1
        MOVS     R2,#+249
        STRB     R2,[R1, #-1]
        B.N      ??CenterLineGetCom_6
// 2583           }
// 2584           else
// 2585           {
// 2586             CenterLineLoc[row-1] = CenterLineLoc[row] + CenterLineLoc[row] - CenterLineLoc[row+1];
??CenterLineGetCom_7:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable26_10
        LDRB     R1,[R0, R1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable26_10
        LDRB     R2,[R0, R2]
        ADDS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable26_10
        ADDS     R2,R0,R2
        LDRB     R2,[R2, #+1]
        SUBS     R1,R1,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable26_10
        ADDS     R2,R0,R2
        STRB     R1,[R2, #-1]
// 2587           }
// 2588           if(row <= CenterKeyLine) break;          
??CenterLineGetCom_6:
        LDR.W    R1,??DataTable30
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCC.N    ??CenterLineGetCom_4
// 2589         }
// 2590         break;
// 2591       }
// 2592     }
// 2593   }
// 2594   
// 2595   return 1;
??CenterLineGetCom_3:
        MOVS     R0,#+1
        BX       LR               ;; return
// 2596 }
// 2597 
// 2598 
// 2599 
// 2600 
// 2601 
// 2602 //图像重新赋值,行不变（行中DMA中变化，选取需要的行），列无法在DMA中变化，就在这里变化。
// 2603 ///////////////////////////////////////////但这里需要用示波器测量一下时间，看是不是耗费了太多时间。

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2604 void ImgPut(void)
// 2605 {
ImgPut:
        PUSH     {R4-R7}
// 2606     uint16 i, j, k, temp1, temp2;   
// 2607     
// 2608     temp1 = CameraWidth/2 - CameraRealWidth/2 - 1;
        MOVS     R3,#+34
// 2609     temp2 = CameraWidth/2 + CameraRealWidth/2 - 1;
        MOV      R4,#+284
// 2610     
// 2611     for(i = 0; i < CameraHight; i++)
        MOVS     R0,#+0
        B.N      ??ImgPut_0
// 2612     {
// 2613       k = 0;
// 2614       for(j = temp1; j < temp2; j++)
// 2615       {
// 2616         ImgNew[i][k] = ImgRaw[i][j];
??ImgPut_1:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R5,#+250
        LDR.W    R6,??DataTable30_1
        MLA      R5,R5,R0,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOV      R6,#+320
        LDR.W    R7,??DataTable30_2
        MLA      R6,R6,R0,R7
        LDRB     R6,[R1, R6]
        STRB     R6,[R2, R5]
// 2617         k++;
        ADDS     R2,R2,#+1
// 2618       }
        ADDS     R1,R1,#+1
??ImgPut_2:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R1,R4
        BCC.N    ??ImgPut_1
        ADDS     R0,R0,#+1
??ImgPut_0:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+50
        BCS.N    ??ImgPut_3
        MOVS     R2,#+0
        MOVS     R1,R3
        B.N      ??ImgPut_2
// 2619     }
// 2620 }
??ImgPut_3:
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24:
        DC32     0x437a0001
// 2621 
// 2622 
// 2623 
// 2624 
// 2625 
// 2626 //中心线离散度求取函数。自身的离散程度，和中心线的。

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2627 void ErrorGet(void)
// 2628 {
ErrorGet:
        PUSH     {R3-R7,LR}
// 2629   uint8 row;
// 2630   uint8 avg = 0;
        MOVS     R7,#+0
// 2631   float temp;
// 2632   uint8 index;
// 2633   //求取平均值
// 2634   temp = 0;
        MOVS     R4,#+0
// 2635   index = 0;
        MOVS     R5,#+0
// 2636   for(row = CameraHight - 1; ; row--)
        MOVS     R6,#+49
        B.N      ??ErrorGet_0
??ErrorGet_1:
        SUBS     R6,R6,#+1
// 2637   {
// 2638     if(CenterLineLoc[row] != MaxValUint8)
??ErrorGet_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable26_10
        LDRB     R0,[R6, R0]
        CMP      R0,#+255
        BEQ.N    ??ErrorGet_2
// 2639     {
// 2640       temp += CenterLineLoc[row];
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable26_10
        LDRB     R0,[R6, R0]
        BL       __aeabi_ui2f
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
// 2641       index++;
        ADDS     R5,R5,#+1
// 2642     }
// 2643     if(row == 0) break;
??ErrorGet_2:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??ErrorGet_1
// 2644   }
// 2645   avg = (uint8)(temp / index);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        BL       __aeabi_f2iz
        MOVS     R7,R0
// 2646   /*
// 2647   //1. 先取线头
// 2648   for(row = CameraHight - 1; ; row--)
// 2649   {
// 2650     if(CenterLineLoc[row] != MaxValUint8)
// 2651     {
// 2652       avg = CenterLineLoc[row];
// 2653       break;
// 2654     }
// 2655     if(row == 0) break;
// 2656   }
// 2657   //2. 叠加求平均
// 2658   for(row--; ; row--)
// 2659   {
// 2660     if(CenterLineLoc[row] != MaxValUint8)
// 2661     {
// 2662       avg = (avg + CenterLineLoc[row]) / 2;
// 2663     }
// 2664     if(row == 0) break;    
// 2665   }
// 2666   */
// 2667   
// 2668 
// 2669   temp = 0;
        MOVS     R4,#+0
// 2670   index = 0;
        MOVS     R5,#+0
// 2671   for(row = CameraHight - 1; ; row--)
        MOVS     R6,#+49
        B.N      ??ErrorGet_3
??ErrorGet_4:
        SUBS     R6,R6,#+1
// 2672   {
// 2673     if(CenterLineLoc[row] != MaxValUint8)
??ErrorGet_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable26_10
        LDRB     R0,[R6, R0]
        CMP      R0,#+255
        BEQ.N    ??ErrorGet_5
// 2674     {
// 2675       temp += AbsRe(CenterLineLoc[row], avg);
        MOVS     R1,R7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable26_10
        LDRB     R0,[R6, R0]
        BL       AbsRe
        BL       __aeabi_ui2f
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
// 2676       index++;
        ADDS     R5,R5,#+1
// 2677     }
// 2678     if(row == 0) break;
??ErrorGet_5:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??ErrorGet_4
// 2679   }
// 2680   ErrorGetSelf = (uint8)(temp / index);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        BL       __aeabi_f2iz
        LDR.W    R1,??DataTable30_3
        STRB     R0,[R1, #+0]
// 2681   ErrorGetCen = AbsRe(avg, PhyCenterCol);
        MOVS     R1,#+140
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       AbsRe
        LDR.W    R1,??DataTable30_4
        STRB     R0,[R1, #+0]
// 2682   
// 2683 }
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     BlackRightCrossDone
// 2684 
// 2685 
// 2686 
// 2687 //开根号运算
// 2688 //本来传进来传出去都是uint16型的，但是我调用的时候只会用到uint8型的，且不会超出255.

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2689 uint16 MathSqrt(uint16 x1)
// 2690 {
// 2691   uint8 ans = 0, p = 0x80;
MathSqrt:
        MOVS     R1,#+0
        MOVS     R2,#+128
// 2692   uint16 x = x1;
        B.N      ??MathSqrt_0
// 2693   
// 2694   while(p!=0)
// 2695   {
// 2696     ans += p;
??MathSqrt_1:
        ADDS     R1,R2,R1
// 2697     if(ans * ans > x) ans -=p;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MUL      R3,R1,R1
        CMP      R0,R3
        BGE.N    ??MathSqrt_2
        SUBS     R1,R1,R2
// 2698     p = (uint8)(p / 2);
??MathSqrt_2:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R3,#+2
        SDIV     R2,R2,R3
// 2699   }
??MathSqrt_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BNE.N    ??MathSqrt_1
// 2700   return ans;  
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
// 2701 }
// 2702 
// 2703 //曲线的曲率求取，曲线向右拐（三点为顺时针方向分布），曲率为负，曲线向左拐（三点为逆时钟方向分布），曲率为正
// 2704 //K = 4*SABC/AB/BC/AC

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2705 int16 CurveGet(uint8 AX, uint8 AY, uint8 BX, uint8 BY, uint8 CX, uint8 CY)
// 2706 {
CurveGet:
        PUSH     {R3-R11,LR}
        MOV      R9,R0
        MOV      R10,R1
        MOV      R8,R2
        MOV      R11,R3
        LDR      R4,[SP, #+40]
        LDR      R5,[SP, #+44]
// 2707   int16 SABC_temp; //三角形的面积，有正负。
// 2708   int16 tempab, tempbc, tempac;
// 2709   int16 AB, BC, AC; //三角形的边长，均为正。
// 2710   //int16 K;        //曲率结果，有正负。
// 2711   
// 2712   SABC_temp = ((BX - AX) * (CY - AY) - (CX - AX) * (BY - AY));
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        SUBS     R0,R8,R9
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        SUBS     R1,R5,R10
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        SUBS     R2,R11,R10
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        SUBS     R3,R9,R4
        MULS     R2,R3,R2
        MLA      R6,R1,R0,R2
// 2713   
// 2714   tempab = (BX - AX) * (BX - AX) + (BY - AY) * (BY - AY);
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        SUBS     R0,R8,R9
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        SUBS     R1,R8,R9
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        SUBS     R2,R11,R10
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        SUBS     R3,R11,R10
        MULS     R2,R3,R2
        MLA      R0,R1,R0,R2
// 2715   if(tempab > 100) 
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        CMP      R0,#+101
        BLT.N    ??CurveGet_0
// 2716   {
// 2717     AB = MathSqrt(tempab / 100) * 10; //失掉两位的精度，因为求根运算范围的限制。
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       MathSqrt
        MOVS     R1,#+10
        MUL      R7,R1,R0
        B.N      ??CurveGet_1
// 2718   }
// 2719   else
// 2720   {
// 2721     AB = MathSqrt(tempab);
??CurveGet_0:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       MathSqrt
        MOVS     R7,R0
// 2722   }
// 2723   
// 2724   tempbc = (BX - CX) * (BX - CX) + (BY - CY) * (BY - CY);
??CurveGet_1:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        SUBS     R0,R8,R4
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        SUBS     R1,R8,R4
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        SUBS     R2,R11,R5
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        SUBS     R3,R11,R5
        MULS     R2,R3,R2
        MLA      R0,R1,R0,R2
// 2725   if(tempbc > 100) 
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        CMP      R0,#+101
        BLT.N    ??CurveGet_2
// 2726   {
// 2727     BC = MathSqrt(tempbc / 100) * 10; //失掉两位的精度，因为求根运算范围的限制。
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       MathSqrt
        MOVS     R1,#+10
        MUL      R8,R1,R0
        B.N      ??CurveGet_3
// 2728   }
// 2729   else
// 2730   {
// 2731     BC = MathSqrt(tempbc);
??CurveGet_2:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       MathSqrt
        MOV      R8,R0
// 2732   }
// 2733   
// 2734   tempac = (CX - AX) * (CX - AX) + (CY - AY) * (CY - AY);
??CurveGet_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        SUBS     R0,R4,R9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        SUBS     R1,R4,R9
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        SUBS     R2,R5,R10
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        SUBS     R3,R5,R10
        MULS     R2,R3,R2
        MLA      R0,R1,R0,R2
// 2735   if(tempac > 100) 
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        CMP      R0,#+101
        BLT.N    ??CurveGet_4
// 2736   {
// 2737     AC = MathSqrt(tempac / 100) * 10; //失掉两位的精度，因为求根运算范围的限制。
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       MathSqrt
        MOVS     R1,#+10
        MULS     R0,R1,R0
        B.N      ??CurveGet_5
// 2738   }
// 2739   else
// 2740   {
// 2741     AC = MathSqrt(tempac);
??CurveGet_4:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       MathSqrt
// 2742   }
// 2743   
// 2744   return (CurveGetCompen * SABC_temp / AB / BC / AC);
??CurveGet_5:
        LDR.W    R1,??DataTable30_5
        LDRSH    R1,[R1, #+0]
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        MULS     R1,R6,R1
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        SDIV     R1,R1,R7
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        SDIV     R1,R1,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        SDIV     R0,R1,R0
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        POP      {R1,R4-R11,PC}   ;; return
// 2745 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26:
        DC32     BlackRightCrossTooLowLine

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_1:
        DC32     BlackLeftDone

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_2:
        DC32     BlackRightDone

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_3:
        DC32     LimitLeftWB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_4:
        DC32     LimitLeftW

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_5:
        DC32     LimitLeftB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_6:
        DC32     BlackLeft3ResetCount

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_7:
        DC32     BlackRight3ResetCount

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_8:
        DC32     BlackLeftLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_9:
        DC32     BlackRightLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_10:
        DC32     CenterLineLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_11:
        DC32     CenterLocStore

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_12:
        DC32     CenterLineHalfWidth
// 2746 
// 2747 
// 2748 
// 2749 //SABC的面积求取，顺时针则返回负值，逆时针则返回正值。
// 2750 //以左下角为原点，向右为x轴正方向(0~249)，向上为y轴正方向(0~49)。

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2751 int16 SABCGet(uint8 x1, uint8 y1, uint8 x2, uint8 y2, uint8 x3, uint8 y3)
// 2752 {
SABCGet:
        PUSH     {R4,R5}
        LDR      R5,[SP, #+8]
        LDR      R4,[SP, #+12]
// 2753   int16 SABC_temp;
// 2754   
// 2755   SABC_temp = ((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1)) / 2;
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        SUBS     R2,R2,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R4,R4,R1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R1,R3,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        SUBS     R0,R0,R5
        MUL      R0,R0,R1
        MLA      R0,R4,R2,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
// 2756   
// 2757   return SABC_temp;
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        POP      {R4,R5}
        BX       LR               ;; return
// 2758 }
// 2759 
// 2760 
// 2761 //曲率符号求取
// 2762 //影响：CurveSL, CurveSC, CurveSR, 0无效，1正，2负
// 2763 //      SABCL, SABCC, SABCR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2764 uint8 CurveSignGet(void)
// 2765 {
CurveSignGet:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
// 2766   uint8 row;
// 2767   uint8 temp;
// 2768   
// 2769   //1. 中心线曲率符号求取
// 2770   //曲率符号预先清零。
// 2771   CurveLineChosenC1 = MaxValUint8;
        LDR.W    R0,??DataTable30_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2772   CurveLineChosenC2 = MaxValUint8;
        LDR.W    R0,??DataTable30_7
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2773   CurveLineChosenC3 = MaxValUint8;
        LDR.W    R0,??DataTable30_8
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2774   
// 2775   //曲率基于的行1 CurveLineChosen1，从上到下取第一个有效值。
// 2776   for(row = 0; ; row++)
        MOVS     R0,#+0
        B.N      ??CurveSignGet_0
??CurveSignGet_1:
        ADDS     R0,R0,#+1
// 2777   {
// 2778     if(row >= CameraHight - 2) 
??CurveSignGet_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+48
        BCC.N    ??CurveSignGet_2
// 2779     {
// 2780       CurveLineChosenC1 = MaxValUint8;
        LDR.W    R0,??DataTable30_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2781       return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2782     }
// 2783     if(CenterLineLoc[row] != MaxValUint8)
??CurveSignGet_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable30_9
        LDRB     R1,[R0, R1]
        CMP      R1,#+255
        BEQ.N    ??CurveSignGet_1
// 2784     {
// 2785       CurveLineChosenC1 = row;
        LDR.W    R1,??DataTable30_6
        STRB     R0,[R1, #+0]
// 2786       break;
// 2787     }   
// 2788   }
// 2789   //把第1个有效值到CameraHight-1的距离分成2段。
// 2790   temp = (CameraHight - 1 - row) / 2;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        RSBS     R0,R0,#+49
        MOVS     R1,#+2
        SDIV     R1,R0,R1
// 2791   if(temp == 0) 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??CurveSignGet_4
// 2792   {
// 2793     CurveLineChosenC1 = MaxValUint8;
        LDR.W    R0,??DataTable30_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2794     return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2795   }
// 2796   
// 2797   //曲率基于的行2 CurveLineChosen2
// 2798   for(row = CurveLineChosenC1 + temp; ; row++)
??CurveSignGet_4:
        LDR.W    R0,??DataTable30_6
        LDRB     R0,[R0, #+0]
        ADDS     R0,R1,R0
        B.N      ??CurveSignGet_5
??CurveSignGet_6:
        ADDS     R0,R0,#+1
// 2799   {
// 2800     if(row >= CameraHight - 1) 
??CurveSignGet_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BCC.N    ??CurveSignGet_7
// 2801     {
// 2802       CurveLineChosenC1 = MaxValUint8;
        LDR.W    R0,??DataTable30_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2803       CurveLineChosenC2 = MaxValUint8;
        LDR.W    R0,??DataTable30_7
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2804       return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2805     }
// 2806     if(CenterLineLoc[row] != MaxValUint8)
??CurveSignGet_7:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable30_9
        LDRB     R2,[R0, R2]
        CMP      R2,#+255
        BEQ.N    ??CurveSignGet_6
// 2807     {
// 2808       CurveLineChosenC2 = row;
        LDR.W    R2,??DataTable30_7
        STRB     R0,[R2, #+0]
// 2809       break;
// 2810     }
// 2811   }
// 2812   
// 2813   //曲率基于的行3 CurveLineChosen3
// 2814   for(row = CurveLineChosenC2 + temp; ; row++)
        LDR.W    R0,??DataTable30_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R1,R0
        B.N      ??CurveSignGet_8
??CurveSignGet_9:
        ADDS     R0,R0,#+1
// 2815   {
// 2816     if(row >= CameraHight) 
??CurveSignGet_8:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+50
        BCC.N    ??CurveSignGet_10
// 2817     {
// 2818       CurveLineChosenC1 = MaxValUint8;
        LDR.W    R0,??DataTable30_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2819       CurveLineChosenC2 = MaxValUint8;
        LDR.W    R0,??DataTable30_7
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2820       CurveLineChosenC3 = MaxValUint8;
        LDR.W    R0,??DataTable30_8
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2821       return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2822     }
// 2823     if(CenterLineLoc[row] != MaxValUint8)
??CurveSignGet_10:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable30_9
        LDRB     R1,[R0, R1]
        CMP      R1,#+255
        BEQ.N    ??CurveSignGet_9
// 2824     {
// 2825       CurveLineChosenC3 = row;
        LDR.W    R1,??DataTable30_8
        STRB     R0,[R1, #+0]
// 2826       break;
// 2827     }
// 2828   } 
// 2829   //SABCC中心线曲率三角形面积的求取
// 2830   //SABCC = SABCGet(CenterLineLoc[CurveLineChosenC1], CameraHight - 1 - CurveLineChosenC1,
// 2831   //                CenterLineLoc[CurveLineChosenC2], CameraHight - 1 - CurveLineChosenC2,
// 2832   //                CenterLineLoc[CurveLineChosenC3], CameraHight - 1 - CurveLineChosenC3
// 2833   //                );
// 2834   CURVEC = CurveGet(CenterLineLoc[CurveLineChosenC1], CameraHight - 1 - CurveLineChosenC1,
// 2835                    CenterLineLoc[CurveLineChosenC2], CameraHight - 1 - CurveLineChosenC2,
// 2836                    CenterLineLoc[CurveLineChosenC3], CameraHight - 1 - CurveLineChosenC3
// 2837                    );    
        LDR.W    R0,??DataTable30_8
        LDRB     R0,[R0, #+0]
        RSBS     R0,R0,#+49
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[SP, #+4]
        LDR.W    R0,??DataTable30_8
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable30_9
        LDRB     R0,[R0, R1]
        STR      R0,[SP, #+0]
        LDR.W    R0,??DataTable30_7
        LDRB     R0,[R0, #+0]
        RSBS     R3,R0,#+49
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDR.W    R0,??DataTable30_7
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable30_9
        LDRB     R2,[R0, R1]
        LDR.W    R0,??DataTable30_6
        LDRB     R0,[R0, #+0]
        RSBS     R1,R0,#+49
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.W    R0,??DataTable30_6
        LDRB     R0,[R0, #+0]
        LDR.W    R4,??DataTable30_9
        LDRB     R0,[R0, R4]
        BL       CurveGet
        LDR.W    R1,??DataTable30_10
        STRH     R0,[R1, #+0]
// 2838   
// 2839   
// 2840   //左右黑线有可能只有一边提取成功，若不成功，就不用费时间了。
// 2841   if(BlackLeftDone == 1)
        LDR.W    R0,??DataTable30_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??CurveSignGet_11
// 2842   {
// 2843     //2. 左黑线曲率符号求取
// 2844     //曲率符号预先清零。
// 2845     CurveLineChosenL1 = MaxValUint8;
        LDR.W    R0,??DataTable30_12
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2846     CurveLineChosenL2 = MaxValUint8;
        LDR.W    R0,??DataTable30_13
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2847     CurveLineChosenL3 = MaxValUint8;
        LDR.W    R0,??DataTable30_14
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2848     
// 2849     //曲率基于的行1 CurveLineChosen1，从上到下取第一个有效值。
// 2850     for(row = 0; ; row++)
        MOVS     R0,#+0
        B.N      ??CurveSignGet_12
??CurveSignGet_13:
        ADDS     R0,R0,#+1
// 2851     {
// 2852       if(row >= CameraHight - 2) 
??CurveSignGet_12:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+48
        BCC.N    ??CurveSignGet_14
// 2853       {
// 2854         CurveLineChosenL1 = MaxValUint8;
        LDR.W    R0,??DataTable30_12
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2855         return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2856       }
// 2857       if(BlackLeftLoc[row][0] != MaxValUint8)
??CurveSignGet_14:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable30_15
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??CurveSignGet_13
// 2858       {
// 2859         CurveLineChosenL1 = row;
        LDR.W    R1,??DataTable30_12
        STRB     R0,[R1, #+0]
// 2860         break;
// 2861       }   
// 2862     }
// 2863     //把第1个有效值到CameraHight-1的距离分成2段。
// 2864     temp = (CameraHight - 1 - row) / 2;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        RSBS     R0,R0,#+49
        MOVS     R1,#+2
        SDIV     R1,R0,R1
// 2865     if(temp == 0) 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??CurveSignGet_15
// 2866     {
// 2867       CurveLineChosenL1 = MaxValUint8;
        LDR.W    R0,??DataTable30_12
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2868       return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2869     }
// 2870     
// 2871     //曲率基于的行2 CurveLineChosen2
// 2872     for(row = CurveLineChosenL1 + temp; ; row++)
??CurveSignGet_15:
        LDR.W    R0,??DataTable30_12
        LDRB     R0,[R0, #+0]
        ADDS     R0,R1,R0
        B.N      ??CurveSignGet_16
??CurveSignGet_17:
        ADDS     R0,R0,#+1
// 2873     {
// 2874       if(row >= CameraHight - 1) 
??CurveSignGet_16:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BCC.N    ??CurveSignGet_18
// 2875       {
// 2876         CurveLineChosenL1 = MaxValUint8;
        LDR.W    R0,??DataTable30_12
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2877         CurveLineChosenL2 = MaxValUint8;
        LDR.W    R0,??DataTable30_13
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2878         return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2879       }
// 2880       if(BlackLeftLoc[row][0] != MaxValUint8)
??CurveSignGet_18:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable30_15
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        CMP      R2,#+255
        BEQ.N    ??CurveSignGet_17
// 2881       {
// 2882         CurveLineChosenL2 = row;
        LDR.W    R2,??DataTable30_13
        STRB     R0,[R2, #+0]
// 2883         break;
// 2884       }
// 2885     }
// 2886     
// 2887     //曲率基于的行3 CurveLineChosen3
// 2888     for(row = CurveLineChosenL2 + temp; ; row++)
        LDR.W    R0,??DataTable30_13
        LDRB     R0,[R0, #+0]
        ADDS     R0,R1,R0
        B.N      ??CurveSignGet_19
??CurveSignGet_20:
        ADDS     R0,R0,#+1
// 2889     {
// 2890       if(row >= CameraHight) 
??CurveSignGet_19:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+50
        BCC.N    ??CurveSignGet_21
// 2891       {
// 2892         CurveLineChosenL1 = MaxValUint8;
        LDR.W    R0,??DataTable30_12
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2893         CurveLineChosenL2 = MaxValUint8;
        LDR.W    R0,??DataTable30_13
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2894         CurveLineChosenL3 = MaxValUint8;
        LDR.W    R0,??DataTable30_14
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2895         return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2896       }
// 2897       if(BlackLeftLoc[row][0] != MaxValUint8)
??CurveSignGet_21:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable30_15
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??CurveSignGet_20
// 2898       {
// 2899         CurveLineChosenL3 = row;
        LDR.W    R1,??DataTable30_14
        STRB     R0,[R1, #+0]
// 2900         break;
// 2901       }
// 2902     }      
// 2903     //SABCL左黑线曲率三角形面积的求取
// 2904     //SABCL = SABCGet(BlackLeftLoc[CurveLineChosenL1][0], CameraHight - 1 - CurveLineChosenL1,
// 2905     //               BlackLeftLoc[CurveLineChosenL2][0], CameraHight - 1 - CurveLineChosenL2,
// 2906     //               BlackLeftLoc[CurveLineChosenL3][0], CameraHight - 1 - CurveLineChosenL3
// 2907     //               );
// 2908     CURVEL = CurveGet(BlackLeftLoc[CurveLineChosenL1][0], CameraHight - 1 - CurveLineChosenL1,
// 2909                       BlackLeftLoc[CurveLineChosenL2][0], CameraHight - 1 - CurveLineChosenL2,
// 2910                       BlackLeftLoc[CurveLineChosenL3][0], CameraHight - 1 - CurveLineChosenL3
// 2911                       );
        LDR.W    R0,??DataTable30_14
        LDRB     R0,[R0, #+0]
        RSBS     R0,R0,#+49
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[SP, #+4]
        LDR.W    R0,??DataTable30_14
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+3
        LDR.W    R2,??DataTable30_15
        MLA      R0,R1,R0,R2
        LDRB     R0,[R0, #+0]
        STR      R0,[SP, #+0]
        LDR.W    R0,??DataTable30_13
        LDRB     R0,[R0, #+0]
        RSBS     R3,R0,#+49
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDR.W    R0,??DataTable30_13
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+3
        LDR.W    R2,??DataTable30_15
        MLA      R0,R1,R0,R2
        LDRB     R2,[R0, #+0]
        LDR.W    R0,??DataTable30_12
        LDRB     R0,[R0, #+0]
        RSBS     R1,R0,#+49
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.W    R0,??DataTable30_12
        LDRB     R0,[R0, #+0]
        MOVS     R4,#+3
        LDR.W    R5,??DataTable30_15
        MLA      R0,R4,R0,R5
        LDRB     R0,[R0, #+0]
        BL       CurveGet
        LDR.W    R1,??DataTable30_16
        STRH     R0,[R1, #+0]
// 2912     
// 2913   }
// 2914   
// 2915   
// 2916   //左右黑线有可能只有一边提取成功，若不成功，就不用费时间了。
// 2917   if(BlackRightDone == 1)
??CurveSignGet_11:
        LDR.W    R0,??DataTable30_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??CurveSignGet_22
// 2918   {
// 2919     //3. 右黑线曲率符号求取
// 2920     //曲率符号预先清零。
// 2921     CurveLineChosenR1 = MaxValUint8;
        LDR.W    R0,??DataTable30_18
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2922     CurveLineChosenR2 = MaxValUint8;
        LDR.W    R0,??DataTable30_19
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2923     CurveLineChosenR3 = MaxValUint8;
        LDR.W    R0,??DataTable30_20
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2924     
// 2925     //曲率基于的行1 CurveLineChosen1，从上到下取第一个有效值。
// 2926     for(row = 0; ; row++)
        MOVS     R0,#+0
        B.N      ??CurveSignGet_23
??CurveSignGet_24:
        ADDS     R0,R0,#+1
// 2927     {
// 2928       if(row >= CameraHight - 2) 
??CurveSignGet_23:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+48
        BCC.N    ??CurveSignGet_25
// 2929       {
// 2930         CurveLineChosenR1 = MaxValUint8;
        LDR.W    R0,??DataTable30_18
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2931         return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2932       }
// 2933       if(BlackRightLoc[row][0] != MaxValUint8)
??CurveSignGet_25:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable30_21
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??CurveSignGet_24
// 2934       {
// 2935         CurveLineChosenR1 = row;
        LDR.W    R1,??DataTable30_18
        STRB     R0,[R1, #+0]
// 2936         break;
// 2937       }   
// 2938     }
// 2939     //把第1个有效值到CameraHight-1的距离分成2段。
// 2940     temp = (CameraHight - 1 - row) / 2;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        RSBS     R0,R0,#+49
        MOVS     R1,#+2
        SDIV     R1,R0,R1
// 2941     if(temp == 0) 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??CurveSignGet_26
// 2942     {
// 2943       CurveLineChosenR1 = MaxValUint8;
        LDR.W    R0,??DataTable30_18
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2944       return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2945     }
// 2946     
// 2947     //曲率基于的行2 CurveLineChosen2
// 2948     for(row = CurveLineChosenR1 + temp; ; row++)
??CurveSignGet_26:
        LDR.W    R0,??DataTable30_18
        LDRB     R0,[R0, #+0]
        ADDS     R0,R1,R0
        B.N      ??CurveSignGet_27
??CurveSignGet_28:
        ADDS     R0,R0,#+1
// 2949     {
// 2950       if(row >= CameraHight - 1) 
??CurveSignGet_27:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BCC.N    ??CurveSignGet_29
// 2951       {
// 2952         CurveLineChosenR1 = MaxValUint8;
        LDR.W    R0,??DataTable30_18
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2953         CurveLineChosenR2 = MaxValUint8;
        LDR.W    R0,??DataTable30_19
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2954         return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2955       }
// 2956       if(BlackRightLoc[row][0] != MaxValUint8)
??CurveSignGet_29:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable30_21
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        CMP      R2,#+255
        BEQ.N    ??CurveSignGet_28
// 2957       {
// 2958         CurveLineChosenR2 = row;
        LDR.W    R2,??DataTable30_19
        STRB     R0,[R2, #+0]
// 2959         break;
// 2960       }
// 2961     }
// 2962     
// 2963     //曲率基于的行3 CurveLineChosen3
// 2964     for(row = CurveLineChosenR2 + temp; ; row++)
        LDR.W    R0,??DataTable30_19
        LDRB     R0,[R0, #+0]
        ADDS     R0,R1,R0
        B.N      ??CurveSignGet_30
??CurveSignGet_31:
        ADDS     R0,R0,#+1
// 2965     {
// 2966       if(row >= CameraHight) 
??CurveSignGet_30:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+50
        BCC.N    ??CurveSignGet_32
// 2967       {
// 2968         CurveLineChosenR1 = MaxValUint8;
        LDR.W    R0,??DataTable30_18
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2969         CurveLineChosenR2 = MaxValUint8;
        LDR.W    R0,??DataTable30_19
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2970         CurveLineChosenR3 = MaxValUint8;
        LDR.W    R0,??DataTable30_20
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 2971         return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2972       }
// 2973       if(BlackRightLoc[row][0] != MaxValUint8)
??CurveSignGet_32:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable30_21
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??CurveSignGet_31
// 2974       {
// 2975         CurveLineChosenR3 = row;
        LDR.W    R1,??DataTable30_20
        STRB     R0,[R1, #+0]
// 2976         break;
// 2977       }
// 2978     }   
// 2979     //SABCR右黑线曲率三角形面积的求取
// 2980     //SABCR = SABCGet(BlackRightLoc[CurveLineChosenR1][0], CameraHight - 1 - CurveLineChosenR1, 
// 2981     //                BlackRightLoc[CurveLineChosenR2][0], CameraHight - 1 - CurveLineChosenR2, 
// 2982     //                BlackRightLoc[CurveLineChosenR3][0], CameraHight - 1 - CurveLineChosenR3
// 2983     //                );
// 2984     CURVER = CurveGet(BlackRightLoc[CurveLineChosenR1][0], CameraHight - 1 - CurveLineChosenR1, 
// 2985                       BlackRightLoc[CurveLineChosenR2][0], CameraHight - 1 - CurveLineChosenR2, 
// 2986                       BlackRightLoc[CurveLineChosenR3][0], CameraHight - 1 - CurveLineChosenR3
// 2987                       );
        LDR.W    R0,??DataTable30_20
        LDRB     R0,[R0, #+0]
        RSBS     R0,R0,#+49
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[SP, #+4]
        LDR.W    R0,??DataTable30_20
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+3
        LDR.W    R2,??DataTable30_21
        MLA      R0,R1,R0,R2
        LDRB     R0,[R0, #+0]
        STR      R0,[SP, #+0]
        LDR.W    R0,??DataTable30_19
        LDRB     R0,[R0, #+0]
        RSBS     R3,R0,#+49
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDR.W    R0,??DataTable30_19
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+3
        LDR.W    R2,??DataTable30_21
        MLA      R0,R1,R0,R2
        LDRB     R2,[R0, #+0]
        LDR.W    R0,??DataTable30_18
        LDRB     R0,[R0, #+0]
        RSBS     R1,R0,#+49
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.W    R0,??DataTable30_18
        LDRB     R0,[R0, #+0]
        MOVS     R4,#+3
        LDR.W    R5,??DataTable30_21
        MLA      R0,R4,R0,R5
        LDRB     R0,[R0, #+0]
        BL       CurveGet
        LDR.W    R1,??DataTable30_22
        STRH     R0,[R1, #+0]
// 2988      
// 2989   }
// 2990   
// 2991   return 1;
??CurveSignGet_22:
        MOVS     R0,#+1
??CurveSignGet_3:
        POP      {R1-R5,PC}       ;; return
// 2992   
// 2993 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27:
        DC32     BlackRightHeadLine

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_1:
        DC32     BlackLeftHeadLine
// 2994 
// 2995 
// 2996 //赛道类型判断
// 2997 //======================================================================
// 2998 //函数名：PathJudge
// 2999 //功  能：赛道类型判断
// 3000 //参  数：无
// 3001 //返  回：1成功 0失败
// 3002 //影  响：PathType
// 3003 //说  明：1. 暂时只有直、左、右的判断。暂时只通过曲率三角形的面积来判断，后面估计要改成完整版的曲率求取公式。
// 3004 //        2. PathType: 0未知 1直道 2左中 3右中 4左内 5左外 6右内 7右外
// 3005 //             
// 3006 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3007 uint8 PathJudge(void)
// 3008 {
PathJudge:
        PUSH     {R7,LR}
// 3009   //赛道类型PathType: 0未知 1直道 2左中 3右中 4左内 5左外 6右内 7右外
// 3010   PathType = 0;
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 3011   //uint8 row;
// 3012   
// 3013   //ErrorGet();
// 3014   
// 3015   ////////////////////////////发现用SABC的方式来判断的话，有可能出现阈值变化很大的情况，估计后面还是得采用完整的曲率求取方法。
// 3016   //曲率符号获取成功
// 3017   if(CurveSignGet())
        BL       CurveSignGet
        CMP      R0,#+0
        BEQ.W    ??PathJudge_0
// 3018   {
// 3019     //不用判断中心线成功，到这里了肯定是成功的。
// 3020     //左右黑线均提取成功，的情况。
// 3021     if(BlackLeftDone == 1 && BlackRightDone == 1)
        LDR.N    R0,??DataTable30_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??PathJudge_1
        LDR.N    R0,??DataTable30_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??PathJudge_1
// 3022     { //全部逆时针，为左弯。而且是小车走在左弯道较为中心的情况。
// 3023       if(CURVEL < 0 && CURVEC < 0 && CURVER < 0)
        LDR.N    R0,??DataTable30_16
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PathJudge_2
        LDR.N    R0,??DataTable30_10
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PathJudge_2
        LDR.N    R0,??DataTable30_22
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PathJudge_2
// 3024       { 
// 3025         PathType = 2;
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
        B.N      ??PathJudge_1
// 3026       }
// 3027       //全部顺时针，为右弯。而且是小车走在右弯道较为中心的情况。
// 3028       else if(CURVEL > 0 && CURVEC > 0 && CURVER > 0)
??PathJudge_2:
        LDR.N    R0,??DataTable30_16
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??PathJudge_3
        LDR.N    R0,??DataTable30_10
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??PathJudge_3
        LDR.N    R0,??DataTable30_22
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??PathJudge_3
// 3029       {        
// 3030         PathType = 3;
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
        B.N      ??PathJudge_1
// 3031       }
// 3032       else
// 3033       {
// 3034         if(
// 3035           (AbsSelf(CURVEL) < PathStraightLimitL)
// 3036         &&(AbsSelf(CURVEC) < PathStraightLimitC)
// 3037         &&(AbsSelf(CURVER) < PathStraightLimitR)
// 3038           )
??PathJudge_3:
        LDR.N    R0,??DataTable30_16
        LDRSH    R0,[R0, #+0]
        BL       AbsSelf
        LDR.N    R1,??DataTable30_24
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??PathJudge_4
        LDR.N    R0,??DataTable30_10
        LDRSH    R0,[R0, #+0]
        BL       AbsSelf
        LDR.N    R1,??DataTable30_25
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??PathJudge_4
        LDR.N    R0,??DataTable30_22
        LDRSH    R0,[R0, #+0]
        BL       AbsSelf
        LDR.N    R1,??DataTable30_26
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??PathJudge_4
// 3039         { //均小于阈值，为直道。
// 3040           PathType = 1;  
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        B.N      ??PathJudge_1
// 3041         }
// 3042         else
// 3043         {
// 3044           PathType = 0; //未知赛道类型。  
??PathJudge_4:
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 3045         }
// 3046       }
// 3047     }
// 3048     
// 3049     //左黑线提取失败，右黑线提取成功，的情况。
// 3050     if(BlackLeftDone == 0 && BlackRightDone == 1)
??PathJudge_1:
        LDR.N    R0,??DataTable30_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??PathJudge_5
        LDR.N    R0,??DataTable30_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??PathJudge_5
// 3051     { //左弯道，外道。
// 3052       if(CURVEC < 0 && CURVER < 0)
        LDR.N    R0,??DataTable30_10
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PathJudge_6
        LDR.N    R0,??DataTable30_22
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PathJudge_6
// 3053       {
// 3054         PathType = 5;
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+5
        STRB     R1,[R0, #+0]
        B.N      ??PathJudge_5
// 3055       }
// 3056       //右弯道，内道。
// 3057       else if(CURVEC > 0 && CURVER > 0)
??PathJudge_6:
        LDR.N    R0,??DataTable30_10
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??PathJudge_7
        LDR.N    R0,??DataTable30_22
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??PathJudge_7
// 3058       {
// 3059         PathType = 6;
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+6
        STRB     R1,[R0, #+0]
        B.N      ??PathJudge_5
// 3060       }
// 3061       else
// 3062       {
// 3063         if(
// 3064           (AbsSelf(CURVEC) < PathStraightLimitC)
// 3065         &&(AbsSelf(CURVER) < PathStraightLimitR)
// 3066           )
??PathJudge_7:
        LDR.N    R0,??DataTable30_10
        LDRSH    R0,[R0, #+0]
        BL       AbsSelf
        LDR.N    R1,??DataTable30_25
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??PathJudge_8
        LDR.N    R0,??DataTable30_22
        LDRSH    R0,[R0, #+0]
        BL       AbsSelf
        LDR.N    R1,??DataTable30_26
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??PathJudge_8
// 3067         { //均小于阈值，为直道。
// 3068           PathType = 1;  
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        B.N      ??PathJudge_5
// 3069         }
// 3070         else
// 3071         {
// 3072           PathType = 0; //未知赛道类型。  
??PathJudge_8:
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 3073         }
// 3074       }
// 3075     }
// 3076     
// 3077     //右黑线提取失败，左黑线提取成功，的情况。
// 3078     if(BlackLeftDone == 1 && BlackRightDone == 0)
??PathJudge_5:
        LDR.N    R0,??DataTable30_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??PathJudge_9
        LDR.N    R0,??DataTable30_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??PathJudge_9
// 3079     { //左弯道，内道。
// 3080       if(CURVEC < 0 && CURVEL < 0)
        LDR.N    R0,??DataTable30_10
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PathJudge_10
        LDR.N    R0,??DataTable30_16
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PathJudge_10
// 3081       {
// 3082         PathType = 4;
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+4
        STRB     R1,[R0, #+0]
        B.N      ??PathJudge_9
// 3083       }
// 3084       //右弯道，外道。
// 3085       else if(CURVEC > 0 && CURVEL > 0)
??PathJudge_10:
        LDR.N    R0,??DataTable30_10
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??PathJudge_11
        LDR.N    R0,??DataTable30_16
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??PathJudge_11
// 3086       {
// 3087         PathType = 7;
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+7
        STRB     R1,[R0, #+0]
        B.N      ??PathJudge_9
// 3088       }
// 3089       else
// 3090       {
// 3091         if(
// 3092           (AbsSelf(CURVEC) < PathStraightLimitC)
// 3093         &&(AbsSelf(CURVEL) < PathStraightLimitL)
// 3094           )
??PathJudge_11:
        LDR.N    R0,??DataTable30_10
        LDRSH    R0,[R0, #+0]
        BL       AbsSelf
        LDR.N    R1,??DataTable30_25
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??PathJudge_12
        LDR.N    R0,??DataTable30_16
        LDRSH    R0,[R0, #+0]
        BL       AbsSelf
        LDR.N    R1,??DataTable30_24
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??PathJudge_12
// 3095         { //均小于阈值，为直道。
// 3096           PathType = 1;  
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        B.N      ??PathJudge_9
// 3097         }
// 3098         else
// 3099         {
// 3100           PathType = 0; //未知赛道类型。  
??PathJudge_12:
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 3101         }
// 3102       }
// 3103     }
// 3104     
// 3105     return 1;
??PathJudge_9:
        MOVS     R0,#+1
        B.N      ??PathJudge_13
// 3106   }
// 3107   //曲率符号获取失败
// 3108   else
// 3109   {
// 3110     PathType = 0;  
??PathJudge_0:
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 3111     return 0;
        MOVS     R0,#+0
??PathJudge_13:
        POP      {R1,PC}          ;; return
// 3112   }
// 3113   
// 3114 }
// 3115 
// 3116 
// 3117 
// 3118 
// 3119 
// 3120 //======================================================================
// 3121 //函数名：ImagePro
// 3122 //功  能：图像处理函数。图像尺寸缩减，黑线提取，中心线提取。
// 3123 //参  数：无
// 3124 //返  回：1成功 0失败
// 3125 //影  响：
// 3126 //说  明：1. 黑线提取失败后，不会执行中心线提取函数。返回失败。
// 3127 //        2. 黑线提取失败后，后面的运动控制的参数不用更改，延用上一次的参数。
// 3128 //             
// 3129 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3130 uint8 ImagePro(void)
// 3131 {
ImagePro:
        PUSH     {R7,LR}
// 3132     uint8 i;
// 3133     //图像取需要的列，重新赋值是为了后面的编程方便。
// 3134     ///////////////////////////////////////////但这里需要用示波器测量一下时间，看是不是耗费了太多时间。
// 3135     ImgPut();
        BL       ImgPut
// 3136   
// 3137     //ImageExtract(ImgSend, ImgStore, CameraSize);  
// 3138 
// 3139     
// 3140     //发送图像存储数组到上位机
// 3141     //SendImage(ImgNew);       
// 3142     //黑线提取函数
// 3143     if(!BlackGet())         ////////////////////////////如果黑线提取失败，这里最好给个灯来指示
        BL       BlackGet
        CMP      R0,#+0
        BNE.N    ??ImagePro_0
// 3144     {
// 3145         //uart_sendN(UART0, (uint8 *)"\nBlackGet Failed!", 17);  
// 3146         CenterLineResult = 0;
        LDR.N    R0,??DataTable30_27
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 3147         PathType = 0;
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 3148         BlackLeftHeadLine = MaxValUint8;
        LDR.N    R0,??DataTable30_28
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 3149         BlackRightHeadLine = MaxValUint8;
        LDR.N    R0,??DataTable30_29
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 3150         return 0;
        MOVS     R0,#+0
        B.N      ??ImagePro_1
// 3151     }
// 3152     else
// 3153     { //黑线提取成功，找两边黑线的线头
// 3154       //左线线头的查找
// 3155       if(BlackLeftDone == 1)
??ImagePro_0:
        LDR.N    R0,??DataTable30_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??ImagePro_2
// 3156       {
// 3157         for(i = 0; ; i++)
        MOVS     R0,#+0
        B.N      ??ImagePro_3
??ImagePro_4:
        ADDS     R0,R0,#+1
// 3158         {
// 3159           if(BlackLeftLoc[i][0] != MaxValUint8)
??ImagePro_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable30_15
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??ImagePro_5
// 3160           {
// 3161             BlackLeftHeadLine = i;
        LDR.N    R1,??DataTable30_28
        STRB     R0,[R1, #+0]
// 3162             break;
        B.N      ??ImagePro_6
// 3163           }
// 3164           if(i == CameraHight - 1) 
??ImagePro_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??ImagePro_4
// 3165           {
// 3166             BlackLeftHeadLine = MaxValUint8;
        LDR.N    R0,??DataTable30_28
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 3167             break;
        B.N      ??ImagePro_6
// 3168           }
// 3169         }
// 3170       }
// 3171       else
// 3172       {
// 3173         BlackLeftHeadLine = MaxValUint8;
??ImagePro_2:
        LDR.N    R0,??DataTable30_28
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 3174       }
// 3175       
// 3176       //右线线头的查找
// 3177       if(BlackRightDone == 1)
??ImagePro_6:
        LDR.N    R0,??DataTable30_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??ImagePro_7
// 3178       {
// 3179         for(i = 0; ; i++)
        MOVS     R0,#+0
        B.N      ??ImagePro_8
??ImagePro_9:
        ADDS     R0,R0,#+1
// 3180         {
// 3181           if(BlackRightLoc[i][0] != MaxValUint8)
??ImagePro_8:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable30_21
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??ImagePro_10
// 3182           {
// 3183             BlackRightHeadLine = i;
        LDR.N    R1,??DataTable30_29
        STRB     R0,[R1, #+0]
// 3184             break;
        B.N      ??ImagePro_11
// 3185           }
// 3186           if(i == CameraHight - 1) 
??ImagePro_10:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??ImagePro_9
// 3187           {
// 3188             BlackRightHeadLine = MaxValUint8;
        LDR.N    R0,??DataTable30_29
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 3189             break;
        B.N      ??ImagePro_11
// 3190           }
// 3191         }
// 3192       }
// 3193       else
// 3194       {
// 3195         BlackRightHeadLine = MaxValUint8;
??ImagePro_7:
        LDR.N    R0,??DataTable30_29
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
// 3196       }
// 3197     }
// 3198     
// 3199     //中心线提取函数
// 3200     CenterLineResult = 1;
??ImagePro_11:
        LDR.N    R0,??DataTable30_27
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
// 3201     if(!CenterLineGet())
        BL       CenterLineGet
        CMP      R0,#+0
        BNE.N    ??ImagePro_12
// 3202     {
// 3203       //uart_sendN(UART0, (uint8 *)"\nCenterLineGet Failed!", 22); 
// 3204       CenterLineResult = 0;
        LDR.N    R0,??DataTable30_27
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 3205       PathType = 0;
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 3206       return 0;
        MOVS     R0,#+0
        B.N      ??ImagePro_1
// 3207     }
// 3208     else
// 3209     {
// 3210       //CenterLineGetCom();  
// 3211     }
// 3212     
// 3213     //赛道类型判断
// 3214     //到这里时，中心线提取成功，左右黑线至少有一个提取成功。
// 3215     if(!PathJudge())
??ImagePro_12:
        BL       PathJudge
        CMP      R0,#+0
        BNE.N    ??ImagePro_13
// 3216     {      
// 3217       //uart_sendN(UART0, (uint8 *)"\nPathJudge Failed!", 18);
// 3218       return 0;
        MOVS     R0,#+0
        B.N      ??ImagePro_1
// 3219     }    
// 3220     //发送中心线数组，不用发送float型的数据，同样的处理可以由上位机完成。
// 3221     //SendCenterLineLoc(CenterLineLoc);
// 3222    
// 3223     
// 3224     return 1;
??ImagePro_13:
        MOVS     R0,#+1
??ImagePro_1:
        POP      {R1,PC}          ;; return
// 3225 }
// 3226 
// 3227 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3228 uint8 ImageProSend(void)
// 3229 {
ImageProSend:
        PUSH     {R7,LR}
// 3230     //图像取需要的列，重新赋值是为了后面的编程方便。
// 3231     ///////////////////////////////////////////但这里需要用示波器测量一下时间，看是不是耗费了太多时间。
// 3232     ImgPut();
        BL       ImgPut
// 3233   
// 3234     //ImageExtract(ImgSend, ImgStore, CameraSize);  
// 3235     /*
// 3236     //黑线提取函数
// 3237     if(!BlackGet())         ////////////////////////////如果黑线提取失败，这里最好给个灯来指示
// 3238     {
// 3239         uart_sendN(UART0, (uint8 *)"\nBlackGet Failed!", 17);  
// 3240         return 0;
// 3241     }
// 3242     
// 3243     //中心线提取函数
// 3244     CenterLineResult = 1;
// 3245     if(!CenterLineGet())
// 3246     {
// 3247       uart_sendN(UART0, (uint8 *)"\nCenterLineGet Failed!", 22); 
// 3248       CenterLineResult = 0;
// 3249       return 0;
// 3250     }
// 3251     
// 3252     //PathJudge();
// 3253 
// 3254     */
// 3255     //发送中心线数组，不用发送float型的数据，同样的处理可以由上位机完成。
// 3256     //SendCenterLineLoc(CenterLineLoc);
// 3257     
// 3258     //发送图像存储数组到上位机
// 3259     SendImage(ImgNew);      
        LDR.N    R0,??DataTable30_1
        BL       SendImage
// 3260     
// 3261     return 1;
        MOVS     R0,#+1
        POP      {R1,PC}          ;; return
// 3262 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30:
        DC32     CenterKeyLine

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_1:
        DC32     ImgNew

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_2:
        DC32     ImgRaw

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_3:
        DC32     ErrorGetSelf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_4:
        DC32     ErrorGetCen

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_5:
        DC32     CurveGetCompen

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_6:
        DC32     CurveLineChosenC1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_7:
        DC32     CurveLineChosenC2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_8:
        DC32     CurveLineChosenC3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_9:
        DC32     CenterLineLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_10:
        DC32     CURVEC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_11:
        DC32     BlackLeftDone

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_12:
        DC32     CurveLineChosenL1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_13:
        DC32     CurveLineChosenL2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_14:
        DC32     CurveLineChosenL3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_15:
        DC32     BlackLeftLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_16:
        DC32     CURVEL

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_17:
        DC32     BlackRightDone

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_18:
        DC32     CurveLineChosenR1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_19:
        DC32     CurveLineChosenR2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_20:
        DC32     CurveLineChosenR3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_21:
        DC32     BlackRightLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_22:
        DC32     CURVER

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_23:
        DC32     PathType

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_24:
        DC32     PathStraightLimitL

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_25:
        DC32     PathStraightLimitC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_26:
        DC32     PathStraightLimitR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_27:
        DC32     CenterLineResult

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_28:
        DC32     BlackLeftHeadLine

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_29:
        DC32     BlackRightHeadLine

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 3263 
// 3264 
// 3265 
// 3266 
// 3267 
// 3268 
// 3269 
// 3270 
// 3271 
// 3272 
// 3273 
// 3274 
// 3275 
// 3276 
// 3277 
// 3278 
// 3279 
// 3280 
// 3281 
// 3282 
// 
// 12 896 bytes in section .bss
//     23 bytes in section .data
//    176 bytes in section .rodata
// 12 008 bytes in section .text
// 
// 12 008 bytes of CODE  memory
//    176 bytes of CONST memory
// 12 919 bytes of DATA  memory
//
//Errors: none
//Warnings: none
