#include "app_state_machine.h"
#include "app_communicate.h"

static volatile U16_T Time1msCnt;
static volatile U16_T Time10msCnt;
static volatile U16_T Time50msCnt;
static volatile U16_T Time100msCnt;
static volatile U16_T Time1sCnt;
static volatile U16_T Time5sCnt;
static volatile U16_T Time10sCnt;
volatile U8_T TimerFlag;

void timer_count(void)
{
	TimerFlag |= TIMER_1MS_FLAG;
	Time1msCnt++;
	
	if(Time1msCnt >= 10)
	{
		Time1msCnt = 0;
		TimerFlag |= TIMER_10MS_FLAG;
		Time10msCnt++;
		
		if(Time10msCnt >= 5)
		{
			Time10msCnt = 0;
			TimerFlag |= TIMER_50MS_FLAG;
			Time50msCnt++;
			key_debounce_handler();
			
			if(Time50msCnt >= 2)
			{
				Time50msCnt = 0;
				TimerFlag |= TIMER_100MS_FLAG;
				Time100msCnt++;
				
				if(Time100msCnt >= 10)
				{
					Time100msCnt = 0;
					TimerFlag |= TIMER_1S_FLAG;
					Time1sCnt++;
					
					if(Time1sCnt >= 5)
					{
						Time1sCnt = 0;
						TimerFlag |= TIMER_5S_FLAG;
						Time5sCnt++;
						
						if(Time5sCnt >= 2)
						{
							Time5sCnt = 0;
							TimerFlag |= TIMER_10S_FLAG;
							Time10sCnt++;
						}
					}
				}
			}
		}
	}
}

/* LPT Interrupt */
void LPTIntHandler(void) 
{
	if((LPT->MISR & LPT_PEND) == LPT_PEND)
	{
		LPT->ICR = LPT_PEND;
		timer_count();
	}
	else if((LPT->MISR & LPT_TRGEV0) == LPT_TRGEV0)
	{
		LPT->ICR = LPT_TRGEV0;
	} 
	else if((LPT->MISR & LPT_MATCH) == LPT_MATCH)
	{
		LPT->ICR = LPT_MATCH;
	}
}

