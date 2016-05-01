


#ifndef  calculation_H
#define  calculation_H  

extern  s16 CountTemp;
extern  s16 Speed;
extern	s16 SpeedSp;
extern	s16 SpeedKc;

void CCD_INC (void);
void DCMoto_init(void);
void Turn(u32 drc);
void TURNPWM_init(void);
void MaPan_init(void);
void SpeedTransmitter(void);
u32 SpeedPIcontrol(u16 SpeedSp, u16 Speed);
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
