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
#define ImagePro_CarUse		//���ܳ��ڲ�ͼ����
//#define ImagePro_PCUse		//��λ��ͼ����������

//1.Header
#include <stdio.h>

#ifdef ImagePro_CarUse
#include "common.h"
#include "calculation.h"
#include "uart.h"
#endif

//2.Macro Definition
//ͼ��ߴ��趨
#define CameraHeight 50
#define CameraWidth 140
#define CameraRealWidth 140	//һ��ʵ����ȡ���ص����
#define NullValue 255				//��Чֵ
#define PhyCenterCol 70			//����������

//������������ȡ
#define ImageEdge 2						//ͼƬ���أ�������ʱ���ܳ�������߽�
#define BlackSweep_RowEnd 35		//��Χȷ��������ͷ��ֹ����
#define BlackSweep_Offset 40			//��Χȷ���ڵ�����ƫ����
#define BlackSweep_Win 15				//С��Χȷ���ڵ㴰�ڴ�С
#define BlackSweep_Cont 6				//�ڵ�������������ֵ���壬�������м�⵽�ĺڵ��в�ܴ��ڴ�ֵ
#define BlackSweep_Edge 2				//��������ֵ���壬������еĵ���ֺڰױ仯��Ϊ��������
#define BlackSweep_MidLine 30		//�о�����ֵ���壬����С�ڴ���ֵ����Ϊ�о��룬�ڵ���������������
#define BlackSweep_FarLine 20		//Զ������ֵ���壬����С�ڴ���ֵ����ΪԶ���룬�ڵ���������������
#define BlackSweep_CrossGap 8		//ʮ��Ԥ���ȣ��п�ȣ�
#define BlackSweep_CrossLine 8		//ʮ�ֲ���ʱ����С��������
#define BlackSupBack 4					//ʮ�ֲ���ʱ����С���˷����ڵĵ���
#define BlackSupLimit 3					//ʮ�ֲ��߼��ʱ����С���˷���������Բ��߽����������
#define BlackSupSingle 3					//���ಹ����������С�м��
#define MidPronum 11						//���ߴ�����ֵ�˲�����ֵ�˲�������

//ɫ���жϣ��ڰ׾����ж�ֵ���㷨�ṩ��
#define LimitWBMIN	60			//�ڰ�ɫ����Сֵ
#define LimitWMIN 130				//�׵���Сֵ
#define LimitBMAX 100				//�ڵ����ֵ
#define temp_B 0.69					//����������ֵ�жϺڰ��ж��ķ�Χϵ��
#define temp_W 1.01					//����������ֵ�жϺڰ��ж��ķ�Χϵ��

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
//���ݼ�¼
extern uint8 ADdata[CameraHeight][CameraWidth];	//ͼƬ
extern uint8 CenterLine[CameraHeight];						//����
extern uint8 LeftBlackLine[CameraHeight];					//�����
extern uint8 RightBlackLine[CameraHeight];					//�Һ���
extern uint8 Directflag;													//�����ʶ��

//4.Functions
extern uint8 ImagePro(void);	//ͼ����������
void SendImage(uint8 image[CameraHeight][CameraWidth]);

#endif