/*
  ******************************************************************************
  * @file    apt32f102_initial.c
  * @author  APT AE Team
  * @version V1.02
  * @date    2020/11/16
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
#include "platform_head.h"
#include "platform_driver.h"
/* define --------------------------------------------------------------------*/
volatile U16_T timeout_ms;
volatile U16_T timeout_ms1;
volatile U32_T SYSCLK = 48000000u;

#define Debug      1
/* externs--------------------------------------------------------------------*/
/*************************************************************/
//software delay
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void delay_timeout(void)
{
	if(timeout_ms)
	{
		timeout_ms--;
	}

}
void delay_ms(U16_T t)
{
	timeout_ms = t;	
	while(timeout_ms)//while(1)
	{

	}
	
}
/*************************************************************/
//GPIO Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void GPIO_CONFIG(void)
{
//------------  EXI FUNTION  --------------------------------/
//EXI0_INT= EXI0/EXI16,EXI1_INT= EXI1/EXI17, EXI2_INT=EXI2~EXI3/EXI18/EXI19, EXI3_INT=EXI4~EXI9, EXI4_INT=EXI10~EXI15    
	//L_DET_PIN     GPIOB0,1
	GPIO_IntGroup_Set(PB0,1,Selete_EXI_PIN1);								
	GPIOB0_EXI_Init(EXI1);                                   	
	EXTI_trigger_CMD(ENABLE,EXI_PIN1,_EXIFT);                 
	//EXTI_trigger_CMD(ENABLE,EXI_PIN1,_EXIRT);	
	//R_DET_PIN      		GPIOB0,2
	GPIO_IntGroup_Set(PB0,5,Selete_EXI_PIN2);								
	GPIOB0_EXI_Init(EXI2);	
	//EXTI_trigger_CMD(ENABLE,EXI_PIN5,_EXIRT);
	EXTI_trigger_CMD(ENABLE,EXI_PIN2,_EXIFT);
	//CHG_DET_PIN			GPIOB0,3
	GPIO_IntGroup_Set(PB0,3,Selete_EXI_PIN3);								
	GPIOB0_EXI_Init(EXI3);	
	EXTI_trigger_CMD(ENABLE,EXI_PIN3,_EXIFT);                  	
	EXTI_trigger_CMD(ENABLE,EXI_PIN3,_EXIRT);

	
	//EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIRT);                 
    EXTI_interrupt_CMD(ENABLE,EXI_PIN1);                	   	
	EXTI_interrupt_CMD(ENABLE,EXI_PIN2);                	  
	EXTI_interrupt_CMD(ENABLE,EXI_PIN3);                	   	


			
	GPIO_EXTI_interrupt(GPIOB0,0b0000000000001110);					
//	EXI0_Int_Enable();                                         	
	EXI1_Int_Enable();                                        
	EXI2_Int_Enable();                                        
//    EXI3_Int_Enable();                                       
//    EXI4_Int_Enable();                                      
	
//   EXI0_WakeUp_Enable();										
	EXI1_WakeUp_Enable();										
	EXI2_WakeUp_Enable();										
//	EXI3_WakeUp_Enable();										
//	EXI4_WakeUp_Enable();									
}
/*************************************************************/
//CORET Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void CORET_CONFIG(void)
{
	CORET_DeInit();
	SYSCON_General_CMD(ENABLE,ENDIS_SYSTICK);
	CK801->CORET_RVR=59999;								//CORETCLK=sysclock/8=48M/8=6Mhz  e.g:10ms=(CORET_RVR+1)*(8/48M);CORET_RVR=60000-1=59999
	CORET_reload();																
	CORET_CLKSOURCE_EX();								//use ex clock
	CORET_TICKINT_Enable();								//clear CORET counter
	CORET_stop();	
	
	CORET_Int_Enable();
	//CORET_WakeUp_Enable();									
}
/*************************************************************/
//ETP0 Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void EPT0_CONFIG(void)
{
	//PWM
	EPT_Software_Prg();
	EPT_IO_SET(EPT_IO_CHAX,IO_NUM_PA10);
	EPT_IO_SET(EPT_IO_CHAY,IO_NUM_PB03);
	EPT_IO_SET(EPT_IO_CHBX,IO_NUM_PB02);
	EPT_IO_SET(EPT_IO_CHBY,IO_NUM_PB04);
	EPT_IO_SET(EPT_IO_CHCX,IO_NUM_PB05);
	EPT_IO_SET(EPT_IO_CHCY,IO_NUM_PA04);
	EPT_PWM_Config(EPT_Selecte_PCLK,EPT_CNTMD_increase,EPT_OPM_Continue,0);//PCLK作为TCLK时钟，递增模式，连续模式，TCLK=PCLK/(0+1) 
	//EPT_Tevent_Selecte(0x00,0x00);				//T1选择SYNCIN4作为输入触发,T2选择SYNCIN5作为输入触发
	//EPT_SYNCR_Config(EPT_Triggle_Continue,EPT_SYNCUSR0_REARMTrig_DIS,EPT_TRGSRC0_ExtSync_SYNCUSR0,EPT_TRGSRC1_ExtSync_SYNCUSR4,0x30);//使能SYNCUSR4 SYNCUSR5,连续触发
	EPT_PWMX_Output_Control(EPT_PWMA,EPT_CA_Selecte_CMPA,EPT_CB_Selecte_CMPA,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);
	EPT_PWMX_Output_Control(EPT_PWMB,EPT_CA_Selecte_CMPB,EPT_CB_Selecte_CMPB,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);						
	EPT_PWMX_Output_Control(EPT_PWMC,EPT_CA_Selecte_CMPC,EPT_CB_Selecte_CMPC,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);	
	EPT_PWMX_Output_Control(EPT_PWMD,EPT_CA_Selecte_CMPD,EPT_CB_Selecte_CMPD,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);		
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(4800,2400,1200,600,0);//PRDR=2400,CMPA=1200,CMPB=600,CMPC=2400,CMPD=0	
	EPT_DB_CLK_Config(0,24,24);//Fdbclk=Fhclk/(0+1)，DTR=24clk，DTF=24clk
	EPT_DBCR_Config(EPT_CHA_Selecte,EPT_CHAINSEL_PWMA_RISE_FALL,EPT_CHA_OUTSEL_EnRise_EnFall,EPT_PB_OUT_Reverse,EPT_PAtoCHX_PBtoCHY);//PWMA作为互补输入源,CHX上升沿，CHY下降沿		
	EPT_DBCR_Config(EPT_CHB_Selecte,EPT_CHBINSEL_PWMB_RISE_FALL,EPT_CHB_OUTSEL_EnRise_EnFall,EPT_PB_OUT_Reverse,EPT_PAtoCHX_PBtoCHY);//PWMB作为互补输入源,CHX上升沿，CHY下降沿		
	EPT_DBCR_Config(EPT_CHC_Selecte,EPT_CHCINSEL_PWMC_RISE_FALL,EPT_CHC_OUTSEL_EnRise_EnFall,EPT_PB_OUT_Reverse,EPT_PAtoCHX_PBtoCHY);//PWMC作为互补输入源,CHX上升沿，CHY下降沿
	//EPT_Int_Enable(EPT_CAP_LD0);//CMPA load中断
	//EPT_Int_Enable(EPT_CAP_LD1);//CMPB load中断
	//EPT_Int_Enable(EPT_CAP_LD2);//CMPC load中断
	//EPT_Int_Enable(EPT_CAP_LD3);//CMPD load中断	
	//EPT_Int_Enable(EPT_CAU);//递增阶段CNT=CMPA作为中断
	//EPT_Int_Enable(EPT_CAD);//递减阶段CNT=CMPA作为中断
	//EPT_Int_Enable(EPT_CBU);//递增阶段CNT=CMPB作为中断
	//EPT_Int_Enable(EPT_CBD);//递减阶段CNT=CMPB作为中断
	//EPT_Int_Enable(EPT_CCU);//递增阶段CNT=CMPC作为中断
	//EPT_Int_Enable(EPT_CCD);//递减阶段CNT=CMPC作为中断
	//EPT_Int_Enable(EPT_CDU);//递增阶段CNT=CMPD作为中断
	//EPT_Int_Enable(EPT_CDD);//递减阶段CNT=CMPD作为中断
	//EPT_Int_Enable(EPT_PEND);//周期结束中断作为中断
	//EPT_Vector_Int_Enable();
	EPT_Start();
	//捕捉
	/*EPT_Software_Prg();
	EPT_Capture_Config(EPT_Selecte_PCLK,EPT_CNTMD_increase,EPT_CAPMD_Continue,EPT_CAP_EN,EPT_LDARST_EN,EPT_LDBRST_DIS,EPT_LDCRST_DIS,EPT_LDDRST_DIS,1,0);//TCLK=pclk/(1+0),CMPAload CMPBload
	EPT_SYNCR_Config(EPT_Triggle_Continue,EPT_SYNCUSR0_REARMTrig_DIS,EPT_TRGSRC0_ExtSync_SYNCUSR0,EPT_TRGSRC1_ExtSync_SYNCUSR4,0x04);//使能SYNCUSR2 ,连续触发
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(0XFFFF,0,0,0,0);
	EPT_Int_Enable(EPT_CAP_LD0);//CMPA载入中断
	EPT_Int_Enable(EPT_CAP_LD1);//CMPB载入中断
	EPT_Vector_Int_Enable();
	EPT_Start();*/
}
/*************************************************************/
//GPT0 Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT0_CONFIG(void)
{
	GPT_IO_Init(GPT_CHA_PB01); /* 选择CHB程序烧录会出错 */
	GPT_Configure(GPTCLK_EN,GPT_PCLK,GPT_IMMEDIATE,47);//1Mhz
	GPT_WaveCtrl_Configure(GPT_INCREASE,GPT_SWSYNDIS,GPT_IDLE_Z,GPT_PRDLD_PEND,GPT_OPM_CONTINUOUS,GPT_BURST_DIS,GPT_CKS_PCLK,GPT_CG_CHAX,GPT_CGFLT_00,GPT_PRDLD_ZERO);
	GPT_Period_CMP_Write(2000, 2000, 0);
//	GPT_WaveLoad_Configure(GPT_WAVEA_IMMEDIATE,GPT_WAVEB_SHADOW,GPT_AQLDA_ZERO,GPT_AQLDB_ZERO);
	GPT_WaveOut_Configure(GPT_CHA,GPT_CASEL_CMPA,GPT_CBSEL_CMPA,2,0,1,1,0,0,0,0,0,0);
//	GPT_WaveOut_Configure(GPT_CHB,GPT_CASEL_CMPA,GPT_CBSEL_CMPB,2,0,0,0,1,1,0,0,0,0);
	//GPT_SyncSet_Configure(GPT_SYNCUSR0_EN,GPT_OST_CONTINUOUS,GPT_TXREARM_DIS,GPT_TRGO0SEL_SR0,GPT_TRG10SEL_SR0,GPT_AREARM_DIS);
	//GPT_Trigger_Configure(GPT_SRCSEL_TRGUSR0EN,GPT_BLKINV_DIS,GPT_ALIGNMD_PRD,GPT_CROSSMD_DIS,5,5);
	//GPT_EVTRG_Configure(GPT_TRGSRC0_PRD,GPT_TRGSRC1_PRD,GPT_ESYN0OE_EN,GPT_ESYN1OE_EN,GPT_CNT0INIT_EN,GPT_CNT1INIT_EN,3,3,3,3);
//	GPT_Start();
	GPT_Stop();
//	GPT_ConfigInterrupt_CMD(ENABLE, GPT_INT_PEND);
//	GPT_INT_ENABLE();
	//INTC_ISER_WRITE(GPT0_INT); 
	//INTC_IWER_WRITE(GPT0_INT); 
}
/*************************************************************/
//LPT Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void LPT_CONFIG(void)
{
	LPT_DeInit();								//LPT DeInit
//	LPT_IO_Init(LPT_OUT_PB01);					//PA0.9 as LPT out
	//LPT_IO_Init(LPT_IN_PA10);					//PA0.10 as LPT in
	LPT_Configure(LPTCLK_EN,LPT_PCLK_DIV4,LPT_IMMEDIATE,LPT_PSC_DIV0,0,LPT_OPM_CONTINUOUS);		//
	//LPT_Debug_Mode(ENABLE);
	LPT_ControlSet_Configure(LPT_SWSYNDIS,LPT_IDLE_Z,LPT_PRDLD_DUTY_END,LPT_POL_HIGH,LPT_FLTDEB_00,LPT_PSCLD_0,LPT_CMPLD_IMMEDIATELY);
	//LPT_SyncSet_Configure(LPT_TRGEN_EN,LPT_OSTMD_ONCE,LPT_AREARM_DIS);
//	LPT_Trigger_Configure(LPT_SRCSEL_EN,LPT_BLKINV_DIS,LPT_CROSSMD_DIS,LPT_TRGSRC0_CMP,LPT_ESYN0OE_EN,5,5,0X0F);
	LPT_Period_CMP_Write(12000,500); /* 1MS */
	LPT_ConfigInterrupt_CMD(ENABLE, LPT_PEND);
	LPT_Start();
	LPT_INT_ENABLE();
}
/*************************************************************/
//BT Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void BT_CONFIG(void)
{
	BT_DeInit(BT0);
//	BT_IO_Init(BT_PB02);
	BT_Configure(BT0,BTCLK_EN,47,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);//TCLK=PCLK/(47+1) ->TCK = 48MHZ/48 = 1MHZ
	BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC_DIS,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	//BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC_EN,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	//BT_Trigger_Configure(BT0,BT_TRGSRC_PEND,BT_TRGOE_EN);
	BT_Period_CMP_Write(BT0,1000,0);
	BT_Start(BT0);
	BT_ConfigInterrupt_CMD(BT0,ENABLE,BT_PEND);
	BT0_INT_ENABLE();
	
/*	BT_DeInit(BT1);
	BT_IO_Init(BT_PA06);
	BT_Configure(BT1,BTCLK_EN,0,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);
	BT_ControlSet_Configure(BT1,BT_START_LOW,BT_IDLE_HIGH,BT_SYNC_DIS,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	BT_Trigger_Configure(BT1,BT_TRGSRC_PEND,BT_TRGOE_EN);
	BT_Period_CMP_Write(BT1,1000,500);
	BT_Start(BT1);
	BT_ConfigInterrupt_CMD(BT1,BT_PEND,ENABLE);
	BT1_INT_ENABLE();*/
}
/*************************************************************/
//COUNTA Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void COUNTA_CONFIG(void)
{
    COUNT_DeInit();                                                                       //clear all countA Register
    //COUNTA_IO_Init(COUNTA_PB01);                                                                    //set PA0.07 as counter IO
    COUNTA_Init(1000,0,Period_H,DIV1,REPEAT_MODE,CARRIER_ON,OSP_LOW);                    //Data_H=Time/(1/sysclock)
    COUNTA_Config(SW_STROBE,PENDREM_OFF,MATCHREM_OFF,REMSTAT_0,ENVELOPE_0);               //countA mode set  
    COUNTA_Start();                                                                       //countA start
    //COUNTA_Stop();                                                                      //countA stop  
    COUNTA_Int_Enable();                                                                //countA INT enable
}
/*************************************************************/
//RTC Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
//RTC CLK=(CLKSRC_EMOSC)/(DIVS+1)/(DIVA+1)/4
//		  (ISCLK)/(DIVS+1)/(DIVA+1)/4
//		  (IMCLK)/(DIVS+1)/(DIVA+1)/4
void RTC_CONFIG(void)
{
	RTC_RST_VALUE();
	RTC_Stop();												//if you want set time data, must be stop RTC clk.
	//RTC_ALM_IO_SET(Alarm_A_pulse_output);					//PA0.2  1pulse =1 rtc clk
	RTCCLK_CONFIG(2047,3,CLKSRC_EMOSC_4div);						//32.768K/4/(2047+1)/(3+1)=1S
	RTC_Function_Config(RTC_24H,CPRD_1S,COSEL_NoCali_1hz);	//Enalbe AlarmA , Enalbe AlarmB , RTC Select 24h , CPRD Select 1s
	RTC_TimeDate_buf.u8Second=0x00;					
	RTC_TimeDate_buf.u8Minute=0x09;
	RTC_TimeDate_buf.u8Hour=0X11;								//24制
	RTC_TimeDate_buf.u8Day=0X29;
	RTC_TimeDate_buf.u8Month=0X05;
	RTC_TimeDate_buf.u8Year=0X20;
	RTC_TimeDate_buf.u8DayOfWeek=0x04;
	RTC_TIMR_DATR_SET(&RTC_TimeDate_buf);						//20年5月20日14时42分00秒
	RTC_AlarmA_buf.u8Second=0x59;								//必须打开ALARMA设置该时间用于调整小时进位错误问题
	RTC_AlarmA_buf.u8Minute=0x59;
	RTC_AlarmA_buf.u8Hour=0X09;								
	RTC_Alarm_TIMR_DATR_SET(Alarm_A,&RTC_AlarmA_buf,
			Alarm_Second_Compare_EN,Alarm_Minute_Compare_EN,Alarm_Hour_Compare_EN,Alarm_DataOrWeek_Compare_DIS,Alarm_data_selecte);//闹钟时间7时00分00秒,周末闹铃
	RTC_AlarmB_buf.u8Second=0x02;					
	RTC_AlarmB_buf.u8Minute=0x01;
	RTC_AlarmB_buf.u8Hour=0X20;								//24制
	RTC_AlarmB_buf.u8WeekOrData=0X22;		
	RTC_Alarm_TIMR_DATR_SET(Alarm_B,&RTC_AlarmB_buf,
			Alarm_Second_Compare_EN,Alarm_Minute_Compare_EN,Alarm_Hour_Compare_EN,Alarm_DataOrWeek_Compare_EN,Alarm_data_selecte);//闹钟时间7时00分00秒,周末闹铃		
	
	RTC_Int_Enable(ALRA_INT);
	//RTC_Int_Enable(ALRB_INT);
	RTC_Int_Enable(CPRD_INT);
	//RTC_Int_Enable(RTC_TRGEV0_INT);
	//RTC_Int_Enable(RTC_TRGEV1_INT);
	RTC_Vector_Int_Enable();
	RTC_WakeUp_Enable();
	RTC_Start();
	//RTC EVT
	//RTC_TRGSRC0_Config(RTC_EVTRG_TRGSRC0_CPRD,RTC_ESYNxOE_EN,1);
	//RTC_TRGSRC1_Config(RTC_EVTRG_TRGSRC1_CPRD,RTC_ESYNxOE_EN,2);	
	//RTC_TRGSRC0_SWFTRG();					//RTC_TRGEV0 	SW SET
	//RTC_TRGSRC1_SWFTRG();					//RTC_TRGEV1 	SW SET
}
/*************************************************************/
//ET Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void ET_CONFIG(void)
{
	ET_DeInit();
	//BT0触发LPT
	/*ET_CH0_SRCSEL(ET_SRC0,ENABLE,ET_BT_SYNC0);
	ET_CH0_CONTROL(ENABLE,TRG_HW,ET_LPT_TRGSRC);*/
	//LPT触发BT0
	/*ET_CH0_SRCSEL(ET_SRC0,ENABLE,ET_LPT_SYNC);
	ET_CH0_CONTROL(ENABLE,TRG_HW,ET_BT0_TRGSRC0);*/
	//GTP0 SYNC0 触发LPT
	ET_CH0_SRCSEL(ET_SRC0,ENABLE,ET_EXI_SYNC0);
	ET_CH0_CONTROL(ENABLE,TRG_HW,ET_EPT0_TRGSRC3);
	//LPT触发GTP0 SYNC0 
	/*ET_CH0_SRCSEL(ET_SRC0,ENABLE,ET_LPT_SYNC);
	ET_CH0_CONTROL(ENABLE,TRG_HW,ET_GPT0_TRGSRC0);*/
	ET_ENABLE();
}
/*************************************************************/
//SIO Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void SIO_CONFIG(void)
{
	SIO_DeInit();
	SIO_IO_Init(SIO_PA03);
	SIO_TX_Init(SIOCLK_EN,20);
	SIO_TX_Configure(SIO_IDLE_HIGH,SIO_TX_MSB,15,8,0,0,SIO_OBH_3BIT,SIO_OBL_3BIT,3,1);
	//SIO_TXBUF_Set(TX_DH,TX_DL,TX_DH,TX_DL,TX_DH,TX_DL,TX_DH,TX_DL,TX_D1,TX_D0,TX_D1,TX_D0,TX_D1,TX_D0,TX_D1,TX_D0);
	//SIO_ConfigInterrupt_CMD(ENABLE,SIO_TXDNE);
	//SIO_INT_ENABLE();
}
/*************************************************************/
//SPI MASTER Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void SPI_MASTER_CONFIG(void)
{
	SPI_DeInit();
	SPI_NSS_IO_Init(1);
	SPI_Master_Init(SPI_G2,SPI_DATA_SIZE_8BIT,SPI_SPO_0,SPI_SPH_0,SPI_LBM_0,SPI_RXIFLSEL_1_8,0,10);
	//选择SPI IO group1; 发送数据大小为8BIT; SCK工作时为低电平; SCK第一个时钟沿捕捉; 串行正常输出; 接收占用1/8 FIFO中断触发断点; FSSPCLKOUT=20M/10=1M
	SPI_ConfigInterrupt_CMD(ENABLE,SPI_RXIM);				//使能FIFO接收中断
	SPI_Int_Enable();										//使能SPI中断向量
	nop;
}
/*************************************************************/
//SPI SLAVE Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void SPI_SLAVE_CONFIG(void)
{
	SPI_DeInit();
	SPI_NSS_IO_Init(1);
	SPI_Slave_Init(SPI_G1,SPI_DATA_SIZE_8BIT,SPI_SPH_0,SPI_RXIFLSEL_1_8,0,12);			
	//选择SPI IO group1; 发送数据大小为8BIT;SCK第一个时钟沿捕捉;接收占用1/8 FIFO中断触发断点 ;FSSPCLKOUT=20M/12=1.6M
	SPI_ConfigInterrupt_CMD(ENABLE,SPI_RXIM);				//使能FIFO接收中断
	SPI_Int_Enable();										//使能SPI中断向量
}
/*************************************************************/
//IIC MASTER Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void I2C_MASTER_CONFIG(void)
{
	I2C_DeInit();
	I2C_Master_CONFIG(I2C_SDA_PA07,I2C_SCL_PA01,FAST_MODE,I2C_MASTRER_7BIT,0X57,0Xa0,0Xa0);//address=0X43,SCL=IIClk*250=5us
	I2C_SDA_TSETUP_THOLD_CONFIG(0x40,0x40,0x40);										//TSETUP=0X20*IICLK,RX_THOLD=0X20*IICLK,TX_THOLD=0X20*IICLK
	I2C_Enable();
}
/*************************************************************/
//IIC SLAVER Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void I2C_SLAVE_CONFIG(void)
{
	I2C_DeInit();
	I2C_Slave_CONFIG(I2C_SDA_PA07,I2C_SCL_PA01,FAST_MODE,I2C_SLAVE_7BIT,0X57,0X50,0X50);//从机地址不能设置为0x00~0x07,0x78~0x7f
	I2C_SDA_TSETUP_THOLD_CONFIG(0x40,0x40,0x40);
	I2C_FIFO_TriggerData(0,0);															//发送FIFO设置为7
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_SCL_SLOW);
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_STOP_DET);
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_RD_REQ);
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_RX_FULL);
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_TX_ABRT);
	I2C_Enable();
	I2C_Int_Enable();
	
}
/*************************************************************/
//UART0  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void UART0_CONFIG(void)
{
	UART0_DeInit();                                                //clear all UART Register
    UART_IO_Init(IO_UART0,1);                                     //use PA0.5->RXD0, PA0.12->TXD0
    UARTInitRxTxIntEn(UART0,416,UART_PAR_NONE);	                  //baudrate=sysclock/416=115200
	UART0_Int_Enable();
}
/*************************************************************/
//UART1  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void UART1_CONFIG(U32_T baudrate)
{
	U32_T br_div = 0;
	
	br_div = SYSCLK / baudrate;
	
	UART1_DeInit();                                                 //clear all UART Register
    UART_IO_Init(IO_UART1, 0);                                    	//use PA0.13->RXD1, PB0.0->TXD1
    UARTInitRxIntEn(UART1, br_div, UART_PAR_NONE);	                    //baudrate=sysclock/416=115200
	UART1_Int_Enable();
	UART1_WakeUp_Enable();
}

/* 重定义fputc函数 */
int fputc(int ch, FILE *f)
{
#if Debug
	while((UART1->SR & 0X1) != 0);
	UART1->DATA = ch;
#endif
	return ch;
}
/*************************************************************/
//UART2  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void UART2_CONFIG(void)
{
	UART2_DeInit();                                                 //clear all UART Register
    UART_IO_Init(IO_UART2,2);                                    	//use PA0.7->RXD2, PA0.6->TXD2
    UARTInitRxTxIntEn(UART2,208,UART_PAR_NONE);	                    //baudrate=sysclock/46=115200
	UART2_Int_Enable();
}	
/*************************************************************/
//ifc config
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void IFC_CONFIG(void)
{
	EnIFCClk;						//使能IFC时钟
	IFC->MR=(IFC->MR&0xfffffeff)|(0x01<<8);		//设置为并行模式
	//IFC_interrupt_CMD(ENABLE,ERS_END_INT);		//擦除完成指令中断
	//IFC_interrupt_CMD(ENABLE,RGM_END_INT);		//编程指令执行完成中断
	//IFC_interrupt_CMD(ENABLE,PEP_END_INT);		//预编程指令执行完成中断
	//IFC_Int_Enable();
}
/*************************************************************/
//adc config
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void ADC12_CONFIG(void)
{
	ADC12_RESET_VALUE();																//ADC 所有寄存器复位赋值
	ADC12_CLK_CMD(ADC_CLK_CR , ENABLE);                                                 //使能 ADC CLK
    ADC12_Software_Reset();                                                             //ADC 软件复位
	ADC12_Configure_Mode(ADC12_12BIT ,  One_shot_mode ,0, 6 ,24 ,1);        				//选择12BIT ADC; 连续模式; 转换优先序列寄存器为0; 采样保持时间=6 ;ADC_CLK=PCLK/2*24=1us; 转换序列个数为1
//	ADC12_Configure_Mode(ADC12_12BIT ,  One_shot_mode ,0, 6 ,DIV ,1); 
	ADC12_Configure_VREF_Selecte(ADC12_VREFP_VDD_VREFN_VSS);					//选择内部INTVREF=1v做参考电压，VREF-选择VSS,选择INTVREF做参考，ADC_CLK不能超过2M
	ADC12_ConversionChannel_Config(ADC12_ADCIN4,ADC12_CV_RepeatNum1,ADC12_AVGDIS,0); 
//	ADC12_ConversionChannel_Config(ADC12_ADCIN11,ADC12_CV_RepeatNum1,ADC12_AVGDIS,1); 
//	ADC12_ConversionChannel_Config(ADC12_ADCIN0,ADC12_CV_RepeatNum1,ADC12_AVGDIS,0);//转换序列0,选择ADCIN0通道, 6个转换周期, 连续重复采样次数为1平均值计算禁止
	//ADC12_ConversionChannel_Config(ADC12_ADCIN1,ADC12_CV_RepeatNum1,ADC12_AVGDIS,1);//转换序列1,选择ADCIN1通道, 6个转换周期, 连续重复采样次数为1,平均值计算禁止
	ADC12_CMD(ENABLE);                                                                  //使能ADC模块
	ADC12_ready_wait(); 																//等待ADC模块配置完成
	ADC12_Control(ADC12_START);							
}
/*************************************************************/
//The ADC sampling
//EntryParameter:ADC12_ADCINx
//ReturnValue:result
/*************************************************************/
U16_T ADC12_ReadValue(U8_T ADC12_ADCINx)
{	
	ADC12_CONFIG();
	volatile U32_T AdcValTmp = 0;
	volatile U32_T SumValTmp = 0;
	volatile U32_T AdcVal = 0;
	U8_T LoopI;
    ADC12_ConversionChannel_Config(ADC12_ADCINx,ADC12_CV_RepeatNum1,ADC12_AVGDIS,0);
	SumValTmp = 0;
	ADC12_SEQEND_wait(0); //等待转换序列 0 转换完成
	AdcValTmp= ADC0->DR[0]; //转换结果保存
	ADC12_Control(ADC12_START); //ADC 模块启动
	AdcValTmp= 0;
    for( LoopI=0; LoopI<8; LoopI++ )
	{
		delay_ms(1);
		ADC12_SEQEND_wait(0); //等待转换序列 0 转换完成
		AdcValTmp= ADC0->DR[0]; //转换结果保存
		ADC12_Control(ADC12_START); //ADC 模块启动
		SumValTmp = SumValTmp+ (AdcValTmp & 0xfff);
		delay_ms(1);
		
	}
	AdcVal = SumValTmp / 8;
	return AdcVal;

}

/**
  *@函数功能：SYSCON 配置
  *@函数形参：void
  *@函数返回值：void
  *@函数说明：
    1.打开ISOSC内部振荡器
	2.选择48MHZ HFOSC作为SYSCLK时钟源
	3.HCLK = SYSCLK / HCLK_DIV = 48MHZ / 1 = 48MHZ
	4.PCLK = HCLK / PCLK_DIV =  48MHZ / 1 = 48MHZ
  */
void SYSCON_CONFIG(void)
{
	/* SYSTEM CLK AND PCLK FUNTION */
	SYSCON_RST_VALUE(); /* SYSCON all register clr */
	SYSCON_General_CMD(ENABLE,ENDIS_ISOSC); /* 打开ISOSC内部振荡器 */ 
	SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_48M); /* 选择48MHZ HFOSC作为SYSCLK时钟源 */
	SystemCLK_HCLKDIV_PCLKDIV_Config(SYSCLK_HFOSC, HCLK_DIV_1, PCLK_DIV_1, HFOSC_48M); /* HCLK = 48MHZ，SYSCLK = 48MHZ */
//------------  WDT FUNTION  --------------------------------/
    SYSCON_IWDCNT_Config(IWDT_TIME_2S,IWDT_INTW_DIV_7);      					//WDT TIME 1s,WDT alarm interrupt time=1s-1s*1/8=0.875S
    SYSCON_WDT_CMD(DISABLE);                                                  	//enable WDT		
    SYSCON_IWDCNT_Reload();                                                   	//reload WDT
	//IWDT_Int_Enable();
//------------  WWDT FUNTION  --------------------------------/
	WWDT_CNT_Load(0xFF);
	WWDT_CONFIG(PCLK_4096_DIV0,0xFF,WWDT_DBGDIS);
	WWDT_Int_Config(DISABLE);
	//WWDT_CMD(ENABLE);
//------------  CLO  --------------------------------/	
	//SYSCON_CLO_CONFIG(CLO_PA02);
	//SYSCON->OPT1=(SYSCON->OPT1&0XFFFF8000)|(0X01<<12)|(0X04<<8)|(0x00<<4);
//------------  LVD FUNTION  --------------------------------/ 
    SYSCON_LVD_Config(DISABLE_LVDEN,INTDET_LVL_3_3V,RSTDET_LVL_1_9V,DISABLE_LVD_INT,INTDET_POL_fall);   //LVD LVR Enable/Disable
    //LVD_Int_Enable();
//------------ EVTRG function --------------------------------/ 	
	SYSCON->EVTRG=0X00|0x01<<20;											//SYSCON_trgsrc0
	SYSCON->EVPS=0X00;
	
	SYSCON->IMER =EM_EVTRG0_ST;
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
    SYSCON->PCDR0 = 0xFFFFFFF0;
	SYSCON->PCDR1 = 0xFFFFFFFF;
	SYSCON->PCER0 = 0x00000691;                                        //PCLK Enable  0x00410071
    SYSCON->PCER1 = 0x00022A00;                                        //PCLK Enable
    while(!(SYSCON->PCSR0 & 0x1));                                    //Wait PCLK enabled	
	
	/* ISOSC/IMOSC/EMOSC/SYSCLK/IWDT/LVD/EM_CMFAIL/EM_CMRCV/CMD_ERR OSC stable interrupt */
    SYSCON_CONFIG(); /* SYSCON initial */
	SYSCON->GCDR |= 0x0B << 12; /* 禁止深度休眠下的ISOSC/IMOSC/EMOSC */
	SYSCON_INT_Priority();
	CK_CPU_EnAllNormalIrq();                                         //enable all IRQ
	
	UART1_CONFIG(115200); /* uart1用于串口烧录，不要修改它的初始化及中断函数 */ 
	
	Coret_Init();
	led_hardware_setup();
	adc_hardware_setup();
	charging_hardware_setup();
	communicate_hardware_setup(300);
	LPT_Init();

	//IFC_CONFIG();
}
