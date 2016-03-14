///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    06/Dec/2014  16:52:02 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  D:\IAR_TEST\Sirius\Sirius V2.3\src\Sources\C\Function_C /
//                    \RunControl.c                                           /
//    Command line =  "D:\IAR_TEST\Sirius\Sirius                              /
//                    V2.3\src\Sources\C\Function_C\RunControl.c" -D IAR -D   /
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
//    List file    =  D:\IAR_TEST\Sirius\Sirius V2.3\bin\Ram\List\RunControl. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME RunControl

        #define SHT_PROGBITS 0x1

        EXTERN CenterLineLoc
        EXTERN VirtualOutData
        EXTERN VirtualOutPut_Data
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2f

        PUBLIC DeviFlag
        PUBLIC DeviGoStraightLim
        PUBLIC DeviNow
        PUBLIC DeviPre
        PUBLIC DeviRowChosen
        PUBLIC DeviSelRow01
        PUBLIC DeviSelRow02
        PUBLIC DeviSelRowWeight
        PUBLIC DeviationGet
        PUBLIC MotorLeftKd
        PUBLIC MotorLeftKp
        PUBLIC MotorLeftPIDMax
        PUBLIC MotorLeftPIDMin
        PUBLIC MotorRightKd
        PUBLIC MotorRightKp
        PUBLIC MotorRightPIDMax
        PUBLIC MotorRightPIDMin
        PUBLIC ServoK1
        PUBLIC ServoKd
        PUBLIC ServoKp
        PUBLIC ServoPID
        PUBLIC ServoPIDCen
        PUBLIC ServoPIDMax
        PUBLIC ServoPIDMin
        PUBLIC SportControl

// D:\IAR_TEST\Sirius\Sirius V2.3\src\Sources\C\Function_C\RunControl.c
//    1 /******************************************************************************/
//    2 /*******************************************************************************
//    3   文件名：运动控制C文件RunControl.c
//    4   功  能：偏差求取，PID反馈，控制电机，控制舵机。
//    5   日  期：2014.11.15
//    6   作  者：HJZ & YCR
//    7   备  注：
//    8 *******************************************************************************/
//    9 /******************************************************************************/
//   10 #include "RunControl.h"
//   11 
//   12 //偏差选取行对应的权重

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   13 uint8 const DeviSelRowWeight[CameraHight] = 
DeviSelRowWeight:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0
//   14 {
//   15 0
//   16 };
//   17 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   18 int16 DeviNow = 0;                  //当前偏差, 可以考虑换成float型
DeviNow:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   19 int16 DeviPre = 0;                  //先前偏差, 可以考虑换成float型
DeviPre:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   20 uint8 DeviFlag = 0;                //偏差求取标志位，告诉程序这次应该写入第几个偏差。
DeviFlag:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   21 uint8 DeviSelRow01 = 30;                //偏差求取时，选中的行号。
DeviSelRow01:
        DATA
        DC8 30

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   22 uint8 DeviSelRow02 = 0;                //偏差求取时，选中的行号。
DeviSelRow02:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   23 uint8 DeviRowChosen = 0;               //求取偏差时选取的行，若指定范围没选取到或者偏差过小，则置无效值。
DeviRowChosen:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   24 int16 DeviGoStraightLim = 3;          //偏差小于该值时，直走。
DeviGoStraightLim:
        DATA
        DC16 3
//   25 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   26 float ServoKp = 4;                 //舵机PID的P参数
ServoKp:
        DATA
        DC32 40800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   27 float ServoKd = 2;                 //舵机PID的D参数
ServoKd:
        DATA
        DC32 40000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   28 float ServoK1 = 150;                 //舵机PID跟P参数有关的系数
ServoK1:
        DATA
        DC32 43160000H

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   29 uint16 ServoPIDMax = 2039;             //舵机PID控制的最大值，右转
ServoPIDMax:
        DATA
        DC16 2039

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   30 uint16 ServoPIDMin = 1617;             //舵机PID控制的最小值，左转
ServoPIDMin:
        DATA
        DC16 1617

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   31 uint16 ServoPIDCen = 1828;             //舵机PID控制的中心值，直走。
ServoPIDCen:
        DATA
        DC16 1828
//   32 
//   33 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   34 float MotorLeftKp = 1;             //左电机PID的P参数    
MotorLeftKp:
        DATA
        DC32 3F800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   35 float MotorLeftKd = 1;             //左电机PID的D参数
MotorLeftKd:
        DATA
        DC32 3F800000H

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   36 uint16 MotorLeftPIDMax;         //左电机PID控制的最大值
MotorLeftPIDMax:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   37 uint16 MotorLeftPIDMin;         //左电机PID控制的最小值
MotorLeftPIDMin:
        DS8 2
//   38 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   39 float MotorRightKp = 1;            //右电机PID的P参数     
MotorRightKp:
        DATA
        DC32 3F800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   40 float MotorRightKd = 1;            //右电机PID的D参数
MotorRightKd:
        DATA
        DC32 3F800000H

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   41 uint16 MotorRightPIDMax;        //右电机PID控制的最大值
MotorRightPIDMax:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   42 uint16 MotorRightPIDMin;        //右电机PID控制的最小值
MotorRightPIDMin:
        DS8 2
//   43 
//   44 
//   45 
//   46 /*
//   47 //------------------------------------------------------------------------------
//   48 //函数名：MotorControl
//   49 //功  能：左右电机PWM驱动
//   50 //参  数：motor_left为左电机PWM，motor_right为右电机PWM
//   51 //返  回：无
//   52 //说  明：PWM占空比计算方法CnV/MOD
//   53 //------------------------------------------------------------------------------
//   54 void MotorControl(int32 motor_left,int32 motor_right)
//   55 {
//   56 	//电机开关||摔倒，则关闭电机
//   57 	if((!switch4) || fall_flag)
//   58   {
//   59 		FTM0_C4V=0;
//   60 		FTM0_C5V=0;
//   61 		FTM0_C6V=0;
//   62 		FTM0_C7V=0;
//   63 	}
//   64   else
//   65   {
//   66     //电机死区消除
//   67     if(motor_left>0)
//   68       motor_left+=MOTOR_DEATH;
//   69     else
//   70       motor_left-=MOTOR_DEATH;
//   71     if(motor_right>0)
//   72       motor_right+=MOTOR_DEATH;
//   73     else
//   74       motor_right-=MOTOR_DEATH;
//   75 
//   76     //左电机PWM驱动
//   77     if(motor_left>=0)
//   78     {
//   79       FTM0_C4V=0;
//   80       FTM0_C5V=motor_left;
//   81     }
//   82     else
//   83     {
//   84 			FTM0_C5V=0;
//   85       FTM0_C4V=-motor_left;
//   86     }
//   87     //右电机PWM驱动
//   88     if(motor_right>=0)
//   89     {
//   90 			FTM0_C6V=motor_right;
//   91       FTM0_C7V=0;
//   92     }
//   93     else
//   94     {
//   95 			FTM0_C7V=-motor_right;
//   96       FTM0_C6V=0;
//   97     }
//   98 	}
//   99 }
//  100 
//  101 */
//  102 
//  103 //======================================================================
//  104 //函数名：DeviationGet
//  105 //功  能：偏差、偏差变化率的计算
//  106 //参  数：
//  107 //返  回：1成功 0失败
//  108 //影  响：
//  109 //说  明：
//  110 //      
//  111 //             
//  112 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  113 uint8 DeviationGet(void)
//  114 {
//  115   uint8 row;
//  116   int16 tempDevi;
//  117   
//  118   for(row = DeviSelRow01 - 5; row < DeviSelRow01 + 15; row++)
DeviationGet:
        LDR.N    R0,??DataTable2
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+5
        B.N      ??DeviationGet_0
??DeviationGet_1:
        ADDS     R0,R0,#+1
??DeviationGet_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable2
        LDRB     R2,[R2, #+0]
        ADDS     R2,R2,#+15
        CMP      R0,R2
        BGE.N    ??DeviationGet_2
//  119   {
//  120     if(CenterLineLoc[row] != MaxValUint8)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable2_1
        LDRB     R2,[R0, R2]
        CMP      R2,#+255
        BEQ.N    ??DeviationGet_1
//  121     { //指定范围内找到了有效行.
//  122       tempDevi = CenterLineLoc[row] - PhyCenterCol;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable2_1
        LDRB     R1,[R0, R1]
        SUBS     R1,R1,#+140
//  123       //若偏差过小，则将偏差置为0，选取行置0(选取范围不能包括0)。
//  124       if((tempDevi < DeviGoStraightLim)&&(tempDevi > -DeviGoStraightLim))
        LDR.N    R2,??DataTable2_2
        LDRSH    R2,[R2, #+0]
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        CMP      R1,R2
        BGE.N    ??DeviationGet_3
        LDR.N    R2,??DataTable2_2
        LDRSH    R2,[R2, #+0]
        RSBS     R2,R2,#+0
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        CMP      R2,R1
        BGE.N    ??DeviationGet_3
//  125       {
//  126         tempDevi = 0;
        MOVS     R1,#+0
//  127         DeviRowChosen = 0;
        LDR.N    R2,??DataTable2_3
        MOVS     R3,#+0
        STRB     R3,[R2, #+0]
        B.N      ??DeviationGet_4
//  128       }
//  129       //偏差够大，则偏差置更新，选取行更新。
//  130       else
//  131       {
//  132         DeviRowChosen = row;  
??DeviationGet_3:
        LDR.N    R2,??DataTable2_3
        STRB     R0,[R2, #+0]
//  133       }
//  134           
//  135       break;
//  136     }
//  137   }
//  138   if(row >= DeviSelRow01 + 15)
??DeviationGet_4:
??DeviationGet_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable2
        LDRB     R2,[R2, #+0]
        ADDS     R2,R2,#+15
        CMP      R0,R2
        BLT.N    ??DeviationGet_5
//  139   { //指定范围里没有选取到有效行，则偏差保持原状，选取行置无效值。
//  140     tempDevi = DeviPre;
        LDR.N    R0,??DataTable2_4
        LDRSH    R1,[R0, #+0]
//  141     DeviRowChosen = MaxValUint8;    
        LDR.N    R0,??DataTable2_3
        MOVS     R2,#+255
        STRB     R2,[R0, #+0]
//  142   }
//  143   
//  144   DeviPre = DeviNow;
??DeviationGet_5:
        LDR.N    R0,??DataTable2_4
        LDR.N    R2,??DataTable2_5
        LDRH     R2,[R2, #+0]
        STRH     R2,[R0, #+0]
//  145   DeviNow = tempDevi;
        LDR.N    R0,??DataTable2_5
        STRH     R1,[R0, #+0]
//  146   
//  147   return 1;
        MOVS     R0,#+1
        BX       LR               ;; return
//  148 }
//  149 
//  150 //舵机PID控制函数。

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  151 uint8 ServoPID(void)
//  152 {
ServoPID:
        PUSH     {R4,R5,LR}
//  153   float temp;
//  154   int16 temp1;
//  155   
//  156   temp1 = DeviNow - DeviPre;
        LDR.N    R0,??DataTable2_5
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable2_4
        LDRH     R1,[R1, #+0]
        SUBS     R4,R0,R1
//  157   /*
//  158   if(temp1 > 50) 
//  159   {
//  160     temp1 = 50;
//  161   }
//  162   else if(temp1 < -50)
//  163   {
//  164     temp1 = -50;
//  165   }
//  166   else
//  167   {
//  168   }
//  169   */
//  170   //ServoKp = DeviNow * DeviNow / ServoK1;
//  171   
//  172   temp = (ServoPIDMax + ServoPIDMin) / 2 - ServoKp * DeviNow - ServoKd * temp1;
        LDR.N    R0,??DataTable2_6
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable2_7
        LDRH     R1,[R1, #+0]
        UXTAH    R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        BL       __aeabi_i2f
        MOVS     R5,R0
        LDR.N    R0,??DataTable2_5
        LDRSH    R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable2_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        MOVS     R5,R0
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R0,R4
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable2_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        MOVS     R4,R0
//  173   if(temp > ServoPIDMax)
        LDR.N    R0,??DataTable2_6
        LDRH     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R4
        BL       __aeabi_cfcmple
        BCS.N    ??ServoPID_0
//  174   {
//  175     temp = ServoPIDMax;  
        LDR.N    R0,??DataTable2_6
        LDRH     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R4,R0
        B.N      ??ServoPID_1
//  176   }
//  177   else if(temp < ServoPIDMin)
??ServoPID_0:
        LDR.N    R0,??DataTable2_7
        LDRH     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_cfcmple
        BCS.N    ??ServoPID_1
//  178   {
//  179     temp = ServoPIDMin;
        LDR.N    R0,??DataTable2_7
        LDRH     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R4,R0
//  180   }
//  181   else
//  182   {    
//  183   }
//  184   
//  185   ////////////////////////这里最好建一个函数，把temp更好地映射到FTM1_C0V中。
//  186   FTM1_C0V = (uint16)temp;
??ServoPID_1:
        MOVS     R0,R4
        BL       __aeabi_f2iz
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??DataTable2_10  ;; 0x40039010
        STR      R0,[R1, #+0]
//  187   
//  188   
//  189 
//  190     
//  191   return 1;
        MOVS     R0,#+1
        POP      {R4,R5,PC}       ;; return
//  192 }
//  193 
//  194 
//  195 //======================================================================
//  196 //函数名：SportControl
//  197 //功  能：运动控制。
//  198 //参  数：无
//  199 //返  回：无
//  200 //影  响：
//  201 //说  明：1. 若图像处理不成功，则延用上一次的控制数据。否则将更新。
//  202 //      
//  203 //             
//  204 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  205 void SportControl(uint8 ImageProFlag)
//  206 {
SportControl:
        PUSH     {R4,LR}
//  207   uint8 tempD;
//  208     if(ImageProFlag) 
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SportControl_0
//  209     {
//  210       //偏差求取
//  211       tempD = DeviationGet();
        BL       DeviationGet
        MOVS     R4,R0
//  212       if(!tempD)
//  213       {
//  214         //uart_sendN(UART0, (uint8 *)"\nDeviationGet Failed!", 21);  
//  215       }
//  216       
//  217       //舵机PID控制
//  218       if(!ServoPID())
        BL       ServoPID
//  219       {
//  220         //uart_sendN(UART0, (uint8 *)"\nServoPID Failed!", 17);
//  221       }
//  222     }
//  223     
//  224     
//  225     VirtualOutData[0] = DeviPre;
??SportControl_0:
        LDR.N    R0,??DataTable2_4
        LDRSH    R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable2_11
        STR      R0,[R1, #+0]
//  226     VirtualOutData[1] = DeviNow;
        LDR.N    R0,??DataTable2_5
        LDRSH    R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable2_11
        STR      R0,[R1, #+4]
//  227     VirtualOutData[2] = CenterLineLoc[25];   //BlackRightLoc[25][0]; //FTM1_C0V - ServoPIDMin;
        LDR.N    R0,??DataTable2_1
        LDRB     R0,[R0, #+25]
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable2_11
        STR      R0,[R1, #+8]
//  228     VirtualOutData[3] = DeviRowChosen;
        LDR.N    R0,??DataTable2_3
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable2_11
        STR      R0,[R1, #+12]
//  229     VirtualOutPut_Data();
        BL       VirtualOutPut_Data
//  230     
//  231      
//  232 }
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     DeviSelRow01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     CenterLineLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     DeviGoStraightLim

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     DeviRowChosen

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     DeviPre

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     DeviNow

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     ServoPIDMax

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     ServoPIDMin

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     ServoKp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     ServoKd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x40039010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     VirtualOutData

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  233 
// 
//  15 bytes in section .bss
//  37 bytes in section .data
//  52 bytes in section .rodata
// 406 bytes in section .text
// 
// 406 bytes of CODE  memory
//  52 bytes of CONST memory
//  52 bytes of DATA  memory
//
//Errors: none
//Warnings: none
