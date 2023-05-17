#include "apt32f102_delay.h"

volatile unsigned int dlytimer[2] ={0,0};

//代码延时函数
//about 1us step @ PCLK 20MHz,Optimization -Og
// t=0 ,1.98us
// t=1 ,1.98us
// t=2 ,1.98us
// t=3 ,3.02us
void delayus_Bycode(unsigned int t)
{
	volatile unsigned int i =  t>1?t-2:0;
	while(i--){
		asm("nop");
		asm("nop");
		asm("nop");
		asm("nop");
		asm("nop");
		asm("nop");
	}
}

//代码延时函数
//about 360ns step @ PCLK 20MHz,Optimization -Og
// t=0 ,0.92us
// t=1 ,1.24us
// t=2 ,1.60us
// t=3 ,1.94us
void delay360ns_Bycode(unsigned int t)
{
	while(t-->0){
		asm("nop");
	}
}

//代码延时函数
//1ms step @ PCLK 20MHz,Optimization -Og
// t=0 ,3.00us
// t=1 ,1.00ms
// t=2 ,2.00ms
// t=3 ,3.00ms
void delayms_Bycode(unsigned int t)
{
	volatile unsigned int i = t;
	while(i--){
		delayus_Bycode(940);
	}
}


//定时器延时函数 定时器周期1ms
void delay_ms(unsigned int t){
	volatile unsigned int i = t;
	dlytimer[dlyms] = 0;
	while(dlytimer[dlyms] < i){};
}

//定时器延时函数 定时器周期1us
void delay_us(unsigned int t){
	dlytimer[dlyus] = 0;
	while(dlytimer[dlyus] < t){};
}