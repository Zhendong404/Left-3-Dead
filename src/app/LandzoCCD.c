#include "common.h"
#include "include.h"
#include "calculation.h"
#include "LandzoCCD.h"



/*************************************************************************
*                             ������ӹ�����
*
*  �������ƣ�CCD_init
*  ����˵����CCD��ʼ��
*  ����˵����
*  �������أ���
*  �޸�ʱ�䣺2012-10-20
*  ��    ע��
*************************************************************************/
void CCD_init(void)
{
  gpio_init (PORTE , 4, GPO,HIGH);        //��ʼ��SI
  gpio_init (PORTE , 5, GPO,HIGH);        //��ʼ��CLK
  adc_init(ADC1, AD6b) ;                  //��ʼ��AD
  
}

/*************************************************************************
*                           ������ӹ�����
*
*  �������ƣ�StartIntegration
*  ����˵����CCD��������
*  ����˵����
*  �������أ���
*  �޸�ʱ�䣺2012-10-20
*  ��    ע��
*************************************************************************/
void StartIntegration(void) {
  
  uint8_t i;
  
  SI_SetVal();            /* SI  = 1 */
  SamplingDelay();
  CLK_SetVal();           /* CLK = 1 */
  SamplingDelay();
  SI_ClrVal();            /* SI  = 0 */
  SamplingDelay();
  CLK_ClrVal();           /* CLK = 0 */
  
  for(i=0; i<127; i++) {
    SamplingDelay();
    SamplingDelay();
    CLK_SetVal();       /* CLK = 1 */
    SamplingDelay();
    SamplingDelay();
    CLK_ClrVal();       /* CLK = 0 */
  }
  SamplingDelay();
  SamplingDelay();
  CLK_SetVal();           /* CLK = 1 */
  SamplingDelay();
  SamplingDelay();
  CLK_ClrVal();           /* CLK = 0 */
}


/*************************************************************************
*                           ������ӹ�����
*
*  �������ƣ�ImageCapture
*  ����˵����CCD��������
*  ����˵����* ImageData   ��������
*  �������أ���
*  �޸�ʱ�䣺2012-10-20
*  ��    ע��
*ImageData =  ad_once(ADC1, AD6a, ADC_8bit);
*************************************************************************/

void ImageCapture(uint8_t * ImageData) {
  
  uint8_t i;
  extern u8 AtemP ;
  
  SI_SetVal();            /* SI  = 1 */
  SamplingDelay();
  CLK_SetVal();           /* CLK = 1 */
  SamplingDelay();
  SI_ClrVal();            /* SI  = 0 */
  SamplingDelay();
  
  //Delay 10us for sample the first pixel
  /**/
  for(i = 0; i < 90; i++) 
  {
    SamplingDelay() ;  //200ns
  }
  
  //Sampling Pixel 1
  
  *ImageData =  ad_once(ADC1, AD6b, ADC_8bit);
  ImageData ++ ;
  CLK_ClrVal();           /* CLK = 0 */
  
  for(i=0; i<7; i++) 
  {
    SamplingDelay();
    SamplingDelay();
    CLK_SetVal();       /* CLK = 1 */
    SamplingDelay();
    SamplingDelay();
    SamplingDelay();
    SamplingDelay();
    //Sampling Pixel 2~128
    
    *ImageData =  ad_once(ADC1, AD6b, ADC_8bit);
    ImageData ++ ;
    CLK_ClrVal();       /* CLK = 0 */
  }
  
  for(i=7; i<120; i++) 
  {
    SamplingDelay();
    SamplingDelay();
    CLK_SetVal();       /* CLK = 1 */
    SamplingDelay();
    SamplingDelay();
    //Sampling Pixel 2~128
    
    *ImageData =  ad_once(ADC1, AD6b, ADC_8bit);
    ImageData ++ ;
    CLK_ClrVal();       /* CLK = 0 */
  }
  for(i=120; i<127; i++) 
  {
    SamplingDelay();
    SamplingDelay();
    CLK_SetVal();       /* CLK = 1 */
    SamplingDelay();
    SamplingDelay();
    SamplingDelay();
    SamplingDelay();
    //Sampling Pixel 2~128
    
    *ImageData =  ad_once(ADC1, AD6b, ADC_8bit);
    ImageData ++ ;
    CLK_ClrVal();       /* CLK = 0 */
  }
  
  SamplingDelay();
  SamplingDelay();
  CLK_SetVal();           /* CLK = 1 */
  SamplingDelay();
  SamplingDelay();
  CLK_ClrVal();           /* CLK = 0 */
}


/*************************************************************************
*                           ������ӹ�����
*
*  �������ƣ�CalculateIntegrationTime
*  ����˵���������ع�ʱ��
*  ����˵����
*  �������أ���
*  �޸�ʱ�䣺2012-10-20
*  ��    ע��
*************************************************************************/

/* �ع�ʱ�䣬��λms */
u8 IntegrationTime = 100;
void CalculateIntegrationTime(void) {
  extern u8 Pixel[128];
  /* 128�����ص��ƽ��ADֵ */
  u8 PixelAverageValue;
  /* 128�����ص��ƽ����ѹֵ��10�� */
  u8 PixelAverageVoltage;
  /* �趨Ŀ��ƽ����ѹֵ��ʵ�ʵ�ѹ��10�� */
  s16 TargetPixelAverageVoltage = 13;
  /* �趨Ŀ��ƽ����ѹֵ��ʵ��ֵ��ƫ�ʵ�ʵ�ѹ��10�� */
  s16 PixelAverageVoltageError = 0;
  /* �趨Ŀ��ƽ����ѹֵ�����ƫ�ʵ�ʵ�ѹ��10�� */
  s16 TargetPixelAverageVoltageAllowError = 2;
  
  /* ����128�����ص��ƽ��ADֵ */
  PixelAverageValue = PixelAverage(128,Pixel);
  /* ����128�����ص��ƽ����ѹֵ,ʵ��ֵ��10�� */
  PixelAverageVoltage = (uint8_t)((int)(PixelAverageValue * 33.0 / 256) );
  
  //   uart_putchar(UART0,0XBB); 
  //  uart_putchar(UART0,PixelAverageValue); 
  //  uart_putchar(UART0,PixelAverageVoltage); 
  
  PixelAverageVoltageError = TargetPixelAverageVoltage - PixelAverageVoltage;
  if(PixelAverageVoltageError < -TargetPixelAverageVoltageAllowError)
    IntegrationTime--;
  if(PixelAverageVoltageError > TargetPixelAverageVoltageAllowError)
    IntegrationTime++;
  if(IntegrationTime <= 1)
    IntegrationTime = 1;
  if(IntegrationTime >= 100)
    IntegrationTime = 100;
  //  uart_putchar(UART0,PixelAverageVoltageError); 
  // uart_putchar(UART0,IntegrationTime); 
}


/*************************************************************************
*                           ������ӹ�����
*
*  �������ƣ�PixelAverage
*  ����˵����������ľ�ֵ����
*  ����˵����
*  �������أ���
*  �޸�ʱ�䣺2012-10-20
*  ��    ע��
*************************************************************************/
u8 PixelAverage(u8 len, u8 *data) {
  uint8_t i;
  unsigned int sum = 0;
  for(i = 0; i<len; i++) {
    sum = sum + *data++;
  }
  return ((uint8_t)(sum/len));
}
/*************************************************************************
*                           ������ӹ�����
*
*  �������ƣ�SendHex
*  ����˵�����ɼ���������
*  ����˵����
*  �������أ���
*  �޸�ʱ�䣺2012-10-20
*  ��    ע��
*************************************************************************/
void SendHex(uint8_t hex) {
  uint8_t temp;
  temp = hex >> 4;
  if(temp < 10) {
    uart_putchar(UART0,temp + '0');
  } else {
    uart_putchar(UART0,temp - 10 + 'A');
  }
  temp = hex & 0x0F;
  if(temp < 10) {
    uart_putchar(UART0,temp + '0');
  } else {
    uart_putchar(UART0,temp - 10 + 'A');
  }
}
/*************************************************************************
*                           ������ӹ�����
*
*  �������ƣ�SendImageData
*  ����˵����
*  ����˵����
*  �������أ���
*  �޸�ʱ�䣺2012-10-20
*  ��    ע��
*************************************************************************/
void SendImageData(uint8_t * ImageData) {
  
  uint8_t i;
  uint8_t crc = 0;
  
  /* Send Data */
  uart_putchar(UART0,'*');
  uart_putchar(UART0,'L');
  uart_putchar(UART0,'D');
  
  SendHex(0);
  SendHex(0);
  SendHex(0);
  SendHex(0);
  
  for(i=0; i<128; i++) {
    SendHex(*ImageData++);
  }
  
  SendHex(crc);
  uart_putchar(UART0,'#');
}
/*************************************************************************
*                           ������ӹ�����
*
*  �������ƣ�SamplingDelay
*  ����˵����CCD��ʱ���� 200ns
*  ����˵����
*  �������أ���
*  �޸�ʱ�䣺2012-10-20
*  ��    ע��
*************************************************************************/
void SamplingDelay(void)
{
  volatile u8 i ;
  for(i=0;i<1;i++) 
  {
    asm("nop");
    asm("nop");
  }
  
}

/**************************************************************
*
*               ����CCD�źź���ʶ����
*
*     �������ƣ�CCD_Black
*    ����˵��������ʶ����
*    ����˵����
*    ��������:
*    �޸�ʱ�䣺2013-03-15
*    ��    ע��
*************************************************************/  
int16 testarry[130]={0};
void CCD_Black(uint8 *point,uint8 *rightblackedge,uint8 *leftblackedge,int8 *centre_black)
{
  int16 temp0,temp1;
  uint8 leftedge,rightedge;
  uint16 leftavg,rightavg;
  uint8 leftflag,rightflag;
  int16 temp_value1,temp_value2;
  uint8 leftcount,rightcount;
  uint8 LINEWITH,LEFTLINEFAV, RINGTLINFAV;
  static uint8 centre_lastblack =64;
  
  LINEWITH=7;       //���߿�� 
  LEFTLINEFAV=15;  //���½��������ѹ�仯ֵ��Сֵ
  RINGTLINFAV=15;  //���½��������ѹ�仯ֵ��Сֵ
  leftcount=0;     //����߿�ȼ���ֵ
  rightcount=0;    //�Һ��߿�ȼ���ֵ 
  leftedge=0;      //��߽� 
  rightedge=0;     //�ұ߽�
  leftflag=0;      //���߱�־λ
  rightflag=0;     //�Ҷ��߱�־λ
  leftavg=0;       // ���������ƽ��ֵ
  rightavg=0;      // �����Һ���ƽ��ֵ
 
   /*��������ؿ�ʼ���ҵ����غ�����ѭ��*/
  for(temp0=centre_lastblack;temp0>5;temp0--)               //���������
  {
    
    for(temp1=temp0; temp1>( temp0-LINEWITH );temp1--)      //Ѱ��һ�㸽���ļ������Ƿ��ܹ����½���
    {    
      if(temp1<=0) break;                                   //������ʵ����������ѭ��             
      
      temp_value1= point[temp0]-point[temp1];               //�Ƚϰ׵㸽���ļ���ֵ
      
      if(temp_value1>=LEFTLINEFAV)                          //�ж��Ƿ�����Ҫ��
      {
        leftcount++;                                        //������������ֵ��һ
      //  testarry[temp0]=temp_value1;
      }
      else
      {
        leftcount=0;   
     //   testarry[temp0]=0;
      }           
    }
    
    
    if(leftcount >= (LINEWITH -2) )                        //�ж��Ƿ������������
    {
      leftedge = temp0 ;                                  //�������������ҵ�
      leftflag=1;                                         //�ҵ����أ���־λ��1 
      break;
    }
    else
    {
      leftcount=0;                                        //δ�ҵ��������  
      leftflag=0;                                         //��־λ���
      leftedge=5;                                         // ���ظ�ֵ 
    }
     
    if(leftedge<5) leftedge = 5;   
  } 
  /*����ز��ҽ���*/
  
  /*�����ұ��ؿ�ʼ���ҵ����غ�����ѭ��*/
  for(temp0=centre_lastblack;temp0< 121;temp0++)          //�ұ��ز��ҷ�ʽ�Ͳ��������һ��
  {    
    for(temp1=temp0; temp1< ( temp0+LINEWITH );temp1++)
    {
      if(temp1>=128) break;
      
      temp_value2 = point[temp0]-point[temp1];
      
      if(temp_value2 >=RINGTLINFAV)
      {      
        rightcount++;
       // testarry[temp0]=temp_value2;
      }
      else
      {
        rightcount=0;
     //   testarry[temp0]=0;
      }          
      
    }
    
    if( rightcount >= (LINEWITH-2) )
    {
      rightedge = temp0;
      rightflag=1;
      break;
    }
    else
    {
      rightcount=0;  
      rightflag=0;
      rightedge=121;
    }
    
    if( rightedge > 121) rightedge=121;
    
  }    
  /*�ұ��ز��ҽ���*/
  
  
  /*�ж����ҵ����صĿɿ���*/
  
  /*����صĿɿ����ж�*/
  if(leftflag==1)
  {
    /*������ߵ�ƽ��ֵ*/
    leftcount=0;
    for(temp0=leftedge;temp0>( leftedge-LINEWITH );temp0--)    
    {
      if(temp0<=0)break;
      leftcount++;
      leftavg+=point[temp0+1];
    }
    
    leftavg=leftavg/leftcount;      
    
    
    /*�Ƚϰ׵׺ͺ���֮��Ĳ�ֵ*/
    leftcount=0;
    for(temp0=leftedge;temp0<( leftedge+LINEWITH );temp0++)   //�жϱ��ظ����İ׵㣬�Ƿ���������
    {
      if(temp0>=127)break;
      
      temp_value1 = point[temp0-1]-leftavg;                  //�׵������ƽ��ֵ���Ƚ�
      testarry[temp0]=temp_value1; 
      if( temp_value1>= LEFTLINEFAV)                         //�ж��Ƿ�����Ҫ��
      { 
        leftcount++;                                         //�ҵ����أ���־λ��1 
      }
      else
      {
        leftcount=0;                                         // ��־λ���
      }
    }
    
    if(leftcount>(LINEWITH-2))                               //�ж��Ƿ������������
    {
      *leftblackedge=leftedge;                               //�������������㸳ֵ������
      leftedge=1;
    }
    else
    {
      *leftblackedge=5;
      leftcount=0;                                          //δ�ҵ�������� 
      leftflag=0;                                           //��־λ���
    }    
  }
  else
  {
    *leftblackedge=5;
  }
  /*��߽�ɿ����жϽ���*/
  
  
  
  /*�ұ߽�ɿ����жϿ�ʼ*/
  if(rightflag==1)                      // �ұ߽��жϿɿ��ԣ�����߽��жϷ�ʽһ��                  
  {
    rightcount=0;
    for(temp0=rightedge;temp0<( rightedge+LINEWITH );temp0++)
    {
      if(temp0>=127)break;
      rightcount++;
      rightavg+=point[temp0-1];
    }
    
    rightavg=rightavg/rightcount;
    
    rightcount=0;
    for(temp0=rightedge;temp0>( rightedge-LINEWITH );temp0--)
    {
      if(temp0<=0)break;
      
      temp_value2 = point[temp0] - rightavg;
      testarry[temp0]=temp_value2;
      if(temp_value2>= RINGTLINFAV)
      {
        rightcount++;
      }
      else
      {
        rightcount=0;
      }
      
    }
    
    if(rightcount>(LINEWITH-2))
    {
      *rightblackedge=rightedge;
      rightedge=1;
    }
    else
    {
      *rightblackedge=121;
      rightcount=0;
      rightflag=0;
    }
    
  }
  else
  {
    *rightblackedge=121;
  }
  
  /*�ұ߽�ɿ����жϽ���*/
  
//  *leftblackedge=leftedge;
//  *rightblackedge=rightedge;

  if( ( leftflag==1 )&&( rightflag==1 ) )
  {
  *centre_black = (uint8)(( *leftblackedge + *rightblackedge )/2);
  centre_lastblack = *centre_black;
  }
  else if( ( leftflag==1 )&&( rightflag==0 ) )
  {
   *centre_black = (uint8)(( *leftblackedge + *rightblackedge )/2);
   centre_lastblack = *centre_black;
  }
  else if( ( leftflag==0 )&&( rightflag==1 ) )
  {
   *centre_black = (uint8)(( *leftblackedge + *rightblackedge )/2);
   centre_lastblack = *centre_black;
  }
  else if( ( leftflag==0 )&&( rightflag==0 ) )
  {
   *centre_black= centre_lastblack;
  }   
  
//    while(!(UART_S1_REG(UARTx[UART0]) & UART_S1_TDRE_MASK));
//    UART_D_REG(UARTx[UART0]) = 0xff;
//    while(!(UART_S1_REG(UARTx[UART0]) & UART_S1_TDRE_MASK));
//    UART_D_REG(UARTx[UART0]) = 0xff;
//    uart_sendN (UART0, point, 128);
//    
//    while(!(UART_S1_REG(UARTx[UART0]) & UART_S1_TDRE_MASK));
//    UART_D_REG(UARTx[UART0]) = 0xee;
//    while(!(UART_S1_REG(UARTx[UART0]) & UART_S1_TDRE_MASK));
//    UART_D_REG(UARTx[UART0]) = 0xee;
//    
//    while(!(UART_S1_REG(UARTx[UART0]) & UART_S1_TDRE_MASK));
//    UART_D_REG(UARTx[UART0]) = *leftblackedge;
//    while(!(UART_S1_REG(UARTx[UART0]) & UART_S1_TDRE_MASK));
//    UART_D_REG(UARTx[UART0]) = *rightblackedge;    
//    while(!(UART_S1_REG(UARTx[UART0]) & UART_S1_TDRE_MASK));
//    UART_D_REG(UARTx[UART0]) = *centre_black;
//    
//    while(!(UART_S1_REG(UARTx[UART0]) & UART_S1_TDRE_MASK));
//    UART_D_REG(UARTx[UART0]) = 0xdd;
//    while(!(UART_S1_REG(UARTx[UART0]) & UART_S1_TDRE_MASK));
//    UART_D_REG(UARTx[UART0]) = 0xdd;   
//    
}

///**************************************************************
//*
//*               ����CCD�źź���ʶ����
//*
//*     �������ƣ�CCD_Black
//*    ����˵��������ʶ����
//*    ����˵����
//*    ��������:
//*    �޸�ʱ�䣺2013-03-15
//*    ��    ע��
//*************************************************************/  
//void CCD_Black(uint8 *ImageData,uint8 *rightblackedge,uint8 *leftblackedge,int8 *centre_black)
//{
//  static int8 Centre_BlackOld;
//  uint8 Threshold_Value,Threshold_Value1=0,Threshold_Value2=255;
//  u8 Binaryzation[128];
//  
//  for(uint8 i=0;i<128;i++)
//  {
//   if(ImageData[i]>Threshold_Value1)
//     Threshold_Value1=ImageData[i];
//   if(ImageData[i]<Threshold_Value2)
//     Threshold_Value2=ImageData[i];  
//  }
//  
//  
//  Threshold_Value=(uint8)((Threshold_Value1+Threshold_Value2)/2.0);
//
//  for(int i=0;i<128;i++)  
//  {    
//    if(ImageData[i]>Threshold_Value)
//    {
//      Binaryzation[i]=0xff;
//    } 
//    else
//    {
//      Binaryzation[i]=0;
//    }    
//  }
//  
//  for(int i=Centre_BlackOld;i>3;i--)  //ȥ��ǰ3����
//  {
//    
//    if((!Binaryzation[i-1])&&(Binaryzation[i])&&(Binaryzation[i+1]))
//    {
//      *leftblackedge=i;break;
//    } 
//    else
//      *leftblackedge=3;
//  }
//  
//  for(int i=Centre_BlackOld;i<125;i++)  //ȥ����3����
//  {
//    if((Binaryzation[i-1])&&(Binaryzation[i])&&(!Binaryzation[i+1]))
//    {
//      *rightblackedge=i-1;break;
//    }
//    else
//      *rightblackedge=124;
//  }
//  
//  *centre_black=(uint8)((*leftblackedge+*rightblackedge)/2);
//  Centre_BlackOld = *centre_black;
//  
//  if(*centre_black<20)*centre_black=20;
//  if(*centre_black>107)*centre_black=107;
//  
//}