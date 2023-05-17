#ifndef __BOOT_LOADER_H
#define __BOOT_LOADER_H
#include "apt32f102_types_local.h"
/* defines ,should be modified by user if not fit your case -----------------*/
#define APP_START_ADDR 0x2000ul
#define APP_EIP_ADDR 0x2108ul
#define ROM_END_ADDR 0xfffful  //如果使用的dataflash功能，注意修改这个参数

/* defines ,donot change------------------------------------------------------*/


/* externs--------- ----------------------------------------------------------*/
//extern int flashInit(void);
//extern int flashUnInit(void);
extern int flashID(unsigned int* flashID);
extern int flashProgram(char* dst, char *src, int length);
extern int flashRead(char* dst, char *src, int length);
extern U32_T Flash_Read_Word(U32_T addr);
extern int flashErase(char *dst, int length);
extern int flashChipErase(void);
extern void enable_WDT(void);
extern void feed_WDT(void);

extern void Powerup_init(void);
extern void prog_uart_init(void);
extern void dbgprint_uart_init(void);

extern char check_boot_option(void);
extern int program_process(void);
extern int verify_process(void);
extern int boot_process(void);
extern int rst_mcu(void);
extern void wait_cmd(void);



#endif   /**END OF BOOT_LOADER */
