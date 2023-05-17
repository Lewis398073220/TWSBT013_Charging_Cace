#include "apt32f102.h"
#include "apt32f102_gpio.h"
#include "apt32f102_syscon.h"
#include "apt32f102_uart.h"
#include "apt32f102_ifc.h"
#include "apt32f102_types_local.h"
#include "bootloader.h"
#include "apt32f102_delay.h"

/* defines -------------------------------------------------------------------*/
//IFC driver error code
#define ERROR_INIT      -200
#define ERROR_READID    -201
#define ERROR_PROGRAM   -202
#define ERROR_READ      -203
#define ERROR_ERASE     -204
#define ERROR_CHIPERASE -205
#define ERROR_UNINIT	-206

//bootloader error code
#define BOOTERR_VERIFY  -333

/* externs--------- ----------------------------------------------------------*/

/* global variables ---------------------------------------------------------*/

//volatile U8_T bootfailed =0;
volatile U8_T progfailed =0;
volatile U8_T wtdogtimeout =0;

#define PROG_UART_SEND(a) 	UARTTxByte(UART1,a)
#define PROG_UART_GETCHAR()	(UART1->DATA)
#define MCURST_SYNC_IN_SET		GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)  | 0x00100000;
#define MCURST_SYNC_IN_Status   GPIO_Read_Status(GPIOA0,13)

#define END_CNT_NUM 50
#define BufSize 0x100
#define progInteval 0x100     //此值尽量与BufSize是整数倍的关系
volatile unsigned char g_rwBuffer[BufSize];
unsigned int g_flashID = 0;
int g_error = 0;

volatile unsigned char recbuf_full =0;
volatile unsigned int indx =0;
volatile int recbufdatalen =0;
volatile unsigned int programcnt =0;
volatile int programendflagcnt=0;
volatile unsigned int imagesize =0;
volatile unsigned int addroffset =0;
static volatile U8_T patternState =0;
static volatile U8_T codeindex =0;
#define CODELEN 8
static volatile U8_T recstatus =0;
volatile U8_T startpattern[CODELEN] = {0x1,0x2,0x3,0x4,0x5,0x6,0x7,0x8};
volatile U8_T startflag =0;
volatile U8_T rstflag =0;
volatile U8_T stopflag =0;
volatile U8_T rstpattern[CODELEN] = {0xF5,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8};

volatile U32_T binStartAddrReced = 0;
volatile U32_T binEndAddrReced = 0;
volatile U32_T APPjmpAddrReced = 0;
volatile U32_T CheckNumReced = 0;

extern void UART0_CONFIG(void);
/* Functions--------- ----------------------------------------------------------*/
/***********************************************************************

函数功能：字符串比较函数

***********************************************************************/

void check_pattern_code(U8_T rec,volatile U8_T *code,volatile U8_T *flag)
{
	switch(patternState)
	{
		case 0:
			if(rec == 0xEF) 
			{
				patternState =1;
				codeindex =0;
			}
			break;
		case 1:
			if(codeindex == CODELEN) 
			{				
				patternState =2;
				break;
			}
			if(rec == code[codeindex])
			{
				codeindex++;
			}
			else
			{
				codeindex =0;
				patternState =0;
			}
			break;
		case 2:
			if(rec == 0xFF) 
			{
				*flag =1;
				patternState =0;
			}
			break;
		default:
			patternState =0;
			break;		
	}
}

/***********************************************************************

函数功能：串口接收处理函数

***********************************************************************/

void ProgUartPageRec(void)
{
	volatile U8_T temp;
	temp = (U8_T) PROG_UART_GETCHAR();
	switch(recstatus)
	{
		case 0:
			check_pattern_code(temp,startpattern,&startflag);
			break;
		case 1:
			imagesize++;
			if(temp == 0X00)
				programendflagcnt++;
			else 
				programendflagcnt =0;
			break;
		case 2:
			check_pattern_code(temp,rstpattern,&rstflag);
			break;
		default:
			break;
	}
	g_rwBuffer[indx] = temp;
	indx++;
	recbufdatalen++;
	//imagesize++;
	if(indx == BufSize ) 
	{
		recbuf_full =1;
		indx =0;
	}
}

/***********************************************************************

函数功能：MCU发送响应字符串

***********************************************************************/
void SendBackStr(const char *str,U8_T len, U8_T rep)
{		
	U8_T i,j =0;
	for(i=0;i<rep;i++)
	{
		for(j=0;j<len;j++)
		{
			//delayms_Bycode(3);
			PROG_UART_SEND(str[j]);
		}
	}
}

typedef enum{
	RstACK    =0 ,
	paramErr  =1,
	Verify 	  =2,
	BootFail  =3,
	JumptoApp =4
} ERR_TYPE;

void ErrMsgSend(U8_T no,U8_T Errtype,U8_T subno,U8_T rep)
{
	char errmsgmat[][12]={
	{"RSTACK\n"}, 		//rststr
	{"ParamErr "},	 	//ControlErr
	{"Verify "},		//VerifyF
	{"BootFail\n"},		//bootprocess
	{"JumptoApp\n"},  	//jmpPrompt
	};
	char lenmat[] = {7,9,7,9,10};
	SendBackStr((const char *)errmsgmat[no],lenmat[no],rep);
	switch(Errtype)
	{
		case 0:			
			break;
		case 1:
			SendBackStr("OK\n",3,1);
			break;
		case 2:
			SendBackStr("Fail\n",7,1);
			break;
		case 3:
			delayms_Bycode(3);
			PROG_UART_SEND(subno+'0');
			delayms_Bycode(3);
			PROG_UART_SEND('\n');
			break;
		default:
			break;
	}
}

void SendBacknum(U32_T num)
{
	char cc;
	U8_T i;
	for(i=0;i<8;i++){
		cc = (num >> ((7-i) << 2)) & 0xF;
		if(cc < 10) cc += '0';
		else cc += ('A' - 10);
		PROG_UART_SEND(cc);
	}
}

/***********************************************************************

函数功能：编程开始与结束标志判断

***********************************************************************/

U8_T check_program_start(void)
{
	U8_T i,cnt=0;
	for(i=0;i<40;i++)
	{
		delayms_Bycode(10);
		if(startflag ==1) cnt++;
		if(cnt>=5) return 1;
	}	
	return 0;
}

U8_T check_program_end(void)
{
	if(programendflagcnt > END_CNT_NUM && (imagesize > binEndAddrReced)) 
	{
		asm ("nop");
		return 1;
	}
	return 0;
}



/***********************************************************************

函数功能：清空接收缓存
返回值: 无
***********************************************************************/

void clear_rec_buffer(void)
{
	int i;
	indx=0;
	recbufdatalen=0;
	imagesize=0;
	addroffset =0;
	recbuf_full =0;
	for(i= 0;i<BufSize;i++)	g_rwBuffer[i] = 0x0;
}


/***********************************************************************

函数功能：烧录串口接收数据到flash

***********************************************************************/

int program_flash(void)
{
	//U32_T i =0;
	U32_T R_temp=0;
	addroffset = APP_START_ADDR;
	imagesize  = APP_START_ADDR;
	programcnt=0;
	while(1)
	{
		SYSCON_IWDCNT_Reload();	
		if(recbufdatalen/progInteval > 0)			//一页一页写
		{
			Page_ProgramData( addroffset , progInteval , &(g_rwBuffer[programcnt]));

			//SendBacknum(addroffset);   //如果希望在这里打印信息，上位机两次发送间的间隔需要尽量加大
			//PROG_UART_SEND('\n');
			//if(g_error == ERROR_PROGRAM) asm ("nop");
			addroffset +=progInteval;
			recbufdatalen -=progInteval;
			programcnt %=BufSize;
			
			SYSCON_IWDCNT_Reload();				
		}
		else if((addroffset>=(binEndAddrReced-binEndAddrReced%progInteval))&&(imagesize > binEndAddrReced))
		{
			Page_ProgramData( addroffset , binEndAddrReced%progInteval , &(g_rwBuffer[programcnt]));
			//SendBacknum(addroffset);   //如果希望在这里打印信息，上位机两次发送间的间隔需要尽量加大
			//PROG_UART_SEND('\n');
			do
			{
				delayms_Bycode(10);
				if(R_temp>500)
				{
					R_temp=0;
					return 1;
				}
				else
				{
					R_temp++;
				}
			}
			while(!check_program_end());
			break;
		}
	}
	return 0;
}


/***********************************************************************

函数功能：IAP 跳转到 APP 函数

***********************************************************************/
void JumptoAPP(void)
{
	volatile U32_T EIPaddr = APP_EIP_ADDR;
	asm("mov r0,%0\n"::"r"(EIPaddr):);
	//asm(" lrw r0,0x1104 ");  // APP入口地址 __start label的值
	asm(" jmp r0 ");
}

/***********************************************************************

函数功能：跳转前，简单的 APP 区域代码检查

***********************************************************************/
U8_T check_jumpAddr()
{
	volatile unsigned int temp;
	U8_T result =0;
	ReadDataOneWord(APP_START_ADDR,1,&temp);
	if(temp == (APP_EIP_ADDR)) result = 1;
	return result;
}
/***********************************************************************

函数功能：上电后，启动选项的获取进程
返回值：启动选项 'p' 进入烧录进程 | 'b' 直接启动

***********************************************************************/

char check_boot_option(void)
{
	char bootopt =0;
	int deglitchcnt;
	U32_T timecnt=0;
	MCURST_SYNC_IN_SET;
	deglitchcnt=0;
	do
	{
		SYSCON_IWDCNT_Reload(); 
		delayms_Bycode(10);
		if(!MCURST_SYNC_IN_Status)
		{
			deglitchcnt++;
		}
		else
		{
			deglitchcnt=0;
		}
		timecnt++;
		if(timecnt >= 200) 
		{
			UART1_CONFIG();
			bootopt = 'b';
			return bootopt;
		}
	}
	while(deglitchcnt<=10);				//RX 为低发送ACK信号
	UART1_CONFIG();
	delayms_Bycode(1);	
	delayms_Bycode(10);
	ErrMsgSend(RstACK,0,0,3);
	delayms_Bycode(20);
	clear_rec_buffer();
	recstatus =0;
	if(check_program_start())
	{
		startflag = 0;
		bootopt = 'p';
	}
	else
	{
		bootopt = 'b';
	}
	return bootopt;
}

/***********************************************************************

函数功能：接收主机发送的4byte控制数据
参数：time-- 等待接收的时间，非精确
参数：data-- 接收到的控制参数
返回值: 错误码

***********************************************************************/

U8_T controlword_receiving(U16_T time,volatile U32_T *data)
{
	U8_T  i;
	while(time--)
	{
		if(recbufdatalen >=4) 
		{
			data[0] =0;
			for(i=0;i<4;i++)
			{
				data[0] <<=8;	
				data[0] |= g_rwBuffer[i];				
			}
			return 0;
		}
		delayms_Bycode(1);
	}
	return 1;
}

/***********************************************************************

函数功能：计算代码镜像校验和

***********************************************************************/

U32_T cal_image_checknum(void)
{
	U32_T sum =0;
	U32_T addr;	
	U32_T endaddr;
	U32_T tempcnt=0;
	addr = binStartAddrReced;
//	if(binEndAddrReced + END_CNT_NUM > addroffset +recbufdatalen) return sum;
	endaddr = binEndAddrReced;
	while(addr<endaddr)
	{		
		sum += Flash_Read_Word(addr);
		addr +=4;
		tempcnt++;
		if(tempcnt == 100) 
		{
			SYSCON_IWDCNT_Reload();
			tempcnt =0;
		}
	}
	return sum;
}

/***********************************************************************

函数功能：对烧录的代码做校验
返回值: 错误码
***********************************************************************/

int verify_lastProg(void)
{
	U32_T check_sum = CheckNumReced+1;
	check_sum = cal_image_checknum();
	if(CheckNumReced != check_sum) 
	{
		flashErase((char *) APP_START_ADDR, (ROM_END_ADDR - APP_START_ADDR));
		return BOOTERR_VERIFY;
	}
	//SendBackStr("VrfCkSum",8,1);
	//SendBacknum(check_sum);  
	//SendBackStr("\n",1,1);
	return 0;
}


/***********************************************************************

函数功能：APP启动跳转控制进程
返回值：进程错误码

***********************************************************************/

int boot_process(void)
{
	delayus_Bycode(200);
	if(progfailed ==1 || check_jumpAddr() == 0)
	{
		ErrMsgSend(BootFail,0,0,1);
		return 1;
	}	
	ErrMsgSend(JumptoApp,0,0,1);
	clear_rec_buffer();
	delayms_Bycode(10);
	JumptoAPP();
	delayms_Bycode(10);
	return 2;
}

/***********************************************************************

函数功能：flash烧录进程
返回值：进程错误码

***********************************************************************/
int program_process(void)
{
	int err =0;
	int i;
	volatile U32_T * ptr = &binStartAddrReced;
	int tmp=0;
	//g_error = flashID(&g_flashID);
	g_error = flashErase((char *) APP_START_ADDR, (ROM_END_ADDR - APP_START_ADDR));
	delayus_Bycode(3);
	startflag = 0;
	recstatus =1;	
	ErrMsgSend(RstACK,0,0,3);
	
	for(i=0;i<4;i++)
	{
		switch(i)
		{
			case 0:
				ptr = &binStartAddrReced;
				tmp=APP_START_ADDR;
				break;
			case 1:
				ptr = &binEndAddrReced;
				tmp=binStartAddrReced;
				break;
			case 2:
				ptr = &APPjmpAddrReced;
				tmp=0;
				break;
			case 3:
				ptr = &CheckNumReced;
				tmp=0;
				break;
			default:
				break;
		}
		
		clear_rec_buffer();
		err = controlword_receiving(500,ptr);
		if(err || ptr[0] < tmp)
		{
			ErrMsgSend(paramErr,3,i,1);
			return 1;
		}
		ErrMsgSend(RstACK,0,0,3);	
	}
	
	clear_rec_buffer();
	delayms_Bycode(2);
	g_error = program_flash();
	if(g_error) 
	{
		progfailed = 1;
		return 1;
	}
	SYSCON -> IWDEDR = 0x78870000 | 0x5555; // disable watch dog
	g_error = verify_lastProg();	
	if(g_error == BOOTERR_VERIFY)
	{
		SYSCON_IWDCNT_Reload();
		ErrMsgSend(Verify,2,0,1);
		asm ("nop");
	}
	IFC->CEDR		= 0x00000000;		//IFC clock disable
	SYSCON->PCDR0	= 0x00000001;		//IFC PCLK disable
	ErrMsgSend(Verify,1,0,1);
	return 0;	
}

/***********************************************************************

函数功能：软复位MCU
返回值：进程错误码

***********************************************************************/
int rst_mcu(void)
{
	SYSCON_Software_Reset();
	delayus_Bycode(3);
	return 1;
}
 
/***********************************************************************

函数功能：等待上位机串口复位指令
返回值：无

***********************************************************************/
void wait_cmd(void)
{
	int tmpcnt =0;
	clear_rec_buffer();
	recstatus =2;
	rstflag =0;	
	while(1)
	{		
		if(rstflag) break;
		tmpcnt++;
		tmpcnt %= 1000;
		if(tmpcnt == 999) SYSCON_IWDCNT_Reload();
	}
	ErrMsgSend(RstACK,0,0,3);
	delayms_Bycode(50);	
	rst_mcu();
 }
