//-------------------------------------------------------------------------*
// �ļ���: isr.c                                                           *
// ˵  ��: �жϴ�������                                                    *
//---------------���ݴ�ѧ��˼����Ƕ��ʽϵͳʵ����2011��--------------------*

#include "includes.h"
#include "common.h"
#include "DMA.h"
#include "ImageGet.h"


//-------------------------------------------------------------------------*
//������: uart3_isr                                                        *
//��  ��: ����3���ݽ����ж�����                                            *
//˵  ��: ��                                                               *
//-------------------------------------------------------------------------*
void uart0_isr(void)
{
    uint8 ch;
    DisableInterrupts;		//�����ж�
    //����һ���ֽ����ݲ��ط�
	if(uart_re1 (UART0,&ch))
		uart_send1(UART0,ch);
	EnableInterrupts;		//�����ж�
}

//------------------------------------------------------------------------------
//��������PIT0_Isr
//��  �ܣ������ж϶�ʱ��PIT�жϷ�����
//��  ������
//��  �أ���
//˵  ����
//------------------------------------------------------------------------------
void PIT0_Isr(void)
{
    if((PIT_TFLG(0)&PIT_TFLG_TIF_MASK)!=0)
    {
      PIT_TFLG(0) |= PIT_TFLG_TIF_MASK;  //���жϱ�־
    }
    
    gpio_reverse(PORTA, 10);
}

//DMA0���������������PCLK������B9
//��Щ���������������Ƿ���LineIsr��ԭ����LineIsr�����Ҫ���Ͽ�ʼ�����ݣ�������
void DMA0_Isr(void)
{
    uint8 DMACHno = 0;
    DMA_INT |= (1 << DMACHno);    //��DMA0ͨ����������жϱ�־λ
    LineCount++;              //�ɼ��м���ֵ��1
    
    if(LineCount >= CameraHight)   //����ɼ����
    {
        ImgStatus = ImgGetFinish;    //ͼ��ɼ�������־λ
        disable_irq(FIELD_IRQ);   //���ж�IRQ���ã��ȴ���һ��ImgGet()�����ٿ���
        disable_irq(LINE_IRQ);    //���ж�IRQ����
        disable_irq(DMA0_IRQ);    //DMA0��IRQ����
          
    }   
    
}


//PORTA�жϷ�����
//�����IRQ����򿪣�����������������
void PORTA_Isr(void)  
{
    PORTA_ISFR = ~0;
    uart_sendN(UART0, (uint8 *)"\nError In PORTA_Isr()!", 22); //���󾯸�
}


//PORTB�жϷ���������PCLK������DMA��B9
//�����IRQ����򿪣�����������������
void PORTB_Isr(void)  
{
    PORTB_ISFR = ~0;
    uart_sendN(UART0, (uint8 *)"\nError In PORTB_Isr()!", 22);  //���󾯸�
}


//PORTC�жϷ������������жϣ�C8
void PORTC_Isr(void)  
{
    uint32 FlagTmp = PORTC_ISFR;  
    PORTC_ISFR =  ~0;             //���PORTC�������жϱ�־λ
    
    if(FlagTmp & (1 << PIN_LINE))   //���ȷ�������жϵ�
    {
        LineIsr();                    //�����жϴ�����
    }  
}



//PORTD�жϷ������������жϣ�D1
void PORTD_Isr(void)  
{
    uint32 FlagTmp = PORTD_ISFR;  
    PORTD_ISFR =  ~0;             //���PORTD�������жϱ�־λ
    
    if(FlagTmp & (1 << PIN_FIELD))   //���ȷ���ǳ��жϵ�
    {
        FieldIsr();                    //�����жϴ�����
    }

}



//PORTE�жϷ�����
//�����IRQ����򿪣�����������������
void PORTE_Isr(void)  
{
    PORTE_ISFR = ~0;
    uart_sendN(UART0, (uint8 *)"\nError In PORTE_Isr()!", 22);   //���󾯸�
}



  

/*
void porta_isr(void)//���жϣ�A24���½����ж�
{
  
	PORTA_PCR24 |= PORT_PCR_ISF_MASK;//����жϱ�־
	DMA0_Init();
	enable_irq(0);//ʹ��DMAͨ��0����ж�
	row=0;//��ʼ����
	imagerow=0;//��ʼ���ɼ���
	enable_irq (88);//ʹ��B���ж� ��B10���ж�

}
*/