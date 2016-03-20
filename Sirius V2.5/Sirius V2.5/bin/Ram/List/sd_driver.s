///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    13/Nov/2014  01:13:37 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  D:\IAR_TEST\Sirius\Sirius V2.1\src\Sources\C\SD_C\sd_dr /
//                    iver.c                                                  /
//    Command line =  "D:\IAR_TEST\Sirius\Sirius                              /
//                    V2.1\src\Sources\C\SD_C\sd_driver.c" -D IAR -D          /
//                    TWR_K60N512 -lCN "D:\IAR_TEST\Sirius\Sirius             /
//                    V2.1\bin\Ram\List\" -lB "D:\IAR_TEST\Sirius\Sirius      /
//                    V2.1\bin\Ram\List\" -o "D:\IAR_TEST\Sirius\Sirius       /
//                    V2.1\bin\Ram\Obj\" --no_cse --no_unroll --no_inline     /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
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
//    List file    =  D:\IAR_TEST\Sirius\Sirius V2.1\bin\Ram\List\sd_driver.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME sd_driver

        #define SHT_PROGBITS 0x1

        EXTERN SPI_ReadWriteByte
        EXTERN SPI_SetSpeed
        EXTERN gpio_ctrl

        PUBLIC SD_GetCID
        PUBLIC SD_GetCSD
        PUBLIC SD_GetCapacity
        PUBLIC SD_Init
        PUBLIC SD_ReadMultiBlock
        PUBLIC SD_ReadSingleBlock
        PUBLIC SD_ReceiveData
        PUBLIC SD_SendCommand
        PUBLIC SD_SendCommand_NoDeassert
        PUBLIC SD_Type
        PUBLIC SD_WaitReady
        PUBLIC SD_WriteMultiBlock
        PUBLIC SD_WriteSingleBlock

// D:\IAR_TEST\Sirius\Sirius V2.1\src\Sources\C\SD_C\sd_driver.c
//    1 /*******************************************************************************
//    2 *  ���ļ�ΪSPI����SD���ĵײ������ļ�
//    3 *  ����SPIģ�鼰���IO�ĳ�ʼ����SPI��дSD����дָ������ݵȣ�
//    4 *******************************************************************************/
//    5 
//    6 //#include <hidef.h>      /* common defines and macros */
//    7 #include <MK60N512VMD100.h>     /* derivative information */
//    8 #include "sd_driver.h"
//    9 #include "spi.h"
//   10 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   11 unsigned char SD_Type=0 ;
SD_Type:
        DS8 1
//   12 
//   13 #define STA_NOINIT		0x01	/* Drive not initialized */
//   14 #define STA_NODISK		0x02	/* No medium in the drive */
//   15 #define STA_PROTECT		0x04	/* Write protected */
//   16 
//   17 #if 0
//   18 void SPI_Configuration(void)
//   19 {
//   20     MODRR_MODRR4=1; //ʹ��m��
//   21     DDRM = 0x31; //SCK0=1,MOSI=1,pm0Ϊcs 0b00110001
//   22     SPI0CR1 = 0x5e; //CPOL=1,CPHA=1 0b01011110
//   23     SPI0CR2 = 0x10; //0b00010000
//   24     SPI0BR  = 0x07;  // 80M / 256 = 312.5k
//   25 }
//   26    
//   27 
//   28 /*******************************************************************************
//   29 * Function Name  : 	SPI_SetSpeed
//   30 * Description    :		SPI�����ٶ�Ϊ����
//   31 * Input          : 		unsigned char SpeedSet
//   32 *                  			����ٶ���������0�������ģʽ����0�����ģʽ
//   33 *                  			SPI_SPEED_HIGH   1
//   34 *                  			SPI_SPEED_LOW    0
//   35 * Output         : 		None
//   36 * Return         : 		None
//   37 *******************************************************************************/
//   38 
//   39 void SPI_SetSpeed(unsigned char SpeedSet)
//   40 {
//   41     //����ٶ���������0�������ģʽ����0�����ģʽ
//   42     if(SpeedSet == SPI_SPEED_LOW)
//   43     {
//   44      // set low speed
//   45         SPI0CR1 = 0x5e; //CPOL=1,CPHA=1 0b01011110
//   46         SPI0CR2 = 0x10; //0b00010000
//   47         SPI0BR  = 0x07;  // 40M / 256 = 156.25k
//   48     }
//   49     else
//   50     {
//   51 	    SPI0BR  = 0x02;  // 40M / 8 = 5M       ���Ը��ߵ�~~
//   52     }
//   53     return ;
//   54 }
//   55 
//   56 /*******************************************************************************
//   57 * Function Name  : 	SPI_ReadWriteByte
//   58 * Description    : 		SPI��дһ���ֽڣ�������ɺ󷵻ر���ͨѶ��ȡ�����ݣ�
//   59 * Input          : 		unsigned char TxData �����͵���
//   60 * Output         : 		None
//   61 * Return         : 		unsigned char RxData �յ�����
//   62 *******************************************************************************/
//   63 unsigned char SPI_ReadWriteByte(unsigned char TxData)
//   64 {
//   65     unsigned char spi_tmp;
//   66   
//   67     while (!SPI0SR_SPTEF);
//   68     SPI0DRL = TxData;
//   69     while (!SPI0SR_SPIF);
//   70     spi_tmp = SPI0DRL;
//   71     return spi_tmp;
//   72 }
//   73 #endif
//   74 /*******************************************************************************
//   75 * Function Name  	: SD_WaitReady
//   76 * Description    	: �ȴ�SD��Ready
//   77 * Input          	: None
//   78 * Output         	: None
//   79 * Return         	: unsigned char
//   80 *               		:0 �ɹ�
//   81 *           			:other ʧ��
//   82 *******************************************************************************/
//   83 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   84 unsigned char SD_WaitReady(void)
//   85 {
SD_WaitReady:
        PUSH     {R4,LR}
//   86     unsigned char r1 ;
//   87     unsigned char retry ;
//   88     retry=0 ;
        MOVS     R4,#+0
//   89     do 
//   90     {
//   91         r1=SPI_ReadWriteByte(0,0xFF);
??SD_WaitReady_0:
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//   92         if(retry++==200)//������쳣������ѭ����
        MOVS     R1,R4
        ADDS     R4,R1,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+200
        BNE.N    ??SD_WaitReady_1
//   93         {
//   94             return 1 ;
        MOVS     R0,#+1
        B.N      ??SD_WaitReady_2
//   95         }
//   96     }
//   97     while(r1!=0xFF);
??SD_WaitReady_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+255
        BNE.N    ??SD_WaitReady_0
//   98     
//   99     return 0 ;
        MOVS     R0,#+0
??SD_WaitReady_2:
        POP      {R4,PC}          ;; return
//  100 }
//  101 
//  102 
//  103 /*******************************************************************************
//  104 * Function Name  : 	SD_SendCommand
//  105 * Description    : 		��SD������һ������
//  106 * Input          : 		unsigned char cmd   ����
//  107 *                  			unsigned long arg  �������
//  108 *                  			unsigned char crc   crcУ��ֵ
//  109 * Output         :		None
//  110 * Return         : 		unsigned char r1 SD�����ص���Ӧ
//  111 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  112 unsigned char SD_SendCommand(unsigned char cmd,unsigned long arg,unsigned char crc)
//  113 {
SD_SendCommand:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  114     unsigned char r1 ;
//  115     unsigned char Retry=0 ;
        MOVS     R7,#+0
//  116     
//  117     SPI_ReadWriteByte(0,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  118     SD_CS_ENABLE();//Ƭѡ���õͣ�ѡ��SD��
        MOVS     R2,#+0
        MOVS     R1,#+13
        LDR.W    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  119     SPI_ReadWriteByte(0,cmd|0x40);//����
        ORRS     R1,R4,#0x40
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  120     //�ֱ�д������
//  121     SPI_ReadWriteByte(0,arg>>24);	//����[31..24]
        LSRS     R1,R5,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  122     SPI_ReadWriteByte(0,arg>>16);	//����[23..16]
        LSRS     R1,R5,#+16
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  123     SPI_ReadWriteByte(0,arg>>8);	//����[15..8]
        LSRS     R1,R5,#+8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  124     SPI_ReadWriteByte(0,arg);		//����[7..0]
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  125     SPI_ReadWriteByte(0,crc);
        MOVS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  126     
//  127     //�ȴ���Ӧ����ʱ�˳�
//  128     while((r1 = SPI_ReadWriteByte(0,0xFF)) == 0xFF)
??SD_SendCommand_0:
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        MOVS     R4,R0
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+255
        BNE.N    ??SD_SendCommand_1
//  129     {
//  130         Retry++;
        ADDS     R7,R7,#+1
//  131         if(Retry>200)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+201
        BCC.N    ??SD_SendCommand_0
//  132         {
//  133         	break ;
//  134         }
//  135     }   
//  136     SD_CS_DISABLE(); //�ر�Ƭѡ
??SD_SendCommand_1:
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.W    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  137     
//  138     SPI_ReadWriteByte(0,0xFF);//�������϶�������8��ʱ�ӣ�
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  139     						//��SD�����ʣ�µĹ���
//  140     
//  141     //����״ֵ̬
//  142     return r1 ;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
//  143 }
//  144 
//  145 
//  146 /*******************************************************************************
//  147 * Function Name  : 	SD_SendCommand_NoDeassert
//  148 * Description    : 		��SD������һ������
//  149 					(����ʱ��ʧ��Ƭѡ�����к������ݴ�����
//  150 * Input          : 		unsigned char cmd   ����
//  151 *                  			unsigned long arg  �������
//  152 *                  			unsigned char crc   crcУ��ֵ
//  153 * Output         : 		None
//  154 * Return         : 		unsigned char r1 SD�����ص���Ӧ
//  155 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  156 unsigned char SD_SendCommand_NoDeassert(unsigned char cmd,
//  157 													unsigned long arg,
//  158 													unsigned char crc)
//  159 {
SD_SendCommand_NoDeassert:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  160     unsigned char r1 ;
//  161     unsigned char Retry=0 ;
        MOVS     R7,#+0
//  162     
//  163     SPI_ReadWriteByte(0,0xff);//�ȸ���8��ʱ��
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  164     SD_CS_ENABLE();//Ƭѡ���õͣ�ѡ��SD��
        MOVS     R2,#+0
        MOVS     R1,#+13
        LDR.W    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  165     
//  166     
//  167     SPI_ReadWriteByte(0,cmd|0x40);//����
        ORRS     R1,R4,#0x40
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  168     //�ֱ�д������
//  169     SPI_ReadWriteByte(0,arg>>24);
        LSRS     R1,R5,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  170     SPI_ReadWriteByte(0,arg>>16);
        LSRS     R1,R5,#+16
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  171     SPI_ReadWriteByte(0,arg>>8);
        LSRS     R1,R5,#+8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  172     SPI_ReadWriteByte(0,arg);
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  173     SPI_ReadWriteByte(0,crc);
        MOVS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  174     
//  175     //�ȴ���Ӧ����ʱ�˳�
//  176     while((r1 = SPI_ReadWriteByte(0,0xFF)) == 0xFF)
??SD_SendCommand_NoDeassert_0:
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+255
        BNE.N    ??SD_SendCommand_NoDeassert_1
//  177     {
//  178         Retry++;
        ADDS     R7,R7,#+1
//  179         if(Retry>200)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+201
        BCC.N    ??SD_SendCommand_NoDeassert_0
//  180         {
//  181             break ;
//  182         }
//  183     }
//  184     //������Ӧֵ
//  185     return r1 ;
??SD_SendCommand_NoDeassert_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
//  186 }
//  187 
//  188 /*******************************************************************************
//  189 * Function Name  : 	SD_Init
//  190 * Description    : 		��ʼ��SD��
//  191 * Input          : 		None
//  192 * Output         : 		None
//  193 * Return         : 		unsigned char
//  194 *                  			0��NO_ERR
//  195 *                  			1��TIME_OUT
//  196 *                  			99��NO_CARD
//  197 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  198 unsigned char SD_Init(void)
//  199 {
SD_Init:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
//  200 
//  201     unsigned int i ;// ����ѭ������
//  202     unsigned char r1 ;// ���SD���ķ���ֵ
//  203     unsigned int retry ;// �������г�ʱ����
//  204     unsigned char buff[6];
//  205     
//  206 //	put_s("SDinit...");
//  207 
//  208     for(i=0;i<0xf00;i++);// ����ʱ���ȴ�SD���ϵ����
        MOVS     R4,#+0
        B.N      ??SD_Init_0
??SD_Init_1:
        ADDS     R4,R4,#+1
??SD_Init_0:
        CMP      R4,#+3840
        BCC.N    ??SD_Init_1
//  209     
//  210     /**�Ȳ���>74�����壬��SD���Լ���ʼ�����*/
//  211     for(i=0;i<10;i++)
        MOVS     R4,#+0
        B.N      ??SD_Init_2
//  212     {
//  213         SPI_ReadWriteByte(0,0xFF);
??SD_Init_3:
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  214     }
        ADDS     R4,R4,#+1
??SD_Init_2:
        CMP      R4,#+10
        BCC.N    ??SD_Init_3
//  215 	
//  216     //-----------------SD����λ��idle��ʼ-----------------
//  217     //ѭ����������CMD0��ֱ��SD������0x01,����IDLE״̬
//  218     //��ʱ��ֱ���˳�
//  219     retry=0 ;
        MOVS     R5,#+0
//  220     do 
//  221     {
//  222         r1=SD_SendCommand(CMD0,0,0x95);//����CMD0����SD������IDLE״̬
??SD_Init_4:
        MOVS     R2,#+149
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       SD_SendCommand
        MOVS     R4,R0
//  223         retry++;
        ADDS     R5,R5,#+1
//  224     }
//  225     while((r1!=0x01)&&(retry<200));
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??SD_Init_5
        CMP      R5,#+200
        BCC.N    ??SD_Init_4
//  226     //����ѭ���󣬼��ԭ�򣺳�ʼ���ɹ���or ���Գ�ʱ��
//  227     if(retry==200)
??SD_Init_5:
        CMP      R5,#+200
        BNE.N    ??SD_Init_6
//  228     {   
//  229 //		put_s("SD Time out!");
//  230         return 1 ;
        MOVS     R0,#+1
        B.N      ??SD_Init_7
//  231         //��ʱ����1
//  232     }
//  233 //	put_s("SdEnterIdle ");
//  234     //-----------------SD����λ��idle����-----------------
//  235     
//  236 
//  237     //��ȡ��Ƭ��SD�汾��Ϣ
//  238     r1=SD_SendCommand_NoDeassert(8,0x1aa,0x87);
??SD_Init_6:
        MOVS     R2,#+135
        MOV      R1,#+426
        MOVS     R0,#+8
        BL       SD_SendCommand_NoDeassert
        MOVS     R4,R0
//  239     
//  240     //�����Ƭ�汾��Ϣ��v1.0�汾�ģ���r1=0x05����������³�ʼ��
//  241     if(r1==0x05)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+5
        BNE.N    ??SD_Init_8
//  242     {
//  243         //���ÿ�����ΪSDV1.0����������⵽ΪMMC�������޸�ΪMMC
//  244 //		put_s("SD V1 ");
//  245         SD_Type=SD_TYPE_V1 ;
        LDR.W    R0,??DataTable7_1
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  246         
//  247         //�����V1.0����CMD8ָ���û�к�������
//  248         //Ƭѡ�øߣ�������������
//  249         SD_CS_DISABLE();
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.W    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  250         //�෢8��CLK����SD������������
//  251         SPI_ReadWriteByte(0,0xFF);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  252         
//  253         //-----------------SD����MMC����ʼ����ʼ-----------------
//  254         
//  255         //������ʼ��ָ��CMD55+ACMD41
//  256         // �����Ӧ��˵����SD�����ҳ�ʼ�����
//  257         // û�л�Ӧ��˵����MMC�������������Ӧ��ʼ��
//  258         retry=0 ;
        MOVS     R5,#+0
//  259         do 
//  260         {
//  261             //�ȷ�CMD55��Ӧ����0x01���������
//  262             r1=SD_SendCommand(CMD55,0,0);
??SD_Init_9:
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+55
        BL       SD_SendCommand
        MOVS     R4,R0
//  263             if(r1!=0x01)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??SD_Init_10
//  264             {
//  265                 return r1 ;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_Init_7
//  266             }
//  267             //�õ���ȷ��Ӧ�󣬷�ACMD41��Ӧ�õ�����ֵ0x00����������400��
//  268             r1=SD_SendCommand(ACMD41,0,0);
??SD_Init_10:
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+41
        BL       SD_SendCommand
        MOVS     R4,R0
//  269             retry++;
        ADDS     R5,R5,#+1
//  270         }
//  271         while((r1!=0x00)&&(retry<400));
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SD_Init_11
        MOV      R0,#+400
        CMP      R5,R0
        BCC.N    ??SD_Init_9
//  272         // �ж��ǳ�ʱ���ǵõ���ȷ��Ӧ
//  273         // ���л�Ӧ����SD����û�л�Ӧ����MMC��
//  274         
//  275         //----------MMC�������ʼ��������ʼ------------
//  276         if(retry==400)
??SD_Init_11:
        MOV      R0,#+400
        CMP      R5,R0
        BNE.N    ??SD_Init_12
//  277         {
//  278             retry=0 ;
        MOVS     R5,#+0
//  279             //����MMC����ʼ�����û�в��ԣ�
//  280             do 
//  281             {
//  282                 r1=SD_SendCommand(1,0,0);
??SD_Init_13:
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       SD_SendCommand
        MOVS     R4,R0
//  283                 retry++;
        ADDS     R5,R5,#+1
//  284             }
//  285             while((r1!=0x00)&&(retry<400));
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SD_Init_14
        MOV      R0,#+400
        CMP      R5,R0
        BCC.N    ??SD_Init_13
//  286             if(retry==400)
??SD_Init_14:
        MOV      R0,#+400
        CMP      R5,R0
        BNE.N    ??SD_Init_15
//  287             {
//  288                 return 1 ;
        MOVS     R0,#+1
        B.N      ??SD_Init_7
//  289                 //MMC����ʼ����ʱ
//  290             }
//  291             //д�뿨����
//  292             SD_Type=SD_TYPE_MMC ;
??SD_Init_15:
        LDR.W    R0,??DataTable7_1
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  293         }
//  294         //----------MMC�������ʼ����������------------
//  295         
//  296         //����SPIΪ����ģʽ
//  297         SPI_SetSpeed(1);
??SD_Init_12:
        MOVS     R0,#+1
        BL       SPI_SetSpeed
//  298         SPI_ReadWriteByte(0,0xFF);    
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  299         //��ֹCRCУ��
//  300         /*
//  301         		r1 = SD_SendCommand(CMD59, 0, 0x01);
//  302                 if(r1 != 0x00)
//  303                 {
//  304                     return r1;  //������󣬷���r1
//  305                 }
//  306                 */
//  307         //����Sector Size
//  308         r1=SD_SendCommand(CMD16,512,0xff);
        MOVS     R2,#+255
        MOV      R1,#+512
        MOVS     R0,#+16
        BL       SD_SendCommand
        MOVS     R4,R0
//  309         if(r1!=0x00)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.W    ??SD_Init_16
//  310         {
//  311             return r1 ;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_Init_7
//  312             //������󣬷���r1
//  313         }
//  314         //-----------------SD����MMC����ʼ������-----------------
//  315         
//  316     }
//  317     //SD��ΪV1.0�汾�ĳ�ʼ������
//  318     
//  319     
//  320     //������V2.0���ĳ�ʼ��
//  321     //������Ҫ��ȡOCR���ݣ��ж���SD2.0����SD2.0HC��
//  322     else if(r1==0x01)
??SD_Init_8:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.W    ??SD_Init_16
//  323     {
//  324 //		put_s("SD V2 ");
//  325         //V2.0�Ŀ���CMD8�����ᴫ��4�ֽڵ����ݣ�Ҫ�����ٽ���������
//  326         buff[0]=SPI_ReadWriteByte(0,0xFF); //should be 0x00      
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        STRB     R0,[SP, #+0]
//  327         buff[1]=SPI_ReadWriteByte(0,0xFF);//should be 0x00 
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        STRB     R0,[SP, #+1]
//  328         buff[2]=SPI_ReadWriteByte(0,0xFF); //should be 0x01
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        STRB     R0,[SP, #+2]
//  329         buff[3]=SPI_ReadWriteByte(0,0xFF);//should be 0xAA
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        STRB     R0,[SP, #+3]
//  330         
//  331         SD_CS_DISABLE();
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.W    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  332         SPI_ReadWriteByte(0,0xFF);//the next 8 clocks
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  333         
//  334         //�жϸÿ��Ƿ�֧��2.7V-3.6V�ĵ�ѹ��Χ
//  335         if(buff[2]==0x01&&buff[3]==0xAA)
        LDRB     R0,[SP, #+2]
        CMP      R0,#+1
        BNE.N    ??SD_Init_16
        LDRB     R0,[SP, #+3]
        CMP      R0,#+170
        BNE.N    ??SD_Init_16
//  336         {
//  337             //֧�ֵ�ѹ��Χ�����Բ���
//  338             retry=0 ;
        MOVS     R5,#+0
//  339             //������ʼ��ָ��CMD55+ACMD41
//  340             do 
//  341             {
//  342                 r1=SD_SendCommand(CMD55,0,0);
??SD_Init_17:
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+55
        BL       SD_SendCommand
        MOVS     R4,R0
//  343                 if(r1!=0x01)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??SD_Init_18
//  344                 {
//  345                     return r1 ;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_Init_7
//  346                 }
//  347                 r1=SD_SendCommand(ACMD41,0x40000000,0);
??SD_Init_18:
        MOVS     R2,#+0
        MOVS     R1,#+1073741824
        MOVS     R0,#+41
        BL       SD_SendCommand
        MOVS     R4,R0
//  348                 if(retry>200)
        CMP      R5,#+201
        BCC.N    ??SD_Init_19
//  349                 {
//  350                     return r1 ;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_Init_7
//  351                     //��ʱ�򷵻�r1״̬
//  352                 }
//  353             }
//  354             while(r1!=0);
??SD_Init_19:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??SD_Init_17
//  355             
//  356             //��ʼ��ָ�����ɣ���������ȡOCR��Ϣ
//  357             
//  358             //-----------����SD2.0���汾��ʼ-----------
//  359             r1=SD_SendCommand_NoDeassert(CMD58,0,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+58
        BL       SD_SendCommand_NoDeassert
        MOVS     R4,R0
//  360             if(r1!=0x00)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SD_Init_20
//  361             {
//  362                 return r1 ;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_Init_7
//  363                 //�������û�з�����ȷӦ��ֱ���˳�������Ӧ��
//  364             }
//  365             //��OCRָ����󣬽�������4�ֽڵ�OCR��Ϣ
//  366             buff[0]=SPI_ReadWriteByte(0,0xFF);
??SD_Init_20:
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        STRB     R0,[SP, #+0]
//  367             buff[1]=SPI_ReadWriteByte(0,0xFF);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        STRB     R0,[SP, #+1]
//  368             buff[2]=SPI_ReadWriteByte(0,0xFF);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        STRB     R0,[SP, #+2]
//  369             buff[3]=SPI_ReadWriteByte(0,0xFF);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        STRB     R0,[SP, #+3]
//  370             
//  371             //OCR������ɣ�Ƭѡ�ø�
//  372             SD_CS_DISABLE();
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.W    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  373             SPI_ReadWriteByte(0,0xFF);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  374             
//  375             //�����յ���OCR�е�bit30λ��CCS����ȷ����ΪSD2.0����SDHC
//  376             //���CCS=1��SDHC   CCS=0��SD2.0
//  377             //���CCS
//  378             if(buff[0]&0x40)
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??SD_Init_21
//  379             {
//  380                 SD_Type=SD_TYPE_V2HC ;
        LDR.W    R0,??DataTable7_1
        MOVS     R1,#+4
        STRB     R1,[R0, #+0]
        B.N      ??SD_Init_22
//  381 //				put_s("SDHC ");
//  382 
//  383             }
//  384             else 
//  385             {
//  386                 SD_Type=SD_TYPE_V2 ;
??SD_Init_21:
        LDR.W    R0,??DataTable7_1
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
//  387             }
//  388             //-----------����SD2.0���汾����-----------
//  389             
//  390             
//  391             //����SPIΪ����ģʽ
//  392             SPI_SetSpeed(1);
??SD_Init_22:
        MOVS     R0,#+1
        BL       SPI_SetSpeed
//  393         }
//  394         
//  395     }
//  396     return r1 ;
??SD_Init_16:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SD_Init_7:
        POP      {R1-R5,PC}       ;; return
//  397 }
//  398 
//  399 
//  400 
//  401 /*******************************************************************************
//  402 * Function Name  : SD_ReceiveData
//  403 * Description    : ��SD���ж���ָ�����ȵ����ݣ������ڸ���λ��
//  404 * Input          : unsigned char *data(��Ŷ������ݵ��ڴ�>len)
//  405 *                  unsigned int len(���ݳ��ȣ�
//  406 *                  unsigned char release(������ɺ��Ƿ��ͷ�����CS�ø� 0�����ͷ� 1���ͷţ�
//  407 * Output         : None
//  408 * Return         : unsigned char
//  409 *                  0��NO_ERR
//  410 *                  other��������Ϣ
//  411 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  412 unsigned char SD_ReceiveData(unsigned char*data,unsigned int len,unsigned char release)
//  413 {
SD_ReceiveData:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  414     unsigned int retry ;
//  415     unsigned char r1 ;
//  416     
//  417     // ����һ�δ���
//  418     SD_CS_ENABLE();
        MOVS     R2,#+0
        MOVS     R1,#+13
        LDR.W    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  419     //�ȴ�SD������������ʼ����0xFE
//  420     retry=0 ;
        MOVS     R7,#+0
//  421     do 
//  422     {
//  423         r1=SPI_ReadWriteByte(0,0xFF);
??SD_ReceiveData_0:
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  424         //retry�εȴ���û��Ӧ���˳�����
//  425         if(retry++>0xFFFE)
        MOVS     R1,R7
        ADDS     R7,R1,#+1
        MOVW     R2,#+65535
        CMP      R1,R2
        BCC.N    ??SD_ReceiveData_1
//  426         {
//  427 //			put_s("SD tout");
//  428 
//  429             SD_CS_DISABLE();
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.W    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  430             return 1 ;
        MOVS     R0,#+1
        B.N      ??SD_ReceiveData_2
//  431         }
//  432     }
//  433     while(r1!=0xFE);
??SD_ReceiveData_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+254
        BNE.N    ??SD_ReceiveData_0
//  434     //��ʼ��������
//  435     while(len--)
??SD_ReceiveData_3:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        CMP      R0,#+0
        BEQ.N    ??SD_ReceiveData_4
//  436     {
//  437         *data=SPI_ReadWriteByte(0,0xFF);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        STRB     R0,[R4, #+0]
//  438         data++;
        ADDS     R4,R4,#+1
        B.N      ??SD_ReceiveData_3
//  439     }
//  440     //������2��αCRC��dummy CRC��
//  441     SPI_ReadWriteByte(0,0xFF);
??SD_ReceiveData_4:
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  442     SPI_ReadWriteByte(0,0xFF);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  443     //�����ͷ����ߣ���CS�ø�
//  444     if(release==RELEASE)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??SD_ReceiveData_5
//  445     {
//  446         //�������
//  447         SD_CS_DISABLE();
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.W    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  448         SPI_ReadWriteByte(0,0xFF);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  449     }
//  450 
//  451     return 0 ;
??SD_ReceiveData_5:
        MOVS     R0,#+0
??SD_ReceiveData_2:
        POP      {R1,R4-R7,PC}    ;; return
//  452 }
//  453 
//  454 
//  455 /*******************************************************************************
//  456 * Function Name  : SD_GetCID
//  457 * Description    : ��ȡSD����CID��Ϣ��������������Ϣ
//  458 * Input          : unsigned char *cid_data(���CID���ڴ棬����16Byte��
//  459 * Output         : None
//  460 * Return         : unsigned char
//  461 *                  0��NO_ERR
//  462 *                  1��TIME_OUT
//  463 *                  other��������Ϣ
//  464 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  465 unsigned char SD_GetCID(unsigned char*cid_data)
//  466 {
SD_GetCID:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  467     unsigned char r1 ;
//  468     
//  469    
//  470     r1=SD_SendCommand(CMD10,0,0xFF); //��CMD10�����CID
        MOVS     R2,#+255
        MOVS     R1,#+0
        MOVS     R0,#+10
        BL       SD_SendCommand
//  471     if(r1!=0x00)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SD_GetCID_0
//  472     {
//  473         return r1 ;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_GetCID_1
//  474         //û������ȷӦ�����˳�������
//  475     }
//  476     //����16���ֽڵ�����
//  477     SD_ReceiveData(cid_data,16,RELEASE);
??SD_GetCID_0:
        MOVS     R2,#+1
        MOVS     R1,#+16
        MOVS     R0,R4
        BL       SD_ReceiveData
//  478 
//  479     return 0 ;
        MOVS     R0,#+0
??SD_GetCID_1:
        POP      {R4,PC}          ;; return
//  480 }
//  481 
//  482 
//  483 /*******************************************************************************
//  484 * Function Name  : SD_GetCSD
//  485 * Description    : ��ȡSD����CSD��Ϣ�������������ٶ���Ϣ
//  486 * Input          : unsigned char *cid_data(���CID���ڴ棬����16Byte��
//  487 * Output         : None
//  488 * Return         : unsigned char
//  489 *                  0��NO_ERR
//  490 *                  1��TIME_OUT
//  491 *                  other��������Ϣ
//  492 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  493 unsigned char SD_GetCSD(unsigned char *csd_data)
//  494 {
SD_GetCSD:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  495     unsigned char r1 ;
//  496     
//  497    
//  498     r1=SD_SendCommand(CMD9,0,0xFF); //��CMD9�����CSD
        MOVS     R2,#+255
        MOVS     R1,#+0
        MOVS     R0,#+9
        BL       SD_SendCommand
//  499     if(r1!=0x00)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SD_GetCSD_0
//  500     {
//  501         return r1 ;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_GetCSD_1
//  502         //û������ȷӦ�����˳�������
//  503     }
//  504     //����16���ֽڵ�����
//  505     SD_ReceiveData(csd_data,16,RELEASE);
??SD_GetCSD_0:
        MOVS     R2,#+1
        MOVS     R1,#+16
        MOVS     R0,R4
        BL       SD_ReceiveData
//  506     
//  507     return 0 ;
        MOVS     R0,#+0
??SD_GetCSD_1:
        POP      {R4,PC}          ;; return
//  508 }
//  509 
//  510 /*******************************************************************************
//  511 * Function Name  : SD_GetCapacity
//  512 * Description    : ��ȡSD��������
//  513 * Input          : None
//  514 * Output         : None
//  515 * Return         : unsigned long capacity
//  516 *                   0�� ȡ��������
//  517 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  518 unsigned long SD_GetCapacity(void)
//  519 {
SD_GetCapacity:
        PUSH     {LR}
        SUB      SP,SP,#+20
//  520     unsigned char csd[16];
//  521     unsigned long Capacity ;
//  522     unsigned char r1 ;
//  523     unsigned int i ;
//  524     unsigned int temp ;
//  525     
//  526     
//  527     if(SD_GetCSD(csd)!=0)//ȡCSD��Ϣ������ڼ��������0
        ADD      R0,SP,#+0
        BL       SD_GetCSD
        CMP      R0,#+0
        BEQ.N    ??SD_GetCapacity_0
//  528     {
//  529         return 0 ;
        MOVS     R0,#+0
        B.N      ??SD_GetCapacity_1
//  530     }
//  531 
//  532     //���ΪSDHC�����������淽ʽ����
//  533     if((csd[0]&0xC0)==0x40)
??SD_GetCapacity_0:
        LDRB     R0,[SP, #+0]
        ANDS     R0,R0,#0xC0
        CMP      R0,#+64
        BNE.N    ??SD_GetCapacity_2
//  534     {
//  535         Capacity=((((unsigned long)csd[8])<<8)+(unsigned long)csd[9]+1)*(unsigned long)1024 ;
        LDRB     R0,[SP, #+8]
        LSLS     R0,R0,#+8
        LDRB     R1,[SP, #+9]
        UXTAB    R0,R0,R1
        ADDS     R0,R0,#+1
        MOV      R1,#+1024
        MULS     R0,R1,R0
        B.N      ??SD_GetCapacity_3
//  536     }
//  537     else 
//  538     {
//  539         //�������Ϊ���ϰ汾
//  540         ////////////formula of the capacity///////////////
//  541         //
//  542         //  memory capacity = BLOCKNR * BLOCK_LEN
//  543         //
//  544         //	BLOCKNR = (C_SIZE + 1)* MULT
//  545         //
//  546         //           C_SIZE_MULT+2
//  547         //	MULT = 2
//  548         //
//  549         //               READ_BL_LEN
//  550         //	BLOCK_LEN = 2
//  551         /**********************************************/
//  552         //C_SIZE
//  553         i=csd[6]&0x03 ;
??SD_GetCapacity_2:
        LDRB     R0,[SP, #+6]
        ANDS     R1,R0,#0x3
//  554         i<<=8 ;
        LSLS     R1,R1,#+8
//  555         i+=csd[7];
        LDRB     R0,[SP, #+7]
        UXTAB    R1,R1,R0
//  556         i<<=2 ;
        LSLS     R1,R1,#+2
//  557         i+=((csd[8]&0xc0)>>6);
        LDRB     R0,[SP, #+8]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+6
        UXTAB    R1,R1,R0
//  558         
//  559         //C_SIZE_MULT
//  560         r1=csd[9]&0x03 ;
        LDRB     R0,[SP, #+9]
        ANDS     R0,R0,#0x3
//  561         r1<<=1 ;
        LSLS     R0,R0,#+1
//  562         r1+=((csd[10]&0x80)>>7);
        LDRB     R2,[SP, #+10]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R0,R0,R2, LSR #+7
//  563         
//  564         //BLOCKNR
//  565         r1+=2 ;
        ADDS     R0,R0,#+2
//  566         temp=1 ;
        MOVS     R2,#+1
        B.N      ??SD_GetCapacity_4
//  567         while(r1)
//  568         {
//  569             temp*=2 ;
??SD_GetCapacity_5:
        LSLS     R2,R2,#+1
//  570             r1--;
        SUBS     R0,R0,#+1
//  571         }
??SD_GetCapacity_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SD_GetCapacity_5
//  572         Capacity=((unsigned long)(i+1))*((unsigned long)temp);
        ADDS     R0,R1,#+1
        MULS     R0,R2,R0
//  573         
//  574         // READ_BL_LEN
//  575         i=csd[5]&0x0f ;
        LDRB     R1,[SP, #+5]
        ANDS     R1,R1,#0xF
//  576         //BLOCK_LEN
//  577         temp=1 ;
        MOVS     R2,#+1
        B.N      ??SD_GetCapacity_6
//  578         while(i)
//  579         {
//  580             temp*=2 ;
??SD_GetCapacity_7:
        LSLS     R2,R2,#+1
//  581             i--;
        SUBS     R1,R1,#+1
//  582         }
??SD_GetCapacity_6:
        CMP      R1,#+0
        BNE.N    ??SD_GetCapacity_7
//  583         //The final result
//  584         Capacity*=(unsigned long)temp ;
        MULS     R0,R2,R0
//  585         //Capacity /= 512;
//  586     }
//  587     return (unsigned long)Capacity ;
??SD_GetCapacity_3:
??SD_GetCapacity_1:
        ADD      SP,SP,#+20
        POP      {PC}             ;; return
//  588 }
//  589 
//  590 
//  591 /*******************************************************************************
//  592 * Function Name  : SD_ReadSingleBlock
//  593 * Description    : ��SD����һ��block
//  594 * Input          : unsigned long sector ������ַ��sectorֵ���������ַ��
//  595 *                  unsigned char *buffer ���ݴ洢��ַ����С����512byte��
//  596 * Output         : None
//  597 * Return         : unsigned char r1
//  598 *                   0�� �ɹ�
//  599 *                   other��ʧ��
//  600 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  601 unsigned char SD_ReadSingleBlock(unsigned long sector,unsigned char*buffer)
//  602 {
SD_ReadSingleBlock:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  603     unsigned char r1 ;
//  604     
//  605     SPI_SetSpeed(SPI_SPEED_HIGH);//����Ϊ����ģʽ
        MOVS     R0,#+1
        BL       SPI_SetSpeed
//  606     //sector=sector<<9 ;//�������SDHC����sector��ַת��byte��ַ
//  607     if(SD_Type!=SD_TYPE_V2HC)
        LDR.N    R0,??DataTable7_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BEQ.N    ??SD_ReadSingleBlock_0
//  608     {
//  609         sector=sector<<9 ;
        LSLS     R4,R4,#+9
//  610     }
//  611     r1=SD_SendCommand(CMD17,sector,0xFF);//������
??SD_ReadSingleBlock_0:
        MOVS     R2,#+255
        MOVS     R1,R4
        MOVS     R0,#+17
        BL       SD_SendCommand
//  612        
//  613     if(r1!=0x00)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SD_ReadSingleBlock_1
//  614     {
//  615         return r1 ;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_ReadSingleBlock_2
//  616     }
//  617     
//  618     r1=SD_ReceiveData(buffer,512,RELEASE);
??SD_ReadSingleBlock_1:
        MOVS     R2,#+1
        MOV      R1,#+512
        MOVS     R0,R5
        BL       SD_ReceiveData
//  619     if(r1!=0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SD_ReadSingleBlock_3
//  620     {
//  621         return r1 ;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_ReadSingleBlock_2
//  622         //�����ݳ���
//  623     }
//  624     else 
//  625     {
//  626         return 0 ; //success
??SD_ReadSingleBlock_3:
        MOVS     R0,#+0
??SD_ReadSingleBlock_2:
        POP      {R1,R4,R5,PC}    ;; return
//  627 
//  628     }
//  629 }
//  630 
//  631 /*******************************************************************************
//  632 * Function Name  	: SD_WriteSingleBlock
//  633 * Description    	: д��SD����һ��block
//  634 * Input          	: unsigned long sector ������ַ��sectorֵ���������ַ��
//  635 *                  		  unsigned char *buffer ���ݴ洢��ַ����С����512byte��
//  636 * Output         	: None
//  637 * Return         	: unsigned char r1
//  638 *                   	0�� �ɹ�
//  639 *                   	other��ʧ��
//  640 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  641 unsigned char SD_WriteSingleBlock(unsigned long sector,const unsigned char *data)
//  642 {
SD_WriteSingleBlock:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  643     unsigned char r1 ;
//  644     unsigned int i ;
//  645     unsigned int retry ;
//  646     
//  647     //����Ϊ����ģʽ
//  648     SPI_SetSpeed(SPI_SPEED_HIGH);
        MOVS     R0,#+1
        BL       SPI_SetSpeed
//  649     
//  650     //�������SDHC����������sector��ַ������ת����byte��ַ
//  651     if(SD_Type!=SD_TYPE_V2HC)
        LDR.N    R0,??DataTable7_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BEQ.N    ??SD_WriteSingleBlock_0
//  652     {
//  653         sector=sector<<9 ;
        LSLS     R4,R4,#+9
//  654     }
//  655     
//  656     r1=SD_SendCommand(CMD24,sector,0xFF);
??SD_WriteSingleBlock_0:
        MOVS     R2,#+255
        MOVS     R1,R4
        MOVS     R0,#+24
        BL       SD_SendCommand
        MOVS     R4,R0
//  657     if(r1!=0x00)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SD_WriteSingleBlock_1
//  658     {
//  659         return r1 ;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_WriteSingleBlock_2
//  660         //Ӧ����ȷ��ֱ�ӷ���
//  661     }
//  662     
//  663     //��ʼ׼�����ݴ���
//  664     SD_CS_ENABLE();
??SD_WriteSingleBlock_1:
        MOVS     R2,#+0
        MOVS     R1,#+13
        LDR.N    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  665     //�ȷ�3�������ݣ��ȴ�SD��׼����
//  666     SPI_ReadWriteByte(0,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  667     SPI_ReadWriteByte(0,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  668     SPI_ReadWriteByte(0,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  669     //����ʼ����0xFE
//  670     SPI_ReadWriteByte(0,0xFE);
        MOVS     R1,#+254
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  671     
//  672     //��һ��sector������
//  673     for(i=0;i<512;i++)
        MOVS     R4,#+0
        B.N      ??SD_WriteSingleBlock_3
//  674     {
//  675         SPI_ReadWriteByte(0,*data++);
??SD_WriteSingleBlock_4:
        LDRB     R1,[R5, #+0]
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        ADDS     R5,R5,#+1
//  676     }
        ADDS     R4,R4,#+1
??SD_WriteSingleBlock_3:
        MOV      R0,#+512
        CMP      R4,R0
        BCC.N    ??SD_WriteSingleBlock_4
//  677     //��2��Byte��dummy CRC
//  678     SPI_ReadWriteByte(0,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  679     SPI_ReadWriteByte(0,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  680     
//  681     //�ȴ�SD��Ӧ��
//  682     r1=SPI_ReadWriteByte(0,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        MOVS     R4,R0
//  683     if((r1&0x1F)!=0x05)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ANDS     R0,R4,#0x1F
        CMP      R0,#+5
        BEQ.N    ??SD_WriteSingleBlock_5
//  684     {
//  685         SD_CS_DISABLE();
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.N    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  686         return r1 ;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_WriteSingleBlock_2
//  687     }
//  688     
//  689     //�ȴ��������
//  690     retry=0 ;
??SD_WriteSingleBlock_5:
        MOVS     R4,#+0
//  691     while(!SPI_ReadWriteByte(0,0xff))
??SD_WriteSingleBlock_6:
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        CMP      R0,#+0
        BNE.N    ??SD_WriteSingleBlock_7
//  692     {
//  693         retry++;
        ADDS     R4,R4,#+1
//  694         //�����ʱ��д��û����ɣ������˳�
//  695         if(retry>0xfffe)
        MOVW     R0,#+65535
        CMP      R4,R0
        BCC.N    ??SD_WriteSingleBlock_6
//  696         {
//  697             SD_CS_DISABLE();
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.N    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  698             return 1 ;
        MOVS     R0,#+1
        B.N      ??SD_WriteSingleBlock_2
//  699             //д�볬ʱ����1
//  700         }
//  701     }
//  702     
//  703     //д����ɣ�Ƭѡ��1
//  704     SD_CS_DISABLE();
??SD_WriteSingleBlock_7:
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.N    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  705     SPI_ReadWriteByte(0,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  706     
//  707     return 0 ;
        MOVS     R0,#+0
??SD_WriteSingleBlock_2:
        POP      {R1,R4,R5,PC}    ;; return
//  708 }
//  709 
//  710 
//  711 /*******************************************************************************
//  712 * Function Name  : SD_ReadMultiBlock
//  713 * Description    : ��SD���Ķ��block
//  714 * Input          : unsigned long sector ȡ��ַ��sectorֵ���������ַ��
//  715 *                  unsigned char *buffer ���ݴ洢��ַ����С����512byte��
//  716 *                  unsigned char count ������count��block
//  717 * Output         : None
//  718 * Return         : unsigned char r1
//  719 *                   0�� �ɹ�
//  720 *                   other��ʧ��
//  721 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  722 unsigned char SD_ReadMultiBlock(unsigned long sector,unsigned char *buffer,unsigned char count)
//  723 {
SD_ReadMultiBlock:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  724     unsigned char r1 ;
//  725     
//  726     //����Ϊ����ģʽ
//  727     SPI_SetSpeed(SPI_SPEED_HIGH);
        MOVS     R0,#+1
        BL       SPI_SetSpeed
//  728     
//  729     //�������SDHC����sector��ַת��byte��ַ
//  730     sector=sector<<9 ;
        LSLS     R4,R4,#+9
//  731     //SD_WaitReady();
//  732     //�����������
//  733     r1=SD_SendCommand(CMD18,sector,0);
        MOVS     R2,#+0
        MOVS     R1,R4
        MOVS     R0,#+18
        BL       SD_SendCommand
//  734     //������
//  735     if(r1!=0x00)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SD_ReadMultiBlock_0
//  736     {
//  737         return r1 ;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_ReadMultiBlock_1
//  738     }
//  739     //��ʼ��������
//  740     do 
//  741     {
//  742         if(SD_ReceiveData(buffer,512,NO_RELEASE)!=0x00)
??SD_ReadMultiBlock_0:
        MOVS     R2,#+0
        MOV      R1,#+512
        MOVS     R0,R5
        BL       SD_ReceiveData
        CMP      R0,#+0
        BNE.N    ??SD_ReadMultiBlock_2
//  743         {
//  744             break ;
//  745         }
//  746         buffer+=512 ;
??SD_ReadMultiBlock_3:
        ADDW     R5,R5,#+512
//  747     }
//  748     while(--count);
        SUBS     R6,R6,#+1
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SD_ReadMultiBlock_0
//  749     
//  750     //ȫ��������ϣ�����ֹͣ����
//  751     SD_SendCommand(CMD12,0,0);
??SD_ReadMultiBlock_2:
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+12
        BL       SD_SendCommand
//  752     //�ͷ�����
//  753     SD_CS_DISABLE();
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.N    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  754     SPI_ReadWriteByte(0,0xFF);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  755     
//  756     if(count!=0)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??SD_ReadMultiBlock_4
//  757     {
//  758         return count ;
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_ReadMultiBlock_1
//  759         //���û�д��꣬����ʣ�����
//  760     }
//  761     else 
//  762     {
//  763         return 0 ;
??SD_ReadMultiBlock_4:
        MOVS     R0,#+0
??SD_ReadMultiBlock_1:
        POP      {R4-R6,PC}       ;; return
//  764     }
//  765 }
//  766 
//  767 
//  768 /*******************************************************************************
//  769 * Function Name  : SD_WriteMultiBlock
//  770 * Description    : д��SD����N��block
//  771 * Input          : unsigned long sector ������ַ��sectorֵ���������ַ��
//  772 *                  unsigned char *buffer ���ݴ洢��ַ����С����512byte��
//  773 *                  unsigned char count д���block��Ŀ
//  774 * Output         : None
//  775 * Return         : unsigned char r1
//  776 *                   0�� �ɹ�
//  777 *                   other��ʧ��
//  778 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  779 unsigned char SD_WriteMultiBlock(unsigned long sector,const unsigned char*data,unsigned char count)
//  780 {
SD_WriteMultiBlock:
        PUSH     {R3-R7,LR}
        MOVS     R6,R0
        MOVS     R4,R1
        MOVS     R5,R2
//  781     unsigned char r1 ;
//  782     unsigned int i ;
//  783     
//  784     //����Ϊ����ģʽ
//  785     SPI_SetSpeed(SPI_SPEED_HIGH);
        MOVS     R0,#+1
        BL       SPI_SetSpeed
//  786     
//  787     //�������SDHC����������sector��ַ������ת����byte��ַ
//  788     if(SD_Type!=SD_TYPE_V2HC)
        LDR.N    R0,??DataTable7_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BEQ.N    ??SD_WriteMultiBlock_0
//  789     {
//  790         sector=sector<<9 ;
        LSLS     R6,R6,#+9
//  791     }
//  792     //���Ŀ�꿨����MMC��������ACMD23ָ��ʹ��Ԥ����
//  793     if(SD_Type!=SD_TYPE_MMC)
??SD_WriteMultiBlock_0:
        LDR.N    R0,??DataTable7_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SD_WriteMultiBlock_1
//  794     {
//  795         r1=SD_SendCommand(ACMD23,count,0x00);
        MOVS     R2,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,R5
        MOVS     R0,#+23
        BL       SD_SendCommand
        MOVS     R7,R0
//  796     }
//  797     //�����д��ָ��
//  798     r1=SD_SendCommand(CMD25,sector,0x00);
??SD_WriteMultiBlock_1:
        MOVS     R2,#+0
        MOVS     R1,R6
        MOVS     R0,#+25
        BL       SD_SendCommand
        MOVS     R7,R0
//  799     if(r1!=0x00)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??SD_WriteMultiBlock_2
//  800     {
//  801         return r1 ;
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_WriteMultiBlock_3
//  802         //Ӧ����ȷ��ֱ�ӷ���
//  803     }
//  804     
//  805     //��ʼ׼�����ݴ���
//  806     SD_CS_ENABLE();
??SD_WriteMultiBlock_2:
        MOVS     R2,#+0
        MOVS     R1,#+13
        LDR.N    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  807     //�ȷ�3�������ݣ��ȴ�SD��׼����
//  808     SPI_ReadWriteByte(0,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  809     SPI_ReadWriteByte(0,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  810     
//  811     //--------������N��sectorд���ѭ������
//  812     do 
//  813     {
//  814         //����ʼ����0xFC �����Ƕ��д��
//  815         SPI_ReadWriteByte(0,0xFC);
??SD_WriteMultiBlock_4:
        MOVS     R1,#+252
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  816         
//  817         //��һ��sector������
//  818         for(i=0;i<512;i++)
        MOVS     R6,#+0
        B.N      ??SD_WriteMultiBlock_5
//  819         {
//  820             SPI_ReadWriteByte(0,*data++);
??SD_WriteMultiBlock_6:
        LDRB     R1,[R4, #+0]
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        ADDS     R4,R4,#+1
//  821         }
        ADDS     R6,R6,#+1
??SD_WriteMultiBlock_5:
        MOV      R0,#+512
        CMP      R6,R0
        BCC.N    ??SD_WriteMultiBlock_6
//  822         //��2��Byte��dummy CRC
//  823         SPI_ReadWriteByte(0,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  824         SPI_ReadWriteByte(0,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  825         
//  826         //�ȴ�SD��Ӧ��
//  827         r1=SPI_ReadWriteByte(0,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        MOVS     R7,R0
//  828         if((r1&0x1F)!=0x05)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ANDS     R0,R7,#0x1F
        CMP      R0,#+5
        BEQ.N    ??SD_WriteMultiBlock_7
//  829         {
//  830             SD_CS_DISABLE();
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.N    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  831             //���Ӧ��Ϊ��������������ֱ���˳�
//  832             return r1 ;
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_WriteMultiBlock_3
//  833         }
//  834         
//  835         //�ȴ�SD��д�����
//  836         if(SD_WaitReady()==1)
??SD_WriteMultiBlock_7:
        BL       SD_WaitReady
        CMP      R0,#+1
        BNE.N    ??SD_WriteMultiBlock_8
//  837         {
//  838             SD_CS_DISABLE();
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.N    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  839             //�ȴ�SD��д����ɳ�ʱ��ֱ���˳�����
//  840             return 1 ;
        MOVS     R0,#+1
        B.N      ??SD_WriteMultiBlock_3
//  841         }
//  842         
//  843         //��sector���ݴ������
//  844     }
//  845     while(--count);
??SD_WriteMultiBlock_8:
        SUBS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SD_WriteMultiBlock_4
//  846     
//  847     //��������������0xFD
//  848     r1=SPI_ReadWriteByte(0,0xFD);
        MOVS     R1,#+253
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
        MOVS     R7,R0
//  849     if(r1==0x00)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??SD_WriteMultiBlock_9
//  850     {
//  851         count=0xfe ;
        MOVS     R5,#+254
//  852     }
//  853     
//  854     if(SD_WaitReady())
??SD_WriteMultiBlock_9:
        BL       SD_WaitReady
        CMP      R0,#+0
        BEQ.N    ??SD_WriteMultiBlock_10
//  855     {
//  856         while(1){}
??SD_WriteMultiBlock_11:
        B.N      ??SD_WriteMultiBlock_11
//  857     }
//  858     
//  859     //д����ɣ�Ƭѡ��1
//  860     SD_CS_DISABLE();
??SD_WriteMultiBlock_10:
        MOVS     R2,#+1
        MOVS     R1,#+13
        LDR.N    R0,??DataTable7  ;; 0x400ff000
        BL       gpio_ctrl
//  861     SPI_ReadWriteByte(0,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+0
        BL       SPI_ReadWriteByte
//  862     
//  863     return count ;
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SD_WriteMultiBlock_3:
        POP      {R1,R4-R7,PC}    ;; return
//  864     //����countֵ�����д����count=0������count=1
//  865 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     SD_Type

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
//     1 byte  in section .bss
// 1 882 bytes in section .text
// 
// 1 882 bytes of CODE memory
//     1 byte  of DATA memory
//
//Errors: none
//Warnings: none
