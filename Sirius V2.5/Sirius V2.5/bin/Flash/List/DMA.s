///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       12/Mar/2016  23:02:55
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\Sirius V2.5\src\Sources\C\Component_C\DMA.c
//    Command line =  
//        "E:\Sirius V2.5\src\Sources\C\Component_C\DMA.c" -D IAR -D
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
//    List file    =  E:\Sirius V2.5\bin\Flash\List\DMA.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN enable_irq

        PUBLIC DMAFlag
        PUBLIC DMAInit
        PUBLIC enable_DMA_irq

// E:\Sirius V2.5\src\Sources\C\Component_C\DMA.c
//    1 //==============================================================================
//    2 //�ļ����ƣ�DMA.c
//    3 //���ܸ�Ҫ��K60 DMA�ײ����������ļ�
//    4 //��Ȩ���У�HJZ
//    5 //�˿�ʹ�ã�
//    6 //==============================================================================
//    7 #include "DMA.h"
//    8 
//    9 
//   10 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   11 volatile uint8 DMAFlag = 0;
DMAFlag:
        DS8 1
//   12 
//   13 /*
//   14 
//   15 // ���Ǹ�OV7725׼����DMA��ʼ������
//   16 uint8 DMAInit(uint8 DMA_CHn, uint8 DMA_Source, uint32 DMA_Count, uint32 S_Addr, uint32 D_Addr)
//   17 {
//   18     //��������������
//   19 	if (DMA_CHn > 15) return 0;                
//   20 	if (DMA_Source > 52) return 0; 
//   21 
//   22 	//DMAͨ������
//   23 	SIM_SCGC6 |= SIM_SCGC6_DMAMUX_MASK;    //��DMA��·����ʱ��
//   24 	SIM_SCGC7 |= SIM_SCGC7_DMA_MASK;       //��DMAģ��ʱ��
//   25 	DMAMUX_CHCFG_REG(DMAMUX_BASE_PTR, DMA_CHn) = (0
//   26 		                                   | DMAMUX_CHCFG_ENBL_MASK			        // ʹ��DMAͨ�� 
//   27                                                    //| DMAMUX_CHCFG_TRIG_MASK				// �������Դ���ģʽ��ע��ֻ��0~3ͨ��֧��
//   28                                                    | DMAMUX_CHCFG_SOURCE(DMA_Source)      // ָ��DMA����Դ 
//   29 		                                   );
//   30     
//   31 	DMA_CR = 0;												  // Ĭ�����ã���Ҫ��DMA������֮ǰ���ô˼Ĵ���
//   32 	//DMA_DCHPRIn										      // Ĭ�����ȼ����ã����ﲻ�����
//   33 	DMA_BASE_PTR->TCD[DMA_CHn].CITER_ELINKNO = DMA_CITER_ELINKNO_CITER(DMA_Count); // ��ѭ����������1��major loop, ��һ�δ�����=major_loop*minor_loop�����Ϊ2^15=32767 
//   34 	DMA_BASE_PTR->TCD[DMA_CHn].BITER_ELINKNO = DMA_CITER_ELINKNO_CITER(DMA_Count); // ��ѭ����������λֵ��BITERӦ�õ���CITER 
//   35 	DMA_BASE_PTR->TCD[DMA_CHn].NBYTES_MLNO = 1;				  // ÿ��minor loop����1���ֽ�
//   36 
//   37 	//Դ��ַ����
//   38 	DMA_BASE_PTR->TCD[DMA_CHn].SADDR = S_Addr;				  // DMAԴ��ַ
//   39 	DMA_BASE_PTR->TCD[DMA_CHn].SOFF  = 0x0000;				  // ÿ�ζ�Դ��ַ�����ӵ��ֽ���
//   40 	DMA_BASE_PTR->TCD[DMA_CHn].SLAST = 0x00;			      // DMA������ѭ����ɺ�Դ��ַ������
//   41 
//   42 	//Ŀ�ĵ�ַ����
//   43 	DMA_BASE_PTR->TCD[DMA_CHn].DADDR = D_Addr;				  // DMAĿ���ַ 
//   44 	DMA_BASE_PTR->TCD[DMA_CHn].DOFF  = 0x0001;				  // ÿ��дĿ�ĵ�ַ�����ӵ��ֽ���
//   45 	DMA_BASE_PTR->TCD[DMA_CHn].DLAST_SGA = 0x00;		      // DMA������ѭ����ɺ�Ŀ�ĵ�ַ������
//   46 	
//   47 	DMA_BASE_PTR->TCD[DMA_CHn].ATTR  =(0 
//   48 		                              |DMA_ATTR_SMOD(0)		  // Source modulo feature disabled 
//   49 		                              | DMA_ATTR_SSIZE(0)	  // Դ���ݿ�ȣ�   8λ���� 
//   50 		                              | DMA_ATTR_DMOD(0) 	  // Destination modulo feature disabled 
//   51 		                              | DMA_ATTR_DSIZE(0)	  // Ŀ�����ݿ�ȣ� 8λ���� 
//   52 		                              );
//   53 
//   54 	//CSR�Ĵ�������
//   55 	DMA_BASE_PTR->TCD[DMA_CHn].CSR = 0;						  // ������CSR��֮�������� 
//   56         DMA_BASE_PTR->TCD[DMA_CHn].CSR |= DMA_CSR_BWC(3);    //ÿ��1�Σ�eDMA����ֹͣ8������
//   57 	DMA_INT |= (1<<DMA_CHn);	                        // 1����ѭ��������ɺ���жϱ�־λ������ 
//   58 	DMA_BASE_PTR->TCD[DMA_CHn].CSR |= DMA_CSR_INTMAJOR_MASK; // 1����ѭ��������ɺ���ж�ʹ��λ��ʹ�� 
//   59 	DMA_BASE_PTR->TCD[DMA_CHn].CSR |= DMA_CSR_DREQ_MASK;      // 1��DMA������ɺ��Զ���REQλ��ֹͣ���� 
//   60 
//   61 	//DMA��ͣλ
//   62 	DMA_ERQ &= ~(1 << DMA_CHn);						      // �ر���Ӧͨ����DMA���������ý׶��ȹرգ��ٵ���myDMA_Start��������DMA 
//   63                                                               
//   64 	return 1;
//   65 
//   66 }// end of DMAInit()
//   67 
//   68 
//   69 */
//   70 
//   71 
//   72 
//   73 
//   74 //------------------------------------------------------------------------------
//   75 //��������DMAInit
//   76 //��  �ܣ�DMA��ʼ��
//   77 //��  ����
//   78 //        DMA_CHn--ָ����DMAͨ���ţ���Χ0~15��
//   79 //        DMA_Source--DMA����Դ����DMA.h�ļ�����ö�ٶ���
//   80 //        S_Addr--DMA����Դ��ַ
//   81 //        D_Addr--DMA����Ŀ�ĵ�ַ
//   82 //��  �أ���
//   83 //˵  ������ӦOV7620������7725��7725�ò������жϡ�
//   84 //
//   85 //        
//   86 
//   87 //------------------------------------------------------------------------------
//   88 
//   89 
//   90 //���Ǹ�OV7620׼����DMA��ʼ����������ʱ�Ȳ�Ҫ��

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   91 uint8 DMAInit(uint8 DMA_CHn, uint8 DMA_Source, uint16 DMA_Count, uint32 S_Addr, uint32 D_Addr)
//   92 {
DMAInit:
        PUSH     {R4,R5}
//   93     //��������������
//   94 	if (DMA_CHn > 15) return 0;                
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BLT.N    ??DMAInit_0
        MOVS     R0,#+0
        B.N      ??DMAInit_1
//   95 	if (DMA_Source > 52) return 0; 
??DMAInit_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+53
        BLT.N    ??DMAInit_2
        MOVS     R0,#+0
        B.N      ??DMAInit_1
//   96 
//   97 	//DMAͨ������
//   98 	SIM_SCGC6 |= SIM_SCGC6_DMAMUX_MASK;    //��DMA��·����ʱ��
??DMAInit_2:
        LDR.N    R4,??DataTable0  ;; 0x4004803c
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x2
        LDR.N    R5,??DataTable0  ;; 0x4004803c
        STR      R4,[R5, #+0]
//   99 	SIM_SCGC7 |= SIM_SCGC7_DMA_MASK;       //��DMAģ��ʱ��
        LDR.N    R4,??DataTable0_1  ;; 0x40048040
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x2
        LDR.N    R5,??DataTable0_1  ;; 0x40048040
        STR      R4,[R5, #+0]
//  100 	DMAMUX_CHCFG_REG(DMAMUX_BASE_PTR, DMA_CHn) = (0
//  101 	                                           | DMAMUX_CHCFG_ENBL_MASK		// ʹ��DMAͨ�� 
//  102                                                  //| DMAMUX_CHCFG_TRIG_MASK		// �������Դ���ģʽ��ע��ֻ��0~3ͨ��֧��
//  103                                                    | DMAMUX_CHCFG_SOURCE(DMA_Source) // ָ��DMA����Դ 
//  104                                                     );
        ANDS     R1,R1,#0x3F
        ORRS     R1,R1,#0x80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R4,??DataTable0_2  ;; 0x40021000
        STRB     R1,[R0, R4]
//  105     
//  106 	DMA_CR = 0;												  // Ĭ�����ã���Ҫ��DMA������֮ǰ���ô˼Ĵ���
        MOVS     R1,#+0
        LDR.N    R4,??DataTable0_3  ;; 0x40008000
        STR      R1,[R4, #+0]
//  107 	//DMA_DCHPRIn										      // Ĭ�����ȼ����ã����ﲻ�����
//  108 	DMA_BASE_PTR->TCD[DMA_CHn].CITER_ELINKNO = DMA_CITER_ELINKNO_CITER(DMA_Count); // ��ѭ����������1��major loop, ��һ�δ�����=major_loop*minor_loop�����Ϊ2^15=32767 
        LSLS     R1,R2,#+17       ;; ZeroExtS R1,R2,#+17,#+17
        LSRS     R1,R1,#+17
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R4,R0,#+5
        ADD      R4,R4,#+1073741824
        ADDS     R4,R4,#+36864
        STRH     R1,[R4, #+22]
//  109 	DMA_BASE_PTR->TCD[DMA_CHn].BITER_ELINKNO = DMA_CITER_ELINKNO_CITER(DMA_Count); // ��ѭ����������λֵ��BITERӦ�õ���CITER 
        LSLS     R1,R2,#+17       ;; ZeroExtS R1,R2,#+17,#+17
        LSRS     R1,R1,#+17
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STRH     R1,[R2, #+30]
//  110 	DMA_BASE_PTR->TCD[DMA_CHn].NBYTES_MLNO = 1;				  // ÿ��minor loop����1���ֽ�
        MOVS     R1,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STR      R1,[R2, #+8]
//  111 
//  112 	//Դ��ַ����
//  113 	DMA_BASE_PTR->TCD[DMA_CHn].SADDR = S_Addr;				  // DMAԴ��ַ
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R1,R0,#+5
        LDR.N    R2,??DataTable0_4  ;; 0x40009000
        STR      R3,[R1, R2]
//  114 	DMA_BASE_PTR->TCD[DMA_CHn].SOFF  = 0x0000;				  // ÿ�ζ�Դ��ַ�����ӵ��ֽ���
        MOVS     R1,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STRH     R1,[R2, #+4]
//  115 	DMA_BASE_PTR->TCD[DMA_CHn].SLAST = 0x00;			      // DMA������ѭ����ɺ�Դ��ַ������
        MOVS     R1,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STR      R1,[R2, #+12]
//  116 
//  117 	//Ŀ�ĵ�ַ����
//  118 	DMA_BASE_PTR->TCD[DMA_CHn].DADDR = D_Addr;				  // DMAĿ���ַ 
        LDR      R1,[SP, #+8]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STR      R1,[R2, #+16]
//  119 	DMA_BASE_PTR->TCD[DMA_CHn].DOFF  = 0x0001;				  // ÿ��дĿ�ĵ�ַ�����ӵ��ֽ���
        MOVS     R1,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STRH     R1,[R2, #+20]
//  120 	//DMA_BASE_PTR->TCD[DMA_CHn].DLAST_SGA = CameraWidth;		      // DMA������ѭ����ɺ�Ŀ�ĵ�ַ������
//  121 	DMA_BASE_PTR->TCD[DMA_CHn].DLAST_SGA = 0;      /////////////////////////�������ֲ�֪���ĸ��ǶԵ�
        MOVS     R1,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STR      R1,[R2, #+24]
//  122         
//  123 	DMA_BASE_PTR->TCD[DMA_CHn].ATTR  =(0 
//  124 		                              |DMA_ATTR_SMOD(0)		  // Source modulo feature disabled 
//  125 		                              | DMA_ATTR_SSIZE(0)	  // Դ���ݿ�ȣ�   8λ���� 
//  126 		                              | DMA_ATTR_DMOD(0) 	  // Destination modulo feature disabled 
//  127 		                              | DMA_ATTR_DSIZE(0)	  // Ŀ�����ݿ�ȣ� 8λ���� 
//  128 		                              );
        MOVS     R1,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STRH     R1,[R2, #+6]
//  129 
//  130 	//CSR�Ĵ�������
//  131 	DMA_BASE_PTR->TCD[DMA_CHn].CSR = 0;				// ������CSR��֮�������� 
        MOVS     R1,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STRH     R1,[R2, #+28]
//  132 	DMA_INT |= (1<<DMA_CHn);					// 1����ѭ��������ɺ���жϱ�־λ������ 
        LDR.N    R1,??DataTable0_5  ;; 0x40008024
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        ORRS     R1,R2,R1
        LDR.N    R2,??DataTable0_5  ;; 0x40008024
        STR      R1,[R2, #+0]
//  133 	DMA_BASE_PTR->TCD[DMA_CHn].CSR |= DMA_CSR_INTMAJOR_MASK; // 1����ѭ��������ɺ���ж�ʹ��λ��ʹ�� 
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R1,R0,#+5
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+36864
        LDRH     R1,[R1, #+28]
        ORRS     R1,R1,#0x2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STRH     R1,[R2, #+28]
//  134 	DMA_BASE_PTR->TCD[DMA_CHn].CSR |= DMA_CSR_DREQ_MASK;      // 1��DMA������ɺ��Զ���REQλ��ֹͣ���� 
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R1,R0,#+5
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+36864
        LDRH     R1,[R1, #+28]
        ORRS     R1,R1,#0x8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        STRH     R1,[R2, #+28]
//  135 
//  136 	//DMA��ͣλ
//  137 	DMA_ERQ &= ~(1 << DMA_CHn);		// �ر���Ӧͨ����DMA���������ý׶��ȹر�
        LDR.N    R1,??DataTable0_6  ;; 0x4000800c
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R0,R2,R0
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable0_6  ;; 0x4000800c
        STR      R0,[R1, #+0]
//  138                                                               // ������ѭ��(����1����ѭ��)��ɺ�ERQ�ᱻ�Զ����㣬��Ҫ���ж����ٴ��ֶ�������
//  139 	return 1;
        MOVS     R0,#+1
??DMAInit_1:
        POP      {R4,R5}
        BX       LR               ;; return
//  140 
//  141 }// end of DMAInit()

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0x40048040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     0x40021000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     0x40008000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     0x40009000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     0x40008024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     0x4000800c
//  142 
//  143 
//  144 /*  ���Ǹ�DMA����ר�õ�DMA��ʼ����������ʱ���ö�
//  145 uint8 DMAInit(uint8 DMA_CHn, uint8 DMA_Source, uint32 S_Addr, uint32 D_Addr)
//  146 {
//  147     //��������������
//  148 	if (DMA_CHn > 15) return 0;                
//  149 	if (DMA_Source > 52) return 0; 
//  150 
//  151 	//DMAͨ������
//  152 	SIM_SCGC6 |= SIM_SCGC6_DMAMUX_MASK;    //��DMA��·����ʱ��
//  153 	SIM_SCGC7 |= SIM_SCGC7_DMA_MASK;       //��DMAģ��ʱ��
//  154 	DMAMUX_CHCFG_REG(DMAMUX_BASE_PTR, DMA_CHn) = (0
//  155 												  | DMAMUX_CHCFG_ENBL_MASK			        // ʹ��DMAͨ�� 
//  156 												  //| DMAMUX_CHCFG_TRIG_MASK				// �������Դ���ģʽ��ע��ֻ��0~3ͨ��֧��
//  157 												  | DMAMUX_CHCFG_SOURCE(DMA_Source)      // ָ��DMA����Դ 
//  158 												  );
//  159     
//  160 	DMA_CR = 0;												  // Ĭ�����ã���Ҫ��DMA������֮ǰ���ô˼Ĵ���
//  161 	//DMA_DCHPRIn										      // Ĭ�����ȼ����ã����ﲻ�����
//  162 	DMA_BASE_PTR->TCD[DMA_CHn].CITER_ELINKNO = DMA_CITER_ELINKNO_CITER(10); // ��ѭ����������1��major loop, ��һ�δ�����=major_loop*minor_loop�����Ϊ2^15=32767 
//  163 	DMA_BASE_PTR->TCD[DMA_CHn].BITER_ELINKNO = DMA_CITER_ELINKNO_CITER(10); // ��ѭ����������λֵ��BITERӦ�õ���CITER 
//  164 	DMA_BASE_PTR->TCD[DMA_CHn].NBYTES_MLNO = 1;				  // ÿ��minor loop����1���ֽ�
//  165 
//  166 	//Դ��ַ����
//  167 	DMA_BASE_PTR->TCD[DMA_CHn].SADDR = S_Addr;				  // DMAԴ��ַ
//  168 	DMA_BASE_PTR->TCD[DMA_CHn].SOFF  = 0x0000;				  // ÿ�ζ�Դ��ַ�����ӵ��ֽ���
//  169 	DMA_BASE_PTR->TCD[DMA_CHn].SLAST = 0x00;			      // DMA������ѭ����ɺ�Դ��ַ������
//  170 
//  171 	//Ŀ�ĵ�ַ����
//  172 	DMA_BASE_PTR->TCD[DMA_CHn].DADDR = D_Addr;				  // DMAĿ���ַ 
//  173 	DMA_BASE_PTR->TCD[DMA_CHn].DOFF  = 0x0001;				  // ÿ��дĿ�ĵ�ַ�����ӵ��ֽ���
//  174 	DMA_BASE_PTR->TCD[DMA_CHn].DLAST_SGA = -10;		      // DMA������ѭ����ɺ�Ŀ�ĵ�ַ������
//  175 	
//  176 	DMA_BASE_PTR->TCD[DMA_CHn].ATTR  =(0 
//  177 		                              |DMA_ATTR_SMOD(0)		  // Source modulo feature disabled 
//  178 		                              | DMA_ATTR_SSIZE(0)	  // Դ���ݿ�ȣ�   8λ���� 
//  179 		                              | DMA_ATTR_DMOD(0) 	  // Destination modulo feature disabled 
//  180 		                              | DMA_ATTR_DSIZE(0)	  // Ŀ�����ݿ�ȣ� 8λ���� 
//  181 		                              );
//  182 
//  183 	//CSR�Ĵ�������
//  184 	DMA_BASE_PTR->TCD[DMA_CHn].CSR = 0;						  // ������CSR��֮�������� 
//  185 	DMA_INT |= (1<<DMA_CHn);						// 1����ѭ��������ɺ���жϱ�־λ������ 
//  186 	DMA_BASE_PTR->TCD[DMA_CHn].CSR |= DMA_CSR_INTMAJOR_MASK; // 1����ѭ��������ɺ���ж�ʹ��λ��ʹ�� 
//  187 	DMA_BASE_PTR->TCD[DMA_CHn].CSR |= DMA_CSR_DREQ_MASK;      // 1��DMA������ɺ��Զ���REQλ��ֹͣ���� 
//  188 
//  189 	//DMA��ͣλ
//  190 	DMA_ERQ &= ~(1 << DMA_CHn);						      // �ر���Ӧͨ����DMA���������ý׶��ȹرգ��ٵ���myDMA_Start��������DMA 
//  191                                                               // ������ѭ��(����1����ѭ��)��ɺ�ERQ�ᱻ�Զ����㣬��Ҫ���ж����ٴ��ֶ�������
//  192 	return 1;
//  193 
//  194 }// end of DMAInit()
//  195 
//  196 */
//  197 
//  198 //���漸������Ӧ�÷���isr.c �У�ֻ���ݴ��ڴ�
//  199 /*
//  200 void DMA_CHO_ISR(void)
//  201 {
//  202 		DMA_INT|=DMA_INT_INT0_MASK;//���ͨ��0�ж�
//  203 			//putstr("DMA complete��");
//  204 				row_F[imagerow]=1;//�ɼ���ɱ�־
//  205 					imagerow++;	
//  206 }
//  207 
//  208 
//  209 
//  210 
//  211 
//  212 
//  213 
//  214 
//  215 
//  216 void portb_isr(void)//���жϣ�B10���������ж�
//  217 {
//  218 	PORTB_PCR10|=PORT_PCR_ISF_MASK;//����жϱ�־λ
//  219 	row++; //�м���
//  220 	if(row==data_table[imagerow])//�����ǰ������Ӧ�òɼ� 
//  221 		{
//  222 		DMA_ERQ|=DMA_ERQ_ERQ0_MASK;//ʹ��ͨ��0Ӳ��DMA����  
//  223 		}
//  224 	  else if(row>=ENDROW) //һ����ɣ��ر����ж�
//  225 	  	{
//  226 		  disable_irq (88);
//  227 		  	 displaypara(row,6,60);
//  228 
//  229 	  	}
//  230 }
//  231 */
//  232 
//  233 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  234 void enable_DMA_irq(uint8 DMAno)
//  235 {
enable_DMA_irq:
        PUSH     {R7,LR}
//  236   switch(DMAno)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??enable_DMA_irq_0
        CMP      R0,#+2
        BEQ.N    ??enable_DMA_irq_1
        BCC.N    ??enable_DMA_irq_2
        CMP      R0,#+4
        BEQ.N    ??enable_DMA_irq_3
        BCC.N    ??enable_DMA_irq_4
        CMP      R0,#+6
        BEQ.N    ??enable_DMA_irq_5
        BCC.N    ??enable_DMA_irq_6
        CMP      R0,#+8
        BEQ.N    ??enable_DMA_irq_7
        BCC.N    ??enable_DMA_irq_8
        CMP      R0,#+10
        BEQ.N    ??enable_DMA_irq_9
        BCC.N    ??enable_DMA_irq_10
        CMP      R0,#+12
        BEQ.N    ??enable_DMA_irq_11
        BCC.N    ??enable_DMA_irq_12
        CMP      R0,#+14
        BEQ.N    ??enable_DMA_irq_13
        BCC.N    ??enable_DMA_irq_14
        CMP      R0,#+15
        BEQ.N    ??enable_DMA_irq_15
        B.N      ??enable_DMA_irq_16
//  237   {
//  238     case 0:
//  239     enable_irq(0);			      //��DMAͨ��0��IRQ�ж�
??enable_DMA_irq_0:
        MOVS     R0,#+0
        BL       enable_irq
//  240     break;
        B.N      ??enable_DMA_irq_17
//  241     case 1:
//  242     enable_irq(1);			      //��DMAͨ��1��IRQ�ж�
??enable_DMA_irq_2:
        MOVS     R0,#+1
        BL       enable_irq
//  243     break;
        B.N      ??enable_DMA_irq_17
//  244     case 2:
//  245     enable_irq(2);			     //��DMAͨ��2��IRQ�ж�
??enable_DMA_irq_1:
        MOVS     R0,#+2
        BL       enable_irq
//  246     break;
        B.N      ??enable_DMA_irq_17
//  247     case 3:
//  248     enable_irq(3);			      //��DMAͨ��3��IRQ�ж�
??enable_DMA_irq_4:
        MOVS     R0,#+3
        BL       enable_irq
//  249     break;
        B.N      ??enable_DMA_irq_17
//  250     case 4:
//  251     enable_irq(4);			      //��DMAͨ��4��IRQ�ж�
??enable_DMA_irq_3:
        MOVS     R0,#+4
        BL       enable_irq
//  252     break;
        B.N      ??enable_DMA_irq_17
//  253     case 5:
//  254     enable_irq(5);			      //��DMAͨ��5��IRQ�ж�
??enable_DMA_irq_6:
        MOVS     R0,#+5
        BL       enable_irq
//  255     break;
        B.N      ??enable_DMA_irq_17
//  256     case 6:
//  257     enable_irq(6);			     //��DMAͨ��6��IRQ�ж�
??enable_DMA_irq_5:
        MOVS     R0,#+6
        BL       enable_irq
//  258     break;
        B.N      ??enable_DMA_irq_17
//  259     case 7:
//  260     enable_irq(7);			      //��DMAͨ��7��IRQ�ж�
??enable_DMA_irq_8:
        MOVS     R0,#+7
        BL       enable_irq
//  261     break;
        B.N      ??enable_DMA_irq_17
//  262     case 8:
//  263     enable_irq(8);			      //��DMAͨ��8��IRQ�ж�
??enable_DMA_irq_7:
        MOVS     R0,#+8
        BL       enable_irq
//  264     break;
        B.N      ??enable_DMA_irq_17
//  265     case 9:
//  266     enable_irq(9);			      //��DMAͨ��9��IRQ�ж�
??enable_DMA_irq_10:
        MOVS     R0,#+9
        BL       enable_irq
//  267     break;
        B.N      ??enable_DMA_irq_17
//  268     case 10:
//  269     enable_irq(10);			     //��DMAͨ��10��IRQ�ж�
??enable_DMA_irq_9:
        MOVS     R0,#+10
        BL       enable_irq
//  270     break;
        B.N      ??enable_DMA_irq_17
//  271     case 11:
//  272     enable_irq(11);			      //��DMAͨ��11��IRQ�ж�
??enable_DMA_irq_12:
        MOVS     R0,#+11
        BL       enable_irq
//  273     break;
        B.N      ??enable_DMA_irq_17
//  274     case 12:
//  275     enable_irq(12);			      //��DMAͨ��12��IRQ�ж�
??enable_DMA_irq_11:
        MOVS     R0,#+12
        BL       enable_irq
//  276     break;
        B.N      ??enable_DMA_irq_17
//  277     case 13:
//  278     enable_irq(13);			      //��DMAͨ��13��IRQ�ж�
??enable_DMA_irq_14:
        MOVS     R0,#+13
        BL       enable_irq
//  279     break;
        B.N      ??enable_DMA_irq_17
//  280     case 14:
//  281     enable_irq(14);			     //��DMAͨ��14��IRQ�ж�
??enable_DMA_irq_13:
        MOVS     R0,#+14
        BL       enable_irq
//  282     break;
        B.N      ??enable_DMA_irq_17
//  283     case 15:
//  284     enable_irq(15);			      //��DMAͨ��15��IRQ�ж�
??enable_DMA_irq_15:
        MOVS     R0,#+15
        BL       enable_irq
//  285     break;
        B.N      ??enable_DMA_irq_17
//  286     
//  287     default:
//  288     break;
//  289   }    
//  290 }
??enable_DMA_irq_16:
??enable_DMA_irq_17:
        POP      {R0,PC}          ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  291 
//  292 
//  293 
//  294 
//  295 
//  296 
//  297 
//  298 
//  299 
//  300 
//  301 
//  302 
//  303 
//  304 
//  305 
//  306 
//  307 
//  308 
//  309 
//  310 
//  311 
//  312 
//  313 
//  314 
//  315 
//  316 
//  317 
//  318 
//  319 
//  320 
//  321 
//  322 
//  323 
//  324 
//  325 
//  326 
//  327 
//  328 
//  329 
//  330 
//  331 
//  332 
//  333 
// 
//   1 byte  in section .bss
// 554 bytes in section .text
// 
// 554 bytes of CODE memory
//   1 byte  of DATA memory
//
//Errors: none
//Warnings: none
