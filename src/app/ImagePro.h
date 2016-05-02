/**************************************************************/
/**************************************************************
File Name:	ImagePro.h
Function:		Image Processing
Date:			2016.4.12
Author:			MXL
Remark:		1.Begin this part 4.12
					2.Finish 4.16
					3.Modify some parameters 4.18		temp_B and temp_W
***************************************************************/
/**************************************************************/

#ifndef ImagePro_H
#define ImagePro_H

//Mode Selection
#define ImagePro_CarUse		//智能车内部图像处理
//#define ImagePro_PCUse		//上位机图像处理与生成

//1.Header
#include <stdio.h>

#ifdef ImagePro_CarUse
#include "common.h"
#include "calculation.h"
#include "uart.h"
#endif

//2.Macro Definition
//图像尺寸设定
#define CameraHeight 50
#define CameraWidth 140
#define CameraRealWidth 140	//一行实际所取像素点个数
#define NullValue 255				//无效值
#define PhyCenterCol 70			//物理中心列

//黑线搜索及提取
#define ImageEdge 2						//图片边沿，检索线时不能超出这个边界
#define BlackSweep_RowEnd 35		//大范围确定黑线线头终止行数
#define BlackSweep_Offset 40			//大范围确定黑点中心偏移量
#define BlackSweep_Win 15				//小范围确定黑点窗口大小
#define BlackSweep_Cont 6				//黑点连线连续性阈值定义，连续两行检测到的黑点列差不能大于此值
#define BlackSweep_Edge 2				//跳变检测阈值定义，间距两列的点出现黑白变化视为黑线跳变
#define BlackSweep_MidLine 30		//中距离阈值定义，行数小于此数值定义为中距离，黑点连续采样数减少
#define BlackSweep_FarLine 20		//远距离阈值定义，行数小于此数值定义为远距离，黑点连续采样数减少
#define BlackSweep_CrossGap 8		//十字预测宽度（行跨度）
#define BlackSweep_CrossLine 8		//十字补线时的最小补线行数
#define BlackSupBack 4					//十字补线时，最小二乘法基于的点数
#define BlackSupLimit 3					//十字补线检测时，最小二乘法结果与线性补线结果的最大误差
#define BlackSupSingle 3					//单侧补线两样点最小行间距
#define MidPronum 11						//中线处理（中值滤波，均值滤波）点数

//色彩判断（黑白具体判定值由算法提供）
#define LimitWBMIN	60			//黑白色差最小值
#define LimitWMIN 130				//白点最小值
#define LimitBMAX 100				//黑点最大值
#define temp_B 0.69					//基于亮度中值判断黑白判定的范围系数
#define temp_W 1.01					//基于亮度中值判断黑白判定的范围系数

#ifdef ImagePro_PCUse
#define UART0 1;
#define ImgRaw ImgNew;
typedef unsigned char uint8;
typedef unsigned long int uint32;
typedef unsigned short int uint16;
typedef char int8;
typedef short int int16;
typedef int int32;
#endif

//3.Variables
//数据记录
extern uint8 ADdata[CameraHeight][CameraWidth];	//图片
extern uint8 CenterLine[CameraHeight];						//中线
extern uint8 LeftBlackLine[CameraHeight];					//左黑线
extern uint8 RightBlackLine[CameraHeight];					//右黑线
extern uint8 Directflag;													//方向标识符

//4.Functions
extern uint8 ImagePro(void);	//图像处理主函数
void SendImage(uint8 image[CameraHeight][CameraWidth]);

#endif