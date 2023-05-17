
C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader//Obj/102bootloader.elf:     file format elf32-csky-little


Disassembly of section .text:

00000000 <vector_table>:
   0:	00000108 	.long	0x00000108
   4:	00000ece 	.long	0x00000ece
   8:	00000ebe 	.long	0x00000ebe
   c:	00000180 	.long	0x00000180
  10:	00000ec6 	.long	0x00000ec6
  14:	00000e84 	.long	0x00000e84
  18:	00000180 	.long	0x00000180
  1c:	00000eb6 	.long	0x00000eb6
  20:	00000eae 	.long	0x00000eae
  24:	00000180 	.long	0x00000180
  28:	00000180 	.long	0x00000180
  2c:	00000180 	.long	0x00000180
  30:	00000180 	.long	0x00000180
  34:	00000180 	.long	0x00000180
  38:	00000180 	.long	0x00000180
  3c:	00000180 	.long	0x00000180
  40:	00000ea6 	.long	0x00000ea6
  44:	00000e9e 	.long	0x00000e9e
  48:	00000e96 	.long	0x00000e96
  4c:	00000e8e 	.long	0x00000e8e
  50:	00000180 	.long	0x00000180
  54:	00000180 	.long	0x00000180
  58:	00000180 	.long	0x00000180
  5c:	00000180 	.long	0x00000180
  60:	00000180 	.long	0x00000180
  64:	00000180 	.long	0x00000180
  68:	00000180 	.long	0x00000180
  6c:	00000180 	.long	0x00000180
  70:	00000180 	.long	0x00000180
  74:	00000180 	.long	0x00000180
  78:	00000180 	.long	0x00000180
  7c:	00000e86 	.long	0x00000e86
  80:	00000180 	.long	0x00000180
  84:	00000180 	.long	0x00000180
  88:	00000ede 	.long	0x00000ede
  8c:	00000180 	.long	0x00000180
  90:	00000180 	.long	0x00000180
  94:	00000180 	.long	0x00000180
  98:	00000180 	.long	0x00000180
  9c:	00000180 	.long	0x00000180
  a0:	00000180 	.long	0x00000180
  a4:	00000180 	.long	0x00000180
  a8:	00000180 	.long	0x00000180
  ac:	00000180 	.long	0x00000180
  b0:	00000180 	.long	0x00000180
  b4:	00000e38 	.long	0x00000e38
  b8:	00000e54 	.long	0x00000e54
  bc:	00000ed6 	.long	0x00000ed6
  c0:	00000180 	.long	0x00000180
  c4:	00000180 	.long	0x00000180
  c8:	00000180 	.long	0x00000180
  cc:	00000180 	.long	0x00000180
  d0:	00000180 	.long	0x00000180
  d4:	00000180 	.long	0x00000180
  d8:	00000180 	.long	0x00000180
  dc:	00000180 	.long	0x00000180
  e0:	00000180 	.long	0x00000180
  e4:	00000180 	.long	0x00000180
  e8:	00000180 	.long	0x00000180
  ec:	00000180 	.long	0x00000180
  f0:	00000180 	.long	0x00000180
  f4:	00000180 	.long	0x00000180
  f8:	00000180 	.long	0x00000180
  fc:	00000180 	.long	0x00000180
	...

00000108 <__start>:
//  .long __start
__start:

	
  //initialize all registers
  movi r0, 0
 108:	3000      	movi      	r0, 0
  movi r1, 0
 10a:	3100      	movi      	r1, 0
  movi r2, 0
 10c:	3200      	movi      	r2, 0
  movi r3, 0
 10e:	3300      	movi      	r3, 0
  movi r4, 0
 110:	3400      	movi      	r4, 0
  movi r5, 0
 112:	3500      	movi      	r5, 0
  movi r6, 0
 114:	3600      	movi      	r6, 0
  movi r7, 0
 116:	3700      	movi      	r7, 0
  //movi r13, 0
  //movi r14, 0
  //movi r15, 0

//set VBR
  lrw r2, vector_table
 118:	105b      	lrw      	r2, 0x0	// 184 <DummyHandler+0x4>
  mtcr r2, cr<1,0>
 11a:	c0026421 	mtcr      	r2, cr<1, 0>

//enable EE bit of psr
  mfcr r2, cr<0,0>
 11e:	c0006022 	mfcr      	r2, cr<0, 0>
  bseti r2, r2, 8
 122:	3aa8      	bseti      	r2, 8
  mtcr r2, cr<0,0>
 124:	c0026420 	mtcr      	r2, cr<0, 0>
//  st.w    r2, (r1,0x4)
//  movi    r2, 0x1
//  st.w    r2, (r1,0x0)

//disable power peak 
  lrw     r1, 0xe000ef90
 128:	1038      	lrw      	r1, 0xe000ef90	// 188 <DummyHandler+0x8>
  movi    r2, 0x0
 12a:	3200      	movi      	r2, 0
  st.w    r2, (r1, 0x0)
 12c:	b140      	st.w      	r2, (r1, 0x0)



//initialize kernel stack
  lrw  r7, __kernel_stack
 12e:	10f8      	lrw      	r7, 0x20000ff8	// 18c <DummyHandler+0xc>
  mov r14,r7
 130:	6f9f      	mov      	r14, r7
  subi r6,r7,0x4
 132:	5fcf      	subi      	r6, r7, 4

  //lrw  r3, 0x40
  lrw  r3, 0x04
 134:	3304      	movi      	r3, 4
	
  subu r4, r7, r3
 136:	5f8d      	subu      	r4, r7, r3
  lrw  r5, 0x0
 138:	3500      	movi      	r5, 0

0000013a <INIT_KERLE_STACK>:
INIT_KERLE_STACK:
  addi r4, 0x4
 13a:	2403      	addi      	r4, 4
  st.w r5, (r4)
 13c:	b4a0      	st.w      	r5, (r4, 0x0)
  //cmphs r7, r4
  cmphs r6, r4
 13e:	6518      	cmphs      	r6, r4
  bt  INIT_KERLE_STACK
 140:	0bfd      	bt      	0x13a	// 13a <INIT_KERLE_STACK>

00000142 <__to_main>:
        
__to_main:
  lrw r0,__main
 142:	1014      	lrw      	r0, 0x2f4	// 190 <DummyHandler+0x10>
  jsr r0
 144:	7bc1      	jsr      	r0
  mov r0, r0
 146:	6c03      	mov      	r0, r0
  mov r0, r0
 148:	6c03      	mov      	r0, r0


  
  lrw r15, __exit
 14a:	ea8f0013 	lrw      	r15, 0x15c	// 194 <DummyHandler+0x14>
  lrw r0,main
 14e:	1013      	lrw      	r0, 0xee8	// 198 <DummyHandler+0x18>
  jmp r0
 150:	7800      	jmp      	r0
  mov r0, r0
 152:	6c03      	mov      	r0, r0
  mov r0, r0
 154:	6c03      	mov      	r0, r0
  mov r0, r0
 156:	6c03      	mov      	r0, r0
  mov r0, r0
 158:	6c03      	mov      	r0, r0
  mov r0, r0
 15a:	6c03      	mov      	r0, r0

0000015c <__exit>:

.export __exit
__exit:

  lrw r4, 0x20003000
 15c:	1090      	lrw      	r4, 0x20003000	// 19c <DummyHandler+0x1c>
  //lrw r5, 0x0
  mov r5, r0
 15e:	6d43      	mov      	r5, r0
  st.w r5, (r4)
 160:	b4a0      	st.w      	r5, (r4, 0x0)

  mfcr r1, cr<0,0>
 162:	c0006021 	mfcr      	r1, cr<0, 0>
  lrw  r1, 0xFFFF
 166:	102f      	lrw      	r1, 0xffff	// 1a0 <DummyHandler+0x20>
  mtcr r1, cr<11,0>
 168:	c001642b 	mtcr      	r1, cr<11, 0>
  lrw     r1, 0xFFF
 16c:	102e      	lrw      	r1, 0xfff	// 1a4 <DummyHandler+0x24>
  movi    r0, 0x0
 16e:	3000      	movi      	r0, 0
  st      r1, (r0)
 170:	b020      	st.w      	r1, (r0, 0x0)

00000172 <__fail>:

.export __fail
__fail:
  lrw  r1, 0xEEEE
 172:	102e      	lrw      	r1, 0xeeee	// 1a8 <DummyHandler+0x28>
  mtcr r1, cr<11,0>
 174:	c001642b 	mtcr      	r1, cr<11, 0>
  lrw     r1, 0xEEE
 178:	102d      	lrw      	r1, 0xeee	// 1ac <DummyHandler+0x2c>
  movi    r0, 0x0
 17a:	3000      	movi      	r0, 0
  st      r1, (r0)
 17c:	b020      	st.w      	r1, (r0, 0x0)

0000017e <__dummy>:

__dummy:
  br      __fail
 17e:	07fa      	br      	0x172	// 172 <__fail>

00000180 <DummyHandler>:

.export DummyHandler
DummyHandler:
  br      __fail
 180:	07f9      	br      	0x172	// 172 <__fail>
 182:	0000      	.short	0x0000
 184:	00000000 	.long	0x00000000
 188:	e000ef90 	.long	0xe000ef90
 18c:	20000ff8 	.long	0x20000ff8
 190:	000002f4 	.long	0x000002f4
 194:	0000015c 	.long	0x0000015c
 198:	00000ee8 	.long	0x00000ee8
 19c:	20003000 	.long	0x20003000
 1a0:	0000ffff 	.long	0x0000ffff
 1a4:	00000fff 	.long	0x00000fff
 1a8:	0000eeee 	.long	0x0000eeee
 1ac:	00000eee 	.long	0x00000eee

000001b0 <__modsi3>:
 1b0:	14c1      	push      	r4
 1b2:	3940      	cmpnei      	r1, 0
 1b4:	0803      	bt      	0x1ba	// 1ba <__modsi3+0xa>
 1b6:	c0002c20 	trap      	3
 1ba:	3840      	cmpnei      	r0, 0
 1bc:	0802      	bt      	0x1c0	// 1c0 <__modsi3+0x10>
 1be:	1481      	pop      	r4
 1c0:	6d03      	mov      	r4, r0
 1c2:	3820      	cmplti      	r0, 1
 1c4:	0c03      	bf      	0x1ca	// 1ca <__modsi3+0x1a>
 1c6:	6c02      	nor      	r0, r0
 1c8:	2000      	addi      	r0, 1
 1ca:	3920      	cmplti      	r1, 1
 1cc:	0c03      	bf      	0x1d2	// 1d2 <__modsi3+0x22>
 1ce:	6c46      	nor      	r1, r1
 1d0:	2100      	addi      	r1, 1
 1d2:	6c83      	mov      	r2, r0
 1d4:	3320      	movi      	r3, 32
 1d6:	3a00      	cmphsi      	r2, 1
 1d8:	0c04      	bf      	0x1e0	// 1e0 <__modsi3+0x30>
 1da:	2b00      	subi      	r3, 1
 1dc:	4a41      	lsri      	r2, r2, 1
 1de:	07fc      	br      	0x1d6	// 1d6 <__modsi3+0x26>
 1e0:	3201      	movi      	r2, 1
 1e2:	708c      	lsl      	r2, r3
 1e4:	700c      	lsl      	r0, r3
 1e6:	3300      	movi      	r3, 0
 1e8:	6402      	cmpne      	r0, r0
 1ea:	6001      	addc      	r0, r0
 1ec:	60cd      	addc      	r3, r3
 1ee:	644c      	cmphs      	r3, r1
 1f0:	0c02      	bf      	0x1f4	// 1f4 <__modsi3+0x44>
 1f2:	60c6      	subu      	r3, r1
 1f4:	6089      	addc      	r2, r2
 1f6:	0ff9      	bf      	0x1e8	// 1e8 <__modsi3+0x38>
 1f8:	6c0f      	mov      	r0, r3
 1fa:	6512      	cmpne      	r4, r4
 1fc:	6111      	addc      	r4, r4
 1fe:	0c03      	bf      	0x204	// 204 <__modsi3+0x54>
 200:	6c02      	nor      	r0, r0
 202:	2000      	addi      	r0, 1
 204:	1481      	pop      	r4
	...

00000208 <__memset_fast>:
 208:	14c3      	push      	r4-r6
 20a:	7444      	zextb      	r1, r1
 20c:	3a40      	cmpnei      	r2, 0
 20e:	0c1f      	bf      	0x24c	// 24c <__memset_fast+0x44>
 210:	6d43      	mov      	r5, r0
 212:	6d03      	mov      	r4, r0
 214:	3603      	movi      	r6, 3
 216:	6918      	and      	r4, r6
 218:	3c40      	cmpnei      	r4, 0
 21a:	0c1a      	bf      	0x24e	// 24e <__memset_fast+0x46>
 21c:	a520      	st.b      	r1, (r5, 0x0)
 21e:	2a00      	subi      	r2, 1
 220:	3a40      	cmpnei      	r2, 0
 222:	0c15      	bf      	0x24c	// 24c <__memset_fast+0x44>
 224:	2500      	addi      	r5, 1
 226:	6d17      	mov      	r4, r5
 228:	3603      	movi      	r6, 3
 22a:	6918      	and      	r4, r6
 22c:	3c40      	cmpnei      	r4, 0
 22e:	0c10      	bf      	0x24e	// 24e <__memset_fast+0x46>
 230:	a520      	st.b      	r1, (r5, 0x0)
 232:	2a00      	subi      	r2, 1
 234:	3a40      	cmpnei      	r2, 0
 236:	0c0b      	bf      	0x24c	// 24c <__memset_fast+0x44>
 238:	2500      	addi      	r5, 1
 23a:	6d17      	mov      	r4, r5
 23c:	3603      	movi      	r6, 3
 23e:	6918      	and      	r4, r6
 240:	3c40      	cmpnei      	r4, 0
 242:	0c06      	bf      	0x24e	// 24e <__memset_fast+0x46>
 244:	a520      	st.b      	r1, (r5, 0x0)
 246:	2a00      	subi      	r2, 1
 248:	2500      	addi      	r5, 1
 24a:	0402      	br      	0x24e	// 24e <__memset_fast+0x46>
 24c:	1483      	pop      	r4-r6
 24e:	4168      	lsli      	r3, r1, 8
 250:	6c4c      	or      	r1, r3
 252:	4170      	lsli      	r3, r1, 16
 254:	6c4c      	or      	r1, r3
 256:	3a2f      	cmplti      	r2, 16
 258:	0809      	bt      	0x26a	// 26a <__memset_fast+0x62>
 25a:	b520      	st.w      	r1, (r5, 0x0)
 25c:	b521      	st.w      	r1, (r5, 0x4)
 25e:	b522      	st.w      	r1, (r5, 0x8)
 260:	b523      	st.w      	r1, (r5, 0xc)
 262:	2a0f      	subi      	r2, 16
 264:	250f      	addi      	r5, 16
 266:	3a2f      	cmplti      	r2, 16
 268:	0ff9      	bf      	0x25a	// 25a <__memset_fast+0x52>
 26a:	3a23      	cmplti      	r2, 4
 26c:	0806      	bt      	0x278	// 278 <__memset_fast+0x70>
 26e:	2a03      	subi      	r2, 4
 270:	b520      	st.w      	r1, (r5, 0x0)
 272:	2503      	addi      	r5, 4
 274:	3a23      	cmplti      	r2, 4
 276:	0ffc      	bf      	0x26e	// 26e <__memset_fast+0x66>
 278:	3a40      	cmpnei      	r2, 0
 27a:	0fe9      	bf      	0x24c	// 24c <__memset_fast+0x44>
 27c:	2a00      	subi      	r2, 1
 27e:	a520      	st.b      	r1, (r5, 0x0)
 280:	3a40      	cmpnei      	r2, 0
 282:	0fe5      	bf      	0x24c	// 24c <__memset_fast+0x44>
 284:	2a00      	subi      	r2, 1
 286:	a521      	st.b      	r1, (r5, 0x1)
 288:	3a40      	cmpnei      	r2, 0
 28a:	0fe1      	bf      	0x24c	// 24c <__memset_fast+0x44>
 28c:	a522      	st.b      	r1, (r5, 0x2)
 28e:	1483      	pop      	r4-r6

00000290 <__memcpy_fast>:
 290:	14c3      	push      	r4-r6
 292:	6d83      	mov      	r6, r0
 294:	6d07      	mov      	r4, r1
 296:	6d18      	or      	r4, r6
 298:	3303      	movi      	r3, 3
 29a:	690c      	and      	r4, r3
 29c:	3c40      	cmpnei      	r4, 0
 29e:	0c0b      	bf      	0x2b4	// 2b4 <__memcpy_fast+0x24>
 2a0:	3a40      	cmpnei      	r2, 0
 2a2:	0c08      	bf      	0x2b2	// 2b2 <__memcpy_fast+0x22>
 2a4:	8160      	ld.b      	r3, (r1, 0x0)
 2a6:	2100      	addi      	r1, 1
 2a8:	2a00      	subi      	r2, 1
 2aa:	a660      	st.b      	r3, (r6, 0x0)
 2ac:	2600      	addi      	r6, 1
 2ae:	3a40      	cmpnei      	r2, 0
 2b0:	0bfa      	bt      	0x2a4	// 2a4 <__memcpy_fast+0x14>
 2b2:	1483      	pop      	r4-r6
 2b4:	3a2f      	cmplti      	r2, 16
 2b6:	080e      	bt      	0x2d2	// 2d2 <__memcpy_fast+0x42>
 2b8:	91a0      	ld.w      	r5, (r1, 0x0)
 2ba:	9161      	ld.w      	r3, (r1, 0x4)
 2bc:	9182      	ld.w      	r4, (r1, 0x8)
 2be:	b6a0      	st.w      	r5, (r6, 0x0)
 2c0:	91a3      	ld.w      	r5, (r1, 0xc)
 2c2:	b661      	st.w      	r3, (r6, 0x4)
 2c4:	b682      	st.w      	r4, (r6, 0x8)
 2c6:	b6a3      	st.w      	r5, (r6, 0xc)
 2c8:	2a0f      	subi      	r2, 16
 2ca:	210f      	addi      	r1, 16
 2cc:	260f      	addi      	r6, 16
 2ce:	3a2f      	cmplti      	r2, 16
 2d0:	0ff4      	bf      	0x2b8	// 2b8 <__memcpy_fast+0x28>
 2d2:	3a23      	cmplti      	r2, 4
 2d4:	0808      	bt      	0x2e4	// 2e4 <__memcpy_fast+0x54>
 2d6:	9160      	ld.w      	r3, (r1, 0x0)
 2d8:	2a03      	subi      	r2, 4
 2da:	2103      	addi      	r1, 4
 2dc:	b660      	st.w      	r3, (r6, 0x0)
 2de:	2603      	addi      	r6, 4
 2e0:	3a23      	cmplti      	r2, 4
 2e2:	0ffa      	bf      	0x2d6	// 2d6 <__memcpy_fast+0x46>
 2e4:	3a40      	cmpnei      	r2, 0
 2e6:	0fe6      	bf      	0x2b2	// 2b2 <__memcpy_fast+0x22>
 2e8:	8160      	ld.b      	r3, (r1, 0x0)
 2ea:	2100      	addi      	r1, 1
 2ec:	2a00      	subi      	r2, 1
 2ee:	a660      	st.b      	r3, (r6, 0x0)
 2f0:	2600      	addi      	r6, 1
 2f2:	07f9      	br      	0x2e4	// 2e4 <__memcpy_fast+0x54>

Disassembly of section .text.__main:

000002f4 <__main>:
extern char _bss_start[];
extern char _ebss[];


void __main( void ) 
{
 2f4:	14d0      	push      	r15

  /* if the start of data (dst)
     is not equal to end of text (src) then
     copy it, else it's already in the right place
     */
  if( _start_data != _end_rodata ) {
 2f6:	1009      	lrw      	r0, 0x20000000	// 318 <__main+0x24>
 2f8:	1029      	lrw      	r1, 0xf98	// 31c <__main+0x28>
 2fa:	6442      	cmpne      	r0, r1
 2fc:	0c05      	bf      	0x306	// 306 <__main+0x12>
//    __memcpy_fast( dst, src, (_end_data - _start_data));
    memcpy( dst, src, (_end_data - _start_data));
 2fe:	1049      	lrw      	r2, 0x20000074	// 320 <__main+0x2c>
 300:	6082      	subu      	r2, r0
 302:	e3ffffc7 	bsr      	0x290	// 290 <__memcpy_fast>
  }

  /* zero the bss 
   */
  if( _ebss - _bss_start ) {
 306:	1048      	lrw      	r2, 0x200001c4	// 324 <__main+0x30>
 308:	1008      	lrw      	r0, 0x20000074	// 328 <__main+0x34>
 30a:	640a      	cmpne      	r2, r0
 30c:	0c05      	bf      	0x316	// 316 <__main+0x22>
//    __memset_fast( _bss_start, 0x00, ( _ebss - _bss_start ));
    memset( _bss_start, 0x00, ( _ebss - _bss_start ));
 30e:	6082      	subu      	r2, r0
 310:	3100      	movi      	r1, 0
 312:	e3ffff7b 	bsr      	0x208	// 208 <__memset_fast>
  }

	
}
 316:	1490      	pop      	r15
 318:	20000000 	.long	0x20000000
 31c:	00000f98 	.long	0x00000f98
 320:	20000074 	.long	0x20000074
 324:	200001c4 	.long	0x200001c4
 328:	20000074 	.long	0x20000074

Disassembly of section .text.SYSCON_General_CMD.part.0:

0000032c <SYSCON_General_CMD.part.0>:
/*************************************************************/  
void SYSCON_General_CMD(FunctionalStatus NewState, SYSCON_General_CMD_TypeDef ENDIS_X )
{
	if (NewState != DISABLE)
	{
		if(ENDIS_X==ENDIS_EMOSC) 
 32c:	3848      	cmpnei      	r0, 8
 32e:	0809      	bt      	0x340	// 340 <SYSCON_General_CMD.part.0+0x14>
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFF00FFF)|0x00044000;					//使能对应PIN
 330:	107a      	lrw      	r3, 0x2000005c	// 398 <SYSCON_General_CMD.part.0+0x6c>
 332:	103b      	lrw      	r1, 0xff00fff	// 39c <SYSCON_General_CMD.part.0+0x70>
 334:	9340      	ld.w      	r2, (r3, 0x0)
 336:	9260      	ld.w      	r3, (r2, 0x0)
 338:	68c4      	and      	r3, r1
 33a:	3bae      	bseti      	r3, 14
 33c:	3bb2      	bseti      	r3, 18
 33e:	b260      	st.w      	r3, (r2, 0x0)
		SYSCON->GCER|=ENDIS_X;													//enable SYSCON General Control
 340:	1078      	lrw      	r3, 0x20000068	// 3a0 <SYSCON_General_CMD.part.0+0x74>
 342:	9360      	ld.w      	r3, (r3, 0x0)
 344:	9341      	ld.w      	r2, (r3, 0x4)
 346:	6c80      	or      	r2, r0
 348:	b341      	st.w      	r2, (r3, 0x4)
		while(!(SYSCON->GCSR&ENDIS_X));											//check  Enable?	
 34a:	9343      	ld.w      	r2, (r3, 0xc)
 34c:	6880      	and      	r2, r0
 34e:	3a40      	cmpnei      	r2, 0
 350:	0ffd      	bf      	0x34a	// 34a <SYSCON_General_CMD.part.0+0x1e>
		switch(ENDIS_X)
 352:	3842      	cmpnei      	r0, 2
 354:	0807      	bt      	0x362	// 362 <SYSCON_General_CMD.part.0+0x36>
		{
			case ENDIS_IMOSC:
				while (!(SYSCON->CKST & ENDIS_IMOSC)); 	
 356:	3102      	movi      	r1, 2
 358:	9344      	ld.w      	r2, (r3, 0x10)
 35a:	6884      	and      	r2, r1
 35c:	3a40      	cmpnei      	r2, 0
 35e:	0ffd      	bf      	0x358	// 358 <SYSCON_General_CMD.part.0+0x2c>
	{
		SYSCON->GCDR|=ENDIS_X;													//disable SYSCON General Control
		while(SYSCON->GCSR&ENDIS_X);											//check  Disable?
		SYSCON->ICR|=ENDIS_X;													// Clear ENDIS_X stable bit
	}
}
 360:	783c      	jmp      	r15
		switch(ENDIS_X)
 362:	3802      	cmphsi      	r0, 3
 364:	0809      	bt      	0x376	// 376 <SYSCON_General_CMD.part.0+0x4a>
 366:	3841      	cmpnei      	r0, 1
 368:	0bfc      	bt      	0x360	// 360 <SYSCON_General_CMD.part.0+0x34>
				while (!(SYSCON->CKST & ENDIS_ISOSC)); 
 36a:	3101      	movi      	r1, 1
 36c:	9344      	ld.w      	r2, (r3, 0x10)
 36e:	6884      	and      	r2, r1
 370:	3a40      	cmpnei      	r2, 0
 372:	0ffd      	bf      	0x36c	// 36c <SYSCON_General_CMD.part.0+0x40>
 374:	07f6      	br      	0x360	// 360 <SYSCON_General_CMD.part.0+0x34>
		switch(ENDIS_X)
 376:	3848      	cmpnei      	r0, 8
 378:	0807      	bt      	0x386	// 386 <SYSCON_General_CMD.part.0+0x5a>
				while (!(SYSCON->CKST & ENDIS_EMOSC)); 
 37a:	3108      	movi      	r1, 8
 37c:	9344      	ld.w      	r2, (r3, 0x10)
 37e:	6884      	and      	r2, r1
 380:	3a40      	cmpnei      	r2, 0
 382:	0ffd      	bf      	0x37c	// 37c <SYSCON_General_CMD.part.0+0x50>
 384:	07ee      	br      	0x360	// 360 <SYSCON_General_CMD.part.0+0x34>
		switch(ENDIS_X)
 386:	3850      	cmpnei      	r0, 16
 388:	0bec      	bt      	0x360	// 360 <SYSCON_General_CMD.part.0+0x34>
				while (!(SYSCON->CKST & ENDIS_HFOSC)); 
 38a:	3110      	movi      	r1, 16
 38c:	9344      	ld.w      	r2, (r3, 0x10)
 38e:	6884      	and      	r2, r1
 390:	3a40      	cmpnei      	r2, 0
 392:	0ffd      	bf      	0x38c	// 38c <SYSCON_General_CMD.part.0+0x60>
 394:	07e6      	br      	0x360	// 360 <SYSCON_General_CMD.part.0+0x34>
 396:	0000      	bkpt
 398:	2000005c 	.long	0x2000005c
 39c:	0ff00fff 	.long	0x0ff00fff
 3a0:	20000068 	.long	0x20000068

Disassembly of section .text.SYSCON_RST_VALUE:

000003a4 <SYSCON_RST_VALUE>:
	SYSCON->RAMCHK=SYSCON_RAMCHK_RST;
 3a4:	106f      	lrw      	r3, 0x20000068	// 3e0 <SYSCON_RST_VALUE+0x3c>
 3a6:	1050      	lrw      	r2, 0xffff	// 3e4 <SYSCON_RST_VALUE+0x40>
 3a8:	9360      	ld.w      	r3, (r3, 0x0)
 3aa:	b345      	st.w      	r2, (r3, 0x14)
	SYSCON->EFLCHK=SYSCON_EFLCHK_RST;
 3ac:	104f      	lrw      	r2, 0xffffff	// 3e8 <SYSCON_RST_VALUE+0x44>
 3ae:	b346      	st.w      	r2, (r3, 0x18)
	SYSCON->SCLKCR=SYSCON_SCLKCR_RST;
 3b0:	104f      	lrw      	r2, 0xd22d0000	// 3ec <SYSCON_RST_VALUE+0x48>
 3b2:	b347      	st.w      	r2, (r3, 0x1c)
	SYSCON->OSTR=SYSCON_OSTR_RST;
 3b4:	104f      	lrw      	r2, 0x70ff3bff	// 3f0 <SYSCON_RST_VALUE+0x4c>
 3b6:	b350      	st.w      	r2, (r3, 0x40)
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
 3b8:	3180      	movi      	r1, 128
	SYSCON->LVDCR=SYSCON_LVDCR_RST;
 3ba:	320a      	movi      	r2, 10
 3bc:	b353      	st.w      	r2, (r3, 0x4c)
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
 3be:	604c      	addu      	r1, r3
 3c0:	3200      	movi      	r2, 0
	SYSCON->IWDCR=SYSCON_IWDCR_RST;
 3c2:	100d      	lrw      	r0, 0x70c	// 3f4 <SYSCON_RST_VALUE+0x50>
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
 3c4:	b145      	st.w      	r2, (r1, 0x14)
	SYSCON->UREG0=SYSCON_UREG0_RST;
 3c6:	23ff      	addi      	r3, 256
	SYSCON->EXIFT=SYSCON_EXIFT_RST;
 3c8:	b146      	st.w      	r2, (r1, 0x18)
	SYSCON->IWDCR=SYSCON_IWDCR_RST;
 3ca:	b10d      	st.w      	r0, (r1, 0x34)
	SYSCON->IWDCNT=SYSCON_IWDCNT_RST;
 3cc:	100b      	lrw      	r0, 0x3fe	// 3f8 <SYSCON_RST_VALUE+0x54>
 3ce:	b10e      	st.w      	r0, (r1, 0x38)
	SYSCON->EVTRG=SYSCON_EVTRG_RST;
 3d0:	b15d      	st.w      	r2, (r1, 0x74)
	SYSCON->EVPS=SYSCON_EVPS_RST;
 3d2:	b15e      	st.w      	r2, (r1, 0x78)
	SYSCON->EVSWF=SYSCON_EVSWF_RST;
 3d4:	b15f      	st.w      	r2, (r1, 0x7c)
	SYSCON->UREG0=SYSCON_UREG0_RST;
 3d6:	b340      	st.w      	r2, (r3, 0x0)
	SYSCON->UREG1=SYSCON_UREG1_RST;
 3d8:	b341      	st.w      	r2, (r3, 0x4)
	SYSCON->UREG2=SYSCON_UREG2_RST;
 3da:	b342      	st.w      	r2, (r3, 0x8)
	SYSCON->UREG3=SYSCON_UREG3_RST;
 3dc:	b343      	st.w      	r2, (r3, 0xc)
}
 3de:	783c      	jmp      	r15
 3e0:	20000068 	.long	0x20000068
 3e4:	0000ffff 	.long	0x0000ffff
 3e8:	00ffffff 	.long	0x00ffffff
 3ec:	d22d0000 	.long	0xd22d0000
 3f0:	70ff3bff 	.long	0x70ff3bff
 3f4:	0000070c 	.long	0x0000070c
 3f8:	000003fe 	.long	0x000003fe

Disassembly of section .text.SYSCON_General_CMD:

000003fc <SYSCON_General_CMD>:
{
 3fc:	14d0      	push      	r15
	if (NewState != DISABLE)
 3fe:	3840      	cmpnei      	r0, 0
 400:	0c05      	bf      	0x40a	// 40a <SYSCON_General_CMD+0xe>
 402:	6c07      	mov      	r0, r1
 404:	e3ffff94 	bsr      	0x32c	// 32c <SYSCON_General_CMD.part.0>
}
 408:	1490      	pop      	r15
		SYSCON->GCDR|=ENDIS_X;													//disable SYSCON General Control
 40a:	1068      	lrw      	r3, 0x20000068	// 428 <SYSCON_General_CMD+0x2c>
 40c:	9360      	ld.w      	r3, (r3, 0x0)
 40e:	9342      	ld.w      	r2, (r3, 0x8)
 410:	6c84      	or      	r2, r1
 412:	b342      	st.w      	r2, (r3, 0x8)
		while(SYSCON->GCSR&ENDIS_X);											//check  Disable?
 414:	9343      	ld.w      	r2, (r3, 0xc)
 416:	6884      	and      	r2, r1
 418:	3a40      	cmpnei      	r2, 0
 41a:	0bfd      	bt      	0x414	// 414 <SYSCON_General_CMD+0x18>
		SYSCON->ICR|=ENDIS_X;													// Clear ENDIS_X stable bit
 41c:	237f      	addi      	r3, 128
 41e:	9301      	ld.w      	r0, (r3, 0x4)
 420:	6c40      	or      	r1, r0
 422:	b321      	st.w      	r1, (r3, 0x4)
}
 424:	07f2      	br      	0x408	// 408 <SYSCON_General_CMD+0xc>
 426:	0000      	bkpt
 428:	20000068 	.long	0x20000068

Disassembly of section .text.SystemCLK_HCLKDIV_PCLKDIV_Config:

0000042c <SystemCLK_HCLKDIV_PCLKDIV_Config>:
//SystemClk_data_x:EMOSC_24M,EMOSC_16M,EMOSC_12M,EMOSC_8M,EMOSC_4M,EMOSC_36K,
//ISOSC,IMOSC,HFOSC_48M,HFOSC_24M,HFOSC_12M,HFOSC_6M
//ReturnValue:NONE
/*************************************************************/ 
void SystemCLK_HCLKDIV_PCLKDIV_Config(SystemCLK_TypeDef SYSCLK_X , SystemCLK_Div_TypeDef HCLK_DIV_X , PCLK_Div_TypeDef PCLK_DIV_X , SystemClk_data_TypeDef SystemClk_data_x )
{
 42c:	14c2      	push      	r4-r5
	if(SystemClk_data_x==HFOSC_48M)
 42e:	3b48      	cmpnei      	r3, 8
 430:	0826      	bt      	0x47c	// 47c <SystemCLK_HCLKDIV_PCLKDIV_Config+0x50>
	{
		IFC->CEDR=0X01;						//CLKEN
 432:	1098      	lrw      	r4, 0x2000006c	// 490 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x64>
 434:	3501      	movi      	r5, 1
 436:	9480      	ld.w      	r4, (r4, 0x0)
 438:	b4a1      	st.w      	r5, (r4, 0x4)
		IFC->MR=0X02|(0X01<<16);			//高速模式
 43a:	10b7      	lrw      	r5, 0x10002	// 494 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x68>
	}
	if((SystemClk_data_x==EMOSC_24M)||(SystemClk_data_x==EMOSC_16M)||(SystemClk_data_x==HFOSC_24M))
	{
		IFC->CEDR=0X01;						//CLKEN
		IFC->MR=0X01|(0X01<<16);			//中速模式
 43c:	b4a5      	st.w      	r5, (r4, 0x14)
	}
	if((SystemClk_data_x==EMOSC_12M)||(SystemClk_data_x==EMOSC_8M)||(SystemClk_data_x==EMOSC_4M)||(SystemClk_data_x==EMOSC_36K)
		||(SystemClk_data_x==IMOSC)||(SystemClk_data_x==ISOSC)||(SystemClk_data_x==HFOSC_12M)||(SystemClk_data_x==HFOSC_6M))
 43e:	5b87      	subi      	r4, r3, 2
	if((SystemClk_data_x==EMOSC_12M)||(SystemClk_data_x==EMOSC_8M)||(SystemClk_data_x==EMOSC_4M)||(SystemClk_data_x==EMOSC_36K)
 440:	3c05      	cmphsi      	r4, 6
 442:	0c04      	bf      	0x44a	// 44a <SystemCLK_HCLKDIV_PCLKDIV_Config+0x1e>
		||(SystemClk_data_x==IMOSC)||(SystemClk_data_x==ISOSC)||(SystemClk_data_x==HFOSC_12M)||(SystemClk_data_x==HFOSC_6M))
 444:	2b09      	subi      	r3, 10
 446:	3b01      	cmphsi      	r3, 2
 448:	0807      	bt      	0x456	// 456 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x2a>
	{
		IFC->CEDR=0X01;						//CLKEN
 44a:	1072      	lrw      	r3, 0x2000006c	// 490 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x64>
 44c:	3401      	movi      	r4, 1
 44e:	9360      	ld.w      	r3, (r3, 0x0)
 450:	b381      	st.w      	r4, (r3, 0x4)
		IFC->MR=0X00|(0X00<<16);			//低速
 452:	3400      	movi      	r4, 0
 454:	b385      	st.w      	r4, (r3, 0x14)
	}
	SYSCON->SCLKCR=SYSCLK_KEY | HCLK_DIV_X| SYSCLK_X;
 456:	1091      	lrw      	r4, 0xd22d0000	// 498 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x6c>
 458:	6c10      	or      	r0, r4
 45a:	1071      	lrw      	r3, 0x20000068	// 49c <SystemCLK_HCLKDIV_PCLKDIV_Config+0x70>
 45c:	6c40      	or      	r1, r0
 45e:	9360      	ld.w      	r3, (r3, 0x0)
	while (!(SYSCON->CKST & (1<<8))); 											// waiting for sysclk stable
 460:	3080      	movi      	r0, 128
	SYSCON->SCLKCR=SYSCLK_KEY | HCLK_DIV_X| SYSCLK_X;
 462:	b327      	st.w      	r1, (r3, 0x1c)
	while (!(SYSCON->CKST & (1<<8))); 											// waiting for sysclk stable
 464:	4001      	lsli      	r0, r0, 1
 466:	9324      	ld.w      	r1, (r3, 0x10)
 468:	6840      	and      	r1, r0
 46a:	3940      	cmpnei      	r1, 0
 46c:	0ffd      	bf      	0x466	// 466 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x3a>
	SYSCON->PCLKCR=PCLK_KEY|PCLK_DIV_X;											//PCLK DIV 1 2 4 6 8 16		
 46e:	102d      	lrw      	r1, 0xc33c0000	// 4a0 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x74>
 470:	6c48      	or      	r1, r2
 472:	b328      	st.w      	r1, (r3, 0x20)
	while(SYSCON->PCLKCR!=PCLK_DIV_X);											//Wait PCLK DIV
 474:	9328      	ld.w      	r1, (r3, 0x20)
 476:	644a      	cmpne      	r2, r1
 478:	0bfe      	bt      	0x474	// 474 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x48>
}
 47a:	1482      	pop      	r4-r5
	if((SystemClk_data_x==EMOSC_24M)||(SystemClk_data_x==EMOSC_16M)||(SystemClk_data_x==HFOSC_24M))
 47c:	3b01      	cmphsi      	r3, 2
 47e:	0c03      	bf      	0x484	// 484 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x58>
 480:	3b49      	cmpnei      	r3, 9
 482:	0bde      	bt      	0x43e	// 43e <SystemCLK_HCLKDIV_PCLKDIV_Config+0x12>
		IFC->CEDR=0X01;						//CLKEN
 484:	1083      	lrw      	r4, 0x2000006c	// 490 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x64>
 486:	3501      	movi      	r5, 1
 488:	9480      	ld.w      	r4, (r4, 0x0)
 48a:	b4a1      	st.w      	r5, (r4, 0x4)
		IFC->MR=0X01|(0X01<<16);			//中速模式
 48c:	10a6      	lrw      	r5, 0x10001	// 4a4 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x78>
 48e:	07d7      	br      	0x43c	// 43c <SystemCLK_HCLKDIV_PCLKDIV_Config+0x10>
 490:	2000006c 	.long	0x2000006c
 494:	00010002 	.long	0x00010002
 498:	d22d0000 	.long	0xd22d0000
 49c:	20000068 	.long	0x20000068
 4a0:	c33c0000 	.long	0xc33c0000
 4a4:	00010001 	.long	0x00010001

Disassembly of section .text.SYSCON_HFOSC_SELECTE:

000004a8 <SYSCON_HFOSC_SELECTE>:
//EntryParameter:HFOSC_SELECTE_X
//HFOSC_SELECTE_X:HFOSC_SELECTE_48M,HFOSC_SELECTE_24M;HFOSC_SELECTE_12M;HFOSC_SELECTE_6M
//ReturnValue:NONE
/*************************************************************/  
void SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_TypeDef HFOSC_SELECTE_X)
{	
 4a8:	14d1      	push      	r4, r15
 4aa:	6d03      	mov      	r4, r0
	SYSCON_General_CMD(DISABLE,ENDIS_HFOSC);					//disable HFOSC
 4ac:	3110      	movi      	r1, 16
 4ae:	3000      	movi      	r0, 0
 4b0:	e3ffffa6 	bsr      	0x3fc	// 3fc <SYSCON_General_CMD>
	SYSCON->OPT1 = (SYSCON->OPT1 & 0XFFFFFFCF)|HFOSC_SELECTE_X;
 4b4:	1066      	lrw      	r3, 0x20000068	// 4cc <SYSCON_HFOSC_SELECTE+0x24>
 4b6:	9360      	ld.w      	r3, (r3, 0x0)
 4b8:	9319      	ld.w      	r0, (r3, 0x64)
 4ba:	3884      	bclri      	r0, 4
 4bc:	3885      	bclri      	r0, 5
 4be:	6c10      	or      	r0, r4
 4c0:	b319      	st.w      	r0, (r3, 0x64)
 4c2:	3010      	movi      	r0, 16
 4c4:	e3ffff34 	bsr      	0x32c	// 32c <SYSCON_General_CMD.part.0>
	SYSCON_General_CMD(ENABLE,ENDIS_HFOSC);						//enable HFOSC
}
 4c8:	1491      	pop      	r4, r15
 4ca:	0000      	bkpt
 4cc:	20000068 	.long	0x20000068

Disassembly of section .text.SYSCON_WDT_CMD:

000004d0 <SYSCON_WDT_CMD>:
//EntryParameter:,NewState
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_WDT_CMD(FunctionalStatus NewState)
{
 4d0:	106c      	lrw      	r3, 0x20000068	// 500 <SYSCON_WDT_CMD+0x30>
	if(NewState != DISABLE)
 4d2:	3840      	cmpnei      	r0, 0
	{
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
 4d4:	9360      	ld.w      	r3, (r3, 0x0)
 4d6:	237f      	addi      	r3, 128
	if(NewState != DISABLE)
 4d8:	0c0a      	bf      	0x4ec	// 4ec <SYSCON_WDT_CMD+0x1c>
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
 4da:	104b      	lrw      	r2, 0x78870000	// 504 <SYSCON_WDT_CMD+0x34>
		while(!(SYSCON->IWDCR&Check_IWDT_BUSY));
 4dc:	3180      	movi      	r1, 128
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
 4de:	b34f      	st.w      	r2, (r3, 0x3c)
		while(!(SYSCON->IWDCR&Check_IWDT_BUSY));
 4e0:	4125      	lsli      	r1, r1, 5
 4e2:	934d      	ld.w      	r2, (r3, 0x34)
 4e4:	6884      	and      	r2, r1
 4e6:	3a40      	cmpnei      	r2, 0
 4e8:	0ffd      	bf      	0x4e2	// 4e2 <SYSCON_WDT_CMD+0x12>
	else
	{
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
	}
}
 4ea:	783c      	jmp      	r15
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
 4ec:	1047      	lrw      	r2, 0x788755aa	// 508 <SYSCON_WDT_CMD+0x38>
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
 4ee:	3180      	movi      	r1, 128
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
 4f0:	b34f      	st.w      	r2, (r3, 0x3c)
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
 4f2:	4125      	lsli      	r1, r1, 5
 4f4:	934d      	ld.w      	r2, (r3, 0x34)
 4f6:	6884      	and      	r2, r1
 4f8:	3a40      	cmpnei      	r2, 0
 4fa:	0bfd      	bt      	0x4f4	// 4f4 <SYSCON_WDT_CMD+0x24>
 4fc:	07f7      	br      	0x4ea	// 4ea <SYSCON_WDT_CMD+0x1a>
 4fe:	0000      	bkpt
 500:	20000068 	.long	0x20000068
 504:	78870000 	.long	0x78870000
 508:	788755aa 	.long	0x788755aa

Disassembly of section .text.SYSCON_IWDCNT_Reload:

0000050c <SYSCON_IWDCNT_Reload>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void SYSCON_IWDCNT_Reload(void)
{
	SYSCON->IWDCNT=CLR_IWDT;
 50c:	1064      	lrw      	r3, 0x20000068	// 51c <SYSCON_IWDCNT_Reload+0x10>
 50e:	32b4      	movi      	r2, 180
 510:	9360      	ld.w      	r3, (r3, 0x0)
 512:	237f      	addi      	r3, 128
 514:	4257      	lsli      	r2, r2, 23
 516:	b34e      	st.w      	r2, (r3, 0x38)
}
 518:	783c      	jmp      	r15
 51a:	0000      	bkpt
 51c:	20000068 	.long	0x20000068

Disassembly of section .text.SYSCON_IWDCNT_Config:

00000520 <SYSCON_IWDCNT_Config>:
//IWDT_INTW_DIV_X:IWDT_INTW_DIV_1/2/3/4/4/5/6
//ReturnValue: NONE
/*************************************************************/
void SYSCON_IWDCNT_Config(IWDT_TIME_TypeDef IWDT_TIME_X , IWDT_TIMEDIV_TypeDef IWDT_INTW_DIV_X )
{
	SYSCON->IWDCR=IWDT_KEY|IWDT_TIME_X|IWDT_INTW_DIV_X;
 520:	1044      	lrw      	r2, 0x87780000	// 530 <SYSCON_IWDCNT_Config+0x10>
 522:	1065      	lrw      	r3, 0x20000068	// 534 <SYSCON_IWDCNT_Config+0x14>
 524:	6c48      	or      	r1, r2
 526:	9360      	ld.w      	r3, (r3, 0x0)
 528:	6c04      	or      	r0, r1
 52a:	237f      	addi      	r3, 128
 52c:	b30d      	st.w      	r0, (r3, 0x34)
}
 52e:	783c      	jmp      	r15
 530:	87780000 	.long	0x87780000
 534:	20000068 	.long	0x20000068

Disassembly of section .text.SYSCON_Software_Reset:

00000538 <SYSCON_Software_Reset>:
//EntryParameter:None
//ReturnValue:MCU reset
/*************************************************************/
void SYSCON_Software_Reset(void)
{
	SYSCON->IDCCR=IDCCR_KEY|SWRST;
 538:	1063      	lrw      	r3, 0x20000068	// 544 <SYSCON_Software_Reset+0xc>
 53a:	1044      	lrw      	r2, 0xe11e0080	// 548 <SYSCON_Software_Reset+0x10>
 53c:	9360      	ld.w      	r3, (r3, 0x0)
 53e:	b340      	st.w      	r2, (r3, 0x0)
}
 540:	783c      	jmp      	r15
 542:	0000      	bkpt
 544:	20000068 	.long	0x20000068
 548:	e11e0080 	.long	0xe11e0080

Disassembly of section .text.UART1_DeInit:

0000054c <UART1_DeInit>:
    UART0->ISR  = UART_RESET_VALUE;
    UART0->BRDIV =UART_RESET_VALUE;
}
void UART1_DeInit(void)
{
    UART1->DATA = UART_RESET_VALUE;
 54c:	1065      	lrw      	r3, 0x2000004c	// 560 <UART1_DeInit+0x14>
 54e:	3200      	movi      	r2, 0
 550:	9360      	ld.w      	r3, (r3, 0x0)
 552:	b340      	st.w      	r2, (r3, 0x0)
    UART1->SR   = UART_RESET_VALUE;
 554:	b341      	st.w      	r2, (r3, 0x4)
    UART1->CTRL = UART_RESET_VALUE;
 556:	b342      	st.w      	r2, (r3, 0x8)
    UART1->ISR  = UART_RESET_VALUE;
 558:	b343      	st.w      	r2, (r3, 0xc)
    UART1->BRDIV =UART_RESET_VALUE;
 55a:	b344      	st.w      	r2, (r3, 0x10)
}
 55c:	783c      	jmp      	r15
 55e:	0000      	bkpt
 560:	2000004c 	.long	0x2000004c

Disassembly of section .text.UART1_Int_Enable:

00000564 <UART1_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART1_Int_Enable(void)
{
    UART1->ISR=0x0F;									//clear UART1 INT status
 564:	1065      	lrw      	r3, 0x2000004c	// 578 <UART1_Int_Enable+0x14>
 566:	320f      	movi      	r2, 15
 568:	9360      	ld.w      	r3, (r3, 0x0)
 56a:	b343      	st.w      	r2, (r3, 0xc)
	INTC_ISER_WRITE(UART1_INT);							//INT Vector Enable UART0/1 Interrupt in CK802
 56c:	3380      	movi      	r3, 128
 56e:	4367      	lsli      	r3, r3, 7
 570:	1043      	lrw      	r2, 0xe000e100	// 57c <UART1_Int_Enable+0x18>
 572:	b260      	st.w      	r3, (r2, 0x0)
}
 574:	783c      	jmp      	r15
 576:	0000      	bkpt
 578:	2000004c 	.long	0x2000004c
 57c:	e000e100 	.long	0xe000e100

Disassembly of section .text.UARTInitRxTxIntEn:

00000580 <UARTInitRxTxIntEn>:
//ReturnValue:NONE
/*************************************************************/
void UARTInitRxTxIntEn(CSP_UART_T *uart,U16_T baudrate_u16,UART_PAR_TypeDef PAR_DAT)
{
   // Set Transmitter Enable
   CSP_UART_SET_CTRL(uart, UART_TX | UART_RX | UART_RX_INT );		//UART_TX_INT
 580:	330b      	movi      	r3, 11
 582:	b062      	st.w      	r3, (r0, 0x8)
   // Set Baudrate
   CSP_UART_SET_BRDIV(uart, baudrate_u16);
 584:	b024      	st.w      	r1, (r0, 0x10)

   uart->CTRL|=PAR_DAT|(0X01<<31);
 586:	9062      	ld.w      	r3, (r0, 0x8)
 588:	3abf      	bseti      	r2, 31
 58a:	6c8c      	or      	r2, r3
 58c:	b042      	st.w      	r2, (r0, 0x8)
}
 58e:	783c      	jmp      	r15

Disassembly of section .text.UARTTxByte:

00000590 <UARTTxByte>:
/*************************************************************/
void UARTTxByte(CSP_UART_T *uart,U8_T txdata_u8)
{
	unsigned int  DataI;
	// Write the transmit buffer
	CSP_UART_SET_DATA(uart,txdata_u8);
 590:	b020      	st.w      	r1, (r0, 0x0)
	do
	{
		DataI = CSP_UART_GET_SR(uart);
		DataI = DataI & UART_TX_FULL;
 592:	3201      	movi      	r2, 1
		DataI = CSP_UART_GET_SR(uart);
 594:	9061      	ld.w      	r3, (r0, 0x4)
		DataI = DataI & UART_TX_FULL;
 596:	68c8      	and      	r3, r2
	}
	while(DataI == UART_TX_FULL);    //Loop  when tx is full
 598:	3b40      	cmpnei      	r3, 0
 59a:	0bfd      	bt      	0x594	// 594 <UARTTxByte+0x4>
	while ( (CSP_UART_GET_ISR(uart) & UART_TX_INT_S) != UART_TX_INT_S ) {}

	// Clear status bit for the next transmit
	CSP_UART_SET_ISR(uart, UART_TX_INT_S);*/

}
 59c:	783c      	jmp      	r15

Disassembly of section .text.check_pattern_code:

000005a0 <check_pattern_code>:
函数功能：字符串比较函数

***********************************************************************/

void check_pattern_code(U8_T rec,volatile U8_T *code,volatile U8_T *flag)
{
 5a0:	14c1      	push      	r4
	switch(patternState)
 5a2:	1076      	lrw      	r3, 0x20000074	// 5f8 <check_pattern_code+0x58>
 5a4:	8380      	ld.b      	r4, (r3, 0x0)
 5a6:	7510      	zextb      	r4, r4
 5a8:	3c41      	cmpnei      	r4, 1
 5aa:	0c0f      	bf      	0x5c8	// 5c8 <check_pattern_code+0x28>
 5ac:	3c40      	cmpnei      	r4, 0
 5ae:	0c05      	bf      	0x5b8	// 5b8 <check_pattern_code+0x18>
 5b0:	3c42      	cmpnei      	r4, 2
 5b2:	0c1d      	bf      	0x5ec	// 5ec <check_pattern_code+0x4c>
				*flag =1;
				patternState =0;
			}
			break;
		default:
			patternState =0;
 5b4:	3200      	movi      	r2, 0
 5b6:	040d      	br      	0x5d0	// 5d0 <check_pattern_code+0x30>
			if(rec == 0xEF) 
 5b8:	32ef      	movi      	r2, 239
 5ba:	6482      	cmpne      	r0, r2
 5bc:	0805      	bt      	0x5c6	// 5c6 <check_pattern_code+0x26>
				patternState =1;
 5be:	3201      	movi      	r2, 1
 5c0:	a340      	st.b      	r2, (r3, 0x0)
				codeindex =0;
 5c2:	3200      	movi      	r2, 0
				codeindex++;
 5c4:	a341      	st.b      	r2, (r3, 0x1)
			break;		
	}
}
 5c6:	1481      	pop      	r4
			if(codeindex == CODELEN) 
 5c8:	8341      	ld.b      	r2, (r3, 0x1)
 5ca:	3a48      	cmpnei      	r2, 8
 5cc:	0804      	bt      	0x5d4	// 5d4 <check_pattern_code+0x34>
				patternState =2;
 5ce:	3202      	movi      	r2, 2
			patternState =0;
 5d0:	a340      	st.b      	r2, (r3, 0x0)
}
 5d2:	07fa      	br      	0x5c6	// 5c6 <check_pattern_code+0x26>
			if(rec == code[codeindex])
 5d4:	8341      	ld.b      	r2, (r3, 0x1)
 5d6:	6048      	addu      	r1, r2
 5d8:	8140      	ld.b      	r2, (r1, 0x0)
 5da:	6482      	cmpne      	r0, r2
 5dc:	0805      	bt      	0x5e6	// 5e6 <check_pattern_code+0x46>
				codeindex++;
 5de:	8341      	ld.b      	r2, (r3, 0x1)
 5e0:	2200      	addi      	r2, 1
 5e2:	7488      	zextb      	r2, r2
 5e4:	07f0      	br      	0x5c4	// 5c4 <check_pattern_code+0x24>
				codeindex =0;
 5e6:	3200      	movi      	r2, 0
 5e8:	a341      	st.b      	r2, (r3, 0x1)
 5ea:	07f3      	br      	0x5d0	// 5d0 <check_pattern_code+0x30>
			if(rec == 0xFF) 
 5ec:	31ff      	movi      	r1, 255
 5ee:	6442      	cmpne      	r0, r1
 5f0:	0beb      	bt      	0x5c6	// 5c6 <check_pattern_code+0x26>
				*flag =1;
 5f2:	3101      	movi      	r1, 1
 5f4:	a220      	st.b      	r1, (r2, 0x0)
 5f6:	07df      	br      	0x5b4	// 5b4 <check_pattern_code+0x14>
 5f8:	20000074 	.long	0x20000074

Disassembly of section .text.ProgUartPageRec:

000005fc <ProgUartPageRec>:
函数功能：串口接收处理函数

***********************************************************************/

void ProgUartPageRec(void)
{
 5fc:	14d1      	push      	r4, r15
 5fe:	1421      	subi      	r14, r14, 4
	volatile U8_T temp;
	temp = (U8_T) PROG_UART_GETCHAR();
 600:	1162      	lrw      	r3, 0x2000004c	// 688 <ProgUartPageRec+0x8c>
	switch(recstatus)
 602:	1183      	lrw      	r4, 0x20000074	// 68c <ProgUartPageRec+0x90>
	temp = (U8_T) PROG_UART_GETCHAR();
 604:	9360      	ld.w      	r3, (r3, 0x0)
 606:	9360      	ld.w      	r3, (r3, 0x0)
 608:	74cc      	zextb      	r3, r3
 60a:	dc6e0003 	st.b      	r3, (r14, 0x3)
	switch(recstatus)
 60e:	8462      	ld.b      	r3, (r4, 0x2)
 610:	74cc      	zextb      	r3, r3
 612:	3b41      	cmpnei      	r3, 1
 614:	0c25      	bf      	0x65e	// 65e <ProgUartPageRec+0x62>
 616:	3b40      	cmpnei      	r3, 0
 618:	0c1b      	bf      	0x64e	// 64e <ProgUartPageRec+0x52>
 61a:	3b42      	cmpnei      	r3, 2
 61c:	0c2e      	bf      	0x678	// 678 <ProgUartPageRec+0x7c>
			check_pattern_code(temp,rstpattern,&rstflag);
			break;
		default:
			break;
	}
	g_rwBuffer[indx] = temp;
 61e:	9464      	ld.w      	r3, (r4, 0x10)
 620:	d84e0003 	ld.b      	r2, (r14, 0x3)
 624:	103b      	lrw      	r1, 0x200000c4	// 690 <ProgUartPageRec+0x94>
 626:	7488      	zextb      	r2, r2
 628:	60c4      	addu      	r3, r1
 62a:	a340      	st.b      	r2, (r3, 0x0)
	indx++;
 62c:	9464      	ld.w      	r3, (r4, 0x10)
 62e:	2300      	addi      	r3, 1
 630:	b464      	st.w      	r3, (r4, 0x10)
	recbufdatalen++;
 632:	9465      	ld.w      	r3, (r4, 0x14)
 634:	2300      	addi      	r3, 1
 636:	b465      	st.w      	r3, (r4, 0x14)
	//imagesize++;
	if(indx == BufSize ) 
 638:	3380      	movi      	r3, 128
 63a:	9444      	ld.w      	r2, (r4, 0x10)
 63c:	4361      	lsli      	r3, r3, 1
 63e:	64ca      	cmpne      	r2, r3
 640:	0805      	bt      	0x64a	// 64a <ProgUartPageRec+0x4e>
	{
		recbuf_full =1;
 642:	3301      	movi      	r3, 1
 644:	a478      	st.b      	r3, (r4, 0x18)
		indx =0;
 646:	3300      	movi      	r3, 0
 648:	b464      	st.w      	r3, (r4, 0x10)
	}
}
 64a:	1401      	addi      	r14, r14, 4
 64c:	1491      	pop      	r4, r15
			check_pattern_code(temp,startpattern,&startflag);
 64e:	d80e0003 	ld.b      	r0, (r14, 0x3)
 652:	7400      	zextb      	r0, r0
 654:	5c4a      	addi      	r2, r4, 3
 656:	1030      	lrw      	r1, 0x20000000	// 694 <ProgUartPageRec+0x98>
			check_pattern_code(temp,rstpattern,&rstflag);
 658:	e3ffffa4 	bsr      	0x5a0	// 5a0 <check_pattern_code>
			break;
 65c:	07e1      	br      	0x61e	// 61e <ProgUartPageRec+0x22>
			imagesize++;
 65e:	9461      	ld.w      	r3, (r4, 0x4)
 660:	2300      	addi      	r3, 1
 662:	b461      	st.w      	r3, (r4, 0x4)
			if(temp == 0X00)
 664:	d86e0003 	ld.b      	r3, (r14, 0x3)
 668:	3b40      	cmpnei      	r3, 0
 66a:	0805      	bt      	0x674	// 674 <ProgUartPageRec+0x78>
				programendflagcnt++;
 66c:	9462      	ld.w      	r3, (r4, 0x8)
 66e:	2300      	addi      	r3, 1
				programendflagcnt =0;
 670:	b462      	st.w      	r3, (r4, 0x8)
 672:	07d6      	br      	0x61e	// 61e <ProgUartPageRec+0x22>
 674:	3300      	movi      	r3, 0
 676:	07fd      	br      	0x670	// 670 <ProgUartPageRec+0x74>
			check_pattern_code(temp,rstpattern,&rstflag);
 678:	d80e0003 	ld.b      	r0, (r14, 0x3)
 67c:	320c      	movi      	r2, 12
 67e:	7400      	zextb      	r0, r0
 680:	6090      	addu      	r2, r4
 682:	1026      	lrw      	r1, 0x20000008	// 698 <ProgUartPageRec+0x9c>
 684:	07ea      	br      	0x658	// 658 <ProgUartPageRec+0x5c>
 686:	0000      	bkpt
 688:	2000004c 	.long	0x2000004c
 68c:	20000074 	.long	0x20000074
 690:	200000c4 	.long	0x200000c4
 694:	20000000 	.long	0x20000000
 698:	20000008 	.long	0x20000008

Disassembly of section .text.SendBackStr:

0000069c <SendBackStr>:

函数功能：MCU发送响应字符串

***********************************************************************/
void SendBackStr(const char *str,U8_T len, U8_T rep)
{		
 69c:	14d4      	push      	r4-r7, r15
 69e:	1422      	subi      	r14, r14, 8
 6a0:	6dc3      	mov      	r7, r0
	U8_T i,j =0;
	for(i=0;i<rep;i++)
 6a2:	3400      	movi      	r4, 0
 6a4:	58c4      	addu      	r6, r0, r1
	{
		for(j=0;j<len;j++)
		{
			//delayms_Bycode(3);
			PROG_UART_SEND(str[j]);
 6a6:	106b      	lrw      	r3, 0x2000004c	// 6d0 <SendBackStr+0x34>
	for(i=0;i<rep;i++)
 6a8:	6492      	cmpne      	r4, r2
 6aa:	0c11      	bf      	0x6cc	// 6cc <SendBackStr+0x30>
 6ac:	6d5f      	mov      	r5, r7
 6ae:	040a      	br      	0x6c2	// 6c2 <SendBackStr+0x26>
			PROG_UART_SEND(str[j]);
 6b0:	8520      	ld.b      	r1, (r5, 0x0)
 6b2:	9300      	ld.w      	r0, (r3, 0x0)
 6b4:	b841      	st.w      	r2, (r14, 0x4)
 6b6:	b860      	st.w      	r3, (r14, 0x0)
 6b8:	2500      	addi      	r5, 1
 6ba:	e3ffff6b 	bsr      	0x590	// 590 <UARTTxByte>
 6be:	9841      	ld.w      	r2, (r14, 0x4)
 6c0:	9860      	ld.w      	r3, (r14, 0x0)
		for(j=0;j<len;j++)
 6c2:	6596      	cmpne      	r5, r6
 6c4:	0bf6      	bt      	0x6b0	// 6b0 <SendBackStr+0x14>
	for(i=0;i<rep;i++)
 6c6:	2400      	addi      	r4, 1
 6c8:	7510      	zextb      	r4, r4
 6ca:	07ef      	br      	0x6a8	// 6a8 <SendBackStr+0xc>
		}
	}
}
 6cc:	1402      	addi      	r14, r14, 8
 6ce:	1494      	pop      	r4-r7, r15
 6d0:	2000004c 	.long	0x2000004c

Disassembly of section .text.ErrMsgSend:

000006d4 <ErrMsgSend>:
	BootFail  =3,
	JumptoApp =4
} ERR_TYPE;

void ErrMsgSend(U8_T no,U8_T Errtype,U8_T subno,U8_T rep)
{
 6d4:	14d4      	push      	r4-r7, r15
 6d6:	1431      	subi      	r14, r14, 68
 6d8:	6d43      	mov      	r5, r0
 6da:	6d87      	mov      	r6, r1
 6dc:	6d0b      	mov      	r4, r2
	char errmsgmat[][12]={
 6de:	1122      	lrw      	r1, 0xf50	// 764 <ErrMsgSend+0x90>
 6e0:	323c      	movi      	r2, 60
 6e2:	1802      	addi      	r0, r14, 8
{
 6e4:	6dcf      	mov      	r7, r3
	char errmsgmat[][12]={
 6e6:	e3fffdd5 	bsr      	0x290	// 290 <__memcpy_fast>
	{"ParamErr "},	 	//ControlErr
	{"Verify "},		//VerifyF
	{"BootFail\n"},		//bootprocess
	{"JumptoApp\n"},  	//jmpPrompt
	};
	char lenmat[] = {7,9,7,9,10};
 6ea:	3307      	movi      	r3, 7
 6ec:	dc6e0000 	st.b      	r3, (r14, 0x0)
 6f0:	3309      	movi      	r3, 9
 6f2:	dc6e0001 	st.b      	r3, (r14, 0x1)
 6f6:	3307      	movi      	r3, 7
 6f8:	dc6e0002 	st.b      	r3, (r14, 0x2)
 6fc:	3309      	movi      	r3, 9
 6fe:	dc6e0003 	st.b      	r3, (r14, 0x3)
	SendBackStr((const char *)errmsgmat[no],lenmat[no],rep);
 702:	6c97      	mov      	r2, r5
	char lenmat[] = {7,9,7,9,10};
 704:	330a      	movi      	r3, 10
	SendBackStr((const char *)errmsgmat[no],lenmat[no],rep);
 706:	300c      	movi      	r0, 12
	char lenmat[] = {7,9,7,9,10};
 708:	dc6e0004 	st.b      	r3, (r14, 0x4)
	SendBackStr((const char *)errmsgmat[no],lenmat[no],rep);
 70c:	60b8      	addu      	r2, r14
 70e:	1b02      	addi      	r3, r14, 8
 710:	7c14      	mult      	r0, r5
 712:	8220      	ld.b      	r1, (r2, 0x0)
 714:	600c      	addu      	r0, r3
 716:	6c9f      	mov      	r2, r7
 718:	e3ffffc2 	bsr      	0x69c	// 69c <SendBackStr>
	switch(Errtype)
 71c:	3e42      	cmpnei      	r6, 2
 71e:	0c0c      	bf      	0x736	// 736 <ErrMsgSend+0x62>
 720:	3e43      	cmpnei      	r6, 3
 722:	0c0e      	bf      	0x73e	// 73e <ErrMsgSend+0x6a>
 724:	3e41      	cmpnei      	r6, 1
 726:	0806      	bt      	0x732	// 732 <ErrMsgSend+0x5e>
	{
		case 0:			
			break;
		case 1:
			SendBackStr("OK\n",3,1);
 728:	3201      	movi      	r2, 1
 72a:	3103      	movi      	r1, 3
 72c:	100f      	lrw      	r0, 0xf8c	// 768 <ErrMsgSend+0x94>
			break;
		case 2:
			SendBackStr("Fail\n",7,1);
 72e:	e3ffffb7 	bsr      	0x69c	// 69c <SendBackStr>
			PROG_UART_SEND('\n');
			break;
		default:
			break;
	}
}
 732:	1411      	addi      	r14, r14, 68
 734:	1494      	pop      	r4-r7, r15
			SendBackStr("Fail\n",7,1);
 736:	3201      	movi      	r2, 1
 738:	3107      	movi      	r1, 7
 73a:	100d      	lrw      	r0, 0xf90	// 76c <ErrMsgSend+0x98>
 73c:	07f9      	br      	0x72e	// 72e <ErrMsgSend+0x5a>
			delayms_Bycode(3);
 73e:	3003      	movi      	r0, 3
 740:	e0000276 	bsr      	0xc2c	// c2c <delayms_Bycode>
			PROG_UART_SEND(subno+'0');
 744:	6c53      	mov      	r1, r4
 746:	212f      	addi      	r1, 48
 748:	108a      	lrw      	r4, 0x2000004c	// 770 <ErrMsgSend+0x9c>
 74a:	7444      	zextb      	r1, r1
 74c:	9400      	ld.w      	r0, (r4, 0x0)
 74e:	e3ffff21 	bsr      	0x590	// 590 <UARTTxByte>
			delayms_Bycode(3);
 752:	3003      	movi      	r0, 3
 754:	e000026c 	bsr      	0xc2c	// c2c <delayms_Bycode>
			PROG_UART_SEND('\n');
 758:	9400      	ld.w      	r0, (r4, 0x0)
 75a:	310a      	movi      	r1, 10
 75c:	e3ffff1a 	bsr      	0x590	// 590 <UARTTxByte>
}
 760:	07e9      	br      	0x732	// 732 <ErrMsgSend+0x5e>
 762:	0000      	bkpt
 764:	00000f50 	.long	0x00000f50
 768:	00000f8c 	.long	0x00000f8c
 76c:	00000f90 	.long	0x00000f90
 770:	2000004c 	.long	0x2000004c

Disassembly of section .text.check_program_start:

00000774 <check_program_start>:
函数功能：编程开始与结束标志判断

***********************************************************************/

U8_T check_program_start(void)
{
 774:	14d3      	push      	r4-r6, r15
 776:	3428      	movi      	r4, 40
	U8_T i,cnt=0;
 778:	3500      	movi      	r5, 0
	for(i=0;i<40;i++)
	{
		delayms_Bycode(10);
		if(startflag ==1) cnt++;
 77a:	10ca      	lrw      	r6, 0x20000074	// 7a0 <check_program_start+0x2c>
		delayms_Bycode(10);
 77c:	300a      	movi      	r0, 10
 77e:	e0000257 	bsr      	0xc2c	// c2c <delayms_Bycode>
		if(startflag ==1) cnt++;
 782:	8663      	ld.b      	r3, (r6, 0x3)
 784:	3b41      	cmpnei      	r3, 1
 786:	0803      	bt      	0x78c	// 78c <check_program_start+0x18>
 788:	2500      	addi      	r5, 1
 78a:	7554      	zextb      	r5, r5
		if(cnt>=5) return 1;
 78c:	3d04      	cmphsi      	r5, 5
 78e:	0807      	bt      	0x79c	// 79c <check_program_start+0x28>
 790:	2c00      	subi      	r4, 1
 792:	7510      	zextb      	r4, r4
	for(i=0;i<40;i++)
 794:	3c40      	cmpnei      	r4, 0
 796:	0bf3      	bt      	0x77c	// 77c <check_program_start+0x8>
	}	
	return 0;
 798:	3000      	movi      	r0, 0
}
 79a:	1493      	pop      	r4-r6, r15
		if(cnt>=5) return 1;
 79c:	3001      	movi      	r0, 1
 79e:	07fe      	br      	0x79a	// 79a <check_program_start+0x26>
 7a0:	20000074 	.long	0x20000074

Disassembly of section .text.check_program_end:

000007a4 <check_program_end>:

U8_T check_program_end(void)
{
	if(programendflagcnt > END_CNT_NUM && (imagesize > binEndAddrReced)) 
 7a4:	1067      	lrw      	r3, 0x20000074	// 7c0 <check_program_end+0x1c>
 7a6:	3232      	movi      	r2, 50
 7a8:	9322      	ld.w      	r1, (r3, 0x8)
 7aa:	6449      	cmplt      	r2, r1
 7ac:	0c08      	bf      	0x7bc	// 7bc <check_program_end+0x18>
 7ae:	9341      	ld.w      	r2, (r3, 0x4)
 7b0:	9367      	ld.w      	r3, (r3, 0x1c)
 7b2:	648c      	cmphs      	r3, r2
 7b4:	0804      	bt      	0x7bc	// 7bc <check_program_end+0x18>
	{
		asm ("nop");
 7b6:	6c03      	mov      	r0, r0
		return 1;
 7b8:	3001      	movi      	r0, 1
	}
	return 0;
}
 7ba:	783c      	jmp      	r15
	return 0;
 7bc:	3000      	movi      	r0, 0
 7be:	07fe      	br      	0x7ba	// 7ba <check_program_end+0x16>
 7c0:	20000074 	.long	0x20000074

Disassembly of section .text.clear_rec_buffer:

000007c4 <clear_rec_buffer>:
函数功能：清空接收缓存
返回值: 无
***********************************************************************/

void clear_rec_buffer(void)
{
 7c4:	14c1      	push      	r4
	int i;
	indx=0;
 7c6:	106a      	lrw      	r3, 0x20000074	// 7ec <clear_rec_buffer+0x28>
 7c8:	3200      	movi      	r2, 0
 7ca:	b344      	st.w      	r2, (r3, 0x10)
	recbufdatalen=0;
 7cc:	b345      	st.w      	r2, (r3, 0x14)
	imagesize=0;
 7ce:	b341      	st.w      	r2, (r3, 0x4)
	addroffset =0;
 7d0:	b348      	st.w      	r2, (r3, 0x20)
	recbuf_full =0;
 7d2:	a358      	st.b      	r2, (r3, 0x18)
	for(i= 0;i<BufSize;i++)	g_rwBuffer[i] = 0x0;
 7d4:	3280      	movi      	r2, 128
 7d6:	3300      	movi      	r3, 0
 7d8:	1006      	lrw      	r0, 0x200000c4	// 7f0 <clear_rec_buffer+0x2c>
 7da:	4241      	lsli      	r2, r2, 1
 7dc:	582c      	addu      	r1, r0, r3
 7de:	2300      	addi      	r3, 1
 7e0:	3400      	movi      	r4, 0
 7e2:	648e      	cmpne      	r3, r2
 7e4:	a180      	st.b      	r4, (r1, 0x0)
 7e6:	0bfb      	bt      	0x7dc	// 7dc <clear_rec_buffer+0x18>
}
 7e8:	1481      	pop      	r4
 7ea:	0000      	bkpt
 7ec:	20000074 	.long	0x20000074
 7f0:	200000c4 	.long	0x200000c4

Disassembly of section .text.program_flash:

000007f4 <program_flash>:
函数功能：烧录串口接收数据到flash

***********************************************************************/

int program_flash(void)
{
 7f4:	14d2      	push      	r4-r5, r15
	//U32_T i =0;
	U32_T R_temp=0;
	addroffset = APP_START_ADDR;
 7f6:	3380      	movi      	r3, 128
 7f8:	1182      	lrw      	r4, 0x20000074	// 880 <program_flash+0x8c>
 7fa:	4366      	lsli      	r3, r3, 6
 7fc:	b468      	st.w      	r3, (r4, 0x20)
	imagesize  = APP_START_ADDR;
 7fe:	b461      	st.w      	r3, (r4, 0x4)
	programcnt=0;
 800:	3300      	movi      	r3, 0
 802:	b469      	st.w      	r3, (r4, 0x24)
	while(1)
	{
		SYSCON_IWDCNT_Reload();	
 804:	e3fffe84 	bsr      	0x50c	// 50c <SYSCON_IWDCNT_Reload>
		if(recbufdatalen/progInteval > 0)			//一页一页写
 808:	35ff      	movi      	r5, 255
 80a:	9465      	ld.w      	r3, (r4, 0x14)
 80c:	64d5      	cmplt      	r5, r3
 80e:	0c15      	bf      	0x838	// 838 <program_flash+0x44>
		{
			Page_ProgramData( addroffset , progInteval , &(g_rwBuffer[programcnt]));
 810:	9408      	ld.w      	r0, (r4, 0x20)
 812:	3180      	movi      	r1, 128
 814:	9449      	ld.w      	r2, (r4, 0x24)
 816:	4121      	lsli      	r1, r1, 1
 818:	107b      	lrw      	r3, 0x200000c4	// 884 <program_flash+0x90>
 81a:	608c      	addu      	r2, r3
 81c:	e000022a 	bsr      	0xc70	// c70 <Page_ProgramData>

			//SendBacknum(addroffset);   //如果希望在这里打印信息，上位机两次发送间的间隔需要尽量加大
			//PROG_UART_SEND('\n');
			//if(g_error == ERROR_PROGRAM) asm ("nop");
			addroffset +=progInteval;
 820:	9468      	ld.w      	r3, (r4, 0x20)
 822:	23ff      	addi      	r3, 256
 824:	b468      	st.w      	r3, (r4, 0x20)
			recbufdatalen -=progInteval;
 826:	9465      	ld.w      	r3, (r4, 0x14)
 828:	2bff      	subi      	r3, 256
 82a:	b465      	st.w      	r3, (r4, 0x14)
			programcnt %=BufSize;
 82c:	9429      	ld.w      	r1, (r4, 0x24)
 82e:	6944      	and      	r5, r1
 830:	b4a9      	st.w      	r5, (r4, 0x24)
			
			SYSCON_IWDCNT_Reload();				
 832:	e3fffe6d 	bsr      	0x50c	// 50c <SYSCON_IWDCNT_Reload>
 836:	07e7      	br      	0x804	// 804 <program_flash+0x10>
		}
		else if((addroffset>=(binEndAddrReced-binEndAddrReced%progInteval))&&(imagesize > binEndAddrReced))
 838:	9467      	ld.w      	r3, (r4, 0x1c)
 83a:	9447      	ld.w      	r2, (r4, 0x1c)
 83c:	6894      	and      	r2, r5
 83e:	9428      	ld.w      	r1, (r4, 0x20)
 840:	60ca      	subu      	r3, r2
 842:	64c4      	cmphs      	r1, r3
 844:	0fe0      	bf      	0x804	// 804 <program_flash+0x10>
 846:	9441      	ld.w      	r2, (r4, 0x4)
 848:	9467      	ld.w      	r3, (r4, 0x1c)
 84a:	648c      	cmphs      	r3, r2
 84c:	0bdc      	bt      	0x804	// 804 <program_flash+0x10>
		{
			Page_ProgramData( addroffset , binEndAddrReced%progInteval , &(g_rwBuffer[programcnt]));
 84e:	9408      	ld.w      	r0, (r4, 0x20)
 850:	9427      	ld.w      	r1, (r4, 0x1c)
 852:	9449      	ld.w      	r2, (r4, 0x24)
 854:	6854      	and      	r1, r5
 856:	106c      	lrw      	r3, 0x200000c4	// 884 <program_flash+0x90>
 858:	608c      	addu      	r2, r3
 85a:	34fb      	movi      	r4, 251
 85c:	e000020a 	bsr      	0xc70	// c70 <Page_ProgramData>
 860:	4481      	lsli      	r4, r4, 1
			//SendBacknum(addroffset);   //如果希望在这里打印信息，上位机两次发送间的间隔需要尽量加大
			//PROG_UART_SEND('\n');
			do
			{
				delayms_Bycode(10);
 862:	300a      	movi      	r0, 10
 864:	2c00      	subi      	r4, 1
 866:	e00001e3 	bsr      	0xc2c	// c2c <delayms_Bycode>
				if(R_temp>500)
 86a:	3c40      	cmpnei      	r4, 0
 86c:	0c07      	bf      	0x87a	// 87a <program_flash+0x86>
				else
				{
					R_temp++;
				}
			}
			while(!check_program_end());
 86e:	e3ffff9b 	bsr      	0x7a4	// 7a4 <check_program_end>
 872:	3840      	cmpnei      	r0, 0
 874:	0ff7      	bf      	0x862	// 862 <program_flash+0x6e>
			break;
		}
	}
	return 0;
 876:	3000      	movi      	r0, 0
}
 878:	1492      	pop      	r4-r5, r15
					return 1;
 87a:	3001      	movi      	r0, 1
 87c:	07fe      	br      	0x878	// 878 <program_flash+0x84>
 87e:	0000      	bkpt
 880:	20000074 	.long	0x20000074
 884:	200000c4 	.long	0x200000c4

Disassembly of section .text.JumptoAPP:

00000888 <JumptoAPP>:

函数功能：IAP 跳转到 APP 函数

***********************************************************************/
void JumptoAPP(void)
{
 888:	1421      	subi      	r14, r14, 4
	volatile U32_T EIPaddr = APP_EIP_ADDR;
 88a:	1064      	lrw      	r3, 0x2108	// 898 <JumptoAPP+0x10>
 88c:	b860      	st.w      	r3, (r14, 0x0)
	asm("mov r0,%0\n"::"r"(EIPaddr):);
 88e:	9860      	ld.w      	r3, (r14, 0x0)
 890:	6c0f      	mov      	r0, r3
	//asm(" lrw r0,0x1104 ");  // APP入口地址 __start label的值
	asm(" jmp r0 ");
 892:	7800      	jmp      	r0
}
 894:	1401      	addi      	r14, r14, 4
 896:	783c      	jmp      	r15
 898:	00002108 	.long	0x00002108

Disassembly of section .text.check_jumpAddr:

0000089c <check_jumpAddr>:

函数功能：跳转前，简单的 APP 区域代码检查

***********************************************************************/
U8_T check_jumpAddr()
{
 89c:	14d0      	push      	r15
 89e:	1421      	subi      	r14, r14, 4
	volatile unsigned int temp;
	U8_T result =0;
	ReadDataOneWord(APP_START_ADDR,1,&temp);
 8a0:	3080      	movi      	r0, 128
 8a2:	6cbb      	mov      	r2, r14
 8a4:	3101      	movi      	r1, 1
 8a6:	4006      	lsli      	r0, r0, 6
 8a8:	e0000234 	bsr      	0xd10	// d10 <ReadDataOneWord>
	if(temp == (APP_EIP_ADDR)) result = 1;
 8ac:	9840      	ld.w      	r2, (r14, 0x0)
 8ae:	1064      	lrw      	r3, 0x2108	// 8bc <check_jumpAddr+0x20>
 8b0:	64ca      	cmpne      	r2, r3
 8b2:	6403      	mvcv      	r0
	return result;
 8b4:	7400      	zextb      	r0, r0
}
 8b6:	1401      	addi      	r14, r14, 4
 8b8:	1490      	pop      	r15
 8ba:	0000      	bkpt
 8bc:	00002108 	.long	0x00002108

Disassembly of section .text.check_boot_option:

000008c0 <check_boot_option>:
返回值：启动选项 'p' 进入烧录进程 | 'b' 直接启动

***********************************************************************/

char check_boot_option(void)
{
 8c0:	14d3      	push      	r4-r6, r15
	char bootopt =0;
	int deglitchcnt;
	U32_T timecnt=0;
	MCURST_SYNC_IN_SET;
 8c2:	1141      	lrw      	r2, 0x2000005c	// 944 <check_boot_option+0x84>
 8c4:	31f0      	movi      	r1, 240
 8c6:	9200      	ld.w      	r0, (r2, 0x0)
 8c8:	9061      	ld.w      	r3, (r0, 0x4)
 8ca:	4130      	lsli      	r1, r1, 16
 8cc:	68c5      	andn      	r3, r1
 8ce:	3bb4      	bseti      	r3, 20
 8d0:	b061      	st.w      	r3, (r0, 0x4)
 8d2:	36c8      	movi      	r6, 200
	deglitchcnt=0;
 8d4:	3400      	movi      	r4, 0
 8d6:	6d4b      	mov      	r5, r2
	do
	{
		SYSCON_IWDCNT_Reload(); 
 8d8:	e3fffe1a 	bsr      	0x50c	// 50c <SYSCON_IWDCNT_Reload>
		delayms_Bycode(10);
 8dc:	300a      	movi      	r0, 10
 8de:	e00001a7 	bsr      	0xc2c	// c2c <delayms_Bycode>
		if(!MCURST_SYNC_IN_Status)
 8e2:	310d      	movi      	r1, 13
 8e4:	9500      	ld.w      	r0, (r5, 0x0)
 8e6:	e000022f 	bsr      	0xd44	// d44 <GPIO_Read_Status>
 8ea:	3840      	cmpnei      	r0, 0
 8ec:	0809      	bt      	0x8fe	// 8fe <check_boot_option+0x3e>
		{
			deglitchcnt++;
 8ee:	2400      	addi      	r4, 1
 8f0:	2e00      	subi      	r6, 1
		else
		{
			deglitchcnt=0;
		}
		timecnt++;
		if(timecnt >= 200) 
 8f2:	3e40      	cmpnei      	r6, 0
 8f4:	0807      	bt      	0x902	// 902 <check_boot_option+0x42>
		{
			UART1_CONFIG();
 8f6:	e000022f 	bsr      	0xd54	// d54 <UART1_CONFIG>
		startflag = 0;
		bootopt = 'p';
	}
	else
	{
		bootopt = 'b';
 8fa:	3062      	movi      	r0, 98
 8fc:	0422      	br      	0x940	// 940 <check_boot_option+0x80>
			deglitchcnt=0;
 8fe:	3400      	movi      	r4, 0
 900:	07f8      	br      	0x8f0	// 8f0 <check_boot_option+0x30>
	while(deglitchcnt<=10);				//RX 为低发送ACK信号
 902:	3c2a      	cmplti      	r4, 11
 904:	0bea      	bt      	0x8d8	// 8d8 <check_boot_option+0x18>
	UART1_CONFIG();
 906:	e0000227 	bsr      	0xd54	// d54 <UART1_CONFIG>
	delayms_Bycode(1);	
 90a:	3001      	movi      	r0, 1
 90c:	e0000190 	bsr      	0xc2c	// c2c <delayms_Bycode>
	delayms_Bycode(10);
 910:	300a      	movi      	r0, 10
 912:	e000018d 	bsr      	0xc2c	// c2c <delayms_Bycode>
	ErrMsgSend(RstACK,0,0,3);
 916:	3303      	movi      	r3, 3
 918:	3200      	movi      	r2, 0
 91a:	3100      	movi      	r1, 0
 91c:	3000      	movi      	r0, 0
 91e:	e3fffedb 	bsr      	0x6d4	// 6d4 <ErrMsgSend>
	delayms_Bycode(20);
 922:	3014      	movi      	r0, 20
 924:	e0000184 	bsr      	0xc2c	// c2c <delayms_Bycode>
	clear_rec_buffer();
 928:	e3ffff4e 	bsr      	0x7c4	// 7c4 <clear_rec_buffer>
	recstatus =0;
 92c:	1087      	lrw      	r4, 0x20000074	// 948 <check_boot_option+0x88>
 92e:	3300      	movi      	r3, 0
 930:	a462      	st.b      	r3, (r4, 0x2)
	if(check_program_start())
 932:	e3ffff21 	bsr      	0x774	// 774 <check_program_start>
 936:	3840      	cmpnei      	r0, 0
 938:	0fe1      	bf      	0x8fa	// 8fa <check_boot_option+0x3a>
		startflag = 0;
 93a:	3300      	movi      	r3, 0
 93c:	a463      	st.b      	r3, (r4, 0x3)
		bootopt = 'p';
 93e:	3070      	movi      	r0, 112
	}
	return bootopt;
}
 940:	1493      	pop      	r4-r6, r15
 942:	0000      	bkpt
 944:	2000005c 	.long	0x2000005c
 948:	20000074 	.long	0x20000074

Disassembly of section .text.controlword_receiving:

0000094c <controlword_receiving>:
返回值: 错误码

***********************************************************************/

U8_T controlword_receiving(U16_T time,volatile U32_T *data)
{
 94c:	14d3      	push      	r4-r6, r15
 94e:	6d03      	mov      	r4, r0
 950:	6d47      	mov      	r5, r1
	U8_T  i;
	while(time--)
	{
		if(recbufdatalen >=4) 
 952:	10d0      	lrw      	r6, 0x20000074	// 990 <controlword_receiving+0x44>
	while(time--)
 954:	3c40      	cmpnei      	r4, 0
 956:	0803      	bt      	0x95c	// 95c <controlword_receiving+0x10>
			}
			return 0;
		}
		delayms_Bycode(1);
	}
	return 1;
 958:	3001      	movi      	r0, 1
 95a:	0415      	br      	0x984	// 984 <controlword_receiving+0x38>
		if(recbufdatalen >=4) 
 95c:	9665      	ld.w      	r3, (r6, 0x14)
 95e:	2c00      	subi      	r4, 1
 960:	3b23      	cmplti      	r3, 4
 962:	7511      	zexth      	r4, r4
 964:	0811      	bt      	0x986	// 986 <controlword_receiving+0x3a>
			data[0] =0;
 966:	3300      	movi      	r3, 0
 968:	b560      	st.w      	r3, (r5, 0x0)
				data[0] |= g_rwBuffer[i];				
 96a:	100b      	lrw      	r0, 0x200000c4	// 994 <controlword_receiving+0x48>
				data[0] <<=8;	
 96c:	9540      	ld.w      	r2, (r5, 0x0)
 96e:	4248      	lsli      	r2, r2, 8
 970:	b540      	st.w      	r2, (r5, 0x0)
				data[0] |= g_rwBuffer[i];				
 972:	584c      	addu      	r2, r0, r3
 974:	8240      	ld.b      	r2, (r2, 0x0)
 976:	2300      	addi      	r3, 1
 978:	9520      	ld.w      	r1, (r5, 0x0)
 97a:	6c84      	or      	r2, r1
			for(i=0;i<4;i++)
 97c:	3b44      	cmpnei      	r3, 4
				data[0] |= g_rwBuffer[i];				
 97e:	b540      	st.w      	r2, (r5, 0x0)
			for(i=0;i<4;i++)
 980:	0bf6      	bt      	0x96c	// 96c <controlword_receiving+0x20>
 982:	3000      	movi      	r0, 0
}
 984:	1493      	pop      	r4-r6, r15
		delayms_Bycode(1);
 986:	3001      	movi      	r0, 1
 988:	e0000152 	bsr      	0xc2c	// c2c <delayms_Bycode>
 98c:	07e4      	br      	0x954	// 954 <controlword_receiving+0x8>
 98e:	0000      	bkpt
 990:	20000074 	.long	0x20000074
 994:	200000c4 	.long	0x200000c4

Disassembly of section .text.cal_image_checknum:

00000998 <cal_image_checknum>:
函数功能：计算代码镜像校验和

***********************************************************************/

U32_T cal_image_checknum(void)
{
 998:	14d4      	push      	r4-r7, r15
	U32_T sum =0;
	U32_T addr;	
	U32_T endaddr;
	U32_T tempcnt=0;
	addr = binStartAddrReced;
 99a:	106c      	lrw      	r3, 0x20000074	// 9c8 <cal_image_checknum+0x30>
	U32_T tempcnt=0;
 99c:	3500      	movi      	r5, 0
	addr = binStartAddrReced;
 99e:	938a      	ld.w      	r4, (r3, 0x28)
	U32_T sum =0;
 9a0:	3600      	movi      	r6, 0
//	if(binEndAddrReced + END_CNT_NUM > addroffset +recbufdatalen) return sum;
	endaddr = binEndAddrReced;
 9a2:	93e7      	ld.w      	r7, (r3, 0x1c)
	while(addr<endaddr)
 9a4:	65d0      	cmphs      	r4, r7
 9a6:	0c03      	bf      	0x9ac	// 9ac <cal_image_checknum+0x14>
			SYSCON_IWDCNT_Reload();
			tempcnt =0;
		}
	}
	return sum;
}
 9a8:	6c1b      	mov      	r0, r6
 9aa:	1494      	pop      	r4-r7, r15
		sum += Flash_Read_Word(addr);
 9ac:	6c13      	mov      	r0, r4
 9ae:	e0000111 	bsr      	0xbd0	// bd0 <Flash_Read_Word>
		tempcnt++;
 9b2:	2500      	addi      	r5, 1
		if(tempcnt == 100) 
 9b4:	3364      	movi      	r3, 100
 9b6:	64d6      	cmpne      	r5, r3
		sum += Flash_Read_Word(addr);
 9b8:	6180      	addu      	r6, r0
		addr +=4;
 9ba:	2403      	addi      	r4, 4
		if(tempcnt == 100) 
 9bc:	0bf4      	bt      	0x9a4	// 9a4 <cal_image_checknum+0xc>
			SYSCON_IWDCNT_Reload();
 9be:	e3fffda7 	bsr      	0x50c	// 50c <SYSCON_IWDCNT_Reload>
			tempcnt =0;
 9c2:	3500      	movi      	r5, 0
 9c4:	07f0      	br      	0x9a4	// 9a4 <cal_image_checknum+0xc>
 9c6:	0000      	bkpt
 9c8:	20000074 	.long	0x20000074

Disassembly of section .text.verify_lastProg:

000009cc <verify_lastProg>:
函数功能：对烧录的代码做校验
返回值: 错误码
***********************************************************************/

int verify_lastProg(void)
{
 9cc:	14d1      	push      	r4, r15
	U32_T check_sum = CheckNumReced+1;
 9ce:	1089      	lrw      	r4, 0x20000074	// 9f0 <verify_lastProg+0x24>
 9d0:	946b      	ld.w      	r3, (r4, 0x2c)
	check_sum = cal_image_checknum();
 9d2:	e3ffffe3 	bsr      	0x998	// 998 <cal_image_checknum>
	if(CheckNumReced != check_sum) 
 9d6:	946b      	ld.w      	r3, (r4, 0x2c)
 9d8:	64c2      	cmpne      	r0, r3
 9da:	0c08      	bf      	0x9ea	// 9ea <verify_lastProg+0x1e>
	{
		flashErase((char *) APP_START_ADDR, (ROM_END_ADDR - APP_START_ADDR));
 9dc:	3080      	movi      	r0, 128
 9de:	1026      	lrw      	r1, 0xdfff	// 9f4 <verify_lastProg+0x28>
 9e0:	4006      	lsli      	r0, r0, 6
 9e2:	e00000f9 	bsr      	0xbd4	// bd4 <flashErase>
 9e6:	1005      	lrw      	r0, 0xfffffeb3	// 9f8 <verify_lastProg+0x2c>
	}
	//SendBackStr("VrfCkSum",8,1);
	//SendBacknum(check_sum);  
	//SendBackStr("\n",1,1);
	return 0;
}
 9e8:	1491      	pop      	r4, r15
	return 0;
 9ea:	3000      	movi      	r0, 0
 9ec:	07fe      	br      	0x9e8	// 9e8 <verify_lastProg+0x1c>
 9ee:	0000      	bkpt
 9f0:	20000074 	.long	0x20000074
 9f4:	0000dfff 	.long	0x0000dfff
 9f8:	fffffeb3 	.long	0xfffffeb3

Disassembly of section .text.boot_process:

000009fc <boot_process>:
返回值：进程错误码

***********************************************************************/

int boot_process(void)
{
 9fc:	14d0      	push      	r15
	delayus_Bycode(200);
 9fe:	30c8      	movi      	r0, 200
 a00:	e0000101 	bsr      	0xc02	// c02 <delayus_Bycode>
	if(progfailed ==1 || check_jumpAddr() == 0)
 a04:	1071      	lrw      	r3, 0x20000094	// a48 <boot_process+0x4c>
 a06:	8370      	ld.b      	r3, (r3, 0x10)
 a08:	3b41      	cmpnei      	r3, 1
 a0a:	0809      	bt      	0xa1c	// a1c <boot_process+0x20>
	{
		ErrMsgSend(BootFail,0,0,1);
 a0c:	3003      	movi      	r0, 3
 a0e:	3301      	movi      	r3, 1
 a10:	3200      	movi      	r2, 0
 a12:	3100      	movi      	r1, 0
 a14:	e3fffe60 	bsr      	0x6d4	// 6d4 <ErrMsgSend>
		return 1;
 a18:	3001      	movi      	r0, 1
	clear_rec_buffer();
	delayms_Bycode(10);
	JumptoAPP();
	delayms_Bycode(10);
	return 2;
}
 a1a:	1490      	pop      	r15
	if(progfailed ==1 || check_jumpAddr() == 0)
 a1c:	e3ffff40 	bsr      	0x89c	// 89c <check_jumpAddr>
 a20:	3840      	cmpnei      	r0, 0
 a22:	0ff5      	bf      	0xa0c	// a0c <boot_process+0x10>
	ErrMsgSend(JumptoApp,0,0,1);
 a24:	3301      	movi      	r3, 1
 a26:	3200      	movi      	r2, 0
 a28:	3100      	movi      	r1, 0
 a2a:	3004      	movi      	r0, 4
 a2c:	e3fffe54 	bsr      	0x6d4	// 6d4 <ErrMsgSend>
	clear_rec_buffer();
 a30:	e3fffeca 	bsr      	0x7c4	// 7c4 <clear_rec_buffer>
	delayms_Bycode(10);
 a34:	300a      	movi      	r0, 10
 a36:	e00000fb 	bsr      	0xc2c	// c2c <delayms_Bycode>
	JumptoAPP();
 a3a:	e3ffff27 	bsr      	0x888	// 888 <JumptoAPP>
	delayms_Bycode(10);
 a3e:	300a      	movi      	r0, 10
 a40:	e00000f6 	bsr      	0xc2c	// c2c <delayms_Bycode>
	return 2;
 a44:	3002      	movi      	r0, 2
 a46:	07ea      	br      	0xa1a	// a1a <boot_process+0x1e>
 a48:	20000094 	.long	0x20000094

Disassembly of section .text.program_process:

00000a4c <program_process>:
函数功能：flash烧录进程
返回值：进程错误码

***********************************************************************/
int program_process(void)
{
 a4c:	14d4      	push      	r4-r7, r15
 a4e:	1422      	subi      	r14, r14, 8
	int err =0;
	int i;
	volatile U32_T * ptr = &binStartAddrReced;
	int tmp=0;
	//g_error = flashID(&g_flashID);
	g_error = flashErase((char *) APP_START_ADDR, (ROM_END_ADDR - APP_START_ADDR));
 a50:	3080      	movi      	r0, 128
 a52:	113f      	lrw      	r1, 0xdfff	// b4c <program_process+0x100>
 a54:	4006      	lsli      	r0, r0, 6
 a56:	e00000bf 	bsr      	0xbd4	// bd4 <flashErase>
 a5a:	119e      	lrw      	r4, 0x20000074	// b50 <program_process+0x104>
	for(i=0;i<4;i++)
	{
		switch(i)
		{
			case 0:
				ptr = &binStartAddrReced;
 a5c:	3628      	movi      	r6, 40
	g_error = flashErase((char *) APP_START_ADDR, (ROM_END_ADDR - APP_START_ADDR));
 a5e:	b40e      	st.w      	r0, (r4, 0x38)
	delayus_Bycode(3);
 a60:	3003      	movi      	r0, 3
 a62:	e00000d0 	bsr      	0xc02	// c02 <delayus_Bycode>
	startflag = 0;
 a66:	3300      	movi      	r3, 0
 a68:	a463      	st.b      	r3, (r4, 0x3)
	recstatus =1;	
 a6a:	3301      	movi      	r3, 1
 a6c:	a462      	st.b      	r3, (r4, 0x2)
	ErrMsgSend(RstACK,0,0,3);
 a6e:	3200      	movi      	r2, 0
 a70:	3303      	movi      	r3, 3
 a72:	3100      	movi      	r1, 0
 a74:	3000      	movi      	r0, 0
 a76:	e3fffe2f 	bsr      	0x6d4	// 6d4 <ErrMsgSend>
			case 1:
				ptr = &binEndAddrReced;
				tmp=binStartAddrReced;
				break;
			case 2:
				ptr = &APPjmpAddrReced;
 a7a:	3234      	movi      	r2, 52
				tmp=APP_START_ADDR;
 a7c:	3380      	movi      	r3, 128
				ptr = &APPjmpAddrReced;
 a7e:	6090      	addu      	r2, r4
				ptr = &binEndAddrReced;
 a80:	371c      	movi      	r7, 28
	for(i=0;i<4;i++)
 a82:	3500      	movi      	r5, 0
				tmp=APP_START_ADDR;
 a84:	4366      	lsli      	r3, r3, 6
				ptr = &binStartAddrReced;
 a86:	6190      	addu      	r6, r4
				ptr = &APPjmpAddrReced;
 a88:	b840      	st.w      	r2, (r14, 0x0)
				ptr = &binEndAddrReced;
 a8a:	61d0      	addu      	r7, r4
 a8c:	b861      	st.w      	r3, (r14, 0x4)
				break;
			default:
				break;
		}
		
		clear_rec_buffer();
 a8e:	e3fffe9b 	bsr      	0x7c4	// 7c4 <clear_rec_buffer>
		err = controlword_receiving(500,ptr);
 a92:	30fa      	movi      	r0, 250
 a94:	6c5b      	mov      	r1, r6
 a96:	4001      	lsli      	r0, r0, 1
 a98:	e3ffff5a 	bsr      	0x94c	// 94c <controlword_receiving>
		if(err || ptr[0] < tmp)
 a9c:	3840      	cmpnei      	r0, 0
 a9e:	9861      	ld.w      	r3, (r14, 0x4)
 aa0:	0c18      	bf      	0xad0	// ad0 <program_process+0x84>
		{
			ErrMsgSend(paramErr,3,i,1);
 aa2:	7494      	zextb      	r2, r5
 aa4:	3301      	movi      	r3, 1
 aa6:	3103      	movi      	r1, 3
 aa8:	3001      	movi      	r0, 1
 aaa:	e3fffe15 	bsr      	0x6d4	// 6d4 <ErrMsgSend>
	delayms_Bycode(2);
	g_error = program_flash();
	if(g_error) 
	{
		progfailed = 1;
		return 1;
 aae:	3501      	movi      	r5, 1
	}
	IFC->CEDR		= 0x00000000;		//IFC clock disable
	SYSCON->PCDR0	= 0x00000001;		//IFC PCLK disable
	ErrMsgSend(Verify,1,0,1);
	return 0;	
}
 ab0:	6c17      	mov      	r0, r5
 ab2:	1402      	addi      	r14, r14, 8
 ab4:	1494      	pop      	r4-r7, r15
		switch(i)
 ab6:	3d42      	cmpnei      	r5, 2
 ab8:	0c09      	bf      	0xaca	// aca <program_process+0x7e>
 aba:	3d43      	cmpnei      	r5, 3
 abc:	0804      	bt      	0xac4	// ac4 <program_process+0x78>
				tmp=0;
 abe:	3300      	movi      	r3, 0
				ptr = &CheckNumReced;
 ac0:	11c5      	lrw      	r6, 0x200000a0	// b54 <program_process+0x108>
 ac2:	07e5      	br      	0xa8c	// a8c <program_process+0x40>
				tmp=binStartAddrReced;
 ac4:	946a      	ld.w      	r3, (r4, 0x28)
				ptr = &binEndAddrReced;
 ac6:	6d9f      	mov      	r6, r7
				break;
 ac8:	07e2      	br      	0xa8c	// a8c <program_process+0x40>
				tmp=0;
 aca:	3300      	movi      	r3, 0
				ptr = &APPjmpAddrReced;
 acc:	98c0      	ld.w      	r6, (r14, 0x0)
 ace:	07df      	br      	0xa8c	// a8c <program_process+0x40>
		if(err || ptr[0] < tmp)
 ad0:	9640      	ld.w      	r2, (r6, 0x0)
 ad2:	64c8      	cmphs      	r2, r3
 ad4:	0fe7      	bf      	0xaa2	// aa2 <program_process+0x56>
		ErrMsgSend(RstACK,0,0,3);	
 ad6:	3303      	movi      	r3, 3
 ad8:	3200      	movi      	r2, 0
 ada:	3100      	movi      	r1, 0
 adc:	3000      	movi      	r0, 0
	for(i=0;i<4;i++)
 ade:	2500      	addi      	r5, 1
		ErrMsgSend(RstACK,0,0,3);	
 ae0:	e3fffdfa 	bsr      	0x6d4	// 6d4 <ErrMsgSend>
	for(i=0;i<4;i++)
 ae4:	3d44      	cmpnei      	r5, 4
 ae6:	0be8      	bt      	0xab6	// ab6 <program_process+0x6a>
	clear_rec_buffer();
 ae8:	e3fffe6e 	bsr      	0x7c4	// 7c4 <clear_rec_buffer>
	delayms_Bycode(2);
 aec:	3002      	movi      	r0, 2
 aee:	e000009f 	bsr      	0xc2c	// c2c <delayms_Bycode>
	g_error = program_flash();
 af2:	e3fffe81 	bsr      	0x7f4	// 7f4 <program_flash>
	if(g_error) 
 af6:	3840      	cmpnei      	r0, 0
	g_error = program_flash();
 af8:	6d43      	mov      	r5, r0
 afa:	b40e      	st.w      	r0, (r4, 0x38)
	if(g_error) 
 afc:	0c05      	bf      	0xb06	// b06 <program_process+0xba>
		progfailed = 1;
 afe:	1077      	lrw      	r3, 0x20000094	// b58 <program_process+0x10c>
 b00:	3201      	movi      	r2, 1
 b02:	a350      	st.b      	r2, (r3, 0x10)
 b04:	07d5      	br      	0xaae	// aae <program_process+0x62>
	SYSCON -> IWDEDR = 0x78870000 | 0x5555; // disable watch dog
 b06:	10d6      	lrw      	r6, 0x20000068	// b5c <program_process+0x110>
 b08:	1056      	lrw      	r2, 0x78875555	// b60 <program_process+0x114>
 b0a:	9660      	ld.w      	r3, (r6, 0x0)
 b0c:	237f      	addi      	r3, 128
 b0e:	b34f      	st.w      	r2, (r3, 0x3c)
	g_error = verify_lastProg();	
 b10:	e3ffff5e 	bsr      	0x9cc	// 9cc <verify_lastProg>
	if(g_error == BOOTERR_VERIFY)
 b14:	1074      	lrw      	r3, 0xfffffeb3	// b64 <program_process+0x118>
 b16:	64c2      	cmpne      	r0, r3
	g_error = verify_lastProg();	
 b18:	b40e      	st.w      	r0, (r4, 0x38)
	if(g_error == BOOTERR_VERIFY)
 b1a:	080a      	bt      	0xb2e	// b2e <program_process+0xe2>
		SYSCON_IWDCNT_Reload();
 b1c:	e3fffcf8 	bsr      	0x50c	// 50c <SYSCON_IWDCNT_Reload>
		ErrMsgSend(Verify,2,0,1);
 b20:	3301      	movi      	r3, 1
 b22:	3200      	movi      	r2, 0
 b24:	3102      	movi      	r1, 2
 b26:	3002      	movi      	r0, 2
 b28:	e3fffdd6 	bsr      	0x6d4	// 6d4 <ErrMsgSend>
		asm ("nop");
 b2c:	6c03      	mov      	r0, r0
	IFC->CEDR		= 0x00000000;		//IFC clock disable
 b2e:	106f      	lrw      	r3, 0x2000006c	// b68 <program_process+0x11c>
 b30:	3200      	movi      	r2, 0
 b32:	9360      	ld.w      	r3, (r3, 0x0)
 b34:	b341      	st.w      	r2, (r3, 0x4)
	SYSCON->PCDR0	= 0x00000001;		//IFC PCLK disable
 b36:	9660      	ld.w      	r3, (r6, 0x0)
 b38:	3201      	movi      	r2, 1
 b3a:	b34b      	st.w      	r2, (r3, 0x2c)
	ErrMsgSend(Verify,1,0,1);
 b3c:	3101      	movi      	r1, 1
 b3e:	3301      	movi      	r3, 1
 b40:	3200      	movi      	r2, 0
 b42:	3002      	movi      	r0, 2
 b44:	e3fffdc8 	bsr      	0x6d4	// 6d4 <ErrMsgSend>
	return 0;	
 b48:	07b4      	br      	0xab0	// ab0 <program_process+0x64>
 b4a:	0000      	bkpt
 b4c:	0000dfff 	.long	0x0000dfff
 b50:	20000074 	.long	0x20000074
 b54:	200000a0 	.long	0x200000a0
 b58:	20000094 	.long	0x20000094
 b5c:	20000068 	.long	0x20000068
 b60:	78875555 	.long	0x78875555
 b64:	fffffeb3 	.long	0xfffffeb3
 b68:	2000006c 	.long	0x2000006c

Disassembly of section .text.rst_mcu:

00000b6c <rst_mcu>:
函数功能：软复位MCU
返回值：进程错误码

***********************************************************************/
int rst_mcu(void)
{
 b6c:	14d0      	push      	r15
	SYSCON_Software_Reset();
 b6e:	e3fffce5 	bsr      	0x538	// 538 <SYSCON_Software_Reset>
	delayus_Bycode(3);
 b72:	3003      	movi      	r0, 3
 b74:	e0000047 	bsr      	0xc02	// c02 <delayus_Bycode>
	return 1;
}
 b78:	3001      	movi      	r0, 1
 b7a:	1490      	pop      	r15

Disassembly of section .text.wait_cmd:

00000b7c <wait_cmd>:
函数功能：等待上位机串口复位指令
返回值：无

***********************************************************************/
void wait_cmd(void)
{
 b7c:	14d3      	push      	r4-r6, r15
	int tmpcnt =0;
	clear_rec_buffer();
 b7e:	e3fffe23 	bsr      	0x7c4	// 7c4 <clear_rec_buffer>
	recstatus =2;
 b82:	1072      	lrw      	r3, 0x20000074	// bc8 <wait_cmd+0x4c>
 b84:	3202      	movi      	r2, 2
 b86:	a342      	st.b      	r2, (r3, 0x2)
	rstflag =0;	
 b88:	3200      	movi      	r2, 0
 b8a:	a34c      	st.b      	r2, (r3, 0xc)
	int tmpcnt =0;
 b8c:	3400      	movi      	r4, 0
 b8e:	6d4f      	mov      	r5, r3
	while(1)
	{		
		if(rstflag) break;
		tmpcnt++;
		tmpcnt %= 1000;
		if(tmpcnt == 999) SYSCON_IWDCNT_Reload();
 b90:	10cf      	lrw      	r6, 0x3e7	// bcc <wait_cmd+0x50>
		if(rstflag) break;
 b92:	856c      	ld.b      	r3, (r5, 0xc)
 b94:	3b40      	cmpnei      	r3, 0
 b96:	080c      	bt      	0xbae	// bae <wait_cmd+0x32>
		tmpcnt %= 1000;
 b98:	31fa      	movi      	r1, 250
		tmpcnt++;
 b9a:	5c02      	addi      	r0, r4, 1
		tmpcnt %= 1000;
 b9c:	4122      	lsli      	r1, r1, 2
 b9e:	e3fffb09 	bsr      	0x1b0	// 1b0 <__modsi3>
		if(tmpcnt == 999) SYSCON_IWDCNT_Reload();
 ba2:	6582      	cmpne      	r0, r6
		tmpcnt %= 1000;
 ba4:	6d03      	mov      	r4, r0
		if(tmpcnt == 999) SYSCON_IWDCNT_Reload();
 ba6:	0bf6      	bt      	0xb92	// b92 <wait_cmd+0x16>
 ba8:	e3fffcb2 	bsr      	0x50c	// 50c <SYSCON_IWDCNT_Reload>
 bac:	07f3      	br      	0xb92	// b92 <wait_cmd+0x16>
	}
	ErrMsgSend(RstACK,0,0,3);
 bae:	3303      	movi      	r3, 3
 bb0:	3200      	movi      	r2, 0
 bb2:	3100      	movi      	r1, 0
 bb4:	3000      	movi      	r0, 0
 bb6:	e3fffd8f 	bsr      	0x6d4	// 6d4 <ErrMsgSend>
	delayms_Bycode(50);	
 bba:	3032      	movi      	r0, 50
 bbc:	e0000038 	bsr      	0xc2c	// c2c <delayms_Bycode>
	rst_mcu();
 bc0:	e3ffffd6 	bsr      	0xb6c	// b6c <rst_mcu>
 }
 bc4:	1493      	pop      	r4-r6, r15
 bc6:	0000      	bkpt
 bc8:	20000074 	.long	0x20000074
 bcc:	000003e7 	.long	0x000003e7

Disassembly of section .text.Flash_Read_Word:

00000bd0 <Flash_Read_Word>:
 */

U32_T Flash_Read_Word(U32_T addr)
{
	//注意在此前pclk得使能，否则ifc时钟是没有的！
 	return (*(volatile unsigned int *)(addr));
 bd0:	9000      	ld.w      	r0, (r0, 0x0)
}
 bd2:	783c      	jmp      	r15

Disassembly of section .text.flashErase:

00000bd4 <flashErase>:
 * @return : if this method returns an error,MUST RUTURN ERROR_ERASE,
 * Otherwise return 0
 */
// volatile CK_UINT32 preaddr =0;
int flashErase(char *dst, int length)
{
 bd4:	14d0      	push      	r15
 bd6:	1422      	subi      	r14, r14, 8
  	volatile CK_UINT32 w_length;
	volatile CK_UINT32 address;
	address = (CK_UINT32) dst;
	w_length = (length)/0x100 ;
 bd8:	39df      	btsti      	r1, 31
	address = (CK_UINT32) dst;
 bda:	b801      	st.w      	r0, (r14, 0x4)
	w_length = (length)/0x100 ;
 bdc:	0c02      	bf      	0xbe0	// be0 <flashErase+0xc>
 bde:	21fe      	addi      	r1, 255
 be0:	5128      	asri      	r1, r1, 8
 be2:	b820      	st.w      	r1, (r14, 0x0)
	while(w_length--)
 be4:	9860      	ld.w      	r3, (r14, 0x0)
 be6:	5b43      	subi      	r2, r3, 1
 be8:	3b40      	cmpnei      	r3, 0
 bea:	b840      	st.w      	r2, (r14, 0x0)
 bec:	0804      	bt      	0xbf4	// bf4 <flashErase+0x20>
	{
		PageErase(address);
		address += 0x100;
	}
	return 0;
}
 bee:	3000      	movi      	r0, 0
 bf0:	1402      	addi      	r14, r14, 8
 bf2:	1490      	pop      	r15
		PageErase(address);
 bf4:	9801      	ld.w      	r0, (r14, 0x4)
 bf6:	e000002b 	bsr      	0xc4c	// c4c <PageErase>
		address += 0x100;
 bfa:	9861      	ld.w      	r3, (r14, 0x4)
 bfc:	23ff      	addi      	r3, 256
 bfe:	b861      	st.w      	r3, (r14, 0x4)
 c00:	07f2      	br      	0xbe4	// be4 <flashErase+0x10>

Disassembly of section .text.delayus_Bycode:

00000c02 <delayus_Bycode>:
// t=0 ,1.98us
// t=1 ,1.98us
// t=2 ,1.98us
// t=3 ,3.02us
void delayus_Bycode(unsigned int t)
{
 c02:	1421      	subi      	r14, r14, 4
	volatile unsigned int i =  t>1?t-2:0;
 c04:	3801      	cmphsi      	r0, 2
 c06:	0c0a      	bf      	0xc1a	// c1a <delayus_Bycode+0x18>
 c08:	2801      	subi      	r0, 2
 c0a:	b800      	st.w      	r0, (r14, 0x0)
	while(i--){
 c0c:	9860      	ld.w      	r3, (r14, 0x0)
 c0e:	5b43      	subi      	r2, r3, 1
 c10:	3b40      	cmpnei      	r3, 0
 c12:	b840      	st.w      	r2, (r14, 0x0)
 c14:	0805      	bt      	0xc1e	// c1e <delayus_Bycode+0x1c>
		asm("nop");
		asm("nop");
		asm("nop");
		asm("nop");
	}
}
 c16:	1401      	addi      	r14, r14, 4
 c18:	783c      	jmp      	r15
	volatile unsigned int i =  t>1?t-2:0;
 c1a:	3000      	movi      	r0, 0
 c1c:	07f7      	br      	0xc0a	// c0a <delayus_Bycode+0x8>
		asm("nop");
 c1e:	6c03      	mov      	r0, r0
		asm("nop");
 c20:	6c03      	mov      	r0, r0
		asm("nop");
 c22:	6c03      	mov      	r0, r0
		asm("nop");
 c24:	6c03      	mov      	r0, r0
		asm("nop");
 c26:	6c03      	mov      	r0, r0
		asm("nop");
 c28:	6c03      	mov      	r0, r0
 c2a:	07f1      	br      	0xc0c	// c0c <delayus_Bycode+0xa>

Disassembly of section .text.delayms_Bycode:

00000c2c <delayms_Bycode>:
// t=0 ,3.00us
// t=1 ,1.00ms
// t=2 ,2.00ms
// t=3 ,3.00ms
void delayms_Bycode(unsigned int t)
{
 c2c:	14d0      	push      	r15
 c2e:	1421      	subi      	r14, r14, 4
	volatile unsigned int i = t;
 c30:	b800      	st.w      	r0, (r14, 0x0)
	while(i--){
 c32:	9860      	ld.w      	r3, (r14, 0x0)
 c34:	5b43      	subi      	r2, r3, 1
 c36:	3b40      	cmpnei      	r3, 0
 c38:	b840      	st.w      	r2, (r14, 0x0)
 c3a:	0803      	bt      	0xc40	// c40 <delayms_Bycode+0x14>
		delayus_Bycode(940);
	}
}
 c3c:	1401      	addi      	r14, r14, 4
 c3e:	1490      	pop      	r15
		delayus_Bycode(940);
 c40:	30eb      	movi      	r0, 235
 c42:	4002      	lsli      	r0, r0, 2
 c44:	e3ffffdf 	bsr      	0xc02	// c02 <delayus_Bycode>
 c48:	07f5      	br      	0xc32	// c32 <delayms_Bycode+0x6>

Disassembly of section .text.PageErase:

00000c4c <PageErase>:
//DROM_PageAdd0~DROM_PageAdd31
//ReturnValue:NONE
*************************************************************/
void PageErase(IFC_ROMSELETED_TypeDef XROM_PageAdd)
{
	SetUserKey;
 c4c:	1067      	lrw      	r3, 0x2000006c	// c68 <PageErase+0x1c>
 c4e:	1048      	lrw      	r2, 0x5a5a5a5a	// c6c <PageErase+0x20>
 c50:	9360      	ld.w      	r3, (r3, 0x0)
 c52:	b348      	st.w      	r2, (r3, 0x20)
	EnPageErase;
 c54:	3202      	movi      	r2, 2
 c56:	b343      	st.w      	r2, (r3, 0xc)
	IFC->FM_ADDR=XROM_PageAdd;
	StartErase;
 c58:	3201      	movi      	r2, 1
	IFC->FM_ADDR=XROM_PageAdd;
 c5a:	b306      	st.w      	r0, (r3, 0x18)
	StartErase;
 c5c:	b344      	st.w      	r2, (r3, 0x10)
	while(IFC->CR!=0x0);
 c5e:	9344      	ld.w      	r2, (r3, 0x10)
 c60:	3a40      	cmpnei      	r2, 0
 c62:	0bfe      	bt      	0xc5e	// c5e <PageErase+0x12>
}
 c64:	783c      	jmp      	r15
 c66:	0000      	bkpt
 c68:	2000006c 	.long	0x2000006c
 c6c:	5a5a5a5a 	.long	0x5a5a5a5a

Disassembly of section .text.Page_ProgramData:

00000c70 <Page_ProgramData>:
		IFC->CR=0X01;					//Start Program
	}
}
//一般模式，调用一次完成，会在程序中延时4.2MS
void Page_ProgramData(unsigned int FlashAdd,unsigned int DataSize,volatile unsigned char *BufArry)
{
 c70:	14c4      	push      	r4-r7
 c72:	1422      	subi      	r14, r14, 8
	int i,DataBuffer;

	//页缓存擦除 1
	SetUserKey;
 c74:	1165      	lrw      	r3, 0x2000006c	// d08 <Page_ProgramData+0x98>
 c76:	1186      	lrw      	r4, 0x5a5a5a5a	// d0c <Page_ProgramData+0x9c>
 c78:	9360      	ld.w      	r3, (r3, 0x0)
 c7a:	b388      	st.w      	r4, (r3, 0x20)
	IFC->CMR=0x07;					//页缓存擦除
 c7c:	3407      	movi      	r4, 7
 c7e:	b383      	st.w      	r4, (r3, 0xc)
	IFC->FM_ADDR=FlashAdd;
	IFC->CR=0X01;					//Start Program
 c80:	3401      	movi      	r4, 1
	IFC->FM_ADDR=FlashAdd;
 c82:	b306      	st.w      	r0, (r3, 0x18)
	IFC->CR=0X01;					//Start Program
 c84:	b384      	st.w      	r4, (r3, 0x10)
	while(IFC->CR!=0x0);			//等待操作完成
 c86:	9384      	ld.w      	r4, (r3, 0x10)
 c88:	3c40      	cmpnei      	r4, 0
 c8a:	0bfe      	bt      	0xc86	// c86 <Page_ProgramData+0x16>
	//向写缓存中写数据 2
	for(i=0;i<((DataSize+3)/4);i++)   //sizeof structure
 c8c:	2102      	addi      	r1, 3
 c8e:	4922      	lsri      	r1, r1, 2
 c90:	4122      	lsli      	r1, r1, 2
 c92:	6048      	addu      	r1, r2
 c94:	b820      	st.w      	r1, (r14, 0x0)
 c96:	5829      	subu      	r1, r0, r2
 c98:	b821      	st.w      	r1, (r14, 0x4)
 c9a:	9820      	ld.w      	r1, (r14, 0x0)
 c9c:	644a      	cmpne      	r2, r1
 c9e:	0826      	bt      	0xcea	// cea <Page_ProgramData+0x7a>
		*(volatile unsigned int *)(FlashAdd+4*i)=DataBuffer;
		BufArry  +=4;
	}
	//预编程操作设定 3
	SetUserKey;
	IFC->CMR=0x06;					//预编程操作设定
 ca0:	3106      	movi      	r1, 6
	SetUserKey;
 ca2:	105b      	lrw      	r2, 0x5a5a5a5a	// d0c <Page_ProgramData+0x9c>
 ca4:	b348      	st.w      	r2, (r3, 0x20)
	IFC->CMR=0x06;					//预编程操作设定
 ca6:	b323      	st.w      	r1, (r3, 0xc)
	IFC->FM_ADDR=FlashAdd;
	IFC->CR=0X01;					//Start Program
 ca8:	3101      	movi      	r1, 1
	IFC->FM_ADDR=FlashAdd;
 caa:	b306      	st.w      	r0, (r3, 0x18)
	IFC->CR=0X01;					//Start Program
 cac:	b324      	st.w      	r1, (r3, 0x10)
	while(IFC->CR!=0x0);			//等待操作完成
 cae:	9324      	ld.w      	r1, (r3, 0x10)
 cb0:	3940      	cmpnei      	r1, 0
 cb2:	0bfe      	bt      	0xcae	// cae <Page_ProgramData+0x3e>
	//执行预编程 4
	SetUserKey;
 cb4:	b348      	st.w      	r2, (r3, 0x20)
	IFC->CMR=0x01;					//执行预编程
 cb6:	3201      	movi      	r2, 1
 cb8:	b343      	st.w      	r2, (r3, 0xc)
	IFC->FM_ADDR=FlashAdd;			//
 cba:	b306      	st.w      	r0, (r3, 0x18)
	IFC->CR=0X01;					//Start Program
 cbc:	b344      	st.w      	r2, (r3, 0x10)
	while(IFC->MISR!=PEP_END_INT);			//等待操作完成
 cbe:	934b      	ld.w      	r2, (r3, 0x2c)
 cc0:	3a44      	cmpnei      	r2, 4
 cc2:	0bfe      	bt      	0xcbe	// cbe <Page_ProgramData+0x4e>
	//页擦除 5
	SetUserKey;
	IFC->CMR=0x02;					//页擦除
 cc4:	3102      	movi      	r1, 2
	SetUserKey;
 cc6:	1052      	lrw      	r2, 0x5a5a5a5a	// d0c <Page_ProgramData+0x9c>
 cc8:	b348      	st.w      	r2, (r3, 0x20)
	IFC->CMR=0x02;					//页擦除
 cca:	b323      	st.w      	r1, (r3, 0xc)
	IFC->FM_ADDR=FlashAdd;			//
	IFC->CR=0X01;					//Start Program
 ccc:	3101      	movi      	r1, 1
	IFC->FM_ADDR=FlashAdd;			//
 cce:	b306      	st.w      	r0, (r3, 0x18)
	IFC->CR=0X01;					//Start Program
 cd0:	b324      	st.w      	r1, (r3, 0x10)
	while(IFC->MISR!=ERS_END_INT);			//等待操作完成
 cd2:	932b      	ld.w      	r1, (r3, 0x2c)
 cd4:	3941      	cmpnei      	r1, 1
 cd6:	0bfe      	bt      	0xcd2	// cd2 <Page_ProgramData+0x62>
	//将页缓存的数据写入闪存中 6
	SetUserKey;
 cd8:	b348      	st.w      	r2, (r3, 0x20)
	IFC->CMR=0x01;					//将页缓存的数据写入闪存中
 cda:	b323      	st.w      	r1, (r3, 0xc)
	IFC->FM_ADDR=FlashAdd;		//
 cdc:	b306      	st.w      	r0, (r3, 0x18)
	IFC->CR=0X01;					//Start Program
 cde:	b324      	st.w      	r1, (r3, 0x10)
	while(IFC->MISR!=RGM_END_INT);			//等待操作完成
 ce0:	934b      	ld.w      	r2, (r3, 0x2c)
 ce2:	3a42      	cmpnei      	r2, 2
 ce4:	0bfe      	bt      	0xce0	// ce0 <Page_ProgramData+0x70>
	
}
 ce6:	1402      	addi      	r14, r14, 8
 ce8:	1484      	pop      	r4-r7
		DataBuffer=*BufArry+(*(BufArry+1)<<8)+(*(BufArry+2)<<16)+(*(BufArry+3)<<24);
 cea:	82e0      	ld.b      	r7, (r2, 0x0)
 cec:	8281      	ld.b      	r4, (r2, 0x1)
 cee:	4488      	lsli      	r4, r4, 8
 cf0:	8222      	ld.b      	r1, (r2, 0x2)
 cf2:	611c      	addu      	r4, r7
 cf4:	82a3      	ld.b      	r5, (r2, 0x3)
 cf6:	4130      	lsli      	r1, r1, 16
 cf8:	98c1      	ld.w      	r6, (r14, 0x4)
 cfa:	6050      	addu      	r1, r4
 cfc:	45b8      	lsli      	r5, r5, 24
 cfe:	6188      	addu      	r6, r2
 d00:	6054      	addu      	r1, r5
		*(volatile unsigned int *)(FlashAdd+4*i)=DataBuffer;
 d02:	b620      	st.w      	r1, (r6, 0x0)
		BufArry  +=4;
 d04:	2203      	addi      	r2, 4
 d06:	07ca      	br      	0xc9a	// c9a <Page_ProgramData+0x2a>
 d08:	2000006c 	.long	0x2000006c
 d0c:	5a5a5a5a 	.long	0x5a5a5a5a

Disassembly of section .text.ReadDataOneWord:

00000d10 <ReadDataOneWord>:
		RdStartAdd +=4;
		DataArryPoint +=4;
	}
}
void ReadDataOneWord(unsigned int RdStartAdd,unsigned int DataLength, volatile unsigned int *DataOneWord)
{
 d10:	14c1      	push      	r4
	unsigned int i,Buffer;
	//delay_nms(1);
	for(i=0;i<DataLength;i++)
 d12:	3300      	movi      	r3, 0
 d14:	644e      	cmpne      	r3, r1
 d16:	0802      	bt      	0xd1a	// d1a <ReadDataOneWord+0xa>
	{
		Buffer=*(volatile unsigned int *)RdStartAdd;
		*DataOneWord=Buffer;
		RdStartAdd +=4;
	}
}
 d18:	1481      	pop      	r4
 d1a:	4382      	lsli      	r4, r3, 2
 d1c:	6100      	addu      	r4, r0
		Buffer=*(volatile unsigned int *)RdStartAdd;
 d1e:	9480      	ld.w      	r4, (r4, 0x0)
		*DataOneWord=Buffer;
 d20:	b280      	st.w      	r4, (r2, 0x0)
	for(i=0;i<DataLength;i++)
 d22:	2300      	addi      	r3, 1
 d24:	07f8      	br      	0xd14	// d14 <ReadDataOneWord+0x4>

Disassembly of section .text.IFC_interrupt_CMD:

00000d28 <IFC_interrupt_CMD>:
//EntryParameter:IFC_INT_x
//IFC_INT_x:ERS_END_INT,RGM_END_INT,PEP_END_INT,PROT_ERR_INT,UDEF_ERR_INT,ADDR_ERR_INT,OVW_ERR_INT
//ReturnValue:NONE
*************************************************************/
void IFC_interrupt_CMD(FunctionalStatus NewState ,IFC_INT_TypeDef IFC_INT_x)
{
 d28:	1066      	lrw      	r3, 0x2000006c	// d40 <IFC_interrupt_CMD+0x18>
	if(NewState != DISABLE)
 d2a:	3840      	cmpnei      	r0, 0
	{
		IFC->IMCR =IFC->IMCR|IFC_INT_x;
 d2c:	9340      	ld.w      	r2, (r3, 0x0)
 d2e:	9269      	ld.w      	r3, (r2, 0x24)
	if(NewState != DISABLE)
 d30:	0c04      	bf      	0xd38	// d38 <IFC_interrupt_CMD+0x10>
		IFC->IMCR =IFC->IMCR|IFC_INT_x;
 d32:	6c4c      	or      	r1, r3
 d34:	b229      	st.w      	r1, (r2, 0x24)
	}
	else 
	{
		IFC->IMCR =IFC->IMCR & (~IFC_INT_x);
	}
}
 d36:	783c      	jmp      	r15
		IFC->IMCR =IFC->IMCR & (~IFC_INT_x);
 d38:	68c5      	andn      	r3, r1
 d3a:	b269      	st.w      	r3, (r2, 0x24)
}
 d3c:	07fd      	br      	0xd36	// d36 <IFC_interrupt_CMD+0xe>
 d3e:	0000      	bkpt
 d40:	2000006c 	.long	0x2000006c

Disassembly of section .text.GPIO_Read_Status:

00000d44 <GPIO_Read_Status>:
/*************************************************************/
uint8_t GPIO_Read_Status(CSP_GPIO_T *GPIOx,uint8_t bit)
{
    uint8_t value = 0;
    uint32_t dat = 0;
    dat=((GPIOx)->PSDR)&(1<<bit);
 d44:	3301      	movi      	r3, 1
 d46:	9046      	ld.w      	r2, (r0, 0x18)
 d48:	70c4      	lsl      	r3, r1
 d4a:	688c      	and      	r2, r3
    if (dat == (1<<bit))								
 d4c:	64ca      	cmpne      	r2, r3
 d4e:	6403      	mvcv      	r0
	{
	    value = 1;
	} 
    return value;
 d50:	7400      	zextb      	r0, r0
}
 d52:	783c      	jmp      	r15

Disassembly of section .text.UART1_CONFIG:

00000d54 <UART1_CONFIG>:
//UART1  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void UART1_CONFIG(void)
{
 d54:	14d0      	push      	r15
	UART1_DeInit();                                                 //clear all UART Register
 d56:	e3fffbfb 	bsr      	0x54c	// 54c <UART1_DeInit>
	GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)  | 0x00000007;       //PA0.13->RXD1, PB0.0->TXD1
 d5a:	106f      	lrw      	r3, 0x20000058	// d94 <UART1_CONFIG+0x40>
 d5c:	310f      	movi      	r1, 15
 d5e:	9340      	ld.w      	r2, (r3, 0x0)
 d60:	9260      	ld.w      	r3, (r2, 0x0)
 d62:	68c5      	andn      	r3, r1
 d64:	3107      	movi      	r1, 7
 d66:	6cc4      	or      	r3, r1
 d68:	b260      	st.w      	r3, (r2, 0x0)
	GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)  | 0x00700000;
 d6a:	32f0      	movi      	r2, 240
 d6c:	106b      	lrw      	r3, 0x2000005c	// d98 <UART1_CONFIG+0x44>
 d6e:	4250      	lsli      	r2, r2, 16
 d70:	9320      	ld.w      	r1, (r3, 0x0)
 d72:	9161      	ld.w      	r3, (r1, 0x4)
 d74:	68c9      	andn      	r3, r2
 d76:	32e0      	movi      	r2, 224
 d78:	424f      	lsli      	r2, r2, 15
 d7a:	6cc8      	or      	r3, r2
 d7c:	b161      	st.w      	r3, (r1, 0x4)
    UARTInitRxTxIntEn(UART1,416,UART_PAR_NONE);	                    //baudrate=sysclock/173=115200
 d7e:	31d0      	movi      	r1, 208
 d80:	1067      	lrw      	r3, 0x2000004c	// d9c <UART1_CONFIG+0x48>
 d82:	3200      	movi      	r2, 0
 d84:	9300      	ld.w      	r0, (r3, 0x0)
 d86:	4121      	lsli      	r1, r1, 1
 d88:	e3fffbfc 	bsr      	0x580	// 580 <UARTInitRxTxIntEn>
	UART1_Int_Enable();
 d8c:	e3fffbec 	bsr      	0x564	// 564 <UART1_Int_Enable>
}	
 d90:	1490      	pop      	r15
 d92:	0000      	bkpt
 d94:	20000058 	.long	0x20000058
 d98:	2000005c 	.long	0x2000005c
 d9c:	2000004c 	.long	0x2000004c

Disassembly of section .text.IFC_CONFIG:

00000da0 <IFC_CONFIG>:
//ifc config
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void IFC_CONFIG(void)
{
 da0:	14d0      	push      	r15
	EnIFCClk;						//使能IFC时钟
 da2:	106b      	lrw      	r3, 0x2000006c	// dcc <IFC_CONFIG+0x2c>
 da4:	3201      	movi      	r2, 1
 da6:	9360      	ld.w      	r3, (r3, 0x0)
 da8:	b341      	st.w      	r2, (r3, 0x4)
	IFC->MR=(IFC->MR&0xfffffeff)|(0x01<<8);		//设置为并行模式
 daa:	9345      	ld.w      	r2, (r3, 0x14)
 dac:	3aa8      	bseti      	r2, 8
 dae:	b345      	st.w      	r2, (r3, 0x14)
	IFC_interrupt_CMD(ENABLE,ERS_END_INT);		//擦除完成指令中断
 db0:	3101      	movi      	r1, 1
 db2:	3001      	movi      	r0, 1
 db4:	e3ffffba 	bsr      	0xd28	// d28 <IFC_interrupt_CMD>
	IFC_interrupt_CMD(ENABLE,RGM_END_INT);		//编程指令执行完成中断
 db8:	3102      	movi      	r1, 2
 dba:	3001      	movi      	r0, 1
 dbc:	e3ffffb6 	bsr      	0xd28	// d28 <IFC_interrupt_CMD>
	IFC_interrupt_CMD(ENABLE,PEP_END_INT);		//预编程指令执行完成中断
 dc0:	3104      	movi      	r1, 4
 dc2:	3001      	movi      	r0, 1
 dc4:	e3ffffb2 	bsr      	0xd28	// d28 <IFC_interrupt_CMD>
	//IFC_Int_Enable();
}
 dc8:	1490      	pop      	r15
 dca:	0000      	bkpt
 dcc:	2000006c 	.long	0x2000006c

Disassembly of section .text.SYSCON_CONFIG:

00000dd0 <SYSCON_CONFIG>:
//syscon Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_CONFIG(void)
{
 dd0:	14d0      	push      	r15
//------SYSTEM CLK AND PCLK FUNTION---------------------------/
	SYSCON_RST_VALUE();                                                         //SYSCON all register clr
 dd2:	e3fffae9 	bsr      	0x3a4	// 3a4 <SYSCON_RST_VALUE>
	//SystemCLK_HCLKDIV_PCLKDIV_Config(SYSCLK_IMOSC,HCLK_DIV_1,PCLK_DIV_1,IMOSC);
	SYSCON_General_CMD(ENABLE,ENDIS_ISOSC);
 dd6:	3101      	movi      	r1, 1
 dd8:	3001      	movi      	r0, 1
 dda:	e3fffb11 	bsr      	0x3fc	// 3fc <SYSCON_General_CMD>
	//EMOSC_OSTR_Config(0XAD,0X1f,EM_LFSEL_EN,EM_FLEN_EN,EM_FLSEL_10ns);			//EM_CNT=0X3FF,0xAD(36K),EM_GM=0,Low F modedisable,EM filter disable,if enable,cont set 5ns
	//SYSCON_General_CMD(ENABLE,ENDIS_EMOSC);
	SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_48M);									//HFOSC selected 48MHz
 dde:	3000      	movi      	r0, 0
 de0:	e3fffb64 	bsr      	0x4a8	// 4a8 <SYSCON_HFOSC_SELECTE>
	SystemCLK_HCLKDIV_PCLKDIV_Config(SYSCLK_HFOSC,HCLK_DIV_1,PCLK_DIV_1,HFOSC_48M);//system clock set, Hclk div ,Pclk div  set system clock=SystemCLK/Hclk div/Pclk div
 de4:	3180      	movi      	r1, 128
 de6:	3308      	movi      	r3, 8
 de8:	3200      	movi      	r2, 0
 dea:	4121      	lsli      	r1, r1, 1
 dec:	3002      	movi      	r0, 2
 dee:	e3fffb1f 	bsr      	0x42c	// 42c <SystemCLK_HCLKDIV_PCLKDIV_Config>
//------------  WDT FUNTION  --------------------------------/
    SYSCON_IWDCNT_Config(IWDT_TIME_2S,IWDT_INTW_DIV_7);      					//WDT TIME 1s,WDT alarm interrupt time=1s-1s*1/8=0.875S
 df2:	3080      	movi      	r0, 128
 df4:	3118      	movi      	r1, 24
 df6:	4003      	lsli      	r0, r0, 3
 df8:	e3fffb94 	bsr      	0x520	// 520 <SYSCON_IWDCNT_Config>
    SYSCON_WDT_CMD(ENABLE);                                                  	//enable WDT		
 dfc:	3001      	movi      	r0, 1
 dfe:	e3fffb69 	bsr      	0x4d0	// 4d0 <SYSCON_WDT_CMD>
    SYSCON_IWDCNT_Reload();                                                   	//reload WDT
 e02:	e3fffb85 	bsr      	0x50c	// 50c <SYSCON_IWDCNT_Reload>
	
	//SYSCON->IMER =EM_EVTRG0_ST;
//------------  SYSCON Vector  --------------------------------/ 	
	//SYSCON_Int_Enable();    														//SYSCON VECTOR
	//SYSCON_WakeUp_Enable();    													//Enable WDT wakeup INT
}
 e06:	1490      	pop      	r15

Disassembly of section .text.APT32F102_init:

00000e08 <APT32F102_init>:
//ReturnValue:NONE                                                                /
/*********************************************************************************/
/*********************************************************************************/  
/*********************************************************************************/
void APT32F102_init(void) 
{
 e08:	14d0      	push      	r15
//------------------------------------------------------------/
//Peripheral clock enable and disable
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON->PCER0=0xFFFFFFF;                                        //PCLK Enable  0x00410071
 e0a:	106a      	lrw      	r3, 0x20000068	// e30 <APT32F102_init+0x28>
    SYSCON->PCER1=0xFFFFFFF;                                        //PCLK Enable
    while(!(SYSCON->PCSR0&0x1));                                    //Wait PCLK enabled	
 e0c:	3101      	movi      	r1, 1
    SYSCON->PCER0=0xFFFFFFF;                                        //PCLK Enable  0x00410071
 e0e:	9340      	ld.w      	r2, (r3, 0x0)
 e10:	1069      	lrw      	r3, 0xfffffff	// e34 <APT32F102_init+0x2c>
 e12:	b26a      	st.w      	r3, (r2, 0x28)
    SYSCON->PCER1=0xFFFFFFF;                                        //PCLK Enable
 e14:	b26d      	st.w      	r3, (r2, 0x34)
    while(!(SYSCON->PCSR0&0x1));                                    //Wait PCLK enabled	
 e16:	926c      	ld.w      	r3, (r2, 0x30)
 e18:	68c4      	and      	r3, r1
 e1a:	3b40      	cmpnei      	r3, 0
 e1c:	0ffd      	bf      	0xe16	// e16 <APT32F102_init+0xe>
//------------------------------------------------------------/
//ISOSC/IMOSC/EMOSC/SYSCLK/IWDT/LVD/EM_CMFAIL/EM_CMRCV/CMD_ERR OSC stable interrupt
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON_CONFIG();                                                 //syscon  initial
 e1e:	e3ffffd9 	bsr      	0xdd0	// dd0 <SYSCON_CONFIG>
	//CK_CPU_EnAllNormalIrq();                                         //enable all IRQ
	asm  ("psrset ee,ie");
 e22:	c1807420 	psrset      	ee, ie
//------------------------------------------------------------/
//Other IP config
//------------------------------------------------------------/
	//GPIO_CONFIG();                                                //GPIO initial    
    //UART0_CONFIG();                                               //UART0 initial 
	UART1_CONFIG();                                               //UART1 initial 
 e26:	e3ffff97 	bsr      	0xd54	// d54 <UART1_CONFIG>
	//UART2_CONFIG();                                               //UART2 initial 
	IFC_CONFIG();
 e2a:	e3ffffbb 	bsr      	0xda0	// da0 <IFC_CONFIG>
}
 e2e:	1490      	pop      	r15
 e30:	20000068 	.long	0x20000068
 e34:	0fffffff 	.long	0x0fffffff

Disassembly of section .text.UART0IntHandler:

00000e38 <UART0IntHandler>:
//UART0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0IntHandler(void) 
{
 e38:	1460      	nie
 e3a:	1462      	ipush
    // ISR content ...
	//Interupt
	if ((UART0->ISR&UART_RX_INT_S)==UART_RX_INT_S)
 e3c:	1065      	lrw      	r3, 0x20000050	// e50 <UART0IntHandler+0x18>
 e3e:	3102      	movi      	r1, 2
 e40:	9340      	ld.w      	r2, (r3, 0x0)
 e42:	9263      	ld.w      	r3, (r2, 0xc)
 e44:	68c4      	and      	r3, r1
 e46:	3b40      	cmpnei      	r3, 0
 e48:	0c02      	bf      	0xe4c	// e4c <UART0IntHandler+0x14>
	{
		
		UART0->ISR=UART_RX_INT_S;
 e4a:	b223      	st.w      	r1, (r2, 0xc)
	}
}
 e4c:	1463      	ipop
 e4e:	1461      	nir
 e50:	20000050 	.long	0x20000050

Disassembly of section .text.UART1IntHandler:

00000e54 <UART1IntHandler>:
//UART1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART1IntHandler(void) 
{
 e54:	1460      	nie
 e56:	1462      	ipush
 e58:	14d2      	push      	r4-r5, r15
    // ISR content ...
	//Interupt
	if ((UART1->ISR&UART_RX_INT_S)==UART_RX_INT_S)
 e5a:	10aa      	lrw      	r5, 0x2000004c	// e80 <UART1IntHandler+0x2c>
 e5c:	3402      	movi      	r4, 2
 e5e:	9560      	ld.w      	r3, (r5, 0x0)
 e60:	9363      	ld.w      	r3, (r3, 0xc)
 e62:	68d0      	and      	r3, r4
 e64:	3b40      	cmpnei      	r3, 0
 e66:	0c05      	bf      	0xe70	// e70 <UART1IntHandler+0x1c>
	{
		ProgUartPageRec();
 e68:	e3fffbca 	bsr      	0x5fc	// 5fc <ProgUartPageRec>
		UART1->ISR=UART_RX_INT_S;
 e6c:	9560      	ld.w      	r3, (r5, 0x0)
 e6e:	b383      	st.w      	r4, (r3, 0xc)
	}
	
}
 e70:	d9ee2002 	ld.w      	r15, (r14, 0x8)
 e74:	98a1      	ld.w      	r5, (r14, 0x4)
 e76:	9880      	ld.w      	r4, (r14, 0x0)
 e78:	1403      	addi      	r14, r14, 12
 e7a:	1463      	ipop
 e7c:	1461      	nir
 e7e:	0000      	bkpt
 e80:	2000004c 	.long	0x2000004c

Disassembly of section .text.PriviledgeVioHandler:

00000e84 <PriviledgeVioHandler>:
 e84:	783c      	jmp      	r15

Disassembly of section .text.PendTrapHandler:

00000e86 <PendTrapHandler>:
    // ISR content ...

}

void PendTrapHandler(void) 
{
 e86:	1460      	nie
 e88:	1462      	ipush
    // ISR content ...

}
 e8a:	1463      	ipop
 e8c:	1461      	nir

Disassembly of section .text.Trap3Handler:

00000e8e <Trap3Handler>:
 e8e:	1460      	nie
 e90:	1462      	ipush
 e92:	1463      	ipop
 e94:	1461      	nir

Disassembly of section .text.Trap2Handler:

00000e96 <Trap2Handler>:
 e96:	1460      	nie
 e98:	1462      	ipush
 e9a:	1463      	ipop
 e9c:	1461      	nir

Disassembly of section .text.Trap1Handler:

00000e9e <Trap1Handler>:
 e9e:	1460      	nie
 ea0:	1462      	ipush
 ea2:	1463      	ipop
 ea4:	1461      	nir

Disassembly of section .text.Trap0Handler:

00000ea6 <Trap0Handler>:
 ea6:	1460      	nie
 ea8:	1462      	ipush
 eaa:	1463      	ipop
 eac:	1461      	nir

Disassembly of section .text.UnrecExecpHandler:

00000eae <UnrecExecpHandler>:
 eae:	1460      	nie
 eb0:	1462      	ipush
 eb2:	1463      	ipop
 eb4:	1461      	nir

Disassembly of section .text.BreakPointHandler:

00000eb6 <BreakPointHandler>:
 eb6:	1460      	nie
 eb8:	1462      	ipush
 eba:	1463      	ipop
 ebc:	1461      	nir

Disassembly of section .text.AccessErrHandler:

00000ebe <AccessErrHandler>:
 ebe:	1460      	nie
 ec0:	1462      	ipush
 ec2:	1463      	ipop
 ec4:	1461      	nir

Disassembly of section .text.IllegalInstrHandler:

00000ec6 <IllegalInstrHandler>:
 ec6:	1460      	nie
 ec8:	1462      	ipush
 eca:	1463      	ipop
 ecc:	1461      	nir

Disassembly of section .text.MisalignedHandler:

00000ece <MisalignedHandler>:
 ece:	1460      	nie
 ed0:	1462      	ipush
 ed2:	1463      	ipop
 ed4:	1461      	nir

Disassembly of section .text.UART2IntHandler:

00000ed6 <UART2IntHandler>:
 ed6:	1460      	nie
 ed8:	1462      	ipush
 eda:	1463      	ipop
 edc:	1461      	nir

Disassembly of section .text.IFCIntHandler:

00000ede <IFCIntHandler>:
 ede:	1460      	nie
 ee0:	1462      	ipush
 ee2:	1463      	ipop
 ee4:	1461      	nir

Disassembly of section .text.startup.main:

00000ee8 <main>:
extern void APT32F102_init(void);	
/*************************************************************/
//main
/*************************************************************/
int main(void) 
{
 ee8:	14d1      	push      	r4, r15
	//delay_nms(10000);
	APT32F102_init();
 eea:	e3ffff8f 	bsr      	0xe08	// e08 <APT32F102_init>
	//PageErase(0X2000);
	//Page_ProgramData(0x2000,8,ifc_data_buf);
	sysState = 0;
 eee:	1098      	lrw      	r4, 0x200000bc	// f4c <main+0x64>
 ef0:	3300      	movi      	r3, 0
 ef2:	a460      	st.b      	r3, (r4, 0x0)
    while(1)
	{
		SYSCON_IWDCNT_Reload(); 
 ef4:	e3fffb0c 	bsr      	0x50c	// 50c <SYSCON_IWDCNT_Reload>
		switch(sysState){
 ef8:	8460      	ld.b      	r3, (r4, 0x0)
 efa:	74cc      	zextb      	r3, r3
 efc:	3262      	movi      	r2, 98
 efe:	648e      	cmpne      	r3, r2
 f00:	0c1d      	bf      	0xf3a	// f3a <main+0x52>
 f02:	64c8      	cmphs      	r2, r3
 f04:	0c06      	bf      	0xf10	// f10 <main+0x28>
 f06:	3b40      	cmpnei      	r3, 0
 f08:	0c0d      	bf      	0xf22	// f22 <main+0x3a>
				break;
			case 'w':
				wait_cmd();
				break;
			default:
				rst_mcu();
 f0a:	e3fffe31 	bsr      	0xb6c	// b6c <rst_mcu>
				break;
 f0e:	07f3      	br      	0xef4	// ef4 <main+0xc>
		switch(sysState){
 f10:	3270      	movi      	r2, 112
 f12:	648e      	cmpne      	r3, r2
 f14:	0c0b      	bf      	0xf2a	// f2a <main+0x42>
 f16:	3277      	movi      	r2, 119
 f18:	648e      	cmpne      	r3, r2
 f1a:	0bf8      	bt      	0xf0a	// f0a <main+0x22>
				wait_cmd();
 f1c:	e3fffe30 	bsr      	0xb7c	// b7c <wait_cmd>
				break;
 f20:	07ea      	br      	0xef4	// ef4 <main+0xc>
				sysState = check_boot_option();
 f22:	e3fffccf 	bsr      	0x8c0	// 8c0 <check_boot_option>
 f26:	a400      	st.b      	r0, (r4, 0x0)
				break;
 f28:	07e6      	br      	0xef4	// ef4 <main+0xc>
				ret = program_process();
 f2a:	e3fffd91 	bsr      	0xa4c	// a4c <program_process>
 f2e:	b401      	st.w      	r0, (r4, 0x4)
				if(ret ==0) sysState = 'b';
 f30:	9461      	ld.w      	r3, (r4, 0x4)
 f32:	3b40      	cmpnei      	r3, 0
 f34:	0809      	bt      	0xf46	// f46 <main+0x5e>
 f36:	3362      	movi      	r3, 98
 f38:	07dd      	br      	0xef2	// ef2 <main+0xa>
				ret = boot_process();	
 f3a:	e3fffd61 	bsr      	0x9fc	// 9fc <boot_process>
 f3e:	b401      	st.w      	r0, (r4, 0x4)
				if(ret ==1) sysState = 'w';
 f40:	9461      	ld.w      	r3, (r4, 0x4)
 f42:	3b41      	cmpnei      	r3, 1
 f44:	0be3      	bt      	0xf0a	// f0a <main+0x22>
 f46:	3377      	movi      	r3, 119
 f48:	07d5      	br      	0xef2	// ef2 <main+0xa>
 f4a:	0000      	bkpt
 f4c:	200000bc 	.long	0x200000bc
