/**************************************************************/
/**************************************************************
File Name:	ImagePro.c
Function:		Image Processing
Date:			2016.4.12
Author:			MXL
Remark:		1.Begin this part 4.12
					2.Finish 4.16
					3.Add the parameter HalfWidth 4.17
					4.Modify the supplement function 4.18
						solve the problem: out of range by supplement
					5.Add the MidFilter and AverageFilter 4.19
					   Add the Pathjudge
					6.Modify the boundlimit and the strategy of the centerline get
					7.Modify the supplement's fatal error: overstack
					8.Add the direction detect in both leftline and rightline 5.2
***************************************************************/
/**************************************************************/

#include "ImagePro.h"

//1.变量定义
//数据记录
uint8 ImgNew[CameraHeight][CameraWidth];	//图片
uint8 CenterLine[CameraHeight];						//中线
uint8 CenterLinebak[CameraHeight];
uint8 LeftBlackLine[CameraHeight];					//左黑线
uint8 LeftBlackLinebak[CameraHeight];
uint8 RightBlackLine[CameraHeight];					//右黑线
uint8 RightBlackLinebak[CameraHeight];
uint8 LeftDirectChange = 0;								//左边线检测时发现方向改变
uint8 RightDirectChange = 0;								//右边线检测时发现方向转变

//曲率计算
uint8 CurveLineChosenC1 = 0;            	//曲率求取时，中心线选取的第1行
uint8 CurveLineChosenC2 = 0;           	//曲率求取时，中心线选取的第2行
uint8 CurveLineChosenC3 = 0;            	//曲率求取时，中心线选取的第3行
uint8 CurveLineChosenL1 = 0;              //曲率求取时，左黑线选取的第1行
uint8 CurveLineChosenL2 = 0;              //曲率求取时，左黑线选取的第2行
uint8 CurveLineChosenL3 = 0;              //曲率求取时，左黑线选取的第3行
uint8 CurveLineChosenR1 = 0;              //曲率求取时，右黑线选取的第1行
uint8 CurveLineChosenR2 = 0;              //曲率求取时，右黑线选取的第2行
uint8 CurveLineChosenR3 = 0;              //曲率求取时，右黑线选取的第3行
int16 SABCL = 0;                          		//曲率求取时，左黑线曲率三角形的面积，顺时针为负，逆时针为正
int16 SABCC = 0;                          		//曲率求取时，中心线曲率三角形的面积，顺时针为负，逆时针为正
int16 SABCR = 0;                          		//曲率求取时，右黑线曲率三角形的面积，顺时针为负，逆时针为正
int16 CURVEL = 0;                          		//曲率求取时，左黑线的曲率，顺时钟为负，逆时针为正
int16 CURVEC = 0;                          		//曲率求取时，中心线的曲率，顺时钟为负，逆时针为正
int16 CURVER = 0;                          		//曲率求取时，右黑线的曲率，顺时钟为负，逆时针为正
int16 PathStraightLimitL = 20;           	//赛道类型判断时，左黑线判断为直线的阈值，这里乱写的，需要用C#测定
int16 PathStraightLimitC = 20;           	//赛道类型判断时，中心线判断为直线的阈值，这里乱写的，需要用C#测定
int16 PathStraightLimitR = 20;           	//赛道类型判断时，右黑线判断为直线的阈值，这里乱写的，需要用C#测定
int16 CurveGetCompen = 2000;         	//曲率求取时，为了不使数太小，乘的补偿量

//色彩判断
uint8 BlackPoint = LimitBMAX;		//设置初始黑点定义为黑点最大值，纯黑=0
uint8 WhitePoint = LimitWMIN;		//设置初始白点为白点最小值，纯白=254
uint8 BWDiff = LimitWBMIN;			//设置初始黑白点差值最小值

//线路提取
uint8 CenterLineDone = 0;				//中心线提取成功标志
uint8 LeftBlackDone = 0;					//左黑线提取成功标志
uint8 RightBlackDone = 0;					//右黑线提取成功标志
//uint8 LeftBlackHead = NullValue;		//左黑线线头位置（行数）
//uint8 RightBlackHead = NullValue;	//右黑线线头位置（行数）
uint8 LeftBlackCross = 0;					//左黑线检测出十字标志
uint8 RightBlackCross = 0;				//右黑线检测出十字标志
uint8 CrossFlag = 0;						//十字检测标志
uint8  const HalfWidth[CameraHeight] = {16,17,19,20,21,22,
																24,27,28,30,33,34,
																35,36,38,40,42,42,
																45,46,47,49,49,50,
																52,53,53,54,54,56,
																56,57,58,58,59,60,
																61,61,62,62,63,63,
																63,64,65,66,67,67,
																68,70};
																//直线路赛道宽度（需测量）
uint8 Directflag;									//方向标识
uint8 Directleft = 0;								//左线初始方向
uint8 Directright = 0;								//右线初始方向


//2.函数定义
//数学运算
int16 AbsNum(int16 x);																			//绝对值计算
uint8 MaxRe(uint8 n1, uint8 n2);																//取最大值
uint8 MinRe(uint8 n1, uint8 n2);																//取最小值
float LeastSquarea1(uint8 x[], uint8 y[], uint8 n);										//最小二乘法系数a1计算
float LeastSquarea0(uint8 x[], uint8 y[], float a1, uint8 n);						//最小二乘法系数a2计算
uint8 BoundLimit(uint16 x, uint8 lowbound, uint8 upbound);							//范围限制
uint8 SqrtNum(uint16 x);																			//开方计算
int16 CurveGet(uint8 AX, uint8 AY, uint8 BX, uint8 BY, uint8 CX, uint8 CY);	//曲率求取
int16 SABCGet(uint8 AX, uint8 AY, uint8 BX, uint8 BY, uint8 CX, uint8 CY);	//三点三角面积符号求取
/**************************************************************
Function Name:	AbsNum
Function:				return the absolute of the number
Parameter:			int16 x
Return:					int16 abs(x)
Remark:				/
***************************************************************/
int16 AbsNum(int16 x)
{
	if(x < 0) return -x;
	else return x;
}

/**************************************************************
Function Name:	MaxRe
Function:				find the max number of n1 and n2
Parameter:			uint8 n1, uint8 n2
Return:					uint8 max{n1,n2}
Remark:				/
***************************************************************/
uint8 MaxRe(uint8 n1, uint8 n2)
{
	return (n1 >= n2)? n1 : n2;
}

/**************************************************************
Function Name:	MinRe
Function:				find the min number of n1 and n2
Parameter:			uint8 n1, uint8 n2
Return:					uint8 min{n1,n2}
Remark:				/
***************************************************************/
uint8 MinRe(uint8 n1, uint8 n2)
{
	return (n1 >= n2)? n2 : n1; 
}

/**************************************************************
Function Name:	LeastSquarea1
Function:				caculate the value of a1 in LSM
Parameter:			uint8 x[], uint8 y[], uint8 n
Return:					float a1
Remark:				1. y = a0 + a1 * x;
							2. a1 = (N * Σxy - Σx * Σy) / (N * Σx^2 - Σx * Σx);
***************************************************************/
float LeastSquarea1(uint8 x[], uint8 y[], uint8 n)
{
  float andxy = 0, andx = 0, andy = 0, andx2 = 0;
  float a1;
  uint8 i;
 
  for(i = 0; i < n; i++)
  {
    andxy += x[i] * y[i];
    andx += x[i];
    andy += y[i];
    andx2 += x[i] * x[i];
  }  
  a1 = (n * andxy - andx * andy) * 1.0 / (n * andx2 - andx * andx);
  return a1;  
}

/**************************************************************
Function Name:	LeastSquarea0
Function:				caculate the value of a0 in LSM
Parameter:			uint8 x[], uint8 y[], uint8 n
Return:					float a0
Remark:				1. y = a0 + a1 * x;
							2. a0 = Σy / N - a1 * Σx / N;
***************************************************************/
float LeastSquarea0(uint8 x[], uint8 y[], float a1, uint8 n)
{
  float andx = 0, andy = 0;
  float a0;
  uint8 i;
  for(i = 0; i < n; i++)
  {
    andx += x[i];
    andy += y[i];
  }
  
  a0 = andy / n - a1 * andx / n;
  return a0;
}

/**************************************************************
Function Name:	BoundLimit
Function:				limit the number in the bound
Parameter:			uint8 x, uint8 lowbound, uint8 upbound
Return:					uint8 x
Remark:				/
***************************************************************/
uint8 BoundLimit(uint16 x, uint8 lowbound, uint8 upbound)
{
	if(x < lowbound) x = NullValue;
	if(x > upbound) x = NullValue;
	return x;
}

/**************************************************************
Function Name:	SqrtNum
Function:				get hte squate root of the number
Parameter:			uint16 x
Return:					uint8 sqrt(x)
Remark:				/
***************************************************************/
uint8 SqrtNum(uint16 x)
{
	uint8 ans = 0, p = 0x80;
  
	while(p != 0)
	{
		ans += p;
		if(ans * ans > x) ans -= p;
		p = (uint8)(p / 2);
	}
	return ans;  
}

/**************************************************************
Function Name:	CurveGet
Function:				calculate the curve of the line
Parameter:			uint8 AX, AY, BX, BY, CX, CY
Return:					int16 Curve
Remark:				K = 4*SABC/AB/BC/AC
***************************************************************/
//曲线的曲率求取，曲线向右拐（三点为顺时针方向分布），曲率为负，曲线向左拐（三点为逆时钟方向分布），曲率为正
int16 CurveGet(uint8 AX, uint8 AY, uint8 BX, uint8 BY, uint8 CX, uint8 CY)
{
	int16 SABC_temp; 							//三角形的面积，有正负
	int16 tempab, tempbc, tempac;
	int16 AB, BC, AC; 							//三角形的边长，均为正
	//int16 K;        								//曲率结果，有正负
  
	SABC_temp = ((BX - AX) * (CY - AY) - (CX - AX) * (BY - AY));
  
	tempab = (BX - AX) * (BX - AX) + (BY - AY) * (BY - AY);
	if(tempab > 100) 
		AB = SqrtNum(tempab / 100) * 10;		//失掉两位的精度，因为求根运算范围的限制
	else
		AB = SqrtNum(tempab);

	tempbc = (BX - CX) * (BX - CX) + (BY - CY) * (BY - CY);
	if(tempbc > 100) 
		BC = SqrtNum(tempbc / 100) * 10;		//失掉两位的精度，因为求根运算范围的限制
	else
		BC = SqrtNum(tempbc);
  
	tempac = (CX - AX) * (CX - AX) + (CY - AY) * (CY - AY);
	if(tempac > 100) 
		AC = SqrtNum(tempac / 100) * 10;		//失掉两位的精度，因为求根运算范围的限制
	else
		AC = SqrtNum(tempac);
  
  return (CurveGetCompen * SABC_temp / AB / BC / AC);
}

/**************************************************************
Function Name:	SABCGet
Function:				calculate the square of ABC
Parameter:			uint8 AX, AY, BX, BY, CX, CY
Return:					int16 Curve
Remark:				K = 4*SABC/AB/BC/AC
***************************************************************/
//SABC的面积求取，顺时针则返回负值，逆时针则返回正值
//以左下角为原点，向右为x轴正方向(0~139)，向上为y轴正方向(0~49)
int16 SABCGet(uint8 AX, uint8 AY, uint8 BX, uint8 BY, uint8 CX, uint8 CY)
{
	int16 SABC_temp;
	
	SABC_temp = ((BX - AX) * (CY - AY) - (CX - AX) * (BY - AY)) / 2;
	
	return SABC_temp;
}


//数据传输
#ifdef ImagePro_CarUse

void SendCenterLine(uint8 Line[CameraHeight]);						//发送中心线数据
void SendImage(uint8 image[CameraHeight][CameraWidth]);	//发送图像

/**************************************************************
Function Name:	SendCenterLine
Function:				send back the centerline array
Parameter:			uint8 Line[CameraHeight]
Return:					/
Remark:				/
***************************************************************/
void SendCenterLine(uint8 Line[CameraHeight])
{
	uart_putchar(UART0, 255);
	uart_sendN(UART0, Line, CameraHeight);
	uart_putchar(UART0, 255);
}

/**************************************************************
Function Name:	SendImage
Function:				send back the image array
Parameter:			uint8 image[CameraHeight][CameraWidth]
Return:					/
Remark:				/
***************************************************************/
void SendImage(uint8 image[CameraHeight][CameraWidth])
{
	uint8 i;
	uart_putchar(UART0, 255);
	for(i = 0; i < CameraHeight; i++)
        {
		uart_sendN(UART0, image[i], CameraWidth);
        }
	uart_putchar(UART0, 255);
}

#endif

//色彩判断
void WBDefine(void);		//根据图片平均亮度确定更为准确的黑白阈值
void WBClear(void);																	//色彩判断值重置

/**************************************************************
Function Name:	WBDefine
Function:				determine the value of White and Black by average value
Parameter:			void(uint8 image[CameraHeight][CameraWidth])
Return:					/
Remark:				/
***************************************************************/
void WBDefine(void)
{
	uint32 Totallight = 0;
	uint8 i, j;
	for(i = 0; i < CameraHeight; i++)
		for(j = 0; j < CameraWidth; j++)
			Totallight += ImgNew[i][j];
	Totallight = Totallight / (CameraHeight * CameraWidth);
	WhitePoint = MaxRe(LimitWMIN, (uint8) (Totallight * temp_W));
	BlackPoint = MinRe(LimitBMAX, (uint8) (Totallight * temp_B));
	BWDiff = MaxRe(LimitWBMIN, WhitePoint - BlackPoint);
	/*for (i = 0; i < CameraHeight; i++)
		for (j = 0; j < CameraWidth; j++)
			if (ImgNew[i][j] > Totallight) ImgNew[i][j] = 254;
			else ImgNew[i][j] = 0;
	*/
}

/**************************************************************
Function Name:	WBClear
Function:				renew the value of White and Black by origin value
Parameter:			/
Return:					/
Remark:				/
***************************************************************/
void WBClear(void)
{
	BlackPoint = LimitBMAX;
	WhitePoint = LimitWMIN;
	BWDiff = LimitWBMIN;
}

//线路提取
//左线提取
uint8 LeftLineSweep(uint8 row);											//大范围确定左边线
uint8 LeftLineWin(uint8 row, uint8 predict_col);						//小范围确定左边线
uint8 LeftLineHeadScan(uint8 FirstRow, uint8 LastRow);			//确定左线线头
uint8 LeftLineSup(uint8 FirstRow, uint8 LastRow);					//左线补线
uint8 LeftCrossDetect(uint8 FirstRow, uint8 LastRow);			//左线十字检测（并完成补线）
uint8 LeftLineGet(void);														//获取左黑线
//右线提取
uint8 RightLineSweep(uint8 row);											//大范围确定右边线
uint8 RightLineWin(uint8 row, uint8 predict_col);					//小范围确定右边线
uint8 RightLineHeadScan(uint8 FirstRow, uint8 LastRow);		//确定右线线头
uint8 RightLineSup(uint8 FirstRow, uint8 LastRow);				//右线补线
uint8 RightCrossDetect(uint8 FirstRow, uint8 LastRow);			//右线十字检测（并完成补线）
uint8 RightLineGet(void);														//获取右黑线
//中线提取
uint8 BlackLineGet(void);														//左右黑线提取（调用）
uint8 CenterLineGet(void);													//中心线提取
uint8 MidFilter(uint8 x[]);														//中值滤波
uint8 AverageFilter(uint8 x[]);												//均值滤波
void isCrossFlag(void);
//方向判断
void PathJudge(void);															//方向判断
uint8 CurveSignGet(void);														//曲率符号求取

/**************************************************************
Function Name:	LeftLineSweep
Function:				find the black point (black line) in the wide range scale
Parameter:			uint8 row
Return:					uint8 bool success or failure
Remark:				/
***************************************************************/
uint8 LeftLineSweep(uint8 row)
{
	uint8 start_col, col;	//设定检查列
	uint8 diff;					//记录跳变差
//	uint8 count;				//记录连续检测点数
	uint8 isBlackLine;		//记录该点是否确定为黑线

	if (row < ImageEdge + 3)				//过高的地方调用此函数会出现左右线采混的情况
	{
		LeftBlackLine[row] = NullValue;
		return 0;
	}
	

	start_col = CameraWidth / 2 - 1 + BlackSweep_Offset;
	isBlackLine = 0;

	for(col = start_col; col > BlackSweep_Edge + ImageEdge; col--)
	{
		diff = AbsNum(ImgNew[row][col] - ImgNew[row][col - BlackSweep_Edge - 1]);															//计算跳变色差
		if(diff > BWDiff && ImgNew[row][col] > WhitePoint && ImgNew[row][col - BlackSweep_Edge - 1] < BlackPoint)		//检测跳变是否满足
		{
			if(row > BlackSweep_MidLine) isBlackLine = ((ImgNew[row][col - 2 - BlackSweep_Edge] < BlackPoint)
																				&& (ImgNew[row][col - 3 - BlackSweep_Edge] < BlackPoint)
																				&& (ImgNew[row][col - 4 - BlackSweep_Edge] < BlackPoint));
			else if(row > BlackSweep_FarLine) isBlackLine = ((ImgNew[row][col - 2 - BlackSweep_Edge] < BlackPoint)
																					&& (ImgNew[row][col - 3 - BlackSweep_Edge] < BlackPoint));
			else isBlackLine = (ImgNew[row][col - 2 - BlackSweep_Edge] < BlackPoint);
		}
		if(isBlackLine) 
		{
			LeftBlackLine[row] = col - 1 - BlackSweep_Edge;
			return 1;
		}
	}

	if(!isBlackLine) LeftBlackLine[row] = NullValue;
   	return 0;
}

/**************************************************************
Function Name:	LeftLineWin
Function:				find the black point (black line) in the narrow range scale
Parameter:			uint8 row
Return:					uint8 bool success or failure
Remark:				/
***************************************************************/
uint8 LeftLineWin(uint8 row, uint8 predict_col)
{
	uint8 final_col, col;		//设定检查列
	uint8 diff;						//记录跳变差
	uint8 isBlackLine;			//记录该点是否确定为黑线
	
	//确定开窗的左右阈值不超过图片可识别区域
	if(predict_col - BlackSweep_Win < ImageEdge + BlackSweep_Edge) final_col = BlackSweep_Edge + ImageEdge;
	else final_col = predict_col - BlackSweep_Win;
	if (predict_col + BlackSweep_Win > CameraWidth - ImageEdge - BlackSweep_Edge) col = CameraWidth - BlackSweep_Edge - ImageEdge;
	else col = predict_col + BlackSweep_Win;
	
	isBlackLine = 0;
	for(; col > final_col; col--)
	{
		diff = AbsNum(ImgNew[row][col] - ImgNew[row][col - BlackSweep_Edge - 1]);															//计算跳变色差
		if(diff > BWDiff && ImgNew[row][col] > WhitePoint && ImgNew[row][col - BlackSweep_Edge - 1] < BlackPoint)		//检测跳变是否满足
		{
			if(row > BlackSweep_MidLine) isBlackLine = ((ImgNew[row][col - 2 - BlackSweep_Edge] < BlackPoint)
																				&& (ImgNew[row][col - 3 - BlackSweep_Edge] < BlackPoint)
																				&& (ImgNew[row][col - 4 - BlackSweep_Edge] < BlackPoint));
			else if(row > BlackSweep_FarLine) isBlackLine = ((ImgNew[row][col - 2 - BlackSweep_Edge] < BlackPoint)
																					&& (ImgNew[row][col - 3 - BlackSweep_Edge] < BlackPoint));
			else isBlackLine = (ImgNew[row][col - 4 - BlackSweep_Edge] < BlackPoint);
		}
 		if(isBlackLine) 
		{
			LeftBlackLine[row] = col - 1 - BlackSweep_Edge;
			return 1;
		}
	}

	if(!isBlackLine) LeftBlackLine[row] = NullValue;
	return 0;
}

/**************************************************************
Function Name:	LeftLineHeadScan
Function:				find the head of the left black line
Parameter:			uint8 firstrow, uint8 lastrow
Return:					uint8 row of left line head
Remark:				/
***************************************************************/
uint8 LeftLineHeadScan(uint8 FirstRow, uint8 LastRow)	//寻找范围内的线头，从下往上找
{
	uint8 row;					//设定检查行
	uint8 temp1, temp2;
	uint8 diff;						//连续两行判断黑点行距离差，距离小于阈值则表明线头有效

	for(row = FirstRow; row > LastRow; row -= 2)
	{
		temp1 = LeftLineSweep(row);
		temp2 = LeftLineSweep(row - 1);
		if(temp1 && temp2)
		{
			diff = AbsNum(LeftBlackLine[row - 1] - LeftBlackLine[row]);
			if(diff < BlackSweep_Cont) break;
		}
	}

	if(row > LastRow) return row;		//返回线头所在行
	else return NullValue;
}

/**************************************************************
Function Name:	LeftLineSup
Function:				supplement the interrupt line if there is a cross
Parameter:			uint8 firstrow, uint8 lastrow
Return:					uint8 bool success or failure
Remark:				/
***************************************************************/
uint8 LeftLineSup(uint8 FirstRow, uint8 LastRow)	//第一段线最后一行与第二段第一行，中间进行补线操作(线性补线)
{
	float delta_x, delta_y, delta, index;
	uint8 row, temp1, temp2, temp;
	uint8 fcount;

	fcount = 0;

	temp1 = NullValue;
	temp2 = NullValue;

	if(FirstRow <= LastRow)
	{
#ifdef ImagePro_CarUse
		uart_sendN(UART0, (uint8 *)"\nDetect two parts of LeftBlackLine error!\n", 42);
#endif
#ifdef ImagePro_PCUse
		printf("Detect two parts of LeftBlackLine error!\n");
#endif
		return 0;
	}
	if(FirstRow - LastRow < BlackSweep_CrossLine)
	{
#ifdef ImagePro_CarUse
		uart_sendN(UART0, (uint8 *)"\nTwo parts are too near!\n", 25);
#endif
#ifdef ImagePro_PCUse
		printf("Two parts are too near!\n");
#endif	
		return 0;
	}

	if(FirstRow <= CameraHeight - ImageEdge && LastRow >= ImageEdge)									//中央补线
	{
		for(; FirstRow < CameraHeight; FirstRow++)
			if(LeftBlackLine[FirstRow] != NullValue) {temp1 = LeftBlackLine[FirstRow]; break;}
		for(; LastRow > 0; LastRow--)
			if(LeftBlackLine[LastRow] != NullValue) {temp2 = LeftBlackLine[LastRow]; break;}
		if(temp1 == NullValue || temp2 == NullValue) return 0;
		delta_y = FirstRow - LastRow;

		if(temp1 < temp2)				//补线斜率为右
		{
			delta_x = temp2 - temp1;
			delta = delta_x / delta_y;
			index = 1.0;
		
			for(row = FirstRow - 1; row >= LastRow + 1; row--)		//逐行向右补线
			{
				if(LeftBlackLine[row] == NullValue)
					LeftBlackLine[row] = (uint8)(((CameraWidth - 1 - LeftBlackLine[FirstRow] - delta * index) > 0)?
																				((float)LeftBlackLine[FirstRow] + delta * index) : NullValue);
				if(LeftBlackLine[row] == NullValue) fcount++;
				index += 1.0;
			}
		}
		else if(temp1 > temp2)		//补线斜率为左
		{
			delta_x = temp1 - temp2;
			delta = delta_x / delta_y;
			index = 1.0;
			
			for(row = FirstRow - 1; row >= LastRow + 1; row--)		//逐行向左补线
			{
				if (LeftBlackLine[row] == NullValue)
					LeftBlackLine[row] = (uint8)(((LeftBlackLine[FirstRow] - delta * index) > 0)?
																				((float)LeftBlackLine[FirstRow] - delta * index) : NullValue);
				if(LeftBlackLine[row] == NullValue) fcount++;
				index += 1.0;
			}
		}
		else										//直线补线
		{
			for(row = FirstRow - 1; row >= LastRow + 1; row--)
			{
				if (LeftBlackLine[row] == NullValue)
					LeftBlackLine[row] = temp1;
			}
		}
	}
	else if(FirstRow <= CameraHeight - ImageEdge - BlackSupSingle && LastRow < ImageEdge)		//向上补线
	{
		temp = BlackSupSingle;
		for (; FirstRow < CameraHeight; FirstRow++)
			if (LeftBlackLine[FirstRow] != NullValue) {temp2 = LeftBlackLine[FirstRow]; break; }
		for(; FirstRow + temp < CameraHeight; temp++)
			if(LeftBlackLine[FirstRow + temp] != NullValue) {temp1 = LeftBlackLine[FirstRow + temp]; break;}
		if (temp1 == NullValue || temp2 == NullValue) return 0;
		delta_y = temp;

		if(temp1 < temp2)				//补线斜率为右
		{
			delta_x = temp2 - temp1;
			delta = delta_x / delta_y;
			index = 1.0;
		
			for(row = FirstRow - 1; row >= LastRow; row--)		//逐行向右补线
			{
				if (LeftBlackLine[row] == NullValue)
					LeftBlackLine[row] = (uint8)(((CameraWidth - 1 - LeftBlackLine[FirstRow] - delta * index) > 0)?
																				((float)LeftBlackLine[FirstRow] + delta * index) : NullValue);
				if(LeftBlackLine[row] == NullValue) fcount++;
				index += 1.0;
				if (row == 0) break;
			}
		}
		else if(temp1 > temp2)		//补线斜率为左
		{
			delta_x = temp1 - temp2;
			delta = delta_x / delta_y;
			index = 1.0;
			
			for(row = FirstRow - 1; row >= LastRow; row--)		//逐行向左补线
			{
				if (LeftBlackLine[row] == NullValue)
					LeftBlackLine[row] = (uint8)(((LeftBlackLine[FirstRow] - delta * index) > 0)?
																				((float)LeftBlackLine[FirstRow] - delta * index) : NullValue);
				if(LeftBlackLine[row] == NullValue) fcount++;
				index += 1.0;
				if (row == 0) break;
			}
		}
		else										//直线补线
		{
			for(row = FirstRow - 1; row >= LastRow; row--)
			{
				if (LeftBlackLine[row] == NullValue)
					LeftBlackLine[row] = temp1;
				if (row == 0) break;
			}
		}
	}
	else if(FirstRow > CameraHeight - ImageEdge && LastRow >= ImageEdge + BlackSupSingle)	//向下补线
	{
		temp = BlackSupSingle;
		for(; LastRow > 0; LastRow--)
			if(LeftBlackLine[LastRow] != NullValue) {temp1 = LeftBlackLine[LastRow]; break;}
		for(; LastRow - temp > 0; temp++)
			if(LeftBlackLine[LastRow - temp] != NullValue) {temp2 = LeftBlackLine[LastRow - temp]; break;}
		if (temp1 == NullValue || temp2 == NullValue) return 0;
		delta_y = temp;

		if(temp1 < temp2)				//补线斜率为左
		{
			delta_x = temp2 - temp1;
			delta = delta_x / delta_y;
			index = 1.0;
		
			for(row = LastRow + 1; row <= FirstRow; row++)		//逐行向左补线
			{
				if (LeftBlackLine[row] == NullValue)
					LeftBlackLine[row] = (uint8)(((LeftBlackLine[LastRow] - delta * index) > 0)?
																				((float)LeftBlackLine[LastRow] - delta * index) : NullValue);
				if(LeftBlackLine[row] == NullValue) fcount++;
				index += 1.0;
			}
		}
		else if(temp1 > temp2)		//补线斜率为右
		{
			delta_x = temp1 - temp2;
			delta = delta_x / delta_y;
			index = 1.0;
			
			for(row = LastRow + 1; row <= FirstRow; row++)		//逐行向右补线
			{
				if (LeftBlackLine[row] == NullValue)
					LeftBlackLine[row] = (uint8)(((CameraWidth - 1 - LeftBlackLine[LastRow] - delta * index) > 0)?
																				((float)LeftBlackLine[LastRow] + delta * index) : NullValue);
				if(LeftBlackLine[row] == NullValue) fcount++;
				index += 1.0;
			}
		}
		else										//直线补线
		{
			for(row = FirstRow - 1; row >= LastRow; row--)
			{
				if (LeftBlackLine[row] == NullValue)
					LeftBlackLine[row] = temp1;
			}
		}
	}
	
	//采用最小二乘法进行补线检查_效果不好bymxl
	/*
	uint8 LineRowArray[BlackSupBack], LineColArray[BlackSupBack];		//最小二乘法使用数组
	float a0, a1;																						//最小二乘法系数定义
	float temp;
	uint8 diff;						//补线方法与检测方法得到结果的定位差
	if(FirstRow <= CameraHeight - ImageEdge && LastRow >= ImageEdge)				//中央补线检查
	{
		LineRowArray[0] = FirstRow + 1;							//从两段线线头处取点进行判断
		LineRowArray[1] = FirstRow;
		LineRowArray[2] = LastRow;
		LineRowArray[3] = LastRow - 1;
		LineColArray[0] = LeftBlackLine[FirstRow + 1];
		LineColArray[1] = LeftBlackLine[FirstRow];
		LineColArray[2] = LeftBlackLine[LastRow];
		LineColArray[3] = LeftBlackLine[LastRow - 1];
	}
	else if(FirstRow <= CameraHeight - ImageEdge - 3 && LastRow < ImageEdge)		//向上补线检查
	{
		LineRowArray[0] = FirstRow + 3;							//从第一段线头处取点进行判断
		LineRowArray[1] = FirstRow + 2;
		LineRowArray[2] = FirstRow + 1;
		LineRowArray[3] = FirstRow;
		LineColArray[0] = LeftBlackLine[FirstRow + 3];
		LineColArray[1] = LeftBlackLine[FirstRow + 2];
		LineColArray[2] = LeftBlackLine[FirstRow + 1];
		LineColArray[3] = LeftBlackLine[FirstRow];
	}
	else if(FirstRow > CameraHeight - ImageEdge && LastRow >= ImageEdge + 3)	//向下补线检查
	{
		LineRowArray[0] = LastRow;							//从第二段线头处取点进行判断
		LineRowArray[1] = LastRow - 1;
		LineRowArray[2] = LastRow - 2;
		LineRowArray[3] = LastRow - 3;
		LineColArray[0] = LeftBlackLine[LastRow];
		LineColArray[1] = LeftBlackLine[LastRow - 1];
		LineColArray[2] = LeftBlackLine[LastRow - 2];
		LineColArray[3] = LeftBlackLine[LastRow - 3];
	}
	else return 0;			//此处则表明图出现了严重错误

	a1 = LeastSquarea1(LineColArray, LineRowArray, BlackSupBack);
	a0 = LeastSquarea0(LineColArray, LineRowArray, a1, BlackSupBack);
	
	for(row = FirstRow - 1; row >= LastRow + 1; row -= 3)					//三点进行一次检测，看线性补线方式是否准确，若偏差过大则补线失败
	{
		temp = a0 + a1 * row;
		diff = AbsNum(LeftBlackLine[row] - (uint8)temp);
		if(diff <= BlackSupLimit) 
		{
#ifdef ImagePro_CarUse
			uart_sendN(UART0, (uint8 *)"\nCheck supplement error!\n", 25);
#endif
#ifdef ImagePro_PCUse
			printf("Check supplement error!\n");
#endif			
			return 0;
		}
	}
	*/
	if(fcount > CameraHeight / 3) return 0;
	return 1;
}

/**************************************************************
Function Name:	LeftCrossDetect
Function:				detect the left line cross and solve it
Parameter:			uint8 firstrow, uint8 lastrow
Return:					uint8 bool success or failure
Remark:				This part is totally different from the code of sirius
***************************************************************/
uint8 LeftCrossDetect(uint8 FirstRow, uint8 LastRow)
{
	uint8 temp, temp1, temp2;
	uint8 flag = 0;			//补线成功判断位

	temp = LeftLineHeadScan(FirstRow, LastRow);		//查找定位区内的线头
	if(temp == NullValue)											//未找到线头，说明出现十字
	{
		flag = LeftLineSup(FirstRow, LastRow);
	}
	else
	{
		temp1 = LeftLineWin(temp - 1, LeftBlackLine[temp]);	//强化延长线头，判断是噪声点还是确实有一段线
		temp2 = LeftLineWin(temp - 2, LeftBlackLine[temp]);
		if(temp1 && temp2)														//存在连续的至少跨越3行的短线
		{
			temp1 = LeftCrossDetect(temp - 2, LastRow);
			temp2 = LeftCrossDetect(FirstRow, temp);
			flag = temp1 && temp2;											//两段均正确补线，则补线成功
		}
		else
		{
			ImgNew[temp][LeftBlackLine[temp]] = NullValue - 1;				//原图滤波
			ImgNew[temp - 1][LeftBlackLine[temp - 1]] = NullValue - 1;
			ImgNew[temp - 2][LeftBlackLine[temp - 2]] = NullValue - 1;
			LeftBlackLine[temp] = NullValue;								//滤除噪声
			LeftBlackLine[temp - 1] = NullValue;
			LeftBlackLine[temp - 2] = NullValue;
			flag = LeftCrossDetect(FirstRow, LastRow);				//滤除噪声后对这段重新进行十字检测
		}
	}

	if(flag) return 1;
	else return 0;
}

/**************************************************************
Function Name:	LeftLineGet
Function:				get left black line
Parameter:			void
Return:					uint8 bool success or failure
Remark:				/
***************************************************************/
uint8 LeftLineGet(void)							//获取左黑线
{
	uint8 row, temp;
	uint8 temp1, temp2;
	uint8 flag,flag_t;
	uint8 backsuprow;							//若需要向后补线，记录线头
	uint8 crosssuprow1, crosssuprow2;	//若需要十字补线，记录线头
	uint8 GapCount = 0;						//记录连续未采集到黑线的数目，用于判定Cross
	uint8 LeftDirect = 0;						//方向记录
	uint8 Directtemp = 0;					//初始方向计算
	//uint8 changerow = NullValue;			//方向改变行

	backsuprow = NullValue;
	crosssuprow1 = NullValue;
	crosssuprow2 = NullValue;
	temp = LeftLineHeadScan(CameraHeight - 1, CameraHeight - BlackSweep_RowEnd - 1);
	if (temp == NullValue)
	{
		for (row = 0; row < CameraHeight; row++) LeftBlackLine[row] = NullValue;
		return 0;
	}

	row = temp;

	if(LeftBlackLine[row] >= LeftBlackLine[row - 1]) Directtemp = 0;
	else Directtemp = 1;
	Directleft = Directtemp;

	if(row < CameraHeight - BlackSweep_CrossLine)
	{
		//LeftBlackCross = 1;
		backsuprow = row;
	}

	temp = (LeftBlackLine[row] + LeftBlackLine[row - 1]) / 2;
	for(row -= 2; row > 0; row -= 2)
	{
		temp1 = LeftLineWin(row, temp);
		temp2 = LeftLineWin(row - 1, temp);
		if(temp1 && temp2)						//连续两行提取成功
		{
			temp = (LeftBlackLine[row] + LeftBlackLine[row - 1]) / 2;		//调整预测值
			if(LeftBlackLine[row] >= LeftBlackLine[row - 1]) LeftDirect = 0;					//斜率向左
			else LeftDirect = 1;											//斜率向右
			if(LeftDirect != Directtemp)		//寻线过程中线的方向发生变化
			{
				LeftDirectChange = 1;
				//changerow = row + 2;
			}
		}	
		else if(!temp1 && temp2)		//避免因预测错误而出现的错误
		{
			temp = (LeftBlackLine[row + 1] + LeftBlackLine[row - 1]) / 2;
			temp1 = LeftLineSweep(row);
			if(temp1)
				temp = (LeftBlackLine[row] + LeftBlackLine[row - 1]) / 2;
		}
		else if(temp1 && !temp2)
		{
			temp = (LeftBlackLine[row + 1] + LeftBlackLine[row]) / 2;
			temp2 = LeftLineSweep(row - 1);
			if(temp2)
				temp = (LeftBlackLine[row] + LeftBlackLine[row - 1]) / 2;
		}
		else
		{
			temp1 = LeftLineSweep(row);
			temp2 = LeftLineSweep(row - 1);
			if(temp1 && temp2)
				temp = (LeftBlackLine[row] + LeftBlackLine[row - 1]) / 2;
			else if (temp1)
				temp = (LeftBlackLine[row + 1] + LeftBlackLine[row]) / 2;
			else if(temp2)
				temp = (LeftBlackLine[row + 1] + LeftBlackLine[row - 1]) / 2;

			if(!temp1 && !temp2)
			{
				if(LeftBlackLine[row + 1] == NullValue || LeftBlackLine[row + 2] == NullValue)
				{
					if(GapCount == 0 /*&& ((LeftDirectChange == 0) || (LeftDirectChange == 1 && row < BlackSweep_MidLine))*/) 
						crosssuprow1 = row + 3;
					//else if(GapCount == 0 && LeftDirectChange == 1) crosssuprow1 = changerow;
					crosssuprow2 = row - 1;
					GapCount += 2;
				}	
			}
		}

		if (row == 1) break;
	}
	if(GapCount >= BlackSweep_CrossGap) LeftBlackCross = 1;
	if(GapCount > CameraHeight / 2 + 10) return 0;
	
	if(!LeftBlackCross && backsuprow == NullValue) flag = 1;
	if(LeftBlackCross)
	{
		crosssuprow2 = MaxRe(ImageEdge, crosssuprow2);		//防止出现上限溢出
		if(crosssuprow2 <= ImageEdge + 2)
			flag = LeftLineSup(crosssuprow1, ImageEdge - 2);
		else flag = LeftCrossDetect(crosssuprow1, crosssuprow2);
	}
	else flag = 1;
	if(backsuprow != NullValue)
	{
		LeftBlackCross = 1;
		flag_t = LeftLineSup(CameraHeight - ImageEdge + 1, backsuprow);
		if (flag != 0 && flag_t != 0) flag = 1;
		else flag = 0;
	}

	if(flag) LeftBlackDone = 1;
    for(row = CameraHeight - MidPronum / 2 - 1; row > MidPronum / 2 - 1; row--)		//中值滤波
		LeftBlackLinebak[row] = MidFilter(&LeftBlackLine[row - MidPronum / 2]);
	for (row = CameraHeight - MidPronum / 2 - 1; row > MidPronum / 2 - 1; row--)
		LeftBlackLine[row] = LeftBlackLinebak[row];		//最上面的点不会受滤波影响
	for(row = CameraHeight - MidPronum / 2 - 1; row > MidPronum / 2 - 1; row--)		//均值滤波
		LeftBlackLinebak[row] = AverageFilter(&LeftBlackLine[row - MidPronum / 2]);
	for (row = CameraHeight - MidPronum / 2 - 1; row > MidPronum / 2 - 1; row--)
		LeftBlackLine[row] = LeftBlackLinebak[row];		//最上面的点不会受滤波影响

	return LeftBlackDone;
}

/**************************************************************
Function Name:	RightLineSweep
Function:				find the black point (black line) in the wide range scale
Parameter:			uint8 row
Return:					uint8 bool success or failure
Remark:				/
***************************************************************/
uint8 RightLineSweep(uint8 row)
{
	uint8 start_col, col;	//设定检查列
	uint8 diff;					//记录跳变差
//	uint8 count;				//记录连续检测点数
	uint8 isBlackLine;		//记录该点是否确定为黑线

	
	if (row < ImageEdge + 3)				//过高的地方调用此函数会出现左右线采混的情况
	{
		RightBlackLine[row] = NullValue;
		return 0;
	}
	

	if(LeftBlackDone == 1)
	{
		if(LeftBlackLine[row] == NullValue) start_col = CameraWidth / 2;
		else
		{
			start_col = MaxRe(CameraWidth / 2, LeftBlackLine[row] + BlackSweep_Edge + 4);	//右黑线至少要比左黑线靠右
			start_col = MinRe(start_col, CameraWidth - BlackSweep_Edge - ImageEdge);
		}
	}
	else
	{
		start_col = CameraWidth / 2 + 1 - BlackSweep_Offset;
	}
	
	isBlackLine = 0;

	for(col = start_col; col <= CameraWidth - BlackSweep_Edge - ImageEdge; col++)
	{
		diff = AbsNum(ImgNew[row][col] - ImgNew[row][col + BlackSweep_Edge + 1]);															//计算跳变色差
		if(diff > BWDiff && ImgNew[row][col] > WhitePoint && ImgNew[row][col + BlackSweep_Edge + 1] < BlackPoint)		//检测跳变是否满足
		{
			if(row > BlackSweep_MidLine) isBlackLine = ((ImgNew[row][col + 2 + BlackSweep_Edge] < BlackPoint)
																				&& (ImgNew[row][col + 3 + BlackSweep_Edge] < BlackPoint)
																				&& (ImgNew[row][col + 4 + BlackSweep_Edge] < BlackPoint));
			else if(row > BlackSweep_FarLine) isBlackLine = ((ImgNew[row][col + 2 + BlackSweep_Edge] < BlackPoint)
																					&& (ImgNew[row][col + 3 + BlackSweep_Edge] < BlackPoint));
			else isBlackLine = (ImgNew[row][col + 2 + BlackSweep_Edge] < BlackPoint);
		}
		if(isBlackLine) 
		{
			RightBlackLine[row] = col + 1 + BlackSweep_Edge;
			return 1;
		}
	}

	if(!isBlackLine) RightBlackLine[row] = NullValue;
	return 0;
}

/**************************************************************
Function Name:	RightLineWin
Function:				find the black point (black line) in the narrow range scale
Parameter:			uint8 row
Return:					uint8 bool success or failure
Remark:				/
***************************************************************/
uint8 RightLineWin(uint8 row, uint8 predict_col)
{
	uint8 final_col, col;		//设定检查列
	uint8 diff;						//记录跳变差
	uint8 isBlackLine;			//记录该点是否确定为黑线
	
	//确定开窗的左右阈值不超过图片可识别区域
	if(predict_col - BlackSweep_Win < ImageEdge + BlackSweep_Edge) col = BlackSweep_Edge + ImageEdge;
	else col = predict_col - BlackSweep_Win;
	if (predict_col + BlackSweep_Win > CameraWidth - ImageEdge - BlackSweep_Edge) final_col = CameraWidth - BlackSweep_Edge - ImageEdge;
	else final_col = predict_col + BlackSweep_Win;
	
	isBlackLine = 0;
	for(; col < final_col; col++)
	{
		diff = AbsNum(ImgNew[row][col] - ImgNew[row][col + BlackSweep_Edge + 1]);															//计算跳变色差
		if(diff > BWDiff && ImgNew[row][col] > WhitePoint && ImgNew[row][col + BlackSweep_Edge + 1] < BlackPoint)		//检测跳变是否满足
		{
			if(row > BlackSweep_MidLine) isBlackLine = ((ImgNew[row][col + 2 + BlackSweep_Edge] < BlackPoint)
																				&& (ImgNew[row][col + 3 + BlackSweep_Edge] < BlackPoint)
																				&& (ImgNew[row][col + 4 + BlackSweep_Edge] < BlackPoint));
			else if(row > BlackSweep_FarLine) isBlackLine = ((ImgNew[row][col + 2 + BlackSweep_Edge] < BlackPoint)
																					&& (ImgNew[row][col + 3 + BlackSweep_Edge] < BlackPoint));
			else isBlackLine = (ImgNew[row][col + 2 + BlackSweep_Edge] < BlackPoint);
		}
		if(isBlackLine) 
		{
			RightBlackLine[row] = col + 1 + BlackSweep_Edge;
			return 1;
		}
	}

	if(!isBlackLine) RightBlackLine[row] = NullValue;
	return 0;
}

/**************************************************************
Function Name:	RightLineHeadScan
Function:				find the head of the right black line
Parameter:			uint8 firstrow, uint8 lastrow
Return:					uint8 row of right line head
Remark:				/
***************************************************************/
uint8 RightLineHeadScan(uint8 FirstRow, uint8 LastRow)	//寻找范围内的线头，从下往上找
{
	uint8 row;					//设定检查行
	uint8 temp1, temp2;
	uint8 diff;						//连续两行判断黑点行距离差，距离小于阈值则表明线头有效

	for(row = FirstRow; row > LastRow; row -= 2)
	{
		temp1 = RightLineSweep(row);
		temp2 = RightLineSweep(row - 1);
		if(temp1 && temp2)
		{
			diff = AbsNum(RightBlackLine[row - 1] - RightBlackLine[row]);
			if(diff < BlackSweep_Cont) break;
		}
	}

	if(row > LastRow) return row;		//返回线头所在行
	else return NullValue;
}

/**************************************************************
Function Name:	RightLineSup
Function:				supplement the interrupt line if there is a cross
Parameter:			uint8 firstrow, uint8 lastrow
Return:					uint8 bool success or failure
Remark:				/
***************************************************************/
uint8 RightLineSup(uint8 FirstRow, uint8 LastRow)	//第一段线最后一行与第二段第一行，中间进行补线操作(线性补线)
{
	float delta_x, delta_y, delta, index;
	uint8 row, temp1, temp2, temp;
	uint8 fcount;

	fcount = 0;

	temp1 = NullValue;
	temp2 = NullValue;

	if(FirstRow <= LastRow)
	{
#ifdef ImagePro_CarUse
		uart_sendN(UART0, (uint8 *)"\nDetect two parts of RightBlackLine error!\n", 43);
#endif
#ifdef ImagePro_PCUse
		printf("Detect two parts of RightBlackLine error!\n");
#endif
		return 0;
	}
	if(FirstRow - LastRow < BlackSweep_CrossLine)
	{
#ifdef ImagePro_CarUse
		uart_sendN(UART0, (uint8 *)"\nTwo parts are too near right!\n", 30);
#endif
#ifdef ImagePro_PCUse
		printf("Two parts are too near right!\n");
#endif	
		return 0;
	}

	if(FirstRow <= CameraHeight - ImageEdge && LastRow >= ImageEdge)									//中央补线
	{
		for(; FirstRow < CameraHeight; FirstRow++)
			if(RightBlackLine[FirstRow] != NullValue) {temp1 = RightBlackLine[FirstRow]; break;}
		for(; LastRow > 0; LastRow--)
			if(RightBlackLine[LastRow] != NullValue) {temp2 = RightBlackLine[LastRow]; break;}
		if (temp1 == NullValue || temp2 == NullValue) return 0;
		delta_y = FirstRow - LastRow;

		if(temp1 < temp2)				//补线斜率为右
		{
			delta_x = temp2 - temp1;
			delta = delta_x / delta_y;
			index = 1.0;
		
			for(row = FirstRow - 1; row >= LastRow + 1; row--)		//逐行向右补线
			{
				if (RightBlackLine[row] == NullValue)
					RightBlackLine[row] = (uint8)(((CameraWidth - 1 - RightBlackLine[FirstRow] - delta * index) > 0)?
																				((float)RightBlackLine[FirstRow] + delta * index) : NullValue);
				if(RightBlackLine[row] == NullValue) fcount++;
				index += 1.0;
			}
		}
		else if(temp1 > temp2)		//补线斜率为左
		{
			delta_x = temp1 - temp2;
			delta = delta_x / delta_y;
			index = 1.0;
			
			for(row = FirstRow - 1; row >= LastRow + 1; row--)		//逐行向左补线
			{
				if (RightBlackLine[row] == NullValue)
					RightBlackLine[row] = (uint8)(((RightBlackLine[FirstRow] - delta * index) > 0)?
																				((float)RightBlackLine[FirstRow] - delta * index) : NullValue);
				if(RightBlackLine[row] == NullValue) fcount++;				
				index += 1.0;
			}
		}
		else										//直线补线
		{
			for(row = FirstRow - 1; row >= LastRow + 1; row--)
			{
				if (RightBlackLine[row] == NullValue)
					RightBlackLine[row] = temp1;
			}
		}
	}
	else if(FirstRow <= CameraHeight - ImageEdge - BlackSupSingle && LastRow < ImageEdge)		//向上补线
	{
		temp = BlackSupSingle;
		for(; FirstRow < CameraHeight; FirstRow++)
			if(RightBlackLine[FirstRow] != NullValue) {temp2 = RightBlackLine[FirstRow]; break;}
		for(; FirstRow + temp < CameraHeight; temp++)
			if(RightBlackLine[FirstRow + temp] != NullValue) {temp1 = RightBlackLine[FirstRow + temp]; break;}
		if (temp1 == NullValue || temp2 == NullValue) return 0;
		delta_y = temp;

		if(temp1 < temp2)				//补线斜率为右
		{
			delta_x = temp2 - temp1;
			delta = delta_x / delta_y;
			index = 1.0;
		
			for(row = FirstRow - 1; row >= LastRow; row--)		//逐行向右补线
			{
				if (RightBlackLine[row] == NullValue)
					RightBlackLine[row] = (uint8)(((CameraWidth - 1 - RightBlackLine[FirstRow] - delta * index) > 0)?
																				((float)RightBlackLine[FirstRow] + delta * index) : NullValue);
				if(RightBlackLine[row] == NullValue) fcount++;
				index += 1.0;
				if (row == 0) break;
			}
		}
		else if(temp1 > temp2)		//补线斜率为左
		{
			delta_x = temp1 - temp2;
			delta = delta_x / delta_y;
			index = 1.0;
			
			for(row = FirstRow - 1; row >= LastRow; row--)		//逐行向左补线
			{
				if(RightBlackLine[row] == NullValue) 
					RightBlackLine[row] = (uint8)(((RightBlackLine[FirstRow] - delta * index) > 0)?
																				((float)RightBlackLine[FirstRow] - delta * index) : NullValue);
				if(RightBlackLine[row] == NullValue) fcount++;
				index += 1.0;
				if (row == 0) break;
			}
		}
		else										//直线补线
		{
			for(row = FirstRow - 1; row >= LastRow; row--)
			{
				if (RightBlackLine[row] == NullValue)
					RightBlackLine[row] = temp1;
				if (row == 0) break;
			}
		}
	}
	else if(FirstRow > CameraHeight - ImageEdge && LastRow >= ImageEdge + BlackSupSingle)	//向下补线
	{
		temp = BlackSupSingle;
		for(; LastRow > 0; LastRow--)
			if(RightBlackLine[LastRow] != NullValue) {temp1 = RightBlackLine[LastRow]; break;}
		for(; LastRow - temp > 0; temp++)
			if(RightBlackLine[LastRow - temp] != NullValue) {temp2 = RightBlackLine[LastRow - temp]; break;}
		if (temp1 == NullValue || temp2 == NullValue) return 0;
		delta_y = temp;

		if(temp1 < temp2)				//补线斜率为左
		{
			delta_x = temp2 - temp1;
			delta = delta_x / delta_y;
			index = 1.0;
		
			for(row = LastRow + 1; row <= FirstRow; row++)		//逐行向左补线
			{
				if (RightBlackLine[row] == NullValue)
					RightBlackLine[row] = (uint8)(((RightBlackLine[LastRow] - delta * index) > 0)?
																				((float)RightBlackLine[LastRow] - delta * index) : NullValue);
				if(RightBlackLine[row] == NullValue) fcount++;
				index += 1.0;
			}
		}
		else if(temp1 > temp2)		//补线斜率为右
		{
			delta_x = temp1 - temp2;
			delta = delta_x / delta_y;
			index = 1.0;
			
			for(row = LastRow + 1; row <= FirstRow; row++)		//逐行向右补线
			{
				if (RightBlackLine[row] == NullValue)
					RightBlackLine[row] = (uint8)(((CameraWidth - 1 - RightBlackLine[LastRow] - delta * index) > 0)?
																				((float)RightBlackLine[LastRow] + delta * index) : NullValue);
				if(RightBlackLine[row] == NullValue) fcount++;
				index += 1.0;
			}
		}
		else										//直线补线
		{
			for(row = FirstRow; row >= LastRow + 1; row--)
			{
				if (RightBlackLine[row] == NullValue)
					RightBlackLine[row] = temp1;
			}
		}
	}
	
	//采用最小二乘法进行补线检查
	/*
	uint8 LineRowArray[BlackSupBack], LineColArray[BlackSupBack];		//最小二乘法使用数组
	float a0, a1;																						//最小二乘法系数定义
	float temp;
	uint8 diff;						//补线方法与检测方法得到结果的定位差
	if(FirstRow <= CameraHeight - ImageEdge && LastRow >= ImageEdge)				//中央补线检查
	{
		LineRowArray[0] = FirstRow + 1;							//从两段线线头处取点进行判断
		LineRowArray[1] = FirstRow;
		LineRowArray[2] = LastRow;
		LineRowArray[3] = LastRow - 1;
		LineColArray[0] = RightBlackLine[FirstRow + 1];
		LineColArray[1] = RightBlackLine[FirstRow];
		LineColArray[2] = RightBlackLine[LastRow];
		LineColArray[3] = RightBlackLine[LastRow - 1];
	}
	else if(FirstRow <= CameraHeight - ImageEdge - 3 && LastRow < ImageEdge)		//向上补线检查
	{
		LineRowArray[0] = FirstRow + 3;							//从第一段线头处取点进行判断
		LineRowArray[1] = FirstRow + 2;
		LineRowArray[2] = FirstRow + 1;
		LineRowArray[3] = FirstRow;
		LineColArray[0] = RightBlackLine[FirstRow + 3];
		LineColArray[1] = RightBlackLine[FirstRow + 2];
		LineColArray[2] = RightBlackLine[FirstRow + 1];
		LineColArray[3] = RightBlackLine[FirstRow];
	}
	else if(FirstRow > CameraHeight - ImageEdge && LastRow >= ImageEdge + 3)	//向下补线检查
	{
		LineRowArray[0] = LastRow;							//从第二段线头处取点进行判断
		LineRowArray[1] = LastRow - 1;
		LineRowArray[2] = LastRow - 2;
		LineRowArray[3] = LastRow - 3;
		LineColArray[0] = RightBlackLine[LastRow];
		LineColArray[1] = RightBlackLine[LastRow - 1];
		LineColArray[2] = RightBlackLine[LastRow - 2];
		LineColArray[3] = RightBlackLine[LastRow - 3];
	}
	else return 0;			//此处则表明图出现了严重错误

	a1 = LeastSquarea1(LineColArray, LineRowArray, BlackSupBack);
	a0 = LeastSquarea0(LineColArray, LineRowArray, a1, BlackSupBack);
	
	for(row = FirstRow - 1; row >= LastRow + 1; row -= 3)					//三点进行一次检测，看线性补线方式是否准确，若偏差过大则补线失败
	{
		temp = a0 + a1 * row;
		diff = AbsNum(RightBlackLine[row] - (uint8)temp);
		if(diff <= BlackSupLimit) 
		{
#ifdef ImagePro_CarUse
			uart_sendN(UART0, (uint8 *)"\nCheck supplement error!\n", 25);
#endif
#ifdef ImagePro_PCUse
			printf("Check supplement error!\n");
#endif			
			return 0;
		}
	}
	*/
	if(fcount >= CameraHeight / 3) return 0;
	return 1;
}

/**************************************************************
Function Name:	RightCrossDetect
Function:				detect the right line cross and solve it
Parameter:			uint8 firstrow, uint8 lastrow
Return:					uint8 bool success or failure
Remark:				This part is totally different from the code of sirius
***************************************************************/
uint8 RightCrossDetect(uint8 FirstRow, uint8 LastRow)
{
	uint8 temp, temp1, temp2;
	uint8 flag = 0;			//补线成功判断位

	temp = RightLineHeadScan(FirstRow, LastRow);		//查找定位区内的线头
	if(temp == NullValue)											//未找到线头，说明出现十字
	{
		flag = RightLineSup(FirstRow, LastRow);
	}
	else
	{
		temp1 = RightLineWin(temp - 1, RightBlackLine[temp]);	//强化延长线头，判断是噪声点还是确实有一段线
		temp2 = RightLineWin(temp - 2, RightBlackLine[temp]);
		if(temp1 && temp2)														//存在连续的至少跨越3行的短线
		{
			temp1 = RightCrossDetect(temp - 2, LastRow);
			temp2 = RightCrossDetect(FirstRow, temp);
			flag = temp1 && temp2;											//两段均正确补线，则补线成功
		}
		else
		{
			ImgNew[temp][RightBlackLine[temp]] = NullValue - 1;				//原图滤波
			ImgNew[temp - 1][RightBlackLine[temp - 1]] = NullValue - 1;
			ImgNew[temp - 2][RightBlackLine[temp - 2]] = NullValue - 1;
			RightBlackLine[temp] = NullValue;								//滤除噪声
			RightBlackLine[temp - 1] = NullValue;
			RightBlackLine[temp - 2] = NullValue;
			flag = RightCrossDetect(FirstRow, LastRow);				//滤除噪声后对这段重新进行十字检测
		}
	}

	if(flag) return 1;
	else return 0;
}

/**************************************************************
Function Name:	RightLineGet
Function:				get right black line
Parameter:			void
Return:					uint8 bool success or failure
Remark:				/
***************************************************************/
uint8 RightLineGet(void)							//获取右黑线
{
	uint8 row, temp;
	uint8 temp1, temp2;
	uint8 flag, flag_t;
	uint8 backsuprow;							//若需要向后补线，记录线头
	uint8 crosssuprow1, crosssuprow2;	//若需要十字补线，记录线头
	uint8 GapCount = 0;							//记录连续未采集到黑线的数目，用于判定Cross
	uint8 RightDirect = 0;						//方向记录
	uint8 Directtemp = 0;					//初始方向计算
	//uint8 changerow = NullValue;			//方向改变行

	backsuprow = NullValue;
	crosssuprow1 = NullValue;
	crosssuprow2 = NullValue;
	temp = RightLineHeadScan(CameraHeight - 1, CameraHeight - BlackSweep_RowEnd - 1);
	if (temp == NullValue)
	{
		for (row = 0; row < CameraHeight; row++) RightBlackLine[row] = NullValue;
		return 0;
	}

	row = temp;
		
	if(RightBlackLine[row] >= RightBlackLine[row - 1]) Directtemp = 0;
	else Directtemp = 1;
	Directright = Directleft;

	if(row < CameraHeight - BlackSweep_CrossLine)
	{
		//RightBlackCross = 1;
		backsuprow = row;
	}

	temp = (RightBlackLine[row] + RightBlackLine[row - 1]) / 2;
	
	for(row -= 2; row > 0; row -= 2)
	{
		temp1 = RightLineWin(row, temp);
		temp2 = RightLineWin(row - 1, temp);
		if(temp1 && temp2)					//连续两行提取成功
		{
			temp = (RightBlackLine[row] + RightBlackLine[row - 1]) / 2;		//调整预测值
			if(RightBlackLine[row] >= RightBlackLine[row - 1]) RightDirect = 0;					//斜率向左
			else RightDirect = 1;											//斜率向右
			if(RightDirect != Directtemp)								//寻线过程中线的方向发生变化
			{
				RightDirectChange = 1;
				//changerow = row + 2;
			}
		}	
			
		else if(!temp1 && temp2)		//避免因预测错误而出现的错误
		{
			temp = (RightBlackLine[row + 1] + RightBlackLine[row - 1]) / 2;
			temp1 = RightLineSweep(row);
			if(temp1)
				temp = (RightBlackLine[row] + RightBlackLine[row - 1]) / 2;
		}
		else if(temp1 && !temp2)
		{
			temp = (RightBlackLine[row + 1] + RightBlackLine[row]) / 2;
			temp2 = RightLineSweep(row - 1);
			if(temp2)
				temp = (RightBlackLine[row] + RightBlackLine[row - 1]) / 2;
		}
		else
		{
			temp1 = RightLineSweep(row);
			temp2 = RightLineSweep(row - 1);
			if(temp1 && temp2)
				temp = (RightBlackLine[row] + RightBlackLine[row - 1]) / 2;
			else if(temp1)
				temp = (RightBlackLine[row + 1] + RightBlackLine[row]) / 2;
			else if(temp2)
				temp = (RightBlackLine[row + 1] + RightBlackLine[row - 1]) / 2;
		
			if(!temp1 && !temp2)
			{
				if (RightBlackLine[row + 1] == NullValue || RightBlackLine[row + 2] == NullValue)
				{
					if(GapCount == 0 /*&& ((RightDirectChange == 0) || (RightDirectChange == 1 && row < BlackSweep_MidLine))*/) 
						crosssuprow1 = row + 3;
					//else if(GapCount == 0 && RightDirectChange == 1) crosssuprow1 = changerow;
					crosssuprow2 = row - 1;
					GapCount += 2;
				}
			}
		}
		if (row == 1) break;
	}

	if(GapCount >= BlackSweep_CrossGap) RightBlackCross = 1;
	if(GapCount > CameraHeight / 2 + 10) return 0;
	
	if(!RightBlackCross && backsuprow == NullValue) flag = 1;
	if(RightBlackCross)
	{
		crosssuprow2 = MaxRe(ImageEdge, crosssuprow2);		//防止出现上限溢出
		if(crosssuprow2 <= ImageEdge + 2)
			flag = RightLineSup(crosssuprow1, ImageEdge - 2);
		else flag = RightCrossDetect(crosssuprow1, crosssuprow2);
	}
	else flag = 1;
	if(backsuprow != NullValue)
	{
		RightBlackCross = 1;
		flag_t = RightLineSup(CameraHeight - ImageEdge + 1, backsuprow);
		if (flag != 0 && flag_t != 0) flag = 1;
		else flag = 0;
	}

	if(flag) RightBlackDone = 1;

	for(row = CameraHeight - MidPronum / 2 - 1; row > MidPronum / 2 - 1; row--)		//中值滤波
		RightBlackLinebak[row] = MidFilter(&RightBlackLine[row - MidPronum / 2]);
	for (row = CameraHeight - MidPronum / 2 - 1; row > MidPronum / 2 - 1; row--)
		RightBlackLine[row] = RightBlackLinebak[row];		//最上面的点不会受滤波影响
	for(row = CameraHeight - MidPronum / 2 - 1; row > MidPronum / 2 - 1; row--)		//均值滤波
		RightBlackLinebak[row] = AverageFilter(&RightBlackLine[row - MidPronum / 2]);
	for (row = CameraHeight - MidPronum / 2 - 1; row > MidPronum / 2 - 1; row--)
		RightBlackLine[row] = RightBlackLinebak[row];
	return RightBlackDone;
}

/**************************************************************
Function Name:	BlackLineGet
Function:				get the black line
Parameter:			void
Return:					uint8 status 	0 both failure, 
												1 left success and right failure
												2 left failure and right success
												3 both success
Remark:				/
***************************************************************/
uint8 BlackLineGet(void)			//黑线提取
{
	WBClear();
	WBDefine();
	LeftBlackDone = LeftLineGet();
	RightBlackDone = RightLineGet();
	if(LeftBlackDone && RightBlackDone) return 3;
	else if(!LeftBlackDone && RightBlackDone)								//左线没找到右线找到了，排除光照因素再次判断
	{
		WBClear();
		LeftBlackDone = LeftLineGet();
		if(!LeftBlackDone)
		{
#ifdef ImagePro_CarUse
			uart_sendN(UART0, (uint8 *)"\nLeft line get fails!\n", 22);
#endif
#ifdef ImagePro_PCUse
			printf("Left line get fails!\n");
#endif
			return 2;
		}
                else return 3;
	}
	else if(!RightBlackDone && LeftBlackDone)								//右线没找到左线找到了，排除光照因素再次判断
	{
		WBClear();
		RightBlackDone = RightLineGet();
		if(!RightBlackDone)
		{
#ifdef ImagePro_CarUse
			uart_sendN(UART0, (uint8 *)"\nRight line get fails 123!\n", 23);
#endif
#ifdef ImagePro_PCUse
			printf("Right line get fails 123!\n");
#endif	
			return 1;
		}
                else return 3;
	}
	else	if(!RightBlackDone && !LeftBlackDone)								//两条线都没找到，排除光照因素再次判断
	{
		WBClear();
		LeftBlackDone = LeftLineGet();
		RightBlackDone = RightLineGet();
		if(!LeftBlackDone && !RightBlackDone)
		{
#ifdef ImagePro_CarUse
			uart_sendN(UART0, (uint8 *)"\nTwo lines get fail!\n", 21);
#endif
#ifdef ImagePro_PCUse
			printf("Two lines get fail!\n");
#endif	
			return 0;
		}
		else if(!RightBlackDone && LeftBlackDone)
		{
#ifdef ImagePro_CarUse
			uart_sendN(UART0, (uint8 *)"\nRight line get fails! 1234\n", 23);
#endif
#ifdef ImagePro_PCUse
			printf("Right line get fails!\n");
#endif	
			return 1;
		}
		else if(!LeftBlackDone && RightBlackDone)
		{
#ifdef ImagePro_CarUse
			uart_sendN(UART0, (uint8 *)"\nLeft line get fails!\n", 22);
#endif
#ifdef ImagePro_PCUse
			printf("Left line get fails!\n");
#endif
			return 2;	
		}
		else	return 3;
	}
#ifdef ImagePro_CarUse
	uart_sendN(UART0, (uint8 *)"\nLine Get ERROR!\n", 17);
#endif
#ifdef ImagePro_PCUse
	printf("Line Get ERROR!\n");
#endif
	return 0;
}

/**************************************************************
Function Name:	MidFilter
Function:				Filter the line to be a smooth one
Parameter:			uint8 x[]
Return:					uint8 mid_x
Remark:				/
***************************************************************/
uint8 MidFilter(uint8 x[])			//中值滤波
{
	uint8 i, j, n;
	uint8 y[MidPronum];
	uint8 temp, temp_n;
	n = 0;
	for(i = 0; i < MidPronum; i++) 
	{
		if(x[i] != NullValue)		//提取有效点
		{
			y[n] = x[i];
			n++;
		}
	}
	if (n <= MidPronum * 3 / 4) return x[MidPronum / 2];		//样本点太少就不滤了
	for(i = 0; i < n; i++)
	{
		temp = i;
		for(j = 0; j <= i; j++)
			if(y[temp] > y[j]) temp = j;			//找到最小值

		temp_n = y[i];
		y[i] = y[temp];
		y[temp] = temp_n;							//最小值交换
	}
	
	return y[n / 2];
}

/**************************************************************
Function Name:	AverageFilter
Function:				Filter the line to be a smooth one
Parameter:			uint8 x[]
Return:					uint8 average_x
Remark:				/
***************************************************************/
uint8 AverageFilter(uint8 x[])	//均值滤波
{
	uint8 i, j, n;
	uint8 y[MidPronum];
	uint8 temp;
	uint32 temp_n;
	n = 0;
	if(x[MidPronum / 2] == NullValue) return NullValue;		//均值点未被中值滤波掉说明附近都是无效点
	for(i = 0; i < MidPronum; i++) 
	{
		if(x[i] != NullValue)		//提取有效点
		{
			y[n] = x[i];
			n++;
		}
	}
	if(n <= MidPronum * 3 / 4) return x[MidPronum / 2];		//样本点太少就不滤了
	temp_n = 0;

	for(i = 0; i < n; i++) temp_n += y[i];		//求和
	temp_n /= n;											//求均值
	
	return (uint8)temp_n;
}

void isCrossFlag(void)
{
  uint8 row;
  uint8 fcount = 0;
  for(row = 0; row < CameraHeight; row++)
    if(LeftBlackLine[row] == NullValue) fcount++;
  if(fcount > CameraHeight / 2 && LeftBlackCross) LeftBlackCross = 1;
  else LeftBlackCross = 0;
  fcount = 0;
  for(row = 0; row < CameraHeight; row++)
    if(RightBlackLine[row] == NullValue) fcount++;
  if(fcount > CameraHeight / 2 && RightBlackCross) RightBlackCross = 1;
  else RightBlackCross = 0;
  
  CrossFlag = LeftBlackCross && RightBlackCross;
}





/**************************************************************
Function Name:	CenterLineGet
Function:				get(generate) the center black line
Parameter:			void
Return:					uint8 bool success or failure
Remark:				/
***************************************************************/
uint8 CenterLineGet(void)					//中心线提取
{
	uint8 flag;						//黑线提取情况读取
	uint8 FailCount;			//无法正确生成中间点的行数计数
	uint8 row;
	uint8 tempL, tempR;		//左右点临时保存
	uint8 tempCenter;		//中心距两侧偏移值

	tempCenter = HalfWidth[0];
	flag = BlackLineGet();
                
	if(flag == 0)								//两条黑线均读取失败
	{
		for(row = CameraHeight - 1; row > 0; row--)
			CenterLine[row] = NullValue;
#ifdef ImagePro_CarUse
		//uart_sendN(UART0, (uint8 *)"\nCenterline get fails!\n", 23);
#endif
#ifdef ImagePro_PCUse
		printf("Centerline get fails!\n");
#endif
		return 0;
	}
	else if(flag == 1 || flag == 2 || flag == 3)
	{
/*
	else if(flag == 1)						//左线成功但右线失败
	{
		FailCount = 0;

		for(row = CameraHeight - 1; row > 0; row--)
		{
			tempL = LeftBlackLine[row];
			if(tempL != NullValue)
			{
				if(row >= CameraHeight - ImageEdge && tempCenter != NullValue)
					CenterLine[row] = BoundLimit(tempL + tempCenter, 0, CameraWidth - 1);
				else if(row < CameraHeight - ImageEdge && CenterLine[row + 1] != NullValue && LeftBlackLine[row + 1] != NullValue)
					CenterLine[row] = BoundLimit(tempL + CenterLine[row + 1] - LeftBlackLine[row + 1], 0, CameraWidth - 1);	
				else
					CenterLine[row] = BoundLimit(tempL + HalfWidth[row], 0, CameraWidth - 1);
			}
			else
			{
				if(row >= CameraHeight - ImageEdge)
					CenterLine[row] = HalfWidth[row];
				else if(row < CameraHeight - ImageEdge && CenterLine[row + 1] != NullValue && CenterLine[row + 2] != NullValue)
					CenterLine[row] = BoundLimit(CenterLine[row + 1] * 2 - CenterLine[row + 2], 0, CameraWidth - 1);
				else
				{
					CenterLine[row] = NullValue;
					FailCount++;
				}
			}

			if(FailCount >= 3 && row >= CameraHeight - 5)						//最初的5个点中有3个点数值有问题(说明线头无法生成)
			{
#ifdef ImagePro_CarUse
				uart_sendN(UART0, (uint8 *)"\nCenterline get fails!\n", 23);
#endif
#ifdef ImagePro_PCUse
				printf("Centerline get fails!\n");
#endif			
				return 0;
			}
		}
	}
	else if(flag == 2)						//右线成功但左线失败
	{
		FailCount = 0;

		for(row = CameraHeight - 1; row > 0; row--)
		{
			tempR = RightBlackLine[row];
			if(tempR != NullValue)
			{
				if(row >= CameraHeight - ImageEdge && tempCenter != NullValue)
					CenterLine[row] = BoundLimit(tempR - tempCenter, 0, CameraWidth - 1);
				else if(row < CameraHeight - ImageEdge && CenterLine[row + 1] != NullValue && RightBlackLine[row + 1] != NullValue)
					CenterLine[row] = BoundLimit(tempR + CenterLine[row + 1] - RightBlackLine[row + 1], 0, CameraWidth - 1);	
				else
					CenterLine[row] = BoundLimit(tempR - HalfWidth[row], 0, CameraWidth - 1);
			}
			else
			{
				if(row >= CameraHeight - ImageEdge)
					CenterLine[row] = HalfWidth[row];
				else if(row < CameraHeight - ImageEdge && CenterLine[row + 1] != NullValue && CenterLine[row + 2] != NullValue)
					CenterLine[row] = BoundLimit(CenterLine[row + 1] * 2 - CenterLine[row + 2], 0, CameraWidth - 1);
				else
				{
					CenterLine[row] = NullValue;
					FailCount++;
				}
			}

			if(FailCount >= 3 && row >= CameraHeight - 5)						//最初的5个点中有3个点数值有问题(说明线头无法生成)
			{
#ifdef ImagePro_CarUse
				uart_sendN(UART0, (uint8 *)"\nCenterline get fails!\n", 23);
#endif
#ifdef ImagePro_PCUse
				printf("Centerline get fails!\n");
#endif			
				return 0;
			}
		}
	}
	else if(flag == 3)						//两条线都成功
	{
	*/

		FailCount = 0;
		for(row = CameraHeight - 1; row > 0; row--)			//这里先不检查中心线数据的有效性以更加准确的进行预测
		{
			tempL = LeftBlackLine[row];
			tempR = RightBlackLine[row];
			if(tempL != NullValue && tempR != NullValue)
			{
				if(tempL < tempR) CenterLine[row] = (tempL + tempR) / 2;
				if(row >= CameraHeight - ImageEdge)
					tempCenter = CenterLine[row] - tempL;	//中心点矫正记录，若接下来出现有一侧线未找到的情况时启用
																					// CenterLine[row] - tempL == tempR - CenterLine[row]
			}
			else if(tempL == NullValue && tempR != NullValue)
			{
				if(row < CameraHeight - ImageEdge && CenterLine[row + 1] != NullValue && RightBlackLine[row + 1] != NullValue)
					CenterLine[row] = tempR - RightBlackLine[row + 1] + CenterLine[row + 1];
				else
					//CenterLine[row] = tempR - HalfWidth[row];
                                        CenterLine[row] = tempR / 2;
			}
			else if(tempL != NullValue && tempR == NullValue)
			{
				if(row < CameraHeight - ImageEdge && CenterLine[row + 1] != NullValue && LeftBlackLine[row + 1] != NullValue)
					CenterLine[row] = tempL + CenterLine[row + 1] - LeftBlackLine[row + 1];
				else
					//CenterLine[row] = tempL + HalfWidth[row];
                                        CenterLine[row] = tempL + (CameraWidth - tempL) / 2;
			}
			else
			{
				if(row < CameraHeight - ImageEdge && CenterLine[row + 2] != NullValue && CenterLine[row + 1] != NullValue)
					CenterLine[row] = 2 * CenterLine[row + 1] - CenterLine[row + 2];
				else
				{
					if(row >= CameraHeight - ImageEdge)
						CenterLine[row] = 70;
					else
					{
						CenterLine[row] = NullValue;
						FailCount++;
					}
				}
			}

			if(FailCount >= 3 && row >= CameraHeight - 5)						//最初的5个点中有3个点数值有问题(说明线头无法生成)
			{
#ifdef ImagePro_CarUse
				//uart_sendN(UART0, (uint8 *)"\nCenterline get fails!\n", 23);
#endif
#ifdef ImagePro_PCUse
				printf("Centerline get fails!\n");
#endif			
				return 0;
			}
		}
	}
	else
	{
#ifdef ImagePro_CarUse
		uart_sendN(UART0, (uint8 *)"\nCenterLine Get ERROR!\n", 23);
#endif
#ifdef ImagePro_PCUse
		printf("CenterLine Get ERROR!\n");
#endif
		return 0;
	}

	uint8 judgerow;		//用于判断十字奇怪图像的判别

	/*if (!LeftBlackDone && RightDirectChange)
	{
		if (!Directright)			//方向向左或垂直
		{
			for(row = CameraHeight - 1; row > 0; row--)
				if (CenterLine[row] != NullValue && CenterLine[row - 1] != NullValue)
					if (CenterLine[row] > CenterLine[row - 1])
						judgerow = row - 1;
					else
					{
						CenterLine[row] = NullValue;
						CenterLine[row - 1] = NullValue;
					}
				else
				{
					if (CenterLine[row] != NullValue && CenterLine[row] < CenterLine[judgerow])
						judgerow = row;
					else if (CenterLine[row - 1] != NullValue && CenterLine[row - 1] < CenterLine[judgerow])
						judgerow = row - 1;
					else
					{
						CenterLine[row] = NullValue;
						CenterLine[row - 1] = NullValue;
					}
				}
		}
		else						//方向向右
		{
			for (row = CameraHeight - 1; row > 0; row--)
			if (CenterLine[row] != NullValue && CenterLine[row - 1] != NullValue)
			if (CenterLine[row] < CenterLine[row - 1])
				judgerow = row - 1;
			else
			{
				CenterLine[row] = NullValue;
				CenterLine[row - 1] = NullValue;
			}
			else
			{
				if (CenterLine[row] != NullValue && CenterLine[row] > CenterLine[judgerow])
					judgerow = row;
				else if (CenterLine[row - 1] != NullValue && CenterLine[row - 1] > CenterLine[judgerow])
					judgerow = row - 1;
				else
				{
					CenterLine[row] = NullValue;
					CenterLine[row - 1] = NullValue;
				}
			}
		}
	}
	else if (!RightBlackDone && LeftDirectChange)
	{
		if (!Directleft)			//方向向左或垂直
		{
			for (row = CameraHeight - 1; row > 0; row--)
			if (CenterLine[row] != NullValue && CenterLine[row - 1] != NullValue)
			if (CenterLine[row] > CenterLine[row - 1])
				judgerow = row - 1;
			else
			{
				CenterLine[row] = NullValue;
				CenterLine[row - 1] = NullValue;
			}
			else
			{
				if (CenterLine[row] != NullValue && CenterLine[row] < CenterLine[judgerow])
					judgerow = row;
				else if (CenterLine[row - 1] != NullValue && CenterLine[row - 1] < CenterLine[judgerow])
					judgerow = row - 1;
				else
				{
					CenterLine[row] = NullValue;
					CenterLine[row - 1] = NullValue;
				}
			}
		}
		else						//方向向右
		{
			for (row = CameraHeight - 1; row > 0; row--)
			if (CenterLine[row] != NullValue && CenterLine[row - 1] != NullValue)
			if (CenterLine[row] < CenterLine[row - 1])
				judgerow = row - 1;
			else
			{
				CenterLine[row] = NullValue;
				CenterLine[row - 1] = NullValue;
			}
			else
			{
				if (CenterLine[row] != NullValue && CenterLine[row] > CenterLine[judgerow])
					judgerow = row;
				else if (CenterLine[row - 1] != NullValue && CenterLine[row - 1] > CenterLine[judgerow])
					judgerow = row - 1;
				else
				{
					CenterLine[row] = NullValue;
					CenterLine[row - 1] = NullValue;
				}
			}
		}
	}*/

	for(row = 0; row < CameraHeight; row++)					//检查中心线数据有效性
		CenterLine[row] = BoundLimit(CenterLine[row], 0, CameraWidth - 1);

	for(row = CameraHeight - MidPronum / 2 - 1; row > MidPronum / 2 - 1; row--)		//中值滤波
		CenterLinebak[row] = MidFilter(&CenterLine[row - MidPronum / 2]);
	for (row = CameraHeight - MidPronum / 2 - 1; row > MidPronum / 2 - 1; row--)
		CenterLine[row] = CenterLinebak[row];		//最上面的点不会受滤波影响
        
	for(row = CameraHeight - 2; row > 0; row--)				//检查中心线连续性
	{
		if(CenterLine[row] != NullValue && CenterLine[row + 1] != NullValue)
		{
			if(AbsNum(CenterLine[row] - CenterLine[row + 1]) <= BlackSweep_Cont) continue;
			else
			{
                                uint8 rowtemp;
                                for(rowtemp = row - 1; rowtemp > 0; rowtemp--)
                                  CenterLine[rowtemp] = BoundLimit(CenterLine[rowtemp] - CenterLine[row] + CenterLine[row + 1], 0, CameraWidth - 1);
				FailCount++;
				CenterLine[row] = NullValue;
			}
			//这里应该可以继续优化算法来纠正错误-by_mxl
		}
        if(CenterLine[row + 2] != NullValue)
        {
			if(CenterLine[row] != NullValue && AbsNum(CenterLine[row] - CenterLine[row + 2]) <= BlackSweep_Cont * 2) continue;
            if(CenterLine[row + 1] != NullValue && AbsNum(CenterLine[row + 1] - CenterLine[row + 2]) <= BlackSweep_Cont) continue;
            else
            {
		CenterLine[row] = NullValue;
                CenterLine[row + 1] = NullValue;
                FailCount++;
                FailCount++;
            }
        }
	}

	if(FailCount >= CameraHeight - 15)			//错误点数过多
	{
#ifdef ImagePro_CarUse
		uart_sendN(UART0, (uint8 *)"\nCenterline get fails!\n", 23);
#endif
#ifdef ImagePro_PCUse
		printf("Centerline get fails!\n");
#endif			
		return 0;
	}

	
	for(row = CameraHeight - MidPronum / 2 - 1; row > MidPronum / 2 - 1; row--)		//中值滤波
		CenterLinebak[row] = MidFilter(&CenterLine[row - MidPronum / 2]);
	for (row = CameraHeight - MidPronum / 2 - 1; row > MidPronum / 2 - 1; row--)
		CenterLine[row] = CenterLinebak[row];		//最上面的点不会受滤波影响
	for(row = CameraHeight - MidPronum / 2 - 1; row > MidPronum / 2 - 1; row--)		//均值滤波
		CenterLinebak[row] = AverageFilter(&CenterLine[row - MidPronum / 2]);
	for (row = CameraHeight - MidPronum / 2 - 1; row > MidPronum / 2 - 1; row--)
		CenterLine[row] = CenterLinebak[row];		//最上面的点不会受滤波影响

	return 1;
}

/**************************************************************
Function Name:	CurveSignGet
Function:				calculate the sign of SABC
Parameter:			void
Return:					uint8 Curve
Remark:				/
***************************************************************/
//曲率符号求取
//影响：CurveSL, CurveSC, CurveSR, 0无效，1正，2负
//SABCL, SABCC, SABCR
uint8 CurveSignGet(void)
{
	uint8 row;
	uint8 temp;
  
	//1. 中心线曲率符号求取
	//曲率符号预先清零
	CurveLineChosenC1 = NullValue;
	CurveLineChosenC2 = NullValue;
	CurveLineChosenC3 = NullValue;
  
	//曲率基于的行3 CurveLineChosen3，从下到上取第一个有效值
	for(row = CameraHeight - 10; ; row--)
	{
		if(row <= ImageEdge) { CurveLineChosenC3 = NullValue; return 0;}
		if(CenterLine[row] != NullValue) { CurveLineChosenC3 = row; break;}
	}

	//把第1个有效值到0的距离分成2段
	temp = row * 5 / 8;
	if(temp <= ImageEdge) { CurveLineChosenC3 = NullValue; return 0;}
  
	//曲率基于的行2 CurveLineChosen2
	for(row = temp; ; row--)
	{
		if(row <= ImageEdge) 
		{
			CurveLineChosenC3 = NullValue;
			CurveLineChosenC2 = NullValue;
			return 0;
		}
		if(CenterLine[row] != NullValue) { CurveLineChosenC2 = row; break;}
	}
  
	//把第2个有效值到0的距离分成2段
	temp = row * 5 / 8;
	if(temp <= ImageEdge)
	{
		CurveLineChosenC3 = NullValue; 
		CurveLineChosenC2 = NullValue;
		return 0;
	}

	//曲率基于的行1 CurveLineChosen1
	for(row = temp; ; row--)
	{
		if(row <= ImageEdge) 
		{
			CurveLineChosenC3 = NullValue;
			CurveLineChosenC2 = NullValue;
			CurveLineChosenC1 = NullValue;
			return 0;
		}
		if(CenterLine[row] != NullValue) { CurveLineChosenC1 = row; break;}
	} 
		//SABCC中心线曲率三角形面积的求取
		//SABCC = SABCGet(CenterLine[CurveLineChosenC1], CameraHeight - 1 - CurveLineChosenC1,
		//                CenterLine[CurveLineChosenC2], CameraHeight - 1 - CurveLineChosenC2,
		//                CenterLine[CurveLineChosenC3], CameraHeight - 1 - CurveLineChosenC3
		//                );
	CURVEC = CurveGet(CenterLine[CurveLineChosenC1], CameraHeight - 1 - CurveLineChosenC1,
									CenterLine[CurveLineChosenC2], CameraHeight - 1 - CurveLineChosenC2,
									CenterLine[CurveLineChosenC3], CameraHeight - 1 - CurveLineChosenC3);    
  
  
  //左右黑线有可能只有一边提取成功，若不成功，就不用费时间了。
	if(LeftBlackDone == 1)
	{
		//2. 左黑线曲率符号求取
		//曲率符号预先清零。
		CurveLineChosenL1 = NullValue;
		CurveLineChosenL2 = NullValue;
		CurveLineChosenL3 = NullValue;
    
		//曲率基于的行3 CurveLineChosen3，从下到上取第一个有效值
		for(row = CameraHeight - 10; ; row--)
		{
			if(row <= ImageEdge) { CurveLineChosenL3 = NullValue; return 0;}
			if(LeftBlackLine[row] != NullValue) { CurveLineChosenL3 = row; break;}   
		}

		//把第1个有效值到0的距离分成2段
		temp = row * 5 / 8;
		if(temp <= ImageEdge) { CurveLineChosenL3 = NullValue; return 0;}
    
		//曲率基于的行2 CurveLineChosen2
		for(row = temp; ; row--)
		{
			if(row <= ImageEdge) 
			{
				CurveLineChosenL3 = NullValue;
				CurveLineChosenL2 = NullValue;
				return 0;
			}
			if(LeftBlackLine[row] != NullValue) { CurveLineChosenL2 = row; break;}
		}
    
		//把第2个有效值到0的距离分成2段
		temp = row * 5 / 8;
		if(temp <= ImageEdge)
		{
			CurveLineChosenL3 = NullValue;
			CurveLineChosenL2 = NullValue;
			return 0;
		}
		//曲率基于的行1 CurveLineChosen1
		for(row = temp; ; row--)
		{
			if(row <= ImageEdge) 
			{
				CurveLineChosenL3 = NullValue;
				CurveLineChosenL2 = NullValue;
				CurveLineChosenL1 = NullValue;
				return 0;
			}
			if(LeftBlackLine[row] != NullValue) { CurveLineChosenL1 = row; break;}
		}      
		//SABCL左黑线曲率三角形面积的求取
		//SABCL = SABCGet(LeftBlackLine[CurveLineChosenL1], CameraHeight - 1 - CurveLineChosenL1,
		//               LeftBlackLine[CurveLineChosenL2], CameraHeight - 1 - CurveLineChosenL2,
		//               LeftBlackLine[CurveLineChosenL3], CameraHeight - 1 - CurveLineChosenL3
		//               );
		CURVEL = CurveGet(LeftBlackLine[CurveLineChosenL1], CameraHeight - 1 - CurveLineChosenL1,
										LeftBlackLine[CurveLineChosenL2], CameraHeight - 1 - CurveLineChosenL2,
										LeftBlackLine[CurveLineChosenL3], CameraHeight - 1 - CurveLineChosenL3);    
	}
 
	//左右黑线有可能只有一边提取成功，若不成功，就不用费时间了
	if(RightBlackDone == 1)
	{
		//3. 右黑线曲率符号求取
		//曲率符号预先清零
		CurveLineChosenR1 = NullValue;
		CurveLineChosenR2 = NullValue;
		CurveLineChosenR3 = NullValue;
    
		//曲率基于的行3 CurveLineChosen3，从下到上取第一个有效值
		for(row = CameraHeight - 10; ; row--)
		{
			if(row <= ImageEdge) { CurveLineChosenR3 = NullValue; return 0;}
			if(RightBlackLine[row] != NullValue) {CurveLineChosenR3 = row; break;}   
		}
		//把第1个有效值到0的距离分成2段
		temp = row * 5 / 8;
		if(temp <= ImageEdge) { CurveLineChosenR3 = NullValue; return 0;}
    
		//曲率基于的行2 CurveLineChosen2
		for(row = temp; ; row--)
		{
			if(row <= ImageEdge) 
			{
				CurveLineChosenR3 = NullValue;
				CurveLineChosenR2 = NullValue;
				return 0;
			}
			if(RightBlackLine[row] != NullValue) { CurveLineChosenR2 = row; break;}
		}
		//把第2个有效值到0的距离分成2段    
		temp = row * 5 / 8;
		//曲率基于的行1 CurveLineChosen1
		for(row = temp; ; row--)
		{
			if(row <= ImageEdge) 
			{
				CurveLineChosenR3 = NullValue;
				CurveLineChosenR2 = NullValue;
				CurveLineChosenR1 = NullValue;
				return 0;
			}
			if(RightBlackLine[row] != NullValue) { CurveLineChosenR1 = row; break;}
		}   
		//SABCR右黑线曲率三角形面积的求取
		//SABCR = SABCGet(RightBlackLine[CurveLineChosenR1], CameraHeight - 1 - CurveLineChosenR1, 
		//               RightBlackLine[CurveLineChosenR2], CameraHeight - 1 - CurveLineChosenR2, 
		//                RightBlackLine[CurveLineChosenR3], CameraHeight - 1 - CurveLineChosenR3
		//                );
		CURVER = CurveGet(RightBlackLine[CurveLineChosenR1], CameraHeight - 1 - CurveLineChosenR1, 
										RightBlackLine[CurveLineChosenR2], CameraHeight - 1 - CurveLineChosenR2, 
										RightBlackLine[CurveLineChosenR3], CameraHeight - 1 - CurveLineChosenR3);
     
  }
  
	return 1;
}

/**************************************************************
Function Name:	PathJudge
Function:				judge the Directflagion
Parameter:			void
Return:					void(uint8 Directflag)
Remark:				Directflag = 0 unknown
							Directflag = 1 straight
							Directflag = 2 left-mid
							Directflag = 3 right-mid
							Directflag = 4 left-near
							Directflag = 5 left-far
							Directflag = 6 right-near
							Directflag = 7 right-far
***************************************************************/
void PathJudge(void)
{
	Directflag = 0;					 //赛道类型Directflag: 0未知 1直道 2左中 3右中 4左内 5左外 6右内 7右外
  
	if(CurveSignGet())			//曲率符号获取成功
	{
		if(LeftBlackDone == 1 && RightBlackDone == 1)    		//左右黑线均提取成功的情况
		{ 
			if(CURVEL < 0 && CURVEC < 0 && CURVER < 0)			//全部逆时针为左弯，小车走在左弯道较为中心的情况
				Directflag = 2;
			else if(CURVEL > 0 && CURVEC > 0 && CURVER > 0)	//全部顺时针为右弯，小车走在右弯道较为中心的情况
				Directflag = 3;
			else
			{
				if((AbsNum(CURVEL) < PathStraightLimitL)
					&&(AbsNum(CURVEC) < PathStraightLimitC)
					&&(AbsNum(CURVER) < PathStraightLimitR))		//均小于阈值为直道
					Directflag = 1;  
				else																			//未知赛道类型
					Directflag = 0; 
			}
		}
		else if(LeftBlackDone == 0 && RightBlackDone == 1)			//左黑线提取失败，右黑线提取成功的情况
		{
			if(CURVEC < 0 && CURVER < 0)									//左弯道外道
				Directflag = 5;
			else if(CURVEC > 0 && CURVER > 0)							//右弯道内道
				Directflag = 6;
			else if((AbsNum(CURVEC) < PathStraightLimitC)
						&&(AbsNum(CURVER) < PathStraightLimitR))	//均小于阈值为直道
				Directflag = 1;  
			else																				//未知赛道类型
				Directflag = 0;
		}
		else if(LeftBlackDone == 1 && RightBlackDone == 0)		//右黑线提取失败，左黑线提取成功的情况
		{
			if(CURVEC < 0 && CURVEL < 0)								//左弯道内道
				Directflag = 4;
			else if(CURVEC > 0 && CURVEL > 0)						//右弯道外道
				Directflag = 7;
			else if((AbsNum(CURVEC) < PathStraightLimitC)
						&&(AbsNum(CURVEL) < PathStraightLimitL))	//均小于阈值为直道
				Directflag = 1;
			else																			//未知赛道类型
				Directflag = 0; 
		}

#ifdef ImagePro_PCUse
		printf("%d\n", Directflag);												//显示赛道类型
#endif
	}
	else				//曲率符号获取失败
		Directflag = 0;
}

//数据端口
void ImagePut(void);				//导入图片
uint8 ImagePro(void);				//输出处理结果

/**************************************************************
Function Name:	ImagePut
Function:				input interface
Parameter:			void
Return:					void
Remark:				This part need to discuss about the real location in the whole pic
***************************************************************/
void ImagePut(void)
{
	uint8 row;
	uint8 col;
#ifdef ImagePro_CarUse
	for(row = 0; row < CameraHeight; row++)
	{
		for(col = 0; col < CameraWidth; col++)
                  if(ADdata[row][col] != NullValue)
			ImgNew[row][col] = ADdata[row][col];		//ImgRaw外部定义，定义为从摄像头原始采集到的图像
                  else ImgNew[row][col] = ADdata[row][col] - 1;
	}
#endif
}

/**************************************************************
Function Name:	ImagePro
Function:				output interface
Parameter:			void
Return:					uint8 bool success or failure
Remark:				/
***************************************************************/
uint8 ImagePro(void)
{
	ImagePut();
	CenterLineDone = CenterLineGet();
        isCrossFlag();
	if(CenterLineDone)
	{
		//PathJudge();
#ifdef ImagePro_PCUse
		
		for (int i = 0; i < CameraHeight; i++)
		{
			if(LeftBlackLine[i] != NullValue || RightBlackLine[i] != NullValue)
			{
				if(LeftBlackLine[i] != NullValue && RightBlackLine[i] != NullValue)
				{
					for (int j = 0; j < LeftBlackLine[i]; j++) ImgNew[i][j] = 0;
					for (int j = LeftBlackLine[i]; j < RightBlackLine[i]; j++) ImgNew[i][j] = 254;
					for (int j = CameraWidth - 1; j > RightBlackLine[i]; j--) ImgNew[i][j] = 0;
				}
				else if (LeftBlackLine[i] != NullValue && RightBlackLine[i] == NullValue)
				{
					for(int j = 0; j <= LeftBlackLine[i]; j++) ImgNew[i][j] = 0;
					for(int j = CameraWidth - 1; j > LeftBlackLine[i]; j--) ImgNew[i][j] = 254;
				}
				else if(LeftBlackLine[i] == NullValue && RightBlackLine[i] != NullValue)
				{
					for(int j = CameraWidth - 1; j > RightBlackLine[i]; j--) ImgNew[i][j] = 0;
					for(int j = 0; j <= RightBlackLine[i]; j++) ImgNew[i][j] = 254;
				}
			}
			else
			{	
				for (int j = 0; j < CameraWidth; j++)
					ImgNew[i][j] = 254;
			}
			if(CenterLine[i] != NullValue) ImgNew[i][CenterLine[i]] = 0;
		//	printf("%d\t", LeftBlackLine[i]);
		//	printf("%d\t", CenterLine[i]);
		//	printf("%d", RightBlackLine[i]);
		//	printf("\n");
		}
		
#endif
		return 1;
	}
	return 0;
}

