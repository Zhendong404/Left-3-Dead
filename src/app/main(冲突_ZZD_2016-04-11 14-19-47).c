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

#define  NORMAL
//#define  IMAGEGET

/*************************
����ϵͳ��ȫ�ֱ���
*************************/

#ifdef  NORMAL

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
  
    DCMoto_init();          //��ʼ�����
    
    TURNPWM_init();
    //ServoInit();          // ��ʼ�����
    //Servo_init();           //�Զ�����г�ʼ��
    //QuadInit();           //��ʼ��������
    //OLEDInit();           //��ʼ��OLED
    //CameraInit();         //��ʼ������ͷ
    
    
    /***************************
    ��ʼ������ͷ����
    ***************************/
   CCD_INC ();

   gpio_init (PORTA , 16, GPO,HIGH); 
   gpio_init (PORTA , 17, GPO,HIGH); 
   
   pit_init_ms(PIT0, 5);                                    //��ʼ��PIT0����ʱʱ��Ϊ�� 5ms
   pit_init_ms(PIT1, 1000);                                //��ʼ��PIT1����ʱʱ��Ϊ�� 1000ms 
   
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
   FTM_PWM_Duty(FTM0, CH5, 0);
   u8 duty = 30;
    while(1)
    {
 /*
       uint8 ImageProFlag = 0;
      if(DMA_Over_Flg == 1)
      {
            DMA_Over_Flg = 0 ;
            
           

            gpio_Interrupt_init(PORTD,1, GPI_UP,GPI_DISAB) ;          //���ж�
            gpio_Interrupt_init(PORTC,8, GPI_DOWN, GPI_DISAB) ;          //���ж� 
            
    //        ImageProFlag = ImagePro();
           
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
           gpio_Interrupt_init(PORTD,1, GPI_UP,FALLING) ;          //���ж�

        }
      */
     
     
          //SportControl(ImageProFlag);

          
          /*********************
          1s����ִ�д����
          *********************/      
          if(TIME1flag_1s == 1)
          {
            if(duty == 30)
            {
              duty = 120;
            }
            else
            {
              duty = 30;
            }
            FTM_PWM_Duty(FTM1, CH0, duty);
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



void main()
{
  u16 i=0,j=0;
      DisableInterrupts;                             //��ֹ���ж� 

  /*********************************************************
  ��ʼ������
  *********************************************************/
   //������Ӵ���
 
   uart_init (UART0 , 115200);                      //��ʼ��UART0�������PTA15�������PTA14������Ƶ�� 9600
   
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
           
           if(gpio_get(PORTE,0) == LOW)
           {

              gpio_Interrupt_init(PORTD,1, GPI_UP,GPI_DISAB) ;          //���ж�
              gpio_Interrupt_init(PORTC,8, GPI_DOWN, GPI_DISAB) ;          //���ж� 
              
      //        ImageProFlag = ImagePro();
             
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


  
