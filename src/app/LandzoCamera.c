#include "common.h"
#include "include.h"
#include  "Landzocamera.h"
#include "calculation.h"
#include "SCCB.h"
#include "uart.h"


/*********************************************************** 
* �������ƣ�Camera_init
* �������ܣ�������ͷ���г�ʼ��
* ��ڲ�����
* ���ڲ������� 
* �� ע�� 
***********************************************************/
extern uint8 BUFF[500];
void Camera_init(void)
{
     gpio_Interrupt_init(PORTD,1, GPI_UP,FALLING) ;          //���ж� VSYNC
     gpio_Interrupt_init(PORTC,8, GPI_DOWN, RING) ;          //���ж� HREF
     DMA_PORTx2BUFF_Init (DMA_CH4, (void *)&PTB_BYTE0_IN, BUFF, PTB9,
                          DMA_BYTE1, DATACOUNT, DMA_rising_down);
     /*gpio_Interrupt_init(PORTD,14, GPI_UP,FALLING) ;          //���ж� VSYNC
     gpio_Interrupt_init(PORTD,13, GPI_DOWN, RING) ;
     DMA_PORTx2BUFF_Init (DMA_CH4, (void *)&PTE_BYTE0_IN, BUFF, PTD12,
                          DMA_BYTE1, DATACOUNT, DMA_rising_down);*/ //��ʼ��DMAģ��    PTD12ΪPCLK,Ӳ��ΪPTB9
     
}

/*********************************************************** 
* �������ƣ�CameraRegInit
* �������ܣ�������ͷ�Ĵ������г�ʼ��
* ��ڲ�����
* ���ڲ������� 
* �� ע�� 
***********************************************************/
/*uint8_t CameraRegInit(void)           //Sirius�Ĵ��룬��Ҫ��
{
  uint8_t CameraOK = 1;
  //uint16_t i ,EROMCont = 212;
  //uint8_t buff[512];  //�����ź�buffer
  
  SCCBPortInit();               //��ʼ��SCCB�˿�
  
    //��λ����ͷ���мĴ���
    CameraOK = SCCBWriteByte(Predator_COMCTRLA, 0x80);        //RAM���Ƕ�������ͷ�Ļ����������ļ�
    if(!CameraOK)
    {
      uart_sendN(UART0, (uint8 *)"\nCamera Writing Predator_COMCTRLA Failed!", 40);
      return 0;
    }
    
    //��ʱ
    BFDly_ms(50);    
    
    //QVGAģʽ���á�
    CameraOK = SCCBWriteByte(Predator_COMCTRLC,0x24);
    if(!CameraOK)
    {
        uart_sendN(UART0, (uint8 *)"\nCamera Writing OV7620_COMCTRLC Failed!", 39);
        return 0;
    }
    
    //����Camera���Ĵ������ɹ�
    uart_sendN(UART0, (uint8 *)"\nCamera Registers Initial Finally Succeed!", 42);
    return 1;
  
}*/


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

void Camera_Black(uint8 *point1,uint8 *rightblackedge,uint8 *leftblackedge,uint8 *centre_black)
{
  uint8 point[150]={0};
  int16 temp0,temp1;  
  int16 temp_value1,temp_value2;
  uint16 leftedge,rightedge;
  uint16 leftavg,rightavg;
  uint8 leftflag,rightflag;
  uint8 leftcount,rightcount;
  uint8 LINEWITH, LEFTLINEFAV, RINGTLINFAV, FAV;
  static uint8 centre_lastblack =71; 
  
  LINEWITH=4;       //���߿�� 
  LEFTLINEFAV=100;  //���½��������ѹ�仯ֵ��Сֵ
  RINGTLINFAV=100;  //���½��������ѹ�仯ֵ��Сֵ
  FAV=100;          //��ֵ����ֵ 
  leftcount=0;     //����߿�ȼ���ֵ
  rightcount=0;    //�Һ��߿�ȼ���ֵ 
  leftedge=0;      //��߽� 
  rightedge=0;     //�ұ߽�
  leftavg=0;       //��������ߵ�ƽ��ֵ
  rightavg=0;      //�����Һ��ߵ�ƽ��ֵ
  leftflag=0;      //���߱�־λ
  rightflag=0;     //�Ҷ��߱�־λ
  
  for(int i = 0; i < 140; i++)  //��ֵ��
  {
    if( *point1++ > FAV)
    {
      point[i]=0xA0;    
    }
    else
    {
      point[i]=0;
    }   
  } 
 
   /*��������ؿ�ʼ���ҵ����غ�����ѭ��*/
  for(temp0 = centre_lastblack; temp0 > 5; temp0--)               //���������
  {    
    for(temp1 = temp0; temp1 > (temp0 - LINEWITH); temp1--)      //Ѱ��һ�㸽���ļ������Ƿ��ܹ����½���
    {    
      if(temp1 <= 0) break;                                   //������ʵ����������ѭ�� �����λ�ã�            
      
      temp_value1 = point[temp0] - point[temp1];               //�Ƚϰ׵㸽���ļ���ֵ
      
      if(temp_value1>=LEFTLINEFAV)                          //�ж��Ƿ�����Ҫ�󣨵�ѹֵ���䣩
      {
        leftcount++;                                        //������������ֵ��һ
   //     testarry[temp0]=temp_value1;
      }
      else
      {
        leftcount=0;   
   //     testarry[temp0]=0;
      }           
    }    
    
    if(leftcount >= LINEWITH-1 )                        //�ж��Ƿ������������
    {
      leftedge = temp0 ;                                  //�������������ҵ�
      leftflag = 0;                                         //�ҵ����أ���־λ��1 
      break;
    }
    else
    {
      leftcount = 0;                                        //δ�ҵ��������  
      leftflag = 1;                                         //��־λ���
      leftedge = 5;                                         // ���ظ�ֵ 
    }
     
    if(leftedge < 5) leftedge = 5;   
  } 
  /*����ز��ҽ���*/
  
  /*�����ұ��ؿ�ʼ���ҵ����غ�����ѭ��*/
  for(temp0=centre_lastblack;temp0< 135;temp0++)          //�ұ��ز��ҷ�ʽ�Ͳ��������һ��
  {    
    for(temp1=temp0; temp1< ( temp0+LINEWITH );temp1++)
    {
      if(temp1>=135) break;
      
      temp_value2 = point[temp0]-point[temp1];
      
      if(temp_value2 >=RINGTLINFAV)
      {      
        rightcount++;
      }
      else
      {
        rightcount=0;
      }          
      
    }
    
    if( rightcount >= LINEWITH-1 )
    {
      rightedge = temp0;
      rightflag=0;
      break;
    }
    else
    {
      rightcount=0;  
      rightflag=1;
      rightedge=135;
    }
    
    if( rightedge > 135) rightedge=135;
    
  }    
  /*�ұ��ز��ҽ���*/
  
  
  /*�ж����ҵ����صĿɿ���*/
  
  /*����صĿɿ����ж�*/
  if(leftflag==0)
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
      if(temp0>=135)break;
      
      temp_value1 = point[temp0-1]-leftavg;                  //�׵������ƽ��ֵ���Ƚ�
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
  if(rightflag==0)                      // �ұ߽��жϿɿ��ԣ�����߽��жϷ�ʽһ��                  
  {
    rightcount=0;
    for(temp0=rightedge;temp0<( rightedge+LINEWITH );temp0++)
    {
      if(temp0>=135)break;
      rightcount++;
      rightavg+=point[temp0-1];
    }
    
    rightavg=rightavg/rightcount;
    
    rightcount=0;
    for(temp0=rightedge;temp0>( rightedge-LINEWITH );temp0--)
    {
      if(temp0<=0)break;
      
      temp_value2 = point[temp0] - rightavg;
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
      *rightblackedge=135;
      rightcount=0;
      rightflag=0;
    }
    
  }
  else
  {
    *rightblackedge=135;
  }
  
  /*�ұ߽�ɿ����жϽ���*/

  if( ( leftflag==0 )&&( rightflag==0 ) )
  {
  *centre_black = (uint8)(( leftedge + rightedge )/2);
  centre_lastblack = *centre_black;
  }
  else if( ( leftflag==0 )&&( rightflag==1 ) )
  {
   *centre_black = (uint8)(( leftedge + rightedge )/2);
   centre_lastblack = *centre_black;
  }
  else if( ( leftflag==1 )&&( rightflag==0 ) )
  {
   *centre_black = (uint8)(( leftedge + rightedge )/2);
   centre_lastblack = *centre_black;
  }
  else if( ( leftflag==1 )&&( rightflag==1 ) )
  {
   *centre_black= centre_lastblack;
  }   
  
   *leftblackedge=leftedge;
  *rightblackedge=rightedge;
  
}
