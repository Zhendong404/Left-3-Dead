
#include "common.h"
#include "include.h"
#include "FTM.h"
#include "calculation.h"

#define FTM0_CH5        PTD5
#define FTM0_CH6        PTD6

/*********************************************************** 
函数名称：CCD_init
函数功能：
入口参数：
出口参数：无 
备 注： 
***********************************************************/
extern u8  BUFF[500] ;
extern u8  ADdata[DATALINE][DATACOUNT];
void CCD_INC (void){
	gpio_Interrupt_init(PORTD,1, GPI_UP,FALLING) ;          //场中断
	gpio_Interrupt_init(PORTC,8, GPI_DOWN, RING) ;          //行中断 
	DMA_PORTx2BUFF_Init (DMA_CH4, (void *)&PTB_BYTE0_IN, ADdata, PTB9, DMA_BYTE1, DATACOUNT, DMA_rising_down);
}

void  DCMoto_init(void)
{   
    //lptmr_counter_init(LPT0_ALT2, LIN_COUT, 2, LPT_Rising)  ;   //初始化脉冲计数器 ，PTC5输入捕获脚，LIN_cout =100，预处理为2，上升沿捕获 
    FTM_PWM_init(FTM0 , CH5, 5000,0);                          //电机占空比设置初始化    占空比 = duty /(MOD +1 ) ;FTM_CnV_REG(FTMx[ftmn], ch) = cv;
    FTM_PWM_init(FTM0 , CH6, 5000,0);                          //电机占空比设置初始化    占空比 = duty /(MOD +1 ) ;FTM_CnV_REG(FTMx[ftmn], ch) = cv;
    gpio_set (PORTD, 7, 1);                      //H桥使能
}

void Servo_init(void)
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

	mod = (clk_hz >> sc_ps) / freq;               //频率设置因子,clk_hz = 25000000

	cv = (50 * (mod - 0 + 1)) / FTM_PRECISON;		//占空比设置因子

	SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;				//使能FTM1时钟
	SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;				//使能PORTA时钟
	PORT_PCR_REG(PORTA_BASE_PTR, 12) = PORT_PCR_MUX(3);  // PTA12对应FTM1_CH0

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

void Turn(u32 drc)
{
	
}

