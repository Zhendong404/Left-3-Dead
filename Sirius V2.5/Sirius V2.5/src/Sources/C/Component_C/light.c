//-------------------------------------------------------------------------*
// 文件名: light.c                                                         *
// 说  明: 小灯驱动函数文件                                                *
//-------------------------------------------------------------------------*

#include "light.h"               //指示灯驱动程序头文件   

//-------------------------------------------------------------------------*
//函数名: light_init                                                       *
//功  能: 初始化指示灯状态                                                 *
//参  数: port:端口名                                                      *
//        name:指定端口引脚号                                              *
//        state:初始状态,1=高电平,0=低电平                                 *
//返  回: 无                                                               *
//说  明: 调用gpio_init函数                                                * 
//-------------------------------------------------------------------------*
void light_init(GPIO_MemMapPtr port,int name,int state)
{
	gpio_init(port,name,1,state);//初始化指示灯
}

//-------------------------------------------------------------------------* 
//函数名: light_control                                                    *
//功  能: 控制灯的亮和暗                                                   *
//参  数: port:端口名                                                      *
//        name:指定端口引脚号                                              *
//        state:状态,1=高电平,0=低电平                                     *
//返  回: 无                                                               *
//说  明: 调用gpio_ctrl函数                                                * 
//-------------------------------------------------------------------------*   
void light_control(GPIO_MemMapPtr port,int name,int state)
{
	gpio_ctrl(port,name,state);   //控制引脚状态     
} 

//-------------------------------------------------------------------------* 
//函数名: light_change                                                     *
//功  能: 状态切换:原来"暗",则变"亮";原来"亮",则变"暗"                     *
//参  数: port:端口名                                                      *
//        name:指定端口引脚号                                              *
//返  回: 无                                                               *
//说  明: 调用gpio_reverse函数                                             *
//-------------------------------------------------------------------------*  
void light_change(GPIO_MemMapPtr port,int name)
{
	gpio_reverse(port,name);
}
