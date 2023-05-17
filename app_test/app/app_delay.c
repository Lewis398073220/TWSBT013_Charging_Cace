#include "app_delay.h"

volatile U32_T CORETCLK;

/**
  *@函数功能：内核定时器初始化
  *@函数形参：void
  *@函数返回值：void
  *@函数说明：
    1.CORETCLK = SYSCLK / 8
  */
void Coret_Init(void)
{
	SYSCON_General_CMD(ENABLE, ENDIS_SYSTICK); /* 打开CORET时钟 */
	
	CORET_DeInit();
	CORET_CLKSOURCE_EX(); /* 时钟源为(CORECLK/8) */													
	CORET_TICKINT_Enable(); /* 使能计数到0的中断 */	
	CORET_reload(); /* 清零计数器，同时清零“计数到0”状态位 */
	CORET_stop(); /* 停止计时 */
	
	CORET_Int_Disable(); /* 禁止NVIC响应中断 */			
}

void StartTimer(U32_T cnt)
{
	CK801->CORET_RVR = cnt; /* 加载预重载值 */	
	CORET_reload(); /* 清零计数器，同时清零“计数到0”状态位 */
	CORET_start(); /* 开始计时 */
	while((CK801->CORET_CSR & (1 << 16)) == 0); /* 等待计数到0 */
	CORET_stop(); /* 停止计时 */
}

/**
  *@函数功能：微秒级延时
  *@函数形参：U64_T nus
  *@函数返回值：void
  *@函数说明：
    1.nus = (CORET_RVR + 1) / 1000000 * (1 / CORETCLK)
  */
void Coret_DelayUs(U64_T nus)
{
	U64_T cnt, CntInteg, CntRemain;
	
	CORETCLK = SYSCLK / 8;
	cnt = CORETCLK * nus / 1000000;
	
	if(cnt > 16777215)
	{
		CntInteg = cnt / 16777215;
		CntRemain = cnt % 16777215;
		
		while(CntInteg--) StartTimer(16777215);
		if(CntRemain != 0) StartTimer(CntRemain);
	}else StartTimer(cnt);
}  

/**
  *@函数功能：毫秒级延时
  *@函数形参：U64_T nms
  *@函数返回值：void
  *@函数说明：
    1.nus = (CORET_RVR + 1) / 1000 * (1 / CORETCLK)
  */
void Coret_DelayMs(U64_T nms)
{
	U64_T cnt, CntInteg, CntRemain;
	
	CORETCLK = SYSCLK / 8;
	cnt = CORETCLK * nms / 1000;
	
	if(cnt > 16777215)
	{
		CntInteg = cnt / 16777215;
		CntRemain = cnt % 16777215;
		
		while(CntInteg--) StartTimer(16777215);
		if(CntRemain != 0) StartTimer(CntRemain);
	}else StartTimer(cnt);
}
