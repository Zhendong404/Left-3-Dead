///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    13/Nov/2014  01:13:37 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  D:\IAR_TEST\Sirius\Sirius V2.1\src\Sources\C\SD_C\spi.c /
//    Command line =  "D:\IAR_TEST\Sirius\Sirius                              /
//                    V2.1\src\Sources\C\SD_C\spi.c" -D IAR -D TWR_K60N512    /
//                    -lCN "D:\IAR_TEST\Sirius\Sirius V2.1\bin\Ram\List\"     /
//                    -lB "D:\IAR_TEST\Sirius\Sirius V2.1\bin\Ram\List\" -o   /
//                    "D:\IAR_TEST\Sirius\Sirius V2.1\bin\Ram\Obj\" --no_cse  /
//                    --no_unroll --no_inline --no_code_motion --no_tbaa      /
//                    --no_clustering --no_scheduling --debug                 /
//                    --endian=little --cpu=Cortex-M4 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.3\arm\INC\c\DLib_Config_Normal.h" -I                  /
//                    "D:\IAR_TEST\Sirius\Sirius V2.1\src\Sources\H\" -I      /
//                    "D:\IAR_TEST\Sirius\Sirius                              /
//                    V2.1\src\Sources\H\Component_H\" -I                     /
//                    "D:\IAR_TEST\Sirius\Sirius                              /
//                    V2.1\src\Sources\H\Frame_H\" -I                         /
//                    "D:\IAR_TEST\Sirius\Sirius                              /
//                    V2.1\src\Sources\H\Function_H\" -I                      /
//                    "D:\IAR_TEST\Sirius\Sirius V2.1\src\Sources\H\SD_H\"    /
//                    -Ol --use_c++_inline                                    /
//    List file    =  D:\IAR_TEST\Sirius\Sirius V2.1\bin\Ram\List\spi.s       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME spi

        #define SHT_PROGBITS 0x1

        EXTERN gpio_init

        PUBLIC SPI_Configuration
        PUBLIC SPI_ReadWriteByte
        PUBLIC SPI_SetSpeed
        PUBLIC hw_spi_get_base_address
        PUBLIC hw_spi_init
        PUBLIC hw_spi_re

// D:\IAR_TEST\Sirius\Sirius V2.1\src\Sources\C\SD_C\spi.c
//    1 #include "spi.h"
//    2 
//    3 
//    4 //=================�ڲ���������=============================================
//    5 
//    6 //=========================================================================
//    7 //�������ƣ�hw_spi_get_base_address                                                        
//    8 //���ܸ�Ҫ����ȡSPI�Ĵ����Ļ�ַ                                                
//    9 //����˵����spiNo:SPI��      
//   10 //�������أ�SPI�Ļ�ֵַ                                                                  
//   11 //=========================================================================
//   12 SPI_MemMapPtr hw_spi_get_base_address(uint8 spiNo);
//   13 
//   14 //=================�ӿں���ʵ��=============================================
//   15 
//   16 //=========================================================================
//   17 //�������ƣ�hw_spi_init
//   18 //����������spiNo��SPIͨ���š�
//   19 //          Master:�Ƿ���������
//   20 //�������أ���
//   21 //���ܸ�Ҫ��SPI��ʼ����
//   22 //=========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   23 void hw_spi_init(uint8 spiNo,uint8 master)
//   24 {
hw_spi_init:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
//   25     SPI_MemMapPtr BaseAdd = hw_spi_get_base_address(spiNo);
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       hw_spi_get_base_address
//   26     
//   27     //ʹ��SPIģ��ʱ�ӣ�����SPI���Ź���
//   28     if(spiNo == 0)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??hw_spi_init_0
//   29     {
//   30         SIM_SCGC6 |= SIM_SCGC6_DSPI0_MASK;
        LDR.N    R1,??DataTable5  ;; 0x4004803c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1000
        LDR.N    R2,??DataTable5  ;; 0x4004803c
        STR      R1,[R2, #+0]
//   31         PORTA_PCR14 = 0 | PORT_PCR_MUX(0x2) | PORT_PCR_DSE_MASK;//PCS0
        LDR.N    R1,??DataTable5_1  ;; 0x40049038
        MOV      R2,#+576
        STR      R2,[R1, #+0]
//   32         PORTA_PCR15 = 0 | PORT_PCR_MUX(0x2) | PORT_PCR_DSE_MASK;//SCK
        LDR.N    R1,??DataTable5_2  ;; 0x4004903c
        MOV      R2,#+576
        STR      R2,[R1, #+0]
//   33         PORTA_PCR16 = 0 | PORT_PCR_MUX(0x2) | PORT_PCR_DSE_MASK;//SOUT
        LDR.N    R1,??DataTable5_3  ;; 0x40049040
        MOV      R2,#+576
        STR      R2,[R1, #+0]
//   34         PORTA_PCR17 = 0 | PORT_PCR_MUX(0x2);//SIN
        LDR.N    R1,??DataTable5_4  ;; 0x40049044
        MOV      R2,#+512
        STR      R2,[R1, #+0]
        B.N      ??hw_spi_init_1
//   35     }
//   36     else if(spiNo == 1)
??hw_spi_init_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??hw_spi_init_2
//   37     {
//   38         SIM_SCGC6 |= SIM_SCGC6_SPI1_MASK;
        LDR.N    R1,??DataTable5  ;; 0x4004803c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x2000
        LDR.N    R2,??DataTable5  ;; 0x4004803c
        STR      R1,[R2, #+0]
//   39         PORTE_PCR1 = 0 | PORT_PCR_MUX(0x2) | PORT_PCR_DSE_MASK;//SOUT
        LDR.N    R1,??DataTable5_5  ;; 0x4004d004
        MOV      R2,#+576
        STR      R2,[R1, #+0]
//   40         PORTE_PCR2 = 0 | PORT_PCR_MUX(0x2) | PORT_PCR_DSE_MASK;//SCK
        LDR.N    R1,??DataTable5_6  ;; 0x4004d008
        MOV      R2,#+576
        STR      R2,[R1, #+0]
//   41         PORTE_PCR3 = 0 | PORT_PCR_MUX(0x2);//SIN
        LDR.N    R1,??DataTable5_7  ;; 0x4004d00c
        MOV      R2,#+512
        STR      R2,[R1, #+0]
//   42         PORTE_PCR4 = 0 | PORT_PCR_MUX(0x2) | PORT_PCR_DSE_MASK;//PCS0
        LDR.N    R1,??DataTable5_8  ;; 0x4004d010
        MOV      R2,#+576
        STR      R2,[R1, #+0]
        B.N      ??hw_spi_init_1
//   43     }
//   44     else 
//   45     {
//   46         SIM_SCGC3 |= SIM_SCGC3_SPI2_MASK;
??hw_spi_init_2:
        LDR.N    R1,??DataTable5_9  ;; 0x40048030
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1000
        LDR.N    R2,??DataTable5_9  ;; 0x40048030
        STR      R1,[R2, #+0]
//   47     }
//   48     
//   49     SPI_MCR_REG(BaseAdd) = 0 
//   50                  | SPI_MCR_CLR_TXF_MASK     //Clear the Tx FIFO counter.
//   51                  | SPI_MCR_CLR_RXF_MASK     //Clear the Rx FIFO counter.
//   52                  | SPI_MCR_PCSIS_MASK
//   53                  | SPI_MCR_HALT_MASK;
??hw_spi_init_1:
        LDR.N    R1,??DataTable5_10  ;; 0x3f0c01
        STR      R1,[R0, #+0]
//   54 
//   55     //�������ӻ�ģʽ���ù���ģʽ
//   56     if(master == MASTER)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??hw_spi_init_3
//   57     {
//   58         SPI_MCR_REG(BaseAdd) |= SPI_MCR_MSTR_MASK;//�ڿ�ʼҪ��ֹͣ����
        LDR      R1,[R0, #+0]
        ORRS     R1,R1,#0x80000000
        STR      R1,[R0, #+0]
//   59         SPI_CTAR_REG(BaseAdd,0) = 0
//   60                        | SPI_CTAR_DBR_MASK
//   61                        | SPI_CTAR_FMSZ(0x08)
//   62                        | SPI_CTAR_PDT_MASK//��ʱ����Ϊ7  ���Ը�С�� ����ÿ�δ������֮��������һ��
//   63                        | SPI_CTAR_BR(0)//2��Ƶ
//   64                        | SPI_CTAR_CPOL_MASK 
//   65                        | SPI_CTAR_CPHA_MASK;
        LDR.N    R1,??DataTable5_11  ;; 0xc60c0000
        STR      R1,[R0, #+12]
        B.N      ??hw_spi_init_4
//   66     }
//   67     else
//   68     {
//   69         SPI_CTAR_SLAVE_REG(BaseAdd,0) = 0 
//   70                             | SPI_CTAR_SLAVE_FMSZ(0x08)
//   71                             | SPI_CTAR_SLAVE_CPOL_MASK 
//   72                             | SPI_CTAR_SLAVE_CPHA_MASK; 
??hw_spi_init_3:
        MOVS     R1,#+1174405120
        STR      R1,[R0, #+12]
//   73     }
//   74  
//   75     SPI_SR_REG(BaseAdd) = (SPI_SR_EOQF_MASK
//   76                          | SPI_SR_TFUF_MASK
//   77                          | SPI_SR_TFFF_MASK
//   78                          | SPI_SR_RFOF_MASK
//   79                          | SPI_SR_RFDF_MASK);
??hw_spi_init_4:
        LDR.N    R1,??DataTable5_12  ;; 0x1a0a0000
        STR      R1,[R0, #+44]
//   80     
//   81     SPI_MCR_REG(BaseAdd) &= ~SPI_MCR_HALT_MASK;
        LDR      R1,[R0, #+0]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        STR      R1,[R0, #+0]
//   82 }
        POP      {R0,R4,R5,PC}    ;; return
//   83 
//   84 
//   85 //=========================================================================
//   86 //�������ƣ�hw_spi_send
//   87 //����������spiNo��SPIͨ���š�
//   88 //          data[]����Ҫ���͵����ݡ�
//   89 //          len�����ݳ��ȡ�
//   90 //�������أ���
//   91 //���ܸ�Ҫ��SPI�������ݡ�
//   92 //=========================================================================
//   93 //uint32 hw_spi_send(uint8 spiNo,uint8 data[],uint32 len)

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   94 uint32 SPI_ReadWriteByte(uint8 spiNo,unsigned char buffer)
//   95 {
SPI_ReadWriteByte:
        PUSH     {R4,LR}
        MOVS     R4,R1
//   96     //uint32 i = 0;
//   97     uint32 RX_Data;
//   98     SPI_MemMapPtr BaseAdd = hw_spi_get_base_address(spiNo);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       hw_spi_get_base_address
//   99     
//  100     SPI_SR_REG(BaseAdd) = (SPI_SR_EOQF_MASK
//  101          | SPI_SR_TFUF_MASK
//  102          | SPI_SR_TFFF_MASK
//  103          | SPI_SR_RFOF_MASK
//  104          | SPI_SR_RFDF_MASK)
//  105       ;
        LDR.N    R1,??DataTable5_12  ;; 0x1a0a0000
        STR      R1,[R0, #+44]
//  106     SPI_MCR_REG(BaseAdd) |= SPI_MCR_CLR_TXF_MASK | SPI_MCR_CLR_RXF_MASK  ;
        LDR      R1,[R0, #+0]
        ORRS     R1,R1,#0xC00
        STR      R1,[R0, #+0]
//  107 #if 0              
//  108     for(i = 0;i < len;i++)
//  109     {
//  110         if(i == (len - 1))
//  111         {
//  112                 SPI_PUSHR_REG(BaseAdd) = 0 
//  113                                | SPI_PUSHR_CTAS(0)
//  114                                | SPI_PUSHR_EOQ_MASK
//  115                                | SPI_PUSHR_PCS(1)
//  116                                | SPI_PUSHR_TXDATA(data[i]);
//  117         }
//  118         else
//  119         {
//  120                 SPI_PUSHR_REG(BaseAdd) = 0 | SPI_PUSHR_CONT_MASK 
//  121                                | SPI_PUSHR_CTAS(0)
//  122                                | SPI_PUSHR_PCS(1)
//  123                                | SPI_PUSHR_TXDATA(data[i]);
//  124         }
//  125     }
//  126 #endif
//  127     
//  128 #if 1
//  129     SPI_SR_REG(BaseAdd) |= SPI_SR_TCF_MASK;                         //���������ɱ�־
        LDR      R1,[R0, #+44]
        ORRS     R1,R1,#0x80000000
        STR      R1,[R0, #+44]
//  130     
//  131     SPI_PUSHR_REG(BaseAdd) = (SPI_PUSHR_CTAS(0)                     //ѡ��CTAR0�Ĵ������崫������
//  132                           | SPI_PUSHR_EOQ_MASK                      //��֡SPI���������һ֡����
//  133                           | SPI_PUSHR_TXDATA(buffer));              //д������
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ORRS     R1,R4,#0x8000000
        STR      R1,[R0, #+52]
//  134     
//  135     SPI_MCR_REG(BaseAdd) &= ~SPI_MCR_HALT_MASK;                     //����SPI���ݴ���
        LDR      R1,[R0, #+0]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        STR      R1,[R0, #+0]
//  136     
//  137     while((SPI_SR_REG(BaseAdd) & SPI_SR_TCF_MASK) == 0);            //�ȴ��������
??SPI_ReadWriteByte_0:
        LDR      R1,[R0, #+44]
        CMP      R1,#+0
        BPL.N    ??SPI_ReadWriteByte_0
//  138 
//  139 #endif
//  140   
//  141     SPI_SR_REG(BaseAdd) |= SPI_SR_TCF_MASK;                         //���������ɱ�־
        LDR      R1,[R0, #+44]
        ORRS     R1,R1,#0x80000000
        STR      R1,[R0, #+44]
//  142     
//  143     while((SPI_SR_REG(BaseAdd) & SPI_SR_RFDF_MASK) == 0);           //�ȴ����ջ���������Ч���ݣ����ȴ�RX FIFO��Ϊ��Ϊֹ
??SPI_ReadWriteByte_1:
        LDR      R1,[R0, #+44]
        LSLS     R1,R1,#+14
        BPL.N    ??SPI_ReadWriteByte_1
//  144     
//  145     RX_Data = (uint8)SPI_POPR_REG(BaseAdd);                         //��ȡRX FIFO�ڲ�����
        LDR      R1,[R0, #+56]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
//  146     
//  147     SPI_SR_REG(BaseAdd) |= SPI_SR_RFDF_MASK;                        //���RX FIFO��Ϊ�ձ�־
        LDR      R2,[R0, #+44]
        ORRS     R2,R2,#0x20000
        STR      R2,[R0, #+44]
//  148     
//  149     SPI_MCR_REG(BaseAdd) |= SPI_MCR_HALT_MASK;                      //ֹͣSPI���ݴ���
        LDR      R2,[R0, #+0]
        ORRS     R2,R2,#0x1
        STR      R2,[R0, #+0]
//  150     
//  151     return (RX_Data);
        MOVS     R0,R1
        POP      {R4,PC}          ;; return
//  152 
//  153 }
//  154 
//  155 //=========================================================================
//  156 //�������ƣ�hw_spi_re
//  157 //����������spiNo��SPIͨ���š�
//  158 //          data[]����Ҫ���յ����ݡ�
//  159 //�������أ�0���ɹ� 1��ʧ��
//  160 //���ܸ�Ҫ��SPI�������ݡ�
//  161 //=========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  162 uint8 hw_spi_re(uint8 spiNo,uint8 data[])
//  163 {
hw_spi_re:
        PUSH     {R4,LR}
        MOVS     R4,R1
//  164       SPI_MemMapPtr BaseAdd = hw_spi_get_base_address(spiNo);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       hw_spi_get_base_address
//  165 
//  166       if(SPI_SR_REG(BaseAdd) & SPI_SR_RFDF_MASK)
        LDR      R1,[R0, #+44]
        LSLS     R1,R1,#+14
        BPL.N    ??hw_spi_re_0
//  167       {
//  168     	      data[0] = (uint8)SPI_POPR_REG(BaseAdd);                
        LDR      R1,[R0, #+56]
        STRB     R1,[R4, #+0]
//  169               SPI_SR_REG(BaseAdd) |= SPI_SR_RFDF_MASK;
        LDR      R1,[R0, #+44]
        ORRS     R1,R1,#0x20000
        STR      R1,[R0, #+44]
//  170               return 1;
        MOVS     R0,#+1
        B.N      ??hw_spi_re_1
//  171       }
//  172         SPI_SR_REG(BaseAdd) = (SPI_SR_EOQF_MASK
//  173                               | SPI_SR_TFUF_MASK
//  174                               | SPI_SR_TFFF_MASK
//  175                               | SPI_SR_RFOF_MASK
//  176                               | SPI_SR_RFDF_MASK);
??hw_spi_re_0:
        LDR.N    R1,??DataTable5_12  ;; 0x1a0a0000
        STR      R1,[R0, #+44]
//  177 
//  178       SPI_MCR_REG(BaseAdd) |= SPI_MCR_CLR_TXF_MASK      //Clear the Tx FIFO counter.
//  179                 | SPI_MCR_CLR_RXF_MASK;                 //Clear the Rx FIFO counter.
        LDR      R1,[R0, #+0]
        ORRS     R1,R1,#0xC00
        STR      R1,[R0, #+0]
//  180       return 0;
        MOVS     R0,#+0
??hw_spi_re_1:
        POP      {R4,PC}          ;; return
//  181 }
//  182 
//  183 /*
//  184 //=========================================================================
//  185 //�������ƣ�hw_spi_enable_re_int
//  186 //����˵����spiNo: SPI��
//  187 //�������أ� ��
//  188 //���ܸ�Ҫ����SPI�����ж�
//  189 //=========================================================================
//  190 void hw_spi_enable_re_int(uint8 spiNo)
//  191 {
//  192     SPI_MemMapPtr BaseAdd = hw_spi_get_base_address(spiNo);
//  193     BSET(SPI_RSER_RFDF_RE_SHIFT, SPI_RSER_REG(BaseAdd));//����SPI�����ж�
//  194     enable_irq(spiNo + SPI0IRQ);			 //���������ŵ�IRQ�ж�
//  195 }
//  196 
//  197 //=========================================================================
//  198 //�������ƣ�hw_spi_disable_re_int
//  199 //����˵����spiNo: SPI��
//  200 //�������أ� ��
//  201 //���ܸ�Ҫ����SPI�����ж�
//  202 //=========================================================================
//  203 void hw_spi_disable_re_int(uint8 spiNo)
//  204 {
//  205     SPI_MemMapPtr BaseAdd = hw_spi_get_base_address(spiNo);
//  206     BCLR(SPI_RSER_RFDF_RE_SHIFT, SPI_RSER_REG(BaseAdd));//�ر�SPI�����ж�
//  207     disable_irq(spiNo + SPI0IRQ);			 //���������ŵ�IRQ�ж�
//  208 }
//  209 */
//  210 
//  211 
//  212 
//  213 
//  214 //=================�ڲ�����ʵ��=============================================
//  215 //=========================================================================
//  216 //�������ƣ�hw_spi_get_base_address
//  217 //����������spiNo��SPIͨ����
//  218 //�������أ���
//  219 //���ܸ�Ҫ����SPIͨ����ת���ɶ�Ӧ��ָ�롣
//  220 //=========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  221 SPI_MemMapPtr hw_spi_get_base_address(uint8 spiNo)
//  222 {
//  223     switch(spiNo)
hw_spi_get_base_address:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??hw_spi_get_base_address_0
        CMP      R0,#+2
        BEQ.N    ??hw_spi_get_base_address_1
        BCC.N    ??hw_spi_get_base_address_2
        B.N      ??hw_spi_get_base_address_3
//  224     {
//  225     case 0:
//  226       return SPI0_BASE_PTR;
??hw_spi_get_base_address_0:
        LDR.N    R0,??DataTable5_13  ;; 0x4002c000
        B.N      ??hw_spi_get_base_address_4
//  227     case 1:
//  228       return SPI1_BASE_PTR;
??hw_spi_get_base_address_2:
        LDR.N    R0,??DataTable5_14  ;; 0x4002d000
        B.N      ??hw_spi_get_base_address_4
//  229     case 2:
//  230       return SPI2_BASE_PTR;
??hw_spi_get_base_address_1:
        LDR.N    R0,??DataTable5_15  ;; 0x400ac000
        B.N      ??hw_spi_get_base_address_4
//  231     default:
//  232       return 0;
??hw_spi_get_base_address_3:
        MOVS     R0,#+0
??hw_spi_get_base_address_4:
        BX       LR               ;; return
//  233     }
//  234 }
//  235 //void lqspiinit(void)

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  236 void SPI_Configuration(void)
//  237 {
SPI_Configuration:
        PUSH     {R7,LR}
//  238   ///�Ȱ�ʱ�����Ŵ�
//  239         SIM_SCGC6 |= SIM_SCGC6_DSPI0_MASK;
        LDR.N    R0,??DataTable5  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable5  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  240      //   PORTA_PCR14 = 0 | PORT_PCR_MUX(0x2) | PORT_PCR_DSE_MASK;//PCS0
//  241         gpio_init(PTA_BASE_PTR,13,1,0);
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.N    R0,??DataTable5_16  ;; 0x400ff000
        BL       gpio_init
//  242         PORTA_PCR15 = 0 | PORT_PCR_MUX(0x2) | PORT_PCR_DSE_MASK;//SCK
        LDR.N    R0,??DataTable5_2  ;; 0x4004903c
        MOV      R1,#+576
        STR      R1,[R0, #+0]
//  243         PORTA_PCR16 = 0 | PORT_PCR_MUX(0x2) | PORT_PCR_DSE_MASK;//SOUT
        LDR.N    R0,??DataTable5_3  ;; 0x40049040
        MOV      R1,#+576
        STR      R1,[R0, #+0]
//  244         PORTA_PCR17 = 0 | PORT_PCR_MUX(0x2);                    //SIN
        LDR.N    R0,??DataTable5_4  ;; 0x40049044
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//  245         SPI0_MCR|=SPI_MCR_MSTR_MASK;                            //����ģʽ
        LDR.N    R0,??DataTable5_13  ;; 0x4002c000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable5_13  ;; 0x4002c000
        STR      R0,[R1, #+0]
//  246 	    SPI0_MCR|=SPI_MCR_PCSIS(1);                             //PCS0�͵�ƽ��Ч
        LDR.N    R0,??DataTable5_13  ;; 0x4002c000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable5_13  ;; 0x4002c000
        STR      R0,[R1, #+0]
//  247         SPI0_MCR&=~SPI_MCR_MDIS_MASK;                           //ʹ��DSPIʱ��
        LDR.N    R0,??DataTable5_13  ;; 0x4002c000
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4000
        LDR.N    R1,??DataTable5_13  ;; 0x4002c000
        STR      R0,[R1, #+0]
//  248 	    SPI0_MCR&=~SPI_MCR_HALT_MASK;                           //����SPIģ��
        LDR.N    R0,??DataTable5_13  ;; 0x4002c000
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable5_13  ;; 0x4002c000
        STR      R0,[R1, #+0]
//  249         SPI0_CTAR0|=SPI_CTAR_DBR_MASK;                          //���������� SCK Duty Cycle
        LDR.N    R0,??DataTable5_17  ;; 0x4002c00c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable5_17  ;; 0x4002c00c
        STR      R0,[R1, #+0]
//  250 	    SPI0_CTAR0=SPI_CTAR_FMSZ(7);                            //֡��СΪ8bit
        LDR.N    R0,??DataTable5_17  ;; 0x4002c00c
        MOVS     R1,#+939524096
        STR      R1,[R0, #+0]
//  251 	    SPI0_CTAR0|=SPI_CTAR_PBR(0);//Ԥ��Ƶ30M//
        LDR.N    R0,??DataTable5_17  ;; 0x4002c00c
        LDR.N    R1,??DataTable5_17  ;; 0x4002c00c
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  252                                     //00 Baud Rate Prescaler value is 2
//  253                                     //01 Baud Rate Prescaler value is 3.
//  254                                     //10 Baud Rate Prescaler value is 5.
//  255                                     //11 Baud Rate Prescaler value is 7.
//  256 	    SPI0_CTAR0|=SPI_CTAR_BR(0x0100); //���շ�Ƶ180/4=45MHz
        LDR.N    R0,??DataTable5_17  ;; 0x4002c00c
        LDR.N    R1,??DataTable5_17  ;; 0x4002c00c
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  257                                     //0000 2
//  258                                     //0001 4
//  259                                     //0010 6
//  260                                     //0011 8
//  261                                     //0100 16
//  262                                     //0101 32
//  263                                     //0110 64
//  264                                     //0111 128
//  265                                     //SCK baud rate = (fSYS/PBR) x [(1+DBR)/BR]    
//  266   
//  267 }
        POP      {R0,PC}          ;; return
//  268 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  269 void SPI_SetSpeed(unsigned char SpeedSet)
//  270 {
//  271     if(SpeedSet == SPI_SPEED_LOW)
SPI_SetSpeed:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SPI_SetSpeed_0
//  272     {
//  273         SPI0_CTAR0|=SPI_CTAR_DBR_MASK;                          //���������� SCK Duty Cycle
        LDR.N    R0,??DataTable5_17  ;; 0x4002c00c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable5_17  ;; 0x4002c00c
        STR      R0,[R1, #+0]
//  274 	    SPI0_CTAR0=SPI_CTAR_FMSZ(7);                            //֡��СΪ8bit
        LDR.N    R0,??DataTable5_17  ;; 0x4002c00c
        MOVS     R1,#+939524096
        STR      R1,[R0, #+0]
//  275 	    SPI0_CTAR0|=SPI_CTAR_PBR(0);//Ԥ��Ƶ30M//
        LDR.N    R0,??DataTable5_17  ;; 0x4002c00c
        LDR.N    R1,??DataTable5_17  ;; 0x4002c00c
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  276                                     //00 Baud Rate Prescaler value is 2
//  277                                     //01 Baud Rate Prescaler value is 3.
//  278                                     //10 Baud Rate Prescaler value is 5.
//  279                                     //11 Baud Rate Prescaler value is 7.
//  280 	    SPI0_CTAR0|=SPI_CTAR_BR(0x0100); //���շ�Ƶ180/4=45MHz
        LDR.N    R0,??DataTable5_17  ;; 0x4002c00c
        LDR.N    R1,??DataTable5_17  ;; 0x4002c00c
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
        B.N      ??SPI_SetSpeed_1
//  281                                     //0000 2
//  282                                     //0001 4
//  283                                     //0010 6
//  284                                     //0011 8
//  285                                     //0100 16
//  286                                     //0101 32
//  287                                     //0110 64
//  288                                     //0111 128
//  289                                     //SCK baud rate = (fSYS/PBR) x [(1+DBR)/BR]     
//  290     }
//  291     else
//  292     {
//  293         SPI0_CTAR0|=SPI_CTAR_DBR_MASK;                          //���������� SCK Duty Cycle
??SPI_SetSpeed_0:
        LDR.N    R0,??DataTable5_17  ;; 0x4002c00c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable5_17  ;; 0x4002c00c
        STR      R0,[R1, #+0]
//  294 	    SPI0_CTAR0=SPI_CTAR_FMSZ(7);                            //֡��СΪ8bit
        LDR.N    R0,??DataTable5_17  ;; 0x4002c00c
        MOVS     R1,#+939524096
        STR      R1,[R0, #+0]
//  295 	    SPI0_CTAR0|=SPI_CTAR_PBR(0);//Ԥ��Ƶ30M//
        LDR.N    R0,??DataTable5_17  ;; 0x4002c00c
        LDR.N    R1,??DataTable5_17  ;; 0x4002c00c
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  296                                     //00 Baud Rate Prescaler value is 2
//  297                                     //01 Baud Rate Prescaler value is 3.
//  298                                     //10 Baud Rate Prescaler value is 5.
//  299                                     //11 Baud Rate Prescaler value is 7.
//  300       SPI0_CTAR0|=SPI_CTAR_BR(0);
        LDR.N    R0,??DataTable5_17  ;; 0x4002c00c
        LDR.N    R1,??DataTable5_17  ;; 0x4002c00c
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  301     }
//  302 }
??SPI_SetSpeed_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x40049038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x4004903c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x40049040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x40049044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x4004d004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x4004d008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     0x4004d00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     0x4004d010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     0x3f0c01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     0xc60c0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     0x1a0a0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     0x4002c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     0x4002d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_15:
        DC32     0x400ac000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_16:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_17:
        DC32     0x4002c00c

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  303 
//  304 
//  305 #if 0
//  306 void lqwrite(unsigned char cmd)
//  307 { 
//  308     SPI0_PUSHR=cmd;
//  309 	while((SPI0_SR&SPI_SR_TCF_MASK)==0);//�ȴ��������
//  310 	SPI0_SR|=SPI_SR_TCF_MASK;//�����־	
//  311 
//  312 }
//  313 #endif
// 
// 632 bytes in section .text
// 
// 632 bytes of CODE memory
//
//Errors: none
//Warnings: none
