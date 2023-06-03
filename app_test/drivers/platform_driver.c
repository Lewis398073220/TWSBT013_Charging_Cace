#include "platform_driver.h"

void ReduceSYSCLKto5556KHZ(void)
{
	CK_CPU_DisAllNormalIrq(); /* 关闭所有中断 */
	
	SYSCLK = 5556000u;
	
	UARTClose(UART1);
	UART1_CONFIG(115200);

	
	UARTClose(UART2);
	communicate_hardware_setup(200);
	
	LPT_Stop();
	LPT_Init();
	
	SYSCON->GCDR |= 1 << 1; /* 关闭IMOSC */
	SYSCON->OPT1 = (SYSCON->OPT1 & 0xfffffffc) | 0; /* 切换5.556MHZ */
	SYSCON->GCER |= 1 << 1;  /* 打开IMOSC */
	while((SYSCON->CKST & 0x2) == 0);
	SYSCON->SCLKCR = 0xd22d << 16 ; /* 主时钟切换到IMOSC */
	while((SYSCON->CKST & 0x100) == 0);
	SYSCON->PCLKCR = 0xc33c << 16;
	SYSCON->GCDR |= 1 << 4; /* 关闭高速时钟 */
	while(SYSCON->GCSR & 0x10);
	Coret_DelayMs(20); /* 延时使系统稳定 */

	CK_CPU_EnAllNormalIrq(); 
}

/* state machine时基初始化 */
void LPT_Init(void)
{
	U32_T period = SYSCLK / 4 / 1000;
	
	LPT_DeInit();
	/* LPTCLK = PCLK / 4；Immediate模式；不分频；连续计数工作模式 */
	LPT_Configure(LPTCLK_EN, LPT_PCLK_DIV4, LPT_IMMEDIATE, LPT_PSC_DIV0, 0, LPT_OPM_CONTINUOUS);
	LPT_Period_CMP_Write(period, 0); /* 每1ms进一次中断 */
	LPT_ConfigInterrupt_CMD(ENABLE, LPT_PEND); /* 使能周期结束中断 */
	LPT_INT_ENABLE(); /* 使能NVIC响应中断 */
	LPT_Start();
}

/**
  *@函数功能：LED引脚的初始化
  *@函数形参：void
  *@函数返回值：void
  *@函数说明：
    1.LEDR--GPIOB0.02--EPT
	2.LEDG--GPIOB0.03
	3.LEDB--GPIOA0.08
	4.EPT_CLK = PCLK / (555 + 1) = 5556KHZ / 556 ≈ 10KHZ
	5.GPT_CLK = PCLK / (555 + 1) = 5556KHZ / 556 ≈ 10KHZ
  */
void led_hardware_setup(void)
{
	/* 红灯引脚初始化 */
	EPT_Software_Prg();
	EPT_IO_SET(EPT_IO_CHBX, IO_NUM_PB02);
	/* PCLK作为时钟源；Immediate模式；递增模式；连续计数工作模式；EPTCLK = PCLK / (PSC + 1)；波形输出被停止时，GPIO高阻输出 */
	EPT_PWM_Config(EPT_Selecte_PCLK, EPT_CNTMD_increase, EPT_OPM_Continue, 55);
	/* CMPB作为CA和CB的数据源；当CNT等于零时，置位输出；当CNT等于PRDR时，不动作；当CNT等于CA，且此时计数方向为递增时，清除输出 */
	EPT_PWMX_Output_Control(EPT_PWMB, EPT_CA_Selecte_CMPB, EPT_CB_Selecte_CMPB, EPT_PWM_ZRO_Event_OutHigh, EPT_PWM_PRD_Event_Nochange, EPT_PWM_CAU_Event_OutLow, EPT_PWM_CAD_Event_Nochange,
							EPT_PWM_CBU_Event_Nochange, EPT_PWM_CBD_Event_Nochange, EPT_PWM_T1U_Event_Nochange, EPT_PWM_T1D_Event_Nochange, EPT_PWM_T2U_Event_Nochange, EPT_PWM_T2D_Event_Nochange);	
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(2000, 0, 2000, 0, 0); /* PWM频率：50HZ */	
	EPT_Int_Enable(EPT_PEND); /* 使能周期结束中断 */
	EPT_Vector_Int_Enable();
	//EPT_Start();
	EPT_Stop(); /* 红灯默认关闭 */

	/* 蓝灯引脚初始化 */
	GPIO_Init(blue_led_pin, Output); /* 输出模式，输入禁止 */
	GPIO_Write_High(blue_led_pin);
	
	/* 绿灯引脚初始化 */
	EPT_IO_SET(EPT_IO_CHAY, IO_NUM_PB03);
	//GPIO_Init(green_led_pin, Output); /* 输出模式，输入禁止 */
	//GPIO_Write_High(green_led_pin);
}

/* EPT0 Interrupt */
void EPT0IntHandler(void) 
{
	if((EPT0->MISR & EPT_PEND) == EPT_PEND)
	{
		EPT0->ICR = EPT_PEND;
		
		static U8_T flag = 0;
		static U8_T BreathCnt = 0;
		static U8_T SoildTime = 0;

		if((EPT0->CMPB == 0) && (SoildTime == 25)) flag = 1;
		else if(EPT0->CMPB == 2000) 
		{
			flag = 0;
			BreathCnt = 0;
			SoildTime = 0;
		}
		if(flag == 0) /* 暗到亮 */
		{
			if(EPT0->CMPB == 0) SoildTime++; /* 亮0.5秒后变暗 */
			else EPT0->CMPB -= 80;
		}
		else if(flag == 1) /* 亮到暗 */
		{
			if(EPT0->CMPB == 1976) BreathCnt++; /* 完成一次呼吸灯 */
				else if(EPT0->CMPB < 1976) EPT0->CMPB += 26;
			
			if(BreathCnt == 1)
			{
				EPT_Stop();
				return;
			}
		}
	}
	else if((EPT0->MISR & EPT_TRGEV0_INT) == EPT_TRGEV0_INT)
	{
		EPT0->ICR = EPT_TRGEV0_INT;
	}
	else if((EPT0->MISR & EPT_TRGEV1_INT) == EPT_TRGEV1_INT)
	{
		EPT0->ICR = EPT_TRGEV1_INT;
	}
	else if((EPT0->MISR & EPT_TRGEV2_INT) == EPT_TRGEV2_INT)
	{
		EPT0->ICR = EPT_TRGEV2_INT;
	}
	else if((EPT0->MISR & EPT_TRGEV3_INT) == EPT_TRGEV3_INT)
	{
		EPT0->ICR = EPT_TRGEV3_INT;
	}	
	else if((EPT0->MISR & EPT_CAP_LD0) == EPT_CAP_LD0)
	{
		EPT0->ICR = EPT_CAP_LD0;
	}
	else if((EPT0->MISR & EPT_CAP_LD1) == EPT_CAP_LD1)
	{
		EPT0->ICR = EPT_CAP_LD1;
	}
	else if((EPT0->MISR & EPT_CAP_LD2) == EPT_CAP_LD2)
	{
		EPT0->ICR = EPT_CAP_LD2;
	}
	else if((EPT0->MISR & EPT_CAP_LD3) == EPT_CAP_LD3)
	{
		EPT0->ICR = EPT_CAP_LD3;
	}
	else if((EPT0->MISR & EPT_CAU) == EPT_CAU)
	{
		EPT0->ICR = EPT_CAU;
	}
	else if((EPT0->MISR & EPT_CAD) == EPT_CAD)
	{
		EPT0->ICR = EPT_CAD;
	}
	else if((EPT0->MISR & EPT_CBU) == EPT_CBU)
	{
		EPT0->ICR = EPT_CBU;
	}
	else if((EPT0->MISR & EPT_CBD) == EPT_CBD)
	{
		EPT0->ICR = EPT_CBD;
	}
	else if((EPT0->MISR & EPT_CCU) == EPT_CCU)
	{
		EPT0->ICR = EPT_CCU;
	}
	else if((EPT0->MISR & EPT_CCD) == EPT_CCD)
	{
		EPT0->ICR = EPT_CCD;
	}
	else if((EPT0->MISR & EPT_CDU) == EPT_CDU)
	{
		EPT0->ICR = EPT_CDU;
	}
	else if((EPT0->MISR & EPT_CDD) == EPT_CDD)
	{
		EPT0->ICR = EPT_CDD;
	}
	//紧急中断
	if((EPT0->EMMISR & EPT_EP0_EMINT) == EPT_EP0_EMINT)
	{
		EPT0->EMICR = EPT_EP0_EMINT;
	}
	else if((EPT0->EMMISR & EPT_EP1_EMINT) == EPT_EP1_EMINT)
	{
		EPT0->EMICR = EPT_EP1_EMINT;
	}
	else if((EPT0->EMMISR & EPT_EP2_EMINT) == EPT_EP2_EMINT)
	{
		EPT0->EMICR = EPT_EP2_EMINT;
	}
	else if((EPT0->EMMISR & EPT_EP3_EMINT) == EPT_EP3_EMINT)
	{
		EPT0->EMICR = EPT_EP3_EMINT;
	}
	else if((EPT0->EMMISR & EPT_EP4_EMINT) == EPT_EP4_EMINT)
	{
		EPT0->EMICR = EPT_EP4_EMINT;
	}
	else if((EPT0->EMMISR & EPT_EP5_EMINT) == EPT_EP5_EMINT)
	{
		EPT0->EMICR = EPT_EP5_EMINT;
	}
	else if((EPT0->EMMISR & EPT_EP6_EMINT) == EPT_EP6_EMINT)
	{
		EPT0->EMICR = EPT_EP6_EMINT;
	}
	else if((EPT0->EMMISR & EPT_EP7_EMINT) == EPT_EP7_EMINT)
	{
		EPT0->EMICR = EPT_EP7_EMINT;
	}
	else if((EPT0->EMMISR & EPT_CPU_FAULT_EMINT) == EPT_CPU_FAULT_EMINT)
	{
		EPT0->EMICR = EPT_CPU_FAULT_EMINT;
	}
	else if((EPT0->EMMISR & EPT_MEM_FAULT_EMINT) == EPT_MEM_FAULT_EMINT)
	{
		EPT0->EMICR = EPT_MEM_FAULT_EMINT;
	}
	else if((EPT0->EMMISR & EPT_EOM_FAULT_EMINT) == EPT_EOM_FAULT_EMINT)
	{
		EPT0->EMICR = EPT_EOM_FAULT_EMINT;
	}
}

/**
  *@函数功能：NTC和VR的ADC引脚的初始化
  *@函数形参：void
  *@函数返回值：void
  *@函数说明：
	1.ADC模拟模块的时钟频率不能超过24MHz
	2.当选择INTVREF作为ADC参考电压时，ADC模拟模块的时钟频率不能超过2MHz。FVR做参考时，没有限制。
    3.FADC = PCLK / (2 * PRLVAL) = 48MHZ / (2 * 24) = 1MHZ
	
  */
void adc_hardware_setup(void)
{
	ADC12_RESET_VALUE();
	ADC12_CLK_CMD(ADC_CLK_CR, ENABLE); /* 使能ADC时钟 */
	/* 12位ADC，单次转换模式，转换优先序列寄存器为0，采样保持周期数为6，FADC=1MHZ，转换序列个数为4 */
	ADC12_Configure_Mode(ADC12_12BIT, One_shot_mode, 0, 6, 24, 4);
	//ADC12_Configure_Mode(ADC12_12BIT, Continuous_mode, 0, 6, 24, 2);
	ADC12_Configure_VREF_Selecte(ADC12_VREFP_VDD_VREFN_VSS); /* 正向为内部VDD，负向为VSS */
	/* 转换序列0，选择ADCIN10通道, 6个转换周期, 连续重复采样次数为8，平均值计算使能 */
	ADC12_ConversionChannel_Config(ADC12_ADCIN10, ADC12_CV_RepeatNum8, ADC12_AVGEN, 0);
	/* 转换序列1，选择ADCIN4通道, 6个转换周期, 连续重复采样次数为8，平均值计算使能 */
	ADC12_ConversionChannel_Config(ADC12_ADCIN4, ADC12_CV_RepeatNum8, ADC12_AVGEN, 1);
	/* 转换序列2，选择ADCIN13通道, 6个转换周期, 连续重复采样次数为8，平均值计算使能 */
	ADC12_ConversionChannel_Config(ADC12_ADCIN13, ADC12_CV_RepeatNum8, ADC12_AVGEN, 2);
	/* 转换序列3，选择ADCIN11通道, 6个转换周期, 连续重复采样次数为8，平均值计算使能 */
	ADC12_ConversionChannel_Config(ADC12_ADCIN11, ADC12_CV_RepeatNum8, ADC12_AVGEN, 3);
	ADC12_CMD(ENABLE); /* 使能ADC模块 */
	ADC12_ready_wait(); /* 等待ADC完成下一个转换的准备 */
	//ADC12_Control(ADC12_START);	/* 开始模数转换 */	
}

/**
  *@函数功能：与充电功能相关的引脚的初始化
  *@函数形参：void
  *@函数返回值：void
  *@函数说明：
    1.GPIOA0.03--CHG_DET
	2.GPIOB0.01--5V_EN
	3.GPIOA0.11--CHRG_STAT
	4.GPIOA0.00--NTC_DET
  */
void charging_hardware_setup(void)
{
	//5V升压引脚初始化
	GPIO_Init(charge_5V_boost_pin, Output); /* 输出模式，输入禁止 */
	GPIO_Write_Low(charge_5V_boost_pin);
	
	//USB5V插入检测引脚初始化
	GPIO_IntGroup_Set(GPIOA, 3, Selete_EXI_PIN3); //外部中断组1选择GPIOA0.01作为中断源								
	GPIOA0_EXI_Init(EXI3); //GPIOA0.01设置为输入模式，输出禁止
	GPIO_PullHighLow_DIS(charge_USB5V_detect_pin);
	EXTI_trigger_CMD(ENABLE, EXI_PIN3, _EXIRT); //EXI1上升沿触发中断
	EXTI_trigger_CMD(ENABLE, EXI_PIN3, _EXIFT); //EXI1下降沿触发中断
	EXTI_interrupt_CMD(ENABLE, EXI_PIN3); //打开EXI1中断源
	GPIO_EXI_EN(GPIOA0, EXI3); //使能EXI1外部中断
	EXI2_Int_Enable(); //使能NVIC对EXI1中断向量的响应
	EXI2_WakeUp_Enable();
	
	//充电状态引脚初始化
	GPIO_Init(charge_status_pin, Intput);
	GPIO_PullHigh_Init(charge_status_pin);
	
	//充电使能引脚初始化
	GPIO_Init(charge_enable_pin, Output); /* 输出模式，输入禁止 */
	GPIO_Write_Low(charge_enable_pin);
	GPIO_PullHighLow_DIS(charge_enable_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗

	//ntc det引脚初始化
	GPIO_Init(NTC_detect_pin, Output); /* 输出模式，输入禁止 */
	GPIO_Write_Low(NTC_detect_pin);

	//充电分段电流引脚初始化
	GPIO_Init(charge_wireless_iset_pin, Output); /* 输出模式，输入禁止 */
	GPIO_PullHighLow_DIS(charge_wireless_iset_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗
	GPIO_Write_Low(charge_wireless_iset_pin);

	GPIO_InPutOutPut_Disable(charge_wired_iset_pin);
	GPIO_PullHighLow_DIS(charge_wired_iset_pin);
	//GPIO_Init(charge_wired_iset_pin, Output); /* 输出模式，输入禁止 */
	//GPIO_Write_Low(charge_wired_iset_pin);

	//无线充5V检测引脚初始化
	GPIO_IntGroup_Set(GPIOA, 0, Selete_EXI_PIN0); /* 外部中断组1选择GPIOA0.01作为中断源 */								
	GPIOA0_EXI_Init(EXI0); /* GPIOA0.01设置为输入模式，输出禁止 */ 
	GPIO_PullHighLow_DIS(charge_wireless5V_dectect_pin);
	EXTI_trigger_CMD(ENABLE, EXI_PIN0, _EXIRT); /* EXI1上升沿触发中断 */ 
	EXTI_trigger_CMD(ENABLE, EXI_PIN0, _EXIFT); /* EXI1下降沿触发中断 */ 
	EXTI_interrupt_CMD(ENABLE, EXI_PIN0); /* 打开EXI1中断源 */
	GPIO_EXI_EN(GPIOA0, EXI0); /* 使能EXI1外部中断 */
	EXI0_Int_Enable(); /* 使能NVIC对EXI1中断向量的响应 */
	EXI0_WakeUp_Enable();
}

/**
  *@函数功能：与通信相关的引脚的初始化
  *@函数形参：
  *@函数返回值：void
  *@函数说明：
    1.GPIOA0.01--Hall_EN
	2.GPIOB0.05--Pattern EN
	3.GPIOA0.04--Pairing Button
  */
void communicate_hardware_setup(U32_T BaudRate)
{
	U32_T BaudDiv = 0;
		
	BaudDiv = SYSCLK / BaudRate;

	/* 霍尔检测引脚初始化 */
	GPIO_IntGroup_Set(GPIOA, 1, Selete_EXI_PIN1); /* 外部中断组1选择GPIOA0.01作为中断源 */								
	GPIOA0_EXI_Init(EXI1); /* GPIOA0.01设置为输入模式，输出禁止 */ 
	GPIO_PullHighLow_DIS(hall_en_pin);
	EXTI_trigger_CMD(ENABLE, EXI_PIN1, _EXIRT); /* EXI1上升沿触发中断 */ 
	EXTI_trigger_CMD(ENABLE, EXI_PIN1, _EXIFT); /* EXI1下降沿触发中断 */ 
	EXTI_interrupt_CMD(ENABLE, EXI_PIN1); /* 打开EXI1中断源 */
	GPIO_EXI_EN(GPIOA0, EXI1); /* 使能EXI1外部中断 */
	EXI1_Int_Enable(); /* 使能NVIC对EXI1中断向量的响应 */
	EXI1_WakeUp_Enable();
	
	/* 按键引脚初始化 */
	GPIO_IntGroup_Set(GPIOA, 4, Selete_EXI_PIN4); /* 外部中断组4选择GPIOA0.04作为中断源 */								
	GPIOA0_EXI_Init(EXI4); /* GPIOA0.04设置为输入模式，输出禁止 */ 
	GPIO_PullLow_Init(key_pin);
	EXTI_trigger_CMD(ENABLE, EXI_PIN4, _EXIRT); /* EXI4上升沿触发中断 */ 
	//EXTI_trigger_CMD(ENABLE, EXI_PIN4, _EXIFT); /* EXI4下降沿触发中断 */ 
	EXTI_interrupt_CMD(ENABLE, EXI_PIN4); /* 打开EXI4中断源 */
	//GPIO_EXTI_interrupt(GPIOA0, EXI_PIN4);
	GPIO_EXI_EN(GPIOA0, EXI4); /* 使能EXI4外部中断 */
	EXI3_Int_Enable(); /* 使能NVIC对EXI3中断向量的响应 */
	EXI3_WakeUp_Enable();

	#if 0
	GPIO_Init(pattern_TX_pin, Output);
	GPIO_Write_High(pattern_TX_pin);	
	GPIO_Init(pattern_RX_pin, Output);
	GPIO_Write_High(pattern_RX_pin);
	#else
	UART2_DeInit();                                                 //clear all UART Register
    UART_IO_Init(IO_UART2, 2);                                    	//use PB0.5->RXD2, PB0.4->TXD2
	UARTInitRxIntEn(UART2, BaudDiv, UART_PAR_NONE);	                    //baudrate=sysclock/46=115200
	UART2_Int_Enable();
	#endif
}

/* 不用编写中断服务函数，因为只用到中断唤醒CPU */
void EXI1IntHandler(void) 
{
	if((SYSCON->EXIRS & EXI_PIN1) == EXI_PIN1) 
	{
		SYSCON->EXICR = EXI_PIN1; /* 清除EXI1中断标志 */
	}
}

void EXI4to8IntHandler(void) 
{
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN4)==EXI_PIN4) 
	{
		SYSCON->EXICR = EXI_PIN4;
	} 
	else if ((SYSCON->EXIRS&EXI_PIN5)==EXI_PIN5) 
	{
		SYSCON->EXICR = EXI_PIN5;
	} 
	else if ((SYSCON->EXIRS&EXI_PIN6)==EXI_PIN6) 
	{
		SYSCON->EXICR = EXI_PIN6;
	} 
	else if ((SYSCON->EXIRS&EXI_PIN7)==EXI_PIN7) 
	{
		SYSCON->EXICR = EXI_PIN7;
	} 
	else if ((SYSCON->EXIRS&EXI_PIN8)==EXI_PIN8) 
	{
		SYSCON->EXICR = EXI_PIN8;
	}

}

