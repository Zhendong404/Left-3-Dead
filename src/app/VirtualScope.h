#ifndef __VirtualScope_H__
#define __VirtualScope_H__
/******************************************************************************/
/*******************************************************************************
  文件名：虚拟示波器H文件VirtualScope.h
  功  能：虚拟示波器功能实现
  日  期：2014.11.18
  作  者：
  备  注：
*******************************************************************************/
/******************************************************************************/
//1. 头文件
//2. 宏定义
//3. 变量类型定义
//4. 变量声明
//5. 函数声明

//1. 头文件
#include "uart.h"
#include "common.h"


//4. 变量声明
extern float VirtualOutData[4];

//5. 函数声明
extern void VirtualOutPut_Data(void);

#endif // end of __VirtualScope_H__