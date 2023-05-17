#include "apt32f102.h"
#include "apt32f102_gpio.h"
#include "apt32f102_syscon.h"
#include "apt32f102_uart.h"
#include "apt32f102_ifc.h"
#include "apt32f102_types_local.h"
#include "bootloader.h"
/**IFC  **********************************************************************/

/**
 * Driver for flash program.
 */
#define CK_UINT8  unsigned char
#define CK_UINT16 unsigned short
#define CK_UINT32 unsigned int

/**
 * ERROR TYPE. MUST NOT BE MODIFIED
 */

volatile CK_UINT32 lastaddr =0;
volatile CK_UINT32 lastlen =0;

/**
 * This method takes the data pointed to by the src parameter
 * and writes it to the flash blocks indicated by the
 * dst parameter.
 *
 * @param dst : destination address where flash program
 * @param src : address of data
 * @param length : data length
 *
 * @return : if this method returns an error,MUST RUTURN ERROR_PROGRAM,
 * Otherwise return 0.
 */
/*int flashProgram(unsigned int dst, char *src, int length)
{
  

}*/

/**
 * Customize this method to read data from a group of flash blocks into a buffer
 *
 * @param dst : reads the contents of those flash blocks into the address pointed to by
 * the dst parameter.
 * @param src : a pointer to a single flash.
 * @param length : data length
 *
 *  @return: if this method returns an error,MUST RUTURN ERROR_READ,
 * Otherwise return 0.
 */

U32_T Flash_Read_Word(U32_T addr)
{
	//注意在此前pclk得使能，否则ifc时钟是没有的！
 	return (*(volatile unsigned int *)(addr));
}

/**
 * Customize this method to erase a group of flash blocks.
 *
 * @param dst : a pointer to the base of the flash device.
 * @param length : erase length
 *
 * @return : if this method returns an error,MUST RUTURN ERROR_ERASE,
 * Otherwise return 0
 */
// volatile CK_UINT32 preaddr =0;
int flashErase(char *dst, int length)
{
  	volatile CK_UINT32 w_length;
	volatile CK_UINT32 address;
	address = (CK_UINT32) dst;
	w_length = (length)/0x100 ;
	while(w_length--)
	{
		PageErase(address);
		address += 0x100;
	}
	return 0;
}

/**watch dog **************************************************************/
