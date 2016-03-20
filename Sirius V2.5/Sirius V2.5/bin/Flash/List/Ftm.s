///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       12/Mar/2016  23:02:55
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\Sirius V2.5\src\Sources\C\Function_C\Ftm.c
//    Command line =  
//        "E:\Sirius V2.5\src\Sources\C\Function_C\Ftm.c" -D IAR -D TWR_K60N512
//        -lCN "E:\Sirius V2.5\bin\Flash\List\" -lB "E:\Sirius
//        V2.5\bin\Flash\List\" -o "E:\Sirius V2.5\bin\Flash\Obj\" --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I "E:\Sirius
//        V2.5\src\Sources\H\" -I "E:\Sirius V2.5\src\Sources\H\Component_H\"
//        -I "E:\Sirius V2.5\src\Sources\H\Frame_H\" -I "E:\Sirius
//        V2.5\src\Sources\H\Function_H\" -I "E:\Sirius
//        V2.5\src\Sources\H\SD_H\" -Ol --use_c++_inline
//    List file    =  E:\Sirius V2.5\bin\Flash\List\Ftm.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC MotorInit
        PUBLIC QuadInit
        PUBLIC ServoInit

// E:\Sirius V2.5\src\Sources\C\Function_C\Ftm.c
//    1 /******************************************************************************/
//    2 /*******************************************************************************
//    3   �ļ�����FTMģ��C�ļ�Ftm.c
//    4   ��  �ܣ�����������PWM����������������벶׽��
//    5   ��  �ڣ�2014.11.04
//    6   ��  �ߣ�HJZ
//    7   ��  ע��
//    8 *******************************************************************************/
//    9 /******************************************************************************/
//   10 #include "Ftm.h"
//   11 
//   12 
//   13 
//   14 
//   15 //------------------------------------------------------------------------------
//   16 //��������MotorInit
//   17 //��  �ܣ��������PWM��ʼ��
//   18 //��  ������
//   19 //��  �أ���
//   20 //˵  ����
//   21 //------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   22 void MotorInit(void)
//   23 {
//   24   //SIM_SOPT4|=SIM_SOPT4_FTM1FLT0_MASK;
//   25   /* Turn on all port clocks */
//   26   //SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//   27 
//   28   /* Enable the function on PTA8 */
//   29   // FTM is alt4 function for this pin
//   30   PORTD_PCR4 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  ///FTM0_CH4
MotorInit:
        MOV      R0,#+1088
        LDR.N    R1,??DataTable2  ;; 0x4004c010
        STR      R0,[R1, #+0]
//   31   PORTD_PCR5 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  ///FTM0_CH5
        MOV      R0,#+1088
        LDR.N    R1,??DataTable2_1  ;; 0x4004c014
        STR      R0,[R1, #+0]
//   32   PORTD_PCR6 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  ///FTM0_CH6
        MOV      R0,#+1088
        LDR.N    R1,??DataTable2_2  ;; 0x4004c018
        STR      R0,[R1, #+0]
//   33   PORTD_PCR7 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  ///FTM0_CH7
        MOV      R0,#+1088
        LDR.N    R1,??DataTable2_3  ;; 0x4004c01c
        STR      R0,[R1, #+0]
//   34 
//   35   SIM_SCGC6|=SIM_SCGC6_FTM0_MASK;   //ʹ��FTM0ʱ��
        LDR.N    R0,??DataTable2_4  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.N    R1,??DataTable2_4  ;; 0x4004803c
        STR      R0,[R1, #+0]
//   36 
//   37   //change MSnB = 1
//   38   FTM0_C4SC |= FTM_CnSC_ELSB_MASK;
        LDR.N    R0,??DataTable2_5  ;; 0x4003802c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable2_5  ;; 0x4003802c
        STR      R0,[R1, #+0]
//   39   FTM0_C4SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.N    R0,??DataTable2_5  ;; 0x4003802c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable2_5  ;; 0x4003802c
        STR      R0,[R1, #+0]
//   40   FTM0_C4SC |= FTM_CnSC_MSB_MASK;
        LDR.N    R0,??DataTable2_5  ;; 0x4003802c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable2_5  ;; 0x4003802c
        STR      R0,[R1, #+0]
//   41 
//   42   FTM0_C5SC |= FTM_CnSC_ELSB_MASK;
        LDR.N    R0,??DataTable2_6  ;; 0x40038034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable2_6  ;; 0x40038034
        STR      R0,[R1, #+0]
//   43   FTM0_C5SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.N    R0,??DataTable2_6  ;; 0x40038034
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable2_6  ;; 0x40038034
        STR      R0,[R1, #+0]
//   44   FTM0_C5SC |= FTM_CnSC_MSB_MASK;
        LDR.N    R0,??DataTable2_6  ;; 0x40038034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable2_6  ;; 0x40038034
        STR      R0,[R1, #+0]
//   45 
//   46   FTM0_C6SC |= FTM_CnSC_ELSB_MASK;
        LDR.N    R0,??DataTable2_7  ;; 0x4003803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable2_7  ;; 0x4003803c
        STR      R0,[R1, #+0]
//   47   FTM0_C6SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.N    R0,??DataTable2_7  ;; 0x4003803c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable2_7  ;; 0x4003803c
        STR      R0,[R1, #+0]
//   48   FTM0_C6SC |= FTM_CnSC_MSB_MASK;
        LDR.N    R0,??DataTable2_7  ;; 0x4003803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable2_7  ;; 0x4003803c
        STR      R0,[R1, #+0]
//   49 
//   50   FTM0_C7SC |= FTM_CnSC_ELSB_MASK;
        LDR.N    R0,??DataTable2_8  ;; 0x40038044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable2_8  ;; 0x40038044
        STR      R0,[R1, #+0]
//   51   FTM0_C7SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.N    R0,??DataTable2_8  ;; 0x40038044
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable2_8  ;; 0x40038044
        STR      R0,[R1, #+0]
//   52   FTM0_C7SC |= FTM_CnSC_MSB_MASK;
        LDR.N    R0,??DataTable2_8  ;; 0x40038044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable2_8  ;; 0x40038044
        STR      R0,[R1, #+0]
//   53 
//   54   //FTM1_SC = FTM_SC_PS(0) | FTM_SC_CLKS(1);
//   55   //FTM1_SC = 0X0F;
//   56   FTM0_SC = 0x08;//???not enable the interrupt mask
        MOVS     R0,#+8
        LDR.N    R1,??DataTable2_9  ;; 0x40038000
        STR      R0,[R1, #+0]
//   57   //ϵͳʱ��sys_clk����Ϊ32��Ƶ��Ƶ��Ϊ2343.7Hz
//   58   //FTM1_SC = 0X1F;     //BIT5
//   59                         //0 FTM counter operates in up counting mode.
//   60                         //1 FTM counter operates in up-down counting mode.
//   61                         //BIT43 FTM1_SC|=FTM1_SC_CLKS_MASK;
//   62                         //00 No clock selected (This in effect disables the FTM counter.)
//   63                         //01 System clock
//   64                         //10 Fixed frequency clock
//   65                         //11 External clock
//   66                         //BIT210 FTM1_SC|=FTM1_SC_PS_MASK;
//   67                         //100M          MOD=2000;     MOD=4000;   MOD=1000;
//   68                         //000 Divide by 1---12KHZ     6K          24k
//   69                         //001 Divide by 2--- 6KHZ
//   70                         //010 Divide by 4--- 3K
//   71                         //011 Divide by 8--- 1.5K
//   72                         //100 Divide by 16---750
//   73                         //101 Divide by 32---375
//   74                         //110 Divide by 64---187.5HZ
//   75                         //111 Divide by 128--93.75hz
//   76 
//   77   FTM0_MODE |= FTM_MODE_WPDIS_MASK;
        LDR.N    R0,??DataTable2_10  ;; 0x40038054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable2_10  ;; 0x40038054
        STR      R0,[R1, #+0]
//   78   //BIT1   Initialize the Channels Output
//   79   //FTMEN is bit 0, need to set to zero so DECAPEN can be set to 0
//   80   FTM0_MODE &= ~1;
        LDR.N    R0,??DataTable2_10  ;; 0x40038054
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable2_10  ;; 0x40038054
        STR      R0,[R1, #+0]
//   81   //BIT0   FTM Enable
//   82   //0 Only the TPM-compatible registers (first set of registers) can be used without any restriction. Do not use the FTM-specific registers.
//   83   //1 All registers including the FTM-specific registers (second set of registers) are available for use with no restrictions.
//   84 
//   85   FTM0_OUTMASK=0X0F;   //0 Channel output is not masked. It continues to operate normally.
        MOVS     R0,#+15
        LDR.N    R1,??DataTable2_11  ;; 0x40038060
        STR      R0,[R1, #+0]
//   86                        //1 Channel output is masked. It is forced to its inactive state.
//   87 
//   88   FTM0_COMBINE=0;      //Function for Linked Channels (FTMx_COMBINE)
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_12  ;; 0x40038064
        STR      R0,[R1, #+0]
//   89   FTM0_OUTINIT=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_13  ;; 0x4003805c
        STR      R0,[R1, #+0]
//   90   FTM0_EXTTRIG=0;      //FTM External Trigger (FTMx_EXTTRIG)
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_14  ;; 0x4003806c
        STR      R0,[R1, #+0]
//   91   FTM0_POL=0;          //Channels Polarity (FTMx_POL)
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_15  ;; 0x40038070
        STR      R0,[R1, #+0]
//   92                        //0 The channel polarity is active high.
//   93                        //1 The channel polarity is active low.
//   94   //Set Edge Aligned PWM
//   95   FTM0_QDCTRL &=~FTM_QDCTRL_QUADEN_MASK;
        LDR.N    R0,??DataTable2_16  ;; 0x40038080
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable2_16  ;; 0x40038080
        STR      R0,[R1, #+0]
//   96   //QUADEN is Bit 1, Set Quadrature Decoder Mode (QUADEN) Enable to 0,   (disabled)
//   97   //FTM0_SC = 0x16; //Center Aligned PWM Select = 0, sets FTM Counter to operate in up counting mode,
//   98   //it is field 5 of FTMx_SC (status control) - also setting the pre-scale bits here
//   99 
//  100   FTM0_INVCTRL=0;     //��ת����
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_17  ;; 0x40038090
        STR      R0,[R1, #+0]
//  101   FTM0_SWOCTRL=0;     //����������F TM Software Output Control (FTMx_SWOCTRL)
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_18  ;; 0x40038094
        STR      R0,[R1, #+0]
//  102   FTM0_PWMLOAD=0;     //FTM PWM Load
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_19  ;; 0x40038098
        STR      R0,[R1, #+0]
//  103                       //BIT9:
//  104                       //0 Loading updated values is disabled.
//  105                       //1 Loading updated values is enabled.
//  106   FTM0_CNTIN=0;       //Counter Initial Value
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_20  ;; 0x4003804c
        STR      R0,[R1, #+0]
//  107   FTM0_MOD=7500-1;      //Modulo value,The EPWM period is determined by (MOD - CNTIN + 0x0001)
        MOVW     R0,#+7499
        LDR.N    R1,??DataTable2_21  ;; 0x40038008
        STR      R0,[R1, #+0]
//  108                       //��������ʱ�ӳ�ʼ�����������Եõ�4��Ƶ��Ƶ�ʣ�ϵͳ60MƵ��ʱ��PWMƵ����15M,�Դ�����
//  109                       //PMWƵ��=XϵͳƵ��/4/(2^FTM1_SC_PS)/FTM1_MOD
//  110   FTM0_C4V=2500;         //���� the pulse width(duty cycle) is determined by (CnV - CNTIN).
        MOVW     R0,#+2500
        LDR.N    R1,??DataTable2_22  ;; 0x40038030
        STR      R0,[R1, #+0]
//  111   FTM0_C5V=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_23  ;; 0x40038038
        STR      R0,[R1, #+0]
//  112   FTM0_C6V=2500;
        MOVW     R0,#+2500
        LDR.N    R1,??DataTable2_24  ;; 0x40038040
        STR      R0,[R1, #+0]
//  113   FTM0_C7V=0;             ///�˴�CnVд0��Ϊ��ʹռ�ձ�Ϊ0����ʱ�����PWM����   --HJZ
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_25  ;; 0x40038048
        STR      R0,[R1, #+0]
//  114   FTM0_CNT=0;         //ֻ�е�16λ����    
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_26  ;; 0x40038004
        STR      R0,[R1, #+0]
//  115                      
//  116 }
        BX       LR               ;; return
//  117 
//  118 //------------------------------------------------------------------------------
//  119 //��������QuadInit
//  120 //��  �ܣ�������������ʼ��
//  121 //��  ������
//  122 //��  �أ���
//  123 //˵  ����
//  124 //------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  125 void QuadInit(void)
//  126 {
//  127   /*�����˿�ʱ��*/
//  128   //SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//  129   /*ѡ��ܽŸ��ù���*/
//  130   PORTB_PCR0 = PORT_PCR_MUX(6);
QuadInit:
        MOV      R0,#+1536
        LDR.N    R1,??DataTable2_27  ;; 0x4004a000
        STR      R0,[R1, #+0]
//  131   PORTB_PCR1 = PORT_PCR_MUX(6);
        MOV      R0,#+1536
        LDR.N    R1,??DataTable2_28  ;; 0x4004a004
        STR      R0,[R1, #+0]
//  132   PORTB_PCR18 = PORT_PCR_MUX(6);
        MOV      R0,#+1536
        LDR.N    R1,??DataTable2_29  ;; 0x4004a048
        STR      R0,[R1, #+0]
//  133   PORTB_PCR19 = PORT_PCR_MUX(6);
        MOV      R0,#+1536
        LDR.N    R1,??DataTable2_30  ;; 0x4004a04c
        STR      R0,[R1, #+0]
//  134   /*ʹ��FTM1��FTM2ʱ��*/
//  135   SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;
        LDR.N    R0,??DataTable2_4  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable2_4  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  136   SIM_SCGC3|=SIM_SCGC3_FTM2_MASK;
        LDR.N    R0,??DataTable2_31  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.N    R1,??DataTable2_31  ;; 0x40048030
        STR      R0,[R1, #+0]
//  137 
//  138   FTM1_MOD = 20000;                 //�ɸ�����Ҫ����
        MOVW     R0,#+20000
        LDR.N    R1,??DataTable2_32  ;; 0x40039008
        STR      R0,[R1, #+0]
//  139   FTM2_MOD = 20000;
        MOVW     R0,#+20000
        LDR.N    R1,??DataTable2_33  ;; 0x400b8008
        STR      R0,[R1, #+0]
//  140 
//  141   FTM1_CNTIN = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_34  ;; 0x4003904c
        STR      R0,[R1, #+0]
//  142   FTM2_CNTIN = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_35  ;; 0x400b804c
        STR      R0,[R1, #+0]
//  143 
//  144   FTM1_MODE |= FTM_MODE_WPDIS_MASK; //��ֹд����
        LDR.N    R0,??DataTable2_36  ;; 0x40039054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable2_36  ;; 0x40039054
        STR      R0,[R1, #+0]
//  145   FTM2_MODE |= FTM_MODE_WPDIS_MASK; //��ֹд����
        LDR.N    R0,??DataTable2_37  ;; 0x400b8054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable2_37  ;; 0x400b8054
        STR      R0,[R1, #+0]
//  146   FTM1_MODE |= FTM_MODE_FTMEN_MASK; //FTMEN=1,�ر�TPM����ģʽ������FTM���й���
        LDR.N    R0,??DataTable2_36  ;; 0x40039054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable2_36  ;; 0x40039054
        STR      R0,[R1, #+0]
//  147   FTM2_MODE |= FTM_MODE_FTMEN_MASK; //FTMEN=1,�ر�TPM����ģʽ������FTM���й���
        LDR.N    R0,??DataTable2_37  ;; 0x400b8054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable2_37  ;; 0x400b8054
        STR      R0,[R1, #+0]
//  148 
//  149   FTM1_QDCTRL &= ~FTM_QDCTRL_QUADMODE_MASK;  //ѡ������ģʽΪA����B�����ģʽ
        LDR.N    R0,??DataTable2_38  ;; 0x40039080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x8
        LDR.N    R1,??DataTable2_38  ;; 0x40039080
        STR      R0,[R1, #+0]
//  150   FTM1_QDCTRL |= FTM_QDCTRL_QUADEN_MASK;     //ʹ����������ģʽ
        LDR.N    R0,??DataTable2_38  ;; 0x40039080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable2_38  ;; 0x40039080
        STR      R0,[R1, #+0]
//  151   FTM2_QDCTRL &= ~FTM_QDCTRL_QUADMODE_MASK;  //ѡ������ģʽΪA����B�����ģʽ
        LDR.N    R0,??DataTable2_39  ;; 0x400b8080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x8
        LDR.N    R1,??DataTable2_39  ;; 0x400b8080
        STR      R0,[R1, #+0]
//  152   FTM2_QDCTRL |= FTM_QDCTRL_QUADEN_MASK;     //ʹ����������ģʽ
        LDR.N    R0,??DataTable2_39  ;; 0x400b8080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable2_39  ;; 0x400b8080
        STR      R0,[R1, #+0]
//  153 
//  154   FTM1_SC |= FTM_SC_CLKS(3);         //ѡ���ⲿʱ��
        LDR.N    R0,??DataTable2_40  ;; 0x40039000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x18
        LDR.N    R1,??DataTable2_40  ;; 0x40039000
        STR      R0,[R1, #+0]
//  155   //FTM1_CONF |=FTM_CONF_BDMMODE(3); //�ɸ�����Ҫѡ��
//  156   FTM2_SC |= FTM_SC_CLKS(3);
        LDR.N    R0,??DataTable2_41  ;; 0x400b8000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x18
        LDR.N    R1,??DataTable2_41  ;; 0x400b8000
        STR      R0,[R1, #+0]
//  157   //FTM2_CONF |=FTM_CONF_BDMMODE(3);
//  158 }
        BX       LR               ;; return
//  159 
//  160 
//  161 
//  162 /*
//  163 
//  164 //------------------------------------------------------------------------------
//  165 //��������Ftm0Init
//  166 //��  �ܣ��������PWM��ʼ��
//  167 //��  ������
//  168 //��  �أ���
//  169 //˵  ����
//  170 //------------------------------------------------------------------------------
//  171 void Ftm0Init(void)
//  172 {
//  173   //��PORTDģ���ſ�ʱ��
//  174   SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
//  175 
//  176   //��PORTD4����ΪFTM0_ch4����PORTD5����ΪFTM0_ch5�������������������
//  177   PORTD_PCR4 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK; //D4ΪFTM0_ch4�������
//  178   PORTD_PCR5 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK; //D5ΪFTM0_ch5�������
//  179 
//  180   //ʹ��FTM0ʱ��
//  181   SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;
//  182 
//  183   //����FTM0_ch4Ϊ���ض���PWM��������
//  184   FTM0_C4SC |= FTM_CnSC_ELSB_MASK;
//  185   FTM0_C4SC &= ~FTM_CnSC_ELSA_MASK;
//  186   FTM0_C4SC |= FTM_CnSC_MSB_MASK;
//  187 
//  188   //����FTM0_ch5Ϊ���ض���PWM��������
//  189   FTM0_C5SC |= FTM_CnSC_ELSB_MASK;
//  190   FTM0_C5SC &= ~FTM_CnSC_ELSA_MASK;
//  191   FTM0_C5SC |= FTM_CnSC_MSB_MASK;
//  192 
//  193   //ʱ��Դѡ��sys_clk����FTM������Ԥ��Ƶ16��
//  194   FTM0_SC = FTM_SC_PS(4) | FTM_SC_CLKS(1);
//  195 
//  196   FTM0_MODE &= ~FTM_MODE_FTMEN_MASK;         //��ֹFTMģ��
//  197   //һ����ֹFTMEN����FTM�ض��Ĵ�������д�룬�����������Ч
//  198   FTM0_OUTMASK = 0xCF;                       //ͨ��4��5��ֹ���룬������������
//  199 
//  200   FTM0_COMBINE = 0;                          //����������ͨ��,ȫ����ֹ
//  201   FTM0_OUTINIT = 0;                          //�ⲿ�����ʼ��Ϊ0
//  202   FTM0_EXTTRIG = 0;                          //�ⲿ�������ã�ȫ����ֹ
//  203   FTM0_POL = 0;                              //����������ã�ȫ��Ϊ������
//  204 
//  205   FTM0_QDCTRL &=~FTM_QDCTRL_QUADEN_MASK;     //������������ʹ�ܣ�EPWM����CPWM������
//  206 
//  207   FTM0_INVCTRL = 0;       //FTM���ù��ܽ�ֹ
//  208   FTM0_SWOCTRL = 0;       //���������ƽ�ֹ
//  209   FTM0_PWMLOAD = 0;       //PWM���ؿ��ƽ�ֹ
//  210 
//  211   //��������PWM�������ڡ�ռ�ձȵȲ���
//  212   //PWM���㷽����CnV/MOD��MOD��֪��ͨ������CnV����ռ�ձ�
//  213   FTM0_CNTIN = 0;         //FTM������ʼֵ����Ϊ0
//  214   FTM0_MOD = 1000;        //FTM������ģ��ֵΪ1000
//  215                           //����LQ��ʱ�ӳ�ʼ���������õ�����Ƶ��PWM����sys_clkΪ100M����PWMΪ50M
//  216                           //PWMƵ��f=sys_clk/2/(2^FTM0_SC_PS)/FTM0_MOD=150M/2/16/1000=4687.5Hz������0.213ms
//  217   FTM0_C4V = 0;           //��������ΪCnV - CNTIN��ռ�ձ�Ϊ20%
//  218   FTM0_C5V = 0;
//  219   FTM0_CNT = 0;           //FTM�������Ĵ�������16λ�����ã�д���κ�ֵ��ʹ��ص�CNTIN
//  220 }
//  221 */
//  222 //------------------------------------------------------------------------------
//  223 //��������ServoInit
//  224 //��  �ܣ��������PWM��ʼ��
//  225 //��  ������
//  226 //��  �أ���
//  227 //˵  ����
//  228 //------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  229 void ServoInit(void)
//  230 {
//  231   //��PORTAģ���ſ�ʱ��
//  232   SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
ServoInit:
        LDR.N    R0,??DataTable2_42  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.N    R1,??DataTable2_42  ;; 0x40048038
        STR      R0,[R1, #+0]
//  233 
//  234   //��PORTB0����ΪFTM1_ch0�������������������
//  235   PORTA_PCR12 = PORT_PCR_MUX(0x3)| PORT_PCR_DSE_MASK;
        MOV      R0,#+832
        LDR.N    R1,??DataTable2_43  ;; 0x40049030
        STR      R0,[R1, #+0]
//  236 
//  237   //ʹ��FTM1ģ���ſ�ʱ��
//  238   SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;
        LDR.N    R0,??DataTable2_4  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable2_4  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  239 
//  240   //����FTM1_ch0Ϊ���ض���PWM��������
//  241   FTM1_C0SC |= FTM_CnSC_ELSB_MASK;
        LDR.N    R0,??DataTable2_44  ;; 0x4003900c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable2_44  ;; 0x4003900c
        STR      R0,[R1, #+0]
//  242   FTM1_C0SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.N    R0,??DataTable2_44  ;; 0x4003900c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable2_44  ;; 0x4003900c
        STR      R0,[R1, #+0]
//  243   FTM1_C0SC |= FTM_CnSC_MSB_MASK;
        LDR.N    R0,??DataTable2_44  ;; 0x4003900c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable2_44  ;; 0x4003900c
        STR      R0,[R1, #+0]
//  244 
//  245   //ʱ��Դѡ��sys_clk����FTM������Ԥ��Ƶ128��
//  246   FTM1_SC = FTM_SC_PS(6) | FTM_SC_CLKS(1);
        MOVS     R0,#+14
        LDR.N    R1,??DataTable2_40  ;; 0x40039000
        STR      R0,[R1, #+0]
//  247 
//  248   FTM1_MODE &= ~FTM_MODE_FTMEN_MASK;         //��ֹFTMģ��
        LDR.N    R0,??DataTable2_36  ;; 0x40039054
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable2_36  ;; 0x40039054
        STR      R0,[R1, #+0]
//  249   FTM1_OUTMASK &= ~1;                        //ͨ��0��ֹ���룬������������
        LDR.N    R0,??DataTable2_45  ;; 0x40039060
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable2_45  ;; 0x40039060
        STR      R0,[R1, #+0]
//  250 
//  251   FTM1_COMBINE = 0;                          //����������ͨ��,ȫ����ֹ
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_46  ;; 0x40039064
        STR      R0,[R1, #+0]
//  252   FTM1_OUTINIT = 0;                          //�ⲿ�����ʼ��Ϊ0
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_47  ;; 0x4003905c
        STR      R0,[R1, #+0]
//  253   FTM1_EXTTRIG = 0;                          //�ⲿ�������ã�ȫ����ֹ
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_48  ;; 0x4003906c
        STR      R0,[R1, #+0]
//  254   FTM1_POL = 0;                              //����������ã�ȫ��Ϊ������
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_49  ;; 0x40039070
        STR      R0,[R1, #+0]
//  255 
//  256   FTM1_QDCTRL &=~FTM_QDCTRL_QUADEN_MASK;     //������������ʹ�ܣ�EPWM����CPWM������
        LDR.N    R0,??DataTable2_38  ;; 0x40039080
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable2_38  ;; 0x40039080
        STR      R0,[R1, #+0]
//  257 
//  258   FTM1_INVCTRL = 0;     //FTM���ù��ܽ�ֹ
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_50  ;; 0x40039090
        STR      R0,[R1, #+0]
//  259   FTM1_SWOCTRL = 0;     //���������ƽ�ֹ
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_51  ;; 0x40039094
        STR      R0,[R1, #+0]
//  260   FTM1_PWMLOAD = 0;     //PWM���ؿ��ƽ�ֹ
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_52  ;; 0x40039098
        STR      R0,[R1, #+0]
//  261 
//  262   //��������PWM�������ڡ�ռ�ձȵȲ���
//  263   //PWM���㷽����CnV/MOD��MOD��֪��ͨ������CnV����ռ�ձ�
//  264   FTM1_CNTIN = 0;         //FTM������ʼֵ����Ϊ0
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_34  ;; 0x4003904c
        STR      R0,[R1, #+0]
//  265   FTM1_MOD = 23437 - 1;        //FTM������ģ��ֵΪ2000
        MOVW     R0,#+23436
        LDR.N    R1,??DataTable2_32  ;; 0x40039008
        STR      R0,[R1, #+0]
//  266                           //����LQ��ʱ�ӳ�ʼ���������õ�����Ƶ��PWM����sys_clkΪ100M����PWMΪ50M
//  267                           //PWMƵ��f=sys_clk/2/(2^FTM1_SC_PS)/FTM1_MOD=150M/2/128/1953=300.02Hz������3.33ms
//  268   FTM1_C0V = 1851;      //��������ΪCnV - CNTIN��ռ�ձ�Ϊ20%
        MOVW     R0,#+1851
        LDR.N    R1,??DataTable2_53  ;; 0x40039010
        STR      R0,[R1, #+0]
//  269   //4.3% 4.4%(L) 4.5% 5.0% 5.5% 6.0% 6.5% 7.0% 7.15%(C) 7.5% 8.0% 8.5% 9.0% 9.5% 9.9%(R) 10.0% 10.3% 10.5%
//  270   //1008 1031    1055 1172 1289 1406 1523 1640 1676     1758 1875 1992 2109 2226 2320    2344  2414  4922
//  271   
//  272   //6.3% 1476Ϊ���ޣ���ת��
//  273   //6.6% 1547
//  274   //6.8% 1594
//  275   //6.9% 1617
//  276   //7.9% 1851Ϊ���ģ�ֱ�ߡ�
//  277   //8.7% 2039
//  278   //8.9% 2086
//  279   //9.3% 2180Ϊ���ޣ���ת��
//  280   //
//  281   FTM1_CNT = 0;           //FTM�������Ĵ�������16λ�����ã�д���κ�ֵ��ʹ��ص�CNTIN
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_54  ;; 0x40039004
        STR      R0,[R1, #+0]
//  282 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x4004c010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x4004c014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x4004c018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x4004c01c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x4003802c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x40038034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x4003803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0x40038044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0x40038000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x40038054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x40038060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     0x40038064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     0x4003805c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     0x4003806c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     0x40038070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     0x40038080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     0x40038090

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     0x40038094

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     0x40038098

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_20:
        DC32     0x4003804c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_21:
        DC32     0x40038008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_22:
        DC32     0x40038030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_23:
        DC32     0x40038038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_24:
        DC32     0x40038040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_25:
        DC32     0x40038048

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_26:
        DC32     0x40038004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_27:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_28:
        DC32     0x4004a004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_29:
        DC32     0x4004a048

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_30:
        DC32     0x4004a04c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_31:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_32:
        DC32     0x40039008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_33:
        DC32     0x400b8008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_34:
        DC32     0x4003904c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_35:
        DC32     0x400b804c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_36:
        DC32     0x40039054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_37:
        DC32     0x400b8054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_38:
        DC32     0x40039080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_39:
        DC32     0x400b8080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_40:
        DC32     0x40039000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_41:
        DC32     0x400b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_42:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_43:
        DC32     0x40049030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_44:
        DC32     0x4003900c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_45:
        DC32     0x40039060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_46:
        DC32     0x40039064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_47:
        DC32     0x4003905c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_48:
        DC32     0x4003906c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_49:
        DC32     0x40039070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_50:
        DC32     0x40039090

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_51:
        DC32     0x40039094

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_52:
        DC32     0x40039098

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_53:
        DC32     0x40039010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_54:
        DC32     0x40039004

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  283 
//  284 
//  285 
//  286 
//  287 
//  288 
//  289 
//  290 
// 
// 936 bytes in section .text
// 
// 936 bytes of CODE memory
//
//Errors: none
//Warnings: none
