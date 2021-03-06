#ifndef __ImagePro_H__
#define __ImagePro_H__
/******************************************************************************/
/*******************************************************************************
  文件名：图像处理程序头文件IamgePro.h
  功  能：图像处理
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
//#include "common.h"
//#include "CameraSet.h"

//2. 宏定义
#define CameraRealWidth 250         //一行实际取的像素点数
#define MaxValUint8 255             //自定义的无效值
#define PhyCenterCol 140            //物理中心所在列

#define BlackStep1Size 25                 //黑线提取第1阶段的搜索行数
#define BlackMiddleLine 30                //小于该行号的行，周围黑点要求数由3点减为2点。
#define BlackFarLine 20                   //小于该行号的行，周围黑点要求数由2点减为1点。
#define BlackCrossGapLine 10              //十字路口时，第一段黑线到第二段黑线跳过的行数的估计值。
#define BlackBackLineNum 4                //十字向后补线时，最小二乘法基于的点数。
#define BlackCrossConfirmNum 3        //十字向前确认窗口时，最小二乘法基于的点数
#define BlackCrossConfirmWin 10     //十字向前确认窗口时，允许开窗的大小。


//左
#define LimitOriLeftWB 80  //黑白像素点的差值，两个点的差必须要大于这个值，才能认为有跳变。
#define LimitOriLeftW 150  //白点必须要大于此值
#define LimitOriLeftB 80   //黑点必须要小于此值
//右
#define LimitOriRightWB 80  //黑白像素点的差值，两个点的差必须要大于这个值，才能认为有跳变。
#define LimitOriRightW 150  //白点必须要大于此值
#define LimitOriRightB 80   //黑点必须要小于此值

//左
//更新3个关键值的时候留的裕度
#define LimitLeftWBMargin 20         //黑白像素点差值的裕度
#define LimitLeftWMargin 30          //白点的裕度
#define LimitLeftBMargin 30           //黑点的裕度

//3个关键值的上下界
#define LimitLeftWBMin 75
#define LimitLeftWBMax 105
#define LimitLeftWMin 150
#define LimitLeftWMax 200
#define LimitLeftBMin 85
#define LimitLeftBMax 100

#define BlackLeftWinVal 15            //窗口内跳变检测函数的窗的大小
#define BlackLeftStep1ScanMinus 6    //第1阶段线头查找时的连续两行黑线的差的允许的最大值
#define BlackLeftBackLineStart 8    //向后补线时，线头最少要经过多少行。
#define BlackLeftEdgeNum 2           //向左检测跳变沿的时候，跳变跨过的点数
#define BlackLeftEdgeStartColOffset 40 //向左检测跳变沿的时候，起始列相对CameraRealWidth/2的向右偏移的列数 


//右
//更新3个关键值的时候留的裕度
#define LimitRightWBMargin 20         //黑白像素点差值的裕度
#define LimitRightWMargin 30          //白点的裕度
#define LimitRightBMargin 30           //黑点的裕度

//3个关键值的上下界
#define LimitRightWBMin 75
#define LimitRightWBMax 105
#define LimitRightWMin 150
#define LimitRightWMax 200
#define LimitRightBMin 85
#define LimitRightBMax 100

#define BlackRightWinVal 15            //窗口内跳变检测函数的窗的大小
#define BlackRightStep1ScanMinus 6    //第1阶段线头查找时的连续两行黑线的差的允许的最大值
#define BlackRightBackLineStart 8    //向后补线时，线头最少要经过多少行。
#define BlackRightEdgeNum 2           //向右检测跳变沿的时候，跳变垮过的点数
#define BlackRightEdgeStartColOffset 40 //向右检测跳变沿的时候，起始列相对CameraRealWidth/2的向左偏移的列数 

//4. 变量声明
//extern uint8 ImgNew[CameraHight][CameraRealWidth];      //重新处理后的数据储存数组    
extern uint8 CenterLineLoc[CameraHight];
extern uint8 BlackLeftLoc[CameraHight][3];
extern uint8 BlackRightLoc[CameraHight][3];



//5. 函数声明
extern void ImaegExtract(uint8 *dst, uint8 *src, uint32 srclen);
extern uint8 ImagePro(void);
extern uint8 ImageProSend(void);

#endif //end of __ImagePro_H__

