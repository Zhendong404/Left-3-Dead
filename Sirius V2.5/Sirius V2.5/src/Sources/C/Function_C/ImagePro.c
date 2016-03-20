/******************************************************************************/
/*******************************************************************************
  �ļ�����ͼ��������ļ�ImagePro.c
  ��  �ܣ�ͼ����
  ��  �ڣ�2014.10.09
  ��  �ߣ�HJZ
  ��  ע��
*******************************************************************************/
/******************************************************************************/

#include "ImagePro.h"

//��������ȡʱ��ʵ��������ȵ�һ���Ӧ�����ص������ǹ̶��ǶȺ��õ�ֵ��
uint8 const CenterLineHalfWidth[CameraHight] =  
{
26,27,28,30,31,33,34,36,37,38,40,41,43,44,46,47,48,49,51,52,53,54,55,57,58,
59,60,61,62,63,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84
};

uint8 const CenterLineHalfWidth02[CameraHight] =  
{
46,47,48,50,51,53,54,56,57,58,60,61,63,64,66,67,68,69,71,72,73,74,75,77,78,
79,80,81,82,83,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104
};

uint8 ImgNew[CameraHight][CameraRealWidth];       //���´��������ݴ�������
uint8 BlackLeftLoc[CameraHight][3];       //�����λ�ô洢����
uint8 BlackRightLoc[CameraHight][3];      //�Һ���λ�ô洢����
uint8 CenterLineLoc[CameraHight];      //������λ�ô洢����, 255Ϊ��Чֵ
//uint8 MaxValUint8 = 255;             //�Զ������Чֵ
uint8 CenterLineResult = 1;             //��������ȡ�ɹ���־
uint8 CenterKeyLine = 25;                  //�̶���Ҫѡȡ���С�
uint8 CenterLocStore = MaxValUint8;         //���Һ��߶���ȡ����ʱ�򣬱����CenterLineLoc[CameraHight - 1]��

uint8 PathType = 0;                       //0δ֪ 1ֱ�� 2���� 3���� 4���� 5���� 6���� 7����
uint8 CurveLineChosenC1 = 0;               //������ȡʱ��������ѡȡ�ĵ�1�С�
uint8 CurveLineChosenC2 = 0;               //������ȡʱ��������ѡȡ�ĵ�1�С�
uint8 CurveLineChosenC3 = 0;               //������ȡʱ��������ѡȡ�ĵ�1�С�
uint8 CurveLineChosenL1 = 0;               //������ȡʱ�������ѡȡ�ĵ�1�С�
uint8 CurveLineChosenL2 = 0;               //������ȡʱ�������ѡȡ�ĵ�1�С�
uint8 CurveLineChosenL3 = 0;               //������ȡʱ�������ѡȡ�ĵ�1�С�
uint8 CurveLineChosenR1 = 0;               //������ȡʱ���Һ���ѡȡ�ĵ�1�С�
uint8 CurveLineChosenR2 = 0;               //������ȡʱ���Һ���ѡȡ�ĵ�1�С�
uint8 CurveLineChosenR3 = 0;               //������ȡʱ���Һ���ѡȡ�ĵ�1�С�
int16 SABCL = 0;                          //������ȡʱ����������������ε������˳ʱ��Ϊ������ʱ��Ϊ����
int16 SABCC = 0;                          //������ȡʱ�����������������ε������˳ʱ��Ϊ������ʱ��Ϊ����
int16 SABCR = 0;                          //������ȡʱ���Һ������������ε������˳ʱ��Ϊ������ʱ��Ϊ����
int16 CURVEL = 0;                          //������ȡʱ������ߵ����ʣ�˳ʱ��Ϊ������ʱ��Ϊ����
int16 CURVEC = 0;                          //������ȡʱ�������ߵ����ʣ�˳ʱ��Ϊ������ʱ��Ϊ����
int16 CURVER = 0;                          //������ȡʱ���Һ��ߵ����ʣ�˳ʱ��Ϊ������ʱ��Ϊ����
int16 PathStraightLimitL = 20;           //���������ж�ʱ��������ж�Ϊֱ�ߵ���ֵ��������д�ģ���Ҫ��C#�ⶨ��
int16 PathStraightLimitC = 20;           //���������ж�ʱ���������ж�Ϊֱ�ߵ���ֵ��������д�ģ���Ҫ��C#�ⶨ��
int16 PathStraightLimitR = 20;           //���������ж�ʱ���Һ����ж�Ϊֱ�ߵ���ֵ��������д�ģ���Ҫ��C#�ⶨ��
int16 CurveGetCompen = 2000;             //������ȡʱ��Ϊ�˲�ʹ��̫С���˵Ĳ�������

uint8 ErrorGetSelf;                 //ƽ��ֵ�������ƫ�Ҳ����curve
uint8 ErrorGetCen;                 //ƽ��ֵ�����������ߵ�ƫ�

//��
uint8 BlackLeftRealWB[2];                  //���ߵ�ʵ�ʺڰײ�ֵ�Ĵ洢���飬���ڼ���ʵ�ʺڰײ�ֵ����ֵ�����LimitLeftWB
uint8 BlackLeftRealB[2];                   //���ߵ�ʵ�ʺڵ�ֵ�洢���飬���ڼ���ʵ�ʺڵ���ֵ�����LimitLeftB
uint8 BlackLeftRealW[2];                   //���ߵ�ʵ�ʰ׵�ֵ�洢���飬���ڼ���ʵ�ʰ׵���ֵ�����LimitLeftW
//��
uint8 BlackRightRealWB[2];                  //���ߵ�ʵ�ʺڰײ�ֵ�Ĵ洢���飬���ڼ���ʵ�ʺڰײ�ֵ����ֵ�����LimitRightWB
uint8 BlackRightRealB[2];                   //���ߵ�ʵ�ʺڵ�ֵ�洢���飬���ڼ���ʵ�ʺڵ���ֵ�����LimitRightB
uint8 BlackRightRealW[2];                   //���ߵ�ʵ�ʰ׵�ֵ�洢���飬���ڼ���ʵ�ʰ׵���ֵ�����LimitRightW


//��
//3���ؼ�ֵ�Ŀɸ�ֵ����������Ӧ���㷨���ġ�
uint8 LimitLeftWB = LimitOriLeftWB;    //�ڰ����ص�Ĳ�ֵ��������Ĳ����Ҫ�������ֵ��������Ϊ�����䡣
uint8 LimitLeftW = LimitOriLeftW;      //�׵����Ҫ���ڴ�ֵ
uint8 LimitLeftB = LimitOriLeftB;      //�ڵ����ҪС�ڴ�ֵ

uint8 BlackLeftCrossDone = 0;    //�����ʮ�ּ���־λ 0δ���� 1ʧ�� 2�ɹ�
uint8 BlackLeftDone = 1;          //�������ȡ�ɹ���ʾλ 1�ɹ� 0ʧ��
uint8 BlackLeft3ResetCount = 0;       //���ڹ��߱仯̫�������3���ؼ�ֵ���õĴ�����
uint8 BlackLeftCrossTooLowLine = 3;    //ʮ���ټ��ʱ�����ڸ��о�û��Ҫ�����ټ������ˡ�
//uint8 BlackLeftStep4Flag = 0;          //�������Ҫִ�е�4�׶εı�־λ��1��ִ�У�0����ִ�С�
//uint8 BlackLeftStep4StartLine = 0;     //����ߵ�4�׶���ʼ��
uint8 BlackLeftHeadLine = MaxValUint8;   //����ߵ���ͷ���������¡�

//��
//3���ؼ�ֵ�Ŀɸ�ֵ����������Ӧ���㷨���ġ�
uint8 LimitRightWB = LimitOriRightWB;    //�ڰ����ص�Ĳ�ֵ��������Ĳ����Ҫ�������ֵ��������Ϊ�����䡣
uint8 LimitRightW = LimitOriRightW;      //�׵����Ҫ���ڴ�ֵ
uint8 LimitRightB = LimitOriRightB;      //�ڵ����ҪС�ڴ�ֵ

uint8 BlackRightCrossDone = 0;   //�Һ���ʮ�ּ���־λ 0δ���� 1ʧ�� 2�ɹ�
uint8 BlackRightDone = 1;          //�Һ�����ȡ�ɹ���ʾλ 1�ɹ� 0ʧ��
uint8 BlackRight3ResetCount = 0;       //���ڹ��߱仯̫�������3���ؼ�ֵ���õĴ�����
uint8 BlackRightCrossTooLowLine = 3;    //ʮ���ټ��ʱ�����ڸ��о�û��Ҫ�����ټ������ˡ�
//uint8 BlackRightStep4Flag = 0;          //�Һ�����Ҫִ�е�4�׶εı�־λ��1��ִ�У�0����ִ�С�
//uint8 BlackRightStep4StartLine = 0;     //�Һ��ߵ�4�׶���ʼ��
uint8 BlackRightHeadLine = MaxValUint8;   //����ߵ���ͷ���������¡�


//�������ֵ��ֵ��ֻ�ʺ���int16�ͱ���������int16�ͱ�����
int16 AbsSelf(int16 x)
{
  if(x < 0) return (0-x);
  else return x;  
}

//======================================================================
//��������MaxRe
//��  �ܣ���ȡ�������ֵ
//��  ������1����num1, ��2����num2��
//��  �أ�2�����е����ֵ
//Ӱ  �죺��
//˵  ����1. ��������������Ⱥ�˳��
//        2. ֻ�ܴ�������uint8�͵����ݣ������������ͻ����
//        3. ����ֵ������Ҳ��uint8.
//======================================================================
uint8 MaxRe(uint8 num1, uint8 num2)
{
  if(num1 >= num2)
  {
    return num1;
  }
  else
  {
    return num2;
  }
}

//======================================================================
//��������MinRe
//��  �ܣ���ȡ������Сֵ
//��  ������1����num1, ��2����num2��
//��  �أ�2�����е���Сֵ
//Ӱ  �죺��
//˵  ����1. ��������������Ⱥ�˳��
//        2. ֻ�ܴ�������uint8�͵����ݣ������������ͻ����
//        3. ����ֵ������Ҳ��uint8.     
//======================================================================
uint8 MinRe(uint8 num1, uint8 num2)
{
  if(num1 <= num2)
  {
    return num1;  
  }
  else
  {
    return num2;  
  }
}

//======================================================================
//��������AbsRe
//��  �ܣ���ȡ������ֵ�ľ���ֵ
//��  ������1����num1, ��2����num2��
//��  �أ�2�����ľ���ֵ��
//Ӱ  �죺��
//˵  ����1. ��������������Ⱥ�˳��
//        2. ֻ�ܴ�������uint8�͵����ݣ������������ͻ����
//        3. ����ֵ������Ҳ��uint8.     
//======================================================================
uint8 AbsRe(uint8 num1, uint8 num2)
{
  if(num1 >= num2)
  {
    return (num1 - num2);  
  }
  else
  {
    return (num2 - num1);  
  }
}


//======================================================================
//��������LeastSquarea1
//��  �ܣ���С���˷���a1ֵ����ȡ
//��  ����x���飬y���飬num���ڵ���Ч���ݸ���
//��  �أ�a1
//Ӱ  �죺��
//˵  ����1. y = a0 + a1 * x;
//        2. a1 = (N * ��xy - ��x * ��y) / (N * ��x^2 - ��x * ��x);
//  
//======================================================================
float LeastSquarea1(uint8 x[], uint8 y[], uint8 num)
{
  float andxy = 0, andx = 0, andy = 0, andx2 = 0;
  float a1;
  uint8 i;
 
  for(i = 0; i < num; i++)
  {
    andxy += x[i] * y[i];
    andx += x[i];
    andy += y[i];
    andx2 += x[i] * x[i];
  }
  
  a1 = (num * andxy - andx * andy) * 1.0 / (num * andx2 - andx * andx);
  return a1;  
}


//======================================================================
//��������LeastSquarea0
//��  �ܣ���С���˷���a0ֵ����ȡ
//��  ����x���飬y���飬a1������num���ڵ���Ч���ݸ���
//��  �أ�a0
//Ӱ  �죺��
//˵  ����1. y = a0 + a1 * x;
//        2. a0 = ��y / N - a1 * ��x / N;
//             
//======================================================================
float LeastSquarea0(uint8 x[], uint8 y[], float a1, uint8 num)
{
  float andx = 0, andy = 0;
  float a0;
  uint8 i;
  for(i = 0; i < num; i++)
  {
    andx += x[i];
    andy += y[i];
  }
  
  a0 = andy / num - a1 * andx / num;
  return a0;
}





//======================================================================
//��������SendCenterLineLoc
//��  �ܣ����������鷢�ͺ���
//��  ����img�����͵�һάͼ������
//��  �أ���
//Ӱ  �죺��
//˵  ����
//      
//          
//======================================================================
void SendCenterLineLoc(uint8 img[CameraHight])
{
    uint8 i;
    uint8 cmd[4] = {0, 255, 1, 255 };   
    uart_sendN(UART0, cmd, sizeof(cmd));    
    for(i = 0; i < CameraHight; i++)
    {
      uart_send1(UART0, img[i]); //��������������
    }
    
}




//======================================================================
//��������SendImage
//��  �ܣ�OV7620��ͼ���ͺ���
//��  ���������͵Ķ�άͼ������imgaddr
//��  �أ���
//Ӱ  �죺��
//˵  ����       
//======================================================================
void SendImage(uint8 imgaddr[CameraHight][CameraRealWidth])
{                            
    uint8 i, j;
    uint8 cmd[4] = {0, 255, 1, 0 };
  
    uart_sendN(UART0, cmd, sizeof(cmd));    
    
    for(i = 0; i < CameraHight; i++)
        for(j = 0; j < CameraRealWidth; j++)
            uart_send1(UART0, imgaddr[i][j]); //����ͼ��
}



//====================================����������������������������������============================

//======================================================================
//��������BlackLeftRealClear
//��  �ܣ��������ȡ�У���3���ؼ�ֵ��ʵ��ֵ����
//��  ������
//��  �أ���
//Ӱ  �죺B
//˵  ����
//      
//             
//======================================================================
void BlackLeftRealClear(void)
{
    BlackLeftRealWB[0] = 0;
    BlackLeftRealWB[1] = 0;
    BlackLeftRealW[0] = 0;
    BlackLeftRealW[1] = 0;
    BlackLeftRealB[0] = 0;
    BlackLeftRealB[1] = 0;
}




//======================================================================
//��������BlackGetLeftStep1Edge
//��  �ܣ�����������ߵĿ��ɺڵ�
//��  �����������к�row, �ڼ���ʹ��use, �Ƿ�Ϊʮ���ټ����ñ�־λCrossFlag
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺
//˵  ����
//======================================================================
uint8 BlackGetLeftStep1Edge(uint8 row, uint8 use, uint8 CrossFlag)
{
  uint8 index, col, temp, temp1;
  uint8 abs1;
  
  temp = CameraRealWidth/2 - 1 + BlackLeftEdgeStartColOffset;
  
  index = 0;         //���ɵ�����
  for(col = temp; col >= 4+BlackLeftEdgeNum; col--) 
  {
      abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col-1-BlackLeftEdgeNum]); //ȡ��ֵ�ľ���ֵ��
      
      if( 
          (abs1 > LimitLeftWB) //���ߵĲ��
        &&(ImgNew[row][col] > LimitLeftW)                     //�׵㹻��
        &&(ImgNew[row][col-1-BlackLeftEdgeNum] < LimitLeftB)                   //�ڵ㹻��
         )
      {         
          //�������У�����3������Ϊ�ڵ�
          if(row > BlackMiddleLine)
          {
            temp1 = (
                      (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB)
                    &&(ImgNew[row][col-3-BlackLeftEdgeNum] < LimitLeftB)
                    &&(ImgNew[row][col-4-BlackLeftEdgeNum] < LimitLeftB)
                    );
          }          
          else
          {
            //Զ������ ������2����Ϊ��Ϊ�ڵ�
            if(row > BlackFarLine)
            {
              temp1 = (
                        (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB)
                      &&(ImgNew[row][col-3-BlackLeftEdgeNum] < LimitLeftB)
                      );
            }
            //Զ������ ������1����Ϊ��Ϊ�ڵ�
            else
            {
              temp1 = (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB);
            }
          }

          if(temp1)
          {
              if(index == 3)       
              {
                if(CrossFlag)
                {
                  //��3���ؼ�ֵ��ʵ��ֵ����
                  BlackLeftRealClear();
                }
                //���ж�λ����ʧ�ܣ�����Чֵ
                BlackLeftLoc[row][0] = MaxValUint8;
                return 0;
              }

              if(CrossFlag)
              {
                if(use == 1)
                {
                  BlackLeftRealWB[0] = ImgNew[row][col] - ImgNew[row][col-1-BlackLeftEdgeNum]; 
                  BlackLeftRealW[0] = ImgNew[row][col];
                  BlackLeftRealB[0] = ImgNew[row][col-1-BlackLeftEdgeNum];
                }
                else if(use == 2)
                {
                  BlackLeftRealWB[1] = ImgNew[row][col] - ImgNew[row][col-1-BlackLeftEdgeNum]; 
                  BlackLeftRealW[1] = ImgNew[row][col];
                  BlackLeftRealB[1] = ImgNew[row][col-1-BlackLeftEdgeNum];
                }
                else
                {
                }
              }
              //������ɹ���ȡ�ڵ�
              BlackLeftLoc[row][index] = col - 1 - BlackLeftEdgeNum;          
              index++;            
          }    
      }   
  }
  
  //1�����ɺڵ�Ҳû�У��򱨴�
  if(index == 0)
  {
    if(CrossFlag)
    {
      //��3���ؼ�ֵ��ʵ��ֵ����
      BlackLeftRealClear();
    }
    //���ж�λ����ʧ�ܣ�����Чֵ
    BlackLeftLoc[row][0] = MaxValUint8;
    return 0;
  }
  
  //û�б����ͻ��ߵ�����ڵ���ҳɹ�������1��2��3���ڵ�
  return 1;
}



//======================================================================
//��������BlackGetLeftStep2Win
//��  �ܣ������������⺯��
//��  �����������к�row, ���ڴ�Сwin, Ԥ���������λ��predict
//��  �أ�1�ɹ�  0ʧ��
//Ӱ  �죺
//˵  ����  
//======================================================================
uint8 BlackGetLeftStep2Win(uint8 row, uint8 win, uint8 predict)
{
  uint8 col, temp, temp1;
  uint8 abs1;

  //�ڹ滮�õĴ����ڣ������������������
  //��ֹ���
  
  //����߽������
  if(predict <= win)
  {
    temp = 4 + BlackLeftEdgeNum;
  }  
  else
  {
    temp = predict - win;
    if(temp < 4 + BlackLeftEdgeNum)
    {
      temp = 4 + BlackLeftEdgeNum;
    }
    else 
    {
    } 
  }
  
  //���ұ߽������
  if(predict + win > CameraRealWidth - 1)
  {
    col = CameraRealWidth - 1;  
  }
  else
  {
    col = predict + win;  
  }
  
  //�ж��������">"�ܹؼ���û��д">="�ǿ���temp = 0��������������Է�ֹ����������uint8��Ϊ��������������ѭ����
  for( ; col > temp; col--) 
  {
    abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col-1-BlackLeftEdgeNum]);
    if( 
          (abs1 > LimitLeftWB) //���ߵĲ��
        &&(ImgNew[row][col] > LimitLeftW)                     //�׵㹻��
        &&(ImgNew[row][col-1-BlackLeftEdgeNum] < LimitLeftB)                   //�ڵ㹻��
       )
    {
          //�������У�����3������Ϊ�ڵ�
          if(row > BlackMiddleLine)
          {
            temp1 = (
                      (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB)
                    &&(ImgNew[row][col-3-BlackLeftEdgeNum] < LimitLeftB)
                    &&(ImgNew[row][col-4-BlackLeftEdgeNum] < LimitLeftB)
                    );
          }
          else
          {
            //�м���� ������2����Ϊ��Ϊ�ڵ�
            if(row > BlackFarLine)
            {
              temp1 = (
                        (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB)
                      &&(ImgNew[row][col-3-BlackLeftEdgeNum] < LimitLeftB)
                      );
            }
            //Զ������ ������1����Ϊ��Ϊ�ڵ�
            else
            {
              temp1 = (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB);
            }
          }
          if(temp1)
          {
            //�������������㣬ֱ�Ӽ�¼�õ�Ϊ���ߣ����ؼ���
            BlackLeftLoc[row][0] = col - 1 - BlackLeftEdgeNum;
            return 1;
            //break;          
          }
    }
    
    
    
  }// end of forѭ��
  
  //���һֱ����������߻�û���ҵ������أ�  
  BlackLeftLoc[row][0] = MaxValUint8;   //���еĺ���λ�ü�Ϊ��Чֵ
  return 0;

  
}


//======================================================================
//��������BlackGetLeftStep1Scan
//��  �ܣ���ɨ�躯��
//��  ����ɨ����ʼ��FirstLine, ɨ�������LastLine, ʮ���ټ���־CrossFlag
//��  �أ�0~CameraHight-1���� 255�ɼ�ʧ��
//Ӱ  �죺
//˵  ����
//             
//======================================================================
uint8 BlackGetLeftStep1Scan(uint8 FirstLine, uint8 LastLine, uint8 CrossFlag)
{
    uint8 row, temp1, temp2;
    uint8 abs1;
    uint8 tempWB, tempW, tempB;
  //�����BlackStep1Size���ò�ֵ���Һ���
    for(row = FirstLine; row > LastLine; row -= 2)
    {
      //�ж��Ƿ��������м�⵽���䡣
      temp1 = BlackGetLeftStep1Edge(row, 1, CrossFlag);
      temp2 = BlackGetLeftStep1Edge(row-1, 2, CrossFlag);
      if(temp1 && temp2)//���������ôд������Ƕ��if����Ϊ&&���ص�
      {
        abs1 = AbsRe(BlackLeftLoc[row-1][0], BlackLeftLoc[row][0]);
        //��һ���ж��������еĺڵ�ļ���Ƿ�С������ȡ��1�����ɺڵ㡣
        if(abs1 < BlackLeftStep1ScanMinus)
        {
          if(CrossFlag)
            {
              //��ֵ�Ĵ�������ԣ�ȣ��������½硣
              tempWB = (BlackLeftRealWB[0] + BlackLeftRealWB[1]) / 2 - LimitLeftWBMargin; 
              if(tempWB < LimitLeftWBMin) tempWB = LimitLeftWBMin;
              else if(tempWB > LimitLeftWBMax) tempWB = LimitLeftWBMax;
              else ;
              LimitLeftWB = tempWB;
              
              //�׵�Ĵ�������ԣ�ȣ��������½硣
              tempW = (BlackLeftRealW[0] + BlackLeftRealW[1]) / 2 - LimitLeftWMargin;
              if(tempW < LimitLeftWMin) tempW = LimitLeftWMin;
              else if(tempW > LimitLeftWMax) tempW = LimitLeftWMax;
              else ;
              LimitLeftW = tempW;
              
              //�ڵ�Ĵ�������ԣ�ȣ��������½硣
              tempB = (BlackLeftRealB[0] + BlackLeftRealB[1]) / 2 + LimitLeftBMargin;
              if(tempB < LimitLeftBMin) tempB = LimitLeftBMin;
              else if(tempB > LimitLeftBMax) tempB = LimitLeftBMax;
              else ;
              LimitLeftB = tempB;
            }
          break;
        }
      }      
    }   
    
    //���߼��ʧ��
    if(row <= LastLine)
      return MaxValUint8;
    else 
      return row;
  
}

//======================================================================
//��������BlackLeftCrossStep3
//��  �ܣ��Բ��ߺ���
//��  ������1����Ч���ߵ����һ��FirstLine�� ��2����Ч���ߵĵ�һ��LastLine
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺
//˵  ����1. ������һЩ�������㣬��ռʱ�䣬�ڵ��ñ�����ʱҪ���أ�������Ҫ�á�
//             
//======================================================================
uint8 BlackLeftCrossStep3(uint8 FirstLine, uint8 LastLine)
{
  float delta_x, delta_y, delta, index;
  uint8 row, temp1, temp2;
  //uint8 temp3, temp4, flag1, flag2;
  
  //��ʼ�бȽ����л��ߣ�����
  if(LastLine >= FirstLine)
  {
    uart_sendN(UART0, (uint8 *)"\nError In BlackLeftCrossStep3!", 30);
    return 0;  
  }
  
  temp1 = BlackLeftLoc[FirstLine][0];
  temp2 = BlackLeftLoc[LastLine][0];
  
  /*
  flag = 1;
  flag = 2;
  //ȷ������������ֱ�Ǵ��ĵ㣬Ҳ��������6������Ϊ�ڵ�
  if(temp1 <= (CameraRealWidth - 9))
  {
    temp3 = (
            (ImgNew[FirstLine+1][temp1+6] < LimitLeftB)
          &&(ImgNew[FirstLine+1][temp1+7] < LimitLeftB)
          &&(ImgNew[FirstLine+1][temp1+8] < LimitLeftB)
          );
    if(temp3)
    {
      flag1 = 0;  
    }
  }
  
  if(temp2 <= (CameraRealWidth - 9))
  {
    temp4 = (
            (ImgNew[LastLine-1][temp2+6] < LimitLeftB)
          &&(ImgNew[LastLine-1][temp2+7] < LimitLeftB)
          &&(ImgNew[LastLine-1][temp2+8] < LimitLeftB)
          );
    if(temp4)
    {
      flag2 = 0;  
    }
  }
  
  if((flag1 == 0) || (flag2 == 0))
  {
    return 0;  
  }
  
  */
  
  delta_y = FirstLine - LastLine;
  
  
  //б������
  if(temp1 < temp2)
  {
    delta_x = temp2 - temp1;
    delta = delta_x / delta_y; //����1��������
    
    index = 1.0;
    for(row = FirstLine - 1; row >= LastLine + 1; row-- )
    {
      //ÿ������һ���
      BlackLeftLoc[row][0] = (uint8)((float)BlackLeftLoc[FirstLine][0] + delta * index);
      index += 1.0;
    }
  }
  //б������
  else if(temp1 > temp2)
  {
    delta_x = temp1 - temp2;
    delta = delta_x / delta_y;
    
    index = 1.0;
    for(row = FirstLine - 1; row >= LastLine + 1; row-- )
    {
      //ÿ������һ���
      BlackLeftLoc[row][0] = (uint8)((float)BlackLeftLoc[FirstLine][0] - delta * index);
      index += 1.0;
    }
  }
  //б��ֱ�ߣ������̫���ܳ���
  else
  {
    for(row = FirstLine - 1; row >= LastLine + 1; row-- )
    {
      //����ͬ��ֵ
      BlackLeftLoc[row][0] = temp1;
    }
  }
  
  return 1;
    
}

//======================================================================
//��������BlackLeftCrossConfirm
//��  �ܣ���ͷ��Ч�Ե�ȷ��
//��  ������1�κ��ߵ���ʵ������Row1RealLastLine����2�κ��ߵ���ʵ��ʼ��Row2RealFirstLine
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺��
//˵  ����
//      
//             
//======================================================================
uint8 BlackLeftCrossConfirm(uint8 Row1RealLastLine, uint8 Row2RealFirstLine)
{
  uint8 row, index;
  uint8 x[BlackCrossConfirmNum];
  uint8 y[BlackCrossConfirmNum];
  
  float a0, a1, temp;
  
  //��һ�κ���̫�̣��޷������ȷ�ԡ�ֱ�ӷ���1.
  if(Row1RealLastLine < 5) return 1;
  
  //�����Ͻ�Ϊԭ�㣬����Ϊx��������0~49��������Ϊy��������(0~249)
  index = 0;
  for(row = Row1RealLastLine; ; row++)
  {
    //��Ч�еļ�¼
    if(BlackLeftLoc[row][0] != MaxValUint8)
    {
      y[index] = BlackLeftLoc[row][0];
      x[index] = row;
      index++;
    }
    //�������࣬��������
    if(index == BlackCrossConfirmNum) break;
    //ֱ���������û�дչ��㹻�ĵ�����˵����һ����Ч����̫�̣��޷������ȷ�ԣ�ֱ�ӷ���1.
    if(row == CameraHight - 1) return 1;
  }
  
  //��С���˷�
  //y = a0 + a1 * x
  a1 = LeastSquarea1(x, y, BlackCrossConfirmNum);
  a0 = LeastSquarea0(x, y, a1, BlackCrossConfirmNum);
  
  //tempΪ��2�κ�����ʼ�б�Ӧ���ڵ�λ�á�
  temp = a0 + a1 * Row2RealFirstLine;
  if((temp < 0) || (temp > CameraRealWidth - 1)) 
  {
    return 0;
  }
  else
  { //���ﱾ��Ӧ�ü��ϰ�������޶��ڴ��ڣ������ƺ�û��Ҫ��
    if(
      (BlackLeftLoc[Row2RealFirstLine][0] > temp - BlackCrossConfirmWin) 
    &&(BlackLeftLoc[Row2RealFirstLine][0] < temp + BlackCrossConfirmWin)
      )
    {
      return 1;
    }
    else
    {
      return 0;
    }
    
  }  
}



//======================================================================
//��������BlackLeftAgainForCross
//��  �ܣ�ʮ�ּ�����
//��  ������2�κ��ߵ�Ԥ����ʼ��Row2FirstLine�� ��2�κ��ߵ�Ԥ�������Row2LastLine��
//        ��1�κ��ߵ�ʵ�ʽ�����Row1RealLastLine
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺
//˵  ����1. ����������ø�������ĺ�����Ԥ�ƻ��ѽ϶�ʱ�䣬��������������
//             
//======================================================================
uint8 BlackLeftAgainForCross(uint8 Row2FirstLine, uint8 Row2LastLine, uint8 Row1RealLastLine)
{
    uint8 row, temp, temp1, temp2;
    uint8 Row2RealFirstLine; //��2�κ��ߵ���ʵ��ʼ��
    uint8 i;
    
    temp = BlackGetLeftStep1Scan(Row2FirstLine, Row2LastLine, 0); //��3������0��ʾ��ʮ���ټ�⣬���ø���3���ؼ�ֵ
    if(temp == MaxValUint8)  
    {
      //ɨƨ�ɹ�����       
      for(i = Row2FirstLine; ; i--)
      {
        BlackLeftLoc[i][0] = MaxValUint8;
        if(i == 0) break;
      }
      return 0;  
    }
    else 
    {
      if(!BlackLeftCrossConfirm(Row1RealLastLine, temp))
      { //ɨƨ�ɹ�����       //i >= (temp-1)
        for(i = Row2FirstLine; ; i--)
        {
          BlackLeftLoc[i][0] = MaxValUint8;
          if(i == 0) break;
        }
        return 0;
      }
      //ʮ���ټ�����ͷ��ȷ���޶��ķ�Χ�ڣ����Լ�����
      else
      {
      row = temp;
      }
      //row = temp;
    }
    
    Row2RealFirstLine = row; //��¼��2�κ��ߵ���ʵ��ʼ��
    
    //tempΪԤ��ĺڵ�λ��
    temp = BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0];
    //���������֤�е�ȡ��Զ����
    for(row -= 2; ; row -= 2)
    {
      temp1 = BlackGetLeftStep2Win(row, BlackLeftWinVal, temp);
      temp2 = BlackGetLeftStep2Win(row-1, BlackLeftWinVal, temp);
      if(temp1 && temp2) 
      {
        temp = BlackLeftLoc[row - 1][0] + BlackLeftLoc[row - 1][0] - BlackLeftLoc[row][0];
      }
      else
      {
      }       
      
      if((row == Row2LastLine) || (row == Row2LastLine+1)) break;      
    }
    
     //�Բ������ߵĽ��ߡ�
    if(!BlackLeftCrossStep3(Row1RealLastLine, Row2RealFirstLine))
    {
      return 0;
    }
    
    return 1;
        
}

//======================================================================
//��������BlackLeftStep4BackLine
//��  �ܣ����ߺ�����
//��  ����Step4StartLine��ʼ��
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺
//˵  ����1. ����������float�͵ĺ������п���ռ�ýϳ���ʱ�䡣
//             
//======================================================================
uint8 BlackLeftStep4BackLine(uint8 Step4StartLine)
{
  uint8 row;
  uint8 i, index;
  uint8 x[BlackBackLineNum];   //ȡ���ٸ�����һ��ʼ�ж��塣
  uint8 y[BlackBackLineNum];
  uint8 j;
  uint8 temp1;
  
  float temp;
  float a0, a1;
  
  if (Step4StartLine - BlackBackLineNum - BlackBackLineNum < 0)
  {
    temp1 = 0;    
  }
  else
  {
    temp1 = Step4StartLine - BlackBackLineNum - BlackBackLineNum;
  }

  index = 0;
  for(i = Step4StartLine; ; i--)
  {
    if(BlackLeftLoc[i][0] != MaxValUint8)
    {
      y[index] = BlackLeftLoc[i][0];
      x[index] = i;
      index++;
    }
    if(index == BlackBackLineNum)
    {
      break;  
    }
    if(i == temp1)
    {
      return 0;
    }
  }
  
  //��С���˷�
  //y = a0 + a1 * x
  a1 = LeastSquarea1(x, y, BlackBackLineNum);
  a0 = LeastSquarea0(x, y, a1, BlackBackLineNum);
  
  for(row = Step4StartLine + 1; row <= CameraHight - 1; row++)
  {
    //����Ҳ�и��ȣ��������Ҷ����ܲ�����Χ��
    temp = a0 + a1 * row;
    if(temp >= CameraRealWidth)
    {
      //BlackLeftLoc[row][0] = CameraRealWidth - 1;
      //�������ҽ���ʱ��ԭ����Ϊ�ñ߽�ֵ�����ڵĲ����ǴӸ���������Чֵ��
      for(j = row; ; j++)
      {
        BlackLeftLoc[row][0] = MaxValUint8;
        if(j == CameraHight - 1) break;
      }
      break;
    }
    else if(temp <= 0)
    {
      //BlackLeftLoc[row][0] = 0;
      //�������ҽ���ʱ��ԭ����Ϊ�ñ߽�ֵ�����ڵĲ����ǴӸ���������Чֵ��
      for(j = row; ; j++)
      {
        BlackLeftLoc[row][0] = MaxValUint8;
        if(j == CameraHight - 1) break;
      }
      break;
    }
    else
    {
      BlackLeftLoc[row][0] = (uint8)(temp); 
    }
  }
  
  return 1;
  
}




//======================================================================
//��������BlackGetLeft
//��  �ܣ��������ȡ�㷨
//��  ������
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺
//˵  ����1. ��ʱ���Դ���ֱ���������ʮ��·��3�������2014.11.10
//      
//             
//======================================================================
uint8 BlackGetLeft(void)
{
    uint8 row, temp, temp1, temp2, temp3, i;
    uint8 GapCount, Row1RealLastLine, index;
    uint8 Step4Flag, Step4StartLine;  
    
    Step4Flag = 0;
    //Ĭ��ʮ�ּ���־��Ϊδ���롣
    BlackLeftCrossDone = 0;    
    
    //�п��ܻ᷵�غ�����ȡʧ��
    temp = BlackGetLeftStep1Scan(CameraHight - 1, CameraHight - BlackStep1Size - 1, 1);
    if(temp == MaxValUint8)
    {
      return 0;
    }    
    else 
    {
      row = temp;
      //��ʼ��ͷ��λ�÷ǳ���
      if(row < CameraHight - BlackLeftBackLineStart)
      {
        Step4Flag = 1;
        Step4StartLine = row;
      }
    }

    //�ϴ��Ѿ��������˵�row-1�У���һ��Ҫ�����row-2��
    //BlackLeftSlope();
    
    //tempΪԤ��ĺڵ�λ��

    //��Ԥ��ֵ�Ĵ�С�޶�
    if((BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0]) < 0)
    {
      temp = 0;
    }
    else if((BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0]) >= CameraRealWidth)
    {
      temp = CameraRealWidth - 1;
    }
    else
    {
      temp = BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0];  
    }

    index = 0;
    
    GapCount = 0;  //����������û�вɼ�������
    //���������֤�е�ȡ��Զ����
    for(row -= 2; ; row -= 2)
    {
      //����������еĺڵ���ɹ��������Ԥ����λ��
      temp1 = BlackGetLeftStep2Win(row, BlackLeftWinVal, temp);
      temp2 = BlackGetLeftStep2Win(row-1, BlackLeftWinVal, temp);
      temp3 = (
              (!temp1)
            &&(!temp2)
            //&&(!Step4Flag)
              );
      if(temp1 && temp2) 
      {   //��Ԥ��ֵ�Ĵ�С�޶�
          if((BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0]) < 0)
          {
            temp = 0;
          }
          else if((BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0]) >= CameraRealWidth)
          {
            temp = CameraRealWidth - 1;
          }
          else
          {
            temp = BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0];  
          }
      }
      else if(temp3)
      {       
        //Row1RealLastLine��¼��1�κ��ߵ����һ�С�
        if(index == 0)
        {
          //����һ�κ󣬾���Ҳ��������ˡ�
          index++;
          for(i = row; i < (row + 5); i++)
          {
            if(BlackLeftLoc[i][0] != MaxValUint8)
            {
              Row1RealLastLine = i;
              break;
            }
          }
          if(Row1RealLastLine >= CameraHight - 1)
          {
            Row1RealLastLine = CameraHight - 1;
          }
          else
          {
          }
        }
        
        GapCount += 2;

        if(GapCount > BlackCrossGapLine)
        {
          //�ټ��ʱ����̫Զ�ˣ���û��Ҫ����ˡ�
          if(row < BlackLeftCrossTooLowLine)
          {
            break;
          }
          else
          {
          }
          
          if(!BlackLeftAgainForCross(row - 2, 1, Row1RealLastLine))
          {
            BlackLeftCrossDone = 1;  //ʮ�ּ��ʧ��           
          }
          else
          {
            BlackLeftCrossDone = 2;  //ʮ�ּ��ɹ�
          }
          break;  //ʮ���ټ����Ὺ����⵽ָ�������һ�У����Բ�����ѭ���ˣ�ֱ������
          
        }
        else
        {
          BlackLeftCrossDone = 0;   //ʮ�ּ��δ����
        }
      }
      else
      {        
      }
      
      
      if((row == 0) || (row == 1)) break;
      
    }
    
    
    //�����и������㣬Ҫ�ϸ���Ƶ��á�
    if(Step4Flag)
    {
      if(!BlackLeftStep4BackLine(Step4StartLine))
      {
        return 0;  
      }
    }
    
    
    return 1;
}



//====================================����������������������������������============================



//======================================================================
//��������BlackRightRealClear
//��  �ܣ��Һ�����ȡ�У���3���ؼ�ֵ��ʵ��ֵ����
//��  ������
//��  �أ���
//Ӱ  �죺BlackRightRealWB[], BlackRightRealW[], BlackRightRealB[]
//˵  ����
//      
//             
//======================================================================
void BlackRightRealClear(void)
{
    BlackRightRealWB[0] = 0;
    BlackRightRealWB[1] = 0;
    BlackRightRealW[0] = 0;
    BlackRightRealW[1] = 0;
    BlackRightRealB[0] = 0;
    BlackRightRealB[1] = 0;
}



//======================================================================
//��������BlackGetRightStep1Edge
//��  �ܣ�����������ߵĿ��ɺڵ�
//��  �����������к�row, �ڼ���ʹ��use, �Ƿ�Ϊʮ���ټ����ñ�־λCrossFlag
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺
//˵  ����
//======================================================================
uint8 BlackGetRightStep1Edge(uint8 row, uint8 use, uint8 CrossFlag)
{
  uint8 index, col, temp1;
  uint8 abs1;
  uint8 RightBeginCol; //�������������
  
  //����߼��ɹ�ʱ
  if(BlackLeftDone == 1)
  {
      //������������������Ҫ�ȸ������ߵ������Ҫ���ҡ�
    if(BlackLeftLoc[row][0] == MaxValUint8)
    {
      RightBeginCol = CameraRealWidth/2;
    }
    else
    {
      //����Ҫ������������4+BlackRightEdgeNum����
      RightBeginCol = MaxRe(CameraRealWidth/2, BlackLeftLoc[row][0] + 4 + BlackRightEdgeNum);
      //ͬʱ��Ҳ���ܳ����������219����ʵ�ǲ��ܳ���CameraRealWidth - 5 - BlackRightEdgeNum������forѭ���
      RightBeginCol = MinRe(RightBeginCol, CameraRealWidth - 5 - BlackRightEdgeNum);
    }
  }
  //����߼��ʧ��ʱ���Һ��߼������Ҫ�������߿���BlackRightEdgeStartColOffset��ô���С�
  else
  {
    RightBeginCol = CameraRealWidth/2 - BlackRightEdgeStartColOffset;  
  }
  
  index = 0;         //���ɵ�����
  //���м䵽���ұ�ɨ�裬��1�������
  for(col = RightBeginCol; col <= CameraRealWidth - 5 - BlackRightEdgeNum; col++) 
  {
      abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col+1+BlackRightEdgeNum]);
      if( 
          (abs1 > LimitRightWB) //���ߵĲ��
        &&(ImgNew[row][col] > LimitRightW)                     //�׵㹻��
        &&(ImgNew[row][col+1+BlackRightEdgeNum] < LimitRightB) //�ڵ㹻��
         )
      {         
          //�������У�����3������Ϊ�ڵ�
          if(row > BlackMiddleLine)
          {
            temp1 = (
                      (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB)
                    &&(ImgNew[row][col+3+BlackRightEdgeNum] < LimitRightB)
                    &&(ImgNew[row][col+4+BlackRightEdgeNum] < LimitRightB)
                    );
          }
          else
          {
            if(row > BlackFarLine)
            {
              //�м���У�����2������Ϊ�ڵ㡣
              temp1 = (
                        (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB)
                      &&(ImgNew[row][col+3+BlackRightEdgeNum] < LimitRightB)
                      );
            }
            //Զ�����У�����1������Ϊ�ڵ㡣
            else
            {
              temp1 = (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB);
            }
          }
          
          if(temp1)
          {
                            
              //����3�����ɺڵ㣬�򱨴�
              if(index == 3)       
              {
                if(CrossFlag)
                {
                  //��3���ؼ�ֵ��ʵ��ֵ����
                  BlackRightRealClear();
                }
                //���ж�λ����ʧ�ܣ�����Чֵ
                BlackRightLoc[row][0] = MaxValUint8;
                return 0;
              }
              if(CrossFlag)
              {
                if(use == 1)
                {
                  BlackRightRealWB[0] = ImgNew[row][col] - ImgNew[row][col+1+BlackRightEdgeNum]; 
                  BlackRightRealW[0] = ImgNew[row][col];
                  BlackRightRealB[0] = ImgNew[row][col+1+BlackRightEdgeNum];
                }
                else if(use == 2)
                {
                  BlackRightRealWB[1] = ImgNew[row][col] - ImgNew[row][col+1+BlackRightEdgeNum]; 
                  BlackRightRealW[1] = ImgNew[row][col];
                  BlackRightRealB[1] = ImgNew[row][col+1+BlackRightEdgeNum];
                }
                else
                {
                }
              }
              //������ɹ���ȡ�ڵ�
              BlackRightLoc[row][index] = col + 1 + BlackRightEdgeNum;          
              index++;
            
          }   
      }  
  }
  
  //1�����ɺڵ�Ҳû�У��򱨴�
  if(index == 0)
  {
    if(CrossFlag)
    {
      //��3���ؼ�ֵ��ʵ��ֵ����
      BlackRightRealClear();
    }
    //���ж�λ����ʧ�ܣ�����Чֵ
    BlackRightLoc[row][0] = MaxValUint8;
    return 0;
  }
  
  //û�б����ͻ��ߵ�����ڵ���ҳɹ�������1��2��3���ڵ�
  return 1;
}



//======================================================================
//��������BlackGetRightStep2Win
//��  �ܣ������������⺯��
//��  �����������к�row, ���ڴ�Сwin, Ԥ���������λ��predict
//��  �أ�1�ɹ�  0ʧ��
//Ӱ  �죺
//˵  ����    
//======================================================================
uint8 BlackGetRightStep2Win(uint8 row, uint8 win, uint8 predict)
{
  uint8 col, temp, temp1;
  uint8 abs1;

  //�ڹ滮�õĴ����ڣ��������Ҳ���������
  //��ֹ���
  //���ұ߽������ 
  if((predict + win) >= (CameraRealWidth - 5 - BlackRightEdgeNum)) 
  {
    temp = CameraRealWidth - 5 - BlackRightEdgeNum;
  }  
  else
  {
    temp = predict + win;
  }
  //����߽������
  if(predict <= win)
  {
    col = 0;
  }
  else
  {
    col = predict - win;  
  }
   
  for(; col < temp; col++) 
  {
    abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col+1+BlackRightEdgeNum]);
    if( 
          (abs1 > LimitRightWB) //���ߵĲ��
        &&(ImgNew[row][col] > LimitRightW)                     //�׵㹻��
        &&(ImgNew[row][col+1+BlackRightEdgeNum] < LimitRightB)                   //�ڵ㹻��
       )
    {
        
          //�������У�����3������Ϊ�ڵ�
          if(row > BlackMiddleLine)
          {
            temp1 = (
                      (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB)
                    &&(ImgNew[row][col+3+BlackRightEdgeNum] < LimitRightB)
                    &&(ImgNew[row][col+4+BlackRightEdgeNum] < LimitRightB)
                    );
          }
          else
          {
            //�м���� ������2����Ϊ��Ϊ�ڵ�
            if(row > BlackFarLine)
            {
              temp1 = (
                        (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB)
                      &&(ImgNew[row][col+3+BlackRightEdgeNum] < LimitRightB)
                      );
            }
            //Զ�����У�����1������Ϊ�ڵ�
            else
            {
              temp1 = (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB);
            }
          }
          
          if(temp1)
          {
          //ֱ�Ӽ�¼�õ�Ϊ���ߣ����ؼ���
          BlackRightLoc[row][0] = col + 1 + BlackRightEdgeNum;
          return 1;
          //break;               
          }
    }   
  }// end of forѭ��
  
  //���һֱ����������߻�û���ҵ������أ�
  
  BlackRightLoc[row][0] = MaxValUint8;   //���еĺ���λ�ü�Ϊ��Чֵ
  return 0;
  
}



//======================================================================
//��������BlackGetRightStep1Scan
//��  �ܣ���ɨ�躯��
//��  ����ɨ����ʼ��FirstLine, ɨ�������LastLine, ʮ���ټ���־CrossFlag
//��  �أ�0~CameraHight - 1���� 255�ɼ�ʧ��
//Ӱ  �죺
//˵  ����
//             
//======================================================================
uint8 BlackGetRightStep1Scan(uint8 FirstLine, uint8 LastLine, uint8 CrossFlag)
{
    uint8 row, temp1, temp2;
    uint8 abs1;
    uint8 tempWB, tempW, tempB;
    
  //�����BlackStep1Size���ò�ֵ���Һ���
    for(row = FirstLine; row > LastLine; row -= 2)
    {
      //�ж��Ƿ��������м�⵽���䣬���ɺڵ���3���㣬��ȡ����һ��
      temp1 = BlackGetRightStep1Edge(row, 1, CrossFlag);
      temp2 = BlackGetRightStep1Edge(row-1, 2, CrossFlag);
      if(temp1 && temp2)//���������ôд������Ƕ��if����Ϊ&&���ص�
      {
        abs1 = AbsRe(BlackRightLoc[row-1][0], BlackRightLoc[row][0]);
        //��һ���ж��������еĺڵ�ļ���Ƿ�С������ȡ��1�����ɺڵ㡣
        if(abs1 < BlackRightStep1ScanMinus)
        {
          if(CrossFlag)
            {           
              //��ֵ�Ĵ�������ԣ�ȣ��������½硣
              tempWB = (BlackRightRealWB[0] + BlackRightRealWB[1]) / 2 - LimitRightWBMargin; 
              if(tempWB < LimitRightWBMin) tempWB = LimitRightWBMin;
              else if(tempWB > LimitRightWBMax) tempWB = LimitRightWBMax;
              else ;
              LimitRightWB = tempWB;
              
              //�׵�Ĵ�������ԣ�ȣ��������½硣
              tempW = (BlackRightRealW[0] + BlackRightRealW[1]) / 2 - LimitRightWMargin;
              if(tempW < LimitRightWMin) tempW = LimitRightWMin;
              else if(tempW > LimitRightWMax) tempW = LimitRightWMax;
              else ;
              LimitRightW = tempW;
              
              //�ڵ�Ĵ�������ԣ�ȣ��������½硣
              tempB = (BlackRightRealB[0] + BlackRightRealB[1]) / 2 + LimitRightBMargin;
              if(tempB < LimitRightBMin) tempB = LimitRightBMin;
              else if(tempB > LimitRightBMax) tempB = LimitRightBMax;
              else ;
              LimitRightB = tempB;           
            }
          break;
        }
      }      
    }   
    
    //�����BlackStep1Size��Ҳû�м�⵽�����ĺ��ߣ�˵�����߼��ʧ��
    if(row <= LastLine)
      return MaxValUint8;
    else
      return row;
  
}


//======================================================================
//��������BlackRightCrossStep3
//��  �ܣ��Բ��ߺ���
//��  ������1����Ч���ߵ����һ��FirstLine�� ��2����Ч���ߵĵ�һ��LastLine
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺
//˵  ����
//             
//======================================================================
uint8 BlackRightCrossStep3(uint8 FirstLine, uint8 LastLine)
{
  float delta_x, delta_y, delta, index;
  uint8 row, temp1, temp2;
  //uint8 temp3, temp4, flag1, flag2;
  
  //��ʼ�бȽ����л��ߣ�����
  if(LastLine >= FirstLine)
  {
    uart_sendN(UART0, (uint8 *)"\nError In BlackRightCrossStep3!", 31);
    return 0;  
  }
  
  temp1 = BlackRightLoc[FirstLine][0];
  temp2 = BlackRightLoc[LastLine][0];
  
  /*
  flag1 = 1;
  flag2 = 1;
  //ȷ������������ֱ�Ǵ��ĵ㣬Ҳ��������6������Ϊ�ڵ�
  if(temp1 <= (CameraRealWidth - 9))
  {
    temp3 = (
            (ImgNew[FirstLine+1][temp1+6] < LimitRightB)
          &&(ImgNew[FirstLine+1][temp1+7] < LimitRightB)
          &&(ImgNew[FirstLine+1][temp1+8] < LimitRightB)
          );
    if(temp3)
    {
      flag1 = 0;  
    }
  }
  
  if(temp2 <= (CameraRealWidth - 9))
  {
    temp4 = (
            (ImgNew[LastLine-1][temp2+6] < LimitRightB)
          &&(ImgNew[LastLine-1][temp2+7] < LimitRightB)
          &&(ImgNew[LastLine-1][temp2+8] < LimitRightB)
          );
    if(temp4)
    {
      flag2 = 0;  
    }
  }
  
  if((flag1 == 0) || (flag2 == 0))
  {
    return 0;  
  }
  
  */
  
  delta_y = FirstLine - LastLine;
  
  
  //б������
  if(temp1 < temp2)
  {
    delta_x = temp2 - temp1;
    delta = delta_x / delta_y; //����1��������
    
    index = 1.0;
    for(row = FirstLine - 1; row >= LastLine + 1; row-- )
    {
      //ÿ������һ���
      BlackRightLoc[row][0] = (uint8)((float)BlackRightLoc[FirstLine][0] + delta * index);
      index += 1.0;
    }
  }
  //б������
  else if(temp1 > temp2)
  {
    delta_x = temp1 - temp2;
    delta = delta_x / delta_y;
    
    index = 1.0;
    for(row = FirstLine - 1; row >= LastLine + 1; row-- )
    {
      //ÿ������һ���
      BlackRightLoc[row][0] = (uint8)((float)BlackRightLoc[FirstLine][0] - delta * index);
      index += 1.0;
    }
  }
  //б��ֱ�ߣ������̫���ܳ���
  else
  {
    for(row = FirstLine - 1; row >= LastLine + 1; row-- )
    {
      //����ͬ��ֵ
      BlackRightLoc[row][0] = temp1;
    }
  }
  
  return 1;
    
}

//======================================================================
//��������BlackRightCrossConfirm
//��  �ܣ���ͷ��Ч�Ե�ȷ�ϡ�
//��  ������1�κ��ߵ���ʵ������Row1RealLastLine����2�κ��ߵ���ʵ��ʼ��Row2RealFirstLine
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺��
//˵  ����
//      
//             
//======================================================================
uint8 BlackRightCrossConfirm(uint8 Row1RealLastLine, uint8 Row2RealFirstLine)
{
  uint8 row, index;
  uint8 x[BlackCrossConfirmNum];
  uint8 y[BlackCrossConfirmNum];
  
  float a0, a1, temp;
  
  //��һ�κ���̫�̣��޷������ȷ�ԡ�ֱ�ӷ���1.
  if(Row1RealLastLine < 5) return 1;
  
  index = 0;
  for(row = Row1RealLastLine; ; row++)
  {
    //��Ч�еļ�¼
    if(BlackRightLoc[row][0] != MaxValUint8)
    {
      y[index] = BlackRightLoc[row][0];
      x[index] = row;
      index++;
    }
    //�������࣬��������
    if(index == BlackCrossConfirmNum) break;
    //ֱ���������û�дչ��㹻�ĵ�����˵����һ����Ч����̫�̣��޷������ȷ�ԣ�ֱ�ӷ���1.
    if(row == CameraHight - 1) return 1;
  }
  
  //��С���˷�
  //y = a0 + a1 * x
  a1 = LeastSquarea1(x, y, BlackCrossConfirmNum);
  a0 = LeastSquarea0(x, y, a1, BlackCrossConfirmNum);
  
  //tempΪ��2�κ�����ʼ�б�Ӧ���ڵ�λ�á�
  temp = a0 + a1 * Row2RealFirstLine;
  //������λ�ñ����ͳ��������ұ߽�ķ�Χ����˵���������е�2�κ��ߴ����ˡ�
  //Ҳ�Ͳ��ü���2�κ����ˣ�ֱ�ӷ���0.
  if((temp < 0) || (temp > CameraRealWidth - 1)) 
  {
    return 0;
  }
  else
  { //���ﱾ��Ӧ�ü��ϰ�������޶��ڴ��ڣ������ƺ�û��Ҫ��
    if(
      (BlackRightLoc[Row2RealFirstLine][0] > temp - BlackCrossConfirmWin) 
    &&(BlackRightLoc[Row2RealFirstLine][0] < temp + BlackCrossConfirmWin)
      )
    {
      return 1;
    }
    else
    {
      return 0;
    }
    
  }  
}


//======================================================================
//��������BlackRightAgainForCross
//��  �ܣ�ʮ�ּ�����
//��  ������2�κ��ߵ�Ԥ����ʼ��Row2FirstLine�� ��2�κ��ߵ�Ԥ�������Row2LastLine��
//        ��1�κ��ߵ�ʵ�ʽ�����Row1RealLastLine
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺BlackRightLoc[][]��
//˵  ����1. ����������ø�������ĺ�����Ԥ�ƻ��ѽ϶�ʱ�䣬��������������
//             
//======================================================================
uint8 BlackRightAgainForCross(uint8 Row2FirstLine, uint8 Row2LastLine, uint8 Row1RealLastLine)
{
    uint8 row, temp, temp1, temp2;
    uint8 Row2RealFirstLine; //��2�κ��ߵ���ʵ��ʼ��
    uint8 i;

    temp = BlackGetRightStep1Scan(Row2FirstLine, Row2LastLine, 0); //��3������0��ʾ��ʮ���ټ�⣬���ø���3���ؼ�ֵ
    if(temp == MaxValUint8)  
    {
      //ɨƨ�ɹ�����        //i >= Row2LastLine
      for(i = Row2FirstLine; ; i--)
      {
        BlackRightLoc[i][0] = MaxValUint8;
        if(i == 0) break;
      }
      return 0;  
    }
    else 
    {
      if(!BlackRightCrossConfirm(Row1RealLastLine, temp))
      { //ɨƨ�ɹ�����         //i >= (temp-1)
        for(i = Row2FirstLine; ; i--)
        {
          BlackRightLoc[i][0] = MaxValUint8;
          if(i == 0) break;
        }
        return 0;
      }
      //ʮ���ټ�����ͷ��ȷ���޶��ķ�Χ�ڣ����Լ�����
      else
      {
      row = temp;
      }
      //row = temp;
    }
    
    Row2RealFirstLine = row; //��¼��2�κ��ߵ���ʵ��ʼ��
    
    //ʮ���ټ���2�׶Σ�˳����ͷ���ߡ�
    //tempΪԤ��ĺڵ�λ��
    temp = BlackRightLoc[row-1][0] + BlackRightLoc[row-1][0] - BlackRightLoc[row][0];
    //���������֤�е�ȡ��Զ����
    for(row -= 2; ; row -= 2)
    {
      //����������еĺڵ���ɹ��������Ԥ����λ��
      temp1 = BlackGetRightStep2Win(row, BlackRightWinVal, temp);
      temp2 = BlackGetRightStep2Win(row-1, BlackRightWinVal, temp);
      if(temp1 && temp2) 
      {
        temp = BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0];
      }
      //���û���������м��ڵ�ɹ����򲻸���Ԥ���λ�ã�����ԭλ�á�
      else
      {
      }     
      if((row == Row2LastLine) || (row == Row2LastLine+1)) break;      
    }
    
    //�Բ������ߵĽ��ߡ�
    if(!BlackRightCrossStep3(Row1RealLastLine, Row2RealFirstLine))
    {
      return 0;
    }
    
    return 1;
        
}


//======================================================================
//��������BlackRightStep4BackLine
//��  �ܣ�����ߺ�����
//��  ����Step4StartLine��ʼ��
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺
//˵  ����
//             
//======================================================================
uint8 BlackRightStep4BackLine(uint8 Step4StartLine)
{
  uint8 row;
  uint8 i, index;
  uint8 x[BlackBackLineNum];   //ȡ���ٸ�����һ��ʼ�ж��塣
  uint8 y[BlackBackLineNum];
  uint8 j;
  uint8 temp1;
  float temp;
    
  float a0, a1;
  
  if(Step4StartLine - BlackBackLineNum - BlackBackLineNum < 0)
  {
    temp1 = 0;  
  }
  else
  {
    temp1 = Step4StartLine - BlackBackLineNum - BlackBackLineNum;
  }
  
  //ȡBlackBackLineNum������Ϊ��С���˷��Ļ�׼�㡣
  index = 0;
  for(i = Step4StartLine; ; i--)
  {
    if(BlackRightLoc[i][0] != MaxValUint8)
    {
      y[index] = BlackRightLoc[i][0];
      x[index] = i;
      index++;
    }
    if(index == BlackBackLineNum)
    {
      break;  
    }
    if(i == temp1)
    {
      return 0;
    }
  }
  
  //��С���˷�
  //y = a0 + a1 * x
  a1 = LeastSquarea1(x, y, BlackBackLineNum);
  a0 = LeastSquarea0(x, y, a1, BlackBackLineNum);
  
  for(row = Step4StartLine + 1; row <= CameraHight - 1; row++)
  {
    //����Ҳ�и��ȣ����Һ����󶼲��ܲ�����Χ��
    temp = a0 + a1 * row;
    if(temp > CameraRealWidth)
    {
      //BlackRightLoc[row][0] = CameraRealWidth - 1;
      //�������ҽ���ʱ��ԭ����Ϊ�ñ߽�ֵ�����ڵĲ����ǴӸ���������Чֵ��
      for(j = row; ; j++)
      {
        BlackRightLoc[row][0] = MaxValUint8;
        if(j == CameraHight - 1) break;
      }
      break;
    }
    else if(temp < 0)
    {
      //BlackRightLoc[row][0] = 0;
      //�������ҽ���ʱ��ԭ����Ϊ�ñ߽�ֵ�����ڵĲ����ǴӸ���������Чֵ��
      for(j = row; ; j++)
      {
        BlackRightLoc[row][0] = MaxValUint8;
        if(j == CameraHight - 1) break;
      }
      break;
    }
    else
    {
      BlackRightLoc[row][0] = (uint8)(temp); 
    }
  }
  
  return 1;
  
}


//======================================================================
//��������BlackGetRight
//��  �ܣ��Һ�����ȡ�㷨
//��  ������
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺
//˵  ����1. ��ʱ���Դ���ֱ���������ʮ��·��3�������2014.11.10
//      
//       
//       
//======================================================================
uint8 BlackGetRight(void)
{
    uint8 row, temp, temp1, temp2, temp3, i;
    uint8 GapCount, Row1RealLastLine, index;
    uint8 Step4Flag, Step4StartLine;

    Step4Flag = 0;

    //Ĭ��ʮ�ּ���־��Ϊδ���롣
    BlackRightCrossDone = 0;

    temp = BlackGetRightStep1Scan(CameraHight - 1, CameraHight - BlackStep1Size - 1, 1);
    if(temp == MaxValUint8)
    {
      return 0;
    }
    else
    {
      row = temp;
      //��ʼ��ͷ��λ�÷ǳ��ߡ�
      if(row < CameraHight - BlackRightBackLineStart)
      {
        Step4Flag = 1;
        Step4StartLine = row;
      }
    }
    //�ϴ��Ѿ��������˵�row-1�У���һ��Ҫ�����row-2��
    //BlackRightSlope();
    
    //tempΪԤ��ĺڵ�λ��
    //��Ԥ��ֵ�����޶���
    if((BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0]) < 0)
    {
      temp = 0;
    }
    else if((BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0]) >= CameraRealWidth) 
    {         
      temp = CameraRealWidth - 1; 
    }
    else
    {
      temp = BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0];
    }
    
    index = 0;
    
    GapCount = 0;
    //���������֤�е�ȡ��Զ����
    for(row -= 2; ; row -= 2)
    {
      temp1 = BlackGetRightStep2Win(row, BlackRightWinVal, temp);
      temp2 = BlackGetRightStep2Win(row-1, BlackRightWinVal, temp);
      temp3 = (
              (!temp1)
            &&(!temp2)
            //&&(!Step4Flag)
              );
      if(temp1 && temp2) 
      {
        //��Ԥ��ֵ�����޶���
        if((BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0]) < 0)
        {
          temp = 0;
        }
        else if((BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0]) >= CameraRealWidth) 
        {         
          temp = CameraRealWidth - 1; 
        }
        else
        {
          temp = BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0];
        }
      }
      else if(temp3)
      {       
        //Row1RealLastLine��¼��1�κ��ߵ����һ�С�
        if(index == 0)
        {
          //����һ�κ󣬾���Ҳ��������ˡ�
          index++;
          for(i = row; i < (row + 5); i++)
          {
            if(BlackRightLoc[i][0] != MaxValUint8)
            {
              Row1RealLastLine = i;
              break;
            }
          }
          if(Row1RealLastLine >= CameraHight - 1)
          {
            Row1RealLastLine = CameraHight - 1;
          }
          else
          {
          }
        }
        
        GapCount += 2;

        if(GapCount > BlackCrossGapLine)
        {
          //�ټ��ʱ����̫Զ�ˣ���û��Ҫ����ˡ�
          if(row < BlackRightCrossTooLowLine)
          {
            break;
          }
          else
          {
          }
          
          if(!BlackRightAgainForCross(row - 2, 1, Row1RealLastLine))
          {
            BlackRightCrossDone = 1;  //ʮ�ּ��ʧ��            
          }
          else
          {
            BlackRightCrossDone = 2;  //ʮ�ּ��ɹ�
          }
          break;  //ʮ���ټ����Ὺ����⵽ָ�������һ�У����Բ�����ѭ���ˣ�ֱ������
        }
        else
        {
           BlackRightCrossDone = 0;    //ʮ�ּ��δ����
        }      
      }
      else
      {       
      }     
      if((row == 0) || (row == 1)) break;
      
    }    
    //�����и������㣬Ҫ�ϸ���Ƶ��á�
    if(Step4Flag)
    {
      if(!BlackRightStep4BackLine(Step4StartLine))
      {
        return 0;  
      }
    }
   
    return 1;

  
  
}


//======================================================================
//��������BlackGet
//��  �ܣ�������ȡ����
//��  ������
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺����������Һ����㷨
//˵  ����
//======================================================================
uint8 BlackGet(void)
{
    uint8 tempLWB, tempLW, tempLB;
    uint8 tempRWB, tempRW, tempRB;
    //�ɼ��ɹ���־λ
    BlackLeftDone = 1;
    BlackRightDone = 1;
    
    //�������ȡ���ɹ��򷵻�1��ʧ���򷵻�0.
    if(!BlackGetLeft())
    {
      tempLWB = LimitLeftWB;
      tempLW = LimitLeftW;
      tempLB = LimitLeftB;
      
      LimitLeftWB = LimitOriLeftWB;                 
      LimitLeftW = LimitOriLeftW;
      LimitLeftB = LimitOriLeftB;
      
      if(!BlackGetLeft())
      {
        LimitLeftWB = tempLWB;
        LimitLeftW = tempLW;
        LimitLeftB = tempLB;
        
        //uart_sendN(UART0, (uint8 *)"\nFailed In BlackGetLeft!", 24);  
        BlackLeftDone = 0;
      }
      //��ȷ�ǹ��ߵ�ԭ��
      else
      {
        BlackLeft3ResetCount++;    //���ڹ��߱仯̫�������3���ؼ�ֵ���õĴ�����
      }
    }   
    
    //�Һ�����ȡ���ɹ��򷵻�1��ʧ���򷵻�0.
    if(!BlackGetRight())
    {
      tempRWB = LimitRightWB;
      tempRW = LimitRightW;
      tempRB = LimitRightB;
      
      LimitRightWB = LimitOriRightWB;                 
      LimitRightW = LimitOriRightW;
      LimitRightB = LimitOriRightB;

      //���ǹ��ߵ�ԭ�������£���3���ؼ�ֵ�������
      if(!BlackGetRight())
      {
        LimitRightWB = tempRWB;
        LimitRightW = tempRW;
        LimitRightB = tempRB;
      
        //uart_sendN(UART0, (uint8 *)"\nFailed In BlackGetRight!", 25);  
        BlackRightDone = 0;
      }
      //��ȷ�ǹ��ߵ�ԭ��
      else
      {
        BlackRight3ResetCount++;    //���ڹ��߱仯̫�������3���ؼ�ֵ���õĴ�����
      }
    }
    
    //���Һ��߾���ȡʧ�ܣ��������ȡʧ�ܡ�
    if((BlackLeftDone == 0) && (BlackRightDone == 0))
    {
      return 0;
    }    
    //��ʱ���ǲ���ȡ��������ߵķ�ʽ����Ϊ��ȷ����һ����ʮ�ֲ��ߣ�һ��������ߵ������
    /*
    //���Һ��߾���ȡ�ɹ�����һ���Ƿ���Ҫ����ߡ�
    else if((BlackLeftDone == 1) && (BlackRightDone == 1))
    {
      //���Һ��߾�Ҫ�������ʱ����ִ�в��߳��򡣷����п��������ʹ��ͷ�ϸ��������
      if((BlackLeftStep4Flag == 1) && (BlackRightStep4Flag == 1))
      {
        BlackLeftStep4BackLine(BlackLeftStep4StartLine);
        BlackRightStep4BackLine(BlackRightStep4StartLine);
      }
      
    }
    */
    else
    {
      
    }
    
    return 1;
}









/*
//======================================================================
//��������CenterLineGet
//��  �ܣ���������ȡ����
//��  ������
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺CenterLineLoc[]
//˵  ����1. �ݶ�Ϊȡ������Ч���ߵ��е㣬Ϊ�����汾��2014.11.11
//      
//             
//======================================================================
uint8 CenterLineGet(void)
{
  uint8 row;
  uint8 templ, tempr;
    
  //���Һ��߾���ȡʧ�ܡ�
  if((BlackLeftDone == 0) && (BlackRightDone ==  0))
  {
    return 0;  
  }
  
  for(row = CameraHight - 1; ; row--)
  {
    templ = BlackLeftLoc[row][0];
    tempr = BlackRightLoc[row][0];
    
    //���Һ��߾���ȡ�ɹ���
    if((BlackLeftDone == 1) && (BlackRightDone ==  1))
    {   
      //�������Һ��߶���ȡ���ˡ�
      if((templ != MaxValUint8) && (tempr != MaxValUint8))  
      {
        CenterLineLoc[row] = (templ + tempr) / 2;
      }
      //�����������ȡ���ˣ��Һ�����ȡʧ�ܡ�
      else if((templ != MaxValUint8) && (tempr == MaxValUint8))
      {
        CenterLineLoc[row] = templ + CenterLineHalfWidth[row];
      }
      //�����Һ�����ȡ���ˣ��������ȡʧ�ܡ�
      else if((tempr != MaxValUint8) && (templ == MaxValUint8))  
      {
        CenterLineLoc[row] = tempr - CenterLineHalfWidth[row];
      }
      //�������Һ��߾���ȡʧ�ܣ��������ĵ㸳��Чֵ��
      else 
      {
        CenterLineLoc[row] = MaxValUint8;  
      }
    }
    //�������ȡ�ɹ����Һ�����ȡʧ��
    else if((BlackLeftDone == 1) && (BlackRightDone ==  0))
    {
      if(templ != MaxValUint8)
      {
        CenterLineLoc[row] = templ + CenterLineHalfWidth[row];
      }
      else 
      {
        CenterLineLoc[row] = MaxValUint8;
      }
    }
    //�Һ�����ȡ�ɹ����������ȡʧ��
    else if((BlackLeftDone == 0) && (BlackRightDone ==  1))
    {
      if(tempr != MaxValUint8)
      {
        CenterLineLoc[row] = tempr - CenterLineHalfWidth[row];
      }
      else 
      {
        CenterLineLoc[row] = MaxValUint8;
      }
    }
    else
    {
      
    }
    
    //������������һ�У�������forѭ����
    if(row == 0) break;
  }
  return 1;
  
}
*/

//���ұ߽�����
uint8 BoundaryLimitRe(int16 x, uint8 left, uint8 right)
{
  if(x < left)
  {
    return left;
  }
  else if(x > right)
  {
    return right;
  }
  else
  {
    return x;
  }
}


//�����߻�ȡ������
uint8 CenterLineGet(void)
{
  uint8 row, i, j;
  uint8 templ, tempr;
  uint8 FailCount;
  uint8 tempmax;
  //uint8 flag001 = 0;
  //���Һ��߾���ȡʧ�ܡ�
  if((BlackLeftDone == 0) && (BlackRightDone ==  0))
  {
    return 0;  
  }
    
  //���Һ��߾���ȡ�ɹ���
  if((BlackLeftDone == 1) && (BlackRightDone ==  1))
  {
    FailCount = 0;
    for(row = CameraHight - 1; ; row--)
    {
      templ = BlackLeftLoc[row][0];
      tempr = BlackRightLoc[row][0];
      //�������Һ��߶���ȡ���ˡ�
      if((templ != MaxValUint8) && (tempr != MaxValUint8))  
      {        
        CenterLineLoc[row] = (templ + tempr) / 2;    
      }
      //�����������ȡʧ�ܣ��Һ�����ȡ�ɹ���
      else if((templ == MaxValUint8) && (tempr != MaxValUint8))
      {
        if(row == CameraHight - 1)
        {
            if(CenterLocStore != MaxValUint8)
            {
              CenterLineLoc[row] = BoundaryLimitRe(BlackRightLoc[row][0] - CenterLocStore, 0, CameraRealWidth - 1);
            }
            else
            {
              CenterLineLoc[row] = BoundaryLimitRe(BlackRightLoc[row][0] - CenterLineHalfWidth[row], 0, CameraRealWidth - 1);
            }
        }
        //�������������������ߵ�����ǰ������һ�е��Һ�������Чֵ��
        else if((row != (CameraHight-1))&&(BlackRightLoc[row+1][0] != MaxValUint8))
        { //ǰһ�е���������Ч��
          if(CenterLineLoc[row+1] != MaxValUint8)
          {
            CenterLineLoc[row] =  BoundaryLimitRe(CenterLineLoc[row+1] + tempr - BlackRightLoc[row+1][0], 0, CameraRealWidth - 1);
          }
          //ǰһ�е���������Ч��
          //����ǽ������У��Ǿ��п�����270�����Һ��ߴ�λ�������
          else if(row > CameraHight - 5)
          {
            if(CenterLocStore != MaxValUint8)
            {
              CenterLineLoc[row] = BoundaryLimitRe(BlackRightLoc[row][0] - CenterLocStore, 0, CameraRealWidth - 1);
            }
            else
            {
              CenterLineLoc[row] = BoundaryLimitRe(BlackRightLoc[row][0] - CenterLineHalfWidth[row], 0, CameraRealWidth - 1);
            }
            //flag001 = 1; //flag001�Ǳ�־λ�����Է�ֹ��ͷ���е������߲������������
          }
          else
          { //�������ͲŴ������򲻿��ǡ�
            if(row <= CameraHight - 3)
            { //�ҷ���Ҫ����С�
              for(i = 2; i <= 4; i++)
              {
                if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackRightLoc[row+i][0] != MaxValUint8))
                {
                   CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+i] + tempr - BlackRightLoc[row+i][0], 0, CameraRealWidth - 1); 
                   break;
                }
              }
              //û���ҵ�����Ҫ����С�
              if(i == 5) CenterLineLoc[row] = MaxValUint8; //����Чֵ
            }        
            else
            {   //�������ߣ����������������
                CenterLineLoc[row] = MaxValUint8; //����Чֵ
            }
          }
        }
        else
        {
          CenterLineLoc[row] = MaxValUint8; //����Чֵ
        }
      }
      //�����Һ�����ȡʧ�ܣ��������ȡ�ɹ���
      else if((templ != MaxValUint8) && (tempr == MaxValUint8))
      {
        if(row == CameraHight - 1)
        {
            if(CenterLocStore != MaxValUint8)
            {
              CenterLineLoc[row] = BoundaryLimitRe(BlackLeftLoc[row][0] + CenterLocStore, 0, CameraRealWidth - 1); 
            }
            else
            {
              CenterLineLoc[row] = BoundaryLimitRe(BlackLeftLoc[row][0] + CenterLineHalfWidth[row], 0, CameraRealWidth - 1); 
            }
        }
        //�������������������ߵ�����ǰ������һ�е����������Чֵ��
        else if((row != CameraHight - 1)&&(BlackLeftLoc[row+1][0] != MaxValUint8))
        {  //��һ�е���������Ч��
          if(CenterLineLoc[row+1] != MaxValUint8)
          {
            CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row + 1] + templ - BlackLeftLoc[row+1][0], 0, CameraRealWidth - 1);
          }
          //��һ�е���������Ч��
          //����ǽ������У��Ǿ��п�����270�����Һ��ߴ�λ�������
          else if(row > CameraHight - 3)
          { 
            if(CenterLocStore != MaxValUint8)
            {
              CenterLineLoc[row] = BoundaryLimitRe(BlackLeftLoc[row][0] + CenterLocStore, 0, CameraRealWidth - 1);
            }
            else
            {
              CenterLineLoc[row] = BoundaryLimitRe(BlackLeftLoc[row][0] + CenterLineHalfWidth[row], 0, CameraRealWidth - 1);
            }
            //flag001 = 1; //flag001�Ǳ�־λ�����Է�ֹ��ͷ���е������߲������������
          }
          else
          { //�ҷ�����������
            if(row <= CameraHight - 5)
            {
              for(i = 2; i <= 4; i++)
              {
                if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackLeftLoc[row+i][0] != MaxValUint8))
                { //�ҵ��˷����������С�
                  CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+i] + templ - BlackLeftLoc[row+i][0], 0, CameraRealWidth - 1);
                  break;
                }
              }
              if(i == 5) CenterLineLoc[row] = MaxValUint8; ////����Чֵ
            }
            else
            { //����̫�ߣ���������������� 
              CenterLineLoc[row] = MaxValUint8; //����Чֵ
            }
          }
        }
        else
        {
          CenterLineLoc[row] = MaxValUint8; //����Чֵ
        }
      }
      //���������߾���ȡʧ�ܡ�
      else 
      {
        CenterLineLoc[row] = MaxValUint8; //����Чֵ
      }
    if(CenterLineLoc[row] == MaxValUint8) 
    {
      FailCount++;
      //����Чֵ���ٴ���
      tempmax = MinRe(BlackLeftHeadLine, BlackRightHeadLine);
      if(row <= CameraHight-3 && CenterLineLoc[row+1] != MaxValUint8 && CenterLineLoc[row+2] != MaxValUint8)
      {
        if(row >= tempmax)
        {
          if(CenterLineLoc[row+1] + CenterLineLoc[row+1] - CenterLineLoc[row+2] < 0
           ||CenterLineLoc[row+1] + CenterLineLoc[row+1] - CenterLineLoc[row+2] > CameraRealWidth - 1)
          {           
          }
          else
          {
            //����������
            CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+1] + CenterLineLoc[row+1] - CenterLineLoc[row+2], 0, CameraRealWidth - 1);
          }
        }
        else
        {
        }
      }
      else
      {
      }
    }
    if(row == 0) break;
    }// end of for 
    
    if(FailCount >= CameraHight) return 0;
    //��������ȡ�ɹ�����¼��ͷ����Ϊ����ĵ�����ͷ��
    if(row == 0) 
    {
      for(j = CameraHight - 1; ; j--)
      { //�����3������ͷ��
        if(CenterLineLoc[j] != MaxValUint8 && BlackLeftLoc[j][0] != MaxValUint8 && BlackRightLoc[j][0] != MaxValUint8)
        {
          CenterLocStore = (BlackRightLoc[j][0] - BlackLeftLoc[j][0]) / 2;
          break;
        }
        if(j <= CameraHight - 4)
        {
          //CenterLocStore = MaxValUint8;
          break;
        }
      }
      return 1;
    }
  } // end of if
  
  //�������ȡ�ɹ����Һ�����ȡʧ�ܡ��ͻ����ϰ����������������ߡ�
  if((BlackLeftDone == 1) && (BlackRightDone == 0))
  {
    for(row = CameraHight - 1; row > CameraHight - BlackStep1Size; row --)
    {
      //��������Чֵ�� //ԭΪ������������Чֵ���ָ�Ϊһ�С�
      if(BlackLeftLoc[row][0] != MaxValUint8)
      {
        if(CenterLocStore != MaxValUint8)
        {
          CenterLineLoc[row] = BoundaryLimitRe(BlackLeftLoc[row][0] + CenterLocStore, 0, CameraRealWidth - 1);
        }
        else
        {
          CenterLineLoc[row] = BoundaryLimitRe(BlackLeftLoc[row][0] + CenterLineHalfWidth[row], 0, CameraRealWidth - 1);
        }
        break;
      }
      else
      {
        CenterLineLoc[row] = MaxValUint8;
      }
    }
    //��������ȡʧ�ܡ�
    if(row <= CameraHight - BlackStep1Size) return 0;
    
    //�������ߵ����ƽ��������ߵĹ��ơ�
    for(row --; ; row--)
    {
      if(BlackLeftLoc[row][0] != MaxValUint8)
      {   //��һ�е���������Ч��
          if(CenterLineLoc[row+1] != MaxValUint8)
          {
            CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row + 1] + BlackLeftLoc[row][0] - BlackLeftLoc[row+1][0], 0, CameraRealWidth - 1);
          }
          //��һ�е���������Ч��
          else
          { //�ҷ�����������
            if(row <= CameraHight - 5)
            {
              for(i = 2; i <= 4; i++)
              {
                if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackLeftLoc[row+i][0] != MaxValUint8))
                { //�ҵ��˷����������С�
                  CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+i] + BlackLeftLoc[row][0] - BlackLeftLoc[row+i][0], 0, CameraRealWidth - 1);
                  break;
                }
              }
              if(i == 5) CenterLineLoc[row] = MaxValUint8; ////����Чֵ
            }
            else
            { //����̫�ߣ���������������� 
              CenterLineLoc[row] = MaxValUint8; //����Чֵ
            }
          }
      }
      else
      {
        CenterLineLoc[row] = MaxValUint8; //����Чֵ  
      }
      
      if(row == 0) break;
    }       
    if(row == 0) return 1;
  } // end of if
  
  //�Һ�����ȡ�ɹ����������ȡʧ�ܡ��ͻ����ϰ����������������ߡ�
  if((BlackLeftDone == 0) && (BlackRightDone == 1))
  {
    //�������ߵ���ͷ��
    for(row = CameraHight - 1; row > CameraHight - BlackStep1Size; row --)
    {
      //��������Чֵ�� //ԭΪ������������Чֵ���ָ�Ϊһ�С�
      if(BlackRightLoc[row][0] != MaxValUint8)
      {
        if(CenterLocStore != MaxValUint8)
        {
          CenterLineLoc[row] = BoundaryLimitRe(BlackRightLoc[row][0] - CenterLocStore, 0, CameraRealWidth - 1);
        }
        else
        {
          CenterLineLoc[row] = BoundaryLimitRe(BlackRightLoc[row][0] - CenterLineHalfWidth[row], 0, CameraRealWidth - 1);
        }
        break;
      }
      else
      {
        CenterLineLoc[row] = MaxValUint8;
      }
    }
    //û���ҵ���������ͷ����������ȡʧ�ܡ�
    if(row <= CameraHight - BlackStep1Size) return 0;
    
    //�ҵ���ͷ���������ߵ����ƽ��������ߵĹ��ơ�
    for(row--; ; row--)
    {
      if(BlackRightLoc[row][0] != MaxValUint8)
      {
        //ǰһ�е����ĵ���Ч�������
        if(CenterLineLoc[row+1] != MaxValUint8)
        {
          CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+1] + BlackRightLoc[row][0] - BlackRightLoc[row+1][0], 0, CameraRealWidth - 1);
        }
        //ǰһ�е����ĵ���Ч�������
        else
        { //��������Ҫ��С��
          if(row <= CameraHight - 5)
          { //�����Ƿ�����������Ч���С�
            for(i = 2; i <= 4; i++)
            {
              if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackRightLoc[row+i][0] != MaxValUint8))
              {
                CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+i] + BlackRightLoc[row][0] - BlackRightLoc[row+i][0], 0, CameraRealWidth - 1);
                break;
              }
            }
            //����3��û�ҵ�����Ҫ����У�����Чֵ��
            if(i == 5) CenterLineLoc[row] = MaxValUint8; 
          }
          //����̫�ߣ������ˡ�
          else
          {
            CenterLineLoc[row] = MaxValUint8; //����Чֵ  
          }
        }
      }
      else
      {
        CenterLineLoc[row] = MaxValUint8; //����Чֵ  
      }
      
      if(row == 0) break;
    }       
    if(row == 0) return 1;
  } // end of if
  
  return 0; 
}

//�����߲��䴦���������˵�25�У��Ͳ�����25�С�����250���ó�250��
uint8 CenterLineGetCom(void)
{
  uint8 row;
  
  for(row = 0; ; row++)
  {
    if(CenterLineLoc[row] != MaxValUint8)
    {
      if(row < CenterKeyLine)
      {
        break;
      }
      else
      {
        for(; ; row--)
        {
          CenterLineLoc[row-1] = BoundaryLimitRe(CenterLineLoc[row] + CenterLineLoc[row] - CenterLineLoc[row+1], 0, CameraRealWidth - 1);
          if(row <= CenterKeyLine) break;          
        }
        break;
      }
    }
  }
  
  return 1;
}





//ͼ�����¸�ֵ,�в��䣨����DMA�б仯��ѡȡ��Ҫ���У������޷���DMA�б仯����������仯��
void ImgPut(void)
{
    uint16 i, j, k, temp1, temp2;   
    
    temp1 = CameraWidth/2 - CameraRealWidth/2 - 1;
    temp2 = CameraWidth/2 + CameraRealWidth/2 - 1;
    
    for(i = 0; i < CameraHight; i++)
    {
      k = 0;
      for(j = temp1; j < temp2; j++)
      {
        ImgNew[i][k] = ImgRaw[i][j];
        k++;
      }
    }
}


//����������
//��������������ȥ����uint16�͵ģ������ҵ��õ�ʱ��ֻ���õ�uint8�͵ģ��Ҳ��ᳬ��255.
uint16 MathSqrt(uint16 x1)
{
  uint8 ans = 0, p = 0x80;
  uint16 x = x1;
  
  while(p!=0)
  {
    ans += p;
    if(ans * ans > x) ans -=p;
    p = (uint8)(p / 2);
  }
  return ans;  
}

//���ߵ�������ȡ���������ҹգ�����Ϊ˳ʱ�뷽��ֲ���������Ϊ������������գ�����Ϊ��ʱ�ӷ���ֲ���������Ϊ��
//K = 4*SABC/AB/BC/AC
int16 CurveGet(uint8 AX, uint8 AY, uint8 BX, uint8 BY, uint8 CX, uint8 CY)
{
  int16 SABC_temp; //�����ε��������������
  int16 tempab, tempbc, tempac;
  int16 AB, BC, AC; //�����εı߳�����Ϊ����
  //int16 K;        //���ʽ������������
  
  SABC_temp = ((BX - AX) * (CY - AY) - (CX - AX) * (BY - AY));
  
  tempab = (BX - AX) * (BX - AX) + (BY - AY) * (BY - AY);
  if(tempab > 100) 
  {
    AB = MathSqrt(tempab / 100) * 10; //ʧ����λ�ľ��ȣ���Ϊ������㷶Χ�����ơ�
  }
  else
  {
    AB = MathSqrt(tempab);
  }
  
  tempbc = (BX - CX) * (BX - CX) + (BY - CY) * (BY - CY);
  if(tempbc > 100) 
  {
    BC = MathSqrt(tempbc / 100) * 10; //ʧ����λ�ľ��ȣ���Ϊ������㷶Χ�����ơ�
  }
  else
  {
    BC = MathSqrt(tempbc);
  }
  
  tempac = (CX - AX) * (CX - AX) + (CY - AY) * (CY - AY);
  if(tempac > 100) 
  {
    AC = MathSqrt(tempac / 100) * 10; //ʧ����λ�ľ��ȣ���Ϊ������㷶Χ�����ơ�
  }
  else
  {
    AC = MathSqrt(tempac);
  }
  
  return (CurveGetCompen * SABC_temp / AB / BC / AC);
}



//SABC�������ȡ��˳ʱ���򷵻ظ�ֵ����ʱ���򷵻���ֵ��
//�����½�Ϊԭ�㣬����Ϊx��������(0~249)������Ϊy��������(0~49)��
int16 SABCGet(uint8 x1, uint8 y1, uint8 x2, uint8 y2, uint8 x3, uint8 y3)
{
  int16 SABC_temp;
  
  SABC_temp = ((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1)) / 2;
  
  return SABC_temp;
}


//���ʷ�����ȡ
//Ӱ�죺CurveSL, CurveSC, CurveSR, 0��Ч��1����2��
//      SABCL, SABCC, SABCR
uint8 CurveSignGet(void)
{
  uint8 row;
  uint8 temp;
  
  //1. ���������ʷ�����ȡ
  //���ʷ���Ԥ�����㡣
  CurveLineChosenC1 = MaxValUint8;
  CurveLineChosenC2 = MaxValUint8;
  CurveLineChosenC3 = MaxValUint8;
  
  //���ʻ��ڵ���1 CurveLineChosen1�����ϵ���ȡ��һ����Чֵ��
  for(row = 0; ; row++)
  {
    if(row >= CameraHight - 2) 
    {
      CurveLineChosenC1 = MaxValUint8;
      return 0;
    }
    if(CenterLineLoc[row] != MaxValUint8)
    {
      CurveLineChosenC1 = row;
      break;
    }   
  }
  //�ѵ�1����Чֵ��CameraHight-1�ľ���ֳ�2�Ρ�
  temp = (CameraHight - 1 - row) / 2;
  if(temp == 0) 
  {
    CurveLineChosenC1 = MaxValUint8;
    return 0;
  }
  
  //���ʻ��ڵ���2 CurveLineChosen2
  for(row = CurveLineChosenC1 + temp; ; row++)
  {
    if(row >= CameraHight - 1) 
    {
      CurveLineChosenC1 = MaxValUint8;
      CurveLineChosenC2 = MaxValUint8;
      return 0;
    }
    if(CenterLineLoc[row] != MaxValUint8)
    {
      CurveLineChosenC2 = row;
      break;
    }
  }
  
  //���ʻ��ڵ���3 CurveLineChosen3
  for(row = CurveLineChosenC2 + temp; ; row++)
  {
    if(row >= CameraHight) 
    {
      CurveLineChosenC1 = MaxValUint8;
      CurveLineChosenC2 = MaxValUint8;
      CurveLineChosenC3 = MaxValUint8;
      return 0;
    }
    if(CenterLineLoc[row] != MaxValUint8)
    {
      CurveLineChosenC3 = row;
      break;
    }
  } 
  //SABCC�����������������������ȡ
  //SABCC = SABCGet(CenterLineLoc[CurveLineChosenC1], CameraHight - 1 - CurveLineChosenC1,
  //                CenterLineLoc[CurveLineChosenC2], CameraHight - 1 - CurveLineChosenC2,
  //                CenterLineLoc[CurveLineChosenC3], CameraHight - 1 - CurveLineChosenC3
  //                );
  CURVEC = CurveGet(CenterLineLoc[CurveLineChosenC1], CameraHight - 1 - CurveLineChosenC1,
                   CenterLineLoc[CurveLineChosenC2], CameraHight - 1 - CurveLineChosenC2,
                   CenterLineLoc[CurveLineChosenC3], CameraHight - 1 - CurveLineChosenC3
                   );    
  
  
  //���Һ����п���ֻ��һ����ȡ�ɹ��������ɹ����Ͳ��÷�ʱ���ˡ�
  if(BlackLeftDone == 1)
  {
    //2. ��������ʷ�����ȡ
    //���ʷ���Ԥ�����㡣
    CurveLineChosenL1 = MaxValUint8;
    CurveLineChosenL2 = MaxValUint8;
    CurveLineChosenL3 = MaxValUint8;
    
    //���ʻ��ڵ���1 CurveLineChosen1�����ϵ���ȡ��һ����Чֵ��
    for(row = 0; ; row++)
    {
      if(row >= CameraHight - 2) 
      {
        CurveLineChosenL1 = MaxValUint8;
        return 0;
      }
      if(BlackLeftLoc[row][0] != MaxValUint8)
      {
        CurveLineChosenL1 = row;
        break;
      }   
    }
    //�ѵ�1����Чֵ��CameraHight-1�ľ���ֳ�2�Ρ�
    temp = (CameraHight - 1 - row) / 2;
    if(temp == 0) 
    {
      CurveLineChosenL1 = MaxValUint8;
      return 0;
    }
    
    //���ʻ��ڵ���2 CurveLineChosen2
    for(row = CurveLineChosenL1 + temp; ; row++)
    {
      if(row >= CameraHight - 1) 
      {
        CurveLineChosenL1 = MaxValUint8;
        CurveLineChosenL2 = MaxValUint8;
        return 0;
      }
      if(BlackLeftLoc[row][0] != MaxValUint8)
      {
        CurveLineChosenL2 = row;
        break;
      }
    }
    
    //���ʻ��ڵ���3 CurveLineChosen3
    for(row = CurveLineChosenL2 + temp; ; row++)
    {
      if(row >= CameraHight) 
      {
        CurveLineChosenL1 = MaxValUint8;
        CurveLineChosenL2 = MaxValUint8;
        CurveLineChosenL3 = MaxValUint8;
        return 0;
      }
      if(BlackLeftLoc[row][0] != MaxValUint8)
      {
        CurveLineChosenL3 = row;
        break;
      }
    }      
    //SABCL����������������������ȡ
    //SABCL = SABCGet(BlackLeftLoc[CurveLineChosenL1][0], CameraHight - 1 - CurveLineChosenL1,
    //               BlackLeftLoc[CurveLineChosenL2][0], CameraHight - 1 - CurveLineChosenL2,
    //               BlackLeftLoc[CurveLineChosenL3][0], CameraHight - 1 - CurveLineChosenL3
    //               );
    CURVEL = CurveGet(BlackLeftLoc[CurveLineChosenL1][0], CameraHight - 1 - CurveLineChosenL1,
                      BlackLeftLoc[CurveLineChosenL2][0], CameraHight - 1 - CurveLineChosenL2,
                      BlackLeftLoc[CurveLineChosenL3][0], CameraHight - 1 - CurveLineChosenL3
                      );
    
  }
  
  
  //���Һ����п���ֻ��һ����ȡ�ɹ��������ɹ����Ͳ��÷�ʱ���ˡ�
  if(BlackRightDone == 1)
  {
    //3. �Һ������ʷ�����ȡ
    //���ʷ���Ԥ�����㡣
    CurveLineChosenR1 = MaxValUint8;
    CurveLineChosenR2 = MaxValUint8;
    CurveLineChosenR3 = MaxValUint8;
    
    //���ʻ��ڵ���1 CurveLineChosen1�����ϵ���ȡ��һ����Чֵ��
    for(row = 0; ; row++)
    {
      if(row >= CameraHight - 2) 
      {
        CurveLineChosenR1 = MaxValUint8;
        return 0;
      }
      if(BlackRightLoc[row][0] != MaxValUint8)
      {
        CurveLineChosenR1 = row;
        break;
      }   
    }
    //�ѵ�1����Чֵ��CameraHight-1�ľ���ֳ�2�Ρ�
    temp = (CameraHight - 1 - row) / 2;
    if(temp == 0) 
    {
      CurveLineChosenR1 = MaxValUint8;
      return 0;
    }
    
    //���ʻ��ڵ���2 CurveLineChosen2
    for(row = CurveLineChosenR1 + temp; ; row++)
    {
      if(row >= CameraHight - 1) 
      {
        CurveLineChosenR1 = MaxValUint8;
        CurveLineChosenR2 = MaxValUint8;
        return 0;
      }
      if(BlackRightLoc[row][0] != MaxValUint8)
      {
        CurveLineChosenR2 = row;
        break;
      }
    }
    
    //���ʻ��ڵ���3 CurveLineChosen3
    for(row = CurveLineChosenR2 + temp; ; row++)
    {
      if(row >= CameraHight) 
      {
        CurveLineChosenR1 = MaxValUint8;
        CurveLineChosenR2 = MaxValUint8;
        CurveLineChosenR3 = MaxValUint8;
        return 0;
      }
      if(BlackRightLoc[row][0] != MaxValUint8)
      {
        CurveLineChosenR3 = row;
        break;
      }
    }   
    //SABCR�Һ��������������������ȡ
    //SABCR = SABCGet(BlackRightLoc[CurveLineChosenR1][0], CameraHight - 1 - CurveLineChosenR1, 
    //                BlackRightLoc[CurveLineChosenR2][0], CameraHight - 1 - CurveLineChosenR2, 
    //                BlackRightLoc[CurveLineChosenR3][0], CameraHight - 1 - CurveLineChosenR3
    //                );
    CURVER = CurveGet(BlackRightLoc[CurveLineChosenR1][0], CameraHight - 1 - CurveLineChosenR1, 
                      BlackRightLoc[CurveLineChosenR2][0], CameraHight - 1 - CurveLineChosenR2, 
                      BlackRightLoc[CurveLineChosenR3][0], CameraHight - 1 - CurveLineChosenR3
                      );
     
  }
  
  return 1;
  
}


//���������ж�
//======================================================================
//��������PathJudge
//��  �ܣ����������ж�
//��  ������
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺PathType
//˵  ����
//             
//======================================================================
uint8 PathJudge(void)
{
  //��������PathType: 0δ֪ 1ֱ�� 2���� 3���� 4���� 5���� 6���� 7����
  PathType = 0;
  //uint8 row;
  
  //���ʷ��Ż�ȡ�ɹ�
  if(CurveSignGet())
  {
    //���Һ��߾���ȡ�ɹ����������
    if(BlackLeftDone == 1 && BlackRightDone == 1)
    { //ȫ����ʱ�룬Ϊ���䡣������С�������������Ϊ���ĵ������
      if(CURVEL < 0 && CURVEC < 0 && CURVER < 0)
      { 
        PathType = 2;
      }
      //ȫ��˳ʱ�룬Ϊ���䡣������С�������������Ϊ���ĵ������
      else if(CURVEL > 0 && CURVEC > 0 && CURVER > 0)
      {        
        PathType = 3;
      }
      else
      {
        if(
          (AbsSelf(CURVEL) < PathStraightLimitL)
        &&(AbsSelf(CURVEC) < PathStraightLimitC)
        &&(AbsSelf(CURVER) < PathStraightLimitR)
          )
        { //��С����ֵ��Ϊֱ����
          PathType = 1;  
        }
        else
        {
          PathType = 0; //δ֪�������͡�  
        }
      }
    }
    
    //�������ȡʧ�ܣ��Һ�����ȡ�ɹ����������
    if(BlackLeftDone == 0 && BlackRightDone == 1)
    { //������������
      if(CURVEC < 0 && CURVER < 0)
      {
        PathType = 5;
      }
      //��������ڵ���
      else if(CURVEC > 0 && CURVER > 0)
      {
        PathType = 6;
      }
      else
      {
        if(
          (AbsSelf(CURVEC) < PathStraightLimitC)
        &&(AbsSelf(CURVER) < PathStraightLimitR)
          )
        { //��С����ֵ��Ϊֱ����
          PathType = 1;  
        }
        else
        {
          PathType = 0; //δ֪�������͡�  
        }
      }
    }
    
    //�Һ�����ȡʧ�ܣ��������ȡ�ɹ����������
    if(BlackLeftDone == 1 && BlackRightDone == 0)
    { //��������ڵ���
      if(CURVEC < 0 && CURVEL < 0)
      {
        PathType = 4;
      }
      //������������
      else if(CURVEC > 0 && CURVEL > 0)
      {
        PathType = 7;
      }
      else
      {
        if(
          (AbsSelf(CURVEC) < PathStraightLimitC)
        &&(AbsSelf(CURVEL) < PathStraightLimitL)
          )
        { //��С����ֵ��Ϊֱ����
          PathType = 1;  
        }
        else
        {
          PathType = 0; //δ֪�������͡�  
        }
      }
    }
    
    return 1;
  }
  //���ʷ��Ż�ȡʧ��
  else
  {
    PathType = 0;  
    return 0;
  }
  
}





//======================================================================
//��������ImagePro
//��  �ܣ�
//��  ������
//��  �أ�1�ɹ� 0ʧ��
//Ӱ  �죺
//˵  ����
//             
//======================================================================
uint8 ImagePro(void)
{
    uint8 i;
    //ͼ��ȡ��Ҫ���У����¸�ֵ��Ϊ�˺���ı�̷��㡣
    ImgPut();
  
    //ImageExtract(ImgSend, ImgStore, CameraSize);  

    
    //����ͼ��洢���鵽��λ��
    //SendImage(ImgNew);       
    //������ȡ����
    if(!BlackGet())        
    {
        //uart_sendN(UART0, (uint8 *)"\nBlackGet Failed!", 17);  
        CenterLineResult = 0;
        PathType = 0;
        BlackLeftHeadLine = MaxValUint8;
        BlackRightHeadLine = MaxValUint8;
        return 0;
    }
    else
    { //������ȡ�ɹ��������ߺ��ߵ���ͷ
      //������ͷ�Ĳ���
      if(BlackLeftDone == 1)
      {
        for(i = 0; ; i++)
        {
          if(BlackLeftLoc[i][0] != MaxValUint8)
          {
            BlackLeftHeadLine = i;
            break;
          }
          if(i == CameraHight - 1) 
          {
            BlackLeftHeadLine = MaxValUint8;
            break;
          }
        }
      }
      else
      {
        BlackLeftHeadLine = MaxValUint8;
      }
      
      //������ͷ�Ĳ���
      if(BlackRightDone == 1)
      {
        for(i = 0; ; i++)
        {
          if(BlackRightLoc[i][0] != MaxValUint8)
          {
            BlackRightHeadLine = i;
            break;
          }
          if(i == CameraHight - 1) 
          {
            BlackRightHeadLine = MaxValUint8;
            break;
          }
        }
      }
      else
      {
        BlackRightHeadLine = MaxValUint8;
      }
    }
    
    //��������ȡ����
    CenterLineResult = 1;
    if(!CenterLineGet())
    {
      //uart_sendN(UART0, (uint8 *)"\nCenterLineGet Failed!", 22); 
      CenterLineResult = 0;
      PathType = 0;
      return 0;
    }
    else
    {
      //CenterLineGetCom();  
    }
    
    //���������ж�
    //������ʱ����������ȡ�ɹ������Һ���������һ����ȡ�ɹ���
    if(!PathJudge())
    {
      //uart_sendN(UART0, (uint8 *)"\nPathJudge Failed!", 18);
      return 0;
    }
    //�������������飬���÷���float�͵����ݣ�ͬ���Ĵ����������λ����ɡ�
    //SendCenterLineLoc(CenterLineLoc);
    
    //SendImage(ImgNew);  
    
    return 1;
}


uint8 ImageProSend(void)
{
    //ͼ��ȡ��Ҫ���У����¸�ֵ��Ϊ�˺���ı�̷��㡣
    ///////////////////////////////////////////��������Ҫ��ʾ��������һ��ʱ�䣬���ǲ��Ǻķ���̫��ʱ�䡣
    ImgPut();
  
    //ImageExtract(ImgSend, ImgStore, CameraSize);  
    /*
    //������ȡ����
    if(!BlackGet())         ////////////////////////////���������ȡʧ�ܣ�������ø�������ָʾ
    {
        uart_sendN(UART0, (uint8 *)"\nBlackGet Failed!", 17);  
        return 0;
    }
    
    //��������ȡ����
    CenterLineResult = 1;
    if(!CenterLineGet())
    {
      uart_sendN(UART0, (uint8 *)"\nCenterLineGet Failed!", 22); 
      CenterLineResult = 0;
      return 0;
    }
    
    //PathJudge();

    */
    //�������������飬���÷���float�͵����ݣ�ͬ���Ĵ����������λ����ɡ�
    //SendCenterLineLoc(CenterLineLoc);
    
    //����ͼ��洢���鵽��λ��
    SendImage(ImgNew);      
    
    return 1;
}




















