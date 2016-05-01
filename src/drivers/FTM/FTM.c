/******************** (C) COPYRIGHT 2011 蓝宙电子工作室 ********************
 * 文件名       ：FTM.c
 * 描述         ：FTM定时器，目前有 PWM、输入捕捉功能
 *
 * 实验平台     ：
 * 库版本       ：
 * 嵌入系统     ：
 *
 * 作者         ：蓝宙电子工作室
 * 淘宝店       ：http://landzo.taobao.com/
**********************************************************************************/

#include "common.h"
#include  "FTM.h"
//#include "include.h"

/*********** FTMn_CHn PWM输出初始化函数 ***********/
/*
        --FTM0--  --FTM1--  --FTM2--
CH0       PTC1      PTA8      PTA10
CH1       PTC2      PTA9      PTA11
CH2       PTC3       ×         ×
CH3       PTC4       ×         ×
CH4       PTD4       ×         ×
CH5       PTD5       ×         ×
CH6       PTD6       ×         ×
CH7       PTD7       ×         ×

×表示没有
*/
volatile struct FTM_MemMap *FTMx[3] = {FTM0_BASE_PTR, FTM1_BASE_PTR, FTM2_BASE_PTR}; //定义三个指针数组保存 FTMn 的地址




/*************************************************************************
*                            蓝宙电子工作室
*
*  函数名称：FTM_PWM_init
*  功能说明：初始化FTM的PWM功能并设置频率、占空比。设置通道输出占空比。
*  参数说明：FTMn        模块号（FTM0、  FTM1、  FTM2）
*            CHn         通道号（CH0~CH7）
*            freq        频率（单位为Hz）
*            duty        占空比
*  函数返回：无
*  修改时间：2012-2-14
*  备    注：同一个FTM，各通道的PWM频率是一样的，共3个FTM，即可以输出3个不同频率PWM
*************************************************************************/
void FTM_PWM_init(FTMn ftmn, CHn ch, u32 freq, u32 duty)
{
    u32 clk_hz = (bus_clk_khz * 1000) >> 1;       //bus频率/2  bus_clk_khz = 50000
    u16 mod;
    u8 sc_ps;
    u16 cv;

    ASSERT( (ftmn == FTM0) || ( (ftmn == FTM1 || ftmn == FTM2 ) && (ch <= CH1))   ); //检查传递进来的通道是否正确
    ASSERT( freq <= (clk_hz >> 1) );              //用断言检测 频率 是否正常 ,频率必须小于时钟二分之一

    /*       计算分频因子       */
    mod = (clk_hz >> 16 ) / freq ;
    for(sc_ps = 0; (mod >> sc_ps) >= 1; sc_ps++);
    if(freq < 1000)sc_ps++;
    
    mod = (clk_hz >> sc_ps) / freq;                        //频率设置因子,clk_hz = 25000000
    /* 
    uart_putchar(UART0,mod>>24); 
    uart_putchar(UART0,mod>>16); 
    uart_putchar(UART0,mod>>8); 
    uart_putchar(UART0,mod>>0); */
   
    cv = (duty * (mod - 0 + 1)) / FTM_PRECISON;            //占空比设置因子

    /******************* 开启时钟 和 复用IO口*******************/
    //注，这里代码虽然长，但编译时会删掉很多没用的部分，不影响速度
    switch(ftmn)
    {
    case FTM0:
        SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;                           //使能FTM0时钟
        switch(ch)
        {
        case CH0:
            if(FTM0_CH0 == PTC1)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
                PORT_PCR_REG(PORTC_BASE_PTR, 1) = PORT_PCR_MUX(4);  // PTC1
            }
            else if(FTM0_CH0 == PTA3)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 3) = PORT_PCR_MUX(3);  // PTA3
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH1:
            if(FTM0_CH1 == PTC2)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
                PORT_PCR_REG(PORTC_BASE_PTR, 2) = PORT_PCR_MUX(4);  // PTC2
            }
            else if(FTM0_CH1 == PTA4)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 4) = PORT_PCR_MUX(3);  // PTA4
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH2:
            if(FTM0_CH2 == PTC3)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
                PORT_PCR_REG(PORTC_BASE_PTR, 3) = PORT_PCR_MUX(4);  // PTC3
            }
            else if(FTM0_CH2 == PTA5)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 5) = PORT_PCR_MUX(3);  // PTA5
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH3:
            if(FTM0_CH3 == PTC4)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
                PORT_PCR_REG(PORTC_BASE_PTR, 4) = PORT_PCR_MUX(4);  // PTC4
            }
            else if(FTM0_CH3 == PTA6)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 6) = PORT_PCR_MUX(3);  // PTA6
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH4:
            if(FTM0_CH4 == PTD4)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
                PORT_PCR_REG(PORTD_BASE_PTR, 4) = PORT_PCR_MUX(4);  // PTD4
            }
            else if(FTM0_CH4 == PTA7)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 7) = PORT_PCR_MUX(3);  // PTA7
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH5:
            if(FTM0_CH5 == PTD5)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
                PORT_PCR_REG(PORTD_BASE_PTR, 5) = PORT_PCR_MUX(4);  // PTD5
            }
            else if(FTM0_CH5 == PTA0)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 0) = PORT_PCR_MUX(3);  // PTA0
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH6:
            if(FTM0_CH6 == PTD6)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
                PORT_PCR_REG(PORTD_BASE_PTR, 6) = PORT_PCR_MUX(4);  // PTD6
            }
            else if(FTM0_CH6 == PTA1)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 1) = PORT_PCR_MUX(3);  // PTA1
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH7:
            if(FTM0_CH7 == PTD7)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
                PORT_PCR_REG(PORTD_BASE_PTR, 7) = PORT_PCR_MUX(4);  // PTD7
            }
            else if(FTM0_CH7 == PTA2)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 2) = PORT_PCR_MUX(3);  // PTA2
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;
        default:
            return;
        }
        break;

    case FTM1:
        SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;                           //使能FTM1时钟
        switch(ch)
        {
        case CH0:
            if(FTM1_CH0 == PTA8)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 8) = PORT_PCR_MUX(3);  // PTA8
            }
            else if(FTM1_CH0 == PTA12)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 12) = PORT_PCR_MUX(3);  // PTA12
            }
            else if(FTM1_CH0 == PTB0)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
                PORT_PCR_REG(PORTB_BASE_PTR, 0) = PORT_PCR_MUX(3);  // PTB0
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;


        case CH1:
            if(FTM1_CH1 == PTA9)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 9) = PORT_PCR_MUX(3);  // PTA9
            }
            else if(FTM1_CH1 == PTA13)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 13) = PORT_PCR_MUX(3);  // PTA13
            }
            else if(FTM1_CH1 == PTB1)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
                PORT_PCR_REG(PORTB_BASE_PTR, 1) = PORT_PCR_MUX(3);  // PTB1
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        default:
            return;
        }
        break;
    case FTM2:
        SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                           //使能FTM2时钟
        switch(ch)
        {
        case CH0:
            if(FTM2_CH0 == PTA10)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 10) = PORT_PCR_MUX(3);  // PTA10
            }
            else if(FTM2_CH0 == PTB18)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 18) = PORT_PCR_MUX(3);  // PTB18
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH1:
            if(FTM2_CH1 == PTA11)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 11) = PORT_PCR_MUX(3);  // PTA11
            }
            else if(FTM2_CH1 == PTB19)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 19) = PORT_PCR_MUX(3);  // PTB19
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        default:
            return;
        }
        break;
    default:
        break;
    }
    /******************** 选择输出模式为 边沿对齐PWM *******************/
    //通道状态控制，根据模式来选择 边沿或电平
    FTM_CnSC_REG(FTMx[ftmn], ch) &= ~FTM_CnSC_ELSA_MASK;
    FTM_CnSC_REG(FTMx[ftmn], ch) = FTM_CnSC_MSB_MASK | FTM_CnSC_ELSB_MASK;
    //MSnB:MSnA = 1x
    // ELSnB:ELSnA = 10   High-true pulses  (clear Output on match)
    // ELSnB:ELSnA = 11   Low-true pulses   (set Output on match)
    // Edge-aligned PWM  边沿对齐PWM波   《k16 reference manual.pdf》  P944  或者  《K60P144M100SF2RM.pdf》P1001


    /******************** 配置时钟和分频 ********************/
    FTM_SC_REG(FTMx[ftmn])    = FTM_SC_CPWMS_MASK | FTM_SC_PS(sc_ps) | FTM_SC_CLKS(1);  //没有使能溢出中断
    FTM_CNTIN_REG(FTMx[ftmn]) = 0;                                                      // Channel (n) Value  。设置脉冲宽度：(CnV - CNTIN).
    FTM_MOD_REG(FTMx[ftmn])   = mod;                                                    //Modulo value模数, EPWM的周期为 ：MOD - CNTIN + 0x0001
    FTM_CNTIN_REG(FTMx[ftmn]) = 0;                                                      //Counter Initial Value 计数器初始化值
    FTM_CnV_REG(FTMx[ftmn], ch) = cv;
    FTM_CNT_REG(FTMx[ftmn])   = 0;                                                      //计数器。只有低16位可用

}




/*************************************************************************
*                            蓝宙电子工作室
*
*  函数名称：FTM_PWM_Duty
*  功能说明：设置通道占空比
*  参数说明：FTMn        模块号（FTM0、  FTM1、  FTM2）
*            CHn         通道号（CH0~CH7）
*            duty        占空比
*  函数返回：无
*  修改时间：2012-2-14
*  备    注：
*************************************************************************/
void FTM_PWM_Duty(FTMn ftmn, CHn ch, u32 duty)
{
    u32 cv;
    u32 mod;

    ASSERT( (ftmn == FTM0) || ( (ftmn == FTM1 || ftmn == FTM2 ) && (ch <= CH1)) ); //检查传递进来的通道是否正确
    ASSERT(duty <= FTM_PRECISON);     //用断言检测 占空比是否合理

    //占空比 = (CnV-CNTIN)/(MOD-CNTIN+1)
    mod = FTM_MOD_REG(FTMx[ftmn]);        //读取 MOD 的值

    cv = (duty * (mod - 0 + 1)) / FTM_PRECISON;

    // 配置FTM通道值
    FTM_CnV_REG(FTMx[ftmn], ch) = cv;

}


/*************************************************************************
*                            蓝宙电子工作室
*
*  函数名称：FTM_PWM_freq
*  功能说明：设置FTM的频率
*  参数说明：FTMn        模块号（FTM0、  FTM1、  FTM2）
*            freq        频率（单位为Hz）
*  函数返回：无
*  修改时间：2012-2-14
*  备    注：同一个FTM，各通道的PWM频率是一样的，共3个FTM，即可以输出3个不同频率PWM
*************************************************************************/
void FTM_PWM_freq(FTMn ftmn, u32 freq)             //设置FTM的频率
{
    u32 clk_hz = (bus_clk_khz * 1000) >> 1;        //bus频率/2
    u32 mod;
    u8 sc_ps;


    ASSERT( freq <= (clk_hz >> 1) );              //用断言检测 频率 是否正常 ,频率必须小于时钟二分之一

    /*       计算频率设置        */
    mod = (clk_hz >> 16 ) / freq ;
    for(sc_ps = 0; (mod >> sc_ps) >= 1; sc_ps++);
    mod = (clk_hz >> sc_ps) / freq;


    /******************** 配置时钟和分频 ********************/
    FTM_SC_REG(FTMx[ftmn])    = FTM_SC_CPWMS_MASK | FTM_SC_PS(sc_ps) | FTM_SC_CLKS(1);  //没有使能溢出中断
    FTM_CNTIN_REG(FTMx[ftmn]) = 0;                                                      // Channel (n) Value  。设置脉冲宽度：(CnV - CNTIN).
    FTM_MOD_REG(FTMx[ftmn])   = mod;                                                    //Modulo value模数, EPWM的周期为 ：MOD - CNTIN + 0x0001
    FTM_CNTIN_REG(FTMx[ftmn]) = 0;                                                      //Counter Initial Value 计数器初始化值
    FTM_CNT_REG(FTMx[ftmn])   = 0;                                                      //计数器。只有低16位可用
}




//////////////////////////////// 以上为输出PWM  //////////////////////////////////////////

//////////////////////////////// 以下为输入捕捉 //////////////////////////////////////////

/*************************************************************************
*                            蓝宙电子工作室
*
*  函数名称：FTM_Input_init
*  功能说明：输入捕捉初始化函数
*  参数说明：FTMn        模块号（FTM0、  FTM1、  FTM2）
*            CHn         通道号（CH0~CH7）
*            Input_cfg   输入捕捉配置（Rising、Falling、Rising_or_Falling）上升沿捕捉、下降沿捕捉、跳变沿捕捉
*  函数返回：无
*  修改时间：2012-1-26
*  备    注：CH0~CH3可以使用过滤器，未添加这功能
*************************************************************************/
void FTM_Input_init(FTMn ftmn, CHn ch, Input_cfg cfg)
{
    ASSERT( (ftmn == FTM0) || ( (ftmn == FTM1 || ftmn == FTM2 ) && (ch <= CH1)) ); //检查传递进来的通道是否正确

    /******************* 开启时钟 和 复用IO口*******************/
    //注，这里代码虽然长，但真正执行的就几条语句
    switch(ftmn)
    {
    case FTM0:
        SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;                           //使能FTM0时钟
        switch(ch)
        {
        case CH0:
            if(FTM0_CH0 == PTC1)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
                PORT_PCR_REG(PORTC_BASE_PTR, 1) = PORT_PCR_MUX(4);  // PTC1
            }
            else if(FTM0_CH0 == PTA3)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 3) = PORT_PCR_MUX(3);  // PTA3
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH1:
            if(FTM0_CH1 == PTC2)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
                PORT_PCR_REG(PORTC_BASE_PTR, 2) = PORT_PCR_MUX(4);  // PTC2
            }
            else if(FTM0_CH1 == PTA4)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 4) = PORT_PCR_MUX(3);  // PTA4
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH2:
            if(FTM0_CH2 == PTC3)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
                PORT_PCR_REG(PORTC_BASE_PTR, 3) = PORT_PCR_MUX(4);  // PTC3
            }
            else if(FTM0_CH2 == PTA5)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 5) = PORT_PCR_MUX(3);  // PTA5
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH3:
            if(FTM0_CH3 == PTC4)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
                PORT_PCR_REG(PORTC_BASE_PTR, 4) = PORT_PCR_MUX(4);  // PTC4
            }
            else if(FTM0_CH3 == PTA6)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 6) = PORT_PCR_MUX(3);  // PTA6
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH4:
            if(FTM0_CH4 == PTD4)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
                PORT_PCR_REG(PORTD_BASE_PTR, 4) = PORT_PCR_MUX(4);  // PTD4
            }
            else if(FTM0_CH4 == PTA7)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 7) = PORT_PCR_MUX(3);  // PTA7
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH5:
            if(FTM0_CH5 == PTD5)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
                PORT_PCR_REG(PORTD_BASE_PTR, 5) = PORT_PCR_MUX(4);  // PTD5
            }
            else if(FTM0_CH5 == PTA0)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 0) = PORT_PCR_MUX(3);  // PTA0
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH6:
            if(FTM0_CH6 == PTD6)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
                PORT_PCR_REG(PORTD_BASE_PTR, 6) = PORT_PCR_MUX(4);  // PTD6
            }
            else if(FTM0_CH6 == PTA1)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 1) = PORT_PCR_MUX(3);  // PTA1
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH7:
            if(FTM0_CH7 == PTD7)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
                PORT_PCR_REG(PORTD_BASE_PTR, 7) = PORT_PCR_MUX(4);  // PTD7
            }
            else if(FTM0_CH7 == PTA2)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 2) = PORT_PCR_MUX(3);  // PTA2
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;
        default:
            return;
        }
        break;

    case FTM1:
        SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;                           //使能FTM1时钟
        switch(ch)
        {
        case CH0:
            if(FTM1_CH0 == PTA8)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 8) = PORT_PCR_MUX(3);  // PTA8
            }
            else if(FTM1_CH0 == PTA12)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 12) = PORT_PCR_MUX(3);  // PTA12
            }
            else if(FTM1_CH0 == PTB0)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
                PORT_PCR_REG(PORTB_BASE_PTR, 0) = PORT_PCR_MUX(3);  // PTB0
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;


        case CH1:
            if(FTM1_CH1 == PTA9)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 9) = PORT_PCR_MUX(3);  // PTA9
            }
            else if(FTM1_CH1 == PTA13)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 13) = PORT_PCR_MUX(3);  // PTA13
            }
            else if(FTM1_CH1 == PTB1)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
                PORT_PCR_REG(PORTB_BASE_PTR, 1) = PORT_PCR_MUX(3);  // PTB1
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        default:
            return;
        }
        break;
    case FTM2:
        SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                           //使能FTM2时钟
        switch(ch)
        {
        case CH0:
            if(FTM2_CH0 == PTA10)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 10) = PORT_PCR_MUX(3);  // PTA10
            }
            else if(FTM2_CH0 == PTB18)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 18) = PORT_PCR_MUX(3);  // PTB18
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        case CH1:
            if(FTM2_CH1 == PTA11)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 11) = PORT_PCR_MUX(3);  // PTA11
            }
            else if(FTM2_CH1 == PTB19)
            {
                SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 19) = PORT_PCR_MUX(3);  // PTB19
            }
            else
            {
                assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
            }
            break;

        default:
            return;
        }
        break;
    default:
        break;
    }


    /******************* 设置为输入捕捉功能 *******************/
    switch(cfg)
    {
    case Rising:    //上升沿触发
        FTM_CnSC_REG(FTMx[ftmn], 0) |=  ( FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK );                   //置1
        FTM_CnSC_REG(FTMx[ftmn], 0) &= ~( FTM_CnSC_ELSB_MASK  | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
        break;

    case Falling:   //下降沿触发
        FTM_CnSC_REG(FTMx[ftmn], 0) |= (FTM_CnSC_ELSB_MASK  | FTM_CnSC_CHIE_MASK );                    //置1
        FTM_CnSC_REG(FTMx[ftmn], 0) &= ~( FTM_CnSC_ELSA_MASK | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
        break;

    case Rising_or_Falling: //上升沿、下降沿都触发
        FTM_CnSC_REG(FTMx[ftmn], 0) |=  ( FTM_CnSC_ELSB_MASK | FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK ); //置1
        FTM_CnSC_REG(FTMx[ftmn], 0) &= ~( FTM_CnSC_MSB_MASK  | FTM_CnSC_MSA_MASK); //清0
        break;
    }

    FTM_SC_REG(FTMx[ftmn]) = FTM_SC_CLKS(0x1);       //System clock

    FTM_MODE_REG(FTMx[ftmn]) |= FTM_MODE_WPDIS_MASK;
    FTM_COMBINE_REG(FTMx[ftmn]) = 0;
    FTM_MODE_REG(FTMx[ftmn]) &= ~FTM_MODE_FTMEN_MASK;
    FTM_CNTIN_REG(FTMx[ftmn]) = 0;

    FTM_STATUS_REG(FTMx[ftmn]) = 0x00;               //清中断标志位

    //开启输入捕捉中断
    enable_irq(78 - 16 + ftmn);
}

//------------------------------------------------------------------------------
//函数名：MotorInit
//功  能：电机驱动PWM初始化
//参  数：无
//返  回：无
//说  明：
//------------------------------------------------------------------------------
void MotorInit(void)
{
  //SIM_SOPT4|=SIM_SOPT4_FTM1FLT0_MASK;
  /* Turn on all port clocks */
  //SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;

  /* Enable the function on PTA8 */
  // FTM is alt4 function for this pin
  PORTD_PCR4 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  ///FTM0_CH4
  PORTD_PCR5 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  ///FTM0_CH5
  PORTD_PCR6 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  ///FTM0_CH6
  PORTD_PCR7 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  ///FTM0_CH7

  SIM_SCGC6|=SIM_SCGC6_FTM0_MASK;   //使能FTM0时钟

  //change MSnB = 1
  FTM0_C4SC |= FTM_CnSC_ELSB_MASK;
  FTM0_C4SC &= ~FTM_CnSC_ELSA_MASK;
  FTM0_C4SC |= FTM_CnSC_MSB_MASK;

  FTM0_C5SC |= FTM_CnSC_ELSB_MASK;
  FTM0_C5SC &= ~FTM_CnSC_ELSA_MASK;
  FTM0_C5SC |= FTM_CnSC_MSB_MASK;

  FTM0_C6SC |= FTM_CnSC_ELSB_MASK;
  FTM0_C6SC &= ~FTM_CnSC_ELSA_MASK;
  FTM0_C6SC |= FTM_CnSC_MSB_MASK;

  FTM0_C7SC |= FTM_CnSC_ELSB_MASK;
  FTM0_C7SC &= ~FTM_CnSC_ELSA_MASK;
  FTM0_C7SC |= FTM_CnSC_MSB_MASK;

  //FTM1_SC = FTM_SC_PS(0) | FTM_SC_CLKS(1);
  //FTM1_SC = 0X0F;
  FTM0_SC = 0x08;//???not enable the interrupt mask
  //系统时钟sys_clk，且为32分频，频率为2343.7Hz
  //FTM1_SC = 0X1F;     //BIT5
                        //0 FTM counter operates in up counting mode.
                        //1 FTM counter operates in up-down counting mode.
                        //BIT43 FTM1_SC|=FTM1_SC_CLKS_MASK;
                        //00 No clock selected (This in effect disables the FTM counter.)
                        //01 System clock
                        //10 Fixed frequency clock
                        //11 External clock
                        //BIT210 FTM1_SC|=FTM1_SC_PS_MASK;
                        //100M          MOD=2000;     MOD=4000;   MOD=1000;
                        //000 Divide by 1---12KHZ     6K          24k
                        //001 Divide by 2--- 6KHZ
                        //010 Divide by 4--- 3K
                        //011 Divide by 8--- 1.5K
                        //100 Divide by 16---750
                        //101 Divide by 32---375
                        //110 Divide by 64---187.5HZ
                        //111 Divide by 128--93.75hz

  FTM0_MODE |= FTM_MODE_WPDIS_MASK;
  //BIT1   Initialize the Channels Output
  //FTMEN is bit 0, need to set to zero so DECAPEN can be set to 0
  FTM0_MODE &= ~1;
  //BIT0   FTM Enable
  //0 Only the TPM-compatible registers (first set of registers) can be used without any restriction. Do not use the FTM-specific registers.
  //1 All registers including the FTM-specific registers (second set of registers) are available for use with no restrictions.

  FTM0_OUTMASK=0X0F;   //0 Channel output is not masked. It continues to operate normally.
                       //1 Channel output is masked. It is forced to its inactive state.

  FTM0_COMBINE=0;      //Function for Linked Channels (FTMx_COMBINE)
  FTM0_OUTINIT=0;
  FTM0_EXTTRIG=0;      //FTM External Trigger (FTMx_EXTTRIG)
  FTM0_POL=0;          //Channels Polarity (FTMx_POL)
                       //0 The channel polarity is active high.
                       //1 The channel polarity is active low.
  //Set Edge Aligned PWM
  FTM0_QDCTRL &=~FTM_QDCTRL_QUADEN_MASK;
  //QUADEN is Bit 1, Set Quadrature Decoder Mode (QUADEN) Enable to 0,   (disabled)
  //FTM0_SC = 0x16; //Center Aligned PWM Select = 0, sets FTM Counter to operate in up counting mode,
  //it is field 5 of FTMx_SC (status control) - also setting the pre-scale bits here

  FTM0_INVCTRL=0;     //反转控制
  FTM0_SWOCTRL=0;     //软件输出控制F TM Software Output Control (FTMx_SWOCTRL)
  FTM0_PWMLOAD=0;     //FTM PWM Load
                      //BIT9:
                      //0 Loading updated values is disabled.
                      //1 Loading updated values is enabled.
  FTM0_CNTIN=0;       //Counter Initial Value
  FTM0_MOD=7500-1;      //Modulo value,The EPWM period is determined by (MOD - CNTIN + 0x0001)
                      //采用龙丘时钟初始化函数，可以得到4分频的频率，系统60M频率时，PWM频率是15M,以此类推
                      //PMW频率=X系统频率/4/(2^FTM1_SC_PS)/FTM1_MOD
  FTM0_C4V=2500;         //设置 the pulse width(duty cycle) is determined by (CnV - CNTIN).
  FTM0_C5V=0;
  FTM0_C6V=2500;
  FTM0_C7V=0;             ///此处CnV写0是为了使占空比为0，暂时不输出PWM波。   --HJZ
  FTM0_CNT=0;         //只有低16位可用    
                     
}

//------------------------------------------------------------------------------
//函数名：QuadInit
//功  能：正交编码器初始化
//参  数：无
//返  回：无
//说  明：
//------------------------------------------------------------------------------
void QuadInit(void)
{
  /*开启端口时钟*/
  //SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
  /*选择管脚复用功能*/
  PORTB_PCR0 = PORT_PCR_MUX(6);
  PORTB_PCR1 = PORT_PCR_MUX(6);
  PORTB_PCR18 = PORT_PCR_MUX(6);
  PORTB_PCR19 = PORT_PCR_MUX(6);
  /*使能FTM1、FTM2时钟*/
  SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;
  SIM_SCGC3|=SIM_SCGC3_FTM2_MASK;

  FTM1_MOD = 20000;                 //可根据需要设置
  FTM2_MOD = 20000;

  FTM1_CNTIN = 0;
  FTM2_CNTIN = 0;

  FTM1_MODE |= FTM_MODE_WPDIS_MASK; //禁止写保护
  FTM2_MODE |= FTM_MODE_WPDIS_MASK; //禁止写保护
  FTM1_MODE |= FTM_MODE_FTMEN_MASK; //FTMEN=1,关闭TPM兼容模式，开启FTM所有功能
  FTM2_MODE |= FTM_MODE_FTMEN_MASK; //FTMEN=1,关闭TPM兼容模式，开启FTM所有功能

  FTM1_QDCTRL &= ~FTM_QDCTRL_QUADMODE_MASK;  //选定编码模式为A相与B相编码模式
  FTM1_QDCTRL |= FTM_QDCTRL_QUADEN_MASK;     //使能正交解码模式
  FTM2_QDCTRL &= ~FTM_QDCTRL_QUADMODE_MASK;  //选定编码模式为A相与B相编码模式
  FTM2_QDCTRL |= FTM_QDCTRL_QUADEN_MASK;     //使能正交解码模式

  FTM1_SC |= FTM_SC_CLKS(3);         //选择外部时钟
  //FTM1_CONF |=FTM_CONF_BDMMODE(3); //可根据需要选择
  FTM2_SC |= FTM_SC_CLKS(3);
  //FTM2_CONF |=FTM_CONF_BDMMODE(3);
}


//------------------------------------------------------------------------------
//函数名：ServoInit
//功  能：舵机驱动PWM初始化
//参  数：无
//返  回：无
//说  明：
//------------------------------------------------------------------------------
void ServoInit(void)
{
  //打开PORTA模块门控时钟
  SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;

  //将PORTB0设置为FTM1_ch0，数字输出高驱动能力
  PORTA_PCR12 = PORT_PCR_MUX(0x3)| PORT_PCR_DSE_MASK;

  //使能FTM1模块门控时钟
  SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;

  //配置FTM1_ch0为边沿对齐PWM，正极性
  FTM1_C0SC |= FTM_CnSC_ELSB_MASK;
  FTM1_C0SC &= ~FTM_CnSC_ELSA_MASK;
  FTM1_C0SC |= FTM_CnSC_MSB_MASK;

  //时钟源选择sys_clk，对FTM计数器预分频128倍
  FTM1_SC = FTM_SC_PS(6) | FTM_SC_CLKS(1);

  FTM1_MODE &= ~FTM_MODE_FTMEN_MASK;         //禁止FTM模块
  FTM1_OUTMASK &= ~1;                        //通道0禁止掩码，继续正常运行

  FTM1_COMBINE = 0;                          //用于已连接通道,全部禁止
  FTM1_OUTINIT = 0;                          //外部输出初始化为0
  FTM1_EXTTRIG = 0;                          //外部触发设置，全部禁止
  FTM1_POL = 0;                              //输出极性设置，全部为正极性

  FTM1_QDCTRL &=~FTM_QDCTRL_QUADEN_MASK;     //正交解码器不使能，EPWM或者CPWM的条件

  FTM1_INVCTRL = 0;     //FTM倒置功能禁止
  FTM1_SWOCTRL = 0;     //软件输出控制禁止
  FTM1_PWMLOAD = 0;     //PWM加载控制禁止

  //下面设置PWM波的周期、占空比等参数
  //PWM计算方法：CnV/MOD，MOD已知，通过调整CnV控制占空比
  FTM1_CNTIN = 0;         //FTM计数初始值设置为0
  FTM1_MOD = 23437 - 1;        //FTM计数器模数值为2000
                          //采用LQ的时钟初始化函数，得到二分频的PWM，如sys_clk为100M，则PWM为50M
                          //PWM频率f=sys_clk/2/(2^FTM1_SC_PS)/FTM1_MOD=150M/2/128/1953=300.02Hz，周期3.33ms
  FTM1_C0V = 1851;      //脉宽设置为CnV - CNTIN，占空比为20%
  //4.3% 4.4%(L) 4.5% 5.0% 5.5% 6.0% 6.5% 7.0% 7.15%(C) 7.5% 8.0% 8.5% 9.0% 9.5% 9.9%(R) 10.0% 10.3% 10.5%
  //1008 1031    1055 1172 1289 1406 1523 1640 1676     1758 1875 1992 2109 2226 2320    2344  2414  4922
  
  //6.3% 1476为下限，左转。
  //6.6% 1547
  //6.8% 1594
  //6.9% 1617
  //7.9% 1851为中心，直走。
  //8.7% 2039
  //8.9% 2086
  //9.3% 2180为上限，右转。
  //
  FTM1_CNT = 0;           //FTM计数器寄存器，低16位可以用，写入任何值将使其回到CNTIN
}



