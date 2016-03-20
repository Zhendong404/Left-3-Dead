///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    09/Dec/2014  13:38:44 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  D:\IAR_TEST\Sirius\Sirius V2.3.5                        /
//                    66ms\src\Sources\C\Function_C\CameraSet.c               /
//    Command line =  "D:\IAR_TEST\Sirius\Sirius V2.3.5                       /
//                    66ms\src\Sources\C\Function_C\CameraSet.c" -D IAR -D    /
//                    TWR_K60N512 -lCN "D:\IAR_TEST\Sirius\Sirius V2.3.5      /
//                    66ms\bin\Ram\List\" -lB "D:\IAR_TEST\Sirius\Sirius      /
//                    V2.3.5  66ms\bin\Ram\List\" -o                          /
//                    "D:\IAR_TEST\Sirius\Sirius V2.3.5  66ms\bin\Ram\Obj\"   /
//                    --no_cse --no_unroll --no_inline --no_code_motion       /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M4 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.3\arm\INC\c\DLib_Config_Normal.h" -I                  /
//                    "D:\IAR_TEST\Sirius\Sirius V2.3.5                       /
//                    66ms\src\Sources\H\" -I "D:\IAR_TEST\Sirius\Sirius      /
//                    V2.3.5  66ms\src\Sources\H\Component_H\" -I             /
//                    "D:\IAR_TEST\Sirius\Sirius V2.3.5                       /
//                    66ms\src\Sources\H\Frame_H\" -I                         /
//                    "D:\IAR_TEST\Sirius\Sirius V2.3.5                       /
//                    66ms\src\Sources\H\Function_H\" -I                      /
//                    "D:\IAR_TEST\Sirius\Sirius V2.3.5                       /
//                    66ms\src\Sources\H\SD_H\" -Ol --use_c++_inline          /
//    List file    =  D:\IAR_TEST\Sirius\Sirius V2.3.5                        /
//                    66ms\bin\Ram\List\CameraSet.s                           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME CameraSet

        #define SHT_PROGBITS 0x1

        EXTERN SCCBPortInit
        EXTERN SCCBWriteByte
        EXTERN uart_sendN

        PUBLIC CameraDelay
        PUBLIC CameraInit
        PUBLIC CameraPortInit
        PUBLIC CameraRegInit
        PUBLIC ImgRaw
        PUBLIC ImgStatus
        PUBLIC OV7620Regs
        PUBLIC OV7725Regs

// D:\IAR_TEST\Sirius\Sirius V2.3.5  66ms\src\Sources\C\Function_C\CameraSet.c
//    1 /******************************************************************************/
//    2 /*******************************************************************************
//    3   �ļ���������ͷ�Ĵ��������ļ�CameraSet.c
//    4   ��  �ܣ�����ͷ���Կ���
//    5   ��  �ڣ�2014.10.09
//    6   ��  �ߣ�HJZ
//    7   ��  ע��
//    8 *******************************************************************************/
//    9 /******************************************************************************/
//   10 //ͷ�ļ�
//   11 #include "CameraSet.h"
//   12 
//   13 
//   14 //ȫ�ֱ�������

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   15 volatile ImgStatusDef ImgStatus = ImgGetFinish;   //��ǰͼ��״̬��־��־λ
ImgStatus:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 uint8 ImgRaw[CameraHight][CameraWidth];           //ԭʼ���ݴ�������
ImgRaw:
        DS8 16000
//   17 
//   18 //uint8 ImgSend[CameraWidth * CameraHight];      //Ҫ���͵���λ�������飬����ӥ������ͷ��һ�ֽ�8�����أ������Ҫ��ѹΪ 1�ֽ�1�����أ����㴦��
//   19 
//   20 //OV7725�Ĵ���ר�ó�ʼֵ��ȫ�ֱ���

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   21 CameraRegs OV7725Regs[] =
OV7725Regs:
        DATA
        DC8 13, 193, 17, 0, 9, 3, 12, 208, 18, 64, 23, 63, 24, 80, 25, 3, 26
        DC8 120, 50, 0, 160, 10, 99, 224, 172, 255, 101, 12, 102, 0, 103, 0, 41
        DC8 80, 42, 0, 126, 12, 127, 22, 128, 42, 129, 78, 130, 97, 131, 111
        DC8 132, 123, 133, 134, 134, 142, 135, 151, 136, 164, 137, 175, 138
        DC8 197, 139, 215, 140, 232, 141, 32, 74, 0, 73, 19, 71, 8, 75, 20, 76
        DC8 23, 70, 5, 34, 153, 35, 3, 166, 4, 155, 0, 156, 255, 171, 6, 158
        DC8 17, 159, 2
//   22 {
//   23     //�Ĵ�����ַ���Ĵ���ֵ
//   24     {OV7725_COM4         , 0xC1},//01
//   25     {OV7725_CLKRC        , 0x00},//02
//   26     {OV7725_COM2         , 0x03},//03
//   27     {OV7725_COM3         , 0xD0},//04
//   28     {OV7725_COM7         , 0x40},//05
//   29     {OV7725_HSTART       , 0x3F},//06
//   30     {OV7725_HSIZE        , 0x50},//07
//   31     {OV7725_VSTRT        , 0x03},//08
//   32     {OV7725_VSIZE        , 0x78},//09
//   33     {OV7725_HREF         , 0x00},//10
//   34     {OV7725_SCAL0        , 0x0A},//11
//   35     {OV7725_AWB_Ctrl0    , 0xE0},//12
//   36     {OV7725_DSPAuto      , 0xff},//13
//   37     {OV7725_DSP_Ctrl2    , 0x0C},//14
//   38     {OV7725_DSP_Ctrl3    , 0x00},//15
//   39     {OV7725_DSP_Ctrl4    , 0x00},//16
//   40 
//   41 #if (CameraWidth == 80)             //17
//   42     {OV7725_HOutSize     , 0x14},   //��10λ����Ϊ��8λ����2λ��OV7725_EXHCH�У�Ϊ00��80����0x50,����2λ����0x14
//   43 #elif (CameraWidth == 160)
//   44     {OV7725_HOutSize     , 0x28},
//   45 #elif (CameraWidth == 240)
//   46     {OV7725_HOutSize     , 0x3c},
//   47 #elif (CameraWidth == 320)
//   48     {OV7725_HOutSize     , 0x50},
//   49 #else
//   50 
//   51 #endif
//   52 
//   53 #if (CameraHight == 60 )             //18
//   54     {OV7725_VOutSize     , 0x1E},   //��9λ����Ϊ��8λ����1λ��OV7725_EXHCH�У�Ϊ0�� 60����0x3C,����1λ����0x1E
//   55 #elif (CameraHight == 120 )
//   56     {OV7725_VOutSize     , 0x3c},
//   57 #elif (CameraHight == 180 )
//   58     {OV7725_VOutSize     , 0x5a},
//   59 #elif (CameraHight == 240 )
//   60     {OV7725_VOutSize     , 0x78},
//   61 #else
//   62 
//   63 #endif
//   64 
//   65     {OV7725_EXHCH        , 0x00},//19
//   66     {OV7725_GAM1         , 0x0c},//20
//   67     {OV7725_GAM2         , 0x16},//21
//   68     {OV7725_GAM3         , 0x2a},//22
//   69     {OV7725_GAM4         , 0x4e},//23
//   70     {OV7725_GAM5         , 0x61},//24
//   71     {OV7725_GAM6         , 0x6f},//25
//   72     {OV7725_GAM7         , 0x7b},//26
//   73     {OV7725_GAM8         , 0x86},//27
//   74     {OV7725_GAM9         , 0x8e},//28
//   75     {OV7725_GAM10        , 0x97},//29
//   76     {OV7725_GAM11        , 0xa4},//30
//   77     {OV7725_GAM12        , 0xaf},//31
//   78     {OV7725_GAM13        , 0xc5},//32
//   79     {OV7725_GAM14        , 0xd7},//33
//   80     {OV7725_GAM15        , 0xe8},//34
//   81     {OV7725_SLOP         , 0x20},//35
//   82     {OV7725_LC_RADI      , 0x00},//36
//   83     {OV7725_LC_COEF      , 0x13},//37
//   84     {OV7725_LC_XC        , 0x08},//38
//   85     {OV7725_LC_COEFB     , 0x14},//39
//   86     {OV7725_LC_COEFR     , 0x17},//40
//   87     {OV7725_LC_CTR       , 0x05},//41
//   88     {OV7725_BDBase       , 0x99},//42
//   89     {OV7725_BDMStep      , 0x03},//43
//   90     {OV7725_SDE          , 0x04},//44
//   91     {OV7725_BRIGHT       , 0x00},//45
//   92     {OV7725_CNST         , 0xFF},//46
//   93     {OV7725_SIGN         , 0x06},//47
//   94     {OV7725_UVADJ0       , 0x11},//48
//   95     {OV7725_UVADJ1       , 0x02},//49
//   96 
//   97 };
//   98 
//   99 //OV7620�Ĵ���ר�ó�ʼֵ��ȫ�ֱ���

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  100 CameraRegs OV7620Regs[] =
OV7620Regs:
        DATA
        DC8 13, 193, 17, 0
//  101 {
//  102       //�Ĵ�����ַ���Ĵ���ֵ
//  103     {OV7725_COM4         , 0xC1},//01
//  104     {OV7725_CLKRC        , 0x00},//02
//  105 };
//  106 
//  107 
//  108 
//  109 
//  110 
//  111 //����
//  112 
//  113 //CameraDelay����
//  114 //5�� * 30000 * 1 = 150000 �����㣬Ҳ����1ms����һ��׼��

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  115 void CameraDelay(uint32 time)
//  116 {
CameraDelay:
        SUB      SP,SP,#+4
//  117   volatile uint32 timecount = time * 30000;
        MOVW     R1,#+30000
        MULS     R0,R1,R0
        STR      R0,[SP, #+0]
        B.N      ??CameraDelay_0
//  118   while(timecount--)
//  119   {
//  120     asm("nop");  
??CameraDelay_1:
        nop              
//  121     asm("nop");  
        nop              
//  122     asm("nop");  
        nop              
//  123     asm("nop");  
        nop              
//  124   }
??CameraDelay_0:
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??CameraDelay_1
//  125 }
        ADD      SP,SP,#+4
        BX       LR               ;; return
//  126 
//  127 
//  128 //����ͷ����˿�����

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  129 void CameraPortInit(void)
//  130 {
CameraPortInit:
        SUB      SP,SP,#+8
//  131     uint8 i;                                  
//  132     uint8 IMAGE_PIN_IN[8] = {0,1,2,3,4,5,6,7};    
        ADD      R0,SP,#+0
        LDR.N    R1,??DataTable1
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//  133     PORT_MemMapPtr p = PORT_IMAGE_DATA_BASE_PTR;
        LDR.N    R1,??DataTable1_1  ;; 0x4004a000
//  134     
//  135     //ͼ����������ڳ�ʼ���� PTB0~PTB7������Ϊ����ͷ�������룬�������� 
//  136     //SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
//  137     for(i = 0;i < 8;i++)
        MOVS     R0,#+0
        B.N      ??CameraPortInit_0
//  138     {
//  139         //��Ӧ�Ķ˿����ų�ʼ��,�������룬
//  140         //gpio_init(PORT_IMAGE_DATA,IMAGE_PIN_IN[i],0,0);
//  141         //���ö˿�ΪGPIOģʽ��Ĭ����������
//  142         PORT_PCR_REG(p,IMAGE_PIN_IN[i]) |= PORT_PCR_MUX(0x01) | PORT_PCR_PE_MASK;
??CameraPortInit_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R2,SP,#+0
        LDRB     R2,[R0, R2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R3,SP,#+0
        LDRB     R3,[R0, R3]
        LDR      R3,[R1, R3, LSL #+2]
        ORRS     R3,R3,#0x102
        STR      R3,[R1, R2, LSL #+2]
//  143         //����Ϊ��������
//  144         PORT_PCR_REG(p,IMAGE_PIN_IN[i]) &= ~PORT_PCR_PS_MASK;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R2,SP,#+0
        LDRB     R2,[R0, R2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R3,SP,#+0
        LDRB     R3,[R0, R3]
        LDR      R3,[R1, R3, LSL #+2]
        LSRS     R3,R3,#+1
        LSLS     R3,R3,#+1
        STR      R3,[R1, R2, LSL #+2]
//  145         
//  146     }
        ADDS     R0,R0,#+1
??CameraPortInit_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+8
        BCC.N    ??CameraPortInit_1
//  147     
//  148     
//  149     //���ж��������ų�ʼ��, �½��ش����жϣ��ݶ�ΪPTD1
//  150     //�����������裬���˲�
//  151     PORT_PCR_REG(PORT_FIELD_BASE_PTR, PIN_FIELD) |= (
//  152                                                     PORT_PCR_MUX(0x01)    //GPIO
//  153                                                //   | PORT_PCR_PE_MASK    //��������
//  154                                                   | PORT_PCR_IRQC(0xA)   //�½��ش����ж�
//  155                                                //   | PORT_PCR_PFE_MASK   //�˲�
//  156                                                     );    
        LDR.N    R0,??DataTable1_2  ;; 0x4004c004
        LDR      R0,[R0, #+0]
        ORR      R0,R0,#0xA0000
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable1_2  ;; 0x4004c004
        STR      R0,[R1, #+0]
//  157     //���ж��������ų�ʼ��, �����ش����жϣ��ݶ�ΪPTC8
//  158     //�����������裬���˲�
//  159     PORT_PCR_REG(PORT_LINE_BASE_PTR, PIN_LINE) |= (
//  160                                                     PORT_PCR_MUX(0x01)    //GPIO
//  161                                                //   | PORT_PCR_PE_MASK    //��������
//  162                                                   | PORT_PCR_IRQC(0x9)    //�����ش����ж�
//  163                                                //   | PORT_PCR_PFE_MASK   //�˲�
//  164                                                     );   
        LDR.N    R0,??DataTable1_3  ;; 0x4004b020
        LDR      R0,[R0, #+0]
        ORR      R0,R0,#0x90000
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable1_3  ;; 0x4004b020
        STR      R0,[R1, #+0]
//  165     
//  166     //PCLK�������ų�ʼ���������ش���DMA�� �ݶ�ΪPTB9
//  167     //�����������裬���˲�
//  168     PORT_PCR_REG(PORT_PCLK_BASE_PTR, PIN_PCLK) |= (
//  169                                                     PORT_PCR_MUX(0x01) //GPIO
//  170                                                 //  | PORT_PCR_PE_MASK   //��������
//  171                                                   | PORT_PCR_IRQC(0x1) //�����ش���DMA
//  172                                                    );         
        LDR.N    R0,??DataTable1_4  ;; 0x4004a024
        LDR      R0,[R0, #+0]
        ORR      R0,R0,#0x10000
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable1_4  ;; 0x4004a024
        STR      R0,[R1, #+0]
//  173 }
        ADD      SP,SP,#+8
        BX       LR               ;; return
//  174 
//  175 
//  176 /*
//  177 //OV7725����ͷ�Ĵ�����ʼ�� �ɹ�����1 ʧ�ܷ���0
//  178 uint8 CameraRegInit(void)
//  179 {
//  180     uint8 i;
//  181     uint8 SensorID = 1;
//  182     uint8 Send_Tmp[1] = {"1"};
//  183     
//  184     //SCCB�ź���������
//  185     SCCBPortInit();
//  186     
//  187     //��λ����ͷ���мĴ���
//  188     if(SCCBWriteByte(OV7725_COM7, 0x80) == 0)
//  189     {
//  190         uart_sendN(UART0, (uint8 *)"\nCamera Registers Reset Failed!", 31);
//  191         return 0;
//  192     }
//  193     
//  194     //��ʱ
//  195     CameraDelay(50);
//  196     
//  197     
//  198     
//  199     //��ȡ����ͷоƬ��ID��
//  200     if(SCCBReadByte(&SensorID, 1, OV7725_VER) == 0)
//  201     {
//  202         uart_sendN(UART0, (uint8 *)"\nCamera Registers ReadID Failed!", 32);
//  203         return 0;
//  204     }
//  205     
//  206     Send_Tmp[0] = SensorID;
//  207     
//  208     //��ȡ����ͷоƬID�ųɹ�
//  209     uart_sendN(UART0, (uint8 *)"\nCamera Registers ReadID Succeed: ", 34);
//  210     uart_send1(UART0, '\n');
//  211     uart_sendN(UART0, Send_Tmp, sizeof(Send_Tmp));
//  212     
//  213     
//  214     
//  215     //���ø����Ĵ���
//  216     if(SensorID == OV7725_ID) 
//  217     {
//  218         for( i = 0 ; i < 49 ; i++ )
//  219         {
//  220             if( 0 == SCCBWriteByte(OV7725Regs[i].addr, OV7725Regs[i].val) )
//  221             {
//  222                 uart_sendN(UART0, (uint8 *)"\nCamera Writing a Reg Failed!", 29);
//  223                 return 0;
//  224             }
//  225         }
//  226     }
//  227     else
//  228     {
//  229         uart_sendN(UART0, (uint8 *)"\nSensor ID Unmatch!", 19);
//  230         return 0;
//  231     }
//  232     
//  233     //����Camera���Ĵ������ɹ�
//  234     uart_sendN(UART0, (uint8 *)"\nCamera Registers Initial Finally Succeed!", 42);
//  235     return 1;
//  236 }
//  237 
//  238 */
//  239 
//  240 
//  241 
//  242 //OV7620����ͷ�Ĵ�����ʼ�� �ɹ�����1 ʧ�ܷ���0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  243 uint8 CameraRegInit(void)
//  244 {
CameraRegInit:
        PUSH     {R7,LR}
//  245     //uint8 i;
//  246     //uint8 SensorID = 1;
//  247     //uint8 Send_Tmp[1] = {"1"};
//  248     
//  249     //SCCB�ź���������
//  250     SCCBPortInit();
        BL       SCCBPortInit
//  251     
//  252     //��λ����ͷ���мĴ���
//  253     if(SCCBWriteByte(OV7620_COMCTRLA, 0x80) == 0)
        MOVS     R1,#+128
        MOVS     R0,#+18
        BL       SCCBWriteByte
        CMP      R0,#+0
        BNE.N    ??CameraRegInit_0
//  254     {
//  255         uart_sendN(UART0, (uint8 *)"\nCamera Registers Reset Failed!", 31);
        MOVS     R2,#+31
        LDR.N    R1,??DataTable1_5
        LDR.N    R0,??DataTable1_6  ;; 0x4006a000
        BL       uart_sendN
//  256         return 0;
        MOVS     R0,#+0
        B.N      ??CameraRegInit_1
//  257     }
//  258     
//  259     //��ʱ
//  260     CameraDelay(50);    
??CameraRegInit_0:
        MOVS     R0,#+50
        BL       CameraDelay
//  261     
//  262     //PCLK�ķ�Ƶ��HSYNC��Ч��CHSYNC��Ч��VSYNC��Ч���ء�
//  263     //PCLK:166ns   HREF:254.6us   VSYN:133.6ms
//  264     if( 0 == SCCBWriteByte(OV7620_CLKCTRL,0x01))
        MOVS     R1,#+1
        MOVS     R0,#+17
        BL       SCCBWriteByte
        CMP      R0,#+0
        BNE.N    ??CameraRegInit_2
//  265     {
//  266         uart_sendN(UART0, (uint8 *)"\nCamera Writing OV7620_CLKCTRL Failed!", 38);
        MOVS     R2,#+38
        LDR.N    R1,??DataTable1_7
        LDR.N    R0,??DataTable1_6  ;; 0x4006a000
        BL       uart_sendN
//  267         return 0;
        MOVS     R0,#+0
        B.N      ??CameraRegInit_1
//  268     }
//  269     
//  270     //AWB������ֵѡ��Ϊ �ͣ� QVGA���ѡ��320*240��VSYNC����ż���������HREF�����ԣ�RGB٤��У��������
//  271     //PCLK:332ns   HREF:509.6us   VSYN:133.6ms
//  272     if( 0 == SCCBWriteByte(OV7620_COMCTRLC,0x24))
??CameraRegInit_2:
        MOVS     R1,#+36
        MOVS     R0,#+20
        BL       SCCBWriteByte
        CMP      R0,#+0
        BNE.N    ??CameraRegInit_3
//  273     {
//  274         uart_sendN(UART0, (uint8 *)"\nCamera Writing OV7620_COMCTRLC Failed!", 39);
        MOVS     R2,#+39
        LDR.N    R1,??DataTable1_8
        LDR.N    R0,??DataTable1_6  ;; 0x4006a000
        BL       uart_sendN
//  275         return 0;
        MOVS     R0,#+0
        B.N      ??CameraRegInit_1
//  276     }
//  277     
//  278     //�����ɼ�ģʽ(320*240)
//  279     //PCLK:666ns   HREF:509.6us   VSYN:133.6ms
//  280     if( 0 == SCCBWriteByte(OV7620_COMCTRLH,0x20))
??CameraRegInit_3:
        MOVS     R1,#+32
        MOVS     R0,#+40
        BL       SCCBWriteByte
        CMP      R0,#+0
        BNE.N    ??CameraRegInit_4
//  281     {
//  282         uart_sendN(UART0, (uint8 *)"\nCamera Writing OV7620_COMCTRLH Failed!", 39);
        MOVS     R2,#+39
        LDR.N    R1,??DataTable1_9
        LDR.N    R0,??DataTable1_6  ;; 0x4006a000
        BL       uart_sendN
//  283         return 0;
        MOVS     R0,#+0
        B.N      ??CameraRegInit_1
//  284     }
//  285 
//  286     
//  287     //����Camera���Ĵ������ɹ�
//  288     uart_sendN(UART0, (uint8 *)"\nCamera Registers Initial Finally Succeed!", 42);
??CameraRegInit_4:
        MOVS     R2,#+42
        LDR.N    R1,??DataTable1_10
        LDR.N    R0,??DataTable1_6  ;; 0x4006a000
        BL       uart_sendN
//  289     return 1;
        MOVS     R0,#+1
??CameraRegInit_1:
        POP      {R1,PC}          ;; return
//  290 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     `?<Constant {0, 1, 2, 3, 4, 5, 6, 7}>`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x4004c004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x4004b020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x4004a024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     `?<Constant "\\nCamera Registers Res...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     `?<Constant "\\nCamera Writing OV762...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     `?<Constant "\\nCamera Writing OV762...">_1`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     `?<Constant "\\nCamera Writing OV762...">_2`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     `?<Constant "\\nCamera Registers Ini...">`
//  291 
//  292 
//  293 
//  294 
//  295 
//  296 //����ͷ��ʼ������ �ɹ�����1 ʧ�ܷ���0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  297 uint8 CameraInit(void)
//  298 {
CameraInit:
        PUSH     {R7,LR}
//  299   
//  300     if(!CameraRegInit()) return 0; //����ͷ�Ĵ�����ʼ����ʧ�ܣ�ֱ�ӷ���0
        BL       CameraRegInit
        CMP      R0,#+0
        BNE.N    ??CameraInit_0
        MOVS     R0,#+0
        B.N      ??CameraInit_1
//  301     CameraPortInit();              //����ͷ����˿�����
??CameraInit_0:
        BL       CameraPortInit
//  302     return 1;
        MOVS     R0,#+1
??CameraInit_1:
        POP      {R1,PC}          ;; return
//  303 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {0, 1, 2, 3, 4, 5, 6, 7}>`:
        DATA
        DC8 0, 1, 2, 3, 4, 5, 6, 7

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nCamera Registers Res...">`:
        DATA
        DC8 "\012Camera Registers Reset Failed!"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nCamera Writing OV762...">`:
        DATA
        DC8 "\012Camera Writing OV7620_CLKCTRL Failed!"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nCamera Writing OV762...">_1`:
        DATA
        DC8 "\012Camera Writing OV7620_COMCTRLC Failed!"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nCamera Writing OV762...">_2`:
        DATA
        DC8 "\012Camera Writing OV7620_COMCTRLH Failed!"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nCamera Registers Ini...">`:
        DATA
        DC8 "\012Camera Registers Initial Finally Succeed!"
        DC8 0

        END
//  304 
// 
// 16 000 bytes in section .bss
//    101 bytes in section .data
//    204 bytes in section .rodata
//    358 bytes in section .text
// 
//    358 bytes of CODE  memory
//    204 bytes of CONST memory
// 16 101 bytes of DATA  memory
//
//Errors: none
//Warnings: none
