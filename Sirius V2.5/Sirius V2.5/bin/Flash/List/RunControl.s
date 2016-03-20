///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       12/Mar/2016  23:02:58
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\Sirius V2.5\src\Sources\C\Function_C\RunControl.c
//    Command line =  
//        "E:\Sirius V2.5\src\Sources\C\Function_C\RunControl.c" -D IAR -D
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
//    List file    =  E:\Sirius V2.5\bin\Flash\List\RunControl.s
//
///////////////////////////////////////////////////////////////////////////////

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
        PUBLIC DeviSelRow02
        PUBLIC DeviSelRowEnd
        PUBLIC DeviSelRowStart
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

// E:\Sirius V2.5\src\Sources\C\Function_C\RunControl.c
//    1 /******************************************************************************/
//    2 /*******************************************************************************
//    3   �ļ������˶�����C�ļ�RunControl.c
//    4   ��  �ܣ�ƫ����ȡ��PID���������Ƶ�������ƶ����
//    5   ��  �ڣ�2014.11.15
//    6   ��  �ߣ�HJZ & YCR
//    7   ��  ע��
//    8 *******************************************************************************/
//    9 /******************************************************************************/
//   10 #include "RunControl.h"
//   11 
//   12 //ƫ��ѡȡ�ж�Ӧ��Ȩ��

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
//   18 int16 DeviNow = 0;                  //��ǰƫ��, ���Կ��ǻ���float��
DeviNow:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   19 int16 DeviPre = 0;                  //��ǰƫ��, ���Կ��ǻ���float��
DeviPre:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   20 uint8 DeviFlag = 0;                //ƫ����ȡ��־λ�����߳������Ӧ��д��ڼ���ƫ�
DeviFlag:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   21 uint8 DeviSelRowStart = 30;                //ƫ����ȡʱ��ѡ�����ʼ�С�
DeviSelRowStart:
        DATA
        DC8 30

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   22 uint8 DeviSelRowEnd = 45;                //ƫ����ȡʱ��ѡ�����ֹ�С���
DeviSelRowEnd:
        DATA
        DC8 45

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   23 uint8 DeviSelRow02 = 0;                //ƫ����ȡʱ��ѡ�е��кš�
DeviSelRow02:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   24 uint8 DeviRowChosen = 0;               //��ȡƫ��ʱѡȡ���У���ָ����Χûѡȡ������ƫ���С��������Чֵ��
DeviRowChosen:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   25 int16 DeviGoStraightLim = 3;          //ƫ��С�ڸ�ֵʱ��ֱ�ߡ�
DeviGoStraightLim:
        DATA
        DC16 3
//   26 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   27 float ServoKp = 4;                 //���PID��P����
ServoKp:
        DATA
        DC32 40800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   28 float ServoKd = 2;                 //���PID��D����
ServoKd:
        DATA
        DC32 40000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   29 float ServoK1 = 150;                 //���PID��P�����йص�ϵ��
ServoK1:
        DATA
        DC32 43160000H

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   30 uint16 ServoPIDMax = 2086;             //���PID���Ƶ����ֵ����ת
ServoPIDMax:
        DATA
        DC16 2086

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   31 uint16 ServoPIDMin = 1617;             //���PID���Ƶ���Сֵ����ת
ServoPIDMin:
        DATA
        DC16 1617

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   32 uint16 ServoPIDCen = 1851;             //���PID���Ƶ�����ֵ��ֱ�ߡ�
ServoPIDCen:
        DATA
        DC16 1851
//   33 
//   34 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   35 float MotorLeftKp = 1;             //����PID��P����    
MotorLeftKp:
        DATA
        DC32 3F800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   36 float MotorLeftKd = 1;             //����PID��D����
MotorLeftKd:
        DATA
        DC32 3F800000H

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   37 uint16 MotorLeftPIDMax;         //����PID���Ƶ����ֵ
MotorLeftPIDMax:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   38 uint16 MotorLeftPIDMin;         //����PID���Ƶ���Сֵ
MotorLeftPIDMin:
        DS8 2
//   39 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   40 float MotorRightKp = 1;            //�ҵ��PID��P����     
MotorRightKp:
        DATA
        DC32 3F800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   41 float MotorRightKd = 1;            //�ҵ��PID��D����
MotorRightKd:
        DATA
        DC32 3F800000H

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   42 uint16 MotorRightPIDMax;        //�ҵ��PID���Ƶ����ֵ
MotorRightPIDMax:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   43 uint16 MotorRightPIDMin;        //�ҵ��PID���Ƶ���Сֵ
MotorRightPIDMin:
        DS8 2
//   44 
//   45 
//   46 
//   47 /*
//   48 //------------------------------------------------------------------------------
//   49 //��������MotorControl
//   50 //��  �ܣ����ҵ��PWM����
//   51 //��  ����motor_leftΪ����PWM��motor_rightΪ�ҵ��PWM
//   52 //��  �أ���
//   53 //˵  ����PWMռ�ձȼ��㷽��CnV/MOD
//   54 //------------------------------------------------------------------------------
//   55 void MotorControl(int32 motor_left,int32 motor_right)
//   56 {
//   57 	//�������||ˤ������رյ��
//   58 	if((!switch4) || fall_flag)
//   59   {
//   60 		FTM0_C4V=0;
//   61 		FTM0_C5V=0;
//   62 		FTM0_C6V=0;
//   63 		FTM0_C7V=0;
//   64 	}
//   65   else
//   66   {
//   67     //�����������
//   68     if(motor_left>0)
//   69       motor_left+=MOTOR_DEATH;
//   70     else
//   71       motor_left-=MOTOR_DEATH;
//   72     if(motor_right>0)
//   73       motor_right+=MOTOR_DEATH;
//   74     else
//   75       motor_right-=MOTOR_DEATH;
//   76 
//   77     //����PWM����
//   78     if(motor_left>=0)
//   79     {
//   80       FTM0_C4V=0;
//   81       FTM0_C5V=motor_left;
//   82     }
//   83     else
//   84     {
//   85 			FTM0_C5V=0;
//   86       FTM0_C4V=-motor_left;
//   87     }
//   88     //�ҵ��PWM����
//   89     if(motor_right>=0)
//   90     {
//   91 			FTM0_C6V=motor_right;
//   92       FTM0_C7V=0;
//   93     }
//   94     else
//   95     {
//   96 			FTM0_C7V=-motor_right;
//   97       FTM0_C6V=0;
//   98     }
//   99 	}
//  100 }
//  101 
//  102 */
//  103 
//  104 //======================================================================
//  105 //��������DeviationGet
//  106 //��  �ܣ�ƫ�ƫ��仯�ʵļ���
//  107 //��  ����
//  108 //��  �أ�1�ɹ� 0ʧ��
//  109 //Ӱ  �죺
//  110 //˵  ����
//  111 //      
//  112 //             
//  113 //======================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  114 uint8 DeviationGet(void)
//  115 {
//  116   uint8 row;
//  117   int16 tempDevi;
//  118   
//  119   for(row = DeviSelRowStart; row < DeviSelRowEnd; row++)
DeviationGet:
        LDR.N    R0,??DataTable2
        LDRB     R0,[R0, #+0]
        B.N      ??DeviationGet_0
??DeviationGet_1:
        ADDS     R0,R0,#+1
??DeviationGet_0:
        LDR.N    R2,??DataTable2_1
        LDRB     R2,[R2, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R2
        BCS.N    ??DeviationGet_2
//  120   {
//  121     if(CenterLineLoc[row] != MaxValUint8)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable2_2
        LDRB     R2,[R0, R2]
        CMP      R2,#+255
        BEQ.N    ??DeviationGet_1
//  122     { //ָ����Χ���ҵ�����Ч��.
//  123       tempDevi = CenterLineLoc[row] - PhyCenterCol;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable2_2
        LDRB     R1,[R0, R1]
        SUBS     R1,R1,#+140
//  124       //��ƫ���С����ƫ����Ϊ0��ѡȡ����0(ѡȡ��Χ���ܰ���0)��
//  125       if((tempDevi < DeviGoStraightLim)&&(tempDevi > -DeviGoStraightLim))
        LDR.N    R2,??DataTable2_3
        LDRSH    R2,[R2, #+0]
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        CMP      R1,R2
        BGE.N    ??DeviationGet_3
        LDR.N    R2,??DataTable2_3
        LDRSH    R2,[R2, #+0]
        RSBS     R2,R2,#+0
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        CMP      R2,R1
        BGE.N    ??DeviationGet_3
//  126       {
//  127         tempDevi = 0;
        MOVS     R1,#+0
//  128         DeviRowChosen = 0;
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_4
        STRB     R2,[R3, #+0]
        B.N      ??DeviationGet_4
//  129       }
//  130       //ƫ�����ƫ���ø��£�ѡȡ�и��¡�
//  131       else
//  132       {
//  133         DeviRowChosen = row;  
??DeviationGet_3:
        LDR.N    R2,??DataTable2_4
        STRB     R0,[R2, #+0]
//  134       }
//  135           
//  136       break;
//  137     }
//  138   }
//  139   if(row >= DeviSelRowEnd)
??DeviationGet_4:
??DeviationGet_2:
        LDR.N    R2,??DataTable2_1
        LDRB     R2,[R2, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R2
        BCC.N    ??DeviationGet_5
//  140   { //ָ����Χ��û��ѡȡ����Ч�У���ƫ���ԭ״��ѡȡ������Чֵ��
//  141     tempDevi = DeviPre;
        LDR.N    R0,??DataTable2_5
        LDRSH    R1,[R0, #+0]
//  142     DeviRowChosen = MaxValUint8;    
        MOVS     R0,#+255
        LDR.N    R2,??DataTable2_4
        STRB     R0,[R2, #+0]
//  143   }
//  144   
//  145   DeviPre = DeviNow;
??DeviationGet_5:
        LDR.N    R0,??DataTable2_6
        LDRH     R0,[R0, #+0]
        LDR.N    R2,??DataTable2_5
        STRH     R0,[R2, #+0]
//  146   DeviNow = tempDevi;
        LDR.N    R0,??DataTable2_6
        STRH     R1,[R0, #+0]
//  147   
//  148   return 1;
        MOVS     R0,#+1
        BX       LR               ;; return
//  149 }
//  150 
//  151 //���PID���ƺ�����

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  152 uint8 ServoPID(void)
//  153 {
ServoPID:
        PUSH     {R3-R5,LR}
//  154   float temp;
//  155   int16 temp1;
//  156   
//  157   temp1 = DeviNow - DeviPre;
        LDR.N    R0,??DataTable2_6
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable2_5
        LDRH     R1,[R1, #+0]
        SUBS     R4,R0,R1
//  158   /*
//  159   if(temp1 > 50) 
//  160   {
//  161     temp1 = 50;
//  162   }
//  163   else if(temp1 < -50)
//  164   {
//  165     temp1 = -50;
//  166   }
//  167   else
//  168   {
//  169   }
//  170   */
//  171   //ServoKp = DeviNow * DeviNow / ServoK1;
//  172   
//  173   temp = (ServoPIDMax + ServoPIDMin) / 2 - ServoKp * DeviNow - ServoKd * temp1;
        LDR.N    R0,??DataTable2_7
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable2_8
        LDRH     R1,[R1, #+0]
        UXTAH    R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        BL       __aeabi_i2f
        MOVS     R5,R0
        LDR.N    R0,??DataTable2_6
        LDRSH    R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable2_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        MOVS     R5,R0
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R0,R4
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable2_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        MOVS     R4,R0
//  174   if(temp > ServoPIDMax)
        LDR.N    R0,??DataTable2_7
        LDRH     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R4
        BL       __aeabi_cfcmple
        BCS.N    ??ServoPID_0
//  175   {
//  176     temp = ServoPIDMax;  
        LDR.N    R0,??DataTable2_7
        LDRH     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R4,R0
        B.N      ??ServoPID_1
//  177   }
//  178   else if(temp < ServoPIDMin)
??ServoPID_0:
        LDR.N    R0,??DataTable2_8
        LDRH     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_cfcmple
        BCS.N    ??ServoPID_1
//  179   {
//  180     temp = ServoPIDMin;
        LDR.N    R0,??DataTable2_8
        LDRH     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R4,R0
//  181   }
//  182   else
//  183   {    
//  184   }
//  185   
//  186   FTM1_C0V = (uint16)temp;
??ServoPID_1:
        MOVS     R0,R4
        BL       __aeabi_f2iz
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??DataTable2_11  ;; 0x40039010
        STR      R0,[R1, #+0]
//  187   
//  188   
//  189 
//  190     
//  191   return 1;
        MOVS     R0,#+1
        POP      {R1,R4,R5,PC}    ;; return
//  192 }
//  193 
//  194 
//  195 //======================================================================
//  196 //��������SportControl
//  197 //��  �ܣ��˶����ơ�
//  198 //��  ������
//  199 //��  �أ���
//  200 //Ӱ  �죺
//  201 //˵  ����1. ��ͼ�����ɹ�����������һ�εĿ������ݡ����򽫸��¡�
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
//  210       //ƫ����ȡ
//  211       tempD = DeviationGet();
        BL       DeviationGet
        MOVS     R4,R0
//  212       if(!tempD)
//  213       {
//  214         //uart_sendN(UART0, (uint8 *)"\nDeviationGet Failed!", 21);  
//  215       }
//  216       
//  217       //���PID����
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
        LDR.N    R0,??DataTable2_5
        LDRSH    R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable2_12
        STR      R0,[R1, #+0]
//  226     VirtualOutData[1] = DeviNow;
        LDR.N    R0,??DataTable2_6
        LDRSH    R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable2_12
        STR      R0,[R1, #+4]
//  227     VirtualOutData[2] = CenterLineLoc[25];   //BlackRightLoc[25][0]; //FTM1_C0V - ServoPIDMin;
        LDR.N    R0,??DataTable2_2
        LDRB     R0,[R0, #+25]
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable2_12
        STR      R0,[R1, #+8]
//  228     VirtualOutData[3] = DeviRowChosen;
        LDR.N    R0,??DataTable2_4
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable2_12
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
        DC32     DeviSelRowStart

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     DeviSelRowEnd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     CenterLineLoc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     DeviGoStraightLim

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     DeviRowChosen

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     DeviPre

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     DeviNow

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     ServoPIDMax

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     ServoPIDMin

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     ServoKp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     ServoKd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x40039010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     VirtualOutData

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
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
//  38 bytes in section .data
//  52 bytes in section .rodata
// 404 bytes in section .text
// 
// 404 bytes of CODE  memory
//  52 bytes of CONST memory
//  53 bytes of DATA  memory
//
//Errors: none
//Warnings: none
