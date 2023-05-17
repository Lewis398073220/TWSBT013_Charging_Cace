#ifndef _TIME_DELAY_H
#define _TIME_DELAY_H

#include "apt32f102.h"
#include "apt32f102_coret.h"
#include "apt32f102_syscon.h"

extern volatile U32_T SYSCLK;

void Coret_Init(void);
void Coret_DelayUs(U64_T nus);
void Coret_DelayMs(U64_T nms);


#endif
