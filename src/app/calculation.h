


#ifndef  calculation_H
#define  calculation_H  
#include "ImagePro.h"
extern  s16 CountTemp;
extern  s16 Speed;
extern	s16 SpeedSp;
extern	float SpeedKc;
extern	float SI;
extern  s16 DirectionKc;
extern	float DirectionErrorMan;
extern	u8 ImageProFlag;

extern	float SpeedStraight, SpeedTurn;

void CCD_INC (void);
void DCMoto_init(void);
void TURNPWM_init(void);
void MaPan_init(void);
s16 SpeedTransmitter(void);
u32 DirectionPIDcontrol(float DirectionError);
u32 SpeedPIcontrol(s16 Speed);
void Control(void);

/*********************************************************************************************************
* Description: define
*********************************************************************************************************
*/
#define  DATALINE   50        //采样行数
#define  DATACOUNT  140      //采样点数
#define CameraWidth 140
#define CameraHight 50

#define  MIDSTRING   5300       //舵机中值


#endif
