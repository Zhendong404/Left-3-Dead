/******************************************************************************/
/*******************************************************************************
  文件名：运动控制C文件RunControl.c
  功  能：偏差求取，PID反馈，控制电机，控制舵机。
  日  期：2014.11.15
  作  者：HJZ & YCR
  备  注：
*******************************************************************************/
/******************************************************************************/
#include "RunControl.h"

//偏差选取行对应的权重
uint8 const DeviSelRowWeight[CameraHight] = 
{
0
};

int16 DeviNow = 0;                  //当前偏差, 可以考虑换成float型
int16 DeviPre = 0;                  //先前偏差, 可以考虑换成float型
uint8 DeviFlag = 0;                //偏差求取标志位，告诉程序这次应该写入第几个偏差。
uint8 DeviSelRowStart = 30;                //偏差求取时，选择的起始行。
uint8 DeviSelRowEnd = 45;                //偏差求取时，选择的终止行。。
uint8 DeviSelRow02 = 0;                //偏差求取时，选中的行号。
uint8 DeviRowChosen = 0;               //求取偏差时选取的行，若指定范围没选取到或者偏差过小，则置无效值。
int16 DeviGoStraightLim = 3;          //偏差小于该值时，直走。

float ServoKp = 4;                 //舵机PID的P参数
float ServoKd = 2;                 //舵机PID的D参数
float ServoK1 = 150;                 //舵机PID跟P参数有关的系数
uint16 ServoPIDMax = 2086;             //舵机PID控制的最大值，右转
uint16 ServoPIDMin = 1617;             //舵机PID控制的最小值，左转
uint16 ServoPIDCen = 1851;             //舵机PID控制的中心值，直走。


float MotorLeftKp = 1;             //左电机PID的P参数    
float MotorLeftKd = 1;             //左电机PID的D参数
uint16 MotorLeftPIDMax;         //左电机PID控制的最大值
uint16 MotorLeftPIDMin;         //左电机PID控制的最小值

float MotorRightKp = 1;            //右电机PID的P参数     
float MotorRightKd = 1;            //右电机PID的D参数
uint16 MotorRightPIDMax;        //右电机PID控制的最大值
uint16 MotorRightPIDMin;        //右电机PID控制的最小值



/*
//------------------------------------------------------------------------------
//函数名：MotorControl
//功  能：左右电机PWM驱动
//参  数：motor_left为左电机PWM，motor_right为右电机PWM
//返  回：无
//说  明：PWM占空比计算方法CnV/MOD
//------------------------------------------------------------------------------
void MotorControl(int32 motor_left,int32 motor_right)
{
	//电机开关||摔倒，则关闭电机
	if((!switch4) || fall_flag)
  {
		FTM0_C4V=0;
		FTM0_C5V=0;
		FTM0_C6V=0;
		FTM0_C7V=0;
	}
  else
  {
    //电机死区消除
    if(motor_left>0)
      motor_left+=MOTOR_DEATH;
    else
      motor_left-=MOTOR_DEATH;
    if(motor_right>0)
      motor_right+=MOTOR_DEATH;
    else
      motor_right-=MOTOR_DEATH;

    //左电机PWM驱动
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
    //右电机PWM驱动
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
//函数名：DeviationGet
//功  能：偏差、偏差变化率的计算
//参  数：
//返  回：1成功 0失败
//影  响：
//说  明：
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
    { //指定范围内找到了有效行.
      tempDevi = CenterLineLoc[row] - PhyCenterCol;
      //若偏差过小，则将偏差置为0，选取行置0(选取范围不能包括0)。
      if((tempDevi < DeviGoStraightLim)&&(tempDevi > -DeviGoStraightLim))
      {
        tempDevi = 0;
        DeviRowChosen = 0;
      }
      //偏差够大，则偏差置更新，选取行更新。
      else
      {
        DeviRowChosen = row;  
      }
          
      break;
    }
  }
  if(row >= DeviSelRowEnd)
  { //指定范围里没有选取到有效行，则偏差保持原状，选取行置无效值。
    tempDevi = DeviPre;
    DeviRowChosen = MaxValUint8;    
  }
  
  DeviPre = DeviNow;
  DeviNow = tempDevi;
  
  return 1;
}

//舵机PID控制函数。
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
//函数名：SportControl
//功  能：运动控制。
//参  数：无
//返  回：无
//影  响：
//说  明：1. 若图像处理不成功，则延用上一次的控制数据。否则将更新。
//      
//             
//======================================================================
void SportControl(uint8 ImageProFlag)
{
  uint8 tempD;
    if(ImageProFlag) 
    {
      //偏差求取
      tempD = DeviationGet();
      if(!tempD)
      {
        //uart_sendN(UART0, (uint8 *)"\nDeviationGet Failed!", 21);  
      }
      
      //舵机PID控制
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

