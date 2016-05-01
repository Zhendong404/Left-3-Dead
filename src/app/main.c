/******************** (C) COPYRIGHT 2011 蓝宙电子工作室 ********************
 * 文件名       ：main.c
 * 描述         ：工程模版实验
 *
 * 实验平台     ：landzo电子开发版
 * 库版本       ：
 * 嵌入系统     ：
 *
 * 作者         ：landzo 蓝电子
 * 淘宝店       ：http://landzo.taobao.com/

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
设置系统的全局变量
*************************/
#ifdef RUN

extern  u8  LPT_INT_count ;
extern  u8  DMA_Over_Flg ;            //采集完成标志位
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
u8 ALineOverCout = 0 ;                 //采集完成黑线行数
u8 ALineCal = 0 ;          
u8 ADdata[DATALINE][DATACOUNT] ={ 0  } ;        //黑线AD数组存储
u16 Atemp0 ;
u8  *finger,*finger1;
u8  checkflg = 0 ; 
u8 ImageProFlag = 0;
extern uint8 ImgNew[CameraHeight][CameraWidth];

void main()
{
       
	DisableInterrupts;                             //禁止总中断 

	/*********************************************************
	初始化程序
	*********************************************************/
	uart_init (UART0 , 115200);                      //初始化UART0，输出脚PTA15，输入脚PTA14，串口频率 9600

	/***************************
	初始化电机要用到的引脚
	***************************/
	gpio_init (PORTD, 7, GPO, 0);
	//此引脚输出高电平，用于H桥的使能

	DCMoto_init();          //初始化电机
        printf("DCMoto_init finished!\n");

	TURNPWM_init();
        printf("TURNPWM_init finished!\n");

	MaPan_init();
        printf("MaPan_init finished!\n");

	/***************************
	初始化按键和拨码开关引脚
	***************************/
	{
		//使能PORTE
		SIM_SCGC5 |= SIM_SCGC5_PORTE_MASK;

		//使用按键K2用于对速度设定值的改变，K2连接PTE1
		gpio_init (PORTE, 1, GPI, 0);

		//开启K2键中断
		gpio_Interrupt_init(PORTE, 1, GPI_DOWN, RING);
                gpio_Interrupt_init(PORTE, 2, GPI_DOWN, RING);
                gpio_Interrupt_init(PORTE, 3, GPI_DOWN, RING);

		//拨码开关用到的引脚是PTE6、7、8、9
		gpio_init (PORTE, 6, GPI, 0);
		gpio_init (PORTE, 7, GPI, 0);
		gpio_init (PORTE, 8, GPI, 0);
		gpio_init (PORTE, 9, GPI, 0);
	}

	/***************************
	初始化摄像头采样
	***************************/
	CCD_INC ();
        printf("CCD_INC finished!\n");

	gpio_init (PORTA , 16, GPO,HIGH); 
	gpio_init (PORTA , 17, GPO,HIGH); 

	pit_init_ms(PIT0, 5);                                    //初始化PIT0，定时时间为： 5ms
	pit_init_ms(PIT1, 1000);                                //初始化PIT1，定时时间为： 1000ms 

	while(checkflg != 1 )  
	{
	  checkflg = LandzoIICEEROM_INIT() ;
	  BFdelay_1us(100);      // 延时100us 
          //uart_putchar(UART0,0xff);
	}
	EnableInterrupts;			                    //开总中断  

	/******************************************
	 执行程序
	 ******************************************/
	FTM_PWM_Duty(FTM0, CH5, 150);
        FTM_CnSC_REG(FTM2_BASE_PTR, 0) &= ~FTM_CnSC_CHIE_MASK; //禁止输入捕捉中断
        printf("禁止输入捕捉中断\n");
        Speed = 0;
        FTM_CnSC_REG(FTM2_BASE_PTR,0) |= FTM_CnSC_CHIE_MASK;  //开启输入捕捉中断
        printf("开启输入捕捉中断\n");
        printf("进入主循环\n");
        
        
	while(1)
	{


		/*********************
		10ms程序执行代码段
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
		200ms程序执行代码段
		*********************/
		if(TIME0flag_200ms == 1)
		{
			ImageProFlag = ImagePro();
			Control();
			SendImage(ImgNew);
			TIME0flag_200ms = 0;
		}

		/*********************
		1s程序执行代码段
		*********************/      
		if(TIME1flag_1s == 1)
		{
		//5.7% 为下限，右转。
		//7.3% 为中心，直走。
		//8.7% 为上限，左转。
        PTA17_OUT = ~PTA17_OUT ;
        //uart_putchar(UART0, 'c');
        TIME1flag_1s = 0 ; 
		}
	}
}

#endif

#ifdef  NORMAL

extern  u8  LPT_INT_count ;
extern  u8  DMA_Over_Flg ;            //采集完成标志位
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
u8 ALineOverCout = 0 ;                 //采集完成黑线行数
u8 ALineCal = 0 ;          
u8 ADdata[DATALINE][DATACOUNT] ={ 0  } ;        //黑线AD数组存储
u16 Atemp0 ;
u8  *finger,*finger1;
u8  checkflg = 0 ;     

void main()
{
	//u16 i=0,j=0;
		DisableInterrupts;                             //禁止总中断 

	/*********************************************************
	初始化程序
	*********************************************************/
	//自行添加代码

	uart_init (UART0 , 115200);                      //初始化UART0，输出脚PTA15，输入脚PTA14，串口频率 9600

	/***************************
	初始化电机要用到的引脚
	***************************/
	gpio_init (PORTD, 7, GPO, 0);
	//此引脚输出高电平，用于H桥的使能

	DCMoto_init();          //初始化电机
        printf("DCMoto_init finished!\n");

	TURNPWM_init();
        printf("TURNPWM_init finished!\n");

	MaPan_init();
        printf("MaPan_init finished!\n");
	//ServoInit();          // 初始化舵机
	//Servo_init();           //对舵机进行初始化
	//QuadInit();           //初始化编码器
	//OLEDInit();           //初始化OLED
	//CameraInit();         //初始化摄像头

	/***************************
	初始化按键和拨码开关引脚
	***************************/
	{
		//使能PORTE
		SIM_SCGC5 |= SIM_SCGC5_PORTE_MASK;

		//使用按键K2用于对速度设定值的改变，K2连接PTE1
		gpio_init (PORTE, 1, GPI, 0);

		//开启K2键中断
		gpio_Interrupt_init(PORTE, 1, GPI_DOWN, RING);

		//拨码开关用到的引脚是PTE6、7、8、9
		gpio_init (PORTE, 6, GPI, 0);
		gpio_init (PORTE, 7, GPI, 0);
		gpio_init (PORTE, 8, GPI, 0);
		gpio_init (PORTE, 9, GPI, 0);
	}

	/***************************
	初始化摄像头采样
	***************************/
	CCD_INC ();
        printf("CCD_INC finished!\n");

	gpio_init (PORTA , 16, GPO,HIGH); 
	gpio_init (PORTA , 17, GPO,HIGH); 

	pit_init_ms(PIT0, 5);                                    //初始化PIT0，定时时间为： 5ms
	pit_init_ms(PIT1, 1000);                                //初始化PIT1，定时时间为： 1000ms 

	while(checkflg != 1 )  
	{
	  checkflg = LandzoIICEEROM_INIT() ;
	  BFdelay_1us(100);      // 延时100us 
          //uart_putchar(UART0,0xff);
	}
	EnableInterrupts;			                    //开总中断  

	/******************************************
	 执行程序
	 ******************************************/
	FTM_PWM_Duty(FTM0, CH5, 150);
        FTM_CnSC_REG(FTM2_BASE_PTR, 0) &= ~FTM_CnSC_CHIE_MASK; //禁止输入捕捉中断
        printf("禁止输入捕捉中断\n");
        Speed = 0;
        FTM_CnSC_REG(FTM2_BASE_PTR,0) |= FTM_CnSC_CHIE_MASK;  //开启输入捕捉中断
        printf("开启输入捕捉中断\n");
        printf("进入主循环\n");
        
	while(1)
	{
	/*
		uint8 ImageProFlag = 0;
		if(DMA_Over_Flg == 1)
		{
			DMA_Over_Flg = 0 ;

			gpio_Interrupt_init(PORTD,1, GPI_UP,GPI_DISAB) ;		//场中断
			gpio_Interrupt_init(PORTC,8, GPI_DOWN, GPI_DISAB) ;		//行中断 

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
			gpio_Interrupt_init(PORTD,1, GPI_UP,FALLING) ;			//场中断
			}
			*/
			//SportControl(ImageProFlag);

		/*********************
		10ms程序执行代码段
		*********************/
		
		if(TIME0flag_10ms == 1)
		{
		  SpeedTransmitter();
		  //printf("Speed = %d\n", Speed);
		  
		  TIME0flag_10ms = 0;
		}
		

		/*********************
		200ms程序执行代码段
		*********************/
		if(TIME0flag_200ms == 1)
		{
			Control();
			TIME0flag_200ms = 0;
		}

		/*********************
		1s程序执行代码段
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
			
		//5.7% 为下限，左转。
		//7.3% 为中心，直走。
		//8.7% 为上限，右转。
        
        PTA17_OUT = ~PTA17_OUT ;
        //uart_putchar(UART0, 'c');
        TIME1flag_1s = 0 ; 
		}
	}
}

#endif

#ifdef  IMAGEGET

extern  u8  LPT_INT_count ;
extern  u8  DMA_Over_Flg ;            //采集完成标志位
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
u8 ALineOverCout = 0 ;                 //采集完成黑线行数
u8 ALineCal = 0 ;          
u8 ADdata[DATALINE][DATACOUNT] ={ 0  } ;        //黑线AD数组存储
u16 Atemp0 ;
u8  *finger,*finger1;
u8  checkflg = 0 ;     
extern uint8 ImgNew[CameraHeight][CameraWidth];


void main()
{
      DisableInterrupts;                             //禁止总中断 

  /*********************************************************
  初始化程序
  *********************************************************/
   //自行添加代码
 
   uart_init(UART0 , 115200);                      //初始化UART0，输出脚PTA15，输入脚PTA14，串口频率 9600
   
    /***************************
    初始化摄像头采样
    ***************************/
   CCD_INC ();

   //gpio_init (PORTA , 16, GPO,HIGH); 
   gpio_init (PORTA , 17, GPO,HIGH);
   gpio_init(PORTE, 0, GPI, HIGH);                      //SW1
   
   pit_init_ms(PIT0, 5);                                    //初始化PIT0，定时时间为： 5ms
   pit_init_ms(PIT1, 1000);                                //初始化PIT1，定时时间为： 1000ms 
   
   while(checkflg != 1 )  
   {
     checkflg = LandzoIICEEROM_INIT() ;
     BFdelay_1us(100);      // 延时100us 
  //   uart_putchar(UART0,0xff);
   }
        {
		//使能PORTE
		SIM_SCGC5 |= SIM_SCGC5_PORTE_MASK;

		//使用按键K2用于对速度设定值的改变，K2连接PTE1
		gpio_init (PORTE, 1, GPI, 0);
                gpio_init(PORTE, 2, GPI, 0);
                gpio_init(PORTE, 3, GPI, 0);

		//开启K2键中断
		gpio_Interrupt_init(PORTE, 1, GPI_DOWN, RING);
                gpio_Interrupt_init(PORTE, 2, GPI_DOWN, RING);
                gpio_Interrupt_init(PORTE, 3, GPI_DOWN, RING);

		//拨码开关用到的引脚是PTE6、7、8、9
		gpio_init (PORTE, 6, GPI, 0);
		gpio_init (PORTE, 7, GPI, 0);
		gpio_init (PORTE, 8, GPI, 0);
		gpio_init (PORTE, 9, GPI, 0);
	}
   EnableInterrupts;			                    //开总中断  

   /******************************************
    执行程序
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

              gpio_Interrupt_init(PORTD,1, GPI_UP,GPI_DISAB) ;          //场中断
              SendImage(ADdata);
             //ImageProFlag = ImagePro();
             gpio_Interrupt_init(PORTD,1, GPI_UP,FALLING) ;          //场中断
             
           }
           while(gpio_get(PORTE, 0) != HIGH)
             ;

        }
     
     
          //SportControl(ImageProFlag);
          
          
          /*********************
          1s程序执行代码段
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
u8 ALineOverCout = 0 ;                 //采集完成黑线行数
u8 ALineCal = 0 ;          
u8 ADdata[DATALINE][DATACOUNT] ={ 0  } ;        //黑线AD数组存储
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
  
