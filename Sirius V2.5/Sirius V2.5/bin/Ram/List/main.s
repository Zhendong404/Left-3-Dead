///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    09/Dec/2014  13:38:44 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  D:\IAR_TEST\Sirius\Sirius V2.3.5                        /
//                    66ms\src\Sources\C\main.c                               /
//    Command line =  "D:\IAR_TEST\Sirius\Sirius V2.3.5                       /
//                    66ms\src\Sources\C\main.c" -D IAR -D TWR_K60N512 -lCN   /
//                    "D:\IAR_TEST\Sirius\Sirius V2.3.5  66ms\bin\Ram\List\"  /
//                    -lB "D:\IAR_TEST\Sirius\Sirius V2.3.5                   /
//                    66ms\bin\Ram\List\" -o "D:\IAR_TEST\Sirius\Sirius       /
//                    V2.3.5  66ms\bin\Ram\Obj\" --no_cse --no_unroll         /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
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
//                    66ms\bin\Ram\List\main.s                                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME main

        #define SHT_PROGBITS 0x1

        EXTERN CameraInit
        EXTERN DMAInit
        EXTERN ImageGet
        EXTERN ImageProSend
        EXTERN ImgRaw
        EXTERN disable_irq
        EXTERN gpio_init
        EXTERN light_init
        EXTERN periph_clk_khz
        EXTERN pit_init
        EXTERN uart_init
        EXTERN uart_sendN

        PUBLIC main

// D:\IAR_TEST\Sirius\Sirius V2.3.5  66ms\src\Sources\C\main.c
//    1 ////////////////////////////////////////////////////////////////////
//    2 //                            _ooOoo_                             //
//    3 //                           o8888888o                            //    
//    4 //                           88" . "88                            //    
//    5 //                           (| ^_^ |)                            //    
//    6 //                           O\  =  /O                            //
//    7 //                        ____/`---'\____                         //                        
//    8 //                      .'  \\|     |//  `.                       //
//    9 //                     /  \\|||  :  |||//  \                      //    
//   10 //                    /  _||||| -:- |||||-  \                     //
//   11 //                    |   | \\\  -  /// |   |                     //
//   12 //                    | \_|  ''\---/''  |   |                     //        
//   13 //                    \  .-\__  `-`  ___/-. /                     //        
//   14 //                  ___`. .'  /--.--\  `. . ___                   //    
//   15 //                ."" '<  `.___\_<|>_/___.'  >'"".                //
//   16 //              | | :  `- \`.;`\ _ /`;.`/ - ` : | |               //    
//   17 //              \  \ `-.   \_ __\ /__ _/   .-` /  /               //
//   18 //        ========`-.____`-.___\_____/___.-`____.-'========       //    
//   19 //                             `=---='                            //
//   20 //        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^      //
//   21 //            ���汣��       ����BUG        �����޸�              //
//   22 //            ��ģ���Ѿ��������⴦���������ܲ���BUG             //
//   23 ////////////////////////////////////////////////////////////////////
//   24 
//   25 /******************************************************************************/
//   26 /*******************************************************************************
//   27 ���ļ��������㽭��ѧ���ܳ�Sirius������Main
//   28 ����  �ܡ���Run+Faster+Fly
//   29 ����  �ڡ���2014.10.09
//   30 ����  �ߡ���HJZ/LYX/YCR
//   31 ����  ע����
//   32 *******************************************************************************/
//   33 /******************************************************************************/
//   34 /*********************************
//   35 ��dev.env.��IAR EWARM 6.30.1.3142
//   36 ��Target  ��MK60-DN512-VLQ10
//   37 ��Crystal ��50.000  MHz
//   38 ��busclock��75.000  MHz
//   39 ��pllclock��150.000 MHz
//   40 *********************************/
//   41 
//   42 // Ӳ�������У�������������������OLED, ����ͷ
//   43 
//   44 /************************************************************/
//   45 //#define MAIN_PROGRAM    //���������
//   46 //#define PINREAD_DEBUG   //�����������
//   47 //#define CLOCK_DEBUG     //ʱ�����Ų���
//   48 //#define CAMERA_DEBUG_7725  //OV7725����ͷ����
//   49 #define CAMERA_DEBUG_7620    //OV7620����ͷ����
//   50 //#define C_DEBUG            //C�����﷨����
//   51 //#define DAQ_DEBUG          //DAQ����
//   52 //#define DMA_DEBUG          //DMA����
//   53 //#define BLUETOOTH_DEBUG    //��������
//   54 //#define SD_DEBUG            //SD������
//   55 //#define MOTOR_DEBUG           //�������      
//   56 //#define SERVO_DEBUG           //�������
//   57 //#define QUAD_DEBUG            //����������
//   58 //#define VIRTURL_DEBUG         //����ʾ��������
//   59 
//   60 
//   61 /************************************************************/
//   62 //#define ERROR_PIC
//   63 
//   64 //=================================������================================
//   65 //���ŷ��䣺
//   66 //PORT     FUNCTION
//   67 //  A0     TCLK
//   68 //  A1     TDI
//   69 //  A2     TDO
//   70 //  A3     TMS
//   71 //  A8     ������FTM1_QD_PHA
//   72 //  A9     ������FTM1_QD_PHB
//   73 //  A10    ������FTM2_QD_PHA
//   74 //  A11    ������FTM2_QD_PHB
//   75 //  A12    ���FTM1_CH0
//   76 //  A25    SCCB_SDA
//   77 //  A26    SCCB_SCL
//   78 //  B0~B7  ����ͷ����
//   79 //  B9     PCLK
//   80 //  B16    UART0_RX
//   81 //  B17    UART0_TX
//   82 //  C8     HREF
//   83 //  C16    OLED_D0
//   84 //  C17    OLED_D1
//   85 //  C18    OLED_RST
//   86 //  C19    OLED_DC
//   87 //  D1     VSYNC
//   88 //  D4     ���FTM0_CH4����
//   89 //  D5     ���FTM0_CH5��
//   90 //  D6     ���FTM0_CH6����
//   91 //  D7     ���FTM0_CH7�ҷ�
//   92 //  E0~E5  ��ť�����İ��ϵ�����С��ť��
//   93 //  E6~E9  ���뿪ͷ
//   94 //  E26    ����ָʾ��
//   95 
//   96 #ifdef MAIN_PROGRAM
//   97 
//   98 #include "math.h"
//   99 #include "common.h"
//  100 #include "sysinit.h"
//  101 #include "gpio.h"
//  102 #include "light.h"
//  103 #include "uart.h"
//  104 #include "wdog.h"
//  105 #include "Pit.h"
//  106 #include "DMA.h"
//  107 #include "ImageGet.h"
//  108 #include "ImagePro.h"
//  109 #include "CameraSet.h"
//  110 #include "vectors.h"
//  111 #include "MK60N512VMD100.h"
//  112 #include "Ftm.h"
//  113 #include "RunControl.h"
//  114 #include "VirtualScope.h"
//  115 
//  116 void main(void)
//  117 {
//  118     DisableInterrupts;                                    //�ر������ж�
//  119     
//  120     gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
//  121     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
//  122     uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
//  123     pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
//  124     //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
//  125     
//  126     MotorInit();          //��ʼ�����
//  127     ServoInit();          // ��ʼ�����
//  128     //QuadInit();           //��ʼ��������
//  129     //OLEDInit();           //��ʼ��OLED
//  130     //CameraInit();         //��ʼ������ͷ
//  131     
//  132     while(!CameraInit())         //��ʼ������ͷ
//  133     {
//  134       uart_sendN(UART0, (uint8 *)"\nCamera Initial Failed!", 23);  
//  135     }
//  136     
//  137     //DMAͨ��0�� DMA����ԴΪPORTB�� DMAԴ��ַΪB0~B7, DMAĿ�ĵ�ַΪImgStore1����
//  138     while(!DMAInit(DMACH00, DMASOURCE_PORTB, CameraWidth, GPIOB_DIR_ADDR, (uint32)(ImgRaw[0])))
//  139     {
//  140       uart_sendN(UART0, (uint8 *)"\nDMA Initial Failed!", 20);     
//  141     }
//  142     
//  143     //��������ȼ����õ���ȷ���д���֤============================
//  144     //set_irq_priority(FIELD_IRQ, 2);
//  145     //set_irq_priority(LINE_IRQ, 1);
//  146     //set_irq_priority(DMA0_IRQ, 0);
//  147     
//  148     PORTD_ISFR = PORT_ISFR_ISF_MASK;       //�峡����PORT�ı�־λ
//  149     PORTC_ISFR = PORT_ISFR_ISF_MASK;       //��������PORT�ı�־λ
//  150     PORTB_ISFR = PORT_ISFR_ISF_MASK;       //��PCLK����PORT�ı�־λ
//  151     disable_irq(LINE_IRQ);                 //�����ж�IRQ
//  152     disable_irq(DMA0_IRQ);                 //��DMA��������ж�IRQ
//  153     disable_irq(FIELD_IRQ);                //�س��ж�IRQ
//  154     
//  155     EnableInterrupts;                                     //�������ж�
//  156 
//  157 
//  158     while(1)
//  159     {
//  160       ImageGet();        //ͼ���ȡ
//  161       //SpeedGet();        //�ٶȻ�ȡ
//  162              //ͼ����
//  163       
//  164       SportControl(ImagePro());    //�˶�����   
//  165       
//  166     }  // end of while(1)
//  167 }      // end of main()
//  168 #endif // end of MAIN_PROGRAM
//  169 
//  170 
//  171 
//  172 //==========================����ʱ�Ӳ���===========================
//  173 /*
//  174 ����ʱ�Ӳ��Գɹ���2014.10.09
//  175 ��myDAQ��PORTA10������Ƶ�ʾ��У�PIT���1msһ���жϣ����Ƶ��Ϊ500Hz
//  176 */
//  177 #ifdef CLOCK_DEBUG
//  178 
//  179 #include "common.h"
//  180 #include "sysinit.h"
//  181 #include "gpio.h"
//  182 #include "light.h"
//  183 #include "uart.h"
//  184 #include "wdog.h"
//  185 #include "Pit.h"
//  186 
//  187 void main(void)
//  188 {
//  189     DisableInterrupts;                                    //�ر������ж�
//  190     
//  191     gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
//  192     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
//  193     uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
//  194     pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
//  195     enable_pit_interrupt(PIT0);                         //��PIT1�ж�
//  196     
//  197     EnableInterrupts;                                     //�������ж�
//  198 
//  199     
//  200     
//  201     
//  202     while(1)
//  203     { 
//  204       
//  205       
//  206     }  // end of while(1) 
//  207 }      // end of main()
//  208 #endif // end of CLOCK_DEBUG
//  209 
//  210 
//  211 
//  212 
//  213 
//  214 
//  215 
//  216 
//  217 
//  218 
//  219 //=======================================�������ڲ���===========================
//  220 
//  221 //�������ڲ��Գɹ���2014.10.10
//  222 //ע��TX,RX��Ӧ�Ķ˿ڼ��ɣ�������ϵ�˿ӡ���׿���λ��
//  223 
//  224 
//  225 #ifdef  BLUETOOTH_DEBUG
//  226 
//  227 #include "common.h"
//  228 #include "sysinit.h"
//  229 #include "gpio.h"
//  230 #include "light.h"
//  231 #include "uart.h"
//  232 #include "wdog.h"
//  233 #include "Pit.h"
//  234 #include "DMA.h"
//  235 
//  236 volatile uint8 BUFF[11] = {0};
//  237 
//  238 
//  239 void main(void)
//  240 {/*
//  241     uint8 ch;
//  242     
//  243     uint8 first[] = {"\nDMA������ BUFF[10]={"};
//  244     uint8 last[] = {"10}"};
//  245     uint8 DMA_error[] = {"DMA��ʼ��ʧ��"};
//  246     uint8 helloworld[] = {"Hello World!"};
//  247    */ 
//  248     //float a1 = 60000;
//  249     //float a2 = 60000.3;
//  250     //float a3 = 
//  251     uint32 runcount;
//  252     DisableInterrupts;                                    //�ر������ж�
//  253     
//  254     gpio_init(PORTA,6,1,0);                              //ʱ��������ų�ʼ��
//  255     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
//  256     uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
//  257     //pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
//  258     //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
//  259     
//  260     EnableInterrupts;
//  261 
//  262 
//  263     while(1)
//  264     {
//  265       //if(uart_re1(UART0, &ch))//�˴�Ӧ��uart_re1�����еļ���������ȥ��
//  266       //{
//  267         runcount++;
//  268         if(runcount>=1000000)
//  269         {
//  270             light_change(PORTE, 26);//ָʾ�Ƶ�������״̬�л�
//  271             uart_sendN(UART0,(uint8*)"\nHello World!",13);
//  272             runcount=0;
//  273         }
//  274        //}// end of if���ճɹ�
//  275     }  // end of while(1) 
//  276 }      // end of main()
//  277 #endif // end of BLUETOOTH_DEBUG
//  278 
//  279 
//  280 
//  281 
//  282 
//  283 
//  284 
//  285 
//  286 
//  287 
//  288 
//  289 
//  290 
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
//  301 //============================DMA����=============================
//  302 /*
//  303 DMA���Գɹ���2014.10.10
//  304 �������ӣ�PTA8���ڲ�������������PTA7�ϵ�DMA��������3V3���ӵ�B0��B7�������ţ�
//  305           ���Ӻô����������ô��ڵ������ַ������ַ���MCU�ϣ��Ϳ��Է���BUFF�����������һ�����ر仯��
//  306 �ؼ����ã��ر�DREQʱ��DMA0���жϷ������в���Ҫ�ٴ�ERQ��
//  307           ��DREQʱ��DMA0���жϷ���������Ҫ�ֶ���ERQ.
//  308           DLAST���-10����������ѭ���鿴��
//  309           BITER��CITER�Լ�BUFF���ȶ����10��
//  310           PTA7��ΪDMA����Դ��GPIO���룬��������(Ĭ������Ϊ0)���½��ش���DMA��
//  311           PTB0~PTB7������Ϊ����ͷ�������룬�������衣
//  312           PTA8���GPIO�����
//  313 */
//  314 #ifdef DMA_DEBUG
//  315 
//  316 #include "common.h"
//  317 #include "sysinit.h"
//  318 #include "gpio.h"
//  319 #include "light.h"
//  320 #include "uart.h"
//  321 #include "wdog.h"
//  322 #include "Pit.h"
//  323 #include "DMA.h"
//  324 
//  325 uint8 BUFF[11] = {0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b};
//  326 
//  327 
//  328 void main(void)
//  329 {
//  330     uint8 ch, chh;
//  331     uint32 i;
//  332     uint8 first[] = {"\nDMA������ BUFF[10]={"};
//  333     uint8 last[] = {"10}"};
//  334     uint8 DMA_error[] = {"DMA��ʼ��ʧ��"};
//  335     
//  336     DisableInterrupts;                                    //�ر������ж�
//  337     
//  338     gpio_init(PORTA,6,1,0);                              //ʱ��������ų�ʼ��
//  339     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
//  340     uart_init(UART0, periph_clk_khz, 9600);             //���ڳ�ʼ��
//  341     //pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
//  342     //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
//  343     
//  344     
//  345     
//  346     //DMA�������� �� ������������ ����
//  347     DMAPORTInit();
//  348     
//  349     if(!DMAInit(DMACH00, DMASOURCE_PORTA, GPIOB_DIR_ADDR, (uint32)BUFF))
//  350     {
//  351       while(1)
//  352       {
//  353       uart_sendN(UART0, DMA_error, sizeof(DMA_error));     
//  354       }
//  355     }
//  356     
//  357     enable_DMA_irq(DMACH00);              //����DMAͨ��0��IRQ�ж�
//  358     
//  359     EnableInterrupts;                                     //�������ж�
//  360     
//  361     DMA_ERQ |= (1 << 0);                            //��DMAӲ������ʹ��
//  362 
//  363 
//  364     while(1)
//  365     {
//  366       if(uart_re1(UART0, &ch))            //�˴�Ӧ��uart_re1�����еļ���������ȥ��
//  367       {
//  368       gpio_reverse(PORTA, 8);
//  369       for(i=0;i<150000;i++)
//  370       {
//  371         asm("nop");  
//  372       }
//  373       gpio_reverse(PORTA, 8);
//  374       
//  375       uart_sendN(UART0, (uint8 *)"Hello World!", 12);
//  376       for(i = 0; i <= 10; i++)
//  377       {
//  378         chh = BUFF[i];
//  379         uart_send1(UART0, chh);
//  380       }
//  381   
//  382       
//  383 
//  384       
//  385       
//  386       
//  387       }// end of if���ճɹ�
//  388     }  // end of while(1) 
//  389 }      // end of main()
//  390 #endif // end of DMA_DEBUG
//  391 
//  392 
//  393 
//  394 
//  395 
//  396 //=======================���������ȡ����==============================
//  397 //GPIO����������Գɹ���2014.10.12
//  398 //1. �ò�����PA15Ϊ�������ţ�PA17��PC0Ϊ������ţ����ӵ�������ϵ������ƣ���
//  399 //   ��PA15��⵽�͵�ƽʱ��PA17��PC0����PA15��⵽�ߵ�ƽ���෴��
//  400 //2. ʵ�ʲ���ʱ���֣������ʹ�����������裨©����·��Ӱ�죩����GPIO����ģʽʱ��Ĭ�ϼ�⵽���ǵ͵�ƽ��
//  401 //   �Ҹ����������ⲿ�ø߻��õ�ʱ��������״̬��һֱ���ֵ���һ���ⲿ�ı䡣
//  402 //3. ʵ�ʲ���ʱ���֣����ʹ�����������裨©����·��Ӱ�죩����GPIO����ģʽʱ��Ĭ�ϼ�⵽���ǵ͵�ƽ��
//  403 //   ��������������ⲿ�øߺ�ѶŰ����õ���������״̬���Զ���Ϊ�͵�ƽ������һ������⣬��ȷ��������������á�
//  404 //   Ҳ����˵�����ⲿ����ʱ��GPIO��������������Ѹ�����״̬�õ͡�
//  405 //3. PORTPCR�Ĵ�������GPIO�Ĵ���ǰ���ó�MUX(1)�������ó�GPIOģʽ����ʱĬ��ΪGPIO���룩��
//  406 //4. GPIO�ķ������ֵ������ֵ�Ͱ������������д�����׶���
//  407 //                                                         --HJZ
//  408 #ifdef PINREAD_DEBUG
//  409 
//  410 #include "math.h"
//  411 #include "common.h"
//  412 #include "sysinit.h"
//  413 #include "gpio.h"
//  414 #include "light.h"
//  415 #include "uart.h"
//  416 #include "wdog.h"
//  417 #include "Pit.h"
//  418 #include "DMA.h"
//  419 #include "ImageGet.h"
//  420 #include "ImagePro.h"
//  421 #include "CameraSet.h"
//  422 #include "vectors.h"
//  423 #include "MK60N512VMD100.h"
//  424 
//  425 
//  426 
//  427 void main(void)
//  428 {	
//  429 	//��������GPIO�ڵ�ת��ʱ��
//  430 	SIM_SCGC5 = SIM_SCGC5_PORTA_MASK | SIM_SCGC5_PORTB_MASK | SIM_SCGC5_PORTC_MASK | SIM_SCGC5_PORTD_MASK | SIM_SCGC5_PORTE_MASK;
//  431 	
//  432         //��������PA15�ĳ�ʼ����GPIO���룬©����·����������
//  433         PORT_PCR_REG(PORTA_BASE_PTR, 15) |= ( 0
//  434                                   |  PORT_PCR_MUX(0x01) 
//  435                                   | PORT_PCR_PE_MASK 
//  436                                   | PORT_PCR_ODE_MASK
//  437                                   );
//  438         GPIO_PDDR_REG(PTA_BASE_PTR) |= (1 << 15);
//  439         GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 15);
//  440         GPIO_PDDR_REG(PTA_BASE_PTR) &= ~(1 << 15);
//  441 
//  442         //��������PA17��PC0�ĳ�ʼ����GPIO���
//  443 	PORTA_PCR17 |= (0 | PORT_PCR_MUX(1));         
//  444         PORTC_PCR0 |= (0 | PORT_PCR_MUX(1));
//  445         
//  446         GPIO_PDDR_REG(PTC_BASE_PTR) |= (1 << 0);
//  447         GPIO_PDOR_REG(PTC_BASE_PTR) &= ~(1 << 0);
//  448 	
//  449 	GPIO_PDDR_REG(PTA_BASE_PTR) |= (1 << 17);
//  450 	GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 17);   
//  451         
//  452 	for(;;)  
//  453 	{	//��⵽�ߵ�ƽ��PA17����PC0��   	
//  454 		if( GPIO_PDIR_REG(PTA_BASE_PTR) & (1 << 15) )
//  455 		{
//  456 		    GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 17);
//  457                     GPIO_PDOR_REG(PTC_BASE_PTR) |= (1 << 0);	
//  458 		}
//  459                 //��⵽�͵�ƽ��PA17��PC0��   
//  460 		else
//  461                 {		
//  462                     GPIO_PDOR_REG(PTC_BASE_PTR) &= ~(1 << 0);
//  463                     GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 17);		
//  464 		}	 
//  465 	}
//  466 	
//  467 }
//  468 
//  469 #endif // end of PINREAD_DEBUG
//  470 
//  471 
//  472 
//  473 
//  474 
//  475 
//  476 
//  477 
//  478 //=========================DAQ�ı��ز�׽����============================
//  479 #ifdef DAQ_DEBUG
//  480 
//  481 #include "MK60N512VMD100.h"
//  482 #include "gpio.h"
//  483 
//  484 void Delay(volatile uint16 time)
//  485 {
//  486     while(time)
//  487     {
//  488         time--;  
//  489     }
//  490 }
//  491 
//  492 
//  493 void main(void)
//  494 {
//  495   
//  496   SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK | SIM_SCGC5_PORTB_MASK | SIM_SCGC5_PORTC_MASK | SIM_SCGC5_PORTD_MASK | SIM_SCGC5_PORTE_MASK);
//  497   
//  498   gpio_init(PORTA, 14, 1, 1);
//  499   gpio_init(PORTA, 15, 1, 1);
//  500   //PORTA_PCR15 |= (0 | PORT_PCR_MUX(1));
//  501   
//  502   
//  503   //PORTA_PCR14 |= PORT_PCR_DSE_MASK;
//  504  //PORTA_PCR15 |= PORT_PCR_DSE_MASK;
//  505   
//  506   
//  507 
//  508   GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 14); 
//  509   Delay(1000);
//  510   
//  511   GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 15); 
//  512   Delay(1000);
//  513   
//  514   GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 14);   
//  515   Delay(1000);
//  516   
//  517   GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 15);
//  518   Delay(1000);
//  519   
//  520     GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 14); 
//  521   Delay(1000);
//  522   
//  523   GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 15); 
//  524   Delay(1000);
//  525   
//  526   GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 14);   
//  527   Delay(1000);
//  528   
//  529   GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 15);
//  530   Delay(1000);
//  531 
//  532   
//  533     GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 14); 
//  534   Delay(1000);
//  535   
//  536   GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 15); 
//  537   Delay(1000);
//  538   
//  539   GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 14);   
//  540   Delay(1000);
//  541   
//  542   GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 15);
//  543   Delay(1000);
//  544 
//  545 
//  546   
//  547   while(1) ; 
//  548 
//  549 }
//  550 
//  551 #endif // end of DAQ_DEBUG
//  552 
//  553 
//  554 
//  555 //=======================��������������==================================
//  556 #ifdef BT_SET
//  557 
//  558 #include "sysinit.h"
//  559 #include "common.h"
//  560 #include "gpio.h"
//  561 #include "uart.h"
//  562 #include "light.h"
//  563 
//  564 void main(void)
//  565 {
//  566     //uint8 cmd[] = {"AT+BAUD8\r"};
//  567     uint8 cmd[] = {"\nHello World!"};
//  568     uint32 runcount = 0;
//  569     DisableInterrupts;                                    //�ر������ж�
//  570     
//  571     gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
//  572     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
//  573     uart_init(UART0, periph_clk_khz, 9600);             //���ڳ�ʼ��
//  574 
//  575     EnableInterrupts;
//  576     while(1)
//  577     {
//  578 
//  579         runcount++;
//  580         if(runcount>=1000000)
//  581         {
//  582             light_change(PORTE, 26);//ָʾ�Ƶ�������״̬�л�
//  583             uart_sendN(UART0, cmd, sizeof(cmd));
//  584             runcount=0;
//  585         }
//  586       
//  587     }
//  588 
//  589 
//  590 
//  591 } // end of main
//  592 
//  593 #endif // end of BT_SET
//  594 
//  595 
//  596 
//  597 
//  598 
//  599 
//  600 
//  601 //========================OV7725����ͷ����================================
//  602 #ifdef CAMERA_DEBUG_7725
//  603 
//  604 #include "math.h"
//  605 #include "common.h"
//  606 #include "sysinit.h"
//  607 #include "gpio.h"
//  608 #include "light.h"
//  609 #include "uart.h"
//  610 #include "wdog.h"
//  611 #include "Pit.h"
//  612 #include "DMA.h"
//  613 #include "ImageGet.h"
//  614 #include "ImagePro.h"
//  615 #include "CameraSet.h"
//  616 #include "vectors.h"
//  617 #include "MK60N512VMD100.h"
//  618 
//  619 void main(void)
//  620 {
//  621     DisableInterrupts;                                    //�ر������ж�
//  622     
//  623     gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
//  624     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
//  625     uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
//  626     pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
//  627     //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
//  628 
//  629     while(!CameraInit())         //��ʼ������ͷ
//  630     {
//  631       uart_sendN(UART0, (uint8 *)"\nCamera Initial Failed!", 23);  
//  632     }
//  633     
//  634     while(!DMAInit(DMACH00, DMASOURCE_PORTA, CameraDMACount, GPIOB_DIR_ADDR, (uint32)ImgStore))
//  635     {
//  636       uart_sendN(UART0, (uint8 *)"\nDMA Initial Failed!", 20);     
//  637     }
//  638     
//  639     //��ֹӲ������ERQ
//  640     DMA_ERQ &= ~(1 << 0);
//  641     //��PTA�ж�
//  642     disable_irq(PORTA_IRQ);
//  643     //��DMAINT��־λ
//  644     DMA_INT |= (1 << 0);
//  645     //��DMA��IRQ
//  646     enable_irq(DMA0_IRQ);
//  647 
//  648     EnableInterrupts;                                     //�������ж�
//  649     while(1)
//  650     {
//  651       ImageGet();        //ͼ���ȡ
//  652       ImagePro();        //ͼ����
//  653       //SendImg();  
//  654       
//  655     }  // end of while(1)
//  656 }      // end of main()
//  657 
//  658 
//  659 
//  660 #endif  //end of CAMERA_DEBUG_7725
//  661 
//  662 
//  663 
//  664 
//  665 
//  666 
//  667 
//  668 
//  669 
//  670 //==========================OV7620����ͷ����==================================
//  671 //���ŷ��䣺
//  672 //PORT     FUNCTION
//  673 //  A0     TCLK
//  674 //  A1     TDI
//  675 //  A2     TDO
//  676 //  A3     TMS
//  677 //  A8     ������FTM1_QD_PHA
//  678 //  A9     ������FTM1_QD_PHB
//  679 //  A10    ������FTM2_QD_PHA
//  680 //  A11    ������FTM2_QD_PHB
//  681 //  A12    ���FTM1_CH0
//  682 //  A25    SCCB_SDA
//  683 //  A26    SCCB_SCL
//  684 //  B0~B7  ����ͷ����
//  685 //  B9     PCLK
//  686 //  B16    UART0_RX
//  687 //  B17    UART0_TX
//  688 //  C8     HREF
//  689 //  C16    OLED_D0
//  690 //  C17    OLED_D1
//  691 //  C18    OLED_RST
//  692 //  C19    OLED_DC
//  693 //  D1     VSYNC
//  694 //  D4     ���FTM0_CH4����
//  695 //  D5     ���FTM0_CH5��
//  696 //  D6     ���FTM0_CH6����
//  697 //  D7     ���FTM0_CH7�ҷ�
//  698 //  E0~E5  ��ť�����İ��ϵ�����С��ť��
//  699 //  E6~E9  ���뿪ͷ
//  700 //  E26    ����ָʾ��
//  701 
//  702 #ifdef CAMERA_DEBUG_7620
//  703 
//  704 #include "math.h"
//  705 #include "common.h"
//  706 #include "sysinit.h"
//  707 #include "gpio.h"
//  708 #include "light.h"
//  709 #include "uart.h"
//  710 #include "wdog.h"
//  711 #include "Pit.h"
//  712 #include "DMA.h"
//  713 #include "ImageGet.h"
//  714 #include "ImagePro.h"
//  715 #include "CameraSet.h"
//  716 #include "vectors.h"
//  717 #include "MK60N512VMD100.h"
//  718 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  719 void main(void)
//  720 {
main:
        PUSH     {R7,LR}
//  721     DisableInterrupts;                                    //�ر������ж�
        CPSID i         
//  722     
//  723     gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+10
        LDR.N    R0,??main_0      ;; 0x400ff000
        BL       gpio_init
//  724     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
        MOVS     R2,#+0
        MOVS     R1,#+26
        LDR.N    R0,??main_0+0x4  ;; 0x400ff100
        BL       light_init
//  725     uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
        MOVS     R2,#+115200
        LDR.N    R0,??main_0+0x8
        LDR      R1,[R0, #+0]
        LDR.N    R0,??main_0+0xC  ;; 0x4006a000
        BL       uart_init
//  726     pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
        LDR.N    R1,??main_0+0x10  ;; 0x124f8
        MOVS     R0,#+0
        BL       pit_init
        B.N      ??main_1
//  727     //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
//  728 
//  729     while(!CameraInit())         //��ʼ������ͷ
//  730     {
//  731       uart_sendN(UART0, (uint8 *)"\nCamera Initial Failed!", 23);  
??main_2:
        MOVS     R2,#+23
        LDR.N    R1,??main_0+0x14
        LDR.N    R0,??main_0+0xC  ;; 0x4006a000
        BL       uart_sendN
//  732     }
??main_1:
        BL       CameraInit
        CMP      R0,#+0
        BEQ.N    ??main_2
//  733     
//  734     //DMAͨ��0�� DMA����ԴΪPORTB�� DMAԴ��ַΪB0~B7, DMAĿ�ĵ�ַΪImgStore1����
//  735     while(!DMAInit(DMACH00, DMASOURCE_PORTB, CameraWidth, GPIOB_DIR_ADDR, (uint32)(ImgRaw[0])))
??main_3:
        LDR.N    R0,??main_0+0x18
        STR      R0,[SP, #+0]
        LDR.N    R3,??main_0+0x1C  ;; 0x400ff050
        MOV      R2,#+320
        MOVS     R1,#+50
        MOVS     R0,#+0
        BL       DMAInit
        CMP      R0,#+0
        BNE.N    ??main_4
//  736     {
//  737       uart_sendN(UART0, (uint8 *)"\nDMA Initial Failed!", 20);     
        MOVS     R2,#+20
        LDR.N    R1,??main_0+0x20
        LDR.N    R0,??main_0+0xC  ;; 0x4006a000
        BL       uart_sendN
        B.N      ??main_3
//  738     }
//  739     
//  740     //��������ȼ����õ���ȷ���д���֤============================
//  741     //set_irq_priority(FIELD_IRQ, 2);
//  742     //set_irq_priority(LINE_IRQ, 1);
//  743     //set_irq_priority(DMA0_IRQ, 0);
//  744     
//  745     PORTD_ISFR = PORT_ISFR_ISF_MASK;       //�峡����PORT�ı�־λ
??main_4:
        LDR.N    R0,??main_0+0x24  ;; 0x4004c0a0
        MOVS     R1,#-1
        STR      R1,[R0, #+0]
//  746     PORTC_ISFR = PORT_ISFR_ISF_MASK;       //��������PORT�ı�־λ
        LDR.N    R0,??main_0+0x28  ;; 0x4004b0a0
        MOVS     R1,#-1
        STR      R1,[R0, #+0]
//  747     PORTB_ISFR = PORT_ISFR_ISF_MASK;       //��PCLK����PORT�ı�־λ
        LDR.N    R0,??main_0+0x2C  ;; 0x4004a0a0
        MOVS     R1,#-1
        STR      R1,[R0, #+0]
//  748     disable_irq(LINE_IRQ);                 //�����ж�IRQ
        MOVS     R0,#+89
        BL       disable_irq
//  749     disable_irq(DMA0_IRQ);                 //��DMA��������ж�IRQ
        MOVS     R0,#+0
        BL       disable_irq
//  750     disable_irq(FIELD_IRQ);                //�س��ж�IRQ
        MOVS     R0,#+90
        BL       disable_irq
//  751     
//  752     EnableInterrupts;                                     //�������ж�
        CPSIE i         
//  753     while(1)
//  754     {
//  755       ImageGet();        //ͼ���ȡ
??main_5:
        BL       ImageGet
//  756       ImageProSend();        //ͼ����
        BL       ImageProSend
        B.N      ??main_5
        DATA
??main_0:
        DC32     0x400ff000
        DC32     0x400ff100
        DC32     periph_clk_khz
        DC32     0x4006a000
        DC32     0x124f8
        DC32     `?<Constant "\\nCamera Initial Failed!">`
        DC32     ImgRaw
        DC32     0x400ff050
        DC32     `?<Constant "\\nDMA Initial Failed!">`
        DC32     0x4004c0a0
        DC32     0x4004b0a0
        DC32     0x4004a0a0
//  757       //SendImg();  
//  758       
//  759     }  // end of while(1)
//  760 }      // end of main()

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nCamera Initial Failed!">`:
        DATA
        DC8 "\012Camera Initial Failed!"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\nDMA Initial Failed!">`:
        DATA
        DC8 "\012DMA Initial Failed!"
        DC8 0, 0, 0

        END
//  761 
//  762 
//  763 
//  764 #endif // end of CAMERA_DEBUG_7620
//  765 
//  766 
//  767 
//  768 //==========================C�����﷨����==================================
//  769 #ifdef C_DEBUG
//  770 
//  771 #include "common.h"
//  772 #include "sysinit.h"
//  773 #include "vectors.h"
//  774 #include "MK60N512VMD100.h"
//  775 #include "math.h"
//  776 
//  777 void main(void)
//  778 {
//  779     uint8 i, j, k;
//  780     uint8 x, y;
//  781     uint8 temp1, temp2, temp3, temp4, temp5, temp6, temp7;
//  782     int8 x1;
//  783     int8 x2;
//  784     int16 x3;
//  785    
//  786     
//  787     i = 200;
//  788     j = 100;
//  789     k = 250;
//  790     if((i + j) > k)
//  791     {
//  792       temp1 = 1;  
//  793     }
//  794     else
//  795     {
//  796       temp1 = 0;  
//  797     }
//  798     
//  799     if((j - i) < 0)
//  800     {
//  801       temp2 = 1; 
//  802     }
//  803     else
//  804     {
//  805       temp2 = 0;  
//  806     }
//  807     
//  808     x = i + j;
//  809     if(x > k)
//  810     {
//  811       temp3 = 1;
//  812     }
//  813     else
//  814     {
//  815       temp3 = 0;
//  816     }
//  817     
//  818     y = j - i;
//  819     if(y < 0)
//  820     {
//  821       temp4 = 1;
//  822     }
//  823     else
//  824     {
//  825       temp4 = 0;  
//  826     }
//  827     
//  828     
//  829     
//  830     x1 = (int8)(j - i);
//  831     if(x1 < 0)
//  832     {
//  833       temp5 = 1;
//  834     }
//  835     else
//  836     {
//  837       temp5 = 0;  
//  838     } 
//  839     
//  840     x2 = -1;
//  841     if(x2 < 0)
//  842       temp6 = 1;
//  843     else
//  844       temp6 = 0;
//  845     
//  846     x3 = -1;
//  847     if(x3 < 0)
//  848       temp7 = 1;
//  849     else
//  850       temp7 = 0;    
//  851    
//  852     
//  853     while(1)
//  854     {
//  855     }
//  856 }
//  857 
//  858 #endif // end of C_DEBUG
//  859 //==========================================================================
//  860 
//  861 
//  862 
//  863 
//  864 
//  865 
//  866 //==============================SD������====================================
//  867 #ifdef SD_DEBUG
//  868 
//  869 #include "math.h"
//  870 #include "common.h"
//  871 #include "sysinit.h"
//  872 #include "gpio.h"
//  873 #include "light.h"
//  874 #include "uart.h"
//  875 #include "wdog.h"
//  876 #include "Pit.h"
//  877 #include "DMA.h"
//  878 #include "ImageGet.h"
//  879 #include "ImagePro.h"
//  880 #include "CameraSet.h"
//  881 #include "vectors.h"
//  882 #include "MK60N512VMD100.h"
//  883 
//  884 #include "diskio.h"
//  885 #include "ff.h"
//  886 #include "ffconf.h"
//  887 #include "integer.h"
//  888 #include "myprintp.h"
//  889 #include "sd_driver.h"
//  890 #include "spi.h"
//  891 #include "SD.h"
//  892 
//  893 #include "ctype.h"
//  894 #include "stdarg.h"
//  895 #include "ycheck.h"
//  896 #include "yvals.h"
//  897 
//  898 
//  899 
//  900 struct WSNSTATE  //??,???????
//  901 {
//  902 unsigned diskok:1; //???????????????BIT0    0:??????????   1:???????
//  903 unsigned fileok:1; //?????????BIT1                0:??????????? 1:??????
//  904 unsigned record:1; //
//  905 unsigned position:1; //
//  906 };
//  907 
//  908 volatile struct WSNSTATE state; //????
//  909 FATFS fs;            // Work area (file system object) for logical drive
//  910 FRESULT res;         // FatFs function common result code
//  911 UINT br,bw;         // File Write count
//  912 
//  913 FIL testdata;  //???????
//  914 FILINFO* sfil;
//  915 
//  916 unsigned char filebuff[720]={0}; //????
//  917 volatile unsigned int filebuffoffset=0;
//  918 unsigned char read_buff[512];
//  919 unsigned char receivebuff[512];
//  920 unsigned char test_buff[64];
//  921 
//  922 void init_disk_fatfs(void)   //??????????,???state.diskok==1;
//  923 {
//  924 	if(state.diskok==0)  //???????? 
//  925 	{
//  926 		if(disk_initialize(0))
//  927 		{
//  928 			state.diskok=0;
//  929 		}
//  930 		else
//  931 		{	
//  932 			res = f_mount(0,&fs);      // ?????????for logical drive 0
//  933 //			SCI0_putchar(res);
//  934 			state.diskok=1;
//  935 		}
//  936 	}
//  937 }
//  938 
//  939 void uart0_send1 (int8 ch)
//  940 {
//  941     //�ȴ����ͻ�������
//  942     while(!(UART_S1_REG(UART0) & UART_S1_TDRE_MASK));
//  943     //��������
//  944     UART_D_REG(UART0) = (int8)ch;
//  945 }
//  946 
//  947 
//  948 void main(void)
//  949 {
//  950     unsigned char r;
//  951     unsigned int i,n;
//  952     unsigned char kkk;
//  953     signed char namebuf[7];
//  954     unsigned char tmp0,tmp1;
//  955     FRESULT rc; 
//  956     
//  957     PRINT_T Print;
//  958     
//  959     uart_init(UART0, periph_clk_khz, 115200);
//  960     Print.m_printf = uart0_send1;	
//  961     Print_Init(&Print);
//  962     
//  963     SPI_Configuration();
//  964     printp("\nUartInit is ok!\n");
//  965    
//  966     
//  967     init_disk_fatfs();
//  968     if(state.diskok)printp("\ninit_disk is ok!\n");
//  969  
//  970     //EnableInterrupts;
//  971     for(i=0;i<=256;i++)
//  972     {
//  973         filebuffoffset++;
//  974         filebuff[i]='s';
//  975     }
//  976     
//  977         rc =f_open(&testdata,"0:/data1.txt",FA_CREATE_ALWAYS|FA_WRITE);
//  978      if(FR_OK == rc)printp("\nf_open is ok\n");
//  979     
//  980     rc = f_write(&testdata,filebuff,filebuffoffset,&bw);
//  981     if(FR_OK == rc)printp("\nf_write is ok!\n");
//  982     rc = f_close(&testdata);  
//  983     if(FR_OK == rc)
//  984     printp("\ncreat single file is ok\n");
//  985     printp("%dbytes",f_size(&testdata));
//  986   
//  987   while(1)
//  988   {
//  989     
//  990     
//  991   }    // end of while(1)  
//  992 }      // end of main()
//  993 #endif // end of SD_DEBUG
//  994 //==========================================================================
//  995 
//  996 
//  997 
//  998 
//  999 
// 1000 //==========================�������==================================
// 1001 //���ŷ��䣺
// 1002 //PORT     FUNCTION
// 1003 //  A0     TCLK
// 1004 //  A1     TDI
// 1005 //  A2     TDO
// 1006 //  A3     TMS
// 1007 //  A8     ������FTM1_QD_PHA
// 1008 //  A9     ������FTM1_QD_PHB
// 1009 //  A10    ������FTM2_QD_PHA
// 1010 //  A11    ������FTM2_QD_PHB
// 1011 //  A12    ���FTM1_CH0
// 1012 //  A25    SCCB_SDA
// 1013 //  A26    SCCB_SCL
// 1014 //  B0~B7  ����ͷ����
// 1015 //  B9     PCLK
// 1016 //  B16    UART0_RX
// 1017 //  B17    UART0_TX
// 1018 //  C8     HREF
// 1019 //  C16    OLED_D0
// 1020 //  C17    OLED_D1
// 1021 //  C18    OLED_RST
// 1022 //  C19    OLED_DC
// 1023 //  D1     VSYNC
// 1024 //  D4     ���FTM0_CH4����
// 1025 //  D5     ���FTM0_CH5��
// 1026 //  D6     ���FTM0_CH6����
// 1027 //  D7     ���FTM0_CH7�ҷ�
// 1028 //  E0~E5  ��ť�����İ��ϵ�����С��ť��
// 1029 //  E6~E9  ���뿪ͷ
// 1030 //  E26    ����ָʾ��
// 1031 
// 1032 #ifdef MOTOR_DEBUG
// 1033 
// 1034 #include "math.h"
// 1035 #include "common.h"
// 1036 #include "sysinit.h"
// 1037 #include "gpio.h"
// 1038 #include "light.h"
// 1039 #include "uart.h"
// 1040 #include "wdog.h"
// 1041 #include "Pit.h"
// 1042 #include "DMA.h"
// 1043 #include "ImageGet.h"
// 1044 #include "ImagePro.h"
// 1045 #include "CameraSet.h"
// 1046 #include "vectors.h"
// 1047 #include "MK60N512VMD100.h"
// 1048 #include "Ftm.h"
// 1049 
// 1050 void main(void)
// 1051 {
// 1052     DisableInterrupts;                                    //�ر������ж�
// 1053     
// 1054     gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
// 1055     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
// 1056     uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
// 1057     pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
// 1058     //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
// 1059     
// 1060     EnableInterrupts;
// 1061     
// 1062     MotorInit();
// 1063     while(1)
// 1064     {
// 1065       uart_sendN(UART0, (uint8 *)"\nHello Motor!", 13);
// 1066     }  // end of while(1)   
// 1067 }      // end of main()
// 1068 #endif // end of MOTOR_DEBUG
// 1069 
// 1070 
// 1071 
// 1072 
// 1073 //==========================�������==================================
// 1074 //���ŷ��䣺
// 1075 //PORT     FUNCTION
// 1076 //  A0     TCLK
// 1077 //  A1     TDI
// 1078 //  A2     TDO
// 1079 //  A3     TMS
// 1080 //  A8     ������FTM1_QD_PHA
// 1081 //  A9     ������FTM1_QD_PHB
// 1082 //  A10    ������FTM2_QD_PHA
// 1083 //  A11    ������FTM2_QD_PHB
// 1084 //  A12    ���FTM1_CH0
// 1085 //  A25    SCCB_SDA
// 1086 //  A26    SCCB_SCL
// 1087 //  B0~B7  ����ͷ����
// 1088 //  B9     PCLK
// 1089 //  B16    UART0_RX
// 1090 //  B17    UART0_TX
// 1091 //  C8     HREF
// 1092 //  C16    OLED_D0
// 1093 //  C17    OLED_D1
// 1094 //  C18    OLED_RST
// 1095 //  C19    OLED_DC
// 1096 //  D1     VSYNC
// 1097 //  D4     ���FTM0_CH4����
// 1098 //  D5     ���FTM0_CH5��
// 1099 //  D6     ���FTM0_CH6����
// 1100 //  D7     ���FTM0_CH7�ҷ�
// 1101 //  E0~E5  ��ť�����İ��ϵ�����С��ť��
// 1102 //  E6~E9  ���뿪ͷ
// 1103 //  E26    ����ָʾ��
// 1104 
// 1105 #ifdef SERVO_DEBUG
// 1106 
// 1107 #include "math.h"
// 1108 #include "common.h"
// 1109 #include "sysinit.h"
// 1110 #include "gpio.h"
// 1111 #include "light.h"
// 1112 #include "uart.h"
// 1113 #include "wdog.h"
// 1114 #include "Pit.h"
// 1115 #include "DMA.h"
// 1116 #include "ImageGet.h"
// 1117 #include "ImagePro.h"
// 1118 #include "CameraSet.h"
// 1119 #include "vectors.h"
// 1120 #include "MK60N512VMD100.h"
// 1121 #include "Ftm.h"
// 1122 
// 1123 
// 1124 void main(void)
// 1125 {
// 1126     int i, j;
// 1127     DisableInterrupts;                                    //�ر������ж�
// 1128     
// 1129     gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
// 1130     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
// 1131     uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
// 1132     pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
// 1133     //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
// 1134     
// 1135     EnableInterrupts;
// 1136     
// 1137     ServoInit();
// 1138     while(1)
// 1139     {
// 1140       FTM1_C0V = 1828;
// 1141       for(i = 0; i < 10000; i++)
// 1142         for(j = 0; j < 10000; j++)
// 1143         {}
// 1144       FTM1_C0V = 1810;
// 1145       for(i = 0; i < 10000; i++)
// 1146         for(j = 0; j < 10000; j++)
// 1147         {}
// 1148       FTM1_C0V = 2039;
// 1149       for(i = 0; i < 10000; i++)
// 1150         for(j = 0; j < 10000; j++)
// 1151         {}
// 1152       uart_sendN(UART0, (uint8 *)"\nHello Servo!", 13);
// 1153     }  // end of while(1)   
// 1154 }      // end of main()
// 1155 #endif // end of SERVO_DEBUG
// 1156   
// 1157  
// 1158   
// 1159 //==========================����ʾ��������===========================
// 1160 #ifdef VIRTURL_DEBUG
// 1161 
// 1162 #include "common.h"
// 1163 #include "sysinit.h"
// 1164 #include "gpio.h"
// 1165 #include "light.h"
// 1166 #include "uart.h"
// 1167 #include "wdog.h"
// 1168 #include "Pit.h"  
// 1169 #include "VirtualScope.h"
// 1170 
// 1171 
// 1172 void main(void)
// 1173 {
// 1174     DisableInterrupts;                                    //�ر������ж�
// 1175     
// 1176     gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
// 1177     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
// 1178     uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
// 1179     pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
// 1180     //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
// 1181     
// 1182     EnableInterrupts;
// 1183     
// 1184     VirtualOutData[0] = 0;
// 1185     VirtualOutData[1] = 0;
// 1186     VirtualOutData[2] = 10000;
// 1187     VirtualOutData[3] = -10000;
// 1188     while(1)
// 1189     {
// 1190       VirtualOutPut_Data();     
// 1191     }  // end of while(1) 
// 1192 }      // end of main
// 1193 #endif // end of VIRTURL_DEBUG
// 1194 
// 1195 
// 1196 
// 1197 
// 1198 
// 1199 
// 1200 
// 1201 
// 1202 
// 1203 
// 1204 
// 1205 
// 1206 
// 1207 
// 1208 
// 1209 
// 1210 
// 1211 //��׼C�ļ�ͷ
// 1212 
// 1213 /******************************************************************************/
// 1214 /*******************************************************************************
// 1215   �ļ�����ͼ��������ļ�ImagePro.c
// 1216   ��  �ܣ�ͼ����
// 1217   ��  �ڣ�2014.10.09
// 1218   ��  �ߣ�HJZ
// 1219   ��  ע��
// 1220 *******************************************************************************/
// 1221 /******************************************************************************/
// 1222 
// 1223 
// 1224 //��׼H�ļ�ͷ
// 1225 
// 1226 /******************************************************************************/
// 1227 /*******************************************************************************
// 1228   �ļ�����ͼ�������ͷ�ļ�IamgePro.h
// 1229   ��  �ܣ�ͼ����
// 1230   ��  �ڣ�2014.10.09
// 1231   ��  �ߣ�HJZ
// 1232   ��  ע��
// 1233 *******************************************************************************/
// 1234 /******************************************************************************/
// 1235 //1. ͷ�ļ�
// 1236 //2. �궨��
// 1237 //3. �������Ͷ���
// 1238 //4. ��������
// 1239 //5. ��������
// 1240 
// 1241 
// 1242 //��׼����ͷ
// 1243 
// 1244 //======================================================================
// 1245 //��������
// 1246 //��  �ܣ�
// 1247 //��  ����
// 1248 //��  �أ�
// 1249 //Ӱ  �죺
// 1250 //˵  ����
// 1251 //      
// 1252 //             
// 1253 //======================================================================
// 
//  48 bytes in section .rodata
// 204 bytes in section .text
// 
// 204 bytes of CODE  memory
//  48 bytes of CONST memory
//
//Errors: none
//Warnings: none
