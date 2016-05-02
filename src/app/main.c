/******************** (C) COPYRIGHT 2011 ������ӹ����� ********************
 * �ļ���       ��main.c
 * ����         ������ģ��ʵ��
 *
 * ʵ��ƽ̨     ��landzo���ӿ�����
 * ��汾       ��
 * Ƕ��ϵͳ     ��
 *
 * ����         ��landzo ������
 * �Ա���       ��http://landzo.taobao.com/

**********************************************************************************/

#include "include.h"
#include "calculation.h"
#include "VirtualScope.h"
#include "ImagePro.h"
#include "RunControl.h"

//#define  NORMAL
//#define  IMAGEGET
//#define  REG_VALUE_GET
#define  RUN

/*************************
����ϵͳ��ȫ�ֱ���
*************************/
#ifdef RUN

extern  u8  LPT_INT_count ;
extern  u8  DMA_Over_Flg ;            //�ɼ���ɱ�־λ
extern  u8  LinADCout ;
extern  uint8_t  LandzoRAM[ ];

extern u8 TIME0flag_5ms   ;
extern u8 TIME0flag_10ms  ;
extern u8 TIME0flag_15ms  ;
extern u8 TIME0flag_20ms  ;
extern u8 TIME0flag_200ms  ;
extern u8 TIME1flag_1s ;

u8  BUFF[500] ;
u8 Atem8B0 = 0 ;
u8 ALineOverCout = 0 ;                 //�ɼ���ɺ�������
u8 ALineCal = 0 ;          
u8 ADdata[DATALINE][DATACOUNT] ={ 0  } ;        //����AD����洢
u16 Atemp0 ;
u8  *finger,*finger1;
u8  checkflg = 0 ; 
u8 ImageProFlag = 0;
extern uint8 ImgNew[CameraHeight][CameraWidth];

void main()
{
       
	DisableInterrupts;                             //��ֹ���ж� 

	/*********************************************************
	��ʼ������
	*********************************************************/
	uart_init (UART0 , 115200);                      //��ʼ��UART0�������PTA15�������PTA14������Ƶ�� 9600

	/***************************
	��ʼ�����Ҫ�õ�������
	***************************/
	gpio_init (PORTD, 7, GPO, 0);
	//����������ߵ�ƽ������H�ŵ�ʹ��

	DCMoto_init();          //��ʼ�����
        printf("DCMoto_init finished!\n");

	TURNPWM_init();
        printf("TURNPWM_init finished!\n");

	MaPan_init();
        printf("MaPan_init finished!\n");

	/***************************
	��ʼ�������Ͳ��뿪������
	***************************/
	{
		//ʹ��PORTE
		SIM_SCGC5 |= SIM_SCGC5_PORTE_MASK;

		//ʹ�ð���K2���ڶ��ٶ��趨ֵ�ĸı䣬K2����PTE1
		gpio_init (PORTE, 1, GPI, 0);

		//����K2���ж�
		gpio_Interrupt_init(PORTE, 1, GPI_DOWN, RING);
                gpio_Interrupt_init(PORTE, 2, GPI_DOWN, RING);
                gpio_Interrupt_init(PORTE, 3, GPI_DOWN, RING);

		//���뿪���õ���������PTE6��7��8��9
		gpio_init (PORTE, 6, GPI, 0);
		gpio_init (PORTE, 7, GPI, 0);
		gpio_init (PORTE, 8, GPI, 0);
		gpio_init (PORTE, 9, GPI, 0);
	}

	/***************************
	��ʼ������ͷ����
	***************************/
	CCD_INC ();
        printf("CCD_INC finished!\n");

	gpio_init (PORTA , 16, GPO,HIGH); 
	gpio_init (PORTA , 17, GPO,HIGH); 

	pit_init_ms(PIT0, 5);                                    //��ʼ��PIT0����ʱʱ��Ϊ�� 5ms
	pit_init_ms(PIT1, 1000);                                //��ʼ��PIT1����ʱʱ��Ϊ�� 1000ms 

	while(checkflg != 1 )  
	{
	  checkflg = LandzoIICEEROM_INIT() ;
	  BFdelay_1us(100);      // ��ʱ100us 
          //uart_putchar(UART0,0xff);
	}
	EnableInterrupts;			                    //�����ж�  

	/******************************************
	 ִ�г���
	 ******************************************/
	FTM_PWM_Duty(FTM0, CH5, 150);
        FTM_CnSC_REG(FTM2_BASE_PTR, 0) &= ~FTM_CnSC_CHIE_MASK; //��ֹ���벶׽�ж�
        printf("��ֹ���벶׽�ж�\n");
        Speed = 0;
        FTM_CnSC_REG(FTM2_BASE_PTR,0) |= FTM_CnSC_CHIE_MASK;  //�������벶׽�ж�
        printf("�������벶׽�ж�\n");
        printf("������ѭ��\n");
        
        
	while(1)
	{


		/*********************
		10ms����ִ�д����
		*********************/
		if(DMA_Over_Flg == 1)
                {
                   // ImageProFlag = ImagePro();
                }
                
		if(TIME0flag_10ms == 1)
		{
			SpeedTransmitter();
			//printf("Speed = %d\n", Speed);
			TIME0flag_10ms = 0;
		}
		

		/*********************
		200ms����ִ�д����
		*********************/
		if(TIME0flag_200ms == 1)
		{
			ImageProFlag = ImagePro();
			Control();
			SendImage(ImgNew);
			TIME0flag_200ms = 0;
		}

		/*********************
		1s����ִ�д����
		*********************/      
		if(TIME1flag_1s == 1)
		{
		//5.7% Ϊ���ޣ���ת��
		//7.3% Ϊ���ģ�ֱ�ߡ�
		//8.7% Ϊ���ޣ���ת��
        PTA17_OUT = ~PTA17_OUT ;
        //uart_putchar(UART0, 'c');
        TIME1flag_1s = 0 ; 
		}
	}
}

#endif

#ifdef  NORMAL

extern  u8  LPT_INT_count ;
extern  u8  DMA_Over_Flg ;            //�ɼ���ɱ�־λ
extern  u8  LinADCout ;
extern  uint8_t  LandzoRAM[ ];

extern u8 TIME0flag_5ms   ;
extern u8 TIME0flag_10ms  ;
extern u8 TIME0flag_15ms  ;
extern u8 TIME0flag_20ms  ;
extern u8 TIME0flag_200ms  ;
extern u8 TIME1flag_1s ;

u8  BUFF[500] ;
u8 Atem8B0 = 0 ;
u8 ALineOverCout = 0 ;                 //�ɼ���ɺ�������
u8 ALineCal = 0 ;          
u8 ADdata[DATALINE][DATACOUNT] ={ 0  } ;        //����AD����洢
u16 Atemp0 ;
u8  *finger,*finger1;
u8  checkflg = 0 ;     

void main()
{
	//u16 i=0,j=0;
		DisableInterrupts;                             //��ֹ���ж� 

	/*********************************************************
	��ʼ������
	*********************************************************/
	//������Ӵ���

	uart_init (UART0 , 115200);                      //��ʼ��UART0�������PTA15�������PTA14������Ƶ�� 9600

	/***************************
	��ʼ�����Ҫ�õ�������
	***************************/
	gpio_init (PORTD, 7, GPO, 0);
	//����������ߵ�ƽ������H�ŵ�ʹ��

	DCMoto_init();          //��ʼ�����
        printf("DCMoto_init finished!\n");

	TURNPWM_init();
        printf("TURNPWM_init finished!\n");

	MaPan_init();
        printf("MaPan_init finished!\n");
	//ServoInit();          // ��ʼ�����
	//Servo_init();           //�Զ�����г�ʼ��
	//QuadInit();           //��ʼ��������
	//OLEDInit();           //��ʼ��OLED
	//CameraInit();         //��ʼ������ͷ

	/***************************
	��ʼ�������Ͳ��뿪������
	***************************/
	{
		//ʹ��PORTE
		SIM_SCGC5 |= SIM_SCGC5_PORTE_MASK;

		//ʹ�ð���K2���ڶ��ٶ��趨ֵ�ĸı䣬K2����PTE1
		gpio_init (PORTE, 1, GPI, 0);

		//����K2���ж�
		gpio_Interrupt_init(PORTE, 1, GPI_DOWN, RING);

		//���뿪���õ���������PTE6��7��8��9
		gpio_init (PORTE, 6, GPI, 0);
		gpio_init (PORTE, 7, GPI, 0);
		gpio_init (PORTE, 8, GPI, 0);
		gpio_init (PORTE, 9, GPI, 0);
	}

	/***************************
	��ʼ������ͷ����
	***************************/
	CCD_INC ();
        printf("CCD_INC finished!\n");

	gpio_init (PORTA , 16, GPO,HIGH); 
	gpio_init (PORTA , 17, GPO,HIGH); 

	pit_init_ms(PIT0, 5);                                    //��ʼ��PIT0����ʱʱ��Ϊ�� 5ms
	pit_init_ms(PIT1, 1000);                                //��ʼ��PIT1����ʱʱ��Ϊ�� 1000ms 

	while(checkflg != 1 )  
	{
	  checkflg = LandzoIICEEROM_INIT() ;
	  BFdelay_1us(100);      // ��ʱ100us 
          //uart_putchar(UART0,0xff);
	}
	EnableInterrupts;			                    //�����ж�  

	/******************************************
	 ִ�г���
	 ******************************************/
	FTM_PWM_Duty(FTM0, CH5, 150);
        FTM_CnSC_REG(FTM2_BASE_PTR, 0) &= ~FTM_CnSC_CHIE_MASK; //��ֹ���벶׽�ж�
        printf("��ֹ���벶׽�ж�\n");
        Speed = 0;
        FTM_CnSC_REG(FTM2_BASE_PTR,0) |= FTM_CnSC_CHIE_MASK;  //�������벶׽�ж�
        printf("�������벶׽�ж�\n");
        printf("������ѭ��\n");
        
	while(1)
	{
	/*
		uint8 ImageProFlag = 0;
		if(DMA_Over_Flg == 1)
		{
			DMA_Over_Flg = 0 ;

			gpio_Interrupt_init(PORTD,1, GPI_UP,GPI_DISAB) ;		//���ж�
			gpio_Interrupt_init(PORTC,8, GPI_DOWN, GPI_DISAB) ;		//���ж� 

			//ImageProFlag = ImagePro();
			//uart_putchar(UART0,0xfb);
			//uart_putchar(UART0,0xbb);
			for(i=0;i<DATALINE;i++)
				for(j=0;j<DATACOUNT;j++){
					if(ADdata[i][j]==0xff)
						ADdata[i][j]=0xfe;
					uart_putchar(UART0,ADdata[i][j]);
				}
			uart_putchar(UART0,0xff);
			//ImageProFlag = ImagePro();
			gpio_Interrupt_init(PORTD,1, GPI_UP,FALLING) ;			//���ж�
			}
			*/
			//SportControl(ImageProFlag);

		/*********************
		10ms����ִ�д����
		*********************/
		
		if(TIME0flag_10ms == 1)
		{
		  SpeedTransmitter();
		  //printf("Speed = %d\n", Speed);
		  
		  TIME0flag_10ms = 0;
		}
		

		/*********************
		200ms����ִ�д����
		*********************/
		if(TIME0flag_200ms == 1)
		{
			Control();
			TIME0flag_200ms = 0;
		}

		/*********************
		1s����ִ�д����
		*********************/      
		if(TIME1flag_1s == 1)
		{
			/*if(FTM1_C0V == 2180)
			{
				FTM1_C0V = 1500;
			}
			else
			{
				FTM1_C0V = 2100;
			}*/
			
		//5.7% Ϊ���ޣ���ת��
		//7.3% Ϊ���ģ�ֱ�ߡ�
		//8.7% Ϊ���ޣ���ת��
        
        PTA17_OUT = ~PTA17_OUT ;
        //uart_putchar(UART0, 'c');
        TIME1flag_1s = 0 ; 
		}
	}
}

#endif

#ifdef  IMAGEGET

extern  u8  LPT_INT_count ;
extern  u8  DMA_Over_Flg ;            //�ɼ���ɱ�־λ
extern  u8  LinADCout ;
extern  uint8_t  LandzoRAM[ ];

extern u8 TIME0flag_5ms   ;
extern u8 TIME0flag_10ms  ;
extern u8 TIME0flag_15ms  ;
extern u8 TIME0flag_20ms  ;
extern u8 TIME0flag_80ms  ;
extern u8 TIME1flag_1s ;

u8  BUFF[500] ;
u8 Atem8B0 = 0 ;
u8 ALineOverCout = 0 ;                 //�ɼ���ɺ�������
u8 ALineCal = 0 ;          
u8 ADdata[DATALINE][DATACOUNT] ={ 0  } ;        //����AD����洢
u16 Atemp0 ;
u8  *finger,*finger1;
u8  checkflg = 0 ;     
extern uint8 ImgNew[CameraHeight][CameraWidth];


void main()
{
      DisableInterrupts;                             //��ֹ���ж� 

  /*********************************************************
  ��ʼ������
  *********************************************************/
   //������Ӵ���
 
   uart_init(UART0 , 115200);                      //��ʼ��UART0�������PTA15�������PTA14������Ƶ�� 9600
   
    /***************************
    ��ʼ������ͷ����
    ***************************/
   CCD_INC ();

   //gpio_init (PORTA , 16, GPO,HIGH); 
   gpio_init (PORTA , 17, GPO,HIGH);
   gpio_init(PORTE, 0, GPI, HIGH);                      //SW1
   
   pit_init_ms(PIT0, 5);                                    //��ʼ��PIT0����ʱʱ��Ϊ�� 5ms
   pit_init_ms(PIT1, 1000);                                //��ʼ��PIT1����ʱʱ��Ϊ�� 1000ms 
   
   while(checkflg != 1 )  
   {
     checkflg = LandzoIICEEROM_INIT() ;
     BFdelay_1us(100);      // ��ʱ100us 
  //   uart_putchar(UART0,0xff);
   }
        {
		//ʹ��PORTE
		SIM_SCGC5 |= SIM_SCGC5_PORTE_MASK;

		//ʹ�ð���K2���ڶ��ٶ��趨ֵ�ĸı䣬K2����PTE1
		gpio_init (PORTE, 1, GPI, 0);
                gpio_init(PORTE, 2, GPI, 0);
                gpio_init(PORTE, 3, GPI, 0);

		//����K2���ж�
		gpio_Interrupt_init(PORTE, 1, GPI_DOWN, RING);
                gpio_Interrupt_init(PORTE, 2, GPI_DOWN, RING);
                gpio_Interrupt_init(PORTE, 3, GPI_DOWN, RING);

		//���뿪���õ���������PTE6��7��8��9
		gpio_init (PORTE, 6, GPI, 0);
		gpio_init (PORTE, 7, GPI, 0);
		gpio_init (PORTE, 8, GPI, 0);
		gpio_init (PORTE, 9, GPI, 0);
	}
   EnableInterrupts;			                    //�����ж�  

   /******************************************
    ִ�г���
    ******************************************/
    while(1)
    {

       //uint8 ImageProFlag = 0;
      if(DMA_Over_Flg == 1)
      {
           DMA_Over_Flg = 0 ;
           //ImagePro();
           if(gpio_get(PORTE,0) == LOW)
           {

              gpio_Interrupt_init(PORTD,1, GPI_UP,GPI_DISAB) ;          //���ж�
              SendImage(ADdata);
             //ImageProFlag = ImagePro();
             gpio_Interrupt_init(PORTD,1, GPI_UP,FALLING) ;          //���ж�
             
           }
           while(gpio_get(PORTE, 0) != HIGH)
             ;

        }
     
     
          //SportControl(ImageProFlag);
          
          
          /*********************
          1s����ִ�д����
          *********************/      
          if(TIME1flag_1s == 1)
          {
            PTA17_OUT = ~PTA17_OUT ;
            //uart_putchar(UART0, 'c');
            TIME1flag_1s = 0 ; 
         
          }

    }
}
#endif

#ifdef REG_VALUE_GET
u8  BUFF[500] ;
u8 Atem8B0 = 0 ;
u8 ALineOverCout = 0 ;                 //�ɼ���ɺ�������
u8 ALineCal = 0 ;          
u8 ADdata[DATALINE][DATACOUNT] ={ 0  } ;        //����AD����洢
u16 Atemp0 ;
u8  *finger,*finger1;
u8  checkflg = 0 ;     
extern u8 Reg_buff[212];
extern u8 TIME1flag_1s ;
void main()
{
    DisableInterrupts;
    CCD_INC();
    pit_init_ms(PIT1, 1000);
    gpio_init (PORTA , 17, GPO,HIGH);
    uart_init (UART0 , 115200);
    EnableInterrupts;
    
    u8 ok = getCameraReg();
    if(ok)
    {
        for(int i = 0; i < 212; ++i)
        {
          uart_putchar(UART0, Reg_buff[i]);
        }
    }
    else
    {
      printf("Error!");
    }
      
    while(1)
    {
        if(TIME1flag_1s == 1)
        {
            PTA17_OUT = ~PTA17_OUT;
        }
    }
    
}

#endif
  
