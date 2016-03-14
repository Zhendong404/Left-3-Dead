#ifndef _IMAGEGET_H
#define _IMAGEGET_H
/******************************************************************************/
/*******************************************************************************
  文件名：图像采集程序头文件IamgeGet.h
  功  能：图像采集
  日  期：2014.10.09
  作  者：HJZ
  备  注：
*******************************************************************************/
/******************************************************************************/
//1. 头文件
//2. 宏定义
//3. 变量类型定义
//4. 变量声明
//5. 函数声明

//1. 头文件
#include <stdio.h>
#include "common.h"
#include "CameraSet.h"
#include "vectors.h"

//2. 宏定义


//4. 变量声明
extern uint16 LineCount;          //当前采集的行的计数值
extern uint16 LineRealCount;      //当前实际的行的计数值;
//extern uint16 const LineRealCountVal[CameraHeight];  //当前实际的行的初始值

//5. 函数声明
//图像获取函数
extern void ImageGet(void);
//场中断服务函数,下降沿触发中断，暂定为PTD1
extern void FieldIsr(void);
//行中断服务函数,上升沿触发中断，暂定为PTC8
extern void LineIsr(void);

#endif //end of _IMAGEGET_H 