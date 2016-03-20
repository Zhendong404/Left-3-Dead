#ifndef _IMAGEGET_H
#define _IMAGEGET_H
/******************************************************************************/
/*******************************************************************************
  �ļ�����ͼ��ɼ�����ͷ�ļ�IamgeGet.h
  ��  �ܣ�ͼ��ɼ�
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
#include "common.h"
#include "CameraSet.h"
#include "vectors.h"

//2. �궨��


//4. ��������
extern uint16 LineCount;          //��ǰ�ɼ����еļ���ֵ
extern uint16 LineRealCount;      //��ǰʵ�ʵ��еļ���ֵ;
//extern uint16 const LineRealCountVal[CameraHeight];  //��ǰʵ�ʵ��еĳ�ʼֵ

//5. ��������
//ͼ���ȡ����
extern void ImageGet(void);
//���жϷ�����,�½��ش����жϣ��ݶ�ΪPTD1
extern void FieldIsr(void);
//���жϷ�����,�����ش����жϣ��ݶ�ΪPTC8
extern void LineIsr(void);

#endif //end of _IMAGEGET_H 