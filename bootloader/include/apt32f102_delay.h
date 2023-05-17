#ifndef __DELAY__H
#define __DELAY__H

typedef enum{
	dlyms =0,
	dlyus =1,
}DLYTIMER_DEF;

extern volatile unsigned int dlytimer[2];

extern void delay360ns_Bycode(unsigned int t);
extern void delayus_Bycode(unsigned int t);
extern void delayms_Bycode(unsigned int t);
extern void delay_ms(unsigned int t);
extern void delay_us(unsigned int t);

#endif /**end of DELAY_H */