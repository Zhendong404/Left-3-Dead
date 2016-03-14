/******************************************************************************/
/*******************************************************************************
  �ļ������˶�����C�ļ�RunControl.c
  ��  �ܣ�ƫ����ȡ��PID���������Ƶ�������ƶ����
  ��  �ڣ�2014.11.15
  ��  �ߣ�HJZ & YCR
  ��  ע��
*******************************************************************************/
/******************************************************************************/
#include "RunControl.h"

//ƫ��ѡȡ�ж�Ӧ��Ȩ��
uint8 const DeviSelRowWeight[CameraHight] = 
{
0
};

int16 DeviNow = 0;                  //��ǰƫ��, ���Կ��ǻ���float��
int16 DeviPre = 0;                  //��ǰƫ��, ���Կ��ǻ���float��
uint8 DeviFlag = 0;                //ƫ����ȡ��־λ�����߳������Ӧ��д��ڼ���ƫ�
uint8 DeviSelRowStart = 30;                //ƫ����ȡʱ��ѡ�����ʼ�С�
uint8 DeviSelRowEnd = 45;                //ƫ����ȡʱ��ѡ�����ֹ�С���
uint8 DeviSelRow02 = 0;                //ƫ����ȡʱ��ѡ�е��кš�
uint8 DeviRowChosen = 0;               //��ȡƫ��ʱѡȡ���У���ָ����Χûѡȡ������ƫ���С��������Чֵ��
int16 DeviGoStraightLim = 3;          //ƫ��С�ڸ�ֵʱ��ֱ�ߡ�

float ServoKp = 4;                 //���PID��P����
float ServoKd = 2;                 //���PID��D����
float ServoK1 = 150;                 //���PID��P�����йص�ϵ��
uint16 ServoPIDMax = 2086;             //���PID���Ƶ����ֵ����ת
uint16 ServoPIDMin = 1617;             //���PID���Ƶ���Сֵ����ת
uint16 ServoPIDCen = 1851;             //���PID���Ƶ�����ֵ��ֱ�ߡ�


float MotorLeftKp = 1;             //����PID��P����    
float MotorLeftKd = 1;             //����PID��D����
uint16 MotorLeftPIDMax;         //����PID���Ƶ����ֵ
uint16 MotorLeftPIDMin;         //����PID���Ƶ���Сֵ

float MotorRightKp = 1;            //�ҵ��PID��P����     
float MotorRightKd = 1;            //�ҵ��PID��D����
uint16 MotorRightPIDMax;        //�ҵ��PID���Ƶ����ֵ
uint16 MotorRightPIDMin;        //�ҵ��PID���Ƶ���Сֵ



/*
//------------------------------------------------------------------------------
//��������MotorControl
//��  �ܣ����ҵ��PWM����
//��  ����motor_leftΪ����PWM��motor_rightΪ�ҵ��PWM
//��  �أ���
//˵  ����PWMռ�ձȼ��㷽��CnV/MOD
//------------------------------------------------------------------------------
void MotorControl(int32 motor_left,int32 motor_right)
{
	//�������||ˤ������رյ��
	if((!switch4) || fall_flag)
  {
		FTM0_C4V=0;
		FTM0_C5V=0;
		FTM0_C6V=0;
		FTM0_C7V=0;
	}
  else
  {
    //�����������
    if(motor_left>0)
      motor_left+=MOTOR_DEATH;
    else
      motor_left-=MOTOR_DEATH;
    if(motor_right>0)
      motor_right+=MOTOR_DEATH;
    else
      motor_right-=MOTOR_DEATH;

    //����PWM����
    if(motor_left>=0)
    {
      FTM0_C4V=0;
      FTM0_C5V=motor_left;
    }
    else
    {
			FTM0_C5V=0;
      FTM0_C4V=-motor_left;
    }
    //�ҵ��PWM����
    if(motor_right>=0)
    {
			FTM0_C6V=motor_right;
      FTM0_C7V=0;
    }
    else
    {
			FTM0_C7V=-motor_right;
      FTM0_C6V=0;
    }
	}
}

*/

//======================================================================
//��������DeviationGet
//��  �ܣ�ƫ�ƫ��仯�ʵļ���
//��  ����
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺
//˵  ����
//      
//             
//======================================================================
uint8 DeviationGet(void)
{
  uint8 row;
  int16 tempDevi;
  
  for(row = DeviSelRowStart; row < DeviSelRowEnd; row++)
  {
    if(CenterLineLoc[row] != MaxValUint8)
    { //ָ����Χ���ҵ�����Ч��.
      tempDevi = CenterLineLoc[row] - PhyCenterCol;
      //��ƫ���С����ƫ����Ϊ0��ѡȡ����0(ѡȡ��Χ���ܰ���0)��
      if((tempDevi < DeviGoStraightLim)&&(tempDevi > -DeviGoStraightLim))
      {
        tempDevi = 0;
        DeviRowChosen = 0;
      }
      //ƫ�����ƫ���ø��£�ѡȡ�и��¡�
      else
      {
        DeviRowChosen = row;  
      }
          
      break;
    }
  }
  if(row >= DeviSelRowEnd)
  { //ָ����Χ��û��ѡȡ����Ч�У���ƫ���ԭ״��ѡȡ������Чֵ��
    tempDevi = DeviPre;
    DeviRowChosen = MaxValUint8;    
  }
  
  DeviPre = DeviNow;
  DeviNow = tempDevi;
  
  return 1;
}

//���PID���ƺ�����
uint8 ServoPID(void)
{
  float temp;
  int16 temp1;
  
  temp1 = DeviNow - DeviPre;
  /*
  if(temp1 > 50) 
  {
    temp1 = 50;
  }
  else if(temp1 < -50)
  {
    temp1 = -50;
  }
  else
  {
  }
  */
  //ServoKp = DeviNow * DeviNow / ServoK1;
  
  temp = (ServoPIDMax + ServoPIDMin) / 2 - ServoKp * DeviNow - ServoKd * temp1;
  if(temp > ServoPIDMax)
  {
    temp = ServoPIDMax;  
  }
  else if(temp < ServoPIDMin)
  {
    temp = ServoPIDMin;
  }
  else
  {    
  }
  
  FTM1_C0V = (uint16)temp;
  
  

    
  return 1;
}


//======================================================================
//��������SportControl
//��  �ܣ��˶����ơ�
//��  ������
//��  �أ���
//Ӱ  �죺
//˵  ����1. ��ͼ�����ɹ�����������һ�εĿ������ݡ����򽫸��¡�
//      
//             
//======================================================================
void SportControl(uint8 ImageProFlag)
{
  uint8 tempD;
    if(ImageProFlag) 
    {
      //ƫ����ȡ
      tempD = DeviationGet();
      if(!tempD)
      {
        //uart_sendN(UART0, (uint8 *)"\nDeviationGet Failed!", 21);  
      }
      
      //���PID����
      if(!ServoPID())
      {
        //uart_sendN(UART0, (uint8 *)"\nServoPID Failed!", 17);
      }
    }
    
    
    VirtualOutData[0] = DeviPre;
    VirtualOutData[1] = DeviNow;
    VirtualOutData[2] = CenterLineLoc[25];   //BlackRightLoc[25][0]; //FTM1_C0V - ServoPIDMin;
    VirtualOutData[3] = DeviRowChosen;
    VirtualOutPut_Data();
    
     
}

