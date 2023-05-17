/*
  ******************************************************************************
  * @file    apt32f102_initial.c
  * @author  APT AE Team
  * @version V0.50
  * @date    2020/05/18
  ******************************************************************************
  *THIS SOFTWARE WHICH IS FOR ILLUSTRATIVE PURPOSES ONLY WHICH PROVIDES 
  *CUSTOMER WITH CODING INFORMATION REGARDING THEIR PRODUCTS.
  *APT CHIP SHALL NOT BE HELD RESPONSIBILITY ADN LIABILITY FOR ANY DIRECT, 
  *INDIRECT DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE CONTENT OF 
  *SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING INFORMATION 
  *CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.AND APT CHIP RESERVES 
  *THE RIGHT TO MAKE CHANGES IN THE SOFTWARE WITHOUT NOTIFICATION
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/ 
/* Includes ------------------------------------------------------------------*/
#include "apt32f102.h"
#include "apt32f102_gpio.h"
#include "apt32f102_syscon.h"
#include "apt32f102_uart.h"
#include "apt32f102_ifc.h"
#include "apt32f102_types_local.h"
/* define --------------------------------------------------------------------*/
	
/* externs--------------------------------------------------------------------*/
/*************************************************************/
//software delay
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void delay_nms(unsigned int t)
{
    volatile unsigned int i,j ,k=0;
    j = 50* t;
    for ( i = 0; i < j; i++ )
    {
        k++;
		SYSCON_IWDCNT_Reload(); 
    }
}

void delay_nus(unsigned int t)
{
    volatile unsigned int i,j ,k=0;
    j = 1* t;
    for ( i = 0; i < j; i++ )
    {
        k++;
    }
}
/*************************************************************/
//GPIO Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void GPIO_CONFIG(void)
{
	GPIO_Init(GPIOA0,10,0);
	GPIO_Write_High(GPIOA0,10);				
	GPIO_Write_Low(GPIOA0,10);				
//------------  EXI FUNTION  --------------------------------/
//EXI0_INT= EXI0/EXI16,EXI1_INT= EXI1/EXI17, EXI2_INT=EXI2~EXI3/EXI18/EXI19, EXI3_INT=EXI4~EXI9, EXI4_INT=EXI10~EXI15    
	//GPIO_IntGroup_Set(PA0,0,Selete_EXI_PIN0);								//EXI0 set PBA.0
	//GPIOA0_EXI_Init(EXI0);                                   	//PA0.0 as input
	//EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIFT);                  	//ENABLE falling edge
	//EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIRT);                 //ENABLE rising edge
    //EXTI_interrupt_CMD(ENABLE,EXI_PIN0);                	   	//enable EXI
    //GPIO_EXTI_interrupt(GPIOA0,0b00000000000001);				//enable GPIOA00 as EXI
	//EXI0_Int_Enable();                                         	//EXI0 INT Vector
    //EXI1_Int_Enable();                                        //EXI1 INT Vector
    //EXI2_Int_Enable();                                        //EXI2~EXI3 INT Vector
    //EXI3_Int_Enable();                                        //EXI4~EXI8 INT Vector
    //EXI4_Int_Enable();                                        //EXI9~EXI13 INT Vector
	
   // EXI0_WakeUp_Enable();										//EXI0 interrupt wake up enable
	//EXI1_WakeUp_Enable();										//EXI1 interrupt wake up enable
	//EXI2_WakeUp_Enable();										//EXI2~EXI3 interrupt wake up enable
	//EXI3_WakeUp_Enable();										//EXI4~EXI8 interrupt wake up enable
	//EXI4_WakeUp_Enable();										//EXI9~EXI13 interrupt wake up enable
}
/*************************************************************/
//UART0  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
/*void UART0_CONFIG(void)
{
	UART0_DeInit();                                                //clear all UART Register
    //UART_IO_Init(IO_UART0,0);                                     //use PA0.1->RXD0, PA0.0->TXD0
	GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF00)  | 0x00000044;
    UARTInitRxTxIntEn(UART0,416,UART_PAR_NONE);	                  //baudrate=sysclock/208=115200
	UART0_Int_Enable();
}*/	
/*************************************************************/
//UART1  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void UART1_CONFIG(void)
{
	UART1_DeInit();                                                 //clear all UART Register
	GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)  | 0x00000007;       //PA0.13->RXD1, PB0.0->TXD1
	GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)  | 0x00700000;
    UARTInitRxTxIntEn(UART1,416,UART_PAR_NONE);	                    //baudrate=sysclock/173=115200
	UART1_Int_Enable();
}	
/*************************************************************/
//UART2  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
/*void UART2_CONFIG(void)
{
	UART2_DeInit();                                                 //clear all UART Register
    UART_IO_Init(IO_UART2,2);                                    	//use PA0.7->RXD2, PA0.6->TXD2
    UARTInitRxTxIntEn(UART2,416,UART_PAR_NONE);	                    //baudrate=sysclock/46=115200
	UART2_Int_Enable();
}*/	
/*************************************************************/
//ifc config
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void IFC_CONFIG(void)
{
	EnIFCClk;						//使能IFC时钟
	IFC->MR=(IFC->MR&0xfffffeff)|(0x01<<8);		//设置为并行模式
	IFC_interrupt_CMD(ENABLE,ERS_END_INT);		//擦除完成指令中断
	IFC_interrupt_CMD(ENABLE,RGM_END_INT);		//编程指令执行完成中断
	IFC_interrupt_CMD(ENABLE,PEP_END_INT);		//预编程指令执行完成中断
	//IFC_Int_Enable();
}
/*************************************************************/
//syscon Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_CONFIG(void)
{
//------SYSTEM CLK AND PCLK FUNTION---------------------------/
	SYSCON_RST_VALUE();                                                         //SYSCON all register clr
	//SystemCLK_HCLKDIV_PCLKDIV_Config(SYSCLK_IMOSC,HCLK_DIV_1,PCLK_DIV_1,IMOSC);
	SYSCON_General_CMD(ENABLE,ENDIS_ISOSC);
	//EMOSC_OSTR_Config(0XAD,0X1f,EM_LFSEL_EN,EM_FLEN_EN,EM_FLSEL_10ns);			//EM_CNT=0X3FF,0xAD(36K),EM_GM=0,Low F modedisable,EM filter disable,if enable,cont set 5ns
	//SYSCON_General_CMD(ENABLE,ENDIS_EMOSC);
	SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_48M);									//HFOSC selected 48MHz
	SystemCLK_HCLKDIV_PCLKDIV_Config(SYSCLK_HFOSC,HCLK_DIV_1,PCLK_DIV_1,HFOSC_48M);//system clock set, Hclk div ,Pclk div  set system clock=SystemCLK/Hclk div/Pclk div
//------------  WDT FUNTION  --------------------------------/
    SYSCON_IWDCNT_Config(IWDT_TIME_2S,IWDT_INTW_DIV_7);      					//WDT TIME 1s,WDT alarm interrupt time=1s-1s*1/8=0.875S
    SYSCON_WDT_CMD(ENABLE);                                                  	//enable WDT		
    SYSCON_IWDCNT_Reload();                                                   	//reload WDT
	//IWDT_Int_Enable();
//------------  CLO  --------------------------------/	
	//SYSCON_CLO_CONFIG(CLO_PA02);
	//SYSCON->OPT1=(SYSCON->OPT1&0XFFFF8000)|(0X01<<12)|(0X04<<8)|(0x00<<4);
//------------  LVD FUNTION  --------------------------------/ 
//    SYSCON_LVD_Config(DISABLE_LVDEN,INTDET_LVL_3_3V,RSTDET_LVL_1_9V,DISABLE_LVD_INT,INTDET_POL_fall);   //LVD LVR Enable/Disable
    //LVD_Int_Enable();
//------------ EVTRG function --------------------------------/ 	
	//SYSCON->EVTRG=0X00|0x01<<20;											//SYSCON_trgsrc0
	//SYSCON->EVPS=0X00;
	
	//SYSCON->IMER =EM_EVTRG0_ST;
//------------  SYSCON Vector  --------------------------------/ 	
	//SYSCON_Int_Enable();    														//SYSCON VECTOR
	//SYSCON_WakeUp_Enable();    													//Enable WDT wakeup INT
}
/*********************************************************************************/  
/*********************************************************************************/
//APT32F102_init                                                                  /
//EntryParameter:NONE                                                             /
//ReturnValue:NONE                                                                /
/*********************************************************************************/
/*********************************************************************************/  
/*********************************************************************************/
void APT32F102_init(void) 
{
//------------------------------------------------------------/
//Peripheral clock enable and disable
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON->PCER0=0xFFFFFFF;                                        //PCLK Enable  0x00410071
    SYSCON->PCER1=0xFFFFFFF;                                        //PCLK Enable
    while(!(SYSCON->PCSR0&0x1));                                    //Wait PCLK enabled	
//------------------------------------------------------------/
//ISOSC/IMOSC/EMOSC/SYSCLK/IWDT/LVD/EM_CMFAIL/EM_CMRCV/CMD_ERR OSC stable interrupt
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON_CONFIG();                                                 //syscon  initial
	//CK_CPU_EnAllNormalIrq();                                         //enable all IRQ
	asm  ("psrset ee,ie");
//------------------------------------------------------------/
//Other IP config
//------------------------------------------------------------/
	//GPIO_CONFIG();                                                //GPIO initial    
    //UART0_CONFIG();                                               //UART0 initial 
	UART1_CONFIG();                                               //UART1 initial 
	//UART2_CONFIG();                                               //UART2 initial 
	IFC_CONFIG();
}
/******************* (C) COPYRIGHT 2019 APT Chip *****END OF FILE****/