#ifndef  calculation_H
#define  calculation_H  

/*********************************************************************************************************
* Description: define
*********************************************************************************************************
*/

#define  MIDSTRING   5300       //�����ֵ

#define  LIN_COUT    65535

 /**********************
 * PID
 *********************/
#define  KPPLUSMAX      (170)
#define  KPNEGATIVEMAX  (-170)
#define  KIPLUSMAX      (170)
#define  KINEGATIVEMAX  (-170)
#define  KDPLUSMAX      (170)
#define  KDNEGATIVEMAX  (-170)
#define  KWPLUSMAX      (170)
#define  KWNEGATIVEMAX  (-170)
#define  KOUPLUSMAX     (300)

 /**********************
 * ���ƫ����ֵ
 *********************/
#define  TURNPWMMAX     (1200)
#define  TURNPWMMIN     (-1200)

 /**********************
 * ���ƫ����ֵ
 *********************/
#define  SPEED_PWM_MIN    -350
#define  SPEED_PWM_MAX    350


void  MOTORPWM_init(void) ;
void  TURNPWM_init(void) ;
int16 TurnPWM(uint8 TurnPosition, uint8 TurnMidPosition );   //����ת��ֵ  

int16 SpeedControl(int16 speedCount,int16 AmSpeed,uint8 speedKP,uint8 speedKI,uint8 speedKD); //�����ٶ�PWM



#endif
