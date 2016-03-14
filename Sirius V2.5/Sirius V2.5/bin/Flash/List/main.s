///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.1.6676/W32 for ARM       12/Mar/2016  23:02:57
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\Sirius V2.5\src\Sources\C\main.c
//    Command line =  
//        "E:\Sirius V2.5\src\Sources\C\main.c" -D IAR -D TWR_K60N512 -lCN
//        "E:\Sirius V2.5\bin\Flash\List\" -lB "E:\Sirius V2.5\bin\Flash\List\"
//        -o "E:\Sirius V2.5\bin\Flash\Obj\" --no_cse --no_unroll --no_inline
//        --no_code_motion --no_tbaa --no_clustering --no_scheduling --debug
//        --endian=little --cpu=Cortex-M4 -e --fpu=None --dlib_config
//        "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I "E:\Sirius
//        V2.5\src\Sources\H\" -I "E:\Sirius V2.5\src\Sources\H\Component_H\"
//        -I "E:\Sirius V2.5\src\Sources\H\Frame_H\" -I "E:\Sirius
//        V2.5\src\Sources\H\Function_H\" -I "E:\Sirius
//        V2.5\src\Sources\H\SD_H\" -Ol --use_c++_inline
//    List file    =  E:\Sirius V2.5\bin\Flash\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

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

// E:\Sirius V2.5\src\Sources\C\main.c
//    1 /******************************************************************************/
//    2 /*******************************************************************************
//    3 ���ļ��������㽭��ѧ���ܳ�Sirius������Main
//    4 ����  �ܡ���Run+Faster+Fly
//    5 ����  �ڡ���2014.10.09
//    6 ����  �ߡ���HJZ/LYX/YCR
//    7 ����  ע����
//    8 *******************************************************************************/
//    9 /******************************************************************************/
//   10 /*********************************
//   11 ��dev.env.��IAR EWARM 6.30.1.3142
//   12 ��Target  ��MK60-DN512-VLQ10
//   13 ��Crystal ��50.000  MHz
//   14 ��busclock��75.000  MHz
//   15 ��pllclock��150.000 MHz
//   16 *********************************/
//   17 
//   18 // Ӳ�������У�������������������OLED, ����ͷ
//   19 
//   20 /************************************************************/
//   21 //#define MAIN_PROGRAM    //���������
//   22 //#define PINREAD_DEBUG   //�����������
//   23 //#define CLOCK_DEBUG     //ʱ�����Ų���
//   24 //#define CAMERA_DEBUG_7725  //OV7725����ͷ����
//   25 #define CAMERA_DEBUG_7620    //OV7620����ͷ����
//   26 //#define C_DEBUG            //C�����﷨����
//   27 //#define DAQ_DEBUG          //DAQ����
//   28 //#define DMA_DEBUG          //DMA����
//   29 //#define BLUETOOTH_DEBUG    //��������
//   30 //#define MOTOR_DEBUG           //�������      
//   31 //#define SERVO_DEBUG           //�������
//   32 //#define QUAD_DEBUG            //����������
//   33 //#define VIRTURL_DEBUG         //����ʾ��������
//   34 
//   35 
//   36 /************************************************************/
//   37 //#define ERROR_PIC
//   38 
//   39 //=================================������================================
//   40 //���ŷ��䣺
//   41 //PORT     FUNCTION
//   42 //  A0     TCLK
//   43 //  A1     TDI
//   44 //  A2     TDO
//   45 //  A3     TMS
//   46 //  A8     ������FTM1_QD_PHA
//   47 //  A9     ������FTM1_QD_PHB
//   48 //  A10    ������FTM2_QD_PHA
//   49 //  A11    ������FTM2_QD_PHB
//   50 //  A12    ���FTM1_CH0
//   51 //  A25    SCCB_SDA
//   52 //  A26    SCCB_SCL
//   53 //  B0~B7  ����ͷ����
//   54 //  B9     PCLK
//   55 //  B16    UART0_RX
//   56 //  B17    UART0_TX
//   57 //  C8     HREF
//   58 //  C16    OLED_D0
//   59 //  C17    OLED_D1
//   60 //  C18    OLED_RST
//   61 //  C19    OLED_DC
//   62 //  D1     VSYNC
//   63 //  D4     ���FTM0_CH4����
//   64 //  D5     ���FTM0_CH5��
//   65 //  D6     ���FTM0_CH6����
//   66 //  D7     ���FTM0_CH7�ҷ�
//   67 //  E0~E5  ��ť�����İ��ϵ�����С��ť��
//   68 //  E6~E9  ���뿪ͷ
//   69 //  E26    ����ָʾ��
//   70 
//   71 #ifdef MAIN_PROGRAM
//   72 
//   73 #include "math.h"
//   74 #include "common.h"
//   75 #include "sysinit.h"
//   76 #include "gpio.h"
//   77 #include "light.h"
//   78 #include "uart.h"
//   79 #include "wdog.h"
//   80 #include "Pit.h"
//   81 #include "DMA.h"
//   82 #include "ImageGet.h"
//   83 #include "ImagePro.h"
//   84 #include "CameraSet.h"
//   85 #include "vectors.h"
//   86 #include "MK60N512VMD100.h"
//   87 #include "Ftm.h"
//   88 #include "RunControl.h"
//   89 #include "VirtualScope.h"
//   90 
//   91 void main(void)
//   92 {
//   93     DisableInterrupts;                                    //�ر������ж�
//   94     
//   95     gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
//   96     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
//   97     uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
//   98     pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
//   99     //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
//  100     
//  101     MotorInit();          //��ʼ�����
//  102     ServoInit();          // ��ʼ�����
//  103     //QuadInit();           //��ʼ��������
//  104     //OLEDInit();           //��ʼ��OLED
//  105     //CameraInit();         //��ʼ������ͷ
//  106     
//  107     while(!CameraInit())         //��ʼ������ͷ
//  108     {
//  109       uart_sendN(UART0, (uint8 *)"\nCamera Initial Failed!", 23);  
//  110     }
//  111     
//  112     //DMAͨ��0�� DMA����ԴΪPORTB�� DMAԴ��ַΪB0~B7, DMAĿ�ĵ�ַΪImgRaw����
//  113     while(!DMAInit(DMACH00, DMASOURCE_PORTB, CameraWidth, GPIOB_DIR_ADDR, (uint32)(ImgRaw[0])))
//  114     {
//  115       uart_sendN(UART0, (uint8 *)"\nDMA Initial Failed!", 20);     
//  116     }
//  117     
//  118     //��������ȼ����õ���ȷ���д���֤============================
//  119     //set_irq_priority(FIELD_IRQ, 2);
//  120     //set_irq_priority(LINE_IRQ, 1);
//  121     //set_irq_priority(DMA0_IRQ, 0);
//  122     
//  123     PORTD_ISFR = PORT_ISFR_ISF_MASK;       //�峡����PORT�ı�־λ
//  124     PORTC_ISFR = PORT_ISFR_ISF_MASK;       //��������PORT�ı�־λ
//  125     PORTB_ISFR = PORT_ISFR_ISF_MASK;       //��PCLK����PORT�ı�־λ
//  126     disable_irq(LINE_IRQ);                 //�����ж�IRQ
//  127     disable_irq(DMA0_IRQ);                 //��DMA��������ж�IRQ
//  128     disable_irq(FIELD_IRQ);                //�س��ж�IRQ
//  129     
//  130     EnableInterrupts;                                     //�������ж�
//  131 
//  132 
//  133     while(1)
//  134     {
//  135       ImageGet();        //ͼ���ȡ
//  136       //SpeedGet();        //�ٶȻ�ȡ
//  137              //ͼ����
//  138       
//  139       SportControl(ImagePro());    //�˶�����   
//  140       
//  141     }  // end of while(1)
//  142 }      // end of main()
//  143 #endif // end of MAIN_PROGRAM
//  144 
//  145 
//  146 
//  147 //==========================����ʱ�Ӳ���===========================
//  148 /*
//  149 ����ʱ�Ӳ��Գɹ���2014.10.09
//  150 ��myDAQ��PORTA10������Ƶ�ʾ��У�PIT���1msһ���жϣ����Ƶ��Ϊ500Hz
//  151 */
//  152 #ifdef CLOCK_DEBUG
//  153 
//  154 #include "common.h"
//  155 #include "sysinit.h"
//  156 #include "gpio.h"
//  157 #include "light.h"
//  158 #include "uart.h"
//  159 #include "wdog.h"
//  160 #include "Pit.h"
//  161 
//  162 void main(void)
//  163 {
//  164     DisableInterrupts;                                    //�ر������ж�
//  165     
//  166     gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
//  167     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
//  168     uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
//  169     pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
//  170     enable_pit_interrupt(PIT0);                         //��PIT1�ж�
//  171     
//  172     EnableInterrupts;                                     //�������ж�
//  173 
//  174     
//  175     
//  176     
//  177     while(1)
//  178     { 
//  179       
//  180       
//  181     }  // end of while(1) 
//  182 }      // end of main()
//  183 #endif // end of CLOCK_DEBUG
//  184 
//  185 
//  186 
//  187 
//  188 
//  189 
//  190 
//  191 
//  192 
//  193 
//  194 //=======================================�������ڲ���===========================
//  195 
//  196 //�������ڲ��Գɹ���2014.10.10
//  197 //ע��TX,RX��Ӧ�Ķ˿ڼ��ɣ�������ϵ�˿ӡ���׿���λ��
//  198 
//  199 
//  200 #ifdef  BLUETOOTH_DEBUG
//  201 
//  202 #include "common.h"
//  203 #include "sysinit.h"
//  204 #include "gpio.h"
//  205 #include "light.h"
//  206 #include "uart.h"
//  207 #include "wdog.h"
//  208 #include "Pit.h"
//  209 #include "DMA.h"
//  210 
//  211 volatile uint8 BUFF[11] = {0};
//  212 
//  213 
//  214 void main(void)
//  215 {/*
//  216     uint8 ch;
//  217     
//  218     uint8 first[] = {"\nDMA������ BUFF[10]={"};
//  219     uint8 last[] = {"10}"};
//  220     uint8 DMA_error[] = {"DMA��ʼ��ʧ��"};
//  221     uint8 helloworld[] = {"Hello World!"};
//  222    */ 
//  223     //float a1 = 60000;
//  224     //float a2 = 60000.3;
//  225     //float a3 = 
//  226     uint32 runcount;
//  227     DisableInterrupts;                                    //�ر������ж�
//  228     
//  229     gpio_init(PORTA,6,1,0);                              //ʱ��������ų�ʼ��
//  230     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
//  231     uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
//  232     //pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
//  233     //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
//  234     
//  235     EnableInterrupts;
//  236 
//  237 
//  238     while(1)
//  239     {
//  240       //if(uart_re1(UART0, &ch))//�˴�Ӧ��uart_re1�����еļ���������ȥ��
//  241       //{
//  242         runcount++;
//  243         if(runcount>=1000000)
//  244         {
//  245             light_change(PORTE, 26);//ָʾ�Ƶ�������״̬�л�
//  246             uart_sendN(UART0,(uint8*)"\nHello World!",13);
//  247             runcount=0;
//  248         }
//  249        //}// end of if���ճɹ�
//  250     }  // end of while(1) 
//  251 }      // end of main()
//  252 #endif // end of BLUETOOTH_DEBUG
//  253 
//  254 
//  255 
//  256 
//  257 
//  258 
//  259 
//  260 
//  261 
//  262 
//  263 
//  264 
//  265 
//  266 
//  267 
//  268 
//  269 
//  270 
//  271 
//  272 
//  273 
//  274 
//  275 
//  276 //============================DMA����=============================
//  277 #ifdef DMA_DEBUG
//  278 
//  279 #include "common.h"
//  280 #include "sysinit.h"
//  281 #include "gpio.h"
//  282 #include "light.h"
//  283 #include "uart.h"
//  284 #include "wdog.h"
//  285 #include "Pit.h"
//  286 #include "DMA.h"
//  287 
//  288 uint8 BUFF[11] = {0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b};
//  289 
//  290 
//  291 void main(void)
//  292 {
//  293     uint8 ch, chh;
//  294     uint32 i;
//  295     uint8 first[] = {"\nDMA������ BUFF[10]={"};
//  296     uint8 last[] = {"10}"};
//  297     uint8 DMA_error[] = {"DMA��ʼ��ʧ��"};
//  298     
//  299     DisableInterrupts;                                    //�ر������ж�
//  300     
//  301     gpio_init(PORTA,6,1,0);                              //ʱ��������ų�ʼ��
//  302     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
//  303     uart_init(UART0, periph_clk_khz, 9600);             //���ڳ�ʼ��
//  304     //pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
//  305     //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
//  306     
//  307     
//  308     
//  309     //DMA�������� �� ������������ ����
//  310     DMAPORTInit();
//  311     
//  312     if(!DMAInit(DMACH00, DMASOURCE_PORTA, GPIOB_DIR_ADDR, (uint32)BUFF))
//  313     {
//  314       while(1)
//  315       {
//  316       uart_sendN(UART0, DMA_error, sizeof(DMA_error));     
//  317       }
//  318     }
//  319     
//  320     enable_DMA_irq(DMACH00);              //����DMAͨ��0��IRQ�ж�
//  321     
//  322     EnableInterrupts;                                     //�������ж�
//  323     
//  324     DMA_ERQ |= (1 << 0);                            //��DMAӲ������ʹ��
//  325 
//  326 
//  327     while(1)
//  328     {
//  329       if(uart_re1(UART0, &ch))            //�˴�Ӧ��uart_re1�����еļ���������ȥ��
//  330       {
//  331       gpio_reverse(PORTA, 8);
//  332       for(i=0;i<150000;i++)
//  333       {
//  334         asm("nop");  
//  335       }
//  336       gpio_reverse(PORTA, 8);
//  337       
//  338       uart_sendN(UART0, (uint8 *)"Hello World!", 12);
//  339       for(i = 0; i <= 10; i++)
//  340       {
//  341         chh = BUFF[i];
//  342         uart_send1(UART0, chh);
//  343       }
//  344   
//  345       
//  346 
//  347       
//  348       
//  349       
//  350       }// end of if���ճɹ�
//  351     }  // end of while(1) 
//  352 }      // end of main()
//  353 #endif // end of DMA_DEBUG
//  354 
//  355 
//  356 
//  357 
//  358 
//  359 //=======================���������ȡ����==============================
//  360 #ifdef PINREAD_DEBUG
//  361 
//  362 #include "math.h"
//  363 #include "common.h"
//  364 #include "sysinit.h"
//  365 #include "gpio.h"
//  366 #include "light.h"
//  367 #include "uart.h"
//  368 #include "wdog.h"
//  369 #include "Pit.h"
//  370 #include "DMA.h"
//  371 #include "ImageGet.h"
//  372 #include "ImagePro.h"
//  373 #include "CameraSet.h"
//  374 #include "vectors.h"
//  375 #include "MK60N512VMD100.h"
//  376 
//  377 
//  378 
//  379 void main(void)
//  380 {	
//  381 	//��������GPIO�ڵ�ת��ʱ��
//  382 	SIM_SCGC5 = SIM_SCGC5_PORTA_MASK | SIM_SCGC5_PORTB_MASK | SIM_SCGC5_PORTC_MASK | SIM_SCGC5_PORTD_MASK | SIM_SCGC5_PORTE_MASK;
//  383 	
//  384         //��������PA15�ĳ�ʼ����GPIO���룬©����·����������
//  385         PORT_PCR_REG(PORTA_BASE_PTR, 15) |= ( 0
//  386                                   |  PORT_PCR_MUX(0x01) 
//  387                                   | PORT_PCR_PE_MASK 
//  388                                   | PORT_PCR_ODE_MASK
//  389                                   );
//  390         GPIO_PDDR_REG(PTA_BASE_PTR) |= (1 << 15);
//  391         GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 15);
//  392         GPIO_PDDR_REG(PTA_BASE_PTR) &= ~(1 << 15);
//  393 
//  394         //��������PA17��PC0�ĳ�ʼ����GPIO���
//  395 	PORTA_PCR17 |= (0 | PORT_PCR_MUX(1));         
//  396         PORTC_PCR0 |= (0 | PORT_PCR_MUX(1));
//  397         
//  398         GPIO_PDDR_REG(PTC_BASE_PTR) |= (1 << 0);
//  399         GPIO_PDOR_REG(PTC_BASE_PTR) &= ~(1 << 0);
//  400 	
//  401 	GPIO_PDDR_REG(PTA_BASE_PTR) |= (1 << 17);
//  402 	GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 17);   
//  403         
//  404 	for(;;)  
//  405 	{	//��⵽�ߵ�ƽ��PA17����PC0��   	
//  406 		if( GPIO_PDIR_REG(PTA_BASE_PTR) & (1 << 15) )
//  407 		{
//  408 		    GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 17);
//  409                     GPIO_PDOR_REG(PTC_BASE_PTR) |= (1 << 0);	
//  410 		}
//  411                 //��⵽�͵�ƽ��PA17��PC0��   
//  412 		else
//  413                 {		
//  414                     GPIO_PDOR_REG(PTC_BASE_PTR) &= ~(1 << 0);
//  415                     GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 17);		
//  416 		}	 
//  417 	}
//  418 	
//  419 }
//  420 
//  421 #endif // end of PINREAD_DEBUG
//  422 
//  423 
//  424 
//  425 
//  426 
//  427 
//  428 
//  429 
//  430 //=========================DAQ�ı��ز�׽����============================
//  431 #ifdef DAQ_DEBUG
//  432 
//  433 #include "MK60N512VMD100.h"
//  434 #include "gpio.h"
//  435 
//  436 void Delay(volatile uint16 time)
//  437 {
//  438     while(time)
//  439     {
//  440         time--;  
//  441     }
//  442 }
//  443 
//  444 
//  445 void main(void)
//  446 {
//  447   
//  448   SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK | SIM_SCGC5_PORTB_MASK | SIM_SCGC5_PORTC_MASK | SIM_SCGC5_PORTD_MASK | SIM_SCGC5_PORTE_MASK);
//  449   
//  450   gpio_init(PORTA, 14, 1, 1);
//  451   gpio_init(PORTA, 15, 1, 1);
//  452   //PORTA_PCR15 |= (0 | PORT_PCR_MUX(1));
//  453   
//  454   
//  455   //PORTA_PCR14 |= PORT_PCR_DSE_MASK;
//  456  //PORTA_PCR15 |= PORT_PCR_DSE_MASK;
//  457   
//  458   
//  459 
//  460   GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 14); 
//  461   Delay(1000);
//  462   
//  463   GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 15); 
//  464   Delay(1000);
//  465   
//  466   GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 14);   
//  467   Delay(1000);
//  468   
//  469   GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 15);
//  470   Delay(1000);
//  471   
//  472     GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 14); 
//  473   Delay(1000);
//  474   
//  475   GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 15); 
//  476   Delay(1000);
//  477   
//  478   GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 14);   
//  479   Delay(1000);
//  480   
//  481   GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 15);
//  482   Delay(1000);
//  483 
//  484   
//  485     GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 14); 
//  486   Delay(1000);
//  487   
//  488   GPIO_PDOR_REG(PTA_BASE_PTR) |= (1 << 15); 
//  489   Delay(1000);
//  490   
//  491   GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 14);   
//  492   Delay(1000);
//  493   
//  494   GPIO_PDOR_REG(PTA_BASE_PTR) &= ~(1 << 15);
//  495   Delay(1000);
//  496 
//  497 
//  498   
//  499   while(1) ; 
//  500 
//  501 }
//  502 
//  503 #endif // end of DAQ_DEBUG
//  504 
//  505 
//  506 
//  507 //==========================OV7620����ͷ����==================================
//  508 //���ŷ��䣺
//  509 //PORT     FUNCTION
//  510 //  A0     TCLK
//  511 //  A1     TDI
//  512 //  A2     TDO
//  513 //  A3     TMS
//  514 //  A8     ������FTM1_QD_PHA
//  515 //  A9     ������FTM1_QD_PHB
//  516 //  A10    ������FTM2_QD_PHA
//  517 //  A11    ������FTM2_QD_PHB
//  518 //  A12    ���FTM1_CH0
//  519 //  A25    SCCB_SDA
//  520 //  A26    SCCB_SCL
//  521 //  B0~B7  ����ͷ����
//  522 //  B9     PCLK
//  523 //  B16    UART0_RX
//  524 //  B17    UART0_TX
//  525 //  C8     HREF
//  526 //  C16    OLED_D0
//  527 //  C17    OLED_D1
//  528 //  C18    OLED_RST
//  529 //  C19    OLED_DC
//  530 //  D1     VSYNC
//  531 //  D4     ���FTM0_CH4����
//  532 //  D5     ���FTM0_CH5��
//  533 //  D6     ���FTM0_CH6����
//  534 //  D7     ���FTM0_CH7�ҷ�
//  535 //  E0~E5  ��ť�����İ��ϵ�����С��ť��
//  536 //  E6~E9  ���뿪ͷ
//  537 //  E26    ����ָʾ��
//  538 
//  539 #ifdef CAMERA_DEBUG_7620
//  540 
//  541 #include "math.h"
//  542 #include "common.h"
//  543 #include "sysinit.h"
//  544 #include "gpio.h"
//  545 #include "light.h"
//  546 #include "uart.h"
//  547 #include "wdog.h"
//  548 #include "Pit.h"
//  549 #include "DMA.h"
//  550 #include "ImageGet.h"
//  551 #include "ImagePro.h"
//  552 #include "CameraSet.h"
//  553 #include "vectors.h"
//  554 #include "MK60N512VMD100.h"
//  555 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  556 void main(void)
//  557 {
main:
        PUSH     {R7,LR}
//  558     DisableInterrupts;                                    //�ر������ж�
        CPSID i
//  559     
//  560     gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+10
        LDR.N    R0,??main_0      ;; 0x400ff000
        BL       gpio_init
//  561     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
        MOVS     R2,#+0
        MOVS     R1,#+26
        LDR.N    R0,??main_0+0x4  ;; 0x400ff100
        BL       light_init
//  562     uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
        MOVS     R2,#+115200
        LDR.N    R0,??main_0+0x8
        LDR      R1,[R0, #+0]
        LDR.N    R0,??main_0+0xC  ;; 0x4006a000
        BL       uart_init
//  563     pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
        LDR.N    R1,??main_0+0x10  ;; 0x124f8
        MOVS     R0,#+0
        BL       pit_init
        B.N      ??main_1
//  564     //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
//  565 
//  566     while(!CameraInit())         //��ʼ������ͷ
//  567     {
//  568       uart_sendN(UART0, (uint8 *)"\nCamera Initial Failed!", 23);  
??main_2:
        MOVS     R2,#+23
        LDR.N    R1,??main_0+0x14
        LDR.N    R0,??main_0+0xC  ;; 0x4006a000
        BL       uart_sendN
//  569     }
??main_1:
        BL       CameraInit
        CMP      R0,#+0
        BEQ.N    ??main_2
//  570     
//  571     //DMAͨ��0�� DMA����ԴΪPORTB�� DMAԴ��ַΪB0~B7, DMAĿ�ĵ�ַΪImgStore1����
//  572     while(!DMAInit(DMACH00, DMASOURCE_PORTB, CameraWidth, GPIOB_DIR_ADDR, (uint32)(ImgRaw[0])))
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
//  573     {
//  574       uart_sendN(UART0, (uint8 *)"\nDMA Initial Failed!", 20);     
        MOVS     R2,#+20
        LDR.N    R1,??main_0+0x20
        LDR.N    R0,??main_0+0xC  ;; 0x4006a000
        BL       uart_sendN
        B.N      ??main_3
//  575     }
//  576     
//  577     //��������ȼ����õ���ȷ���д���֤============================
//  578     //set_irq_priority(FIELD_IRQ, 2);
//  579     //set_irq_priority(LINE_IRQ, 1);
//  580     //set_irq_priority(DMA0_IRQ, 0);
//  581     
//  582     PORTD_ISFR = PORT_ISFR_ISF_MASK;       //�峡����PORT�ı�־λ
??main_4:
        MOVS     R0,#-1
        LDR.N    R1,??main_0+0x24  ;; 0x4004c0a0
        STR      R0,[R1, #+0]
//  583     PORTC_ISFR = PORT_ISFR_ISF_MASK;       //��������PORT�ı�־λ
        MOVS     R0,#-1
        LDR.N    R1,??main_0+0x28  ;; 0x4004b0a0
        STR      R0,[R1, #+0]
//  584     PORTB_ISFR = PORT_ISFR_ISF_MASK;       //��PCLK����PORT�ı�־λ
        MOVS     R0,#-1
        LDR.N    R1,??main_0+0x2C  ;; 0x4004a0a0
        STR      R0,[R1, #+0]
//  585     disable_irq(LINE_IRQ);                 //�����ж�IRQ
        MOVS     R0,#+89
        BL       disable_irq
//  586     disable_irq(DMA0_IRQ);                 //��DMA��������ж�IRQ
        MOVS     R0,#+0
        BL       disable_irq
//  587     disable_irq(FIELD_IRQ);                //�س��ж�IRQ
        MOVS     R0,#+90
        BL       disable_irq
//  588     
//  589     EnableInterrupts;                                     //�������ж�
        CPSIE i
//  590     while(1)
//  591     {
//  592       ImageGet();        //ͼ���ȡ
??main_5:
        BL       ImageGet
//  593       ImageProSend();        //ͼ����
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
//  594       //SendImg();  
//  595       
//  596     }  // end of while(1)
//  597 }      // end of main()

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
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
//  598 
//  599 
//  600 
//  601 #endif // end of CAMERA_DEBUG_7620
//  602 
//  603 
//  604 
//  605 //==========================C�����﷨����==================================
//  606 #ifdef C_DEBUG
//  607 
//  608 #include "common.h"
//  609 #include "sysinit.h"
//  610 #include "vectors.h"
//  611 #include "MK60N512VMD100.h"
//  612 #include "math.h"
//  613 
//  614 void main(void)
//  615 {
//  616     uint8 i, j, k;
//  617     uint8 x, y;
//  618     uint8 temp1, temp2, temp3, temp4, temp5, temp6, temp7;
//  619     int8 x1;
//  620     int8 x2;
//  621     int16 x3;
//  622    
//  623     
//  624     i = 200;
//  625     j = 100;
//  626     k = 250;
//  627     if((i + j) > k)
//  628     {
//  629       temp1 = 1;  
//  630     }
//  631     else
//  632     {
//  633       temp1 = 0;  
//  634     }
//  635     
//  636     if((j - i) < 0)
//  637     {
//  638       temp2 = 1; 
//  639     }
//  640     else
//  641     {
//  642       temp2 = 0;  
//  643     }
//  644     
//  645     x = i + j;
//  646     if(x > k)
//  647     {
//  648       temp3 = 1;
//  649     }
//  650     else
//  651     {
//  652       temp3 = 0;
//  653     }
//  654     
//  655     y = j - i;
//  656     if(y < 0)
//  657     {
//  658       temp4 = 1;
//  659     }
//  660     else
//  661     {
//  662       temp4 = 0;  
//  663     }
//  664     
//  665     
//  666     
//  667     x1 = (int8)(j - i);
//  668     if(x1 < 0)
//  669     {
//  670       temp5 = 1;
//  671     }
//  672     else
//  673     {
//  674       temp5 = 0;  
//  675     } 
//  676     
//  677     x2 = -1;
//  678     if(x2 < 0)
//  679       temp6 = 1;
//  680     else
//  681       temp6 = 0;
//  682     
//  683     x3 = -1;
//  684     if(x3 < 0)
//  685       temp7 = 1;
//  686     else
//  687       temp7 = 0;    
//  688    
//  689     
//  690     while(1)
//  691     {
//  692     }
//  693 }
//  694 
//  695 #endif // end of C_DEBUG
//  696 //==========================================================================
//  697 
//  698 
//  699 
//  700 
//  701 
//  702 
//  703 //==========================�������==================================
//  704 //���ŷ��䣺
//  705 //PORT     FUNCTION
//  706 //  A0     TCLK
//  707 //  A1     TDI
//  708 //  A2     TDO
//  709 //  A3     TMS
//  710 //  A8     ������FTM1_QD_PHA
//  711 //  A9     ������FTM1_QD_PHB
//  712 //  A10    ������FTM2_QD_PHA
//  713 //  A11    ������FTM2_QD_PHB
//  714 //  A12    ���FTM1_CH0
//  715 //  A25    SCCB_SDA
//  716 //  A26    SCCB_SCL
//  717 //  B0~B7  ����ͷ����
//  718 //  B9     PCLK
//  719 //  B16    UART0_RX
//  720 //  B17    UART0_TX
//  721 //  C8     HREF
//  722 //  C16    OLED_D0
//  723 //  C17    OLED_D1
//  724 //  C18    OLED_RST
//  725 //  C19    OLED_DC
//  726 //  D1     VSYNC
//  727 //  D4     ���FTM0_CH4����
//  728 //  D5     ���FTM0_CH5��
//  729 //  D6     ���FTM0_CH6����
//  730 //  D7     ���FTM0_CH7�ҷ�
//  731 //  E0~E5  ��ť�����İ��ϵ�����С��ť��
//  732 //  E6~E9  ���뿪ͷ
//  733 //  E26    ����ָʾ��
//  734 
//  735 #ifdef MOTOR_DEBUG
//  736 
//  737 #include "math.h"
//  738 #include "common.h"
//  739 #include "sysinit.h"
//  740 #include "gpio.h"
//  741 #include "light.h"
//  742 #include "uart.h"
//  743 #include "wdog.h"
//  744 #include "Pit.h"
//  745 #include "DMA.h"
//  746 #include "ImageGet.h"
//  747 #include "ImagePro.h"
//  748 #include "CameraSet.h"
//  749 #include "vectors.h"
//  750 #include "MK60N512VMD100.h"
//  751 #include "Ftm.h"
//  752 
//  753 void main(void)
//  754 {
//  755     DisableInterrupts;                                    //�ر������ж�
//  756     
//  757     gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
//  758     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
//  759     uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
//  760     pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
//  761     //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
//  762     
//  763     EnableInterrupts;
//  764     
//  765     MotorInit();
//  766     while(1)
//  767     {
//  768       uart_sendN(UART0, (uint8 *)"\nHello Motor!", 13);
//  769     }  // end of while(1)   
//  770 }      // end of main()
//  771 #endif // end of MOTOR_DEBUG
//  772 
//  773 
//  774 
//  775 
//  776 //==========================�������==================================
//  777 //���ŷ��䣺
//  778 //PORT     FUNCTION
//  779 //  A0     TCLK
//  780 //  A1     TDI
//  781 //  A2     TDO
//  782 //  A3     TMS
//  783 //  A8     ������FTM1_QD_PHA
//  784 //  A9     ������FTM1_QD_PHB
//  785 //  A10    ������FTM2_QD_PHA
//  786 //  A11    ������FTM2_QD_PHB
//  787 //  A12    ���FTM1_CH0
//  788 //  A25    SCCB_SDA
//  789 //  A26    SCCB_SCL
//  790 //  B0~B7  ����ͷ����
//  791 //  B9     PCLK
//  792 //  B16    UART0_RX
//  793 //  B17    UART0_TX
//  794 //  C8     HREF
//  795 //  C16    OLED_D0
//  796 //  C17    OLED_D1
//  797 //  C18    OLED_RST
//  798 //  C19    OLED_DC
//  799 //  D1     VSYNC
//  800 //  D4     ���FTM0_CH4����
//  801 //  D5     ���FTM0_CH5��
//  802 //  D6     ���FTM0_CH6����
//  803 //  D7     ���FTM0_CH7�ҷ�
//  804 //  E0~E5  ��ť�����İ��ϵ�����С��ť��
//  805 //  E6~E9  ���뿪ͷ
//  806 //  E26    ����ָʾ��
//  807 
//  808 #ifdef SERVO_DEBUG
//  809 
//  810 #include "math.h"
//  811 #include "common.h"
//  812 #include "sysinit.h"
//  813 #include "gpio.h"
//  814 #include "light.h"
//  815 #include "uart.h"
//  816 #include "wdog.h"
//  817 #include "Pit.h"
//  818 #include "DMA.h"
//  819 #include "ImageGet.h"
//  820 #include "ImagePro.h"
//  821 #include "CameraSet.h"
//  822 #include "vectors.h"
//  823 #include "MK60N512VMD100.h"
//  824 #include "Ftm.h"
//  825 
//  826 
//  827 void main(void)
//  828 {
//  829     int i, j;
//  830     DisableInterrupts;                                    //�ر������ж�
//  831     
//  832     gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
//  833     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
//  834     uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
//  835     pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
//  836     //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
//  837     
//  838     EnableInterrupts;
//  839     
//  840     ServoInit();
//  841     while(1)
//  842     {
//  843       /*
//  844       FTM1_C0V = 1828;
//  845       for(i = 0; i < 10000; i++)
//  846         for(j = 0; j < 10000; j++)
//  847         {}
//  848       FTM1_C0V = 1810;
//  849       for(i = 0; i < 10000; i++)
//  850         for(j = 0; j < 10000; j++)
//  851         {}
//  852       FTM1_C0V = 2039;
//  853       for(i = 0; i < 10000; i++)
//  854         for(j = 0; j < 10000; j++)
//  855         {}
//  856       */
//  857       uart_sendN(UART0, (uint8 *)"\nHello Servo!", 13);
//  858     }  // end of while(1)   
//  859 }      // end of main()
//  860 #endif // end of SERVO_DEBUG
//  861   
//  862  
//  863   
//  864 //==========================����ʾ��������===========================
//  865 #ifdef VIRTURL_DEBUG
//  866 
//  867 #include "common.h"
//  868 #include "sysinit.h"
//  869 #include "gpio.h"
//  870 #include "light.h"
//  871 #include "uart.h"
//  872 #include "wdog.h"
//  873 #include "Pit.h"  
//  874 #include "VirtualScope.h"
//  875 
//  876 
//  877 void main(void)
//  878 {
//  879     DisableInterrupts;                                    //�ر������ж�
//  880     
//  881     gpio_init(PORTA,10,1,0);                              //ʱ��������ų�ʼ��
//  882     light_init(PORTE, 26, Light_ON);                      //��Ƭ������ָʾ��
//  883     uart_init(UART0, periph_clk_khz, 115200);             //���ڳ�ʼ��
//  884     pit_init(PIT0,75000);                                   //��ʼ��PIT1����Ϊ1ms*20*4   ���Լ�ؿ�������
//  885     //enable_pit_interrupt(PIT0);                         //��PIT1�ж�
//  886     
//  887     EnableInterrupts;
//  888     
//  889     VirtualOutData[0] = 0;
//  890     VirtualOutData[1] = 0;
//  891     VirtualOutData[2] = 10000;
//  892     VirtualOutData[3] = -10000;
//  893     while(1)
//  894     {
//  895       VirtualOutPut_Data();     
//  896     }  // end of while(1) 
//  897 }      // end of main
//  898 #endif // end of VIRTURL_DEBUG
//  899 
//  900 
//  901 
//  902 
//  903 
//  904 
//  905 
//  906 
//  907 
//  908 
//  909 
//  910 
//  911 
// 
//  48 bytes in section .rodata
// 204 bytes in section .text
// 
// 204 bytes of CODE  memory
//  48 bytes of CONST memory
//
//Errors: none
//Warnings: none
