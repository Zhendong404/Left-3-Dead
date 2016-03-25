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

//#define UART_DEBUG
#define DEBUG
//#define TESTDMA


#ifdef DEBUG

/*************************
设置系统的中断函数变量
*************************/
extern  uint8  LPT_INT_count;                    //LPT 脉冲计数器

extern uint8 TIME0flag_5ms;                    //PTI0 5ms标志位
extern uint8 TIME0flag_10ms;                    //PTI0 10ms标志位
extern uint8 TIME0flag_20ms;                    //PTI0 20ms标志位 
extern uint8 TIME0flag_80ms;                     //PTI0 80ms标志位   
extern uint8 TIME0flag_100ms;                     //PTI0 100ms标志位 
extern uint8 TIME0flag_200ms;                     //PTI0 100ms标志位 

extern uint16 Sample_Line_Count;                //DMA采集的行数
extern uint8  DMA_Over_Flag;                      //DMA采集完成标志位

/********
全局
********/                
/*********
速度变量
*********/
uint16 Set_Speed=0 ;                                  //目标速度
uint16 Speed_Count =0 ;                          //脉冲计数器
uint16 SpeedPWM_Value=0 ;                          //PID计算的PWM 

uint8 Speed_P;
uint8 Speed_I;
uint8 Speed_D;

/*********
转向变量
*********/
uint8  Turn_P=0;
uint8  Turn_D=0;
uint16 TurnPWM_Value=0 ;                        //转向的PWM值 
int16  Sum_Station=0;
int8  Station=71 ;                         //CCD的黑线位置
uint8  MIDSTATION = 71 ;                 //CCD传感器表示的黑线的中间位置

/********
摄像头采集变量
********/
uint8  BUFF[500] ;
uint8  checkflag = 0 ;  
uint8  Sample_Over=0;
uint8  g_PointCount=DATACOUNT;
uint16  g_temp0=0; 
uint8  ADdata[DATAROW][DATACOUNT]={0};
uint8  *finger, *finger1; 
uint8  g_LineCalculation=0;
uint8  Rightblackedge[DATAROW]={0};
uint8  Leftblackedge[DATAROW]={0};
uint8  CameraStation[DATAROW]={0};

void main()
{
  DisableInterrupts;                             //禁止总中断 
  /*********************************************************
  初始化全局变量
  *********************************************************/
  
  Set_Speed = 80 ;  //64
  Speed_P=50;
  Speed_I=0;
  Speed_D=0;
  
  /*********************************************************
  初始化程序
  *********************************************************/
  
  uart_init (UART0 , 115200);                      //初始化UART0，输出脚PTA15，输入脚PTA14，串口频率 15200
  gpio_init (PORTA , 16, GPO,HIGH);                //系统板测试LED初始化
  gpio_init (PORTA , 17, GPO,HIGH);                //LED闪烁  
  pit_init_ms(PIT0, 1);                            //初始化PIT0，定时时间为： 1ms
  
  Camera_init();                                    //初始化摄像头传感器
  OLED_Init();                                     //初始化OLED传感器     
  MOTORPWM_init();                                 //电机初始化
  TURNPWM_init() ;                                 //转向初始化  
  
  while(checkflag != 1 )  
   {
     checkflag = LandzoIICEEROM_INIT() ; //通过配置使摄像头输出数字信号
     //checkflag = CameraRegInit() ;        //通过配置使摄像头输出数字信号
     BFdelay_1us(100);                   // 延时100us 
   }
  
  EnableInterrupts;			            //开总中断  
  
  /******************************************
  执行程序
  ******************************************/
  while(1)
  {
    
    /*********************
    5ms程序执行代码段
    *********************/
    if(TIME0flag_5ms == 1)
    { 
      TIME0flag_5ms = 0 ;
      
    }
    
    /*********************
    10ms程序执行代码段
    *********************/
    if(TIME0flag_10ms == 1)
    {
      TIME0flag_10ms = 0 ;
      
      Speed_Count = LPTMR0_CNR;                                                     //保存脉冲计数器计算值
      lptmr_counter_clean();                                                  //清空脉冲计数器计算值（马上清空，这样才能保证计数值准确）
      Speed_Count = LPT_INT_count * LIN_COUT +  Speed_Count;                              //间隔10ms的脉冲次数
      LPT_INT_count = 0;                                                      //清空LPT中断次数   
    }
    
    /*********************
    20ms程序执行代码段
    *********************/
    if(TIME0flag_20ms == 1)
    {
      TIME0flag_20ms = 0 ;                                                      //清除时间标志位    
 
       for(int i=0;i<DATAROW;i++)
       {
             Sum_Station+= CameraStation[i];
       }       
       Station=(int8)(Sum_Station/DATAROW);
       Sum_Station=0;
      TurnPWM_Value = TurnPWM(Station, MIDSTATION) ;                        //根据CCD位置值计算转向PWM值函数
      FTM_CnV_REG(FTMx[FTM1], CH1) = TurnPWM_Value ;                            //转向赋值   舵机2   
      //FTM_CnV_REG(FTMx[FTM1], CH1) = MIDSTRING ;                             //舵机对中   舵机2 
      
    }
    
    /*********************
    80ms程序执行代码段
    *********************/    
    if(TIME0flag_80ms == 1)
    {        
      TIME0flag_80ms = 0 ;                                                    //清除时间标志位
      //PTA16_OUT = ~PTA16_OUT ;                                                //测试LED闪烁      
     PTA17_OUT = ~PTA17_OUT ;                                                //测试LED闪烁  
      
      //uart_putchar (UART0, 0xff);     //test use 
      //uart_putchar (UART0, 0xff); 
      //uart_putchar (UART0, (uint8)(Speed_Count>>8)); 
      //uart_putchar (UART0, (uint8)(Speed_Count));
      
//      uart_putchar (UART0, '*');   
//      uart_putchar (UART0, '#');   
//      uart_putchar (UART0, '*');   
      finger=&ADdata[0][0];
      gpio_Interrupt_init(PORTD,1, GPI_UP,GPI_DISAB) ;          //场中断
      gpio_Interrupt_init(PORTC,8, GPI_DOWN, GPI_DISAB) ;          //行中断 
      DMA_IRQ_DIS(DMA_CH4);
      DMA_DIS(DMA_CH4);
      for(int i=0;i<DATAROW*g_PointCount;i++)
      {            
        //uart_putchar (UART0, *finger++);     
      }
      gpio_Interrupt_init(PORTD,1, GPI_UP,FALLING) ;          //场中断
      gpio_Interrupt_init(PORTC,8, GPI_DOWN, RING) ;          //行中断 
      
    }
    
    /*********************
    100ms程序执行代码段
    *********************/
    if(TIME0flag_100ms == 1)
    { 
      TIME0flag_100ms = 0 ;
      //uart_putchar (UART0, 0xff);       //test
      SpeedPWM_Value =SpeedControl(Speed_Count,Set_Speed,Speed_P,Speed_I,Speed_D) ;    //PID函数计算PWM值          
        FTM_PWM_Duty(FTM0 , CH0,0);                                           //FTM0 CH0 PWM输出 ；电机控制
        FTM_PWM_Duty(FTM0 , CH1,SpeedPWM_Value);                              //FTM0 CH1 PWM输出 ；电机控制  
    }
    
    if(DMA_Over_Flag==1)                                                        //为防止采集速度快于处理速度，将已扫描的数据进行搬运拷贝
    {
      DMA_Over_Flag=0;      
    //  PTA16_OUT=1;

      if( Sample_Line_Count>= DATAROW )
        Sample_Line_Count = 0 ; 
      
      finger1 = &BUFF[0] ;   //前面15个点为行消隐信号，所以采样行是从15开始。
      
      g_PointCount = DATACOUNT - 0;     //将BUFF的值复制到ADdata
      g_temp0 = Sample_Line_Count  * g_PointCount ;
      finger = &ADdata[Sample_Line_Count][0] ;           
      for(g_temp0 = 0 ;g_temp0 < g_PointCount ;g_temp0++ )
      {
        *finger = *finger1 ;
        finger1 ++ ;
        finger ++ ;             
      } 
      
     Camera_Black(&ADdata[Sample_Line_Count][0],&Rightblackedge[Sample_Line_Count],
                  &Leftblackedge[Sample_Line_Count],&CameraStation[Sample_Line_Count]);
    }  
    
//    if(Sample_Over>=DATAROW)
//    {
//      Sample_Over=0;
//      for(int i=0;i<DATAROW;i++)
//      {
//        Camera_Black(&ADdata[Sample_Line_Count][0],&Rightblackedge[Sample_Line_Count],
//                  &Leftblackedge[Sample_Line_Count],&CameraStation[Sample_Line_Count]);      
//      }      
//    }    
    /*********************
    200ms程序执行代码段
    *********************/
    if(TIME0flag_200ms == 1)
    { 
      TIME0flag_200ms = 0 ;
      
      OLED_Fill(0x00);//黑屏 
      OLED_Print(5,0,"蓝宙电子/LANDZO");  //汉字字符串显示
   
      OLED_Print(10,2,"L:");  //汉字字符串显示
      OLED_Display_Num(42,2,Leftblackedge[0]);  //汉字字符串显示
      OLED_Display_Num(70,2,Leftblackedge[1]);  //汉字字符串显示
      OLED_Display_Num(98,2,Leftblackedge[2]);  //汉字字符串显示
      
      OLED_Print(10,4,"R:");  //汉字字符串显示
      OLED_Display_Num(42,4,Rightblackedge[0]);  //汉字字符串显示
      OLED_Display_Num(70,4,Rightblackedge[1]);  //汉字字符串显示
      OLED_Display_Num(98,4,Rightblackedge[2]);  //汉字字符串显示
      
      OLED_Print(10,6,"C:");  //汉字字符串显示
      OLED_Display_Num(42,6,CameraStation[0]);  //汉字字符串显示
      OLED_Display_Num(70,6,CameraStation[1]);  //汉字字符串显示
     OLED_Display_Num(98,6,CameraStation[2]);  //汉字字符串显示
      
    }
    
  }
}
#endif

#ifdef UART_DEBUG
void main(void)
{
  DisableInterrupts;
  uart_init (UART0 , 115200);
  EnableInterrupts;
  char ch = 'c';
  while(1)
  {
    uart_putchar(UART0, ch);
    BFDly_ms(100);
  }
}
#endif

#ifdef TESTDMA

extern  u8  LPT_INT_count ;
extern  u8  DMA_Over_Flag ;            //采集完成标志位
//extern  u8  LinADCout ;
//extern  uint8_t  LandzoRAM[ ];

//extern u8 TIME0flag_5ms   ;
//extern u8 TIME0flag_10ms  ;
//extern u8 TIME0flag_15ms  ;
//extern u8 TIME0flag_20ms  ;
//extern u8 TIME0flag_80ms  ;
//extern u8 TIME1flag_1s ;


//u8  BUFF[500] ;
//u8 Atem8B0 = 0 ;
//u8 ALineOverCout = 0 ;                 //采集完成黑线行数
//u8 ALineCal = 0 ;          
u8 ADdata[DATAROW][DATACOUNT] ={ 0  } ;        //黑线AD数组存储
//u16 Atemp0 ;
//u8  *finger,*finger1;
u8  checkflg = 0 ;     
void main()
{
  uint8 i=0,j=0;
  DisableInterrupts;                             //禁止总中断 

  /*********************************************************
  初始化程序
  *********************************************************/
   //自行添加代码
 
   uart_init (UART0 , 115200);                      //初始化UART0，输出脚PTA15，输入脚PTA14，串口频率 9600
   
    /***************************
    初始化摄像头采样
    ***************************/
   Camera_init();

   gpio_init (PORTA , 16, GPO,HIGH); 
   gpio_init (PORTA , 17, GPO,HIGH); 
   pit_init_ms(PIT0, 5);                                    //初始化PIT0，定时时间为： 5ms
   pit_init_ms(PIT1, 1000);                                //初始化PIT1，定时时间为： 1000ms 
   
   uint8 checkflg = 0;
   while(checkflg != 1 )  
   {
     checkflg = LandzoIICEEROM_INIT() ;
     BFdelay_1us(100);      // 延时100us 
  //   uart_putchar(UART0,0xff);
   }
   EnableInterrupts;			                    //开总中断  

   /******************************************
    执行程序
    ******************************************/
    while(1)
    {
 
  
      if(DMA_Over_Flag == 1)
      {
        DMA_Over_Flag = 0 ;

       

     gpio_Interrupt_init(PORTD,1, GPI_UP,GPI_DISAB) ;          //场中断
     gpio_Interrupt_init(PORTC,8, GPI_DOWN, GPI_DISAB) ;          //行中断 
        
       uart_putchar(UART0,0xff);
      //uart_putchar(UART0,0xfb);
       //uart_putchar(UART0,0xbb);
       for(i=0;i<DATAROW;i++)
         for(j=0;j<DATACOUNT;j++){
           if(ADdata[i][j]==0xff)
             ADdata[i][j]=0xfe;
           uart_putchar(UART0,ADdata[i][j]);}
     gpio_Interrupt_init(PORTD,1, GPI_UP,FALLING) ;          //场中断

         }
      
      /*********************
      1s程序执行代码段
      *********************/      
//      if(TIME1flag_1s == 1)
//      {
//        PTA17_OUT = ~PTA17_OUT ;
//        TIME1flag_1s = 0 ; 
//     
//      }

    }
}
#endif



