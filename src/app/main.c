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

//#define UART_DEBUG
#define DEBUG
//#define TESTDMA


#ifdef DEBUG

/*************************
����ϵͳ���жϺ�������
*************************/
extern  uint8  LPT_INT_count;                    //LPT ���������

extern uint8 TIME0flag_5ms;                    //PTI0 5ms��־λ
extern uint8 TIME0flag_10ms;                    //PTI0 10ms��־λ
extern uint8 TIME0flag_20ms;                    //PTI0 20ms��־λ 
extern uint8 TIME0flag_80ms;                     //PTI0 80ms��־λ   
extern uint8 TIME0flag_100ms;                     //PTI0 100ms��־λ 
extern uint8 TIME0flag_200ms;                     //PTI0 100ms��־λ 

extern uint16 Sample_Line_Count;                //DMA�ɼ�������
extern uint8  DMA_Over_Flag;                      //DMA�ɼ���ɱ�־λ

/********
ȫ��
********/                
/*********
�ٶȱ���
*********/
uint16 Set_Speed=0 ;                                  //Ŀ���ٶ�
uint16 Speed_Count =0 ;                          //���������
uint16 SpeedPWM_Value=0 ;                          //PID�����PWM 

uint8 Speed_P;
uint8 Speed_I;
uint8 Speed_D;

/*********
ת�����
*********/
uint8  Turn_P=0;
uint8  Turn_D=0;
uint16 TurnPWM_Value=0 ;                        //ת���PWMֵ 
int16  Sum_Station=0;
int8  Station=71 ;                         //CCD�ĺ���λ��
uint8  MIDSTATION = 71 ;                 //CCD��������ʾ�ĺ��ߵ��м�λ��

/********
����ͷ�ɼ�����
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
  DisableInterrupts;                             //��ֹ���ж� 
  /*********************************************************
  ��ʼ��ȫ�ֱ���
  *********************************************************/
  
  Set_Speed = 80 ;  //64
  Speed_P=50;
  Speed_I=0;
  Speed_D=0;
  
  /*********************************************************
  ��ʼ������
  *********************************************************/
  
  uart_init (UART0 , 115200);                      //��ʼ��UART0�������PTA15�������PTA14������Ƶ�� 15200
  gpio_init (PORTA , 16, GPO,HIGH);                //ϵͳ�����LED��ʼ��
  gpio_init (PORTA , 17, GPO,HIGH);                //LED��˸  
  pit_init_ms(PIT0, 1);                            //��ʼ��PIT0����ʱʱ��Ϊ�� 1ms
  
  Camera_init();                                    //��ʼ������ͷ������
  OLED_Init();                                     //��ʼ��OLED������     
  MOTORPWM_init();                                 //�����ʼ��
  TURNPWM_init() ;                                 //ת���ʼ��  
  
  while(checkflag != 1 )  
   {
     checkflag = LandzoIICEEROM_INIT() ; //ͨ������ʹ����ͷ��������ź�
     //checkflag = CameraRegInit() ;        //ͨ������ʹ����ͷ��������ź�
     BFdelay_1us(100);                   // ��ʱ100us 
   }
  
  EnableInterrupts;			            //�����ж�  
  
  /******************************************
  ִ�г���
  ******************************************/
  while(1)
  {
    
    /*********************
    5ms����ִ�д����
    *********************/
    if(TIME0flag_5ms == 1)
    { 
      TIME0flag_5ms = 0 ;
      
    }
    
    /*********************
    10ms����ִ�д����
    *********************/
    if(TIME0flag_10ms == 1)
    {
      TIME0flag_10ms = 0 ;
      
      Speed_Count = LPTMR0_CNR;                                                     //�����������������ֵ
      lptmr_counter_clean();                                                  //����������������ֵ��������գ��������ܱ�֤����ֵ׼ȷ��
      Speed_Count = LPT_INT_count * LIN_COUT +  Speed_Count;                              //���10ms���������
      LPT_INT_count = 0;                                                      //���LPT�жϴ���   
    }
    
    /*********************
    20ms����ִ�д����
    *********************/
    if(TIME0flag_20ms == 1)
    {
      TIME0flag_20ms = 0 ;                                                      //���ʱ���־λ    
 
       for(int i=0;i<DATAROW;i++)
       {
             Sum_Station+= CameraStation[i];
       }       
       Station=(int8)(Sum_Station/DATAROW);
       Sum_Station=0;
      TurnPWM_Value = TurnPWM(Station, MIDSTATION) ;                        //����CCDλ��ֵ����ת��PWMֵ����
      FTM_CnV_REG(FTMx[FTM1], CH1) = TurnPWM_Value ;                            //ת��ֵ   ���2   
      //FTM_CnV_REG(FTMx[FTM1], CH1) = MIDSTRING ;                             //�������   ���2 
      
    }
    
    /*********************
    80ms����ִ�д����
    *********************/    
    if(TIME0flag_80ms == 1)
    {        
      TIME0flag_80ms = 0 ;                                                    //���ʱ���־λ
      //PTA16_OUT = ~PTA16_OUT ;                                                //����LED��˸      
     PTA17_OUT = ~PTA17_OUT ;                                                //����LED��˸  
      
      //uart_putchar (UART0, 0xff);     //test use 
      //uart_putchar (UART0, 0xff); 
      //uart_putchar (UART0, (uint8)(Speed_Count>>8)); 
      //uart_putchar (UART0, (uint8)(Speed_Count));
      
//      uart_putchar (UART0, '*');   
//      uart_putchar (UART0, '#');   
//      uart_putchar (UART0, '*');   
      finger=&ADdata[0][0];
      gpio_Interrupt_init(PORTD,1, GPI_UP,GPI_DISAB) ;          //���ж�
      gpio_Interrupt_init(PORTC,8, GPI_DOWN, GPI_DISAB) ;          //���ж� 
      DMA_IRQ_DIS(DMA_CH4);
      DMA_DIS(DMA_CH4);
      for(int i=0;i<DATAROW*g_PointCount;i++)
      {            
        //uart_putchar (UART0, *finger++);     
      }
      gpio_Interrupt_init(PORTD,1, GPI_UP,FALLING) ;          //���ж�
      gpio_Interrupt_init(PORTC,8, GPI_DOWN, RING) ;          //���ж� 
      
    }
    
    /*********************
    100ms����ִ�д����
    *********************/
    if(TIME0flag_100ms == 1)
    { 
      TIME0flag_100ms = 0 ;
      //uart_putchar (UART0, 0xff);       //test
      SpeedPWM_Value =SpeedControl(Speed_Count,Set_Speed,Speed_P,Speed_I,Speed_D) ;    //PID��������PWMֵ          
        FTM_PWM_Duty(FTM0 , CH0,0);                                           //FTM0 CH0 PWM��� ���������
        FTM_PWM_Duty(FTM0 , CH1,SpeedPWM_Value);                              //FTM0 CH1 PWM��� ���������  
    }
    
    if(DMA_Over_Flag==1)                                                        //Ϊ��ֹ�ɼ��ٶȿ��ڴ����ٶȣ�����ɨ������ݽ��а��˿���
    {
      DMA_Over_Flag=0;      
    //  PTA16_OUT=1;

      if( Sample_Line_Count>= DATAROW )
        Sample_Line_Count = 0 ; 
      
      finger1 = &BUFF[0] ;   //ǰ��15����Ϊ�������źţ����Բ������Ǵ�15��ʼ��
      
      g_PointCount = DATACOUNT - 0;     //��BUFF��ֵ���Ƶ�ADdata
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
    200ms����ִ�д����
    *********************/
    if(TIME0flag_200ms == 1)
    { 
      TIME0flag_200ms = 0 ;
      
      OLED_Fill(0x00);//���� 
      OLED_Print(5,0,"�������/LANDZO");  //�����ַ�����ʾ
   
      OLED_Print(10,2,"L:");  //�����ַ�����ʾ
      OLED_Display_Num(42,2,Leftblackedge[0]);  //�����ַ�����ʾ
      OLED_Display_Num(70,2,Leftblackedge[1]);  //�����ַ�����ʾ
      OLED_Display_Num(98,2,Leftblackedge[2]);  //�����ַ�����ʾ
      
      OLED_Print(10,4,"R:");  //�����ַ�����ʾ
      OLED_Display_Num(42,4,Rightblackedge[0]);  //�����ַ�����ʾ
      OLED_Display_Num(70,4,Rightblackedge[1]);  //�����ַ�����ʾ
      OLED_Display_Num(98,4,Rightblackedge[2]);  //�����ַ�����ʾ
      
      OLED_Print(10,6,"C:");  //�����ַ�����ʾ
      OLED_Display_Num(42,6,CameraStation[0]);  //�����ַ�����ʾ
      OLED_Display_Num(70,6,CameraStation[1]);  //�����ַ�����ʾ
     OLED_Display_Num(98,6,CameraStation[2]);  //�����ַ�����ʾ
      
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
extern  u8  DMA_Over_Flag ;            //�ɼ���ɱ�־λ
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
//u8 ALineOverCout = 0 ;                 //�ɼ���ɺ�������
//u8 ALineCal = 0 ;          
u8 ADdata[DATAROW][DATACOUNT] ={ 0  } ;        //����AD����洢
//u16 Atemp0 ;
//u8  *finger,*finger1;
u8  checkflg = 0 ;     
void main()
{
  uint8 i=0,j=0;
  DisableInterrupts;                             //��ֹ���ж� 

  /*********************************************************
  ��ʼ������
  *********************************************************/
   //������Ӵ���
 
   uart_init (UART0 , 115200);                      //��ʼ��UART0�������PTA15�������PTA14������Ƶ�� 9600
   
    /***************************
    ��ʼ������ͷ����
    ***************************/
   Camera_init();

   gpio_init (PORTA , 16, GPO,HIGH); 
   gpio_init (PORTA , 17, GPO,HIGH); 
   pit_init_ms(PIT0, 5);                                    //��ʼ��PIT0����ʱʱ��Ϊ�� 5ms
   pit_init_ms(PIT1, 1000);                                //��ʼ��PIT1����ʱʱ��Ϊ�� 1000ms 
   
   uint8 checkflg = 0;
   while(checkflg != 1 )  
   {
     checkflg = LandzoIICEEROM_INIT() ;
     BFdelay_1us(100);      // ��ʱ100us 
  //   uart_putchar(UART0,0xff);
   }
   EnableInterrupts;			                    //�����ж�  

   /******************************************
    ִ�г���
    ******************************************/
    while(1)
    {
 
  
      if(DMA_Over_Flag == 1)
      {
        DMA_Over_Flag = 0 ;

       

     gpio_Interrupt_init(PORTD,1, GPI_UP,GPI_DISAB) ;          //���ж�
     gpio_Interrupt_init(PORTC,8, GPI_DOWN, GPI_DISAB) ;          //���ж� 
        
       uart_putchar(UART0,0xff);
      //uart_putchar(UART0,0xfb);
       //uart_putchar(UART0,0xbb);
       for(i=0;i<DATAROW;i++)
         for(j=0;j<DATACOUNT;j++){
           if(ADdata[i][j]==0xff)
             ADdata[i][j]=0xfe;
           uart_putchar(UART0,ADdata[i][j]);}
     gpio_Interrupt_init(PORTD,1, GPI_UP,FALLING) ;          //���ж�

         }
      
      /*********************
      1s����ִ�д����
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



