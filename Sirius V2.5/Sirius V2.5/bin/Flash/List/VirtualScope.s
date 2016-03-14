///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       12/Mar/2016  23:02:59
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\Sirius V2.5\src\Sources\C\Function_C\VirtualScope.c
//    Command line =  
//        "E:\Sirius V2.5\src\Sources\C\Function_C\VirtualScope.c" -D IAR -D
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
//    List file    =  E:\Sirius V2.5\bin\Flash\List\VirtualScope.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_f2iz
        EXTERN __aeabi_memclr4
        EXTERN uart_send1

        PUBLIC CRC_CHECK
        PUBLIC VirtualOutData
        PUBLIC VirtualOutPut_Data

// E:\Sirius V2.5\src\Sources\C\Function_C\VirtualScope.c
//    1 /******************************************************************************/
//    2 /*******************************************************************************
//    3   文件名：虚拟示波器C文件VirtualScope.c
//    4   功  能：给虚拟示波器发送数据
//    5   日  期：2014.11.18
//    6   作  者：
//    7   备  注：
//    8 *******************************************************************************/
//    9 /******************************************************************************/
//   10 
//   11 #include "VirtualScope.h"
//   12 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 float VirtualOutData[4] = { 0 };
VirtualOutData:
        DS8 16
//   14 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   15 unsigned short CRC_CHECK(unsigned char *Buf, unsigned char CRC_CNT)
//   16 {
CRC_CHECK:
        PUSH     {R4,R5}
//   17     unsigned short CRC_Temp;
//   18     unsigned char i,j;
//   19     CRC_Temp = 0xffff;
        MOVW     R2,#+65535
//   20 
//   21     for (i=0;i<CRC_CNT; i++){      
        MOVS     R3,#+0
        B.N      ??CRC_CHECK_0
??CRC_CHECK_1:
        ADDS     R3,R3,#+1
??CRC_CHECK_0:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R3,R1
        BCS.N    ??CRC_CHECK_2
//   22         CRC_Temp ^= Buf[i];
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R4,[R3, R0]
        EORS     R2,R4,R2
//   23         for (j=0;j<8;j++) {
        MOVS     R4,#+0
        B.N      ??CRC_CHECK_3
//   24             if (CRC_Temp & 0x01)
//   25                 CRC_Temp = (CRC_Temp >>1 ) ^ 0xa001;
//   26             else
//   27                 CRC_Temp = CRC_Temp >> 1;
??CRC_CHECK_4:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSRS     R2,R2,#+1
??CRC_CHECK_5:
        ADDS     R4,R4,#+1
??CRC_CHECK_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??CRC_CHECK_1
        LSLS     R5,R2,#+31
        BPL.N    ??CRC_CHECK_4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSRS     R2,R2,#+1
        EOR      R2,R2,#0xA000
        EORS     R2,R2,#0x1
        B.N      ??CRC_CHECK_5
//   28         }
//   29     }
//   30     return(CRC_Temp);
??CRC_CHECK_2:
        MOVS     R0,R2
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4,R5}
        BX       LR               ;; return
//   31 }
//   32 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   33 void VirtualOutPut_Data(void)
//   34 {
VirtualOutPut_Data:
        PUSH     {R4,LR}
        SUB      SP,SP,#+48
//   35   int temp[4] = {0};
        ADD      R0,SP,#+28
        MOVS     R1,#+16
        BL       __aeabi_memclr4
//   36   unsigned int temp1[4] = {0};
        ADD      R0,SP,#+12
        MOVS     R1,#+16
        BL       __aeabi_memclr4
//   37   unsigned char databuf[10] = {0};
        ADD      R0,SP,#+0
        MOVS     R1,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        STM      R0!,{R1-R3}
        SUBS     R0,R0,#+12
//   38   unsigned char i;
//   39   unsigned short CRC16 = 0;
        MOVS     R0,#+0
//   40   for(i=0;i<4;i++)
        MOVS     R4,#+0
        B.N      ??VirtualOutPut_Data_0
//   41    {
//   42     
//   43     temp[i]  = (int)VirtualOutData[i];
??VirtualOutPut_Data_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable0
        LDR      R0,[R0, R4, LSL #+2]
        BL       __aeabi_f2iz
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R1,SP,#+28
        STR      R0,[R1, R4, LSL #+2]
//   44     temp1[i] = (unsigned int)temp[i];
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+28
        LDR      R0,[R0, R4, LSL #+2]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R1,SP,#+12
        STR      R0,[R1, R4, LSL #+2]
//   45     
//   46    }
        ADDS     R4,R4,#+1
??VirtualOutPut_Data_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??VirtualOutPut_Data_1
//   47    
//   48   for(i=0;i<4;i++) 
        MOVS     R4,#+0
        B.N      ??VirtualOutPut_Data_2
//   49   {
//   50     databuf[i*2]   = (unsigned char)(temp1[i]%256);
??VirtualOutPut_Data_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+12
        LDR      R0,[R0, R4, LSL #+2]
        MOV      R1,#+256
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+0
        STRB     R2,[R0, R4, LSL #+1]
//   51     databuf[i*2+1] = (unsigned char)(temp1[i]/256);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+12
        LDR      R0,[R0, R4, LSL #+2]
        LSRS     R0,R0,#+8
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R1,SP,#+0
        ADDS     R1,R1,R4, LSL #+1
        STRB     R0,[R1, #+1]
//   52   }
        ADDS     R4,R4,#+1
??VirtualOutPut_Data_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??VirtualOutPut_Data_3
//   53   
//   54   CRC16 = CRC_CHECK(databuf,8);
        MOVS     R1,#+8
        ADD      R0,SP,#+0
        BL       CRC_CHECK
//   55   databuf[8] = CRC16%256;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOV      R1,#+256
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        STRB     R2,[SP, #+8]
//   56   databuf[9] = CRC16/256;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOV      R1,#+256
        SDIV     R0,R0,R1
        STRB     R0,[SP, #+9]
//   57   
//   58   for(i=0;i<10;i++)
        MOVS     R4,#+0
        B.N      ??VirtualOutPut_Data_4
//   59   uart_send1(UART0,databuf[i]);
??VirtualOutPut_Data_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R1,[R4, R0]
        LDR.N    R0,??DataTable0_1  ;; 0x4006a000
        BL       uart_send1
        ADDS     R4,R4,#+1
??VirtualOutPut_Data_4:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+10
        BLT.N    ??VirtualOutPut_Data_5
//   60 }
        ADD      SP,SP,#+48
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     VirtualOutData

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0x4006a000

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        END
//   61 
// 
//  16 bytes in section .bss
//  44 bytes in section .rodata
// 286 bytes in section .text
// 
// 286 bytes of CODE  memory
//  44 bytes of CONST memory
//  16 bytes of DATA  memory
//
//Errors: none
//Warnings: none
