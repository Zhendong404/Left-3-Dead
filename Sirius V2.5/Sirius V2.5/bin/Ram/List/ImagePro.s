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
//    3   �ļ�����ͼ��������ļ�ImagePro.c
//    4   ��  �ܣ�ͼ����
//    5   ��  �ڣ�2014.10.09
//    6   ��  �ߣ�HJZ
//    7   ��  ע��
//    8 *******************************************************************************/
//    9 /******************************************************************************/
//   10 
//   11 #include "ImagePro.h"
//   12 
//   13 //��������ȡʱ��ʵ��������ȵ�һ���Ӧ�����ص������ǹ̶��ǶȺ��õ�ֵ��

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
//   26 uint8 ImgNew[CameraHight][CameraRealWidth];       //���´��������ݴ�������
ImgNew:
        DS8 12500

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 uint8 BlackLeftLoc[CameraHight][3];       //�����λ�ô洢����,ÿ��3�����ɵ㣬 255Ϊ��Чֵ
BlackLeftLoc:
        DS8 152

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 uint8 BlackRightLoc[CameraHight][3];      //�Һ���λ�ô洢����,ÿ��3�����ɵ㣬 255Ϊ��Чֵ
BlackRightLoc:
        DS8 152

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   29 uint8 CenterLineLoc[CameraHight];      //������λ�ô洢����, 255Ϊ��Чֵ
CenterLineLoc:
        DS8 52
//   30 //uint8 MaxValUint8 = 255;             //�Զ������Чֵ

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   31 uint8 CenterLineResult = 1;             //��������ȡ�ɹ���־
CenterLineResult:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   32 uint8 CenterKeyLine = 25;                  //�̶���Ҫѡȡ���С�
CenterKeyLine:
        DATA
        DC8 25

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   33 uint8 CenterLocStore = MaxValUint8;         //���Һ��߶���ȡ����ʱ�򣬱����CenterLineLoc[CameraHight - 1]��
CenterLocStore:
        DATA
        DC8 255
//   34 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   35 uint8 PathType = 0;                       //0δ֪ 1ֱ�� 2���� 3���� 4���� 5���� 6���� 7����
PathType:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   36 uint8 CurveLineChosenC1 = 0;               //������ȡʱ��������ѡȡ�ĵ�1�С�
CurveLineChosenC1:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   37 uint8 CurveLineChosenC2 = 0;               //������ȡʱ��������ѡȡ�ĵ�1�С�
CurveLineChosenC2:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   38 uint8 CurveLineChosenC3 = 0;               //������ȡʱ��������ѡȡ�ĵ�1�С�
CurveLineChosenC3:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   39 uint8 CurveLineChosenL1 = 0;               //������ȡʱ�������ѡȡ�ĵ�1�С�
CurveLineChosenL1:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   40 uint8 CurveLineChosenL2 = 0;               //������ȡʱ�������ѡȡ�ĵ�1�С�
CurveLineChosenL2:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   41 uint8 CurveLineChosenL3 = 0;               //������ȡʱ�������ѡȡ�ĵ�1�С�
CurveLineChosenL3:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   42 uint8 CurveLineChosenR1 = 0;               //������ȡʱ���Һ���ѡȡ�ĵ�1�С�
CurveLineChosenR1:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   43 uint8 CurveLineChosenR2 = 0;               //������ȡʱ���Һ���ѡȡ�ĵ�1�С�
CurveLineChosenR2:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   44 uint8 CurveLineChosenR3 = 0;               //������ȡʱ���Һ���ѡȡ�ĵ�1�С�
CurveLineChosenR3:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   45 int16 SABCL = 0;                          //������ȡʱ����������������ε������˳ʱ��Ϊ������ʱ��Ϊ����
SABCL:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   46 int16 SABCC = 0;                          //������ȡʱ�����������������ε������˳ʱ��Ϊ������ʱ��Ϊ����
SABCC:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   47 int16 SABCR = 0;                          //������ȡʱ���Һ������������ε������˳ʱ��Ϊ������ʱ��Ϊ����
SABCR:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   48 int16 CURVEL = 0;                          //������ȡʱ������ߵ����ʣ�˳ʱ��Ϊ������ʱ��Ϊ����
CURVEL:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   49 int16 CURVEC = 0;                          //������ȡʱ�������ߵ����ʣ�˳ʱ��Ϊ������ʱ��Ϊ����
CURVEC:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   50 int16 CURVER = 0;                          //������ȡʱ���Һ��ߵ����ʣ�˳ʱ��Ϊ������ʱ��Ϊ����
CURVER:
        DS8 2

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   51 int16 PathStraightLimitL = 20;           //���������ж�ʱ��������ж�Ϊֱ�ߵ���ֵ��������д�ģ���Ҫ��C#�ⶨ��
PathStraightLimitL:
        DATA
        DC16 20

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   52 int16 PathStraightLimitC = 20;           //���������ж�ʱ���������ж�Ϊֱ�ߵ���ֵ��������д�ģ���Ҫ��C#�ⶨ��
PathStraightLimitC:
        DATA
        DC16 20

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   53 int16 PathStraightLimitR = 20;           //���������ж�ʱ���Һ����ж�Ϊֱ�ߵ���ֵ��������д�ģ���Ҫ��C#�ⶨ��
PathStraightLimitR:
        DATA
        DC16 20

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   54 int16 CurveGetCompen = 2000;             //������ȡʱ��Ϊ�˲�ʹ��̫С���˵Ĳ�������
CurveGetCompen:
        DATA
        DC16 2000
//   55 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   56 uint8 ErrorGetSelf;                 //ƽ��ֵ�������ƫ�Ҳ����curve
ErrorGetSelf:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   57 uint8 ErrorGetCen;                 //ƽ��ֵ�����������ߵ�ƫ�
ErrorGetCen:
        DS8 1
//   58 
//   59 //��

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   60 uint8 BlackLeftRealWB[2];                  //���ߵ�ʵ�ʺڰײ�ֵ�Ĵ洢���飬���ڼ���ʵ�ʺڰײ�ֵ����ֵ�����LimitLeftWB
BlackLeftRealWB:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   61 uint8 BlackLeftRealB[2];                   //���ߵ�ʵ�ʺڵ�ֵ�洢���飬���ڼ���ʵ�ʺڵ���ֵ�����LimitLeftB
BlackLeftRealB:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   62 uint8 BlackLeftRealW[2];                   //���ߵ�ʵ�ʰ׵�ֵ�洢���飬���ڼ���ʵ�ʰ׵���ֵ�����LimitLeftW
BlackLeftRealW:
        DS8 2
//   63 //��

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   64 uint8 BlackRightRealWB[2];                  //���ߵ�ʵ�ʺڰײ�ֵ�Ĵ洢���飬���ڼ���ʵ�ʺڰײ�ֵ����ֵ�����LimitRightWB
BlackRightRealWB:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   65 uint8 BlackRightRealB[2];                   //���ߵ�ʵ�ʺڵ�ֵ�洢���飬���ڼ���ʵ�ʺڵ���ֵ�����LimitRightB
BlackRightRealB:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   66 uint8 BlackRightRealW[2];                   //���ߵ�ʵ�ʰ׵�ֵ�洢���飬���ڼ���ʵ�ʰ׵���ֵ�����LimitRightW
BlackRightRealW:
        DS8 2
//   67 
//   68 
//   69 //��
//   70 //3���ؼ�ֵ�Ŀɸ�ֵ����������Ӧ���㷨���ġ�

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   71 uint8 LimitLeftWB = LimitOriLeftWB;    //�ڰ����ص�Ĳ�ֵ��������Ĳ����Ҫ�������ֵ��������Ϊ�����䡣
LimitLeftWB:
        DATA
        DC8 80

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   72 uint8 LimitLeftW = LimitOriLeftW;      //�׵����Ҫ���ڴ�ֵ
LimitLeftW:
        DATA
        DC8 150

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   73 uint8 LimitLeftB = LimitOriLeftB;      //�ڵ����ҪС�ڴ�ֵ
LimitLeftB:
        DATA
        DC8 80
//   74 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   75 uint8 BlackLeftCrossDone = 0;    //�����ʮ�ּ���־λ 0δ���� 1ʧ�� 2�ɹ�
BlackLeftCrossDone:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   76 uint8 BlackLeftDone = 1;          //�������ȡ�ɹ���ʾλ 1�ɹ� 0ʧ��
BlackLeftDone:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   77 uint8 BlackLeft3ResetCount = 0;       //���ڹ��߱仯̫�������3���ؼ�ֵ���õĴ�����
BlackLeft3ResetCount:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   78 uint8 BlackLeftCrossTooLowLine = 3;    //ʮ���ټ��ʱ�����ڸ��о�û��Ҫ�����ټ������ˡ�
BlackLeftCrossTooLowLine:
        DATA
        DC8 3
//   79 //uint8 BlackLeftStep4Flag = 0;          //�������Ҫִ�е�4�׶εı�־λ��1��ִ�У�0����ִ�С�
//   80 //uint8 BlackLeftStep4StartLine = 0;     //����ߵ�4�׶���ʼ��

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   81 uint8 BlackLeftHeadLine = MaxValUint8;   //����ߵ���ͷ���������¡�
BlackLeftHeadLine:
        DATA
        DC8 255
//   82 
//   83 //��
//   84 //3���ؼ�ֵ�Ŀɸ�ֵ����������Ӧ���㷨���ġ�

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   85 uint8 LimitRightWB = LimitOriRightWB;    //�ڰ����ص�Ĳ�ֵ��������Ĳ����Ҫ�������ֵ��������Ϊ�����䡣
LimitRightWB:
        DATA
        DC8 80

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   86 uint8 LimitRightW = LimitOriRightW;      //�׵����Ҫ���ڴ�ֵ
LimitRightW:
        DATA
        DC8 150

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   87 uint8 LimitRightB = LimitOriRightB;      //�ڵ����ҪС�ڴ�ֵ
LimitRightB:
        DATA
        DC8 80
//   88 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   89 uint8 BlackRightCrossDone = 0;   //�Һ���ʮ�ּ���־λ 0δ���� 1ʧ�� 2�ɹ�
BlackRightCrossDone:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   90 uint8 BlackRightDone = 1;          //�Һ�����ȡ�ɹ���ʾλ 1�ɹ� 0ʧ��
BlackRightDone:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   91 uint8 BlackRight3ResetCount = 0;       //���ڹ��߱仯̫�������3���ؼ�ֵ���õĴ�����
BlackRight3ResetCount:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   92 uint8 BlackRightCrossTooLowLine = 3;    //ʮ���ټ��ʱ�����ڸ��о�û��Ҫ�����ټ������ˡ�
BlackRightCrossTooLowLine:
        DATA
        DC8 3
//   93 //uint8 BlackRightStep4Flag = 0;          //�Һ�����Ҫִ�е�4�׶εı�־λ��1��ִ�У�0����ִ�С�
//   94 //uint8 BlackRightStep4StartLine = 0;     //�Һ��ߵ�4�׶���ʼ��

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   95 uint8 BlackRightHeadLine = MaxValUint8;   //����ߵ���ͷ���������¡�
BlackRightHeadLine:
        DATA
        DC8 255
//   96 
//   97 
//   98 
//   99 //�������ֵ��ֵ��ֻ�ʺ���int16�ͱ���������int16�ͱ�����

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
//  108 //��������MaxRe
//  109 //��  �ܣ���ȡ�������ֵ
//  110 //��  ������1����num1, ��2����num2��
//  111 //��  �أ�2�����е����ֵ
//  112 //Ӱ  �죺��
//  113 //˵  ����1. ��������������Ⱥ�˳��
//  114 //        2. ֻ�ܴ�������uint8�͵����ݣ������������ͻ����
//  115 //        3. ����ֵ������Ҳ��uint8.
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
//  130 //��������MinRe
//  131 //��  �ܣ���ȡ������Сֵ
//  132 //��  ������1����num1, ��2����num2��
//  133 //��  �أ�2�����е���Сֵ
//  134 //Ӱ  �죺��
//  135 //˵  ����1. ��������������Ⱥ�˳��
//  136 //        2. ֻ�ܴ�������uint8�͵����ݣ������������ͻ����
//  137 //        3. ����ֵ������Ҳ��uint8.     
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
//  152 //��������AbsRe
//  153 //��  �ܣ���ȡ������ֵ�ľ���ֵ
//  154 //��  ������1����num1, ��2����num2��
//  155 //��  �أ�2�����ľ���ֵ��
//  156 //Ӱ  �죺��
//  157 //˵  ����1. ��������������Ⱥ�˳��
//  158 //        2. ֻ�ܴ�������uint8�͵����ݣ������������ͻ����
//  159 //        3. ����ֵ������Ҳ��uint8.     
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
//  175 //��������LeastSquarea1
//  176 //��  �ܣ���С���˷���a1ֵ����ȡ
//  177 //��  ����x���飬y���飬num���ڵ���Ч���ݸ���
//  178 //��  �أ�a1
//  179 //Ӱ  �죺��
//  180 //˵  ����1. y = a0 + a1 * x;
//  181 //        2. a1 = (N * ��xy - ��x * ��y) / (N * ��x^2 - ��x * ��x);
//  182 //        ////////////////////////////////////////////////////////////////////���Կ��ǰ�������float�͵ĵط�����1000�ĳ�int     
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
//  204 //��������LeastSquarea0
//  205 //��  �ܣ���С���˷���a0ֵ����ȡ
//  206 //��  ����x���飬y���飬a1������num���ڵ���Ч���ݸ���
//  207 //��  �أ�a0
//  208 //Ӱ  �죺��
//  209 //˵  ����1. y = a0 + a1 * x;
//  210 //        2. a0 = ��y / N - a1 * ��x / N;
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
//  232 //��ֵ��ͼ���ѹ����
//  233 //dst             ͼ���ѹĿ�ĵ�ַ
//  234 //src             ͼ���ѹԴ��ַ
//  235 //srclen          ��ֵ��ͼ���ռ�ÿռ��С
//  236 void ImageExtract(uint8 *dst, uint8 *src, uint32 srclen)
//  237 {
//  238     uint8 colour[2] = {255, 0}; //0 �� 1 �ֱ��Ӧ����ɫ
//  239     //ע��ɽ�������ͷ 0 ��ʾ ��ɫ��1��ʾ ��ɫ
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
//  258 /*          //OV7725��ͼ���ͺ���
//  259 //ͼ���͵���λ��
//  260 void SendImage(uint8 *imgaddr, uint32 imgsize)
//  261 {                                                                                   
//  262     uint8 cmd[4] = {0, 255, 1, 0 };    //yy_����ͷ���ڵ��� ʹ�õ�����
//  263 
//  264     //uint8 cmd[1] = {255};       //DEMOK��λ��ʹ�õ�����   
//  265   
//  266     uart_sendN(UART0, cmd, sizeof(cmd));    //�ȷ�������
//  267 
//  268     uart_sendN(UART0, imgaddr, imgsize); //�ٷ���ͼ��
//  269 }
//  270 
//  271 */
//  272 
//  273 //======================================================================
//  274 //��������SendCenterLineLoc
//  275 //��  �ܣ����������鷢�ͺ���
//  276 //��  ����img�����͵�һάͼ������
//  277 //��  �أ���
//  278 //Ӱ  �죺��
//  279 //˵  ����1. ���������ͷ��ͼ�����鷢�ͺ���������ͷ��һ����
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
//  286     uint8 cmd[4] = {0, 255, 1, 255 };   //���������������ͷ
        ADD      R0,SP,#+0
        LDR.W    R1,??DataTable10_1
        LDR      R2,[R1, #0]
        STR      R2,[R0, #+0]
//  287     uart_sendN(UART0, cmd, sizeof(cmd));    //�ȷ�������
        MOVS     R2,#+4
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable12  ;; 0x4006a000
        BL       uart_sendN
//  288     for(i = 0; i < CameraHight; i++)
        MOVS     R5,#+0
        B.N      ??SendCenterLineLoc_0
//  289     {
//  290       uart_send1(UART0, img[i]); //��������������
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
//  299 //��������SendImage
//  300 //��  �ܣ�OV7620��ͼ���ͺ���
//  301 //��  ���������͵Ķ�άͼ������imgaddr
//  302 //��  �أ���
//  303 //Ӱ  �죺��
//  304 //˵  ����1. �޸�ͼ�������Сʱ��Ҫ���ڲ�����for������Ҳ�ĵ�
//  305 //        2. ���������ͷ�����������鷢�ͺ���������ͷ��һ����
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
//  311     uint8 cmd[4] = {0, 255, 1, 0 };    //ͼ�����������ͷ
        ADD      R0,SP,#+0
        LDR.W    R1,??DataTable11
        LDR      R2,[R1, #0]
        STR      R2,[R0, #+0]
//  312 
//  313     //uint8 cmd[1] = {255};       //DEMOK��λ��ʹ�õ�����   
//  314   
//  315     uart_sendN(UART0, cmd, sizeof(cmd));    //�ȷ�������
        MOVS     R2,#+4
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable12  ;; 0x4006a000
        BL       uart_sendN
//  316     
//  317     //���ﲻ����uart_sendN(UART0, imgaddr, CameraSize)�����棬��Ϊuart_sendN�������buff[i].
//  318     for(i = 0; i < CameraHight; i++)
        MOVS     R5,#+0
        B.N      ??SendImage_0
//  319         for(j = 0; j < CameraRealWidth; j++)
//  320             uart_send1(UART0, imgaddr[i][j]); //����ͼ��
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
//  325 //====================================����������������������������������============================
//  326 
//  327 //======================================================================
//  328 //��������BlackLeftRealClear
//  329 //��  �ܣ��������ȡ�У���3���ؼ�ֵ��ʵ��ֵ����
//  330 //��  ������
//  331 //��  �أ���
//  332 //Ӱ  �죺BlackLeftRealWB[], BlackLeftRealW[], BlackLeftRealB[]
//  333 //˵  ����
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
//  351 //��������BlackGetLeftStep1Edge
//  352 //��  �ܣ��������ȡ�У���1�׶������⺯��,����������ߵĿ��ɺڵ�
//  353 //��  �����������к�row, �ڼ���ʹ��use, �Ƿ�Ϊʮ���ټ����ñ�־λCrossFlag
//  354 //��  �أ�1�ɹ� 0ʧ��
//  355 //Ӱ  �죺BlackLeftRealWB[], BlackLeftRealW[], BlackLeftRealB[]
//  356 //        BlackLeftLoc[][]
//  357 //˵  ����1. �Ե�row�е�����������а׵��ڼ�⣬�ɹ��͸���Ӧ��ֵ����3������ֵ����ʧ����255
//  358 //        2. ��������������ʱ������ɹ����������3��ֵ���м�¼���ֽ׶�ֻ�õ��˵�1��ֵ
//  359 //        3. �������漰3���ؼ�ֵ��ʵ��ֵ�ļ�¼��CrossFlag������Ͳ��ü�¼��Ҳ�Ͳ��ø��ģ�
//  360 //        4. ��1���ڵ�Ҳû�У����߳���3���ڵ㣬����ʧ�ܡ�
//  361 //        5. ��Ҫ�ĳɺڵ��׵ļ�⣬���������⣬ֻ����ĵ�һ���������ɣ��ܷ��㡣
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
//  368   //���߼������ʱ����ʼ�У������������ߵĻ���������ƫ��BlackLeftEdgeStartColOffset��ô���С�
//  369   temp = CameraRealWidth/2 - 1 + BlackLeftEdgeStartColOffset;
        MOVS     R8,#+174
//  370   
//  371   index = 0;         //���ɵ�����
        MOVS     R7,#+0
//  372   //���м䵽�����ɨ�裬��1�������
//  373   for(col = temp; col >= 4+BlackLeftEdgeNum; col--) 
        B.N      ??BlackGetLeftStep1Edge_0
//  374   {
//  375       abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col-1-BlackLeftEdgeNum]); //ȡ��ֵ�ľ���ֵ��
//  376       
//  377       if( //�����صĵ�һ��������
//  378           //�ڹ��ڣ��׹��ף����
//  379           //�����3����ֵΪ��ʼֵ����������Ӧ֮�������ֵ��
//  380           (abs1 > LimitLeftWB) //���ߵĲ��
//  381         //��������������һ�£��Ϳ���ʵ�ֺڵ��׵������⣬���������⡣
//  382         &&(ImgNew[row][col] > LimitLeftW)                     //�׵㹻��
//  383         &&(ImgNew[row][col-1-BlackLeftEdgeNum] < LimitLeftB)                   //�ڵ㹻��
//  384          )
//  385       {         
//  386           //�����صĵڶ���������
//  387           //�������У�����3������Ϊ�ڵ�
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
//  398             //Զ������ ������2����Ϊ��Ϊ�ڵ�
//  399             if(row > BlackFarLine)
//  400             {
//  401               temp1 = (
//  402                         (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB)
//  403                       &&(ImgNew[row][col-3-BlackLeftEdgeNum] < LimitLeftB)
//  404                       );
//  405             }
//  406             //Զ������ ������1����Ϊ��Ϊ�ڵ�
//  407             else
//  408             {
//  409               temp1 = (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB);
//  410             }
//  411           }
//  412 
//  413           if(temp1)
//  414           {
//  415                             
//  416               //����3�����ɺڵ㣬�򱨴�
//  417               if(index == 3)       
//  418               {
//  419                 //�����ʮ���ټ��ĵ��ã��Ͳ��ø����⼸��ֵ��
//  420                 if(CrossFlag)
//  421                 {
//  422                   //��3���ؼ�ֵ��ʵ��ֵ����
//  423                   BlackLeftRealClear();
//  424                 }
//  425                 //���ж�λ����ʧ�ܣ�����Чֵ
//  426                 BlackLeftLoc[row][0] = MaxValUint8;
//  427                 return 0;
//  428               }
//  429               
//  430               //�����ʮ���ټ��ĵ��ã��Ͳ��ø����⼸��ֵ��
//  431               if(CrossFlag)
//  432               {
//  433                 //��������˵�������صĶ������������㣬����ڵ��¼�׶�
//  434                 //��¼3���ؼ�ֵ��ʵ����Ϣ����Ϊ����Ĳο���
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
//  451               //������ɹ���ȡ�ڵ�
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
//  455           }    //end of �����صĵڶ�������
//  456       }   //end of �����صĵ�һ������
//  457   }// end of ���м䵽�����ɨ�裬��1�������
//  458   
//  459   //1�����ɺڵ�Ҳû�У��򱨴�
//  460   if(index == 0)
??BlackGetLeftStep1Edge_4:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??BlackGetLeftStep1Edge_17
//  461   {
//  462     //�����ʮ���ټ��ĵ��ã��Ͳ��ø����⼸��ֵ��
//  463     if(CrossFlag)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??BlackGetLeftStep1Edge_18
//  464     {
//  465       //��3���ؼ�ֵ��ʵ��ֵ����
//  466       BlackLeftRealClear();
        BL       BlackLeftRealClear
//  467     }
//  468     //���ж�λ����ʧ�ܣ�����Чֵ
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
//  473   //û�б����ͻ��ߵ�����ڵ���ҳɹ�������1��2��3���ڵ�
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
//  480 //��������BlackGetLeftStep2Win
//  481 //��  �ܣ��������ȡ�У���2�׶δ����������⺯��
//  482 //��  �����������к�row, ���ڴ�Сwin, Ԥ���������λ��predict
//  483 //��  �أ�1�ɹ�  0ʧ��
//  484 //Ӱ  �죺BlackLeftLoc[][0]
//  485 //˵  ����1. �����������������ܼ��ɹ���ֻ��һ����ļ�¼��
//  486 //        2. ������û�м�⵽������ʧ�ܡ�
//  487 //        3. ����С���Լ���һ����ʱ�䣬���������б�ʹ������������п��ܼ�ⲻ����     
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
//  494   //�ڹ滮�õĴ����ڣ������������������
//  495   //��ֹ���
//  496   
//  497   //����߽������
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
//  514   //���ұ߽������
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
//  524   //�ж��������">"�ܹؼ���û��д">="�ǿ���temp = 0��������������Է�ֹ����������uint8��Ϊ��������������ѭ����
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
//  528     if( //�����صĵ�һ��������
//  529         //�ڹ��ڣ��׹��ף����
//  530         //�����3����ֵ������Ӧ֮�������ֵ
//  531           (abs1 > LimitLeftWB) //���ߵĲ��
//  532         &&(ImgNew[row][col] > LimitLeftW)                     //�׵㹻��
//  533         &&(ImgNew[row][col-1-BlackLeftEdgeNum] < LimitLeftB)                   //�ڵ㹻��
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
//  536           //�������У�����3������Ϊ�ڵ�
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
//  547             //�м���� ������2����Ϊ��Ϊ�ڵ�
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
//  555             //Զ������ ������1����Ϊ��Ϊ�ڵ�
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
//  562           //�����صĵڶ���������
//  563           if(temp1)
??BlackGetLeftStep2Win_14:
??BlackGetLeftStep2Win_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.W    ??BlackGetLeftStep2Win_4
//  564           {
//  565             //�������������㣬ֱ�Ӽ�¼�õ�Ϊ���ߣ����ؼ���
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
//  569           }// end of �����ؼ��ĵ�2������
//  570     }// end of �����ؼ��ĵ�1������
//  571     
//  572     
//  573     
//  574   }// end of forѭ��
//  575   
//  576   //���һֱ����������߻�û���ҵ������أ�
//  577   
//  578   BlackLeftLoc[row][0] = MaxValUint8;   //���еĺ���λ�ü�Ϊ��Чֵ
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
//  586 //��������BlackGetLeftStep1Scan
//  587 //��  �ܣ��������ȡ�У���1�׶ε���ɨ�躯��
//  588 //��  ����ɨ����ʼ��FirstLine, ɨ�������LastLine, ʮ���ټ���־CrossFlag
//  589 //��  �أ�0~CameraHight-1���� 255�ɼ�ʧ��
//  590 //Ӱ  �죺BlackLeftRealWB[], BlackLeftRealW[], BlackLeftRealB[], BlackLeftLoc[][],
//  591 //        LimitLeftWB, LimitLeftW, LimitLeftB
//  592 //˵  ����1. �����������ص�1�׶���ɨ�裬Ҳ������ʮ���ټ��ʱ����ɨ��
//  593 //        2. ������1�׶�ɨ��ʱ�������3���ؼ���ֵ��ֵ��
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
//  601   //�����BlackStep1Size���ò�ֵ���Һ���
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
//  604       //�ж��Ƿ��������м�⵽���䣬���ɺڵ���3���㣬��ȡ����һ��
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
//  607       if(temp1 && temp2)//���������ôд������Ƕ��if����Ϊ&&���ص�
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
//  610         //��һ���ж��������еĺڵ�ļ���Ƿ�С������ȡ��1�����ɺڵ㡣
//  611         if(abs1 < BlackLeftStep1ScanMinus)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BCS.N    ??BlackGetLeftStep1Scan_1
//  612         {
//  613           //��⵽�������ĺ��ߣ�ֹͣ��ֵ���������أ���ʡʱ�䣬��������2�׶�
//  614           //�������ʮ���ټ���������͸���һ��ʵ�ʵ�3���ؼ�ֵ�����򲻸��¡�
//  615           if(CrossFlag)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??BlackGetLeftStep1Scan_3
//  616             {
//  617               //��ֵ�Ĵ�������ԣ�ȣ��������½硣
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
//  624               //�׵�Ĵ�������ԣ�ȣ��������½硣
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
//  631               //�ڵ�Ĵ�������ԣ�ȣ��������½硣
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
//  643     //�����BlackStep1Size��Ҳû�м�⵽�����ĺ��ߣ�˵�����߼��ʧ��
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
//  652 //��������BlackLeftCrossStep3
//  653 //��  �ܣ�������ȡ�У�ʮ�ּ���3�׶Σ��Բ��ߺ���
//  654 //��  ������1����Ч���ߵ����һ��FirstLine�� ��2����Ч���ߵĵ�һ��LastLine
//  655 //��  �أ�1�ɹ� 0ʧ��
//  656 //Ӱ  �죺BlackLeftLoc[][0]
//  657 //˵  ����1. ������һЩ�������㣬��ռʱ�䣬�ڵ��ñ�����ʱҪ���أ�������Ҫ�á�
//  658 //        2. �������������ߵ�˼·�ܲ���floatǿת��uint8ǿת�õúܺá�
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
//  667   //��ʼ�бȽ����л��ߣ�����
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
//  680   //ȷ������������ֱ�Ǵ��ĵ㣬Ҳ��������6������Ϊ�ڵ�
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
//  717   //б������
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
//  721     delta = delta_x / delta_y; //����1��������
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
//  726       //ÿ������һ���
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
//  731   //б������
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
//  740       //ÿ������һ���
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
//  745   //б��ֱ�ߣ������̫���ܳ���
//  746   else
//  747   {
//  748     for(row = FirstLine - 1; row >= LastLine + 1; row-- )
??BlackLeftCrossStep3_5:
        SUBS     R6,R4,#+1
        B.N      ??BlackLeftCrossStep3_7
//  749     {
//  750       //����ͬ��ֵ
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
//  760 //��������BlackLeftCrossConfirm
//  761 //��  �ܣ�ʮ���ټ��ʱ ����ͷ��Ч�Ե�ȷ�ϡ�
//  762 //��  ������1�κ��ߵ���ʵ������Row1RealLastLine����2�κ��ߵ���ʵ��ʼ��Row2RealFirstLine
//  763 //��  �أ�1�ɹ� 0ʧ��
//  764 //Ӱ  �죺��
//  765 //˵  ����1. Ϊ��Ӧ��270�����ʮ���������������д������û�й��࿼�����������
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
//  777   //��һ�κ���̫�̣��޷������ȷ�ԡ�ֱ�ӷ���1.
//  778   if(Row1RealLastLine < 5) return 1;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BCS.N    ??BlackLeftCrossConfirm_0
        MOVS     R0,#+1
        B.N      ??BlackLeftCrossConfirm_1
//  779   
//  780   //�����Ͻ�Ϊԭ�㣬����Ϊx��������0~49��������Ϊy��������(0~249)
//  781   index = 0;
??BlackLeftCrossConfirm_0:
        MOVS     R1,#+0
//  782   for(row = Row1RealLastLine; ; row++)
        B.N      ??BlackLeftCrossConfirm_2
??BlackLeftCrossConfirm_3:
        ADDS     R0,R0,#+1
//  783   {
//  784     //��Ч�еļ�¼
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
//  791     //�������࣬��������
//  792     if(index == BlackCrossConfirmNum) break;
??BlackLeftCrossConfirm_4:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+3
        BNE.N    ??BlackLeftCrossConfirm_5
//  793     //ֱ���������û�дչ��㹻�ĵ�����˵����һ����Ч����̫�̣��޷������ȷ�ԣ�ֱ�ӷ���1.
//  794     if(row == CameraHight - 1) return 1;
//  795   }
//  796   
//  797   //��С���˷�
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
//  802   //tempΪ��2�κ�����ʼ�б�Ӧ���ڵ�λ�á�
//  803   temp = a0 + a1 * Row2RealFirstLine;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        BL       __aeabi_ui2f
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
//  804   //������λ�ñ����ͳ��������ұ߽�ķ�Χ����˵���������е�2�κ��ߴ����ˡ�
//  805   //Ҳ�Ͳ��ü���2�κ����ˣ�ֱ�ӷ���0.
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
//  811   { //���ﱾ��Ӧ�ü��ϰ�������޶��ڴ��ڣ������ƺ�û��Ҫ��
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
//  823 //��������BlackLeftAgainForCross
//  824 //��  �ܣ��������ȡ�У����ʮ�ֵ��ټ�����
//  825 //��  ������2�κ��ߵ�Ԥ����ʼ��Row2FirstLine�� ��2�κ��ߵ�Ԥ�������Row2LastLine��
//  826 //        ��1�κ��ߵ�ʵ�ʽ�����Row1RealLastLine
//  827 //��  �أ�1�ɹ� 0ʧ��
//  828 //Ӱ  �죺BlackLeftLoc[][]�� ������Ӱ���Ǽ�����ֵ����
//  829 //˵  ����1. ����������ø�������ĺ�����Ԥ�ƻ��ѽ϶�ʱ�䣬��������������
//  830 //        2. ��������Ӱ����BlackLeftLoc[][]���Ժ�ҲӦ�ñ��֡�
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
//  836     uint8 Row2RealFirstLine; //��2�κ��ߵ���ʵ��ʼ��
//  837     uint8 i;
//  838     
//  839     //ʮ���ټ���1�׶Σ�����ͷ��
//  840     temp = BlackGetLeftStep1Scan(Row2FirstLine, Row2LastLine, 0); //��3������0��ʾ��ʮ���ټ�⣬���ø���3���ؼ�ֵ
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
//  843       //ɨƨ�ɹ�����       //i >= Row2LastLine
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
//  853       ////////////////���Ҫע�ͣ��ʹ����￪ʼע��
//  854       //ʮ���ټ�����ͷ�����޶��ķ�Χ�ڣ���Ϊ�Ǹ��ŵ㣬����˳����ͷ�����ˣ�ֱ���˳���
//  855       if(!BlackLeftCrossConfirm(Row1RealLastLine, temp))
??BlackLeftAgainForCross_0:
        MOV      R1,R8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackLeftCrossConfirm
        CMP      R0,#+0
        BNE.N    ??BlackLeftAgainForCross_4
//  856       { //ɨƨ�ɹ�����       //i >= (temp-1)
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
//  864       //ʮ���ټ�����ͷ��ȷ���޶��ķ�Χ�ڣ����Լ�����
//  865       else
//  866       {
//  867       row = temp;
??BlackLeftAgainForCross_4:
        MOV      R4,R8
//  868       }
//  869       ////////////////���Ҫע�ͣ��ʹ��������ע��
//  870       
//  871       //��ʱ����confirm���������Ҫ�õĻ� ���ͰѺ�����仰ȥ����ǰ��ע��ȥ����
//  872       //row = temp;
//  873     }
//  874     
//  875     Row2RealFirstLine = row; //��¼��2�κ��ߵ���ʵ��ʼ��
        MOVS     R7,R4
//  876     
//  877     //ʮ���ټ���2�׶Σ�˳����ͷ���ߡ�
//  878     //tempΪԤ��ĺڵ�λ��
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
//  880     //���������֤�е�ȡ��Զ����
//  881     for(row -= 2; ; row -= 2)
        SUBS     R4,R4,#+2
        B.N      ??BlackLeftAgainForCross_7
??BlackLeftAgainForCross_8:
        SUBS     R4,R4,#+2
//  882     {
//  883       //����������еĺڵ���ɹ��������Ԥ����λ��
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
//  890       //���û���������м��ڵ�ɹ����򲻸���Ԥ���λ�ã�����ԭλ�á�
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
//  898      //ʮ���ټ���3�׶Σ��Բ������ߵĽ��ߡ�
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
//  909 //��������BlackLeftStep4BackLine
//  910 //��  �ܣ��������ȡ�У���4�׶�ʮ������ߺ�����
//  911 //��  ����Step4StartLine��ʼ��
//  912 //��  �أ�1�ɹ� 0ʧ��
//  913 //Ӱ  �죺BlackLeftLoc[][0]
//  914 //˵  ����1. ����������float�͵ĺ������п���ռ�ýϳ���ʱ�䡣
//  915 //        2. ��Ҫ����ʱ�䣬���԰Ѻ궨��BlackBackLineNum����3����2.
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
//  922   uint8 x[BlackBackLineNum];   //ȡ���ٸ�����һ��ʼ�ж��塣
//  923   uint8 y[BlackBackLineNum];
//  924   uint8 j;
//  925   
//  926   float temp;
//  927   float a0, a1;
//  928   
//  929   //ȡBlackBackLineNum������Ϊ��С���˷��Ļ�׼�㡣
//  930   //�����Ͻ�Ϊԭ�㣬����Ϊx������������Ϊy��������
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
//  950   //��С���˷�
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
//  957     //����Ҳ�и��ȣ��������Ҷ����ܲ�����Χ��
//  958     temp = a0 + a1 * row;
//  959     if(temp >= CameraRealWidth)
//  960     {
//  961       //BlackLeftLoc[row][0] = CameraRealWidth - 1;
//  962       //�������ҽ���ʱ��ԭ����Ϊ�ñ߽�ֵ�����ڵĲ����ǴӸ���������Чֵ��
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
//  973       //�������ҽ���ʱ��ԭ����Ϊ�ñ߽�ֵ�����ڵĲ����ǴӸ���������Чֵ��
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
//  995 //��������BlackGetLeft
//  996 //��  �ܣ��������ȡ�㷨
//  997 //��  ������
//  998 //��  �أ�1�ɹ� 0ʧ��
//  999 //Ӱ  �죺BlackLeftCrossDone��BlackLeftLoc[][],
// 1000 //        BlackLeftRealWB[], BlackLeftRealW[], BlackLeftRealB[],
// 1001 //        LimitLeftWB, LimitLeftW, LimitLeftB
// 1002 //˵  ����1. ��ʱ���Դ���ֱ���������ʮ��·��3�������2014.11.10
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
// 1012     //��4�׶ν����־��
// 1013     Step4Flag = 0;
        MOVS     R5,#+0
// 1014     //Ĭ��ʮ�ּ���־��Ϊδ���롣
// 1015     BlackLeftCrossDone = 0;    
        LDR.W    R0,??DataTable19
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 1016     
// 1017     //��1�׶Ρ���1�׶��п��ܻ᷵�غ�����ȡʧ��
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
// 1026       //�����ʼ��ͷ��λ�÷ǳ��ߣ�����Ϊ��ʮ�ֵ�ǰ�����ǣ���Ҫ�����4�׶�����ߡ�    
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
// 1034     //��2�׶Ρ�������һ�׶Σ��Ѿ����᷵�غ�����ȡʧ�� 
// 1035     //���濪ʼ����б���Һڵ㡣
// 1036     //�ϴ��Ѿ��������˵�row-1�У���һ��Ҫ�����row-2��
// 1037     //BlackLeftSlope();
// 1038     
// 1039     //tempΪԤ��ĺڵ�λ��
// 1040 
// 1041     //��Ԥ��ֵ�Ĵ�С�޶�
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
// 1057     GapCount = 0;  //����������û�вɼ�������
        MOVS     R9,#+0
// 1058     //���������֤�е�ȡ��Զ����
// 1059     for(row -= 2; ; row -= 2)
        SUBS     R10,R10,#+2
        B.N      ??BlackGetLeft_6
??BlackGetLeft_7:
        SUBS     R10,R10,#+2
// 1060     {
// 1061       //����������еĺڵ���ɹ��������Ԥ����λ��
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
// 1070       {   //��Ԥ��ֵ�Ĵ�С�޶�
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
// 1084       //���û���������м��ڵ�ɹ����򲻸���Ԥ���λ�ã�����ԭλ�á�
// 1085       //����������о��ɼ�����ʧ�ܣ���������ǵ�һ��ֵ������һ��Step1
// 1086       //�����4�׶μ���־��λ���Ͳ��ý���ʮ�ּ���ˡ�
// 1087       else if(temp3)
??BlackGetLeft_10:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??BlackGetLeft_12
// 1088       {       
// 1089         //Row1RealLastLine��¼��1�κ��ߵ����һ�С�
// 1090         if(index == 0)
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??BlackGetLeft_14
// 1091         {
// 1092           //����һ�κ󣬾���Ҳ��������ˡ�
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
// 1112         ///////////////////////////////����ʮ�����¼���������Ҫ���ϸ�һЩ������û��Ҫ��ʱ�䣬����˵ǰ�����ֻ�����⵽�����С�
// 1113         if(GapCount > BlackCrossGapLine)
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+11
        BCC.N    ??BlackGetLeft_18
// 1114         {
// 1115           //�ټ��ʱ����̫Զ�ˣ���û��Ҫ����ˡ�
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
// 1124           //���������ôȡ������������������������������
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
// 1127             BlackLeftCrossDone = 1;  //ʮ�ּ��ʧ��           
        LDR.W    R0,??DataTable19
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        B.N      ??BlackGetLeft_22
// 1128           }
// 1129           else
// 1130           {
// 1131             BlackLeftCrossDone = 2;  //ʮ�ּ��ɹ�
??BlackGetLeft_21:
        LDR.W    R0,??DataTable19
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
// 1132           }
// 1133           break;  //ʮ���ټ����Ὺ����⵽ָ�������һ�У����Բ�����ѭ���ˣ�ֱ������
??BlackGetLeft_22:
        B.N      ??BlackGetLeft_19
// 1134           
// 1135         }
// 1136         else
// 1137         {
// 1138           BlackLeftCrossDone = 0;   //ʮ�ּ��δ����
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
// 1151     //��4�׶Σ��ɼ���ʮ�ֵ�ǰ�����ǣ�����ߡ������и������㣬Ҫ�ϸ���Ƶ��á�
// 1152     //////////////////////////��ʵ���룬����������𣬷����˿������ƺ��Գ�û̫���á�
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
// 1167 //====================================����������������������������������============================
// 1168 
// 1169 
// 1170 
// 1171 //======================================================================
// 1172 //��������BlackRightRealClear
// 1173 //��  �ܣ��Һ�����ȡ�У���3���ؼ�ֵ��ʵ��ֵ����
// 1174 //��  ������
// 1175 //��  �أ���
// 1176 //Ӱ  �죺BlackRightRealWB[], BlackRightRealW[], BlackRightRealB[]
// 1177 //˵  ����
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
// 1194 //��������BlackGetRightStep1Edge
// 1195 //��  �ܣ��Һ�����ȡ�У���1�׶������⺯��,����������ߵĿ��ɺڵ�
// 1196 //��  �����������к�row, �ڼ���ʹ��use, �Ƿ�Ϊʮ���ټ����ñ�־λCrossFlag
// 1197 //��  �أ�1�ɹ� 0ʧ��
// 1198 //Ӱ  �죺BlackRightRealWB[], BlackRightRealW[], BlackRightRealB[]
// 1199 //        BlackRightLoc[][]
// 1200 //˵  ����1. �Ե�row�е��������ҽ��м�⣬�ɹ��͸���Ӧ��ֵ����3������ֵ����ʧ����255
// 1201 //        2. ��������������ʱ������ɹ����������3��ֵ���м�¼���ֽ׶�ֻ�õ��˵�1��ֵ
// 1202 //        3. �������漰3���ؼ�ֵ��ʵ��ֵ�ļ�¼��CrossFlag������Ͳ��ü�¼��Ҳ�Ͳ��ø��ģ�
// 1203 //        4. ��1���ڵ�Ҳû�У����߳���3���ڵ㣬����ʧ�ܡ�
// 1204 //        5. ��Ҫ���ڵ��׵����䣬�����������䣬�ı��һ���������ɡ�
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
// 1210   uint8 RightBeginCol; //�������������
// 1211   
// 1212   //����߼��ɹ�ʱ
// 1213   if(BlackLeftDone == 1)
        LDR.W    R0,??DataTable20_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??BlackGetRightStep1Edge_0
// 1214   {
// 1215       //������������������Ҫ�ȸ������ߵ������Ҫ���ҡ�
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
// 1222       //����Ҫ������������4+BlackRightEdgeNum����
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
// 1224       //ͬʱ��Ҳ���ܳ����������219����ʵ�ǲ��ܳ���CameraRealWidth - 5 - BlackRightEdgeNum������forѭ���
// 1225       RightBeginCol = MinRe(RightBeginCol, CameraRealWidth - 5 - BlackRightEdgeNum);
        MOVS     R1,#+243
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       MinRe
        MOV      R8,R0
        B.N      ??BlackGetRightStep1Edge_2
// 1226     }
// 1227   }
// 1228   //����߼��ʧ��ʱ���Һ��߼������Ҫ�������߿���BlackRightEdgeStartColOffset��ô���С�
// 1229   else
// 1230   {
// 1231     RightBeginCol = CameraRealWidth/2 - BlackRightEdgeStartColOffset;  
??BlackGetRightStep1Edge_0:
        MOVS     R8,#+75
// 1232   }
// 1233   
// 1234   index = 0;         //���ɵ�����
??BlackGetRightStep1Edge_2:
        MOVS     R7,#+0
// 1235   //���м䵽���ұ�ɨ�裬��1�������
// 1236   for(col = RightBeginCol; col <= CameraRealWidth - 5 - BlackRightEdgeNum; col++) 
        B.N      ??BlackGetRightStep1Edge_3
// 1237   {
// 1238       abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col+1+BlackRightEdgeNum]);
// 1239       if( //�����صĵ�һ��������
// 1240           //�ڹ��ڣ��׹��ף����
// 1241           //�����3����ֵΪ��ʼֵ����������Ӧ֮�������ֵ��
// 1242           (abs1 > LimitRightWB) //���ߵĲ��
// 1243         &&(ImgNew[row][col] > LimitRightW)                     //�׵㹻��
// 1244         &&(ImgNew[row][col+1+BlackRightEdgeNum] < LimitRightB) //�ڵ㹻��
// 1245          )
// 1246       {         
// 1247           //�����صĵڶ���������
// 1248           //�������У�����3������Ϊ�ڵ�
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
// 1261               //�м���У�����2������Ϊ�ڵ㡣
// 1262               temp1 = (
// 1263                         (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB)
// 1264                       &&(ImgNew[row][col+3+BlackRightEdgeNum] < LimitRightB)
// 1265                       );
// 1266             }
// 1267             //Զ�����У�����1������Ϊ�ڵ㡣
// 1268             else
// 1269             {
// 1270               temp1 = (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB);
// 1271             }
// 1272           }
// 1273           
// 1274           if(temp1)
// 1275           {
// 1276                             
// 1277               //����3�����ɺڵ㣬�򱨴�
// 1278               if(index == 3)       
// 1279               {
// 1280                 //�����ʮ���ټ��ĵ��ã��Ͳ��ø����⼸��ֵ��
// 1281                 if(CrossFlag)
// 1282                 {
// 1283                   //��3���ؼ�ֵ��ʵ��ֵ����
// 1284                   BlackRightRealClear();
// 1285                 }
// 1286                 //���ж�λ����ʧ�ܣ�����Чֵ
// 1287                 BlackRightLoc[row][0] = MaxValUint8;
// 1288                 return 0;
// 1289               }
// 1290               
// 1291               //�����ʮ���ټ��ĵ��ã��Ͳ��ø����⼸��ֵ��
// 1292               if(CrossFlag)
// 1293               {
// 1294                 //��������˵�������صĶ������������㣬����ڵ��¼�׶�
// 1295                 //��¼3���ؼ�ֵ��ʵ����Ϣ����Ϊ����Ĳο���
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
// 1312               //������ɹ���ȡ�ڵ�
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
// 1316           }    //end of �����صĵڶ�������
// 1317       }   //end of �����صĵ�һ������
// 1318   }// end of ���м䵽�����ɨ�裬��1�������
// 1319   
// 1320   //1�����ɺڵ�Ҳû�У��򱨴�
// 1321   if(index == 0)
??BlackGetRightStep1Edge_7:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??BlackGetRightStep1Edge_20
// 1322   {
// 1323     //�����ʮ���ټ��ĵ��ã��Ͳ��ø����⼸��ֵ��
// 1324     if(CrossFlag)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??BlackGetRightStep1Edge_21
// 1325     {
// 1326       //��3���ؼ�ֵ��ʵ��ֵ����
// 1327       BlackRightRealClear();
        BL       BlackRightRealClear
// 1328     }
// 1329     //���ж�λ����ʧ�ܣ�����Чֵ
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
// 1334   //û�б����ͻ��ߵ�����ڵ���ҳɹ�������1��2��3���ڵ�
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
// 1341 //��������BlackGetRightStep2Win
// 1342 //��  �ܣ��Һ�����ȡ�У���2�׶δ����������⺯��
// 1343 //��  �����������к�row, ���ڴ�Сwin, Ԥ���������λ��predict
// 1344 //��  �أ�1�ɹ�  0ʧ��
// 1345 //Ӱ  �죺BlackRightLoc[][0]
// 1346 //˵  ����1. �����������������ܼ��ɹ���ֻ��һ����ļ�¼��
// 1347 //        2. ������û�м�⵽������ʧ�ܡ�
// 1348 //        3. ����С���Լ���һ����ʱ�䣬���������б�ʹ������������п��ܼ�ⲻ����     
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
// 1355   //�ڹ滮�õĴ����ڣ��������Ҳ���������
// 1356   //��ֹ���
// 1357   //���ұ߽������ 
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
// 1366   //����߽������
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
// 1379     if( //�����صĵ�һ��������
// 1380         //�ڹ��ڣ��׹��ף����
// 1381         //�����3����ֵ������Ӧ֮�������ֵ
// 1382           (abs1 > LimitRightWB) //���ߵĲ��
// 1383         &&(ImgNew[row][col] > LimitRightW)                     //�׵㹻��
// 1384         &&(ImgNew[row][col+1+BlackRightEdgeNum] < LimitRightB)                   //�ڵ㹻��
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
// 1388           //�������У�����3������Ϊ�ڵ�
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
// 1399             //�м���� ������2����Ϊ��Ϊ�ڵ�
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
// 1407             //Զ�����У�����1������Ϊ�ڵ�
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
// 1414           //�����صĵڶ���������
// 1415           if(temp1)
??BlackGetRightStep2Win_14:
??BlackGetRightStep2Win_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.W    ??BlackGetRightStep2Win_4
// 1416           {
// 1417           //�������������㣬ֱ�Ӽ�¼�õ�Ϊ���ߣ����ؼ���
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
// 1421           }// end of �����ؼ��ĵ�2������
// 1422     }// end of �����ؼ��ĵ�1������
// 1423     
// 1424     
// 1425     
// 1426   }// end of forѭ��
// 1427   
// 1428   //���һֱ����������߻�û���ҵ������أ�
// 1429   
// 1430   BlackRightLoc[row][0] = MaxValUint8;   //���еĺ���λ�ü�Ϊ��Чֵ
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
// 1438 //��������BlackGetRightStep1Scan
// 1439 //��  �ܣ��Һ�����ȡ�У���1�׶ε���ɨ�躯��
// 1440 //��  ����ɨ����ʼ��FirstLine, ɨ�������LastLine, ʮ���ټ���־CrossFlag
// 1441 //��  �أ�0~CameraHight - 1���� 255�ɼ�ʧ��
// 1442 //Ӱ  �죺BlackRightRealWB[], BlackRightRealW[], BlackRightRealB[], BlackRightLoc[][],
// 1443 //        LimitRightWB, LimitRightW, LimitRightB
// 1444 //˵  ����1. �����������ص�1�׶���ɨ�裬Ҳ������ʮ���ټ��ʱ����ɨ��
// 1445 //        2. ������1�׶�ɨ��ʱ�������3���ؼ���ֵ��ֵ��
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
// 1454   //�����BlackStep1Size���ò�ֵ���Һ���
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
// 1457       //�ж��Ƿ��������м�⵽���䣬���ɺڵ���3���㣬��ȡ����һ��
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
// 1460       if(temp1 && temp2)//���������ôд������Ƕ��if����Ϊ&&���ص�
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
// 1463         //��һ���ж��������еĺڵ�ļ���Ƿ�С������ȡ��1�����ɺڵ㡣
// 1464         if(abs1 < BlackRightStep1ScanMinus)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BCS.N    ??BlackGetRightStep1Scan_1
// 1465         {
// 1466           //��⵽�������ĺ��ߣ�ֹͣ��ֵ���������أ���ʡʱ�䣬��������2�׶�                                     
// 1467           //�������ʮ���ټ���������͸���һ��ʵ�ʵ�3���ؼ�ֵ�����򲻸��¡�
// 1468           if(CrossFlag)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??BlackGetRightStep1Scan_3
// 1469             {           
// 1470               //��ֵ�Ĵ�������ԣ�ȣ��������½硣
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
// 1477               //�׵�Ĵ�������ԣ�ȣ��������½硣
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
// 1484               //�ڵ�Ĵ�������ԣ�ȣ��������½硣
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
// 1496     //�����BlackStep1Size��Ҳû�м�⵽�����ĺ��ߣ�˵�����߼��ʧ��
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
// 1506 //��������BlackRightCrossStep3
// 1507 //��  �ܣ�������ȡ�У�ʮ�ּ���3�׶Σ��Բ��ߺ���
// 1508 //��  ������1����Ч���ߵ����һ��FirstLine�� ��2����Ч���ߵĵ�һ��LastLine
// 1509 //��  �أ�1�ɹ� 0ʧ��
// 1510 //Ӱ  �죺BlackRightLoc[][0]
// 1511 //˵  ����1. ������һЩ�������㣬��ռʱ�䣬�ڵ��ñ�����ʱҪ���أ�������Ҫ�á�
// 1512 //        2. �������������ߵ�˼·�ܲ���floatǿת��uint8ǿת�õúܺá�
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
// 1521   //��ʼ�бȽ����л��ߣ�����
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
// 1534   //ȷ������������ֱ�Ǵ��ĵ㣬Ҳ��������6������Ϊ�ڵ�
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
// 1571   //б������
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
// 1575     delta = delta_x / delta_y; //����1��������
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
// 1580       //ÿ������һ���
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
// 1585   //б������
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
// 1594       //ÿ������һ���
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
// 1599   //б��ֱ�ߣ������̫���ܳ���
// 1600   else
// 1601   {
// 1602     for(row = FirstLine - 1; row >= LastLine + 1; row-- )
??BlackRightCrossStep3_5:
        SUBS     R6,R4,#+1
        B.N      ??BlackRightCrossStep3_7
// 1603     {
// 1604       //����ͬ��ֵ
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
// 1614 //��������BlackRightCrossConfirm
// 1615 //��  �ܣ�ʮ���ټ��ʱ ����ͷ��Ч�Ե�ȷ�ϡ�
// 1616 //��  ������1�κ��ߵ���ʵ������Row1RealLastLine����2�κ��ߵ���ʵ��ʼ��Row2RealFirstLine
// 1617 //��  �أ�1�ɹ� 0ʧ��
// 1618 //Ӱ  �죺��
// 1619 //˵  ����1. Ϊ��Ӧ��270�����ʮ���������������д������û�й��࿼�����������
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
// 1631   //��һ�κ���̫�̣��޷������ȷ�ԡ�ֱ�ӷ���1.
// 1632   if(Row1RealLastLine < 5) return 1;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BCS.N    ??BlackRightCrossConfirm_0
        MOVS     R0,#+1
        B.N      ??BlackRightCrossConfirm_1
// 1633   
// 1634   //�����Ͻ�Ϊԭ�㣬����Ϊx��������0~49��������Ϊy��������(0~249)
// 1635   index = 0;
??BlackRightCrossConfirm_0:
        MOVS     R1,#+0
// 1636   for(row = Row1RealLastLine; ; row++)
        B.N      ??BlackRightCrossConfirm_2
??BlackRightCrossConfirm_3:
        ADDS     R0,R0,#+1
// 1637   {
// 1638     //��Ч�еļ�¼
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
// 1645     //�������࣬��������
// 1646     if(index == BlackCrossConfirmNum) break;
??BlackRightCrossConfirm_4:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+3
        BNE.N    ??BlackRightCrossConfirm_5
// 1647     //ֱ���������û�дչ��㹻�ĵ�����˵����һ����Ч����̫�̣��޷������ȷ�ԣ�ֱ�ӷ���1.
// 1648     if(row == CameraHight - 1) return 1;
// 1649   }
// 1650   
// 1651   //��С���˷�
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
// 1656   //tempΪ��2�κ�����ʼ�б�Ӧ���ڵ�λ�á�
// 1657   temp = a0 + a1 * Row2RealFirstLine;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        BL       __aeabi_ui2f
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
// 1658   //������λ�ñ����ͳ��������ұ߽�ķ�Χ����˵���������е�2�κ��ߴ����ˡ�
// 1659   //Ҳ�Ͳ��ü���2�κ����ˣ�ֱ�ӷ���0.
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
// 1665   { //���ﱾ��Ӧ�ü��ϰ�������޶��ڴ��ڣ������ƺ�û��Ҫ��
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
// 1676 //��������BlackRightAgainForCross
// 1677 //��  �ܣ��Һ�����ȡ�У����ʮ�ֵ��ټ�����
// 1678 //��  ������2�κ��ߵ�Ԥ����ʼ��Row2FirstLine�� ��2�κ��ߵ�Ԥ�������Row2LastLine��
// 1679 //        ��1�κ��ߵ�ʵ�ʽ�����Row1RealLastLine
// 1680 //��  �أ�1�ɹ� 0ʧ��
// 1681 //Ӱ  �죺BlackRightLoc[][]�� ������Ӱ���Ǽ�����ֵ����
// 1682 //˵  ����1. ����������ø�������ĺ�����Ԥ�ƻ��ѽ϶�ʱ�䣬��������������
// 1683 //        2. ��������Ӱ����BlackRightLoc[][]���Ժ�ҲӦ�ñ��֡�
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
// 1689     uint8 Row2RealFirstLine; //��2�κ��ߵ���ʵ��ʼ��
// 1690     uint8 i;
// 1691     
// 1692     //ʮ���ټ���1�׶Σ�����ͷ��
// 1693     temp = BlackGetRightStep1Scan(Row2FirstLine, Row2LastLine, 0); //��3������0��ʾ��ʮ���ټ�⣬���ø���3���ؼ�ֵ
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
// 1696       //ɨƨ�ɹ�����        //i >= Row2LastLine
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
// 1706       ////////////////���Ҫע�ͣ��ʹ����￪ʼע��
// 1707       //ʮ���ټ�����ͷ�����޶��ķ�Χ�ڣ���Ϊ�Ǹ��ŵ㣬����˳����ͷ�����ˣ�ֱ���˳���
// 1708       if(!BlackRightCrossConfirm(Row1RealLastLine, temp))
??BlackRightAgainForCross_0:
        MOV      R1,R8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BlackRightCrossConfirm
        CMP      R0,#+0
        BNE.N    ??BlackRightAgainForCross_4
// 1709       { //ɨƨ�ɹ�����         //i >= (temp-1)
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
// 1717       //ʮ���ټ�����ͷ��ȷ���޶��ķ�Χ�ڣ����Լ�����
// 1718       else
// 1719       {
// 1720       row = temp;
??BlackRightAgainForCross_4:
        MOV      R4,R8
// 1721       }
// 1722       ////////////////���Ҫע�ͣ��ʹ��������ע��
// 1723       
// 1724       //��ʱ����confirm���������Ҫ�õĻ� ���ͰѺ�����仰ȥ����ǰ��ע��ȥ����
// 1725       //row = temp;
// 1726     }
// 1727     
// 1728     Row2RealFirstLine = row; //��¼��2�κ��ߵ���ʵ��ʼ��
        MOVS     R7,R4
// 1729     
// 1730     //ʮ���ټ���2�׶Σ�˳����ͷ���ߡ�
// 1731     //tempΪԤ��ĺڵ�λ��
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
// 1733     //���������֤�е�ȡ��Զ����
// 1734     for(row -= 2; ; row -= 2)
        SUBS     R4,R4,#+2
        B.N      ??BlackRightAgainForCross_7
??BlackRightAgainForCross_8:
        SUBS     R4,R4,#+2
// 1735     {
// 1736       //����������еĺڵ���ɹ��������Ԥ����λ��
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
// 1743       //���û���������м��ڵ�ɹ����򲻸���Ԥ���λ�ã�����ԭλ�á�
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
// 1751     //ʮ���ټ���3�׶Σ��Բ������ߵĽ��ߡ�
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
// 1763 //��������BlackRightStep4BackLine
// 1764 //��  �ܣ��Һ�����ȡ�У���4�׶�ʮ������ߺ�����
// 1765 //��  ����Step4StartLine��ʼ��
// 1766 //��  �أ�1�ɹ� 0ʧ��
// 1767 //Ӱ  �죺BlackRightLoc[][0]
// 1768 //˵  ����1. ����������float�͵ĺ������п���ռ�ýϳ���ʱ�䡣
// 1769 //        2. ��Ҫ����ʱ�䣬���԰Ѻ궨��BlackBackLineNum����3����2.
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
// 1776   uint8 x[BlackBackLineNum];   //ȡ���ٸ�����һ��ʼ�ж��塣
// 1777   uint8 y[BlackBackLineNum];
// 1778   uint8 j;
// 1779   float temp;
// 1780     
// 1781   float a0, a1;
// 1782   
// 1783   //ȡBlackBackLineNum������Ϊ��С���˷��Ļ�׼�㡣
// 1784   //�����Ͻ�Ϊԭ�㣬����Ϊx������������Ϊy��������
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
// 1804   //��С���˷�
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
// 1811     //����Ҳ�и��ȣ����Һ����󶼲��ܲ�����Χ��
// 1812     temp = a0 + a1 * row;
// 1813     if(temp > CameraRealWidth)
// 1814     {
// 1815       //BlackRightLoc[row][0] = CameraRealWidth - 1;
// 1816       //�������ҽ���ʱ��ԭ����Ϊ�ñ߽�ֵ�����ڵĲ����ǴӸ���������Чֵ��
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
// 1827       //�������ҽ���ʱ��ԭ����Ϊ�ñ߽�ֵ�����ڵĲ����ǴӸ���������Чֵ����
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
// 1847 //��������BlackGetRight
// 1848 //��  �ܣ��Һ�����ȡ�㷨
// 1849 //��  ������
// 1850 //��  �أ�1�ɹ� 0ʧ��
// 1851 //Ӱ  �죺BlackRightCrossDone��BlackRightLoc[][],
// 1852 //        BlackRightRealWB[], BlackRightRealW[], BlackRightRealB[],
// 1853 //        LimitRightWB, LimitRightW, LimitRightB
// 1854 //˵  ����1. ��ʱ���Դ���ֱ���������ʮ��·��3�������2014.11.10
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
// 1865     //��4�׶ν����־��
// 1866     Step4Flag = 0;
        MOVS     R5,#+0
// 1867 
// 1868     //Ĭ��ʮ�ּ���־��Ϊδ���롣
// 1869     BlackRightCrossDone = 0;
        LDR.W    R0,??DataTable25
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 1870     
// 1871     
// 1872     //��1�׶Ρ���1�׶��п��ܻ᷵�غ�����ȡʧ��
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
// 1881       //�����ʼ��ͷ��λ�÷ǳ��ߣ�����Ϊ��ʮ�ֵ�ǰ�����ǣ���Ҫ�����4�׶�����ߡ�    
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
// 1891     //��2�׶Ρ�������һ�׶Σ��Ѿ����᷵�غ�����ȡʧ�� 
// 1892     //���濪ʼ����б���Һڵ㡣
// 1893     //�ϴ��Ѿ��������˵�row-1�У���һ��Ҫ�����row-2��
// 1894     //BlackRightSlope();
// 1895     
// 1896     //tempΪԤ��ĺڵ�λ��
// 1897     //��Ԥ��ֵ�����޶���
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
// 1913     GapCount = 0;  //����������û�вɵ�����
        MOVS     R9,#+0
// 1914     //���������֤�е�ȡ��Զ����
// 1915     for(row -= 2; ; row -= 2)
        SUBS     R10,R10,#+2
        B.N      ??BlackGetRight_6
??BlackGetRight_7:
        SUBS     R10,R10,#+2
// 1916     {
// 1917       //����������еĺڵ���ɹ��������Ԥ����λ��
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
// 1927         //��Ԥ��ֵ�����޶���
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
// 1941       //���û���������м��ڵ�ɹ����򲻸���Ԥ���λ�ã�����ԭλ�á�
// 1942       //����������о��ɼ�����ʧ�ܣ���������ǵ�һ��ֵ������һ��Step1
// 1943       //�����4�׶μ���־��λ���Ͳ��ý���ʮ�ּ���ˡ�
// 1944       else if(temp3)
??BlackGetRight_10:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??BlackGetRight_12
// 1945       {       
// 1946         //Row1RealLastLine��¼��1�κ��ߵ����һ�С�
// 1947         if(index == 0)
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??BlackGetRight_14
// 1948         {
// 1949           //����һ�κ󣬾���Ҳ��������ˡ�
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
// 1969         ///////////////////////////////����ʮ�����¼���������Ҫ���ϸ�һЩ������û��Ҫ��ʱ�䣬����˵ǰ�����ֻ�����⵽�����С�
// 1970         if(GapCount > BlackCrossGapLine)
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+11
        BCC.N    ??BlackGetRight_18
// 1971         {
// 1972           //�ټ��ʱ����̫Զ�ˣ���û��Ҫ����ˡ�
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
// 1981           //���������ôȡ������������������������������
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
// 1984             BlackRightCrossDone = 1;  //ʮ�ּ��ʧ��            
        LDR.W    R0,??DataTable25
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        B.N      ??BlackGetRight_22
// 1985           }
// 1986           else
// 1987           {
// 1988             BlackRightCrossDone = 2;  //ʮ�ּ��ɹ�
??BlackGetRight_21:
        LDR.W    R0,??DataTable25
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
// 1989           }
// 1990           break;  //ʮ���ټ����Ὺ����⵽ָ�������һ�У����Բ�����ѭ���ˣ�ֱ������
??BlackGetRight_22:
        B.N      ??BlackGetRight_19
// 1991         }
// 1992         else
// 1993         {
// 1994            BlackRightCrossDone = 0;    //ʮ�ּ��δ����
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
// 2008     //��4�׶Σ��ɼ���ʮ�ֵ�ǰ�����ǣ�����ߡ������и������㣬Ҫ�ϸ���Ƶ��á�
// 2009     //////////////////////////��ʵ���룬����������𣬷����˿������ƺ��Գ�û̫���á�
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
// 2027 //��������BlackGet
// 2028 //��  �ܣ�������ȡ����
// 2029 //��  ������
// 2030 //��  �أ�1�ɹ� 0ʧ��
// 2031 //Ӱ  �죺����������Һ����㷨
// 2032 //˵  ����1. ѧ���ĺ�����ȡ�㷨�кܶ�������������ԶԲ�ͬ�����µĺ��߽�����ȡ������Ч��
// 2033 //        2. ���Һ��߷ֿ���ȡ�����Һ�����ȡ����ʼ�����������ȡ�Ľ��Ϊ׼��ǰ�����������ȡ�ɹ�����
// 2034 //        3. Ϊ�˷�ֹ���ߵ�ͻ�䣬���Һ��߸���2�λ��ᣬ��2�λ��Ὣ���3���ؼ�ֵ����ԭʼֵ����һ�Ρ�
// 2035 //           ������ǹ��ߵ�ԭ��3���ؼ�ֵ��������
// 2036 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2037 uint8 BlackGet(void)
// 2038 {
BlackGet:
        PUSH     {R4-R6,LR}
// 2039     uint8 tempLWB, tempLW, tempLB;
// 2040     uint8 tempRWB, tempRW, tempRB;
// 2041     //�ɼ��ɹ���־λ
// 2042     BlackLeftDone = 1;
        LDR.W    R0,??DataTable26_1
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
// 2043     BlackRightDone = 1;
        LDR.W    R0,??DataTable26_2
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
// 2044     
// 2045     //�������ȡ���ɹ��򷵻�1��ʧ���򷵻�0.
// 2046     if(!BlackGetLeft())
        BL       BlackGetLeft
        CMP      R0,#+0
        BNE.N    ??BlackGet_0
// 2047     {
// 2048       //�ݴ�3���ؼ�ֵ��������ǹ��ߵ�ԭ��ֵ�ͱ������
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
// 2053       //�п����ǹ��߱仯̫��3���ؼ�ֵ�Ļ�ԭ����ֵ���ٸ�1�λ��ᡣ
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
// 2058       //���ǹ��ߵ�ԭ��
// 2059       if(!BlackGetLeft())
        BL       BlackGetLeft
        CMP      R0,#+0
        BNE.N    ??BlackGet_1
// 2060       {
// 2061         //���ǹ��ߵ�ԭ�������£���3���ؼ�ֵ�������
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
// 2069       //��ȷ�ǹ��ߵ�ԭ��
// 2070       else
// 2071       {
// 2072         BlackLeft3ResetCount++;    //���ڹ��߱仯̫�������3���ؼ�ֵ���õĴ�����
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
// 2077     //�Һ�����ȡ���ɹ��򷵻�1��ʧ���򷵻�0.
// 2078     if(!BlackGetRight())
??BlackGet_0:
        BL       BlackGetRight
        CMP      R0,#+0
        BNE.N    ??BlackGet_2
// 2079     {
// 2080       //�ݴ�3���ؼ�ֵ��������ǹ��ߵ�ԭ��ֵ�ͱ������
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
// 2085       //�п����ǹ��߱仯̫��3���ؼ�ֵ�Ļ�ԭ����ֵ���ٸ�1�λ��ᡣ
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
// 2090       //���ǹ��ߵ�ԭ�������£���3���ؼ�ֵ�������
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
// 2100       //��ȷ�ǹ��ߵ�ԭ��
// 2101       else
// 2102       {
// 2103         BlackRight3ResetCount++;    //���ڹ��߱仯̫�������3���ؼ�ֵ���õĴ�����
??BlackGet_3:
        LDR.W    R0,??DataTable26_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable26_7
        STRB     R0,[R1, #+0]
// 2104       }
// 2105     }
// 2106     
// 2107     //���Һ��߾���ȡʧ�ܣ��������ȡʧ�ܡ�
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
// 2112     //��ʱ���ǲ���ȡ��������ߵķ�ʽ����Ϊ��ȷ����һ����ʮ�ֲ��ߣ�һ��������ߵ������
// 2113     /*
// 2114     //���Һ��߾���ȡ�ɹ�����һ���Ƿ���Ҫ����ߡ�
// 2115     else if((BlackLeftDone == 1) && (BlackRightDone == 1))
// 2116     {
// 2117       //���Һ��߾�Ҫ�������ʱ����ִ�в��߳��򡣷����п��������ʹ��ͷ�ϸ��������
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
// 2144 //��������CenterLineGet
// 2145 //��  �ܣ���������ȡ����
// 2146 //��  ������
// 2147 //��  �أ�1�ɹ� 0ʧ��
// 2148 //Ӱ  �죺CenterLineLoc[]
// 2149 //˵  ����1. �ݶ�Ϊȡ������Ч���ߵ��е㣬Ϊ�����汾��2014.11.11
// 2150 //      
// 2151 //             
// 2152 //======================================================================
// 2153 uint8 CenterLineGet(void)
// 2154 {
// 2155   uint8 row;
// 2156   uint8 templ, tempr;
// 2157     
// 2158   //���Һ��߾���ȡʧ�ܡ�
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
// 2169     //���Һ��߾���ȡ�ɹ���
// 2170     if((BlackLeftDone == 1) && (BlackRightDone ==  1))
// 2171     {   
// 2172       //�������Һ��߶���ȡ���ˡ�
// 2173       if((templ != MaxValUint8) && (tempr != MaxValUint8))  
// 2174       {
// 2175         CenterLineLoc[row] = (templ + tempr) / 2;
// 2176       }
// 2177       //�����������ȡ���ˣ��Һ�����ȡʧ�ܡ�
// 2178       else if((templ != MaxValUint8) && (tempr == MaxValUint8))
// 2179       {
// 2180         CenterLineLoc[row] = templ + CenterLineHalfWidth[row];
// 2181       }
// 2182       //�����Һ�����ȡ���ˣ��������ȡʧ�ܡ�
// 2183       else if((tempr != MaxValUint8) && (templ == MaxValUint8))  
// 2184       {
// 2185         CenterLineLoc[row] = tempr - CenterLineHalfWidth[row];
// 2186       }
// 2187       //�������Һ��߾���ȡʧ�ܣ��������ĵ㸳��Чֵ��
// 2188       else 
// 2189       {
// 2190         CenterLineLoc[row] = MaxValUint8;  
// 2191       }
// 2192     }
// 2193     //�������ȡ�ɹ����Һ�����ȡʧ��
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
// 2205     //�Һ�����ȡ�ɹ����������ȡʧ��
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
// 2222     //������������һ�У�������forѭ����
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
// 2240   //���Һ��߾���ȡʧ�ܡ�
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
// 2246   //���Һ��߾���ȡ�ɹ���
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
// 2254       //�������Һ��߶���ȡ���ˡ�
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
// 2259       //�����������ȡʧ�ܣ��Һ�����ȡ�ɹ���
// 2260       else if((templ == MaxValUint8) && (tempr != MaxValUint8))
??CenterLineGet_5:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+255
        BNE.W    ??CenterLineGet_7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+255
        BEQ.W    ??CenterLineGet_7
// 2261       {
// 2262         //�������������������ߵ�����ǰ������һ�е��Һ�������Чֵ��
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
// 2264         { //ǰһ�е���������Ч��
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
// 2269           //ǰһ�е���������Ч��
// 2270           //����ǽ������У��Ǿ��п�����270�����Һ��ߴ�λ�������
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
// 2281             //flag001 = 1; //flag001�Ǳ�־λ�����Է�ֹ��ͷ���е������߲������������
// 2282           }
// 2283           else
// 2284           { //�������ͲŴ������򲻿��ǡ�
// 2285             if(row <= CameraHight - 3)
??CenterLineGet_10:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+48
        BCS.N    ??CenterLineGet_12
// 2286             { //����3���ҷ���Ҫ����С�
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
// 2295               //����3��û���ҵ�����Ҫ����С�
// 2296               if(i == 5) CenterLineLoc[row] = MaxValUint8; //����Чֵ
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
// 2299             {   //�������ߣ����������������
// 2300                 CenterLineLoc[row] = MaxValUint8; //����Чֵ
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
// 2306           CenterLineLoc[row] = MaxValUint8; //����Чֵ
??CenterLineGet_8:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
        B.N      ??CenterLineGet_6
// 2307         }
// 2308       }
// 2309       //�����Һ�����ȡʧ�ܣ��������ȡ�ɹ���
// 2310       else if((templ != MaxValUint8) && (tempr == MaxValUint8))
??CenterLineGet_7:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+255
        BEQ.W    ??CenterLineGet_16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+255
        BNE.W    ??CenterLineGet_16
// 2311       {
// 2312         //�������������������ߵ�����ǰ������һ�е����������Чֵ��
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
// 2314         {  //��һ�е���������Ч��
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
// 2319           //��һ�е���������Ч��
// 2320           //����ǽ������У��Ǿ��п�����270�����Һ��ߴ�λ�������
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
// 2331             //flag001 = 1; //flag001�Ǳ�־λ�����Է�ֹ��ͷ���е������߲������������
// 2332           }
// 2333           else
// 2334           { //����3���ҷ�����������
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
// 2340                 { //�ҵ��˷����������С�
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
// 2345               if(i == 5) CenterLineLoc[row] = MaxValUint8; ////����3��û���ҵ�������������.����Чֵ
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
// 2348             { //����̫�ߣ���������������� 
// 2349               CenterLineLoc[row] = MaxValUint8; //����Чֵ
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
// 2355           CenterLineLoc[row] = MaxValUint8; //����Чֵ
??CenterLineGet_17:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable26_10
        MOVS     R1,#+255
        STRB     R1,[R5, R0]
        B.N      ??CenterLineGet_6
// 2356         }
// 2357       }
// 2358       //���������߾���ȡʧ�ܡ�
// 2359       else 
// 2360       {
// 2361         CenterLineLoc[row] = MaxValUint8; //����Чֵ
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
// 2366       //����Чֵ���ٴ���
// 2367       tempmax = MinRe(BlackLeftHeadLine, BlackRightHeadLine);
        LDR.W    R0,??DataTable27
        LDRB     R1,[R0, #+0]
        LDR.W    R0,??DataTable27_1
        LDRB     R0,[R0, #+0]
        BL       MinRe
// 2368       //��һ��������������Զ��ǰ3��֮�⡣
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
// 2371         //�ڶ�����������������ͷ֮�ڣ�����������ͷ�򲻴���
// 2372         if(row >= tempmax)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R5,R0
        BCC.N    ??CenterLineGet_25
// 2373         {
// 2374           //���������������ĺ��߲��������ұ߽硣
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
// 2381             //��������������
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
// 2397     //��������ȡ�ɹ�����¼��ͷ����Ϊ����ĵ�����ͷ��
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
// 2401       { //�����3������ͷ��
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
// 2419   //�������ȡ�ɹ����Һ�����ȡʧ�ܡ��ͻ����ϰ����������������ߡ�
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
// 2422     //�������ߵ���ͷ��
// 2423     for(row = CameraHight - 1; row > CameraHight - BlackStep1Size; row --)
        MOVS     R5,#+49
        B.N      ??CenterLineGet_32
// 2424     {
// 2425       //��������Чֵ�� //ԭΪ������������Чֵ���ָ�Ϊһ�С�
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
// 2443     //û���ҵ���������ͷ����������ȡʧ�ܡ�
// 2444     if(row <= CameraHight - BlackStep1Size) return 0;
??CenterLineGet_36:
??CenterLineGet_34:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+16
        BCS.N    ??CenterLineGet_37
        MOVS     R0,#+0
        B.N      ??CenterLineGet_1
// 2445     
// 2446     //�ҵ���ͷ���������ߵ����ƽ��������ߵĹ��ơ�
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
// 2450       {   //��һ�е���������Ч��
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
// 2455           //��һ�е���������Ч��
// 2456           else
// 2457           { //����3���ҷ�����������
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
// 2463                 { //�ҵ��˷����������С�
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
// 2468               if(i == 5) CenterLineLoc[row] = MaxValUint8; ////����3��û���ҵ�������������.����Чֵ
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
// 2471             { //����̫�ߣ���������������� 
// 2472               CenterLineLoc[row] = MaxValUint8; //����Чֵ
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
// 2478         CenterLineLoc[row] = MaxValUint8; //����Чֵ  
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
// 2486   //�Һ�����ȡ�ɹ����������ȡʧ�ܡ��ͻ����ϰ����������������ߡ�
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
// 2489     //�������ߵ���ͷ��
// 2490     for(row = CameraHight - 1; row > CameraHight - BlackStep1Size; row --)
        MOVS     R5,#+49
        B.N      ??CenterLineGet_48
// 2491     {
// 2492       //��������Чֵ�� //ԭΪ������������Чֵ���ָ�Ϊһ�С�
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
// 2510     //û���ҵ���������ͷ����������ȡʧ�ܡ�
// 2511     if(row <= CameraHight - BlackStep1Size) return 0;
??CenterLineGet_52:
??CenterLineGet_50:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+16
        BCS.N    ??CenterLineGet_53
        MOVS     R0,#+0
        B.N      ??CenterLineGet_1
// 2512     
// 2513     //�ҵ���ͷ���������ߵ����ƽ��������ߵĹ��ơ�
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
// 2518         //ǰһ�е����ĵ���Ч�������
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
// 2523         //ǰһ�е����ĵ���Ч�������
// 2524         else
// 2525         { //��������Ҫ��С��
// 2526           if(row <= CameraHight - 5)
??CenterLineGet_57:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+46
        BCS.N    ??CenterLineGet_59
// 2527           { //����3�в����Ƿ�����������Ч���С�
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
// 2536             //����3��û�ҵ�����Ҫ����У�����Чֵ��
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
// 2539           //����̫�ߣ������ˡ�
// 2540           else
// 2541           {
// 2542             CenterLineLoc[row] = MaxValUint8; //����Чֵ  
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
// 2548         CenterLineLoc[row] = MaxValUint8; //����Чֵ  
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
// 2559 //�����߲��䴦���������˵�25�У��Ͳ�����25�С�����250���ó�250��

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
// 2602 //ͼ�����¸�ֵ,�в��䣨����DMA�б仯��ѡȡ��Ҫ���У������޷���DMA�б仯����������仯��
// 2603 ///////////////////////////////////////////��������Ҫ��ʾ��������һ��ʱ�䣬���ǲ��Ǻķ���̫��ʱ�䡣

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
// 2626 //��������ɢ����ȡ�������������ɢ�̶ȣ��������ߵġ�

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
// 2633   //��ȡƽ��ֵ
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
// 2647   //1. ��ȡ��ͷ
// 2648   for(row = CameraHight - 1; ; row--)
// 2649   {
// 2650     if(CenterLineLoc[row] != MaxValUint8)
// 2651     {
// 2652       avg = CenterLineLoc[row];
// 2653       break;
// 2654     }
// 2655     if(row == 0) break;
// 2656   }
// 2657   //2. ������ƽ��
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
// 2687 //����������
// 2688 //��������������ȥ����uint16�͵ģ������ҵ��õ�ʱ��ֻ���õ�uint8�͵ģ��Ҳ��ᳬ��255.

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
// 2703 //���ߵ�������ȡ���������ҹգ�����Ϊ˳ʱ�뷽��ֲ���������Ϊ������������գ�����Ϊ��ʱ�ӷ���ֲ���������Ϊ��
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
// 2707   int16 SABC_temp; //�����ε��������������
// 2708   int16 tempab, tempbc, tempac;
// 2709   int16 AB, BC, AC; //�����εı߳�����Ϊ����
// 2710   //int16 K;        //���ʽ������������
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
// 2717     AB = MathSqrt(tempab / 100) * 10; //ʧ����λ�ľ��ȣ���Ϊ������㷶Χ�����ơ�
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
// 2727     BC = MathSqrt(tempbc / 100) * 10; //ʧ����λ�ľ��ȣ���Ϊ������㷶Χ�����ơ�
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
// 2737     AC = MathSqrt(tempac / 100) * 10; //ʧ����λ�ľ��ȣ���Ϊ������㷶Χ�����ơ�
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
// 2749 //SABC�������ȡ��˳ʱ���򷵻ظ�ֵ����ʱ���򷵻���ֵ��
// 2750 //�����½�Ϊԭ�㣬����Ϊx��������(0~249)������Ϊy��������(0~49)��

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
// 2761 //���ʷ�����ȡ
// 2762 //Ӱ�죺CurveSL, CurveSC, CurveSR, 0��Ч��1����2��
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
// 2769   //1. ���������ʷ�����ȡ
// 2770   //���ʷ���Ԥ�����㡣
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
// 2775   //���ʻ��ڵ���1 CurveLineChosen1�����ϵ���ȡ��һ����Чֵ��
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
// 2789   //�ѵ�1����Чֵ��CameraHight-1�ľ���ֳ�2�Ρ�
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
// 2797   //���ʻ��ڵ���2 CurveLineChosen2
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
// 2813   //���ʻ��ڵ���3 CurveLineChosen3
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
// 2829   //SABCC�����������������������ȡ
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
// 2840   //���Һ����п���ֻ��һ����ȡ�ɹ��������ɹ����Ͳ��÷�ʱ���ˡ�
// 2841   if(BlackLeftDone == 1)
        LDR.W    R0,??DataTable30_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??CurveSignGet_11
// 2842   {
// 2843     //2. ��������ʷ�����ȡ
// 2844     //���ʷ���Ԥ�����㡣
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
// 2849     //���ʻ��ڵ���1 CurveLineChosen1�����ϵ���ȡ��һ����Чֵ��
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
// 2863     //�ѵ�1����Чֵ��CameraHight-1�ľ���ֳ�2�Ρ�
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
// 2871     //���ʻ��ڵ���2 CurveLineChosen2
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
// 2887     //���ʻ��ڵ���3 CurveLineChosen3
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
// 2903     //SABCL����������������������ȡ
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
// 2916   //���Һ����п���ֻ��һ����ȡ�ɹ��������ɹ����Ͳ��÷�ʱ���ˡ�
// 2917   if(BlackRightDone == 1)
??CurveSignGet_11:
        LDR.W    R0,??DataTable30_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??CurveSignGet_22
// 2918   {
// 2919     //3. �Һ������ʷ�����ȡ
// 2920     //���ʷ���Ԥ�����㡣
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
// 2925     //���ʻ��ڵ���1 CurveLineChosen1�����ϵ���ȡ��һ����Чֵ��
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
// 2939     //�ѵ�1����Чֵ��CameraHight-1�ľ���ֳ�2�Ρ�
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
// 2947     //���ʻ��ڵ���2 CurveLineChosen2
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
// 2963     //���ʻ��ڵ���3 CurveLineChosen3
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
// 2979     //SABCR�Һ��������������������ȡ
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
// 2996 //���������ж�
// 2997 //======================================================================
// 2998 //��������PathJudge
// 2999 //��  �ܣ����������ж�
// 3000 //��  ������
// 3001 //��  �أ�1�ɹ� 0ʧ��
// 3002 //Ӱ  �죺PathType
// 3003 //˵  ����1. ��ʱֻ��ֱ�����ҵ��жϡ���ʱֻͨ�����������ε�������жϣ��������Ҫ�ĳ��������������ȡ��ʽ��
// 3004 //        2. PathType: 0δ֪ 1ֱ�� 2���� 3���� 4���� 5���� 6���� 7����
// 3005 //             
// 3006 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3007 uint8 PathJudge(void)
// 3008 {
PathJudge:
        PUSH     {R7,LR}
// 3009   //��������PathType: 0δ֪ 1ֱ�� 2���� 3���� 4���� 5���� 6���� 7����
// 3010   PathType = 0;
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 3011   //uint8 row;
// 3012   
// 3013   //ErrorGet();
// 3014   
// 3015   ////////////////////////////������SABC�ķ�ʽ���жϵĻ����п��ܳ�����ֵ�仯�ܴ����������ƺ��滹�ǵò���������������ȡ������
// 3016   //���ʷ��Ż�ȡ�ɹ�
// 3017   if(CurveSignGet())
        BL       CurveSignGet
        CMP      R0,#+0
        BEQ.W    ??PathJudge_0
// 3018   {
// 3019     //�����ж������߳ɹ����������˿϶��ǳɹ��ġ�
// 3020     //���Һ��߾���ȡ�ɹ����������
// 3021     if(BlackLeftDone == 1 && BlackRightDone == 1)
        LDR.N    R0,??DataTable30_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??PathJudge_1
        LDR.N    R0,??DataTable30_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??PathJudge_1
// 3022     { //ȫ����ʱ�룬Ϊ���䡣������С�������������Ϊ���ĵ������
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
// 3027       //ȫ��˳ʱ�룬Ϊ���䡣������С�������������Ϊ���ĵ������
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
// 3039         { //��С����ֵ��Ϊֱ����
// 3040           PathType = 1;  
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        B.N      ??PathJudge_1
// 3041         }
// 3042         else
// 3043         {
// 3044           PathType = 0; //δ֪�������͡�  
??PathJudge_4:
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 3045         }
// 3046       }
// 3047     }
// 3048     
// 3049     //�������ȡʧ�ܣ��Һ�����ȡ�ɹ����������
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
// 3051     { //������������
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
// 3056       //��������ڵ���
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
// 3067         { //��С����ֵ��Ϊֱ����
// 3068           PathType = 1;  
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        B.N      ??PathJudge_5
// 3069         }
// 3070         else
// 3071         {
// 3072           PathType = 0; //δ֪�������͡�  
??PathJudge_8:
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
// 3073         }
// 3074       }
// 3075     }
// 3076     
// 3077     //�Һ�����ȡʧ�ܣ��������ȡ�ɹ����������
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
// 3079     { //��������ڵ���
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
// 3084       //������������
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
// 3095         { //��С����ֵ��Ϊֱ����
// 3096           PathType = 1;  
        LDR.N    R0,??DataTable30_23
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        B.N      ??PathJudge_9
// 3097         }
// 3098         else
// 3099         {
// 3100           PathType = 0; //δ֪�������͡�  
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
// 3107   //���ʷ��Ż�ȡʧ��
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
// 3121 //��������ImagePro
// 3122 //��  �ܣ�ͼ��������ͼ��ߴ�������������ȡ����������ȡ��
// 3123 //��  ������
// 3124 //��  �أ�1�ɹ� 0ʧ��
// 3125 //Ӱ  �죺
// 3126 //˵  ����1. ������ȡʧ�ܺ󣬲���ִ����������ȡ����������ʧ�ܡ�
// 3127 //        2. ������ȡʧ�ܺ󣬺�����˶����ƵĲ������ø��ģ�������һ�εĲ�����
// 3128 //             
// 3129 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3130 uint8 ImagePro(void)
// 3131 {
ImagePro:
        PUSH     {R7,LR}
// 3132     uint8 i;
// 3133     //ͼ��ȡ��Ҫ���У����¸�ֵ��Ϊ�˺���ı�̷��㡣
// 3134     ///////////////////////////////////////////��������Ҫ��ʾ��������һ��ʱ�䣬���ǲ��Ǻķ���̫��ʱ�䡣
// 3135     ImgPut();
        BL       ImgPut
// 3136   
// 3137     //ImageExtract(ImgSend, ImgStore, CameraSize);  
// 3138 
// 3139     
// 3140     //����ͼ��洢���鵽��λ��
// 3141     //SendImage(ImgNew);       
// 3142     //������ȡ����
// 3143     if(!BlackGet())         ////////////////////////////���������ȡʧ�ܣ�������ø�������ָʾ
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
// 3153     { //������ȡ�ɹ��������ߺ��ߵ���ͷ
// 3154       //������ͷ�Ĳ���
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
// 3176       //������ͷ�Ĳ���
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
// 3199     //��������ȡ����
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
// 3213     //���������ж�
// 3214     //������ʱ����������ȡ�ɹ������Һ���������һ����ȡ�ɹ���
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
// 3220     //�������������飬���÷���float�͵����ݣ�ͬ���Ĵ����������λ����ɡ�
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
// 3230     //ͼ��ȡ��Ҫ���У����¸�ֵ��Ϊ�˺���ı�̷��㡣
// 3231     ///////////////////////////////////////////��������Ҫ��ʾ��������һ��ʱ�䣬���ǲ��Ǻķ���̫��ʱ�䡣
// 3232     ImgPut();
        BL       ImgPut
// 3233   
// 3234     //ImageExtract(ImgSend, ImgStore, CameraSize);  
// 3235     /*
// 3236     //������ȡ����
// 3237     if(!BlackGet())         ////////////////////////////���������ȡʧ�ܣ�������ø�������ָʾ
// 3238     {
// 3239         uart_sendN(UART0, (uint8 *)"\nBlackGet Failed!", 17);  
// 3240         return 0;
// 3241     }
// 3242     
// 3243     //��������ȡ����
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
// 3255     //�������������飬���÷���float�͵����ݣ�ͬ���Ĵ����������λ����ɡ�
// 3256     //SendCenterLineLoc(CenterLineLoc);
// 3257     
// 3258     //����ͼ��洢���鵽��λ��
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
