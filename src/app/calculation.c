#include "common.h"
#include "include.h"
#include "calculation.h"


/*********************************************************** 
�������ƣ�MOTORPWM_init
�������ܣ�
��ڲ�����
���ڲ������� 
�� ע�� 
***********************************************************/
void  MOTORPWM_init(void)
{
    lptmr_counter_init(LPT0_ALT2, LIN_COUT, 2, LPT_Rising)  ;   //��ʼ����������� ��PTC5���벶��ţ�LIN_cout =100��Ԥ����Ϊ2�������ز��� 
    FTM_PWM_init(FTM0 , CH0, 80000,0);                          //���ռ�ձ����ó�ʼ��    ռ�ձ� = duty /(MOD +1 ) ;FTM_CnV_REG(FTMx[ftmn], ch) = cv;
    FTM_PWM_init(FTM0 , CH1, 80000,0);                          //���ռ�ձ����ó�ʼ��    ռ�ձ� = duty /(MOD +1 ) ;FTM_CnV_REG(FTMx[ftmn], ch) = cv;
//    FTM_PWM_init(FTM0 , CH2, 80000,0);                          //���ռ�ձ����ó�ʼ��    ռ�ձ� = duty /(MOD +1 ) ;FTM_CnV_REG(FTMx[ftmn], ch) = cv;
//    FTM_PWM_init(FTM0 , CH3, 80000,0);                          //���ռ�ձ����ó�ʼ��    ռ�ձ� = duty /(MOD +1 ) ;FTM_CnV_REG(FTMx[ftmn], ch) = cv;
}


/*********************************************************** 
�������ƣ�TURNPWM_init
�������ܣ�
��ڲ�����
���ڲ������� 
�� ע�� 
***********************************************************/
void  TURNPWM_init(void)
{
      
     // FTM_PWM_init(FTM1, CH0 , 180,30);                           //���ռ�ձ����ó�ʼ��   MOD =17361 ;���1
      FTM_PWM_init(FTM1, CH1 , 180,30);                           //���ռ�ձ����ó�ʼ��   MOD =17361 ;���2
      FTM_CnV_REG(FTMx[FTM1], CH1) = MIDSTRING ; 
}
/*********************************************************** 
�������ƣ�TurnPWM
�������ܣ�����ת��ֵ�ͽǶȴ���������ת��ֵ
��ڲ�����TurnPosition          �������λ��
          TurnMidPosition       �����е�ֵ

���ڲ������� 
�� ע�� 
***********************************************************/
int16 TurnPWM(uint8 TurnPosition, uint8 TurnMidPosition)
{   
    s16 direction;
    s16 TurnPWM ;
    static s16 TurnKP ,TurnKD ;
    static s16 direction0 = 60;
    direction = TurnPosition - TurnMidPosition ;
    
    if((direction > -20)&&(direction<0))      //�����ת
    {
      TurnKP = 10 ;
      TurnKD = 0 ;
    }
    else if((direction>-35)&&(direction > -20))
    { 
      TurnKP = 15 ;
      TurnKD = 0 ;
    }
    if((direction>0)&&(direction < 20))      //�����ת
    { 
      TurnKP = 40 ;
      TurnKD = 0 ;
    }
    else if((direction>20)&&(direction <35))
    { 
      TurnKP = 45 ;
      TurnKD = 0 ;
    }
    else
    {
     TurnKP = 40 ;
     TurnKD = 0 ;
    }
    
    
    TurnPWM =  TurnKP * direction + TurnKD * (direction - direction0);
    if(TurnPWM > TURNPWMMAX) {TurnPWM = TURNPWMMAX ;}
    else if (TurnPWM < TURNPWMMIN ) {TurnPWM = TURNPWMMIN ;}
    
    direction0 = direction ;
    TurnPWM += MIDSTRING ;
    
    return TurnPWM ;
} 
/*
** ===================================================================
** SpeedPID
   ���룺speedCount�ɼ����٣�AmSpeed Ŀ�공��  ��  
   ��� ��SpeedPWMOUT  ���㳵�� ��
** ===================================================================
*/

int16 SpeedControl(int16 speedCount,int16 AmSpeed,uint8 speedKP,uint8 speedKI,uint8 speedKD)
{
  
  static float Speed1_Err,SumErrSpeed;  //��̬�����洢�м����
  float Speed2_Err,Speed_EC;
  float Speed_P_Value,Speed_D_Value ;
  
  int16  SpeedPWMOUT;
  
  Speed2_Err = Speed1_Err ;                //����һ�ε�ƫ���
  
  Speed1_Err = AmSpeed - speedCount  ;      //  �����µ�ƫ��ֵ
  
  Speed_EC = Speed1_Err - Speed2_Err ;      //  �����µ�ƫ��仯ֵ 
   
  Speed_P_Value =  Speed1_Err * speedKP/10.0 ;   //  ����ʽPID���Ƽ���P������
  
  SumErrSpeed  +=  Speed1_Err * speedKI ;    //����ʽPID���Ƽ���I������

  Speed_D_Value =  Speed_EC   *  speedKD/100.0 ;     //  ����ʽPID���Ƽ���D������
  
  SpeedPWMOUT = (int16)(Speed_P_Value + SumErrSpeed + Speed_D_Value);
  if(SpeedPWMOUT < SPEED_PWM_MIN )
  {
   SpeedPWMOUT = SPEED_PWM_MIN ;
  }
  else if(SpeedPWMOUT > SPEED_PWM_MAX)
  {
    SpeedPWMOUT = SPEED_PWM_MAX ;
         
  }
  if(SpeedPWMOUT<=0)SpeedPWMOUT=0;
          
   return  SpeedPWMOUT ;  
}







 