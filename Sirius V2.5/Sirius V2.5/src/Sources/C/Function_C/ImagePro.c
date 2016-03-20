/******************************************************************************/
/*******************************************************************************
  文件名：图像处理程序文件ImagePro.c
  功  能：图像处理
  日  期：2014.10.09
  作  者：HJZ
  备  注：
*******************************************************************************/
/******************************************************************************/

#include "ImagePro.h"

//中心线提取时，实际赛道宽度的一半对应的像素点数。是固定角度后测得的值。
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

uint8 ImgNew[CameraHight][CameraRealWidth];       //重新处理后的数据储存数组
uint8 BlackLeftLoc[CameraHight][3];       //左黑线位置存储数组
uint8 BlackRightLoc[CameraHight][3];      //右黑线位置存储数组
uint8 CenterLineLoc[CameraHight];      //中心线位置存储数组, 255为无效值
//uint8 MaxValUint8 = 255;             //自定义的无效值
uint8 CenterLineResult = 1;             //中心线提取成功标志
uint8 CenterKeyLine = 25;                  //固定的要选取的行。
uint8 CenterLocStore = MaxValUint8;         //左右黑线都提取到的时候，保存的CenterLineLoc[CameraHight - 1]。

uint8 PathType = 0;                       //0未知 1直道 2左中 3右中 4左内 5左外 6右内 7右外
uint8 CurveLineChosenC1 = 0;               //曲率求取时，中心线选取的第1行。
uint8 CurveLineChosenC2 = 0;               //曲率求取时，中心线选取的第1行。
uint8 CurveLineChosenC3 = 0;               //曲率求取时，中心线选取的第1行。
uint8 CurveLineChosenL1 = 0;               //曲率求取时，左黑线选取的第1行。
uint8 CurveLineChosenL2 = 0;               //曲率求取时，左黑线选取的第1行。
uint8 CurveLineChosenL3 = 0;               //曲率求取时，左黑线选取的第1行。
uint8 CurveLineChosenR1 = 0;               //曲率求取时，右黑线选取的第1行。
uint8 CurveLineChosenR2 = 0;               //曲率求取时，右黑线选取的第1行。
uint8 CurveLineChosenR3 = 0;               //曲率求取时，右黑线选取的第1行。
int16 SABCL = 0;                          //曲率求取时，左黑线曲率三角形的面积，顺时针为负，逆时针为正。
int16 SABCC = 0;                          //曲率求取时，中心线曲率三角形的面积，顺时针为负，逆时针为正。
int16 SABCR = 0;                          //曲率求取时，右黑线曲率三角形的面积，顺时针为负，逆时针为正。
int16 CURVEL = 0;                          //曲率求取时，左黑线的曲率，顺时钟为负，逆时针为正。
int16 CURVEC = 0;                          //曲率求取时，中心线的曲率，顺时钟为负，逆时针为正。
int16 CURVER = 0;                          //曲率求取时，右黑线的曲率，顺时钟为负，逆时针为正。
int16 PathStraightLimitL = 20;           //赛道类型判断时，左黑线判断为直线的阈值，这里乱写的，需要用C#测定。
int16 PathStraightLimitC = 20;           //赛道类型判断时，中心线判断为直线的阈值，这里乱写的，需要用C#测定。
int16 PathStraightLimitR = 20;           //赛道类型判断时，右黑线判断为直线的阈值，这里乱写的，需要用C#测定。
int16 CurveGetCompen = 2000;             //曲率求取时，为了不使数太小，乘的补偿量。

uint8 ErrorGetSelf;                 //平均值与自身的偏差，也就是curve
uint8 ErrorGetCen;                 //平均值与物理中心线的偏差。

//左
uint8 BlackLeftRealWB[2];                  //黑线的实际黑白差值的存储数组，用于计算实际黑白差值的阈值。替代LimitLeftWB
uint8 BlackLeftRealB[2];                   //黑线的实际黑点值存储数组，用于计算实际黑点阈值。替代LimitLeftB
uint8 BlackLeftRealW[2];                   //黑线的实际白点值存储数组，用于计算实际白点阈值。替代LimitLeftW
//右
uint8 BlackRightRealWB[2];                  //黑线的实际黑白差值的存储数组，用于计算实际黑白差值的阈值。替代LimitRightWB
uint8 BlackRightRealB[2];                   //黑线的实际黑点值存储数组，用于计算实际黑点阈值。替代LimitRightB
uint8 BlackRightRealW[2];                   //黑线的实际白点值存储数组，用于计算实际白点阈值。替代LimitRightW


//左
//3个关键值的可改值，可由自适应性算法更改。
uint8 LimitLeftWB = LimitOriLeftWB;    //黑白像素点的差值，两个点的差必须要大于这个值，才能认为有跳变。
uint8 LimitLeftW = LimitOriLeftW;      //白点必须要大于此值
uint8 LimitLeftB = LimitOriLeftB;      //黑点必须要小于此值

uint8 BlackLeftCrossDone = 0;    //左黑线十字检测标志位 0未进入 1失败 2成功
uint8 BlackLeftDone = 1;          //左黑线提取成功标示位 1成功 0失败
uint8 BlackLeft3ResetCount = 0;       //由于光线变化太大引起的3个关键值重置的次数。
uint8 BlackLeftCrossTooLowLine = 3;    //十字再检测时，低于该行就没必要启动再检测程序了。
//uint8 BlackLeftStep4Flag = 0;          //左黑线需要执行第4阶段的标志位，1需执行，0不需执行。
//uint8 BlackLeftStep4StartLine = 0;     //左黑线第4阶段起始行
uint8 BlackLeftHeadLine = MaxValUint8;   //左黑线的线头，从上往下。

//右
//3个关键值的可改值，可由自适应性算法更改。
uint8 LimitRightWB = LimitOriRightWB;    //黑白像素点的差值，两个点的差必须要大于这个值，才能认为有跳变。
uint8 LimitRightW = LimitOriRightW;      //白点必须要大于此值
uint8 LimitRightB = LimitOriRightB;      //黑点必须要小于此值

uint8 BlackRightCrossDone = 0;   //右黑线十字检测标志位 0未进入 1失败 2成功
uint8 BlackRightDone = 1;          //右黑线提取成功标示位 1成功 0失败
uint8 BlackRight3ResetCount = 0;       //由于光线变化太大引起的3个关键值重置的次数。
uint8 BlackRightCrossTooLowLine = 3;    //十字再检测时，低于该行就没必要启动再检测程序了。
//uint8 BlackRightStep4Flag = 0;          //右黑线需要执行第4阶段的标志位，1需执行，0不需执行。
//uint8 BlackRightStep4StartLine = 0;     //右黑线第4阶段起始行
uint8 BlackRightHeadLine = MaxValUint8;   //左黑线的线头，从上往下。


//自身绝对值求值，只适合于int16型变量，返回int16型变量。
int16 AbsSelf(int16 x)
{
  if(x < 0) return (0-x);
  else return x;  
}

//======================================================================
//函数名：MaxRe
//功  能：求取两数最大值
//参  数：第1个数num1, 第2个数num2。
//返  回：2个数中的最大值
//影  响：无
//说  明：1. 两个输入参数无先后顺序。
//        2. 只能处理两个uint8型的数据，其它数据类型会出错。
//        3. 返回值的类型也是uint8.
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
//函数名：MinRe
//功  能：求取两数最小值
//参  数：第1个数num1, 第2个数num2。
//返  回：2个数中的最小值
//影  响：无
//说  明：1. 两个输入参数无先后顺序。
//        2. 只能处理两个uint8型的数据，其它数据类型会出错。
//        3. 返回值的类型也是uint8.     
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
//函数名：AbsRe
//功  能：求取两数差值的绝对值
//参  数：第1个数num1, 第2个数num2。
//返  回：2个数的绝对值。
//影  响：无
//说  明：1. 两个输入参数无先后顺序。
//        2. 只能处理两个uint8型的数据，其它数据类型会出错。
//        3. 返回值的类型也是uint8.     
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
//函数名：LeastSquarea1
//功  能：最小二乘法的a1值的求取
//参  数：x数组，y数组，num基于的有效数据个数
//返  回：a1
//影  响：无
//说  明：1. y = a0 + a1 * x;
//        2. a1 = (N * Σxy - Σx * Σy) / (N * Σx^2 - Σx * Σx);
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
//函数名：LeastSquarea0
//功  能：最小二乘法的a0值的求取
//参  数：x数组，y数组，a1参数，num基于的有效数据个数
//返  回：a0
//影  响：无
//说  明：1. y = a0 + a1 * x;
//        2. a0 = Σy / N - a1 * Σx / N;
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
//函数名：SendCenterLineLoc
//功  能：中心线数组发送函数
//参  数：img待发送的一维图像数组
//返  回：无
//影  响：无
//说  明：
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
      uart_send1(UART0, img[i]); //发送中心线数组
    }
    
}




//======================================================================
//函数名：SendImage
//功  能：OV7620的图像发送函数
//参  数：待发送的二维图像数组imgaddr
//返  回：无
//影  响：无
//说  明：       
//======================================================================
void SendImage(uint8 imgaddr[CameraHight][CameraRealWidth])
{                            
    uint8 i, j;
    uint8 cmd[4] = {0, 255, 1, 0 };
  
    uart_sendN(UART0, cmd, sizeof(cmd));    
    
    for(i = 0; i < CameraHight; i++)
        for(j = 0; j < CameraRealWidth; j++)
            uart_send1(UART0, imgaddr[i][j]); //发送图像
}



//====================================左左左左左左左左左左左左左左左左左============================

//======================================================================
//函数名：BlackLeftRealClear
//功  能：左黑线提取中，对3个关键值的实际值清零
//参  数：无
//返  回：无
//影  响：B
//说  明：
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
//函数名：BlackGetLeftStep1Edge
//功  能：处理该行左线的可疑黑点
//参  数：待检测的行号row, 第几次使用use, 是否为十字再检测调用标志位CrossFlag
//返  回：1成功 0失败
//影  响：
//说  明：
//======================================================================
uint8 BlackGetLeftStep1Edge(uint8 row, uint8 use, uint8 CrossFlag)
{
  uint8 index, col, temp, temp1;
  uint8 abs1;
  
  temp = CameraRealWidth/2 - 1 + BlackLeftEdgeStartColOffset;
  
  index = 0;         //可疑点的序号
  for(col = temp; col >= 4+BlackLeftEdgeNum; col--) 
  {
      abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col-1-BlackLeftEdgeNum]); //取差值的绝对值。
      
      if( 
          (abs1 > LimitLeftWB) //两者的差够大
        &&(ImgNew[row][col] > LimitLeftW)                     //白点够白
        &&(ImgNew[row][col-1-BlackLeftEdgeNum] < LimitLeftB)                   //黑点够黑
         )
      {         
          //近处的行，向左3个点仍为黑点
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
            //远处的行 ，向左2个点为仍为黑点
            if(row > BlackFarLine)
            {
              temp1 = (
                        (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB)
                      &&(ImgNew[row][col-3-BlackLeftEdgeNum] < LimitLeftB)
                      );
            }
            //远处的行 ，向左1个点为仍为黑点
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
                  //对3个关键值的实际值清零
                  BlackLeftRealClear();
                }
                //该行定位黑线失败，赋无效值
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
              //跳变检测成功，取黑点
              BlackLeftLoc[row][index] = col - 1 - BlackLeftEdgeNum;          
              index++;            
          }    
      }   
  }
  
  //1个可疑黑点也没有，则报错。
  if(index == 0)
  {
    if(CrossFlag)
    {
      //对3个关键值的实际值清零
      BlackLeftRealClear();
    }
    //该行定位黑线失败，赋无效值
    BlackLeftLoc[row][0] = MaxValUint8;
    return 0;
  }
  
  //没有报错，就会走到这里，黑点查找成功，会有1，2，3个黑点
  return 1;
}



//======================================================================
//函数名：BlackGetLeftStep2Win
//功  能：窗口内跳变检测函数
//参  数：待处理行号row, 窗口大小win, 预测的跳变点的位置predict
//返  回：1成功  0失败
//影  响：
//说  明：  
//======================================================================
uint8 BlackGetLeftStep2Win(uint8 row, uint8 win, uint8 predict)
{
  uint8 col, temp, temp1;
  uint8 abs1;

  //在规划好的窗口内，从右往左查找跳变沿
  //防止溢出
  
  //对左边界的限制
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
  
  //对右边界的限制
  if(predict + win > CameraRealWidth - 1)
  {
    col = CameraRealWidth - 1;  
  }
  else
  {
    col = predict + win;  
  }
  
  //判断条件里的">"很关键，没有写">="是考虑temp = 0的情况，这样可以防止产生负数（uint8中为正数），即无限循环。
  for( ; col > temp; col--) 
  {
    abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col-1-BlackLeftEdgeNum]);
    if( 
          (abs1 > LimitLeftWB) //两者的差够大
        &&(ImgNew[row][col] > LimitLeftW)                     //白点够白
        &&(ImgNew[row][col-1-BlackLeftEdgeNum] < LimitLeftB)                   //黑点够黑
       )
    {
          //近处的行，向左3个点仍为黑点
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
            //中间的行 ，向左2个点为仍为黑点
            if(row > BlackFarLine)
            {
              temp1 = (
                        (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB)
                      &&(ImgNew[row][col-3-BlackLeftEdgeNum] < LimitLeftB)
                      );
            }
            //远处的行 ，向左1个点为仍为黑点
            else
            {
              temp1 = (ImgNew[row][col-2-BlackLeftEdgeNum] < LimitLeftB);
            }
          }
          if(temp1)
          {
            //两批条件均满足，直接记录该点为黑线，返回即可
            BlackLeftLoc[row][0] = col - 1 - BlackLeftEdgeNum;
            return 1;
            //break;          
          }
    }
    
    
    
  }// end of for循环
  
  //如果一直到窗口最左边还没有找到跳变沿，  
  BlackLeftLoc[row][0] = MaxValUint8;   //该行的黑线位置记为无效值
  return 0;

  
}


//======================================================================
//函数名：BlackGetLeftStep1Scan
//功  能：行扫描函数
//参  数：扫描起始行FirstLine, 扫描结束行LastLine, 十字再检测标志CrossFlag
//返  回：0~CameraHight-1行数 255采集失败
//影  响：
//说  明：
//             
//======================================================================
uint8 BlackGetLeftStep1Scan(uint8 FirstLine, uint8 LastLine, uint8 CrossFlag)
{
    uint8 row, temp1, temp2;
    uint8 abs1;
    uint8 tempWB, tempW, tempB;
  //最近的BlackStep1Size行用差值法找黑线
    for(row = FirstLine; row > LastLine; row -= 2)
    {
      //判断是否连续两行检测到跳变。
      temp1 = BlackGetLeftStep1Edge(row, 1, CrossFlag);
      temp2 = BlackGetLeftStep1Edge(row-1, 2, CrossFlag);
      if(temp1 && temp2)//这里可以这么写，不用嵌套if，因为&&的特点
      {
        abs1 = AbsRe(BlackLeftLoc[row-1][0], BlackLeftLoc[row][0]);
        //进一步判断连续两行的黑点的间隔是否够小，且暂取第1个可疑黑点。
        if(abs1 < BlackLeftStep1ScanMinus)
        {
          if(CrossFlag)
            {
              //差值的处理，留有裕度，且有上下界。
              tempWB = (BlackLeftRealWB[0] + BlackLeftRealWB[1]) / 2 - LimitLeftWBMargin; 
              if(tempWB < LimitLeftWBMin) tempWB = LimitLeftWBMin;
              else if(tempWB > LimitLeftWBMax) tempWB = LimitLeftWBMax;
              else ;
              LimitLeftWB = tempWB;
              
              //白点的处理，留有裕度，且有上下界。
              tempW = (BlackLeftRealW[0] + BlackLeftRealW[1]) / 2 - LimitLeftWMargin;
              if(tempW < LimitLeftWMin) tempW = LimitLeftWMin;
              else if(tempW > LimitLeftWMax) tempW = LimitLeftWMax;
              else ;
              LimitLeftW = tempW;
              
              //黑点的处理，留有裕度，且有上下界。
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
    
    //黑线检测失败
    if(row <= LastLine)
      return MaxValUint8;
    else 
      return row;
  
}

//======================================================================
//函数名：BlackLeftCrossStep3
//功  能：脑补线函数
//参  数：第1段有效黑线的最后一行FirstLine， 第2段有效黑线的第一行LastLine
//返  回：1成功 0失败
//影  响：
//说  明：1. 这里有一些浮点运算，会占时间，在调用本函数时要慎重，尽量不要用。
//             
//======================================================================
uint8 BlackLeftCrossStep3(uint8 FirstLine, uint8 LastLine)
{
  float delta_x, delta_y, delta, index;
  uint8 row, temp1, temp2;
  //uint8 temp3, temp4, flag1, flag2;
  
  //超始行比结束行还高，报错！
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
  //确认这两个点是直角处的点，也就是往左6个点仍为黑点
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
  
  
  //斜率向右
  if(temp1 < temp2)
  {
    delta_x = temp2 - temp1;
    delta = delta_x / delta_y; //这是1个浮点数
    
    index = 1.0;
    for(row = FirstLine - 1; row >= LastLine + 1; row-- )
    {
      //每次右移一点点
      BlackLeftLoc[row][0] = (uint8)((float)BlackLeftLoc[FirstLine][0] + delta * index);
      index += 1.0;
    }
  }
  //斜率向左
  else if(temp1 > temp2)
  {
    delta_x = temp1 - temp2;
    delta = delta_x / delta_y;
    
    index = 1.0;
    for(row = FirstLine - 1; row >= LastLine + 1; row-- )
    {
      //每次右移一点点
      BlackLeftLoc[row][0] = (uint8)((float)BlackLeftLoc[FirstLine][0] - delta * index);
      index += 1.0;
    }
  }
  //斜率直走，这个不太可能出现
  else
  {
    for(row = FirstLine - 1; row >= LastLine + 1; row-- )
    {
      //赋相同的值
      BlackLeftLoc[row][0] = temp1;
    }
  }
  
  return 1;
    
}

//======================================================================
//函数名：BlackLeftCrossConfirm
//功  能：线头有效性的确认
//参  数：第1段黑线的真实结束行Row1RealLastLine，第2段黑线的真实起始行Row2RealFirstLine
//返  回：1成功 0失败
//影  响：无
//说  明：
//      
//             
//======================================================================
uint8 BlackLeftCrossConfirm(uint8 Row1RealLastLine, uint8 Row2RealFirstLine)
{
  uint8 row, index;
  uint8 x[BlackCrossConfirmNum];
  uint8 y[BlackCrossConfirmNum];
  
  float a0, a1, temp;
  
  //第一段黑线太短，无法检测正确性。直接返回1.
  if(Row1RealLastLine < 5) return 1;
  
  //以左上角为原点，向下为x轴正方向（0~49），向右为y轴正方向(0~249)
  index = 0;
  for(row = Row1RealLastLine; ; row++)
  {
    //有效行的记录
    if(BlackLeftLoc[row][0] != MaxValUint8)
    {
      y[index] = BlackLeftLoc[row][0];
      x[index] = row;
      index++;
    }
    //点数够多，则跳出。
    if(index == BlackCrossConfirmNum) break;
    //直到最低行仍没有凑够足够的点数，说明第一段有效黑线太短，无法检测正确性，直接返回1.
    if(row == CameraHight - 1) return 1;
  }
  
  //最小二乘法
  //y = a0 + a1 * x
  a1 = LeastSquarea1(x, y, BlackCrossConfirmNum);
  a0 = LeastSquarea0(x, y, a1, BlackCrossConfirmNum);
  
  //temp为第2段黑线起始行本应该在的位置。
  temp = a0 + a1 * Row2RealFirstLine;
  if((temp < 0) || (temp > CameraRealWidth - 1)) 
  {
    return 0;
  }
  else
  { //这里本来应该加上把这个点限定在窗内，但是似乎没必要。
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
//函数名：BlackLeftAgainForCross
//功  能：十字检测程序
//参  数：第2段黑线的预测起始行Row2FirstLine， 第2段黑线的预测结束行Row2LastLine，
//        第1段黑线的实际结束行Row1RealLastLine
//返  回：1成功 0失败
//影  响：
//说  明：1. 本函数会调用浮点运算的函数，预计花费较多时间，调用入口需谨慎。
//             
//======================================================================
uint8 BlackLeftAgainForCross(uint8 Row2FirstLine, uint8 Row2LastLine, uint8 Row1RealLastLine)
{
    uint8 row, temp, temp1, temp2;
    uint8 Row2RealFirstLine; //第2段黑线的真实起始行
    uint8 i;
    
    temp = BlackGetLeftStep1Scan(Row2FirstLine, Row2LastLine, 0); //第3个参数0表示是十字再检测，不用更新3个关键值
    if(temp == MaxValUint8)  
    {
      //扫屁股工作。       
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
      { //扫屁股工作。       //i >= (temp-1)
        for(i = Row2FirstLine; ; i--)
        {
          BlackLeftLoc[i][0] = MaxValUint8;
          if(i == 0) break;
        }
        return 0;
      }
      //十字再检测的线头的确在限定的范围内，可以继续。
      else
      {
      row = temp;
      }
      //row = temp;
    }
    
    Row2RealFirstLine = row; //记录第2段黑线的真实起始行
    
    //temp为预测的黑点位置
    temp = BlackLeftLoc[row-1][0] + BlackLeftLoc[row-1][0] - BlackLeftLoc[row][0];
    //从最近的认证行到取最远的行
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
    
     //脑补两段线的接线。
    if(!BlackLeftCrossStep3(Row1RealLastLine, Row2RealFirstLine))
    {
      return 0;
    }
    
    return 1;
        
}

//======================================================================
//函数名：BlackLeftStep4BackLine
//功  能：补线函数。
//参  数：Step4StartLine开始行
//返  回：1成功 0失败
//影  响：
//说  明：1. 这里引用了float型的函数，有可能占用较长的时间。
//             
//======================================================================
uint8 BlackLeftStep4BackLine(uint8 Step4StartLine)
{
  uint8 row;
  uint8 i, index;
  uint8 x[BlackBackLineNum];   //取多少个点在一开始有定义。
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
  
  //最小二乘法
  //y = a0 + a1 * x
  a1 = LeastSquarea1(x, y, BlackBackLineNum);
  a0 = LeastSquarea0(x, y, a1, BlackBackLineNum);
  
  for(row = Step4StartLine + 1; row <= CameraHight - 1; row++)
  {
    //补线也有个度，向左向右都不能补出范围。
    temp = a0 + a1 * row;
    if(temp >= CameraRealWidth)
    {
      //BlackLeftLoc[row][0] = CameraRealWidth - 1;
      //超过左右界限时，原策略为置边界值，现在的策略是从该行起置无效值。
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
      //超过左右界限时，原策略为置边界值，现在的策略是从该行起置无效值。
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
//函数名：BlackGetLeft
//功  能：左黑线提取算法
//参  数：无
//返  回：1成功 0失败
//影  响：
//说  明：1. 暂时可以处理直道，弯道，十字路口3种情况。2014.11.10
//      
//             
//======================================================================
uint8 BlackGetLeft(void)
{
    uint8 row, temp, temp1, temp2, temp3, i;
    uint8 GapCount, Row1RealLastLine, index;
    uint8 Step4Flag, Step4StartLine;  
    
    Step4Flag = 0;
    //默认十字检测标志置为未进入。
    BlackLeftCrossDone = 0;    
    
    //有可能会返回黑线提取失败
    temp = BlackGetLeftStep1Scan(CameraHight - 1, CameraHight - BlackStep1Size - 1, 1);
    if(temp == MaxValUint8)
    {
      return 0;
    }    
    else 
    {
      row = temp;
      //起始线头的位置非常高
      if(row < CameraHight - BlackLeftBackLineStart)
      {
        Step4Flag = 1;
        Step4StartLine = row;
      }
    }

    //上次已经处理完了第row-1行，下一次要处理第row-2行
    //BlackLeftSlope();
    
    //temp为预测的黑点位置

    //对预测值的大小限定
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
    
    GapCount = 0;  //连续多少行没有采集到黑线
    //从最近的认证行到取最远的行
    for(row -= 2; ; row -= 2)
    {
      //如果连续两行的黑点检测成功，则更新预测点的位置
      temp1 = BlackGetLeftStep2Win(row, BlackLeftWinVal, temp);
      temp2 = BlackGetLeftStep2Win(row-1, BlackLeftWinVal, temp);
      temp3 = (
              (!temp1)
            &&(!temp2)
            //&&(!Step4Flag)
              );
      if(temp1 && temp2) 
      {   //对预测值的大小限定
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
        //Row1RealLastLine记录第1段黑线的最后一行。
        if(index == 0)
        {
          //进来一次后，就再也不会进来了。
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
          //再检测时的行太远了，就没必要检测了。
          if(row < BlackLeftCrossTooLowLine)
          {
            break;
          }
          else
          {
          }
          
          if(!BlackLeftAgainForCross(row - 2, 1, Row1RealLastLine))
          {
            BlackLeftCrossDone = 1;  //十字检测失败           
          }
          else
          {
            BlackLeftCrossDone = 2;  //十字检测成功
          }
          break;  //十字再检测里会开窗检测到指定的最后一行，所以不用再循环了，直接跳出
          
        }
        else
        {
          BlackLeftCrossDone = 0;   //十字检测未进入
        }
      }
      else
      {        
      }
      
      
      if((row == 0) || (row == 1)) break;
      
    }
    
    
    //这里有浮点运算，要严格控制调用。
    if(Step4Flag)
    {
      if(!BlackLeftStep4BackLine(Step4StartLine))
      {
        return 0;  
      }
    }
    
    
    return 1;
}



//====================================右右右右右右右右右右右右右右右右右============================



//======================================================================
//函数名：BlackRightRealClear
//功  能：右黑线提取中，对3个关键值的实际值清零
//参  数：无
//返  回：无
//影  响：BlackRightRealWB[], BlackRightRealW[], BlackRightRealB[]
//说  明：
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
//函数名：BlackGetRightStep1Edge
//功  能：处理该右左线的可疑黑点
//参  数：待检测的行号row, 第几次使用use, 是否为十字再检测调用标志位CrossFlag
//返  回：1成功 0失败
//影  响：
//说  明：
//======================================================================
uint8 BlackGetRightStep1Edge(uint8 row, uint8 use, uint8 CrossFlag)
{
  uint8 index, col, temp1;
  uint8 abs1;
  uint8 RightBeginCol; //右线跳变检测起点
  
  //左黑线检测成功时
  if(BlackLeftDone == 1)
  {
      //右线跳变检测的起点至少要比该行左线的跳变点要靠右。
    if(BlackLeftLoc[row][0] == MaxValUint8)
    {
      RightBeginCol = CameraRealWidth/2;
    }
    else
    {
      //至少要在左跳变向右4+BlackRightEdgeNum个点
      RightBeginCol = MaxRe(CameraRealWidth/2, BlackLeftLoc[row][0] + 4 + BlackRightEdgeNum);
      //同时，也不能超过数组界限219，其实是不能超过CameraRealWidth - 5 - BlackRightEdgeNum，下面for循环里。
      RightBeginCol = MinRe(RightBeginCol, CameraRealWidth - 5 - BlackRightEdgeNum);
    }
  }
  //左黑线检测失败时，右黑线检测的起点要比中心线靠左BlackRightEdgeStartColOffset这么多列。
  else
  {
    RightBeginCol = CameraRealWidth/2 - BlackRightEdgeStartColOffset;  
  }
  
  index = 0;         //可疑点的序号
  //从中间到最右边扫描，隔1个点求差
  for(col = RightBeginCol; col <= CameraRealWidth - 5 - BlackRightEdgeNum; col++) 
  {
      abs1 = AbsRe(ImgNew[row][col], ImgNew[row][col+1+BlackRightEdgeNum]);
      if( 
          (abs1 > LimitRightWB) //两者的差够大
        &&(ImgNew[row][col] > LimitRightW)                     //白点够白
        &&(ImgNew[row][col+1+BlackRightEdgeNum] < LimitRightB) //黑点够黑
         )
      {         
          //近处的行，向右3个点仍为黑点
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
              //中间的行，向右2个点仍为黑点。
              temp1 = (
                        (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB)
                      &&(ImgNew[row][col+3+BlackRightEdgeNum] < LimitRightB)
                      );
            }
            //远处的行，向右1个点仍为黑点。
            else
            {
              temp1 = (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB);
            }
          }
          
          if(temp1)
          {
                            
              //超过3个可疑黑点，则报错
              if(index == 3)       
              {
                if(CrossFlag)
                {
                  //对3个关键值的实际值清零
                  BlackRightRealClear();
                }
                //该行定位黑线失败，赋无效值
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
              //跳变检测成功，取黑点
              BlackRightLoc[row][index] = col + 1 + BlackRightEdgeNum;          
              index++;
            
          }   
      }  
  }
  
  //1个可疑黑点也没有，则报错。
  if(index == 0)
  {
    if(CrossFlag)
    {
      //对3个关键值的实际值清零
      BlackRightRealClear();
    }
    //该行定位黑线失败，赋无效值
    BlackRightLoc[row][0] = MaxValUint8;
    return 0;
  }
  
  //没有报错，就会走到这里，黑点查找成功，会有1，2，3个黑点
  return 1;
}



//======================================================================
//函数名：BlackGetRightStep2Win
//功  能：窗口内跳变检测函数
//参  数：待处理行号row, 窗口大小win, 预测的跳变点的位置predict
//返  回：1成功  0失败
//影  响：
//说  明：    
//======================================================================
uint8 BlackGetRightStep2Win(uint8 row, uint8 win, uint8 predict)
{
  uint8 col, temp, temp1;
  uint8 abs1;

  //在规划好的窗口内，从左往右查找跳变沿
  //防止溢出
  //对右边界的限制 
  if((predict + win) >= (CameraRealWidth - 5 - BlackRightEdgeNum)) 
  {
    temp = CameraRealWidth - 5 - BlackRightEdgeNum;
  }  
  else
  {
    temp = predict + win;
  }
  //对左边界的限制
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
          (abs1 > LimitRightWB) //两者的差够大
        &&(ImgNew[row][col] > LimitRightW)                     //白点够白
        &&(ImgNew[row][col+1+BlackRightEdgeNum] < LimitRightB)                   //黑点够黑
       )
    {
        
          //近处的行，向右3个点仍为黑点
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
            //中间的行 ，向右2个点为仍为黑点
            if(row > BlackFarLine)
            {
              temp1 = (
                        (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB)
                      &&(ImgNew[row][col+3+BlackRightEdgeNum] < LimitRightB)
                      );
            }
            //远处的行，向右1个点仍为黑点
            else
            {
              temp1 = (ImgNew[row][col+2+BlackRightEdgeNum] < LimitRightB);
            }
          }
          
          if(temp1)
          {
          //直接记录该点为黑线，返回即可
          BlackRightLoc[row][0] = col + 1 + BlackRightEdgeNum;
          return 1;
          //break;               
          }
    }   
  }// end of for循环
  
  //如果一直到窗口最左边还没有找到跳变沿，
  
  BlackRightLoc[row][0] = MaxValUint8;   //该行的黑线位置记为无效值
  return 0;
  
}



//======================================================================
//函数名：BlackGetRightStep1Scan
//功  能：行扫描函数
//参  数：扫描起始行FirstLine, 扫描结束行LastLine, 十字再检测标志CrossFlag
//返  回：0~CameraHight - 1行数 255采集失败
//影  响：
//说  明：
//             
//======================================================================
uint8 BlackGetRightStep1Scan(uint8 FirstLine, uint8 LastLine, uint8 CrossFlag)
{
    uint8 row, temp1, temp2;
    uint8 abs1;
    uint8 tempWB, tempW, tempB;
    
  //最近的BlackStep1Size行用差值法找黑线
    for(row = FirstLine; row > LastLine; row -= 2)
    {
      //判断是否连续两行检测到跳变，可疑黑点有3个点，暂取其中一个
      temp1 = BlackGetRightStep1Edge(row, 1, CrossFlag);
      temp2 = BlackGetRightStep1Edge(row-1, 2, CrossFlag);
      if(temp1 && temp2)//这里可以这么写，不用嵌套if，因为&&的特点
      {
        abs1 = AbsRe(BlackRightLoc[row-1][0], BlackRightLoc[row][0]);
        //进一步判断连续两行的黑点的间隔是否够小，且暂取第1个可疑黑点。
        if(abs1 < BlackRightStep1ScanMinus)
        {
          if(CrossFlag)
            {           
              //差值的处理，留有裕度，且有上下界。
              tempWB = (BlackRightRealWB[0] + BlackRightRealWB[1]) / 2 - LimitRightWBMargin; 
              if(tempWB < LimitRightWBMin) tempWB = LimitRightWBMin;
              else if(tempWB > LimitRightWBMax) tempWB = LimitRightWBMax;
              else ;
              LimitRightWB = tempWB;
              
              //白点的处理，留有裕度，且有上下界。
              tempW = (BlackRightRealW[0] + BlackRightRealW[1]) / 2 - LimitRightWMargin;
              if(tempW < LimitRightWMin) tempW = LimitRightWMin;
              else if(tempW > LimitRightWMax) tempW = LimitRightWMax;
              else ;
              LimitRightW = tempW;
              
              //黑点的处理，留有裕度，且有上下界。
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
    
    //检测了BlackStep1Size行也没有检测到连续的黑线，说明黑线检测失败
    if(row <= LastLine)
      return MaxValUint8;
    else
      return row;
  
}


//======================================================================
//函数名：BlackRightCrossStep3
//功  能：脑补线函数
//参  数：第1段有效黑线的最后一行FirstLine， 第2段有效黑线的第一行LastLine
//返  回：1成功 0失败
//影  响：
//说  明：
//             
//======================================================================
uint8 BlackRightCrossStep3(uint8 FirstLine, uint8 LastLine)
{
  float delta_x, delta_y, delta, index;
  uint8 row, temp1, temp2;
  //uint8 temp3, temp4, flag1, flag2;
  
  //超始行比结束行还高，报错！
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
  //确认这两个点是直角处的点，也就是往右6个点仍为黑点
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
  
  
  //斜率向右
  if(temp1 < temp2)
  {
    delta_x = temp2 - temp1;
    delta = delta_x / delta_y; //这是1个浮点数
    
    index = 1.0;
    for(row = FirstLine - 1; row >= LastLine + 1; row-- )
    {
      //每次右移一点点
      BlackRightLoc[row][0] = (uint8)((float)BlackRightLoc[FirstLine][0] + delta * index);
      index += 1.0;
    }
  }
  //斜率向左
  else if(temp1 > temp2)
  {
    delta_x = temp1 - temp2;
    delta = delta_x / delta_y;
    
    index = 1.0;
    for(row = FirstLine - 1; row >= LastLine + 1; row-- )
    {
      //每次右移一点点
      BlackRightLoc[row][0] = (uint8)((float)BlackRightLoc[FirstLine][0] - delta * index);
      index += 1.0;
    }
  }
  //斜率直走，这个不太可能出现
  else
  {
    for(row = FirstLine - 1; row >= LastLine + 1; row-- )
    {
      //赋相同的值
      BlackRightLoc[row][0] = temp1;
    }
  }
  
  return 1;
    
}

//======================================================================
//函数名：BlackRightCrossConfirm
//功  能：线头有效性的确认。
//参  数：第1段黑线的真实结束行Row1RealLastLine，第2段黑线的真实起始行Row2RealFirstLine
//返  回：1成功 0失败
//影  响：无
//说  明：
//      
//             
//======================================================================
uint8 BlackRightCrossConfirm(uint8 Row1RealLastLine, uint8 Row2RealFirstLine)
{
  uint8 row, index;
  uint8 x[BlackCrossConfirmNum];
  uint8 y[BlackCrossConfirmNum];
  
  float a0, a1, temp;
  
  //第一段黑线太短，无法检测正确性。直接返回1.
  if(Row1RealLastLine < 5) return 1;
  
  index = 0;
  for(row = Row1RealLastLine; ; row++)
  {
    //有效行的记录
    if(BlackRightLoc[row][0] != MaxValUint8)
    {
      y[index] = BlackRightLoc[row][0];
      x[index] = row;
      index++;
    }
    //点数够多，则跳出。
    if(index == BlackCrossConfirmNum) break;
    //直到最低行仍没有凑够足够的点数，说明第一段有效黑线太短，无法检测正确性，直接返回1.
    if(row == CameraHight - 1) return 1;
  }
  
  //最小二乘法
  //y = a0 + a1 * x
  a1 = LeastSquarea1(x, y, BlackCrossConfirmNum);
  a0 = LeastSquarea0(x, y, a1, BlackCrossConfirmNum);
  
  //temp为第2段黑线起始行本应该在的位置。
  temp = a0 + a1 * Row2RealFirstLine;
  //如果这个位置本来就超出了左右边界的范围，那说明不可能有第2段黑线存在了。
  //也就不用检测第2段黑线了，直接返回0.
  if((temp < 0) || (temp > CameraRealWidth - 1)) 
  {
    return 0;
  }
  else
  { //这里本来应该加上把这个点限定在窗内，但是似乎没必要。
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
//函数名：BlackRightAgainForCross
//功  能：十字检测程序
//参  数：第2段黑线的预测起始行Row2FirstLine， 第2段黑线的预测结束行Row2LastLine，
//        第1段黑线的实际结束行Row1RealLastLine
//返  回：1成功 0失败
//影  响：BlackRightLoc[][]。
//说  明：1. 本函数会调用浮点运算的函数，预计花费较多时间，调用入口需谨慎。
//             
//======================================================================
uint8 BlackRightAgainForCross(uint8 Row2FirstLine, uint8 Row2LastLine, uint8 Row1RealLastLine)
{
    uint8 row, temp, temp1, temp2;
    uint8 Row2RealFirstLine; //第2段黑线的真实起始行
    uint8 i;

    temp = BlackGetRightStep1Scan(Row2FirstLine, Row2LastLine, 0); //第3个参数0表示是十字再检测，不用更新3个关键值
    if(temp == MaxValUint8)  
    {
      //扫屁股工作。        //i >= Row2LastLine
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
      { //扫屁股工作。         //i >= (temp-1)
        for(i = Row2FirstLine; ; i--)
        {
          BlackRightLoc[i][0] = MaxValUint8;
          if(i == 0) break;
        }
        return 0;
      }
      //十字再检测的线头的确在限定的范围内，可以继续。
      else
      {
      row = temp;
      }
      //row = temp;
    }
    
    Row2RealFirstLine = row; //记录第2段黑线的真实起始行
    
    //十字再检测第2阶段，顺着线头找线。
    //temp为预测的黑点位置
    temp = BlackRightLoc[row-1][0] + BlackRightLoc[row-1][0] - BlackRightLoc[row][0];
    //从最近的认证行到取最远的行
    for(row -= 2; ; row -= 2)
    {
      //如果连续两行的黑点检测成功，则更新预测点的位置
      temp1 = BlackGetRightStep2Win(row, BlackRightWinVal, temp);
      temp2 = BlackGetRightStep2Win(row-1, BlackRightWinVal, temp);
      if(temp1 && temp2) 
      {
        temp = BlackRightLoc[row - 1][0] + BlackRightLoc[row - 1][0] - BlackRightLoc[row][0];
      }
      //如果没能连续两行检测黑点成功，则不更新预测点位置，采用原位置。
      else
      {
      }     
      if((row == Row2LastLine) || (row == Row2LastLine+1)) break;      
    }
    
    //脑补两段线的接线。
    if(!BlackRightCrossStep3(Row1RealLastLine, Row2RealFirstLine))
    {
      return 0;
    }
    
    return 1;
        
}


//======================================================================
//函数名：BlackRightStep4BackLine
//功  能：向后补线函数。
//参  数：Step4StartLine开始行
//返  回：1成功 0失败
//影  响：
//说  明：
//             
//======================================================================
uint8 BlackRightStep4BackLine(uint8 Step4StartLine)
{
  uint8 row;
  uint8 i, index;
  uint8 x[BlackBackLineNum];   //取多少个点在一开始有定义。
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
  
  //取BlackBackLineNum个点作为最小二乘法的基准点。
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
  
  //最小二乘法
  //y = a0 + a1 * x
  a1 = LeastSquarea1(x, y, BlackBackLineNum);
  a0 = LeastSquarea0(x, y, a1, BlackBackLineNum);
  
  for(row = Step4StartLine + 1; row <= CameraHight - 1; row++)
  {
    //补线也有个度，向右和向左都不能补出范围。
    temp = a0 + a1 * row;
    if(temp > CameraRealWidth)
    {
      //BlackRightLoc[row][0] = CameraRealWidth - 1;
      //超过左右界限时，原策略为置边界值，现在的策略是从该行起置无效值。
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
      //超过左右界限时，原策略为置边界值，现在的策略是从该行起置无效值。
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
//函数名：BlackGetRight
//功  能：右黑线提取算法
//参  数：无
//返  回：1成功 0失败
//影  响：
//说  明：1. 暂时可以处理直道，弯道，十字路口3种情况。2014.11.10
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

    //默认十字检测标志置为未进入。
    BlackRightCrossDone = 0;

    temp = BlackGetRightStep1Scan(CameraHight - 1, CameraHight - BlackStep1Size - 1, 1);
    if(temp == MaxValUint8)
    {
      return 0;
    }
    else
    {
      row = temp;
      //起始线头的位置非常高。
      if(row < CameraHight - BlackRightBackLineStart)
      {
        Step4Flag = 1;
        Step4StartLine = row;
      }
    }
    //上次已经处理完了第row-1行，下一次要处理第row-2行
    //BlackRightSlope();
    
    //temp为预测的黑点位置
    //对预测值进行限定。
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
    //从最近的认证行到取最远的行
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
        //对预测值进行限定。
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
        //Row1RealLastLine记录第1段黑线的最后一行。
        if(index == 0)
        {
          //进来一次后，就再也不会进来了。
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
          //再检测时的行太远了，就没必要检测了。
          if(row < BlackRightCrossTooLowLine)
          {
            break;
          }
          else
          {
          }
          
          if(!BlackRightAgainForCross(row - 2, 1, Row1RealLastLine))
          {
            BlackRightCrossDone = 1;  //十字检测失败            
          }
          else
          {
            BlackRightCrossDone = 2;  //十字检测成功
          }
          break;  //十字再检测里会开窗检测到指定的最后一行，所以不用再循环了，直接跳出
        }
        else
        {
           BlackRightCrossDone = 0;    //十字检测未进入
        }      
      }
      else
      {       
      }     
      if((row == 0) || (row == 1)) break;
      
    }    
    //这里有浮点运算，要严格控制调用。
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
//函数名：BlackGet
//功  能：黑线提取程序
//参  数：无
//返  回：1成功 0失败
//影  响：见具体的左、右黑线算法
//说  明：
//======================================================================
uint8 BlackGet(void)
{
    uint8 tempLWB, tempLW, tempLB;
    uint8 tempRWB, tempRW, tempRB;
    //采集成功标志位
    BlackLeftDone = 1;
    BlackRightDone = 1;
    
    //左黑线提取，成功则返回1，失败则返回0.
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
      //的确是光线的原因。
      else
      {
        BlackLeft3ResetCount++;    //由于光线变化太大引起的3个关键值重置的次数。
      }
    }   
    
    //右黑线提取，成功则返回1，失败则返回0.
    if(!BlackGetRight())
    {
      tempRWB = LimitRightWB;
      tempRW = LimitRightW;
      tempRB = LimitRightB;
      
      LimitRightWB = LimitOriRightWB;                 
      LimitRightW = LimitOriRightW;
      LimitRightB = LimitOriRightB;

      //不是光线的原因的情况下，把3个关键值变回来。
      if(!BlackGetRight())
      {
        LimitRightWB = tempRWB;
        LimitRightW = tempRW;
        LimitRightB = tempRB;
      
        //uart_sendN(UART0, (uint8 *)"\nFailed In BlackGetRight!", 25);  
        BlackRightDone = 0;
      }
      //的确是光线的原因。
      else
      {
        BlackRight3ResetCount++;    //由于光线变化太大引起的3个关键值重置的次数。
      }
    }
    
    //左、右黑线均提取失败，则黑线提取失败。
    if((BlackLeftDone == 0) && (BlackRightDone == 0))
    {
      return 0;
    }    
    //暂时还是不采取这种向后补线的方式，因为的确存在一边是十字补线，一边是向后补线的情况。
    /*
    //左、右黑线均提取成功，则看一下是否需要向后补线。
    else if((BlackLeftDone == 1) && (BlackRightDone == 1))
    {
      //左、右黑线均要求向后补线时，才执行补线程序。否则有可能是弯道使线头上浮的情况。
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
//函数名：CenterLineGet
//功  能：中心线提取函数
//参  数：无
//返  回：1成功 0失败
//影  响：CenterLineLoc[]
//说  明：1. 暂定为取左右有效黑线的中点，为基础版本。2014.11.11
//      
//             
//======================================================================
uint8 CenterLineGet(void)
{
  uint8 row;
  uint8 templ, tempr;
    
  //左、右黑线均提取失败。
  if((BlackLeftDone == 0) && (BlackRightDone ==  0))
  {
    return 0;  
  }
  
  for(row = CameraHight - 1; ; row--)
  {
    templ = BlackLeftLoc[row][0];
    tempr = BlackRightLoc[row][0];
    
    //左、右黑线均提取成功。
    if((BlackLeftDone == 1) && (BlackRightDone ==  1))
    {   
      //该行左右黑线都提取到了。
      if((templ != MaxValUint8) && (tempr != MaxValUint8))  
      {
        CenterLineLoc[row] = (templ + tempr) / 2;
      }
      //该行左黑线提取到了，右黑线提取失败。
      else if((templ != MaxValUint8) && (tempr == MaxValUint8))
      {
        CenterLineLoc[row] = templ + CenterLineHalfWidth[row];
      }
      //该行右黑线提取到了，左黑线提取失败。
      else if((tempr != MaxValUint8) && (templ == MaxValUint8))  
      {
        CenterLineLoc[row] = tempr - CenterLineHalfWidth[row];
      }
      //该行左、右黑线均提取失败，该行中心点赋无效值。
      else 
      {
        CenterLineLoc[row] = MaxValUint8;  
      }
    }
    //左黑线提取成功，右黑线提取失败
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
    //右黑线提取成功，左黑线提取失败
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
    
    //如果处理到了最后一行，就跳出for循环。
    if(row == 0) break;
  }
  return 1;
  
}
*/

//左右边界限制
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


//中心线获取函数。
uint8 CenterLineGet(void)
{
  uint8 row, i, j;
  uint8 templ, tempr;
  uint8 FailCount;
  uint8 tempmax;
  //uint8 flag001 = 0;
  //左、右黑线均提取失败。
  if((BlackLeftDone == 0) && (BlackRightDone ==  0))
  {
    return 0;  
  }
    
  //左、右黑线均提取成功。
  if((BlackLeftDone == 1) && (BlackRightDone ==  1))
  {
    FailCount = 0;
    for(row = CameraHight - 1; ; row--)
    {
      templ = BlackLeftLoc[row][0];
      tempr = BlackRightLoc[row][0];
      //该行左右黑线都提取到了。
      if((templ != MaxValUint8) && (tempr != MaxValUint8))  
      {        
        CenterLineLoc[row] = (templ + tempr) / 2;    
      }
      //该行左黑线提取失败，右黑线提取成功。
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
        //根据右线来估计中心线的走向，前提是上一行的右黑线有有效值。
        else if((row != (CameraHight-1))&&(BlackRightLoc[row+1][0] != MaxValUint8))
        { //前一行的中心线有效。
          if(CenterLineLoc[row+1] != MaxValUint8)
          {
            CenterLineLoc[row] =  BoundaryLimitRe(CenterLineLoc[row+1] + tempr - BlackRightLoc[row+1][0], 0, CameraRealWidth - 1);
          }
          //前一行的中心线无效。
          //如果是近处的行，那就有可能是270度左右黑线错位的情况。
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
            //flag001 = 1; //flag001是标志位，用以防止开头几行的中心线不连续的情况。
          }
          else
          { //行数够低才处理，否则不考虑。
            if(row <= CameraHight - 3)
            { //找符合要求的行。
              for(i = 2; i <= 4; i++)
              {
                if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackRightLoc[row+i][0] != MaxValUint8))
                {
                   CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+i] + tempr - BlackRightLoc[row+i][0], 0, CameraRealWidth - 1); 
                   break;
                }
              }
              //没有找到符合要求的行。
              if(i == 5) CenterLineLoc[row] = MaxValUint8; //置无效值
            }        
            else
            {   //行数过高，不考虑这种情况。
                CenterLineLoc[row] = MaxValUint8; //置无效值
            }
          }
        }
        else
        {
          CenterLineLoc[row] = MaxValUint8; //置无效值
        }
      }
      //该行右黑线提取失败，左黑线提取成功。
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
        //根据左线来估计中心线的走向，前提是上一行的左黑线有有效值。
        else if((row != CameraHight - 1)&&(BlackLeftLoc[row+1][0] != MaxValUint8))
        {  //上一行的中心线有效。
          if(CenterLineLoc[row+1] != MaxValUint8)
          {
            CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row + 1] + templ - BlackLeftLoc[row+1][0], 0, CameraRealWidth - 1);
          }
          //上一行的中心线无效。
          //如果是近处的行，那就有可能是270度左右黑线错位的情况。
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
            //flag001 = 1; //flag001是标志位，用以防止开头几行的中心线不连续的情况。
          }
          else
          { //找符合条件的行
            if(row <= CameraHight - 5)
            {
              for(i = 2; i <= 4; i++)
              {
                if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackLeftLoc[row+i][0] != MaxValUint8))
                { //找到了符合条件的行。
                  CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+i] + templ - BlackLeftLoc[row+i][0], 0, CameraRealWidth - 1);
                  break;
                }
              }
              if(i == 5) CenterLineLoc[row] = MaxValUint8; ////置无效值
            }
            else
            { //行数太高，不考虑这种情况。 
              CenterLineLoc[row] = MaxValUint8; //置无效值
            }
          }
        }
        else
        {
          CenterLineLoc[row] = MaxValUint8; //置无效值
        }
      }
      //该行左右线均提取失败。
      else 
      {
        CenterLineLoc[row] = MaxValUint8; //置无效值
      }
    if(CenterLineLoc[row] == MaxValUint8) 
    {
      FailCount++;
      //对无效值的再处理。
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
            //条件均满足
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
    //中心线提取成功，记录线头，作为后面的单线线头。
    if(row == 0) 
    {
      for(j = CameraHight - 1; ; j--)
      { //最近的3行找线头。
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
  
  //左黑线提取成功，右黑线提取失败。就基本上按左线来估计中心线。
  if((BlackLeftDone == 1) && (BlackRightDone == 0))
  {
    for(row = CameraHight - 1; row > CameraHight - BlackStep1Size; row --)
    {
      //找左线有效值。 //原为连续两行找有效值，现改为一行。
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
    //中心线提取失败。
    if(row <= CameraHight - BlackStep1Size) return 0;
    
    //按照左线的趋势进行中心线的估计。
    for(row --; ; row--)
    {
      if(BlackLeftLoc[row][0] != MaxValUint8)
      {   //上一行的中心线有效。
          if(CenterLineLoc[row+1] != MaxValUint8)
          {
            CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row + 1] + BlackLeftLoc[row][0] - BlackLeftLoc[row+1][0], 0, CameraRealWidth - 1);
          }
          //上一行的中心线无效。
          else
          { //找符合条件的行
            if(row <= CameraHight - 5)
            {
              for(i = 2; i <= 4; i++)
              {
                if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackLeftLoc[row+i][0] != MaxValUint8))
                { //找到了符合条件的行。
                  CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+i] + BlackLeftLoc[row][0] - BlackLeftLoc[row+i][0], 0, CameraRealWidth - 1);
                  break;
                }
              }
              if(i == 5) CenterLineLoc[row] = MaxValUint8; ////置无效值
            }
            else
            { //行数太高，不考虑这种情况。 
              CenterLineLoc[row] = MaxValUint8; //置无效值
            }
          }
      }
      else
      {
        CenterLineLoc[row] = MaxValUint8; //置无效值  
      }
      
      if(row == 0) break;
    }       
    if(row == 0) return 1;
  } // end of if
  
  //右黑线提取成功，左黑线提取失败。就基本上按右线来估计中心线。
  if((BlackLeftDone == 0) && (BlackRightDone == 1))
  {
    //找中心线的线头。
    for(row = CameraHight - 1; row > CameraHight - BlackStep1Size; row --)
    {
      //找右线有效值。 //原为连续两行找有效值，现改为一行。
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
    //没有找到中心线线头，中心线提取失败。
    if(row <= CameraHight - BlackStep1Size) return 0;
    
    //找到线头，按照左线的趋势进行中心线的估计。
    for(row--; ; row--)
    {
      if(BlackRightLoc[row][0] != MaxValUint8)
      {
        //前一行的中心点有效的情况。
        if(CenterLineLoc[row+1] != MaxValUint8)
        {
          CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+1] + BlackRightLoc[row][0] - BlackRightLoc[row+1][0], 0, CameraRealWidth - 1);
        }
        //前一行的中心点无效的情况。
        else
        { //首先行数要够小。
          if(row <= CameraHight - 5)
          { //查找是否有中心线有效的行。
            for(i = 2; i <= 4; i++)
            {
              if((CenterLineLoc[row+i] != MaxValUint8)&&(BlackRightLoc[row+i][0] != MaxValUint8))
              {
                CenterLineLoc[row] = BoundaryLimitRe(CenterLineLoc[row+i] + BlackRightLoc[row][0] - BlackRightLoc[row+i][0], 0, CameraRealWidth - 1);
                break;
              }
            }
            //连续3行没找到符合要求的行，置无效值。
            if(i == 5) CenterLineLoc[row] = MaxValUint8; 
          }
          //行数太高，处理不了。
          else
          {
            CenterLineLoc[row] = MaxValUint8; //置无效值  
          }
        }
      }
      else
      {
        CenterLineLoc[row] = MaxValUint8; //置无效值  
      }
      
      if(row == 0) break;
    }       
    if(row == 0) return 1;
  } // end of if
  
  return 0; 
}

//中心线补充处理，若到不了第25行，就补到第25行。超过250就置成250。
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





//图像重新赋值,行不变（行中DMA中变化，选取需要的行），列无法在DMA中变化，就在这里变化。
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


//开根号运算
//本来传进来传出去都是uint16型的，但是我调用的时候只会用到uint8型的，且不会超出255.
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

//曲线的曲率求取，曲线向右拐（三点为顺时针方向分布），曲率为负，曲线向左拐（三点为逆时钟方向分布），曲率为正
//K = 4*SABC/AB/BC/AC
int16 CurveGet(uint8 AX, uint8 AY, uint8 BX, uint8 BY, uint8 CX, uint8 CY)
{
  int16 SABC_temp; //三角形的面积，有正负。
  int16 tempab, tempbc, tempac;
  int16 AB, BC, AC; //三角形的边长，均为正。
  //int16 K;        //曲率结果，有正负。
  
  SABC_temp = ((BX - AX) * (CY - AY) - (CX - AX) * (BY - AY));
  
  tempab = (BX - AX) * (BX - AX) + (BY - AY) * (BY - AY);
  if(tempab > 100) 
  {
    AB = MathSqrt(tempab / 100) * 10; //失掉两位的精度，因为求根运算范围的限制。
  }
  else
  {
    AB = MathSqrt(tempab);
  }
  
  tempbc = (BX - CX) * (BX - CX) + (BY - CY) * (BY - CY);
  if(tempbc > 100) 
  {
    BC = MathSqrt(tempbc / 100) * 10; //失掉两位的精度，因为求根运算范围的限制。
  }
  else
  {
    BC = MathSqrt(tempbc);
  }
  
  tempac = (CX - AX) * (CX - AX) + (CY - AY) * (CY - AY);
  if(tempac > 100) 
  {
    AC = MathSqrt(tempac / 100) * 10; //失掉两位的精度，因为求根运算范围的限制。
  }
  else
  {
    AC = MathSqrt(tempac);
  }
  
  return (CurveGetCompen * SABC_temp / AB / BC / AC);
}



//SABC的面积求取，顺时针则返回负值，逆时针则返回正值。
//以左下角为原点，向右为x轴正方向(0~249)，向上为y轴正方向(0~49)。
int16 SABCGet(uint8 x1, uint8 y1, uint8 x2, uint8 y2, uint8 x3, uint8 y3)
{
  int16 SABC_temp;
  
  SABC_temp = ((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1)) / 2;
  
  return SABC_temp;
}


//曲率符号求取
//影响：CurveSL, CurveSC, CurveSR, 0无效，1正，2负
//      SABCL, SABCC, SABCR
uint8 CurveSignGet(void)
{
  uint8 row;
  uint8 temp;
  
  //1. 中心线曲率符号求取
  //曲率符号预先清零。
  CurveLineChosenC1 = MaxValUint8;
  CurveLineChosenC2 = MaxValUint8;
  CurveLineChosenC3 = MaxValUint8;
  
  //曲率基于的行1 CurveLineChosen1，从上到下取第一个有效值。
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
  //把第1个有效值到CameraHight-1的距离分成2段。
  temp = (CameraHight - 1 - row) / 2;
  if(temp == 0) 
  {
    CurveLineChosenC1 = MaxValUint8;
    return 0;
  }
  
  //曲率基于的行2 CurveLineChosen2
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
  
  //曲率基于的行3 CurveLineChosen3
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
  //SABCC中心线曲率三角形面积的求取
  //SABCC = SABCGet(CenterLineLoc[CurveLineChosenC1], CameraHight - 1 - CurveLineChosenC1,
  //                CenterLineLoc[CurveLineChosenC2], CameraHight - 1 - CurveLineChosenC2,
  //                CenterLineLoc[CurveLineChosenC3], CameraHight - 1 - CurveLineChosenC3
  //                );
  CURVEC = CurveGet(CenterLineLoc[CurveLineChosenC1], CameraHight - 1 - CurveLineChosenC1,
                   CenterLineLoc[CurveLineChosenC2], CameraHight - 1 - CurveLineChosenC2,
                   CenterLineLoc[CurveLineChosenC3], CameraHight - 1 - CurveLineChosenC3
                   );    
  
  
  //左右黑线有可能只有一边提取成功，若不成功，就不用费时间了。
  if(BlackLeftDone == 1)
  {
    //2. 左黑线曲率符号求取
    //曲率符号预先清零。
    CurveLineChosenL1 = MaxValUint8;
    CurveLineChosenL2 = MaxValUint8;
    CurveLineChosenL3 = MaxValUint8;
    
    //曲率基于的行1 CurveLineChosen1，从上到下取第一个有效值。
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
    //把第1个有效值到CameraHight-1的距离分成2段。
    temp = (CameraHight - 1 - row) / 2;
    if(temp == 0) 
    {
      CurveLineChosenL1 = MaxValUint8;
      return 0;
    }
    
    //曲率基于的行2 CurveLineChosen2
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
    
    //曲率基于的行3 CurveLineChosen3
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
    //SABCL左黑线曲率三角形面积的求取
    //SABCL = SABCGet(BlackLeftLoc[CurveLineChosenL1][0], CameraHight - 1 - CurveLineChosenL1,
    //               BlackLeftLoc[CurveLineChosenL2][0], CameraHight - 1 - CurveLineChosenL2,
    //               BlackLeftLoc[CurveLineChosenL3][0], CameraHight - 1 - CurveLineChosenL3
    //               );
    CURVEL = CurveGet(BlackLeftLoc[CurveLineChosenL1][0], CameraHight - 1 - CurveLineChosenL1,
                      BlackLeftLoc[CurveLineChosenL2][0], CameraHight - 1 - CurveLineChosenL2,
                      BlackLeftLoc[CurveLineChosenL3][0], CameraHight - 1 - CurveLineChosenL3
                      );
    
  }
  
  
  //左右黑线有可能只有一边提取成功，若不成功，就不用费时间了。
  if(BlackRightDone == 1)
  {
    //3. 右黑线曲率符号求取
    //曲率符号预先清零。
    CurveLineChosenR1 = MaxValUint8;
    CurveLineChosenR2 = MaxValUint8;
    CurveLineChosenR3 = MaxValUint8;
    
    //曲率基于的行1 CurveLineChosen1，从上到下取第一个有效值。
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
    //把第1个有效值到CameraHight-1的距离分成2段。
    temp = (CameraHight - 1 - row) / 2;
    if(temp == 0) 
    {
      CurveLineChosenR1 = MaxValUint8;
      return 0;
    }
    
    //曲率基于的行2 CurveLineChosen2
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
    
    //曲率基于的行3 CurveLineChosen3
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
    //SABCR右黑线曲率三角形面积的求取
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


//赛道类型判断
//======================================================================
//函数名：PathJudge
//功  能：赛道类型判断
//参  数：无
//返  回：1成功 0失败
//影  响：PathType
//说  明：
//             
//======================================================================
uint8 PathJudge(void)
{
  //赛道类型PathType: 0未知 1直道 2左中 3右中 4左内 5左外 6右内 7右外
  PathType = 0;
  //uint8 row;
  
  //曲率符号获取成功
  if(CurveSignGet())
  {
    //左右黑线均提取成功，的情况。
    if(BlackLeftDone == 1 && BlackRightDone == 1)
    { //全部逆时针，为左弯。而且是小车走在左弯道较为中心的情况。
      if(CURVEL < 0 && CURVEC < 0 && CURVER < 0)
      { 
        PathType = 2;
      }
      //全部顺时针，为右弯。而且是小车走在右弯道较为中心的情况。
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
        { //均小于阈值，为直道。
          PathType = 1;  
        }
        else
        {
          PathType = 0; //未知赛道类型。  
        }
      }
    }
    
    //左黑线提取失败，右黑线提取成功，的情况。
    if(BlackLeftDone == 0 && BlackRightDone == 1)
    { //左弯道，外道。
      if(CURVEC < 0 && CURVER < 0)
      {
        PathType = 5;
      }
      //右弯道，内道。
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
        { //均小于阈值，为直道。
          PathType = 1;  
        }
        else
        {
          PathType = 0; //未知赛道类型。  
        }
      }
    }
    
    //右黑线提取失败，左黑线提取成功，的情况。
    if(BlackLeftDone == 1 && BlackRightDone == 0)
    { //左弯道，内道。
      if(CURVEC < 0 && CURVEL < 0)
      {
        PathType = 4;
      }
      //右弯道，外道。
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
        { //均小于阈值，为直道。
          PathType = 1;  
        }
        else
        {
          PathType = 0; //未知赛道类型。  
        }
      }
    }
    
    return 1;
  }
  //曲率符号获取失败
  else
  {
    PathType = 0;  
    return 0;
  }
  
}





//======================================================================
//函数名：ImagePro
//功  能：
//参  数：无
//返  回：1成功 0失败
//影  响：
//说  明：
//             
//======================================================================
uint8 ImagePro(void)
{
    uint8 i;
    //图像取需要的列，重新赋值是为了后面的编程方便。
    ImgPut();
  
    //ImageExtract(ImgSend, ImgStore, CameraSize);  

    
    //发送图像存储数组到上位机
    //SendImage(ImgNew);       
    //黑线提取函数
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
    { //黑线提取成功，找两边黑线的线头
      //左线线头的查找
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
      
      //右线线头的查找
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
    
    //中心线提取函数
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
    
    //赛道类型判断
    //到这里时，中心线提取成功，左右黑线至少有一个提取成功。
    if(!PathJudge())
    {
      //uart_sendN(UART0, (uint8 *)"\nPathJudge Failed!", 18);
      return 0;
    }
    //发送中心线数组，不用发送float型的数据，同样的处理可以由上位机完成。
    //SendCenterLineLoc(CenterLineLoc);
    
    //SendImage(ImgNew);  
    
    return 1;
}


uint8 ImageProSend(void)
{
    //图像取需要的列，重新赋值是为了后面的编程方便。
    ///////////////////////////////////////////但这里需要用示波器测量一下时间，看是不是耗费了太多时间。
    ImgPut();
  
    //ImageExtract(ImgSend, ImgStore, CameraSize);  
    /*
    //黑线提取函数
    if(!BlackGet())         ////////////////////////////如果黑线提取失败，这里最好给个灯来指示
    {
        uart_sendN(UART0, (uint8 *)"\nBlackGet Failed!", 17);  
        return 0;
    }
    
    //中心线提取函数
    CenterLineResult = 1;
    if(!CenterLineGet())
    {
      uart_sendN(UART0, (uint8 *)"\nCenterLineGet Failed!", 22); 
      CenterLineResult = 0;
      return 0;
    }
    
    //PathJudge();

    */
    //发送中心线数组，不用发送float型的数据，同样的处理可以由上位机完成。
    //SendCenterLineLoc(CenterLineLoc);
    
    //发送图像存储数组到上位机
    SendImage(ImgNew);      
    
    return 1;
}




















