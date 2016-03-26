#ifndef __Transfer_H__
#define __Transfer_H__

#include "ImagePro.h" 

//Landzo - Sirius 转换
#define Rightblackedge BlackRightLoc
#define Leftblackedge BlackLeftLoc
#define DATAROW CamearHight
#define DATACOUNT CameraRealWidth
#define ADdata
#define CameraWidth 320
#define CameraHight 50
#define CameraSize (CameraWidth * CameraHight)    //对于黑白图像，1个像素点只占1个bit
#define CameraDMACount CameraSize

//变量声明
extern uint16 LineCount;          //当前采集的行的计数值
extern uint16 LineRealCount;      //当前实际的行的计数值;
extern uint8 ImgRaw[CameraHight][CameraWidth];           //原始数据储存数组
//extern uint16 const LineRealCountVal[CameraHeight];  //当前实际的行的初始值

#endif