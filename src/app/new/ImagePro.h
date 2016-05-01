#ifndef __ImagePro_H__
#define __ImagePro_H__
/******************************************************************************/
/*******************************************************************************
  �ļ�����ͼ��������ͷ�ļ�IamgePro.h
  ��  �ܣ�ͼ����
  ��  �ڣ�2014.10.09
  ��  �ߣ�HJZ
  ��  ע��
*******************************************************************************/
/******************************************************************************/
//1. ͷ�ļ�
//2. �궨��
//3. �������Ͷ���
//4. ��������
//5. ��������


//1. ͷ�ļ�
#include <stdio.h>
//#include "common.h"
//#include "CameraSet.h"

//2. �궨��
#define CameraRealWidth 250         //һ��ʵ��ȡ�����ص���
#define MaxValUint8 255             //�Զ������Чֵ
#define PhyCenterCol 140            //��������������

#define BlackStep1Size 25                 //������ȡ��1�׶ε���������
#define BlackMiddleLine 30                //С�ڸ��кŵ��У���Χ�ڵ�Ҫ������3���Ϊ2�㡣
#define BlackFarLine 20                   //С�ڸ��кŵ��У���Χ�ڵ�Ҫ������2���Ϊ1�㡣
#define BlackCrossGapLine 10              //ʮ��·��ʱ����һ�κ��ߵ��ڶ��κ��������������Ĺ���ֵ��
#define BlackBackLineNum 4                //ʮ�������ʱ����С���˷����ڵĵ�����
#define BlackCrossConfirmNum 3        //ʮ����ǰȷ�ϴ���ʱ����С���˷����ڵĵ���
#define BlackCrossConfirmWin 10     //ʮ����ǰȷ�ϴ���ʱ�����������Ĵ�С��


//��
#define LimitOriLeftWB 80  //�ڰ����ص�Ĳ�ֵ��������Ĳ����Ҫ�������ֵ��������Ϊ�����䡣
#define LimitOriLeftW 150  //�׵����Ҫ���ڴ�ֵ
#define LimitOriLeftB 80   //�ڵ����ҪС�ڴ�ֵ
//��
#define LimitOriRightWB 80  //�ڰ����ص�Ĳ�ֵ��������Ĳ����Ҫ�������ֵ��������Ϊ�����䡣
#define LimitOriRightW 150  //�׵����Ҫ���ڴ�ֵ
#define LimitOriRightB 80   //�ڵ����ҪС�ڴ�ֵ

//��
//����3���ؼ�ֵ��ʱ������ԣ��
#define LimitLeftWBMargin 20         //�ڰ����ص��ֵ��ԣ��
#define LimitLeftWMargin 30          //�׵��ԣ��
#define LimitLeftBMargin 30           //�ڵ��ԣ��

//3���ؼ�ֵ�����½�
#define LimitLeftWBMin 75
#define LimitLeftWBMax 105
#define LimitLeftWMin 150
#define LimitLeftWMax 200
#define LimitLeftBMin 85
#define LimitLeftBMax 100

#define BlackLeftWinVal 15            //�����������⺯���Ĵ��Ĵ�С
#define BlackLeftStep1ScanMinus 6    //��1�׶���ͷ����ʱ���������к��ߵĲ�����������ֵ
#define BlackLeftBackLineStart 8    //�����ʱ����ͷ����Ҫ���������С�
#define BlackLeftEdgeNum 2           //�����������ص�ʱ���������ĵ���
#define BlackLeftEdgeStartColOffset 40 //�����������ص�ʱ����ʼ�����CameraRealWidth/2������ƫ�Ƶ����� 


//��
//����3���ؼ�ֵ��ʱ������ԣ��
#define LimitRightWBMargin 20         //�ڰ����ص��ֵ��ԣ��
#define LimitRightWMargin 30          //�׵��ԣ��
#define LimitRightBMargin 30           //�ڵ��ԣ��

//3���ؼ�ֵ�����½�
#define LimitRightWBMin 75
#define LimitRightWBMax 105
#define LimitRightWMin 150
#define LimitRightWMax 200
#define LimitRightBMin 85
#define LimitRightBMax 100

#define BlackRightWinVal 15            //�����������⺯���Ĵ��Ĵ�С
#define BlackRightStep1ScanMinus 6    //��1�׶���ͷ����ʱ���������к��ߵĲ�����������ֵ
#define BlackRightBackLineStart 8    //�����ʱ����ͷ����Ҫ���������С�
#define BlackRightEdgeNum 2           //���Ҽ�������ص�ʱ���������ĵ���
#define BlackRightEdgeStartColOffset 40 //���Ҽ�������ص�ʱ����ʼ�����CameraRealWidth/2������ƫ�Ƶ����� 

//4. ��������
//extern uint8 ImgNew[CameraHight][CameraRealWidth];      //���´���������ݴ�������    
extern uint8 CenterLineLoc[CameraHight];
extern uint8 BlackLeftLoc[CameraHight][3];
extern uint8 BlackRightLoc[CameraHight][3];



//5. ��������
extern void ImaegExtract(uint8 *dst, uint8 *src, uint32 srclen);
extern uint8 ImagePro(void);
extern uint8 ImageProSend(void);

#endif //end of __ImagePro_H__
