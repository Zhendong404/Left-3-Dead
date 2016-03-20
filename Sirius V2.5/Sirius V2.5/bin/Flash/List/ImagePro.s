///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       12/Mar/2016  23:02:56
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\Sirius V2.5\src\Sources\C\Function_C\ImagePro.c
//    Command line =  
//        "E:\Sirius V2.5\src\Sources\C\Function_C\ImagePro.c" -D IAR -D
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
//    List file    =  E:\Sirius V2.5\bin\Flash\List\ImagePro.s
//
///////////////////////////////////////////////////////////////////////////////

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
        PUBLIC BoundaryLimitRe
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
// E:\Sirius V2.5\src\Sources\C\Function_C\ImagePro.c
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
//   27 uint8 BlackLeftLoc[CameraHight][3];       //左黑线位置存储数组
BlackLeftLoc:
        DS8 152

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 uint8 BlackRightLoc[CameraHight][3];      //右黑线位置存储数组
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
//   98 //自身绝对值求值，只适合于int16型变量，返回int16型变量。

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   99 int16 AbsSelf(int16 x)
//  100 {
//  101   if(x < 0) return (0-x);
AbsSelf:
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BPL.N    ??AbsSelf_0
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        RSBS     R0,R0,#+0
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??AbsSelf_1
//  102   else return x;  
??AbsSelf_0:
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
??AbsSelf_1:
        BX       LR               ;; return
//  103 }
//  104 
//  105 //======================================================================
//  106 //函数名：MaxRe
//  107 //功  能：求取两数最大值
//  108 //参  数：第1个数num1, 第2个数num2。
//  109 //返  回：2个数中的最大值
//  110 //影  响：无
//  111 //说  明：1. 两个输入参数无先后顺序。
//  112 //        2. 只能处理两个uint8型的数据，其它数据类型会出错。
//  113 //        3. 返回值的类型也是uint8.
//  114 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  115 uint8 MaxRe(uint8 num1, uint8 num2)
//  116 {
//  117   if(num1 >= num2)
MaxRe:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BCC.N    ??MaxRe_0
//  118   {
//  119     return num1;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??MaxRe_1
//  120   }
//  121   else
//  122   {
//  123     return num2;
??MaxRe_0:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??MaxRe_1:
        BX       LR               ;; return
//  124   }
//  125 }
//  126 
//  127 //======================================================================
//  128 //函数名：MinRe
//  129 //功  能：求取两数最小值
//  130 //参  数：第1个数num1, 第2个数num2。
//  131 //返  回：2个数中的最小值
//  132 //影  响：无
//  133 //说  明：1. 两个输入参数无先后顺序。
//  134 //        2. 只能处理两个uint8型的数据，其它数据类型会出错。
//  135 //        3. 返回值的类型也是uint8.     
//  136 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  137 uint8 MinRe(uint8 num1, uint8 num2)
//  138 {
//  139   if(num1 <= num2)
MinRe:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCC.N    ??MinRe_0
//  140   {
//  141     return num1;  
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??MinRe_1
//  142   }
//  143   else
//  144   {
//  145     return num2;  
??MinRe_0:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??MinRe_1:
        BX       LR               ;; return
//  146   }
//  147 }
//  148 
//  149 //======================================================================
//  150 //函数名：AbsRe
//  151 //功  能：求取两数差值的绝对值
//  152 //参  数：第1个数num1, 第2个数num2。
//  153 //返  回：2个数的绝对值。
//  154 //影  响：无
//  155 //说  明：1. 两个输入参数无先后顺序。
//  156 //        2. 只能处理两个uint8型的数据，其它数据类型会出错。
//  157 //        3. 返回值的类型也是uint8.     
//  158 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  159 uint8 AbsRe(uint8 num1, uint8 num2)
//  160 {
//  161   if(num1 >= num2)
AbsRe:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BCC.N    ??AbsRe_0
//  162   {
//  163     return (num1 - num2);  
        SUBS     R0,R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??AbsRe_1
//  164   }
//  165   else
//  166   {
//  167     return (num2 - num1);  
??AbsRe_0:
        SUBS     R0,R1,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??AbsRe_1:
        BX       LR               ;; return
//  168   }
//  169 }
//  170 
//  171 
//  172 //======================================================================
//  173 //函数名：LeastSquarea1
//  174 //功  能：最小二乘法的a1值的求取
//  175 //参  数：x数组，y数组，num基于的有效数据个数
//  176 //返  回：a1
//  177 //影  响：无
//  178 //说  明：1. y = a0 + a1 * x;
//  179 //        2. a1 = (N * Σxy - Σx * Σy) / (N * Σx^2 - Σx * Σx);
//  180 //  
//  181 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  182 float LeastSquarea1(uint8 x[], uint8 y[], uint8 num)
//  183 {
LeastSquarea1:
        PUSH     {R3-R11,LR}
        MOVS     R7,R0
        MOV      R8,R1
        MOVS     R4,R2
//  184   float andxy = 0, andx = 0, andy = 0, andx2 = 0;
        MOVS     R9,#+0
        MOVS     R5,#+0
        MOVS     R10,#+0
        MOVS     R6,#+0
//  185   float a1;
//  186   uint8 i;
//  187  
//  188   for(i = 0; i < num; i++)
        MOVS     R11,#+0
        B.N      ??LeastSquarea1_0
//  189   {
//  190     andxy += x[i] * y[i];
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
//  191     andx += x[i];
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        LDRB     R0,[R11, R7]
        BL       __aeabi_ui2f
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R5,R0
//  192     andy += y[i];
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        LDRB     R0,[R11, R8]
        BL       __aeabi_ui2f
        MOV      R1,R10
        BL       __aeabi_fadd
        MOV      R10,R0
//  193     andx2 += x[i] * x[i];
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        LDRB     R0,[R11, R7]
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        LDRB     R1,[R11, R7]
        MULS     R0,R1,R0
        BL       __aeabi_i2f
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R6,R0
//  194   }
        ADDS     R11,R11,#+1
??LeastSquarea1_0:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R11,R4
        BCC.N    ??LeastSquarea1_1
//  195   
//  196   a1 = (num * andxy - andx * andy) * 1.0 / (num * andx2 - andx * andx);
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
//  197   return a1;  
        POP      {R1,R4-R11,PC}   ;; return
//  198 }
//  199 
//  200 
//  201 //======================================================================
//  202 //函数名：LeastSquarea0
//  203 //功  能：最小二乘法的a0值的求取
//  204 //参  数：x数组，y数组，a1参数，num基于的有效数据个数
//  205 //返  回：a0
//  206 //影  响：无
//  207 //说  明：1. y = a0 + a1 * x;
//  208 //        2. a0 = Σy / N - a1 * Σx / N;
//  209 //             
//  210 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  211 float LeastSquarea0(uint8 x[], uint8 y[], float a1, uint8 num)
//  212 {
LeastSquarea0:
        PUSH     {R4-R10,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOVS     R4,R3
//  213   float andx = 0, andy = 0;
        MOVS     R8,#+0
        MOVS     R9,#+0
//  214   float a0;
//  215   uint8 i;
//  216   for(i = 0; i < num; i++)
        MOVS     R10,#+0
        B.N      ??LeastSquarea0_0
//  217   {
//  218     andx += x[i];
??LeastSquarea0_1:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        LDRB     R0,[R10, R5]
        BL       __aeabi_ui2f
        MOV      R1,R8
        BL       __aeabi_fadd
        MOV      R8,R0
//  219     andy += y[i];
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        LDRB     R0,[R10, R6]
        BL       __aeabi_ui2f
        MOV      R1,R9
        BL       __aeabi_fadd
        MOV      R9,R0
//  220   }
        ADDS     R10,R10,#+1
??LeastSquarea0_0:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R10,R4
        BCC.N    ??LeastSquarea0_1
//  221   
//  222   a0 = andy / num - a1 * andx / num;
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
//  223   return a0;
        POP      {R4-R10,PC}      ;; return
//  224 }
//  225 
//  226 
//  227 
//  228 
//  229 
//  230 //======================================================================
//  231 //函数名：SendCenterLineLoc
//  232 //功  能：中心线数组发送函数
//  233 //参  数：img待发送的一维图像数组
//  234 //返  回：无
//  235 //影  响：无
//  236 //说  明：
//  237 //      
//  238 //          
//  239 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  240 void SendCenterLineLoc(uint8 img[CameraHight])
//  241 {
SendCenterLineLoc:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  242     uint8 i;
//  243     uint8 cmd[4] = {0, 255, 1, 255 };   
        ADD      R0,SP,#+0
        LDR.W    R1,??DataTable10_1
        LDR      R2,[R1, #0]
        STR      R2,[R0, #+0]
//  244     uart_sendN(UART0, cmd, sizeof(cmd));    
        MOVS     R2,#+4
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable12  ;; 0x4006a000
        BL       uart_sendN
//  245     for(i = 0; i < CameraHight; i++)
        MOVS     R5,#+0
        B.N      ??SendCenterLineLoc_0
//  246     {
//  247       uart_send1(UART0, img[i]); //发送中心线数组
??SendCenterLineLoc_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R1,[R5, R4]
        LDR.W    R0,??DataTable12  ;; 0x4006a000
        BL       uart_send1
//  248     }
        ADDS     R5,R5,#+1
??SendCenterLineLoc_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+50
        BLT.N    ??SendCenterLineLoc_1
//  249     
//  250 }
        POP      {R0,R4,R5,PC}    ;; return
//  251 
//  252 
//  253 
//  254 
//  255 //======================================================================
//  256 //函数名：SendImage
//  257 //功  能：OV7620的图像发送函数
//  258 //参  数：待发送的二维图像数组imgaddr
//  259 //返  回：无
//  260 //影  响：无
//  261 //说  明：       
//  262 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  263 void SendImage(uint8 imgaddr[CameraHight][CameraRealWidth])
//  264 {                            
SendImage:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
//  265     uint8 i, j;
//  266     uint8 cmd[4] = {0, 255, 1, 0 };
        ADD      R0,SP,#+0
        LDR.W    R1,??DataTable10_2
        LDR      R2,[R1, #0]
        STR      R2,[R0, #+0]
//  267   
//  268     uart_sendN(UART0, cmd, sizeof(cmd));    
        MOVS     R2,#+4
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable12  ;; 0x4006a000
        BL       uart_sendN
//  269     
//  270     for(i = 0; i < CameraHight; i++)
        MOVS     R5,#+0
        B.N      ??SendImage_0
//  271         for(j = 0; j < CameraRealWidth; j++)
//  272             uart_send1(UART0, imgaddr[i][j]); //发送图像
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
        BLT.N    ??SendImage_1
        ADDS     R5,R5,#+1
??SendImage_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+50
        BGE.N    ??SendImage_3
        MOVS     R6,#+0
        B.N      ??SendImage_2
//  273 }
??SendImage_3:
        POP      {R0,R1,R4-R6,PC}  ;; return
//  274 
//  275 
//  276 
//  277 //====================================左左左左左左左左左左左左左左左左左============================
//  278 
//  279 //======================================================================
//  280 //函数名：BlackLeftRealClear
//  281 //功  能：左黑线提取中，对3个关键值的实际值清零
//  282 //参  数：无
//  283 //返  回：无
//  284 //影  响：B
//  285 //说  明：
//  286 //      
//  287 //             
//  288 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  289 void BlackLeftRealClear(void)
//  290 {
//  291     BlackLeftRealWB[0] = 0;
BlackLeftRealClear:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+0]
//  292     BlackLeftRealWB[1] = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+1]
//  293     BlackLeftRealW[0] = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_1
        STRB     R0,[R1, #+0]
//  294     BlackLeftRealW[1] = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_1
        STRB     R0,[R1, #+1]
//  295     BlackLeftRealB[0] = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_1
        STRB     R0,[R1, #+0]
//  296     BlackLeftRealB[1] = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_1
        STRB     R0,[R1, #+1]
//  297 }
        BX       LR               ;; return
//  298 
//  299 
//  300 
//  301 
//  302 //======================================================================
//  303 //函数名：BlackGetLeftStep1Edge
//  304 //功  能：处理该行左线的可疑黑点
//  305 //参  数：待检测的行号row, 第几次使用use, 是否为十字再检测调用标志位CrossFlag
//  306 //返  回：1成功 0失败
//  307 //影  响：
//  308 //说  明：
//  309 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  310 uint8 BlackGetLeftStep1Edge(uint8 row, uint8 use, uint8 CrossFlag)
//  311 {
BlackGetLeftStep1Edge:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  312   uint8 index, col, temp, temp1;
//  313   uint8 abs1;
//  314   
//  315   temp = CameraRealWidth/2 - 1 + BlackLeftEdgeStartColOffset;
        MOVS     R8,#+164
//  316   
//  317   index = 0;         //可疑点的序号
        MOVS     R7,#+0
//  318   for(col = temp; col >= 4+BlackLeftEdgeNum; col--) 
        B.N      ??BlackGetLeftStep1Edge_0
//  319   {
//  320       abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col-1-BlackLeftEdgeNum]); //取差值的绝对值。
//  321       
//  322       if( 
//  323           (abs1 > LimitLeftWB) //两者的差够大
//  324         &&(ImgNew[row][col] > LimitLeftW)                     //白点够白
//  325         &&(ImgNew[row][col-1-BlackLeftEdgeNum] < LimitLeftB)                   //黑点够黑
//  326          )
//  327       {         
//  328           //近处的行，向左3个点仍为黑点
//  329           if(row > BlackMiddleLine)
//  330           {
//  331             temp1 = (
//  332                       (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB)
//  333                     &&(ImgNew[row][col-3-BlackLeftEdgeNum] < LimitLeftB)
//  334                     &&(ImgNew[row][col-4-BlackLeftEdgeNum] < LimitLeftB)
//  335                     );
//  336           }          
//  337           else
//  338           {
//  339             //远处的行 ，向左2个点为仍为黑点
//  340             if(row > BlackFarLine)
//  341             {
//  342               temp1 = (
//  343                         (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB)
//  344                       &&(ImgNew[row][col-3-BlackLeftEdgeNum] < LimitLeftB)
//  345                       );
//  346             }
//  347             //远处的行 ，向左1个点为仍为黑点
//  348             else
//  349             {
//  350               temp1 = (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB);
//  351             }
//  352           }
//  353 
//  354           if(temp1)
//  355           {
//  356               if(index == 3)       
//  357               {
//  358                 if(CrossFlag)
//  359                 {
//  360                   //对3个关键值的实际值清零
//  361                   BlackLeftRealClear();
//  362                 }
//  363                 //该行定位黑线失败，赋无效值
//  364                 BlackLeftLoc[row][0] = MaxValUint8;
//  365                 return 0;
//  366               }
//  367 
//  368               if(CrossFlag)
//  369               {
//  370                 if(use == 1)
//  371                 {
//  372                   BlackLeftRealWB[0] = ImgNew[row][col] - ImgNew[row][col-1-BlackLeftEdgeNum]; 
//  373                   BlackLeftRealW[0] = ImgNew[row][col];
//  374                   BlackLeftRealB[0] = ImgNew[row][col-1-BlackLeftEdgeNum];
//  375                 }
//  376                 else if(use == 2)
??BlackGetLeftStep1Edge_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+2
        BNE.N    ??BlackGetLeftStep1Edge_2
//  377                 {
//  378                   BlackLeftRealWB[1] = ImgNew[row][col] - ImgNew[row][col-1-BlackLeftEdgeNum]; 
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable12_2
        MLA      R1,R1,R4,R2
        ADDS     R1,R8,R1
        LDRB     R1,[R1, #-3]
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+1]
//  379                   BlackLeftRealW[1] = ImgNew[row][col];
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        LDR.W    R1,??DataTable11_1
        STRB     R0,[R1, #+1]
//  380                   BlackLeftRealB[1] = ImgNew[row][col-1-BlackLeftEdgeNum];
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-3]
        LDR.W    R1,??DataTable12_1
        STRB     R0,[R1, #+1]
//  381                 }
//  382                 else
//  383                 {
//  384                 }
//  385               }
//  386               //跳变检测成功，取黑点
//  387               BlackLeftLoc[row][index] = col - 1 - BlackLeftEdgeNum;          
??BlackGetLeftStep1Edge_2:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable12_3
        MLA      R0,R0,R4,R1
        SUBS     R1,R8,#+3
        STRB     R1,[R7, R0]
//  388               index++;            
        ADDS     R7,R7,#+1
??BlackGetLeftStep1Edge_3:
        SUBS     R8,R8,#+1
??BlackGetLeftStep1Edge_0:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+6
        BLT.W    ??BlackGetLeftStep1Edge_4
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R1,[R0, #-3]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R2,??DataTable12_2
        MLA      R0,R0,R4,R2
        LDRB     R0,[R8, R0]
        BL       AbsRe
        LDR.W    R1,??DataTable12_4
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCS.N    ??BlackGetLeftStep1Edge_3
        LDR.W    R0,??DataTable12_5
        LDRB     R0,[R0, #+0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable12_2
        MLA      R1,R1,R4,R2
        LDRB     R1,[R8, R1]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep1Edge_3
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-3]
        LDR.W    R1,??DataTable12_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep1Edge_3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+31
        BLT.N    ??BlackGetLeftStep1Edge_5
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-4]
        LDR.W    R1,??DataTable12_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep1Edge_6
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-5]
        LDR.W    R1,??DataTable12_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep1Edge_6
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-6]
        LDR.W    R1,??DataTable12_6
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
        BLT.N    ??BlackGetLeftStep1Edge_9
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-4]
        LDR.W    R1,??DataTable12_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep1Edge_10
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-5]
        LDR.W    R1,??DataTable12_6
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
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-4]
        LDR.W    R1,??DataTable12_6
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
        MOVS     R0,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable12_3
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
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
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable12_2
        MLA      R1,R1,R4,R2
        ADDS     R1,R8,R1
        LDRB     R1,[R1, #-3]
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        LDR.W    R1,??DataTable11_1
        STRB     R0,[R1, #+0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #-3]
        LDR.W    R1,??DataTable12_1
        STRB     R0,[R1, #+0]
        B.N      ??BlackGetLeftStep1Edge_2
//  389           }    
//  390       }   
//  391   }
//  392   
//  393   //1个可疑黑点也没有，则报错。
//  394   if(index == 0)
??BlackGetLeftStep1Edge_4:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??BlackGetLeftStep1Edge_17
//  395   {
//  396     if(CrossFlag)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??BlackGetLeftStep1Edge_18
//  397     {
//  398       //对3个关键值的实际值清零
//  399       BlackLeftRealClear();
        BL       BlackLeftRealClear
//  400     }
//  401     //该行定位黑线失败，赋无效值
//  402     BlackLeftLoc[row][0] = MaxValUint8;
??BlackGetLeftStep1Edge_18:
        MOVS     R0,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable12_3
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  403     return 0;
        MOVS     R0,#+0
        B.N      ??BlackGetLeftStep1Edge_16
//  404   }
//  405   
//  406   //没有报错，就会走到这里，黑点查找成功，会有1，2，3个黑点
//  407   return 1;
??BlackGetLeftStep1Edge_17:
        MOVS     R0,#+1
??BlackGetLeftStep1Edge_16:
        POP      {R4-R8,PC}       ;; return
//  408 }
//  409 
//  410 
//  411 
//  412 //======================================================================
//  413 //函数名：BlackGetLeftStep2Win
//  414 //功  能：窗口内跳变检测函数
//  415 //参  数：待处理行号row, 窗口大小win, 预测的跳变点的位置predict
//  416 //返  回：1成功  0失败
//  417 //影  响：
//  418 //说  明：  
//  419 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  420 uint8 BlackGetLeftStep2Win(uint8 row, uint8 win, uint8 predict)
//  421 {
BlackGetLeftStep2Win:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//  422   uint8 col, temp, temp1;
//  423   uint8 abs1;
//  424 
//  425   //在规划好的窗口内，从右往左查找跳变沿
//  426   //防止溢出
//  427   
//  428   //对左边界的限制
//  429   if(predict <= win)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R1,R2
        BCC.N    ??BlackGetLeftStep2Win_0
//  430   {
//  431     temp = 4 + BlackLeftEdgeNum;
        MOVS     R5,#+6
        B.N      ??BlackGetLeftStep2Win_1
//  432   }  
//  433   else
//  434   {
//  435     temp = predict - win;
??BlackGetLeftStep2Win_0:
        SUBS     R5,R2,R1
//  436     if(temp < 4 + BlackLeftEdgeNum)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+6
        BGE.N    ??BlackGetLeftStep2Win_1
//  437     {
//  438       temp = 4 + BlackLeftEdgeNum;
        MOVS     R5,#+6
//  439     }
//  440     else 
//  441     {
//  442     } 
//  443   }
//  444   
//  445   //对右边界的限制
//  446   if(predict + win > CameraRealWidth - 1)
??BlackGetLeftStep2Win_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R0,R1,R2
        CMP      R0,#+250
        BLT.N    ??BlackGetLeftStep2Win_2
//  447   {
//  448     col = CameraRealWidth - 1;  
        MOVS     R6,#+249
        B.N      ??BlackGetLeftStep2Win_3
//  449   }
//  450   else
//  451   {
//  452     col = predict + win;  
??BlackGetLeftStep2Win_2:
        ADDS     R6,R1,R2
        B.N      ??BlackGetLeftStep2Win_3
//  453   }
//  454   
//  455   //判断条件里的">"很关键，没有写">="是考虑temp = 0的情况，这样可以防止产生负数（uint8中为正数），即无限循环。
//  456   for( ; col > temp; col--) 
??BlackGetLeftStep2Win_4:
        SUBS     R6,R6,#+1
??BlackGetLeftStep2Win_3:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R5,R6
        BCS.W    ??BlackGetLeftStep2Win_5
//  457   {
//  458     abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col-1-BlackLeftEdgeNum]);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R1,[R0, #-3]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R2,??DataTable12_2
        MLA      R0,R0,R4,R2
        LDRB     R0,[R6, R0]
        BL       AbsRe
//  459     if( 
//  460           (abs1 > LimitLeftWB) //两者的差够大
//  461         &&(ImgNew[row][col] > LimitLeftW)                     //白点够白
//  462         &&(ImgNew[row][col-1-BlackLeftEdgeNum] < LimitLeftB)                   //黑点够黑
//  463        )
        LDR.W    R1,??DataTable12_4
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCS.N    ??BlackGetLeftStep2Win_4
        LDR.W    R0,??DataTable12_5
        LDRB     R0,[R0, #+0]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable12_2
        MLA      R1,R1,R4,R2
        LDRB     R1,[R6, R1]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_4
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #-3]
        LDR.W    R1,??DataTable12_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_4
//  464     {
//  465           //近处的行，向左3个点仍为黑点
//  466           if(row > BlackMiddleLine)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+31
        BLT.N    ??BlackGetLeftStep2Win_6
//  467           {
//  468             temp1 = (
//  469                       (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB)
//  470                     &&(ImgNew[row][col-3-BlackLeftEdgeNum] < LimitLeftB)
//  471                     &&(ImgNew[row][col-4-BlackLeftEdgeNum] < LimitLeftB)
//  472                     );
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #-4]
        LDR.W    R1,??DataTable12_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_7
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #-5]
        LDR.W    R1,??DataTable12_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_7
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #-6]
        LDR.W    R1,??DataTable12_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_7
        MOVS     R0,#+1
        B.N      ??BlackGetLeftStep2Win_8
??BlackGetLeftStep2Win_7:
        MOVS     R0,#+0
??BlackGetLeftStep2Win_8:
        B.N      ??BlackGetLeftStep2Win_9
//  473           }
//  474           else
//  475           {
//  476             //中间的行 ，向左2个点为仍为黑点
//  477             if(row > BlackFarLine)
??BlackGetLeftStep2Win_6:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+21
        BLT.N    ??BlackGetLeftStep2Win_10
//  478             {
//  479               temp1 = (
//  480                         (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB)
//  481                       &&(ImgNew[row][col-3-BlackLeftEdgeNum] < LimitLeftB)
//  482                       );
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #-4]
        LDR.W    R1,??DataTable12_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_11
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #-5]
        LDR.W    R1,??DataTable12_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_11
        MOVS     R0,#+1
        B.N      ??BlackGetLeftStep2Win_12
??BlackGetLeftStep2Win_11:
        MOVS     R0,#+0
??BlackGetLeftStep2Win_12:
        B.N      ??BlackGetLeftStep2Win_9
//  483             }
//  484             //远处的行 ，向左1个点为仍为黑点
//  485             else
//  486             {
//  487               temp1 = (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB);
??BlackGetLeftStep2Win_10:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable12_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #-4]
        LDR.W    R1,??DataTable12_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetLeftStep2Win_13
        MOVS     R0,#+1
        B.N      ??BlackGetLeftStep2Win_14
??BlackGetLeftStep2Win_13:
        MOVS     R0,#+0
//  488             }
//  489           }
//  490           if(temp1)
??BlackGetLeftStep2Win_14:
??BlackGetLeftStep2Win_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.W    ??BlackGetLeftStep2Win_4
//  491           {
//  492             //两批条件均满足，直接记录该点为黑线，返回即可
//  493             BlackLeftLoc[row][0] = col - 1 - BlackLeftEdgeNum;
        SUBS     R0,R6,#+3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable14
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  494             return 1;
        MOVS     R0,#+1
        B.N      ??BlackGetLeftStep2Win_15
//  495             //break;          
//  496           }
//  497     }
//  498     
//  499     
//  500     
//  501   }// end of for循环
//  502   
//  503   //如果一直到窗口最左边还没有找到跳变沿，  
//  504   BlackLeftLoc[row][0] = MaxValUint8;   //该行的黑线位置记为无效值
??BlackGetLeftStep2Win_5:
        MOVS     R0,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable14
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  505   return 0;
        MOVS     R0,#+0
??BlackGetLeftStep2Win_15:
        POP      {R4-R6,PC}       ;; return
//  506 
//  507   
//  508 }
//  509 
//  510 
//  511 //======================================================================
//  512 //函数名：BlackGetLeftStep1Scan
//  513 //功  能：行扫描函数
//  514 //参  数：扫描起始行FirstLine, 扫描结束行LastLine, 十字再检测标志CrossFlag
//  515 //返  回：0~CameraHight-1行数 255采集失败
//  516 //影  响：
//  517 //说  明：
//  518 //             
//  519 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  520 uint8 BlackGetLeftStep1Scan(uint8 FirstLine, uint8 LastLine, uint8 CrossFlag)
//  521 {
BlackGetLeftStep1Scan:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,R2
//  522     uint8 row, temp1, temp2;
//  523     uint8 abs1;
//  524     uint8 tempWB, tempW, tempB;
//  525   //最近的BlackStep1Size行用差值法找黑线
//  526     for(row = FirstLine; row > LastLine; row -= 2)
        B.N      ??BlackGetLeftStep1Scan_0
??BlackGetLeftStep1Scan_1:
        SUBS     R5,R5,#+2
??BlackGetLeftStep1Scan_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R4,R5
        BCS.N    ??BlackGetLeftStep1Scan_2
//  527     {
//  528       //判断是否连续两行检测到跳变。
//  529       temp1 = BlackGetLeftStep1Edge(row, 1, CrossFlag);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetLeftStep1Edge
        MOVS     R7,R0
//  530       temp2 = BlackGetLeftStep1Edge(row-1, 2, CrossFlag);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+2
        SUBS     R0,R5,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetLeftStep1Edge
//  531       if(temp1 && temp2)//这里可以这么写，不用嵌套if，因为&&的特点
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??BlackGetLeftStep1Scan_1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BlackGetLeftStep1Scan_1
//  532       {
//  533         abs1 = AbsRe(BlackLeftLoc[row-1][0], BlackLeftLoc[row][0]);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable12_3
        MLA      R0,R0,R5,R1
        LDRB     R1,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R2,??DataTable12_3
        MLA      R0,R0,R5,R2
        LDRB     R0,[R0, #-3]
        BL       AbsRe
//  534         //进一步判断连续两行的黑点的间隔是否够小，且暂取第1个可疑黑点。
//  535         if(abs1 < BlackLeftStep1ScanMinus)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BGE.N    ??BlackGetLeftStep1Scan_1
//  536         {
//  537           if(CrossFlag)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??BlackGetLeftStep1Scan_3
//  538             {
//  539               //差值的处理，留有裕度，且有上下界。
//  540               tempWB = (BlackLeftRealWB[0] + BlackLeftRealWB[1]) / 2 - LimitLeftWBMargin; 
        LDR.W    R0,??DataTable11
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable11
        LDRB     R1,[R1, #+1]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        SUBS     R0,R0,#+20
//  541               if(tempWB < LimitLeftWBMin) tempWB = LimitLeftWBMin;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+75
        BGE.N    ??BlackGetLeftStep1Scan_4
        MOVS     R0,#+75
        B.N      ??BlackGetLeftStep1Scan_5
//  542               else if(tempWB > LimitLeftWBMax) tempWB = LimitLeftWBMax;
??BlackGetLeftStep1Scan_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+106
        BLT.N    ??BlackGetLeftStep1Scan_5
        MOVS     R0,#+105
//  543               else ;
//  544               LimitLeftWB = tempWB;
??BlackGetLeftStep1Scan_5:
        LDR.W    R1,??DataTable12_4
        STRB     R0,[R1, #+0]
//  545               
//  546               //白点的处理，留有裕度，且有上下界。
//  547               tempW = (BlackLeftRealW[0] + BlackLeftRealW[1]) / 2 - LimitLeftWMargin;
        LDR.W    R0,??DataTable11_1
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_1
        LDRB     R1,[R1, #+1]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        SUBS     R0,R0,#+30
//  548               if(tempW < LimitLeftWMin) tempW = LimitLeftWMin;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+150
        BGE.N    ??BlackGetLeftStep1Scan_6
        MOVS     R0,#+150
        B.N      ??BlackGetLeftStep1Scan_7
//  549               else if(tempW > LimitLeftWMax) tempW = LimitLeftWMax;
??BlackGetLeftStep1Scan_6:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+201
        BLT.N    ??BlackGetLeftStep1Scan_7
        MOVS     R0,#+200
//  550               else ;
//  551               LimitLeftW = tempW;
??BlackGetLeftStep1Scan_7:
        LDR.W    R1,??DataTable12_5
        STRB     R0,[R1, #+0]
//  552               
//  553               //黑点的处理，留有裕度，且有上下界。
//  554               tempB = (BlackLeftRealB[0] + BlackLeftRealB[1]) / 2 + LimitLeftBMargin;
        LDR.W    R0,??DataTable12_1
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable12_1
        LDRB     R1,[R1, #+1]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+30
//  555               if(tempB < LimitLeftBMin) tempB = LimitLeftBMin;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+85
        BGE.N    ??BlackGetLeftStep1Scan_8
        MOVS     R0,#+85
        B.N      ??BlackGetLeftStep1Scan_9
//  556               else if(tempB > LimitLeftBMax) tempB = LimitLeftBMax;
??BlackGetLeftStep1Scan_8:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+101
        BLT.N    ??BlackGetLeftStep1Scan_9
        MOVS     R0,#+100
//  557               else ;
//  558               LimitLeftB = tempB;
??BlackGetLeftStep1Scan_9:
        LDR.W    R1,??DataTable12_6
        STRB     R0,[R1, #+0]
//  559             }
//  560           break;
//  561         }
//  562       }      
//  563     }   
//  564     
//  565     //黑线检测失败
//  566     if(row <= LastLine)
??BlackGetLeftStep1Scan_3:
??BlackGetLeftStep1Scan_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R4,R5
        BCC.N    ??BlackGetLeftStep1Scan_10
//  567       return MaxValUint8;
        MOVS     R0,#+255
        B.N      ??BlackGetLeftStep1Scan_11
//  568     else 
//  569       return row;
??BlackGetLeftStep1Scan_10:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??BlackGetLeftStep1Scan_11:
        POP      {R1,R4-R7,PC}    ;; return
//  570   
//  571 }
//  572 
//  573 //======================================================================
//  574 //函数名：BlackLeftCrossStep3
//  575 //功  能：脑补线函数
//  576 //参  数：第1段有效黑线的最后一行FirstLine， 第2段有效黑线的第一行LastLine
//  577 //返  回：1成功 0失败
//  578 //影  响：
//  579 //说  明：1. 这里有一些浮点运算，会占时间，在调用本函数时要慎重，尽量不要用。
//  580 //             
//  581 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  582 uint8 BlackLeftCrossStep3(uint8 FirstLine, uint8 LastLine)
//  583 {
BlackLeftCrossStep3:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  584   float delta_x, delta_y, delta, index;
//  585   uint8 row, temp1, temp2;
//  586   //uint8 temp3, temp4, flag1, flag2;
//  587   
//  588   //超始行比结束行还高，报错！
//  589   if(LastLine >= FirstLine)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R5,R4
        BCC.N    ??BlackLeftCrossStep3_0
//  590   {
//  591     uart_sendN(UART0, (uint8 *)"\nError In BlackLeftCrossStep3!", 30);
        MOVS     R2,#+30
        LDR.W    R1,??DataTable14_1
        LDR.W    R0,??DataTable12  ;; 0x4006a000
        BL       uart_sendN
//  592     return 0;  
        MOVS     R0,#+0
        B.N      ??BlackLeftCrossStep3_1
//  593   }
//  594   
//  595   temp1 = BlackLeftLoc[FirstLine][0];
??BlackLeftCrossStep3_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        LDRB     R7,[R0, #+0]
//  596   temp2 = BlackLeftLoc[LastLine][0];
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R5,R1
        LDRB     R8,[R0, #+0]
//  597   
//  598   /*
//  599   flag = 1;
//  600   flag = 2;
//  601   //确认这两个点是直角处的点，也就是往左6个点仍为黑点
//  602   if(temp1 <= (CameraRealWidth - 9))
//  603   {
//  604     temp3 = (
//  605             (ImgNew[FirstLine+1][temp1+6] < LimitLeftB)
//  606           &&(ImgNew[FirstLine+1][temp1+7] < LimitLeftB)
//  607           &&(ImgNew[FirstLine+1][temp1+8] < LimitLeftB)
//  608           );
//  609     if(temp3)
//  610     {
//  611       flag1 = 0;  
//  612     }
//  613   }
//  614   
//  615   if(temp2 <= (CameraRealWidth - 9))
//  616   {
//  617     temp4 = (
//  618             (ImgNew[LastLine-1][temp2+6] < LimitLeftB)
//  619           &&(ImgNew[LastLine-1][temp2+7] < LimitLeftB)
//  620           &&(ImgNew[LastLine-1][temp2+8] < LimitLeftB)
//  621           );
//  622     if(temp4)
//  623     {
//  624       flag2 = 0;  
//  625     }
//  626   }
//  627   
//  628   if((flag1 == 0) || (flag2 == 0))
//  629   {
//  630     return 0;  
//  631   }
//  632   
//  633   */
//  634   
//  635   delta_y = FirstLine - LastLine;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        SUBS     R0,R4,R5
        BL       __aeabi_i2f
        MOVS     R6,R0
//  636   
//  637   
//  638   //斜率向右
//  639   if(temp1 < temp2)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R7,R8
        BCS.N    ??BlackLeftCrossStep3_2
//  640   {
//  641     delta_x = temp2 - temp1;
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        SUBS     R0,R8,R7
        BL       __aeabi_i2f
//  642     delta = delta_x / delta_y; //这是1个浮点数
        MOVS     R1,R6
        BL       __aeabi_fdiv
        MOVS     R7,R0
//  643     
//  644     index = 1.0;
        MOVS     R8,#+1065353216
//  645     for(row = FirstLine - 1; row >= LastLine + 1; row-- )
        SUBS     R6,R4,#+1
??BlackLeftCrossStep3_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,#+1
        CMP      R6,R0
        BLT.N    ??BlackLeftCrossStep3_4
//  646     {
//  647       //每次右移一点点
//  648       BlackLeftLoc[row][0] = (uint8)((float)BlackLeftLoc[FirstLine][0] + delta * index);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOV      R9,R0
        MOVS     R0,R7
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
//  649       index += 1.0;
        MOV      R0,R8
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable10  ;; 0x3ff00000
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        MOV      R8,R0
//  650     }
        SUBS     R6,R6,#+1
        B.N      ??BlackLeftCrossStep3_3
//  651   }
//  652   //斜率向左
//  653   else if(temp1 > temp2)
??BlackLeftCrossStep3_2:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R8,R7
        BCS.N    ??BlackLeftCrossStep3_5
//  654   {
//  655     delta_x = temp1 - temp2;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        SUBS     R0,R7,R8
        BL       __aeabi_i2f
//  656     delta = delta_x / delta_y;
        MOVS     R1,R6
        BL       __aeabi_fdiv
        MOVS     R7,R0
//  657     
//  658     index = 1.0;
        MOVS     R8,#+1065353216
//  659     for(row = FirstLine - 1; row >= LastLine + 1; row-- )
        SUBS     R6,R4,#+1
??BlackLeftCrossStep3_6:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,#+1
        CMP      R6,R0
        BLT.N    ??BlackLeftCrossStep3_4
//  660     {
//  661       //每次右移一点点
//  662       BlackLeftLoc[row][0] = (uint8)((float)BlackLeftLoc[FirstLine][0] - delta * index);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOV      R9,R0
        MOVS     R0,R7
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
//  663       index += 1.0;
        MOV      R0,R8
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable10  ;; 0x3ff00000
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        MOV      R8,R0
//  664     }
        SUBS     R6,R6,#+1
        B.N      ??BlackLeftCrossStep3_6
//  665   }
//  666   //斜率直走，这个不太可能出现
//  667   else
//  668   {
//  669     for(row = FirstLine - 1; row >= LastLine + 1; row-- )
??BlackLeftCrossStep3_5:
        SUBS     R6,R4,#+1
        B.N      ??BlackLeftCrossStep3_7
//  670     {
//  671       //赋相同的值
//  672       BlackLeftLoc[row][0] = temp1;
??BlackLeftCrossStep3_8:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R6,R1
        STRB     R7,[R0, #+0]
//  673     }
        SUBS     R6,R6,#+1
??BlackLeftCrossStep3_7:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,#+1
        CMP      R6,R0
        BGE.N    ??BlackLeftCrossStep3_8
//  674   }
//  675   
//  676   return 1;
??BlackLeftCrossStep3_4:
        MOVS     R0,#+1
??BlackLeftCrossStep3_1:
        POP      {R1,R4-R9,PC}    ;; return
//  677     
//  678 }
//  679 
//  680 //======================================================================
//  681 //函数名：BlackLeftCrossConfirm
//  682 //功  能：线头有效性的确认
//  683 //参  数：第1段黑线的真实结束行Row1RealLastLine，第2段黑线的真实起始行Row2RealFirstLine
//  684 //返  回：1成功 0失败
//  685 //影  响：无
//  686 //说  明：
//  687 //      
//  688 //             
//  689 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  690 uint8 BlackLeftCrossConfirm(uint8 Row1RealLastLine, uint8 Row2RealFirstLine)
//  691 {
BlackLeftCrossConfirm:
        PUSH     {R2-R6,LR}
        MOVS     R4,R1
//  692   uint8 row, index;
//  693   uint8 x[BlackCrossConfirmNum];
//  694   uint8 y[BlackCrossConfirmNum];
//  695   
//  696   float a0, a1, temp;
//  697   
//  698   //第一段黑线太短，无法检测正确性。直接返回1.
//  699   if(Row1RealLastLine < 5) return 1;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BGE.N    ??BlackLeftCrossConfirm_0
        MOVS     R0,#+1
        B.N      ??BlackLeftCrossConfirm_1
//  700   
//  701   //以左上角为原点，向下为x轴正方向（0~49），向右为y轴正方向(0~249)
//  702   index = 0;
??BlackLeftCrossConfirm_0:
        MOVS     R1,#+0
//  703   for(row = Row1RealLastLine; ; row++)
        B.N      ??BlackLeftCrossConfirm_2
??BlackLeftCrossConfirm_3:
        ADDS     R0,R0,#+1
//  704   {
//  705     //有效行的记录
//  706     if(BlackLeftLoc[row][0] != MaxValUint8)
??BlackLeftCrossConfirm_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable14
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        CMP      R2,#+255
        BEQ.N    ??BlackLeftCrossConfirm_4
//  707     {
//  708       y[index] = BlackLeftLoc[row][0];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable14
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R3,SP,#+0
        STRB     R2,[R1, R3]
//  709       x[index] = row;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R2,SP,#+4
        STRB     R0,[R1, R2]
//  710       index++;
        ADDS     R1,R1,#+1
//  711     }
//  712     //点数够多，则跳出。
//  713     if(index == BlackCrossConfirmNum) break;
??BlackLeftCrossConfirm_4:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+3
        BNE.N    ??BlackLeftCrossConfirm_5
//  714     //直到最低行仍没有凑够足够的点数，说明第一段有效黑线太短，无法检测正确性，直接返回1.
//  715     if(row == CameraHight - 1) return 1;
//  716   }
//  717   
//  718   //最小二乘法
//  719   //y = a0 + a1 * x
//  720   a1 = LeastSquarea1(x, y, BlackCrossConfirmNum);
        MOVS     R2,#+3
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea1
        MOVS     R6,R0
//  721   a0 = LeastSquarea0(x, y, a1, BlackCrossConfirmNum);
        MOVS     R3,#+3
        MOVS     R2,R6
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea0
        MOVS     R5,R0
//  722   
//  723   //temp为第2段黑线起始行本应该在的位置。
//  724   temp = a0 + a1 * Row2RealFirstLine;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        BL       __aeabi_ui2f
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R5,R0
//  725   if((temp < 0) || (temp > CameraRealWidth - 1)) 
        MOVS     R0,R5
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCC.N    ??BlackLeftCrossConfirm_6
        MOVS     R0,R5
        LDR.W    R1,??DataTable16  ;; 0x43790001
        BL       __aeabi_cfrcmple
        BHI.N    ??BlackLeftCrossConfirm_7
//  726   {
//  727     return 0;
??BlackLeftCrossConfirm_6:
        MOVS     R0,#+0
        B.N      ??BlackLeftCrossConfirm_1
//  728   }
??BlackLeftCrossConfirm_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??BlackLeftCrossConfirm_3
        MOVS     R0,#+1
        B.N      ??BlackLeftCrossConfirm_1
//  729   else
//  730   { //这里本来应该加上把这个点限定在窗内，但是似乎没必要。
//  731     if(
//  732       (BlackLeftLoc[Row2RealFirstLine][0] > temp - BlackCrossConfirmWin) 
//  733     &&(BlackLeftLoc[Row2RealFirstLine][0] < temp + BlackCrossConfirmWin)
//  734       )
??BlackLeftCrossConfirm_7:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOVS     R6,R1
        LDR.W    R0,??DataTable16_1  ;; 0xc1200000
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R1,R6
        BL       __aeabi_cfcmple
        BCS.N    ??BlackLeftCrossConfirm_8
        LDR.W    R0,??DataTable16_2  ;; 0x41200000
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R5,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R5
        BL       __aeabi_cfcmple
        BCS.N    ??BlackLeftCrossConfirm_8
//  735     {
//  736       return 1;
        MOVS     R0,#+1
        B.N      ??BlackLeftCrossConfirm_1
//  737     }
//  738     else
//  739     {
//  740       return 0;
??BlackLeftCrossConfirm_8:
        MOVS     R0,#+0
??BlackLeftCrossConfirm_1:
        POP      {R1,R2,R4-R6,PC}  ;; return
//  741     }
//  742     
//  743   }  
//  744 }
//  745 
//  746 
//  747 
//  748 //======================================================================
//  749 //函数名：BlackLeftAgainForCross
//  750 //功  能：十字检测程序
//  751 //参  数：第2段黑线的预测起始行Row2FirstLine， 第2段黑线的预测结束行Row2LastLine，
//  752 //        第1段黑线的实际结束行Row1RealLastLine
//  753 //返  回：1成功 0失败
//  754 //影  响：
//  755 //说  明：1. 本函数会调用浮点运算的函数，预计花费较多时间，调用入口需谨慎。
//  756 //             
//  757 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  758 uint8 BlackLeftAgainForCross(uint8 Row2FirstLine, uint8 Row2LastLine, uint8 Row1RealLastLine)
//  759 {
BlackLeftAgainForCross:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  760     uint8 row, temp, temp1, temp2;
//  761     uint8 Row2RealFirstLine; //第2段黑线的真实起始行
//  762     uint8 i;
//  763     
//  764     temp = BlackGetLeftStep1Scan(Row2FirstLine, Row2LastLine, 0); //第3个参数0表示是十字再检测，不用更新3个关键值
        MOVS     R2,#+0
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetLeftStep1Scan
        MOV      R8,R0
//  765     if(temp == MaxValUint8)  
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+255
        BNE.N    ??BlackLeftAgainForCross_0
//  766     {
//  767       //扫屁股工作。       
//  768       for(i = Row2FirstLine; ; i--)
        B.N      ??BlackLeftAgainForCross_1
??BlackLeftAgainForCross_2:
        SUBS     R4,R4,#+1
//  769       {
//  770         BlackLeftLoc[i][0] = MaxValUint8;
??BlackLeftAgainForCross_1:
        MOVS     R0,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable14
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  771         if(i == 0) break;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??BlackLeftAgainForCross_2
//  772       }
//  773       return 0;  
        MOVS     R0,#+0
        B.N      ??BlackLeftAgainForCross_3
//  774     }
//  775     else 
//  776     {
//  777       if(!BlackLeftCrossConfirm(Row1RealLastLine, temp))
??BlackLeftAgainForCross_0:
        MOV      R1,R8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackLeftCrossConfirm
        CMP      R0,#+0
        BNE.N    ??BlackLeftAgainForCross_4
//  778       { //扫屁股工作。       //i >= (temp-1)
//  779         for(i = Row2FirstLine; ; i--)
        B.N      ??BlackLeftAgainForCross_5
??BlackLeftAgainForCross_6:
        SUBS     R4,R4,#+1
//  780         {
//  781           BlackLeftLoc[i][0] = MaxValUint8;
??BlackLeftAgainForCross_5:
        MOVS     R0,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable14
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  782           if(i == 0) break;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??BlackLeftAgainForCross_6
//  783         }
//  784         return 0;
        MOVS     R0,#+0
        B.N      ??BlackLeftAgainForCross_3
//  785       }
//  786       //十字再检测的线头的确在限定的范围内，可以继续。
//  787       else
//  788       {
//  789       row = temp;
??BlackLeftAgainForCross_4:
        MOV      R4,R8
//  790       }
//  791       //row = temp;
//  792     }
//  793     
//  794     Row2RealFirstLine = row; //记录第2段黑线的真实起始行
        MOVS     R7,R4
//  795     
//  796     //temp为预测的黑点位置
//  797     temp = BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0];
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
//  798     //从最近的认证行到取最远的行
//  799     for(row -= 2; ; row -= 2)
        SUBS     R4,R4,#+2
        B.N      ??BlackLeftAgainForCross_7
??BlackLeftAgainForCross_8:
        SUBS     R4,R4,#+2
//  800     {
//  801       temp1 = BlackGetLeftStep2Win(row, BlackLeftWinVal, temp);
??BlackLeftAgainForCross_7:
        MOV      R2,R8
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetLeftStep2Win
        MOV      R9,R0
//  802       temp2 = BlackGetLeftStep2Win(row-1, BlackLeftWinVal, temp);
        MOV      R2,R8
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        SUBS     R0,R4,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetLeftStep2Win
//  803       if(temp1 && temp2) 
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??BlackLeftAgainForCross_9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BlackLeftAgainForCross_9
//  804       {
//  805         temp = BlackLeftLoc[row - 1][0] + BlackLeftLoc[row - 1][0] - BlackLeftLoc[row][0];
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
//  806       }
//  807       else
//  808       {
//  809       }       
//  810       
//  811       if((row == Row2LastLine) || (row == Row2LastLine+1)) break;      
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
//  812     }
//  813     
//  814      //脑补两段线的接线。
//  815     if(!BlackLeftCrossStep3(Row1RealLastLine, Row2RealFirstLine))
??BlackLeftAgainForCross_10:
        MOVS     R1,R7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackLeftCrossStep3
        CMP      R0,#+0
        BNE.N    ??BlackLeftAgainForCross_11
//  816     {
//  817       return 0;
        MOVS     R0,#+0
        B.N      ??BlackLeftAgainForCross_3
//  818     }
//  819     
//  820     return 1;
??BlackLeftAgainForCross_11:
        MOVS     R0,#+1
??BlackLeftAgainForCross_3:
        POP      {R1,R4-R9,PC}    ;; return
//  821         
//  822 }
//  823 
//  824 //======================================================================
//  825 //函数名：BlackLeftStep4BackLine
//  826 //功  能：补线函数。
//  827 //参  数：Step4StartLine开始行
//  828 //返  回：1成功 0失败
//  829 //影  响：
//  830 //说  明：1. 这里引用了float型的函数，有可能占用较长的时间。
//  831 //             
//  832 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  833 uint8 BlackLeftStep4BackLine(uint8 Step4StartLine)
//  834 {
BlackLeftStep4BackLine:
        PUSH     {R2-R6,LR}
        MOVS     R4,R0
//  835   uint8 row;
//  836   uint8 i, index;
//  837   uint8 x[BlackBackLineNum];   //取多少个点在一开始有定义。
//  838   uint8 y[BlackBackLineNum];
//  839   uint8 j;
//  840   uint8 temp1;
//  841   
//  842   float temp;
//  843   float a0, a1;
//  844   
//  845   if (Step4StartLine - BlackBackLineNum - BlackBackLineNum < 0)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        SUBS     R0,R4,#+8
        CMP      R0,#+0
        BPL.N    ??BlackLeftStep4BackLine_0
//  846   {
//  847     temp1 = 0;    
        MOVS     R2,#+0
        B.N      ??BlackLeftStep4BackLine_1
//  848   }
//  849   else
//  850   {
//  851     temp1 = Step4StartLine - BlackBackLineNum - BlackBackLineNum;
??BlackLeftStep4BackLine_0:
        SUBS     R2,R4,#+8
//  852   }
//  853 
//  854   index = 0;
??BlackLeftStep4BackLine_1:
        MOVS     R1,#+0
//  855   for(i = Step4StartLine; ; i--)
        MOVS     R0,R4
        B.N      ??BlackLeftStep4BackLine_2
??BlackLeftStep4BackLine_3:
        SUBS     R0,R0,#+1
//  856   {
//  857     if(BlackLeftLoc[i][0] != MaxValUint8)
??BlackLeftStep4BackLine_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R3,#+3
        LDR.W    R5,??DataTable14
        MLA      R3,R3,R0,R5
        LDRB     R3,[R3, #+0]
        CMP      R3,#+255
        BEQ.N    ??BlackLeftStep4BackLine_4
//  858     {
//  859       y[index] = BlackLeftLoc[i][0];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R3,#+3
        LDR.W    R5,??DataTable14
        MLA      R3,R3,R0,R5
        LDRB     R3,[R3, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R5,SP,#+0
        STRB     R3,[R1, R5]
//  860       x[index] = i;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R3,SP,#+4
        STRB     R0,[R1, R3]
//  861       index++;
        ADDS     R1,R1,#+1
//  862     }
//  863     if(index == BlackBackLineNum)
??BlackLeftStep4BackLine_4:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+4
        BNE.N    ??BlackLeftStep4BackLine_5
//  864     {
//  865       break;  
//  866     }
//  867     if(i == temp1)
//  868     {
//  869       return 0;
//  870     }
//  871   }
//  872   
//  873   //最小二乘法
//  874   //y = a0 + a1 * x
//  875   a1 = LeastSquarea1(x, y, BlackBackLineNum);
        MOVS     R2,#+4
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea1
        MOVS     R6,R0
//  876   a0 = LeastSquarea0(x, y, a1, BlackBackLineNum);
        MOVS     R3,#+4
        MOVS     R2,R6
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea0
        MOVS     R5,R0
//  877   
//  878   for(row = Step4StartLine + 1; row <= CameraHight - 1; row++)
        ADDS     R4,R4,#+1
        B.N      ??BlackLeftStep4BackLine_6
??BlackLeftStep4BackLine_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R0,R2
        BNE.N    ??BlackLeftStep4BackLine_3
        MOVS     R0,#+0
        B.N      ??BlackLeftStep4BackLine_7
//  879   {
//  880     //补线也有个度，向左向右都不能补出范围。
//  881     temp = a0 + a1 * row;
//  882     if(temp >= CameraRealWidth)
//  883     {
//  884       //BlackLeftLoc[row][0] = CameraRealWidth - 1;
//  885       //超过左右界限时，原策略为置边界值，现在的策略是从该行起置无效值。
//  886       for(j = row; ; j++)
//  887       {
//  888         BlackLeftLoc[row][0] = MaxValUint8;
//  889         if(j == CameraHight - 1) break;
//  890       }
//  891       break;
//  892     }
//  893     else if(temp <= 0)
//  894     {
//  895       //BlackLeftLoc[row][0] = 0;
//  896       //超过左右界限时，原策略为置边界值，现在的策略是从该行起置无效值。
//  897       for(j = row; ; j++)
//  898       {
//  899         BlackLeftLoc[row][0] = MaxValUint8;
//  900         if(j == CameraHight - 1) break;
//  901       }
//  902       break;
//  903     }
//  904     else
//  905     {
//  906       BlackLeftLoc[row][0] = (uint8)(temp); 
??BlackLeftStep4BackLine_8:
        BL       __aeabi_f2iz
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable14
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
//  907     }
        ADDS     R4,R4,#+1
??BlackLeftStep4BackLine_6:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+50
        BGE.N    ??BlackLeftStep4BackLine_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        BL       __aeabi_ui2f
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable18  ;; 0x437a0000
        BL       __aeabi_cfrcmple
        BHI.N    ??BlackLeftStep4BackLine_10
        MOVS     R0,R4
        B.N      ??BlackLeftStep4BackLine_11
??BlackLeftStep4BackLine_12:
        ADDS     R0,R0,#+1
??BlackLeftStep4BackLine_11:
        MOVS     R1,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable14
        MLA      R2,R2,R4,R3
        STRB     R1,[R2, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??BlackLeftStep4BackLine_12
        B.N      ??BlackLeftStep4BackLine_9
??BlackLeftStep4BackLine_10:
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BHI.N    ??BlackLeftStep4BackLine_8
        MOVS     R0,R4
        B.N      ??BlackLeftStep4BackLine_13
??BlackLeftStep4BackLine_14:
        ADDS     R0,R0,#+1
??BlackLeftStep4BackLine_13:
        MOVS     R1,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable14
        MLA      R2,R2,R4,R3
        STRB     R1,[R2, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??BlackLeftStep4BackLine_14
//  908   }
//  909   
//  910   return 1;
??BlackLeftStep4BackLine_9:
        MOVS     R0,#+1
??BlackLeftStep4BackLine_7:
        POP      {R1,R2,R4-R6,PC}  ;; return
//  911   
//  912 }

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

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     `?<Constant {0, 255, 1, 0}>`
//  913 
//  914 
//  915 
//  916 
//  917 //======================================================================
//  918 //函数名：BlackGetLeft
//  919 //功  能：左黑线提取算法
//  920 //参  数：无
//  921 //返  回：1成功 0失败
//  922 //影  响：
//  923 //说  明：1. 暂时可以处理直道，弯道，十字路口3种情况。2014.11.10
//  924 //      
//  925 //             
//  926 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  927 uint8 BlackGetLeft(void)
//  928 {
BlackGetLeft:
        PUSH     {R3-R11,LR}
//  929     uint8 row, temp, temp1, temp2, temp3, i;
//  930     uint8 GapCount, Row1RealLastLine, index;
//  931     uint8 Step4Flag, Step4StartLine;  
//  932     
//  933     Step4Flag = 0;
        MOVS     R5,#+0
//  934     //默认十字检测标志置为未进入。
//  935     BlackLeftCrossDone = 0;    
        MOVS     R0,#+0
        LDR.W    R1,??DataTable19
        STRB     R0,[R1, #+0]
//  936     
//  937     //有可能会返回黑线提取失败
//  938     temp = BlackGetLeftStep1Scan(CameraHight - 1, CameraHight - BlackStep1Size - 1, 1);
        MOVS     R2,#+1
        MOVS     R1,#+24
        MOVS     R0,#+49
        BL       BlackGetLeftStep1Scan
        MOVS     R7,R0
//  939     if(temp == MaxValUint8)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+255
        BNE.N    ??BlackGetLeft_0
//  940     {
//  941       return 0;
        MOVS     R0,#+0
        B.N      ??BlackGetLeft_1
//  942     }    
//  943     else 
//  944     {
//  945       row = temp;
??BlackGetLeft_0:
        MOV      R10,R7
//  946       //起始线头的位置非常高
//  947       if(row < CameraHight - BlackLeftBackLineStart)
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+42
        BGE.N    ??BlackGetLeft_2
//  948       {
//  949         Step4Flag = 1;
        MOVS     R5,#+1
//  950         Step4StartLine = row;
        MOV      R6,R10
//  951       }
//  952     }
//  953 
//  954     //上次已经处理完了第row-1行，下一次要处理第row-2行
//  955     //BlackLeftSlope();
//  956     
//  957     //temp为预测的黑点位置
//  958 
//  959     //对预测值的大小限定
//  960     if((BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0]) < 0)
??BlackGetLeft_2:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable12_3
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_3
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_3
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+0
        BPL.N    ??BlackGetLeft_3
//  961     {
//  962       temp = 0;
        MOVS     R7,#+0
        B.N      ??BlackGetLeft_4
//  963     }
//  964     else if((BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0]) >= CameraRealWidth)
??BlackGetLeft_3:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable12_3
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_3
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_3
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+250
        BLT.N    ??BlackGetLeft_5
//  965     {
//  966       temp = CameraRealWidth - 1;
        MOVS     R7,#+249
        B.N      ??BlackGetLeft_4
//  967     }
//  968     else
//  969     {
//  970       temp = BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0];  
??BlackGetLeft_5:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable12_3
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_3
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        ADDS     R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_3
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R7,R0,R1
//  971     }
//  972 
//  973     index = 0;
??BlackGetLeft_4:
        MOVS     R8,#+0
//  974     
//  975     GapCount = 0;  //连续多少行没有采集到黑线
        MOVS     R9,#+0
//  976     //从最近的认证行到取最远的行
//  977     for(row -= 2; ; row -= 2)
        SUBS     R10,R10,#+2
        B.N      ??BlackGetLeft_6
??BlackGetLeft_7:
        SUBS     R10,R10,#+2
//  978     {
//  979       //如果连续两行的黑点检测成功，则更新预测点的位置
//  980       temp1 = BlackGetLeftStep2Win(row, BlackLeftWinVal, temp);
??BlackGetLeft_6:
        MOVS     R2,R7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        MOV      R0,R10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetLeftStep2Win
        MOV      R11,R0
//  981       temp2 = BlackGetLeftStep2Win(row-1, BlackLeftWinVal, temp);
        MOVS     R2,R7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        SUBS     R0,R10,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetLeftStep2Win
//  982       temp3 = (
//  983               (!temp1)
//  984             &&(!temp2)
//  985             //&&(!Step4Flag)
//  986               );
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+0
        BNE.N    ??BlackGetLeft_8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??BlackGetLeft_8
        MOVS     R1,#+1
        B.N      ??BlackGetLeft_9
??BlackGetLeft_8:
        MOVS     R1,#+0
//  987       if(temp1 && temp2) 
??BlackGetLeft_9:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+0
        BEQ.N    ??BlackGetLeft_10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BlackGetLeft_10
//  988       {   //对预测值的大小限定
//  989           if((BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0]) < 0)
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable12_3
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_3
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_3
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+0
        BPL.N    ??BlackGetLeft_11
//  990           {
//  991             temp = 0;
        MOVS     R7,#+0
        B.N      ??BlackGetLeft_12
//  992           }
//  993           else if((BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0]) >= CameraRealWidth)
??BlackGetLeft_11:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable12_3
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_3
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_3
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+250
        BLT.N    ??BlackGetLeft_13
//  994           {
//  995             temp = CameraRealWidth - 1;
        MOVS     R7,#+249
        B.N      ??BlackGetLeft_12
//  996           }
//  997           else
//  998           {
//  999             temp = BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0];  
??BlackGetLeft_13:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable12_3
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_3
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        ADDS     R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_3
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R7,R0,R1
        B.N      ??BlackGetLeft_12
// 1000           }
// 1001       }
// 1002       else if(temp3)
??BlackGetLeft_10:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??BlackGetLeft_12
// 1003       {       
// 1004         //Row1RealLastLine记录第1段黑线的最后一行。
// 1005         if(index == 0)
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??BlackGetLeft_14
// 1006         {
// 1007           //进来一次后，就再也不会进来了。
// 1008           index++;
        ADDS     R8,R8,#+1
// 1009           for(i = row; i < (row + 5); i++)
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
// 1010           {
// 1011             if(BlackLeftLoc[i][0] != MaxValUint8)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable12_3
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??BlackGetLeft_16
// 1012             {
// 1013               Row1RealLastLine = i;
        MOVS     R4,R0
// 1014               break;
// 1015             }
// 1016           }
// 1017           if(Row1RealLastLine >= CameraHight - 1)
??BlackGetLeft_17:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+49
        BLT.N    ??BlackGetLeft_14
// 1018           {
// 1019             Row1RealLastLine = CameraHight - 1;
        MOVS     R4,#+49
// 1020           }
// 1021           else
// 1022           {
// 1023           }
// 1024         }
// 1025         
// 1026         GapCount += 2;
??BlackGetLeft_14:
        ADDS     R9,R9,#+2
// 1027 
// 1028         if(GapCount > BlackCrossGapLine)
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+11
        BLT.N    ??BlackGetLeft_18
// 1029         {
// 1030           //再检测时的行太远了，就没必要检测了。
// 1031           if(row < BlackLeftCrossTooLowLine)
        LDR.W    R0,??DataTable19_1
        LDRB     R0,[R0, #+0]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,R0
        BCC.N    ??BlackGetLeft_19
// 1032           {
// 1033             break;
// 1034           }
// 1035           else
// 1036           {
// 1037           }
// 1038           
// 1039           if(!BlackLeftAgainForCross(row - 2, 1, Row1RealLastLine))
??BlackGetLeft_20:
        MOVS     R2,R4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+1
        SUBS     R0,R10,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackLeftAgainForCross
        CMP      R0,#+0
        BNE.N    ??BlackGetLeft_21
// 1040           {
// 1041             BlackLeftCrossDone = 1;  //十字检测失败           
        MOVS     R0,#+1
        LDR.W    R1,??DataTable19
        STRB     R0,[R1, #+0]
        B.N      ??BlackGetLeft_22
// 1042           }
// 1043           else
// 1044           {
// 1045             BlackLeftCrossDone = 2;  //十字检测成功
??BlackGetLeft_21:
        MOVS     R0,#+2
        LDR.W    R1,??DataTable19
        STRB     R0,[R1, #+0]
// 1046           }
// 1047           break;  //十字再检测里会开窗检测到指定的最后一行，所以不用再循环了，直接跳出
??BlackGetLeft_22:
        B.N      ??BlackGetLeft_19
// 1048           
// 1049         }
// 1050         else
// 1051         {
// 1052           BlackLeftCrossDone = 0;   //十字检测未进入
??BlackGetLeft_18:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable19
        STRB     R0,[R1, #+0]
// 1053         }
// 1054       }
// 1055       else
// 1056       {        
// 1057       }
// 1058       
// 1059       
// 1060       if((row == 0) || (row == 1)) break;
??BlackGetLeft_12:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BEQ.N    ??BlackGetLeft_23
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+1
        BNE.W    ??BlackGetLeft_7
// 1061       
// 1062     }
// 1063     
// 1064     
// 1065     //这里有浮点运算，要严格控制调用。
// 1066     if(Step4Flag)
??BlackGetLeft_23:
??BlackGetLeft_19:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??BlackGetLeft_24
// 1067     {
// 1068       if(!BlackLeftStep4BackLine(Step4StartLine))
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackLeftStep4BackLine
        CMP      R0,#+0
        BNE.N    ??BlackGetLeft_24
// 1069       {
// 1070         return 0;  
        MOVS     R0,#+0
        B.N      ??BlackGetLeft_1
// 1071       }
// 1072     }
// 1073     
// 1074     
// 1075     return 1;
??BlackGetLeft_24:
        MOVS     R0,#+1
??BlackGetLeft_1:
        POP      {R1,R4-R11,PC}   ;; return
// 1076 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     BlackLeftRealWB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     BlackLeftRealW
// 1077 
// 1078 
// 1079 
// 1080 //====================================右右右右右右右右右右右右右右右右右============================
// 1081 
// 1082 
// 1083 
// 1084 //======================================================================
// 1085 //函数名：BlackRightRealClear
// 1086 //功  能：右黑线提取中，对3个关键值的实际值清零
// 1087 //参  数：无
// 1088 //返  回：无
// 1089 //影  响：BlackRightRealWB[], BlackRightRealW[], BlackRightRealB[]
// 1090 //说  明：
// 1091 //      
// 1092 //             
// 1093 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1094 void BlackRightRealClear(void)
// 1095 {
// 1096     BlackRightRealWB[0] = 0;
BlackRightRealClear:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable19_2
        STRB     R0,[R1, #+0]
// 1097     BlackRightRealWB[1] = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable19_2
        STRB     R0,[R1, #+1]
// 1098     BlackRightRealW[0] = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable19_3
        STRB     R0,[R1, #+0]
// 1099     BlackRightRealW[1] = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable19_3
        STRB     R0,[R1, #+1]
// 1100     BlackRightRealB[0] = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable20
        STRB     R0,[R1, #+0]
// 1101     BlackRightRealB[1] = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable20
        STRB     R0,[R1, #+1]
// 1102 }
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
        DC32     BlackLeftRealB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     ImgNew

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     BlackLeftLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     LimitLeftWB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     LimitLeftW

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     LimitLeftB
// 1103 
// 1104 
// 1105 
// 1106 //======================================================================
// 1107 //函数名：BlackGetRightStep1Edge
// 1108 //功  能：处理该右左线的可疑黑点
// 1109 //参  数：待检测的行号row, 第几次使用use, 是否为十字再检测调用标志位CrossFlag
// 1110 //返  回：1成功 0失败
// 1111 //影  响：
// 1112 //说  明：
// 1113 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1114 uint8 BlackGetRightStep1Edge(uint8 row, uint8 use, uint8 CrossFlag)
// 1115 {
BlackGetRightStep1Edge:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
// 1116   uint8 index, col, temp1;
// 1117   uint8 abs1;
// 1118   uint8 RightBeginCol; //右线跳变检测起点
// 1119   
// 1120   //左黑线检测成功时
// 1121   if(BlackLeftDone == 1)
        LDR.W    R0,??DataTable20_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??BlackGetRightStep1Edge_0
// 1122   {
// 1123       //右线跳变检测的起点至少要比该行左线的跳变点要靠右。
// 1124     if(BlackLeftLoc[row][0] == MaxValUint8)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable14
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BNE.N    ??BlackGetRightStep1Edge_1
// 1125     {
// 1126       RightBeginCol = CameraRealWidth/2;
        MOVS     R8,#+125
        B.N      ??BlackGetRightStep1Edge_2
// 1127     }
// 1128     else
// 1129     {
// 1130       //至少要在左跳变向右4+BlackRightEdgeNum个点
// 1131       RightBeginCol = MaxRe(CameraRealWidth/2, BlackLeftLoc[row][0] + 4 + BlackRightEdgeNum);
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
// 1132       //同时，也不能超过数组界限219，其实是不能超过CameraRealWidth - 5 - BlackRightEdgeNum，下面for循环里。
// 1133       RightBeginCol = MinRe(RightBeginCol, CameraRealWidth - 5 - BlackRightEdgeNum);
        MOVS     R1,#+243
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       MinRe
        MOV      R8,R0
        B.N      ??BlackGetRightStep1Edge_2
// 1134     }
// 1135   }
// 1136   //左黑线检测失败时，右黑线检测的起点要比中心线靠左BlackRightEdgeStartColOffset这么多列。
// 1137   else
// 1138   {
// 1139     RightBeginCol = CameraRealWidth/2 - BlackRightEdgeStartColOffset;  
??BlackGetRightStep1Edge_0:
        MOVS     R8,#+85
// 1140   }
// 1141   
// 1142   index = 0;         //可疑点的序号
??BlackGetRightStep1Edge_2:
        MOVS     R7,#+0
// 1143   //从中间到最右边扫描，隔1个点求差
// 1144   for(col = RightBeginCol; col <= CameraRealWidth - 5 - BlackRightEdgeNum; col++) 
        B.N      ??BlackGetRightStep1Edge_3
// 1145   {
// 1146       abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col+1+BlackRightEdgeNum]);
// 1147       if( 
// 1148           (abs1 > LimitRightWB) //两者的差够大
// 1149         &&(ImgNew[row][col] > LimitRightW)                     //白点够白
// 1150         &&(ImgNew[row][col+1+BlackRightEdgeNum] < LimitRightB) //黑点够黑
// 1151          )
// 1152       {         
// 1153           //近处的行，向右3个点仍为黑点
// 1154           if(row > BlackMiddleLine)
// 1155           {
// 1156             temp1 = (
// 1157                       (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB)
// 1158                     &&(ImgNew[row][col+3+BlackRightEdgeNum] < LimitRightB)
// 1159                     &&(ImgNew[row][col+4+BlackRightEdgeNum] < LimitRightB)
// 1160                     );
// 1161           }
// 1162           else
// 1163           {
// 1164             if(row > BlackFarLine)
// 1165             {
// 1166               //中间的行，向右2个点仍为黑点。
// 1167               temp1 = (
// 1168                         (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB)
// 1169                       &&(ImgNew[row][col+3+BlackRightEdgeNum] < LimitRightB)
// 1170                       );
// 1171             }
// 1172             //远处的行，向右1个点仍为黑点。
// 1173             else
// 1174             {
// 1175               temp1 = (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB);
// 1176             }
// 1177           }
// 1178           
// 1179           if(temp1)
// 1180           {
// 1181                             
// 1182               //超过3个可疑黑点，则报错
// 1183               if(index == 3)       
// 1184               {
// 1185                 if(CrossFlag)
// 1186                 {
// 1187                   //对3个关键值的实际值清零
// 1188                   BlackRightRealClear();
// 1189                 }
// 1190                 //该行定位黑线失败，赋无效值
// 1191                 BlackRightLoc[row][0] = MaxValUint8;
// 1192                 return 0;
// 1193               }
// 1194               if(CrossFlag)
// 1195               {
// 1196                 if(use == 1)
// 1197                 {
// 1198                   BlackRightRealWB[0] = ImgNew[row][col] - ImgNew[row][col+1+BlackRightEdgeNum]; 
// 1199                   BlackRightRealW[0] = ImgNew[row][col];
// 1200                   BlackRightRealB[0] = ImgNew[row][col+1+BlackRightEdgeNum];
// 1201                 }
// 1202                 else if(use == 2)
??BlackGetRightStep1Edge_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+2
        BNE.N    ??BlackGetRightStep1Edge_5
// 1203                 {
// 1204                   BlackRightRealWB[1] = ImgNew[row][col] - ImgNew[row][col+1+BlackRightEdgeNum]; 
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable20_2
        MLA      R1,R1,R4,R2
        ADDS     R1,R8,R1
        LDRB     R1,[R1, #+3]
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable19_2
        STRB     R0,[R1, #+1]
// 1205                   BlackRightRealW[1] = ImgNew[row][col];
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        LDR.W    R1,??DataTable19_3
        STRB     R0,[R1, #+1]
// 1206                   BlackRightRealB[1] = ImgNew[row][col+1+BlackRightEdgeNum];
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable20
        STRB     R0,[R1, #+1]
// 1207                 }
// 1208                 else
// 1209                 {
// 1210                 }
// 1211               }
// 1212               //跳变检测成功，取黑点
// 1213               BlackRightLoc[row][index] = col + 1 + BlackRightEdgeNum;          
??BlackGetRightStep1Edge_5:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21
        MLA      R0,R0,R4,R1
        ADDS     R1,R8,#+3
        STRB     R1,[R7, R0]
// 1214               index++;
        ADDS     R7,R7,#+1
??BlackGetRightStep1Edge_6:
        ADDS     R8,R8,#+1
??BlackGetRightStep1Edge_3:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+244
        BGE.W    ??BlackGetRightStep1Edge_7
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R1,[R0, #+3]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R2,??DataTable20_2
        MLA      R0,R0,R4,R2
        LDRB     R0,[R8, R0]
        BL       AbsRe
        LDR.W    R1,??DataTable20_3
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCS.N    ??BlackGetRightStep1Edge_6
        LDR.W    R0,??DataTable20_4
        LDRB     R0,[R0, #+0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable20_2
        MLA      R1,R1,R4,R2
        LDRB     R1,[R8, R1]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep1Edge_6
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable21_1
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep1Edge_6
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+31
        BLT.N    ??BlackGetRightStep1Edge_8
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+4]
        LDR.W    R1,??DataTable21_1
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep1Edge_9
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+5]
        LDR.W    R1,??DataTable21_1
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep1Edge_9
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+6]
        LDR.W    R1,??DataTable21_1
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
        BLT.N    ??BlackGetRightStep1Edge_12
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+4]
        LDR.W    R1,??DataTable21_1
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep1Edge_13
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+5]
        LDR.W    R1,??DataTable21_1
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
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+4]
        LDR.W    R1,??DataTable21_1
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
        MOVS     R0,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
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
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable20_2
        MLA      R1,R1,R4,R2
        ADDS     R1,R8,R1
        LDRB     R1,[R1, #+3]
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable19_2
        STRB     R0,[R1, #+0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        LDRB     R0,[R8, R0]
        LDR.W    R1,??DataTable19_3
        STRB     R0,[R1, #+0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable20
        STRB     R0,[R1, #+0]
        B.N      ??BlackGetRightStep1Edge_5
// 1215             
// 1216           }   
// 1217       }  
// 1218   }
// 1219   
// 1220   //1个可疑黑点也没有，则报错。
// 1221   if(index == 0)
??BlackGetRightStep1Edge_7:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??BlackGetRightStep1Edge_20
// 1222   {
// 1223     if(CrossFlag)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??BlackGetRightStep1Edge_21
// 1224     {
// 1225       //对3个关键值的实际值清零
// 1226       BlackRightRealClear();
        BL       BlackRightRealClear
// 1227     }
// 1228     //该行定位黑线失败，赋无效值
// 1229     BlackRightLoc[row][0] = MaxValUint8;
??BlackGetRightStep1Edge_21:
        MOVS     R0,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
// 1230     return 0;
        MOVS     R0,#+0
        B.N      ??BlackGetRightStep1Edge_19
// 1231   }
// 1232   
// 1233   //没有报错，就会走到这里，黑点查找成功，会有1，2，3个黑点
// 1234   return 1;
??BlackGetRightStep1Edge_20:
        MOVS     R0,#+1
??BlackGetRightStep1Edge_19:
        POP      {R4-R8,PC}       ;; return
// 1235 }
// 1236 
// 1237 
// 1238 
// 1239 //======================================================================
// 1240 //函数名：BlackGetRightStep2Win
// 1241 //功  能：窗口内跳变检测函数
// 1242 //参  数：待处理行号row, 窗口大小win, 预测的跳变点的位置predict
// 1243 //返  回：1成功  0失败
// 1244 //影  响：
// 1245 //说  明：    
// 1246 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1247 uint8 BlackGetRightStep2Win(uint8 row, uint8 win, uint8 predict)
// 1248 {
BlackGetRightStep2Win:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
// 1249   uint8 col, temp, temp1;
// 1250   uint8 abs1;
// 1251 
// 1252   //在规划好的窗口内，从左往右查找跳变沿
// 1253   //防止溢出
// 1254   //对右边界的限制 
// 1255   if((predict + win) >= (CameraRealWidth - 5 - BlackRightEdgeNum)) 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTAB    R0,R1,R2
        CMP      R0,#+243
        BLT.N    ??BlackGetRightStep2Win_0
// 1256   {
// 1257     temp = CameraRealWidth - 5 - BlackRightEdgeNum;
        MOVS     R5,#+243
        B.N      ??BlackGetRightStep2Win_1
// 1258   }  
// 1259   else
// 1260   {
// 1261     temp = predict + win;
??BlackGetRightStep2Win_0:
        ADDS     R5,R1,R2
// 1262   }
// 1263   //对左边界的限制
// 1264   if(predict <= win)
??BlackGetRightStep2Win_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R1,R2
        BCC.N    ??BlackGetRightStep2Win_2
// 1265   {
// 1266     col = 0;
        MOVS     R6,#+0
        B.N      ??BlackGetRightStep2Win_3
// 1267   }
// 1268   else
// 1269   {
// 1270     col = predict - win;  
??BlackGetRightStep2Win_2:
        SUBS     R6,R2,R1
        B.N      ??BlackGetRightStep2Win_3
// 1271   }
// 1272    
// 1273   for(; col < temp; col++) 
??BlackGetRightStep2Win_4:
        ADDS     R6,R6,#+1
??BlackGetRightStep2Win_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R6,R5
        BCS.W    ??BlackGetRightStep2Win_5
// 1274   {
// 1275     abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col+1+BlackRightEdgeNum]);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R1,[R0, #+3]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R2,??DataTable20_2
        MLA      R0,R0,R4,R2
        LDRB     R0,[R6, R0]
        BL       AbsRe
// 1276     if( 
// 1277           (abs1 > LimitRightWB) //两者的差够大
// 1278         &&(ImgNew[row][col] > LimitRightW)                     //白点够白
// 1279         &&(ImgNew[row][col+1+BlackRightEdgeNum] < LimitRightB)                   //黑点够黑
// 1280        )
        LDR.W    R1,??DataTable20_3
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCS.N    ??BlackGetRightStep2Win_4
        LDR.W    R0,??DataTable20_4
        LDRB     R0,[R0, #+0]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+250
        LDR.W    R2,??DataTable20_2
        MLA      R1,R1,R4,R2
        LDRB     R1,[R6, R1]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_4
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable21_1
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_4
// 1281     {
// 1282         
// 1283           //近处的行，向右3个点仍为黑点
// 1284           if(row > BlackMiddleLine)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+31
        BLT.N    ??BlackGetRightStep2Win_6
// 1285           {
// 1286             temp1 = (
// 1287                       (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB)
// 1288                     &&(ImgNew[row][col+3+BlackRightEdgeNum] < LimitRightB)
// 1289                     &&(ImgNew[row][col+4+BlackRightEdgeNum] < LimitRightB)
// 1290                     );
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #+4]
        LDR.W    R1,??DataTable21_1
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_7
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #+5]
        LDR.W    R1,??DataTable21_1
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_7
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #+6]
        LDR.W    R1,??DataTable21_1
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_7
        MOVS     R0,#+1
        B.N      ??BlackGetRightStep2Win_8
??BlackGetRightStep2Win_7:
        MOVS     R0,#+0
??BlackGetRightStep2Win_8:
        B.N      ??BlackGetRightStep2Win_9
// 1291           }
// 1292           else
// 1293           {
// 1294             //中间的行 ，向右2个点为仍为黑点
// 1295             if(row > BlackFarLine)
??BlackGetRightStep2Win_6:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+21
        BLT.N    ??BlackGetRightStep2Win_10
// 1296             {
// 1297               temp1 = (
// 1298                         (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB)
// 1299                       &&(ImgNew[row][col+3+BlackRightEdgeNum] < LimitRightB)
// 1300                       );
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #+4]
        LDR.W    R1,??DataTable21_1
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_11
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #+5]
        LDR.W    R1,??DataTable21_1
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_11
        MOVS     R0,#+1
        B.N      ??BlackGetRightStep2Win_12
??BlackGetRightStep2Win_11:
        MOVS     R0,#+0
??BlackGetRightStep2Win_12:
        B.N      ??BlackGetRightStep2Win_9
// 1301             }
// 1302             //远处的行，向右1个点仍为黑点
// 1303             else
// 1304             {
// 1305               temp1 = (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB);
??BlackGetRightStep2Win_10:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+250
        LDR.W    R1,??DataTable20_2
        MLA      R0,R0,R4,R1
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #+4]
        LDR.W    R1,??DataTable21_1
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??BlackGetRightStep2Win_13
        MOVS     R0,#+1
        B.N      ??BlackGetRightStep2Win_14
??BlackGetRightStep2Win_13:
        MOVS     R0,#+0
// 1306             }
// 1307           }
// 1308           
// 1309           if(temp1)
??BlackGetRightStep2Win_14:
??BlackGetRightStep2Win_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.W    ??BlackGetRightStep2Win_4
// 1310           {
// 1311           //直接记录该点为黑线，返回即可
// 1312           BlackRightLoc[row][0] = col + 1 + BlackRightEdgeNum;
        ADDS     R0,R6,#+3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
// 1313           return 1;
        MOVS     R0,#+1
        B.N      ??BlackGetRightStep2Win_15
// 1314           //break;               
// 1315           }
// 1316     }   
// 1317   }// end of for循环
// 1318   
// 1319   //如果一直到窗口最左边还没有找到跳变沿，
// 1320   
// 1321   BlackRightLoc[row][0] = MaxValUint8;   //该行的黑线位置记为无效值
??BlackGetRightStep2Win_5:
        MOVS     R0,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
// 1322   return 0;
        MOVS     R0,#+0
??BlackGetRightStep2Win_15:
        POP      {R4-R6,PC}       ;; return
// 1323   
// 1324 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     BlackLeftLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     `?<Constant "\\nError In BlackLeftCr...">`
// 1325 
// 1326 
// 1327 
// 1328 //======================================================================
// 1329 //函数名：BlackGetRightStep1Scan
// 1330 //功  能：行扫描函数
// 1331 //参  数：扫描起始行FirstLine, 扫描结束行LastLine, 十字再检测标志CrossFlag
// 1332 //返  回：0~CameraHight - 1行数 255采集失败
// 1333 //影  响：
// 1334 //说  明：
// 1335 //             
// 1336 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1337 uint8 BlackGetRightStep1Scan(uint8 FirstLine, uint8 LastLine, uint8 CrossFlag)
// 1338 {
BlackGetRightStep1Scan:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,R2
// 1339     uint8 row, temp1, temp2;
// 1340     uint8 abs1;
// 1341     uint8 tempWB, tempW, tempB;
// 1342     
// 1343   //最近的BlackStep1Size行用差值法找黑线
// 1344     for(row = FirstLine; row > LastLine; row -= 2)
        B.N      ??BlackGetRightStep1Scan_0
??BlackGetRightStep1Scan_1:
        SUBS     R5,R5,#+2
??BlackGetRightStep1Scan_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R4,R5
        BCS.N    ??BlackGetRightStep1Scan_2
// 1345     {
// 1346       //判断是否连续两行检测到跳变，可疑黑点有3个点，暂取其中一个
// 1347       temp1 = BlackGetRightStep1Edge(row, 1, CrossFlag);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetRightStep1Edge
        MOVS     R7,R0
// 1348       temp2 = BlackGetRightStep1Edge(row-1, 2, CrossFlag);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+2
        SUBS     R0,R5,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetRightStep1Edge
// 1349       if(temp1 && temp2)//这里可以这么写，不用嵌套if，因为&&的特点
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??BlackGetRightStep1Scan_1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BlackGetRightStep1Scan_1
// 1350       {
// 1351         abs1 = AbsRe(BlackRightLoc[row-1][0], BlackRightLoc[row][0]);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21
        MLA      R0,R0,R5,R1
        LDRB     R1,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R2,??DataTable21
        MLA      R0,R0,R5,R2
        LDRB     R0,[R0, #-3]
        BL       AbsRe
// 1352         //进一步判断连续两行的黑点的间隔是否够小，且暂取第1个可疑黑点。
// 1353         if(abs1 < BlackRightStep1ScanMinus)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BGE.N    ??BlackGetRightStep1Scan_1
// 1354         {
// 1355           if(CrossFlag)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??BlackGetRightStep1Scan_3
// 1356             {           
// 1357               //差值的处理，留有裕度，且有上下界。
// 1358               tempWB = (BlackRightRealWB[0] + BlackRightRealWB[1]) / 2 - LimitRightWBMargin; 
        LDR.W    R0,??DataTable19_2
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable19_2
        LDRB     R1,[R1, #+1]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        SUBS     R0,R0,#+20
// 1359               if(tempWB < LimitRightWBMin) tempWB = LimitRightWBMin;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+75
        BGE.N    ??BlackGetRightStep1Scan_4
        MOVS     R0,#+75
        B.N      ??BlackGetRightStep1Scan_5
// 1360               else if(tempWB > LimitRightWBMax) tempWB = LimitRightWBMax;
??BlackGetRightStep1Scan_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+106
        BLT.N    ??BlackGetRightStep1Scan_5
        MOVS     R0,#+105
// 1361               else ;
// 1362               LimitRightWB = tempWB;
??BlackGetRightStep1Scan_5:
        LDR.W    R1,??DataTable20_3
        STRB     R0,[R1, #+0]
// 1363               
// 1364               //白点的处理，留有裕度，且有上下界。
// 1365               tempW = (BlackRightRealW[0] + BlackRightRealW[1]) / 2 - LimitRightWMargin;
        LDR.W    R0,??DataTable19_3
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable19_3
        LDRB     R1,[R1, #+1]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        SUBS     R0,R0,#+30
// 1366               if(tempW < LimitRightWMin) tempW = LimitRightWMin;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+150
        BGE.N    ??BlackGetRightStep1Scan_6
        MOVS     R0,#+150
        B.N      ??BlackGetRightStep1Scan_7
// 1367               else if(tempW > LimitRightWMax) tempW = LimitRightWMax;
??BlackGetRightStep1Scan_6:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+201
        BLT.N    ??BlackGetRightStep1Scan_7
        MOVS     R0,#+200
// 1368               else ;
// 1369               LimitRightW = tempW;
??BlackGetRightStep1Scan_7:
        LDR.W    R1,??DataTable20_4
        STRB     R0,[R1, #+0]
// 1370               
// 1371               //黑点的处理，留有裕度，且有上下界。
// 1372               tempB = (BlackRightRealB[0] + BlackRightRealB[1]) / 2 + LimitRightBMargin;
        LDR.W    R0,??DataTable20
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable20
        LDRB     R1,[R1, #+1]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+30
// 1373               if(tempB < LimitRightBMin) tempB = LimitRightBMin;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+85
        BGE.N    ??BlackGetRightStep1Scan_8
        MOVS     R0,#+85
        B.N      ??BlackGetRightStep1Scan_9
// 1374               else if(tempB > LimitRightBMax) tempB = LimitRightBMax;
??BlackGetRightStep1Scan_8:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+101
        BLT.N    ??BlackGetRightStep1Scan_9
        MOVS     R0,#+100
// 1375               else ;
// 1376               LimitRightB = tempB;           
??BlackGetRightStep1Scan_9:
        LDR.W    R1,??DataTable21_1
        STRB     R0,[R1, #+0]
// 1377             }
// 1378           break;
// 1379         }
// 1380       }      
// 1381     }   
// 1382     
// 1383     //检测了BlackStep1Size行也没有检测到连续的黑线，说明黑线检测失败
// 1384     if(row <= LastLine)
??BlackGetRightStep1Scan_3:
??BlackGetRightStep1Scan_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R4,R5
        BCC.N    ??BlackGetRightStep1Scan_10
// 1385       return MaxValUint8;
        MOVS     R0,#+255
        B.N      ??BlackGetRightStep1Scan_11
// 1386     else
// 1387       return row;
??BlackGetRightStep1Scan_10:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??BlackGetRightStep1Scan_11:
        POP      {R1,R4-R7,PC}    ;; return
// 1388   
// 1389 }
// 1390 
// 1391 
// 1392 //======================================================================
// 1393 //函数名：BlackRightCrossStep3
// 1394 //功  能：脑补线函数
// 1395 //参  数：第1段有效黑线的最后一行FirstLine， 第2段有效黑线的第一行LastLine
// 1396 //返  回：1成功 0失败
// 1397 //影  响：
// 1398 //说  明：
// 1399 //             
// 1400 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1401 uint8 BlackRightCrossStep3(uint8 FirstLine, uint8 LastLine)
// 1402 {
BlackRightCrossStep3:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
// 1403   float delta_x, delta_y, delta, index;
// 1404   uint8 row, temp1, temp2;
// 1405   //uint8 temp3, temp4, flag1, flag2;
// 1406   
// 1407   //超始行比结束行还高，报错！
// 1408   if(LastLine >= FirstLine)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R5,R4
        BCC.N    ??BlackRightCrossStep3_0
// 1409   {
// 1410     uart_sendN(UART0, (uint8 *)"\nError In BlackRightCrossStep3!", 31);
        MOVS     R2,#+31
        LDR.W    R1,??DataTable21_2
        LDR.W    R0,??DataTable21_3  ;; 0x4006a000
        BL       uart_sendN
// 1411     return 0;  
        MOVS     R0,#+0
        B.N      ??BlackRightCrossStep3_1
// 1412   }
// 1413   
// 1414   temp1 = BlackRightLoc[FirstLine][0];
??BlackRightCrossStep3_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21
        MLA      R0,R0,R4,R1
        LDRB     R7,[R0, #+0]
// 1415   temp2 = BlackRightLoc[LastLine][0];
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21
        MLA      R0,R0,R5,R1
        LDRB     R8,[R0, #+0]
// 1416   
// 1417   /*
// 1418   flag1 = 1;
// 1419   flag2 = 1;
// 1420   //确认这两个点是直角处的点，也就是往右6个点仍为黑点
// 1421   if(temp1 <= (CameraRealWidth - 9))
// 1422   {
// 1423     temp3 = (
// 1424             (ImgNew[FirstLine+1][temp1+6] < LimitRightB)
// 1425           &&(ImgNew[FirstLine+1][temp1+7] < LimitRightB)
// 1426           &&(ImgNew[FirstLine+1][temp1+8] < LimitRightB)
// 1427           );
// 1428     if(temp3)
// 1429     {
// 1430       flag1 = 0;  
// 1431     }
// 1432   }
// 1433   
// 1434   if(temp2 <= (CameraRealWidth - 9))
// 1435   {
// 1436     temp4 = (
// 1437             (ImgNew[LastLine-1][temp2+6] < LimitRightB)
// 1438           &&(ImgNew[LastLine-1][temp2+7] < LimitRightB)
// 1439           &&(ImgNew[LastLine-1][temp2+8] < LimitRightB)
// 1440           );
// 1441     if(temp4)
// 1442     {
// 1443       flag2 = 0;  
// 1444     }
// 1445   }
// 1446   
// 1447   if((flag1 == 0) || (flag2 == 0))
// 1448   {
// 1449     return 0;  
// 1450   }
// 1451   
// 1452   */
// 1453   
// 1454   delta_y = FirstLine - LastLine;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        SUBS     R0,R4,R5
        BL       __aeabi_i2f
        MOVS     R6,R0
// 1455   
// 1456   
// 1457   //斜率向右
// 1458   if(temp1 < temp2)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R7,R8
        BCS.N    ??BlackRightCrossStep3_2
// 1459   {
// 1460     delta_x = temp2 - temp1;
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        SUBS     R0,R8,R7
        BL       __aeabi_i2f
// 1461     delta = delta_x / delta_y; //这是1个浮点数
        MOVS     R1,R6
        BL       __aeabi_fdiv
        MOVS     R7,R0
// 1462     
// 1463     index = 1.0;
        MOVS     R8,#+1065353216
// 1464     for(row = FirstLine - 1; row >= LastLine + 1; row-- )
        SUBS     R6,R4,#+1
??BlackRightCrossStep3_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,#+1
        CMP      R6,R0
        BLT.N    ??BlackRightCrossStep3_4
// 1465     {
// 1466       //每次右移一点点
// 1467       BlackRightLoc[row][0] = (uint8)((float)BlackRightLoc[FirstLine][0] + delta * index);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOV      R9,R0
        MOVS     R0,R7
        MOV      R1,R8
        BL       __aeabi_fmul
        MOV      R1,R9
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21
        MLA      R1,R1,R6,R2
        STRB     R0,[R1, #+0]
// 1468       index += 1.0;
        MOV      R0,R8
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable21_4  ;; 0x3ff00000
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        MOV      R8,R0
// 1469     }
        SUBS     R6,R6,#+1
        B.N      ??BlackRightCrossStep3_3
// 1470   }
// 1471   //斜率向左
// 1472   else if(temp1 > temp2)
??BlackRightCrossStep3_2:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R8,R7
        BCS.N    ??BlackRightCrossStep3_5
// 1473   {
// 1474     delta_x = temp1 - temp2;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        SUBS     R0,R7,R8
        BL       __aeabi_i2f
// 1475     delta = delta_x / delta_y;
        MOVS     R1,R6
        BL       __aeabi_fdiv
        MOVS     R7,R0
// 1476     
// 1477     index = 1.0;
        MOVS     R8,#+1065353216
// 1478     for(row = FirstLine - 1; row >= LastLine + 1; row-- )
        SUBS     R6,R4,#+1
??BlackRightCrossStep3_6:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,#+1
        CMP      R6,R0
        BLT.N    ??BlackRightCrossStep3_4
// 1479     {
// 1480       //每次右移一点点
// 1481       BlackRightLoc[row][0] = (uint8)((float)BlackRightLoc[FirstLine][0] - delta * index);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOV      R9,R0
        MOVS     R0,R7
        MOV      R1,R8
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R9
        BL       __aeabi_fsub
        BL       __aeabi_f2iz
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21
        MLA      R1,R1,R6,R2
        STRB     R0,[R1, #+0]
// 1482       index += 1.0;
        MOV      R0,R8
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable21_4  ;; 0x3ff00000
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        MOV      R8,R0
// 1483     }
        SUBS     R6,R6,#+1
        B.N      ??BlackRightCrossStep3_6
// 1484   }
// 1485   //斜率直走，这个不太可能出现
// 1486   else
// 1487   {
// 1488     for(row = FirstLine - 1; row >= LastLine + 1; row-- )
??BlackRightCrossStep3_5:
        SUBS     R6,R4,#+1
        B.N      ??BlackRightCrossStep3_7
// 1489     {
// 1490       //赋相同的值
// 1491       BlackRightLoc[row][0] = temp1;
??BlackRightCrossStep3_8:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21
        MLA      R0,R0,R6,R1
        STRB     R7,[R0, #+0]
// 1492     }
        SUBS     R6,R6,#+1
??BlackRightCrossStep3_7:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,#+1
        CMP      R6,R0
        BGE.N    ??BlackRightCrossStep3_8
// 1493   }
// 1494   
// 1495   return 1;
??BlackRightCrossStep3_4:
        MOVS     R0,#+1
??BlackRightCrossStep3_1:
        POP      {R1,R4-R9,PC}    ;; return
// 1496     
// 1497 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     0x43790001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_1:
        DC32     0xc1200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_2:
        DC32     0x41200000
// 1498 
// 1499 //======================================================================
// 1500 //函数名：BlackRightCrossConfirm
// 1501 //功  能：线头有效性的确认。
// 1502 //参  数：第1段黑线的真实结束行Row1RealLastLine，第2段黑线的真实起始行Row2RealFirstLine
// 1503 //返  回：1成功 0失败
// 1504 //影  响：无
// 1505 //说  明：
// 1506 //      
// 1507 //             
// 1508 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1509 uint8 BlackRightCrossConfirm(uint8 Row1RealLastLine, uint8 Row2RealFirstLine)
// 1510 {
BlackRightCrossConfirm:
        PUSH     {R2-R6,LR}
        MOVS     R4,R1
// 1511   uint8 row, index;
// 1512   uint8 x[BlackCrossConfirmNum];
// 1513   uint8 y[BlackCrossConfirmNum];
// 1514   
// 1515   float a0, a1, temp;
// 1516   
// 1517   //第一段黑线太短，无法检测正确性。直接返回1.
// 1518   if(Row1RealLastLine < 5) return 1;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BGE.N    ??BlackRightCrossConfirm_0
        MOVS     R0,#+1
        B.N      ??BlackRightCrossConfirm_1
// 1519   
// 1520   index = 0;
??BlackRightCrossConfirm_0:
        MOVS     R1,#+0
// 1521   for(row = Row1RealLastLine; ; row++)
        B.N      ??BlackRightCrossConfirm_2
??BlackRightCrossConfirm_3:
        ADDS     R0,R0,#+1
// 1522   {
// 1523     //有效行的记录
// 1524     if(BlackRightLoc[row][0] != MaxValUint8)
??BlackRightCrossConfirm_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable21
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        CMP      R2,#+255
        BEQ.N    ??BlackRightCrossConfirm_4
// 1525     {
// 1526       y[index] = BlackRightLoc[row][0];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable21
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R3,SP,#+0
        STRB     R2,[R1, R3]
// 1527       x[index] = row;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R2,SP,#+4
        STRB     R0,[R1, R2]
// 1528       index++;
        ADDS     R1,R1,#+1
// 1529     }
// 1530     //点数够多，则跳出。
// 1531     if(index == BlackCrossConfirmNum) break;
??BlackRightCrossConfirm_4:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+3
        BNE.N    ??BlackRightCrossConfirm_5
// 1532     //直到最低行仍没有凑够足够的点数，说明第一段有效黑线太短，无法检测正确性，直接返回1.
// 1533     if(row == CameraHight - 1) return 1;
// 1534   }
// 1535   
// 1536   //最小二乘法
// 1537   //y = a0 + a1 * x
// 1538   a1 = LeastSquarea1(x, y, BlackCrossConfirmNum);
        MOVS     R2,#+3
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea1
        MOVS     R6,R0
// 1539   a0 = LeastSquarea0(x, y, a1, BlackCrossConfirmNum);
        MOVS     R3,#+3
        MOVS     R2,R6
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea0
        MOVS     R5,R0
// 1540   
// 1541   //temp为第2段黑线起始行本应该在的位置。
// 1542   temp = a0 + a1 * Row2RealFirstLine;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        BL       __aeabi_ui2f
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R5,R0
// 1543   //如果这个位置本来就超出了左右边界的范围，那说明不可能有第2段黑线存在了。
// 1544   //也就不用检测第2段黑线了，直接返回0.
// 1545   if((temp < 0) || (temp > CameraRealWidth - 1)) 
        MOVS     R0,R5
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCC.N    ??BlackRightCrossConfirm_6
        MOVS     R0,R5
        LDR.W    R1,??DataTable21_5  ;; 0x43790001
        BL       __aeabi_cfrcmple
        BHI.N    ??BlackRightCrossConfirm_7
// 1546   {
// 1547     return 0;
??BlackRightCrossConfirm_6:
        MOVS     R0,#+0
        B.N      ??BlackRightCrossConfirm_1
// 1548   }
??BlackRightCrossConfirm_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??BlackRightCrossConfirm_3
        MOVS     R0,#+1
        B.N      ??BlackRightCrossConfirm_1
// 1549   else
// 1550   { //这里本来应该加上把这个点限定在窗内，但是似乎没必要。
// 1551     if(
// 1552       (BlackRightLoc[Row2RealFirstLine][0] > temp - BlackCrossConfirmWin) 
// 1553     &&(BlackRightLoc[Row2RealFirstLine][0] < temp + BlackCrossConfirmWin)
// 1554       )
??BlackRightCrossConfirm_7:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOVS     R6,R1
        LDR.W    R0,??DataTable21_6  ;; 0xc1200000
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R1,R6
        BL       __aeabi_cfcmple
        BCS.N    ??BlackRightCrossConfirm_8
        LDR.W    R0,??DataTable21_7  ;; 0x41200000
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R5,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R5
        BL       __aeabi_cfcmple
        BCS.N    ??BlackRightCrossConfirm_8
// 1555     {
// 1556       return 1;
        MOVS     R0,#+1
        B.N      ??BlackRightCrossConfirm_1
// 1557     }
// 1558     else
// 1559     {
// 1560       return 0;
??BlackRightCrossConfirm_8:
        MOVS     R0,#+0
??BlackRightCrossConfirm_1:
        POP      {R1,R2,R4-R6,PC}  ;; return
// 1561     }
// 1562     
// 1563   }  
// 1564 }
// 1565 
// 1566 
// 1567 //======================================================================
// 1568 //函数名：BlackRightAgainForCross
// 1569 //功  能：十字检测程序
// 1570 //参  数：第2段黑线的预测起始行Row2FirstLine， 第2段黑线的预测结束行Row2LastLine，
// 1571 //        第1段黑线的实际结束行Row1RealLastLine
// 1572 //返  回：1成功 0失败
// 1573 //影  响：BlackRightLoc[][]。
// 1574 //说  明：1. 本函数会调用浮点运算的函数，预计花费较多时间，调用入口需谨慎。
// 1575 //             
// 1576 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1577 uint8 BlackRightAgainForCross(uint8 Row2FirstLine, uint8 Row2LastLine, uint8 Row1RealLastLine)
// 1578 {
BlackRightAgainForCross:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
// 1579     uint8 row, temp, temp1, temp2;
// 1580     uint8 Row2RealFirstLine; //第2段黑线的真实起始行
// 1581     uint8 i;
// 1582 
// 1583     temp = BlackGetRightStep1Scan(Row2FirstLine, Row2LastLine, 0); //第3个参数0表示是十字再检测，不用更新3个关键值
        MOVS     R2,#+0
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetRightStep1Scan
        MOV      R8,R0
// 1584     if(temp == MaxValUint8)  
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+255
        BNE.N    ??BlackRightAgainForCross_0
// 1585     {
// 1586       //扫屁股工作。        //i >= Row2LastLine
// 1587       for(i = Row2FirstLine; ; i--)
        B.N      ??BlackRightAgainForCross_1
??BlackRightAgainForCross_2:
        SUBS     R4,R4,#+1
// 1588       {
// 1589         BlackRightLoc[i][0] = MaxValUint8;
??BlackRightAgainForCross_1:
        MOVS     R0,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
// 1590         if(i == 0) break;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??BlackRightAgainForCross_2
// 1591       }
// 1592       return 0;  
        MOVS     R0,#+0
        B.N      ??BlackRightAgainForCross_3
// 1593     }
// 1594     else 
// 1595     {
// 1596       if(!BlackRightCrossConfirm(Row1RealLastLine, temp))
??BlackRightAgainForCross_0:
        MOV      R1,R8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackRightCrossConfirm
        CMP      R0,#+0
        BNE.N    ??BlackRightAgainForCross_4
// 1597       { //扫屁股工作。         //i >= (temp-1)
// 1598         for(i = Row2FirstLine; ; i--)
        B.N      ??BlackRightAgainForCross_5
??BlackRightAgainForCross_6:
        SUBS     R4,R4,#+1
// 1599         {
// 1600           BlackRightLoc[i][0] = MaxValUint8;
??BlackRightAgainForCross_5:
        MOVS     R0,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
// 1601           if(i == 0) break;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??BlackRightAgainForCross_6
// 1602         }
// 1603         return 0;
        MOVS     R0,#+0
        B.N      ??BlackRightAgainForCross_3
// 1604       }
// 1605       //十字再检测的线头的确在限定的范围内，可以继续。
// 1606       else
// 1607       {
// 1608       row = temp;
??BlackRightAgainForCross_4:
        MOV      R4,R8
// 1609       }
// 1610       //row = temp;
// 1611     }
// 1612     
// 1613     Row2RealFirstLine = row; //记录第2段黑线的真实起始行
        MOVS     R7,R4
// 1614     
// 1615     //十字再检测第2阶段，顺着线头找线。
// 1616     //temp为预测的黑点位置
// 1617     temp = BlackRightLoc[row-1][0] + BlackRightLoc[row-1][0] - BlackRightLoc[row][0];
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #-3]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21
        MLA      R1,R1,R4,R2
        LDRB     R1,[R1, #-3]
        ADDS     R0,R1,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21
        MLA      R1,R1,R4,R2
        LDRB     R1,[R1, #+0]
        SUBS     R8,R0,R1
// 1618     //从最近的认证行到取最远的行
// 1619     for(row -= 2; ; row -= 2)
        SUBS     R4,R4,#+2
        B.N      ??BlackRightAgainForCross_7
??BlackRightAgainForCross_8:
        SUBS     R4,R4,#+2
// 1620     {
// 1621       //如果连续两行的黑点检测成功，则更新预测点的位置
// 1622       temp1 = BlackGetRightStep2Win(row, BlackRightWinVal, temp);
??BlackRightAgainForCross_7:
        MOV      R2,R8
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetRightStep2Win
        MOV      R9,R0
// 1623       temp2 = BlackGetRightStep2Win(row-1, BlackRightWinVal, temp);
        MOV      R2,R8
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        SUBS     R0,R4,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetRightStep2Win
// 1624       if(temp1 && temp2) 
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??BlackRightAgainForCross_9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BlackRightAgainForCross_9
// 1625       {
// 1626         temp = BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0];
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable21
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #-3]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21
        MLA      R1,R1,R4,R2
        LDRB     R1,[R1, #-3]
        ADDS     R0,R1,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21
        MLA      R1,R1,R4,R2
        LDRB     R1,[R1, #+0]
        SUBS     R8,R0,R1
// 1627       }
// 1628       //如果没能连续两行检测黑点成功，则不更新预测点位置，采用原位置。
// 1629       else
// 1630       {
// 1631       }     
// 1632       if((row == Row2LastLine) || (row == Row2LastLine+1)) break;      
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
// 1633     }
// 1634     
// 1635     //脑补两段线的接线。
// 1636     if(!BlackRightCrossStep3(Row1RealLastLine, Row2RealFirstLine))
??BlackRightAgainForCross_10:
        MOVS     R1,R7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackRightCrossStep3
        CMP      R0,#+0
        BNE.N    ??BlackRightAgainForCross_11
// 1637     {
// 1638       return 0;
        MOVS     R0,#+0
        B.N      ??BlackRightAgainForCross_3
// 1639     }
// 1640     
// 1641     return 1;
??BlackRightAgainForCross_11:
        MOVS     R0,#+1
??BlackRightAgainForCross_3:
        POP      {R1,R4-R9,PC}    ;; return
// 1642         
// 1643 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     0x437a0000
// 1644 
// 1645 
// 1646 //======================================================================
// 1647 //函数名：BlackRightStep4BackLine
// 1648 //功  能：向后补线函数。
// 1649 //参  数：Step4StartLine开始行
// 1650 //返  回：1成功 0失败
// 1651 //影  响：
// 1652 //说  明：
// 1653 //             
// 1654 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1655 uint8 BlackRightStep4BackLine(uint8 Step4StartLine)
// 1656 {
BlackRightStep4BackLine:
        PUSH     {R2-R6,LR}
        MOVS     R4,R0
// 1657   uint8 row;
// 1658   uint8 i, index;
// 1659   uint8 x[BlackBackLineNum];   //取多少个点在一开始有定义。
// 1660   uint8 y[BlackBackLineNum];
// 1661   uint8 j;
// 1662   uint8 temp1;
// 1663   float temp;
// 1664     
// 1665   float a0, a1;
// 1666   
// 1667   if(Step4StartLine - BlackBackLineNum - BlackBackLineNum < 0)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        SUBS     R0,R4,#+8
        CMP      R0,#+0
        BPL.N    ??BlackRightStep4BackLine_0
// 1668   {
// 1669     temp1 = 0;  
        MOVS     R2,#+0
        B.N      ??BlackRightStep4BackLine_1
// 1670   }
// 1671   else
// 1672   {
// 1673     temp1 = Step4StartLine - BlackBackLineNum - BlackBackLineNum;
??BlackRightStep4BackLine_0:
        SUBS     R2,R4,#+8
// 1674   }
// 1675   
// 1676   //取BlackBackLineNum个点作为最小二乘法的基准点。
// 1677   index = 0;
??BlackRightStep4BackLine_1:
        MOVS     R1,#+0
// 1678   for(i = Step4StartLine; ; i--)
        MOVS     R0,R4
        B.N      ??BlackRightStep4BackLine_2
??BlackRightStep4BackLine_3:
        SUBS     R0,R0,#+1
// 1679   {
// 1680     if(BlackRightLoc[i][0] != MaxValUint8)
??BlackRightStep4BackLine_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R3,#+3
        LDR.W    R5,??DataTable21
        MLA      R3,R3,R0,R5
        LDRB     R3,[R3, #+0]
        CMP      R3,#+255
        BEQ.N    ??BlackRightStep4BackLine_4
// 1681     {
// 1682       y[index] = BlackRightLoc[i][0];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R3,#+3
        LDR.W    R5,??DataTable21
        MLA      R3,R3,R0,R5
        LDRB     R3,[R3, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R5,SP,#+0
        STRB     R3,[R1, R5]
// 1683       x[index] = i;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R3,SP,#+4
        STRB     R0,[R1, R3]
// 1684       index++;
        ADDS     R1,R1,#+1
// 1685     }
// 1686     if(index == BlackBackLineNum)
??BlackRightStep4BackLine_4:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+4
        BNE.N    ??BlackRightStep4BackLine_5
// 1687     {
// 1688       break;  
// 1689     }
// 1690     if(i == temp1)
// 1691     {
// 1692       return 0;
// 1693     }
// 1694   }
// 1695   
// 1696   //最小二乘法
// 1697   //y = a0 + a1 * x
// 1698   a1 = LeastSquarea1(x, y, BlackBackLineNum);
        MOVS     R2,#+4
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea1
        MOVS     R6,R0
// 1699   a0 = LeastSquarea0(x, y, a1, BlackBackLineNum);
        MOVS     R3,#+4
        MOVS     R2,R6
        ADD      R1,SP,#+0
        ADD      R0,SP,#+4
        BL       LeastSquarea0
        MOVS     R5,R0
// 1700   
// 1701   for(row = Step4StartLine + 1; row <= CameraHight - 1; row++)
        ADDS     R4,R4,#+1
        B.N      ??BlackRightStep4BackLine_6
??BlackRightStep4BackLine_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R0,R2
        BNE.N    ??BlackRightStep4BackLine_3
        MOVS     R0,#+0
        B.N      ??BlackRightStep4BackLine_7
// 1702   {
// 1703     //补线也有个度，向右和向左都不能补出范围。
// 1704     temp = a0 + a1 * row;
// 1705     if(temp > CameraRealWidth)
// 1706     {
// 1707       //BlackRightLoc[row][0] = CameraRealWidth - 1;
// 1708       //超过左右界限时，原策略为置边界值，现在的策略是从该行起置无效值。
// 1709       for(j = row; ; j++)
// 1710       {
// 1711         BlackRightLoc[row][0] = MaxValUint8;
// 1712         if(j == CameraHight - 1) break;
// 1713       }
// 1714       break;
// 1715     }
// 1716     else if(temp < 0)
// 1717     {
// 1718       //BlackRightLoc[row][0] = 0;
// 1719       //超过左右界限时，原策略为置边界值，现在的策略是从该行起置无效值。
// 1720       for(j = row; ; j++)
// 1721       {
// 1722         BlackRightLoc[row][0] = MaxValUint8;
// 1723         if(j == CameraHight - 1) break;
// 1724       }
// 1725       break;
// 1726     }
// 1727     else
// 1728     {
// 1729       BlackRightLoc[row][0] = (uint8)(temp); 
??BlackRightStep4BackLine_8:
        BL       __aeabi_f2iz
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable21
        MLA      R1,R1,R4,R2
        STRB     R0,[R1, #+0]
// 1730     }
        ADDS     R4,R4,#+1
??BlackRightStep4BackLine_6:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+50
        BGE.N    ??BlackRightStep4BackLine_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        BL       __aeabi_ui2f
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable22  ;; 0x437a0001
        BL       __aeabi_cfrcmple
        BHI.N    ??BlackRightStep4BackLine_10
        MOVS     R0,R4
        B.N      ??BlackRightStep4BackLine_11
??BlackRightStep4BackLine_12:
        ADDS     R0,R0,#+1
??BlackRightStep4BackLine_11:
        MOVS     R1,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable21
        MLA      R2,R2,R4,R3
        STRB     R1,[R2, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??BlackRightStep4BackLine_12
        B.N      ??BlackRightStep4BackLine_9
??BlackRightStep4BackLine_10:
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??BlackRightStep4BackLine_8
        MOVS     R0,R4
        B.N      ??BlackRightStep4BackLine_13
??BlackRightStep4BackLine_14:
        ADDS     R0,R0,#+1
??BlackRightStep4BackLine_13:
        MOVS     R1,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable21
        MLA      R2,R2,R4,R3
        STRB     R1,[R2, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??BlackRightStep4BackLine_14
// 1731   }
// 1732   
// 1733   return 1;
??BlackRightStep4BackLine_9:
        MOVS     R0,#+1
??BlackRightStep4BackLine_7:
        POP      {R1,R2,R4-R6,PC}  ;; return
// 1734   
// 1735 }

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

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_2:
        DC32     BlackRightRealWB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_3:
        DC32     BlackRightRealW
// 1736 
// 1737 
// 1738 //======================================================================
// 1739 //函数名：BlackGetRight
// 1740 //功  能：右黑线提取算法
// 1741 //参  数：无
// 1742 //返  回：1成功 0失败
// 1743 //影  响：
// 1744 //说  明：1. 暂时可以处理直道，弯道，十字路口3种情况。2014.11.10
// 1745 //      
// 1746 //       
// 1747 //       
// 1748 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1749 uint8 BlackGetRight(void)
// 1750 {
BlackGetRight:
        PUSH     {R3-R11,LR}
// 1751     uint8 row, temp, temp1, temp2, temp3, i;
// 1752     uint8 GapCount, Row1RealLastLine, index;
// 1753     uint8 Step4Flag, Step4StartLine;
// 1754 
// 1755     Step4Flag = 0;
        MOVS     R5,#+0
// 1756 
// 1757     //默认十字检测标志置为未进入。
// 1758     BlackRightCrossDone = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable24
        STRB     R0,[R1, #+0]
// 1759 
// 1760     temp = BlackGetRightStep1Scan(CameraHight - 1, CameraHight - BlackStep1Size - 1, 1);
        MOVS     R2,#+1
        MOVS     R1,#+24
        MOVS     R0,#+49
        BL       BlackGetRightStep1Scan
        MOVS     R7,R0
// 1761     if(temp == MaxValUint8)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+255
        BNE.N    ??BlackGetRight_0
// 1762     {
// 1763       return 0;
        MOVS     R0,#+0
        B.N      ??BlackGetRight_1
// 1764     }
// 1765     else
// 1766     {
// 1767       row = temp;
??BlackGetRight_0:
        MOV      R10,R7
// 1768       //起始线头的位置非常高。
// 1769       if(row < CameraHight - BlackRightBackLineStart)
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+42
        BGE.N    ??BlackGetRight_2
// 1770       {
// 1771         Step4Flag = 1;
        MOVS     R5,#+1
// 1772         Step4StartLine = row;
        MOV      R6,R10
// 1773       }
// 1774     }
// 1775     //上次已经处理完了第row-1行，下一次要处理第row-2行
// 1776     //BlackRightSlope();
// 1777     
// 1778     //temp为预测的黑点位置
// 1779     //对预测值进行限定。
// 1780     if((BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0]) < 0)
??BlackGetRight_2:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable21
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+0
        BPL.N    ??BlackGetRight_3
// 1781     {
// 1782       temp = 0;
        MOVS     R7,#+0
        B.N      ??BlackGetRight_4
// 1783     }
// 1784     else if((BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0]) >= CameraRealWidth) 
??BlackGetRight_3:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable21
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+250
        BLT.N    ??BlackGetRight_5
// 1785     {         
// 1786       temp = CameraRealWidth - 1; 
        MOVS     R7,#+249
        B.N      ??BlackGetRight_4
// 1787     }
// 1788     else
// 1789     {
// 1790       temp = BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0];
??BlackGetRight_5:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable21
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        ADDS     R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R7,R0,R1
// 1791     }
// 1792     
// 1793     index = 0;
??BlackGetRight_4:
        MOVS     R8,#+0
// 1794     
// 1795     GapCount = 0;
        MOVS     R9,#+0
// 1796     //从最近的认证行到取最远的行
// 1797     for(row -= 2; ; row -= 2)
        SUBS     R10,R10,#+2
        B.N      ??BlackGetRight_6
??BlackGetRight_7:
        SUBS     R10,R10,#+2
// 1798     {
// 1799       temp1 = BlackGetRightStep2Win(row, BlackRightWinVal, temp);
??BlackGetRight_6:
        MOVS     R2,R7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        MOV      R0,R10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetRightStep2Win
        MOV      R11,R0
// 1800       temp2 = BlackGetRightStep2Win(row-1, BlackRightWinVal, temp);
        MOVS     R2,R7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+15
        SUBS     R0,R10,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackGetRightStep2Win
// 1801       temp3 = (
// 1802               (!temp1)
// 1803             &&(!temp2)
// 1804             //&&(!Step4Flag)
// 1805               );
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+0
        BNE.N    ??BlackGetRight_8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??BlackGetRight_8
        MOVS     R1,#+1
        B.N      ??BlackGetRight_9
??BlackGetRight_8:
        MOVS     R1,#+0
// 1806       if(temp1 && temp2) 
??BlackGetRight_9:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+0
        BEQ.N    ??BlackGetRight_10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BlackGetRight_10
// 1807       {
// 1808         //对预测值进行限定。
// 1809         if((BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0]) < 0)
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable21
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+0
        BPL.N    ??BlackGetRight_11
// 1810         {
// 1811           temp = 0;
        MOVS     R7,#+0
        B.N      ??BlackGetRight_12
// 1812         }
// 1813         else if((BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0]) >= CameraRealWidth) 
??BlackGetRight_11:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable21
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        UXTAB    R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+250
        BLT.N    ??BlackGetRight_13
// 1814         {         
// 1815           temp = CameraRealWidth - 1; 
        MOVS     R7,#+249
        B.N      ??BlackGetRight_12
// 1816         }
// 1817         else
// 1818         {
// 1819           temp = BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0];
??BlackGetRight_13:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable21
        MLA      R0,R0,R10,R1
        LDRB     R0,[R0, #-3]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #-3]
        ADDS     R0,R1,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        SUBS     R7,R0,R1
        B.N      ??BlackGetRight_12
// 1820         }
// 1821       }
// 1822       else if(temp3)
??BlackGetRight_10:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??BlackGetRight_12
// 1823       {       
// 1824         //Row1RealLastLine记录第1段黑线的最后一行。
// 1825         if(index == 0)
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??BlackGetRight_14
// 1826         {
// 1827           //进来一次后，就再也不会进来了。
// 1828           index++;
        ADDS     R8,R8,#+1
// 1829           for(i = row; i < (row + 5); i++)
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
// 1830           {
// 1831             if(BlackRightLoc[i][0] != MaxValUint8)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable21
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??BlackGetRight_16
// 1832             {
// 1833               Row1RealLastLine = i;
        MOVS     R4,R0
// 1834               break;
// 1835             }
// 1836           }
// 1837           if(Row1RealLastLine >= CameraHight - 1)
??BlackGetRight_17:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+49
        BLT.N    ??BlackGetRight_14
// 1838           {
// 1839             Row1RealLastLine = CameraHight - 1;
        MOVS     R4,#+49
// 1840           }
// 1841           else
// 1842           {
// 1843           }
// 1844         }
// 1845         
// 1846         GapCount += 2;
??BlackGetRight_14:
        ADDS     R9,R9,#+2
// 1847 
// 1848         if(GapCount > BlackCrossGapLine)
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+11
        BLT.N    ??BlackGetRight_18
// 1849         {
// 1850           //再检测时的行太远了，就没必要检测了。
// 1851           if(row < BlackRightCrossTooLowLine)
        LDR.W    R0,??DataTable25
        LDRB     R0,[R0, #+0]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,R0
        BCC.N    ??BlackGetRight_19
// 1852           {
// 1853             break;
// 1854           }
// 1855           else
// 1856           {
// 1857           }
// 1858           
// 1859           if(!BlackRightAgainForCross(row - 2, 1, Row1RealLastLine))
??BlackGetRight_20:
        MOVS     R2,R4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+1
        SUBS     R0,R10,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackRightAgainForCross
        CMP      R0,#+0
        BNE.N    ??BlackGetRight_21
// 1860           {
// 1861             BlackRightCrossDone = 1;  //十字检测失败            
        MOVS     R0,#+1
        LDR.W    R1,??DataTable24
        STRB     R0,[R1, #+0]
        B.N      ??BlackGetRight_22
// 1862           }
// 1863           else
// 1864           {
// 1865             BlackRightCrossDone = 2;  //十字检测成功
??BlackGetRight_21:
        MOVS     R0,#+2
        LDR.W    R1,??DataTable24
        STRB     R0,[R1, #+0]
// 1866           }
// 1867           break;  //十字再检测里会开窗检测到指定的最后一行，所以不用再循环了，直接跳出
??BlackGetRight_22:
        B.N      ??BlackGetRight_19
// 1868         }
// 1869         else
// 1870         {
// 1871            BlackRightCrossDone = 0;    //十字检测未进入
??BlackGetRight_18:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable24
        STRB     R0,[R1, #+0]
// 1872         }      
// 1873       }
// 1874       else
// 1875       {       
// 1876       }     
// 1877       if((row == 0) || (row == 1)) break;
??BlackGetRight_12:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BEQ.N    ??BlackGetRight_23
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+1
        BNE.W    ??BlackGetRight_7
// 1878       
// 1879     }    
// 1880     //这里有浮点运算，要严格控制调用。
// 1881     if(Step4Flag)
??BlackGetRight_23:
??BlackGetRight_19:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??BlackGetRight_24
// 1882     {
// 1883       if(!BlackRightStep4BackLine(Step4StartLine))
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackRightStep4BackLine
        CMP      R0,#+0
        BNE.N    ??BlackGetRight_24
// 1884       {
// 1885         return 0;  
        MOVS     R0,#+0
        B.N      ??BlackGetRight_1
// 1886       }
// 1887     }
// 1888    
// 1889     return 1;
??BlackGetRight_24:
        MOVS     R0,#+1
??BlackGetRight_1:
        POP      {R1,R4-R11,PC}   ;; return
// 1890 
// 1891   
// 1892   
// 1893 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     BlackRightRealB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_1:
        DC32     BlackLeftDone

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_2:
        DC32     ImgNew

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_3:
        DC32     LimitRightWB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_4:
        DC32     LimitRightW
// 1894 
// 1895 
// 1896 //======================================================================
// 1897 //函数名：BlackGet
// 1898 //功  能：黑线提取程序
// 1899 //参  数：无
// 1900 //返  回：1成功 0失败
// 1901 //影  响：见具体的左、右黑线算法
// 1902 //说  明：
// 1903 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1904 uint8 BlackGet(void)
// 1905 {
BlackGet:
        PUSH     {R4-R6,LR}
// 1906     uint8 tempLWB, tempLW, tempLB;
// 1907     uint8 tempRWB, tempRW, tempRB;
// 1908     //采集成功标志位
// 1909     BlackLeftDone = 1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable25_1
        STRB     R0,[R1, #+0]
// 1910     BlackRightDone = 1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable25_2
        STRB     R0,[R1, #+0]
// 1911     
// 1912     //左黑线提取，成功则返回1，失败则返回0.
// 1913     if(!BlackGetLeft())
        BL       BlackGetLeft
        CMP      R0,#+0
        BNE.N    ??BlackGet_0
// 1914     {
// 1915       tempLWB = LimitLeftWB;
        LDR.W    R0,??DataTable25_3
        LDRB     R4,[R0, #+0]
// 1916       tempLW = LimitLeftW;
        LDR.W    R0,??DataTable25_4
        LDRB     R5,[R0, #+0]
// 1917       tempLB = LimitLeftB;
        LDR.W    R0,??DataTable25_5
        LDRB     R6,[R0, #+0]
// 1918       
// 1919       LimitLeftWB = LimitOriLeftWB;                 
        MOVS     R0,#+80
        LDR.W    R1,??DataTable25_3
        STRB     R0,[R1, #+0]
// 1920       LimitLeftW = LimitOriLeftW;
        MOVS     R0,#+150
        LDR.W    R1,??DataTable25_4
        STRB     R0,[R1, #+0]
// 1921       LimitLeftB = LimitOriLeftB;
        MOVS     R0,#+80
        LDR.W    R1,??DataTable25_5
        STRB     R0,[R1, #+0]
// 1922       
// 1923       if(!BlackGetLeft())
        BL       BlackGetLeft
        CMP      R0,#+0
        BNE.N    ??BlackGet_1
// 1924       {
// 1925         LimitLeftWB = tempLWB;
        LDR.W    R0,??DataTable25_3
        STRB     R4,[R0, #+0]
// 1926         LimitLeftW = tempLW;
        LDR.W    R0,??DataTable25_4
        STRB     R5,[R0, #+0]
// 1927         LimitLeftB = tempLB;
        LDR.W    R0,??DataTable25_5
        STRB     R6,[R0, #+0]
// 1928         
// 1929         //uart_sendN(UART0, (uint8 *)"\nFailed In BlackGetLeft!", 24);  
// 1930         BlackLeftDone = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable25_1
        STRB     R0,[R1, #+0]
        B.N      ??BlackGet_0
// 1931       }
// 1932       //的确是光线的原因。
// 1933       else
// 1934       {
// 1935         BlackLeft3ResetCount++;    //由于光线变化太大引起的3个关键值重置的次数。
??BlackGet_1:
        LDR.W    R0,??DataTable25_6
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable25_6
        STRB     R0,[R1, #+0]
// 1936       }
// 1937     }   
// 1938     
// 1939     //右黑线提取，成功则返回1，失败则返回0.
// 1940     if(!BlackGetRight())
??BlackGet_0:
        BL       BlackGetRight
        CMP      R0,#+0
        BNE.N    ??BlackGet_2
// 1941     {
// 1942       tempRWB = LimitRightWB;
        LDR.W    R0,??DataTable25_7
        LDRB     R4,[R0, #+0]
// 1943       tempRW = LimitRightW;
        LDR.W    R0,??DataTable25_8
        LDRB     R5,[R0, #+0]
// 1944       tempRB = LimitRightB;
        LDR.N    R0,??DataTable21_1
        LDRB     R6,[R0, #+0]
// 1945       
// 1946       LimitRightWB = LimitOriRightWB;                 
        MOVS     R0,#+80
        LDR.W    R1,??DataTable25_7
        STRB     R0,[R1, #+0]
// 1947       LimitRightW = LimitOriRightW;
        MOVS     R0,#+150
        LDR.W    R1,??DataTable25_8
        STRB     R0,[R1, #+0]
// 1948       LimitRightB = LimitOriRightB;
        MOVS     R0,#+80
        LDR.N    R1,??DataTable21_1
        STRB     R0,[R1, #+0]
// 1949 
// 1950       //不是光线的原因的情况下，把3个关键值变回来。
// 1951       if(!BlackGetRight())
        BL       BlackGetRight
        CMP      R0,#+0
        BNE.N    ??BlackGet_3
// 1952       {
// 1953         LimitRightWB = tempRWB;
        LDR.W    R0,??DataTable25_7
        STRB     R4,[R0, #+0]
// 1954         LimitRightW = tempRW;
        LDR.W    R0,??DataTable25_8
        STRB     R5,[R0, #+0]
// 1955         LimitRightB = tempRB;
        LDR.N    R0,??DataTable21_1
        STRB     R6,[R0, #+0]
// 1956       
// 1957         //uart_sendN(UART0, (uint8 *)"\nFailed In BlackGetRight!", 25);  
// 1958         BlackRightDone = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable25_2
        STRB     R0,[R1, #+0]
        B.N      ??BlackGet_2
// 1959       }
// 1960       //的确是光线的原因。
// 1961       else
// 1962       {
// 1963         BlackRight3ResetCount++;    //由于光线变化太大引起的3个关键值重置的次数。
??BlackGet_3:
        LDR.W    R0,??DataTable25_9
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable25_9
        STRB     R0,[R1, #+0]
// 1964       }
// 1965     }
// 1966     
// 1967     //左、右黑线均提取失败，则黑线提取失败。
// 1968     if((BlackLeftDone == 0) && (BlackRightDone == 0))
??BlackGet_2:
        LDR.W    R0,??DataTable25_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??BlackGet_4
        LDR.W    R0,??DataTable25_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??BlackGet_4
// 1969     {
// 1970       return 0;
        MOVS     R0,#+0
        B.N      ??BlackGet_5
// 1971     }    
// 1972     //暂时还是不采取这种向后补线的方式，因为的确存在一边是十字补线，一边是向后补线的情况。
// 1973     /*
// 1974     //左、右黑线均提取成功，则看一下是否需要向后补线。
// 1975     else if((BlackLeftDone == 1) && (BlackRightDone == 1))
// 1976     {
// 1977       //左、右黑线均要求向后补线时，才执行补线程序。否则有可能是弯道使线头上浮的情况。
// 1978       if((BlackLeftStep4Flag == 1) && (BlackRightStep4Flag == 1))
// 1979       {
// 1980         BlackLeftStep4BackLine(BlackLeftStep4StartLine);
// 1981         BlackRightStep4BackLine(BlackRightStep4StartLine);
// 1982       }
// 1983       
// 1984     }
// 1985     */
// 1986     else
// 1987     {
// 1988       
// 1989     }
// 1990     
// 1991     return 1;
??BlackGet_4:
        MOVS     R0,#+1
??BlackGet_5:
        POP      {R4-R6,PC}       ;; return
// 1992 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21:
        DC32     BlackRightLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_1:
        DC32     LimitRightB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_2:
        DC32     `?<Constant "\\nError In BlackRightC...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_3:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_4:
        DC32     0x3ff00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_5:
        DC32     0x43790001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_6:
        DC32     0xc1200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_7:
        DC32     0x41200000
// 1993 
// 1994 
// 1995 
// 1996 
// 1997 
// 1998 
// 1999 
// 2000 
// 2001 
// 2002 /*
// 2003 //======================================================================
// 2004 //函数名：CenterLineGet
// 2005 //功  能：中心线提取函数
// 2006 //参  数：无
// 2007 //返  回：1成功 0失败
// 2008 //影  响：CenterLineLoc[]
// 2009 //说  明：1. 暂定为取左右有效黑线的中点，为基础版本。2014.11.11
// 2010 //      
// 2011 //             
// 2012 //======================================================================
// 2013 uint8 CenterLineGet(void)
// 2014 {
// 2015   uint8 row;
// 2016   uint8 templ, tempr;
// 2017     
// 2018   //左、右黑线均提取失败。
// 2019   if((BlackLeftDone == 0) && (BlackRightDone ==  0))
// 2020   {
// 2021     return 0;  
// 2022   }
// 2023   
// 2024   for(row = CameraHight - 1; ; row--)
// 2025   {
// 2026     templ = BlackLeftLoc[row][0];
// 2027     tempr = BlackRightLoc[row][0];
// 2028     
// 2029     //左、右黑线均提取成功。
// 2030     if((BlackLeftDone == 1) && (BlackRightDone ==  1))
// 2031     {   
// 2032       //该行左右黑线都提取到了。
// 2033       if((templ != MaxValUint8) && (tempr != MaxValUint8))  
// 2034       {
// 2035         CenterLineLoc[row] = (templ + tempr) / 2;
// 2036       }
// 2037       //该行左黑线提取到了，右黑线提取失败。
// 2038       else if((templ != MaxValUint8) && (tempr == MaxValUint8))
// 2039       {
// 2040         CenterLineLoc[row] = templ + CenterLineHalfWidth[row];
// 2041       }
// 2042       //该行右黑线提取到了，左黑线提取失败。
// 2043       else if((tempr != MaxValUint8) && (templ == MaxValUint8))  
// 2044       {
// 2045         CenterLineLoc[row] = tempr - CenterLineHalfWidth[row];
// 2046       }
// 2047       //该行左、右黑线均提取失败，该行中心点赋无效值。
// 2048       else 
// 2049       {
// 2050         CenterLineLoc[row] = MaxValUint8;  
// 2051       }
// 2052     }
// 2053     //左黑线提取成功，右黑线提取失败
// 2054     else if((BlackLeftDone == 1) && (BlackRightDone ==  0))
// 2055     {
// 2056       if(templ != MaxValUint8)
// 2057       {
// 2058         CenterLineLoc[row] = templ + CenterLineHalfWidth[row];
// 2059       }
// 2060       else 
// 2061       {
// 2062         CenterLineLoc[row] = MaxValUint8;
// 2063       }
// 2064     }
// 2065     //右黑线提取成功，左黑线提取失败
// 2066     else if((BlackLeftDone == 0) && (BlackRightDone ==  1))
// 2067     {
// 2068       if(tempr != MaxValUint8)
// 2069       {
// 2070         CenterLineLoc[row] = tempr - CenterLineHalfWidth[row];
// 2071       }
// 2072       else 
// 2073       {
// 2074         CenterLineLoc[row] = MaxValUint8;
// 2075       }
// 2076     }
// 2077     else
// 2078     {
// 2079       
// 2080     }
// 2081     
// 2082     //如果处理到了最后一行，就跳出for循环。
// 2083     if(row == 0) break;
// 2084   }
// 2085   return 1;
// 2086   
// 2087 }
// 2088 */
// 2089 
// 2090 //左右边界限制

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2091 uint8 BoundaryLimitRe(int16 x, uint8 left, uint8 right)
// 2092 {
// 2093   if(x < left)
BoundaryLimitRe:
        MOVS     R3,R1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        SXTH     R3,R3            ;; SignExt  R3,R3,#+16,#+16
        CMP      R0,R3
        BGE.N    ??BoundaryLimitRe_0
// 2094   {
// 2095     return left;
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??BoundaryLimitRe_1
// 2096   }
// 2097   else if(x > right)
??BoundaryLimitRe_0:
        MOVS     R1,R2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        CMP      R1,R0
        BGE.N    ??BoundaryLimitRe_2
// 2098   {
// 2099     return right;
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??BoundaryLimitRe_1
// 2100   }
// 2101   else
// 2102   {
// 2103     return x;
??BoundaryLimitRe_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??BoundaryLimitRe_1:
        BX       LR               ;; return
// 2104   }
// 2105 }
// 2106 
// 2107 
// 2108 //中心线获取函数。

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2109 uint8 CenterLineGet(void)
// 2110 {
CenterLineGet:
        PUSH     {R3-R7,LR}
// 2111   uint8 row, i, j;
// 2112   uint8 templ, tempr;
// 2113   uint8 FailCount;
// 2114   uint8 tempmax;
// 2115   //uint8 flag001 = 0;
// 2116   //左、右黑线均提取失败。
// 2117   if((BlackLeftDone == 0) && (BlackRightDone ==  0))
        LDR.W    R0,??DataTable25_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??CenterLineGet_0
        LDR.W    R0,??DataTable25_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??CenterLineGet_0
// 2118   {
// 2119     return 0;  
        MOVS     R0,#+0
        B.W      ??CenterLineGet_1
// 2120   }
// 2121     
// 2122   //左、右黑线均提取成功。
// 2123   if((BlackLeftDone == 1) && (BlackRightDone ==  1))
??CenterLineGet_0:
        LDR.W    R0,??DataTable25_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??CenterLineGet_2
        LDR.W    R0,??DataTable25_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??CenterLineGet_2
// 2124   {
// 2125     FailCount = 0;
        MOVS     R4,#+0
// 2126     for(row = CameraHight - 1; ; row--)
        MOVS     R5,#+49
        B.N      ??CenterLineGet_3
??CenterLineGet_4:
        SUBS     R5,R5,#+1
// 2127     {
// 2128       templ = BlackLeftLoc[row][0];
??CenterLineGet_3:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable25_10
        MLA      R0,R0,R5,R1
        LDRB     R3,[R0, #+0]
// 2129       tempr = BlackRightLoc[row][0];
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable25_11
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
// 2130       //该行左右黑线都提取到了。
// 2131       if((templ != MaxValUint8) && (tempr != MaxValUint8))  
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+255
        BEQ.N    ??CenterLineGet_5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_5
// 2132       {        
// 2133         CenterLineLoc[row] = (templ + tempr) / 2;    
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTAB    R0,R0,R3
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2134       }
// 2135       //该行左黑线提取失败，右黑线提取成功。
// 2136       else if((templ == MaxValUint8) && (tempr != MaxValUint8))
??CenterLineGet_5:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+255
        BNE.W    ??CenterLineGet_7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+255
        BEQ.W    ??CenterLineGet_7
// 2137       {
// 2138         if(row == CameraHight - 1)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+49
        BNE.N    ??CenterLineGet_8
// 2139         {
// 2140             if(CenterLocStore != MaxValUint8)
        LDR.W    R0,??DataTable25_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_9
// 2141             {
// 2142               CenterLineLoc[row] = BoundaryLimitRe(BlackRightLoc[row][0] - CenterLocStore, 0, CameraRealWidth - 1);
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R3,??DataTable25_11
        MLA      R0,R0,R5,R3
        LDRB     R0,[R0, #+0]
        LDR.W    R3,??DataTable25_13
        LDRB     R3,[R3, #+0]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2143             }
// 2144             else
// 2145             {
// 2146               CenterLineLoc[row] = BoundaryLimitRe(BlackRightLoc[row][0] - CenterLineHalfWidth[row], 0, CameraRealWidth - 1);
??CenterLineGet_9:
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R3,??DataTable25_11
        MLA      R0,R0,R5,R3
        LDRB     R0,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R3,??DataTable25_14
        LDRB     R3,[R5, R3]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2147             }
// 2148         }
// 2149         //根据右线来估计中心线的走向，前提是上一行的右黑线有有效值。
// 2150         else if((row != (CameraHight-1))&&(BlackRightLoc[row+1][0] != MaxValUint8))
??CenterLineGet_8:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+49
        BEQ.W    ??CenterLineGet_10
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable25_11
        MLA      R1,R1,R5,R2
        LDRB     R1,[R1, #+3]
        CMP      R1,#+255
        BEQ.W    ??CenterLineGet_10
// 2151         { //前一行的中心线有效。
// 2152           if(CenterLineLoc[row+1] != MaxValUint8)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        ADDS     R1,R5,R1
        LDRB     R1,[R1, #+1]
        CMP      R1,#+255
        BEQ.N    ??CenterLineGet_11
// 2153           {
// 2154             CenterLineLoc[row] =  BoundaryLimitRe(CenterLineLoc[row+1] + tempr - BlackRightLoc[row+1][0], 0, CameraRealWidth - 1);
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R3,??DataTable25_12
        ADDS     R3,R5,R3
        LDRB     R3,[R3, #+1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTAB    R0,R0,R3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R3,#+3
        LDR.W    R6,??DataTable25_11
        MLA      R3,R3,R5,R6
        LDRB     R3,[R3, #+3]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2155           }
// 2156           //前一行的中心线无效。
// 2157           //如果是近处的行，那就有可能是270度左右黑线错位的情况。
// 2158           else if(row > CameraHight - 5)
??CenterLineGet_11:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+46
        BLT.N    ??CenterLineGet_12
// 2159           {
// 2160             if(CenterLocStore != MaxValUint8)
        LDR.W    R0,??DataTable25_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_13
// 2161             {
// 2162               CenterLineLoc[row] = BoundaryLimitRe(BlackRightLoc[row][0] - CenterLocStore, 0, CameraRealWidth - 1);
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R3,??DataTable25_11
        MLA      R0,R0,R5,R3
        LDRB     R0,[R0, #+0]
        LDR.W    R3,??DataTable25_13
        LDRB     R3,[R3, #+0]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2163             }
// 2164             else
// 2165             {
// 2166               CenterLineLoc[row] = BoundaryLimitRe(BlackRightLoc[row][0] - CenterLineHalfWidth[row], 0, CameraRealWidth - 1);
??CenterLineGet_13:
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R3,??DataTable25_11
        MLA      R0,R0,R5,R3
        LDRB     R0,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R3,??DataTable25_14
        LDRB     R3,[R5, R3]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2167             }
// 2168             //flag001 = 1; //flag001是标志位，用以防止开头几行的中心线不连续的情况。
// 2169           }
// 2170           else
// 2171           { //行数够低才处理，否则不考虑。
// 2172             if(row <= CameraHight - 3)
??CenterLineGet_12:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+48
        BGE.N    ??CenterLineGet_14
// 2173             { //找符合要求的行。
// 2174               for(i = 2; i <= 4; i++)
        MOVS     R6,#+2
        B.N      ??CenterLineGet_15
??CenterLineGet_16:
        ADDS     R6,R6,#+1
??CenterLineGet_15:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+5
        BGE.N    ??CenterLineGet_17
// 2175               {
// 2176                 if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackRightLoc[row+i][0] != MaxValUint8))
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R1,R6,R5
        LDR.W    R2,??DataTable25_12
        LDRB     R1,[R1, R2]
        CMP      R1,#+255
        BEQ.N    ??CenterLineGet_16
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R1,R6,R5
        MOVS     R2,#+3
        LDR.W    R3,??DataTable25_11
        MLA      R1,R2,R1,R3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??CenterLineGet_16
// 2177                 {
// 2178                    CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+i] + tempr - BlackRightLoc[row+i][0], 0, CameraRealWidth - 1); 
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R3,R6,R5
        LDR.W    R7,??DataTable25_12
        LDRB     R3,[R3, R7]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R0,R0,R3
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R3,R6,R5
        MOVS     R7,#+3
        LDR.W    R12,??DataTable25_11
        MLA      R3,R7,R3,R12
        LDRB     R3,[R3, #+0]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
// 2179                    break;
// 2180                 }
// 2181               }
// 2182               //没有找到符合要求的行。
// 2183               if(i == 5) CenterLineLoc[row] = MaxValUint8; //置无效值
??CenterLineGet_17:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+5
        BNE.W    ??CenterLineGet_6
        MOVS     R0,#+255
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2184             }        
// 2185             else
// 2186             {   //行数过高，不考虑这种情况。
// 2187                 CenterLineLoc[row] = MaxValUint8; //置无效值
??CenterLineGet_14:
        MOVS     R0,#+255
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2188             }
// 2189           }
// 2190         }
// 2191         else
// 2192         {
// 2193           CenterLineLoc[row] = MaxValUint8; //置无效值
??CenterLineGet_10:
        MOVS     R0,#+255
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2194         }
// 2195       }
// 2196       //该行右黑线提取失败，左黑线提取成功。
// 2197       else if((templ != MaxValUint8) && (tempr == MaxValUint8))
??CenterLineGet_7:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+255
        BEQ.W    ??CenterLineGet_18
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+255
        BNE.W    ??CenterLineGet_18
// 2198       {
// 2199         if(row == CameraHight - 1)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+49
        BNE.N    ??CenterLineGet_19
// 2200         {
// 2201             if(CenterLocStore != MaxValUint8)
        LDR.W    R0,??DataTable25_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_20
// 2202             {
// 2203               CenterLineLoc[row] = BoundaryLimitRe(BlackLeftLoc[row][0] + CenterLocStore, 0, CameraRealWidth - 1); 
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R3,??DataTable25_10
        MLA      R0,R0,R5,R3
        LDRB     R0,[R0, #+0]
        LDR.W    R3,??DataTable25_13
        LDRB     R3,[R3, #+0]
        ADDS     R0,R3,R0
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2204             }
// 2205             else
// 2206             {
// 2207               CenterLineLoc[row] = BoundaryLimitRe(BlackLeftLoc[row][0] + CenterLineHalfWidth[row], 0, CameraRealWidth - 1); 
??CenterLineGet_20:
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R3,??DataTable25_10
        MLA      R0,R0,R5,R3
        LDRB     R0,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R3,??DataTable25_14
        LDRB     R3,[R5, R3]
        ADDS     R0,R3,R0
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2208             }
// 2209         }
// 2210         //根据左线来估计中心线的走向，前提是上一行的左黑线有有效值。
// 2211         else if((row != CameraHight - 1)&&(BlackLeftLoc[row+1][0] != MaxValUint8))
??CenterLineGet_19:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+49
        BEQ.W    ??CenterLineGet_21
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable25_10
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+3]
        CMP      R0,#+255
        BEQ.W    ??CenterLineGet_21
// 2212         {  //上一行的中心线有效。
// 2213           if(CenterLineLoc[row+1] != MaxValUint8)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable25_12
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_22
// 2214           {
// 2215             CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row + 1] + templ - BlackLeftLoc[row+1][0], 0, CameraRealWidth - 1);
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable25_12
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTAB    R0,R3,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R3,#+3
        LDR.W    R6,??DataTable25_10
        MLA      R3,R3,R5,R6
        LDRB     R3,[R3, #+3]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2216           }
// 2217           //上一行的中心线无效。
// 2218           //如果是近处的行，那就有可能是270度左右黑线错位的情况。
// 2219           else if(row > CameraHight - 3)
??CenterLineGet_22:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+48
        BLT.N    ??CenterLineGet_23
// 2220           { 
// 2221             if(CenterLocStore != MaxValUint8)
        LDR.W    R0,??DataTable25_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_24
// 2222             {
// 2223               CenterLineLoc[row] = BoundaryLimitRe(BlackLeftLoc[row][0] + CenterLocStore, 0, CameraRealWidth - 1);
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R3,??DataTable25_10
        MLA      R0,R0,R5,R3
        LDRB     R0,[R0, #+0]
        LDR.W    R3,??DataTable25_13
        LDRB     R3,[R3, #+0]
        ADDS     R0,R3,R0
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2224             }
// 2225             else
// 2226             {
// 2227               CenterLineLoc[row] = BoundaryLimitRe(BlackLeftLoc[row][0] + CenterLineHalfWidth[row], 0, CameraRealWidth - 1);
??CenterLineGet_24:
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R3,??DataTable25_10
        MLA      R0,R0,R5,R3
        LDRB     R0,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R3,??DataTable25_14
        LDRB     R3,[R5, R3]
        ADDS     R0,R3,R0
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2228             }
// 2229             //flag001 = 1; //flag001是标志位，用以防止开头几行的中心线不连续的情况。
// 2230           }
// 2231           else
// 2232           { //找符合条件的行
// 2233             if(row <= CameraHight - 5)
??CenterLineGet_23:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+46
        BGE.N    ??CenterLineGet_25
// 2234             {
// 2235               for(i = 2; i <= 4; i++)
        MOVS     R6,#+2
        B.N      ??CenterLineGet_26
??CenterLineGet_27:
        ADDS     R6,R6,#+1
??CenterLineGet_26:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+5
        BGE.N    ??CenterLineGet_28
// 2236               {
// 2237                 if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackLeftLoc[row+i][0] != MaxValUint8))
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R0,R6,R5
        LDR.W    R1,??DataTable25_12
        LDRB     R0,[R0, R1]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_27
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R0,R6,R5
        MOVS     R1,#+3
        LDR.W    R2,??DataTable25_10
        MLA      R0,R1,R0,R2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_27
// 2238                 { //找到了符合条件的行。
// 2239                   CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+i] + templ - BlackLeftLoc[row+i][0], 0, CameraRealWidth - 1);
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R0,R6,R5
        LDR.W    R7,??DataTable25_12
        LDRB     R0,[R0, R7]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ADDS     R0,R3,R0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R3,R6,R5
        MOVS     R7,#+3
        LDR.W    R12,??DataTable25_10
        MLA      R3,R7,R3,R12
        LDRB     R3,[R3, #+0]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
// 2240                   break;
// 2241                 }
// 2242               }
// 2243               if(i == 5) CenterLineLoc[row] = MaxValUint8; ////置无效值
??CenterLineGet_28:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+5
        BNE.N    ??CenterLineGet_6
        MOVS     R0,#+255
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2244             }
// 2245             else
// 2246             { //行数太高，不考虑这种情况。 
// 2247               CenterLineLoc[row] = MaxValUint8; //置无效值
??CenterLineGet_25:
        MOVS     R0,#+255
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2248             }
// 2249           }
// 2250         }
// 2251         else
// 2252         {
// 2253           CenterLineLoc[row] = MaxValUint8; //置无效值
??CenterLineGet_21:
        MOVS     R0,#+255
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_6
// 2254         }
// 2255       }
// 2256       //该行左右线均提取失败。
// 2257       else 
// 2258       {
// 2259         CenterLineLoc[row] = MaxValUint8; //置无效值
??CenterLineGet_18:
        MOVS     R0,#+255
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
// 2260       }
// 2261     if(CenterLineLoc[row] == MaxValUint8) 
??CenterLineGet_6:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable25_12
        LDRB     R0,[R5, R0]
        CMP      R0,#+255
        BNE.N    ??CenterLineGet_29
// 2262     {
// 2263       FailCount++;
        ADDS     R4,R4,#+1
// 2264       //对无效值的再处理。
// 2265       tempmax = MinRe(BlackLeftHeadLine, BlackRightHeadLine);
        LDR.W    R0,??DataTable26
        LDRB     R1,[R0, #+0]
        LDR.W    R0,??DataTable26_1
        LDRB     R0,[R0, #+0]
        BL       MinRe
// 2266       if(row <= CameraHight-3 && CenterLineLoc[row+1] != MaxValUint8 && CenterLineLoc[row+2] != MaxValUint8)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+48
        BGE.N    ??CenterLineGet_29
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        ADDS     R1,R5,R1
        LDRB     R1,[R1, #+1]
        CMP      R1,#+255
        BEQ.N    ??CenterLineGet_29
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        ADDS     R1,R5,R1
        LDRB     R1,[R1, #+2]
        CMP      R1,#+255
        BEQ.N    ??CenterLineGet_29
// 2267       {
// 2268         if(row >= tempmax)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R5,R0
        BCC.N    ??CenterLineGet_29
// 2269         {
// 2270           if(CenterLineLoc[row+1] + CenterLineLoc[row+1] - CenterLineLoc[row+2] < 0
// 2271            ||CenterLineLoc[row+1] + CenterLineLoc[row+1] - CenterLineLoc[row+2] > CameraRealWidth - 1)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable25_12
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        ADDS     R1,R5,R1
        LDRB     R1,[R1, #+1]
        UXTAB    R0,R1,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        ADDS     R1,R5,R1
        LDRB     R1,[R1, #+2]
        SUBS     R0,R0,R1
        SUBS     R0,R0,#+0
        CMP      R0,#+250
        BCS.N    ??CenterLineGet_29
// 2272           {           
// 2273           }
// 2274           else
// 2275           {
// 2276             //条件均满足
// 2277             CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+1] + CenterLineLoc[row+1] - CenterLineLoc[row+2], 0, CameraRealWidth - 1);
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable25_12
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R3,??DataTable25_12
        ADDS     R3,R5,R3
        LDRB     R3,[R3, #+1]
        UXTAB    R0,R3,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R3,??DataTable25_12
        ADDS     R3,R5,R3
        LDRB     R3,[R3, #+2]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
// 2278           }
// 2279         }
// 2280         else
// 2281         {
// 2282         }
// 2283       }
// 2284       else
// 2285       {
// 2286       }
// 2287     }
// 2288     if(row == 0) break;
??CenterLineGet_29:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.W    ??CenterLineGet_4
// 2289     }// end of for 
// 2290     
// 2291     if(FailCount >= CameraHight) return 0;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+50
        BLT.N    ??CenterLineGet_30
        MOVS     R0,#+0
        B.N      ??CenterLineGet_1
// 2292     //中心线提取成功，记录线头，作为后面的单线线头。
// 2293     if(row == 0) 
??CenterLineGet_30:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??CenterLineGet_2
// 2294     {
// 2295       for(j = CameraHight - 1; ; j--)
        MOVS     R0,#+49
        B.N      ??CenterLineGet_31
??CenterLineGet_32:
        SUBS     R0,R0,#+1
// 2296       { //最近的3行找线头。
// 2297         if(CenterLineLoc[j] != MaxValUint8 && BlackLeftLoc[j][0] != MaxValUint8 && BlackRightLoc[j][0] != MaxValUint8)
??CenterLineGet_31:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable25_12
        LDRB     R1,[R0, R1]
        CMP      R1,#+255
        BEQ.N    ??CenterLineGet_33
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable25_10
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??CenterLineGet_33
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable25_11
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??CenterLineGet_33
// 2298         {
// 2299           CenterLocStore = (BlackRightLoc[j][0] - BlackLeftLoc[j][0]) / 2;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable25_11
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable25_10
        MLA      R0,R2,R0,R3
        LDRB     R0,[R0, #+0]
        SUBS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        LDR.W    R1,??DataTable25_13
        STRB     R0,[R1, #+0]
// 2300           break;
        B.N      ??CenterLineGet_34
// 2301         }
// 2302         if(j <= CameraHight - 4)
??CenterLineGet_33:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+47
        BGE.N    ??CenterLineGet_32
// 2303         {
// 2304           //CenterLocStore = MaxValUint8;
// 2305           break;
// 2306         }
// 2307       }
// 2308       return 1;
??CenterLineGet_34:
        MOVS     R0,#+1
        B.N      ??CenterLineGet_1
// 2309     }
// 2310   } // end of if
// 2311   
// 2312   //左黑线提取成功，右黑线提取失败。就基本上按左线来估计中心线。
// 2313   if((BlackLeftDone == 1) && (BlackRightDone == 0))
??CenterLineGet_2:
        LDR.W    R0,??DataTable25_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??CenterLineGet_35
        LDR.W    R0,??DataTable25_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.W    ??CenterLineGet_35
// 2314   {
// 2315     for(row = CameraHight - 1; row > CameraHight - BlackStep1Size; row --)
        MOVS     R5,#+49
        B.N      ??CenterLineGet_36
// 2316     {
// 2317       //找左线有效值。 //原为连续两行找有效值，现改为一行。
// 2318       if(BlackLeftLoc[row][0] != MaxValUint8)
// 2319       {
// 2320         if(CenterLocStore != MaxValUint8)
// 2321         {
// 2322           CenterLineLoc[row] = BoundaryLimitRe(BlackLeftLoc[row][0] + CenterLocStore, 0, CameraRealWidth - 1);
// 2323         }
// 2324         else
// 2325         {
// 2326           CenterLineLoc[row] = BoundaryLimitRe(BlackLeftLoc[row][0] + CenterLineHalfWidth[row], 0, CameraRealWidth - 1);
// 2327         }
// 2328         break;
// 2329       }
// 2330       else
// 2331       {
// 2332         CenterLineLoc[row] = MaxValUint8;
??CenterLineGet_37:
        MOVS     R0,#+255
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
// 2333       }
        SUBS     R5,R5,#+1
??CenterLineGet_36:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+26
        BLT.N    ??CenterLineGet_38
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable25_10
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_37
        LDR.W    R0,??DataTable25_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_39
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R3,??DataTable25_10
        MLA      R0,R0,R5,R3
        LDRB     R0,[R0, #+0]
        LDR.W    R3,??DataTable25_13
        LDRB     R3,[R3, #+0]
        ADDS     R0,R3,R0
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_40
??CenterLineGet_39:
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R3,??DataTable25_10
        MLA      R0,R0,R5,R3
        LDRB     R0,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R3,??DataTable25_14
        LDRB     R3,[R5, R3]
        ADDS     R0,R3,R0
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
// 2334     }
// 2335     //中心线提取失败。
// 2336     if(row <= CameraHight - BlackStep1Size) return 0;
??CenterLineGet_40:
??CenterLineGet_38:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+26
        BGE.N    ??CenterLineGet_41
        MOVS     R0,#+0
        B.N      ??CenterLineGet_1
// 2337     
// 2338     //按照左线的趋势进行中心线的估计。
// 2339     for(row --; ; row--)
??CenterLineGet_41:
        SUBS     R5,R5,#+1
        B.N      ??CenterLineGet_42
??CenterLineGet_43:
        SUBS     R5,R5,#+1
// 2340     {
// 2341       if(BlackLeftLoc[row][0] != MaxValUint8)
??CenterLineGet_42:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable25_10
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_44
// 2342       {   //上一行的中心线有效。
// 2343           if(CenterLineLoc[row+1] != MaxValUint8)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable25_12
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_45
// 2344           {
// 2345             CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row + 1] + BlackLeftLoc[row][0] - BlackLeftLoc[row+1][0], 0, CameraRealWidth - 1);
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable25_12
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R3,#+3
        LDR.W    R4,??DataTable25_10
        MLA      R3,R3,R5,R4
        LDRB     R3,[R3, #+0]
        UXTAB    R0,R3,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R3,#+3
        LDR.W    R4,??DataTable25_10
        MLA      R3,R3,R5,R4
        LDRB     R3,[R3, #+3]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_46
// 2346           }
// 2347           //上一行的中心线无效。
// 2348           else
// 2349           { //找符合条件的行
// 2350             if(row <= CameraHight - 5)
??CenterLineGet_45:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+46
        BGE.N    ??CenterLineGet_47
// 2351             {
// 2352               for(i = 2; i <= 4; i++)
        MOVS     R6,#+2
        B.N      ??CenterLineGet_48
??CenterLineGet_49:
        ADDS     R6,R6,#+1
??CenterLineGet_48:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+5
        BGE.N    ??CenterLineGet_50
// 2353               {
// 2354                 if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackLeftLoc[row+i][0] != MaxValUint8))
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R0,R6,R5
        LDR.W    R1,??DataTable25_12
        LDRB     R0,[R0, R1]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_49
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R0,R6,R5
        MOVS     R1,#+3
        LDR.W    R2,??DataTable25_10
        MLA      R0,R1,R0,R2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_49
// 2355                 { //找到了符合条件的行。
// 2356                   CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+i] + BlackLeftLoc[row][0] - BlackLeftLoc[row+i][0], 0, CameraRealWidth - 1);
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R0,R6,R5
        LDR.W    R3,??DataTable25_12
        LDRB     R0,[R0, R3]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R3,#+3
        LDR.W    R4,??DataTable25_10
        MLA      R3,R3,R5,R4
        LDRB     R3,[R3, #+0]
        ADDS     R0,R3,R0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R3,R6,R5
        MOVS     R4,#+3
        LDR.W    R7,??DataTable25_10
        MLA      R3,R4,R3,R7
        LDRB     R3,[R3, #+0]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
// 2357                   break;
// 2358                 }
// 2359               }
// 2360               if(i == 5) CenterLineLoc[row] = MaxValUint8; ////置无效值
??CenterLineGet_50:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+5
        BNE.N    ??CenterLineGet_46
        MOVS     R0,#+255
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_46
// 2361             }
// 2362             else
// 2363             { //行数太高，不考虑这种情况。 
// 2364               CenterLineLoc[row] = MaxValUint8; //置无效值
??CenterLineGet_47:
        MOVS     R0,#+255
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_46
// 2365             }
// 2366           }
// 2367       }
// 2368       else
// 2369       {
// 2370         CenterLineLoc[row] = MaxValUint8; //置无效值  
??CenterLineGet_44:
        MOVS     R0,#+255
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
// 2371       }
// 2372       
// 2373       if(row == 0) break;
??CenterLineGet_46:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.W    ??CenterLineGet_43
// 2374     }       
// 2375     if(row == 0) return 1;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??CenterLineGet_35
        MOVS     R0,#+1
        B.N      ??CenterLineGet_1
// 2376   } // end of if
// 2377   
// 2378   //右黑线提取成功，左黑线提取失败。就基本上按右线来估计中心线。
// 2379   if((BlackLeftDone == 0) && (BlackRightDone == 1))
??CenterLineGet_35:
        LDR.W    R0,??DataTable25_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.W    ??CenterLineGet_51
        LDR.W    R0,??DataTable25_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??CenterLineGet_51
// 2380   {
// 2381     //找中心线的线头。
// 2382     for(row = CameraHight - 1; row > CameraHight - BlackStep1Size; row --)
        MOVS     R5,#+49
        B.N      ??CenterLineGet_52
// 2383     {
// 2384       //找右线有效值。 //原为连续两行找有效值，现改为一行。
// 2385       if(BlackRightLoc[row][0] != MaxValUint8)
// 2386       {
// 2387         if(CenterLocStore != MaxValUint8)
// 2388         {
// 2389           CenterLineLoc[row] = BoundaryLimitRe(BlackRightLoc[row][0] - CenterLocStore, 0, CameraRealWidth - 1);
// 2390         }
// 2391         else
// 2392         {
// 2393           CenterLineLoc[row] = BoundaryLimitRe(BlackRightLoc[row][0] - CenterLineHalfWidth[row], 0, CameraRealWidth - 1);
// 2394         }
// 2395         break;
// 2396       }
// 2397       else
// 2398       {
// 2399         CenterLineLoc[row] = MaxValUint8;
??CenterLineGet_53:
        MOVS     R0,#+255
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
// 2400       }
        SUBS     R5,R5,#+1
??CenterLineGet_52:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+26
        BLT.N    ??CenterLineGet_54
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R1,??DataTable25_11
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_53
        LDR.W    R0,??DataTable25_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_55
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R3,??DataTable25_11
        MLA      R0,R0,R5,R3
        LDRB     R0,[R0, #+0]
        LDR.W    R3,??DataTable25_13
        LDRB     R3,[R3, #+0]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_56
??CenterLineGet_55:
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.W    R3,??DataTable25_11
        MLA      R0,R0,R5,R3
        LDRB     R0,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R3,??DataTable25_14
        LDRB     R3,[R5, R3]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable25_12
        STRB     R0,[R5, R1]
// 2401     }
// 2402     //没有找到中心线线头，中心线提取失败。
// 2403     if(row <= CameraHight - BlackStep1Size) return 0;
??CenterLineGet_56:
??CenterLineGet_54:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+26
        BGE.N    ??CenterLineGet_57
        MOVS     R0,#+0
        B.N      ??CenterLineGet_1
// 2404     
// 2405     //找到线头，按照左线的趋势进行中心线的估计。
// 2406     for(row--; ; row--)
??CenterLineGet_57:
        SUBS     R5,R5,#+1
        B.N      ??CenterLineGet_58
??CenterLineGet_59:
        SUBS     R5,R5,#+1
// 2407     {
// 2408       if(BlackRightLoc[row][0] != MaxValUint8)
??CenterLineGet_58:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+3
        LDR.N    R1,??DataTable25_11
        MLA      R0,R0,R5,R1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_60
// 2409       {
// 2410         //前一行的中心点有效的情况。
// 2411         if(CenterLineLoc[row+1] != MaxValUint8)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R0,??DataTable25_12
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_61
// 2412         {
// 2413           CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+1] + BlackRightLoc[row][0] - BlackRightLoc[row+1][0], 0, CameraRealWidth - 1);
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R0,??DataTable25_12
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R3,#+3
        LDR.N    R4,??DataTable25_11
        MLA      R3,R3,R5,R4
        LDRB     R3,[R3, #+0]
        UXTAB    R0,R3,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R3,#+3
        LDR.N    R4,??DataTable25_11
        MLA      R3,R3,R5,R4
        LDRB     R3,[R3, #+3]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_62
// 2414         }
// 2415         //前一行的中心点无效的情况。
// 2416         else
// 2417         { //首先行数要够小。
// 2418           if(row <= CameraHight - 5)
??CenterLineGet_61:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+46
        BGE.N    ??CenterLineGet_63
// 2419           { //查找是否有中心线有效的行。
// 2420             for(i = 2; i <= 4; i++)
        MOVS     R6,#+2
        B.N      ??CenterLineGet_64
??CenterLineGet_65:
        ADDS     R6,R6,#+1
??CenterLineGet_64:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+5
        BGE.N    ??CenterLineGet_66
// 2421             {
// 2422               if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackRightLoc[row+i][0] != MaxValUint8))
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R0,R6,R5
        LDR.N    R1,??DataTable25_12
        LDRB     R0,[R0, R1]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_65
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R0,R6,R5
        MOVS     R1,#+3
        LDR.N    R2,??DataTable25_11
        MLA      R0,R1,R0,R2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGet_65
// 2423               {
// 2424                 CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+i] + BlackRightLoc[row][0] - BlackRightLoc[row+i][0], 0, CameraRealWidth - 1);
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R0,R6,R5
        LDR.N    R3,??DataTable25_12
        LDRB     R0,[R0, R3]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R3,#+3
        LDR.N    R4,??DataTable25_11
        MLA      R3,R3,R5,R4
        LDRB     R3,[R3, #+0]
        ADDS     R0,R3,R0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTAB    R3,R6,R5
        MOVS     R4,#+3
        LDR.N    R7,??DataTable25_11
        MLA      R3,R4,R3,R7
        LDRB     R3,[R3, #+0]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R1,??DataTable25_12
        STRB     R0,[R5, R1]
// 2425                 break;
// 2426               }
// 2427             }
// 2428             //连续3行没找到符合要求的行，置无效值。
// 2429             if(i == 5) CenterLineLoc[row] = MaxValUint8; 
??CenterLineGet_66:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+5
        BNE.N    ??CenterLineGet_62
        MOVS     R0,#+255
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_62
// 2430           }
// 2431           //行数太高，处理不了。
// 2432           else
// 2433           {
// 2434             CenterLineLoc[row] = MaxValUint8; //置无效值  
??CenterLineGet_63:
        MOVS     R0,#+255
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R1,??DataTable25_12
        STRB     R0,[R5, R1]
        B.N      ??CenterLineGet_62
// 2435           }
// 2436         }
// 2437       }
// 2438       else
// 2439       {
// 2440         CenterLineLoc[row] = MaxValUint8; //置无效值  
??CenterLineGet_60:
        MOVS     R0,#+255
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R1,??DataTable25_12
        STRB     R0,[R5, R1]
// 2441       }
// 2442       
// 2443       if(row == 0) break;
??CenterLineGet_62:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??CenterLineGet_59
// 2444     }       
// 2445     if(row == 0) return 1;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??CenterLineGet_51
        MOVS     R0,#+1
        B.N      ??CenterLineGet_1
// 2446   } // end of if
// 2447   
// 2448   return 0; 
??CenterLineGet_51:
        MOVS     R0,#+0
??CenterLineGet_1:
        POP      {R1,R4-R7,PC}    ;; return
// 2449 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22:
        DC32     0x437a0001
// 2450 
// 2451 //中心线补充处理，若到不了第25行，就补到第25行。超过250就置成250。

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2452 uint8 CenterLineGetCom(void)
// 2453 {
CenterLineGetCom:
        PUSH     {R4,LR}
// 2454   uint8 row;
// 2455   
// 2456   for(row = 0; ; row++)
        MOVS     R4,#+0
        B.N      ??CenterLineGetCom_0
??CenterLineGetCom_1:
        ADDS     R4,R4,#+1
// 2457   {
// 2458     if(CenterLineLoc[row] != MaxValUint8)
??CenterLineGetCom_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable25_12
        LDRB     R0,[R4, R0]
        CMP      R0,#+255
        BEQ.N    ??CenterLineGetCom_1
// 2459     {
// 2460       if(row < CenterKeyLine)
        LDR.W    R0,??DataTable29
        LDRB     R0,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,R0
        BCS.N    ??CenterLineGetCom_2
// 2461       {
// 2462         break;
        B.N      ??CenterLineGetCom_3
// 2463       }
// 2464       else
// 2465       {
// 2466         for(; ; row--)
??CenterLineGetCom_4:
        SUBS     R4,R4,#+1
// 2467         {
// 2468           CenterLineLoc[row-1] = BoundaryLimitRe(CenterLineLoc[row] + CenterLineLoc[row] - CenterLineLoc[row+1], 0, CameraRealWidth - 1);
??CenterLineGetCom_2:
        MOVS     R2,#+249
        MOVS     R1,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable25_12
        LDRB     R0,[R4, R0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R3,??DataTable25_12
        LDRB     R3,[R4, R3]
        ADDS     R0,R3,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R3,??DataTable25_12
        ADDS     R3,R4,R3
        LDRB     R3,[R3, #+1]
        SUBS     R0,R0,R3
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       BoundaryLimitRe
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R1,??DataTable25_12
        ADDS     R1,R4,R1
        STRB     R0,[R1, #-1]
// 2469           if(row <= CenterKeyLine) break;          
        LDR.W    R0,??DataTable29
        LDRB     R0,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R0,R4
        BCC.N    ??CenterLineGetCom_4
// 2470         }
// 2471         break;
// 2472       }
// 2473     }
// 2474   }
// 2475   
// 2476   return 1;
??CenterLineGetCom_3:
        MOVS     R0,#+1
        POP      {R4,PC}          ;; return
// 2477 }
// 2478 
// 2479 
// 2480 
// 2481 
// 2482 
// 2483 //图像重新赋值,行不变（行中DMA中变化，选取需要的行），列无法在DMA中变化，就在这里变化。

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2484 void ImgPut(void)
// 2485 {
ImgPut:
        PUSH     {R4-R7}
// 2486     uint16 i, j, k, temp1, temp2;   
// 2487     
// 2488     temp1 = CameraWidth/2 - CameraRealWidth/2 - 1;
        MOVS     R3,#+34
// 2489     temp2 = CameraWidth/2 + CameraRealWidth/2 - 1;
        MOV      R4,#+284
// 2490     
// 2491     for(i = 0; i < CameraHight; i++)
        MOVS     R0,#+0
        B.N      ??ImgPut_0
// 2492     {
// 2493       k = 0;
// 2494       for(j = temp1; j < temp2; j++)
// 2495       {
// 2496         ImgNew[i][k] = ImgRaw[i][j];
??ImgPut_1:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R5,#+250
        LDR.W    R6,??DataTable29_1
        MLA      R5,R5,R0,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOV      R6,#+320
        LDR.W    R7,??DataTable29_2
        MLA      R6,R6,R0,R7
        LDRB     R6,[R1, R6]
        STRB     R6,[R2, R5]
// 2497         k++;
        ADDS     R2,R2,#+1
// 2498       }
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
        BGE.N    ??ImgPut_3
        MOVS     R2,#+0
        MOVS     R1,R3
        B.N      ??ImgPut_2
// 2499     }
// 2500 }
??ImgPut_3:
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24:
        DC32     BlackRightCrossDone
// 2501 
// 2502 
// 2503 //开根号运算
// 2504 //本来传进来传出去都是uint16型的，但是我调用的时候只会用到uint8型的，且不会超出255.

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2505 uint16 MathSqrt(uint16 x1)
// 2506 {
// 2507   uint8 ans = 0, p = 0x80;
MathSqrt:
        MOVS     R1,#+0
        MOVS     R2,#+128
// 2508   uint16 x = x1;
        B.N      ??MathSqrt_0
// 2509   
// 2510   while(p!=0)
// 2511   {
// 2512     ans += p;
??MathSqrt_1:
        ADDS     R1,R2,R1
// 2513     if(ans * ans > x) ans -=p;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MUL      R3,R1,R1
        CMP      R0,R3
        BGE.N    ??MathSqrt_2
        SUBS     R1,R1,R2
// 2514     p = (uint8)(p / 2);
??MathSqrt_2:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R3,#+2
        SDIV     R2,R2,R3
// 2515   }
??MathSqrt_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BNE.N    ??MathSqrt_1
// 2516   return ans;  
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
// 2517 }
// 2518 
// 2519 //曲线的曲率求取，曲线向右拐（三点为顺时针方向分布），曲率为负，曲线向左拐（三点为逆时钟方向分布），曲率为正
// 2520 //K = 4*SABC/AB/BC/AC

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2521 int16 CurveGet(uint8 AX, uint8 AY, uint8 BX, uint8 BY, uint8 CX, uint8 CY)
// 2522 {
CurveGet:
        PUSH     {R3-R11,LR}
        MOV      R9,R0
        MOV      R10,R1
        MOV      R8,R2
        MOV      R11,R3
        LDR      R4,[SP, #+40]
        LDR      R5,[SP, #+44]
// 2523   int16 SABC_temp; //三角形的面积，有正负。
// 2524   int16 tempab, tempbc, tempac;
// 2525   int16 AB, BC, AC; //三角形的边长，均为正。
// 2526   //int16 K;        //曲率结果，有正负。
// 2527   
// 2528   SABC_temp = ((BX - AX) * (CY - AY) - (CX - AX) * (BY - AY));
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
// 2529   
// 2530   tempab = (BX - AX) * (BX - AX) + (BY - AY) * (BY - AY);
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
// 2531   if(tempab > 100) 
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        CMP      R0,#+101
        BLT.N    ??CurveGet_0
// 2532   {
// 2533     AB = MathSqrt(tempab / 100) * 10; //失掉两位的精度，因为求根运算范围的限制。
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       MathSqrt
        MOVS     R1,#+10
        SMULBB   R7,R0,R1
        B.N      ??CurveGet_1
// 2534   }
// 2535   else
// 2536   {
// 2537     AB = MathSqrt(tempab);
??CurveGet_0:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       MathSqrt
        MOVS     R7,R0
// 2538   }
// 2539   
// 2540   tempbc = (BX - CX) * (BX - CX) + (BY - CY) * (BY - CY);
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
// 2541   if(tempbc > 100) 
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        CMP      R0,#+101
        BLT.N    ??CurveGet_2
// 2542   {
// 2543     BC = MathSqrt(tempbc / 100) * 10; //失掉两位的精度，因为求根运算范围的限制。
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       MathSqrt
        MOVS     R1,#+10
        SMULBB   R8,R0,R1
        B.N      ??CurveGet_3
// 2544   }
// 2545   else
// 2546   {
// 2547     BC = MathSqrt(tempbc);
??CurveGet_2:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       MathSqrt
        MOV      R8,R0
// 2548   }
// 2549   
// 2550   tempac = (CX - AX) * (CX - AX) + (CY - AY) * (CY - AY);
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
// 2551   if(tempac > 100) 
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        CMP      R0,#+101
        BLT.N    ??CurveGet_4
// 2552   {
// 2553     AC = MathSqrt(tempac / 100) * 10; //失掉两位的精度，因为求根运算范围的限制。
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       MathSqrt
        MOVS     R1,#+10
        SMULBB   R0,R0,R1
        B.N      ??CurveGet_5
// 2554   }
// 2555   else
// 2556   {
// 2557     AC = MathSqrt(tempac);
??CurveGet_4:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       MathSqrt
// 2558   }
// 2559   
// 2560   return (CurveGetCompen * SABC_temp / AB / BC / AC);
??CurveGet_5:
        LDR.W    R1,??DataTable29_3
        LDRSH    R1,[R1, #+0]
        SMULBB   R1,R1,R6
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        SDIV     R1,R1,R7
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        SDIV     R1,R1,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        SDIV     R0,R1,R0
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        POP      {R1,R4-R11,PC}   ;; return
// 2561 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     BlackRightCrossTooLowLine

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_1:
        DC32     BlackLeftDone

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_2:
        DC32     BlackRightDone

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_3:
        DC32     LimitLeftWB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_4:
        DC32     LimitLeftW

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_5:
        DC32     LimitLeftB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_6:
        DC32     BlackLeft3ResetCount

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_7:
        DC32     LimitRightWB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_8:
        DC32     LimitRightW

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_9:
        DC32     BlackRight3ResetCount

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_10:
        DC32     BlackLeftLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_11:
        DC32     BlackRightLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_12:
        DC32     CenterLineLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_13:
        DC32     CenterLocStore

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_14:
        DC32     CenterLineHalfWidth
// 2562 
// 2563 
// 2564 
// 2565 //SABC的面积求取，顺时针则返回负值，逆时针则返回正值。
// 2566 //以左下角为原点，向右为x轴正方向(0~249)，向上为y轴正方向(0~49)。

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2567 int16 SABCGet(uint8 x1, uint8 y1, uint8 x2, uint8 y2, uint8 x3, uint8 y3)
// 2568 {
SABCGet:
        PUSH     {R4}
// 2569   int16 SABC_temp;
// 2570   
// 2571   SABC_temp = ((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1)) / 2;
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        SUBS     R4,R2,R0
        LDR      R2,[SP, #+8]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R2,R2,R1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R3,R3,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R1,[SP, #+4]
        SUBS     R0,R0,R1
        MUL      R0,R0,R3
        MLA      R0,R2,R4,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
// 2572   
// 2573   return SABC_temp;
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        POP      {R4}
        BX       LR               ;; return
// 2574 }
// 2575 
// 2576 
// 2577 //曲率符号求取
// 2578 //影响：CurveSL, CurveSC, CurveSR, 0无效，1正，2负
// 2579 //      SABCL, SABCC, SABCR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2580 uint8 CurveSignGet(void)
// 2581 {
CurveSignGet:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
// 2582   uint8 row;
// 2583   uint8 temp;
// 2584   
// 2585   //1. 中心线曲率符号求取
// 2586   //曲率符号预先清零。
// 2587   CurveLineChosenC1 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_4
        STRB     R0,[R1, #+0]
// 2588   CurveLineChosenC2 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_5
        STRB     R0,[R1, #+0]
// 2589   CurveLineChosenC3 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_6
        STRB     R0,[R1, #+0]
// 2590   
// 2591   //曲率基于的行1 CurveLineChosen1，从上到下取第一个有效值。
// 2592   for(row = 0; ; row++)
        MOVS     R0,#+0
        B.N      ??CurveSignGet_0
??CurveSignGet_1:
        ADDS     R0,R0,#+1
// 2593   {
// 2594     if(row >= CameraHight - 2) 
??CurveSignGet_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+48
        BLT.N    ??CurveSignGet_2
// 2595     {
// 2596       CurveLineChosenC1 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_4
        STRB     R0,[R1, #+0]
// 2597       return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2598     }
// 2599     if(CenterLineLoc[row] != MaxValUint8)
??CurveSignGet_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable29_7
        LDRB     R1,[R0, R1]
        CMP      R1,#+255
        BEQ.N    ??CurveSignGet_1
// 2600     {
// 2601       CurveLineChosenC1 = row;
        LDR.W    R1,??DataTable29_4
        STRB     R0,[R1, #+0]
// 2602       break;
// 2603     }   
// 2604   }
// 2605   //把第1个有效值到CameraHight-1的距离分成2段。
// 2606   temp = (CameraHight - 1 - row) / 2;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        RSBS     R0,R0,#+49
        MOVS     R1,#+2
        SDIV     R1,R0,R1
// 2607   if(temp == 0) 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??CurveSignGet_4
// 2608   {
// 2609     CurveLineChosenC1 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_4
        STRB     R0,[R1, #+0]
// 2610     return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2611   }
// 2612   
// 2613   //曲率基于的行2 CurveLineChosen2
// 2614   for(row = CurveLineChosenC1 + temp; ; row++)
??CurveSignGet_4:
        LDR.W    R0,??DataTable29_4
        LDRB     R0,[R0, #+0]
        ADDS     R0,R1,R0
        B.N      ??CurveSignGet_5
??CurveSignGet_6:
        ADDS     R0,R0,#+1
// 2615   {
// 2616     if(row >= CameraHight - 1) 
??CurveSignGet_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BLT.N    ??CurveSignGet_7
// 2617     {
// 2618       CurveLineChosenC1 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_4
        STRB     R0,[R1, #+0]
// 2619       CurveLineChosenC2 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_5
        STRB     R0,[R1, #+0]
// 2620       return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2621     }
// 2622     if(CenterLineLoc[row] != MaxValUint8)
??CurveSignGet_7:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable29_7
        LDRB     R2,[R0, R2]
        CMP      R2,#+255
        BEQ.N    ??CurveSignGet_6
// 2623     {
// 2624       CurveLineChosenC2 = row;
        LDR.W    R2,??DataTable29_5
        STRB     R0,[R2, #+0]
// 2625       break;
// 2626     }
// 2627   }
// 2628   
// 2629   //曲率基于的行3 CurveLineChosen3
// 2630   for(row = CurveLineChosenC2 + temp; ; row++)
        LDR.W    R0,??DataTable29_5
        LDRB     R0,[R0, #+0]
        ADDS     R0,R1,R0
        B.N      ??CurveSignGet_8
??CurveSignGet_9:
        ADDS     R0,R0,#+1
// 2631   {
// 2632     if(row >= CameraHight) 
??CurveSignGet_8:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+50
        BLT.N    ??CurveSignGet_10
// 2633     {
// 2634       CurveLineChosenC1 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_4
        STRB     R0,[R1, #+0]
// 2635       CurveLineChosenC2 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_5
        STRB     R0,[R1, #+0]
// 2636       CurveLineChosenC3 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_6
        STRB     R0,[R1, #+0]
// 2637       return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2638     }
// 2639     if(CenterLineLoc[row] != MaxValUint8)
??CurveSignGet_10:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable29_7
        LDRB     R1,[R0, R1]
        CMP      R1,#+255
        BEQ.N    ??CurveSignGet_9
// 2640     {
// 2641       CurveLineChosenC3 = row;
        LDR.W    R1,??DataTable29_6
        STRB     R0,[R1, #+0]
// 2642       break;
// 2643     }
// 2644   } 
// 2645   //SABCC中心线曲率三角形面积的求取
// 2646   //SABCC = SABCGet(CenterLineLoc[CurveLineChosenC1], CameraHight - 1 - CurveLineChosenC1,
// 2647   //                CenterLineLoc[CurveLineChosenC2], CameraHight - 1 - CurveLineChosenC2,
// 2648   //                CenterLineLoc[CurveLineChosenC3], CameraHight - 1 - CurveLineChosenC3
// 2649   //                );
// 2650   CURVEC = CurveGet(CenterLineLoc[CurveLineChosenC1], CameraHight - 1 - CurveLineChosenC1,
// 2651                    CenterLineLoc[CurveLineChosenC2], CameraHight - 1 - CurveLineChosenC2,
// 2652                    CenterLineLoc[CurveLineChosenC3], CameraHight - 1 - CurveLineChosenC3
// 2653                    );    
        LDR.W    R0,??DataTable29_6
        LDRB     R0,[R0, #+0]
        RSBS     R0,R0,#+49
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[SP, #+4]
        LDR.W    R0,??DataTable29_6
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable29_7
        LDRB     R0,[R0, R1]
        STR      R0,[SP, #+0]
        LDR.W    R0,??DataTable29_5
        LDRB     R0,[R0, #+0]
        RSBS     R3,R0,#+49
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDR.W    R0,??DataTable29_5
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable29_7
        LDRB     R2,[R0, R1]
        LDR.W    R0,??DataTable29_4
        LDRB     R0,[R0, #+0]
        RSBS     R1,R0,#+49
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.W    R0,??DataTable29_4
        LDRB     R0,[R0, #+0]
        LDR.W    R4,??DataTable29_7
        LDRB     R0,[R0, R4]
        BL       CurveGet
        LDR.W    R1,??DataTable29_8
        STRH     R0,[R1, #+0]
// 2654   
// 2655   
// 2656   //左右黑线有可能只有一边提取成功，若不成功，就不用费时间了。
// 2657   if(BlackLeftDone == 1)
        LDR.W    R0,??DataTable29_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??CurveSignGet_11
// 2658   {
// 2659     //2. 左黑线曲率符号求取
// 2660     //曲率符号预先清零。
// 2661     CurveLineChosenL1 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_10
        STRB     R0,[R1, #+0]
// 2662     CurveLineChosenL2 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_11
        STRB     R0,[R1, #+0]
// 2663     CurveLineChosenL3 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_12
        STRB     R0,[R1, #+0]
// 2664     
// 2665     //曲率基于的行1 CurveLineChosen1，从上到下取第一个有效值。
// 2666     for(row = 0; ; row++)
        MOVS     R0,#+0
        B.N      ??CurveSignGet_12
??CurveSignGet_13:
        ADDS     R0,R0,#+1
// 2667     {
// 2668       if(row >= CameraHight - 2) 
??CurveSignGet_12:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+48
        BLT.N    ??CurveSignGet_14
// 2669       {
// 2670         CurveLineChosenL1 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_10
        STRB     R0,[R1, #+0]
// 2671         return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2672       }
// 2673       if(BlackLeftLoc[row][0] != MaxValUint8)
??CurveSignGet_14:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable29_13
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??CurveSignGet_13
// 2674       {
// 2675         CurveLineChosenL1 = row;
        LDR.W    R1,??DataTable29_10
        STRB     R0,[R1, #+0]
// 2676         break;
// 2677       }   
// 2678     }
// 2679     //把第1个有效值到CameraHight-1的距离分成2段。
// 2680     temp = (CameraHight - 1 - row) / 2;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        RSBS     R0,R0,#+49
        MOVS     R1,#+2
        SDIV     R1,R0,R1
// 2681     if(temp == 0) 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??CurveSignGet_15
// 2682     {
// 2683       CurveLineChosenL1 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_10
        STRB     R0,[R1, #+0]
// 2684       return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2685     }
// 2686     
// 2687     //曲率基于的行2 CurveLineChosen2
// 2688     for(row = CurveLineChosenL1 + temp; ; row++)
??CurveSignGet_15:
        LDR.W    R0,??DataTable29_10
        LDRB     R0,[R0, #+0]
        ADDS     R0,R1,R0
        B.N      ??CurveSignGet_16
??CurveSignGet_17:
        ADDS     R0,R0,#+1
// 2689     {
// 2690       if(row >= CameraHight - 1) 
??CurveSignGet_16:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BLT.N    ??CurveSignGet_18
// 2691       {
// 2692         CurveLineChosenL1 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_10
        STRB     R0,[R1, #+0]
// 2693         CurveLineChosenL2 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_11
        STRB     R0,[R1, #+0]
// 2694         return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2695       }
// 2696       if(BlackLeftLoc[row][0] != MaxValUint8)
??CurveSignGet_18:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable29_13
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        CMP      R2,#+255
        BEQ.N    ??CurveSignGet_17
// 2697       {
// 2698         CurveLineChosenL2 = row;
        LDR.W    R2,??DataTable29_11
        STRB     R0,[R2, #+0]
// 2699         break;
// 2700       }
// 2701     }
// 2702     
// 2703     //曲率基于的行3 CurveLineChosen3
// 2704     for(row = CurveLineChosenL2 + temp; ; row++)
        LDR.W    R0,??DataTable29_11
        LDRB     R0,[R0, #+0]
        ADDS     R0,R1,R0
        B.N      ??CurveSignGet_19
??CurveSignGet_20:
        ADDS     R0,R0,#+1
// 2705     {
// 2706       if(row >= CameraHight) 
??CurveSignGet_19:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+50
        BLT.N    ??CurveSignGet_21
// 2707       {
// 2708         CurveLineChosenL1 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_10
        STRB     R0,[R1, #+0]
// 2709         CurveLineChosenL2 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_11
        STRB     R0,[R1, #+0]
// 2710         CurveLineChosenL3 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_12
        STRB     R0,[R1, #+0]
// 2711         return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2712       }
// 2713       if(BlackLeftLoc[row][0] != MaxValUint8)
??CurveSignGet_21:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable29_13
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??CurveSignGet_20
// 2714       {
// 2715         CurveLineChosenL3 = row;
        LDR.W    R1,??DataTable29_12
        STRB     R0,[R1, #+0]
// 2716         break;
// 2717       }
// 2718     }      
// 2719     //SABCL左黑线曲率三角形面积的求取
// 2720     //SABCL = SABCGet(BlackLeftLoc[CurveLineChosenL1][0], CameraHight - 1 - CurveLineChosenL1,
// 2721     //               BlackLeftLoc[CurveLineChosenL2][0], CameraHight - 1 - CurveLineChosenL2,
// 2722     //               BlackLeftLoc[CurveLineChosenL3][0], CameraHight - 1 - CurveLineChosenL3
// 2723     //               );
// 2724     CURVEL = CurveGet(BlackLeftLoc[CurveLineChosenL1][0], CameraHight - 1 - CurveLineChosenL1,
// 2725                       BlackLeftLoc[CurveLineChosenL2][0], CameraHight - 1 - CurveLineChosenL2,
// 2726                       BlackLeftLoc[CurveLineChosenL3][0], CameraHight - 1 - CurveLineChosenL3
// 2727                       );
        LDR.W    R0,??DataTable29_12
        LDRB     R0,[R0, #+0]
        RSBS     R0,R0,#+49
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[SP, #+4]
        LDR.W    R0,??DataTable29_12
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+3
        LDR.W    R2,??DataTable29_13
        MLA      R0,R1,R0,R2
        LDRB     R0,[R0, #+0]
        STR      R0,[SP, #+0]
        LDR.W    R0,??DataTable29_11
        LDRB     R0,[R0, #+0]
        RSBS     R3,R0,#+49
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDR.W    R0,??DataTable29_11
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+3
        LDR.W    R2,??DataTable29_13
        MLA      R0,R1,R0,R2
        LDRB     R2,[R0, #+0]
        LDR.W    R0,??DataTable29_10
        LDRB     R0,[R0, #+0]
        RSBS     R1,R0,#+49
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.W    R0,??DataTable29_10
        LDRB     R0,[R0, #+0]
        MOVS     R4,#+3
        LDR.W    R5,??DataTable29_13
        MLA      R0,R4,R0,R5
        LDRB     R0,[R0, #+0]
        BL       CurveGet
        LDR.W    R1,??DataTable29_14
        STRH     R0,[R1, #+0]
// 2728     
// 2729   }
// 2730   
// 2731   
// 2732   //左右黑线有可能只有一边提取成功，若不成功，就不用费时间了。
// 2733   if(BlackRightDone == 1)
??CurveSignGet_11:
        LDR.W    R0,??DataTable29_15
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??CurveSignGet_22
// 2734   {
// 2735     //3. 右黑线曲率符号求取
// 2736     //曲率符号预先清零。
// 2737     CurveLineChosenR1 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_16
        STRB     R0,[R1, #+0]
// 2738     CurveLineChosenR2 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_17
        STRB     R0,[R1, #+0]
// 2739     CurveLineChosenR3 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_18
        STRB     R0,[R1, #+0]
// 2740     
// 2741     //曲率基于的行1 CurveLineChosen1，从上到下取第一个有效值。
// 2742     for(row = 0; ; row++)
        MOVS     R0,#+0
        B.N      ??CurveSignGet_23
??CurveSignGet_24:
        ADDS     R0,R0,#+1
// 2743     {
// 2744       if(row >= CameraHight - 2) 
??CurveSignGet_23:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+48
        BLT.N    ??CurveSignGet_25
// 2745       {
// 2746         CurveLineChosenR1 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_16
        STRB     R0,[R1, #+0]
// 2747         return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2748       }
// 2749       if(BlackRightLoc[row][0] != MaxValUint8)
??CurveSignGet_25:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable29_19
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??CurveSignGet_24
// 2750       {
// 2751         CurveLineChosenR1 = row;
        LDR.W    R1,??DataTable29_16
        STRB     R0,[R1, #+0]
// 2752         break;
// 2753       }   
// 2754     }
// 2755     //把第1个有效值到CameraHight-1的距离分成2段。
// 2756     temp = (CameraHight - 1 - row) / 2;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        RSBS     R0,R0,#+49
        MOVS     R1,#+2
        SDIV     R1,R0,R1
// 2757     if(temp == 0) 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??CurveSignGet_26
// 2758     {
// 2759       CurveLineChosenR1 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_16
        STRB     R0,[R1, #+0]
// 2760       return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2761     }
// 2762     
// 2763     //曲率基于的行2 CurveLineChosen2
// 2764     for(row = CurveLineChosenR1 + temp; ; row++)
??CurveSignGet_26:
        LDR.W    R0,??DataTable29_16
        LDRB     R0,[R0, #+0]
        ADDS     R0,R1,R0
        B.N      ??CurveSignGet_27
??CurveSignGet_28:
        ADDS     R0,R0,#+1
// 2765     {
// 2766       if(row >= CameraHight - 1) 
??CurveSignGet_27:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BLT.N    ??CurveSignGet_29
// 2767       {
// 2768         CurveLineChosenR1 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_16
        STRB     R0,[R1, #+0]
// 2769         CurveLineChosenR2 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_17
        STRB     R0,[R1, #+0]
// 2770         return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2771       }
// 2772       if(BlackRightLoc[row][0] != MaxValUint8)
??CurveSignGet_29:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+3
        LDR.W    R3,??DataTable29_19
        MLA      R2,R2,R0,R3
        LDRB     R2,[R2, #+0]
        CMP      R2,#+255
        BEQ.N    ??CurveSignGet_28
// 2773       {
// 2774         CurveLineChosenR2 = row;
        LDR.W    R2,??DataTable29_17
        STRB     R0,[R2, #+0]
// 2775         break;
// 2776       }
// 2777     }
// 2778     
// 2779     //曲率基于的行3 CurveLineChosen3
// 2780     for(row = CurveLineChosenR2 + temp; ; row++)
        LDR.W    R0,??DataTable29_17
        LDRB     R0,[R0, #+0]
        ADDS     R0,R1,R0
        B.N      ??CurveSignGet_30
??CurveSignGet_31:
        ADDS     R0,R0,#+1
// 2781     {
// 2782       if(row >= CameraHight) 
??CurveSignGet_30:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+50
        BLT.N    ??CurveSignGet_32
// 2783       {
// 2784         CurveLineChosenR1 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_16
        STRB     R0,[R1, #+0]
// 2785         CurveLineChosenR2 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_17
        STRB     R0,[R1, #+0]
// 2786         CurveLineChosenR3 = MaxValUint8;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable29_18
        STRB     R0,[R1, #+0]
// 2787         return 0;
        MOVS     R0,#+0
        B.N      ??CurveSignGet_3
// 2788       }
// 2789       if(BlackRightLoc[row][0] != MaxValUint8)
??CurveSignGet_32:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.W    R2,??DataTable29_19
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??CurveSignGet_31
// 2790       {
// 2791         CurveLineChosenR3 = row;
        LDR.W    R1,??DataTable29_18
        STRB     R0,[R1, #+0]
// 2792         break;
// 2793       }
// 2794     }   
// 2795     //SABCR右黑线曲率三角形面积的求取
// 2796     //SABCR = SABCGet(BlackRightLoc[CurveLineChosenR1][0], CameraHight - 1 - CurveLineChosenR1, 
// 2797     //                BlackRightLoc[CurveLineChosenR2][0], CameraHight - 1 - CurveLineChosenR2, 
// 2798     //                BlackRightLoc[CurveLineChosenR3][0], CameraHight - 1 - CurveLineChosenR3
// 2799     //                );
// 2800     CURVER = CurveGet(BlackRightLoc[CurveLineChosenR1][0], CameraHight - 1 - CurveLineChosenR1, 
// 2801                       BlackRightLoc[CurveLineChosenR2][0], CameraHight - 1 - CurveLineChosenR2, 
// 2802                       BlackRightLoc[CurveLineChosenR3][0], CameraHight - 1 - CurveLineChosenR3
// 2803                       );
        LDR.W    R0,??DataTable29_18
        LDRB     R0,[R0, #+0]
        RSBS     R0,R0,#+49
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[SP, #+4]
        LDR.W    R0,??DataTable29_18
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+3
        LDR.W    R2,??DataTable29_19
        MLA      R0,R1,R0,R2
        LDRB     R0,[R0, #+0]
        STR      R0,[SP, #+0]
        LDR.W    R0,??DataTable29_17
        LDRB     R0,[R0, #+0]
        RSBS     R3,R0,#+49
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDR.W    R0,??DataTable29_17
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+3
        LDR.W    R2,??DataTable29_19
        MLA      R0,R1,R0,R2
        LDRB     R2,[R0, #+0]
        LDR.W    R0,??DataTable29_16
        LDRB     R0,[R0, #+0]
        RSBS     R1,R0,#+49
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.W    R0,??DataTable29_16
        LDRB     R0,[R0, #+0]
        MOVS     R4,#+3
        LDR.W    R5,??DataTable29_19
        MLA      R0,R4,R0,R5
        LDRB     R0,[R0, #+0]
        BL       CurveGet
        LDR.W    R1,??DataTable29_20
        STRH     R0,[R1, #+0]
// 2804      
// 2805   }
// 2806   
// 2807   return 1;
??CurveSignGet_22:
        MOVS     R0,#+1
??CurveSignGet_3:
        POP      {R1-R5,PC}       ;; return
// 2808   
// 2809 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26:
        DC32     BlackRightHeadLine

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_1:
        DC32     BlackLeftHeadLine
// 2810 
// 2811 
// 2812 //赛道类型判断
// 2813 //======================================================================
// 2814 //函数名：PathJudge
// 2815 //功  能：赛道类型判断
// 2816 //参  数：无
// 2817 //返  回：1成功 0失败
// 2818 //影  响：PathType
// 2819 //说  明：
// 2820 //             
// 2821 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2822 uint8 PathJudge(void)
// 2823 {
PathJudge:
        PUSH     {R7,LR}
// 2824   //赛道类型PathType: 0未知 1直道 2左中 3右中 4左内 5左外 6右内 7右外
// 2825   PathType = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
// 2826   //uint8 row;
// 2827   
// 2828   //曲率符号获取成功
// 2829   if(CurveSignGet())
        BL       CurveSignGet
        CMP      R0,#+0
        BEQ.W    ??PathJudge_0
// 2830   {
// 2831     //左右黑线均提取成功，的情况。
// 2832     if(BlackLeftDone == 1 && BlackRightDone == 1)
        LDR.N    R0,??DataTable29_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??PathJudge_1
        LDR.N    R0,??DataTable29_15
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??PathJudge_1
// 2833     { //全部逆时针，为左弯。而且是小车走在左弯道较为中心的情况。
// 2834       if(CURVEL < 0 && CURVEC < 0 && CURVER < 0)
        LDR.N    R0,??DataTable29_14
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PathJudge_2
        LDR.N    R0,??DataTable29_8
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PathJudge_2
        LDR.N    R0,??DataTable29_20
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PathJudge_2
// 2835       { 
// 2836         PathType = 2;
        MOVS     R0,#+2
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
        B.N      ??PathJudge_1
// 2837       }
// 2838       //全部顺时针，为右弯。而且是小车走在右弯道较为中心的情况。
// 2839       else if(CURVEL > 0 && CURVEC > 0 && CURVER > 0)
??PathJudge_2:
        LDR.N    R0,??DataTable29_14
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??PathJudge_3
        LDR.N    R0,??DataTable29_8
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??PathJudge_3
        LDR.N    R0,??DataTable29_20
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??PathJudge_3
// 2840       {        
// 2841         PathType = 3;
        MOVS     R0,#+3
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
        B.N      ??PathJudge_1
// 2842       }
// 2843       else
// 2844       {
// 2845         if(
// 2846           (AbsSelf(CURVEL) < PathStraightLimitL)
// 2847         &&(AbsSelf(CURVEC) < PathStraightLimitC)
// 2848         &&(AbsSelf(CURVER) < PathStraightLimitR)
// 2849           )
??PathJudge_3:
        LDR.N    R0,??DataTable29_14
        LDRSH    R0,[R0, #+0]
        BL       AbsSelf
        LDR.N    R1,??DataTable29_22
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??PathJudge_4
        LDR.N    R0,??DataTable29_8
        LDRSH    R0,[R0, #+0]
        BL       AbsSelf
        LDR.N    R1,??DataTable29_23
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??PathJudge_4
        LDR.N    R0,??DataTable29_20
        LDRSH    R0,[R0, #+0]
        BL       AbsSelf
        LDR.N    R1,??DataTable29_24
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??PathJudge_4
// 2850         { //均小于阈值，为直道。
// 2851           PathType = 1;  
        MOVS     R0,#+1
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
        B.N      ??PathJudge_1
// 2852         }
// 2853         else
// 2854         {
// 2855           PathType = 0; //未知赛道类型。  
??PathJudge_4:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
// 2856         }
// 2857       }
// 2858     }
// 2859     
// 2860     //左黑线提取失败，右黑线提取成功，的情况。
// 2861     if(BlackLeftDone == 0 && BlackRightDone == 1)
??PathJudge_1:
        LDR.N    R0,??DataTable29_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??PathJudge_5
        LDR.N    R0,??DataTable29_15
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??PathJudge_5
// 2862     { //左弯道，外道。
// 2863       if(CURVEC < 0 && CURVER < 0)
        LDR.N    R0,??DataTable29_8
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PathJudge_6
        LDR.N    R0,??DataTable29_20
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PathJudge_6
// 2864       {
// 2865         PathType = 5;
        MOVS     R0,#+5
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
        B.N      ??PathJudge_5
// 2866       }
// 2867       //右弯道，内道。
// 2868       else if(CURVEC > 0 && CURVER > 0)
??PathJudge_6:
        LDR.N    R0,??DataTable29_8
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??PathJudge_7
        LDR.N    R0,??DataTable29_20
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??PathJudge_7
// 2869       {
// 2870         PathType = 6;
        MOVS     R0,#+6
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
        B.N      ??PathJudge_5
// 2871       }
// 2872       else
// 2873       {
// 2874         if(
// 2875           (AbsSelf(CURVEC) < PathStraightLimitC)
// 2876         &&(AbsSelf(CURVER) < PathStraightLimitR)
// 2877           )
??PathJudge_7:
        LDR.N    R0,??DataTable29_8
        LDRSH    R0,[R0, #+0]
        BL       AbsSelf
        LDR.N    R1,??DataTable29_23
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??PathJudge_8
        LDR.N    R0,??DataTable29_20
        LDRSH    R0,[R0, #+0]
        BL       AbsSelf
        LDR.N    R1,??DataTable29_24
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??PathJudge_8
// 2878         { //均小于阈值，为直道。
// 2879           PathType = 1;  
        MOVS     R0,#+1
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
        B.N      ??PathJudge_5
// 2880         }
// 2881         else
// 2882         {
// 2883           PathType = 0; //未知赛道类型。  
??PathJudge_8:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
// 2884         }
// 2885       }
// 2886     }
// 2887     
// 2888     //右黑线提取失败，左黑线提取成功，的情况。
// 2889     if(BlackLeftDone == 1 && BlackRightDone == 0)
??PathJudge_5:
        LDR.N    R0,??DataTable29_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??PathJudge_9
        LDR.N    R0,??DataTable29_15
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??PathJudge_9
// 2890     { //左弯道，内道。
// 2891       if(CURVEC < 0 && CURVEL < 0)
        LDR.N    R0,??DataTable29_8
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PathJudge_10
        LDR.N    R0,??DataTable29_14
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PathJudge_10
// 2892       {
// 2893         PathType = 4;
        MOVS     R0,#+4
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
        B.N      ??PathJudge_9
// 2894       }
// 2895       //右弯道，外道。
// 2896       else if(CURVEC > 0 && CURVEL > 0)
??PathJudge_10:
        LDR.N    R0,??DataTable29_8
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??PathJudge_11
        LDR.N    R0,??DataTable29_14
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??PathJudge_11
// 2897       {
// 2898         PathType = 7;
        MOVS     R0,#+7
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
        B.N      ??PathJudge_9
// 2899       }
// 2900       else
// 2901       {
// 2902         if(
// 2903           (AbsSelf(CURVEC) < PathStraightLimitC)
// 2904         &&(AbsSelf(CURVEL) < PathStraightLimitL)
// 2905           )
??PathJudge_11:
        LDR.N    R0,??DataTable29_8
        LDRSH    R0,[R0, #+0]
        BL       AbsSelf
        LDR.N    R1,??DataTable29_23
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??PathJudge_12
        LDR.N    R0,??DataTable29_14
        LDRSH    R0,[R0, #+0]
        BL       AbsSelf
        LDR.N    R1,??DataTable29_22
        LDRSH    R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??PathJudge_12
// 2906         { //均小于阈值，为直道。
// 2907           PathType = 1;  
        MOVS     R0,#+1
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
        B.N      ??PathJudge_9
// 2908         }
// 2909         else
// 2910         {
// 2911           PathType = 0; //未知赛道类型。  
??PathJudge_12:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
// 2912         }
// 2913       }
// 2914     }
// 2915     
// 2916     return 1;
??PathJudge_9:
        MOVS     R0,#+1
        B.N      ??PathJudge_13
// 2917   }
// 2918   //曲率符号获取失败
// 2919   else
// 2920   {
// 2921     PathType = 0;  
??PathJudge_0:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
// 2922     return 0;
        MOVS     R0,#+0
??PathJudge_13:
        POP      {R1,PC}          ;; return
// 2923   }
// 2924   
// 2925 }
// 2926 
// 2927 
// 2928 
// 2929 
// 2930 
// 2931 //======================================================================
// 2932 //函数名：ImagePro
// 2933 //功  能：
// 2934 //参  数：无
// 2935 //返  回：1成功 0失败
// 2936 //影  响：
// 2937 //说  明：
// 2938 //             
// 2939 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2940 uint8 ImagePro(void)
// 2941 {
ImagePro:
        PUSH     {R7,LR}
// 2942     uint8 i;
// 2943     //图像取需要的列，重新赋值是为了后面的编程方便。
// 2944     ImgPut();
        BL       ImgPut
// 2945   
// 2946     //ImageExtract(ImgSend, ImgStore, CameraSize);  
// 2947 
// 2948     
// 2949     //发送图像存储数组到上位机
// 2950     //SendImage(ImgNew);       
// 2951     //黑线提取函数
// 2952     if(!BlackGet())        
        BL       BlackGet
        CMP      R0,#+0
        BNE.N    ??ImagePro_0
// 2953     {
// 2954         //uart_sendN(UART0, (uint8 *)"\nBlackGet Failed!", 17);  
// 2955         CenterLineResult = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable29_25
        STRB     R0,[R1, #+0]
// 2956         PathType = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
// 2957         BlackLeftHeadLine = MaxValUint8;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable29_26
        STRB     R0,[R1, #+0]
// 2958         BlackRightHeadLine = MaxValUint8;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable29_27
        STRB     R0,[R1, #+0]
// 2959         return 0;
        MOVS     R0,#+0
        B.N      ??ImagePro_1
// 2960     }
// 2961     else
// 2962     { //黑线提取成功，找两边黑线的线头
// 2963       //左线线头的查找
// 2964       if(BlackLeftDone == 1)
??ImagePro_0:
        LDR.N    R0,??DataTable29_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??ImagePro_2
// 2965       {
// 2966         for(i = 0; ; i++)
        MOVS     R0,#+0
        B.N      ??ImagePro_3
??ImagePro_4:
        ADDS     R0,R0,#+1
// 2967         {
// 2968           if(BlackLeftLoc[i][0] != MaxValUint8)
??ImagePro_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable29_13
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??ImagePro_5
// 2969           {
// 2970             BlackLeftHeadLine = i;
        LDR.N    R1,??DataTable29_26
        STRB     R0,[R1, #+0]
// 2971             break;
        B.N      ??ImagePro_6
// 2972           }
// 2973           if(i == CameraHight - 1) 
??ImagePro_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??ImagePro_4
// 2974           {
// 2975             BlackLeftHeadLine = MaxValUint8;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable29_26
        STRB     R0,[R1, #+0]
// 2976             break;
        B.N      ??ImagePro_6
// 2977           }
// 2978         }
// 2979       }
// 2980       else
// 2981       {
// 2982         BlackLeftHeadLine = MaxValUint8;
??ImagePro_2:
        MOVS     R0,#+255
        LDR.N    R1,??DataTable29_26
        STRB     R0,[R1, #+0]
// 2983       }
// 2984       
// 2985       //右线线头的查找
// 2986       if(BlackRightDone == 1)
??ImagePro_6:
        LDR.N    R0,??DataTable29_15
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??ImagePro_7
// 2987       {
// 2988         for(i = 0; ; i++)
        MOVS     R0,#+0
        B.N      ??ImagePro_8
??ImagePro_9:
        ADDS     R0,R0,#+1
// 2989         {
// 2990           if(BlackRightLoc[i][0] != MaxValUint8)
??ImagePro_8:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+3
        LDR.N    R2,??DataTable29_19
        MLA      R1,R1,R0,R2
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??ImagePro_10
// 2991           {
// 2992             BlackRightHeadLine = i;
        LDR.N    R1,??DataTable29_27
        STRB     R0,[R1, #+0]
// 2993             break;
        B.N      ??ImagePro_11
// 2994           }
// 2995           if(i == CameraHight - 1) 
??ImagePro_10:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+49
        BNE.N    ??ImagePro_9
// 2996           {
// 2997             BlackRightHeadLine = MaxValUint8;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable29_27
        STRB     R0,[R1, #+0]
// 2998             break;
        B.N      ??ImagePro_11
// 2999           }
// 3000         }
// 3001       }
// 3002       else
// 3003       {
// 3004         BlackRightHeadLine = MaxValUint8;
??ImagePro_7:
        MOVS     R0,#+255
        LDR.N    R1,??DataTable29_27
        STRB     R0,[R1, #+0]
// 3005       }
// 3006     }
// 3007     
// 3008     //中心线提取函数
// 3009     CenterLineResult = 1;
??ImagePro_11:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable29_25
        STRB     R0,[R1, #+0]
// 3010     if(!CenterLineGet())
        BL       CenterLineGet
        CMP      R0,#+0
        BNE.N    ??ImagePro_12
// 3011     {
// 3012       //uart_sendN(UART0, (uint8 *)"\nCenterLineGet Failed!", 22); 
// 3013       CenterLineResult = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable29_25
        STRB     R0,[R1, #+0]
// 3014       PathType = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable29_21
        STRB     R0,[R1, #+0]
// 3015       return 0;
        MOVS     R0,#+0
        B.N      ??ImagePro_1
// 3016     }
// 3017     else
// 3018     {
// 3019       //CenterLineGetCom();  
// 3020     }
// 3021     
// 3022     //赛道类型判断
// 3023     //到这里时，中心线提取成功，左右黑线至少有一个提取成功。
// 3024     if(!PathJudge())
??ImagePro_12:
        BL       PathJudge
        CMP      R0,#+0
        BNE.N    ??ImagePro_13
// 3025     {
// 3026       //uart_sendN(UART0, (uint8 *)"\nPathJudge Failed!", 18);
// 3027       return 0;
        MOVS     R0,#+0
        B.N      ??ImagePro_1
// 3028     }
// 3029     //发送中心线数组，不用发送float型的数据，同样的处理可以由上位机完成。
// 3030     //SendCenterLineLoc(CenterLineLoc);
// 3031     
// 3032     //SendImage(ImgNew);  
// 3033     
// 3034     return 1;
??ImagePro_13:
        MOVS     R0,#+1
??ImagePro_1:
        POP      {R1,PC}          ;; return
// 3035 }
// 3036 
// 3037 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3038 uint8 ImageProSend(void)
// 3039 {
ImageProSend:
        PUSH     {R7,LR}
// 3040     //图像取需要的列，重新赋值是为了后面的编程方便。
// 3041     ///////////////////////////////////////////但这里需要用示波器测量一下时间，看是不是耗费了太多时间。
// 3042     ImgPut();
        BL       ImgPut
// 3043   
// 3044     //ImageExtract(ImgSend, ImgStore, CameraSize);  
// 3045     /*
// 3046     //黑线提取函数
// 3047     if(!BlackGet())         ////////////////////////////如果黑线提取失败，这里最好给个灯来指示
// 3048     {
// 3049         uart_sendN(UART0, (uint8 *)"\nBlackGet Failed!", 17);  
// 3050         return 0;
// 3051     }
// 3052     
// 3053     //中心线提取函数
// 3054     CenterLineResult = 1;
// 3055     if(!CenterLineGet())
// 3056     {
// 3057       uart_sendN(UART0, (uint8 *)"\nCenterLineGet Failed!", 22); 
// 3058       CenterLineResult = 0;
// 3059       return 0;
// 3060     }
// 3061     
// 3062     //PathJudge();
// 3063 
// 3064     */
// 3065     //发送中心线数组，不用发送float型的数据，同样的处理可以由上位机完成。
// 3066     //SendCenterLineLoc(CenterLineLoc);
// 3067     
// 3068     //发送图像存储数组到上位机
// 3069     SendImage(ImgNew);      
        LDR.N    R0,??DataTable29_1
        BL       SendImage
// 3070     
// 3071     return 1;
        MOVS     R0,#+1
        POP      {R1,PC}          ;; return
// 3072 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29:
        DC32     CenterKeyLine

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_1:
        DC32     ImgNew

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_2:
        DC32     ImgRaw

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_3:
        DC32     CurveGetCompen

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_4:
        DC32     CurveLineChosenC1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_5:
        DC32     CurveLineChosenC2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_6:
        DC32     CurveLineChosenC3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_7:
        DC32     CenterLineLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_8:
        DC32     CURVEC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_9:
        DC32     BlackLeftDone

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_10:
        DC32     CurveLineChosenL1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_11:
        DC32     CurveLineChosenL2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_12:
        DC32     CurveLineChosenL3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_13:
        DC32     BlackLeftLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_14:
        DC32     CURVEL

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_15:
        DC32     BlackRightDone

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_16:
        DC32     CurveLineChosenR1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_17:
        DC32     CurveLineChosenR2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_18:
        DC32     CurveLineChosenR3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_19:
        DC32     BlackRightLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_20:
        DC32     CURVER

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_21:
        DC32     PathType

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_22:
        DC32     PathStraightLimitL

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_23:
        DC32     PathStraightLimitC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_24:
        DC32     PathStraightLimitR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_25:
        DC32     CenterLineResult

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_26:
        DC32     BlackLeftHeadLine

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_27:
        DC32     BlackRightHeadLine

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 3073 
// 3074 
// 3075 
// 3076 
// 3077 
// 3078 
// 3079 
// 3080 
// 3081 
// 3082 
// 3083 
// 3084 
// 3085 
// 3086 
// 3087 
// 3088 
// 3089 
// 3090 
// 3091 
// 3092 
// 
// 12 896 bytes in section .bss
//     23 bytes in section .data
//    176 bytes in section .rodata
// 12 416 bytes in section .text
// 
// 12 416 bytes of CODE  memory
//    176 bytes of CONST memory
// 12 919 bytes of DATA  memory
//
//Errors: none
//Warnings: none
