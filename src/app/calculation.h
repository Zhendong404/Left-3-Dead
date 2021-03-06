


#ifndef  calculation_H
#define  calculation_H  
#include "ImagePro.h"
extern  s16 CountTemp;
extern  s16 Speed;
extern	s16 SpeedSp;
extern	s16 SpeedKc;
extern  s16 DirectionKc;
extern s16 DirectionErrorMan;
extern u8 ImageProFlag;

void CCD_INC (void);
void DCMoto_init(void);
void TURNPWM_init(void);
void MaPan_init(void);
s16 SpeedTransmitter(void);
u32 DirectionPIDcontrol(s16 DirectionError);
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
