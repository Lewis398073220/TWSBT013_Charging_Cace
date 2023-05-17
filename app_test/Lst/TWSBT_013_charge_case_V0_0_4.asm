
E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test//Obj/TWSBT_013_charge_case_V0_0_4.elf:     file format elf32-csky-little


Disassembly of section .text:

00002000 <vector_table>:
    2000:	00002108 	.long	0x00002108
    2004:	000067f6 	.long	0x000067f6
    2008:	000067e6 	.long	0x000067e6
    200c:	00002180 	.long	0x00002180
    2010:	000067ee 	.long	0x000067ee
    2014:	000067ac 	.long	0x000067ac
    2018:	00002180 	.long	0x00002180
    201c:	000067de 	.long	0x000067de
    2020:	000067d6 	.long	0x000067d6
    2024:	00002180 	.long	0x00002180
    2028:	00002180 	.long	0x00002180
    202c:	00002180 	.long	0x00002180
    2030:	00002180 	.long	0x00002180
    2034:	00002180 	.long	0x00002180
    2038:	00002180 	.long	0x00002180
    203c:	00002180 	.long	0x00002180
    2040:	000067ce 	.long	0x000067ce
    2044:	000067c6 	.long	0x000067c6
    2048:	000067be 	.long	0x000067be
    204c:	000067b6 	.long	0x000067b6
    2050:	00002180 	.long	0x00002180
    2054:	00002180 	.long	0x00002180
    2058:	00002180 	.long	0x00002180
    205c:	00002180 	.long	0x00002180
    2060:	00002180 	.long	0x00002180
    2064:	00002180 	.long	0x00002180
    2068:	00002180 	.long	0x00002180
    206c:	00002180 	.long	0x00002180
    2070:	00002180 	.long	0x00002180
    2074:	00002180 	.long	0x00002180
    2078:	00002180 	.long	0x00002180
    207c:	000067ae 	.long	0x000067ae
    2080:	000060ac 	.long	0x000060ac
    2084:	000060c4 	.long	0x000060c4
    2088:	000061a8 	.long	0x000061a8
    208c:	0000680e 	.long	0x0000680e
    2090:	00006c4c 	.long	0x00006c4c
    2094:	00002180 	.long	0x00002180
    2098:	000064a4 	.long	0x000064a4
    209c:	0000846c 	.long	0x0000846c
    20a0:	000070fc 	.long	0x000070fc
    20a4:	00006354 	.long	0x00006354
    20a8:	00002180 	.long	0x00002180
    20ac:	00002180 	.long	0x00002180
    20b0:	00006538 	.long	0x00006538
    20b4:	000065a8 	.long	0x000065a8
    20b8:	000065f4 	.long	0x000065f4
    20bc:	0000716c 	.long	0x0000716c
    20c0:	00002180 	.long	0x00002180
    20c4:	00006684 	.long	0x00006684
    20c8:	00002180 	.long	0x00002180
    20cc:	00006698 	.long	0x00006698
    20d0:	000066d4 	.long	0x000066d4
    20d4:	00008420 	.long	0x00008420
    20d8:	0000711c 	.long	0x0000711c
    20dc:	00006758 	.long	0x00006758
    20e0:	00006806 	.long	0x00006806
    20e4:	000067fe 	.long	0x000067fe
    20e8:	0000892c 	.long	0x0000892c
    20ec:	00002180 	.long	0x00002180
    20f0:	00006294 	.long	0x00006294
    20f4:	000064f0 	.long	0x000064f0
    20f8:	00002180 	.long	0x00002180
    20fc:	00002180 	.long	0x00002180
	...

00002108 <__start>:
//  .long __start
__start:

	
  //initialize all registers
  movi r0, 0
    2108:	3000      	movi      	r0, 0
  movi r1, 0
    210a:	3100      	movi      	r1, 0
  movi r2, 0
    210c:	3200      	movi      	r2, 0
  movi r3, 0
    210e:	3300      	movi      	r3, 0
  movi r4, 0
    2110:	3400      	movi      	r4, 0
  movi r5, 0
    2112:	3500      	movi      	r5, 0
  movi r6, 0
    2114:	3600      	movi      	r6, 0
  movi r7, 0
    2116:	3700      	movi      	r7, 0
  //movi r13, 0
  //movi r14, 0
  //movi r15, 0

//set VBR
  lrw r2, vector_table
    2118:	105b      	lrw      	r2, 0x2000	// 2184 <DummyHandler+0x4>
  mtcr r2, cr<1,0>
    211a:	c0026421 	mtcr      	r2, cr<1, 0>

//enable EE bit of psr
  mfcr r2, cr<0,0>
    211e:	c0006022 	mfcr      	r2, cr<0, 0>
  bseti r2, r2, 8
    2122:	3aa8      	bseti      	r2, 8
  mtcr r2, cr<0,0>
    2124:	c0026420 	mtcr      	r2, cr<0, 0>
//  st.w    r2, (r1,0x4)
//  movi    r2, 0x1
//  st.w    r2, (r1,0x0)

//disable power peak 
  lrw     r1, 0xe000ef90
    2128:	1038      	lrw      	r1, 0xe000ef90	// 2188 <DummyHandler+0x8>
  movi    r2, 0x0
    212a:	3200      	movi      	r2, 0
  st.w    r2, (r1, 0x0)
    212c:	b140      	st.w      	r2, (r1, 0x0)



//initialize kernel stack
  lrw  r7, __kernel_stack
    212e:	10f8      	lrw      	r7, 0x20000ff8	// 218c <DummyHandler+0xc>
  mov r14,r7
    2130:	6f9f      	mov      	r14, r7
  subi r6,r7,0x4
    2132:	5fcf      	subi      	r6, r7, 4

  //lrw  r3, 0x40
  lrw  r3, 0x04
    2134:	3304      	movi      	r3, 4
	
  subu r4, r7, r3
    2136:	5f8d      	subu      	r4, r7, r3
  lrw  r5, 0x0
    2138:	3500      	movi      	r5, 0

0000213a <INIT_KERLE_STACK>:
INIT_KERLE_STACK:
  addi r4, 0x4
    213a:	2403      	addi      	r4, 4
  st.w r5, (r4)
    213c:	b4a0      	st.w      	r5, (r4, 0x0)
  //cmphs r7, r4
  cmphs r6, r4
    213e:	6518      	cmphs      	r6, r4
  bt  INIT_KERLE_STACK
    2140:	0bfd      	bt      	0x213a	// 213a <INIT_KERLE_STACK>

00002142 <__to_main>:
        
__to_main:
  lrw r0,__main
    2142:	1014      	lrw      	r0, 0x4858	// 2190 <DummyHandler+0x10>
  jsr r0
    2144:	7bc1      	jsr      	r0
  mov r0, r0
    2146:	6c03      	mov      	r0, r0
  mov r0, r0
    2148:	6c03      	mov      	r0, r0


  
  lrw r15, __exit
    214a:	ea8f0013 	lrw      	r15, 0x215c	// 2194 <DummyHandler+0x14>
  lrw r0,main
    214e:	1013      	lrw      	r0, 0x6818	// 2198 <DummyHandler+0x18>
  jmp r0
    2150:	7800      	jmp      	r0
  mov r0, r0
    2152:	6c03      	mov      	r0, r0
  mov r0, r0
    2154:	6c03      	mov      	r0, r0
  mov r0, r0
    2156:	6c03      	mov      	r0, r0
  mov r0, r0
    2158:	6c03      	mov      	r0, r0
  mov r0, r0
    215a:	6c03      	mov      	r0, r0

0000215c <__exit>:

.export __exit
__exit:

  lrw r4, 0x20003000
    215c:	1090      	lrw      	r4, 0x20003000	// 219c <DummyHandler+0x1c>
  //lrw r5, 0x0
  mov r5, r0
    215e:	6d43      	mov      	r5, r0
  st.w r5, (r4)
    2160:	b4a0      	st.w      	r5, (r4, 0x0)

  mfcr r1, cr<0,0>
    2162:	c0006021 	mfcr      	r1, cr<0, 0>
  lrw  r1, 0xFFFF
    2166:	102f      	lrw      	r1, 0xffff	// 21a0 <DummyHandler+0x20>
  mtcr r1, cr<11,0>
    2168:	c001642b 	mtcr      	r1, cr<11, 0>
  lrw     r1, 0xFFF
    216c:	102e      	lrw      	r1, 0xfff	// 21a4 <DummyHandler+0x24>
  movi    r0, 0x0
    216e:	3000      	movi      	r0, 0
  st      r1, (r0)
    2170:	b020      	st.w      	r1, (r0, 0x0)

00002172 <__fail>:

.export __fail
__fail:
  lrw  r1, 0xEEEE
    2172:	102e      	lrw      	r1, 0xeeee	// 21a8 <DummyHandler+0x28>
  mtcr r1, cr<11,0>
    2174:	c001642b 	mtcr      	r1, cr<11, 0>
  lrw     r1, 0xEEE
    2178:	102d      	lrw      	r1, 0xeee	// 21ac <DummyHandler+0x2c>
  movi    r0, 0x0
    217a:	3000      	movi      	r0, 0
  st      r1, (r0)
    217c:	b020      	st.w      	r1, (r0, 0x0)

0000217e <__dummy>:

__dummy:
  br      __fail
    217e:	07fa      	br      	0x2172	// 2172 <__fail>

00002180 <DummyHandler>:

.export DummyHandler
DummyHandler:
  br      __fail
    2180:	07f9      	br      	0x2172	// 2172 <__fail>
    2182:	0000      	.short	0x0000
    2184:	00002000 	.long	0x00002000
    2188:	e000ef90 	.long	0xe000ef90
    218c:	20000ff8 	.long	0x20000ff8
    2190:	00004858 	.long	0x00004858
    2194:	0000215c 	.long	0x0000215c
    2198:	00006818 	.long	0x00006818
    219c:	20003000 	.long	0x20003000
    21a0:	0000ffff 	.long	0x0000ffff
    21a4:	00000fff 	.long	0x00000fff
    21a8:	0000eeee 	.long	0x0000eeee
    21ac:	00000eee 	.long	0x00000eee

000021b0 <___gnu_csky_case_uqi>:
    21b0:	1421      	subi      	r14, r14, 4
    21b2:	b820      	st.w      	r1, (r14, 0x0)
    21b4:	6c7f      	mov      	r1, r15
    21b6:	6040      	addu      	r1, r0
    21b8:	8120      	ld.b      	r1, (r1, 0x0)
    21ba:	4121      	lsli      	r1, r1, 1
    21bc:	63c4      	addu      	r15, r1
    21be:	9820      	ld.w      	r1, (r14, 0x0)
    21c0:	1401      	addi      	r14, r14, 4
    21c2:	783c      	jmp      	r15

000021c4 <___gnu_csky_case_uhi>:
    21c4:	1422      	subi      	r14, r14, 8
    21c6:	b801      	st.w      	r0, (r14, 0x4)
    21c8:	b820      	st.w      	r1, (r14, 0x0)
    21ca:	6c7f      	mov      	r1, r15
    21cc:	4001      	lsli      	r0, r0, 1
    21ce:	6040      	addu      	r1, r0
    21d0:	8920      	ld.h      	r1, (r1, 0x0)
    21d2:	4121      	lsli      	r1, r1, 1
    21d4:	63c4      	addu      	r15, r1
    21d6:	9801      	ld.w      	r0, (r14, 0x4)
    21d8:	9820      	ld.w      	r1, (r14, 0x0)
    21da:	1402      	addi      	r14, r14, 8
    21dc:	783c      	jmp      	r15
	...

000021e0 <__muldi3>:
    21e0:	14c4      	push      	r4-r7
    21e2:	1421      	subi      	r14, r14, 4
    21e4:	7501      	zexth      	r4, r0
    21e6:	48b0      	lsri      	r5, r0, 16
    21e8:	75c9      	zexth      	r7, r2
    21ea:	6d83      	mov      	r6, r0
    21ec:	b820      	st.w      	r1, (r14, 0x0)
    21ee:	6c13      	mov      	r0, r4
    21f0:	4a30      	lsri      	r1, r2, 16
    21f2:	7c1c      	mult      	r0, r7
    21f4:	7d04      	mult      	r4, r1
    21f6:	7dd4      	mult      	r7, r5
    21f8:	611c      	addu      	r4, r7
    21fa:	7d44      	mult      	r5, r1
    21fc:	4830      	lsri      	r1, r0, 16
    21fe:	6104      	addu      	r4, r1
    2200:	65d0      	cmphs      	r4, r7
    2202:	0804      	bt      	0x220a	// 220a <__muldi3+0x2a>
    2204:	3180      	movi      	r1, 128
    2206:	4129      	lsli      	r1, r1, 9
    2208:	6144      	addu      	r5, r1
    220a:	4c30      	lsri      	r1, r4, 16
    220c:	7cd8      	mult      	r3, r6
    220e:	6144      	addu      	r5, r1
    2210:	6c4f      	mov      	r1, r3
    2212:	9860      	ld.w      	r3, (r14, 0x0)
    2214:	7cc8      	mult      	r3, r2
    2216:	4490      	lsli      	r4, r4, 16
    2218:	604c      	addu      	r1, r3
    221a:	7401      	zexth      	r0, r0
    221c:	6010      	addu      	r0, r4
    221e:	6054      	addu      	r1, r5
    2220:	1401      	addi      	r14, r14, 4
    2222:	1484      	pop      	r4-r7

00002224 <__fixunsdfsi>:
    2224:	14d2      	push      	r4-r5, r15
    2226:	3200      	movi      	r2, 0
    2228:	106c      	lrw      	r3, 0x41e00000	// 2258 <__fixunsdfsi+0x34>
    222a:	6d43      	mov      	r5, r0
    222c:	6d07      	mov      	r4, r1
    222e:	e00008ad 	bsr      	0x3388	// 3388 <__gedf2>
    2232:	38df      	btsti      	r0, 31
    2234:	0c06      	bf      	0x2240	// 2240 <__fixunsdfsi+0x1c>
    2236:	6c17      	mov      	r0, r5
    2238:	6c53      	mov      	r1, r4
    223a:	e00008c5 	bsr      	0x33c4	// 33c4 <__fixdfsi>
    223e:	1492      	pop      	r4-r5, r15
    2240:	3200      	movi      	r2, 0
    2242:	1066      	lrw      	r3, 0x41e00000	// 2258 <__fixunsdfsi+0x34>
    2244:	6c17      	mov      	r0, r5
    2246:	6c53      	mov      	r1, r4
    2248:	e00006c0 	bsr      	0x2fc8	// 2fc8 <__subdf3>
    224c:	e00008bc 	bsr      	0x33c4	// 33c4 <__fixdfsi>
    2250:	3380      	movi      	r3, 128
    2252:	4378      	lsli      	r3, r3, 24
    2254:	600c      	addu      	r0, r3
    2256:	1492      	pop      	r4-r5, r15
    2258:	41e00000 	.long	0x41e00000

0000225c <__udivdi3>:
    225c:	14d4      	push      	r4-r7, r15
    225e:	1426      	subi      	r14, r14, 24
    2260:	6dc7      	mov      	r7, r1
    2262:	3b40      	cmpnei      	r3, 0
    2264:	6d03      	mov      	r4, r0
    2266:	6c4f      	mov      	r1, r3
    2268:	6d8b      	mov      	r6, r2
    226a:	b800      	st.w      	r0, (r14, 0x0)
    226c:	6d5f      	mov      	r5, r7
    226e:	085b      	bt      	0x2324	// 2324 <__udivdi3+0xc8>
    2270:	649c      	cmphs      	r7, r2
    2272:	0874      	bt      	0x235a	// 235a <__udivdi3+0xfe>
    2274:	003d      	lrw      	r1, 0xffff	// 25fc <__udivdi3+0x3a0>
    2276:	6484      	cmphs      	r1, r2
    2278:	0cdc      	bf      	0x2430	// 2430 <__udivdi3+0x1d4>
    227a:	31ff      	movi      	r1, 255
    227c:	6484      	cmphs      	r1, r2
    227e:	0802      	bt      	0x2282	// 2282 <__udivdi3+0x26>
    2280:	3308      	movi      	r3, 8
    2282:	6c4b      	mov      	r1, r2
    2284:	704d      	lsr      	r1, r3
    2286:	0100      	lrw      	r0, 0x8bbc	// 2600 <__udivdi3+0x3a4>
    2288:	6040      	addu      	r1, r0
    228a:	8120      	ld.b      	r1, (r1, 0x0)
    228c:	60c4      	addu      	r3, r1
    228e:	3120      	movi      	r1, 32
    2290:	604e      	subu      	r1, r3
    2292:	3940      	cmpnei      	r1, 0
    2294:	0c09      	bf      	0x22a6	// 22a6 <__udivdi3+0x4a>
    2296:	6d53      	mov      	r5, r4
    2298:	7084      	lsl      	r2, r1
    229a:	71c4      	lsl      	r7, r1
    229c:	714d      	lsr      	r5, r3
    229e:	7104      	lsl      	r4, r1
    22a0:	6d8b      	mov      	r6, r2
    22a2:	6d5c      	or      	r5, r7
    22a4:	b880      	st.w      	r4, (r14, 0x0)
    22a6:	4e90      	lsri      	r4, r6, 16
    22a8:	6c53      	mov      	r1, r4
    22aa:	6c17      	mov      	r0, r5
    22ac:	e0002450 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    22b0:	b801      	st.w      	r0, (r14, 0x4)
    22b2:	6c53      	mov      	r1, r4
    22b4:	6c17      	mov      	r0, r5
    22b6:	e0002427 	bsr      	0x6b04	// 6b04 <__udivsi3>
    22ba:	75d9      	zexth      	r7, r6
    22bc:	9861      	ld.w      	r3, (r14, 0x4)
    22be:	9820      	ld.w      	r1, (r14, 0x0)
    22c0:	6c9f      	mov      	r2, r7
    22c2:	4370      	lsli      	r3, r3, 16
    22c4:	4930      	lsri      	r1, r1, 16
    22c6:	7c80      	mult      	r2, r0
    22c8:	6cc4      	or      	r3, r1
    22ca:	648c      	cmphs      	r3, r2
    22cc:	6d43      	mov      	r5, r0
    22ce:	0808      	bt      	0x22de	// 22de <__udivdi3+0x82>
    22d0:	60d8      	addu      	r3, r6
    22d2:	658c      	cmphs      	r3, r6
    22d4:	5823      	subi      	r1, r0, 1
    22d6:	0c03      	bf      	0x22dc	// 22dc <__udivdi3+0x80>
    22d8:	648c      	cmphs      	r3, r2
    22da:	0d8e      	bf      	0x25f6	// 25f6 <__udivdi3+0x39a>
    22dc:	6d47      	mov      	r5, r1
    22de:	60ca      	subu      	r3, r2
    22e0:	6c53      	mov      	r1, r4
    22e2:	6c0f      	mov      	r0, r3
    22e4:	b862      	st.w      	r3, (r14, 0x8)
    22e6:	e0002433 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    22ea:	9862      	ld.w      	r3, (r14, 0x8)
    22ec:	b801      	st.w      	r0, (r14, 0x4)
    22ee:	6c53      	mov      	r1, r4
    22f0:	6c0f      	mov      	r0, r3
    22f2:	e0002409 	bsr      	0x6b04	// 6b04 <__udivsi3>
    22f6:	9841      	ld.w      	r2, (r14, 0x4)
    22f8:	d86e1000 	ld.h      	r3, (r14, 0x0)
    22fc:	4250      	lsli      	r2, r2, 16
    22fe:	74cd      	zexth      	r3, r3
    2300:	7dc0      	mult      	r7, r0
    2302:	6c8c      	or      	r2, r3
    2304:	65c8      	cmphs      	r2, r7
    2306:	6d03      	mov      	r4, r0
    2308:	0808      	bt      	0x2318	// 2318 <__udivdi3+0xbc>
    230a:	6098      	addu      	r2, r6
    230c:	6588      	cmphs      	r2, r6
    230e:	5863      	subi      	r3, r0, 1
    2310:	0d4d      	bf      	0x25aa	// 25aa <__udivdi3+0x34e>
    2312:	65c8      	cmphs      	r2, r7
    2314:	094b      	bt      	0x25aa	// 25aa <__udivdi3+0x34e>
    2316:	2c01      	subi      	r4, 2
    2318:	4510      	lsli      	r0, r5, 16
    231a:	3700      	movi      	r7, 0
    231c:	6c10      	or      	r0, r4
    231e:	6c5f      	mov      	r1, r7
    2320:	1406      	addi      	r14, r14, 24
    2322:	1494      	pop      	r4-r7, r15
    2324:	64dc      	cmphs      	r7, r3
    2326:	0c76      	bf      	0x2412	// 2412 <__udivdi3+0x1b6>
    2328:	026a      	lrw      	r3, 0xffff	// 25fc <__udivdi3+0x3a0>
    232a:	644c      	cmphs      	r3, r1
    232c:	0878      	bt      	0x241c	// 241c <__udivdi3+0x1c0>
    232e:	0269      	lrw      	r3, 0xffffff	// 2604 <__udivdi3+0x3a8>
    2330:	644c      	cmphs      	r3, r1
    2332:	0d48      	bf      	0x25c2	// 25c2 <__udivdi3+0x366>
    2334:	3610      	movi      	r6, 16
    2336:	6cc7      	mov      	r3, r1
    2338:	70d9      	lsr      	r3, r6
    233a:	020d      	lrw      	r0, 0x8bbc	// 2600 <__udivdi3+0x3a4>
    233c:	60c0      	addu      	r3, r0
    233e:	8360      	ld.b      	r3, (r3, 0x0)
    2340:	618c      	addu      	r6, r3
    2342:	3020      	movi      	r0, 32
    2344:	5879      	subu      	r3, r0, r6
    2346:	3b40      	cmpnei      	r3, 0
    2348:	b860      	st.w      	r3, (r14, 0x0)
    234a:	0878      	bt      	0x243a	// 243a <__udivdi3+0x1de>
    234c:	65c4      	cmphs      	r1, r7
    234e:	0d40      	bf      	0x25ce	// 25ce <__udivdi3+0x372>
    2350:	6490      	cmphs      	r4, r2
    2352:	6c0f      	mov      	r0, r3
    2354:	600d      	addc      	r0, r3
    2356:	3700      	movi      	r7, 0
    2358:	045f      	br      	0x2416	// 2416 <__udivdi3+0x1ba>
    235a:	3a40      	cmpnei      	r2, 0
    235c:	0808      	bt      	0x236c	// 236c <__udivdi3+0x110>
    235e:	3100      	movi      	r1, 0
    2360:	3001      	movi      	r0, 1
    2362:	b861      	st.w      	r3, (r14, 0x4)
    2364:	e00023d0 	bsr      	0x6b04	// 6b04 <__udivsi3>
    2368:	6d83      	mov      	r6, r0
    236a:	9861      	ld.w      	r3, (r14, 0x4)
    236c:	025b      	lrw      	r2, 0xffff	// 25fc <__udivdi3+0x3a0>
    236e:	6588      	cmphs      	r2, r6
    2370:	085b      	bt      	0x2426	// 2426 <__udivdi3+0x1ca>
    2372:	027a      	lrw      	r3, 0xffffff	// 2604 <__udivdi3+0x3a8>
    2374:	658c      	cmphs      	r3, r6
    2376:	0d28      	bf      	0x25c6	// 25c6 <__udivdi3+0x36a>
    2378:	3310      	movi      	r3, 16
    237a:	6c9b      	mov      	r2, r6
    237c:	023e      	lrw      	r1, 0x8bbc	// 2600 <__udivdi3+0x3a4>
    237e:	708d      	lsr      	r2, r3
    2380:	6084      	addu      	r2, r1
    2382:	8240      	ld.b      	r2, (r2, 0x0)
    2384:	5a2c      	addu      	r1, r2, r3
    2386:	3220      	movi      	r2, 32
    2388:	6086      	subu      	r2, r1
    238a:	3a40      	cmpnei      	r2, 0
    238c:	08c0      	bt      	0x250c	// 250c <__udivdi3+0x2b0>
    238e:	74d9      	zexth      	r3, r6
    2390:	5f99      	subu      	r4, r7, r6
    2392:	4eb0      	lsri      	r5, r6, 16
    2394:	b861      	st.w      	r3, (r14, 0x4)
    2396:	3701      	movi      	r7, 1
    2398:	6c57      	mov      	r1, r5
    239a:	6c13      	mov      	r0, r4
    239c:	e00023d8 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    23a0:	b802      	st.w      	r0, (r14, 0x8)
    23a2:	6c57      	mov      	r1, r5
    23a4:	6c13      	mov      	r0, r4
    23a6:	e00023af 	bsr      	0x6b04	// 6b04 <__udivsi3>
    23aa:	9862      	ld.w      	r3, (r14, 0x8)
    23ac:	4330      	lsli      	r1, r3, 16
    23ae:	9860      	ld.w      	r3, (r14, 0x0)
    23b0:	9841      	ld.w      	r2, (r14, 0x4)
    23b2:	4b70      	lsri      	r3, r3, 16
    23b4:	7c80      	mult      	r2, r0
    23b6:	6cc4      	or      	r3, r1
    23b8:	648c      	cmphs      	r3, r2
    23ba:	6d03      	mov      	r4, r0
    23bc:	0808      	bt      	0x23cc	// 23cc <__udivdi3+0x170>
    23be:	60d8      	addu      	r3, r6
    23c0:	658c      	cmphs      	r3, r6
    23c2:	5823      	subi      	r1, r0, 1
    23c4:	0c03      	bf      	0x23ca	// 23ca <__udivdi3+0x16e>
    23c6:	648c      	cmphs      	r3, r2
    23c8:	0d14      	bf      	0x25f0	// 25f0 <__udivdi3+0x394>
    23ca:	6d07      	mov      	r4, r1
    23cc:	60ca      	subu      	r3, r2
    23ce:	6c57      	mov      	r1, r5
    23d0:	6c0f      	mov      	r0, r3
    23d2:	b863      	st.w      	r3, (r14, 0xc)
    23d4:	e00023bc 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    23d8:	9863      	ld.w      	r3, (r14, 0xc)
    23da:	6c57      	mov      	r1, r5
    23dc:	b802      	st.w      	r0, (r14, 0x8)
    23de:	6c0f      	mov      	r0, r3
    23e0:	e0002392 	bsr      	0x6b04	// 6b04 <__udivsi3>
    23e4:	9842      	ld.w      	r2, (r14, 0x8)
    23e6:	d86e1000 	ld.h      	r3, (r14, 0x0)
    23ea:	9821      	ld.w      	r1, (r14, 0x4)
    23ec:	4250      	lsli      	r2, r2, 16
    23ee:	74cd      	zexth      	r3, r3
    23f0:	7c40      	mult      	r1, r0
    23f2:	6cc8      	or      	r3, r2
    23f4:	644c      	cmphs      	r3, r1
    23f6:	6d43      	mov      	r5, r0
    23f8:	0808      	bt      	0x2408	// 2408 <__udivdi3+0x1ac>
    23fa:	60d8      	addu      	r3, r6
    23fc:	658c      	cmphs      	r3, r6
    23fe:	5843      	subi      	r2, r0, 1
    2400:	0cd3      	bf      	0x25a6	// 25a6 <__udivdi3+0x34a>
    2402:	644c      	cmphs      	r3, r1
    2404:	08d1      	bt      	0x25a6	// 25a6 <__udivdi3+0x34a>
    2406:	2d01      	subi      	r5, 2
    2408:	4410      	lsli      	r0, r4, 16
    240a:	6c14      	or      	r0, r5
    240c:	6c5f      	mov      	r1, r7
    240e:	1406      	addi      	r14, r14, 24
    2410:	1494      	pop      	r4-r7, r15
    2412:	3700      	movi      	r7, 0
    2414:	3000      	movi      	r0, 0
    2416:	6c5f      	mov      	r1, r7
    2418:	1406      	addi      	r14, r14, 24
    241a:	1494      	pop      	r4-r7, r15
    241c:	33ff      	movi      	r3, 255
    241e:	644c      	cmphs      	r3, r1
    2420:	6583      	mvcv      	r6
    2422:	46c3      	lsli      	r6, r6, 3
    2424:	0789      	br      	0x2336	// 2336 <__udivdi3+0xda>
    2426:	32ff      	movi      	r2, 255
    2428:	6588      	cmphs      	r2, r6
    242a:	0ba8      	bt      	0x237a	// 237a <__udivdi3+0x11e>
    242c:	3308      	movi      	r3, 8
    242e:	07a6      	br      	0x237a	// 237a <__udivdi3+0x11e>
    2430:	1375      	lrw      	r3, 0xffffff	// 2604 <__udivdi3+0x3a8>
    2432:	648c      	cmphs      	r3, r2
    2434:	0ccb      	bf      	0x25ca	// 25ca <__udivdi3+0x36e>
    2436:	3310      	movi      	r3, 16
    2438:	0725      	br      	0x2282	// 2282 <__udivdi3+0x26>
    243a:	9800      	ld.w      	r0, (r14, 0x0)
    243c:	6ccb      	mov      	r3, r2
    243e:	6d4b      	mov      	r5, r2
    2440:	7040      	lsl      	r1, r0
    2442:	7140      	lsl      	r5, r0
    2444:	70d9      	lsr      	r3, r6
    2446:	6cc4      	or      	r3, r1
    2448:	b8a3      	st.w      	r5, (r14, 0xc)
    244a:	6d53      	mov      	r5, r4
    244c:	6c4f      	mov      	r1, r3
    244e:	7159      	lsr      	r5, r6
    2450:	6cdf      	mov      	r3, r7
    2452:	71c0      	lsl      	r7, r0
    2454:	6d5c      	or      	r5, r7
    2456:	70d9      	lsr      	r3, r6
    2458:	b8a1      	st.w      	r5, (r14, 0x4)
    245a:	49b0      	lsri      	r5, r1, 16
    245c:	b822      	st.w      	r1, (r14, 0x8)
    245e:	75c5      	zexth      	r7, r1
    2460:	6c0f      	mov      	r0, r3
    2462:	6c57      	mov      	r1, r5
    2464:	b864      	st.w      	r3, (r14, 0x10)
    2466:	e0002373 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    246a:	9864      	ld.w      	r3, (r14, 0x10)
    246c:	6d83      	mov      	r6, r0
    246e:	6c57      	mov      	r1, r5
    2470:	6c0f      	mov      	r0, r3
    2472:	e0002349 	bsr      	0x6b04	// 6b04 <__udivsi3>
    2476:	6c5f      	mov      	r1, r7
    2478:	7c40      	mult      	r1, r0
    247a:	6c87      	mov      	r2, r1
    247c:	4630      	lsli      	r1, r6, 16
    247e:	98c1      	ld.w      	r6, (r14, 0x4)
    2480:	4ed0      	lsri      	r6, r6, 16
    2482:	6d84      	or      	r6, r1
    2484:	6498      	cmphs      	r6, r2
    2486:	6cc3      	mov      	r3, r0
    2488:	0807      	bt      	0x2496	// 2496 <__udivdi3+0x23a>
    248a:	5823      	subi      	r1, r0, 1
    248c:	9802      	ld.w      	r0, (r14, 0x8)
    248e:	6180      	addu      	r6, r0
    2490:	6418      	cmphs      	r6, r0
    2492:	08a6      	bt      	0x25de	// 25de <__udivdi3+0x382>
    2494:	6cc7      	mov      	r3, r1
    2496:	618a      	subu      	r6, r2
    2498:	6c57      	mov      	r1, r5
    249a:	6c1b      	mov      	r0, r6
    249c:	b865      	st.w      	r3, (r14, 0x14)
    249e:	e0002357 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    24a2:	b804      	st.w      	r0, (r14, 0x10)
    24a4:	6c57      	mov      	r1, r5
    24a6:	6c1b      	mov      	r0, r6
    24a8:	e000232e 	bsr      	0x6b04	// 6b04 <__udivsi3>
    24ac:	9864      	ld.w      	r3, (r14, 0x10)
    24ae:	6c9f      	mov      	r2, r7
    24b0:	43f0      	lsli      	r7, r3, 16
    24b2:	d86e1002 	ld.h      	r3, (r14, 0x4)
    24b6:	744d      	zexth      	r1, r3
    24b8:	7c80      	mult      	r2, r0
    24ba:	6dc4      	or      	r7, r1
    24bc:	649c      	cmphs      	r7, r2
    24be:	9865      	ld.w      	r3, (r14, 0x14)
    24c0:	0807      	bt      	0x24ce	// 24ce <__udivdi3+0x272>
    24c2:	98a2      	ld.w      	r5, (r14, 0x8)
    24c4:	61d4      	addu      	r7, r5
    24c6:	655c      	cmphs      	r7, r5
    24c8:	5823      	subi      	r1, r0, 1
    24ca:	0885      	bt      	0x25d4	// 25d4 <__udivdi3+0x378>
    24cc:	6c07      	mov      	r0, r1
    24ce:	4370      	lsli      	r3, r3, 16
    24d0:	6c0c      	or      	r0, r3
    24d2:	74c1      	zexth      	r3, r0
    24d4:	61ca      	subu      	r7, r2
    24d6:	9843      	ld.w      	r2, (r14, 0xc)
    24d8:	7549      	zexth      	r5, r2
    24da:	4830      	lsri      	r1, r0, 16
    24dc:	4a50      	lsri      	r2, r2, 16
    24de:	6d8f      	mov      	r6, r3
    24e0:	7d94      	mult      	r6, r5
    24e2:	7cc8      	mult      	r3, r2
    24e4:	7d44      	mult      	r5, r1
    24e6:	60d4      	addu      	r3, r5
    24e8:	7c48      	mult      	r1, r2
    24ea:	4e50      	lsri      	r2, r6, 16
    24ec:	60c8      	addu      	r3, r2
    24ee:	654c      	cmphs      	r3, r5
    24f0:	0804      	bt      	0x24f8	// 24f8 <__udivdi3+0x29c>
    24f2:	3280      	movi      	r2, 128
    24f4:	4249      	lsli      	r2, r2, 9
    24f6:	6048      	addu      	r1, r2
    24f8:	4b50      	lsri      	r2, r3, 16
    24fa:	6048      	addu      	r1, r2
    24fc:	645c      	cmphs      	r7, r1
    24fe:	0c5f      	bf      	0x25bc	// 25bc <__udivdi3+0x360>
    2500:	645e      	cmpne      	r7, r1
    2502:	0c56      	bf      	0x25ae	// 25ae <__udivdi3+0x352>
    2504:	3700      	movi      	r7, 0
    2506:	6c5f      	mov      	r1, r7
    2508:	1406      	addi      	r14, r14, 24
    250a:	1494      	pop      	r4-r7, r15
    250c:	6d53      	mov      	r5, r4
    250e:	6cdf      	mov      	r3, r7
    2510:	7145      	lsr      	r5, r1
    2512:	71c8      	lsl      	r7, r2
    2514:	7188      	lsl      	r6, r2
    2516:	6d5c      	or      	r5, r7
    2518:	70c5      	lsr      	r3, r1
    251a:	6dd7      	mov      	r7, r5
    251c:	b8a3      	st.w      	r5, (r14, 0xc)
    251e:	4eb0      	lsri      	r5, r6, 16
    2520:	7108      	lsl      	r4, r2
    2522:	6c57      	mov      	r1, r5
    2524:	7499      	zexth      	r2, r6
    2526:	6c0f      	mov      	r0, r3
    2528:	b841      	st.w      	r2, (r14, 0x4)
    252a:	b880      	st.w      	r4, (r14, 0x0)
    252c:	b862      	st.w      	r3, (r14, 0x8)
    252e:	e000230f 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    2532:	9862      	ld.w      	r3, (r14, 0x8)
    2534:	6d03      	mov      	r4, r0
    2536:	6c57      	mov      	r1, r5
    2538:	6c0f      	mov      	r0, r3
    253a:	e00022e5 	bsr      	0x6b04	// 6b04 <__udivsi3>
    253e:	6cc3      	mov      	r3, r0
    2540:	7499      	zexth      	r2, r6
    2542:	7cc8      	mult      	r3, r2
    2544:	4450      	lsli      	r2, r4, 16
    2546:	4f90      	lsri      	r4, r7, 16
    2548:	6d08      	or      	r4, r2
    254a:	64d0      	cmphs      	r4, r3
    254c:	6c43      	mov      	r1, r0
    254e:	b802      	st.w      	r0, (r14, 0x8)
    2550:	080b      	bt      	0x2566	// 2566 <__udivdi3+0x30a>
    2552:	6118      	addu      	r4, r6
    2554:	6c87      	mov      	r2, r1
    2556:	6590      	cmphs      	r4, r6
    2558:	2a00      	subi      	r2, 1
    255a:	0c49      	bf      	0x25ec	// 25ec <__udivdi3+0x390>
    255c:	64d0      	cmphs      	r4, r3
    255e:	0847      	bt      	0x25ec	// 25ec <__udivdi3+0x390>
    2560:	2a00      	subi      	r2, 1
    2562:	b842      	st.w      	r2, (r14, 0x8)
    2564:	6118      	addu      	r4, r6
    2566:	610e      	subu      	r4, r3
    2568:	6c57      	mov      	r1, r5
    256a:	6c13      	mov      	r0, r4
    256c:	e00022f0 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    2570:	6dc3      	mov      	r7, r0
    2572:	6c57      	mov      	r1, r5
    2574:	6c13      	mov      	r0, r4
    2576:	e00022c7 	bsr      	0x6b04	// 6b04 <__udivsi3>
    257a:	d84e1006 	ld.h      	r2, (r14, 0xc)
    257e:	74d9      	zexth      	r3, r6
    2580:	47f0      	lsli      	r7, r7, 16
    2582:	7509      	zexth      	r4, r2
    2584:	7cc0      	mult      	r3, r0
    2586:	6dd0      	or      	r7, r4
    2588:	64dc      	cmphs      	r7, r3
    258a:	0809      	bt      	0x259c	// 259c <__udivdi3+0x340>
    258c:	61d8      	addu      	r7, r6
    258e:	659c      	cmphs      	r7, r6
    2590:	5843      	subi      	r2, r0, 1
    2592:	0c2b      	bf      	0x25e8	// 25e8 <__udivdi3+0x38c>
    2594:	64dc      	cmphs      	r7, r3
    2596:	0829      	bt      	0x25e8	// 25e8 <__udivdi3+0x38c>
    2598:	2801      	subi      	r0, 2
    259a:	61d8      	addu      	r7, r6
    259c:	5f8d      	subu      	r4, r7, r3
    259e:	9862      	ld.w      	r3, (r14, 0x8)
    25a0:	43f0      	lsli      	r7, r3, 16
    25a2:	6dc0      	or      	r7, r0
    25a4:	06fa      	br      	0x2398	// 2398 <__udivdi3+0x13c>
    25a6:	6d4b      	mov      	r5, r2
    25a8:	0730      	br      	0x2408	// 2408 <__udivdi3+0x1ac>
    25aa:	6d0f      	mov      	r4, r3
    25ac:	06b6      	br      	0x2318	// 2318 <__udivdi3+0xbc>
    25ae:	9840      	ld.w      	r2, (r14, 0x0)
    25b0:	4370      	lsli      	r3, r3, 16
    25b2:	7599      	zexth      	r6, r6
    25b4:	7108      	lsl      	r4, r2
    25b6:	60d8      	addu      	r3, r6
    25b8:	64d0      	cmphs      	r4, r3
    25ba:	0ba5      	bt      	0x2504	// 2504 <__udivdi3+0x2a8>
    25bc:	2800      	subi      	r0, 1
    25be:	3700      	movi      	r7, 0
    25c0:	07a3      	br      	0x2506	// 2506 <__udivdi3+0x2aa>
    25c2:	3618      	movi      	r6, 24
    25c4:	06b9      	br      	0x2336	// 2336 <__udivdi3+0xda>
    25c6:	3318      	movi      	r3, 24
    25c8:	06d9      	br      	0x237a	// 237a <__udivdi3+0x11e>
    25ca:	3318      	movi      	r3, 24
    25cc:	065b      	br      	0x2282	// 2282 <__udivdi3+0x26>
    25ce:	3700      	movi      	r7, 0
    25d0:	3001      	movi      	r0, 1
    25d2:	0722      	br      	0x2416	// 2416 <__udivdi3+0x1ba>
    25d4:	649c      	cmphs      	r7, r2
    25d6:	0b7b      	bt      	0x24cc	// 24cc <__udivdi3+0x270>
    25d8:	2801      	subi      	r0, 2
    25da:	61d4      	addu      	r7, r5
    25dc:	0779      	br      	0x24ce	// 24ce <__udivdi3+0x272>
    25de:	6498      	cmphs      	r6, r2
    25e0:	0b5a      	bt      	0x2494	// 2494 <__udivdi3+0x238>
    25e2:	2b01      	subi      	r3, 2
    25e4:	6180      	addu      	r6, r0
    25e6:	0758      	br      	0x2496	// 2496 <__udivdi3+0x23a>
    25e8:	6c0b      	mov      	r0, r2
    25ea:	07d9      	br      	0x259c	// 259c <__udivdi3+0x340>
    25ec:	b842      	st.w      	r2, (r14, 0x8)
    25ee:	07bc      	br      	0x2566	// 2566 <__udivdi3+0x30a>
    25f0:	2c01      	subi      	r4, 2
    25f2:	60d8      	addu      	r3, r6
    25f4:	06ec      	br      	0x23cc	// 23cc <__udivdi3+0x170>
    25f6:	2d01      	subi      	r5, 2
    25f8:	60d8      	addu      	r3, r6
    25fa:	0672      	br      	0x22de	// 22de <__udivdi3+0x82>
    25fc:	0000ffff 	.long	0x0000ffff
    2600:	00008bbc 	.long	0x00008bbc
    2604:	00ffffff 	.long	0x00ffffff

00002608 <__umoddi3>:
    2608:	14d4      	push      	r4-r7, r15
    260a:	1427      	subi      	r14, r14, 28
    260c:	6d07      	mov      	r4, r1
    260e:	6c4f      	mov      	r1, r3
    2610:	6d43      	mov      	r5, r0
    2612:	3940      	cmpnei      	r1, 0
    2614:	6dcf      	mov      	r7, r3
    2616:	6c0b      	mov      	r0, r2
    2618:	b8a0      	st.w      	r5, (r14, 0x0)
    261a:	6cd3      	mov      	r3, r4
    261c:	085a      	bt      	0x26d0	// 26d0 <__umoddi3+0xc8>
    261e:	6490      	cmphs      	r4, r2
    2620:	0877      	bt      	0x270e	// 270e <__umoddi3+0x106>
    2622:	0120      	lrw      	r1, 0xffff	// 299c <__umoddi3+0x394>
    2624:	6484      	cmphs      	r1, r2
    2626:	0cd2      	bf      	0x27ca	// 27ca <__umoddi3+0x1c2>
    2628:	31ff      	movi      	r1, 255
    262a:	6484      	cmphs      	r1, r2
    262c:	0802      	bt      	0x2630	// 2630 <__umoddi3+0x28>
    262e:	3708      	movi      	r7, 8
    2630:	6c43      	mov      	r1, r0
    2632:	705d      	lsr      	r1, r7
    2634:	01c4      	lrw      	r6, 0x8bbc	// 29a0 <__umoddi3+0x398>
    2636:	6058      	addu      	r1, r6
    2638:	8120      	ld.b      	r1, (r1, 0x0)
    263a:	61c4      	addu      	r7, r1
    263c:	3120      	movi      	r1, 32
    263e:	605e      	subu      	r1, r7
    2640:	3940      	cmpnei      	r1, 0
    2642:	b821      	st.w      	r1, (r14, 0x4)
    2644:	0c09      	bf      	0x2656	// 2656 <__umoddi3+0x4e>
    2646:	6cd7      	mov      	r3, r5
    2648:	6c83      	mov      	r2, r0
    264a:	7104      	lsl      	r4, r1
    264c:	70dd      	lsr      	r3, r7
    264e:	7144      	lsl      	r5, r1
    2650:	7084      	lsl      	r2, r1
    2652:	6cd0      	or      	r3, r4
    2654:	b8a0      	st.w      	r5, (r14, 0x0)
    2656:	4a90      	lsri      	r4, r2, 16
    2658:	6c53      	mov      	r1, r4
    265a:	6c0f      	mov      	r0, r3
    265c:	75c9      	zexth      	r7, r2
    265e:	b843      	st.w      	r2, (r14, 0xc)
    2660:	b862      	st.w      	r3, (r14, 0x8)
    2662:	e0002275 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    2666:	9862      	ld.w      	r3, (r14, 0x8)
    2668:	6d43      	mov      	r5, r0
    266a:	6c53      	mov      	r1, r4
    266c:	6c0f      	mov      	r0, r3
    266e:	e000224b 	bsr      	0x6b04	// 6b04 <__udivsi3>
    2672:	9840      	ld.w      	r2, (r14, 0x0)
    2674:	4570      	lsli      	r3, r5, 16
    2676:	4ab0      	lsri      	r5, r2, 16
    2678:	7c1c      	mult      	r0, r7
    267a:	6cd4      	or      	r3, r5
    267c:	640c      	cmphs      	r3, r0
    267e:	9843      	ld.w      	r2, (r14, 0xc)
    2680:	0806      	bt      	0x268c	// 268c <__umoddi3+0x84>
    2682:	60c8      	addu      	r3, r2
    2684:	648c      	cmphs      	r3, r2
    2686:	0c03      	bf      	0x268c	// 268c <__umoddi3+0x84>
    2688:	640c      	cmphs      	r3, r0
    268a:	0d7d      	bf      	0x2984	// 2984 <__umoddi3+0x37c>
    268c:	60c2      	subu      	r3, r0
    268e:	6c53      	mov      	r1, r4
    2690:	6c0f      	mov      	r0, r3
    2692:	b843      	st.w      	r2, (r14, 0xc)
    2694:	b862      	st.w      	r3, (r14, 0x8)
    2696:	e000225b 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    269a:	9862      	ld.w      	r3, (r14, 0x8)
    269c:	6d43      	mov      	r5, r0
    269e:	6c53      	mov      	r1, r4
    26a0:	6c0f      	mov      	r0, r3
    26a2:	e0002231 	bsr      	0x6b04	// 6b04 <__udivsi3>
    26a6:	d86e1000 	ld.h      	r3, (r14, 0x0)
    26aa:	7dc0      	mult      	r7, r0
    26ac:	45b0      	lsli      	r5, r5, 16
    26ae:	740d      	zexth      	r0, r3
    26b0:	6d40      	or      	r5, r0
    26b2:	65d4      	cmphs      	r5, r7
    26b4:	0807      	bt      	0x26c2	// 26c2 <__umoddi3+0xba>
    26b6:	9843      	ld.w      	r2, (r14, 0xc)
    26b8:	6148      	addu      	r5, r2
    26ba:	6494      	cmphs      	r5, r2
    26bc:	0c03      	bf      	0x26c2	// 26c2 <__umoddi3+0xba>
    26be:	65d4      	cmphs      	r5, r7
    26c0:	0d5e      	bf      	0x297c	// 297c <__umoddi3+0x374>
    26c2:	615e      	subu      	r5, r7
    26c4:	6c17      	mov      	r0, r5
    26c6:	9861      	ld.w      	r3, (r14, 0x4)
    26c8:	700d      	lsr      	r0, r3
    26ca:	3100      	movi      	r1, 0
    26cc:	1407      	addi      	r14, r14, 28
    26ce:	1494      	pop      	r4-r7, r15
    26d0:	6450      	cmphs      	r4, r1
    26d2:	0c6e      	bf      	0x27ae	// 27ae <__umoddi3+0x1a6>
    26d4:	024d      	lrw      	r2, 0xffff	// 299c <__umoddi3+0x394>
    26d6:	6448      	cmphs      	r2, r1
    26d8:	086f      	bt      	0x27b6	// 27b6 <__umoddi3+0x1ae>
    26da:	024c      	lrw      	r2, 0xffffff	// 29a4 <__umoddi3+0x39c>
    26dc:	6448      	cmphs      	r2, r1
    26de:	0d3f      	bf      	0x295c	// 295c <__umoddi3+0x354>
    26e0:	3610      	movi      	r6, 16
    26e2:	6c87      	mov      	r2, r1
    26e4:	7099      	lsr      	r2, r6
    26e6:	02f0      	lrw      	r7, 0x8bbc	// 29a0 <__umoddi3+0x398>
    26e8:	609c      	addu      	r2, r7
    26ea:	8240      	ld.b      	r2, (r2, 0x0)
    26ec:	6188      	addu      	r6, r2
    26ee:	3720      	movi      	r7, 32
    26f0:	61da      	subu      	r7, r6
    26f2:	3f40      	cmpnei      	r7, 0
    26f4:	0870      	bt      	0x27d4	// 27d4 <__umoddi3+0x1cc>
    26f6:	6504      	cmphs      	r1, r4
    26f8:	0c03      	bf      	0x26fe	// 26fe <__umoddi3+0xf6>
    26fa:	6414      	cmphs      	r5, r0
    26fc:	0d46      	bf      	0x2988	// 2988 <__umoddi3+0x380>
    26fe:	5d01      	subu      	r0, r5, r0
    2700:	6414      	cmphs      	r5, r0
    2702:	6106      	subu      	r4, r1
    2704:	6483      	mvcv      	r2
    2706:	5c69      	subu      	r3, r4, r2
    2708:	6c4f      	mov      	r1, r3
    270a:	1407      	addi      	r14, r14, 28
    270c:	1494      	pop      	r4-r7, r15
    270e:	3a40      	cmpnei      	r2, 0
    2710:	0806      	bt      	0x271c	// 271c <__umoddi3+0x114>
    2712:	3100      	movi      	r1, 0
    2714:	3001      	movi      	r0, 1
    2716:	e00021f7 	bsr      	0x6b04	// 6b04 <__udivsi3>
    271a:	6c83      	mov      	r2, r0
    271c:	027f      	lrw      	r3, 0xffff	// 299c <__umoddi3+0x394>
    271e:	648c      	cmphs      	r3, r2
    2720:	0850      	bt      	0x27c0	// 27c0 <__umoddi3+0x1b8>
    2722:	027e      	lrw      	r3, 0xffffff	// 29a4 <__umoddi3+0x39c>
    2724:	648c      	cmphs      	r3, r2
    2726:	0d1d      	bf      	0x2960	// 2960 <__umoddi3+0x358>
    2728:	3710      	movi      	r7, 16
    272a:	6ccb      	mov      	r3, r2
    272c:	70dd      	lsr      	r3, r7
    272e:	0322      	lrw      	r1, 0x8bbc	// 29a0 <__umoddi3+0x398>
    2730:	60c4      	addu      	r3, r1
    2732:	8360      	ld.b      	r3, (r3, 0x0)
    2734:	61cc      	addu      	r7, r3
    2736:	3320      	movi      	r3, 32
    2738:	60de      	subu      	r3, r7
    273a:	3b40      	cmpnei      	r3, 0
    273c:	b861      	st.w      	r3, (r14, 0x4)
    273e:	08c2      	bt      	0x28c2	// 28c2 <__umoddi3+0x2ba>
    2740:	74c9      	zexth      	r3, r2
    2742:	610a      	subu      	r4, r2
    2744:	4af0      	lsri      	r7, r2, 16
    2746:	6d8f      	mov      	r6, r3
    2748:	6c5f      	mov      	r1, r7
    274a:	6c13      	mov      	r0, r4
    274c:	b842      	st.w      	r2, (r14, 0x8)
    274e:	e00021ff 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    2752:	6d43      	mov      	r5, r0
    2754:	6c5f      	mov      	r1, r7
    2756:	6c13      	mov      	r0, r4
    2758:	e00021d6 	bsr      	0x6b04	// 6b04 <__udivsi3>
    275c:	9860      	ld.w      	r3, (r14, 0x0)
    275e:	4590      	lsli      	r4, r5, 16
    2760:	4bb0      	lsri      	r5, r3, 16
    2762:	7c18      	mult      	r0, r6
    2764:	6d14      	or      	r4, r5
    2766:	6410      	cmphs      	r4, r0
    2768:	9842      	ld.w      	r2, (r14, 0x8)
    276a:	0806      	bt      	0x2776	// 2776 <__umoddi3+0x16e>
    276c:	6108      	addu      	r4, r2
    276e:	6490      	cmphs      	r4, r2
    2770:	0c03      	bf      	0x2776	// 2776 <__umoddi3+0x16e>
    2772:	6410      	cmphs      	r4, r0
    2774:	0d06      	bf      	0x2980	// 2980 <__umoddi3+0x378>
    2776:	6102      	subu      	r4, r0
    2778:	6c5f      	mov      	r1, r7
    277a:	6c13      	mov      	r0, r4
    277c:	b842      	st.w      	r2, (r14, 0x8)
    277e:	e00021e7 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    2782:	6d43      	mov      	r5, r0
    2784:	6c5f      	mov      	r1, r7
    2786:	6c13      	mov      	r0, r4
    2788:	e00021be 	bsr      	0x6b04	// 6b04 <__udivsi3>
    278c:	d86e1000 	ld.h      	r3, (r14, 0x0)
    2790:	7c18      	mult      	r0, r6
    2792:	45b0      	lsli      	r5, r5, 16
    2794:	758d      	zexth      	r6, r3
    2796:	6d58      	or      	r5, r6
    2798:	6414      	cmphs      	r5, r0
    279a:	0808      	bt      	0x27aa	// 27aa <__umoddi3+0x1a2>
    279c:	9842      	ld.w      	r2, (r14, 0x8)
    279e:	6148      	addu      	r5, r2
    27a0:	6494      	cmphs      	r5, r2
    27a2:	0c04      	bf      	0x27aa	// 27aa <__umoddi3+0x1a2>
    27a4:	6414      	cmphs      	r5, r0
    27a6:	0802      	bt      	0x27aa	// 27aa <__umoddi3+0x1a2>
    27a8:	6148      	addu      	r5, r2
    27aa:	6142      	subu      	r5, r0
    27ac:	078c      	br      	0x26c4	// 26c4 <__umoddi3+0xbc>
    27ae:	6c17      	mov      	r0, r5
    27b0:	6c53      	mov      	r1, r4
    27b2:	1407      	addi      	r14, r14, 28
    27b4:	1494      	pop      	r4-r7, r15
    27b6:	32ff      	movi      	r2, 255
    27b8:	6448      	cmphs      	r2, r1
    27ba:	6583      	mvcv      	r6
    27bc:	46c3      	lsli      	r6, r6, 3
    27be:	0792      	br      	0x26e2	// 26e2 <__umoddi3+0xda>
    27c0:	33ff      	movi      	r3, 255
    27c2:	648c      	cmphs      	r3, r2
    27c4:	0bb3      	bt      	0x272a	// 272a <__umoddi3+0x122>
    27c6:	3708      	movi      	r7, 8
    27c8:	07b1      	br      	0x272a	// 272a <__umoddi3+0x122>
    27ca:	1337      	lrw      	r1, 0xffffff	// 29a4 <__umoddi3+0x39c>
    27cc:	6484      	cmphs      	r1, r2
    27ce:	0ccb      	bf      	0x2964	// 2964 <__umoddi3+0x35c>
    27d0:	3710      	movi      	r7, 16
    27d2:	072f      	br      	0x2630	// 2630 <__umoddi3+0x28>
    27d4:	6cc3      	mov      	r3, r0
    27d6:	705c      	lsl      	r1, r7
    27d8:	70d9      	lsr      	r3, r6
    27da:	6cc4      	or      	r3, r1
    27dc:	6c57      	mov      	r1, r5
    27de:	6c93      	mov      	r2, r4
    27e0:	7059      	lsr      	r1, r6
    27e2:	711c      	lsl      	r4, r7
    27e4:	7099      	lsr      	r2, r6
    27e6:	6c50      	or      	r1, r4
    27e8:	701c      	lsl      	r0, r7
    27ea:	4b90      	lsri      	r4, r3, 16
    27ec:	715c      	lsl      	r5, r7
    27ee:	b803      	st.w      	r0, (r14, 0xc)
    27f0:	b820      	st.w      	r1, (r14, 0x0)
    27f2:	b8a4      	st.w      	r5, (r14, 0x10)
    27f4:	6c53      	mov      	r1, r4
    27f6:	754d      	zexth      	r5, r3
    27f8:	6c0b      	mov      	r0, r2
    27fa:	b862      	st.w      	r3, (r14, 0x8)
    27fc:	b8a1      	st.w      	r5, (r14, 0x4)
    27fe:	b846      	st.w      	r2, (r14, 0x18)
    2800:	e00021a6 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    2804:	9846      	ld.w      	r2, (r14, 0x18)
    2806:	b805      	st.w      	r0, (r14, 0x14)
    2808:	6c53      	mov      	r1, r4
    280a:	6c0b      	mov      	r0, r2
    280c:	e000217c 	bsr      	0x6b04	// 6b04 <__udivsi3>
    2810:	9841      	ld.w      	r2, (r14, 0x4)
    2812:	7c80      	mult      	r2, r0
    2814:	9865      	ld.w      	r3, (r14, 0x14)
    2816:	6d43      	mov      	r5, r0
    2818:	9800      	ld.w      	r0, (r14, 0x0)
    281a:	4330      	lsli      	r1, r3, 16
    281c:	4870      	lsri      	r3, r0, 16
    281e:	6cc4      	or      	r3, r1
    2820:	648c      	cmphs      	r3, r2
    2822:	0807      	bt      	0x2830	// 2830 <__umoddi3+0x228>
    2824:	9802      	ld.w      	r0, (r14, 0x8)
    2826:	60c0      	addu      	r3, r0
    2828:	640c      	cmphs      	r3, r0
    282a:	5d23      	subi      	r1, r5, 1
    282c:	08a3      	bt      	0x2972	// 2972 <__umoddi3+0x36a>
    282e:	6d47      	mov      	r5, r1
    2830:	60ca      	subu      	r3, r2
    2832:	6c53      	mov      	r1, r4
    2834:	6c0f      	mov      	r0, r3
    2836:	b866      	st.w      	r3, (r14, 0x18)
    2838:	e000218a 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    283c:	9866      	ld.w      	r3, (r14, 0x18)
    283e:	6c53      	mov      	r1, r4
    2840:	b805      	st.w      	r0, (r14, 0x14)
    2842:	6c0f      	mov      	r0, r3
    2844:	e0002160 	bsr      	0x6b04	// 6b04 <__udivsi3>
    2848:	9845      	ld.w      	r2, (r14, 0x14)
    284a:	d86e1000 	ld.h      	r3, (r14, 0x0)
    284e:	9821      	ld.w      	r1, (r14, 0x4)
    2850:	4250      	lsli      	r2, r2, 16
    2852:	750d      	zexth      	r4, r3
    2854:	7c40      	mult      	r1, r0
    2856:	6c90      	or      	r2, r4
    2858:	6448      	cmphs      	r2, r1
    285a:	0807      	bt      	0x2868	// 2868 <__umoddi3+0x260>
    285c:	9882      	ld.w      	r4, (r14, 0x8)
    285e:	6090      	addu      	r2, r4
    2860:	6508      	cmphs      	r2, r4
    2862:	5863      	subi      	r3, r0, 1
    2864:	0882      	bt      	0x2968	// 2968 <__umoddi3+0x360>
    2866:	6c0f      	mov      	r0, r3
    2868:	45b0      	lsli      	r5, r5, 16
    286a:	6d40      	or      	r5, r0
    286c:	74d5      	zexth      	r3, r5
    286e:	9803      	ld.w      	r0, (r14, 0xc)
    2870:	4db0      	lsri      	r5, r5, 16
    2872:	6d0f      	mov      	r4, r3
    2874:	6086      	subu      	r2, r1
    2876:	7441      	zexth      	r1, r0
    2878:	4810      	lsri      	r0, r0, 16
    287a:	7d04      	mult      	r4, r1
    287c:	7cc0      	mult      	r3, r0
    287e:	7c54      	mult      	r1, r5
    2880:	60c4      	addu      	r3, r1
    2882:	7d40      	mult      	r5, r0
    2884:	4c10      	lsri      	r0, r4, 16
    2886:	60c0      	addu      	r3, r0
    2888:	644c      	cmphs      	r3, r1
    288a:	0804      	bt      	0x2892	// 2892 <__umoddi3+0x28a>
    288c:	3180      	movi      	r1, 128
    288e:	4129      	lsli      	r1, r1, 9
    2890:	6144      	addu      	r5, r1
    2892:	4b30      	lsri      	r1, r3, 16
    2894:	6144      	addu      	r5, r1
    2896:	4370      	lsli      	r3, r3, 16
    2898:	7511      	zexth      	r4, r4
    289a:	6548      	cmphs      	r2, r5
    289c:	60d0      	addu      	r3, r4
    289e:	0c56      	bf      	0x294a	// 294a <__umoddi3+0x342>
    28a0:	654a      	cmpne      	r2, r5
    28a2:	0c76      	bf      	0x298e	// 298e <__umoddi3+0x386>
    28a4:	5a35      	subu      	r1, r2, r5
    28a6:	6c0f      	mov      	r0, r3
    28a8:	9864      	ld.w      	r3, (r14, 0x10)
    28aa:	5b01      	subu      	r0, r3, r0
    28ac:	640c      	cmphs      	r3, r0
    28ae:	64c3      	mvcv      	r3
    28b0:	598d      	subu      	r4, r1, r3
    28b2:	6d53      	mov      	r5, r4
    28b4:	7158      	lsl      	r5, r6
    28b6:	701d      	lsr      	r0, r7
    28b8:	6c53      	mov      	r1, r4
    28ba:	6c14      	or      	r0, r5
    28bc:	705d      	lsr      	r1, r7
    28be:	1407      	addi      	r14, r14, 28
    28c0:	1494      	pop      	r4-r7, r15
    28c2:	9801      	ld.w      	r0, (r14, 0x4)
    28c4:	6c57      	mov      	r1, r5
    28c6:	6cd3      	mov      	r3, r4
    28c8:	705d      	lsr      	r1, r7
    28ca:	7100      	lsl      	r4, r0
    28cc:	7080      	lsl      	r2, r0
    28ce:	6c50      	or      	r1, r4
    28d0:	70dd      	lsr      	r3, r7
    28d2:	6d07      	mov      	r4, r1
    28d4:	4af0      	lsri      	r7, r2, 16
    28d6:	b822      	st.w      	r1, (r14, 0x8)
    28d8:	7449      	zexth      	r1, r2
    28da:	7140      	lsl      	r5, r0
    28dc:	6d87      	mov      	r6, r1
    28de:	6c0f      	mov      	r0, r3
    28e0:	6c5f      	mov      	r1, r7
    28e2:	b844      	st.w      	r2, (r14, 0x10)
    28e4:	b8a0      	st.w      	r5, (r14, 0x0)
    28e6:	b863      	st.w      	r3, (r14, 0xc)
    28e8:	e0002132 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    28ec:	9863      	ld.w      	r3, (r14, 0xc)
    28ee:	6d43      	mov      	r5, r0
    28f0:	6c5f      	mov      	r1, r7
    28f2:	6c0f      	mov      	r0, r3
    28f4:	e0002108 	bsr      	0x6b04	// 6b04 <__udivsi3>
    28f8:	45b0      	lsli      	r5, r5, 16
    28fa:	4c70      	lsri      	r3, r4, 16
    28fc:	7c18      	mult      	r0, r6
    28fe:	6d4c      	or      	r5, r3
    2900:	6414      	cmphs      	r5, r0
    2902:	9844      	ld.w      	r2, (r14, 0x10)
    2904:	0807      	bt      	0x2912	// 2912 <__umoddi3+0x30a>
    2906:	6148      	addu      	r5, r2
    2908:	6494      	cmphs      	r5, r2
    290a:	0c04      	bf      	0x2912	// 2912 <__umoddi3+0x30a>
    290c:	6414      	cmphs      	r5, r0
    290e:	0802      	bt      	0x2912	// 2912 <__umoddi3+0x30a>
    2910:	6148      	addu      	r5, r2
    2912:	6142      	subu      	r5, r0
    2914:	6c5f      	mov      	r1, r7
    2916:	6c17      	mov      	r0, r5
    2918:	b843      	st.w      	r2, (r14, 0xc)
    291a:	e0002119 	bsr      	0x6b4c	// 6b4c <__umodsi3>
    291e:	6d03      	mov      	r4, r0
    2920:	6c5f      	mov      	r1, r7
    2922:	6c17      	mov      	r0, r5
    2924:	e00020f0 	bsr      	0x6b04	// 6b04 <__udivsi3>
    2928:	d86e1004 	ld.h      	r3, (r14, 0x8)
    292c:	4490      	lsli      	r4, r4, 16
    292e:	744d      	zexth      	r1, r3
    2930:	7c18      	mult      	r0, r6
    2932:	6d04      	or      	r4, r1
    2934:	6410      	cmphs      	r4, r0
    2936:	9843      	ld.w      	r2, (r14, 0xc)
    2938:	0807      	bt      	0x2946	// 2946 <__umoddi3+0x33e>
    293a:	6108      	addu      	r4, r2
    293c:	6490      	cmphs      	r4, r2
    293e:	0c04      	bf      	0x2946	// 2946 <__umoddi3+0x33e>
    2940:	6410      	cmphs      	r4, r0
    2942:	0802      	bt      	0x2946	// 2946 <__umoddi3+0x33e>
    2944:	6108      	addu      	r4, r2
    2946:	6102      	subu      	r4, r0
    2948:	0700      	br      	0x2748	// 2748 <__umoddi3+0x140>
    294a:	9823      	ld.w      	r1, (r14, 0xc)
    294c:	5b05      	subu      	r0, r3, r1
    294e:	640c      	cmphs      	r3, r0
    2950:	9822      	ld.w      	r1, (r14, 0x8)
    2952:	6146      	subu      	r5, r1
    2954:	64c3      	mvcv      	r3
    2956:	614e      	subu      	r5, r3
    2958:	5a35      	subu      	r1, r2, r5
    295a:	07a7      	br      	0x28a8	// 28a8 <__umoddi3+0x2a0>
    295c:	3618      	movi      	r6, 24
    295e:	06c2      	br      	0x26e2	// 26e2 <__umoddi3+0xda>
    2960:	3718      	movi      	r7, 24
    2962:	06e4      	br      	0x272a	// 272a <__umoddi3+0x122>
    2964:	3718      	movi      	r7, 24
    2966:	0665      	br      	0x2630	// 2630 <__umoddi3+0x28>
    2968:	6448      	cmphs      	r2, r1
    296a:	0b7e      	bt      	0x2866	// 2866 <__umoddi3+0x25e>
    296c:	2801      	subi      	r0, 2
    296e:	6090      	addu      	r2, r4
    2970:	077c      	br      	0x2868	// 2868 <__umoddi3+0x260>
    2972:	648c      	cmphs      	r3, r2
    2974:	0b5d      	bt      	0x282e	// 282e <__umoddi3+0x226>
    2976:	2d01      	subi      	r5, 2
    2978:	60c0      	addu      	r3, r0
    297a:	075b      	br      	0x2830	// 2830 <__umoddi3+0x228>
    297c:	6148      	addu      	r5, r2
    297e:	06a2      	br      	0x26c2	// 26c2 <__umoddi3+0xba>
    2980:	6108      	addu      	r4, r2
    2982:	06fa      	br      	0x2776	// 2776 <__umoddi3+0x16e>
    2984:	60c8      	addu      	r3, r2
    2986:	0683      	br      	0x268c	// 268c <__umoddi3+0x84>
    2988:	6c17      	mov      	r0, r5
    298a:	6c4f      	mov      	r1, r3
    298c:	06bf      	br      	0x270a	// 270a <__umoddi3+0x102>
    298e:	9824      	ld.w      	r1, (r14, 0x10)
    2990:	64c4      	cmphs      	r1, r3
    2992:	0fdc      	bf      	0x294a	// 294a <__umoddi3+0x342>
    2994:	6c0f      	mov      	r0, r3
    2996:	3100      	movi      	r1, 0
    2998:	0788      	br      	0x28a8	// 28a8 <__umoddi3+0x2a0>
    299a:	0000      	bkpt
    299c:	0000ffff 	.long	0x0000ffff
    29a0:	00008bbc 	.long	0x00008bbc
    29a4:	00ffffff 	.long	0x00ffffff

000029a8 <_fpadd_parts>:
    29a8:	14c4      	push      	r4-r7
    29aa:	1421      	subi      	r14, r14, 4
    29ac:	9060      	ld.w      	r3, (r0, 0x0)
    29ae:	3b01      	cmphsi      	r3, 2
    29b0:	0c3b      	bf      	0x2a26	// 2a26 <_fpadd_parts+0x7e>
    29b2:	9180      	ld.w      	r4, (r1, 0x0)
    29b4:	3c01      	cmphsi      	r4, 2
    29b6:	0c3a      	bf      	0x2a2a	// 2a2a <_fpadd_parts+0x82>
    29b8:	3b44      	cmpnei      	r3, 4
    29ba:	0c76      	bf      	0x2aa6	// 2aa6 <_fpadd_parts+0xfe>
    29bc:	3c44      	cmpnei      	r4, 4
    29be:	0c36      	bf      	0x2a2a	// 2a2a <_fpadd_parts+0x82>
    29c0:	3c42      	cmpnei      	r4, 2
    29c2:	0c5c      	bf      	0x2a7a	// 2a7a <_fpadd_parts+0xd2>
    29c4:	3b42      	cmpnei      	r3, 2
    29c6:	0c32      	bf      	0x2a2a	// 2a2a <_fpadd_parts+0x82>
    29c8:	90a2      	ld.w      	r5, (r0, 0x8)
    29ca:	91e2      	ld.w      	r7, (r1, 0x8)
    29cc:	5d9d      	subu      	r4, r5, r7
    29ce:	9063      	ld.w      	r3, (r0, 0xc)
    29d0:	3cdf      	btsti      	r4, 31
    29d2:	b860      	st.w      	r3, (r14, 0x0)
    29d4:	6d93      	mov      	r6, r4
    29d6:	9163      	ld.w      	r3, (r1, 0xc)
    29d8:	086f      	bt      	0x2ab6	// 2ab6 <_fpadd_parts+0x10e>
    29da:	3e3f      	cmplti      	r6, 32
    29dc:	082a      	bt      	0x2a30	// 2a30 <_fpadd_parts+0x88>
    29de:	655d      	cmplt      	r7, r5
    29e0:	0c5f      	bf      	0x2a9e	// 2a9e <_fpadd_parts+0xf6>
    29e2:	3300      	movi      	r3, 0
    29e4:	9001      	ld.w      	r0, (r0, 0x4)
    29e6:	9121      	ld.w      	r1, (r1, 0x4)
    29e8:	6442      	cmpne      	r0, r1
    29ea:	0c33      	bf      	0x2a50	// 2a50 <_fpadd_parts+0xa8>
    29ec:	3840      	cmpnei      	r0, 0
    29ee:	9820      	ld.w      	r1, (r14, 0x0)
    29f0:	0c54      	bf      	0x2a98	// 2a98 <_fpadd_parts+0xf0>
    29f2:	60c6      	subu      	r3, r1
    29f4:	3bdf      	btsti      	r3, 31
    29f6:	0863      	bt      	0x2abc	// 2abc <_fpadd_parts+0x114>
    29f8:	3100      	movi      	r1, 0
    29fa:	b221      	st.w      	r1, (r2, 0x4)
    29fc:	b2a2      	st.w      	r5, (r2, 0x8)
    29fe:	b263      	st.w      	r3, (r2, 0xc)
    2a00:	5b23      	subi      	r1, r3, 1
    2a02:	119b      	lrw      	r4, 0x3fffffff	// 2aec <_fpadd_parts+0x144>
    2a04:	6504      	cmphs      	r1, r4
    2a06:	080b      	bt      	0x2a1c	// 2a1c <_fpadd_parts+0x74>
    2a08:	9222      	ld.w      	r1, (r2, 0x8)
    2a0a:	2900      	subi      	r1, 1
    2a0c:	4361      	lsli      	r3, r3, 1
    2a0e:	5b03      	subi      	r0, r3, 1
    2a10:	6410      	cmphs      	r4, r0
    2a12:	6d47      	mov      	r5, r1
    2a14:	2900      	subi      	r1, 1
    2a16:	0bfb      	bt      	0x2a0c	// 2a0c <_fpadd_parts+0x64>
    2a18:	b263      	st.w      	r3, (r2, 0xc)
    2a1a:	b2a2      	st.w      	r5, (r2, 0x8)
    2a1c:	3103      	movi      	r1, 3
    2a1e:	3bdf      	btsti      	r3, 31
    2a20:	b220      	st.w      	r1, (r2, 0x0)
    2a22:	0821      	bt      	0x2a64	// 2a64 <_fpadd_parts+0xbc>
    2a24:	6c0b      	mov      	r0, r2
    2a26:	1401      	addi      	r14, r14, 4
    2a28:	1484      	pop      	r4-r7
    2a2a:	6c07      	mov      	r0, r1
    2a2c:	1401      	addi      	r14, r14, 4
    2a2e:	1484      	pop      	r4-r7
    2a30:	3c20      	cmplti      	r4, 1
    2a32:	084c      	bt      	0x2aca	// 2aca <_fpadd_parts+0x122>
    2a34:	3401      	movi      	r4, 1
    2a36:	7118      	lsl      	r4, r6
    2a38:	2c00      	subi      	r4, 1
    2a3a:	6dcf      	mov      	r7, r3
    2a3c:	68d0      	and      	r3, r4
    2a3e:	3b40      	cmpnei      	r3, 0
    2a40:	9001      	ld.w      	r0, (r0, 0x4)
    2a42:	3300      	movi      	r3, 0
    2a44:	9121      	ld.w      	r1, (r1, 0x4)
    2a46:	60cd      	addc      	r3, r3
    2a48:	71d9      	lsr      	r7, r6
    2a4a:	6442      	cmpne      	r0, r1
    2a4c:	6cdc      	or      	r3, r7
    2a4e:	0bcf      	bt      	0x29ec	// 29ec <_fpadd_parts+0x44>
    2a50:	9820      	ld.w      	r1, (r14, 0x0)
    2a52:	604c      	addu      	r1, r3
    2a54:	6cc7      	mov      	r3, r1
    2a56:	b223      	st.w      	r1, (r2, 0xc)
    2a58:	3bdf      	btsti      	r3, 31
    2a5a:	3103      	movi      	r1, 3
    2a5c:	b201      	st.w      	r0, (r2, 0x4)
    2a5e:	b2a2      	st.w      	r5, (r2, 0x8)
    2a60:	b220      	st.w      	r1, (r2, 0x0)
    2a62:	0fe1      	bf      	0x2a24	// 2a24 <_fpadd_parts+0x7c>
    2a64:	3001      	movi      	r0, 1
    2a66:	4b21      	lsri      	r1, r3, 1
    2a68:	68c0      	and      	r3, r0
    2a6a:	6cc4      	or      	r3, r1
    2a6c:	b263      	st.w      	r3, (r2, 0xc)
    2a6e:	9262      	ld.w      	r3, (r2, 0x8)
    2a70:	2300      	addi      	r3, 1
    2a72:	6c0b      	mov      	r0, r2
    2a74:	b262      	st.w      	r3, (r2, 0x8)
    2a76:	1401      	addi      	r14, r14, 4
    2a78:	1484      	pop      	r4-r7
    2a7a:	3b42      	cmpnei      	r3, 2
    2a7c:	0bd5      	bt      	0x2a26	// 2a26 <_fpadd_parts+0x7e>
    2a7e:	b260      	st.w      	r3, (r2, 0x0)
    2a80:	9061      	ld.w      	r3, (r0, 0x4)
    2a82:	b261      	st.w      	r3, (r2, 0x4)
    2a84:	9062      	ld.w      	r3, (r0, 0x8)
    2a86:	b262      	st.w      	r3, (r2, 0x8)
    2a88:	9063      	ld.w      	r3, (r0, 0xc)
    2a8a:	9121      	ld.w      	r1, (r1, 0x4)
    2a8c:	b263      	st.w      	r3, (r2, 0xc)
    2a8e:	9061      	ld.w      	r3, (r0, 0x4)
    2a90:	68c4      	and      	r3, r1
    2a92:	b261      	st.w      	r3, (r2, 0x4)
    2a94:	6c0b      	mov      	r0, r2
    2a96:	07c8      	br      	0x2a26	// 2a26 <_fpadd_parts+0x7e>
    2a98:	604e      	subu      	r1, r3
    2a9a:	6cc7      	mov      	r3, r1
    2a9c:	07ac      	br      	0x29f4	// 29f4 <_fpadd_parts+0x4c>
    2a9e:	3400      	movi      	r4, 0
    2aa0:	6d5f      	mov      	r5, r7
    2aa2:	b880      	st.w      	r4, (r14, 0x0)
    2aa4:	07a0      	br      	0x29e4	// 29e4 <_fpadd_parts+0x3c>
    2aa6:	3c44      	cmpnei      	r4, 4
    2aa8:	0bbf      	bt      	0x2a26	// 2a26 <_fpadd_parts+0x7e>
    2aaa:	9041      	ld.w      	r2, (r0, 0x4)
    2aac:	9161      	ld.w      	r3, (r1, 0x4)
    2aae:	64ca      	cmpne      	r2, r3
    2ab0:	0fbb      	bf      	0x2a26	// 2a26 <_fpadd_parts+0x7e>
    2ab2:	1010      	lrw      	r0, 0x8b98	// 2af0 <_fpadd_parts+0x148>
    2ab4:	07b9      	br      	0x2a26	// 2a26 <_fpadd_parts+0x7e>
    2ab6:	3600      	movi      	r6, 0
    2ab8:	6192      	subu      	r6, r4
    2aba:	0790      	br      	0x29da	// 29da <_fpadd_parts+0x32>
    2abc:	3101      	movi      	r1, 1
    2abe:	b221      	st.w      	r1, (r2, 0x4)
    2ac0:	3100      	movi      	r1, 0
    2ac2:	596d      	subu      	r3, r1, r3
    2ac4:	b2a2      	st.w      	r5, (r2, 0x8)
    2ac6:	b263      	st.w      	r3, (r2, 0xc)
    2ac8:	079c      	br      	0x2a00	// 2a00 <_fpadd_parts+0x58>
    2aca:	3c40      	cmpnei      	r4, 0
    2acc:	0f8c      	bf      	0x29e4	// 29e4 <_fpadd_parts+0x3c>
    2ace:	3401      	movi      	r4, 1
    2ad0:	98e0      	ld.w      	r7, (r14, 0x0)
    2ad2:	7118      	lsl      	r4, r6
    2ad4:	71d9      	lsr      	r7, r6
    2ad6:	6158      	addu      	r5, r6
    2ad8:	2c00      	subi      	r4, 1
    2ada:	98c0      	ld.w      	r6, (r14, 0x0)
    2adc:	6918      	and      	r4, r6
    2ade:	3c40      	cmpnei      	r4, 0
    2ae0:	3400      	movi      	r4, 0
    2ae2:	6111      	addc      	r4, r4
    2ae4:	6dd0      	or      	r7, r4
    2ae6:	b8e0      	st.w      	r7, (r14, 0x0)
    2ae8:	077e      	br      	0x29e4	// 29e4 <_fpadd_parts+0x3c>
    2aea:	0000      	bkpt
    2aec:	3fffffff 	.long	0x3fffffff
    2af0:	00008b98 	.long	0x00008b98

00002af4 <__addsf3>:
    2af4:	14d0      	push      	r15
    2af6:	142e      	subi      	r14, r14, 56
    2af8:	b800      	st.w      	r0, (r14, 0x0)
    2afa:	b821      	st.w      	r1, (r14, 0x4)
    2afc:	6c3b      	mov      	r0, r14
    2afe:	1902      	addi      	r1, r14, 8
    2b00:	e0000540 	bsr      	0x3580	// 3580 <__unpack_f>
    2b04:	1906      	addi      	r1, r14, 24
    2b06:	1801      	addi      	r0, r14, 4
    2b08:	e000053c 	bsr      	0x3580	// 3580 <__unpack_f>
    2b0c:	1a0a      	addi      	r2, r14, 40
    2b0e:	1906      	addi      	r1, r14, 24
    2b10:	1802      	addi      	r0, r14, 8
    2b12:	e3ffff4b 	bsr      	0x29a8	// 29a8 <_fpadd_parts>
    2b16:	e00004d9 	bsr      	0x34c8	// 34c8 <__pack_f>
    2b1a:	140e      	addi      	r14, r14, 56
    2b1c:	1490      	pop      	r15
	...

00002b20 <__subsf3>:
    2b20:	14d0      	push      	r15
    2b22:	142e      	subi      	r14, r14, 56
    2b24:	b800      	st.w      	r0, (r14, 0x0)
    2b26:	b821      	st.w      	r1, (r14, 0x4)
    2b28:	6c3b      	mov      	r0, r14
    2b2a:	1902      	addi      	r1, r14, 8
    2b2c:	e000052a 	bsr      	0x3580	// 3580 <__unpack_f>
    2b30:	1906      	addi      	r1, r14, 24
    2b32:	1801      	addi      	r0, r14, 4
    2b34:	e0000526 	bsr      	0x3580	// 3580 <__unpack_f>
    2b38:	9867      	ld.w      	r3, (r14, 0x1c)
    2b3a:	3201      	movi      	r2, 1
    2b3c:	6cc9      	xor      	r3, r2
    2b3e:	1906      	addi      	r1, r14, 24
    2b40:	1a0a      	addi      	r2, r14, 40
    2b42:	1802      	addi      	r0, r14, 8
    2b44:	b867      	st.w      	r3, (r14, 0x1c)
    2b46:	e3ffff31 	bsr      	0x29a8	// 29a8 <_fpadd_parts>
    2b4a:	e00004bf 	bsr      	0x34c8	// 34c8 <__pack_f>
    2b4e:	140e      	addi      	r14, r14, 56
    2b50:	1490      	pop      	r15
	...

00002b54 <__divsf3>:
    2b54:	14d1      	push      	r4, r15
    2b56:	142a      	subi      	r14, r14, 40
    2b58:	b800      	st.w      	r0, (r14, 0x0)
    2b5a:	b821      	st.w      	r1, (r14, 0x4)
    2b5c:	6c3b      	mov      	r0, r14
    2b5e:	1902      	addi      	r1, r14, 8
    2b60:	e0000510 	bsr      	0x3580	// 3580 <__unpack_f>
    2b64:	1906      	addi      	r1, r14, 24
    2b66:	1801      	addi      	r0, r14, 4
    2b68:	e000050c 	bsr      	0x3580	// 3580 <__unpack_f>
    2b6c:	9862      	ld.w      	r3, (r14, 0x8)
    2b6e:	3b01      	cmphsi      	r3, 2
    2b70:	0c2c      	bf      	0x2bc8	// 2bc8 <__divsf3+0x74>
    2b72:	9826      	ld.w      	r1, (r14, 0x18)
    2b74:	3901      	cmphsi      	r1, 2
    2b76:	0c48      	bf      	0x2c06	// 2c06 <__divsf3+0xb2>
    2b78:	9843      	ld.w      	r2, (r14, 0xc)
    2b7a:	9807      	ld.w      	r0, (r14, 0x1c)
    2b7c:	6c81      	xor      	r2, r0
    2b7e:	3b44      	cmpnei      	r3, 4
    2b80:	b843      	st.w      	r2, (r14, 0xc)
    2b82:	0c28      	bf      	0x2bd2	// 2bd2 <__divsf3+0x7e>
    2b84:	3b42      	cmpnei      	r3, 2
    2b86:	0c26      	bf      	0x2bd2	// 2bd2 <__divsf3+0x7e>
    2b88:	3944      	cmpnei      	r1, 4
    2b8a:	0c2c      	bf      	0x2be2	// 2be2 <__divsf3+0x8e>
    2b8c:	3942      	cmpnei      	r1, 2
    2b8e:	0c38      	bf      	0x2bfe	// 2bfe <__divsf3+0xaa>
    2b90:	9844      	ld.w      	r2, (r14, 0x10)
    2b92:	9868      	ld.w      	r3, (r14, 0x20)
    2b94:	608e      	subu      	r2, r3
    2b96:	9809      	ld.w      	r0, (r14, 0x24)
    2b98:	9865      	ld.w      	r3, (r14, 0x14)
    2b9a:	640c      	cmphs      	r3, r0
    2b9c:	b844      	st.w      	r2, (r14, 0x10)
    2b9e:	0c1e      	bf      	0x2bda	// 2bda <__divsf3+0x86>
    2ba0:	3180      	movi      	r1, 128
    2ba2:	321f      	movi      	r2, 31
    2ba4:	3400      	movi      	r4, 0
    2ba6:	4137      	lsli      	r1, r1, 23
    2ba8:	640c      	cmphs      	r3, r0
    2baa:	0c03      	bf      	0x2bb0	// 2bb0 <__divsf3+0x5c>
    2bac:	6d04      	or      	r4, r1
    2bae:	60c2      	subu      	r3, r0
    2bb0:	2a00      	subi      	r2, 1
    2bb2:	3a40      	cmpnei      	r2, 0
    2bb4:	4921      	lsri      	r1, r1, 1
    2bb6:	4361      	lsli      	r3, r3, 1
    2bb8:	0bf8      	bt      	0x2ba8	// 2ba8 <__divsf3+0x54>
    2bba:	317f      	movi      	r1, 127
    2bbc:	6c93      	mov      	r2, r4
    2bbe:	6884      	and      	r2, r1
    2bc0:	3040      	movi      	r0, 64
    2bc2:	640a      	cmpne      	r2, r0
    2bc4:	0c14      	bf      	0x2bec	// 2bec <__divsf3+0x98>
    2bc6:	b885      	st.w      	r4, (r14, 0x14)
    2bc8:	1802      	addi      	r0, r14, 8
    2bca:	e000047f 	bsr      	0x34c8	// 34c8 <__pack_f>
    2bce:	140a      	addi      	r14, r14, 40
    2bd0:	1491      	pop      	r4, r15
    2bd2:	644e      	cmpne      	r3, r1
    2bd4:	0bfa      	bt      	0x2bc8	// 2bc8 <__divsf3+0x74>
    2bd6:	100e      	lrw      	r0, 0x8b98	// 2c0c <__divsf3+0xb8>
    2bd8:	07f9      	br      	0x2bca	// 2bca <__divsf3+0x76>
    2bda:	2a00      	subi      	r2, 1
    2bdc:	4361      	lsli      	r3, r3, 1
    2bde:	b844      	st.w      	r2, (r14, 0x10)
    2be0:	07e0      	br      	0x2ba0	// 2ba0 <__divsf3+0x4c>
    2be2:	3300      	movi      	r3, 0
    2be4:	b865      	st.w      	r3, (r14, 0x14)
    2be6:	b864      	st.w      	r3, (r14, 0x10)
    2be8:	1802      	addi      	r0, r14, 8
    2bea:	07f0      	br      	0x2bca	// 2bca <__divsf3+0x76>
    2bec:	3080      	movi      	r0, 128
    2bee:	6810      	and      	r0, r4
    2bf0:	3840      	cmpnei      	r0, 0
    2bf2:	0bea      	bt      	0x2bc6	// 2bc6 <__divsf3+0x72>
    2bf4:	3b40      	cmpnei      	r3, 0
    2bf6:	0fe8      	bf      	0x2bc6	// 2bc6 <__divsf3+0x72>
    2bf8:	6108      	addu      	r4, r2
    2bfa:	6905      	andn      	r4, r1
    2bfc:	07e5      	br      	0x2bc6	// 2bc6 <__divsf3+0x72>
    2bfe:	3304      	movi      	r3, 4
    2c00:	b862      	st.w      	r3, (r14, 0x8)
    2c02:	1802      	addi      	r0, r14, 8
    2c04:	07e3      	br      	0x2bca	// 2bca <__divsf3+0x76>
    2c06:	1806      	addi      	r0, r14, 24
    2c08:	07e1      	br      	0x2bca	// 2bca <__divsf3+0x76>
    2c0a:	0000      	bkpt
    2c0c:	00008b98 	.long	0x00008b98

00002c10 <__fixsfsi>:
    2c10:	14d0      	push      	r15
    2c12:	1425      	subi      	r14, r14, 20
    2c14:	b800      	st.w      	r0, (r14, 0x0)
    2c16:	1901      	addi      	r1, r14, 4
    2c18:	6c3b      	mov      	r0, r14
    2c1a:	e00004b3 	bsr      	0x3580	// 3580 <__unpack_f>
    2c1e:	9861      	ld.w      	r3, (r14, 0x4)
    2c20:	3b02      	cmphsi      	r3, 3
    2c22:	0c1b      	bf      	0x2c58	// 2c58 <__fixsfsi+0x48>
    2c24:	3b44      	cmpnei      	r3, 4
    2c26:	0c06      	bf      	0x2c32	// 2c32 <__fixsfsi+0x22>
    2c28:	9863      	ld.w      	r3, (r14, 0xc)
    2c2a:	3bdf      	btsti      	r3, 31
    2c2c:	0816      	bt      	0x2c58	// 2c58 <__fixsfsi+0x48>
    2c2e:	3b3e      	cmplti      	r3, 31
    2c30:	0809      	bt      	0x2c42	// 2c42 <__fixsfsi+0x32>
    2c32:	9862      	ld.w      	r3, (r14, 0x8)
    2c34:	3b40      	cmpnei      	r3, 0
    2c36:	3000      	movi      	r0, 0
    2c38:	6001      	addc      	r0, r0
    2c3a:	106a      	lrw      	r3, 0x7fffffff	// 2c60 <__fixsfsi+0x50>
    2c3c:	600c      	addu      	r0, r3
    2c3e:	1405      	addi      	r14, r14, 20
    2c40:	1490      	pop      	r15
    2c42:	321e      	movi      	r2, 30
    2c44:	5a6d      	subu      	r3, r2, r3
    2c46:	9804      	ld.w      	r0, (r14, 0x10)
    2c48:	700d      	lsr      	r0, r3
    2c4a:	9862      	ld.w      	r3, (r14, 0x8)
    2c4c:	3b40      	cmpnei      	r3, 0
    2c4e:	0ff8      	bf      	0x2c3e	// 2c3e <__fixsfsi+0x2e>
    2c50:	3300      	movi      	r3, 0
    2c52:	5b01      	subu      	r0, r3, r0
    2c54:	1405      	addi      	r14, r14, 20
    2c56:	1490      	pop      	r15
    2c58:	3000      	movi      	r0, 0
    2c5a:	1405      	addi      	r14, r14, 20
    2c5c:	1490      	pop      	r15
    2c5e:	0000      	bkpt
    2c60:	7fffffff 	.long	0x7fffffff

00002c64 <__floatunsisf>:
    2c64:	14d2      	push      	r4-r5, r15
    2c66:	1424      	subi      	r14, r14, 16
    2c68:	3840      	cmpnei      	r0, 0
    2c6a:	3300      	movi      	r3, 0
    2c6c:	6d03      	mov      	r4, r0
    2c6e:	b861      	st.w      	r3, (r14, 0x4)
    2c70:	0c15      	bf      	0x2c9a	// 2c9a <__floatunsisf+0x36>
    2c72:	3303      	movi      	r3, 3
    2c74:	351e      	movi      	r5, 30
    2c76:	b860      	st.w      	r3, (r14, 0x0)
    2c78:	b8a2      	st.w      	r5, (r14, 0x8)
    2c7a:	e0000407 	bsr      	0x3488	// 3488 <__clzsi2>
    2c7e:	3840      	cmpnei      	r0, 0
    2c80:	5863      	subi      	r3, r0, 1
    2c82:	0c13      	bf      	0x2ca8	// 2ca8 <__floatunsisf+0x44>
    2c84:	3b40      	cmpnei      	r3, 0
    2c86:	0c1d      	bf      	0x2cc0	// 2cc0 <__floatunsisf+0x5c>
    2c88:	710c      	lsl      	r4, r3
    2c8a:	614e      	subu      	r5, r3
    2c8c:	b883      	st.w      	r4, (r14, 0xc)
    2c8e:	b8a2      	st.w      	r5, (r14, 0x8)
    2c90:	6c3b      	mov      	r0, r14
    2c92:	e000041b 	bsr      	0x34c8	// 34c8 <__pack_f>
    2c96:	1404      	addi      	r14, r14, 16
    2c98:	1492      	pop      	r4-r5, r15
    2c9a:	3302      	movi      	r3, 2
    2c9c:	6c3b      	mov      	r0, r14
    2c9e:	b860      	st.w      	r3, (r14, 0x0)
    2ca0:	e0000414 	bsr      	0x34c8	// 34c8 <__pack_f>
    2ca4:	1404      	addi      	r14, r14, 16
    2ca6:	1492      	pop      	r4-r5, r15
    2ca8:	3301      	movi      	r3, 1
    2caa:	68d0      	and      	r3, r4
    2cac:	4c81      	lsri      	r4, r4, 1
    2cae:	6d0c      	or      	r4, r3
    2cb0:	6c3b      	mov      	r0, r14
    2cb2:	331f      	movi      	r3, 31
    2cb4:	b883      	st.w      	r4, (r14, 0xc)
    2cb6:	b862      	st.w      	r3, (r14, 0x8)
    2cb8:	e0000408 	bsr      	0x34c8	// 34c8 <__pack_f>
    2cbc:	1404      	addi      	r14, r14, 16
    2cbe:	1492      	pop      	r4-r5, r15
    2cc0:	b883      	st.w      	r4, (r14, 0xc)
    2cc2:	07e7      	br      	0x2c90	// 2c90 <__floatunsisf+0x2c>

00002cc4 <_fpadd_parts>:
    2cc4:	14c4      	push      	r4-r7
    2cc6:	142a      	subi      	r14, r14, 40
    2cc8:	9060      	ld.w      	r3, (r0, 0x0)
    2cca:	3b01      	cmphsi      	r3, 2
    2ccc:	6dcb      	mov      	r7, r2
    2cce:	0c67      	bf      	0x2d9c	// 2d9c <_fpadd_parts+0xd8>
    2cd0:	9140      	ld.w      	r2, (r1, 0x0)
    2cd2:	3a01      	cmphsi      	r2, 2
    2cd4:	0c66      	bf      	0x2da0	// 2da0 <_fpadd_parts+0xdc>
    2cd6:	3b44      	cmpnei      	r3, 4
    2cd8:	0cde      	bf      	0x2e94	// 2e94 <_fpadd_parts+0x1d0>
    2cda:	3a44      	cmpnei      	r2, 4
    2cdc:	0c62      	bf      	0x2da0	// 2da0 <_fpadd_parts+0xdc>
    2cde:	3a42      	cmpnei      	r2, 2
    2ce0:	0cb7      	bf      	0x2e4e	// 2e4e <_fpadd_parts+0x18a>
    2ce2:	3b42      	cmpnei      	r3, 2
    2ce4:	0c5e      	bf      	0x2da0	// 2da0 <_fpadd_parts+0xdc>
    2ce6:	9043      	ld.w      	r2, (r0, 0xc)
    2ce8:	9064      	ld.w      	r3, (r0, 0x10)
    2cea:	9082      	ld.w      	r4, (r0, 0x8)
    2cec:	91a2      	ld.w      	r5, (r1, 0x8)
    2cee:	b842      	st.w      	r2, (r14, 0x8)
    2cf0:	b863      	st.w      	r3, (r14, 0xc)
    2cf2:	9143      	ld.w      	r2, (r1, 0xc)
    2cf4:	9164      	ld.w      	r3, (r1, 0x10)
    2cf6:	b840      	st.w      	r2, (r14, 0x0)
    2cf8:	b861      	st.w      	r3, (r14, 0x4)
    2cfa:	5c75      	subu      	r3, r4, r5
    2cfc:	3bdf      	btsti      	r3, 31
    2cfe:	6c8f      	mov      	r2, r3
    2d00:	08d2      	bt      	0x2ea4	// 2ea4 <_fpadd_parts+0x1e0>
    2d02:	363f      	movi      	r6, 63
    2d04:	6499      	cmplt      	r6, r2
    2d06:	0c50      	bf      	0x2da6	// 2da6 <_fpadd_parts+0xe2>
    2d08:	6515      	cmplt      	r5, r4
    2d0a:	0cbf      	bf      	0x2e88	// 2e88 <_fpadd_parts+0x1c4>
    2d0c:	3200      	movi      	r2, 0
    2d0e:	3300      	movi      	r3, 0
    2d10:	b840      	st.w      	r2, (r14, 0x0)
    2d12:	b861      	st.w      	r3, (r14, 0x4)
    2d14:	9061      	ld.w      	r3, (r0, 0x4)
    2d16:	9141      	ld.w      	r2, (r1, 0x4)
    2d18:	648e      	cmpne      	r3, r2
    2d1a:	0c78      	bf      	0x2e0a	// 2e0a <_fpadd_parts+0x146>
    2d1c:	3b40      	cmpnei      	r3, 0
    2d1e:	0cad      	bf      	0x2e78	// 2e78 <_fpadd_parts+0x1b4>
    2d20:	9800      	ld.w      	r0, (r14, 0x0)
    2d22:	9821      	ld.w      	r1, (r14, 0x4)
    2d24:	9842      	ld.w      	r2, (r14, 0x8)
    2d26:	9863      	ld.w      	r3, (r14, 0xc)
    2d28:	6400      	cmphs      	r0, r0
    2d2a:	600b      	subc      	r0, r2
    2d2c:	604f      	subc      	r1, r3
    2d2e:	39df      	btsti      	r1, 31
    2d30:	08bd      	bt      	0x2eaa	// 2eaa <_fpadd_parts+0x1e6>
    2d32:	3300      	movi      	r3, 0
    2d34:	b761      	st.w      	r3, (r7, 0x4)
    2d36:	b782      	st.w      	r4, (r7, 0x8)
    2d38:	6c83      	mov      	r2, r0
    2d3a:	6cc7      	mov      	r3, r1
    2d3c:	b703      	st.w      	r0, (r7, 0xc)
    2d3e:	b724      	st.w      	r1, (r7, 0x10)
    2d40:	3000      	movi      	r0, 0
    2d42:	3100      	movi      	r1, 0
    2d44:	2800      	subi      	r0, 1
    2d46:	2900      	subi      	r1, 1
    2d48:	6401      	cmplt      	r0, r0
    2d4a:	6009      	addc      	r0, r2
    2d4c:	604d      	addc      	r1, r3
    2d4e:	038f      	lrw      	r4, 0xfffffff	// 2f8c <_fpadd_parts+0x2c8>
    2d50:	6450      	cmphs      	r4, r1
    2d52:	0c67      	bf      	0x2e20	// 2e20 <_fpadd_parts+0x15c>
    2d54:	6506      	cmpne      	r1, r4
    2d56:	0cfd      	bf      	0x2f50	// 2f50 <_fpadd_parts+0x28c>
    2d58:	3000      	movi      	r0, 0
    2d5a:	9722      	ld.w      	r1, (r7, 0x8)
    2d5c:	2801      	subi      	r0, 2
    2d5e:	2900      	subi      	r1, 1
    2d60:	03d4      	lrw      	r6, 0xfffffff	// 2f8c <_fpadd_parts+0x2c8>
    2d62:	b802      	st.w      	r0, (r14, 0x8)
    2d64:	b8e0      	st.w      	r7, (r14, 0x0)
    2d66:	0403      	br      	0x2d6c	// 2d6c <_fpadd_parts+0xa8>
    2d68:	6596      	cmpne      	r5, r6
    2d6a:	0c83      	bf      	0x2e70	// 2e70 <_fpadd_parts+0x1ac>
    2d6c:	4301      	lsli      	r0, r3, 1
    2d6e:	4a9f      	lsri      	r4, r2, 31
    2d70:	6d00      	or      	r4, r0
    2d72:	42a1      	lsli      	r5, r2, 1
    2d74:	6c97      	mov      	r2, r5
    2d76:	6cd3      	mov      	r3, r4
    2d78:	3500      	movi      	r5, 0
    2d7a:	3400      	movi      	r4, 0
    2d7c:	2c00      	subi      	r4, 1
    2d7e:	2d00      	subi      	r5, 1
    2d80:	6511      	cmplt      	r4, r4
    2d82:	6109      	addc      	r4, r2
    2d84:	614d      	addc      	r5, r3
    2d86:	6558      	cmphs      	r6, r5
    2d88:	6c07      	mov      	r0, r1
    2d8a:	2900      	subi      	r1, 1
    2d8c:	0bee      	bt      	0x2d68	// 2d68 <_fpadd_parts+0xa4>
    2d8e:	98e0      	ld.w      	r7, (r14, 0x0)
    2d90:	b743      	st.w      	r2, (r7, 0xc)
    2d92:	b764      	st.w      	r3, (r7, 0x10)
    2d94:	3303      	movi      	r3, 3
    2d96:	b702      	st.w      	r0, (r7, 0x8)
    2d98:	b760      	st.w      	r3, (r7, 0x0)
    2d9a:	6c1f      	mov      	r0, r7
    2d9c:	140a      	addi      	r14, r14, 40
    2d9e:	1484      	pop      	r4-r7
    2da0:	6c07      	mov      	r0, r1
    2da2:	140a      	addi      	r14, r14, 40
    2da4:	1484      	pop      	r4-r7
    2da6:	3b20      	cmplti      	r3, 1
    2da8:	088c      	bt      	0x2ec0	// 2ec0 <_fpadd_parts+0x1fc>
    2daa:	3300      	movi      	r3, 0
    2dac:	2b1f      	subi      	r3, 32
    2dae:	60c8      	addu      	r3, r2
    2db0:	3bdf      	btsti      	r3, 31
    2db2:	b866      	st.w      	r3, (r14, 0x18)
    2db4:	08bb      	bt      	0x2f2a	// 2f2a <_fpadd_parts+0x266>
    2db6:	98a1      	ld.w      	r5, (r14, 0x4)
    2db8:	714d      	lsr      	r5, r3
    2dba:	b8a4      	st.w      	r5, (r14, 0x10)
    2dbc:	3500      	movi      	r5, 0
    2dbe:	b8a5      	st.w      	r5, (r14, 0x14)
    2dc0:	9866      	ld.w      	r3, (r14, 0x18)
    2dc2:	3bdf      	btsti      	r3, 31
    2dc4:	3500      	movi      	r5, 0
    2dc6:	3600      	movi      	r6, 0
    2dc8:	08ad      	bt      	0x2f22	// 2f22 <_fpadd_parts+0x25e>
    2dca:	3201      	movi      	r2, 1
    2dcc:	708c      	lsl      	r2, r3
    2dce:	6d8b      	mov      	r6, r2
    2dd0:	3200      	movi      	r2, 0
    2dd2:	3300      	movi      	r3, 0
    2dd4:	2a00      	subi      	r2, 1
    2dd6:	2b00      	subi      	r3, 1
    2dd8:	6489      	cmplt      	r2, r2
    2dda:	6095      	addc      	r2, r5
    2ddc:	60d9      	addc      	r3, r6
    2dde:	98a0      	ld.w      	r5, (r14, 0x0)
    2de0:	98c1      	ld.w      	r6, (r14, 0x4)
    2de2:	6948      	and      	r5, r2
    2de4:	698c      	and      	r6, r3
    2de6:	6c97      	mov      	r2, r5
    2de8:	6cdb      	mov      	r3, r6
    2dea:	6c8c      	or      	r2, r3
    2dec:	3a40      	cmpnei      	r2, 0
    2dee:	3500      	movi      	r5, 0
    2df0:	6155      	addc      	r5, r5
    2df2:	6c97      	mov      	r2, r5
    2df4:	3300      	movi      	r3, 0
    2df6:	98a4      	ld.w      	r5, (r14, 0x10)
    2df8:	98c5      	ld.w      	r6, (r14, 0x14)
    2dfa:	6d48      	or      	r5, r2
    2dfc:	6d8c      	or      	r6, r3
    2dfe:	9061      	ld.w      	r3, (r0, 0x4)
    2e00:	9141      	ld.w      	r2, (r1, 0x4)
    2e02:	648e      	cmpne      	r3, r2
    2e04:	b8a0      	st.w      	r5, (r14, 0x0)
    2e06:	b8c1      	st.w      	r6, (r14, 0x4)
    2e08:	0b8a      	bt      	0x2d1c	// 2d1c <_fpadd_parts+0x58>
    2e0a:	b761      	st.w      	r3, (r7, 0x4)
    2e0c:	9800      	ld.w      	r0, (r14, 0x0)
    2e0e:	9821      	ld.w      	r1, (r14, 0x4)
    2e10:	9842      	ld.w      	r2, (r14, 0x8)
    2e12:	9863      	ld.w      	r3, (r14, 0xc)
    2e14:	6489      	cmplt      	r2, r2
    2e16:	6081      	addc      	r2, r0
    2e18:	60c5      	addc      	r3, r1
    2e1a:	b782      	st.w      	r4, (r7, 0x8)
    2e1c:	b743      	st.w      	r2, (r7, 0xc)
    2e1e:	b764      	st.w      	r3, (r7, 0x10)
    2e20:	3103      	movi      	r1, 3
    2e22:	b720      	st.w      	r1, (r7, 0x0)
    2e24:	123b      	lrw      	r1, 0x1fffffff	// 2f90 <_fpadd_parts+0x2cc>
    2e26:	64c4      	cmphs      	r1, r3
    2e28:	0810      	bt      	0x2e48	// 2e48 <_fpadd_parts+0x184>
    2e2a:	439f      	lsli      	r4, r3, 31
    2e2c:	4a01      	lsri      	r0, r2, 1
    2e2e:	6c10      	or      	r0, r4
    2e30:	3500      	movi      	r5, 0
    2e32:	3401      	movi      	r4, 1
    2e34:	4b21      	lsri      	r1, r3, 1
    2e36:	6890      	and      	r2, r4
    2e38:	68d4      	and      	r3, r5
    2e3a:	6c80      	or      	r2, r0
    2e3c:	6cc4      	or      	r3, r1
    2e3e:	b743      	st.w      	r2, (r7, 0xc)
    2e40:	b764      	st.w      	r3, (r7, 0x10)
    2e42:	9762      	ld.w      	r3, (r7, 0x8)
    2e44:	2300      	addi      	r3, 1
    2e46:	b762      	st.w      	r3, (r7, 0x8)
    2e48:	6c1f      	mov      	r0, r7
    2e4a:	140a      	addi      	r14, r14, 40
    2e4c:	1484      	pop      	r4-r7
    2e4e:	3b42      	cmpnei      	r3, 2
    2e50:	0ba6      	bt      	0x2d9c	// 2d9c <_fpadd_parts+0xd8>
    2e52:	b760      	st.w      	r3, (r7, 0x0)
    2e54:	9061      	ld.w      	r3, (r0, 0x4)
    2e56:	b761      	st.w      	r3, (r7, 0x4)
    2e58:	9062      	ld.w      	r3, (r0, 0x8)
    2e5a:	b762      	st.w      	r3, (r7, 0x8)
    2e5c:	9063      	ld.w      	r3, (r0, 0xc)
    2e5e:	b763      	st.w      	r3, (r7, 0xc)
    2e60:	9064      	ld.w      	r3, (r0, 0x10)
    2e62:	9141      	ld.w      	r2, (r1, 0x4)
    2e64:	b764      	st.w      	r3, (r7, 0x10)
    2e66:	9061      	ld.w      	r3, (r0, 0x4)
    2e68:	68c8      	and      	r3, r2
    2e6a:	b761      	st.w      	r3, (r7, 0x4)
    2e6c:	6c1f      	mov      	r0, r7
    2e6e:	0797      	br      	0x2d9c	// 2d9c <_fpadd_parts+0xd8>
    2e70:	98e2      	ld.w      	r7, (r14, 0x8)
    2e72:	651c      	cmphs      	r7, r4
    2e74:	0b7c      	bt      	0x2d6c	// 2d6c <_fpadd_parts+0xa8>
    2e76:	078c      	br      	0x2d8e	// 2d8e <_fpadd_parts+0xca>
    2e78:	9802      	ld.w      	r0, (r14, 0x8)
    2e7a:	9823      	ld.w      	r1, (r14, 0xc)
    2e7c:	9840      	ld.w      	r2, (r14, 0x0)
    2e7e:	9861      	ld.w      	r3, (r14, 0x4)
    2e80:	6400      	cmphs      	r0, r0
    2e82:	600b      	subc      	r0, r2
    2e84:	604f      	subc      	r1, r3
    2e86:	0754      	br      	0x2d2e	// 2d2e <_fpadd_parts+0x6a>
    2e88:	3200      	movi      	r2, 0
    2e8a:	3300      	movi      	r3, 0
    2e8c:	6d17      	mov      	r4, r5
    2e8e:	b842      	st.w      	r2, (r14, 0x8)
    2e90:	b863      	st.w      	r3, (r14, 0xc)
    2e92:	0741      	br      	0x2d14	// 2d14 <_fpadd_parts+0x50>
    2e94:	3a44      	cmpnei      	r2, 4
    2e96:	0b83      	bt      	0x2d9c	// 2d9c <_fpadd_parts+0xd8>
    2e98:	9041      	ld.w      	r2, (r0, 0x4)
    2e9a:	9161      	ld.w      	r3, (r1, 0x4)
    2e9c:	64ca      	cmpne      	r2, r3
    2e9e:	0f7f      	bf      	0x2d9c	// 2d9c <_fpadd_parts+0xd8>
    2ea0:	111d      	lrw      	r0, 0x8ba8	// 2f94 <_fpadd_parts+0x2d0>
    2ea2:	077d      	br      	0x2d9c	// 2d9c <_fpadd_parts+0xd8>
    2ea4:	3200      	movi      	r2, 0
    2ea6:	608e      	subu      	r2, r3
    2ea8:	072d      	br      	0x2d02	// 2d02 <_fpadd_parts+0x3e>
    2eaa:	3301      	movi      	r3, 1
    2eac:	b761      	st.w      	r3, (r7, 0x4)
    2eae:	3200      	movi      	r2, 0
    2eb0:	3300      	movi      	r3, 0
    2eb2:	6488      	cmphs      	r2, r2
    2eb4:	6083      	subc      	r2, r0
    2eb6:	60c7      	subc      	r3, r1
    2eb8:	b782      	st.w      	r4, (r7, 0x8)
    2eba:	b743      	st.w      	r2, (r7, 0xc)
    2ebc:	b764      	st.w      	r3, (r7, 0x10)
    2ebe:	0741      	br      	0x2d40	// 2d40 <_fpadd_parts+0x7c>
    2ec0:	3b40      	cmpnei      	r3, 0
    2ec2:	0f29      	bf      	0x2d14	// 2d14 <_fpadd_parts+0x50>
    2ec4:	3300      	movi      	r3, 0
    2ec6:	2b1f      	subi      	r3, 32
    2ec8:	60c8      	addu      	r3, r2
    2eca:	3bdf      	btsti      	r3, 31
    2ecc:	6108      	addu      	r4, r2
    2ece:	b866      	st.w      	r3, (r14, 0x18)
    2ed0:	0849      	bt      	0x2f62	// 2f62 <_fpadd_parts+0x29e>
    2ed2:	9863      	ld.w      	r3, (r14, 0xc)
    2ed4:	98a6      	ld.w      	r5, (r14, 0x18)
    2ed6:	70d5      	lsr      	r3, r5
    2ed8:	b864      	st.w      	r3, (r14, 0x10)
    2eda:	3300      	movi      	r3, 0
    2edc:	b865      	st.w      	r3, (r14, 0x14)
    2ede:	9866      	ld.w      	r3, (r14, 0x18)
    2ee0:	3bdf      	btsti      	r3, 31
    2ee2:	3500      	movi      	r5, 0
    2ee4:	3600      	movi      	r6, 0
    2ee6:	083a      	bt      	0x2f5a	// 2f5a <_fpadd_parts+0x296>
    2ee8:	3201      	movi      	r2, 1
    2eea:	708c      	lsl      	r2, r3
    2eec:	6d8b      	mov      	r6, r2
    2eee:	3200      	movi      	r2, 0
    2ef0:	3300      	movi      	r3, 0
    2ef2:	2a00      	subi      	r2, 1
    2ef4:	2b00      	subi      	r3, 1
    2ef6:	6489      	cmplt      	r2, r2
    2ef8:	6095      	addc      	r2, r5
    2efa:	60d9      	addc      	r3, r6
    2efc:	98a2      	ld.w      	r5, (r14, 0x8)
    2efe:	98c3      	ld.w      	r6, (r14, 0xc)
    2f00:	6948      	and      	r5, r2
    2f02:	698c      	and      	r6, r3
    2f04:	6c97      	mov      	r2, r5
    2f06:	6cdb      	mov      	r3, r6
    2f08:	6c8c      	or      	r2, r3
    2f0a:	3a40      	cmpnei      	r2, 0
    2f0c:	3500      	movi      	r5, 0
    2f0e:	6155      	addc      	r5, r5
    2f10:	6c97      	mov      	r2, r5
    2f12:	3300      	movi      	r3, 0
    2f14:	98a4      	ld.w      	r5, (r14, 0x10)
    2f16:	98c5      	ld.w      	r6, (r14, 0x14)
    2f18:	6d48      	or      	r5, r2
    2f1a:	6d8c      	or      	r6, r3
    2f1c:	b8a2      	st.w      	r5, (r14, 0x8)
    2f1e:	b8c3      	st.w      	r6, (r14, 0xc)
    2f20:	06fa      	br      	0x2d14	// 2d14 <_fpadd_parts+0x50>
    2f22:	3301      	movi      	r3, 1
    2f24:	70c8      	lsl      	r3, r2
    2f26:	6d4f      	mov      	r5, r3
    2f28:	0754      	br      	0x2dd0	// 2dd0 <_fpadd_parts+0x10c>
    2f2a:	9861      	ld.w      	r3, (r14, 0x4)
    2f2c:	361f      	movi      	r6, 31
    2f2e:	43a1      	lsli      	r5, r3, 1
    2f30:	618a      	subu      	r6, r2
    2f32:	7158      	lsl      	r5, r6
    2f34:	b8a9      	st.w      	r5, (r14, 0x24)
    2f36:	98a0      	ld.w      	r5, (r14, 0x0)
    2f38:	98c1      	ld.w      	r6, (r14, 0x4)
    2f3a:	b8a7      	st.w      	r5, (r14, 0x1c)
    2f3c:	b8c8      	st.w      	r6, (r14, 0x20)
    2f3e:	9867      	ld.w      	r3, (r14, 0x1c)
    2f40:	70c9      	lsr      	r3, r2
    2f42:	98a9      	ld.w      	r5, (r14, 0x24)
    2f44:	6cd4      	or      	r3, r5
    2f46:	b864      	st.w      	r3, (r14, 0x10)
    2f48:	9868      	ld.w      	r3, (r14, 0x20)
    2f4a:	70c9      	lsr      	r3, r2
    2f4c:	b865      	st.w      	r3, (r14, 0x14)
    2f4e:	0739      	br      	0x2dc0	// 2dc0 <_fpadd_parts+0xfc>
    2f50:	3100      	movi      	r1, 0
    2f52:	2901      	subi      	r1, 2
    2f54:	6404      	cmphs      	r1, r0
    2f56:	0b01      	bt      	0x2d58	// 2d58 <_fpadd_parts+0x94>
    2f58:	0764      	br      	0x2e20	// 2e20 <_fpadd_parts+0x15c>
    2f5a:	3301      	movi      	r3, 1
    2f5c:	70c8      	lsl      	r3, r2
    2f5e:	6d4f      	mov      	r5, r3
    2f60:	07c7      	br      	0x2eee	// 2eee <_fpadd_parts+0x22a>
    2f62:	9863      	ld.w      	r3, (r14, 0xc)
    2f64:	43c1      	lsli      	r6, r3, 1
    2f66:	351f      	movi      	r5, 31
    2f68:	5d69      	subu      	r3, r5, r2
    2f6a:	6d5b      	mov      	r5, r6
    2f6c:	714c      	lsl      	r5, r3
    2f6e:	b8a9      	st.w      	r5, (r14, 0x24)
    2f70:	98a2      	ld.w      	r5, (r14, 0x8)
    2f72:	98c3      	ld.w      	r6, (r14, 0xc)
    2f74:	b8a7      	st.w      	r5, (r14, 0x1c)
    2f76:	b8c8      	st.w      	r6, (r14, 0x20)
    2f78:	9867      	ld.w      	r3, (r14, 0x1c)
    2f7a:	70c9      	lsr      	r3, r2
    2f7c:	98a9      	ld.w      	r5, (r14, 0x24)
    2f7e:	6cd4      	or      	r3, r5
    2f80:	b864      	st.w      	r3, (r14, 0x10)
    2f82:	9868      	ld.w      	r3, (r14, 0x20)
    2f84:	70c9      	lsr      	r3, r2
    2f86:	b865      	st.w      	r3, (r14, 0x14)
    2f88:	07ab      	br      	0x2ede	// 2ede <_fpadd_parts+0x21a>
    2f8a:	0000      	bkpt
    2f8c:	0fffffff 	.long	0x0fffffff
    2f90:	1fffffff 	.long	0x1fffffff
    2f94:	00008ba8 	.long	0x00008ba8

00002f98 <__adddf3>:
    2f98:	14d0      	push      	r15
    2f9a:	1433      	subi      	r14, r14, 76
    2f9c:	b800      	st.w      	r0, (r14, 0x0)
    2f9e:	b821      	st.w      	r1, (r14, 0x4)
    2fa0:	6c3b      	mov      	r0, r14
    2fa2:	1904      	addi      	r1, r14, 16
    2fa4:	b863      	st.w      	r3, (r14, 0xc)
    2fa6:	b842      	st.w      	r2, (r14, 0x8)
    2fa8:	e00003fc 	bsr      	0x37a0	// 37a0 <__unpack_d>
    2fac:	1909      	addi      	r1, r14, 36
    2fae:	1802      	addi      	r0, r14, 8
    2fb0:	e00003f8 	bsr      	0x37a0	// 37a0 <__unpack_d>
    2fb4:	1a0e      	addi      	r2, r14, 56
    2fb6:	1909      	addi      	r1, r14, 36
    2fb8:	1804      	addi      	r0, r14, 16
    2fba:	e3fffe85 	bsr      	0x2cc4	// 2cc4 <_fpadd_parts>
    2fbe:	e0000323 	bsr      	0x3604	// 3604 <__pack_d>
    2fc2:	1413      	addi      	r14, r14, 76
    2fc4:	1490      	pop      	r15
	...

00002fc8 <__subdf3>:
    2fc8:	14d0      	push      	r15
    2fca:	1433      	subi      	r14, r14, 76
    2fcc:	b800      	st.w      	r0, (r14, 0x0)
    2fce:	b821      	st.w      	r1, (r14, 0x4)
    2fd0:	6c3b      	mov      	r0, r14
    2fd2:	1904      	addi      	r1, r14, 16
    2fd4:	b842      	st.w      	r2, (r14, 0x8)
    2fd6:	b863      	st.w      	r3, (r14, 0xc)
    2fd8:	e00003e4 	bsr      	0x37a0	// 37a0 <__unpack_d>
    2fdc:	1909      	addi      	r1, r14, 36
    2fde:	1802      	addi      	r0, r14, 8
    2fe0:	e00003e0 	bsr      	0x37a0	// 37a0 <__unpack_d>
    2fe4:	986a      	ld.w      	r3, (r14, 0x28)
    2fe6:	3201      	movi      	r2, 1
    2fe8:	6cc9      	xor      	r3, r2
    2fea:	1909      	addi      	r1, r14, 36
    2fec:	1a0e      	addi      	r2, r14, 56
    2fee:	1804      	addi      	r0, r14, 16
    2ff0:	b86a      	st.w      	r3, (r14, 0x28)
    2ff2:	e3fffe69 	bsr      	0x2cc4	// 2cc4 <_fpadd_parts>
    2ff6:	e0000307 	bsr      	0x3604	// 3604 <__pack_d>
    2ffa:	1413      	addi      	r14, r14, 76
    2ffc:	1490      	pop      	r15
	...

00003000 <__muldf3>:
    3000:	14d4      	push      	r4-r7, r15
    3002:	143b      	subi      	r14, r14, 108
    3004:	b808      	st.w      	r0, (r14, 0x20)
    3006:	b829      	st.w      	r1, (r14, 0x24)
    3008:	1808      	addi      	r0, r14, 32
    300a:	190c      	addi      	r1, r14, 48
    300c:	b86b      	st.w      	r3, (r14, 0x2c)
    300e:	b84a      	st.w      	r2, (r14, 0x28)
    3010:	e00003c8 	bsr      	0x37a0	// 37a0 <__unpack_d>
    3014:	1911      	addi      	r1, r14, 68
    3016:	180a      	addi      	r0, r14, 40
    3018:	e00003c4 	bsr      	0x37a0	// 37a0 <__unpack_d>
    301c:	986c      	ld.w      	r3, (r14, 0x30)
    301e:	3b01      	cmphsi      	r3, 2
    3020:	0cac      	bf      	0x3178	// 3178 <__muldf3+0x178>
    3022:	9851      	ld.w      	r2, (r14, 0x44)
    3024:	3a01      	cmphsi      	r2, 2
    3026:	0c9c      	bf      	0x315e	// 315e <__muldf3+0x15e>
    3028:	3b44      	cmpnei      	r3, 4
    302a:	0ca5      	bf      	0x3174	// 3174 <__muldf3+0x174>
    302c:	3a44      	cmpnei      	r2, 4
    302e:	0c96      	bf      	0x315a	// 315a <__muldf3+0x15a>
    3030:	3b42      	cmpnei      	r3, 2
    3032:	0ca3      	bf      	0x3178	// 3178 <__muldf3+0x178>
    3034:	3a42      	cmpnei      	r2, 2
    3036:	0c94      	bf      	0x315e	// 315e <__muldf3+0x15e>
    3038:	98ef      	ld.w      	r7, (r14, 0x3c)
    303a:	98b4      	ld.w      	r5, (r14, 0x50)
    303c:	9875      	ld.w      	r3, (r14, 0x54)
    303e:	6d8f      	mov      	r6, r3
    3040:	6c9f      	mov      	r2, r7
    3042:	3300      	movi      	r3, 0
    3044:	6c17      	mov      	r0, r5
    3046:	3100      	movi      	r1, 0
    3048:	e3fff8cc 	bsr      	0x21e0	// 21e0 <__muldi3>
    304c:	b804      	st.w      	r0, (r14, 0x10)
    304e:	b825      	st.w      	r1, (r14, 0x14)
    3050:	6c9f      	mov      	r2, r7
    3052:	3300      	movi      	r3, 0
    3054:	6c1b      	mov      	r0, r6
    3056:	3100      	movi      	r1, 0
    3058:	9890      	ld.w      	r4, (r14, 0x40)
    305a:	b8c2      	st.w      	r6, (r14, 0x8)
    305c:	e3fff8c2 	bsr      	0x21e0	// 21e0 <__muldi3>
    3060:	6d83      	mov      	r6, r0
    3062:	6dc7      	mov      	r7, r1
    3064:	9842      	ld.w      	r2, (r14, 0x8)
    3066:	3300      	movi      	r3, 0
    3068:	6c13      	mov      	r0, r4
    306a:	3100      	movi      	r1, 0
    306c:	e3fff8ba 	bsr      	0x21e0	// 21e0 <__muldi3>
    3070:	b806      	st.w      	r0, (r14, 0x18)
    3072:	b827      	st.w      	r1, (r14, 0x1c)
    3074:	6c97      	mov      	r2, r5
    3076:	3300      	movi      	r3, 0
    3078:	6c13      	mov      	r0, r4
    307a:	3100      	movi      	r1, 0
    307c:	e3fff8b2 	bsr      	0x21e0	// 21e0 <__muldi3>
    3080:	6401      	cmplt      	r0, r0
    3082:	6019      	addc      	r0, r6
    3084:	605d      	addc      	r1, r7
    3086:	65c4      	cmphs      	r1, r7
    3088:	0c91      	bf      	0x31aa	// 31aa <__muldf3+0x1aa>
    308a:	645e      	cmpne      	r7, r1
    308c:	0c8d      	bf      	0x31a6	// 31a6 <__muldf3+0x1a6>
    308e:	3300      	movi      	r3, 0
    3090:	3400      	movi      	r4, 0
    3092:	b862      	st.w      	r3, (r14, 0x8)
    3094:	b883      	st.w      	r4, (r14, 0xc)
    3096:	9884      	ld.w      	r4, (r14, 0x10)
    3098:	98a5      	ld.w      	r5, (r14, 0x14)
    309a:	3600      	movi      	r6, 0
    309c:	6dc3      	mov      	r7, r0
    309e:	6c93      	mov      	r2, r4
    30a0:	6cd7      	mov      	r3, r5
    30a2:	6489      	cmplt      	r2, r2
    30a4:	6099      	addc      	r2, r6
    30a6:	60dd      	addc      	r3, r7
    30a8:	6d8b      	mov      	r6, r2
    30aa:	6dcf      	mov      	r7, r3
    30ac:	6c93      	mov      	r2, r4
    30ae:	6cd7      	mov      	r3, r5
    30b0:	64dc      	cmphs      	r7, r3
    30b2:	0c70      	bf      	0x3192	// 3192 <__muldf3+0x192>
    30b4:	65ce      	cmpne      	r3, r7
    30b6:	0c6c      	bf      	0x318e	// 318e <__muldf3+0x18e>
    30b8:	6c87      	mov      	r2, r1
    30ba:	3300      	movi      	r3, 0
    30bc:	9806      	ld.w      	r0, (r14, 0x18)
    30be:	9827      	ld.w      	r1, (r14, 0x1c)
    30c0:	6401      	cmplt      	r0, r0
    30c2:	6009      	addc      	r0, r2
    30c4:	604d      	addc      	r1, r3
    30c6:	6c83      	mov      	r2, r0
    30c8:	6cc7      	mov      	r3, r1
    30ca:	9802      	ld.w      	r0, (r14, 0x8)
    30cc:	9823      	ld.w      	r1, (r14, 0xc)
    30ce:	6401      	cmplt      	r0, r0
    30d0:	6009      	addc      	r0, r2
    30d2:	604d      	addc      	r1, r3
    30d4:	6c83      	mov      	r2, r0
    30d6:	6cc7      	mov      	r3, r1
    30d8:	988e      	ld.w      	r4, (r14, 0x38)
    30da:	9833      	ld.w      	r1, (r14, 0x4c)
    30dc:	6104      	addu      	r4, r1
    30de:	5c2e      	addi      	r1, r4, 4
    30e0:	b838      	st.w      	r1, (r14, 0x60)
    30e2:	980d      	ld.w      	r0, (r14, 0x34)
    30e4:	9832      	ld.w      	r1, (r14, 0x48)
    30e6:	6442      	cmpne      	r0, r1
    30e8:	12b0      	lrw      	r5, 0x1fffffff	// 3228 <__muldf3+0x228>
    30ea:	3100      	movi      	r1, 0
    30ec:	6045      	addc      	r1, r1
    30ee:	64d4      	cmphs      	r5, r3
    30f0:	b837      	st.w      	r1, (r14, 0x5c)
    30f2:	0879      	bt      	0x31e4	// 31e4 <__muldf3+0x1e4>
    30f4:	2404      	addi      	r4, 5
    30f6:	b8a4      	st.w      	r5, (r14, 0x10)
    30f8:	3001      	movi      	r0, 1
    30fa:	3100      	movi      	r1, 0
    30fc:	6808      	and      	r0, r2
    30fe:	684c      	and      	r1, r3
    3100:	6c04      	or      	r0, r1
    3102:	3840      	cmpnei      	r0, 0
    3104:	b882      	st.w      	r4, (r14, 0x8)
    3106:	0c0e      	bf      	0x3122	// 3122 <__muldf3+0x122>
    3108:	473f      	lsli      	r1, r7, 31
    310a:	4e01      	lsri      	r0, r6, 1
    310c:	6c04      	or      	r0, r1
    310e:	4f21      	lsri      	r1, r7, 1
    3110:	b800      	st.w      	r0, (r14, 0x0)
    3112:	b821      	st.w      	r1, (r14, 0x4)
    3114:	3180      	movi      	r1, 128
    3116:	98c0      	ld.w      	r6, (r14, 0x0)
    3118:	98e1      	ld.w      	r7, (r14, 0x4)
    311a:	3000      	movi      	r0, 0
    311c:	4138      	lsli      	r1, r1, 24
    311e:	6d80      	or      	r6, r0
    3120:	6dc4      	or      	r7, r1
    3122:	4b21      	lsri      	r1, r3, 1
    3124:	43bf      	lsli      	r5, r3, 31
    3126:	4a01      	lsri      	r0, r2, 1
    3128:	6cc7      	mov      	r3, r1
    312a:	9824      	ld.w      	r1, (r14, 0x10)
    312c:	6d40      	or      	r5, r0
    312e:	64c4      	cmphs      	r1, r3
    3130:	6c97      	mov      	r2, r5
    3132:	2400      	addi      	r4, 1
    3134:	0fe2      	bf      	0x30f8	// 30f8 <__muldf3+0xf8>
    3136:	9822      	ld.w      	r1, (r14, 0x8)
    3138:	b838      	st.w      	r1, (r14, 0x60)
    313a:	30ff      	movi      	r0, 255
    313c:	3100      	movi      	r1, 0
    313e:	6808      	and      	r0, r2
    3140:	684c      	and      	r1, r3
    3142:	3480      	movi      	r4, 128
    3144:	6502      	cmpne      	r0, r4
    3146:	0c37      	bf      	0x31b4	// 31b4 <__muldf3+0x1b4>
    3148:	b859      	st.w      	r2, (r14, 0x64)
    314a:	b87a      	st.w      	r3, (r14, 0x68)
    314c:	3303      	movi      	r3, 3
    314e:	b876      	st.w      	r3, (r14, 0x58)
    3150:	1816      	addi      	r0, r14, 88
    3152:	e0000259 	bsr      	0x3604	// 3604 <__pack_d>
    3156:	141b      	addi      	r14, r14, 108
    3158:	1494      	pop      	r4-r7, r15
    315a:	3b42      	cmpnei      	r3, 2
    315c:	0c42      	bf      	0x31e0	// 31e0 <__muldf3+0x1e0>
    315e:	9872      	ld.w      	r3, (r14, 0x48)
    3160:	984d      	ld.w      	r2, (r14, 0x34)
    3162:	64ca      	cmpne      	r2, r3
    3164:	3300      	movi      	r3, 0
    3166:	60cd      	addc      	r3, r3
    3168:	1811      	addi      	r0, r14, 68
    316a:	b872      	st.w      	r3, (r14, 0x48)
    316c:	e000024c 	bsr      	0x3604	// 3604 <__pack_d>
    3170:	141b      	addi      	r14, r14, 108
    3172:	1494      	pop      	r4-r7, r15
    3174:	3a42      	cmpnei      	r2, 2
    3176:	0c35      	bf      	0x31e0	// 31e0 <__muldf3+0x1e0>
    3178:	984d      	ld.w      	r2, (r14, 0x34)
    317a:	9872      	ld.w      	r3, (r14, 0x48)
    317c:	64ca      	cmpne      	r2, r3
    317e:	3300      	movi      	r3, 0
    3180:	60cd      	addc      	r3, r3
    3182:	180c      	addi      	r0, r14, 48
    3184:	b86d      	st.w      	r3, (r14, 0x34)
    3186:	e000023f 	bsr      	0x3604	// 3604 <__pack_d>
    318a:	141b      	addi      	r14, r14, 108
    318c:	1494      	pop      	r4-r7, r15
    318e:	6498      	cmphs      	r6, r2
    3190:	0b94      	bt      	0x30b8	// 30b8 <__muldf3+0xb8>
    3192:	9882      	ld.w      	r4, (r14, 0x8)
    3194:	98a3      	ld.w      	r5, (r14, 0xc)
    3196:	3201      	movi      	r2, 1
    3198:	3300      	movi      	r3, 0
    319a:	6511      	cmplt      	r4, r4
    319c:	6109      	addc      	r4, r2
    319e:	614d      	addc      	r5, r3
    31a0:	b882      	st.w      	r4, (r14, 0x8)
    31a2:	b8a3      	st.w      	r5, (r14, 0xc)
    31a4:	078a      	br      	0x30b8	// 30b8 <__muldf3+0xb8>
    31a6:	6580      	cmphs      	r0, r6
    31a8:	0b73      	bt      	0x308e	// 308e <__muldf3+0x8e>
    31aa:	3300      	movi      	r3, 0
    31ac:	3401      	movi      	r4, 1
    31ae:	b862      	st.w      	r3, (r14, 0x8)
    31b0:	b883      	st.w      	r4, (r14, 0xc)
    31b2:	0772      	br      	0x3096	// 3096 <__muldf3+0x96>
    31b4:	3940      	cmpnei      	r1, 0
    31b6:	0bc9      	bt      	0x3148	// 3148 <__muldf3+0x148>
    31b8:	3180      	movi      	r1, 128
    31ba:	4121      	lsli      	r1, r1, 1
    31bc:	6848      	and      	r1, r2
    31be:	3940      	cmpnei      	r1, 0
    31c0:	0bc4      	bt      	0x3148	// 3148 <__muldf3+0x148>
    31c2:	6c5b      	mov      	r1, r6
    31c4:	6c5c      	or      	r1, r7
    31c6:	3940      	cmpnei      	r1, 0
    31c8:	0fc0      	bf      	0x3148	// 3148 <__muldf3+0x148>
    31ca:	3080      	movi      	r0, 128
    31cc:	3100      	movi      	r1, 0
    31ce:	6401      	cmplt      	r0, r0
    31d0:	6009      	addc      	r0, r2
    31d2:	604d      	addc      	r1, r3
    31d4:	34ff      	movi      	r4, 255
    31d6:	6d43      	mov      	r5, r0
    31d8:	6951      	andn      	r5, r4
    31da:	6c97      	mov      	r2, r5
    31dc:	6cc7      	mov      	r3, r1
    31de:	07b5      	br      	0x3148	// 3148 <__muldf3+0x148>
    31e0:	1013      	lrw      	r0, 0x8ba8	// 322c <__muldf3+0x22c>
    31e2:	07b8      	br      	0x3152	// 3152 <__muldf3+0x152>
    31e4:	1033      	lrw      	r1, 0xfffffff	// 3230 <__muldf3+0x230>
    31e6:	64c4      	cmphs      	r1, r3
    31e8:	0fa9      	bf      	0x313a	// 313a <__muldf3+0x13a>
    31ea:	2402      	addi      	r4, 3
    31ec:	b822      	st.w      	r1, (r14, 0x8)
    31ee:	4a1f      	lsri      	r0, r2, 31
    31f0:	4321      	lsli      	r1, r3, 1
    31f2:	42a1      	lsli      	r5, r2, 1
    31f4:	6c04      	or      	r0, r1
    31f6:	3fdf      	btsti      	r7, 31
    31f8:	b880      	st.w      	r4, (r14, 0x0)
    31fa:	6c97      	mov      	r2, r5
    31fc:	6cc3      	mov      	r3, r0
    31fe:	0c07      	bf      	0x320c	// 320c <__muldf3+0x20c>
    3200:	3001      	movi      	r0, 1
    3202:	3100      	movi      	r1, 0
    3204:	6c08      	or      	r0, r2
    3206:	6c4c      	or      	r1, r3
    3208:	6c83      	mov      	r2, r0
    320a:	6cc7      	mov      	r3, r1
    320c:	4721      	lsli      	r1, r7, 1
    320e:	4e1f      	lsri      	r0, r6, 31
    3210:	6c04      	or      	r0, r1
    3212:	9822      	ld.w      	r1, (r14, 0x8)
    3214:	46a1      	lsli      	r5, r6, 1
    3216:	64c4      	cmphs      	r1, r3
    3218:	6d97      	mov      	r6, r5
    321a:	6dc3      	mov      	r7, r0
    321c:	2c00      	subi      	r4, 1
    321e:	0be8      	bt      	0x31ee	// 31ee <__muldf3+0x1ee>
    3220:	9820      	ld.w      	r1, (r14, 0x0)
    3222:	b838      	st.w      	r1, (r14, 0x60)
    3224:	078b      	br      	0x313a	// 313a <__muldf3+0x13a>
    3226:	0000      	bkpt
    3228:	1fffffff 	.long	0x1fffffff
    322c:	00008ba8 	.long	0x00008ba8
    3230:	0fffffff 	.long	0x0fffffff

00003234 <__divdf3>:
    3234:	14d4      	push      	r4-r7, r15
    3236:	1432      	subi      	r14, r14, 72
    3238:	b804      	st.w      	r0, (r14, 0x10)
    323a:	b825      	st.w      	r1, (r14, 0x14)
    323c:	1804      	addi      	r0, r14, 16
    323e:	1908      	addi      	r1, r14, 32
    3240:	b867      	st.w      	r3, (r14, 0x1c)
    3242:	b846      	st.w      	r2, (r14, 0x18)
    3244:	e00002ae 	bsr      	0x37a0	// 37a0 <__unpack_d>
    3248:	190d      	addi      	r1, r14, 52
    324a:	1806      	addi      	r0, r14, 24
    324c:	e00002aa 	bsr      	0x37a0	// 37a0 <__unpack_d>
    3250:	9868      	ld.w      	r3, (r14, 0x20)
    3252:	3b01      	cmphsi      	r3, 2
    3254:	0c66      	bf      	0x3320	// 3320 <__divdf3+0xec>
    3256:	982d      	ld.w      	r1, (r14, 0x34)
    3258:	3901      	cmphsi      	r1, 2
    325a:	0c92      	bf      	0x337e	// 337e <__divdf3+0x14a>
    325c:	9849      	ld.w      	r2, (r14, 0x24)
    325e:	980e      	ld.w      	r0, (r14, 0x38)
    3260:	6c81      	xor      	r2, r0
    3262:	3b44      	cmpnei      	r3, 4
    3264:	b849      	st.w      	r2, (r14, 0x24)
    3266:	0c62      	bf      	0x332a	// 332a <__divdf3+0xf6>
    3268:	3b42      	cmpnei      	r3, 2
    326a:	0c60      	bf      	0x332a	// 332a <__divdf3+0xf6>
    326c:	3944      	cmpnei      	r1, 4
    326e:	0c62      	bf      	0x3332	// 3332 <__divdf3+0xfe>
    3270:	3942      	cmpnei      	r1, 2
    3272:	0c82      	bf      	0x3376	// 3376 <__divdf3+0x142>
    3274:	982a      	ld.w      	r1, (r14, 0x28)
    3276:	986f      	ld.w      	r3, (r14, 0x3c)
    3278:	604e      	subu      	r1, r3
    327a:	9890      	ld.w      	r4, (r14, 0x40)
    327c:	98b1      	ld.w      	r5, (r14, 0x44)
    327e:	984b      	ld.w      	r2, (r14, 0x2c)
    3280:	986c      	ld.w      	r3, (r14, 0x30)
    3282:	654c      	cmphs      	r3, r5
    3284:	b82a      	st.w      	r1, (r14, 0x28)
    3286:	6d93      	mov      	r6, r4
    3288:	6dd7      	mov      	r7, r5
    328a:	0c05      	bf      	0x3294	// 3294 <__divdf3+0x60>
    328c:	64d6      	cmpne      	r5, r3
    328e:	080b      	bt      	0x32a4	// 32a4 <__divdf3+0x70>
    3290:	6508      	cmphs      	r2, r4
    3292:	0809      	bt      	0x32a4	// 32a4 <__divdf3+0x70>
    3294:	4a9f      	lsri      	r4, r2, 31
    3296:	4301      	lsli      	r0, r3, 1
    3298:	42a1      	lsli      	r5, r2, 1
    329a:	6d00      	or      	r4, r0
    329c:	2900      	subi      	r1, 1
    329e:	6c97      	mov      	r2, r5
    32a0:	6cd3      	mov      	r3, r4
    32a2:	b82a      	st.w      	r1, (r14, 0x28)
    32a4:	3000      	movi      	r0, 0
    32a6:	3100      	movi      	r1, 0
    32a8:	b802      	st.w      	r0, (r14, 0x8)
    32aa:	b823      	st.w      	r1, (r14, 0xc)
    32ac:	3180      	movi      	r1, 128
    32ae:	343d      	movi      	r4, 61
    32b0:	3000      	movi      	r0, 0
    32b2:	4135      	lsli      	r1, r1, 21
    32b4:	b8c0      	st.w      	r6, (r14, 0x0)
    32b6:	b8e1      	st.w      	r7, (r14, 0x4)
    32b8:	98a0      	ld.w      	r5, (r14, 0x0)
    32ba:	98c1      	ld.w      	r6, (r14, 0x4)
    32bc:	658c      	cmphs      	r3, r6
    32be:	0c10      	bf      	0x32de	// 32de <__divdf3+0xaa>
    32c0:	64da      	cmpne      	r6, r3
    32c2:	0803      	bt      	0x32c8	// 32c8 <__divdf3+0x94>
    32c4:	6548      	cmphs      	r2, r5
    32c6:	0c0c      	bf      	0x32de	// 32de <__divdf3+0xaa>
    32c8:	98a2      	ld.w      	r5, (r14, 0x8)
    32ca:	98c3      	ld.w      	r6, (r14, 0xc)
    32cc:	6d40      	or      	r5, r0
    32ce:	6d84      	or      	r6, r1
    32d0:	b8a2      	st.w      	r5, (r14, 0x8)
    32d2:	b8c3      	st.w      	r6, (r14, 0xc)
    32d4:	98a0      	ld.w      	r5, (r14, 0x0)
    32d6:	98c1      	ld.w      	r6, (r14, 0x4)
    32d8:	6488      	cmphs      	r2, r2
    32da:	6097      	subc      	r2, r5
    32dc:	60db      	subc      	r3, r6
    32de:	41bf      	lsli      	r5, r1, 31
    32e0:	48e1      	lsri      	r7, r0, 1
    32e2:	6d97      	mov      	r6, r5
    32e4:	49a1      	lsri      	r5, r1, 1
    32e6:	6d9c      	or      	r6, r7
    32e8:	6c57      	mov      	r1, r5
    32ea:	4abf      	lsri      	r5, r2, 31
    32ec:	6c1b      	mov      	r0, r6
    32ee:	2c00      	subi      	r4, 1
    32f0:	6d97      	mov      	r6, r5
    32f2:	43a1      	lsli      	r5, r3, 1
    32f4:	6d94      	or      	r6, r5
    32f6:	4261      	lsli      	r3, r2, 1
    32f8:	3c40      	cmpnei      	r4, 0
    32fa:	6dcf      	mov      	r7, r3
    32fc:	6c8f      	mov      	r2, r3
    32fe:	6cdb      	mov      	r3, r6
    3300:	0bdc      	bt      	0x32b8	// 32b8 <__divdf3+0x84>
    3302:	30ff      	movi      	r0, 255
    3304:	3100      	movi      	r1, 0
    3306:	9882      	ld.w      	r4, (r14, 0x8)
    3308:	98a3      	ld.w      	r5, (r14, 0xc)
    330a:	6900      	and      	r4, r0
    330c:	6944      	and      	r5, r1
    330e:	6c13      	mov      	r0, r4
    3310:	6c57      	mov      	r1, r5
    3312:	3480      	movi      	r4, 128
    3314:	6502      	cmpne      	r0, r4
    3316:	0c15      	bf      	0x3340	// 3340 <__divdf3+0x10c>
    3318:	9862      	ld.w      	r3, (r14, 0x8)
    331a:	9883      	ld.w      	r4, (r14, 0xc)
    331c:	b86b      	st.w      	r3, (r14, 0x2c)
    331e:	b88c      	st.w      	r4, (r14, 0x30)
    3320:	1808      	addi      	r0, r14, 32
    3322:	e0000171 	bsr      	0x3604	// 3604 <__pack_d>
    3326:	1412      	addi      	r14, r14, 72
    3328:	1494      	pop      	r4-r7, r15
    332a:	644e      	cmpne      	r3, r1
    332c:	0bfa      	bt      	0x3320	// 3320 <__divdf3+0xec>
    332e:	1016      	lrw      	r0, 0x8ba8	// 3384 <__divdf3+0x150>
    3330:	07f9      	br      	0x3322	// 3322 <__divdf3+0xee>
    3332:	3300      	movi      	r3, 0
    3334:	3400      	movi      	r4, 0
    3336:	b86b      	st.w      	r3, (r14, 0x2c)
    3338:	b88c      	st.w      	r4, (r14, 0x30)
    333a:	b86a      	st.w      	r3, (r14, 0x28)
    333c:	1808      	addi      	r0, r14, 32
    333e:	07f2      	br      	0x3322	// 3322 <__divdf3+0xee>
    3340:	3940      	cmpnei      	r1, 0
    3342:	0beb      	bt      	0x3318	// 3318 <__divdf3+0xe4>
    3344:	3180      	movi      	r1, 128
    3346:	4121      	lsli      	r1, r1, 1
    3348:	9882      	ld.w      	r4, (r14, 0x8)
    334a:	98a3      	ld.w      	r5, (r14, 0xc)
    334c:	6850      	and      	r1, r4
    334e:	3940      	cmpnei      	r1, 0
    3350:	0be4      	bt      	0x3318	// 3318 <__divdf3+0xe4>
    3352:	6c98      	or      	r2, r6
    3354:	3a40      	cmpnei      	r2, 0
    3356:	0fe1      	bf      	0x3318	// 3318 <__divdf3+0xe4>
    3358:	3280      	movi      	r2, 128
    335a:	3300      	movi      	r3, 0
    335c:	6c13      	mov      	r0, r4
    335e:	6c57      	mov      	r1, r5
    3360:	6401      	cmplt      	r0, r0
    3362:	6009      	addc      	r0, r2
    3364:	604d      	addc      	r1, r3
    3366:	6c83      	mov      	r2, r0
    3368:	6cc7      	mov      	r3, r1
    336a:	6c0b      	mov      	r0, r2
    336c:	31ff      	movi      	r1, 255
    336e:	6805      	andn      	r0, r1
    3370:	b802      	st.w      	r0, (r14, 0x8)
    3372:	b863      	st.w      	r3, (r14, 0xc)
    3374:	07d2      	br      	0x3318	// 3318 <__divdf3+0xe4>
    3376:	3304      	movi      	r3, 4
    3378:	b868      	st.w      	r3, (r14, 0x20)
    337a:	1808      	addi      	r0, r14, 32
    337c:	07d3      	br      	0x3322	// 3322 <__divdf3+0xee>
    337e:	180d      	addi      	r0, r14, 52
    3380:	07d1      	br      	0x3322	// 3322 <__divdf3+0xee>
    3382:	0000      	bkpt
    3384:	00008ba8 	.long	0x00008ba8

00003388 <__gedf2>:
    3388:	14d0      	push      	r15
    338a:	142e      	subi      	r14, r14, 56
    338c:	b800      	st.w      	r0, (r14, 0x0)
    338e:	b821      	st.w      	r1, (r14, 0x4)
    3390:	6c3b      	mov      	r0, r14
    3392:	1904      	addi      	r1, r14, 16
    3394:	b863      	st.w      	r3, (r14, 0xc)
    3396:	b842      	st.w      	r2, (r14, 0x8)
    3398:	e0000204 	bsr      	0x37a0	// 37a0 <__unpack_d>
    339c:	1909      	addi      	r1, r14, 36
    339e:	1802      	addi      	r0, r14, 8
    33a0:	e0000200 	bsr      	0x37a0	// 37a0 <__unpack_d>
    33a4:	9864      	ld.w      	r3, (r14, 0x10)
    33a6:	3b01      	cmphsi      	r3, 2
    33a8:	0c0a      	bf      	0x33bc	// 33bc <__gedf2+0x34>
    33aa:	9869      	ld.w      	r3, (r14, 0x24)
    33ac:	3b01      	cmphsi      	r3, 2
    33ae:	0c07      	bf      	0x33bc	// 33bc <__gedf2+0x34>
    33b0:	1909      	addi      	r1, r14, 36
    33b2:	1804      	addi      	r0, r14, 16
    33b4:	e0000258 	bsr      	0x3864	// 3864 <__fpcmp_parts_d>
    33b8:	140e      	addi      	r14, r14, 56
    33ba:	1490      	pop      	r15
    33bc:	3000      	movi      	r0, 0
    33be:	2800      	subi      	r0, 1
    33c0:	140e      	addi      	r14, r14, 56
    33c2:	1490      	pop      	r15

000033c4 <__fixdfsi>:
    33c4:	14d0      	push      	r15
    33c6:	1427      	subi      	r14, r14, 28
    33c8:	b800      	st.w      	r0, (r14, 0x0)
    33ca:	b821      	st.w      	r1, (r14, 0x4)
    33cc:	6c3b      	mov      	r0, r14
    33ce:	1902      	addi      	r1, r14, 8
    33d0:	e00001e8 	bsr      	0x37a0	// 37a0 <__unpack_d>
    33d4:	9862      	ld.w      	r3, (r14, 0x8)
    33d6:	3b02      	cmphsi      	r3, 3
    33d8:	0c20      	bf      	0x3418	// 3418 <__fixdfsi+0x54>
    33da:	3b44      	cmpnei      	r3, 4
    33dc:	0c16      	bf      	0x3408	// 3408 <__fixdfsi+0x44>
    33de:	9864      	ld.w      	r3, (r14, 0x10)
    33e0:	3bdf      	btsti      	r3, 31
    33e2:	081b      	bt      	0x3418	// 3418 <__fixdfsi+0x54>
    33e4:	3b3e      	cmplti      	r3, 31
    33e6:	0c11      	bf      	0x3408	// 3408 <__fixdfsi+0x44>
    33e8:	323c      	movi      	r2, 60
    33ea:	5a6d      	subu      	r3, r2, r3
    33ec:	3200      	movi      	r2, 0
    33ee:	2a1f      	subi      	r2, 32
    33f0:	608c      	addu      	r2, r3
    33f2:	3adf      	btsti      	r2, 31
    33f4:	0815      	bt      	0x341e	// 341e <__fixdfsi+0x5a>
    33f6:	9806      	ld.w      	r0, (r14, 0x18)
    33f8:	7009      	lsr      	r0, r2
    33fa:	9863      	ld.w      	r3, (r14, 0xc)
    33fc:	3b40      	cmpnei      	r3, 0
    33fe:	0c0b      	bf      	0x3414	// 3414 <__fixdfsi+0x50>
    3400:	3300      	movi      	r3, 0
    3402:	5b01      	subu      	r0, r3, r0
    3404:	1407      	addi      	r14, r14, 28
    3406:	1490      	pop      	r15
    3408:	9863      	ld.w      	r3, (r14, 0xc)
    340a:	3b40      	cmpnei      	r3, 0
    340c:	3000      	movi      	r0, 0
    340e:	6001      	addc      	r0, r0
    3410:	1068      	lrw      	r3, 0x7fffffff	// 3430 <__fixdfsi+0x6c>
    3412:	600c      	addu      	r0, r3
    3414:	1407      	addi      	r14, r14, 28
    3416:	1490      	pop      	r15
    3418:	3000      	movi      	r0, 0
    341a:	1407      	addi      	r14, r14, 28
    341c:	1490      	pop      	r15
    341e:	9846      	ld.w      	r2, (r14, 0x18)
    3420:	311f      	movi      	r1, 31
    3422:	4241      	lsli      	r2, r2, 1
    3424:	604e      	subu      	r1, r3
    3426:	9805      	ld.w      	r0, (r14, 0x14)
    3428:	7084      	lsl      	r2, r1
    342a:	700d      	lsr      	r0, r3
    342c:	6c08      	or      	r0, r2
    342e:	07e6      	br      	0x33fa	// 33fa <__fixdfsi+0x36>
    3430:	7fffffff 	.long	0x7fffffff

00003434 <__floatunsidf>:
    3434:	14d2      	push      	r4-r5, r15
    3436:	1425      	subi      	r14, r14, 20
    3438:	3840      	cmpnei      	r0, 0
    343a:	3500      	movi      	r5, 0
    343c:	6d03      	mov      	r4, r0
    343e:	b8a1      	st.w      	r5, (r14, 0x4)
    3440:	0c15      	bf      	0x346a	// 346a <__floatunsidf+0x36>
    3442:	3303      	movi      	r3, 3
    3444:	b860      	st.w      	r3, (r14, 0x0)
    3446:	e0000021 	bsr      	0x3488	// 3488 <__clzsi2>
    344a:	321d      	movi      	r2, 29
    344c:	6080      	addu      	r2, r0
    344e:	2802      	subi      	r0, 3
    3450:	38df      	btsti      	r0, 31
    3452:	0813      	bt      	0x3478	// 3478 <__floatunsidf+0x44>
    3454:	7100      	lsl      	r4, r0
    3456:	b884      	st.w      	r4, (r14, 0x10)
    3458:	b8a3      	st.w      	r5, (r14, 0xc)
    345a:	333c      	movi      	r3, 60
    345c:	60ca      	subu      	r3, r2
    345e:	6c3b      	mov      	r0, r14
    3460:	b862      	st.w      	r3, (r14, 0x8)
    3462:	e00000d1 	bsr      	0x3604	// 3604 <__pack_d>
    3466:	1405      	addi      	r14, r14, 20
    3468:	1492      	pop      	r4-r5, r15
    346a:	3302      	movi      	r3, 2
    346c:	6c3b      	mov      	r0, r14
    346e:	b860      	st.w      	r3, (r14, 0x0)
    3470:	e00000ca 	bsr      	0x3604	// 3604 <__pack_d>
    3474:	1405      	addi      	r14, r14, 20
    3476:	1492      	pop      	r4-r5, r15
    3478:	311f      	movi      	r1, 31
    347a:	4c61      	lsri      	r3, r4, 1
    347c:	604a      	subu      	r1, r2
    347e:	70c5      	lsr      	r3, r1
    3480:	7108      	lsl      	r4, r2
    3482:	b864      	st.w      	r3, (r14, 0x10)
    3484:	b883      	st.w      	r4, (r14, 0xc)
    3486:	07ea      	br      	0x345a	// 345a <__floatunsidf+0x26>

00003488 <__clzsi2>:
    3488:	106d      	lrw      	r3, 0xffff	// 34bc <__clzsi2+0x34>
    348a:	640c      	cmphs      	r3, r0
    348c:	0c07      	bf      	0x349a	// 349a <__clzsi2+0x12>
    348e:	33ff      	movi      	r3, 255
    3490:	640c      	cmphs      	r3, r0
    3492:	0c0f      	bf      	0x34b0	// 34b0 <__clzsi2+0x28>
    3494:	3320      	movi      	r3, 32
    3496:	3200      	movi      	r2, 0
    3498:	0406      	br      	0x34a4	// 34a4 <__clzsi2+0x1c>
    349a:	106a      	lrw      	r3, 0xffffff	// 34c0 <__clzsi2+0x38>
    349c:	640c      	cmphs      	r3, r0
    349e:	080c      	bt      	0x34b6	// 34b6 <__clzsi2+0x2e>
    34a0:	3308      	movi      	r3, 8
    34a2:	3218      	movi      	r2, 24
    34a4:	7009      	lsr      	r0, r2
    34a6:	1048      	lrw      	r2, 0x8bbc	// 34c4 <__clzsi2+0x3c>
    34a8:	6008      	addu      	r0, r2
    34aa:	8040      	ld.b      	r2, (r0, 0x0)
    34ac:	5b09      	subu      	r0, r3, r2
    34ae:	783c      	jmp      	r15
    34b0:	3318      	movi      	r3, 24
    34b2:	3208      	movi      	r2, 8
    34b4:	07f8      	br      	0x34a4	// 34a4 <__clzsi2+0x1c>
    34b6:	3310      	movi      	r3, 16
    34b8:	3210      	movi      	r2, 16
    34ba:	07f5      	br      	0x34a4	// 34a4 <__clzsi2+0x1c>
    34bc:	0000ffff 	.long	0x0000ffff
    34c0:	00ffffff 	.long	0x00ffffff
    34c4:	00008bbc 	.long	0x00008bbc

000034c8 <__pack_f>:
    34c8:	14c2      	push      	r4-r5
    34ca:	9040      	ld.w      	r2, (r0, 0x0)
    34cc:	3a01      	cmphsi      	r2, 2
    34ce:	9063      	ld.w      	r3, (r0, 0xc)
    34d0:	9021      	ld.w      	r1, (r0, 0x4)
    34d2:	0c27      	bf      	0x3520	// 3520 <__pack_f+0x58>
    34d4:	3a44      	cmpnei      	r2, 4
    34d6:	0c22      	bf      	0x351a	// 351a <__pack_f+0x52>
    34d8:	3a42      	cmpnei      	r2, 2
    34da:	0c1d      	bf      	0x3514	// 3514 <__pack_f+0x4c>
    34dc:	3b40      	cmpnei      	r3, 0
    34de:	0c1b      	bf      	0x3514	// 3514 <__pack_f+0x4c>
    34e0:	3400      	movi      	r4, 0
    34e2:	9042      	ld.w      	r2, (r0, 0x8)
    34e4:	2c7d      	subi      	r4, 126
    34e6:	6509      	cmplt      	r2, r4
    34e8:	082a      	bt      	0x353c	// 353c <__pack_f+0x74>
    34ea:	347f      	movi      	r4, 127
    34ec:	6491      	cmplt      	r4, r2
    34ee:	0816      	bt      	0x351a	// 351a <__pack_f+0x52>
    34f0:	690c      	and      	r4, r3
    34f2:	3540      	movi      	r5, 64
    34f4:	6552      	cmpne      	r4, r5
    34f6:	0c1a      	bf      	0x352a	// 352a <__pack_f+0x62>
    34f8:	233e      	addi      	r3, 63
    34fa:	3bdf      	btsti      	r3, 31
    34fc:	081d      	bt      	0x3536	// 3536 <__pack_f+0x6e>
    34fe:	227e      	addi      	r2, 127
    3500:	4302      	lsli      	r0, r3, 2
    3502:	4809      	lsri      	r0, r0, 9
    3504:	74c8      	zextb      	r3, r2
    3506:	4009      	lsli      	r0, r0, 9
    3508:	4377      	lsli      	r3, r3, 23
    350a:	4809      	lsri      	r0, r0, 9
    350c:	413f      	lsli      	r1, r1, 31
    350e:	6c0c      	or      	r0, r3
    3510:	6c04      	or      	r0, r1
    3512:	1482      	pop      	r4-r5
    3514:	3300      	movi      	r3, 0
    3516:	3000      	movi      	r0, 0
    3518:	07f7      	br      	0x3506	// 3506 <__pack_f+0x3e>
    351a:	33ff      	movi      	r3, 255
    351c:	3000      	movi      	r0, 0
    351e:	07f4      	br      	0x3506	// 3506 <__pack_f+0x3e>
    3520:	4303      	lsli      	r0, r3, 3
    3522:	480a      	lsri      	r0, r0, 10
    3524:	38b6      	bseti      	r0, 22
    3526:	33ff      	movi      	r3, 255
    3528:	07ef      	br      	0x3506	// 3506 <__pack_f+0x3e>
    352a:	3080      	movi      	r0, 128
    352c:	680c      	and      	r0, r3
    352e:	3840      	cmpnei      	r0, 0
    3530:	0fe5      	bf      	0x34fa	// 34fa <__pack_f+0x32>
    3532:	60d0      	addu      	r3, r4
    3534:	07e3      	br      	0x34fa	// 34fa <__pack_f+0x32>
    3536:	4b61      	lsri      	r3, r3, 1
    3538:	227f      	addi      	r2, 128
    353a:	07e3      	br      	0x3500	// 3500 <__pack_f+0x38>
    353c:	610a      	subu      	r4, r2
    353e:	3c39      	cmplti      	r4, 26
    3540:	0fea      	bf      	0x3514	// 3514 <__pack_f+0x4c>
    3542:	3201      	movi      	r2, 1
    3544:	7090      	lsl      	r2, r4
    3546:	2a00      	subi      	r2, 1
    3548:	6c0f      	mov      	r0, r3
    354a:	68c8      	and      	r3, r2
    354c:	3b40      	cmpnei      	r3, 0
    354e:	3300      	movi      	r3, 0
    3550:	7011      	lsr      	r0, r4
    3552:	60cd      	addc      	r3, r3
    3554:	6cc0      	or      	r3, r0
    3556:	307f      	movi      	r0, 127
    3558:	680c      	and      	r0, r3
    355a:	3240      	movi      	r2, 64
    355c:	6482      	cmpne      	r0, r2
    355e:	080d      	bt      	0x3578	// 3578 <__pack_f+0xb0>
    3560:	3280      	movi      	r2, 128
    3562:	688c      	and      	r2, r3
    3564:	3a40      	cmpnei      	r2, 0
    3566:	0c02      	bf      	0x356a	// 356a <__pack_f+0xa2>
    3568:	60c0      	addu      	r3, r0
    356a:	1045      	lrw      	r2, 0x3fffffff	// 357c <__pack_f+0xb4>
    356c:	64c8      	cmphs      	r2, r3
    356e:	4302      	lsli      	r0, r3, 2
    3570:	64c3      	mvcv      	r3
    3572:	4809      	lsri      	r0, r0, 9
    3574:	74cc      	zextb      	r3, r3
    3576:	07c8      	br      	0x3506	// 3506 <__pack_f+0x3e>
    3578:	233e      	addi      	r3, 63
    357a:	07f8      	br      	0x356a	// 356a <__pack_f+0xa2>
    357c:	3fffffff 	.long	0x3fffffff

00003580 <__unpack_f>:
    3580:	14c1      	push      	r4
    3582:	8861      	ld.h      	r3, (r0, 0x2)
    3584:	4371      	lsli      	r3, r3, 17
    3586:	9040      	ld.w      	r2, (r0, 0x0)
    3588:	4b78      	lsri      	r3, r3, 24
    358a:	8003      	ld.b      	r0, (r0, 0x3)
    358c:	4249      	lsli      	r2, r2, 9
    358e:	4807      	lsri      	r0, r0, 7
    3590:	3b40      	cmpnei      	r3, 0
    3592:	4a49      	lsri      	r2, r2, 9
    3594:	b101      	st.w      	r0, (r1, 0x4)
    3596:	0811      	bt      	0x35b8	// 35b8 <__unpack_f+0x38>
    3598:	3a40      	cmpnei      	r2, 0
    359a:	0c1a      	bf      	0x35ce	// 35ce <__unpack_f+0x4e>
    359c:	3303      	movi      	r3, 3
    359e:	b160      	st.w      	r3, (r1, 0x0)
    35a0:	3300      	movi      	r3, 0
    35a2:	4247      	lsli      	r2, r2, 7
    35a4:	2b7e      	subi      	r3, 127
    35a6:	1096      	lrw      	r4, 0x3fffffff	// 35fc <__unpack_f+0x7c>
    35a8:	4241      	lsli      	r2, r2, 1
    35aa:	6490      	cmphs      	r4, r2
    35ac:	6c0f      	mov      	r0, r3
    35ae:	2b00      	subi      	r3, 1
    35b0:	0bfc      	bt      	0x35a8	// 35a8 <__unpack_f+0x28>
    35b2:	b102      	st.w      	r0, (r1, 0x8)
    35b4:	b143      	st.w      	r2, (r1, 0xc)
    35b6:	1481      	pop      	r4
    35b8:	30ff      	movi      	r0, 255
    35ba:	640e      	cmpne      	r3, r0
    35bc:	0c0c      	bf      	0x35d4	// 35d4 <__unpack_f+0x54>
    35be:	2b7e      	subi      	r3, 127
    35c0:	4247      	lsli      	r2, r2, 7
    35c2:	b162      	st.w      	r3, (r1, 0x8)
    35c4:	3abe      	bseti      	r2, 30
    35c6:	3303      	movi      	r3, 3
    35c8:	b160      	st.w      	r3, (r1, 0x0)
    35ca:	b143      	st.w      	r2, (r1, 0xc)
    35cc:	1481      	pop      	r4
    35ce:	3302      	movi      	r3, 2
    35d0:	b160      	st.w      	r3, (r1, 0x0)
    35d2:	1481      	pop      	r4
    35d4:	3a40      	cmpnei      	r2, 0
    35d6:	0c0d      	bf      	0x35f0	// 35f0 <__unpack_f+0x70>
    35d8:	3380      	movi      	r3, 128
    35da:	436f      	lsli      	r3, r3, 15
    35dc:	68c8      	and      	r3, r2
    35de:	3b40      	cmpnei      	r3, 0
    35e0:	0c0b      	bf      	0x35f6	// 35f6 <__unpack_f+0x76>
    35e2:	3301      	movi      	r3, 1
    35e4:	b160      	st.w      	r3, (r1, 0x0)
    35e6:	1067      	lrw      	r3, 0x2000007f	// 3600 <__unpack_f+0x80>
    35e8:	4247      	lsli      	r2, r2, 7
    35ea:	688d      	andn      	r2, r3
    35ec:	b143      	st.w      	r2, (r1, 0xc)
    35ee:	1481      	pop      	r4
    35f0:	3304      	movi      	r3, 4
    35f2:	b160      	st.w      	r3, (r1, 0x0)
    35f4:	1481      	pop      	r4
    35f6:	b160      	st.w      	r3, (r1, 0x0)
    35f8:	07f7      	br      	0x35e6	// 35e6 <__unpack_f+0x66>
    35fa:	0000      	bkpt
    35fc:	3fffffff 	.long	0x3fffffff
    3600:	2000007f 	.long	0x2000007f

00003604 <__pack_d>:
    3604:	14c4      	push      	r4-r7
    3606:	1422      	subi      	r14, r14, 8
    3608:	9060      	ld.w      	r3, (r0, 0x0)
    360a:	3b01      	cmphsi      	r3, 2
    360c:	90c3      	ld.w      	r6, (r0, 0xc)
    360e:	90e4      	ld.w      	r7, (r0, 0x10)
    3610:	9021      	ld.w      	r1, (r0, 0x4)
    3612:	0c46      	bf      	0x369e	// 369e <__pack_d+0x9a>
    3614:	3b44      	cmpnei      	r3, 4
    3616:	0c40      	bf      	0x3696	// 3696 <__pack_d+0x92>
    3618:	3b42      	cmpnei      	r3, 2
    361a:	0c27      	bf      	0x3668	// 3668 <__pack_d+0x64>
    361c:	6cdb      	mov      	r3, r6
    361e:	6cdc      	or      	r3, r7
    3620:	3b40      	cmpnei      	r3, 0
    3622:	0c23      	bf      	0x3668	// 3668 <__pack_d+0x64>
    3624:	9062      	ld.w      	r3, (r0, 0x8)
    3626:	125a      	lrw      	r2, 0xfffffc02	// 378c <__pack_d+0x188>
    3628:	648d      	cmplt      	r3, r2
    362a:	0855      	bt      	0x36d4	// 36d4 <__pack_d+0xd0>
    362c:	1259      	lrw      	r2, 0x3ff	// 3790 <__pack_d+0x18c>
    362e:	64c9      	cmplt      	r2, r3
    3630:	0833      	bt      	0x3696	// 3696 <__pack_d+0x92>
    3632:	34ff      	movi      	r4, 255
    3634:	3500      	movi      	r5, 0
    3636:	6918      	and      	r4, r6
    3638:	695c      	and      	r5, r7
    363a:	3280      	movi      	r2, 128
    363c:	6492      	cmpne      	r4, r2
    363e:	0c3f      	bf      	0x36bc	// 36bc <__pack_d+0xb8>
    3640:	347f      	movi      	r4, 127
    3642:	3500      	movi      	r5, 0
    3644:	6599      	cmplt      	r6, r6
    3646:	6191      	addc      	r6, r4
    3648:	61d5      	addc      	r7, r5
    364a:	1253      	lrw      	r2, 0x1fffffff	// 3794 <__pack_d+0x190>
    364c:	65c8      	cmphs      	r2, r7
    364e:	0c1a      	bf      	0x3682	// 3682 <__pack_d+0x7e>
    3650:	1290      	lrw      	r4, 0x3ff	// 3790 <__pack_d+0x18c>
    3652:	610c      	addu      	r4, r3
    3654:	4718      	lsli      	r0, r7, 24
    3656:	4f68      	lsri      	r3, r7, 8
    3658:	4e48      	lsri      	r2, r6, 8
    365a:	6c80      	or      	r2, r0
    365c:	430c      	lsli      	r0, r3, 12
    365e:	486c      	lsri      	r3, r0, 12
    3660:	120e      	lrw      	r0, 0x7ff	// 3798 <__pack_d+0x194>
    3662:	6d4b      	mov      	r5, r2
    3664:	6900      	and      	r4, r0
    3666:	0404      	br      	0x366e	// 366e <__pack_d+0x6a>
    3668:	3400      	movi      	r4, 0
    366a:	3200      	movi      	r2, 0
    366c:	3300      	movi      	r3, 0
    366e:	430c      	lsli      	r0, r3, 12
    3670:	480c      	lsri      	r0, r0, 12
    3672:	4474      	lsli      	r3, r4, 20
    3674:	419f      	lsli      	r4, r1, 31
    3676:	6c43      	mov      	r1, r0
    3678:	6c4c      	or      	r1, r3
    367a:	6c50      	or      	r1, r4
    367c:	6c0b      	mov      	r0, r2
    367e:	1402      	addi      	r14, r14, 8
    3680:	1484      	pop      	r4-r7
    3682:	479f      	lsli      	r4, r7, 31
    3684:	4e01      	lsri      	r0, r6, 1
    3686:	6d00      	or      	r4, r0
    3688:	6d93      	mov      	r6, r4
    368a:	3480      	movi      	r4, 128
    368c:	4f41      	lsri      	r2, r7, 1
    368e:	4483      	lsli      	r4, r4, 3
    3690:	6dcb      	mov      	r7, r2
    3692:	610c      	addu      	r4, r3
    3694:	07e0      	br      	0x3654	// 3654 <__pack_d+0x50>
    3696:	1281      	lrw      	r4, 0x7ff	// 3798 <__pack_d+0x194>
    3698:	3200      	movi      	r2, 0
    369a:	3300      	movi      	r3, 0
    369c:	07e9      	br      	0x366e	// 366e <__pack_d+0x6a>
    369e:	4e08      	lsri      	r0, r6, 8
    36a0:	4798      	lsli      	r4, r7, 24
    36a2:	6d00      	or      	r4, r0
    36a4:	3580      	movi      	r5, 128
    36a6:	4705      	lsli      	r0, r7, 5
    36a8:	6c93      	mov      	r2, r4
    36aa:	486d      	lsri      	r3, r0, 13
    36ac:	3400      	movi      	r4, 0
    36ae:	45ac      	lsli      	r5, r5, 12
    36b0:	6c90      	or      	r2, r4
    36b2:	6cd4      	or      	r3, r5
    36b4:	430c      	lsli      	r0, r3, 12
    36b6:	486c      	lsri      	r3, r0, 12
    36b8:	1198      	lrw      	r4, 0x7ff	// 3798 <__pack_d+0x194>
    36ba:	07da      	br      	0x366e	// 366e <__pack_d+0x6a>
    36bc:	3d40      	cmpnei      	r5, 0
    36be:	0bc1      	bt      	0x3640	// 3640 <__pack_d+0x3c>
    36c0:	4241      	lsli      	r2, r2, 1
    36c2:	6898      	and      	r2, r6
    36c4:	3a40      	cmpnei      	r2, 0
    36c6:	0fc2      	bf      	0x364a	// 364a <__pack_d+0x46>
    36c8:	3480      	movi      	r4, 128
    36ca:	3500      	movi      	r5, 0
    36cc:	6599      	cmplt      	r6, r6
    36ce:	6191      	addc      	r6, r4
    36d0:	61d5      	addc      	r7, r5
    36d2:	07bc      	br      	0x364a	// 364a <__pack_d+0x46>
    36d4:	5a6d      	subu      	r3, r2, r3
    36d6:	3238      	movi      	r2, 56
    36d8:	64c9      	cmplt      	r2, r3
    36da:	0bc7      	bt      	0x3668	// 3668 <__pack_d+0x64>
    36dc:	3200      	movi      	r2, 0
    36de:	2a1f      	subi      	r2, 32
    36e0:	608c      	addu      	r2, r3
    36e2:	3adf      	btsti      	r2, 31
    36e4:	0848      	bt      	0x3774	// 3774 <__pack_d+0x170>
    36e6:	6c1f      	mov      	r0, r7
    36e8:	7009      	lsr      	r0, r2
    36ea:	b800      	st.w      	r0, (r14, 0x0)
    36ec:	3000      	movi      	r0, 0
    36ee:	b801      	st.w      	r0, (r14, 0x4)
    36f0:	3adf      	btsti      	r2, 31
    36f2:	083c      	bt      	0x376a	// 376a <__pack_d+0x166>
    36f4:	3301      	movi      	r3, 1
    36f6:	70c8      	lsl      	r3, r2
    36f8:	6d4f      	mov      	r5, r3
    36fa:	3300      	movi      	r3, 0
    36fc:	6d0f      	mov      	r4, r3
    36fe:	3200      	movi      	r2, 0
    3700:	3300      	movi      	r3, 0
    3702:	2a00      	subi      	r2, 1
    3704:	2b00      	subi      	r3, 1
    3706:	6511      	cmplt      	r4, r4
    3708:	6109      	addc      	r4, r2
    370a:	614d      	addc      	r5, r3
    370c:	6990      	and      	r6, r4
    370e:	69d4      	and      	r7, r5
    3710:	6d9c      	or      	r6, r7
    3712:	3e40      	cmpnei      	r6, 0
    3714:	3000      	movi      	r0, 0
    3716:	6001      	addc      	r0, r0
    3718:	6c83      	mov      	r2, r0
    371a:	3300      	movi      	r3, 0
    371c:	9880      	ld.w      	r4, (r14, 0x0)
    371e:	98a1      	ld.w      	r5, (r14, 0x4)
    3720:	6d08      	or      	r4, r2
    3722:	6d4c      	or      	r5, r3
    3724:	32ff      	movi      	r2, 255
    3726:	3300      	movi      	r3, 0
    3728:	6890      	and      	r2, r4
    372a:	68d4      	and      	r3, r5
    372c:	3080      	movi      	r0, 128
    372e:	640a      	cmpne      	r2, r0
    3730:	081b      	bt      	0x3766	// 3766 <__pack_d+0x162>
    3732:	3b40      	cmpnei      	r3, 0
    3734:	0819      	bt      	0x3766	// 3766 <__pack_d+0x162>
    3736:	3380      	movi      	r3, 128
    3738:	4361      	lsli      	r3, r3, 1
    373a:	68d0      	and      	r3, r4
    373c:	3b40      	cmpnei      	r3, 0
    373e:	0c06      	bf      	0x374a	// 374a <__pack_d+0x146>
    3740:	3280      	movi      	r2, 128
    3742:	3300      	movi      	r3, 0
    3744:	6511      	cmplt      	r4, r4
    3746:	6109      	addc      	r4, r2
    3748:	614d      	addc      	r5, r3
    374a:	4518      	lsli      	r0, r5, 24
    374c:	4c48      	lsri      	r2, r4, 8
    374e:	4d68      	lsri      	r3, r5, 8
    3750:	1093      	lrw      	r4, 0xfffffff	// 379c <__pack_d+0x198>
    3752:	6c80      	or      	r2, r0
    3754:	6550      	cmphs      	r4, r5
    3756:	430c      	lsli      	r0, r3, 12
    3758:	486c      	lsri      	r3, r0, 12
    375a:	3001      	movi      	r0, 1
    375c:	0c02      	bf      	0x3760	// 3760 <__pack_d+0x15c>
    375e:	3000      	movi      	r0, 0
    3760:	108e      	lrw      	r4, 0x7ff	// 3798 <__pack_d+0x194>
    3762:	6900      	and      	r4, r0
    3764:	0785      	br      	0x366e	// 366e <__pack_d+0x6a>
    3766:	327f      	movi      	r2, 127
    3768:	07ed      	br      	0x3742	// 3742 <__pack_d+0x13e>
    376a:	3201      	movi      	r2, 1
    376c:	708c      	lsl      	r2, r3
    376e:	3500      	movi      	r5, 0
    3770:	6d0b      	mov      	r4, r2
    3772:	07c6      	br      	0x36fe	// 36fe <__pack_d+0xfa>
    3774:	341f      	movi      	r4, 31
    3776:	610e      	subu      	r4, r3
    3778:	4701      	lsli      	r0, r7, 1
    377a:	7010      	lsl      	r0, r4
    377c:	6d1b      	mov      	r4, r6
    377e:	710d      	lsr      	r4, r3
    3780:	6d00      	or      	r4, r0
    3782:	6c1f      	mov      	r0, r7
    3784:	700d      	lsr      	r0, r3
    3786:	b880      	st.w      	r4, (r14, 0x0)
    3788:	b801      	st.w      	r0, (r14, 0x4)
    378a:	07b3      	br      	0x36f0	// 36f0 <__pack_d+0xec>
    378c:	fffffc02 	.long	0xfffffc02
    3790:	000003ff 	.long	0x000003ff
    3794:	1fffffff 	.long	0x1fffffff
    3798:	000007ff 	.long	0x000007ff
    379c:	0fffffff 	.long	0x0fffffff

000037a0 <__unpack_d>:
    37a0:	1423      	subi      	r14, r14, 12
    37a2:	b880      	st.w      	r4, (r14, 0x0)
    37a4:	b8c1      	st.w      	r6, (r14, 0x4)
    37a6:	b8e2      	st.w      	r7, (r14, 0x8)
    37a8:	8843      	ld.h      	r2, (r0, 0x6)
    37aa:	4251      	lsli      	r2, r2, 17
    37ac:	9061      	ld.w      	r3, (r0, 0x4)
    37ae:	9080      	ld.w      	r4, (r0, 0x0)
    37b0:	4a55      	lsri      	r2, r2, 21
    37b2:	8007      	ld.b      	r0, (r0, 0x7)
    37b4:	436c      	lsli      	r3, r3, 12
    37b6:	4807      	lsri      	r0, r0, 7
    37b8:	3a40      	cmpnei      	r2, 0
    37ba:	4b6c      	lsri      	r3, r3, 12
    37bc:	b101      	st.w      	r0, (r1, 0x4)
    37be:	0819      	bt      	0x37f0	// 37f0 <__unpack_d+0x50>
    37c0:	6c93      	mov      	r2, r4
    37c2:	6c8c      	or      	r2, r3
    37c4:	3a40      	cmpnei      	r2, 0
    37c6:	0c2d      	bf      	0x3820	// 3820 <__unpack_d+0x80>
    37c8:	4c58      	lsri      	r2, r4, 24
    37ca:	4368      	lsli      	r3, r3, 8
    37cc:	6cc8      	or      	r3, r2
    37ce:	3203      	movi      	r2, 3
    37d0:	4408      	lsli      	r0, r4, 8
    37d2:	b140      	st.w      	r2, (r1, 0x0)
    37d4:	1181      	lrw      	r4, 0xfffffc01	// 3858 <__unpack_d+0xb8>
    37d6:	11c2      	lrw      	r6, 0xfffffff	// 385c <__unpack_d+0xbc>
    37d8:	485f      	lsri      	r2, r0, 31
    37da:	4361      	lsli      	r3, r3, 1
    37dc:	6cc8      	or      	r3, r2
    37de:	64d8      	cmphs      	r6, r3
    37e0:	6c93      	mov      	r2, r4
    37e2:	4001      	lsli      	r0, r0, 1
    37e4:	2c00      	subi      	r4, 1
    37e6:	0bf9      	bt      	0x37d8	// 37d8 <__unpack_d+0x38>
    37e8:	b142      	st.w      	r2, (r1, 0x8)
    37ea:	b103      	st.w      	r0, (r1, 0xc)
    37ec:	b164      	st.w      	r3, (r1, 0x10)
    37ee:	0414      	br      	0x3816	// 3816 <__unpack_d+0x76>
    37f0:	101c      	lrw      	r0, 0x7ff	// 3860 <__unpack_d+0xc0>
    37f2:	640a      	cmpne      	r2, r0
    37f4:	0c19      	bf      	0x3826	// 3826 <__unpack_d+0x86>
    37f6:	1019      	lrw      	r0, 0xfffffc01	// 3858 <__unpack_d+0xb8>
    37f8:	6080      	addu      	r2, r0
    37fa:	b142      	st.w      	r2, (r1, 0x8)
    37fc:	3203      	movi      	r2, 3
    37fe:	43e8      	lsli      	r7, r3, 8
    3800:	b140      	st.w      	r2, (r1, 0x0)
    3802:	3380      	movi      	r3, 128
    3804:	4c58      	lsri      	r2, r4, 24
    3806:	6dc8      	or      	r7, r2
    3808:	44c8      	lsli      	r6, r4, 8
    380a:	3200      	movi      	r2, 0
    380c:	4375      	lsli      	r3, r3, 21
    380e:	6d88      	or      	r6, r2
    3810:	6dcc      	or      	r7, r3
    3812:	b1c3      	st.w      	r6, (r1, 0xc)
    3814:	b1e4      	st.w      	r7, (r1, 0x10)
    3816:	98e2      	ld.w      	r7, (r14, 0x8)
    3818:	98c1      	ld.w      	r6, (r14, 0x4)
    381a:	9880      	ld.w      	r4, (r14, 0x0)
    381c:	1403      	addi      	r14, r14, 12
    381e:	783c      	jmp      	r15
    3820:	3302      	movi      	r3, 2
    3822:	b160      	st.w      	r3, (r1, 0x0)
    3824:	07f9      	br      	0x3816	// 3816 <__unpack_d+0x76>
    3826:	6c93      	mov      	r2, r4
    3828:	6c8c      	or      	r2, r3
    382a:	3a40      	cmpnei      	r2, 0
    382c:	0c10      	bf      	0x384c	// 384c <__unpack_d+0xac>
    382e:	3280      	movi      	r2, 128
    3830:	424c      	lsli      	r2, r2, 12
    3832:	688c      	and      	r2, r3
    3834:	3a40      	cmpnei      	r2, 0
    3836:	0c0e      	bf      	0x3852	// 3852 <__unpack_d+0xb2>
    3838:	3201      	movi      	r2, 1
    383a:	b140      	st.w      	r2, (r1, 0x0)
    383c:	4c58      	lsri      	r2, r4, 24
    383e:	4368      	lsli      	r3, r3, 8
    3840:	6cc8      	or      	r3, r2
    3842:	4408      	lsli      	r0, r4, 8
    3844:	3b9b      	bclri      	r3, 27
    3846:	b103      	st.w      	r0, (r1, 0xc)
    3848:	b164      	st.w      	r3, (r1, 0x10)
    384a:	07e6      	br      	0x3816	// 3816 <__unpack_d+0x76>
    384c:	3304      	movi      	r3, 4
    384e:	b160      	st.w      	r3, (r1, 0x0)
    3850:	07e3      	br      	0x3816	// 3816 <__unpack_d+0x76>
    3852:	b140      	st.w      	r2, (r1, 0x0)
    3854:	07f4      	br      	0x383c	// 383c <__unpack_d+0x9c>
    3856:	0000      	bkpt
    3858:	fffffc01 	.long	0xfffffc01
    385c:	0fffffff 	.long	0x0fffffff
    3860:	000007ff 	.long	0x000007ff

00003864 <__fpcmp_parts_d>:
    3864:	14c1      	push      	r4
    3866:	9060      	ld.w      	r3, (r0, 0x0)
    3868:	3b01      	cmphsi      	r3, 2
    386a:	0c12      	bf      	0x388e	// 388e <__fpcmp_parts_d+0x2a>
    386c:	9140      	ld.w      	r2, (r1, 0x0)
    386e:	3a01      	cmphsi      	r2, 2
    3870:	0c0f      	bf      	0x388e	// 388e <__fpcmp_parts_d+0x2a>
    3872:	3b44      	cmpnei      	r3, 4
    3874:	0c17      	bf      	0x38a2	// 38a2 <__fpcmp_parts_d+0x3e>
    3876:	3a44      	cmpnei      	r2, 4
    3878:	0c0f      	bf      	0x3896	// 3896 <__fpcmp_parts_d+0x32>
    387a:	3b42      	cmpnei      	r3, 2
    387c:	0c0b      	bf      	0x3892	// 3892 <__fpcmp_parts_d+0x2e>
    387e:	3a42      	cmpnei      	r2, 2
    3880:	0c13      	bf      	0x38a6	// 38a6 <__fpcmp_parts_d+0x42>
    3882:	9061      	ld.w      	r3, (r0, 0x4)
    3884:	9141      	ld.w      	r2, (r1, 0x4)
    3886:	648e      	cmpne      	r3, r2
    3888:	0c14      	bf      	0x38b0	// 38b0 <__fpcmp_parts_d+0x4c>
    388a:	3b40      	cmpnei      	r3, 0
    388c:	0808      	bt      	0x389c	// 389c <__fpcmp_parts_d+0x38>
    388e:	3001      	movi      	r0, 1
    3890:	1481      	pop      	r4
    3892:	3a42      	cmpnei      	r2, 2
    3894:	0c28      	bf      	0x38e4	// 38e4 <__fpcmp_parts_d+0x80>
    3896:	9161      	ld.w      	r3, (r1, 0x4)
    3898:	3b40      	cmpnei      	r3, 0
    389a:	0bfa      	bt      	0x388e	// 388e <__fpcmp_parts_d+0x2a>
    389c:	3000      	movi      	r0, 0
    389e:	2800      	subi      	r0, 1
    38a0:	1481      	pop      	r4
    38a2:	3a44      	cmpnei      	r2, 4
    38a4:	0c22      	bf      	0x38e8	// 38e8 <__fpcmp_parts_d+0x84>
    38a6:	9061      	ld.w      	r3, (r0, 0x4)
    38a8:	3b40      	cmpnei      	r3, 0
    38aa:	0bf9      	bt      	0x389c	// 389c <__fpcmp_parts_d+0x38>
    38ac:	3001      	movi      	r0, 1
    38ae:	07f1      	br      	0x3890	// 3890 <__fpcmp_parts_d+0x2c>
    38b0:	9082      	ld.w      	r4, (r0, 0x8)
    38b2:	9142      	ld.w      	r2, (r1, 0x8)
    38b4:	6509      	cmplt      	r2, r4
    38b6:	0bea      	bt      	0x388a	// 388a <__fpcmp_parts_d+0x26>
    38b8:	6491      	cmplt      	r4, r2
    38ba:	080d      	bt      	0x38d4	// 38d4 <__fpcmp_parts_d+0x70>
    38bc:	9044      	ld.w      	r2, (r0, 0x10)
    38be:	9083      	ld.w      	r4, (r0, 0xc)
    38c0:	9103      	ld.w      	r0, (r1, 0xc)
    38c2:	9124      	ld.w      	r1, (r1, 0x10)
    38c4:	6484      	cmphs      	r1, r2
    38c6:	0fe2      	bf      	0x388a	// 388a <__fpcmp_parts_d+0x26>
    38c8:	644a      	cmpne      	r2, r1
    38ca:	0803      	bt      	0x38d0	// 38d0 <__fpcmp_parts_d+0x6c>
    38cc:	6500      	cmphs      	r0, r4
    38ce:	0fde      	bf      	0x388a	// 388a <__fpcmp_parts_d+0x26>
    38d0:	6448      	cmphs      	r2, r1
    38d2:	0805      	bt      	0x38dc	// 38dc <__fpcmp_parts_d+0x78>
    38d4:	3b40      	cmpnei      	r3, 0
    38d6:	0fe3      	bf      	0x389c	// 389c <__fpcmp_parts_d+0x38>
    38d8:	3001      	movi      	r0, 1
    38da:	07db      	br      	0x3890	// 3890 <__fpcmp_parts_d+0x2c>
    38dc:	6486      	cmpne      	r1, r2
    38de:	0803      	bt      	0x38e4	// 38e4 <__fpcmp_parts_d+0x80>
    38e0:	6410      	cmphs      	r4, r0
    38e2:	0ff9      	bf      	0x38d4	// 38d4 <__fpcmp_parts_d+0x70>
    38e4:	3000      	movi      	r0, 0
    38e6:	1481      	pop      	r4
    38e8:	9161      	ld.w      	r3, (r1, 0x4)
    38ea:	9041      	ld.w      	r2, (r0, 0x4)
    38ec:	5b09      	subu      	r0, r3, r2
    38ee:	1481      	pop      	r4

000038f0 <__cskyvprintfprintf>:
    38f0:	1424      	subi      	r14, r14, 16
    38f2:	b863      	st.w      	r3, (r14, 0xc)
    38f4:	b842      	st.w      	r2, (r14, 0x8)
    38f6:	b821      	st.w      	r1, (r14, 0x4)
    38f8:	b800      	st.w      	r0, (r14, 0x0)
    38fa:	14d0      	push      	r15
    38fc:	1421      	subi      	r14, r14, 4
    38fe:	9802      	ld.w      	r0, (r14, 0x8)
    3900:	1903      	addi      	r1, r14, 12
    3902:	b800      	st.w      	r0, (r14, 0x0)
    3904:	e000002e 	bsr      	0x3960	// 3960 <__cskyvprintfvprintf>
    3908:	1401      	addi      	r14, r14, 4
    390a:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    390e:	1405      	addi      	r14, r14, 20
    3910:	783c      	jmp      	r15
	...

00003914 <__GI_puts>:
    3914:	14d1      	push      	r4, r15
    3916:	1085      	lrw      	r4, 0x200001d8	// 3928 <__GI_puts+0x14>
    3918:	9420      	ld.w      	r1, (r4, 0x0)
    391a:	e0000033 	bsr      	0x3980	// 3980 <__GI_fputs>
    391e:	9420      	ld.w      	r1, (r4, 0x0)
    3920:	300a      	movi      	r0, 10
    3922:	e0001341 	bsr      	0x5fa4	// 5fa4 <fputc>
    3926:	1491      	pop      	r4, r15
    3928:	200001d8 	.long	0x200001d8

0000392c <__stdio_outs>:
    392c:	14d3      	push      	r4-r6, r15
    392e:	10ac      	lrw      	r5, 0x200001d8	// 395c <__stdio_outs+0x30>
    3930:	6d03      	mov      	r4, r0
    3932:	9500      	ld.w      	r0, (r5, 0x0)
    3934:	6d87      	mov      	r6, r1
    3936:	2017      	addi      	r0, 24
    3938:	e00000fc 	bsr      	0x3b30	// 3b30 <__GI_os_critical_enter>
    393c:	6190      	addu      	r6, r4
    393e:	6592      	cmpne      	r4, r6
    3940:	0807      	bt      	0x394e	// 394e <__stdio_outs+0x22>
    3942:	9500      	ld.w      	r0, (r5, 0x0)
    3944:	2017      	addi      	r0, 24
    3946:	e00000f7 	bsr      	0x3b34	// 3b34 <__GI_os_critical_exit>
    394a:	3001      	movi      	r0, 1
    394c:	1493      	pop      	r4-r6, r15
    394e:	8400      	ld.b      	r0, (r4, 0x0)
    3950:	9520      	ld.w      	r1, (r5, 0x0)
    3952:	e0001329 	bsr      	0x5fa4	// 5fa4 <fputc>
    3956:	2400      	addi      	r4, 1
    3958:	07f3      	br      	0x393e	// 393e <__stdio_outs+0x12>
    395a:	0000      	bkpt
    395c:	200001d8 	.long	0x200001d8

00003960 <__cskyvprintfvprintf>:
    3960:	14d0      	push      	r15
    3962:	1422      	subi      	r14, r14, 8
    3964:	6c87      	mov      	r2, r1
    3966:	1026      	lrw      	r1, 0x392c	// 397c <__cskyvprintfvprintf+0x1c>
    3968:	3300      	movi      	r3, 0
    396a:	b821      	st.w      	r1, (r14, 0x4)
    396c:	6c43      	mov      	r1, r0
    396e:	6c3b      	mov      	r0, r14
    3970:	b860      	st.w      	r3, (r14, 0x0)
    3972:	e00000ff 	bsr      	0x3b70	// 3b70 <__v2_printf>
    3976:	1402      	addi      	r14, r14, 8
    3978:	1490      	pop      	r15
    397a:	0000      	bkpt
    397c:	0000392c 	.long	0x0000392c

00003980 <__GI_fputs>:
    3980:	14d4      	push      	r4-r7, r15
    3982:	1422      	subi      	r14, r14, 8
    3984:	3940      	cmpnei      	r1, 0
    3986:	6dc3      	mov      	r7, r0
    3988:	6d87      	mov      	r6, r1
    398a:	0806      	bt      	0x3996	// 3996 <__GI_fputs+0x16>
    398c:	3400      	movi      	r4, 0
    398e:	2c00      	subi      	r4, 1
    3990:	6c13      	mov      	r0, r4
    3992:	1402      	addi      	r14, r14, 8
    3994:	1494      	pop      	r4-r7, r15
    3996:	3018      	movi      	r0, 24
    3998:	6004      	addu      	r0, r1
    399a:	b800      	st.w      	r0, (r14, 0x0)
    399c:	e00000ca 	bsr      	0x3b30	// 3b30 <__GI_os_critical_enter>
    39a0:	3200      	movi      	r2, 0
    39a2:	6d5f      	mov      	r5, r7
    39a4:	2a00      	subi      	r2, 1
    39a6:	8500      	ld.b      	r0, (r5, 0x0)
    39a8:	3840      	cmpnei      	r0, 0
    39aa:	5d9d      	subu      	r4, r5, r7
    39ac:	0805      	bt      	0x39b6	// 39b6 <__GI_fputs+0x36>
    39ae:	9800      	ld.w      	r0, (r14, 0x0)
    39b0:	e00000c2 	bsr      	0x3b34	// 3b34 <__GI_os_critical_exit>
    39b4:	07ee      	br      	0x3990	// 3990 <__GI_fputs+0x10>
    39b6:	6c5b      	mov      	r1, r6
    39b8:	b841      	st.w      	r2, (r14, 0x4)
    39ba:	e00012f5 	bsr      	0x5fa4	// 5fa4 <fputc>
    39be:	9841      	ld.w      	r2, (r14, 0x4)
    39c0:	6482      	cmpne      	r0, r2
    39c2:	0fe5      	bf      	0x398c	// 398c <__GI_fputs+0xc>
    39c4:	2500      	addi      	r5, 1
    39c6:	07f0      	br      	0x39a6	// 39a6 <__GI_fputs+0x26>

000039c8 <__memset_fast>:
    39c8:	14c3      	push      	r4-r6
    39ca:	7444      	zextb      	r1, r1
    39cc:	3a40      	cmpnei      	r2, 0
    39ce:	0c1f      	bf      	0x3a0c	// 3a0c <__memset_fast+0x44>
    39d0:	6d43      	mov      	r5, r0
    39d2:	6d03      	mov      	r4, r0
    39d4:	3603      	movi      	r6, 3
    39d6:	6918      	and      	r4, r6
    39d8:	3c40      	cmpnei      	r4, 0
    39da:	0c1a      	bf      	0x3a0e	// 3a0e <__memset_fast+0x46>
    39dc:	a520      	st.b      	r1, (r5, 0x0)
    39de:	2a00      	subi      	r2, 1
    39e0:	3a40      	cmpnei      	r2, 0
    39e2:	0c15      	bf      	0x3a0c	// 3a0c <__memset_fast+0x44>
    39e4:	2500      	addi      	r5, 1
    39e6:	6d17      	mov      	r4, r5
    39e8:	3603      	movi      	r6, 3
    39ea:	6918      	and      	r4, r6
    39ec:	3c40      	cmpnei      	r4, 0
    39ee:	0c10      	bf      	0x3a0e	// 3a0e <__memset_fast+0x46>
    39f0:	a520      	st.b      	r1, (r5, 0x0)
    39f2:	2a00      	subi      	r2, 1
    39f4:	3a40      	cmpnei      	r2, 0
    39f6:	0c0b      	bf      	0x3a0c	// 3a0c <__memset_fast+0x44>
    39f8:	2500      	addi      	r5, 1
    39fa:	6d17      	mov      	r4, r5
    39fc:	3603      	movi      	r6, 3
    39fe:	6918      	and      	r4, r6
    3a00:	3c40      	cmpnei      	r4, 0
    3a02:	0c06      	bf      	0x3a0e	// 3a0e <__memset_fast+0x46>
    3a04:	a520      	st.b      	r1, (r5, 0x0)
    3a06:	2a00      	subi      	r2, 1
    3a08:	2500      	addi      	r5, 1
    3a0a:	0402      	br      	0x3a0e	// 3a0e <__memset_fast+0x46>
    3a0c:	1483      	pop      	r4-r6
    3a0e:	4168      	lsli      	r3, r1, 8
    3a10:	6c4c      	or      	r1, r3
    3a12:	4170      	lsli      	r3, r1, 16
    3a14:	6c4c      	or      	r1, r3
    3a16:	3a2f      	cmplti      	r2, 16
    3a18:	0809      	bt      	0x3a2a	// 3a2a <__memset_fast+0x62>
    3a1a:	b520      	st.w      	r1, (r5, 0x0)
    3a1c:	b521      	st.w      	r1, (r5, 0x4)
    3a1e:	b522      	st.w      	r1, (r5, 0x8)
    3a20:	b523      	st.w      	r1, (r5, 0xc)
    3a22:	2a0f      	subi      	r2, 16
    3a24:	250f      	addi      	r5, 16
    3a26:	3a2f      	cmplti      	r2, 16
    3a28:	0ff9      	bf      	0x3a1a	// 3a1a <__memset_fast+0x52>
    3a2a:	3a23      	cmplti      	r2, 4
    3a2c:	0806      	bt      	0x3a38	// 3a38 <__memset_fast+0x70>
    3a2e:	2a03      	subi      	r2, 4
    3a30:	b520      	st.w      	r1, (r5, 0x0)
    3a32:	2503      	addi      	r5, 4
    3a34:	3a23      	cmplti      	r2, 4
    3a36:	0ffc      	bf      	0x3a2e	// 3a2e <__memset_fast+0x66>
    3a38:	3a40      	cmpnei      	r2, 0
    3a3a:	0fe9      	bf      	0x3a0c	// 3a0c <__memset_fast+0x44>
    3a3c:	2a00      	subi      	r2, 1
    3a3e:	a520      	st.b      	r1, (r5, 0x0)
    3a40:	3a40      	cmpnei      	r2, 0
    3a42:	0fe5      	bf      	0x3a0c	// 3a0c <__memset_fast+0x44>
    3a44:	2a00      	subi      	r2, 1
    3a46:	a521      	st.b      	r1, (r5, 0x1)
    3a48:	3a40      	cmpnei      	r2, 0
    3a4a:	0fe1      	bf      	0x3a0c	// 3a0c <__memset_fast+0x44>
    3a4c:	a522      	st.b      	r1, (r5, 0x2)
    3a4e:	1483      	pop      	r4-r6

00003a50 <__strlen_fast>:
    3a50:	6c43      	mov      	r1, r0
    3a52:	3203      	movi      	r2, 3
    3a54:	6808      	and      	r0, r2
    3a56:	3840      	cmpnei      	r0, 0
    3a58:	0c08      	bf      	0x3a68	// 3a68 <__strlen_fast+0x18>
    3a5a:	3000      	movi      	r0, 0
    3a5c:	8140      	ld.b      	r2, (r1, 0x0)
    3a5e:	3a40      	cmpnei      	r2, 0
    3a60:	0c20      	bf      	0x3aa0	// 3aa0 <__strlen_fast+0x50>
    3a62:	2100      	addi      	r1, 1
    3a64:	2000      	addi      	r0, 1
    3a66:	07fb      	br      	0x3a5c	// 3a5c <__strlen_fast+0xc>
    3a68:	9140      	ld.w      	r2, (r1, 0x0)
    3a6a:	680b      	tstnbz      	r2
    3a6c:	0c04      	bf      	0x3a74	// 3a74 <__strlen_fast+0x24>
    3a6e:	2103      	addi      	r1, 4
    3a70:	2003      	addi      	r0, 4
    3a72:	07fb      	br      	0x3a68	// 3a68 <__strlen_fast+0x18>
    3a74:	31ff      	movi      	r1, 255
    3a76:	6ccb      	mov      	r3, r2
    3a78:	68c4      	and      	r3, r1
    3a7a:	3b40      	cmpnei      	r3, 0
    3a7c:	0c12      	bf      	0x3aa0	// 3aa0 <__strlen_fast+0x50>
    3a7e:	2000      	addi      	r0, 1
    3a80:	3110      	movi      	r1, 16
    3a82:	6ccb      	mov      	r3, r2
    3a84:	70c4      	lsl      	r3, r1
    3a86:	3118      	movi      	r1, 24
    3a88:	70c5      	lsr      	r3, r1
    3a8a:	3b40      	cmpnei      	r3, 0
    3a8c:	0c0a      	bf      	0x3aa0	// 3aa0 <__strlen_fast+0x50>
    3a8e:	2000      	addi      	r0, 1
    3a90:	3108      	movi      	r1, 8
    3a92:	6ccb      	mov      	r3, r2
    3a94:	70c4      	lsl      	r3, r1
    3a96:	3118      	movi      	r1, 24
    3a98:	70c5      	lsr      	r3, r1
    3a9a:	3b40      	cmpnei      	r3, 0
    3a9c:	0c02      	bf      	0x3aa0	// 3aa0 <__strlen_fast+0x50>
    3a9e:	2000      	addi      	r0, 1
    3aa0:	783c      	jmp      	r15
	...

00003aa4 <__GI_strstr>:
    3aa4:	14c2      	push      	r4-r5
    3aa6:	6d07      	mov      	r4, r1
    3aa8:	6d43      	mov      	r5, r0
    3aaa:	8440      	ld.b      	r2, (r4, 0x0)
    3aac:	3a40      	cmpnei      	r2, 0
    3aae:	0c0c      	bf      	0x3ac6	// 3ac6 <__GI_strstr+0x22>
    3ab0:	8560      	ld.b      	r3, (r5, 0x0)
    3ab2:	64ca      	cmpne      	r2, r3
    3ab4:	0804      	bt      	0x3abc	// 3abc <__GI_strstr+0x18>
    3ab6:	2400      	addi      	r4, 1
    3ab8:	2500      	addi      	r5, 1
    3aba:	07f8      	br      	0x3aaa	// 3aaa <__GI_strstr+0x6>
    3abc:	3b40      	cmpnei      	r3, 0
    3abe:	0c03      	bf      	0x3ac4	// 3ac4 <__GI_strstr+0x20>
    3ac0:	2000      	addi      	r0, 1
    3ac2:	07f2      	br      	0x3aa6	// 3aa6 <__GI_strstr+0x2>
    3ac4:	6c0f      	mov      	r0, r3
    3ac6:	1482      	pop      	r4-r5

00003ac8 <__memcpy_fast>:
    3ac8:	14c3      	push      	r4-r6
    3aca:	6d83      	mov      	r6, r0
    3acc:	6d07      	mov      	r4, r1
    3ace:	6d18      	or      	r4, r6
    3ad0:	3303      	movi      	r3, 3
    3ad2:	690c      	and      	r4, r3
    3ad4:	3c40      	cmpnei      	r4, 0
    3ad6:	0c0b      	bf      	0x3aec	// 3aec <__memcpy_fast+0x24>
    3ad8:	3a40      	cmpnei      	r2, 0
    3ada:	0c08      	bf      	0x3aea	// 3aea <__memcpy_fast+0x22>
    3adc:	8160      	ld.b      	r3, (r1, 0x0)
    3ade:	2100      	addi      	r1, 1
    3ae0:	2a00      	subi      	r2, 1
    3ae2:	a660      	st.b      	r3, (r6, 0x0)
    3ae4:	2600      	addi      	r6, 1
    3ae6:	3a40      	cmpnei      	r2, 0
    3ae8:	0bfa      	bt      	0x3adc	// 3adc <__memcpy_fast+0x14>
    3aea:	1483      	pop      	r4-r6
    3aec:	3a2f      	cmplti      	r2, 16
    3aee:	080e      	bt      	0x3b0a	// 3b0a <__memcpy_fast+0x42>
    3af0:	91a0      	ld.w      	r5, (r1, 0x0)
    3af2:	9161      	ld.w      	r3, (r1, 0x4)
    3af4:	9182      	ld.w      	r4, (r1, 0x8)
    3af6:	b6a0      	st.w      	r5, (r6, 0x0)
    3af8:	91a3      	ld.w      	r5, (r1, 0xc)
    3afa:	b661      	st.w      	r3, (r6, 0x4)
    3afc:	b682      	st.w      	r4, (r6, 0x8)
    3afe:	b6a3      	st.w      	r5, (r6, 0xc)
    3b00:	2a0f      	subi      	r2, 16
    3b02:	210f      	addi      	r1, 16
    3b04:	260f      	addi      	r6, 16
    3b06:	3a2f      	cmplti      	r2, 16
    3b08:	0ff4      	bf      	0x3af0	// 3af0 <__memcpy_fast+0x28>
    3b0a:	3a23      	cmplti      	r2, 4
    3b0c:	0808      	bt      	0x3b1c	// 3b1c <__memcpy_fast+0x54>
    3b0e:	9160      	ld.w      	r3, (r1, 0x0)
    3b10:	2a03      	subi      	r2, 4
    3b12:	2103      	addi      	r1, 4
    3b14:	b660      	st.w      	r3, (r6, 0x0)
    3b16:	2603      	addi      	r6, 4
    3b18:	3a23      	cmplti      	r2, 4
    3b1a:	0ffa      	bf      	0x3b0e	// 3b0e <__memcpy_fast+0x46>
    3b1c:	3a40      	cmpnei      	r2, 0
    3b1e:	0fe6      	bf      	0x3aea	// 3aea <__memcpy_fast+0x22>
    3b20:	8160      	ld.b      	r3, (r1, 0x0)
    3b22:	2100      	addi      	r1, 1
    3b24:	2a00      	subi      	r2, 1
    3b26:	a660      	st.b      	r3, (r6, 0x0)
    3b28:	2600      	addi      	r6, 1
    3b2a:	07f9      	br      	0x3b1c	// 3b1c <__memcpy_fast+0x54>

00003b2c <__GI_os_critical_open>:
    3b2c:	3000      	movi      	r0, 0
    3b2e:	783c      	jmp      	r15

00003b30 <__GI_os_critical_enter>:
    3b30:	3000      	movi      	r0, 0
    3b32:	783c      	jmp      	r15

00003b34 <__GI_os_critical_exit>:
    3b34:	3000      	movi      	r0, 0
    3b36:	783c      	jmp      	r15

00003b38 <__GI_os_critical_close>:
    3b38:	3000      	movi      	r0, 0
    3b3a:	783c      	jmp      	r15

00003b3c <PAD.1851>:
    3b3c:	14d4      	push      	r4-r7, r15
    3b3e:	3820      	cmplti      	r0, 1
    3b40:	6d03      	mov      	r4, r0
    3b42:	6d47      	mov      	r5, r1
    3b44:	6df7      	mov      	r7, r13
    3b46:	080d      	bt      	0x3b60	// 3b60 <PAD.1851+0x24>
    3b48:	6d83      	mov      	r6, r0
    3b4a:	3e30      	cmplti      	r6, 17
    3b4c:	9700      	ld.w      	r0, (r7, 0x0)
    3b4e:	0c0a      	bf      	0x3b62	// 3b62 <PAD.1851+0x26>
    3b50:	5c63      	subi      	r3, r4, 1
    3b52:	4b24      	lsri      	r1, r3, 4
    3b54:	4164      	lsli      	r3, r1, 4
    3b56:	9040      	ld.w      	r2, (r0, 0x0)
    3b58:	5c2d      	subu      	r1, r4, r3
    3b5a:	9081      	ld.w      	r4, (r0, 0x4)
    3b5c:	6c17      	mov      	r0, r5
    3b5e:	7bd1      	jsr      	r4
    3b60:	1494      	pop      	r4-r7, r15
    3b62:	9040      	ld.w      	r2, (r0, 0x0)
    3b64:	9061      	ld.w      	r3, (r0, 0x4)
    3b66:	3110      	movi      	r1, 16
    3b68:	6c17      	mov      	r0, r5
    3b6a:	7bcd      	jsr      	r3
    3b6c:	2e0f      	subi      	r6, 16
    3b6e:	07ee      	br      	0x3b4a	// 3b4a <PAD.1851+0xe>

00003b70 <__v2_printf>:
    3b70:	14d4      	push      	r4-r7, r15
    3b72:	143c      	subi      	r14, r14, 112
    3b74:	b826      	st.w      	r1, (r14, 0x18)
    3b76:	1912      	addi      	r1, r14, 72
    3b78:	1b21      	addi      	r3, r14, 132
    3b7a:	b810      	st.w      	r0, (r14, 0x40)
    3b7c:	2100      	addi      	r1, 1
    3b7e:	3000      	movi      	r0, 0
    3b80:	6d4b      	mov      	r5, r2
    3b82:	b871      	st.w      	r3, (r14, 0x44)
    3b84:	b80a      	st.w      	r0, (r14, 0x28)
    3b86:	b809      	st.w      	r0, (r14, 0x24)
    3b88:	b82d      	st.w      	r1, (r14, 0x34)
    3b8a:	9886      	ld.w      	r4, (r14, 0x18)
    3b8c:	3325      	movi      	r3, 37
    3b8e:	84c0      	ld.b      	r6, (r4, 0x0)
    3b90:	3e40      	cmpnei      	r6, 0
    3b92:	0c03      	bf      	0x3b98	// 3b98 <__v2_printf+0x28>
    3b94:	64da      	cmpne      	r6, r3
    3b96:	0845      	bt      	0x3c20	// 3c20 <__v2_printf+0xb0>
    3b98:	9846      	ld.w      	r2, (r14, 0x18)
    3b9a:	5cc9      	subu      	r6, r4, r2
    3b9c:	3e40      	cmpnei      	r6, 0
    3b9e:	0c0a      	bf      	0x3bb2	// 3bb2 <__v2_printf+0x42>
    3ba0:	9870      	ld.w      	r3, (r14, 0x40)
    3ba2:	9340      	ld.w      	r2, (r3, 0x0)
    3ba4:	6c5b      	mov      	r1, r6
    3ba6:	9361      	ld.w      	r3, (r3, 0x4)
    3ba8:	9806      	ld.w      	r0, (r14, 0x18)
    3baa:	7bcd      	jsr      	r3
    3bac:	9809      	ld.w      	r0, (r14, 0x24)
    3bae:	6018      	addu      	r0, r6
    3bb0:	b809      	st.w      	r0, (r14, 0x24)
    3bb2:	8420      	ld.b      	r1, (r4, 0x0)
    3bb4:	3940      	cmpnei      	r1, 0
    3bb6:	0803      	bt      	0x3bbc	// 3bbc <__v2_printf+0x4c>
    3bb8:	e8000367 	br      	0x4286	// 4286 <__v2_printf+0x716>
    3bbc:	3637      	movi      	r6, 55
    3bbe:	1a01      	addi      	r2, r14, 4
    3bc0:	3700      	movi      	r7, 0
    3bc2:	6188      	addu      	r6, r2
    3bc4:	a6e0      	st.b      	r7, (r6, 0x0)
    3bc6:	3300      	movi      	r3, 0
    3bc8:	3600      	movi      	r6, 0
    3bca:	2400      	addi      	r4, 1
    3bcc:	3000      	movi      	r0, 0
    3bce:	3100      	movi      	r1, 0
    3bd0:	2e00      	subi      	r6, 1
    3bd2:	b867      	st.w      	r3, (r14, 0x1c)
    3bd4:	3700      	movi      	r7, 0
    3bd6:	5c42      	addi      	r2, r4, 1
    3bd8:	b846      	st.w      	r2, (r14, 0x18)
    3bda:	8480      	ld.b      	r4, (r4, 0x0)
    3bdc:	3364      	movi      	r3, 100
    3bde:	64d2      	cmpne      	r4, r3
    3be0:	0d90      	bf      	0x3f00	// 3f00 <__v2_printf+0x390>
    3be2:	650d      	cmplt      	r3, r4
    3be4:	084e      	bt      	0x3c80	// 3c80 <__v2_printf+0x110>
    3be6:	322e      	movi      	r2, 46
    3be8:	6492      	cmpne      	r4, r2
    3bea:	0d41      	bf      	0x3e6c	// 3e6c <__v2_printf+0x2fc>
    3bec:	6509      	cmplt      	r2, r4
    3bee:	0829      	bt      	0x3c40	// 3c40 <__v2_printf+0xd0>
    3bf0:	332a      	movi      	r3, 42
    3bf2:	64d2      	cmpne      	r4, r3
    3bf4:	0d31      	bf      	0x3e56	// 3e56 <__v2_printf+0x2e6>
    3bf6:	650d      	cmplt      	r3, r4
    3bf8:	081c      	bt      	0x3c30	// 3c30 <__v2_printf+0xc0>
    3bfa:	3220      	movi      	r2, 32
    3bfc:	6492      	cmpne      	r4, r2
    3bfe:	0d25      	bf      	0x3e48	// 3e48 <__v2_printf+0x2d8>
    3c00:	3323      	movi      	r3, 35
    3c02:	64d2      	cmpne      	r4, r3
    3c04:	0d27      	bf      	0x3e52	// 3e52 <__v2_printf+0x2e2>
    3c06:	3c40      	cmpnei      	r4, 0
    3c08:	0803      	bt      	0x3c0e	// 3c0e <__v2_printf+0x9e>
    3c0a:	e800033e 	br      	0x4286	// 4286 <__v2_printf+0x716>
    3c0e:	1e12      	addi      	r6, r14, 72
    3c10:	3037      	movi      	r0, 55
    3c12:	1a01      	addi      	r2, r14, 4
    3c14:	a680      	st.b      	r4, (r6, 0x0)
    3c16:	6008      	addu      	r0, r2
    3c18:	3400      	movi      	r4, 0
    3c1a:	a080      	st.b      	r4, (r0, 0x0)
    3c1c:	b8a5      	st.w      	r5, (r14, 0x14)
    3c1e:	042c      	br      	0x3c76	// 3c76 <__v2_printf+0x106>
    3c20:	2400      	addi      	r4, 1
    3c22:	07b6      	br      	0x3b8e	// 3b8e <__v2_printf+0x1e>
    3c24:	3001      	movi      	r0, 1
    3c26:	312b      	movi      	r1, 43
    3c28:	9886      	ld.w      	r4, (r14, 0x18)
    3c2a:	07d6      	br      	0x3bd6	// 3bd6 <__v2_printf+0x66>
    3c2c:	6d4f      	mov      	r5, r3
    3c2e:	07fd      	br      	0x3c28	// 3c28 <__v2_printf+0xb8>
    3c30:	322b      	movi      	r2, 43
    3c32:	6492      	cmpne      	r4, r2
    3c34:	0ff8      	bf      	0x3c24	// 3c24 <__v2_printf+0xb4>
    3c36:	332d      	movi      	r3, 45
    3c38:	64d2      	cmpne      	r4, r3
    3c3a:	0be6      	bt      	0x3c06	// 3c06 <__v2_printf+0x96>
    3c3c:	3fa2      	bseti      	r7, 2
    3c3e:	07f5      	br      	0x3c28	// 3c28 <__v2_printf+0xb8>
    3c40:	3339      	movi      	r3, 57
    3c42:	650d      	cmplt      	r3, r4
    3c44:	0809      	bt      	0x3c56	// 3c56 <__v2_printf+0xe6>
    3c46:	3231      	movi      	r2, 49
    3c48:	6491      	cmplt      	r4, r2
    3c4a:	0d34      	bf      	0x3eb2	// 3eb2 <__v2_printf+0x342>
    3c4c:	3330      	movi      	r3, 48
    3c4e:	64d2      	cmpne      	r4, r3
    3c50:	0bdb      	bt      	0x3c06	// 3c06 <__v2_printf+0x96>
    3c52:	3fa7      	bseti      	r7, 7
    3c54:	07ea      	br      	0x3c28	// 3c28 <__v2_printf+0xb8>
    3c56:	3258      	movi      	r2, 88
    3c58:	6492      	cmpne      	r4, r2
    3c5a:	0cd3      	bf      	0x3e00	// 3e00 <__v2_printf+0x290>
    3c5c:	3063      	movi      	r0, 99
    3c5e:	6412      	cmpne      	r4, r0
    3c60:	0bd3      	bt      	0x3c06	// 3c06 <__v2_printf+0x96>
    3c62:	3337      	movi      	r3, 55
    3c64:	1a01      	addi      	r2, r14, 4
    3c66:	5d2e      	addi      	r1, r5, 4
    3c68:	85c0      	ld.b      	r6, (r5, 0x0)
    3c6a:	3400      	movi      	r4, 0
    3c6c:	1d12      	addi      	r5, r14, 72
    3c6e:	60c8      	addu      	r3, r2
    3c70:	b825      	st.w      	r1, (r14, 0x14)
    3c72:	a5c0      	st.b      	r6, (r5, 0x0)
    3c74:	a380      	st.b      	r4, (r3, 0x0)
    3c76:	3601      	movi      	r6, 1
    3c78:	3500      	movi      	r5, 0
    3c7a:	1c12      	addi      	r4, r14, 72
    3c7c:	e8000295 	br      	0x41a6	// 41a6 <__v2_printf+0x636>
    3c80:	336d      	movi      	r3, 109
    3c82:	64d2      	cmpne      	r4, r3
    3c84:	0d2d      	bf      	0x3ede	// 3ede <__v2_printf+0x36e>
    3c86:	650d      	cmplt      	r3, r4
    3c88:	0883      	bt      	0x3d8e	// 3d8e <__v2_printf+0x21e>
    3c8a:	3268      	movi      	r2, 104
    3c8c:	6492      	cmpne      	r4, r2
    3c8e:	0d24      	bf      	0x3ed6	// 3ed6 <__v2_printf+0x366>
    3c90:	6509      	cmplt      	r2, r4
    3c92:	086f      	bt      	0x3d70	// 3d70 <__v2_printf+0x200>
    3c94:	3366      	movi      	r3, 102
    3c96:	64d1      	cmplt      	r4, r3
    3c98:	0bb7      	bt      	0x3c06	// 3c06 <__v2_printf+0x96>
    3c9a:	3840      	cmpnei      	r0, 0
    3c9c:	0c05      	bf      	0x3ca6	// 3ca6 <__v2_printf+0x136>
    3c9e:	3037      	movi      	r0, 55
    3ca0:	1a01      	addi      	r2, r14, 4
    3ca2:	6008      	addu      	r0, r2
    3ca4:	a020      	st.b      	r1, (r0, 0x0)
    3ca6:	5d3e      	addi      	r1, r5, 8
    3ca8:	b825      	st.w      	r1, (r14, 0x14)
    3caa:	9500      	ld.w      	r0, (r5, 0x0)
    3cac:	9521      	ld.w      	r1, (r5, 0x4)
    3cae:	98a7      	ld.w      	r5, (r14, 0x1c)
    3cb0:	3d40      	cmpnei      	r5, 0
    3cb2:	0803      	bt      	0x3cb8	// 3cb8 <__v2_printf+0x148>
    3cb4:	3301      	movi      	r3, 1
    3cb6:	b867      	st.w      	r3, (r14, 0x1c)
    3cb8:	3200      	movi      	r2, 0
    3cba:	2a00      	subi      	r2, 1
    3cbc:	649a      	cmpne      	r6, r2
    3cbe:	0d58      	bf      	0x3f6e	// 3f6e <__v2_printf+0x3fe>
    3cc0:	6d5b      	mov      	r5, r6
    3cc2:	9867      	ld.w      	r3, (r14, 0x1c)
    3cc4:	b860      	st.w      	r3, (r14, 0x0)
    3cc6:	b8a1      	st.w      	r5, (r14, 0x4)
    3cc8:	3328      	movi      	r3, 40
    3cca:	1a12      	addi      	r2, r14, 72
    3ccc:	e00002f7 	bsr      	0x42ba	// 42ba <__GI___dtostr>
    3cd0:	3100      	movi      	r1, 0
    3cd2:	2900      	subi      	r1, 1
    3cd4:	645a      	cmpne      	r6, r1
    3cd6:	b808      	st.w      	r0, (r14, 0x20)
    3cd8:	0c1a      	bf      	0x3d0c	// 3d0c <__v2_printf+0x19c>
    3cda:	312e      	movi      	r1, 46
    3cdc:	980d      	ld.w      	r0, (r14, 0x34)
    3cde:	e00004fb 	bsr      	0x46d4	// 46d4 <__GI_strchr>
    3ce2:	3840      	cmpnei      	r0, 0
    3ce4:	98c8      	ld.w      	r6, (r14, 0x20)
    3ce6:	0d48      	bf      	0x3f76	// 3f76 <__v2_printf+0x406>
    3ce8:	3d40      	cmpnei      	r5, 0
    3cea:	0805      	bt      	0x3cf4	// 3cf4 <__v2_printf+0x184>
    3cec:	3101      	movi      	r1, 1
    3cee:	685c      	and      	r1, r7
    3cf0:	3940      	cmpnei      	r1, 0
    3cf2:	0d40      	bf      	0x3f72	// 3f72 <__v2_printf+0x402>
    3cf4:	58c2      	addi      	r6, r0, 1
    3cf6:	2500      	addi      	r5, 1
    3cf8:	5d59      	subu      	r2, r5, r6
    3cfa:	6080      	addu      	r2, r0
    3cfc:	3a20      	cmplti      	r2, 1
    3cfe:	0805      	bt      	0x3d08	// 3d08 <__v2_printf+0x198>
    3d00:	2600      	addi      	r6, 1
    3d02:	8660      	ld.b      	r3, (r6, 0x0)
    3d04:	3b40      	cmpnei      	r3, 0
    3d06:	0bf9      	bt      	0x3cf8	// 3cf8 <__v2_printf+0x188>
    3d08:	3500      	movi      	r5, 0
    3d0a:	a6a0      	st.b      	r5, (r6, 0x0)
    3d0c:	3067      	movi      	r0, 103
    3d0e:	6412      	cmpne      	r4, r0
    3d10:	0822      	bt      	0x3d54	// 3d54 <__v2_printf+0x1e4>
    3d12:	312e      	movi      	r1, 46
    3d14:	1812      	addi      	r0, r14, 72
    3d16:	e00004df 	bsr      	0x46d4	// 46d4 <__GI_strchr>
    3d1a:	3840      	cmpnei      	r0, 0
    3d1c:	6d03      	mov      	r4, r0
    3d1e:	0c1b      	bf      	0x3d54	// 3d54 <__v2_printf+0x1e4>
    3d20:	3165      	movi      	r1, 101
    3d22:	e00004d9 	bsr      	0x46d4	// 46d4 <__GI_strchr>
    3d26:	6c43      	mov      	r1, r0
    3d28:	84c0      	ld.b      	r6, (r4, 0x0)
    3d2a:	3e40      	cmpnei      	r6, 0
    3d2c:	0930      	bt      	0x3f8c	// 3f8c <__v2_printf+0x41c>
    3d2e:	3940      	cmpnei      	r1, 0
    3d30:	0c02      	bf      	0x3d34	// 3d34 <__v2_printf+0x1c4>
    3d32:	6d07      	mov      	r4, r1
    3d34:	3630      	movi      	r6, 48
    3d36:	5c63      	subi      	r3, r4, 1
    3d38:	8340      	ld.b      	r2, (r3, 0x0)
    3d3a:	658a      	cmpne      	r2, r6
    3d3c:	0d2a      	bf      	0x3f90	// 3f90 <__v2_printf+0x420>
    3d3e:	352e      	movi      	r5, 46
    3d40:	654a      	cmpne      	r2, r5
    3d42:	0802      	bt      	0x3d46	// 3d46 <__v2_printf+0x1d6>
    3d44:	6d0f      	mov      	r4, r3
    3d46:	3000      	movi      	r0, 0
    3d48:	3940      	cmpnei      	r1, 0
    3d4a:	a400      	st.b      	r0, (r4, 0x0)
    3d4c:	0c04      	bf      	0x3d54	// 3d54 <__v2_printf+0x1e4>
    3d4e:	6c13      	mov      	r0, r4
    3d50:	e000046a 	bsr      	0x4624	// 4624 <__strcpy_fast>
    3d54:	1912      	addi      	r1, r14, 72
    3d56:	81c0      	ld.b      	r6, (r1, 0x0)
    3d58:	332d      	movi      	r3, 45
    3d5a:	64da      	cmpne      	r6, r3
    3d5c:	0c02      	bf      	0x3d60	// 3d60 <__v2_printf+0x1f0>
    3d5e:	05ef      	br      	0x413c	// 413c <__v2_printf+0x5cc>
    3d60:	3437      	movi      	r4, 55
    3d62:	1801      	addi      	r0, r14, 4
    3d64:	352d      	movi      	r5, 45
    3d66:	6100      	addu      	r4, r0
    3d68:	a4a0      	st.b      	r5, (r4, 0x0)
    3d6a:	1912      	addi      	r1, r14, 72
    3d6c:	5982      	addi      	r4, r1, 1
    3d6e:	05ec      	br      	0x4146	// 4146 <__v2_printf+0x5d6>
    3d70:	3369      	movi      	r3, 105
    3d72:	64d2      	cmpne      	r4, r3
    3d74:	0cc6      	bf      	0x3f00	// 3f00 <__v2_printf+0x390>
    3d76:	326c      	movi      	r2, 108
    3d78:	6492      	cmpne      	r4, r2
    3d7a:	0b46      	bt      	0x3c06	// 3c06 <__v2_printf+0x96>
    3d7c:	9866      	ld.w      	r3, (r14, 0x18)
    3d7e:	8340      	ld.b      	r2, (r3, 0x0)
    3d80:	650a      	cmpne      	r2, r4
    3d82:	08ac      	bt      	0x3eda	// 3eda <__v2_printf+0x36a>
    3d84:	9886      	ld.w      	r4, (r14, 0x18)
    3d86:	2400      	addi      	r4, 1
    3d88:	b886      	st.w      	r4, (r14, 0x18)
    3d8a:	3fa5      	bseti      	r7, 5
    3d8c:	074e      	br      	0x3c28	// 3c28 <__v2_printf+0xb8>
    3d8e:	3371      	movi      	r3, 113
    3d90:	64d2      	cmpne      	r4, r3
    3d92:	0ffc      	bf      	0x3d8a	// 3d8a <__v2_printf+0x21a>
    3d94:	650d      	cmplt      	r3, r4
    3d96:	081a      	bt      	0x3dca	// 3dca <__v2_printf+0x25a>
    3d98:	306f      	movi      	r0, 111
    3d9a:	6412      	cmpne      	r4, r0
    3d9c:	0cfc      	bf      	0x3f94	// 3f94 <__v2_printf+0x424>
    3d9e:	3170      	movi      	r1, 112
    3da0:	6452      	cmpne      	r4, r1
    3da2:	0b32      	bt      	0x3c06	// 3c06 <__v2_printf+0x96>
    3da4:	5d4e      	addi      	r2, r5, 4
    3da6:	3400      	movi      	r4, 0
    3da8:	95a0      	ld.w      	r5, (r5, 0x0)
    3daa:	b845      	st.w      	r2, (r14, 0x14)
    3dac:	1901      	addi      	r1, r14, 4
    3dae:	3239      	movi      	r2, 57
    3db0:	b8a3      	st.w      	r5, (r14, 0xc)
    3db2:	b884      	st.w      	r4, (r14, 0x10)
    3db4:	3330      	movi      	r3, 48
    3db6:	180f      	addi      	r0, r14, 60
    3db8:	3578      	movi      	r5, 120
    3dba:	6084      	addu      	r2, r1
    3dbc:	0195      	lrw      	r4, 0x91bd	// 40e4 <__v2_printf+0x574>
    3dbe:	3fa1      	bseti      	r7, 1
    3dc0:	a060      	st.b      	r3, (r0, 0x0)
    3dc2:	a2a0      	st.b      	r5, (r2, 0x0)
    3dc4:	b88a      	st.w      	r4, (r14, 0x28)
    3dc6:	3402      	movi      	r4, 2
    3dc8:	04f1      	br      	0x3faa	// 3faa <__v2_printf+0x43a>
    3dca:	3275      	movi      	r2, 117
    3dcc:	6492      	cmpne      	r4, r2
    3dce:	0d28      	bf      	0x401e	// 401e <__v2_printf+0x4ae>
    3dd0:	3378      	movi      	r3, 120
    3dd2:	64d2      	cmpne      	r4, r3
    3dd4:	0d44      	bf      	0x405c	// 405c <__v2_printf+0x4ec>
    3dd6:	3173      	movi      	r1, 115
    3dd8:	6452      	cmpne      	r4, r1
    3dda:	0b16      	bt      	0x3c06	// 3c06 <__v2_printf+0x96>
    3ddc:	3200      	movi      	r2, 0
    3dde:	3037      	movi      	r0, 55
    3de0:	1901      	addi      	r1, r14, 4
    3de2:	2a00      	subi      	r2, 1
    3de4:	5d6e      	addi      	r3, r5, 4
    3de6:	9580      	ld.w      	r4, (r5, 0x0)
    3de8:	6004      	addu      	r0, r1
    3dea:	3500      	movi      	r5, 0
    3dec:	649a      	cmpne      	r6, r2
    3dee:	b865      	st.w      	r3, (r14, 0x14)
    3df0:	a0a0      	st.b      	r5, (r0, 0x0)
    3df2:	090b      	bt      	0x4008	// 4008 <__v2_printf+0x498>
    3df4:	6cd3      	mov      	r3, r4
    3df6:	83c0      	ld.b      	r6, (r3, 0x0)
    3df8:	3e40      	cmpnei      	r6, 0
    3dfa:	0910      	bt      	0x401a	// 401a <__v2_printf+0x4aa>
    3dfc:	5bd1      	subu      	r6, r3, r4
    3dfe:	047f      	br      	0x3efc	// 3efc <__v2_printf+0x38c>
    3e00:	3840      	cmpnei      	r0, 0
    3e02:	0c05      	bf      	0x3e0c	// 3e0c <__v2_printf+0x29c>
    3e04:	3037      	movi      	r0, 55
    3e06:	1b01      	addi      	r3, r14, 4
    3e08:	600c      	addu      	r0, r3
    3e0a:	a020      	st.b      	r1, (r0, 0x0)
    3e0c:	0228      	lrw      	r1, 0x91ac	// 40e8 <__v2_printf+0x578>
    3e0e:	3020      	movi      	r0, 32
    3e10:	681c      	and      	r0, r7
    3e12:	3840      	cmpnei      	r0, 0
    3e14:	b82a      	st.w      	r1, (r14, 0x28)
    3e16:	0d2b      	bf      	0x406c	// 406c <__v2_printf+0x4fc>
    3e18:	5d5e      	addi      	r2, r5, 8
    3e1a:	b845      	st.w      	r2, (r14, 0x14)
    3e1c:	9520      	ld.w      	r1, (r5, 0x0)
    3e1e:	9541      	ld.w      	r2, (r5, 0x4)
    3e20:	b823      	st.w      	r1, (r14, 0xc)
    3e22:	b844      	st.w      	r2, (r14, 0x10)
    3e24:	3001      	movi      	r0, 1
    3e26:	681c      	and      	r0, r7
    3e28:	3840      	cmpnei      	r0, 0
    3e2a:	0fce      	bf      	0x3dc6	// 3dc6 <__v2_printf+0x256>
    3e2c:	98a3      	ld.w      	r5, (r14, 0xc)
    3e2e:	9864      	ld.w      	r3, (r14, 0x10)
    3e30:	6d4c      	or      	r5, r3
    3e32:	3d40      	cmpnei      	r5, 0
    3e34:	0fc9      	bf      	0x3dc6	// 3dc6 <__v2_printf+0x256>
    3e36:	3039      	movi      	r0, 57
    3e38:	1d01      	addi      	r5, r14, 4
    3e3a:	3130      	movi      	r1, 48
    3e3c:	1a0f      	addi      	r2, r14, 60
    3e3e:	6014      	addu      	r0, r5
    3e40:	a220      	st.b      	r1, (r2, 0x0)
    3e42:	a080      	st.b      	r4, (r0, 0x0)
    3e44:	3fa1      	bseti      	r7, 1
    3e46:	07c0      	br      	0x3dc6	// 3dc6 <__v2_printf+0x256>
    3e48:	3940      	cmpnei      	r1, 0
    3e4a:	0aef      	bt      	0x3c28	// 3c28 <__v2_printf+0xb8>
    3e4c:	3001      	movi      	r0, 1
    3e4e:	3120      	movi      	r1, 32
    3e50:	06ec      	br      	0x3c28	// 3c28 <__v2_printf+0xb8>
    3e52:	3fa0      	bseti      	r7, 0
    3e54:	06ea      	br      	0x3c28	// 3c28 <__v2_printf+0xb8>
    3e56:	9580      	ld.w      	r4, (r5, 0x0)
    3e58:	3cdf      	btsti      	r4, 31
    3e5a:	5d6e      	addi      	r3, r5, 4
    3e5c:	b887      	st.w      	r4, (r14, 0x1c)
    3e5e:	0ee7      	bf      	0x3c2c	// 3c2c <__v2_printf+0xbc>
    3e60:	9847      	ld.w      	r2, (r14, 0x1c)
    3e62:	3500      	movi      	r5, 0
    3e64:	614a      	subu      	r5, r2
    3e66:	b8a7      	st.w      	r5, (r14, 0x1c)
    3e68:	6d4f      	mov      	r5, r3
    3e6a:	06e9      	br      	0x3c3c	// 3c3c <__v2_printf+0xcc>
    3e6c:	98c6      	ld.w      	r6, (r14, 0x18)
    3e6e:	8680      	ld.b      	r4, (r6, 0x0)
    3e70:	322a      	movi      	r2, 42
    3e72:	9866      	ld.w      	r3, (r14, 0x18)
    3e74:	6492      	cmpne      	r4, r2
    3e76:	2300      	addi      	r3, 1
    3e78:	0c0b      	bf      	0x3e8e	// 3e8e <__v2_printf+0x31e>
    3e7a:	b865      	st.w      	r3, (r14, 0x14)
    3e7c:	3600      	movi      	r6, 0
    3e7e:	3300      	movi      	r3, 0
    3e80:	2b2f      	subi      	r3, 48
    3e82:	60d0      	addu      	r3, r4
    3e84:	3b09      	cmphsi      	r3, 10
    3e86:	9845      	ld.w      	r2, (r14, 0x14)
    3e88:	0c0c      	bf      	0x3ea0	// 3ea0 <__v2_printf+0x330>
    3e8a:	b846      	st.w      	r2, (r14, 0x18)
    3e8c:	06a8      	br      	0x3bdc	// 3bdc <__v2_printf+0x6c>
    3e8e:	95c0      	ld.w      	r6, (r5, 0x0)
    3e90:	3edf      	btsti      	r6, 31
    3e92:	5d8e      	addi      	r4, r5, 4
    3e94:	0c03      	bf      	0x3e9a	// 3e9a <__v2_printf+0x32a>
    3e96:	3600      	movi      	r6, 0
    3e98:	2e00      	subi      	r6, 1
    3e9a:	6d53      	mov      	r5, r4
    3e9c:	b866      	st.w      	r3, (r14, 0x18)
    3e9e:	06c5      	br      	0x3c28	// 3c28 <__v2_printf+0xb8>
    3ea0:	340a      	movi      	r4, 10
    3ea2:	7d18      	mult      	r4, r6
    3ea4:	9845      	ld.w      	r2, (r14, 0x14)
    3ea6:	6d8f      	mov      	r6, r3
    3ea8:	6190      	addu      	r6, r4
    3eaa:	8280      	ld.b      	r4, (r2, 0x0)
    3eac:	2200      	addi      	r2, 1
    3eae:	b845      	st.w      	r2, (r14, 0x14)
    3eb0:	07e7      	br      	0x3e7e	// 3e7e <__v2_printf+0x30e>
    3eb2:	3200      	movi      	r2, 0
    3eb4:	b847      	st.w      	r2, (r14, 0x1c)
    3eb6:	9867      	ld.w      	r3, (r14, 0x1c)
    3eb8:	320a      	movi      	r2, 10
    3eba:	7cc8      	mult      	r3, r2
    3ebc:	2c2f      	subi      	r4, 48
    3ebe:	610c      	addu      	r4, r3
    3ec0:	b887      	st.w      	r4, (r14, 0x1c)
    3ec2:	3300      	movi      	r3, 0
    3ec4:	9886      	ld.w      	r4, (r14, 0x18)
    3ec6:	5c42      	addi      	r2, r4, 1
    3ec8:	2b2f      	subi      	r3, 48
    3eca:	8480      	ld.b      	r4, (r4, 0x0)
    3ecc:	60d0      	addu      	r3, r4
    3ece:	3b09      	cmphsi      	r3, 10
    3ed0:	b846      	st.w      	r2, (r14, 0x18)
    3ed2:	0ff2      	bf      	0x3eb6	// 3eb6 <__v2_printf+0x346>
    3ed4:	07db      	br      	0x3e8a	// 3e8a <__v2_printf+0x31a>
    3ed6:	3fa6      	bseti      	r7, 6
    3ed8:	06a8      	br      	0x3c28	// 3c28 <__v2_printf+0xb8>
    3eda:	3fa4      	bseti      	r7, 4
    3edc:	06a6      	br      	0x3c28	// 3c28 <__v2_printf+0xb8>
    3ede:	3840      	cmpnei      	r0, 0
    3ee0:	0c05      	bf      	0x3eea	// 3eea <__v2_printf+0x37a>
    3ee2:	3637      	movi      	r6, 55
    3ee4:	1b01      	addi      	r3, r14, 4
    3ee6:	618c      	addu      	r6, r3
    3ee8:	a620      	st.b      	r1, (r6, 0x0)
    3eea:	033e      	lrw      	r1, 0x20000350	// 40ec <__v2_printf+0x57c>
    3eec:	9100      	ld.w      	r0, (r1, 0x0)
    3eee:	e00003fd 	bsr      	0x46e8	// 46e8 <__GI_strerror>
    3ef2:	6d03      	mov      	r4, r0
    3ef4:	e3fffdae 	bsr      	0x3a50	// 3a50 <__strlen_fast>
    3ef8:	6d83      	mov      	r6, r0
    3efa:	b8a5      	st.w      	r5, (r14, 0x14)
    3efc:	3500      	movi      	r5, 0
    3efe:	0554      	br      	0x41a6	// 41a6 <__v2_printf+0x636>
    3f00:	3840      	cmpnei      	r0, 0
    3f02:	0c05      	bf      	0x3f0c	// 3f0c <__v2_printf+0x39c>
    3f04:	3037      	movi      	r0, 55
    3f06:	1a01      	addi      	r2, r14, 4
    3f08:	6008      	addu      	r0, r2
    3f0a:	a020      	st.b      	r1, (r0, 0x0)
    3f0c:	3420      	movi      	r4, 32
    3f0e:	691c      	and      	r4, r7
    3f10:	3c40      	cmpnei      	r4, 0
    3f12:	0c1a      	bf      	0x3f46	// 3f46 <__v2_printf+0x3d6>
    3f14:	5d7e      	addi      	r3, r5, 8
    3f16:	9520      	ld.w      	r1, (r5, 0x0)
    3f18:	9541      	ld.w      	r2, (r5, 0x4)
    3f1a:	b865      	st.w      	r3, (r14, 0x14)
    3f1c:	b823      	st.w      	r1, (r14, 0xc)
    3f1e:	b844      	st.w      	r2, (r14, 0x10)
    3f20:	9804      	ld.w      	r0, (r14, 0x10)
    3f22:	38df      	btsti      	r0, 31
    3f24:	0c0f      	bf      	0x3f42	// 3f42 <__v2_printf+0x3d2>
    3f26:	9883      	ld.w      	r4, (r14, 0xc)
    3f28:	98a4      	ld.w      	r5, (r14, 0x10)
    3f2a:	3200      	movi      	r2, 0
    3f2c:	3300      	movi      	r3, 0
    3f2e:	6488      	cmphs      	r2, r2
    3f30:	6093      	subc      	r2, r4
    3f32:	60d7      	subc      	r3, r5
    3f34:	b843      	st.w      	r2, (r14, 0xc)
    3f36:	b864      	st.w      	r3, (r14, 0x10)
    3f38:	3237      	movi      	r2, 55
    3f3a:	1b01      	addi      	r3, r14, 4
    3f3c:	352d      	movi      	r5, 45
    3f3e:	608c      	addu      	r2, r3
    3f40:	a2a0      	st.b      	r5, (r2, 0x0)
    3f42:	3401      	movi      	r4, 1
    3f44:	0438      	br      	0x3fb4	// 3fb4 <__v2_printf+0x444>
    3f46:	3310      	movi      	r3, 16
    3f48:	68dc      	and      	r3, r7
    3f4a:	3b40      	cmpnei      	r3, 0
    3f4c:	0c08      	bf      	0x3f5c	// 3f5c <__v2_printf+0x3ec>
    3f4e:	5d4e      	addi      	r2, r5, 4
    3f50:	b845      	st.w      	r2, (r14, 0x14)
    3f52:	95a0      	ld.w      	r5, (r5, 0x0)
    3f54:	559f      	asri      	r4, r5, 31
    3f56:	b8a3      	st.w      	r5, (r14, 0xc)
    3f58:	b884      	st.w      	r4, (r14, 0x10)
    3f5a:	07e3      	br      	0x3f20	// 3f20 <__v2_printf+0x3b0>
    3f5c:	3140      	movi      	r1, 64
    3f5e:	685c      	and      	r1, r7
    3f60:	5d0e      	addi      	r0, r5, 4
    3f62:	3940      	cmpnei      	r1, 0
    3f64:	95a0      	ld.w      	r5, (r5, 0x0)
    3f66:	b805      	st.w      	r0, (r14, 0x14)
    3f68:	0ff6      	bf      	0x3f54	// 3f54 <__v2_printf+0x3e4>
    3f6a:	7557      	sexth      	r5, r5
    3f6c:	07f4      	br      	0x3f54	// 3f54 <__v2_printf+0x3e4>
    3f6e:	3506      	movi      	r5, 6
    3f70:	06a9      	br      	0x3cc2	// 3cc2 <__v2_printf+0x152>
    3f72:	6d83      	mov      	r6, r0
    3f74:	06ca      	br      	0x3d08	// 3d08 <__v2_printf+0x198>
    3f76:	3201      	movi      	r2, 1
    3f78:	689c      	and      	r2, r7
    3f7a:	3a40      	cmpnei      	r2, 0
    3f7c:	0ec8      	bf      	0x3d0c	// 3d0c <__v2_printf+0x19c>
    3f7e:	1d12      	addi      	r5, r14, 72
    3f80:	6158      	addu      	r5, r6
    3f82:	332e      	movi      	r3, 46
    3f84:	3000      	movi      	r0, 0
    3f86:	a560      	st.b      	r3, (r5, 0x0)
    3f88:	a501      	st.b      	r0, (r5, 0x1)
    3f8a:	06c1      	br      	0x3d0c	// 3d0c <__v2_printf+0x19c>
    3f8c:	2400      	addi      	r4, 1
    3f8e:	06cd      	br      	0x3d28	// 3d28 <__v2_printf+0x1b8>
    3f90:	6d0f      	mov      	r4, r3
    3f92:	06d2      	br      	0x3d36	// 3d36 <__v2_printf+0x1c6>
    3f94:	3320      	movi      	r3, 32
    3f96:	68dc      	and      	r3, r7
    3f98:	3b40      	cmpnei      	r3, 0
    3f9a:	0c24      	bf      	0x3fe2	// 3fe2 <__v2_printf+0x472>
    3f9c:	5d7e      	addi      	r3, r5, 8
    3f9e:	9500      	ld.w      	r0, (r5, 0x0)
    3fa0:	9521      	ld.w      	r1, (r5, 0x4)
    3fa2:	b865      	st.w      	r3, (r14, 0x14)
    3fa4:	b803      	st.w      	r0, (r14, 0xc)
    3fa6:	b824      	st.w      	r1, (r14, 0x10)
    3fa8:	3400      	movi      	r4, 0
    3faa:	3537      	movi      	r5, 55
    3fac:	1801      	addi      	r0, r14, 4
    3fae:	3200      	movi      	r2, 0
    3fb0:	6140      	addu      	r5, r0
    3fb2:	a540      	st.b      	r2, (r5, 0x0)
    3fb4:	3100      	movi      	r1, 0
    3fb6:	2900      	subi      	r1, 1
    3fb8:	9803      	ld.w      	r0, (r14, 0xc)
    3fba:	98a4      	ld.w      	r5, (r14, 0x10)
    3fbc:	645a      	cmpne      	r6, r1
    3fbe:	6c14      	or      	r0, r5
    3fc0:	0cc8      	bf      	0x4150	// 4150 <__v2_printf+0x5e0>
    3fc2:	6c9f      	mov      	r2, r7
    3fc4:	3a87      	bclri      	r2, 7
    3fc6:	3840      	cmpnei      	r0, 0
    3fc8:	b848      	st.w      	r2, (r14, 0x20)
    3fca:	08c6      	bt      	0x4156	// 4156 <__v2_printf+0x5e6>
    3fcc:	3e40      	cmpnei      	r6, 0
    3fce:	0cac      	bf      	0x4126	// 4126 <__v2_printf+0x5b6>
    3fd0:	3c41      	cmpnei      	r4, 1
    3fd2:	0c68      	bf      	0x40a2	// 40a2 <__v2_printf+0x532>
    3fd4:	3c42      	cmpnei      	r4, 2
    3fd6:	0c8d      	bf      	0x40f0	// 40f0 <__v2_printf+0x580>
    3fd8:	3300      	movi      	r3, 0
    3fda:	3400      	movi      	r4, 0
    3fdc:	b863      	st.w      	r3, (r14, 0xc)
    3fde:	b884      	st.w      	r4, (r14, 0x10)
    3fe0:	04bf      	br      	0x415e	// 415e <__v2_printf+0x5ee>
    3fe2:	3010      	movi      	r0, 16
    3fe4:	681c      	and      	r0, r7
    3fe6:	3840      	cmpnei      	r0, 0
    3fe8:	0c05      	bf      	0x3ff2	// 3ff2 <__v2_printf+0x482>
    3fea:	5d8e      	addi      	r4, r5, 4
    3fec:	b885      	st.w      	r4, (r14, 0x14)
    3fee:	95a0      	ld.w      	r5, (r5, 0x0)
    3ff0:	0408      	br      	0x4000	// 4000 <__v2_printf+0x490>
    3ff2:	3240      	movi      	r2, 64
    3ff4:	689c      	and      	r2, r7
    3ff6:	5d2e      	addi      	r1, r5, 4
    3ff8:	3a40      	cmpnei      	r2, 0
    3ffa:	b825      	st.w      	r1, (r14, 0x14)
    3ffc:	0ff9      	bf      	0x3fee	// 3fee <__v2_printf+0x47e>
    3ffe:	8da0      	ld.h      	r5, (r5, 0x0)
    4000:	3400      	movi      	r4, 0
    4002:	b8a3      	st.w      	r5, (r14, 0xc)
    4004:	b884      	st.w      	r4, (r14, 0x10)
    4006:	07d2      	br      	0x3faa	// 3faa <__v2_printf+0x43a>
    4008:	5cb8      	addu      	r5, r4, r6
    400a:	6cd3      	mov      	r3, r4
    400c:	654e      	cmpne      	r3, r5
    400e:	0f77      	bf      	0x3efc	// 3efc <__v2_printf+0x38c>
    4010:	8300      	ld.b      	r0, (r3, 0x0)
    4012:	3840      	cmpnei      	r0, 0
    4014:	0ef4      	bf      	0x3dfc	// 3dfc <__v2_printf+0x28c>
    4016:	2300      	addi      	r3, 1
    4018:	07fa      	br      	0x400c	// 400c <__v2_printf+0x49c>
    401a:	2300      	addi      	r3, 1
    401c:	06ed      	br      	0x3df6	// 3df6 <__v2_printf+0x286>
    401e:	3420      	movi      	r4, 32
    4020:	691c      	and      	r4, r7
    4022:	3c40      	cmpnei      	r4, 0
    4024:	0c09      	bf      	0x4036	// 4036 <__v2_printf+0x4c6>
    4026:	5d7e      	addi      	r3, r5, 8
    4028:	9520      	ld.w      	r1, (r5, 0x0)
    402a:	9541      	ld.w      	r2, (r5, 0x4)
    402c:	b865      	st.w      	r3, (r14, 0x14)
    402e:	b823      	st.w      	r1, (r14, 0xc)
    4030:	b844      	st.w      	r2, (r14, 0x10)
    4032:	3401      	movi      	r4, 1
    4034:	07bb      	br      	0x3faa	// 3faa <__v2_printf+0x43a>
    4036:	3310      	movi      	r3, 16
    4038:	68dc      	and      	r3, r7
    403a:	3b40      	cmpnei      	r3, 0
    403c:	0c05      	bf      	0x4046	// 4046 <__v2_printf+0x4d6>
    403e:	5d0e      	addi      	r0, r5, 4
    4040:	b805      	st.w      	r0, (r14, 0x14)
    4042:	95a0      	ld.w      	r5, (r5, 0x0)
    4044:	0408      	br      	0x4054	// 4054 <__v2_printf+0x4e4>
    4046:	3140      	movi      	r1, 64
    4048:	685c      	and      	r1, r7
    404a:	5d4e      	addi      	r2, r5, 4
    404c:	3940      	cmpnei      	r1, 0
    404e:	b845      	st.w      	r2, (r14, 0x14)
    4050:	0ff9      	bf      	0x4042	// 4042 <__v2_printf+0x4d2>
    4052:	8da0      	ld.h      	r5, (r5, 0x0)
    4054:	3400      	movi      	r4, 0
    4056:	b8a3      	st.w      	r5, (r14, 0xc)
    4058:	b884      	st.w      	r4, (r14, 0x10)
    405a:	07ec      	br      	0x4032	// 4032 <__v2_printf+0x4c2>
    405c:	3840      	cmpnei      	r0, 0
    405e:	0c05      	bf      	0x4068	// 4068 <__v2_printf+0x4f8>
    4060:	3337      	movi      	r3, 55
    4062:	1a01      	addi      	r2, r14, 4
    4064:	60c8      	addu      	r3, r2
    4066:	a320      	st.b      	r1, (r3, 0x0)
    4068:	103f      	lrw      	r1, 0x91bd	// 40e4 <__v2_printf+0x574>
    406a:	06d2      	br      	0x3e0e	// 3e0e <__v2_printf+0x29e>
    406c:	3310      	movi      	r3, 16
    406e:	68dc      	and      	r3, r7
    4070:	3b40      	cmpnei      	r3, 0
    4072:	0c05      	bf      	0x407c	// 407c <__v2_printf+0x50c>
    4074:	5d0e      	addi      	r0, r5, 4
    4076:	b805      	st.w      	r0, (r14, 0x14)
    4078:	95a0      	ld.w      	r5, (r5, 0x0)
    407a:	0408      	br      	0x408a	// 408a <__v2_printf+0x51a>
    407c:	3240      	movi      	r2, 64
    407e:	689c      	and      	r2, r7
    4080:	5d2e      	addi      	r1, r5, 4
    4082:	3a40      	cmpnei      	r2, 0
    4084:	b825      	st.w      	r1, (r14, 0x14)
    4086:	0ff9      	bf      	0x4078	// 4078 <__v2_printf+0x508>
    4088:	8da0      	ld.h      	r5, (r5, 0x0)
    408a:	3300      	movi      	r3, 0
    408c:	b8a3      	st.w      	r5, (r14, 0xc)
    408e:	b864      	st.w      	r3, (r14, 0x10)
    4090:	06ca      	br      	0x3e24	// 3e24 <__v2_printf+0x2b4>
    4092:	6cd3      	mov      	r3, r4
    4094:	0467      	br      	0x4162	// 4162 <__v2_printf+0x5f2>
    4096:	9884      	ld.w      	r4, (r14, 0x10)
    4098:	3c40      	cmpnei      	r4, 0
    409a:	080b      	bt      	0x40b0	// 40b0 <__v2_printf+0x540>
    409c:	9843      	ld.w      	r2, (r14, 0xc)
    409e:	3a09      	cmphsi      	r2, 10
    40a0:	0808      	bt      	0x40b0	// 40b0 <__v2_printf+0x540>
    40a2:	9883      	ld.w      	r4, (r14, 0xc)
    40a4:	242f      	addi      	r4, 48
    40a6:	1f1a      	addi      	r7, r14, 104
    40a8:	a787      	st.b      	r4, (r7, 0x7)
    40aa:	1c12      	addi      	r4, r14, 72
    40ac:	2426      	addi      	r4, 39
    40ae:	0478      	br      	0x419e	// 419e <__v2_printf+0x62e>
    40b0:	1c1c      	addi      	r4, r14, 112
    40b2:	3530      	movi      	r5, 48
    40b4:	320a      	movi      	r2, 10
    40b6:	3300      	movi      	r3, 0
    40b8:	9803      	ld.w      	r0, (r14, 0xc)
    40ba:	9824      	ld.w      	r1, (r14, 0x10)
    40bc:	e3fff2a6 	bsr      	0x2608	// 2608 <__umoddi3>
    40c0:	6014      	addu      	r0, r5
    40c2:	2c00      	subi      	r4, 1
    40c4:	a400      	st.b      	r0, (r4, 0x0)
    40c6:	320a      	movi      	r2, 10
    40c8:	9803      	ld.w      	r0, (r14, 0xc)
    40ca:	9824      	ld.w      	r1, (r14, 0x10)
    40cc:	3300      	movi      	r3, 0
    40ce:	e3fff0c7 	bsr      	0x225c	// 225c <__udivdi3>
    40d2:	b803      	st.w      	r0, (r14, 0xc)
    40d4:	b824      	st.w      	r1, (r14, 0x10)
    40d6:	9823      	ld.w      	r1, (r14, 0xc)
    40d8:	98e4      	ld.w      	r7, (r14, 0x10)
    40da:	6c5c      	or      	r1, r7
    40dc:	3940      	cmpnei      	r1, 0
    40de:	0beb      	bt      	0x40b4	// 40b4 <__v2_printf+0x544>
    40e0:	045f      	br      	0x419e	// 419e <__v2_printf+0x62e>
    40e2:	0000      	bkpt
    40e4:	000091bd 	.long	0x000091bd
    40e8:	000091ac 	.long	0x000091ac
    40ec:	20000350 	.long	0x20000350
    40f0:	3300      	movi      	r3, 0
    40f2:	3400      	movi      	r4, 0
    40f4:	b863      	st.w      	r3, (r14, 0xc)
    40f6:	b884      	st.w      	r4, (r14, 0x10)
    40f8:	1c1c      	addi      	r4, r14, 112
    40fa:	320f      	movi      	r2, 15
    40fc:	9803      	ld.w      	r0, (r14, 0xc)
    40fe:	982a      	ld.w      	r1, (r14, 0x28)
    4100:	6808      	and      	r0, r2
    4102:	6004      	addu      	r0, r1
    4104:	80a0      	ld.b      	r5, (r0, 0x0)
    4106:	2c00      	subi      	r4, 1
    4108:	98e4      	ld.w      	r7, (r14, 0x10)
    410a:	a4a0      	st.b      	r5, (r4, 0x0)
    410c:	98a4      	ld.w      	r5, (r14, 0x10)
    410e:	9863      	ld.w      	r3, (r14, 0xc)
    4110:	471c      	lsli      	r0, r7, 28
    4112:	4de4      	lsri      	r7, r5, 4
    4114:	4b24      	lsri      	r1, r3, 4
    4116:	b8e4      	st.w      	r7, (r14, 0x10)
    4118:	6c04      	or      	r0, r1
    411a:	9864      	ld.w      	r3, (r14, 0x10)
    411c:	b803      	st.w      	r0, (r14, 0xc)
    411e:	6c0c      	or      	r0, r3
    4120:	3840      	cmpnei      	r0, 0
    4122:	0bed      	bt      	0x40fc	// 40fc <__v2_printf+0x58c>
    4124:	043d      	br      	0x419e	// 419e <__v2_printf+0x62e>
    4126:	3c40      	cmpnei      	r4, 0
    4128:	0808      	bt      	0x4138	// 4138 <__v2_printf+0x5c8>
    412a:	3301      	movi      	r3, 1
    412c:	68dc      	and      	r3, r7
    412e:	3b40      	cmpnei      	r3, 0
    4130:	0c04      	bf      	0x4138	// 4138 <__v2_printf+0x5c8>
    4132:	1f1a      	addi      	r7, r14, 104
    4134:	3430      	movi      	r4, 48
    4136:	07b9      	br      	0x40a8	// 40a8 <__v2_printf+0x538>
    4138:	1c1c      	addi      	r4, r14, 112
    413a:	0432      	br      	0x419e	// 419e <__v2_printf+0x62e>
    413c:	322b      	movi      	r2, 43
    413e:	649a      	cmpne      	r6, r2
    4140:	0802      	bt      	0x4144	// 4144 <__v2_printf+0x5d4>
    4142:	0614      	br      	0x3d6a	// 3d6a <__v2_printf+0x1fa>
    4144:	1c12      	addi      	r4, r14, 72
    4146:	6c13      	mov      	r0, r4
    4148:	e3fffc84 	bsr      	0x3a50	// 3a50 <__strlen_fast>
    414c:	6d83      	mov      	r6, r0
    414e:	06d7      	br      	0x3efc	// 3efc <__v2_printf+0x38c>
    4150:	3840      	cmpnei      	r0, 0
    4152:	b8e8      	st.w      	r7, (r14, 0x20)
    4154:	0f3e      	bf      	0x3fd0	// 3fd0 <__v2_printf+0x460>
    4156:	3c41      	cmpnei      	r4, 1
    4158:	0f9f      	bf      	0x4096	// 4096 <__v2_printf+0x526>
    415a:	3c42      	cmpnei      	r4, 2
    415c:	0fce      	bf      	0x40f8	// 40f8 <__v2_printf+0x588>
    415e:	1b1c      	addi      	r3, r14, 112
    4160:	3707      	movi      	r7, 7
    4162:	9823      	ld.w      	r1, (r14, 0xc)
    4164:	685c      	and      	r1, r7
    4166:	212f      	addi      	r1, 48
    4168:	9804      	ld.w      	r0, (r14, 0x10)
    416a:	7484      	zextb      	r2, r1
    416c:	9823      	ld.w      	r1, (r14, 0xc)
    416e:	40bd      	lsli      	r5, r0, 29
    4170:	4903      	lsri      	r0, r1, 3
    4172:	9824      	ld.w      	r1, (r14, 0x10)
    4174:	4923      	lsri      	r1, r1, 3
    4176:	b824      	st.w      	r1, (r14, 0x10)
    4178:	6d40      	or      	r5, r0
    417a:	9804      	ld.w      	r0, (r14, 0x10)
    417c:	b8a3      	st.w      	r5, (r14, 0xc)
    417e:	6d40      	or      	r5, r0
    4180:	5b83      	subi      	r4, r3, 1
    4182:	3d40      	cmpnei      	r5, 0
    4184:	a440      	st.b      	r2, (r4, 0x0)
    4186:	0b86      	bt      	0x4092	// 4092 <__v2_printf+0x522>
    4188:	3701      	movi      	r7, 1
    418a:	9828      	ld.w      	r1, (r14, 0x20)
    418c:	69c4      	and      	r7, r1
    418e:	3f40      	cmpnei      	r7, 0
    4190:	0c07      	bf      	0x419e	// 419e <__v2_printf+0x62e>
    4192:	3530      	movi      	r5, 48
    4194:	654a      	cmpne      	r2, r5
    4196:	0c04      	bf      	0x419e	// 419e <__v2_printf+0x62e>
    4198:	5b87      	subi      	r4, r3, 2
    419a:	3330      	movi      	r3, 48
    419c:	a460      	st.b      	r3, (r4, 0x0)
    419e:	6d5b      	mov      	r5, r6
    41a0:	1e1c      	addi      	r6, r14, 112
    41a2:	6192      	subu      	r6, r4
    41a4:	98e8      	ld.w      	r7, (r14, 0x20)
    41a6:	6595      	cmplt      	r5, r6
    41a8:	b8a8      	st.w      	r5, (r14, 0x20)
    41aa:	0c02      	bf      	0x41ae	// 41ae <__v2_printf+0x63e>
    41ac:	b8c8      	st.w      	r6, (r14, 0x20)
    41ae:	3037      	movi      	r0, 55
    41b0:	1b01      	addi      	r3, r14, 4
    41b2:	600c      	addu      	r0, r3
    41b4:	8040      	ld.b      	r2, (r0, 0x0)
    41b6:	3a40      	cmpnei      	r2, 0
    41b8:	0c04      	bf      	0x41c0	// 41c0 <__v2_printf+0x650>
    41ba:	9828      	ld.w      	r1, (r14, 0x20)
    41bc:	2100      	addi      	r1, 1
    41be:	b828      	st.w      	r1, (r14, 0x20)
    41c0:	3002      	movi      	r0, 2
    41c2:	681c      	and      	r0, r7
    41c4:	3840      	cmpnei      	r0, 0
    41c6:	b80b      	st.w      	r0, (r14, 0x2c)
    41c8:	0c04      	bf      	0x41d0	// 41d0 <__v2_printf+0x660>
    41ca:	9868      	ld.w      	r3, (r14, 0x20)
    41cc:	2301      	addi      	r3, 2
    41ce:	b868      	st.w      	r3, (r14, 0x20)
    41d0:	3284      	movi      	r2, 132
    41d2:	689c      	and      	r2, r7
    41d4:	3a40      	cmpnei      	r2, 0
    41d6:	b84c      	st.w      	r2, (r14, 0x30)
    41d8:	080b      	bt      	0x41ee	// 41ee <__v2_printf+0x67e>
    41da:	3310      	movi      	r3, 16
    41dc:	1a0c      	addi      	r2, r14, 48
    41de:	9827      	ld.w      	r1, (r14, 0x1c)
    41e0:	9808      	ld.w      	r0, (r14, 0x20)
    41e2:	60c8      	addu      	r3, r2
    41e4:	5901      	subu      	r0, r1, r0
    41e6:	6f4f      	mov      	r13, r3
    41e8:	1129      	lrw      	r1, 0x8cbc	// 428c <__v2_printf+0x71c>
    41ea:	e3fffca9 	bsr      	0x3b3c	// 3b3c <PAD.1851>
    41ee:	3137      	movi      	r1, 55
    41f0:	1801      	addi      	r0, r14, 4
    41f2:	6040      	addu      	r1, r0
    41f4:	8160      	ld.b      	r3, (r1, 0x0)
    41f6:	3b40      	cmpnei      	r3, 0
    41f8:	0c0b      	bf      	0x420e	// 420e <__v2_printf+0x69e>
    41fa:	9830      	ld.w      	r1, (r14, 0x40)
    41fc:	9101      	ld.w      	r0, (r1, 0x4)
    41fe:	b802      	st.w      	r0, (r14, 0x8)
    4200:	1b0c      	addi      	r3, r14, 48
    4202:	300b      	movi      	r0, 11
    4204:	9140      	ld.w      	r2, (r1, 0x0)
    4206:	600c      	addu      	r0, r3
    4208:	3101      	movi      	r1, 1
    420a:	9862      	ld.w      	r3, (r14, 0x8)
    420c:	7bcd      	jsr      	r3
    420e:	984b      	ld.w      	r2, (r14, 0x2c)
    4210:	3a40      	cmpnei      	r2, 0
    4212:	0c07      	bf      	0x4220	// 4220 <__v2_printf+0x6b0>
    4214:	9830      	ld.w      	r1, (r14, 0x40)
    4216:	9140      	ld.w      	r2, (r1, 0x0)
    4218:	9161      	ld.w      	r3, (r1, 0x4)
    421a:	180f      	addi      	r0, r14, 60
    421c:	3102      	movi      	r1, 2
    421e:	7bcd      	jsr      	r3
    4220:	3080      	movi      	r0, 128
    4222:	984c      	ld.w      	r2, (r14, 0x30)
    4224:	640a      	cmpne      	r2, r0
    4226:	080b      	bt      	0x423c	// 423c <__v2_printf+0x6cc>
    4228:	9827      	ld.w      	r1, (r14, 0x1c)
    422a:	9868      	ld.w      	r3, (r14, 0x20)
    422c:	590d      	subu      	r0, r1, r3
    422e:	1a0c      	addi      	r2, r14, 48
    4230:	3110      	movi      	r1, 16
    4232:	6048      	addu      	r1, r2
    4234:	6f47      	mov      	r13, r1
    4236:	1037      	lrw      	r1, 0x8ccc	// 4290 <__v2_printf+0x720>
    4238:	e3fffc82 	bsr      	0x3b3c	// 3b3c <PAD.1851>
    423c:	5d19      	subu      	r0, r5, r6
    423e:	1b0c      	addi      	r3, r14, 48
    4240:	3510      	movi      	r5, 16
    4242:	614c      	addu      	r5, r3
    4244:	6f57      	mov      	r13, r5
    4246:	6d77      	mov      	r5, r13
    4248:	1032      	lrw      	r1, 0x8ccc	// 4290 <__v2_printf+0x720>
    424a:	e3fffc79 	bsr      	0x3b3c	// 3b3c <PAD.1851>
    424e:	9500      	ld.w      	r0, (r5, 0x0)
    4250:	9040      	ld.w      	r2, (r0, 0x0)
    4252:	9061      	ld.w      	r3, (r0, 0x4)
    4254:	6c13      	mov      	r0, r4
    4256:	3404      	movi      	r4, 4
    4258:	6c5b      	mov      	r1, r6
    425a:	691c      	and      	r4, r7
    425c:	7bcd      	jsr      	r3
    425e:	3c40      	cmpnei      	r4, 0
    4260:	0c08      	bf      	0x4270	// 4270 <__v2_printf+0x700>
    4262:	9828      	ld.w      	r1, (r14, 0x20)
    4264:	98c7      	ld.w      	r6, (r14, 0x1c)
    4266:	5e05      	subu      	r0, r6, r1
    4268:	6f57      	mov      	r13, r5
    426a:	1029      	lrw      	r1, 0x8cbc	// 428c <__v2_printf+0x71c>
    426c:	e3fffc68 	bsr      	0x3b3c	// 3b3c <PAD.1851>
    4270:	98a7      	ld.w      	r5, (r14, 0x1c)
    4272:	9848      	ld.w      	r2, (r14, 0x20)
    4274:	6495      	cmplt      	r5, r2
    4276:	0c02      	bf      	0x427a	// 427a <__v2_printf+0x70a>
    4278:	6d4b      	mov      	r5, r2
    427a:	9809      	ld.w      	r0, (r14, 0x24)
    427c:	6014      	addu      	r0, r5
    427e:	b809      	st.w      	r0, (r14, 0x24)
    4280:	98a5      	ld.w      	r5, (r14, 0x14)
    4282:	e800fc84 	br      	0x3b8a	// 3b8a <__v2_printf+0x1a>
    4286:	9809      	ld.w      	r0, (r14, 0x24)
    4288:	141c      	addi      	r14, r14, 112
    428a:	1494      	pop      	r4-r7, r15
    428c:	00008cbc 	.long	0x00008cbc
    4290:	00008ccc 	.long	0x00008ccc

00004294 <copystring>:
    4294:	14c2      	push      	r4-r5
    4296:	3300      	movi      	r3, 0
    4298:	644d      	cmplt      	r3, r1
    429a:	0803      	bt      	0x42a0	// 42a0 <copystring+0xc>
    429c:	6c0f      	mov      	r0, r3
    429e:	1482      	pop      	r4-r5
    42a0:	5aac      	addu      	r5, r2, r3
    42a2:	588c      	addu      	r4, r0, r3
    42a4:	2300      	addi      	r3, 1
    42a6:	85a0      	ld.b      	r5, (r5, 0x0)
    42a8:	3b43      	cmpnei      	r3, 3
    42aa:	a4a0      	st.b      	r5, (r4, 0x0)
    42ac:	0bf6      	bt      	0x4298	// 4298 <copystring+0x4>
    42ae:	3923      	cmplti      	r1, 4
    42b0:	0bf6      	bt      	0x429c	// 429c <copystring+0x8>
    42b2:	3300      	movi      	r3, 0
    42b4:	a063      	st.b      	r3, (r0, 0x3)
    42b6:	3304      	movi      	r3, 4
    42b8:	07f2      	br      	0x429c	// 429c <copystring+0x8>

000042ba <__GI___dtostr>:
    42ba:	14d4      	push      	r4-r7, r15
    42bc:	142c      	subi      	r14, r14, 48
    42be:	6d8f      	mov      	r6, r3
    42c0:	9871      	ld.w      	r3, (r14, 0x44)
    42c2:	b80a      	st.w      	r0, (r14, 0x28)
    42c4:	b824      	st.w      	r1, (r14, 0x10)
    42c6:	b842      	st.w      	r2, (r14, 0x8)
    42c8:	b86b      	st.w      	r3, (r14, 0x2c)
    42ca:	98f2      	ld.w      	r7, (r14, 0x48)
    42cc:	e000021c 	bsr      	0x4704	// 4704 <__isinf>
    42d0:	3840      	cmpnei      	r0, 0
    42d2:	0c0a      	bf      	0x42e6	// 42e6 <__GI___dtostr+0x2c>
    42d4:	0244      	lrw      	r2, 0x91ce	// 45c0 <__GI___dtostr+0x306>
    42d6:	6c5b      	mov      	r1, r6
    42d8:	9802      	ld.w      	r0, (r14, 0x8)
    42da:	e3ffffdd 	bsr      	0x4294	// 4294 <copystring>
    42de:	b809      	st.w      	r0, (r14, 0x24)
    42e0:	9809      	ld.w      	r0, (r14, 0x24)
    42e2:	140c      	addi      	r14, r14, 48
    42e4:	1494      	pop      	r4-r7, r15
    42e6:	980a      	ld.w      	r0, (r14, 0x28)
    42e8:	9824      	ld.w      	r1, (r14, 0x10)
    42ea:	e0000185 	bsr      	0x45f4	// 45f4 <__isnan>
    42ee:	3840      	cmpnei      	r0, 0
    42f0:	b809      	st.w      	r0, (r14, 0x24)
    42f2:	0c03      	bf      	0x42f8	// 42f8 <__GI___dtostr+0x3e>
    42f4:	024b      	lrw      	r2, 0x91d2	// 45c4 <__GI___dtostr+0x30a>
    42f6:	07f0      	br      	0x42d6	// 42d6 <__GI___dtostr+0x1c>
    42f8:	3200      	movi      	r2, 0
    42fa:	3300      	movi      	r3, 0
    42fc:	980a      	ld.w      	r0, (r14, 0x28)
    42fe:	9824      	ld.w      	r1, (r14, 0x10)
    4300:	e000021a 	bsr      	0x4734	// 4734 <__eqdf2>
    4304:	3840      	cmpnei      	r0, 0
    4306:	082d      	bt      	0x4360	// 4360 <__GI___dtostr+0xa6>
    4308:	3f40      	cmpnei      	r7, 0
    430a:	0d57      	bf      	0x45b8	// 45b8 <__GI___dtostr+0x2fe>
    430c:	5fa6      	addi      	r5, r7, 2
    430e:	6558      	cmphs      	r6, r5
    4310:	0d56      	bf      	0x45bc	// 45bc <__GI___dtostr+0x302>
    4312:	3d40      	cmpnei      	r5, 0
    4314:	0c0b      	bf      	0x432a	// 432a <__GI___dtostr+0x70>
    4316:	9824      	ld.w      	r1, (r14, 0x10)
    4318:	39df      	btsti      	r1, 31
    431a:	0c1a      	bf      	0x434e	// 434e <__GI___dtostr+0x94>
    431c:	9802      	ld.w      	r0, (r14, 0x8)
    431e:	322d      	movi      	r2, 45
    4320:	a040      	st.b      	r2, (r0, 0x0)
    4322:	5d02      	addi      	r0, r5, 1
    4324:	3501      	movi      	r5, 1
    4326:	6414      	cmphs      	r5, r0
    4328:	0c16      	bf      	0x4354	// 4354 <__GI___dtostr+0x9a>
    432a:	9882      	ld.w      	r4, (r14, 0x8)
    432c:	8420      	ld.b      	r1, (r4, 0x0)
    432e:	3330      	movi      	r3, 48
    4330:	64c6      	cmpne      	r1, r3
    4332:	3000      	movi      	r0, 0
    4334:	6001      	addc      	r0, r0
    4336:	9842      	ld.w      	r2, (r14, 0x8)
    4338:	9822      	ld.w      	r1, (r14, 0x8)
    433a:	6008      	addu      	r0, r2
    433c:	342e      	movi      	r4, 46
    433e:	6054      	addu      	r1, r5
    4340:	3300      	movi      	r3, 0
    4342:	a081      	st.b      	r4, (r0, 0x1)
    4344:	b8a9      	st.w      	r5, (r14, 0x24)
    4346:	a160      	st.b      	r3, (r1, 0x0)
    4348:	07cc      	br      	0x42e0	// 42e0 <__GI___dtostr+0x26>
    434a:	3501      	movi      	r5, 1
    434c:	07e5      	br      	0x4316	// 4316 <__GI___dtostr+0x5c>
    434e:	6c17      	mov      	r0, r5
    4350:	3500      	movi      	r5, 0
    4352:	07ea      	br      	0x4326	// 4326 <__GI___dtostr+0x6c>
    4354:	9842      	ld.w      	r2, (r14, 0x8)
    4356:	6094      	addu      	r2, r5
    4358:	3430      	movi      	r4, 48
    435a:	a280      	st.b      	r4, (r2, 0x0)
    435c:	2500      	addi      	r5, 1
    435e:	07e4      	br      	0x4326	// 4326 <__GI___dtostr+0x6c>
    4360:	3200      	movi      	r2, 0
    4362:	3300      	movi      	r3, 0
    4364:	980a      	ld.w      	r0, (r14, 0x28)
    4366:	9824      	ld.w      	r1, (r14, 0x10)
    4368:	e0000222 	bsr      	0x47ac	// 47ac <__ltdf2>
    436c:	38df      	btsti      	r0, 31
    436e:	0c8e      	bf      	0x448a	// 448a <__GI___dtostr+0x1d0>
    4370:	3180      	movi      	r1, 128
    4372:	98a2      	ld.w      	r5, (r14, 0x8)
    4374:	9884      	ld.w      	r4, (r14, 0x10)
    4376:	4158      	lsli      	r2, r1, 24
    4378:	332d      	movi      	r3, 45
    437a:	a560      	st.b      	r3, (r5, 0x0)
    437c:	6108      	addu      	r4, r2
    437e:	2e00      	subi      	r6, 1
    4380:	2500      	addi      	r5, 1
    4382:	3000      	movi      	r0, 0
    4384:	032e      	lrw      	r1, 0x3fe00000	// 45c8 <__GI___dtostr+0x30e>
    4386:	3300      	movi      	r3, 0
    4388:	b865      	st.w      	r3, (r14, 0x14)
    438a:	9845      	ld.w      	r2, (r14, 0x14)
    438c:	65ca      	cmpne      	r2, r7
    438e:	0881      	bt      	0x4490	// 4490 <__GI___dtostr+0x1d6>
    4390:	6c83      	mov      	r2, r0
    4392:	6cc7      	mov      	r3, r1
    4394:	980a      	ld.w      	r0, (r14, 0x28)
    4396:	6c53      	mov      	r1, r4
    4398:	e3fff600 	bsr      	0x2f98	// 2f98 <__adddf3>
    439c:	3200      	movi      	r2, 0
    439e:	0373      	lrw      	r3, 0x3ff00000	// 45cc <__GI___dtostr+0x312>
    43a0:	b806      	st.w      	r0, (r14, 0x18)
    43a2:	b827      	st.w      	r1, (r14, 0x1c)
    43a4:	e0000204 	bsr      	0x47ac	// 47ac <__ltdf2>
    43a8:	38df      	btsti      	r0, 31
    43aa:	0c05      	bf      	0x43b4	// 43b4 <__GI___dtostr+0xfa>
    43ac:	3430      	movi      	r4, 48
    43ae:	a580      	st.b      	r4, (r5, 0x0)
    43b0:	2e00      	subi      	r6, 1
    43b2:	2500      	addi      	r5, 1
    43b4:	9804      	ld.w      	r0, (r14, 0x10)
    43b6:	4021      	lsli      	r1, r0, 1
    43b8:	0379      	lrw      	r3, 0xfffffc01	// 45d0 <__GI___dtostr+0x316>
    43ba:	4915      	lsri      	r0, r1, 21
    43bc:	600c      	addu      	r0, r3
    43be:	e0000215 	bsr      	0x47e8	// 47e8 <__floatsidf>
    43c2:	035a      	lrw      	r2, 0x509f79ff	// 45d4 <__GI___dtostr+0x31a>
    43c4:	037a      	lrw      	r3, 0x3fd34413	// 45d8 <__GI___dtostr+0x31e>
    43c6:	e3fff61d 	bsr      	0x3000	// 3000 <__muldf3>
    43ca:	e3fff7fd 	bsr      	0x33c4	// 33c4 <__fixdfsi>
    43ce:	5842      	addi      	r2, r0, 1
    43d0:	3a20      	cmplti      	r2, 1
    43d2:	b848      	st.w      	r2, (r14, 0x20)
    43d4:	08e7      	bt      	0x45a2	// 45a2 <__GI___dtostr+0x2e8>
    43d6:	033d      	lrw      	r1, 0x40240000	// 45dc <__GI___dtostr+0x322>
    43d8:	6dcb      	mov      	r7, r2
    43da:	3400      	movi      	r4, 0
    43dc:	b823      	st.w      	r1, (r14, 0xc)
    43de:	3f0a      	cmphsi      	r7, 11
    43e0:	085f      	bt      	0x449e	// 449e <__GI___dtostr+0x1e4>
    43e2:	3f41      	cmpnei      	r7, 1
    43e4:	0868      	bt      	0x44b4	// 44b4 <__GI___dtostr+0x1fa>
    43e6:	135f      	lrw      	r2, 0xcccccccd	// 45e0 <__GI___dtostr+0x326>
    43e8:	137f      	lrw      	r3, 0x3feccccc	// 45e4 <__GI___dtostr+0x32a>
    43ea:	6c13      	mov      	r0, r4
    43ec:	9823      	ld.w      	r1, (r14, 0xc)
    43ee:	e00001c1 	bsr      	0x4770	// 4770 <__gtdf2>
    43f2:	3820      	cmplti      	r0, 1
    43f4:	0c6a      	bf      	0x44c8	// 44c8 <__GI___dtostr+0x20e>
    43f6:	9862      	ld.w      	r3, (r14, 0x8)
    43f8:	64d6      	cmpne      	r5, r3
    43fa:	0807      	bt      	0x4408	// 4408 <__GI___dtostr+0x14e>
    43fc:	3e40      	cmpnei      	r6, 0
    43fe:	0f71      	bf      	0x42e0	// 42e0 <__GI___dtostr+0x26>
    4400:	3230      	movi      	r2, 48
    4402:	a540      	st.b      	r2, (r5, 0x0)
    4404:	2e00      	subi      	r6, 1
    4406:	2500      	addi      	r5, 1
    4408:	9805      	ld.w      	r0, (r14, 0x14)
    440a:	3840      	cmpnei      	r0, 0
    440c:	08cf      	bt      	0x45aa	// 45aa <__GI___dtostr+0x2f0>
    440e:	9822      	ld.w      	r1, (r14, 0x8)
    4410:	5d65      	subu      	r3, r5, r1
    4412:	2300      	addi      	r3, 1
    4414:	984b      	ld.w      	r2, (r14, 0x2c)
    4416:	648c      	cmphs      	r3, r2
    4418:	08a5      	bt      	0x4562	// 4562 <__GI___dtostr+0x2a8>
    441a:	3e40      	cmpnei      	r6, 0
    441c:	0f62      	bf      	0x42e0	// 42e0 <__GI___dtostr+0x26>
    441e:	372e      	movi      	r7, 46
    4420:	a5e0      	st.b      	r7, (r5, 0x0)
    4422:	980b      	ld.w      	r0, (r14, 0x2c)
    4424:	5de2      	addi      	r7, r5, 1
    4426:	9822      	ld.w      	r1, (r14, 0x8)
    4428:	2000      	addi      	r0, 1
    442a:	5f65      	subu      	r3, r7, r1
    442c:	584d      	subu      	r2, r0, r3
    442e:	2e00      	subi      	r6, 1
    4430:	b845      	st.w      	r2, (r14, 0x14)
    4432:	9805      	ld.w      	r0, (r14, 0x14)
    4434:	6418      	cmphs      	r6, r0
    4436:	0f55      	bf      	0x42e0	// 42e0 <__GI___dtostr+0x26>
    4438:	6d43      	mov      	r5, r0
    443a:	615c      	addu      	r5, r7
    443c:	36ff      	movi      	r6, 255
    443e:	655e      	cmpne      	r7, r5
    4440:	0c91      	bf      	0x4562	// 4562 <__GI___dtostr+0x2a8>
    4442:	6c93      	mov      	r2, r4
    4444:	9863      	ld.w      	r3, (r14, 0xc)
    4446:	9806      	ld.w      	r0, (r14, 0x18)
    4448:	9827      	ld.w      	r1, (r14, 0x1c)
    444a:	e3fff6f5 	bsr      	0x3234	// 3234 <__divdf3>
    444e:	e3fff7bb 	bsr      	0x33c4	// 33c4 <__fixdfsi>
    4452:	3130      	movi      	r1, 48
    4454:	6040      	addu      	r1, r0
    4456:	a720      	st.b      	r1, (r7, 0x0)
    4458:	6818      	and      	r0, r6
    445a:	e00001c7 	bsr      	0x47e8	// 47e8 <__floatsidf>
    445e:	6c93      	mov      	r2, r4
    4460:	9863      	ld.w      	r3, (r14, 0xc)
    4462:	e3fff5cf 	bsr      	0x3000	// 3000 <__muldf3>
    4466:	6c83      	mov      	r2, r0
    4468:	6cc7      	mov      	r3, r1
    446a:	9806      	ld.w      	r0, (r14, 0x18)
    446c:	9827      	ld.w      	r1, (r14, 0x1c)
    446e:	e3fff5ad 	bsr      	0x2fc8	// 2fc8 <__subdf3>
    4472:	b806      	st.w      	r0, (r14, 0x18)
    4474:	b827      	st.w      	r1, (r14, 0x1c)
    4476:	6c13      	mov      	r0, r4
    4478:	9823      	ld.w      	r1, (r14, 0xc)
    447a:	3200      	movi      	r2, 0
    447c:	1278      	lrw      	r3, 0x40240000	// 45dc <__GI___dtostr+0x322>
    447e:	e3fff6db 	bsr      	0x3234	// 3234 <__divdf3>
    4482:	2700      	addi      	r7, 1
    4484:	6d03      	mov      	r4, r0
    4486:	b823      	st.w      	r1, (r14, 0xc)
    4488:	07db      	br      	0x443e	// 443e <__GI___dtostr+0x184>
    448a:	98a2      	ld.w      	r5, (r14, 0x8)
    448c:	9884      	ld.w      	r4, (r14, 0x10)
    448e:	077a      	br      	0x4382	// 4382 <__GI___dtostr+0xc8>
    4490:	1276      	lrw      	r3, 0x3fb99999	// 45e8 <__GI___dtostr+0x32e>
    4492:	1257      	lrw      	r2, 0x9999999a	// 45ec <__GI___dtostr+0x332>
    4494:	e3fff5b6 	bsr      	0x3000	// 3000 <__muldf3>
    4498:	9865      	ld.w      	r3, (r14, 0x14)
    449a:	2300      	addi      	r3, 1
    449c:	0776      	br      	0x4388	// 4388 <__GI___dtostr+0xce>
    449e:	3080      	movi      	r0, 128
    44a0:	4056      	lsli      	r2, r0, 22
    44a2:	9823      	ld.w      	r1, (r14, 0xc)
    44a4:	6c13      	mov      	r0, r4
    44a6:	1273      	lrw      	r3, 0x4202a05f	// 45f0 <__GI___dtostr+0x336>
    44a8:	e3fff5ac 	bsr      	0x3000	// 3000 <__muldf3>
    44ac:	6d03      	mov      	r4, r0
    44ae:	b823      	st.w      	r1, (r14, 0xc)
    44b0:	2f09      	subi      	r7, 10
    44b2:	0796      	br      	0x43de	// 43de <__GI___dtostr+0x124>
    44b4:	6c13      	mov      	r0, r4
    44b6:	9823      	ld.w      	r1, (r14, 0xc)
    44b8:	3200      	movi      	r2, 0
    44ba:	1269      	lrw      	r3, 0x40240000	// 45dc <__GI___dtostr+0x322>
    44bc:	e3fff5a2 	bsr      	0x3000	// 3000 <__muldf3>
    44c0:	6d03      	mov      	r4, r0
    44c2:	b823      	st.w      	r1, (r14, 0xc)
    44c4:	2f00      	subi      	r7, 1
    44c6:	078e      	br      	0x43e2	// 43e2 <__GI___dtostr+0x128>
    44c8:	9863      	ld.w      	r3, (r14, 0xc)
    44ca:	6c93      	mov      	r2, r4
    44cc:	9806      	ld.w      	r0, (r14, 0x18)
    44ce:	9827      	ld.w      	r1, (r14, 0x1c)
    44d0:	e3fff6b2 	bsr      	0x3234	// 3234 <__divdf3>
    44d4:	e3fff778 	bsr      	0x33c4	// 33c4 <__fixdfsi>
    44d8:	3f40      	cmpnei      	r7, 0
    44da:	74c0      	zextb      	r3, r0
    44dc:	0c03      	bf      	0x44e2	// 44e2 <__GI___dtostr+0x228>
    44de:	3b40      	cmpnei      	r3, 0
    44e0:	0c58      	bf      	0x4590	// 4590 <__GI___dtostr+0x2d6>
    44e2:	232f      	addi      	r3, 48
    44e4:	3e40      	cmpnei      	r6, 0
    44e6:	a560      	st.b      	r3, (r5, 0x0)
    44e8:	2500      	addi      	r5, 1
    44ea:	0842      	bt      	0x456e	// 456e <__GI___dtostr+0x2b4>
    44ec:	6c93      	mov      	r2, r4
    44ee:	9863      	ld.w      	r3, (r14, 0xc)
    44f0:	980a      	ld.w      	r0, (r14, 0x28)
    44f2:	9824      	ld.w      	r1, (r14, 0x10)
    44f4:	e3fff6a0 	bsr      	0x3234	// 3234 <__divdf3>
    44f8:	9845      	ld.w      	r2, (r14, 0x14)
    44fa:	988b      	ld.w      	r4, (r14, 0x2c)
    44fc:	b841      	st.w      	r2, (r14, 0x4)
    44fe:	b880      	st.w      	r4, (r14, 0x0)
    4500:	3300      	movi      	r3, 0
    4502:	9842      	ld.w      	r2, (r14, 0x8)
    4504:	e3fffedb 	bsr      	0x42ba	// 42ba <__GI___dtostr>
    4508:	3840      	cmpnei      	r0, 0
    450a:	0eeb      	bf      	0x42e0	// 42e0 <__GI___dtostr+0x26>
    450c:	5dc0      	addu      	r6, r5, r0
    450e:	37fa      	movi      	r7, 250
    4510:	3565      	movi      	r5, 101
    4512:	6c02      	nor      	r0, r0
    4514:	a6a0      	st.b      	r5, (r6, 0x0)
    4516:	6d03      	mov      	r4, r0
    4518:	5ea2      	addi      	r5, r6, 1
    451a:	3101      	movi      	r1, 1
    451c:	3604      	movi      	r6, 4
    451e:	47e2      	lsli      	r7, r7, 2
    4520:	9808      	ld.w      	r0, (r14, 0x20)
    4522:	65c1      	cmplt      	r0, r7
    4524:	0c03      	bf      	0x452a	// 452a <__GI___dtostr+0x270>
    4526:	3940      	cmpnei      	r1, 0
    4528:	0811      	bt      	0x454a	// 454a <__GI___dtostr+0x290>
    452a:	3c40      	cmpnei      	r4, 0
    452c:	0c08      	bf      	0x453c	// 453c <__GI___dtostr+0x282>
    452e:	6c5f      	mov      	r1, r7
    4530:	9808      	ld.w      	r0, (r14, 0x20)
    4532:	e00012d7 	bsr      	0x6ae0	// 6ae0 <__divsi3>
    4536:	202f      	addi      	r0, 48
    4538:	a500      	st.b      	r0, (r5, 0x0)
    453a:	2500      	addi      	r5, 1
    453c:	6c5f      	mov      	r1, r7
    453e:	9808      	ld.w      	r0, (r14, 0x20)
    4540:	e00012f4 	bsr      	0x6b28	// 6b28 <__modsi3>
    4544:	2c00      	subi      	r4, 1
    4546:	b808      	st.w      	r0, (r14, 0x20)
    4548:	3100      	movi      	r1, 0
    454a:	b823      	st.w      	r1, (r14, 0xc)
    454c:	6c1f      	mov      	r0, r7
    454e:	310a      	movi      	r1, 10
    4550:	2e00      	subi      	r6, 1
    4552:	e00012c7 	bsr      	0x6ae0	// 6ae0 <__divsi3>
    4556:	3e40      	cmpnei      	r6, 0
    4558:	6dc3      	mov      	r7, r0
    455a:	9823      	ld.w      	r1, (r14, 0xc)
    455c:	0be2      	bt      	0x4520	// 4520 <__GI___dtostr+0x266>
    455e:	3c40      	cmpnei      	r4, 0
    4560:	0ec0      	bf      	0x42e0	// 42e0 <__GI___dtostr+0x26>
    4562:	9842      	ld.w      	r2, (r14, 0x8)
    4564:	3300      	movi      	r3, 0
    4566:	5d89      	subu      	r4, r5, r2
    4568:	a560      	st.b      	r3, (r5, 0x0)
    456a:	b889      	st.w      	r4, (r14, 0x24)
    456c:	06ba      	br      	0x42e0	// 42e0 <__GI___dtostr+0x26>
    456e:	7400      	zextb      	r0, r0
    4570:	e000013c 	bsr      	0x47e8	// 47e8 <__floatsidf>
    4574:	6c93      	mov      	r2, r4
    4576:	9863      	ld.w      	r3, (r14, 0xc)
    4578:	e3fff544 	bsr      	0x3000	// 3000 <__muldf3>
    457c:	6c83      	mov      	r2, r0
    457e:	6cc7      	mov      	r3, r1
    4580:	9806      	ld.w      	r0, (r14, 0x18)
    4582:	9827      	ld.w      	r1, (r14, 0x1c)
    4584:	e3fff522 	bsr      	0x2fc8	// 2fc8 <__subdf3>
    4588:	b806      	st.w      	r0, (r14, 0x18)
    458a:	b827      	st.w      	r1, (r14, 0x1c)
    458c:	2e00      	subi      	r6, 1
    458e:	3700      	movi      	r7, 0
    4590:	6c13      	mov      	r0, r4
    4592:	9823      	ld.w      	r1, (r14, 0xc)
    4594:	3200      	movi      	r2, 0
    4596:	1072      	lrw      	r3, 0x40240000	// 45dc <__GI___dtostr+0x322>
    4598:	e3fff64e 	bsr      	0x3234	// 3234 <__divdf3>
    459c:	6d03      	mov      	r4, r0
    459e:	b823      	st.w      	r1, (r14, 0xc)
    45a0:	0723      	br      	0x43e6	// 43e6 <__GI___dtostr+0x12c>
    45a2:	1012      	lrw      	r0, 0x3fb99999	// 45e8 <__GI___dtostr+0x32e>
    45a4:	1092      	lrw      	r4, 0x9999999a	// 45ec <__GI___dtostr+0x332>
    45a6:	b803      	st.w      	r0, (r14, 0xc)
    45a8:	0727      	br      	0x43f6	// 43f6 <__GI___dtostr+0x13c>
    45aa:	3e40      	cmpnei      	r6, 0
    45ac:	0e9a      	bf      	0x42e0	// 42e0 <__GI___dtostr+0x26>
    45ae:	372e      	movi      	r7, 46
    45b0:	a5e0      	st.b      	r7, (r5, 0x0)
    45b2:	2e00      	subi      	r6, 1
    45b4:	5de2      	addi      	r7, r5, 1
    45b6:	073e      	br      	0x4432	// 4432 <__GI___dtostr+0x178>
    45b8:	3e40      	cmpnei      	r6, 0
    45ba:	0ac8      	bt      	0x434a	// 434a <__GI___dtostr+0x90>
    45bc:	3508      	movi      	r5, 8
    45be:	06ac      	br      	0x4316	// 4316 <__GI___dtostr+0x5c>
    45c0:	000091ce 	.long	0x000091ce
    45c4:	000091d2 	.long	0x000091d2
    45c8:	3fe00000 	.long	0x3fe00000
    45cc:	3ff00000 	.long	0x3ff00000
    45d0:	fffffc01 	.long	0xfffffc01
    45d4:	509f79ff 	.long	0x509f79ff
    45d8:	3fd34413 	.long	0x3fd34413
    45dc:	40240000 	.long	0x40240000
    45e0:	cccccccd 	.long	0xcccccccd
    45e4:	3feccccc 	.long	0x3feccccc
    45e8:	3fb99999 	.long	0x3fb99999
    45ec:	9999999a 	.long	0x9999999a
    45f0:	4202a05f 	.long	0x4202a05f

000045f4 <__isnan>:
    45f4:	6c83      	mov      	r2, r0
    45f6:	3a40      	cmpnei      	r2, 0
    45f8:	6c07      	mov      	r0, r1
    45fa:	6cc7      	mov      	r3, r1
    45fc:	3893      	bclri      	r0, 19
    45fe:	0804      	bt      	0x4606	// 4606 <__isnan+0x12>
    4600:	1027      	lrw      	r1, 0x7ff00000	// 461c <__isnan+0x28>
    4602:	6442      	cmpne      	r0, r1
    4604:	0c0a      	bf      	0x4618	// 4618 <__isnan+0x24>
    4606:	3000      	movi      	r0, 0
    4608:	1026      	lrw      	r1, 0xfff80000	// 4620 <__isnan+0x2c>
    460a:	6c81      	xor      	r2, r0
    460c:	6cc5      	xor      	r3, r1
    460e:	6c8c      	or      	r2, r3
    4610:	3a40      	cmpnei      	r2, 0
    4612:	6483      	mvcv      	r2
    4614:	7408      	zextb      	r0, r2
    4616:	783c      	jmp      	r15
    4618:	3001      	movi      	r0, 1
    461a:	07fe      	br      	0x4616	// 4616 <__isnan+0x22>
    461c:	7ff00000 	.long	0x7ff00000
    4620:	fff80000 	.long	0xfff80000

00004624 <__strcpy_fast>:
    4624:	14c1      	push      	r4
    4626:	6d03      	mov      	r4, r0
    4628:	6c87      	mov      	r2, r1
    462a:	6c90      	or      	r2, r4
    462c:	3303      	movi      	r3, 3
    462e:	688c      	and      	r2, r3
    4630:	3a40      	cmpnei      	r2, 0
    4632:	0c08      	bf      	0x4642	// 4642 <__strcpy_fast+0x1e>
    4634:	8160      	ld.b      	r3, (r1, 0x0)
    4636:	a460      	st.b      	r3, (r4, 0x0)
    4638:	2100      	addi      	r1, 1
    463a:	2400      	addi      	r4, 1
    463c:	3b40      	cmpnei      	r3, 0
    463e:	0bfb      	bt      	0x4634	// 4634 <__strcpy_fast+0x10>
    4640:	1481      	pop      	r4
    4642:	9160      	ld.w      	r3, (r1, 0x0)
    4644:	680f      	tstnbz      	r3
    4646:	0c2e      	bf      	0x46a2	// 46a2 <__strcpy_fast+0x7e>
    4648:	b460      	st.w      	r3, (r4, 0x0)
    464a:	9161      	ld.w      	r3, (r1, 0x4)
    464c:	680f      	tstnbz      	r3
    464e:	0c1d      	bf      	0x4688	// 4688 <__strcpy_fast+0x64>
    4650:	b461      	st.w      	r3, (r4, 0x4)
    4652:	9162      	ld.w      	r3, (r1, 0x8)
    4654:	680f      	tstnbz      	r3
    4656:	0c1b      	bf      	0x468c	// 468c <__strcpy_fast+0x68>
    4658:	b462      	st.w      	r3, (r4, 0x8)
    465a:	9163      	ld.w      	r3, (r1, 0xc)
    465c:	680f      	tstnbz      	r3
    465e:	0c19      	bf      	0x4690	// 4690 <__strcpy_fast+0x6c>
    4660:	b463      	st.w      	r3, (r4, 0xc)
    4662:	9164      	ld.w      	r3, (r1, 0x10)
    4664:	680f      	tstnbz      	r3
    4666:	0c17      	bf      	0x4694	// 4694 <__strcpy_fast+0x70>
    4668:	b464      	st.w      	r3, (r4, 0x10)
    466a:	9165      	ld.w      	r3, (r1, 0x14)
    466c:	680f      	tstnbz      	r3
    466e:	0c15      	bf      	0x4698	// 4698 <__strcpy_fast+0x74>
    4670:	b465      	st.w      	r3, (r4, 0x14)
    4672:	9166      	ld.w      	r3, (r1, 0x18)
    4674:	680f      	tstnbz      	r3
    4676:	0c13      	bf      	0x469c	// 469c <__strcpy_fast+0x78>
    4678:	b466      	st.w      	r3, (r4, 0x18)
    467a:	9167      	ld.w      	r3, (r1, 0x1c)
    467c:	680f      	tstnbz      	r3
    467e:	0c11      	bf      	0x46a0	// 46a0 <__strcpy_fast+0x7c>
    4680:	b467      	st.w      	r3, (r4, 0x1c)
    4682:	241f      	addi      	r4, 32
    4684:	211f      	addi      	r1, 32
    4686:	07de      	br      	0x4642	// 4642 <__strcpy_fast+0x1e>
    4688:	2403      	addi      	r4, 4
    468a:	040c      	br      	0x46a2	// 46a2 <__strcpy_fast+0x7e>
    468c:	2407      	addi      	r4, 8
    468e:	040a      	br      	0x46a2	// 46a2 <__strcpy_fast+0x7e>
    4690:	240b      	addi      	r4, 12
    4692:	0408      	br      	0x46a2	// 46a2 <__strcpy_fast+0x7e>
    4694:	240f      	addi      	r4, 16
    4696:	0406      	br      	0x46a2	// 46a2 <__strcpy_fast+0x7e>
    4698:	2413      	addi      	r4, 20
    469a:	0404      	br      	0x46a2	// 46a2 <__strcpy_fast+0x7e>
    469c:	2417      	addi      	r4, 24
    469e:	0402      	br      	0x46a2	// 46a2 <__strcpy_fast+0x7e>
    46a0:	241b      	addi      	r4, 28
    46a2:	3118      	movi      	r1, 24
    46a4:	6c8f      	mov      	r2, r3
    46a6:	7084      	lsl      	r2, r1
    46a8:	7085      	lsr      	r2, r1
    46aa:	a440      	st.b      	r2, (r4, 0x0)
    46ac:	3a40      	cmpnei      	r2, 0
    46ae:	0c12      	bf      	0x46d2	// 46d2 <__strcpy_fast+0xae>
    46b0:	3110      	movi      	r1, 16
    46b2:	6c8f      	mov      	r2, r3
    46b4:	7084      	lsl      	r2, r1
    46b6:	3118      	movi      	r1, 24
    46b8:	7085      	lsr      	r2, r1
    46ba:	a441      	st.b      	r2, (r4, 0x1)
    46bc:	3a40      	cmpnei      	r2, 0
    46be:	0c0a      	bf      	0x46d2	// 46d2 <__strcpy_fast+0xae>
    46c0:	3108      	movi      	r1, 8
    46c2:	6c8f      	mov      	r2, r3
    46c4:	7084      	lsl      	r2, r1
    46c6:	3118      	movi      	r1, 24
    46c8:	7085      	lsr      	r2, r1
    46ca:	a442      	st.b      	r2, (r4, 0x2)
    46cc:	3a40      	cmpnei      	r2, 0
    46ce:	0c02      	bf      	0x46d2	// 46d2 <__strcpy_fast+0xae>
    46d0:	b460      	st.w      	r3, (r4, 0x0)
    46d2:	1481      	pop      	r4

000046d4 <__GI_strchr>:
    46d4:	8040      	ld.b      	r2, (r0, 0x0)
    46d6:	644a      	cmpne      	r2, r1
    46d8:	0c06      	bf      	0x46e4	// 46e4 <__GI_strchr+0x10>
    46da:	3a40      	cmpnei      	r2, 0
    46dc:	0c03      	bf      	0x46e2	// 46e2 <__GI_strchr+0xe>
    46de:	2000      	addi      	r0, 1
    46e0:	07fa      	br      	0x46d4	// 46d4 <__GI_strchr>
    46e2:	6c0b      	mov      	r0, r2
    46e4:	783c      	jmp      	r15
	...

000046e8 <__GI_strerror>:
    46e8:	338f      	movi      	r3, 143
    46ea:	640c      	cmphs      	r3, r0
    46ec:	0c06      	bf      	0x46f8	// 46f8 <__GI_strerror+0x10>
    46ee:	4002      	lsli      	r0, r0, 2
    46f0:	1023      	lrw      	r1, 0x8cdc	// 46fc <__GI_strerror+0x14>
    46f2:	6004      	addu      	r0, r1
    46f4:	9000      	ld.w      	r0, (r0, 0x0)
    46f6:	783c      	jmp      	r15
    46f8:	1002      	lrw      	r0, 0x8fa6	// 4700 <__GI_strerror+0x18>
    46fa:	07fe      	br      	0x46f6	// 46f6 <__GI_strerror+0xe>
    46fc:	00008cdc 	.long	0x00008cdc
    4700:	00008fa6 	.long	0x00008fa6

00004704 <__isinf>:
    4704:	3840      	cmpnei      	r0, 0
    4706:	6c83      	mov      	r2, r0
    4708:	6cc7      	mov      	r3, r1
    470a:	0804      	bt      	0x4712	// 4712 <__isinf+0xe>
    470c:	1028      	lrw      	r1, 0x7ff00000	// 472c <__isinf+0x28>
    470e:	644e      	cmpne      	r3, r1
    4710:	0c0b      	bf      	0x4726	// 4726 <__isinf+0x22>
    4712:	3000      	movi      	r0, 0
    4714:	1027      	lrw      	r1, 0xfff00000	// 4730 <__isinf+0x2c>
    4716:	6c81      	xor      	r2, r0
    4718:	6cc5      	xor      	r3, r1
    471a:	6c8c      	or      	r2, r3
    471c:	3a40      	cmpnei      	r2, 0
    471e:	64c3      	mvcv      	r3
    4720:	3000      	movi      	r0, 0
    4722:	600e      	subu      	r0, r3
    4724:	783c      	jmp      	r15
    4726:	3001      	movi      	r0, 1
    4728:	07fe      	br      	0x4724	// 4724 <__isinf+0x20>
    472a:	0000      	bkpt
    472c:	7ff00000 	.long	0x7ff00000
    4730:	fff00000 	.long	0xfff00000

00004734 <__eqdf2>:
    4734:	14d0      	push      	r15
    4736:	142e      	subi      	r14, r14, 56
    4738:	b800      	st.w      	r0, (r14, 0x0)
    473a:	b821      	st.w      	r1, (r14, 0x4)
    473c:	6c3b      	mov      	r0, r14
    473e:	1904      	addi      	r1, r14, 16
    4740:	b863      	st.w      	r3, (r14, 0xc)
    4742:	b842      	st.w      	r2, (r14, 0x8)
    4744:	e3fff82e 	bsr      	0x37a0	// 37a0 <__unpack_d>
    4748:	1909      	addi      	r1, r14, 36
    474a:	1802      	addi      	r0, r14, 8
    474c:	e3fff82a 	bsr      	0x37a0	// 37a0 <__unpack_d>
    4750:	9864      	ld.w      	r3, (r14, 0x10)
    4752:	3b01      	cmphsi      	r3, 2
    4754:	0c0a      	bf      	0x4768	// 4768 <__eqdf2+0x34>
    4756:	9869      	ld.w      	r3, (r14, 0x24)
    4758:	3b01      	cmphsi      	r3, 2
    475a:	0c07      	bf      	0x4768	// 4768 <__eqdf2+0x34>
    475c:	1909      	addi      	r1, r14, 36
    475e:	1804      	addi      	r0, r14, 16
    4760:	e3fff882 	bsr      	0x3864	// 3864 <__fpcmp_parts_d>
    4764:	140e      	addi      	r14, r14, 56
    4766:	1490      	pop      	r15
    4768:	3001      	movi      	r0, 1
    476a:	140e      	addi      	r14, r14, 56
    476c:	1490      	pop      	r15
	...

00004770 <__gtdf2>:
    4770:	14d0      	push      	r15
    4772:	142e      	subi      	r14, r14, 56
    4774:	b800      	st.w      	r0, (r14, 0x0)
    4776:	b821      	st.w      	r1, (r14, 0x4)
    4778:	6c3b      	mov      	r0, r14
    477a:	1904      	addi      	r1, r14, 16
    477c:	b863      	st.w      	r3, (r14, 0xc)
    477e:	b842      	st.w      	r2, (r14, 0x8)
    4780:	e3fff810 	bsr      	0x37a0	// 37a0 <__unpack_d>
    4784:	1909      	addi      	r1, r14, 36
    4786:	1802      	addi      	r0, r14, 8
    4788:	e3fff80c 	bsr      	0x37a0	// 37a0 <__unpack_d>
    478c:	9864      	ld.w      	r3, (r14, 0x10)
    478e:	3b01      	cmphsi      	r3, 2
    4790:	0c0a      	bf      	0x47a4	// 47a4 <__gtdf2+0x34>
    4792:	9869      	ld.w      	r3, (r14, 0x24)
    4794:	3b01      	cmphsi      	r3, 2
    4796:	0c07      	bf      	0x47a4	// 47a4 <__gtdf2+0x34>
    4798:	1909      	addi      	r1, r14, 36
    479a:	1804      	addi      	r0, r14, 16
    479c:	e3fff864 	bsr      	0x3864	// 3864 <__fpcmp_parts_d>
    47a0:	140e      	addi      	r14, r14, 56
    47a2:	1490      	pop      	r15
    47a4:	3000      	movi      	r0, 0
    47a6:	2800      	subi      	r0, 1
    47a8:	140e      	addi      	r14, r14, 56
    47aa:	1490      	pop      	r15

000047ac <__ltdf2>:
    47ac:	14d0      	push      	r15
    47ae:	142e      	subi      	r14, r14, 56
    47b0:	b800      	st.w      	r0, (r14, 0x0)
    47b2:	b821      	st.w      	r1, (r14, 0x4)
    47b4:	6c3b      	mov      	r0, r14
    47b6:	1904      	addi      	r1, r14, 16
    47b8:	b863      	st.w      	r3, (r14, 0xc)
    47ba:	b842      	st.w      	r2, (r14, 0x8)
    47bc:	e3fff7f2 	bsr      	0x37a0	// 37a0 <__unpack_d>
    47c0:	1909      	addi      	r1, r14, 36
    47c2:	1802      	addi      	r0, r14, 8
    47c4:	e3fff7ee 	bsr      	0x37a0	// 37a0 <__unpack_d>
    47c8:	9864      	ld.w      	r3, (r14, 0x10)
    47ca:	3b01      	cmphsi      	r3, 2
    47cc:	0c0a      	bf      	0x47e0	// 47e0 <__ltdf2+0x34>
    47ce:	9869      	ld.w      	r3, (r14, 0x24)
    47d0:	3b01      	cmphsi      	r3, 2
    47d2:	0c07      	bf      	0x47e0	// 47e0 <__ltdf2+0x34>
    47d4:	1909      	addi      	r1, r14, 36
    47d6:	1804      	addi      	r0, r14, 16
    47d8:	e3fff846 	bsr      	0x3864	// 3864 <__fpcmp_parts_d>
    47dc:	140e      	addi      	r14, r14, 56
    47de:	1490      	pop      	r15
    47e0:	3001      	movi      	r0, 1
    47e2:	140e      	addi      	r14, r14, 56
    47e4:	1490      	pop      	r15
	...

000047e8 <__floatsidf>:
    47e8:	14d1      	push      	r4, r15
    47ea:	1425      	subi      	r14, r14, 20
    47ec:	3303      	movi      	r3, 3
    47ee:	b860      	st.w      	r3, (r14, 0x0)
    47f0:	3840      	cmpnei      	r0, 0
    47f2:	487f      	lsri      	r3, r0, 31
    47f4:	b861      	st.w      	r3, (r14, 0x4)
    47f6:	0808      	bt      	0x4806	// 4806 <__floatsidf+0x1e>
    47f8:	3302      	movi      	r3, 2
    47fa:	b860      	st.w      	r3, (r14, 0x0)
    47fc:	6c3b      	mov      	r0, r14
    47fe:	e3fff703 	bsr      	0x3604	// 3604 <__pack_d>
    4802:	1405      	addi      	r14, r14, 20
    4804:	1491      	pop      	r4, r15
    4806:	38df      	btsti      	r0, 31
    4808:	0812      	bt      	0x482c	// 482c <__floatsidf+0x44>
    480a:	6d03      	mov      	r4, r0
    480c:	6c13      	mov      	r0, r4
    480e:	e3fff63d 	bsr      	0x3488	// 3488 <__clzsi2>
    4812:	321d      	movi      	r2, 29
    4814:	6080      	addu      	r2, r0
    4816:	2802      	subi      	r0, 3
    4818:	38df      	btsti      	r0, 31
    481a:	0810      	bt      	0x483a	// 483a <__floatsidf+0x52>
    481c:	7100      	lsl      	r4, r0
    481e:	3300      	movi      	r3, 0
    4820:	b884      	st.w      	r4, (r14, 0x10)
    4822:	b863      	st.w      	r3, (r14, 0xc)
    4824:	333c      	movi      	r3, 60
    4826:	60ca      	subu      	r3, r2
    4828:	b862      	st.w      	r3, (r14, 0x8)
    482a:	07e9      	br      	0x47fc	// 47fc <__floatsidf+0x14>
    482c:	3380      	movi      	r3, 128
    482e:	4378      	lsli      	r3, r3, 24
    4830:	64c2      	cmpne      	r0, r3
    4832:	0c0d      	bf      	0x484c	// 484c <__floatsidf+0x64>
    4834:	3400      	movi      	r4, 0
    4836:	6102      	subu      	r4, r0
    4838:	07ea      	br      	0x480c	// 480c <__floatsidf+0x24>
    483a:	311f      	movi      	r1, 31
    483c:	4c61      	lsri      	r3, r4, 1
    483e:	604a      	subu      	r1, r2
    4840:	6c13      	mov      	r0, r4
    4842:	70c5      	lsr      	r3, r1
    4844:	7008      	lsl      	r0, r2
    4846:	b864      	st.w      	r3, (r14, 0x10)
    4848:	b803      	st.w      	r0, (r14, 0xc)
    484a:	07ed      	br      	0x4824	// 4824 <__floatsidf+0x3c>
    484c:	3000      	movi      	r0, 0
    484e:	1022      	lrw      	r1, 0xc1e00000	// 4854 <__floatsidf+0x6c>
    4850:	07d9      	br      	0x4802	// 4802 <__floatsidf+0x1a>
    4852:	0000      	bkpt
    4854:	c1e00000 	.long	0xc1e00000

Disassembly of section .text.__main:

00004858 <__main>:
extern char _bss_start[];
extern char _ebss[];


void __main( void ) 
{
    4858:	14d0      	push      	r15

  /* if the start of data (dst)
     is not equal to end of text (src) then
     copy it, else it's already in the right place
     */
  if( _start_data != _end_rodata ) {
    485a:	1009      	lrw      	r0, 0x20000000	// 487c <__main+0x24>
    485c:	1029      	lrw      	r1, 0x9960	// 4880 <__main+0x28>
    485e:	6442      	cmpne      	r0, r1
    4860:	0c05      	bf      	0x486a	// 486a <__main+0x12>
//    __memcpy_fast( dst, src, (_end_data - _start_data));
    memcpy( dst, src, (_end_data - _start_data));
    4862:	1049      	lrw      	r2, 0x20000218	// 4884 <__main+0x2c>
    4864:	6082      	subu      	r2, r0
    4866:	e3fff931 	bsr      	0x3ac8	// 3ac8 <__memcpy_fast>
  }

  /* zero the bss 
   */
  if( _ebss - _bss_start ) {
    486a:	1048      	lrw      	r2, 0x20000358	// 4888 <__main+0x30>
    486c:	1008      	lrw      	r0, 0x20000218	// 488c <__main+0x34>
    486e:	640a      	cmpne      	r2, r0
    4870:	0c05      	bf      	0x487a	// 487a <__main+0x22>
//    __memset_fast( _bss_start, 0x00, ( _ebss - _bss_start ));
    memset( _bss_start, 0x00, ( _ebss - _bss_start ));
    4872:	6082      	subu      	r2, r0
    4874:	3100      	movi      	r1, 0
    4876:	e3fff8a9 	bsr      	0x39c8	// 39c8 <__memset_fast>
  }

	
}
    487a:	1490      	pop      	r15
    487c:	20000000 	.long	0x20000000
    4880:	00009960 	.long	0x00009960
    4884:	20000218 	.long	0x20000218
    4888:	20000358 	.long	0x20000358
    488c:	20000218 	.long	0x20000218

Disassembly of section .text.SYSCON_General_CMD.part.0:

00004890 <SYSCON_General_CMD.part.0>:
/*************************************************************/  
void SYSCON_General_CMD(FunctionalStatus NewState, SYSCON_General_CMD_TypeDef ENDIS_X )
{
	if (NewState != DISABLE)
	{
		if(ENDIS_X==ENDIS_EMOSC) 
    4890:	3848      	cmpnei      	r0, 8
    4892:	0809      	bt      	0x48a4	// 48a4 <SYSCON_General_CMD.part.0+0x14>
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFF00FFF)|0x00044000;					//使能对应PIN
    4894:	107a      	lrw      	r3, 0x20000050	// 48fc <SYSCON_General_CMD.part.0+0x6c>
    4896:	103b      	lrw      	r1, 0xff00fff	// 4900 <SYSCON_General_CMD.part.0+0x70>
    4898:	9340      	ld.w      	r2, (r3, 0x0)
    489a:	9260      	ld.w      	r3, (r2, 0x0)
    489c:	68c4      	and      	r3, r1
    489e:	3bae      	bseti      	r3, 14
    48a0:	3bb2      	bseti      	r3, 18
    48a2:	b260      	st.w      	r3, (r2, 0x0)
		SYSCON->GCER|=ENDIS_X;													//enable SYSCON General Control
    48a4:	1078      	lrw      	r3, 0x2000005c	// 4904 <SYSCON_General_CMD.part.0+0x74>
    48a6:	9360      	ld.w      	r3, (r3, 0x0)
    48a8:	9341      	ld.w      	r2, (r3, 0x4)
    48aa:	6c80      	or      	r2, r0
    48ac:	b341      	st.w      	r2, (r3, 0x4)
		while(!(SYSCON->GCSR&ENDIS_X));											//check  Enable?	
    48ae:	9343      	ld.w      	r2, (r3, 0xc)
    48b0:	6880      	and      	r2, r0
    48b2:	3a40      	cmpnei      	r2, 0
    48b4:	0ffd      	bf      	0x48ae	// 48ae <SYSCON_General_CMD.part.0+0x1e>
		switch(ENDIS_X)
    48b6:	3842      	cmpnei      	r0, 2
    48b8:	0807      	bt      	0x48c6	// 48c6 <SYSCON_General_CMD.part.0+0x36>
		{
			case ENDIS_IMOSC:
				while (!(SYSCON->CKST & ENDIS_IMOSC)); 	
    48ba:	3102      	movi      	r1, 2
    48bc:	9344      	ld.w      	r2, (r3, 0x10)
    48be:	6884      	and      	r2, r1
    48c0:	3a40      	cmpnei      	r2, 0
    48c2:	0ffd      	bf      	0x48bc	// 48bc <SYSCON_General_CMD.part.0+0x2c>
	{
		SYSCON->GCDR|=ENDIS_X;													//disable SYSCON General Control
		while(SYSCON->GCSR&ENDIS_X);											//check  Disable?
		SYSCON->ICR|=ENDIS_X;													// Clear ENDIS_X stable bit
	}
}
    48c4:	783c      	jmp      	r15
		switch(ENDIS_X)
    48c6:	3802      	cmphsi      	r0, 3
    48c8:	0809      	bt      	0x48da	// 48da <SYSCON_General_CMD.part.0+0x4a>
    48ca:	3841      	cmpnei      	r0, 1
    48cc:	0bfc      	bt      	0x48c4	// 48c4 <SYSCON_General_CMD.part.0+0x34>
				while (!(SYSCON->CKST & ENDIS_ISOSC)); 
    48ce:	3101      	movi      	r1, 1
    48d0:	9344      	ld.w      	r2, (r3, 0x10)
    48d2:	6884      	and      	r2, r1
    48d4:	3a40      	cmpnei      	r2, 0
    48d6:	0ffd      	bf      	0x48d0	// 48d0 <SYSCON_General_CMD.part.0+0x40>
    48d8:	07f6      	br      	0x48c4	// 48c4 <SYSCON_General_CMD.part.0+0x34>
		switch(ENDIS_X)
    48da:	3848      	cmpnei      	r0, 8
    48dc:	0807      	bt      	0x48ea	// 48ea <SYSCON_General_CMD.part.0+0x5a>
				while (!(SYSCON->CKST & ENDIS_EMOSC)); 
    48de:	3108      	movi      	r1, 8
    48e0:	9344      	ld.w      	r2, (r3, 0x10)
    48e2:	6884      	and      	r2, r1
    48e4:	3a40      	cmpnei      	r2, 0
    48e6:	0ffd      	bf      	0x48e0	// 48e0 <SYSCON_General_CMD.part.0+0x50>
    48e8:	07ee      	br      	0x48c4	// 48c4 <SYSCON_General_CMD.part.0+0x34>
		switch(ENDIS_X)
    48ea:	3850      	cmpnei      	r0, 16
    48ec:	0bec      	bt      	0x48c4	// 48c4 <SYSCON_General_CMD.part.0+0x34>
				while (!(SYSCON->CKST & ENDIS_HFOSC)); 
    48ee:	3110      	movi      	r1, 16
    48f0:	9344      	ld.w      	r2, (r3, 0x10)
    48f2:	6884      	and      	r2, r1
    48f4:	3a40      	cmpnei      	r2, 0
    48f6:	0ffd      	bf      	0x48f0	// 48f0 <SYSCON_General_CMD.part.0+0x60>
    48f8:	07e6      	br      	0x48c4	// 48c4 <SYSCON_General_CMD.part.0+0x34>
    48fa:	0000      	bkpt
    48fc:	20000050 	.long	0x20000050
    4900:	0ff00fff 	.long	0x0ff00fff
    4904:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_RST_VALUE:

00004908 <SYSCON_RST_VALUE>:
	SYSCON->RAMCHK=SYSCON_RAMCHK_RST;
    4908:	106f      	lrw      	r3, 0x2000005c	// 4944 <SYSCON_RST_VALUE+0x3c>
    490a:	1050      	lrw      	r2, 0xffff	// 4948 <SYSCON_RST_VALUE+0x40>
    490c:	9360      	ld.w      	r3, (r3, 0x0)
    490e:	b345      	st.w      	r2, (r3, 0x14)
	SYSCON->EFLCHK=SYSCON_EFLCHK_RST;
    4910:	104f      	lrw      	r2, 0xffffff	// 494c <SYSCON_RST_VALUE+0x44>
    4912:	b346      	st.w      	r2, (r3, 0x18)
	SYSCON->SCLKCR=SYSCON_SCLKCR_RST;
    4914:	104f      	lrw      	r2, 0xd22d0000	// 4950 <SYSCON_RST_VALUE+0x48>
    4916:	b347      	st.w      	r2, (r3, 0x1c)
	SYSCON->OSTR=SYSCON_OSTR_RST;
    4918:	104f      	lrw      	r2, 0x70ff3bff	// 4954 <SYSCON_RST_VALUE+0x4c>
    491a:	b350      	st.w      	r2, (r3, 0x40)
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
    491c:	3180      	movi      	r1, 128
	SYSCON->LVDCR=SYSCON_LVDCR_RST;
    491e:	320a      	movi      	r2, 10
    4920:	b353      	st.w      	r2, (r3, 0x4c)
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
    4922:	604c      	addu      	r1, r3
    4924:	3200      	movi      	r2, 0
	SYSCON->IWDCR=SYSCON_IWDCR_RST;
    4926:	100d      	lrw      	r0, 0x70c	// 4958 <SYSCON_RST_VALUE+0x50>
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
    4928:	b145      	st.w      	r2, (r1, 0x14)
	SYSCON->UREG0=SYSCON_UREG0_RST;
    492a:	23ff      	addi      	r3, 256
	SYSCON->EXIFT=SYSCON_EXIFT_RST;
    492c:	b146      	st.w      	r2, (r1, 0x18)
	SYSCON->IWDCR=SYSCON_IWDCR_RST;
    492e:	b10d      	st.w      	r0, (r1, 0x34)
	SYSCON->IWDCNT=SYSCON_IWDCNT_RST;
    4930:	100b      	lrw      	r0, 0x3fe	// 495c <SYSCON_RST_VALUE+0x54>
    4932:	b10e      	st.w      	r0, (r1, 0x38)
	SYSCON->EVTRG=SYSCON_EVTRG_RST;
    4934:	b15d      	st.w      	r2, (r1, 0x74)
	SYSCON->EVPS=SYSCON_EVPS_RST;
    4936:	b15e      	st.w      	r2, (r1, 0x78)
	SYSCON->EVSWF=SYSCON_EVSWF_RST;
    4938:	b15f      	st.w      	r2, (r1, 0x7c)
	SYSCON->UREG0=SYSCON_UREG0_RST;
    493a:	b340      	st.w      	r2, (r3, 0x0)
	SYSCON->UREG1=SYSCON_UREG1_RST;
    493c:	b341      	st.w      	r2, (r3, 0x4)
	SYSCON->UREG2=SYSCON_UREG2_RST;
    493e:	b342      	st.w      	r2, (r3, 0x8)
	SYSCON->UREG3=SYSCON_UREG3_RST;
    4940:	b343      	st.w      	r2, (r3, 0xc)
}
    4942:	783c      	jmp      	r15
    4944:	2000005c 	.long	0x2000005c
    4948:	0000ffff 	.long	0x0000ffff
    494c:	00ffffff 	.long	0x00ffffff
    4950:	d22d0000 	.long	0xd22d0000
    4954:	70ff3bff 	.long	0x70ff3bff
    4958:	0000070c 	.long	0x0000070c
    495c:	000003fe 	.long	0x000003fe

Disassembly of section .text.SYSCON_General_CMD:

00004960 <SYSCON_General_CMD>:
{
    4960:	14d0      	push      	r15
	if (NewState != DISABLE)
    4962:	3840      	cmpnei      	r0, 0
    4964:	0c05      	bf      	0x496e	// 496e <SYSCON_General_CMD+0xe>
    4966:	6c07      	mov      	r0, r1
    4968:	e3ffff94 	bsr      	0x4890	// 4890 <SYSCON_General_CMD.part.0>
}
    496c:	1490      	pop      	r15
		SYSCON->GCDR|=ENDIS_X;													//disable SYSCON General Control
    496e:	1068      	lrw      	r3, 0x2000005c	// 498c <SYSCON_General_CMD+0x2c>
    4970:	9360      	ld.w      	r3, (r3, 0x0)
    4972:	9342      	ld.w      	r2, (r3, 0x8)
    4974:	6c84      	or      	r2, r1
    4976:	b342      	st.w      	r2, (r3, 0x8)
		while(SYSCON->GCSR&ENDIS_X);											//check  Disable?
    4978:	9343      	ld.w      	r2, (r3, 0xc)
    497a:	6884      	and      	r2, r1
    497c:	3a40      	cmpnei      	r2, 0
    497e:	0bfd      	bt      	0x4978	// 4978 <SYSCON_General_CMD+0x18>
		SYSCON->ICR|=ENDIS_X;													// Clear ENDIS_X stable bit
    4980:	237f      	addi      	r3, 128
    4982:	9301      	ld.w      	r0, (r3, 0x4)
    4984:	6c40      	or      	r1, r0
    4986:	b321      	st.w      	r1, (r3, 0x4)
}
    4988:	07f2      	br      	0x496c	// 496c <SYSCON_General_CMD+0xc>
    498a:	0000      	bkpt
    498c:	2000005c 	.long	0x2000005c

Disassembly of section .text.SystemCLK_HCLKDIV_PCLKDIV_Config:

00004990 <SystemCLK_HCLKDIV_PCLKDIV_Config>:
//SystemClk_data_x:EMOSC_24M,EMOSC_16M,EMOSC_12M,EMOSC_8M,EMOSC_4M,EMOSC_36K,
//ISOSC,IMOSC,HFOSC_48M,HFOSC_24M,HFOSC_12M,HFOSC_6M
//ReturnValue:NONE
/*************************************************************/ 
void SystemCLK_HCLKDIV_PCLKDIV_Config(SystemCLK_TypeDef SYSCLK_X , SystemCLK_Div_TypeDef HCLK_DIV_X , PCLK_Div_TypeDef PCLK_DIV_X , SystemClk_data_TypeDef SystemClk_data_x )
{
    4990:	14c2      	push      	r4-r5
	if(SystemClk_data_x==HFOSC_48M)
    4992:	3b48      	cmpnei      	r3, 8
    4994:	0826      	bt      	0x49e0	// 49e0 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x50>
	{
		IFC->CEDR=0X01;						//CLKEN
    4996:	1098      	lrw      	r4, 0x20000060	// 49f4 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x64>
    4998:	3501      	movi      	r5, 1
    499a:	9480      	ld.w      	r4, (r4, 0x0)
    499c:	b4a1      	st.w      	r5, (r4, 0x4)
		IFC->MR=0X02|(0X01<<16);			//高速模式
    499e:	10b7      	lrw      	r5, 0x10002	// 49f8 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x68>
	}
	if((SystemClk_data_x==EMOSC_24M)||(SystemClk_data_x==EMOSC_16M)||(SystemClk_data_x==HFOSC_24M))
	{
		IFC->CEDR=0X01;						//CLKEN
		IFC->MR=0X01|(0X01<<16);			//中速模式
    49a0:	b4a5      	st.w      	r5, (r4, 0x14)
	}
	if((SystemClk_data_x==EMOSC_12M)||(SystemClk_data_x==EMOSC_8M)||(SystemClk_data_x==EMOSC_4M)||(SystemClk_data_x==EMOSC_36K)
		||(SystemClk_data_x==IMOSC)||(SystemClk_data_x==ISOSC)||(SystemClk_data_x==HFOSC_12M)||(SystemClk_data_x==HFOSC_6M))
    49a2:	5b87      	subi      	r4, r3, 2
	if((SystemClk_data_x==EMOSC_12M)||(SystemClk_data_x==EMOSC_8M)||(SystemClk_data_x==EMOSC_4M)||(SystemClk_data_x==EMOSC_36K)
    49a4:	3c05      	cmphsi      	r4, 6
    49a6:	0c04      	bf      	0x49ae	// 49ae <SystemCLK_HCLKDIV_PCLKDIV_Config+0x1e>
		||(SystemClk_data_x==IMOSC)||(SystemClk_data_x==ISOSC)||(SystemClk_data_x==HFOSC_12M)||(SystemClk_data_x==HFOSC_6M))
    49a8:	2b09      	subi      	r3, 10
    49aa:	3b01      	cmphsi      	r3, 2
    49ac:	0807      	bt      	0x49ba	// 49ba <SystemCLK_HCLKDIV_PCLKDIV_Config+0x2a>
	{
		IFC->CEDR=0X01;						//CLKEN
    49ae:	1072      	lrw      	r3, 0x20000060	// 49f4 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x64>
    49b0:	3401      	movi      	r4, 1
    49b2:	9360      	ld.w      	r3, (r3, 0x0)
    49b4:	b381      	st.w      	r4, (r3, 0x4)
		IFC->MR=0X00|(0X00<<16);			//低速
    49b6:	3400      	movi      	r4, 0
    49b8:	b385      	st.w      	r4, (r3, 0x14)
	}
	SYSCON->SCLKCR=SYSCLK_KEY | HCLK_DIV_X| SYSCLK_X;
    49ba:	1091      	lrw      	r4, 0xd22d0000	// 49fc <SystemCLK_HCLKDIV_PCLKDIV_Config+0x6c>
    49bc:	6c10      	or      	r0, r4
    49be:	1071      	lrw      	r3, 0x2000005c	// 4a00 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x70>
    49c0:	6c40      	or      	r1, r0
    49c2:	9360      	ld.w      	r3, (r3, 0x0)
	while (!(SYSCON->CKST & (1<<8))); 											// waiting for sysclk stable
    49c4:	3080      	movi      	r0, 128
	SYSCON->SCLKCR=SYSCLK_KEY | HCLK_DIV_X| SYSCLK_X;
    49c6:	b327      	st.w      	r1, (r3, 0x1c)
	while (!(SYSCON->CKST & (1<<8))); 											// waiting for sysclk stable
    49c8:	4001      	lsli      	r0, r0, 1
    49ca:	9324      	ld.w      	r1, (r3, 0x10)
    49cc:	6840      	and      	r1, r0
    49ce:	3940      	cmpnei      	r1, 0
    49d0:	0ffd      	bf      	0x49ca	// 49ca <SystemCLK_HCLKDIV_PCLKDIV_Config+0x3a>
	SYSCON->PCLKCR=PCLK_KEY|PCLK_DIV_X;											//PCLK DIV 1 2 4 6 8 16		
    49d2:	102d      	lrw      	r1, 0xc33c0000	// 4a04 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x74>
    49d4:	6c48      	or      	r1, r2
    49d6:	b328      	st.w      	r1, (r3, 0x20)
	while(SYSCON->PCLKCR!=PCLK_DIV_X);											//Wait PCLK DIV
    49d8:	9328      	ld.w      	r1, (r3, 0x20)
    49da:	644a      	cmpne      	r2, r1
    49dc:	0bfe      	bt      	0x49d8	// 49d8 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x48>
}
    49de:	1482      	pop      	r4-r5
	if((SystemClk_data_x==EMOSC_24M)||(SystemClk_data_x==EMOSC_16M)||(SystemClk_data_x==HFOSC_24M))
    49e0:	3b01      	cmphsi      	r3, 2
    49e2:	0c03      	bf      	0x49e8	// 49e8 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x58>
    49e4:	3b49      	cmpnei      	r3, 9
    49e6:	0bde      	bt      	0x49a2	// 49a2 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x12>
		IFC->CEDR=0X01;						//CLKEN
    49e8:	1083      	lrw      	r4, 0x20000060	// 49f4 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x64>
    49ea:	3501      	movi      	r5, 1
    49ec:	9480      	ld.w      	r4, (r4, 0x0)
    49ee:	b4a1      	st.w      	r5, (r4, 0x4)
		IFC->MR=0X01|(0X01<<16);			//中速模式
    49f0:	10a6      	lrw      	r5, 0x10001	// 4a08 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x78>
    49f2:	07d7      	br      	0x49a0	// 49a0 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x10>
    49f4:	20000060 	.long	0x20000060
    49f8:	00010002 	.long	0x00010002
    49fc:	d22d0000 	.long	0xd22d0000
    4a00:	2000005c 	.long	0x2000005c
    4a04:	c33c0000 	.long	0xc33c0000
    4a08:	00010001 	.long	0x00010001

Disassembly of section .text.SYSCON_HFOSC_SELECTE:

00004a0c <SYSCON_HFOSC_SELECTE>:
//EntryParameter:HFOSC_SELECTE_X
//HFOSC_SELECTE_X:HFOSC_SELECTE_48M,HFOSC_SELECTE_24M;HFOSC_SELECTE_12M;HFOSC_SELECTE_6M
//ReturnValue:NONE
/*************************************************************/  
void SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_TypeDef HFOSC_SELECTE_X)
{		
    4a0c:	14d1      	push      	r4, r15
    4a0e:	6d03      	mov      	r4, r0
	SYSCON_General_CMD(DISABLE,ENDIS_HFOSC);					//disable HFOSC
    4a10:	3110      	movi      	r1, 16
    4a12:	3000      	movi      	r0, 0
    4a14:	e3ffffa6 	bsr      	0x4960	// 4960 <SYSCON_General_CMD>
	SYSCON->OPT1 = (SYSCON->OPT1 & 0XFFFFFFCF)|HFOSC_SELECTE_X;
    4a18:	1066      	lrw      	r3, 0x2000005c	// 4a30 <SYSCON_HFOSC_SELECTE+0x24>
    4a1a:	9360      	ld.w      	r3, (r3, 0x0)
    4a1c:	9319      	ld.w      	r0, (r3, 0x64)
    4a1e:	3884      	bclri      	r0, 4
    4a20:	3885      	bclri      	r0, 5
    4a22:	6c10      	or      	r0, r4
    4a24:	b319      	st.w      	r0, (r3, 0x64)
    4a26:	3010      	movi      	r0, 16
    4a28:	e3ffff34 	bsr      	0x4890	// 4890 <SYSCON_General_CMD.part.0>
	SYSCON_General_CMD(ENABLE,ENDIS_HFOSC);						//enable HFOSC
}
    4a2c:	1491      	pop      	r4, r15
    4a2e:	0000      	bkpt
    4a30:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_WDT_CMD:

00004a34 <SYSCON_WDT_CMD>:
//EntryParameter:,NewState
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_WDT_CMD(FunctionalStatus NewState)
{
    4a34:	106c      	lrw      	r3, 0x2000005c	// 4a64 <SYSCON_WDT_CMD+0x30>
	if(NewState != DISABLE)
    4a36:	3840      	cmpnei      	r0, 0
	{
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
    4a38:	9360      	ld.w      	r3, (r3, 0x0)
    4a3a:	237f      	addi      	r3, 128
	if(NewState != DISABLE)
    4a3c:	0c0a      	bf      	0x4a50	// 4a50 <SYSCON_WDT_CMD+0x1c>
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
    4a3e:	104b      	lrw      	r2, 0x78870000	// 4a68 <SYSCON_WDT_CMD+0x34>
		while(!(SYSCON->IWDCR&Check_IWDT_BUSY));
    4a40:	3180      	movi      	r1, 128
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
    4a42:	b34f      	st.w      	r2, (r3, 0x3c)
		while(!(SYSCON->IWDCR&Check_IWDT_BUSY));
    4a44:	4125      	lsli      	r1, r1, 5
    4a46:	934d      	ld.w      	r2, (r3, 0x34)
    4a48:	6884      	and      	r2, r1
    4a4a:	3a40      	cmpnei      	r2, 0
    4a4c:	0ffd      	bf      	0x4a46	// 4a46 <SYSCON_WDT_CMD+0x12>
	else
	{
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
	}
}
    4a4e:	783c      	jmp      	r15
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
    4a50:	1047      	lrw      	r2, 0x788755aa	// 4a6c <SYSCON_WDT_CMD+0x38>
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
    4a52:	3180      	movi      	r1, 128
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
    4a54:	b34f      	st.w      	r2, (r3, 0x3c)
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
    4a56:	4125      	lsli      	r1, r1, 5
    4a58:	934d      	ld.w      	r2, (r3, 0x34)
    4a5a:	6884      	and      	r2, r1
    4a5c:	3a40      	cmpnei      	r2, 0
    4a5e:	0bfd      	bt      	0x4a58	// 4a58 <SYSCON_WDT_CMD+0x24>
    4a60:	07f7      	br      	0x4a4e	// 4a4e <SYSCON_WDT_CMD+0x1a>
    4a62:	0000      	bkpt
    4a64:	2000005c 	.long	0x2000005c
    4a68:	78870000 	.long	0x78870000
    4a6c:	788755aa 	.long	0x788755aa

Disassembly of section .text.SYSCON_IWDCNT_Reload:

00004a70 <SYSCON_IWDCNT_Reload>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void SYSCON_IWDCNT_Reload(void)
{
	SYSCON->IWDCNT=CLR_IWDT;
    4a70:	1064      	lrw      	r3, 0x2000005c	// 4a80 <SYSCON_IWDCNT_Reload+0x10>
    4a72:	32b4      	movi      	r2, 180
    4a74:	9360      	ld.w      	r3, (r3, 0x0)
    4a76:	237f      	addi      	r3, 128
    4a78:	4257      	lsli      	r2, r2, 23
    4a7a:	b34e      	st.w      	r2, (r3, 0x38)
}
    4a7c:	783c      	jmp      	r15
    4a7e:	0000      	bkpt
    4a80:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_IWDCNT_Config:

00004a84 <SYSCON_IWDCNT_Config>:
//IWDT_INTW_DIV_X:IWDT_INTW_DIV_1/2/3/4/4/5/6
//ReturnValue: NONE
/*************************************************************/
void SYSCON_IWDCNT_Config(IWDT_TIME_TypeDef IWDT_TIME_X , IWDT_TIMEDIV_TypeDef IWDT_INTW_DIV_X )
{
	SYSCON->IWDCR=IWDT_KEY|IWDT_TIME_X|IWDT_INTW_DIV_X;
    4a84:	1044      	lrw      	r2, 0x87780000	// 4a94 <SYSCON_IWDCNT_Config+0x10>
    4a86:	1065      	lrw      	r3, 0x2000005c	// 4a98 <SYSCON_IWDCNT_Config+0x14>
    4a88:	6c48      	or      	r1, r2
    4a8a:	9360      	ld.w      	r3, (r3, 0x0)
    4a8c:	6c04      	or      	r0, r1
    4a8e:	237f      	addi      	r3, 128
    4a90:	b30d      	st.w      	r0, (r3, 0x34)
}
    4a92:	783c      	jmp      	r15
    4a94:	87780000 	.long	0x87780000
    4a98:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_LVD_Config:

00004a9c <SYSCON_LVD_Config>:
//X_LVD_INT:ENABLE_LVD_INT,DISABLE_LVD_INT
//INTDET_POL_X:INTDET_POL_fall,INTDET_POL_X_rise,INTDET_POL_X_riseORfall
//ReturnValue: NONE
/*************************************************************/
void SYSCON_LVD_Config(X_LVDEN_TypeDef X_LVDEN , INTDET_LVL_X_TypeDef INTDET_LVL_X , RSTDET_LVL_X_TypeDef RSTDET_LVL_X , X_LVD_INT_TypeDef X_LVD_INT , INTDET_POL_X_TypeDef INTDET_POL_X)
{
    4a9c:	14c3      	push      	r4-r6
    4a9e:	9883      	ld.w      	r4, (r14, 0xc)
	//SYSCON->LVDCR=LVD_KEY;
	SYSCON->LVDCR=LVD_KEY|X_LVDEN|INTDET_LVL_X|RSTDET_LVL_X|X_LVD_INT|INTDET_POL_X;
    4aa0:	10c5      	lrw      	r6, 0xb44b0000	// 4ab4 <SYSCON_LVD_Config+0x18>
    4aa2:	6d18      	or      	r4, r6
    4aa4:	6cd0      	or      	r3, r4
    4aa6:	6c8c      	or      	r2, r3
    4aa8:	6c48      	or      	r1, r2
    4aaa:	10a4      	lrw      	r5, 0x2000005c	// 4ab8 <SYSCON_LVD_Config+0x1c>
    4aac:	6c04      	or      	r0, r1
    4aae:	95a0      	ld.w      	r5, (r5, 0x0)
    4ab0:	b513      	st.w      	r0, (r5, 0x4c)
}
    4ab2:	1483      	pop      	r4-r6
    4ab4:	b44b0000 	.long	0xb44b0000
    4ab8:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXTI_trigger_CMD:

00004abc <EXTI_trigger_CMD>:
//EXI_tringer_mode:_EXIRT,_EXIFT
//ReturnValue: LVD detection flag
/*************************************************************/
void EXTI_trigger_CMD(FunctionalStatus NewState , SYSCON_EXIPIN_TypeDef  EXIPIN , EXI_tringer_mode_TypeDef EXI_tringer_mode)
{
	switch(EXI_tringer_mode)
    4abc:	3a40      	cmpnei      	r2, 0
    4abe:	0c04      	bf      	0x4ac6	// 4ac6 <EXTI_trigger_CMD+0xa>
    4ac0:	3a41      	cmpnei      	r2, 1
    4ac2:	0c0e      	bf      	0x4ade	// 4ade <EXTI_trigger_CMD+0x22>
		{
			SYSCON->EXIFT &=~EXIPIN;	
		}
		break;
	}	
}
    4ac4:	783c      	jmp      	r15
    4ac6:	106d      	lrw      	r3, 0x2000005c	// 4af8 <EXTI_trigger_CMD+0x3c>
		if(NewState != DISABLE)
    4ac8:	3840      	cmpnei      	r0, 0
			SYSCON->EXIRT |=EXIPIN;
    4aca:	9360      	ld.w      	r3, (r3, 0x0)
    4acc:	237f      	addi      	r3, 128
    4ace:	9345      	ld.w      	r2, (r3, 0x14)
		if(NewState != DISABLE)
    4ad0:	0c04      	bf      	0x4ad8	// 4ad8 <EXTI_trigger_CMD+0x1c>
			SYSCON->EXIRT |=EXIPIN;
    4ad2:	6c48      	or      	r1, r2
    4ad4:	b325      	st.w      	r1, (r3, 0x14)
    4ad6:	07f7      	br      	0x4ac4	// 4ac4 <EXTI_trigger_CMD+0x8>
			SYSCON->EXIRT &=~EXIPIN;	
    4ad8:	6885      	andn      	r2, r1
    4ada:	b345      	st.w      	r2, (r3, 0x14)
    4adc:	07f4      	br      	0x4ac4	// 4ac4 <EXTI_trigger_CMD+0x8>
    4ade:	1067      	lrw      	r3, 0x2000005c	// 4af8 <EXTI_trigger_CMD+0x3c>
		if(NewState != DISABLE)
    4ae0:	3840      	cmpnei      	r0, 0
			SYSCON->EXIFT |=EXIPIN;
    4ae2:	9360      	ld.w      	r3, (r3, 0x0)
    4ae4:	237f      	addi      	r3, 128
    4ae6:	9346      	ld.w      	r2, (r3, 0x18)
		if(NewState != DISABLE)
    4ae8:	0c04      	bf      	0x4af0	// 4af0 <EXTI_trigger_CMD+0x34>
			SYSCON->EXIFT |=EXIPIN;
    4aea:	6c48      	or      	r1, r2
    4aec:	b326      	st.w      	r1, (r3, 0x18)
    4aee:	07eb      	br      	0x4ac4	// 4ac4 <EXTI_trigger_CMD+0x8>
			SYSCON->EXIFT &=~EXIPIN;	
    4af0:	6885      	andn      	r2, r1
    4af2:	b346      	st.w      	r2, (r3, 0x18)
}
    4af4:	07e8      	br      	0x4ac4	// 4ac4 <EXTI_trigger_CMD+0x8>
    4af6:	0000      	bkpt
    4af8:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXTI_interrupt_CMD:

00004afc <EXTI_interrupt_CMD>:
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/
void EXTI_interrupt_CMD(FunctionalStatus NewState , SYSCON_EXIPIN_TypeDef  EXIPIN)
{
	SYSCON->EXICR = 0X3FFF;									//Claer EXI INT status
    4afc:	106b      	lrw      	r3, 0x2000005c	// 4b28 <EXTI_interrupt_CMD+0x2c>
    4afe:	104c      	lrw      	r2, 0x3fff	// 4b2c <EXTI_interrupt_CMD+0x30>
    4b00:	9360      	ld.w      	r3, (r3, 0x0)
    4b02:	237f      	addi      	r3, 128
	if(NewState != DISABLE)
    4b04:	3840      	cmpnei      	r0, 0
	SYSCON->EXICR = 0X3FFF;									//Claer EXI INT status
    4b06:	b34b      	st.w      	r2, (r3, 0x2c)
	if(NewState != DISABLE)
    4b08:	0c0c      	bf      	0x4b20	// 4b20 <EXTI_interrupt_CMD+0x24>
	{
		SYSCON->EXIER|=EXIPIN;								//EXI4 interrupt enable
    4b0a:	9347      	ld.w      	r2, (r3, 0x1c)
    4b0c:	6c84      	or      	r2, r1
    4b0e:	b347      	st.w      	r2, (r3, 0x1c)
		while(!(SYSCON->EXIMR&EXIPIN));						//Check EXI is enabled or not
    4b10:	9349      	ld.w      	r2, (r3, 0x24)
    4b12:	6884      	and      	r2, r1
    4b14:	3a40      	cmpnei      	r2, 0
    4b16:	0ffd      	bf      	0x4b10	// 4b10 <EXTI_interrupt_CMD+0x14>
		SYSCON->EXICR |=EXIPIN;								// Clear EXI status bit
    4b18:	934b      	ld.w      	r2, (r3, 0x2c)
    4b1a:	6c48      	or      	r1, r2
    4b1c:	b32b      	st.w      	r1, (r3, 0x2c)
	}
	else
	{
		SYSCON->EXIDR|=EXIPIN;
	}
}
    4b1e:	783c      	jmp      	r15
		SYSCON->EXIDR|=EXIPIN;
    4b20:	9348      	ld.w      	r2, (r3, 0x20)
    4b22:	6c48      	or      	r1, r2
    4b24:	b328      	st.w      	r1, (r3, 0x20)
}
    4b26:	07fc      	br      	0x4b1e	// 4b1e <EXTI_interrupt_CMD+0x22>
    4b28:	2000005c 	.long	0x2000005c
    4b2c:	00003fff 	.long	0x00003fff

Disassembly of section .text.PCLK_goto_deepsleep_mode:

00004b30 <PCLK_goto_deepsleep_mode>:
//ReturnValue:NONE
/*************************************************************/
void PCLK_goto_deepsleep_mode(void)
{
//	SYSCON->WKCR=0X3F<<8;
	SYSCON->WKCR=0X00<<8;
    4b30:	1064      	lrw      	r3, 0x2000005c	// 4b40 <PCLK_goto_deepsleep_mode+0x10>
    4b32:	3200      	movi      	r2, 0
    4b34:	9360      	ld.w      	r3, (r3, 0x0)
    4b36:	b35b      	st.w      	r2, (r3, 0x6c)
	asm ("stop");
    4b38:	c0004820 	stop
}  
    4b3c:	783c      	jmp      	r15
    4b3e:	0000      	bkpt
    4b40:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXI0_Int_Enable:

00004b44 <EXI0_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI0_Int_Enable(void)
{
	INTC_ISER_WRITE(EXI0_INT);    
    4b44:	3280      	movi      	r2, 128
    4b46:	1062      	lrw      	r3, 0xe000e100	// 4b4c <EXI0_Int_Enable+0x8>
    4b48:	b340      	st.w      	r2, (r3, 0x0)
}
    4b4a:	783c      	jmp      	r15
    4b4c:	e000e100 	.long	0xe000e100

Disassembly of section .text.EXI1_Int_Enable:

00004b50 <EXI1_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI1_Int_Enable(void)
{
	INTC_ISER_WRITE(EXI1_INT);    
    4b50:	3380      	movi      	r3, 128
    4b52:	4361      	lsli      	r3, r3, 1
    4b54:	1042      	lrw      	r2, 0xe000e100	// 4b5c <EXI1_Int_Enable+0xc>
    4b56:	b260      	st.w      	r3, (r2, 0x0)
}
    4b58:	783c      	jmp      	r15
    4b5a:	0000      	bkpt
    4b5c:	e000e100 	.long	0xe000e100

Disassembly of section .text.EXI2_Int_Enable:

00004b60 <EXI2_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI2_Int_Enable(void)
{
	INTC_ISER_WRITE(EXI2_INT);    
    4b60:	3380      	movi      	r3, 128
    4b62:	436e      	lsli      	r3, r3, 14
    4b64:	1042      	lrw      	r2, 0xe000e100	// 4b6c <EXI2_Int_Enable+0xc>
    4b66:	b260      	st.w      	r3, (r2, 0x0)
}
    4b68:	783c      	jmp      	r15
    4b6a:	0000      	bkpt
    4b6c:	e000e100 	.long	0xe000e100

Disassembly of section .text.EXI3_Int_Enable:

00004b70 <EXI3_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI3_Int_Enable(void)
{
	INTC_ISER_WRITE(EXI3_INT);    
    4b70:	3380      	movi      	r3, 128
    4b72:	436f      	lsli      	r3, r3, 15
    4b74:	1042      	lrw      	r2, 0xe000e100	// 4b7c <EXI3_Int_Enable+0xc>
    4b76:	b260      	st.w      	r3, (r2, 0x0)
}
    4b78:	783c      	jmp      	r15
    4b7a:	0000      	bkpt
    4b7c:	e000e100 	.long	0xe000e100

Disassembly of section .text.EXI0_WakeUp_Enable:

00004b80 <EXI0_WakeUp_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI0_WakeUp_Enable(void)
{
    INTC_IWER_WRITE(EXI0_INT);    
    4b80:	3280      	movi      	r2, 128
    4b82:	1062      	lrw      	r3, 0xe000e100	// 4b88 <EXI0_WakeUp_Enable+0x8>
    4b84:	b350      	st.w      	r2, (r3, 0x40)
}
    4b86:	783c      	jmp      	r15
    4b88:	e000e100 	.long	0xe000e100

Disassembly of section .text.EXI1_WakeUp_Enable:

00004b8c <EXI1_WakeUp_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI1_WakeUp_Enable(void)
{
    INTC_IWER_WRITE(EXI1_INT);    
    4b8c:	3380      	movi      	r3, 128
    4b8e:	4361      	lsli      	r3, r3, 1
    4b90:	1042      	lrw      	r2, 0xe000e100	// 4b98 <EXI1_WakeUp_Enable+0xc>
    4b92:	b270      	st.w      	r3, (r2, 0x40)
}
    4b94:	783c      	jmp      	r15
    4b96:	0000      	bkpt
    4b98:	e000e100 	.long	0xe000e100

Disassembly of section .text.EXI1_WakeUp_Disable:

00004b9c <EXI1_WakeUp_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI1_WakeUp_Disable(void)
{
    INTC_IWDR_WRITE(EXI1_INT);    
    4b9c:	3380      	movi      	r3, 128
    4b9e:	4361      	lsli      	r3, r3, 1
    4ba0:	1042      	lrw      	r2, 0xe000e180	// 4ba8 <EXI1_WakeUp_Disable+0xc>
    4ba2:	b270      	st.w      	r3, (r2, 0x40)
}
    4ba4:	783c      	jmp      	r15
    4ba6:	0000      	bkpt
    4ba8:	e000e180 	.long	0xe000e180

Disassembly of section .text.EXI2_WakeUp_Enable:

00004bac <EXI2_WakeUp_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI2_WakeUp_Enable(void)
{
    INTC_IWER_WRITE(EXI2_INT);    
    4bac:	3380      	movi      	r3, 128
    4bae:	436e      	lsli      	r3, r3, 14
    4bb0:	1042      	lrw      	r2, 0xe000e100	// 4bb8 <EXI2_WakeUp_Enable+0xc>
    4bb2:	b270      	st.w      	r3, (r2, 0x40)
}
    4bb4:	783c      	jmp      	r15
    4bb6:	0000      	bkpt
    4bb8:	e000e100 	.long	0xe000e100

Disassembly of section .text.EXI3_WakeUp_Enable:

00004bbc <EXI3_WakeUp_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI3_WakeUp_Enable(void)
{
    INTC_IWER_WRITE(EXI3_INT);    
    4bbc:	3380      	movi      	r3, 128
    4bbe:	436f      	lsli      	r3, r3, 15
    4bc0:	1042      	lrw      	r2, 0xe000e100	// 4bc8 <EXI3_WakeUp_Enable+0xc>
    4bc2:	b270      	st.w      	r3, (r2, 0x40)
}
    4bc4:	783c      	jmp      	r15
    4bc6:	0000      	bkpt
    4bc8:	e000e100 	.long	0xe000e100

Disassembly of section .text.EXI3_WakeUp_Disable:

00004bcc <EXI3_WakeUp_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI3_WakeUp_Disable(void)
{
    INTC_IWDR_WRITE(EXI3_INT);    
    4bcc:	3380      	movi      	r3, 128
    4bce:	436f      	lsli      	r3, r3, 15
    4bd0:	1042      	lrw      	r2, 0xe000e180	// 4bd8 <EXI3_WakeUp_Disable+0xc>
    4bd2:	b270      	st.w      	r3, (r2, 0x40)
}
    4bd4:	783c      	jmp      	r15
    4bd6:	0000      	bkpt
    4bd8:	e000e180 	.long	0xe000e180

Disassembly of section .text.SYSCON_INT_Priority:

00004bdc <SYSCON_INT_Priority>:
//BT_INT 	  IRQ30
//ReturnValue:None
/*************************************************************/
void SYSCON_INT_Priority(void)
{
	INTC_IPR0_WRITE(0X40404040);   //IQR0-3
    4bdc:	1067      	lrw      	r3, 0xe000e400	// 4bf8 <SYSCON_INT_Priority+0x1c>
    4bde:	1048      	lrw      	r2, 0x40404040	// 4bfc <SYSCON_INT_Priority+0x20>
	INTC_IPR1_WRITE(0X40404080);   //IQR4-7  
    4be0:	1028      	lrw      	r1, 0x40404080	// 4c00 <SYSCON_INT_Priority+0x24>
	INTC_IPR0_WRITE(0X40404040);   //IQR0-3
    4be2:	b340      	st.w      	r2, (r3, 0x0)
	INTC_IPR1_WRITE(0X40404080);   //IQR4-7  
    4be4:	b321      	st.w      	r1, (r3, 0x4)
	INTC_IPR2_WRITE(0X40408040);   //IQR8-11  
    4be6:	1028      	lrw      	r1, 0x40408040	// 4c04 <SYSCON_INT_Priority+0x28>
    4be8:	b322      	st.w      	r1, (r3, 0x8)
	INTC_IPR3_WRITE(0X40000040);   //IQR12-15  
    4bea:	1028      	lrw      	r1, 0x40000040	// 4c08 <SYSCON_INT_Priority+0x2c>
    4bec:	b323      	st.w      	r1, (r3, 0xc)
	INTC_IPR4_WRITE(0X40404040);   //IQR16-19  
    4bee:	b344      	st.w      	r2, (r3, 0x10)
	INTC_IPR5_WRITE(0X40404040);   //IQR20-23 
    4bf0:	b345      	st.w      	r2, (r3, 0x14)
	INTC_IPR6_WRITE(0X40404040);   //IQR24-27  
    4bf2:	b346      	st.w      	r2, (r3, 0x18)
	INTC_IPR7_WRITE(0X40404040);   //IQR28-31
    4bf4:	b347      	st.w      	r2, (r3, 0x1c)
}
    4bf6:	783c      	jmp      	r15
    4bf8:	e000e400 	.long	0xe000e400
    4bfc:	40404040 	.long	0x40404040
    4c00:	40404080 	.long	0x40404080
    4c04:	40408040 	.long	0x40408040
    4c08:	40000040 	.long	0x40000040

Disassembly of section .text.CORET_DeInit:

00004c0c <CORET_DeInit>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/    
void CORET_DeInit(void)
{
	CK801->CORET_CSR=CORET_CSR_RST;
    4c0c:	1065      	lrw      	r3, 0x20000064	// 4c20 <CORET_DeInit+0x14>
    4c0e:	3204      	movi      	r2, 4
    4c10:	9360      	ld.w      	r3, (r3, 0x0)
    4c12:	b344      	st.w      	r2, (r3, 0x10)
	CK801->CORET_RVR=CORET_RVR_RST;
    4c14:	3200      	movi      	r2, 0
    4c16:	b345      	st.w      	r2, (r3, 0x14)
	CK801->CORET_CVR=CORET_CVR_RST;
    4c18:	b346      	st.w      	r2, (r3, 0x18)
	CK801->CORET_CALIB=CORET_CALIB_RST;
    4c1a:	b347      	st.w      	r2, (r3, 0x1c)
}
    4c1c:	783c      	jmp      	r15
    4c1e:	0000      	bkpt
    4c20:	20000064 	.long	0x20000064

Disassembly of section .text.CORET_Int_Disable:

00004c24 <CORET_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_Int_Disable(void)
{
    INTC_ICER_WRITE(CORET_INT);    
    4c24:	3201      	movi      	r2, 1
    4c26:	1062      	lrw      	r3, 0xe000e180	// 4c2c <CORET_Int_Disable+0x8>
    4c28:	b340      	st.w      	r2, (r3, 0x0)
}
    4c2a:	783c      	jmp      	r15
    4c2c:	e000e180 	.long	0xe000e180

Disassembly of section .text.CORET_start:

00004c30 <CORET_start>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_start(void)
{
	CK801->CORET_CSR|=0x01;
    4c30:	1063      	lrw      	r3, 0x20000064	// 4c3c <CORET_start+0xc>
    4c32:	9340      	ld.w      	r2, (r3, 0x0)
    4c34:	9264      	ld.w      	r3, (r2, 0x10)
    4c36:	3ba0      	bseti      	r3, 0
    4c38:	b264      	st.w      	r3, (r2, 0x10)
}
    4c3a:	783c      	jmp      	r15
    4c3c:	20000064 	.long	0x20000064

Disassembly of section .text.CORET_stop:

00004c40 <CORET_stop>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_stop(void)
{
	CK801->CORET_CSR&=0Xfffffffe;
    4c40:	1063      	lrw      	r3, 0x20000064	// 4c4c <CORET_stop+0xc>
    4c42:	9340      	ld.w      	r2, (r3, 0x0)
    4c44:	9264      	ld.w      	r3, (r2, 0x10)
    4c46:	3b80      	bclri      	r3, 0
    4c48:	b264      	st.w      	r3, (r2, 0x10)
}
    4c4a:	783c      	jmp      	r15
    4c4c:	20000064 	.long	0x20000064

Disassembly of section .text.CORET_CLKSOURCE_EX:

00004c50 <CORET_CLKSOURCE_EX>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_CLKSOURCE_EX(void)
{
	CK801->CORET_CSR&=0Xfffffffb;
    4c50:	1063      	lrw      	r3, 0x20000064	// 4c5c <CORET_CLKSOURCE_EX+0xc>
    4c52:	9340      	ld.w      	r2, (r3, 0x0)
    4c54:	9264      	ld.w      	r3, (r2, 0x10)
    4c56:	3b82      	bclri      	r3, 2
    4c58:	b264      	st.w      	r3, (r2, 0x10)
}
    4c5a:	783c      	jmp      	r15
    4c5c:	20000064 	.long	0x20000064

Disassembly of section .text.CORET_TICKINT_Enable:

00004c60 <CORET_TICKINT_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_TICKINT_Enable(void)
{
    CK801->CORET_CSR|=0x02;
    4c60:	1063      	lrw      	r3, 0x20000064	// 4c6c <CORET_TICKINT_Enable+0xc>
    4c62:	9340      	ld.w      	r2, (r3, 0x0)
    4c64:	9264      	ld.w      	r3, (r2, 0x10)
    4c66:	3ba1      	bseti      	r3, 1
    4c68:	b264      	st.w      	r3, (r2, 0x10)
}
    4c6a:	783c      	jmp      	r15
    4c6c:	20000064 	.long	0x20000064

Disassembly of section .text.CORET_reload:

00004c70 <CORET_reload>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_reload(void)
{
	CK801->CORET_CVR = 0x0;							// Clear counter and flag
    4c70:	1063      	lrw      	r3, 0x20000064	// 4c7c <CORET_reload+0xc>
    4c72:	3200      	movi      	r2, 0
    4c74:	9360      	ld.w      	r3, (r3, 0x0)
    4c76:	b346      	st.w      	r2, (r3, 0x18)
}
    4c78:	783c      	jmp      	r15
    4c7a:	0000      	bkpt
    4c7c:	20000064 	.long	0x20000064

Disassembly of section .text.GPIO_Init:

00004c80 <GPIO_Init>:
//byte:Lowbyte(PIN_0~7),Highbyte(PIN_8~15)
//Dir:0:output 1:input
//ReturnValue:NONE
/*************************************************************/  
void GPIO_Init(CSP_GPIO_T *GPIOx,uint8_t PinNum,GPIO_Dir_TypeDef Dir)
{
    4c80:	14d1      	push      	r4, r15
    uint32_t data_temp;
    uint8_t GPIO_Pin;
    if(PinNum<8)
    4c82:	3907      	cmphsi      	r1, 8
{
    4c84:	6d03      	mov      	r4, r0
    if(PinNum<8)
    4c86:	0830      	bt      	0x4ce6	// 4ce6 <GPIO_Init+0x66>
    {
    switch (PinNum)
    4c88:	5903      	subi      	r0, r1, 1
    4c8a:	3806      	cmphsi      	r0, 7
    4c8c:	0827      	bt      	0x4cda	// 4cda <GPIO_Init+0x5a>
    4c8e:	e3ffea91 	bsr      	0x21b0	// 21b0 <___gnu_csky_case_uqi>
    4c92:	1004      	.short	0x1004
    4c94:	1d1a1613 	.long	0x1d1a1613
    4c98:	0021      	.short	0x0021
    {
        case 0:data_temp=0xfffffff0;GPIO_Pin=0;break;
        case 1:data_temp=0xffffff0f;GPIO_Pin=4;break;
    4c9a:	3300      	movi      	r3, 0
    4c9c:	3104      	movi      	r1, 4
    4c9e:	2bf0      	subi      	r3, 241
        case 4:data_temp=0xfff0ffff;GPIO_Pin=16;break;
        case 5:data_temp=0xff0fffff;GPIO_Pin=20;break;
        case 6:data_temp=0xf0ffffff;GPIO_Pin=24;break;
        case 7:data_temp=0x0fffffff;GPIO_Pin=28;break;
    }
        if (Dir)
    4ca0:	3a40      	cmpnei      	r2, 0
        {
          (GPIOx)->CONLR =((GPIOx)->CONLR & data_temp) | 1<<GPIO_Pin;
    4ca2:	9440      	ld.w      	r2, (r4, 0x0)
    4ca4:	68c8      	and      	r3, r2
        if (Dir)
    4ca6:	0c1e      	bf      	0x4ce2	// 4ce2 <GPIO_Init+0x62>
          (GPIOx)->CONLR =((GPIOx)->CONLR & data_temp) | 1<<GPIO_Pin;
    4ca8:	3201      	movi      	r2, 1
        }
        else
        {
         (GPIOx)->CONLR = ((GPIOx)->CONLR & data_temp) | 2<<GPIO_Pin; 
    4caa:	7084      	lsl      	r2, r1
    4cac:	6cc8      	or      	r3, r2
    4cae:	b460      	st.w      	r3, (r4, 0x0)
        else
        {
         (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 2<<GPIO_Pin;    
        }
    }
}
    4cb0:	1491      	pop      	r4, r15
        case 2:data_temp=0xfffff0ff;GPIO_Pin=8;break;
    4cb2:	3108      	movi      	r1, 8
    4cb4:	1166      	lrw      	r3, 0xfffff0ff	// 4d4c <GPIO_Init+0xcc>
    4cb6:	07f5      	br      	0x4ca0	// 4ca0 <GPIO_Init+0x20>
        case 3:data_temp=0xffff0fff;GPIO_Pin=12;break;
    4cb8:	310c      	movi      	r1, 12
    4cba:	1166      	lrw      	r3, 0xffff0fff	// 4d50 <GPIO_Init+0xd0>
    4cbc:	07f2      	br      	0x4ca0	// 4ca0 <GPIO_Init+0x20>
        case 4:data_temp=0xfff0ffff;GPIO_Pin=16;break;
    4cbe:	3110      	movi      	r1, 16
    4cc0:	1165      	lrw      	r3, 0xfff10000	// 4d54 <GPIO_Init+0xd4>
        case 6:data_temp=0xf0ffffff;GPIO_Pin=24;break;
    4cc2:	2b00      	subi      	r3, 1
    4cc4:	07ee      	br      	0x4ca0	// 4ca0 <GPIO_Init+0x20>
        case 5:data_temp=0xff0fffff;GPIO_Pin=20;break;
    4cc6:	3114      	movi      	r1, 20
    4cc8:	1164      	lrw      	r3, 0xff100000	// 4d58 <GPIO_Init+0xd8>
    4cca:	07fc      	br      	0x4cc2	// 4cc2 <GPIO_Init+0x42>
        case 6:data_temp=0xf0ffffff;GPIO_Pin=24;break;
    4ccc:	33f1      	movi      	r3, 241
    4cce:	3118      	movi      	r1, 24
    4cd0:	4378      	lsli      	r3, r3, 24
    4cd2:	07f8      	br      	0x4cc2	// 4cc2 <GPIO_Init+0x42>
        case 7:data_temp=0x0fffffff;GPIO_Pin=28;break;
    4cd4:	311c      	movi      	r1, 28
    4cd6:	1162      	lrw      	r3, 0xfffffff	// 4d5c <GPIO_Init+0xdc>
    4cd8:	07e4      	br      	0x4ca0	// 4ca0 <GPIO_Init+0x20>
        case 0:data_temp=0xfffffff0;GPIO_Pin=0;break;
    4cda:	3300      	movi      	r3, 0
    4cdc:	3100      	movi      	r1, 0
    4cde:	2b0f      	subi      	r3, 16
    4ce0:	07e0      	br      	0x4ca0	// 4ca0 <GPIO_Init+0x20>
         (GPIOx)->CONLR = ((GPIOx)->CONLR & data_temp) | 2<<GPIO_Pin; 
    4ce2:	3202      	movi      	r2, 2
    4ce4:	07e3      	br      	0x4caa	// 4caa <GPIO_Init+0x2a>
    else if (PinNum<16)
    4ce6:	390f      	cmphsi      	r1, 16
    4ce8:	0be4      	bt      	0x4cb0	// 4cb0 <GPIO_Init+0x30>
        switch (PinNum)
    4cea:	2908      	subi      	r1, 9
    4cec:	3906      	cmphsi      	r1, 7
    4cee:	6c07      	mov      	r0, r1
    4cf0:	0827      	bt      	0x4d3e	// 4d3e <GPIO_Init+0xbe>
    4cf2:	e3ffea5f 	bsr      	0x21b0	// 21b0 <___gnu_csky_case_uqi>
    4cf6:	1004      	.short	0x1004
    4cf8:	1d1a1613 	.long	0x1d1a1613
    4cfc:	0021      	.short	0x0021
        case 9:data_temp=0xffffff0f;GPIO_Pin=4;break;
    4cfe:	3300      	movi      	r3, 0
    4d00:	3104      	movi      	r1, 4
    4d02:	2bf0      	subi      	r3, 241
      if (Dir)
    4d04:	3a40      	cmpnei      	r2, 0
        (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 1<<GPIO_Pin;  
    4d06:	9441      	ld.w      	r2, (r4, 0x4)
    4d08:	68c8      	and      	r3, r2
      if (Dir)
    4d0a:	0c1e      	bf      	0x4d46	// 4d46 <GPIO_Init+0xc6>
        (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 1<<GPIO_Pin;  
    4d0c:	3201      	movi      	r2, 1
         (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 2<<GPIO_Pin;    
    4d0e:	7084      	lsl      	r2, r1
    4d10:	6cc8      	or      	r3, r2
    4d12:	b461      	st.w      	r3, (r4, 0x4)
}
    4d14:	07ce      	br      	0x4cb0	// 4cb0 <GPIO_Init+0x30>
        case 10:data_temp=0xfffff0ff;GPIO_Pin=8;break;
    4d16:	3108      	movi      	r1, 8
    4d18:	106d      	lrw      	r3, 0xfffff0ff	// 4d4c <GPIO_Init+0xcc>
    4d1a:	07f5      	br      	0x4d04	// 4d04 <GPIO_Init+0x84>
        case 11:data_temp=0xffff0fff;GPIO_Pin=12;break;
    4d1c:	310c      	movi      	r1, 12
    4d1e:	106d      	lrw      	r3, 0xffff0fff	// 4d50 <GPIO_Init+0xd0>
    4d20:	07f2      	br      	0x4d04	// 4d04 <GPIO_Init+0x84>
        case 12:data_temp=0xfff0ffff;GPIO_Pin=16;break;
    4d22:	3110      	movi      	r1, 16
    4d24:	106c      	lrw      	r3, 0xfff10000	// 4d54 <GPIO_Init+0xd4>
        case 14:data_temp=0xf0ffffff;GPIO_Pin=24;break;
    4d26:	2b00      	subi      	r3, 1
    4d28:	07ee      	br      	0x4d04	// 4d04 <GPIO_Init+0x84>
        case 13:data_temp=0xff0fffff;GPIO_Pin=20;break;
    4d2a:	3114      	movi      	r1, 20
    4d2c:	106b      	lrw      	r3, 0xff100000	// 4d58 <GPIO_Init+0xd8>
    4d2e:	07fc      	br      	0x4d26	// 4d26 <GPIO_Init+0xa6>
        case 14:data_temp=0xf0ffffff;GPIO_Pin=24;break;
    4d30:	33f1      	movi      	r3, 241
    4d32:	3118      	movi      	r1, 24
    4d34:	4378      	lsli      	r3, r3, 24
    4d36:	07f8      	br      	0x4d26	// 4d26 <GPIO_Init+0xa6>
        case 15:data_temp=0x0fffffff;GPIO_Pin=28;break;
    4d38:	311c      	movi      	r1, 28
    4d3a:	1069      	lrw      	r3, 0xfffffff	// 4d5c <GPIO_Init+0xdc>
    4d3c:	07e4      	br      	0x4d04	// 4d04 <GPIO_Init+0x84>
        case 8:data_temp=0xfffffff0;GPIO_Pin=0;break;
    4d3e:	3300      	movi      	r3, 0
    4d40:	3100      	movi      	r1, 0
    4d42:	2b0f      	subi      	r3, 16
    4d44:	07e0      	br      	0x4d04	// 4d04 <GPIO_Init+0x84>
         (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 2<<GPIO_Pin;    
    4d46:	3202      	movi      	r2, 2
    4d48:	07e3      	br      	0x4d0e	// 4d0e <GPIO_Init+0x8e>
    4d4a:	0000      	bkpt
    4d4c:	fffff0ff 	.long	0xfffff0ff
    4d50:	ffff0fff 	.long	0xffff0fff
    4d54:	fff10000 	.long	0xfff10000
    4d58:	ff100000 	.long	0xff100000
    4d5c:	0fffffff 	.long	0x0fffffff

Disassembly of section .text.GPIO_InPutOutPut_Disable:

00004d60 <GPIO_InPutOutPut_Disable>:
//GPIO_Pin:PIN_0~15
//byte:Lowbyte(PIN_0~7),Highbyte(PIN_8~15)
//ReturnValue:NONE
/*************************************************************/  
void GPIO_InPutOutPut_Disable(CSP_GPIO_T *GPIOx,uint8_t PinNum)
{
    4d60:	14d0      	push      	r15
    uint32_t data_temp;
    if(PinNum<8)
    4d62:	3907      	cmphsi      	r1, 8
{
    4d64:	6c83      	mov      	r2, r0
    if(PinNum<8)
    4d66:	0821      	bt      	0x4da8	// 4da8 <GPIO_InPutOutPut_Disable+0x48>
    {
    switch (PinNum)
    4d68:	5903      	subi      	r0, r1, 1
    4d6a:	3806      	cmphsi      	r0, 7
    4d6c:	081b      	bt      	0x4da2	// 4da2 <GPIO_InPutOutPut_Disable+0x42>
    4d6e:	e3ffea21 	bsr      	0x21b0	// 21b0 <___gnu_csky_case_uqi>
    4d72:	0a04      	.short	0x0a04
    4d74:	13110e0c 	.long	0x13110e0c
    4d78:	0016      	.short	0x0016
    {
        case 0:data_temp=0xfffffff0;break;
        case 1:data_temp=0xffffff0f;break;
    4d7a:	3300      	movi      	r3, 0
    4d7c:	2bf0      	subi      	r3, 241
        case 4:data_temp=0xfff0ffff;break;
        case 5:data_temp=0xff0fffff;break;
        case 6:data_temp=0xf0ffffff;break;
        case 7:data_temp=0x0fffffff;break;
    }
         (GPIOx)->CONLR = (GPIOx)->CONLR & data_temp;
    4d7e:	9220      	ld.w      	r1, (r2, 0x0)
    4d80:	68c4      	and      	r3, r1
    4d82:	b260      	st.w      	r3, (r2, 0x0)
        case 14:data_temp=0xf0ffffff;break;
        case 15:data_temp=0x0fffffff;break;
    } 
         (GPIOx)->CONHR = (GPIOx)->CONHR & data_temp;    
    }
}
    4d84:	1490      	pop      	r15
        case 2:data_temp=0xfffff0ff;break;
    4d86:	107b      	lrw      	r3, 0xfffff0ff	// 4df0 <GPIO_InPutOutPut_Disable+0x90>
    4d88:	07fb      	br      	0x4d7e	// 4d7e <GPIO_InPutOutPut_Disable+0x1e>
        case 3:data_temp=0xffff0fff;break;
    4d8a:	107b      	lrw      	r3, 0xffff0fff	// 4df4 <GPIO_InPutOutPut_Disable+0x94>
    4d8c:	07f9      	br      	0x4d7e	// 4d7e <GPIO_InPutOutPut_Disable+0x1e>
        case 4:data_temp=0xfff0ffff;break;
    4d8e:	107b      	lrw      	r3, 0xfff10000	// 4df8 <GPIO_InPutOutPut_Disable+0x98>
        case 6:data_temp=0xf0ffffff;break;
    4d90:	2b00      	subi      	r3, 1
    4d92:	07f6      	br      	0x4d7e	// 4d7e <GPIO_InPutOutPut_Disable+0x1e>
        case 5:data_temp=0xff0fffff;break;
    4d94:	107a      	lrw      	r3, 0xff100000	// 4dfc <GPIO_InPutOutPut_Disable+0x9c>
    4d96:	07fd      	br      	0x4d90	// 4d90 <GPIO_InPutOutPut_Disable+0x30>
        case 6:data_temp=0xf0ffffff;break;
    4d98:	33f1      	movi      	r3, 241
    4d9a:	4378      	lsli      	r3, r3, 24
    4d9c:	07fa      	br      	0x4d90	// 4d90 <GPIO_InPutOutPut_Disable+0x30>
        case 7:data_temp=0x0fffffff;break;
    4d9e:	1079      	lrw      	r3, 0xfffffff	// 4e00 <GPIO_InPutOutPut_Disable+0xa0>
    4da0:	07ef      	br      	0x4d7e	// 4d7e <GPIO_InPutOutPut_Disable+0x1e>
        case 0:data_temp=0xfffffff0;break;
    4da2:	3300      	movi      	r3, 0
    4da4:	2b0f      	subi      	r3, 16
    4da6:	07ec      	br      	0x4d7e	// 4d7e <GPIO_InPutOutPut_Disable+0x1e>
    else if (PinNum<16)
    4da8:	390f      	cmphsi      	r1, 16
    4daa:	0bed      	bt      	0x4d84	// 4d84 <GPIO_InPutOutPut_Disable+0x24>
        switch (PinNum)
    4dac:	2908      	subi      	r1, 9
    4dae:	3906      	cmphsi      	r1, 7
    4db0:	6c07      	mov      	r0, r1
    4db2:	081b      	bt      	0x4de8	// 4de8 <GPIO_InPutOutPut_Disable+0x88>
    4db4:	e3ffe9fe 	bsr      	0x21b0	// 21b0 <___gnu_csky_case_uqi>
    4db8:	0e0c0a04 	.long	0x0e0c0a04
    4dbc:	00161311 	.long	0x00161311
        case 9:data_temp=0xffffff0f;break;
    4dc0:	3300      	movi      	r3, 0
    4dc2:	2bf0      	subi      	r3, 241
         (GPIOx)->CONHR = (GPIOx)->CONHR & data_temp;    
    4dc4:	9221      	ld.w      	r1, (r2, 0x4)
    4dc6:	68c4      	and      	r3, r1
    4dc8:	b261      	st.w      	r3, (r2, 0x4)
}
    4dca:	07dd      	br      	0x4d84	// 4d84 <GPIO_InPutOutPut_Disable+0x24>
        case 10:data_temp=0xfffff0ff;break;
    4dcc:	1069      	lrw      	r3, 0xfffff0ff	// 4df0 <GPIO_InPutOutPut_Disable+0x90>
    4dce:	07fb      	br      	0x4dc4	// 4dc4 <GPIO_InPutOutPut_Disable+0x64>
        case 11:data_temp=0xffff0fff;break;
    4dd0:	1069      	lrw      	r3, 0xffff0fff	// 4df4 <GPIO_InPutOutPut_Disable+0x94>
    4dd2:	07f9      	br      	0x4dc4	// 4dc4 <GPIO_InPutOutPut_Disable+0x64>
        case 12:data_temp=0xfff0ffff;break;
    4dd4:	1069      	lrw      	r3, 0xfff10000	// 4df8 <GPIO_InPutOutPut_Disable+0x98>
        case 14:data_temp=0xf0ffffff;break;
    4dd6:	2b00      	subi      	r3, 1
    4dd8:	07f6      	br      	0x4dc4	// 4dc4 <GPIO_InPutOutPut_Disable+0x64>
        case 13:data_temp=0xff0fffff;break;
    4dda:	1069      	lrw      	r3, 0xff100000	// 4dfc <GPIO_InPutOutPut_Disable+0x9c>
    4ddc:	07fd      	br      	0x4dd6	// 4dd6 <GPIO_InPutOutPut_Disable+0x76>
        case 14:data_temp=0xf0ffffff;break;
    4dde:	33f1      	movi      	r3, 241
    4de0:	4378      	lsli      	r3, r3, 24
    4de2:	07fa      	br      	0x4dd6	// 4dd6 <GPIO_InPutOutPut_Disable+0x76>
        case 15:data_temp=0x0fffffff;break;
    4de4:	1067      	lrw      	r3, 0xfffffff	// 4e00 <GPIO_InPutOutPut_Disable+0xa0>
    4de6:	07ef      	br      	0x4dc4	// 4dc4 <GPIO_InPutOutPut_Disable+0x64>
        case 8:data_temp=0xfffffff0;break;
    4de8:	3300      	movi      	r3, 0
    4dea:	2b0f      	subi      	r3, 16
    4dec:	07ec      	br      	0x4dc4	// 4dc4 <GPIO_InPutOutPut_Disable+0x64>
    4dee:	0000      	bkpt
    4df0:	fffff0ff 	.long	0xfffff0ff
    4df4:	ffff0fff 	.long	0xffff0fff
    4df8:	fff10000 	.long	0xfff10000
    4dfc:	ff100000 	.long	0xff100000
    4e00:	0fffffff 	.long	0x0fffffff

Disassembly of section .text.GPIO_PullHigh_Init:

00004e04 <GPIO_PullHigh_Init>:
//bit:0~15
//ReturnValue:VALUE
/*************************************************************/
void GPIO_PullHigh_Init(CSP_GPIO_T *GPIOx,uint8_t bit)
{
	(GPIOx)->PUDR  = (((GPIOx)->PUDR) & ~(0x03<<(bit*2))) | (0x01<<(bit*2));
    4e04:	4121      	lsli      	r1, r1, 1
    4e06:	3203      	movi      	r2, 3
    4e08:	9068      	ld.w      	r3, (r0, 0x20)
    4e0a:	7084      	lsl      	r2, r1
    4e0c:	68c9      	andn      	r3, r2
    4e0e:	3201      	movi      	r2, 1
    4e10:	7084      	lsl      	r2, r1
    4e12:	6cc8      	or      	r3, r2
    4e14:	b068      	st.w      	r3, (r0, 0x20)
}
    4e16:	783c      	jmp      	r15

Disassembly of section .text.GPIO_PullLow_Init:

00004e18 <GPIO_PullLow_Init>:
void GPIO_PullLow_Init(CSP_GPIO_T *GPIOx,uint8_t bit)
{
	(GPIOx)->PUDR  = (((GPIOx)->PUDR) & ~(0x03<<(bit*2))) | (0x02<<(bit*2));
    4e18:	4121      	lsli      	r1, r1, 1
    4e1a:	3203      	movi      	r2, 3
    4e1c:	9068      	ld.w      	r3, (r0, 0x20)
    4e1e:	7084      	lsl      	r2, r1
    4e20:	68c9      	andn      	r3, r2
    4e22:	3202      	movi      	r2, 2
    4e24:	7084      	lsl      	r2, r1
    4e26:	6cc8      	or      	r3, r2
    4e28:	b068      	st.w      	r3, (r0, 0x20)
}
    4e2a:	783c      	jmp      	r15

Disassembly of section .text.GPIO_PullHighLow_DIS:

00004e2c <GPIO_PullHighLow_DIS>:
void GPIO_PullHighLow_DIS(CSP_GPIO_T *GPIOx,uint8_t bit)
{
	(GPIOx)->PUDR  = ((GPIOx)->PUDR) & ~(0x03<<(bit*2));
    4e2c:	4121      	lsli      	r1, r1, 1
    4e2e:	3203      	movi      	r2, 3
    4e30:	9068      	ld.w      	r3, (r0, 0x20)
    4e32:	7084      	lsl      	r2, r1
    4e34:	68c9      	andn      	r3, r2
    4e36:	b068      	st.w      	r3, (r0, 0x20)
}
    4e38:	783c      	jmp      	r15

Disassembly of section .text.GPIO_IntGroup_Set:

00004e3c <GPIO_IntGroup_Set>:
//EXI16~EXI17:GPIOA0.0~GPIOA0.7
//EXI18~EXI19:GPIOB0.0~GPIOB0.3
//ReturnValue:NONE
/*************************************************************/  
void GPIO_IntGroup_Set(GPIO_Group_TypeDef IO_MODE , uint8_t PinNum , GPIO_EXIPIN_TypeDef Selete_EXI_x)
{
    4e3c:	14c1      	push      	r4
    4e3e:	1422      	subi      	r14, r14, 8
	volatile unsigned int  R_data_temp;
    volatile unsigned char R_GPIO_Pin;
	if(Selete_EXI_x<16)
    4e40:	3a0f      	cmphsi      	r2, 16
    4e42:	084f      	bt      	0x4ee0	// 4ee0 <GPIO_IntGroup_Set+0xa4>
	{
		if((Selete_EXI_x==0)||(Selete_EXI_x==8))
    4e44:	6ccb      	mov      	r3, r2
    4e46:	3b83      	bclri      	r3, 3
    4e48:	3b40      	cmpnei      	r3, 0
    4e4a:	0813      	bt      	0x4e70	// 4e70 <GPIO_IntGroup_Set+0x34>
		{
			R_data_temp=0xfffffff0;
    4e4c:	2b0f      	subi      	r3, 16
    4e4e:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=0;
    4e50:	3300      	movi      	r3, 0
		else if((Selete_EXI_x==7)||(Selete_EXI_x==15))
		{
			R_data_temp=0x0fffffff;
			R_GPIO_Pin=28;
		}
		if(Selete_EXI_x<8)
    4e52:	3a07      	cmphsi      	r2, 8
			R_GPIO_Pin=28;
    4e54:	dc6e0003 	st.b      	r3, (r14, 0x3)
    4e58:	1176      	lrw      	r3, 0x20000048	// 4f30 <GPIO_IntGroup_Set+0xf4>
		if(Selete_EXI_x<8)
    4e5a:	0c38      	bf      	0x4eca	// 4eca <GPIO_IntGroup_Set+0x8e>
		{
			GPIOGRP->IGRPL =(GPIOGRP->IGRPL & R_data_temp) | (IO_MODE<<R_GPIO_Pin);
		}
		else if((Selete_EXI_x<16)&&(Selete_EXI_x>=8))
		{
			GPIOGRP->IGRPH =(GPIOGRP->IGRPH & R_data_temp) | (IO_MODE<<R_GPIO_Pin);    
    4e5c:	9340      	ld.w      	r2, (r3, 0x0)
    4e5e:	9261      	ld.w      	r3, (r2, 0x4)
    4e60:	9881      	ld.w      	r4, (r14, 0x4)
    4e62:	d82e0003 	ld.b      	r1, (r14, 0x3)
    4e66:	68d0      	and      	r3, r4
    4e68:	7004      	lsl      	r0, r1
    4e6a:	6c0c      	or      	r0, r3
    4e6c:	b201      	st.w      	r0, (r2, 0x4)
    4e6e:	0437      	br      	0x4edc	// 4edc <GPIO_IntGroup_Set+0xa0>
		else if((Selete_EXI_x==1)||(Selete_EXI_x==9))
    4e70:	3b41      	cmpnei      	r3, 1
    4e72:	0806      	bt      	0x4e7e	// 4e7e <GPIO_IntGroup_Set+0x42>
			R_data_temp=0xffffff0f;
    4e74:	3300      	movi      	r3, 0
    4e76:	2bf0      	subi      	r3, 241
    4e78:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=4;
    4e7a:	3304      	movi      	r3, 4
    4e7c:	07eb      	br      	0x4e52	// 4e52 <GPIO_IntGroup_Set+0x16>
		else if((Selete_EXI_x==2)||(Selete_EXI_x==10))
    4e7e:	3b42      	cmpnei      	r3, 2
    4e80:	0805      	bt      	0x4e8a	// 4e8a <GPIO_IntGroup_Set+0x4e>
			R_data_temp=0xfffff0ff;
    4e82:	116d      	lrw      	r3, 0xfffff0ff	// 4f34 <GPIO_IntGroup_Set+0xf8>
    4e84:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=8;
    4e86:	3308      	movi      	r3, 8
    4e88:	07e5      	br      	0x4e52	// 4e52 <GPIO_IntGroup_Set+0x16>
		else if((Selete_EXI_x==3)||(Selete_EXI_x==11))
    4e8a:	3b43      	cmpnei      	r3, 3
    4e8c:	0805      	bt      	0x4e96	// 4e96 <GPIO_IntGroup_Set+0x5a>
			R_data_temp=0xffff0fff;
    4e8e:	116b      	lrw      	r3, 0xffff0fff	// 4f38 <GPIO_IntGroup_Set+0xfc>
    4e90:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=12;
    4e92:	330c      	movi      	r3, 12
    4e94:	07df      	br      	0x4e52	// 4e52 <GPIO_IntGroup_Set+0x16>
		else if((Selete_EXI_x==4)||(Selete_EXI_x==12))
    4e96:	3b44      	cmpnei      	r3, 4
    4e98:	0806      	bt      	0x4ea4	// 4ea4 <GPIO_IntGroup_Set+0x68>
			R_data_temp=0xfff0ffff;
    4e9a:	1169      	lrw      	r3, 0xfff10000	// 4f3c <GPIO_IntGroup_Set+0x100>
    4e9c:	2b00      	subi      	r3, 1
    4e9e:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=16;
    4ea0:	3310      	movi      	r3, 16
    4ea2:	07d8      	br      	0x4e52	// 4e52 <GPIO_IntGroup_Set+0x16>
		else if((Selete_EXI_x==5)||(Selete_EXI_x==13))
    4ea4:	3b45      	cmpnei      	r3, 5
    4ea6:	0806      	bt      	0x4eb2	// 4eb2 <GPIO_IntGroup_Set+0x76>
			R_data_temp=0xff0fffff;
    4ea8:	1166      	lrw      	r3, 0xff100000	// 4f40 <GPIO_IntGroup_Set+0x104>
    4eaa:	2b00      	subi      	r3, 1
    4eac:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=20;
    4eae:	3314      	movi      	r3, 20
    4eb0:	07d1      	br      	0x4e52	// 4e52 <GPIO_IntGroup_Set+0x16>
		else if((Selete_EXI_x==6)||(Selete_EXI_x==14))
    4eb2:	3b46      	cmpnei      	r3, 6
    4eb4:	0807      	bt      	0x4ec2	// 4ec2 <GPIO_IntGroup_Set+0x86>
			R_data_temp=0xf0ffffff;
    4eb6:	33f1      	movi      	r3, 241
    4eb8:	4378      	lsli      	r3, r3, 24
    4eba:	2b00      	subi      	r3, 1
    4ebc:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=24;
    4ebe:	3318      	movi      	r3, 24
    4ec0:	07c9      	br      	0x4e52	// 4e52 <GPIO_IntGroup_Set+0x16>
			R_data_temp=0x0fffffff;
    4ec2:	1161      	lrw      	r3, 0xfffffff	// 4f44 <GPIO_IntGroup_Set+0x108>
    4ec4:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=28;
    4ec6:	331c      	movi      	r3, 28
    4ec8:	07c5      	br      	0x4e52	// 4e52 <GPIO_IntGroup_Set+0x16>
			GPIOGRP->IGRPL =(GPIOGRP->IGRPL & R_data_temp) | (IO_MODE<<R_GPIO_Pin);
    4eca:	9340      	ld.w      	r2, (r3, 0x0)
    4ecc:	9260      	ld.w      	r3, (r2, 0x0)
    4ece:	9881      	ld.w      	r4, (r14, 0x4)
    4ed0:	d82e0003 	ld.b      	r1, (r14, 0x3)
    4ed4:	68d0      	and      	r3, r4
    4ed6:	7004      	lsl      	r0, r1
    4ed8:	6c0c      	or      	r0, r3
    4eda:	b200      	st.w      	r0, (r2, 0x0)
			{
				GPIOGRP->IGREX=(GPIOGRP->IGREX)|(PinNum<<12);
			}
		}
	}
}
    4edc:	1402      	addi      	r14, r14, 8
    4ede:	1481      	pop      	r4
	else if(Selete_EXI_x<20)
    4ee0:	3a13      	cmphsi      	r2, 20
    4ee2:	0bfd      	bt      	0x4edc	// 4edc <GPIO_IntGroup_Set+0xa0>
		if((IO_MODE==0)&&((Selete_EXI_x==16)||((Selete_EXI_x==17))))						//PA0.0~PA0.7
    4ee4:	3840      	cmpnei      	r0, 0
    4ee6:	0814      	bt      	0x4f0e	// 4f0e <GPIO_IntGroup_Set+0xd2>
    4ee8:	3300      	movi      	r3, 0
    4eea:	2b0f      	subi      	r3, 16
    4eec:	60c8      	addu      	r3, r2
    4eee:	3b01      	cmphsi      	r3, 2
    4ef0:	0bf6      	bt      	0x4edc	// 4edc <GPIO_IntGroup_Set+0xa0>
			if(Selete_EXI_x==16)
    4ef2:	3a50      	cmpnei      	r2, 16
    4ef4:	106f      	lrw      	r3, 0x20000048	// 4f30 <GPIO_IntGroup_Set+0xf4>
    4ef6:	0806      	bt      	0x4f02	// 4f02 <GPIO_IntGroup_Set+0xc6>
				GPIOGRP->IGREX =(GPIOGRP->IGREX)|PinNum;
    4ef8:	9340      	ld.w      	r2, (r3, 0x0)
    4efa:	9262      	ld.w      	r3, (r2, 0x8)
    4efc:	6c4c      	or      	r1, r3
    4efe:	b222      	st.w      	r1, (r2, 0x8)
    4f00:	07ee      	br      	0x4edc	// 4edc <GPIO_IntGroup_Set+0xa0>
				GPIOGRP->IGREX=(GPIOGRP->IGREX)|(PinNum<<4);
    4f02:	9360      	ld.w      	r3, (r3, 0x0)
    4f04:	9342      	ld.w      	r2, (r3, 0x8)
    4f06:	4124      	lsli      	r1, r1, 4
				GPIOGRP->IGREX=(GPIOGRP->IGREX)|(PinNum<<12);
    4f08:	6c48      	or      	r1, r2
    4f0a:	b322      	st.w      	r1, (r3, 0x8)
}
    4f0c:	07e8      	br      	0x4edc	// 4edc <GPIO_IntGroup_Set+0xa0>
		else if((IO_MODE==1)&&((Selete_EXI_x==18)||(Selete_EXI_x==19)))					//PB0.0~PB0.3
    4f0e:	3841      	cmpnei      	r0, 1
    4f10:	0be6      	bt      	0x4edc	// 4edc <GPIO_IntGroup_Set+0xa0>
    4f12:	3300      	movi      	r3, 0
    4f14:	2b11      	subi      	r3, 18
    4f16:	60c8      	addu      	r3, r2
    4f18:	3b01      	cmphsi      	r3, 2
    4f1a:	0be1      	bt      	0x4edc	// 4edc <GPIO_IntGroup_Set+0xa0>
    4f1c:	1065      	lrw      	r3, 0x20000048	// 4f30 <GPIO_IntGroup_Set+0xf4>
			if(Selete_EXI_x==18)
    4f1e:	3a52      	cmpnei      	r2, 18
				GPIOGRP->IGREX=(GPIOGRP->IGREX)|(PinNum<<8);
    4f20:	9360      	ld.w      	r3, (r3, 0x0)
    4f22:	9342      	ld.w      	r2, (r3, 0x8)
			if(Selete_EXI_x==18)
    4f24:	0803      	bt      	0x4f2a	// 4f2a <GPIO_IntGroup_Set+0xee>
				GPIOGRP->IGREX=(GPIOGRP->IGREX)|(PinNum<<8);
    4f26:	4128      	lsli      	r1, r1, 8
    4f28:	07f0      	br      	0x4f08	// 4f08 <GPIO_IntGroup_Set+0xcc>
				GPIOGRP->IGREX=(GPIOGRP->IGREX)|(PinNum<<12);
    4f2a:	412c      	lsli      	r1, r1, 12
    4f2c:	07ee      	br      	0x4f08	// 4f08 <GPIO_IntGroup_Set+0xcc>
    4f2e:	0000      	bkpt
    4f30:	20000048 	.long	0x20000048
    4f34:	fffff0ff 	.long	0xfffff0ff
    4f38:	ffff0fff 	.long	0xffff0fff
    4f3c:	fff10000 	.long	0xfff10000
    4f40:	ff100000 	.long	0xff100000
    4f44:	0fffffff 	.long	0x0fffffff

Disassembly of section .text.GPIOA0_EXI_Init:

00004f48 <GPIOA0_EXI_Init>:
//IO EXI SET 
//EntryParameter:EXI_IO(EXI0~EXI13)
//ReturnValue:NONE
/*************************************************************/  
void GPIOA0_EXI_Init(GPIO_EXI_TypeDef EXI_IO)
{
    4f48:	14d0      	push      	r15
    switch (EXI_IO)
    4f4a:	380f      	cmphsi      	r0, 16
    4f4c:	0812      	bt      	0x4f70	// 4f70 <GPIOA0_EXI_Init+0x28>
    4f4e:	117d      	lrw      	r3, 0x20000050	// 5040 <GPIOA0_EXI_Init+0xf8>
    4f50:	e3ffe930 	bsr      	0x21b0	// 21b0 <___gnu_csky_case_uqi>
    4f54:	1d150f08 	.long	0x1d150f08
    4f58:	39322b24 	.long	0x39322b24
    4f5c:	544c463f 	.long	0x544c463f
    4f60:	7069625b 	.long	0x7069625b
    {
        case 0:GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFF0) | 0X00000001;break;
    4f64:	9340      	ld.w      	r2, (r3, 0x0)
    4f66:	9260      	ld.w      	r3, (r2, 0x0)
    4f68:	310f      	movi      	r1, 15
    4f6a:	68c5      	andn      	r3, r1
    4f6c:	3ba0      	bseti      	r3, 0
        case 1:GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF0F) | 0X00000010;break;
    4f6e:	b260      	st.w      	r3, (r2, 0x0)
        case 12:GPIOA0->CONHR = (GPIOA0->CONHR&0XFFF0FFFF) | 0X00010000;break;
        case 13:GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF) | 0X00100000;break;
		case 14:GPIOA0->CONHR = (GPIOA0->CONHR&0XF0FFFFFF) | 0X01000000;break;
		case 15:GPIOA0->CONHR = (GPIOA0->CONHR&0X0FFFFFFF) | 0X10000000;break;
    }
}
    4f70:	1490      	pop      	r15
        case 1:GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF0F) | 0X00000010;break;
    4f72:	9340      	ld.w      	r2, (r3, 0x0)
    4f74:	9260      	ld.w      	r3, (r2, 0x0)
    4f76:	31f0      	movi      	r1, 240
    4f78:	68c5      	andn      	r3, r1
    4f7a:	3ba4      	bseti      	r3, 4
    4f7c:	07f9      	br      	0x4f6e	// 4f6e <GPIOA0_EXI_Init+0x26>
        case 2:GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF) | 0X00000100;break;
    4f7e:	9320      	ld.w      	r1, (r3, 0x0)
    4f80:	32f0      	movi      	r2, 240
    4f82:	9160      	ld.w      	r3, (r1, 0x0)
    4f84:	4244      	lsli      	r2, r2, 4
    4f86:	68c9      	andn      	r3, r2
    4f88:	3ba8      	bseti      	r3, 8
        case 6:GPIOA0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF) | 0X01000000;break;
    4f8a:	b160      	st.w      	r3, (r1, 0x0)
    4f8c:	07f2      	br      	0x4f70	// 4f70 <GPIOA0_EXI_Init+0x28>
        case 3:GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF) | 0X00001000;break;
    4f8e:	9320      	ld.w      	r1, (r3, 0x0)
    4f90:	32f0      	movi      	r2, 240
    4f92:	9160      	ld.w      	r3, (r1, 0x0)
    4f94:	4248      	lsli      	r2, r2, 8
    4f96:	68c9      	andn      	r3, r2
    4f98:	3bac      	bseti      	r3, 12
    4f9a:	07f8      	br      	0x4f8a	// 4f8a <GPIOA0_EXI_Init+0x42>
        case 4:GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF0FFFF) | 0X00010000;break;
    4f9c:	9320      	ld.w      	r1, (r3, 0x0)
    4f9e:	32f0      	movi      	r2, 240
    4fa0:	9160      	ld.w      	r3, (r1, 0x0)
    4fa2:	424c      	lsli      	r2, r2, 12
    4fa4:	68c9      	andn      	r3, r2
    4fa6:	3bb0      	bseti      	r3, 16
    4fa8:	07f1      	br      	0x4f8a	// 4f8a <GPIOA0_EXI_Init+0x42>
        case 5:GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF) | 0X00100000;break;
    4faa:	9320      	ld.w      	r1, (r3, 0x0)
    4fac:	32f0      	movi      	r2, 240
    4fae:	9160      	ld.w      	r3, (r1, 0x0)
    4fb0:	4250      	lsli      	r2, r2, 16
    4fb2:	68c9      	andn      	r3, r2
    4fb4:	3bb4      	bseti      	r3, 20
    4fb6:	07ea      	br      	0x4f8a	// 4f8a <GPIOA0_EXI_Init+0x42>
        case 6:GPIOA0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF) | 0X01000000;break;
    4fb8:	9320      	ld.w      	r1, (r3, 0x0)
    4fba:	32f0      	movi      	r2, 240
    4fbc:	9160      	ld.w      	r3, (r1, 0x0)
    4fbe:	4254      	lsli      	r2, r2, 20
    4fc0:	68c9      	andn      	r3, r2
    4fc2:	3bb8      	bseti      	r3, 24
    4fc4:	07e3      	br      	0x4f8a	// 4f8a <GPIOA0_EXI_Init+0x42>
        case 7:GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF) | 0X10000000;break;
    4fc6:	9340      	ld.w      	r2, (r3, 0x0)
    4fc8:	9260      	ld.w      	r3, (r2, 0x0)
    4fca:	4364      	lsli      	r3, r3, 4
    4fcc:	4b64      	lsri      	r3, r3, 4
    4fce:	3bbc      	bseti      	r3, 28
    4fd0:	07cf      	br      	0x4f6e	// 4f6e <GPIOA0_EXI_Init+0x26>
        case 8:GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0) | 0X00000001;break;
    4fd2:	9340      	ld.w      	r2, (r3, 0x0)
    4fd4:	9261      	ld.w      	r3, (r2, 0x4)
    4fd6:	310f      	movi      	r1, 15
    4fd8:	68c5      	andn      	r3, r1
    4fda:	3ba0      	bseti      	r3, 0
		case 15:GPIOA0->CONHR = (GPIOA0->CONHR&0X0FFFFFFF) | 0X10000000;break;
    4fdc:	b261      	st.w      	r3, (r2, 0x4)
}
    4fde:	07c9      	br      	0x4f70	// 4f70 <GPIOA0_EXI_Init+0x28>
        case 9:GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFF0F) | 0X00000010;break;
    4fe0:	9340      	ld.w      	r2, (r3, 0x0)
    4fe2:	9261      	ld.w      	r3, (r2, 0x4)
    4fe4:	31f0      	movi      	r1, 240
    4fe6:	68c5      	andn      	r3, r1
    4fe8:	3ba4      	bseti      	r3, 4
    4fea:	07f9      	br      	0x4fdc	// 4fdc <GPIOA0_EXI_Init+0x94>
        case 10:GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF) | 0X00000100;break;
    4fec:	9320      	ld.w      	r1, (r3, 0x0)
    4fee:	32f0      	movi      	r2, 240
    4ff0:	9161      	ld.w      	r3, (r1, 0x4)
    4ff2:	4244      	lsli      	r2, r2, 4
    4ff4:	68c9      	andn      	r3, r2
    4ff6:	3ba8      	bseti      	r3, 8
		case 14:GPIOA0->CONHR = (GPIOA0->CONHR&0XF0FFFFFF) | 0X01000000;break;
    4ff8:	b161      	st.w      	r3, (r1, 0x4)
    4ffa:	07bb      	br      	0x4f70	// 4f70 <GPIOA0_EXI_Init+0x28>
        case 11:GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF) | 0X00001000;break;
    4ffc:	9320      	ld.w      	r1, (r3, 0x0)
    4ffe:	32f0      	movi      	r2, 240
    5000:	9161      	ld.w      	r3, (r1, 0x4)
    5002:	4248      	lsli      	r2, r2, 8
    5004:	68c9      	andn      	r3, r2
    5006:	3bac      	bseti      	r3, 12
    5008:	07f8      	br      	0x4ff8	// 4ff8 <GPIOA0_EXI_Init+0xb0>
        case 12:GPIOA0->CONHR = (GPIOA0->CONHR&0XFFF0FFFF) | 0X00010000;break;
    500a:	9320      	ld.w      	r1, (r3, 0x0)
    500c:	32f0      	movi      	r2, 240
    500e:	9161      	ld.w      	r3, (r1, 0x4)
    5010:	424c      	lsli      	r2, r2, 12
    5012:	68c9      	andn      	r3, r2
    5014:	3bb0      	bseti      	r3, 16
    5016:	07f1      	br      	0x4ff8	// 4ff8 <GPIOA0_EXI_Init+0xb0>
        case 13:GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF) | 0X00100000;break;
    5018:	9320      	ld.w      	r1, (r3, 0x0)
    501a:	32f0      	movi      	r2, 240
    501c:	9161      	ld.w      	r3, (r1, 0x4)
    501e:	4250      	lsli      	r2, r2, 16
    5020:	68c9      	andn      	r3, r2
    5022:	3bb4      	bseti      	r3, 20
    5024:	07ea      	br      	0x4ff8	// 4ff8 <GPIOA0_EXI_Init+0xb0>
		case 14:GPIOA0->CONHR = (GPIOA0->CONHR&0XF0FFFFFF) | 0X01000000;break;
    5026:	9320      	ld.w      	r1, (r3, 0x0)
    5028:	32f0      	movi      	r2, 240
    502a:	9161      	ld.w      	r3, (r1, 0x4)
    502c:	4254      	lsli      	r2, r2, 20
    502e:	68c9      	andn      	r3, r2
    5030:	3bb8      	bseti      	r3, 24
    5032:	07e3      	br      	0x4ff8	// 4ff8 <GPIOA0_EXI_Init+0xb0>
		case 15:GPIOA0->CONHR = (GPIOA0->CONHR&0X0FFFFFFF) | 0X10000000;break;
    5034:	9340      	ld.w      	r2, (r3, 0x0)
    5036:	9261      	ld.w      	r3, (r2, 0x4)
    5038:	4364      	lsli      	r3, r3, 4
    503a:	4b64      	lsri      	r3, r3, 4
    503c:	3bbc      	bseti      	r3, 28
    503e:	07cf      	br      	0x4fdc	// 4fdc <GPIOA0_EXI_Init+0x94>
    5040:	20000050 	.long	0x20000050

Disassembly of section .text.GPIO_EXI_EN:

00005044 <GPIO_EXI_EN>:
        default:break;
    }
}
void GPIO_EXI_EN(CSP_GPIO_T *GPIOx,GPIO_EXI_TypeDef EXI_IO)
{
    (GPIOx)->IECR  |= 1<<EXI_IO;
    5044:	3301      	movi      	r3, 1
    5046:	904b      	ld.w      	r2, (r0, 0x2c)
    5048:	70c4      	lsl      	r3, r1
    504a:	6cc8      	or      	r3, r2
    504c:	b06b      	st.w      	r3, (r0, 0x2c)
}
    504e:	783c      	jmp      	r15

Disassembly of section .text.GPIO_Write_High:

00005050 <GPIO_Write_High>:
//bit:0~15
//ReturnValue:VALUE
/*************************************************************/
void GPIO_Write_High(CSP_GPIO_T *GPIOx,uint8_t bit)
{
        (GPIOx)->SODR = (1ul<<bit);
    5050:	3301      	movi      	r3, 1
    5052:	70c4      	lsl      	r3, r1
    5054:	b063      	st.w      	r3, (r0, 0xc)
}
    5056:	783c      	jmp      	r15

Disassembly of section .text.GPIO_Write_Low:

00005058 <GPIO_Write_Low>:
void GPIO_Write_Low(CSP_GPIO_T *GPIOx,uint8_t bit)
{
        (GPIOx)->CODR = (1ul<<bit);
    5058:	3301      	movi      	r3, 1
    505a:	70c4      	lsl      	r3, r1
    505c:	b064      	st.w      	r3, (r0, 0x10)
}
    505e:	783c      	jmp      	r15

Disassembly of section .text.GPIO_Reverse:

00005060 <GPIO_Reverse>:
//ReturnValue:VALUE
/*************************************************************/
void GPIO_Reverse(CSP_GPIO_T *GPIOx,uint8_t bit)
{
     uint32_t dat = 0;
     dat=((GPIOx)->ODSR>>bit)&1ul;
    5060:	9045      	ld.w      	r2, (r0, 0x14)
    5062:	3301      	movi      	r3, 1
    5064:	7085      	lsr      	r2, r1
    5066:	688c      	and      	r2, r3
     {
       if (dat==1)  
    5068:	3a40      	cmpnei      	r2, 0
    506a:	70c4      	lsl      	r3, r1
    506c:	0c03      	bf      	0x5072	// 5072 <GPIO_Reverse+0x12>
       {
           (GPIOx)->CODR = (1ul<<bit);
    506e:	b064      	st.w      	r3, (r0, 0x10)
       {
           (GPIOx)->SODR = (1ul<<bit);
           return;
       }
     }
}
    5070:	783c      	jmp      	r15
           (GPIOx)->SODR = (1ul<<bit);
    5072:	b063      	st.w      	r3, (r0, 0xc)
           return;
    5074:	07fe      	br      	0x5070	// 5070 <GPIO_Reverse+0x10>

Disassembly of section .text.GPIO_Read_Status:

00005076 <GPIO_Read_Status>:
/*************************************************************/
uint8_t GPIO_Read_Status(CSP_GPIO_T *GPIOx,uint8_t bit)
{
    uint8_t value = 0;
    uint32_t dat = 0;
    dat=((GPIOx)->PSDR)&(1<<bit);
    5076:	3301      	movi      	r3, 1
    5078:	9046      	ld.w      	r2, (r0, 0x18)
    507a:	70c4      	lsl      	r3, r1
    507c:	688c      	and      	r2, r3
    if (dat == (1<<bit))								
    507e:	64ca      	cmpne      	r2, r3
    5080:	6403      	mvcv      	r0
	{
	    value = 1;
	} 
    return value;
    5082:	7400      	zextb      	r0, r0
}
    5084:	783c      	jmp      	r15

Disassembly of section .text.LPT_DeInit:

00005088 <LPT_DeInit>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void LPT_DeInit(void)
{
	LPT->CEDR 		= 0xBE980000;
    5088:	106c      	lrw      	r3, 0x20000018	// 50b8 <LPT_DeInit+0x30>
    508a:	104d      	lrw      	r2, 0xbe980000	// 50bc <LPT_DeInit+0x34>
    508c:	9360      	ld.w      	r3, (r3, 0x0)
    508e:	b340      	st.w      	r2, (r3, 0x0)
	LPT->RSSR 		= LPT_RESET_VALUE;
	LPT->PSCR 		= LPT_RESET_VALUE;
	LPT->CR	  		= 0X00010010;
    5090:	102c      	lrw      	r1, 0x10010	// 50c0 <LPT_DeInit+0x38>
	LPT->RSSR 		= LPT_RESET_VALUE;
    5092:	3200      	movi      	r2, 0
    5094:	b341      	st.w      	r2, (r3, 0x4)
	LPT->PSCR 		= LPT_RESET_VALUE;
    5096:	b342      	st.w      	r2, (r3, 0x8)
	LPT->CR	  		= 0X00010010;
    5098:	b323      	st.w      	r1, (r3, 0xc)
	LPT->SYNCR 		= LPT_RESET_VALUE;
    509a:	b344      	st.w      	r2, (r3, 0x10)
	LPT->PRDR 		= LPT_RESET_VALUE;
    509c:	b345      	st.w      	r2, (r3, 0x14)
	LPT->CMP 		= LPT_RESET_VALUE;
    509e:	b346      	st.w      	r2, (r3, 0x18)
	LPT->CNT 		= LPT_RESET_VALUE;
    50a0:	b347      	st.w      	r2, (r3, 0x1c)
	LPT->TRGFTCR 	= LPT_RESET_VALUE;
    50a2:	b348      	st.w      	r2, (r3, 0x20)
	LPT->TRGFTWR 	= LPT_RESET_VALUE;
    50a4:	b349      	st.w      	r2, (r3, 0x24)
	LPT->EVTRG 		= LPT_RESET_VALUE;
    50a6:	b34a      	st.w      	r2, (r3, 0x28)
	LPT->EVPS		= LPT_RESET_VALUE;
    50a8:	b34b      	st.w      	r2, (r3, 0x2c)
	LPT->EVSWF 		= LPT_RESET_VALUE;
    50aa:	b34c      	st.w      	r2, (r3, 0x30)
	LPT->RISR 		= LPT_RESET_VALUE;
    50ac:	b34d      	st.w      	r2, (r3, 0x34)
	LPT->MISR 		= LPT_RESET_VALUE;
    50ae:	b34e      	st.w      	r2, (r3, 0x38)
	LPT->IMCR 		= LPT_RESET_VALUE;
    50b0:	b34f      	st.w      	r2, (r3, 0x3c)
	LPT->ICR 		= LPT_RESET_VALUE;
    50b2:	b350      	st.w      	r2, (r3, 0x40)
}
    50b4:	783c      	jmp      	r15
    50b6:	0000      	bkpt
    50b8:	20000018 	.long	0x20000018
    50bc:	be980000 	.long	0xbe980000
    50c0:	00010010 	.long	0x00010010

Disassembly of section .text.LPT_Configure:

000050c4 <LPT_Configure>:
//LPT Init
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void LPT_Configure(LPT_CLK_TypeDef CLKX,LPT_CSS_TypeDef CSSX,LPT_SHDWSTP_TypeDef SHDWSTPX,LPT_PSCDIV_TypeDef PSCDIVX,U8_T FLTCKPRSX,LPT_OPM_TypeDef OPMX)
{
    50c4:	14c4      	push      	r4-r7
    50c6:	9885      	ld.w      	r4, (r14, 0x14)
    50c8:	6dd3      	mov      	r7, r4
	LPT->CEDR |=CLKX| CSSX| SHDWSTPX| (FLTCKPRSX<<8);
    50ca:	1089      	lrw      	r4, 0x20000018	// 50ec <LPT_Configure+0x28>
{
    50cc:	d8ae0010 	ld.b      	r5, (r14, 0x10)
	LPT->CEDR |=CLKX| CSSX| SHDWSTPX| (FLTCKPRSX<<8);
    50d0:	9480      	ld.w      	r4, (r4, 0x0)
    50d2:	94c0      	ld.w      	r6, (r4, 0x0)
    50d4:	6c98      	or      	r2, r6
    50d6:	6c48      	or      	r1, r2
    50d8:	6c04      	or      	r0, r1
    50da:	45a8      	lsli      	r5, r5, 8
    50dc:	6c14      	or      	r0, r5
    50de:	b400      	st.w      	r0, (r4, 0x0)
	LPT->PSCR = PSCDIVX;
    50e0:	b462      	st.w      	r3, (r4, 0x8)
	LPT->CR |=OPMX;
    50e2:	9463      	ld.w      	r3, (r4, 0xc)
    50e4:	6cdc      	or      	r3, r7
    50e6:	b463      	st.w      	r3, (r4, 0xc)
}
    50e8:	1484      	pop      	r4-r7
    50ea:	0000      	bkpt
    50ec:	20000018 	.long	0x20000018

Disassembly of section .text.LPT_Period_CMP_Write:

000050f0 <LPT_Period_CMP_Write>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void LPT_Period_CMP_Write(U16_T PRDR_DATA,U16_T CMP_DATA)
{
	LPT->PRDR =PRDR_DATA;
    50f0:	1063      	lrw      	r3, 0x20000018	// 50fc <LPT_Period_CMP_Write+0xc>
    50f2:	9360      	ld.w      	r3, (r3, 0x0)
    50f4:	b305      	st.w      	r0, (r3, 0x14)
	LPT->CMP =CMP_DATA;
    50f6:	b326      	st.w      	r1, (r3, 0x18)
}
    50f8:	783c      	jmp      	r15
    50fa:	0000      	bkpt
    50fc:	20000018 	.long	0x20000018

Disassembly of section .text.LPT_Start:

00005100 <LPT_Start>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void LPT_Start(void)
{
	LPT->RSSR |= 0X01;
    5100:	1063      	lrw      	r3, 0x20000018	// 510c <LPT_Start+0xc>
    5102:	9340      	ld.w      	r2, (r3, 0x0)
    5104:	9261      	ld.w      	r3, (r2, 0x4)
    5106:	3ba0      	bseti      	r3, 0
    5108:	b261      	st.w      	r3, (r2, 0x4)
}
    510a:	783c      	jmp      	r15
    510c:	20000018 	.long	0x20000018

Disassembly of section .text.LPT_Stop:

00005110 <LPT_Stop>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void LPT_Stop(void)
{
	LPT->RSSR &= 0XFFFFFFFE;
    5110:	1063      	lrw      	r3, 0x20000018	// 511c <LPT_Stop+0xc>
    5112:	9340      	ld.w      	r2, (r3, 0x0)
    5114:	9261      	ld.w      	r3, (r2, 0x4)
    5116:	3b80      	bclri      	r3, 0
    5118:	b261      	st.w      	r3, (r2, 0x4)
}
    511a:	783c      	jmp      	r15
    511c:	20000018 	.long	0x20000018

Disassembly of section .text.LPT_ConfigInterrupt_CMD:

00005120 <LPT_ConfigInterrupt_CMD>:
//EntryParameter:LPT_IMSCR_X,NewState
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void LPT_ConfigInterrupt_CMD(FunctionalStatus NewState,LPT_IMSCR_TypeDef LPT_IMSCR_X)
{
    5120:	1066      	lrw      	r3, 0x20000018	// 5138 <LPT_ConfigInterrupt_CMD+0x18>
	if (NewState != DISABLE)
    5122:	3840      	cmpnei      	r0, 0
	{
		LPT->IMCR  |= LPT_IMSCR_X;						
    5124:	9340      	ld.w      	r2, (r3, 0x0)
    5126:	926f      	ld.w      	r3, (r2, 0x3c)
	if (NewState != DISABLE)
    5128:	0c04      	bf      	0x5130	// 5130 <LPT_ConfigInterrupt_CMD+0x10>
		LPT->IMCR  |= LPT_IMSCR_X;						
    512a:	6c4c      	or      	r1, r3
    512c:	b22f      	st.w      	r1, (r2, 0x3c)
	}
	else
	{
		LPT->IMCR  &= ~LPT_IMSCR_X;					
	}
}
    512e:	783c      	jmp      	r15
		LPT->IMCR  &= ~LPT_IMSCR_X;					
    5130:	68c5      	andn      	r3, r1
    5132:	b26f      	st.w      	r3, (r2, 0x3c)
}
    5134:	07fd      	br      	0x512e	// 512e <LPT_ConfigInterrupt_CMD+0xe>
    5136:	0000      	bkpt
    5138:	20000018 	.long	0x20000018

Disassembly of section .text.LPT_INT_ENABLE:

0000513c <LPT_INT_ENABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void LPT_INT_ENABLE(void)
{
	INTC_ISER_WRITE(LPT_INT);
    513c:	3380      	movi      	r3, 128
    513e:	4373      	lsli      	r3, r3, 19
    5140:	1042      	lrw      	r2, 0xe000e100	// 5148 <LPT_INT_ENABLE+0xc>
    5142:	b260      	st.w      	r3, (r2, 0x0)
}
    5144:	783c      	jmp      	r15
    5146:	0000      	bkpt
    5148:	e000e100 	.long	0xe000e100

Disassembly of section .text.WWDT_CONFIG:

0000514c <WWDT_CONFIG>:
//WWDT CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void WWDT_CONFIG(WWDT_PSCDIV_TypeDef PSCDIVX,U8_T WND_DATA,WWDT_DBGEN_TypeDef DBGENX)
{
    514c:	14c1      	push      	r4
	WWDT->CFGR =WND_DATA;
    514e:	1065      	lrw      	r3, 0x20000014	// 5160 <WWDT_CONFIG+0x14>
    5150:	9380      	ld.w      	r4, (r3, 0x0)
    5152:	b421      	st.w      	r1, (r4, 0x4)
	WWDT->CFGR |= PSCDIVX |DBGENX;
    5154:	9461      	ld.w      	r3, (r4, 0x4)
    5156:	6c8c      	or      	r2, r3
    5158:	6c08      	or      	r0, r2
    515a:	b401      	st.w      	r0, (r4, 0x4)
}
    515c:	1481      	pop      	r4
    515e:	0000      	bkpt
    5160:	20000014 	.long	0x20000014

Disassembly of section .text.WWDT_CNT_Load:

00005164 <WWDT_CNT_Load>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void WWDT_CNT_Load(U8_T cnt_data)
{
	WWDT->CR  |= cnt_data;						//SET
    5164:	1063      	lrw      	r3, 0x20000014	// 5170 <WWDT_CNT_Load+0xc>
    5166:	9360      	ld.w      	r3, (r3, 0x0)
    5168:	9340      	ld.w      	r2, (r3, 0x0)
    516a:	6c08      	or      	r0, r2
    516c:	b300      	st.w      	r0, (r3, 0x0)
}
    516e:	783c      	jmp      	r15
    5170:	20000014 	.long	0x20000014

Disassembly of section .text.WWDT_Int_Config:

00005174 <WWDT_Int_Config>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void WWDT_Int_Config(FunctionalStatus NewState)
{
	if (NewState != DISABLE)
    5174:	3840      	cmpnei      	r0, 0
    5176:	106a      	lrw      	r3, 0x20000014	// 519c <WWDT_Int_Config+0x28>
    5178:	0c0b      	bf      	0x518e	// 518e <WWDT_Int_Config+0x1a>
	{
		WWDT->ICR = WWDT_EVI;				
    517a:	9360      	ld.w      	r3, (r3, 0x0)
    517c:	3101      	movi      	r1, 1
    517e:	b325      	st.w      	r1, (r3, 0x14)
		WWDT->IMCR  |= WWDT_EVI;
    5180:	9344      	ld.w      	r2, (r3, 0x10)
    5182:	6c84      	or      	r2, r1
    5184:	b344      	st.w      	r2, (r3, 0x10)
		INTC_ISER_WRITE(WWDT_INT);  
    5186:	3240      	movi      	r2, 64
    5188:	1066      	lrw      	r3, 0xe000e100	// 51a0 <WWDT_Int_Config+0x2c>
	}
	else
	{
		WWDT->IMCR  &= ~WWDT_EVI;					//CLR
		INTC_ICER_WRITE(WWDT_INT);  
    518a:	b340      	st.w      	r2, (r3, 0x0)
	}
    518c:	783c      	jmp      	r15
		WWDT->IMCR  &= ~WWDT_EVI;					//CLR
    518e:	9340      	ld.w      	r2, (r3, 0x0)
    5190:	9264      	ld.w      	r3, (r2, 0x10)
    5192:	3b80      	bclri      	r3, 0
    5194:	b264      	st.w      	r3, (r2, 0x10)
		INTC_ICER_WRITE(WWDT_INT);  
    5196:	3240      	movi      	r2, 64
    5198:	1063      	lrw      	r3, 0xe000e180	// 51a4 <WWDT_Int_Config+0x30>
    519a:	07f8      	br      	0x518a	// 518a <WWDT_Int_Config+0x16>
    519c:	20000014 	.long	0x20000014
    51a0:	e000e100 	.long	0xe000e100
    51a4:	e000e180 	.long	0xe000e180

Disassembly of section .text.BT_Stop:

000051a8 <BT_Stop>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void BT_Stop(CSP_BT_T *BTx)
{
	BTx->RSSR &=0X0;
    51a8:	9060      	ld.w      	r3, (r0, 0x0)
    51aa:	3300      	movi      	r3, 0
    51ac:	b060      	st.w      	r3, (r0, 0x0)
}
    51ae:	783c      	jmp      	r15

Disassembly of section .text.GPT_Stop:

000051b0 <GPT_Stop>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_Stop(void)
{
	GPT0->RSSR &= 0XFFFFFFFE;
    51b0:	1063      	lrw      	r3, 0x20000028	// 51bc <GPT_Stop+0xc>
    51b2:	9340      	ld.w      	r2, (r3, 0x0)
    51b4:	9261      	ld.w      	r3, (r2, 0x4)
    51b6:	3b80      	bclri      	r3, 0
    51b8:	b261      	st.w      	r3, (r2, 0x4)
}
    51ba:	783c      	jmp      	r15
    51bc:	20000028 	.long	0x20000028

Disassembly of section .text.UART1_DeInit:

000051c0 <UART1_DeInit>:
    UART0->ISR  = UART_RESET_VALUE;
    UART0->BRDIV =UART_RESET_VALUE;
}
void UART1_DeInit(void)
{
    UART1->DATA = UART_RESET_VALUE;
    51c0:	1065      	lrw      	r3, 0x20000040	// 51d4 <UART1_DeInit+0x14>
    51c2:	3200      	movi      	r2, 0
    51c4:	9360      	ld.w      	r3, (r3, 0x0)
    51c6:	b340      	st.w      	r2, (r3, 0x0)
    UART1->SR   = UART_RESET_VALUE;
    51c8:	b341      	st.w      	r2, (r3, 0x4)
    UART1->CTRL = UART_RESET_VALUE;
    51ca:	b342      	st.w      	r2, (r3, 0x8)
    UART1->ISR  = UART_RESET_VALUE;
    51cc:	b343      	st.w      	r2, (r3, 0xc)
    UART1->BRDIV =UART_RESET_VALUE;
    51ce:	b344      	st.w      	r2, (r3, 0x10)
}
    51d0:	783c      	jmp      	r15
    51d2:	0000      	bkpt
    51d4:	20000040 	.long	0x20000040

Disassembly of section .text.UART2_DeInit:

000051d8 <UART2_DeInit>:
void UART2_DeInit(void)
{
	UART2->DATA = UART_RESET_VALUE;
    51d8:	1065      	lrw      	r3, 0x2000003c	// 51ec <UART2_DeInit+0x14>
    51da:	3200      	movi      	r2, 0
    51dc:	9360      	ld.w      	r3, (r3, 0x0)
    51de:	b340      	st.w      	r2, (r3, 0x0)
    UART2->SR   = UART_RESET_VALUE;
    51e0:	b341      	st.w      	r2, (r3, 0x4)
    UART2->CTRL = UART_RESET_VALUE;
    51e2:	b342      	st.w      	r2, (r3, 0x8)
    UART2->ISR  = UART_RESET_VALUE;
    51e4:	b343      	st.w      	r2, (r3, 0xc)
    UART2->BRDIV =UART_RESET_VALUE;
    51e6:	b344      	st.w      	r2, (r3, 0x10)
}
    51e8:	783c      	jmp      	r15
    51ea:	0000      	bkpt
    51ec:	2000003c 	.long	0x2000003c

Disassembly of section .text.UART1_Int_Enable:

000051f0 <UART1_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART1_Int_Enable(void)
{
    UART1->ISR=0x0F;									//clear UART1 INT status
    51f0:	1065      	lrw      	r3, 0x20000040	// 5204 <UART1_Int_Enable+0x14>
    51f2:	320f      	movi      	r2, 15
    51f4:	9360      	ld.w      	r3, (r3, 0x0)
    51f6:	b343      	st.w      	r2, (r3, 0xc)
	INTC_ISER_WRITE(UART1_INT);							//INT Vector Enable UART0/1 Interrupt in CK802
    51f8:	3380      	movi      	r3, 128
    51fa:	4367      	lsli      	r3, r3, 7
    51fc:	1043      	lrw      	r2, 0xe000e100	// 5208 <UART1_Int_Enable+0x18>
    51fe:	b260      	st.w      	r3, (r2, 0x0)
}
    5200:	783c      	jmp      	r15
    5202:	0000      	bkpt
    5204:	20000040 	.long	0x20000040
    5208:	e000e100 	.long	0xe000e100

Disassembly of section .text.UART2_Int_Enable:

0000520c <UART2_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART2_Int_Enable(void)
{
    UART2->ISR=0x0F;									//clear UART1 INT status
    520c:	1065      	lrw      	r3, 0x2000003c	// 5220 <UART2_Int_Enable+0x14>
    520e:	320f      	movi      	r2, 15
    5210:	9360      	ld.w      	r3, (r3, 0x0)
    5212:	b343      	st.w      	r2, (r3, 0xc)
	INTC_ISER_WRITE(UART2_INT);							//INT Vector Enable UART0/1 Interrupt in CK802
    5214:	3380      	movi      	r3, 128
    5216:	4368      	lsli      	r3, r3, 8
    5218:	1043      	lrw      	r2, 0xe000e100	// 5224 <UART2_Int_Enable+0x18>
    521a:	b260      	st.w      	r3, (r2, 0x0)
}
    521c:	783c      	jmp      	r15
    521e:	0000      	bkpt
    5220:	2000003c 	.long	0x2000003c
    5224:	e000e100 	.long	0xe000e100

Disassembly of section .text.UART1_WakeUp_Enable:

00005228 <UART1_WakeUp_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART1_WakeUp_Enable(void)
{
    INTC_IWER_WRITE(UART1_INT);    
    5228:	3380      	movi      	r3, 128
    522a:	4367      	lsli      	r3, r3, 7
    522c:	1042      	lrw      	r2, 0xe000e100	// 5234 <UART1_WakeUp_Enable+0xc>
    522e:	b270      	st.w      	r3, (r2, 0x40)
}
    5230:	783c      	jmp      	r15
    5232:	0000      	bkpt
    5234:	e000e100 	.long	0xe000e100

Disassembly of section .text.UART_IO_Init:

00005238 <UART_IO_Init>:
//UART_IO_G:0 1
//ReturnValue:NONE
/*************************************************************/
void UART_IO_Init(UART_NUM_TypeDef IO_UART_NUM , U8_T UART_IO_G)
{
    if (IO_UART_NUM==IO_UART0)
    5238:	3840      	cmpnei      	r0, 0
    523a:	0821      	bt      	0x527c	// 527c <UART_IO_Init+0x44>
    {
		if(UART_IO_G==0)
    523c:	3940      	cmpnei      	r1, 0
    523e:	080a      	bt      	0x5252	// 5252 <UART_IO_Init+0x1a>
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF00)  | 0x00000044;       //PA0.1->RXD0, PA0.0->TXD0
    5240:	1176      	lrw      	r3, 0x20000050	// 5318 <UART_IO_Init+0xe0>
    5242:	31ff      	movi      	r1, 255
    5244:	9340      	ld.w      	r2, (r3, 0x0)
    5246:	9260      	ld.w      	r3, (r2, 0x0)
    5248:	68c5      	andn      	r3, r1
    524a:	3ba2      	bseti      	r3, 2
    524c:	3ba6      	bseti      	r3, 6
    }
	 if (IO_UART_NUM==IO_UART2)
    {
        if(UART_IO_G==0)
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF00)  | 0x00000077;       //PA0.0->RXD2, PA0.1->TXD2
    524e:	b260      	st.w      	r3, (r2, 0x0)
    5250:	0415      	br      	0x527a	// 527a <UART_IO_Init+0x42>
		else if(UART_IO_G==1)
    5252:	3941      	cmpnei      	r1, 1
    5254:	0813      	bt      	0x527a	// 527a <UART_IO_Init+0x42>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF)  | 0x00700000;      //PA0.5->RXD0, PA0.12->TXD0
    5256:	1171      	lrw      	r3, 0x20000050	// 5318 <UART_IO_Init+0xe0>
    5258:	31f0      	movi      	r1, 240
    525a:	9340      	ld.w      	r2, (r3, 0x0)
    525c:	9260      	ld.w      	r3, (r2, 0x0)
    525e:	4130      	lsli      	r1, r1, 16
    5260:	68c5      	andn      	r3, r1
    5262:	31e0      	movi      	r1, 224
    5264:	412f      	lsli      	r1, r1, 15
    5266:	6cc4      	or      	r3, r1
    5268:	b260      	st.w      	r3, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFF0FFFF)  | 0x00070000;      
    526a:	31f0      	movi      	r1, 240
    526c:	9261      	ld.w      	r3, (r2, 0x4)
    526e:	412c      	lsli      	r1, r1, 12
    5270:	68c5      	andn      	r3, r1
    5272:	31e0      	movi      	r1, 224
    5274:	412b      	lsli      	r1, r1, 11
    5276:	6cc4      	or      	r3, r1
    5278:	b261      	st.w      	r3, (r2, 0x4)
		else if(UART_IO_G==2)
		{
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF00FFFF) | 0X00660000;        //PB0.5->RXD2, PB0.4->TXD2
		}
    }
}
    527a:	783c      	jmp      	r15
     if (IO_UART_NUM==IO_UART1)
    527c:	3841      	cmpnei      	r0, 1
    527e:	082b      	bt      	0x52d4	// 52d4 <UART_IO_Init+0x9c>
        if(UART_IO_G==0)
    5280:	3940      	cmpnei      	r1, 0
    5282:	0814      	bt      	0x52aa	// 52aa <UART_IO_Init+0x72>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)  | 0x00000007;       //PA0.13->RXD1, PB0.0->TXD1
    5284:	1166      	lrw      	r3, 0x2000004c	// 531c <UART_IO_Init+0xe4>
    5286:	310f      	movi      	r1, 15
    5288:	9340      	ld.w      	r2, (r3, 0x0)
    528a:	9260      	ld.w      	r3, (r2, 0x0)
    528c:	68c5      	andn      	r3, r1
    528e:	3107      	movi      	r1, 7
    5290:	6cc4      	or      	r3, r1
    5292:	b260      	st.w      	r3, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)  | 0x00700000;       
    5294:	32f0      	movi      	r2, 240
    5296:	1161      	lrw      	r3, 0x20000050	// 5318 <UART_IO_Init+0xe0>
    5298:	4250      	lsli      	r2, r2, 16
    529a:	9320      	ld.w      	r1, (r3, 0x0)
    529c:	9161      	ld.w      	r3, (r1, 0x4)
    529e:	68c9      	andn      	r3, r2
    52a0:	32e0      	movi      	r2, 224
    52a2:	424f      	lsli      	r2, r2, 15
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF) | 0X77000000;        //PA0.15->RXD1, PA0.14->TXD1
    52a4:	6cc8      	or      	r3, r2
    52a6:	b161      	st.w      	r3, (r1, 0x4)
    52a8:	07e9      	br      	0x527a	// 527a <UART_IO_Init+0x42>
		else if(UART_IO_G==1)
    52aa:	3941      	cmpnei      	r1, 1
    52ac:	080c      	bt      	0x52c4	// 52c4 <UART_IO_Init+0x8c>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF00FFF) | 0X00077000;        //PA0.4->RXD1, PA0.3->TXD1
    52ae:	107b      	lrw      	r3, 0x20000050	// 5318 <UART_IO_Init+0xe0>
    52b0:	32ff      	movi      	r2, 255
    52b2:	9320      	ld.w      	r1, (r3, 0x0)
    52b4:	424c      	lsli      	r2, r2, 12
    52b6:	9160      	ld.w      	r3, (r1, 0x0)
    52b8:	68c9      	andn      	r3, r2
    52ba:	32ee      	movi      	r2, 238
    52bc:	424b      	lsli      	r2, r2, 11
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF00FFFF) | 0X00660000;        //PB0.5->RXD2, PB0.4->TXD2
    52be:	6cc8      	or      	r3, r2
    52c0:	b160      	st.w      	r3, (r1, 0x0)
}
    52c2:	07dc      	br      	0x527a	// 527a <UART_IO_Init+0x42>
		else if(UART_IO_G==2)
    52c4:	3942      	cmpnei      	r1, 2
    52c6:	0bda      	bt      	0x527a	// 527a <UART_IO_Init+0x42>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF) | 0X77000000;        //PA0.15->RXD1, PA0.14->TXD1
    52c8:	1074      	lrw      	r3, 0x20000050	// 5318 <UART_IO_Init+0xe0>
    52ca:	32ee      	movi      	r2, 238
    52cc:	9320      	ld.w      	r1, (r3, 0x0)
    52ce:	9161      	ld.w      	r3, (r1, 0x4)
    52d0:	4257      	lsli      	r2, r2, 23
    52d2:	07e9      	br      	0x52a4	// 52a4 <UART_IO_Init+0x6c>
	 if (IO_UART_NUM==IO_UART2)
    52d4:	3842      	cmpnei      	r0, 2
    52d6:	0bd2      	bt      	0x527a	// 527a <UART_IO_Init+0x42>
        if(UART_IO_G==0)
    52d8:	3940      	cmpnei      	r1, 0
    52da:	0809      	bt      	0x52ec	// 52ec <UART_IO_Init+0xb4>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF00)  | 0x00000077;       //PA0.0->RXD2, PA0.1->TXD2
    52dc:	106f      	lrw      	r3, 0x20000050	// 5318 <UART_IO_Init+0xe0>
    52de:	31ff      	movi      	r1, 255
    52e0:	9340      	ld.w      	r2, (r3, 0x0)
    52e2:	9260      	ld.w      	r3, (r2, 0x0)
    52e4:	68c5      	andn      	r3, r1
    52e6:	3177      	movi      	r1, 119
    52e8:	6cc4      	or      	r3, r1
    52ea:	07b2      	br      	0x524e	// 524e <UART_IO_Init+0x16>
		else if(UART_IO_G==1)
    52ec:	3941      	cmpnei      	r1, 1
    52ee:	0809      	bt      	0x5300	// 5300 <UART_IO_Init+0xc8>
			GPIOA0->CONLR = (GPIOA0->CONLR&0X00FFFFFF) | 0X77000000;        //PA0.7->RXD2, PA0.6->TXD2
    52f0:	106a      	lrw      	r3, 0x20000050	// 5318 <UART_IO_Init+0xe0>
    52f2:	32ee      	movi      	r2, 238
    52f4:	9320      	ld.w      	r1, (r3, 0x0)
    52f6:	9160      	ld.w      	r3, (r1, 0x0)
    52f8:	4368      	lsli      	r3, r3, 8
    52fa:	4b68      	lsri      	r3, r3, 8
    52fc:	4257      	lsli      	r2, r2, 23
    52fe:	07e0      	br      	0x52be	// 52be <UART_IO_Init+0x86>
		else if(UART_IO_G==2)
    5300:	3942      	cmpnei      	r1, 2
    5302:	0bbc      	bt      	0x527a	// 527a <UART_IO_Init+0x42>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF00FFFF) | 0X00660000;        //PB0.5->RXD2, PB0.4->TXD2
    5304:	1066      	lrw      	r3, 0x2000004c	// 531c <UART_IO_Init+0xe4>
    5306:	32ff      	movi      	r2, 255
    5308:	9320      	ld.w      	r1, (r3, 0x0)
    530a:	4250      	lsli      	r2, r2, 16
    530c:	9160      	ld.w      	r3, (r1, 0x0)
    530e:	68c9      	andn      	r3, r2
    5310:	32cc      	movi      	r2, 204
    5312:	424f      	lsli      	r2, r2, 15
    5314:	07d5      	br      	0x52be	// 52be <UART_IO_Init+0x86>
    5316:	0000      	bkpt
    5318:	20000050 	.long	0x20000050
    531c:	2000004c 	.long	0x2000004c

Disassembly of section .text.UARTInitRxIntEn:

00005320 <UARTInitRxIntEn>:
//ReturnValue:NONE
/*************************************************************/
void UARTInitRxIntEn(CSP_UART_T *uart,U16_T baudrate_u16,UART_PAR_TypeDef PAR_DAT)
{
   // Set Transmitter Enable
   CSP_UART_SET_CTRL(uart, UART_TX | UART_RX | UART_RX_INT);
    5320:	330b      	movi      	r3, 11
    5322:	b062      	st.w      	r3, (r0, 0x8)
   // Set Baudrate
   CSP_UART_SET_BRDIV(uart, baudrate_u16);
    5324:	b024      	st.w      	r1, (r0, 0x10)
   uart->CTRL|=PAR_DAT|(0X01<<31);
    5326:	9062      	ld.w      	r3, (r0, 0x8)
    5328:	3abf      	bseti      	r2, 31
    532a:	6c8c      	or      	r2, r3
    532c:	b042      	st.w      	r2, (r0, 0x8)
}
    532e:	783c      	jmp      	r15

Disassembly of section .text.UARTClose:

00005330 <UARTClose>:
//ReturnValue:NONE
/*************************************************************/
void UARTClose(CSP_UART_T *uart)
{
	// Set Transmitter Disable
	CSP_UART_SET_CTRL(uart, 0x00);
    5330:	3300      	movi      	r3, 0
    5332:	b062      	st.w      	r3, (r0, 0x8)
}
    5334:	783c      	jmp      	r15

Disassembly of section .text.UARTTxByte:

00005336 <UARTTxByte>:
/*************************************************************/
void UARTTxByte(CSP_UART_T *uart,U8_T txdata_u8)
{
	unsigned int  DataI;
	// Write the transmit buffer
	CSP_UART_SET_DATA(uart,txdata_u8);
    5336:	b020      	st.w      	r1, (r0, 0x0)
	do
	{
		DataI = CSP_UART_GET_SR(uart);
		DataI = DataI & UART_TX_FULL;
    5338:	3201      	movi      	r2, 1
		DataI = CSP_UART_GET_SR(uart);
    533a:	9061      	ld.w      	r3, (r0, 0x4)
		DataI = DataI & UART_TX_FULL;
    533c:	68c8      	and      	r3, r2
	}
	while(DataI == UART_TX_FULL);    //Loop  when tx is full
    533e:	3b40      	cmpnei      	r3, 0
    5340:	0bfd      	bt      	0x533a	// 533a <UARTTxByte+0x4>
	while ( (CSP_UART_GET_ISR(uart) & UART_TX_INT_S) != UART_TX_INT_S ) {}

	// Clear status bit for the next transmit
	CSP_UART_SET_ISR(uart, UART_TX_INT_S);*/

}
    5342:	783c      	jmp      	r15

Disassembly of section .text.I2C_DeInit:

00005344 <I2C_DeInit>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_DeInit(void)
{
    I2C0->ENABLE  	= 0;
    5344:	1064      	lrw      	r3, 0x20000034	// 5354 <I2C_DeInit+0x10>
    5346:	3200      	movi      	r2, 0
    5348:	9360      	ld.w      	r3, (r3, 0x0)
    534a:	b34f      	st.w      	r2, (r3, 0x3c)
    I2C0->IMSCR  	= 0;
    534c:	b357      	st.w      	r2, (r3, 0x5c)
    I2C0->ICR   	= 0X7FFF;
    534e:	1043      	lrw      	r2, 0x7fff	// 5358 <I2C_DeInit+0x14>
    5350:	b359      	st.w      	r2, (r3, 0x64)
} 
    5352:	783c      	jmp      	r15
    5354:	20000034 	.long	0x20000034
    5358:	00007fff 	.long	0x00007fff

Disassembly of section .text.I2C_Slave_CONFIG:

0000535c <I2C_Slave_CONFIG>:
//I2C_SALVE_ADD:I2C SLAVE ADDRESS
//ReturnValue:NONE
/*************************************************************/
void I2C_Slave_CONFIG(I2C_SDA_TypeDef I2C_SDA_IO,I2C_SCL_TypeDef I2C_SCL_IO,I2C_SPEEDMODE_TypeDef SPEEDMODE,
						I2C_SLAVEBITS_TypeDef SLAVEBITS,U16_T I2C_SALVE_ADDS,U16_T SS_SCLHX,U16_T SS_SCLLX)
{
    535c:	14c4      	push      	r4-r7
    535e:	1421      	subi      	r14, r14, 4
    5360:	d88e100a 	ld.h      	r4, (r14, 0x14)
	//SDA IO Initial
    if(I2C_SDA_IO==I2C_SDA_PA00)
    5364:	3840      	cmpnei      	r0, 0
{
    5366:	b880      	st.w      	r4, (r14, 0x0)
    5368:	d8ae100c 	ld.h      	r5, (r14, 0x18)
    536c:	d88e100e 	ld.h      	r4, (r14, 0x1c)
    if(I2C_SDA_IO==I2C_SDA_PA00)
    5370:	080a      	bt      	0x5384	// 5384 <I2C_Slave_CONFIG+0x28>
    {
    GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFF0)  | 0x00000005;            //PA0.0->SDA
    5372:	1206      	lrw      	r0, 0x20000050	// 5488 <I2C_Slave_CONFIG+0x12c>
    5374:	370f      	movi      	r7, 15
    5376:	90c0      	ld.w      	r6, (r0, 0x0)
    5378:	9600      	ld.w      	r0, (r6, 0x0)
    537a:	681d      	andn      	r0, r7
    537c:	38a0      	bseti      	r0, 0
    537e:	38a2      	bseti      	r0, 2
    {
    GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00006000;            //PA0.3->SDA   ///
    }
	else if (I2C_SDA_IO==I2C_SDA_PA07)
    {
    GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)  | 0x40000000;            //PA0.7->SDA        
    5380:	b600      	st.w      	r0, (r6, 0x0)
    5382:	040c      	br      	0x539a	// 539a <I2C_Slave_CONFIG+0x3e>
    else if(I2C_SDA_IO==I2C_SDA_PA03)
    5384:	3841      	cmpnei      	r0, 1
    5386:	0827      	bt      	0x53d4	// 53d4 <I2C_Slave_CONFIG+0x78>
    GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00006000;            //PA0.3->SDA   ///
    5388:	1200      	lrw      	r0, 0x20000050	// 5488 <I2C_Slave_CONFIG+0x12c>
    538a:	36f0      	movi      	r6, 240
    538c:	90e0      	ld.w      	r7, (r0, 0x0)
    538e:	9700      	ld.w      	r0, (r7, 0x0)
    5390:	46c8      	lsli      	r6, r6, 8
    5392:	6819      	andn      	r0, r6
    5394:	38ad      	bseti      	r0, 13
    5396:	38ae      	bseti      	r0, 14
    5398:	b700      	st.w      	r0, (r7, 0x0)
	else if(I2C_SDA_IO==I2C_SDA_PA014)
    {
    GPIOA0->CONHR = (GPIOA0->CONHR&0XF0FFFFFF)  | 0x06000000;            //PA0.14->SDA
    }
	//SCL IO Initial
	if (I2C_SCL_IO==I2C_SCL_PB00)
    539a:	3940      	cmpnei      	r1, 0
    539c:	083c      	bt      	0x5414	// 5414 <I2C_Slave_CONFIG+0xb8>
    {
    GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)  | 0x00000006;            //PB0.0->SCL        
    539e:	113c      	lrw      	r1, 0x2000004c	// 548c <I2C_Slave_CONFIG+0x130>
    53a0:	360f      	movi      	r6, 15
    53a2:	9100      	ld.w      	r0, (r1, 0x0)
    53a4:	9020      	ld.w      	r1, (r0, 0x0)
    53a6:	6859      	andn      	r1, r6
    53a8:	39a1      	bseti      	r1, 1
    53aa:	39a2      	bseti      	r1, 2
    }
	else if (I2C_SCL_IO==I2C_SCL_PB02)
    {
    GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)  | 0x00000400;            //PB0.2->SCL        
    53ac:	b020      	st.w      	r1, (r0, 0x0)
    }
	else if(I2C_SCL_IO==I2C_SCL_PA015)
    {
    GPIOA0->CONHR = (GPIOA0->CONHR&0X0FFFFFFF)  | 0x60000000;            //PA0.15->SCL  
    }
	I2C0->ENABLE = (I2C0->ENABLE&0XFFFFFFFE)|I2C_DISABLE;
    53ae:	1139      	lrw      	r1, 0x20000034	// 5490 <I2C_Slave_CONFIG+0x134>
	I2C0->CR =(I2C0->CR&0XFFFFF000)| I2C_MASTER_DIS |I2C_SLAVE_EN | SPEEDMODE | SLAVEBITS;
    53b0:	11d9      	lrw      	r6, 0xfff	// 5494 <I2C_Slave_CONFIG+0x138>
	I2C0->ENABLE = (I2C0->ENABLE&0XFFFFFFFE)|I2C_DISABLE;
    53b2:	9120      	ld.w      	r1, (r1, 0x0)
    53b4:	910f      	ld.w      	r0, (r1, 0x3c)
    53b6:	3880      	bclri      	r0, 0
    53b8:	b10f      	st.w      	r0, (r1, 0x3c)
	I2C0->CR =(I2C0->CR&0XFFFFF000)| I2C_MASTER_DIS |I2C_SLAVE_EN | SPEEDMODE | SLAVEBITS;
    53ba:	9100      	ld.w      	r0, (r1, 0x0)
    53bc:	6819      	andn      	r0, r6
    53be:	6cc0      	or      	r3, r0
    53c0:	6cc8      	or      	r3, r2
    53c2:	b160      	st.w      	r3, (r1, 0x0)
	I2C0->SADDR = I2C_SALVE_ADDS;
	if(SPEEDMODE==FAST_MODE)
    53c4:	3a44      	cmpnei      	r2, 4
	I2C0->SADDR = I2C_SALVE_ADDS;
    53c6:	9860      	ld.w      	r3, (r14, 0x0)
    53c8:	b162      	st.w      	r3, (r1, 0x8)
	if(SPEEDMODE==FAST_MODE)
    53ca:	085a      	bt      	0x547e	// 547e <I2C_Slave_CONFIG+0x122>
	{
		I2C0->FS_SCLH  = SS_SCLHX;  							//SCL high time
    53cc:	b1a7      	st.w      	r5, (r1, 0x1c)
		I2C0->FS_SCLL  = SS_SCLLX;  							//SCL low  time
    53ce:	b188      	st.w      	r4, (r1, 0x20)
	else if(SPEEDMODE==STANDARD_MODE)
	{
		I2C0->SS_SCLH  = SS_SCLHX;  							//SCL high time
		I2C0->SS_SCLL  = SS_SCLLX;  							//SCL low  time
	}
}
    53d0:	1401      	addi      	r14, r14, 4
    53d2:	1484      	pop      	r4-r7
	else if (I2C_SDA_IO==I2C_SDA_PA07)
    53d4:	3842      	cmpnei      	r0, 2
    53d6:	0808      	bt      	0x53e6	// 53e6 <I2C_Slave_CONFIG+0x8a>
    GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)  | 0x40000000;            //PA0.7->SDA        
    53d8:	110c      	lrw      	r0, 0x20000050	// 5488 <I2C_Slave_CONFIG+0x12c>
    53da:	90c0      	ld.w      	r6, (r0, 0x0)
    53dc:	9600      	ld.w      	r0, (r6, 0x0)
    53de:	4004      	lsli      	r0, r0, 4
    53e0:	4804      	lsri      	r0, r0, 4
    53e2:	38be      	bseti      	r0, 30
    53e4:	07ce      	br      	0x5380	// 5380 <I2C_Slave_CONFIG+0x24>
	else if(I2C_SDA_IO==I2C_SDA_PA013)
    53e6:	3843      	cmpnei      	r0, 3
    53e8:	080b      	bt      	0x53fe	// 53fe <I2C_Slave_CONFIG+0xa2>
    GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)  | 0x00600000;            //PA0.13->SDA
    53ea:	1108      	lrw      	r0, 0x20000050	// 5488 <I2C_Slave_CONFIG+0x12c>
    53ec:	36f0      	movi      	r6, 240
    53ee:	90e0      	ld.w      	r7, (r0, 0x0)
    53f0:	9701      	ld.w      	r0, (r7, 0x4)
    53f2:	46d0      	lsli      	r6, r6, 16
    53f4:	6819      	andn      	r0, r6
    53f6:	38b5      	bseti      	r0, 21
    53f8:	38b6      	bseti      	r0, 22
    GPIOA0->CONHR = (GPIOA0->CONHR&0XF0FFFFFF)  | 0x06000000;            //PA0.14->SDA
    53fa:	b701      	st.w      	r0, (r7, 0x4)
    53fc:	07cf      	br      	0x539a	// 539a <I2C_Slave_CONFIG+0x3e>
	else if(I2C_SDA_IO==I2C_SDA_PA014)
    53fe:	3844      	cmpnei      	r0, 4
    5400:	0bcd      	bt      	0x539a	// 539a <I2C_Slave_CONFIG+0x3e>
    GPIOA0->CONHR = (GPIOA0->CONHR&0XF0FFFFFF)  | 0x06000000;            //PA0.14->SDA
    5402:	1102      	lrw      	r0, 0x20000050	// 5488 <I2C_Slave_CONFIG+0x12c>
    5404:	36f0      	movi      	r6, 240
    5406:	90e0      	ld.w      	r7, (r0, 0x0)
    5408:	9701      	ld.w      	r0, (r7, 0x4)
    540a:	46d4      	lsli      	r6, r6, 20
    540c:	6819      	andn      	r0, r6
    540e:	38b9      	bseti      	r0, 25
    5410:	38ba      	bseti      	r0, 26
    5412:	07f4      	br      	0x53fa	// 53fa <I2C_Slave_CONFIG+0x9e>
	else if (I2C_SCL_IO==I2C_SCL_PB02)
    5414:	3941      	cmpnei      	r1, 1
    5416:	0809      	bt      	0x5428	// 5428 <I2C_Slave_CONFIG+0xcc>
    GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)  | 0x00000400;            //PB0.2->SCL        
    5418:	103d      	lrw      	r1, 0x2000004c	// 548c <I2C_Slave_CONFIG+0x130>
    541a:	36f0      	movi      	r6, 240
    541c:	9100      	ld.w      	r0, (r1, 0x0)
    541e:	9020      	ld.w      	r1, (r0, 0x0)
    5420:	46c4      	lsli      	r6, r6, 4
    5422:	6859      	andn      	r1, r6
    5424:	39aa      	bseti      	r1, 10
    5426:	07c3      	br      	0x53ac	// 53ac <I2C_Slave_CONFIG+0x50>
    else if(I2C_SCL_IO==I2C_SCL_PA01)
    5428:	3942      	cmpnei      	r1, 2
    542a:	0809      	bt      	0x543c	// 543c <I2C_Slave_CONFIG+0xe0>
    GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF0F)  | 0x00000050;            //PA0.1->SCL
    542c:	1037      	lrw      	r1, 0x20000050	// 5488 <I2C_Slave_CONFIG+0x12c>
    542e:	36f0      	movi      	r6, 240
    5430:	9100      	ld.w      	r0, (r1, 0x0)
    5432:	9020      	ld.w      	r1, (r0, 0x0)
    5434:	6859      	andn      	r1, r6
    5436:	39a4      	bseti      	r1, 4
    5438:	39a6      	bseti      	r1, 6
    543a:	07b9      	br      	0x53ac	// 53ac <I2C_Slave_CONFIG+0x50>
    else if(I2C_SCL_IO==I2C_SCL_PA04)
    543c:	3943      	cmpnei      	r1, 3
    543e:	080a      	bt      	0x5452	// 5452 <I2C_Slave_CONFIG+0xf6>
     GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF0FFFF)  | 0x00060000;            //PA0.4->SCL   //
    5440:	1032      	lrw      	r1, 0x20000050	// 5488 <I2C_Slave_CONFIG+0x12c>
    5442:	36f0      	movi      	r6, 240
    5444:	9100      	ld.w      	r0, (r1, 0x0)
    5446:	9020      	ld.w      	r1, (r0, 0x0)
    5448:	46cc      	lsli      	r6, r6, 12
    544a:	6859      	andn      	r1, r6
    544c:	39b1      	bseti      	r1, 17
    544e:	39b2      	bseti      	r1, 18
    5450:	07ae      	br      	0x53ac	// 53ac <I2C_Slave_CONFIG+0x50>
	else if(I2C_SCL_IO==I2C_SCL_PA06)
    5452:	3944      	cmpnei      	r1, 4
    5454:	080a      	bt      	0x5468	// 5468 <I2C_Slave_CONFIG+0x10c>
    GPIOA0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF)  | 0x06000000;            //PA0.6->SCL  
    5456:	102d      	lrw      	r1, 0x20000050	// 5488 <I2C_Slave_CONFIG+0x12c>
    5458:	36f0      	movi      	r6, 240
    545a:	9100      	ld.w      	r0, (r1, 0x0)
    545c:	9020      	ld.w      	r1, (r0, 0x0)
    545e:	46d4      	lsli      	r6, r6, 20
    5460:	6859      	andn      	r1, r6
    5462:	39b9      	bseti      	r1, 25
    5464:	39ba      	bseti      	r1, 26
    5466:	07a3      	br      	0x53ac	// 53ac <I2C_Slave_CONFIG+0x50>
	else if(I2C_SCL_IO==I2C_SCL_PA015)
    5468:	3945      	cmpnei      	r1, 5
    546a:	0ba2      	bt      	0x53ae	// 53ae <I2C_Slave_CONFIG+0x52>
    GPIOA0->CONHR = (GPIOA0->CONHR&0X0FFFFFFF)  | 0x60000000;            //PA0.15->SCL  
    546c:	1027      	lrw      	r1, 0x20000050	// 5488 <I2C_Slave_CONFIG+0x12c>
    546e:	9100      	ld.w      	r0, (r1, 0x0)
    5470:	9021      	ld.w      	r1, (r0, 0x4)
    5472:	4124      	lsli      	r1, r1, 4
    5474:	4924      	lsri      	r1, r1, 4
    5476:	39bd      	bseti      	r1, 29
    5478:	39be      	bseti      	r1, 30
    547a:	b021      	st.w      	r1, (r0, 0x4)
    547c:	0799      	br      	0x53ae	// 53ae <I2C_Slave_CONFIG+0x52>
	else if(SPEEDMODE==STANDARD_MODE)
    547e:	3a42      	cmpnei      	r2, 2
    5480:	0ba8      	bt      	0x53d0	// 53d0 <I2C_Slave_CONFIG+0x74>
		I2C0->SS_SCLH  = SS_SCLHX;  							//SCL high time
    5482:	b1a5      	st.w      	r5, (r1, 0x14)
		I2C0->SS_SCLL  = SS_SCLLX;  							//SCL low  time
    5484:	b186      	st.w      	r4, (r1, 0x18)
}
    5486:	07a5      	br      	0x53d0	// 53d0 <I2C_Slave_CONFIG+0x74>
    5488:	20000050 	.long	0x20000050
    548c:	2000004c 	.long	0x2000004c
    5490:	20000034 	.long	0x20000034
    5494:	00000fff 	.long	0x00000fff

Disassembly of section .text.I2C_SDA_TSETUP_THOLD_CONFIG:

00005498 <I2C_SDA_TSETUP_THOLD_CONFIG>:
//ReturnValue:NONE
/*************************************************************/
void I2C_SDA_TSETUP_THOLD_CONFIG(U8_T SDA_TSETUP , U8_T SDA_RX_THOLD , U16_T SDA_TX_THOLD)
{
	I2C0->SDA_TSETUP=SDA_TSETUP;
	I2C0->SDA_THOLD=(SDA_RX_THOLD<<16)|SDA_TX_THOLD;
    5498:	4130      	lsli      	r1, r1, 16
	I2C0->SDA_TSETUP=SDA_TSETUP;
    549a:	1064      	lrw      	r3, 0x20000034	// 54a8 <I2C_SDA_TSETUP_THOLD_CONFIG+0x10>
	I2C0->SDA_THOLD=(SDA_RX_THOLD<<16)|SDA_TX_THOLD;
    549c:	6c84      	or      	r2, r1
	I2C0->SDA_TSETUP=SDA_TSETUP;
    549e:	9360      	ld.w      	r3, (r3, 0x0)
    54a0:	b312      	st.w      	r0, (r3, 0x48)
	I2C0->SDA_THOLD=(SDA_RX_THOLD<<16)|SDA_TX_THOLD;
    54a2:	b353      	st.w      	r2, (r3, 0x4c)
}
    54a4:	783c      	jmp      	r15
    54a6:	0000      	bkpt
    54a8:	20000034 	.long	0x20000034

Disassembly of section .text.I2C_ConfigInterrupt_CMD:

000054ac <I2C_ConfigInterrupt_CMD>:
//				 I2C_RESTART_DET,I2C_MST_ON_HOLD,I2C_SCL_SLOW   
//NewState:ENABLE/DISABLE
//ReturnValue:NONE
/*************************************************************/
void I2C_ConfigInterrupt_CMD(FunctionalStatus NewState,U32_T INT_TYPE)
{
    54ac:	1066      	lrw      	r3, 0x20000034	// 54c4 <I2C_ConfigInterrupt_CMD+0x18>
	if(NewState != DISABLE)
    54ae:	3840      	cmpnei      	r0, 0
	{
		I2C0->IMSCR |= INT_TYPE;
    54b0:	9340      	ld.w      	r2, (r3, 0x0)
    54b2:	9277      	ld.w      	r3, (r2, 0x5c)
	if(NewState != DISABLE)
    54b4:	0c04      	bf      	0x54bc	// 54bc <I2C_ConfigInterrupt_CMD+0x10>
		I2C0->IMSCR |= INT_TYPE;
    54b6:	6c4c      	or      	r1, r3
    54b8:	b237      	st.w      	r1, (r2, 0x5c)
	}
	else
	{
		I2C0->IMSCR &= (~INT_TYPE);
	}
}
    54ba:	783c      	jmp      	r15
		I2C0->IMSCR &= (~INT_TYPE);
    54bc:	68c5      	andn      	r3, r1
    54be:	b277      	st.w      	r3, (r2, 0x5c)
}
    54c0:	07fd      	br      	0x54ba	// 54ba <I2C_ConfigInterrupt_CMD+0xe>
    54c2:	0000      	bkpt
    54c4:	20000034 	.long	0x20000034

Disassembly of section .text.I2C_FIFO_TriggerData:

000054c8 <I2C_FIFO_TriggerData>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_FIFO_TriggerData(U16_T RX_FLSEL,U16_T TX_FLSEL)
{
	I2C0->RX_FLSEL = RX_FLSEL;  							
    54c8:	1063      	lrw      	r3, 0x20000034	// 54d4 <I2C_FIFO_TriggerData+0xc>
    54ca:	9360      	ld.w      	r3, (r3, 0x0)
    54cc:	b30b      	st.w      	r0, (r3, 0x2c)
	I2C0->TX_FLSEL = TX_FLSEL;  							
    54ce:	b32c      	st.w      	r1, (r3, 0x30)
}
    54d0:	783c      	jmp      	r15
    54d2:	0000      	bkpt
    54d4:	20000034 	.long	0x20000034

Disassembly of section .text.I2C_Enable:

000054d8 <I2C_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_Enable(void)
{
	I2C0->ENABLE = (I2C0->ENABLE&0XFFFFFFFE)|I2C_ENABLE;                         //Enable I2C
    54d8:	1066      	lrw      	r3, 0x20000034	// 54f0 <I2C_Enable+0x18>
	while((I2C0->STATUS&0x1000)!=0x1000);
    54da:	3280      	movi      	r2, 128
	I2C0->ENABLE = (I2C0->ENABLE&0XFFFFFFFE)|I2C_ENABLE;                         //Enable I2C
    54dc:	9320      	ld.w      	r1, (r3, 0x0)
    54de:	916f      	ld.w      	r3, (r1, 0x3c)
    54e0:	3ba0      	bseti      	r3, 0
    54e2:	b16f      	st.w      	r3, (r1, 0x3c)
	while((I2C0->STATUS&0x1000)!=0x1000);
    54e4:	4245      	lsli      	r2, r2, 5
    54e6:	9170      	ld.w      	r3, (r1, 0x40)
    54e8:	68c8      	and      	r3, r2
    54ea:	3b40      	cmpnei      	r3, 0
    54ec:	0ffd      	bf      	0x54e6	// 54e6 <I2C_Enable+0xe>
}
    54ee:	783c      	jmp      	r15
    54f0:	20000034 	.long	0x20000034

Disassembly of section .text.I2C_Disable:

000054f4 <I2C_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_Disable(void)
{
	I2C0->ENABLE =(I2C0->ENABLE&0XFFFFFFFE)|I2C_DISABLE;                         //Disable I2C
    54f4:	1066      	lrw      	r3, 0x20000034	// 550c <I2C_Disable+0x18>
	while((I2C0->STATUS&0x1000)==0x1000);
    54f6:	3280      	movi      	r2, 128
	I2C0->ENABLE =(I2C0->ENABLE&0XFFFFFFFE)|I2C_DISABLE;                         //Disable I2C
    54f8:	9320      	ld.w      	r1, (r3, 0x0)
    54fa:	916f      	ld.w      	r3, (r1, 0x3c)
    54fc:	3b80      	bclri      	r3, 0
    54fe:	b16f      	st.w      	r3, (r1, 0x3c)
	while((I2C0->STATUS&0x1000)==0x1000);
    5500:	4245      	lsli      	r2, r2, 5
    5502:	9170      	ld.w      	r3, (r1, 0x40)
    5504:	68c8      	and      	r3, r2
    5506:	3b40      	cmpnei      	r3, 0
    5508:	0bfd      	bt      	0x5502	// 5502 <I2C_Disable+0xe>
}
    550a:	783c      	jmp      	r15
    550c:	20000034 	.long	0x20000034

Disassembly of section .text.I2C_Int_Enable:

00005510 <I2C_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_Int_Enable(void)
{
	INTC_ISER_WRITE(I2C_INT);                             //Enable I2C interrupt
    5510:	3380      	movi      	r3, 128
    5512:	436a      	lsli      	r3, r3, 10
    5514:	1042      	lrw      	r2, 0xe000e100	// 551c <I2C_Int_Enable+0xc>
    5516:	b260      	st.w      	r3, (r2, 0x0)
}
    5518:	783c      	jmp      	r15
    551a:	0000      	bkpt
    551c:	e000e100 	.long	0xe000e100

Disassembly of section .text.I2C_Slave_Receive:

00005520 <I2C_Slave_Receive>:
//I2C slave Receive
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_Slave_Receive(void)
{
    5520:	14d2      	push      	r4-r5, r15
	U16_T R_READ_BUF=0;
if(!(((I2C0->MISR&I2C_SCL_SLOW)==I2C_SCL_SLOW)
    5522:	1295      	lrw      	r4, 0x20000034	// 5674 <I2C_Slave_Receive+0x154>
    5524:	3180      	movi      	r1, 128
    5526:	9460      	ld.w      	r3, (r4, 0x0)
    5528:	9356      	ld.w      	r2, (r3, 0x58)
    552a:	4127      	lsli      	r1, r1, 7
    552c:	6884      	and      	r2, r1
    552e:	3a40      	cmpnei      	r2, 0
    5530:	0892      	bt      	0x5654	// 5654 <I2C_Slave_Receive+0x134>
			||((I2C0->MISR&I2C_TX_ABRT)==I2C_TX_ABRT)))				 //SCLK锁死,IIC发送中止))
    5532:	9356      	ld.w      	r2, (r3, 0x58)
    5534:	3140      	movi      	r1, 64
    5536:	6884      	and      	r2, r1
if(!(((I2C0->MISR&I2C_SCL_SLOW)==I2C_SCL_SLOW)
    5538:	3a40      	cmpnei      	r2, 0
    553a:	088d      	bt      	0x5654	// 5654 <I2C_Slave_Receive+0x134>
{
	if((I2C0->MISR&I2C_RX_FULL)==I2C_RX_FULL)        //有接收到数据
    553c:	9356      	ld.w      	r2, (r3, 0x58)
    553e:	3104      	movi      	r1, 4
    5540:	6884      	and      	r2, r1
    5542:	3a40      	cmpnei      	r2, 0
    5544:	0c14      	bf      	0x556c	// 556c <I2C_Slave_Receive+0x4c>
	{
		if(RdIndex==0)
    5546:	122d      	lrw      	r1, 0x2000021a	// 5678 <I2C_Slave_Receive+0x158>
    5548:	8141      	ld.b      	r2, (r1, 0x1)
    554a:	3a40      	cmpnei      	r2, 0
    554c:	124c      	lrw      	r2, 0x200002b1	// 567c <I2C_Slave_Receive+0x15c>
    554e:	084f      	bt      	0x55ec	// 55ec <I2C_Slave_Receive+0xcc>
		{
			RdIndex=1;
    5550:	3001      	movi      	r0, 1
    5552:	a101      	st.b      	r0, (r1, 0x1)
			I2C_Data_Adress=I2C0->DATA_CMD&0XFF;
    5554:	9324      	ld.w      	r1, (r3, 0x10)
    5556:	7444      	zextb      	r1, r1
    5558:	a220      	st.b      	r1, (r2, 0x0)
			I2C_St_Adress=I2C_Data_Adress;
    555a:	8240      	ld.b      	r2, (r2, 0x0)
    555c:	7488      	zextb      	r2, r2
    555e:	1229      	lrw      	r1, 0x20000290	// 5680 <I2C_Slave_Receive+0x160>
    5560:	a140      	st.b      	r2, (r1, 0x0)
			{
				I2CRdBuffer[I2C_Data_Adress]= I2C0->DATA_CMD&0XFF;
			}
			I2C_Data_Adress++;
		}
		I2C0->ICR = I2C_RX_FULL;
    5562:	3204      	movi      	r2, 4
    5564:	b359      	st.w      	r2, (r3, 0x64)
		R_IIC_ERROR_CONT=0;
    5566:	3200      	movi      	r2, 0
    5568:	1267      	lrw      	r3, 0x2000028c	// 5684 <I2C_Slave_Receive+0x164>
    556a:	b340      	st.w      	r2, (r3, 0x0)
	}
		
	if((I2C0->MISR&I2C_RD_REQ)==I2C_RD_REQ)			//读请求产生
    556c:	9460      	ld.w      	r3, (r4, 0x0)
    556e:	9356      	ld.w      	r2, (r3, 0x58)
    5570:	3120      	movi      	r1, 32
    5572:	6884      	and      	r2, r1
    5574:	3a40      	cmpnei      	r2, 0
    5576:	0c1d      	bf      	0x55b0	// 55b0 <I2C_Slave_Receive+0x90>
	{
		if(RdIndex==1)
    5578:	1220      	lrw      	r1, 0x2000021a	// 5678 <I2C_Slave_Receive+0x158>
    557a:	8141      	ld.b      	r2, (r1, 0x1)
    557c:	3a41      	cmpnei      	r2, 1
    557e:	0814      	bt      	0x55a6	// 55a6 <I2C_Slave_Receive+0x86>
		{
			RdIndex=2;
    5580:	3202      	movi      	r2, 2
    5582:	a141      	st.b      	r2, (r1, 0x1)
			WrIndex = I2C_St_Adress;
    5584:	115f      	lrw      	r2, 0x20000290	// 5680 <I2C_Slave_Receive+0x160>
    5586:	8240      	ld.b      	r2, (r2, 0x0)
    5588:	7488      	zextb      	r2, r2
    558a:	a142      	st.b      	r2, (r1, 0x2)
			//I2C_ConfigInterrupt_CMD(ENABLE,I2C_TX_EMPTY);
			if(WrIndex<BUFSIZE)
    558c:	8142      	ld.b      	r2, (r1, 0x2)
    558e:	7488      	zextb      	r2, r2
    5590:	3a1f      	cmphsi      	r2, 32
    5592:	080a      	bt      	0x55a6	// 55a6 <I2C_Slave_Receive+0x86>
			{
				I2C0->DATA_CMD= (I2C0->DATA_CMD&0XFFFFFF00) |I2CWrBuffer[WrIndex];
    5594:	9344      	ld.w      	r2, (r3, 0x10)
    5596:	8122      	ld.b      	r1, (r1, 0x2)
    5598:	111c      	lrw      	r0, 0x20000291	// 5688 <I2C_Slave_Receive+0x168>
    559a:	6040      	addu      	r1, r0
    559c:	30ff      	movi      	r0, 255
    559e:	8120      	ld.b      	r1, (r1, 0x0)
    55a0:	6881      	andn      	r2, r0
    55a2:	6c84      	or      	r2, r1
    55a4:	b344      	st.w      	r2, (r3, 0x10)
			}	
		}	
		I2C0->ICR = I2C_RD_REQ;
    55a6:	3220      	movi      	r2, 32
    55a8:	b359      	st.w      	r2, (r3, 0x64)
		R_IIC_ERROR_CONT=0;
    55aa:	3100      	movi      	r1, 0
    55ac:	1156      	lrw      	r2, 0x2000028c	// 5684 <I2C_Slave_Receive+0x164>
    55ae:	b220      	st.w      	r1, (r2, 0x0)
	} 
                         
	if((I2C0->MISR&I2C_TX_EMPTY)==I2C_TX_EMPTY)				//IIC发送为空
    55b0:	9356      	ld.w      	r2, (r3, 0x58)
    55b2:	3110      	movi      	r1, 16
    55b4:	6884      	and      	r2, r1
    55b6:	3a40      	cmpnei      	r2, 0
    55b8:	0c3d      	bf      	0x5632	// 5632 <I2C_Slave_Receive+0x112>
	{
		if(RdIndex==2)
    55ba:	1150      	lrw      	r2, 0x2000021a	// 5678 <I2C_Slave_Receive+0x158>
    55bc:	8221      	ld.b      	r1, (r2, 0x1)
    55be:	3942      	cmpnei      	r1, 2
    55c0:	0825      	bt      	0x560a	// 560a <I2C_Slave_Receive+0xea>
		{
			if(WrIndex+1<BUFSIZE)
    55c2:	8222      	ld.b      	r1, (r2, 0x2)
    55c4:	7444      	zextb      	r1, r1
    55c6:	393e      	cmplti      	r1, 31
    55c8:	0c0a      	bf      	0x55dc	// 55dc <I2C_Slave_Receive+0xbc>
			{
				I2C0->DATA_CMD= (I2C0->DATA_CMD&0XFFFFFF00) |I2CWrBuffer[WrIndex+1];
    55ca:	9324      	ld.w      	r1, (r3, 0x10)
    55cc:	11b0      	lrw      	r5, 0x20000292	// 568c <I2C_Slave_Receive+0x16c>
    55ce:	8202      	ld.b      	r0, (r2, 0x2)
    55d0:	6014      	addu      	r0, r5
    55d2:	35ff      	movi      	r5, 255
    55d4:	8000      	ld.b      	r0, (r0, 0x0)
    55d6:	6855      	andn      	r1, r5
    55d8:	6c40      	or      	r1, r0
    55da:	b324      	st.w      	r1, (r3, 0x10)
			}
			WrIndex++;
    55dc:	8262      	ld.b      	r3, (r2, 0x2)
    55de:	2300      	addi      	r3, 1
    55e0:	74cc      	zextb      	r3, r3
    55e2:	a262      	st.b      	r3, (r2, 0x2)
			else
			{
				R_IIC_ERROR_CONT++;
			}
		}
		I2C0->CR = I2C_TX_EMPTY;
    55e4:	9460      	ld.w      	r3, (r4, 0x0)
    55e6:	3210      	movi      	r2, 16
		I2C0->DATA_CMD= (I2C0->DATA_CMD&0XFFFFFF00);
		I2C_SLAVE_CONFIG(); 
		RdIndex=0;	
		//I2C_ConfigInterrupt_CMD(ENABLE,I2C_TX_EMPTY);				
		I2C0->ICR = I2C_SCL_SLOW|I2C_TX_ABRT;
		R_IIC_ERROR_CONT=0;
    55e8:	b340      	st.w      	r2, (r3, 0x0)
	
}
}
    55ea:	1492      	pop      	r4-r5, r15
			if(I2C_Data_Adress<BUFSIZE)
    55ec:	8220      	ld.b      	r1, (r2, 0x0)
    55ee:	7444      	zextb      	r1, r1
    55f0:	391f      	cmphsi      	r1, 32
    55f2:	0807      	bt      	0x5600	// 5600 <I2C_Slave_Receive+0xe0>
				I2CRdBuffer[I2C_Data_Adress]= I2C0->DATA_CMD&0XFF;
    55f4:	8220      	ld.b      	r1, (r2, 0x0)
    55f6:	11a7      	lrw      	r5, 0x200002b2	// 5690 <I2C_Slave_Receive+0x170>
    55f8:	6054      	addu      	r1, r5
    55fa:	9304      	ld.w      	r0, (r3, 0x10)
    55fc:	7400      	zextb      	r0, r0
    55fe:	a100      	st.b      	r0, (r1, 0x0)
			I2C_Data_Adress++;
    5600:	8220      	ld.b      	r1, (r2, 0x0)
    5602:	2100      	addi      	r1, 1
    5604:	7444      	zextb      	r1, r1
    5606:	a220      	st.b      	r1, (r2, 0x0)
    5608:	07ad      	br      	0x5562	// 5562 <I2C_Slave_Receive+0x42>
			if(R_IIC_ERROR_CONT>10000)
    560a:	10bf      	lrw      	r5, 0x2000028c	// 5684 <I2C_Slave_Receive+0x164>
    560c:	1162      	lrw      	r3, 0x2710	// 5694 <I2C_Slave_Receive+0x174>
    560e:	9540      	ld.w      	r2, (r5, 0x0)
    5610:	648c      	cmphs      	r3, r2
    5612:	080d      	bt      	0x562c	// 562c <I2C_Slave_Receive+0x10c>
				I2C_Disable();
    5614:	e3ffff70 	bsr      	0x54f4	// 54f4 <I2C_Disable>
				I2C0->DATA_CMD= (I2C0->DATA_CMD&0XFFFFFF00);
    5618:	9440      	ld.w      	r2, (r4, 0x0)
    561a:	9264      	ld.w      	r3, (r2, 0x10)
    561c:	31ff      	movi      	r1, 255
    561e:	68c5      	andn      	r3, r1
    5620:	b264      	st.w      	r3, (r2, 0x10)
				I2C_SLAVE_CONFIG();
    5622:	e0000471 	bsr      	0x5f04	// 5f04 <I2C_SLAVE_CONFIG>
				R_IIC_ERROR_CONT=0;
    5626:	3300      	movi      	r3, 0
				R_IIC_ERROR_CONT++;
    5628:	b560      	st.w      	r3, (r5, 0x0)
    562a:	07dd      	br      	0x55e4	// 55e4 <I2C_Slave_Receive+0xc4>
    562c:	9560      	ld.w      	r3, (r5, 0x0)
    562e:	2300      	addi      	r3, 1
    5630:	07fc      	br      	0x5628	// 5628 <I2C_Slave_Receive+0x108>
	else if((I2C0->MISR&I2C_STOP_DET)==I2C_STOP_DET)
    5632:	3280      	movi      	r2, 128
    5634:	9336      	ld.w      	r1, (r3, 0x58)
    5636:	4242      	lsli      	r2, r2, 2
    5638:	6848      	and      	r1, r2
    563a:	3940      	cmpnei      	r1, 0
    563c:	0fd7      	bf      	0x55ea	// 55ea <I2C_Slave_Receive+0xca>
		I2C0->ICR =I2C_STOP_DET;
    563e:	b359      	st.w      	r2, (r3, 0x64)
		if(RdIndex!=0)
    5640:	104e      	lrw      	r2, 0x2000021a	// 5678 <I2C_Slave_Receive+0x158>
    5642:	8221      	ld.b      	r1, (r2, 0x1)
    5644:	3940      	cmpnei      	r1, 0
    5646:	0c03      	bf      	0x564c	// 564c <I2C_Slave_Receive+0x12c>
			RdIndex=0;
    5648:	3100      	movi      	r1, 0
    564a:	a221      	st.b      	r1, (r2, 0x1)
		R_READ_BUF=I2C0->DATA_CMD&0XFF;
    564c:	9364      	ld.w      	r3, (r3, 0x10)
		R_IIC_ERROR_CONT=0;
    564e:	3200      	movi      	r2, 0
    5650:	106d      	lrw      	r3, 0x2000028c	// 5684 <I2C_Slave_Receive+0x164>
    5652:	07cb      	br      	0x55e8	// 55e8 <I2C_Slave_Receive+0xc8>
		I2C_Disable();
    5654:	e3ffff50 	bsr      	0x54f4	// 54f4 <I2C_Disable>
		I2C0->DATA_CMD= (I2C0->DATA_CMD&0XFFFFFF00);
    5658:	9440      	ld.w      	r2, (r4, 0x0)
    565a:	9264      	ld.w      	r3, (r2, 0x10)
    565c:	31ff      	movi      	r1, 255
    565e:	68c5      	andn      	r3, r1
    5660:	b264      	st.w      	r3, (r2, 0x10)
		I2C_SLAVE_CONFIG(); 
    5662:	e0000451 	bsr      	0x5f04	// 5f04 <I2C_SLAVE_CONFIG>
		RdIndex=0;	
    5666:	1065      	lrw      	r3, 0x2000021a	// 5678 <I2C_Slave_Receive+0x158>
    5668:	3200      	movi      	r2, 0
    566a:	a341      	st.b      	r2, (r3, 0x1)
		I2C0->ICR = I2C_SCL_SLOW|I2C_TX_ABRT;
    566c:	9460      	ld.w      	r3, (r4, 0x0)
    566e:	104b      	lrw      	r2, 0x4040	// 5698 <I2C_Slave_Receive+0x178>
    5670:	b359      	st.w      	r2, (r3, 0x64)
    5672:	07ee      	br      	0x564e	// 564e <I2C_Slave_Receive+0x12e>
    5674:	20000034 	.long	0x20000034
    5678:	2000021a 	.long	0x2000021a
    567c:	200002b1 	.long	0x200002b1
    5680:	20000290 	.long	0x20000290
    5684:	2000028c 	.long	0x2000028c
    5688:	20000291 	.long	0x20000291
    568c:	20000292 	.long	0x20000292
    5690:	200002b2 	.long	0x200002b2
    5694:	00002710 	.long	0x00002710
    5698:	00004040 	.long	0x00004040

Disassembly of section .text.EPT_Software_Prg:

0000569c <EPT_Software_Prg>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/    
void EPT_Software_Prg(void)
{
	EPT0->CEDR|=0X01;
    569c:	1067      	lrw      	r3, 0x20000024	// 56b8 <EPT_Software_Prg+0x1c>
	EPT0->RSSR=(EPT0->RSSR&0XFFFF0FFF)|(0X05<<12);
    569e:	31f0      	movi      	r1, 240
	EPT0->CEDR|=0X01;
    56a0:	9340      	ld.w      	r2, (r3, 0x0)
    56a2:	9260      	ld.w      	r3, (r2, 0x0)
    56a4:	3ba0      	bseti      	r3, 0
    56a6:	b260      	st.w      	r3, (r2, 0x0)
	EPT0->RSSR=(EPT0->RSSR&0XFFFF0FFF)|(0X05<<12);
    56a8:	9261      	ld.w      	r3, (r2, 0x4)
    56aa:	4128      	lsli      	r1, r1, 8
    56ac:	68c5      	andn      	r3, r1
    56ae:	3bac      	bseti      	r3, 12
    56b0:	3bae      	bseti      	r3, 14
    56b2:	b261      	st.w      	r3, (r2, 0x4)
}
    56b4:	783c      	jmp      	r15
    56b6:	0000      	bkpt
    56b8:	20000024 	.long	0x20000024

Disassembly of section .text.EPT_Start:

000056bc <EPT_Start>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/   
void EPT_Start(void)
{
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
    56bc:	1068      	lrw      	r3, 0x20000024	// 56dc <EPT_Start+0x20>
    56be:	3280      	movi      	r2, 128
    56c0:	9360      	ld.w      	r3, (r3, 0x0)
    56c2:	608c      	addu      	r2, r3
    56c4:	1027      	lrw      	r1, 0xa55ac73a	// 56e0 <EPT_Start+0x24>
    56c6:	b23a      	st.w      	r1, (r2, 0x68)
	EPT0->RSSR|=0X01;
    56c8:	9341      	ld.w      	r2, (r3, 0x4)
    56ca:	3aa0      	bseti      	r2, 0
    56cc:	b341      	st.w      	r2, (r3, 0x4)
	while(!(EPT0->RSSR&0x01));
    56ce:	3101      	movi      	r1, 1
    56d0:	9341      	ld.w      	r2, (r3, 0x4)
    56d2:	6884      	and      	r2, r1
    56d4:	3a40      	cmpnei      	r2, 0
    56d6:	0ffd      	bf      	0x56d0	// 56d0 <EPT_Start+0x14>
} 
    56d8:	783c      	jmp      	r15
    56da:	0000      	bkpt
    56dc:	20000024 	.long	0x20000024
    56e0:	a55ac73a 	.long	0xa55ac73a

Disassembly of section .text.EPT_Stop:

000056e4 <EPT_Stop>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/   
void EPT_Stop(void)
{
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
    56e4:	1068      	lrw      	r3, 0x20000024	// 5704 <EPT_Stop+0x20>
    56e6:	3280      	movi      	r2, 128
    56e8:	9360      	ld.w      	r3, (r3, 0x0)
    56ea:	608c      	addu      	r2, r3
    56ec:	1027      	lrw      	r1, 0xa55ac73a	// 5708 <EPT_Stop+0x24>
    56ee:	b23a      	st.w      	r1, (r2, 0x68)
	EPT0->RSSR&=0Xfe;
    56f0:	9341      	ld.w      	r2, (r3, 0x4)
    56f2:	31fe      	movi      	r1, 254
    56f4:	6884      	and      	r2, r1
    56f6:	b341      	st.w      	r2, (r3, 0x4)
	while(EPT0->RSSR&0x01);
    56f8:	3101      	movi      	r1, 1
    56fa:	9341      	ld.w      	r2, (r3, 0x4)
    56fc:	6884      	and      	r2, r1
    56fe:	3a40      	cmpnei      	r2, 0
    5700:	0bfd      	bt      	0x56fa	// 56fa <EPT_Stop+0x16>
}
    5702:	783c      	jmp      	r15
    5704:	20000024 	.long	0x20000024
    5708:	a55ac73a 	.long	0xa55ac73a

Disassembly of section .text.EPT_IO_SET:

0000570c <EPT_IO_SET>:
//EPT_IO_X:EPT_IO_CHAX,EPT_IO_CHAY,EPT_IO_CHBX,EPT_IO_CHBY,EPT_IO_CHCX,EPT_IO_CHCX,EPT_IO_CHD,EPT_IO_EPI
//ReturnValue:NONE
/*************************************************************/    
void EPT_IO_SET(EPT_IO_Mode_Type EPT_IO_X , EPT_IO_NUM_Type IO_Num_X)
{
	if(EPT_IO_X==EPT_IO_CHAX)
    570c:	3840      	cmpnei      	r0, 0
    570e:	0822      	bt      	0x5752	// 5752 <EPT_IO_SET+0x46>
	{
		if(IO_Num_X==IO_NUM_PA07)
    5710:	3950      	cmpnei      	r1, 16
    5712:	080a      	bt      	0x5726	// 5726 <EPT_IO_SET+0x1a>
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)|0X60000000;				//PA0.7
    5714:	0379      	lrw      	r3, 0x20000050	// 592c <EPT_IO_SET+0x220>
    5716:	9340      	ld.w      	r2, (r3, 0x0)
    5718:	9260      	ld.w      	r3, (r2, 0x0)
    571a:	4364      	lsli      	r3, r3, 4
    571c:	4b64      	lsri      	r3, r3, 4
    571e:	3bbd      	bseti      	r3, 29
    5720:	3bbe      	bseti      	r3, 30
		{
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF)|0X00004000;				//PB0.3
		}
		else if(IO_Num_X==IO_NUM_PB00)
		{
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)|0X00000005;				//PB0.0
    5722:	b260      	st.w      	r3, (r2, 0x0)
		else if(IO_Num_X==IO_NUM_PB02)
		{
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)|0X00000700;				//PB0.2 EPI3
		}
	}
}
    5724:	783c      	jmp      	r15
		else if(IO_Num_X==IO_NUM_PA10)
    5726:	3951      	cmpnei      	r1, 17
    5728:	080b      	bt      	0x573e	// 573e <EPT_IO_SET+0x32>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF)|0X00000500;				//PA0.10
    572a:	037e      	lrw      	r3, 0x20000050	// 592c <EPT_IO_SET+0x220>
    572c:	32f0      	movi      	r2, 240
    572e:	9320      	ld.w      	r1, (r3, 0x0)
    5730:	9161      	ld.w      	r3, (r1, 0x4)
    5732:	4244      	lsli      	r2, r2, 4
    5734:	68c9      	andn      	r3, r2
    5736:	3ba8      	bseti      	r3, 8
    5738:	3baa      	bseti      	r3, 10
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)|0X00400000;				//PA0.13 EPI1
    573a:	b161      	st.w      	r3, (r1, 0x4)
    573c:	07f4      	br      	0x5724	// 5724 <EPT_IO_SET+0x18>
		else if(IO_Num_X==IO_NUM_PA15)
    573e:	3952      	cmpnei      	r1, 18
    5740:	0bf2      	bt      	0x5724	// 5724 <EPT_IO_SET+0x18>
			GPIOA0->CONHR = (GPIOA0->CONHR&0X0FFFFFFF)|0X40000000;				//PA0.15
    5742:	137b      	lrw      	r3, 0x20000050	// 592c <EPT_IO_SET+0x220>
    5744:	9340      	ld.w      	r2, (r3, 0x0)
    5746:	9261      	ld.w      	r3, (r2, 0x4)
    5748:	4364      	lsli      	r3, r3, 4
    574a:	4b64      	lsri      	r3, r3, 4
    574c:	3bbe      	bseti      	r3, 30
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0)|0X00000004;				//PA0.8
    574e:	b261      	st.w      	r3, (r2, 0x4)
    5750:	07ea      	br      	0x5724	// 5724 <EPT_IO_SET+0x18>
	else if(EPT_IO_X==EPT_IO_CHAY)
    5752:	3841      	cmpnei      	r0, 1
    5754:	0821      	bt      	0x5796	// 5796 <EPT_IO_SET+0x8a>
		if(IO_Num_X==IO_NUM_PB03)
    5756:	3953      	cmpnei      	r1, 19
    5758:	080a      	bt      	0x576c	// 576c <EPT_IO_SET+0x60>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF)|0X00005000;				//PB0.3
    575a:	1376      	lrw      	r3, 0x2000004c	// 5930 <EPT_IO_SET+0x224>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)|0X00005000;				//PA0.3
    575c:	9320      	ld.w      	r1, (r3, 0x0)
    575e:	32f0      	movi      	r2, 240
    5760:	9160      	ld.w      	r3, (r1, 0x0)
    5762:	4248      	lsli      	r2, r2, 8
    5764:	68c9      	andn      	r3, r2
    5766:	3bac      	bseti      	r3, 12
    5768:	3bae      	bseti      	r3, 14
    576a:	0422      	br      	0x57ae	// 57ae <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PB05)
    576c:	3954      	cmpnei      	r1, 20
    576e:	0809      	bt      	0x5780	// 5780 <EPT_IO_SET+0x74>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF0FFFFF)|0X00400000;				//PB0.5
    5770:	1370      	lrw      	r3, 0x2000004c	// 5930 <EPT_IO_SET+0x224>
    5772:	32f0      	movi      	r2, 240
    5774:	9320      	ld.w      	r1, (r3, 0x0)
    5776:	9160      	ld.w      	r3, (r1, 0x0)
    5778:	4250      	lsli      	r2, r2, 16
    577a:	68c9      	andn      	r3, r2
    577c:	3bb6      	bseti      	r3, 22
    577e:	0418      	br      	0x57ae	// 57ae <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PA12)
    5780:	3955      	cmpnei      	r1, 21
    5782:	0bd1      	bt      	0x5724	// 5724 <EPT_IO_SET+0x18>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFF0FFFF)|0X00050000;				//PA0.12
    5784:	136a      	lrw      	r3, 0x20000050	// 592c <EPT_IO_SET+0x220>
    5786:	32f0      	movi      	r2, 240
    5788:	9320      	ld.w      	r1, (r3, 0x0)
    578a:	9161      	ld.w      	r3, (r1, 0x4)
    578c:	424c      	lsli      	r2, r2, 12
    578e:	68c9      	andn      	r3, r2
    5790:	3bb0      	bseti      	r3, 16
    5792:	3bb2      	bseti      	r3, 18
    5794:	07d3      	br      	0x573a	// 573a <EPT_IO_SET+0x2e>
	else if(EPT_IO_X==EPT_IO_CHBX)
    5796:	3842      	cmpnei      	r0, 2
    5798:	0822      	bt      	0x57dc	// 57dc <EPT_IO_SET+0xd0>
		if(IO_Num_X==IO_NUM_PB02)
    579a:	3956      	cmpnei      	r1, 22
    579c:	080b      	bt      	0x57b2	// 57b2 <EPT_IO_SET+0xa6>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)|0X00000600;				//PB0.2
    579e:	1365      	lrw      	r3, 0x2000004c	// 5930 <EPT_IO_SET+0x224>
    57a0:	32f0      	movi      	r2, 240
    57a2:	9320      	ld.w      	r1, (r3, 0x0)
    57a4:	9160      	ld.w      	r3, (r1, 0x0)
    57a6:	4244      	lsli      	r2, r2, 4
    57a8:	68c9      	andn      	r3, r2
    57aa:	3ba9      	bseti      	r3, 9
    57ac:	3baa      	bseti      	r3, 10
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)|0X00000700;				//PB0.2 EPI3
    57ae:	b160      	st.w      	r3, (r1, 0x0)
}
    57b0:	07ba      	br      	0x5724	// 5724 <EPT_IO_SET+0x18>
		else if(IO_Num_X==IO_NUM_PA11)
    57b2:	3957      	cmpnei      	r1, 23
    57b4:	080a      	bt      	0x57c8	// 57c8 <EPT_IO_SET+0xbc>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF)|0X00005000;				//PA0.11
    57b6:	127e      	lrw      	r3, 0x20000050	// 592c <EPT_IO_SET+0x220>
    57b8:	32f0      	movi      	r2, 240
    57ba:	9320      	ld.w      	r1, (r3, 0x0)
    57bc:	9161      	ld.w      	r3, (r1, 0x4)
    57be:	4248      	lsli      	r2, r2, 8
    57c0:	68c9      	andn      	r3, r2
    57c2:	3bac      	bseti      	r3, 12
    57c4:	3bae      	bseti      	r3, 14
    57c6:	07ba      	br      	0x573a	// 573a <EPT_IO_SET+0x2e>
		else if(IO_Num_X==IO_NUM_PA14)
    57c8:	3958      	cmpnei      	r1, 24
    57ca:	0bad      	bt      	0x5724	// 5724 <EPT_IO_SET+0x18>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XF0FFFFFF)|0X04000000;				//PA0.14
    57cc:	1278      	lrw      	r3, 0x20000050	// 592c <EPT_IO_SET+0x220>
    57ce:	32f0      	movi      	r2, 240
    57d0:	9320      	ld.w      	r1, (r3, 0x0)
    57d2:	9161      	ld.w      	r3, (r1, 0x4)
    57d4:	4254      	lsli      	r2, r2, 20
    57d6:	68c9      	andn      	r3, r2
    57d8:	3bba      	bseti      	r3, 26
    57da:	07b0      	br      	0x573a	// 573a <EPT_IO_SET+0x2e>
	else if(EPT_IO_X==EPT_IO_CHBY)
    57dc:	3843      	cmpnei      	r0, 3
    57de:	0820      	bt      	0x581e	// 581e <EPT_IO_SET+0x112>
		if(IO_Num_X==IO_NUM_PB04)
    57e0:	3959      	cmpnei      	r1, 25
    57e2:	080a      	bt      	0x57f6	// 57f6 <EPT_IO_SET+0xea>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFF0FFFF)|0X00050000;				//PB0.4
    57e4:	1273      	lrw      	r3, 0x2000004c	// 5930 <EPT_IO_SET+0x224>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF0FFFF)|0X00050000;				//PA0.4
    57e6:	9320      	ld.w      	r1, (r3, 0x0)
    57e8:	32f0      	movi      	r2, 240
    57ea:	9160      	ld.w      	r3, (r1, 0x0)
    57ec:	424c      	lsli      	r2, r2, 12
    57ee:	68c9      	andn      	r3, r2
    57f0:	3bb0      	bseti      	r3, 16
    57f2:	3bb2      	bseti      	r3, 18
    57f4:	07dd      	br      	0x57ae	// 57ae <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PA05)
    57f6:	395a      	cmpnei      	r1, 26
    57f8:	0809      	bt      	0x580a	// 580a <EPT_IO_SET+0xfe>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF)|0X00800000;				//PA0.5
    57fa:	126d      	lrw      	r3, 0x20000050	// 592c <EPT_IO_SET+0x220>
    57fc:	32f0      	movi      	r2, 240
    57fe:	9320      	ld.w      	r1, (r3, 0x0)
    5800:	9160      	ld.w      	r3, (r1, 0x0)
    5802:	4250      	lsli      	r2, r2, 16
    5804:	68c9      	andn      	r3, r2
    5806:	3bb7      	bseti      	r3, 23
    5808:	07d3      	br      	0x57ae	// 57ae <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PA08)
    580a:	395b      	cmpnei      	r1, 27
    580c:	0b8c      	bt      	0x5724	// 5724 <EPT_IO_SET+0x18>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0)|0X00000005;				//PA0.8
    580e:	1268      	lrw      	r3, 0x20000050	// 592c <EPT_IO_SET+0x220>
    5810:	310f      	movi      	r1, 15
    5812:	9340      	ld.w      	r2, (r3, 0x0)
    5814:	9261      	ld.w      	r3, (r2, 0x4)
    5816:	68c5      	andn      	r3, r1
    5818:	3ba0      	bseti      	r3, 0
    581a:	3ba2      	bseti      	r3, 2
    581c:	0799      	br      	0x574e	// 574e <EPT_IO_SET+0x42>
	else if(EPT_IO_X==EPT_IO_CHCX)
    581e:	3844      	cmpnei      	r0, 4
    5820:	081b      	bt      	0x5856	// 5856 <EPT_IO_SET+0x14a>
		if(IO_Num_X==IO_NUM_PB05)
    5822:	3954      	cmpnei      	r1, 20
    5824:	0fa6      	bf      	0x5770	// 5770 <EPT_IO_SET+0x64>
		else if(IO_Num_X==IO_NUM_PA03)
    5826:	395c      	cmpnei      	r1, 28
    5828:	0803      	bt      	0x582e	// 582e <EPT_IO_SET+0x122>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)|0X00005000;				//PA0.3
    582a:	1261      	lrw      	r3, 0x20000050	// 592c <EPT_IO_SET+0x220>
    582c:	0798      	br      	0x575c	// 575c <EPT_IO_SET+0x50>
		else if(IO_Num_X==IO_NUM_PB03)
    582e:	3953      	cmpnei      	r1, 19
    5830:	0809      	bt      	0x5842	// 5842 <EPT_IO_SET+0x136>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF)|0X00004000;				//PB0.3
    5832:	1260      	lrw      	r3, 0x2000004c	// 5930 <EPT_IO_SET+0x224>
    5834:	32f0      	movi      	r2, 240
    5836:	9320      	ld.w      	r1, (r3, 0x0)
    5838:	9160      	ld.w      	r3, (r1, 0x0)
    583a:	4248      	lsli      	r2, r2, 8
    583c:	68c9      	andn      	r3, r2
    583e:	3bae      	bseti      	r3, 14
    5840:	07b7      	br      	0x57ae	// 57ae <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PB00)
    5842:	395d      	cmpnei      	r1, 29
    5844:	0b70      	bt      	0x5724	// 5724 <EPT_IO_SET+0x18>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)|0X00000005;				//PB0.0
    5846:	117b      	lrw      	r3, 0x2000004c	// 5930 <EPT_IO_SET+0x224>
    5848:	310f      	movi      	r1, 15
    584a:	9340      	ld.w      	r2, (r3, 0x0)
    584c:	9260      	ld.w      	r3, (r2, 0x0)
    584e:	68c5      	andn      	r3, r1
    5850:	3ba0      	bseti      	r3, 0
    5852:	3ba2      	bseti      	r3, 2
    5854:	0767      	br      	0x5722	// 5722 <EPT_IO_SET+0x16>
	else if(EPT_IO_X==EPT_IO_CHCY)
    5856:	3845      	cmpnei      	r0, 5
    5858:	0825      	bt      	0x58a2	// 58a2 <EPT_IO_SET+0x196>
		if(IO_Num_X==IO_NUM_PB04)
    585a:	3959      	cmpnei      	r1, 25
    585c:	0809      	bt      	0x586e	// 586e <EPT_IO_SET+0x162>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFF0FFFF)|0X00040000;				//PB0.4
    585e:	1175      	lrw      	r3, 0x2000004c	// 5930 <EPT_IO_SET+0x224>
    5860:	32f0      	movi      	r2, 240
    5862:	9320      	ld.w      	r1, (r3, 0x0)
    5864:	9160      	ld.w      	r3, (r1, 0x0)
    5866:	424c      	lsli      	r2, r2, 12
    5868:	68c9      	andn      	r3, r2
    586a:	3bb2      	bseti      	r3, 18
    586c:	07a1      	br      	0x57ae	// 57ae <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PA04)
    586e:	395e      	cmpnei      	r1, 30
    5870:	0803      	bt      	0x5876	// 5876 <EPT_IO_SET+0x16a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF0FFFF)|0X00050000;				//PA0.4
    5872:	116f      	lrw      	r3, 0x20000050	// 592c <EPT_IO_SET+0x220>
    5874:	07b9      	br      	0x57e6	// 57e6 <EPT_IO_SET+0xda>
		else if(IO_Num_X==IO_NUM_PA09)
    5876:	395f      	cmpnei      	r1, 31
    5878:	0809      	bt      	0x588a	// 588a <EPT_IO_SET+0x17e>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFF0F)|0X00000070;				//PA0.9
    587a:	116d      	lrw      	r3, 0x20000050	// 592c <EPT_IO_SET+0x220>
    587c:	31f0      	movi      	r1, 240
    587e:	9340      	ld.w      	r2, (r3, 0x0)
    5880:	9261      	ld.w      	r3, (r2, 0x4)
    5882:	68c5      	andn      	r3, r1
    5884:	3170      	movi      	r1, 112
    5886:	6cc4      	or      	r3, r1
    5888:	0763      	br      	0x574e	// 574e <EPT_IO_SET+0x42>
		else if(IO_Num_X==IO_NUM_PA013)
    588a:	3320      	movi      	r3, 32
    588c:	64c6      	cmpne      	r1, r3
    588e:	0b4b      	bt      	0x5724	// 5724 <EPT_IO_SET+0x18>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)|0X00500000;				//PA0.13
    5890:	1167      	lrw      	r3, 0x20000050	// 592c <EPT_IO_SET+0x220>
    5892:	32f0      	movi      	r2, 240
    5894:	9320      	ld.w      	r1, (r3, 0x0)
    5896:	9161      	ld.w      	r3, (r1, 0x4)
    5898:	4250      	lsli      	r2, r2, 16
    589a:	68c9      	andn      	r3, r2
    589c:	3bb4      	bseti      	r3, 20
    589e:	3bb6      	bseti      	r3, 22
    58a0:	074d      	br      	0x573a	// 573a <EPT_IO_SET+0x2e>
	else if(EPT_IO_X==EPT_IO_CHD)
    58a2:	3846      	cmpnei      	r0, 6
    58a4:	0815      	bt      	0x58ce	// 58ce <EPT_IO_SET+0x1c2>
		if(IO_Num_X==IO_NUM_PB03)
    58a6:	3953      	cmpnei      	r1, 19
    58a8:	080a      	bt      	0x58bc	// 58bc <EPT_IO_SET+0x1b0>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF)|0X00006000;				//PB0.3
    58aa:	1162      	lrw      	r3, 0x2000004c	// 5930 <EPT_IO_SET+0x224>
    58ac:	32f0      	movi      	r2, 240
    58ae:	9320      	ld.w      	r1, (r3, 0x0)
    58b0:	9160      	ld.w      	r3, (r1, 0x0)
    58b2:	4248      	lsli      	r2, r2, 8
    58b4:	68c9      	andn      	r3, r2
    58b6:	3bad      	bseti      	r3, 13
    58b8:	3bae      	bseti      	r3, 14
    58ba:	077a      	br      	0x57ae	// 57ae <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PA08)
    58bc:	395b      	cmpnei      	r1, 27
    58be:	0b33      	bt      	0x5724	// 5724 <EPT_IO_SET+0x18>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0)|0X00000004;				//PA0.8
    58c0:	107b      	lrw      	r3, 0x20000050	// 592c <EPT_IO_SET+0x220>
    58c2:	310f      	movi      	r1, 15
    58c4:	9340      	ld.w      	r2, (r3, 0x0)
    58c6:	9261      	ld.w      	r3, (r2, 0x4)
    58c8:	68c5      	andn      	r3, r1
    58ca:	3ba2      	bseti      	r3, 2
    58cc:	0741      	br      	0x574e	// 574e <EPT_IO_SET+0x42>
	else if(EPT_IO_X==EPT_IO_EPI)
    58ce:	3847      	cmpnei      	r0, 7
    58d0:	0b2a      	bt      	0x5724	// 5724 <EPT_IO_SET+0x18>
		if(IO_Num_X==IO_NUM_PA07)
    58d2:	3950      	cmpnei      	r1, 16
    58d4:	0809      	bt      	0x58e6	// 58e6 <EPT_IO_SET+0x1da>
			GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)|0X50000000;				//PA0.7 EPI0
    58d6:	1076      	lrw      	r3, 0x20000050	// 592c <EPT_IO_SET+0x220>
    58d8:	9340      	ld.w      	r2, (r3, 0x0)
    58da:	9260      	ld.w      	r3, (r2, 0x0)
    58dc:	4364      	lsli      	r3, r3, 4
    58de:	4b64      	lsri      	r3, r3, 4
    58e0:	3bbc      	bseti      	r3, 28
    58e2:	3bbe      	bseti      	r3, 30
    58e4:	071f      	br      	0x5722	// 5722 <EPT_IO_SET+0x16>
		else if(IO_Num_X==IO_NUM_PA013)
    58e6:	3320      	movi      	r3, 32
    58e8:	64c6      	cmpne      	r1, r3
    58ea:	0809      	bt      	0x58fc	// 58fc <EPT_IO_SET+0x1f0>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)|0X00400000;				//PA0.13 EPI1
    58ec:	1070      	lrw      	r3, 0x20000050	// 592c <EPT_IO_SET+0x220>
    58ee:	32f0      	movi      	r2, 240
    58f0:	9320      	ld.w      	r1, (r3, 0x0)
    58f2:	9161      	ld.w      	r3, (r1, 0x4)
    58f4:	4250      	lsli      	r2, r2, 16
    58f6:	68c9      	andn      	r3, r2
    58f8:	3bb6      	bseti      	r3, 22
    58fa:	0720      	br      	0x573a	// 573a <EPT_IO_SET+0x2e>
		else if(IO_Num_X==IO_NUM_PB03)
    58fc:	3953      	cmpnei      	r1, 19
    58fe:	080b      	bt      	0x5914	// 5914 <EPT_IO_SET+0x208>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF)|0X00007000;				//PB0.3 EPI2
    5900:	106c      	lrw      	r3, 0x2000004c	// 5930 <EPT_IO_SET+0x224>
    5902:	32f0      	movi      	r2, 240
    5904:	9320      	ld.w      	r1, (r3, 0x0)
    5906:	4248      	lsli      	r2, r2, 8
    5908:	9160      	ld.w      	r3, (r1, 0x0)
    590a:	68c9      	andn      	r3, r2
    590c:	32e0      	movi      	r2, 224
    590e:	4247      	lsli      	r2, r2, 7
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)|0X00000700;				//PB0.2 EPI3
    5910:	6cc8      	or      	r3, r2
    5912:	074e      	br      	0x57ae	// 57ae <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PB02)
    5914:	3956      	cmpnei      	r1, 22
    5916:	0b07      	bt      	0x5724	// 5724 <EPT_IO_SET+0x18>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)|0X00000700;				//PB0.2 EPI3
    5918:	1066      	lrw      	r3, 0x2000004c	// 5930 <EPT_IO_SET+0x224>
    591a:	32f0      	movi      	r2, 240
    591c:	9320      	ld.w      	r1, (r3, 0x0)
    591e:	4244      	lsli      	r2, r2, 4
    5920:	9160      	ld.w      	r3, (r1, 0x0)
    5922:	68c9      	andn      	r3, r2
    5924:	32e0      	movi      	r2, 224
    5926:	4243      	lsli      	r2, r2, 3
    5928:	07f4      	br      	0x5910	// 5910 <EPT_IO_SET+0x204>
    592a:	0000      	bkpt
    592c:	20000050 	.long	0x20000050
    5930:	2000004c 	.long	0x2000004c

Disassembly of section .text.EPT_PWM_Config:

00005934 <EPT_PWM_Config>:
/*************************************************************/  
//Fclk=Fpclk/(PSC+1)
void EPT_PWM_Config(EPT_TCLK_Selecte_Type EPT_TCLK_Selecte_X , EPT_CNTMD_SELECTE_Type EPT_CNTMD_SELECTE_X  , EPT_OPM_SELECTE_Type EPT_OPM_SELECTE_X
					, U16_T EPT_PSCR)		
//start选immediate模式,debug挂起PWM输出高阻,pwm停止时输出高阻,start控制位同步触发,ZRO载入PSCR(bit17:bit16)
{
    5934:	14c3      	push      	r4-r6
    5936:	6d8b      	mov      	r6, r2
	EPT0->CEDR=(EPT0->CEDR&0XFFFFFF00)|(0X01|EPT_TCLK_Selecte_X|(0X01<<1)|(0X01<<6));
    5938:	104a      	lrw      	r2, 0x20000024	// 5960 <EPT_PWM_Config+0x2c>
	if(EPT_TCLK_Selecte_X==EPT_Selecte_PCLK)
    593a:	3840      	cmpnei      	r0, 0
	EPT0->CEDR=(EPT0->CEDR&0XFFFFFF00)|(0X01|EPT_TCLK_Selecte_X|(0X01<<1)|(0X01<<6));
    593c:	92a0      	ld.w      	r5, (r2, 0x0)
    593e:	9580      	ld.w      	r4, (r5, 0x0)
    5940:	32ff      	movi      	r2, 255
    5942:	6909      	andn      	r4, r2
    5944:	3243      	movi      	r2, 67
    5946:	6d08      	or      	r4, r2
    5948:	6d00      	or      	r4, r0
    594a:	b580      	st.w      	r4, (r5, 0x0)
	if(EPT_TCLK_Selecte_X==EPT_Selecte_PCLK)
    594c:	0802      	bt      	0x5950	// 5950 <EPT_PWM_Config+0x1c>
	{
		EPT0->PSCR=EPT_PSCR;
    594e:	b562      	st.w      	r3, (r5, 0x8)
	}
	EPT0->CR=(EPT0->CR&0xfff8ffc0)|EPT_CNTMD_SELECTE_X|(0x0<<2)|(0x0<<3)|(0x0<<4)|EPT_OPM_SELECTE_X|(0X0<<16)|(0x1<<18);
    5950:	9543      	ld.w      	r2, (r5, 0xc)
    5952:	1065      	lrw      	r3, 0x7003f	// 5964 <EPT_PWM_Config+0x30>
    5954:	688d      	andn      	r2, r3
    5956:	6c98      	or      	r2, r6
    5958:	3ab2      	bseti      	r2, 18
    595a:	6c48      	or      	r1, r2
    595c:	b523      	st.w      	r1, (r5, 0xc)
} 
    595e:	1483      	pop      	r4-r6
    5960:	20000024 	.long	0x20000024
    5964:	0007003f 	.long	0x0007003f

Disassembly of section .text.EPT_PWMX_Output_Control:

00005968 <EPT_PWMX_Output_Control>:
							 EPT_PWM_CAU_Output_Type EPT_PWM_CAU_Event_Output , EPT_PWM_CAD_Output_Type EPT_PWM_CAD_Event_Output ,
							 EPT_PWM_CBU_Output_Type EPT_PWM_CBU_Event_Output , EPT_PWM_CBD_Output_Type EPT_PWM_CBD_Event_Output ,
							 EPT_PWM_T1U_Output_Type EPT_PWM_T1U_Event_Output , EPT_PWM_T1D_Output_Type EPT_PWM_T1D_Event_Output ,
							 EPT_PWM_T2U_Output_Type EPT_PWM_T2U_Event_Output , EPT_PWM_T2D_Output_Type EPT_PWM_T2D_Event_Output 
							 )
{
    5968:	14c4      	push      	r4-r7
    596a:	1425      	subi      	r14, r14, 20
    596c:	9889      	ld.w      	r4, (r14, 0x24)
    596e:	b880      	st.w      	r4, (r14, 0x0)
    5970:	988a      	ld.w      	r4, (r14, 0x28)
    5972:	b881      	st.w      	r4, (r14, 0x4)
    5974:	988b      	ld.w      	r4, (r14, 0x2c)
    5976:	b882      	st.w      	r4, (r14, 0x8)
    5978:	988c      	ld.w      	r4, (r14, 0x30)
    597a:	b883      	st.w      	r4, (r14, 0xc)
	if(EPT_PWMX_Selecte==EPT_PWMA)
    597c:	3840      	cmpnei      	r0, 0
{
    597e:	988d      	ld.w      	r4, (r14, 0x34)
    5980:	b884      	st.w      	r4, (r14, 0x10)
    5982:	98ce      	ld.w      	r6, (r14, 0x38)
    5984:	98ef      	ld.w      	r7, (r14, 0x3c)
    5986:	98b0      	ld.w      	r5, (r14, 0x40)
    5988:	9891      	ld.w      	r4, (r14, 0x44)
	if(EPT_PWMX_Selecte==EPT_PWMA)
    598a:	0816      	bt      	0x59b6	// 59b6 <EPT_PWMX_Output_Control+0x4e>
	{
		EPT0->AQCRA=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    598c:	6d14      	or      	r4, r5
    598e:	6d1c      	or      	r4, r7
    5990:	98a4      	ld.w      	r5, (r14, 0x10)
    5992:	6d18      	or      	r4, r6
    5994:	6d14      	or      	r4, r5
    5996:	98a3      	ld.w      	r5, (r14, 0xc)
    5998:	6d14      	or      	r4, r5
    599a:	98a2      	ld.w      	r5, (r14, 0x8)
    599c:	6d14      	or      	r4, r5
    599e:	98a1      	ld.w      	r5, (r14, 0x4)
    59a0:	6d14      	or      	r4, r5
    59a2:	98a0      	ld.w      	r5, (r14, 0x0)
    59a4:	6d14      	or      	r4, r5
    59a6:	6cd0      	or      	r3, r4
		EPT0->AQCRA=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    59a8:	1105      	lrw      	r0, 0x20000024	// 5a3c <EPT_PWMX_Output_Control+0xd4>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    59aa:	6c8c      	or      	r2, r3
		EPT0->AQCRA=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    59ac:	9000      	ld.w      	r0, (r0, 0x0)
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    59ae:	6c48      	or      	r1, r2
		EPT0->AQCRA=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    59b0:	b032      	st.w      	r1, (r0, 0x48)
	{
		EPT0->AQCRD=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
	}
	
}
    59b2:	1405      	addi      	r14, r14, 20
    59b4:	1484      	pop      	r4-r7
	else if(EPT_PWMX_Selecte==EPT_PWMB)
    59b6:	3841      	cmpnei      	r0, 1
    59b8:	0815      	bt      	0x59e2	// 59e2 <EPT_PWMX_Output_Control+0x7a>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    59ba:	6d14      	or      	r4, r5
    59bc:	6d1c      	or      	r4, r7
    59be:	98a4      	ld.w      	r5, (r14, 0x10)
    59c0:	6d18      	or      	r4, r6
    59c2:	6d14      	or      	r4, r5
    59c4:	98a3      	ld.w      	r5, (r14, 0xc)
    59c6:	6d14      	or      	r4, r5
    59c8:	98a2      	ld.w      	r5, (r14, 0x8)
    59ca:	6d14      	or      	r4, r5
    59cc:	98a1      	ld.w      	r5, (r14, 0x4)
    59ce:	6d14      	or      	r4, r5
    59d0:	98a0      	ld.w      	r5, (r14, 0x0)
    59d2:	6d14      	or      	r4, r5
    59d4:	6cd0      	or      	r3, r4
		EPT0->AQCRB=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    59d6:	101a      	lrw      	r0, 0x20000024	// 5a3c <EPT_PWMX_Output_Control+0xd4>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    59d8:	6c8c      	or      	r2, r3
		EPT0->AQCRB=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    59da:	9000      	ld.w      	r0, (r0, 0x0)
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    59dc:	6c48      	or      	r1, r2
		EPT0->AQCRB=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    59de:	b033      	st.w      	r1, (r0, 0x4c)
    59e0:	07e9      	br      	0x59b2	// 59b2 <EPT_PWMX_Output_Control+0x4a>
	else if(EPT_PWMX_Selecte==EPT_PWMC)
    59e2:	3842      	cmpnei      	r0, 2
    59e4:	0815      	bt      	0x5a0e	// 5a0e <EPT_PWMX_Output_Control+0xa6>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    59e6:	6d14      	or      	r4, r5
    59e8:	6d1c      	or      	r4, r7
    59ea:	98a4      	ld.w      	r5, (r14, 0x10)
    59ec:	6d18      	or      	r4, r6
    59ee:	6d14      	or      	r4, r5
    59f0:	98a3      	ld.w      	r5, (r14, 0xc)
    59f2:	6d14      	or      	r4, r5
    59f4:	98a2      	ld.w      	r5, (r14, 0x8)
    59f6:	6d14      	or      	r4, r5
    59f8:	98a1      	ld.w      	r5, (r14, 0x4)
    59fa:	6d14      	or      	r4, r5
    59fc:	98a0      	ld.w      	r5, (r14, 0x0)
    59fe:	6d14      	or      	r4, r5
    5a00:	6cd0      	or      	r3, r4
		EPT0->AQCRC=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    5a02:	100f      	lrw      	r0, 0x20000024	// 5a3c <EPT_PWMX_Output_Control+0xd4>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    5a04:	6c8c      	or      	r2, r3
		EPT0->AQCRC=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    5a06:	9000      	ld.w      	r0, (r0, 0x0)
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    5a08:	6c48      	or      	r1, r2
		EPT0->AQCRC=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    5a0a:	b034      	st.w      	r1, (r0, 0x50)
    5a0c:	07d3      	br      	0x59b2	// 59b2 <EPT_PWMX_Output_Control+0x4a>
	else if(EPT_PWMX_Selecte==EPT_PWMD)
    5a0e:	3843      	cmpnei      	r0, 3
    5a10:	0bd1      	bt      	0x59b2	// 59b2 <EPT_PWMX_Output_Control+0x4a>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    5a12:	6d14      	or      	r4, r5
    5a14:	6d1c      	or      	r4, r7
    5a16:	98a4      	ld.w      	r5, (r14, 0x10)
    5a18:	6d18      	or      	r4, r6
    5a1a:	6d14      	or      	r4, r5
    5a1c:	98a3      	ld.w      	r5, (r14, 0xc)
    5a1e:	6d14      	or      	r4, r5
    5a20:	98a2      	ld.w      	r5, (r14, 0x8)
    5a22:	6d14      	or      	r4, r5
    5a24:	98a1      	ld.w      	r5, (r14, 0x4)
    5a26:	6d14      	or      	r4, r5
    5a28:	98a0      	ld.w      	r5, (r14, 0x0)
    5a2a:	6d14      	or      	r4, r5
    5a2c:	6cd0      	or      	r3, r4
		EPT0->AQCRD=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    5a2e:	1004      	lrw      	r0, 0x20000024	// 5a3c <EPT_PWMX_Output_Control+0xd4>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    5a30:	6c8c      	or      	r2, r3
		EPT0->AQCRD=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    5a32:	9000      	ld.w      	r0, (r0, 0x0)
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    5a34:	6c48      	or      	r1, r2
		EPT0->AQCRD=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    5a36:	b035      	st.w      	r1, (r0, 0x54)
}
    5a38:	07bd      	br      	0x59b2	// 59b2 <EPT_PWMX_Output_Control+0x4a>
    5a3a:	0000      	bkpt
    5a3c:	20000024 	.long	0x20000024

Disassembly of section .text.EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config:

00005a40 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config>:
//EPT_CMPB_Value:0~0xff
//EPT_CMPC_Value:0~0xff
//EPT_CMPD_Value:0~0xff
/*************************************************************/ 
void EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(U16_T EPT_PRDR_Value , U16_T EPT_CMPA_Value , U16_T EPT_CMPB_Value , U16_T EPT_CMPC_Value , U16_T EPT_CMPD_Value)
{
    5a40:	14c2      	push      	r4-r5
	EPT0->PRDR=EPT_PRDR_Value;
    5a42:	1086      	lrw      	r4, 0x20000024	// 5a58 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config+0x18>
{
    5a44:	d8ae1004 	ld.h      	r5, (r14, 0x8)
	EPT0->PRDR=EPT_PRDR_Value;
    5a48:	9480      	ld.w      	r4, (r4, 0x0)
    5a4a:	b409      	st.w      	r0, (r4, 0x24)
	EPT0->CMPA=EPT_CMPA_Value;
    5a4c:	b42b      	st.w      	r1, (r4, 0x2c)
	EPT0->CMPB=EPT_CMPB_Value;
    5a4e:	b44c      	st.w      	r2, (r4, 0x30)
	EPT0->CMPC=EPT_CMPC_Value;
    5a50:	b46d      	st.w      	r3, (r4, 0x34)
	EPT0->CMPD=EPT_CMPD_Value;
    5a52:	b4ae      	st.w      	r5, (r4, 0x38)
}
    5a54:	1482      	pop      	r4-r5
    5a56:	0000      	bkpt
    5a58:	20000024 	.long	0x20000024

Disassembly of section .text.EPT_Int_Enable:

00005a5c <EPT_Int_Enable>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void EPT_Int_Enable(EPT_INT_TypeDef EPT_X_INT)
{
	EPT0->ICR 	= EPT_X_INT;							//clear LVD INT status
    5a5c:	1064      	lrw      	r3, 0x20000024	// 5a6c <EPT_Int_Enable+0x10>
    5a5e:	9360      	ld.w      	r3, (r3, 0x0)
    5a60:	237f      	addi      	r3, 128
    5a62:	b317      	st.w      	r0, (r3, 0x5c)
	EPT0->IMCR  |= EPT_X_INT;
    5a64:	9356      	ld.w      	r2, (r3, 0x58)
    5a66:	6c08      	or      	r0, r2
    5a68:	b316      	st.w      	r0, (r3, 0x58)
}
    5a6a:	783c      	jmp      	r15
    5a6c:	20000024 	.long	0x20000024

Disassembly of section .text.EPT_Vector_Int_Enable:

00005a70 <EPT_Vector_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPT_Vector_Int_Enable(void)
{
	INTC_ISER_WRITE(EPT0_INT);    
    5a70:	3210      	movi      	r2, 16
    5a72:	1062      	lrw      	r3, 0xe000e100	// 5a78 <EPT_Vector_Int_Enable+0x8>
    5a74:	b340      	st.w      	r2, (r3, 0x0)
}
    5a76:	783c      	jmp      	r15
    5a78:	e000e100 	.long	0xe000e100

Disassembly of section .text.EPT_Vector_Int_Disable:

00005a7c <EPT_Vector_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPT_Vector_Int_Disable(void)
{
    INTC_ICER_WRITE(EPT0_INT);    
    5a7c:	3210      	movi      	r2, 16
    5a7e:	1062      	lrw      	r3, 0xe000e180	// 5a84 <EPT_Vector_Int_Disable+0x8>
    5a80:	b340      	st.w      	r2, (r3, 0x0)
}
    5a82:	783c      	jmp      	r15
    5a84:	e000e180 	.long	0xe000e180

Disassembly of section .text.ADC12_RESET_VALUE:

00005a88 <ADC12_RESET_VALUE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void ADC12_RESET_VALUE(void)
{
	 ADC0->ECR	=	ADC_ECR_RST;     				/**< ECR  reset value  */
    5a88:	107a      	lrw      	r3, 0x20000054	// 5af0 <ADC12_RESET_VALUE+0x68>
	 ADC0->DCR	=	ADC_DCR_RST;                  	/**< DCR  reset value  */
	 ADC0->PMSR	= 	ADC_PMSR_RST;       		  	/**< PMSR reset value  */
	 ADC0->CR	=	ADC_CR_RST;             		/**< CR   reset value  */
    5a8a:	3180      	movi      	r1, 128
	 ADC0->ECR	=	ADC_ECR_RST;     				/**< ECR  reset value  */
    5a8c:	9360      	ld.w      	r3, (r3, 0x0)
    5a8e:	3200      	movi      	r2, 0
	 ADC0->CR	=	ADC_CR_RST;             		/**< CR   reset value  */
    5a90:	4138      	lsli      	r1, r1, 24
	 ADC0->ECR	=	ADC_ECR_RST;     				/**< ECR  reset value  */
    5a92:	b340      	st.w      	r2, (r3, 0x0)
	 ADC0->DCR	=	ADC_DCR_RST;                  	/**< DCR  reset value  */
    5a94:	b341      	st.w      	r2, (r3, 0x4)
	 ADC0->PMSR	= 	ADC_PMSR_RST;       		  	/**< PMSR reset value  */
    5a96:	b342      	st.w      	r2, (r3, 0x8)
	 ADC0->CR	=	ADC_CR_RST;             		/**< CR   reset value  */
    5a98:	b324      	st.w      	r1, (r3, 0x10)
	 ADC0->CSR	=   ADC_CSR_RST;                  	/**< CSR  reset value  */
	 ADC0->SR 	=	ADC_SR_RST;                   	/**< SR   reset value  */
	 ADC0->IER 	=	ADC_IER_RST;                	/**< IER  reset value  */
	 ADC0->IDR 	=	ADC_IDR_RST;              		/**< IDR  reset value  */
	 ADC0->IMR  	=	ADC_IMR_RST;               		/**< IMR  reset value  */
	 ADC0->SEQ[0]=	ADC_SEQx_RST;             		/**< SEQ0  reset value */
    5a9a:	3180      	movi      	r1, 128
	 ADC0->MR	=   ADC_MR_RST;                  	/**< MR   reset value  */
    5a9c:	b345      	st.w      	r2, (r3, 0x14)
	 ADC0->CSR	=   ADC_CSR_RST;                  	/**< CSR  reset value  */
    5a9e:	b347      	st.w      	r2, (r3, 0x1c)
	 ADC0->SR 	=	ADC_SR_RST;                   	/**< SR   reset value  */
    5aa0:	b348      	st.w      	r2, (r3, 0x20)
	 ADC0->IER 	=	ADC_IER_RST;                	/**< IER  reset value  */
    5aa2:	b349      	st.w      	r2, (r3, 0x24)
	 ADC0->IDR 	=	ADC_IDR_RST;              		/**< IDR  reset value  */
    5aa4:	b34a      	st.w      	r2, (r3, 0x28)
	 ADC0->IMR  	=	ADC_IMR_RST;               		/**< IMR  reset value  */
    5aa6:	b34b      	st.w      	r2, (r3, 0x2c)
	 ADC0->SEQ[0]=	ADC_SEQx_RST;             		/**< SEQ0  reset value */
    5aa8:	b32c      	st.w      	r1, (r3, 0x30)
	 ADC0->SEQ[1]=	ADC_SEQx_RST;             		/**< SEQ1  reset value */
    5aaa:	b32d      	st.w      	r1, (r3, 0x34)
	 ADC0->SEQ[2]=	ADC_SEQx_RST;             		/**< SEQ2  reset value */
    5aac:	b32e      	st.w      	r1, (r3, 0x38)
	 ADC0->SEQ[3]=	ADC_SEQx_RST;             		/**< SEQ3  reset value */
    5aae:	b32f      	st.w      	r1, (r3, 0x3c)
	 ADC0->SEQ[4]=	ADC_SEQx_RST;             		/**< SEQ4  reset value */
    5ab0:	b330      	st.w      	r1, (r3, 0x40)
	 ADC0->SEQ[5]=	ADC_SEQx_RST;             		/**< SEQ5  reset value */
    5ab2:	b331      	st.w      	r1, (r3, 0x44)
	 ADC0->SEQ[6]=	ADC_SEQx_RST;             		/**< SEQ6  reset value */
    5ab4:	b332      	st.w      	r1, (r3, 0x48)
	 ADC0->SEQ[7]=	ADC_SEQx_RST;             		/**< SEQ7  reset value */
    5ab6:	b333      	st.w      	r1, (r3, 0x4c)
	 ADC0->SEQ[8]=	ADC_SEQx_RST;             		/**< SEQ8  reset value */
    5ab8:	b334      	st.w      	r1, (r3, 0x50)
	 ADC0->SEQ[9]=	ADC_SEQx_RST;             		/**< SEQ9  reset value */
    5aba:	b335      	st.w      	r1, (r3, 0x54)
	 ADC0->SEQ[10]=	ADC_SEQx_RST;             		/**< SEQ10  reset value */
    5abc:	b336      	st.w      	r1, (r3, 0x58)
	 ADC0->SEQ[11]=	ADC_SEQx_RST;             		/**< SEQ11  reset value */
    5abe:	b337      	st.w      	r1, (r3, 0x5c)
	 ADC0->SEQ[12]=	ADC_SEQx_RST;             		/**< SEQ12  reset value */
    5ac0:	b338      	st.w      	r1, (r3, 0x60)
	 ADC0->SEQ[13]=	ADC_SEQx_RST;             		/**< SEQ13  reset value */
    5ac2:	b339      	st.w      	r1, (r3, 0x64)
	 ADC0->SEQ[14]=	ADC_SEQx_RST;             		/**< SEQ14  reset value */
    5ac4:	b33a      	st.w      	r1, (r3, 0x68)
	 ADC0->SEQ[15]=	ADC_SEQx_RST;             		/**< SEQ15  reset value */
    5ac6:	b33b      	st.w      	r1, (r3, 0x6c)
	 ADC0->DR[0]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ac8:	23ff      	addi      	r3, 256
    5aca:	b340      	st.w      	r2, (r3, 0x0)
	 ADC0->DR[1]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5acc:	b341      	st.w      	r2, (r3, 0x4)
	 ADC0->DR[2]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ace:	b342      	st.w      	r2, (r3, 0x8)
	 ADC0->DR[3]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ad0:	b343      	st.w      	r2, (r3, 0xc)
	 ADC0->DR[4]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ad2:	b344      	st.w      	r2, (r3, 0x10)
	 ADC0->DR[5]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ad4:	b345      	st.w      	r2, (r3, 0x14)
	 ADC0->DR[6]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ad6:	b346      	st.w      	r2, (r3, 0x18)
	 ADC0->DR[7]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ad8:	b347      	st.w      	r2, (r3, 0x1c)
	 ADC0->DR[8]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ada:	b348      	st.w      	r2, (r3, 0x20)
	 ADC0->DR[9]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5adc:	b349      	st.w      	r2, (r3, 0x24)
	 ADC0->DR[10]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ade:	b34a      	st.w      	r2, (r3, 0x28)
	 ADC0->DR[11]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ae0:	b34b      	st.w      	r2, (r3, 0x2c)
	 ADC0->DR[12]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ae2:	b34c      	st.w      	r2, (r3, 0x30)
	 ADC0->DR[13]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ae4:	b34d      	st.w      	r2, (r3, 0x34)
	 ADC0->DR[14]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ae6:	b34e      	st.w      	r2, (r3, 0x38)
	 ADC0->DR[15]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ae8:	b34f      	st.w      	r2, (r3, 0x3c)
	 ADC0->CMP0   =	ADC_CMP0_RST;               	/**< CMP1 reset value  */
    5aea:	b350      	st.w      	r2, (r3, 0x40)
	 ADC0->CMP1   =	ADC_CMP1_RST;                	/**< CMP2 reset value  */
    5aec:	b351      	st.w      	r2, (r3, 0x44)
}  
    5aee:	783c      	jmp      	r15
    5af0:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_Control:

00005af4 <ADC12_Control>:
//ReturnValue:NONE
/*************************************************************/  
  //control:ADC enable/disable ,start/stop,swrst
void ADC12_Control(ADC12_Control_TypeDef ADC12_Control_x )
{
	ADC0->CR |= ADC12_Control_x;							// 
    5af4:	1063      	lrw      	r3, 0x20000054	// 5b00 <ADC12_Control+0xc>
    5af6:	9340      	ld.w      	r2, (r3, 0x0)
    5af8:	9264      	ld.w      	r3, (r2, 0x10)
    5afa:	6c0c      	or      	r0, r3
    5afc:	b204      	st.w      	r0, (r2, 0x10)
}
    5afe:	783c      	jmp      	r15
    5b00:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_CMD.part.0:

00005b04 <ADC12_CMD.part.0>:
//ADC12 ENABLE
//EntryParameter:NewState
//NewState:ENABLE , DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ADC12_CMD(FunctionalStatus NewState)
    5b04:	14d0      	push      	r15
{
	if (NewState != DISABLE)
	{
		ADC12_Control(ADC12_ADCEN);						//ADC12 ENABLE
    5b06:	3002      	movi      	r0, 2
    5b08:	e3fffff6 	bsr      	0x5af4	// 5af4 <ADC12_Control>
		while(!(ADC0->SR &ADC12_ADCENS));
    5b0c:	1065      	lrw      	r3, 0x20000054	// 5b20 <ADC12_CMD.part.0+0x1c>
    5b0e:	3280      	movi      	r2, 128
    5b10:	9320      	ld.w      	r1, (r3, 0x0)
    5b12:	4241      	lsli      	r2, r2, 1
    5b14:	9168      	ld.w      	r3, (r1, 0x20)
    5b16:	68c8      	and      	r3, r2
    5b18:	3b40      	cmpnei      	r3, 0
    5b1a:	0ffd      	bf      	0x5b14	// 5b14 <ADC12_CMD.part.0+0x10>
	else
	{
		ADC12_Control(ADC12_ADCDIS);					//ADC12 DISABLE
		while(ADC0->SR&ADC12_ADCENS);
	}
}
    5b1c:	1490      	pop      	r15
    5b1e:	0000      	bkpt
    5b20:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_CLK_CMD:

00005b24 <ADC12_CLK_CMD>:
	if (NewState != DISABLE)
    5b24:	3940      	cmpnei      	r1, 0
    5b26:	106a      	lrw      	r3, 0x20000054	// 5b4c <ADC12_CLK_CMD+0x28>
		ADC0->ECR  |= ADC_CLK_CMD;						//ENABLE
    5b28:	9340      	ld.w      	r2, (r3, 0x0)
	if (NewState != DISABLE)
    5b2a:	0c09      	bf      	0x5b3c	// 5b3c <ADC12_CLK_CMD+0x18>
		ADC0->ECR  |= ADC_CLK_CMD;						//ENABLE
    5b2c:	9260      	ld.w      	r3, (r2, 0x0)
    5b2e:	6cc0      	or      	r3, r0
    5b30:	b260      	st.w      	r3, (r2, 0x0)
		while(!(ADC0->PMSR&ADC_CLK_CMD));
    5b32:	9262      	ld.w      	r3, (r2, 0x8)
    5b34:	68c0      	and      	r3, r0
    5b36:	3b40      	cmpnei      	r3, 0
    5b38:	0ffd      	bf      	0x5b32	// 5b32 <ADC12_CLK_CMD+0xe>
}
    5b3a:	783c      	jmp      	r15
		ADC0->DCR  |= ADC_CLK_CMD;						//DISABLE
    5b3c:	9261      	ld.w      	r3, (r2, 0x4)
    5b3e:	6cc0      	or      	r3, r0
    5b40:	b261      	st.w      	r3, (r2, 0x4)
		while(ADC0->PMSR&ADC_CLK_CMD);
    5b42:	9262      	ld.w      	r3, (r2, 0x8)
    5b44:	68c0      	and      	r3, r0
    5b46:	3b40      	cmpnei      	r3, 0
    5b48:	0bfd      	bt      	0x5b42	// 5b42 <ADC12_CLK_CMD+0x1e>
    5b4a:	07f8      	br      	0x5b3a	// 5b3a <ADC12_CLK_CMD+0x16>
    5b4c:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_CMD:

00005b50 <ADC12_CMD>:
{
    5b50:	14d0      	push      	r15
	if (NewState != DISABLE)
    5b52:	3840      	cmpnei      	r0, 0
    5b54:	0c04      	bf      	0x5b5c	// 5b5c <ADC12_CMD+0xc>
    5b56:	e3ffffd7 	bsr      	0x5b04	// 5b04 <ADC12_CMD.part.0>
}
    5b5a:	1490      	pop      	r15
		ADC12_Control(ADC12_ADCDIS);					//ADC12 DISABLE
    5b5c:	3004      	movi      	r0, 4
    5b5e:	e3ffffcb 	bsr      	0x5af4	// 5af4 <ADC12_Control>
		while(ADC0->SR&ADC12_ADCENS);
    5b62:	1065      	lrw      	r3, 0x20000054	// 5b74 <ADC12_CMD+0x24>
    5b64:	3280      	movi      	r2, 128
    5b66:	9320      	ld.w      	r1, (r3, 0x0)
    5b68:	4241      	lsli      	r2, r2, 1
    5b6a:	9168      	ld.w      	r3, (r1, 0x20)
    5b6c:	68c8      	and      	r3, r2
    5b6e:	3b40      	cmpnei      	r3, 0
    5b70:	0bfd      	bt      	0x5b6a	// 5b6a <ADC12_CMD+0x1a>
    5b72:	07f4      	br      	0x5b5a	// 5b5a <ADC12_CMD+0xa>
    5b74:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_ready_wait:

00005b78 <ADC12_ready_wait>:
//EntryParameter:NONE
//ReturnValue:ADC12 READ FLAG
/*************************************************************/ 
void ADC12_ready_wait(void)  
{
	while(!(ADC0->SR&ADC12_READY));   					// Waiting for ADC0 Ready
    5b78:	1064      	lrw      	r3, 0x20000054	// 5b88 <ADC12_ready_wait+0x10>
    5b7a:	3202      	movi      	r2, 2
    5b7c:	9320      	ld.w      	r1, (r3, 0x0)
    5b7e:	9168      	ld.w      	r3, (r1, 0x20)
    5b80:	68c8      	and      	r3, r2
    5b82:	3b40      	cmpnei      	r3, 0
    5b84:	0ffd      	bf      	0x5b7e	// 5b7e <ADC12_ready_wait+0x6>
}
    5b86:	783c      	jmp      	r15
    5b88:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_SEQEND_wait:

00005b8c <ADC12_SEQEND_wait>:
//EntryParameter:NONE
//ReturnValue:ADC12 EOC
/*************************************************************/ 
void ADC12_SEQEND_wait(U8_T val)
{
	while(!(ADC0->SR & (0x01ul << (16+val))));			// EOC wait
    5b8c:	200f      	addi      	r0, 16
    5b8e:	1065      	lrw      	r3, 0x20000054	// 5ba0 <ADC12_SEQEND_wait+0x14>
    5b90:	3201      	movi      	r2, 1
    5b92:	9320      	ld.w      	r1, (r3, 0x0)
    5b94:	7080      	lsl      	r2, r0
    5b96:	9168      	ld.w      	r3, (r1, 0x20)
    5b98:	68c8      	and      	r3, r2
    5b9a:	3b40      	cmpnei      	r3, 0
    5b9c:	0ffd      	bf      	0x5b96	// 5b96 <ADC12_SEQEND_wait+0xa>
}  
    5b9e:	783c      	jmp      	r15
    5ba0:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_DATA_OUPUT:

00005ba4 <ADC12_DATA_OUPUT>:
//EntryParameter:NONE
//ReturnValue:ADC12 DR
/*************************************************************/ 
U16_T ADC12_DATA_OUPUT(U16_T Data_index )
{
	return(ADC0->DR[Data_index]);
    5ba4:	203f      	addi      	r0, 64
    5ba6:	1064      	lrw      	r3, 0x20000054	// 5bb4 <ADC12_DATA_OUPUT+0x10>
    5ba8:	4002      	lsli      	r0, r0, 2
    5baa:	9360      	ld.w      	r3, (r3, 0x0)
    5bac:	600c      	addu      	r0, r3
    5bae:	9000      	ld.w      	r0, (r0, 0x0)
    5bb0:	7401      	zexth      	r0, r0
} 
    5bb2:	783c      	jmp      	r15
    5bb4:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_Configure_Mode:

00005bb8 <ADC12_Configure_Mode>:
  //10BIT or 12BIT adc ;
  //ADC12_BIT_SELECTED:ADC12_12BIT/ADC12_10BIT;
  //ADC12_ConverMode:One_shot_mode/Continuous_mode;
  //adc date output=last number of Conversions;
void  ADC12_Configure_Mode(ADC12_10bitor12bit_TypeDef ADC12_BIT_SELECTED  , ADC12_ConverMode_TypeDef  ADC12_ConverMode  , U8_T ADC12_PRI, U8_T adc12_SHR , U8_T ADC12_DIV , U8_T NumConver) 
{
    5bb8:	14d4      	push      	r4-r7, r15
    5bba:	1422      	subi      	r14, r14, 8
    5bbc:	1c08      	addi      	r4, r14, 32
    5bbe:	84a0      	ld.b      	r5, (r4, 0x0)
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    5bc0:	2d00      	subi      	r5, 1
{
    5bc2:	6dc3      	mov      	r7, r0
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    5bc4:	10db      	lrw      	r6, 0x20000054	// 5c30 <ADC12_Configure_Mode+0x78>
{
    5bc6:	d80e001c 	ld.b      	r0, (r14, 0x1c)
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    5bca:	45aa      	lsli      	r5, r5, 10
    5bcc:	9680      	ld.w      	r4, (r6, 0x0)
    5bce:	6d40      	or      	r5, r0
	if(ADC12_ConverMode==One_shot_mode)
    5bd0:	3940      	cmpnei      	r1, 0
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    5bd2:	b4a5      	st.w      	r5, (r4, 0x14)
	if(ADC12_ConverMode==One_shot_mode)
    5bd4:	081c      	bt      	0x5c0c	// 5c0c <ADC12_Configure_Mode+0x54>
	{
		ADC0->MR&=~CONTCV;								//one short mode
    5bd6:	9425      	ld.w      	r1, (r4, 0x14)
    5bd8:	4121      	lsli      	r1, r1, 1
    5bda:	4921      	lsri      	r1, r1, 1
		while(ADC0->SR&ADC12_CTCVS);							
    5bdc:	3080      	movi      	r0, 128
		ADC0->MR&=~CONTCV;								//one short mode
    5bde:	b425      	st.w      	r1, (r4, 0x14)
		while(ADC0->SR&ADC12_CTCVS);							
    5be0:	4002      	lsli      	r0, r0, 2
    5be2:	9428      	ld.w      	r1, (r4, 0x20)
    5be4:	6840      	and      	r1, r0
    5be6:	3940      	cmpnei      	r1, 0
    5be8:	0bfd      	bt      	0x5be2	// 5be2 <ADC12_Configure_Mode+0x2a>
    5bea:	b861      	st.w      	r3, (r14, 0x4)
    5bec:	b840      	st.w      	r2, (r14, 0x0)
    5bee:	e3ffff8b 	bsr      	0x5b04	// 5b04 <ADC12_CMD.part.0>
	{
		ADC0->MR|=CONTCV;								//Continuous mode
		while(!(ADC0->SR&ADC12_CTCVS));							
	}
	ADC12_CMD(ENABLE);									//ADC0 enable
	if(ADC12_BIT_SELECTED)
    5bf2:	3f40      	cmpnei      	r7, 0
    5bf4:	9840      	ld.w      	r2, (r14, 0x0)
    5bf6:	9861      	ld.w      	r3, (r14, 0x4)
    5bf8:	0c16      	bf      	0x5c24	// 5c24 <ADC12_Configure_Mode+0x6c>
	{
		ADC0->CR|=ADC12_10BITor12BIT;
    5bfa:	9600      	ld.w      	r0, (r6, 0x0)
    5bfc:	9024      	ld.w      	r1, (r0, 0x10)
    5bfe:	39bf      	bseti      	r1, 31
	}
	else
	{
		ADC0->CR&=~ADC12_10BITor12BIT;
    5c00:	b024      	st.w      	r1, (r0, 0x10)
	}
	//ADC0->CR|=ADC12_VREF_VDD | ADC12_FVR_DIS;
	ADC0->PRI=ADC12_PRI;
    5c02:	9620      	ld.w      	r1, (r6, 0x0)
    5c04:	b15c      	st.w      	r2, (r1, 0x70)
	ADC0->SHR=adc12_SHR;						//采样保持周期
    5c06:	b166      	st.w      	r3, (r1, 0x18)
} 
    5c08:	1402      	addi      	r14, r14, 8
    5c0a:	1494      	pop      	r4-r7, r15
	else if(ADC12_ConverMode==Continuous_mode)
    5c0c:	3941      	cmpnei      	r1, 1
    5c0e:	0bee      	bt      	0x5bea	// 5bea <ADC12_Configure_Mode+0x32>
		ADC0->MR|=CONTCV;								//Continuous mode
    5c10:	9425      	ld.w      	r1, (r4, 0x14)
    5c12:	39bf      	bseti      	r1, 31
		while(!(ADC0->SR&ADC12_CTCVS));							
    5c14:	3080      	movi      	r0, 128
		ADC0->MR|=CONTCV;								//Continuous mode
    5c16:	b425      	st.w      	r1, (r4, 0x14)
		while(!(ADC0->SR&ADC12_CTCVS));							
    5c18:	4002      	lsli      	r0, r0, 2
    5c1a:	9428      	ld.w      	r1, (r4, 0x20)
    5c1c:	6840      	and      	r1, r0
    5c1e:	3940      	cmpnei      	r1, 0
    5c20:	0ffd      	bf      	0x5c1a	// 5c1a <ADC12_Configure_Mode+0x62>
    5c22:	07e4      	br      	0x5bea	// 5bea <ADC12_Configure_Mode+0x32>
		ADC0->CR&=~ADC12_10BITor12BIT;
    5c24:	9600      	ld.w      	r0, (r6, 0x0)
    5c26:	9024      	ld.w      	r1, (r0, 0x10)
    5c28:	4121      	lsli      	r1, r1, 1
    5c2a:	4921      	lsri      	r1, r1, 1
    5c2c:	07ea      	br      	0x5c00	// 5c00 <ADC12_Configure_Mode+0x48>
    5c2e:	0000      	bkpt
    5c30:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_Configure_VREF_Selecte:

00005c34 <ADC12_Configure_VREF_Selecte>:
//EntryParameter:NONE
//ReturnValue:None
/*************************************************************/ 
void ADC12_Configure_VREF_Selecte(ADC12_VREFP_VREFN_Selected_TypeDef ADC12_VREFP_X_VREFN_X )
{
	if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_VDD_VREFN_VSS)
    5c34:	3840      	cmpnei      	r0, 0
    5c36:	0808      	bt      	0x5c46	// 5c46 <ADC12_Configure_VREF_Selecte+0x12>
	{
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x00<<6);
    5c38:	1277      	lrw      	r3, 0x20000054	// 5d94 <ADC12_Configure_VREF_Selecte+0x160>
    5c3a:	1238      	lrw      	r1, 0x30103c0	// 5d98 <ADC12_Configure_VREF_Selecte+0x164>
    5c3c:	9340      	ld.w      	r2, (r3, 0x0)
    5c3e:	9264      	ld.w      	r3, (r2, 0x10)
    5c40:	68c5      	andn      	r3, r1
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0B<<6)|(0X01<<24)|(0X01<<25);	
	}
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_INTVREF1000_VREFN_EXIT)
	{
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00008000;					
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0C<<6)|(0X00<<16)|(0X02<<17);	
    5c42:	b264      	st.w      	r3, (r2, 0x10)
	}
}
    5c44:	783c      	jmp      	r15
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_EXIT_VREFN_VSS)
    5c46:	3841      	cmpnei      	r0, 1
    5c48:	0810      	bt      	0x5c68	// 5c68 <ADC12_Configure_VREF_Selecte+0x34>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;							
    5c4a:	1275      	lrw      	r3, 0x20000050	// 5d9c <ADC12_Configure_VREF_Selecte+0x168>
    5c4c:	32f0      	movi      	r2, 240
    5c4e:	9320      	ld.w      	r1, (r3, 0x0)
    5c50:	9160      	ld.w      	r3, (r1, 0x0)
    5c52:	4244      	lsli      	r2, r2, 4
    5c54:	68c9      	andn      	r3, r2
    5c56:	3bab      	bseti      	r3, 11
    5c58:	b160      	st.w      	r3, (r1, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x01<<6);
    5c5a:	1230      	lrw      	r1, 0x30103c0	// 5d98 <ADC12_Configure_VREF_Selecte+0x164>
    5c5c:	126e      	lrw      	r3, 0x20000054	// 5d94 <ADC12_Configure_VREF_Selecte+0x160>
    5c5e:	9340      	ld.w      	r2, (r3, 0x0)
    5c60:	9264      	ld.w      	r3, (r2, 0x10)
    5c62:	68c5      	andn      	r3, r1
    5c64:	3ba6      	bseti      	r3, 6
    5c66:	07ee      	br      	0x5c42	// 5c42 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR2048_VREFN_VSS)
    5c68:	3842      	cmpnei      	r0, 2
    5c6a:	0811      	bt      	0x5c8c	// 5c8c <ADC12_Configure_VREF_Selecte+0x58>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;							
    5c6c:	126c      	lrw      	r3, 0x20000050	// 5d9c <ADC12_Configure_VREF_Selecte+0x168>
    5c6e:	32f0      	movi      	r2, 240
    5c70:	9320      	ld.w      	r1, (r3, 0x0)
    5c72:	9160      	ld.w      	r3, (r1, 0x0)
    5c74:	4244      	lsli      	r2, r2, 4
    5c76:	68c9      	andn      	r3, r2
    5c78:	3bab      	bseti      	r3, 11
    5c7a:	b160      	st.w      	r3, (r1, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x02<<6)|(0X01<<24)|(0X00<<25);
    5c7c:	1227      	lrw      	r1, 0x30103c0	// 5d98 <ADC12_Configure_VREF_Selecte+0x164>
    5c7e:	1266      	lrw      	r3, 0x20000054	// 5d94 <ADC12_Configure_VREF_Selecte+0x160>
    5c80:	9340      	ld.w      	r2, (r3, 0x0)
    5c82:	9264      	ld.w      	r3, (r2, 0x10)
    5c84:	68c5      	andn      	r3, r1
    5c86:	3ba7      	bseti      	r3, 7
    5c88:	3bb8      	bseti      	r3, 24
    5c8a:	07dc      	br      	0x5c42	// 5c42 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR4096_VREFN_VSS)
    5c8c:	3843      	cmpnei      	r0, 3
    5c8e:	0811      	bt      	0x5cb0	// 5cb0 <ADC12_Configure_VREF_Selecte+0x7c>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;							
    5c90:	1263      	lrw      	r3, 0x20000050	// 5d9c <ADC12_Configure_VREF_Selecte+0x168>
    5c92:	32f0      	movi      	r2, 240
    5c94:	9320      	ld.w      	r1, (r3, 0x0)
    5c96:	9160      	ld.w      	r3, (r1, 0x0)
    5c98:	4244      	lsli      	r2, r2, 4
    5c9a:	68c9      	andn      	r3, r2
    5c9c:	3bab      	bseti      	r3, 11
    5c9e:	b160      	st.w      	r3, (r1, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x03<<6)|(0X01<<24)|(0X01<<25);
    5ca0:	113e      	lrw      	r1, 0x30103c0	// 5d98 <ADC12_Configure_VREF_Selecte+0x164>
    5ca2:	117d      	lrw      	r3, 0x20000054	// 5d94 <ADC12_Configure_VREF_Selecte+0x160>
    5ca4:	9340      	ld.w      	r2, (r3, 0x0)
    5ca6:	9264      	ld.w      	r3, (r2, 0x10)
    5ca8:	68c5      	andn      	r3, r1
    5caa:	113e      	lrw      	r1, 0x30000c0	// 5da0 <ADC12_Configure_VREF_Selecte+0x16c>
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0C<<6)|(0X00<<16)|(0X02<<17);	
    5cac:	6cc4      	or      	r3, r1
    5cae:	07ca      	br      	0x5c42	// 5c42 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_INTVREF1000_VREFN_VSS)
    5cb0:	3845      	cmpnei      	r0, 5
    5cb2:	0809      	bt      	0x5cc4	// 5cc4 <ADC12_Configure_VREF_Selecte+0x90>
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x04<<6)|(0X00<<16)|(0X02<<17);
    5cb4:	1178      	lrw      	r3, 0x20000054	// 5d94 <ADC12_Configure_VREF_Selecte+0x160>
    5cb6:	113c      	lrw      	r1, 0x30503c0	// 5da4 <ADC12_Configure_VREF_Selecte+0x170>
    5cb8:	9340      	ld.w      	r2, (r3, 0x0)
    5cba:	9264      	ld.w      	r3, (r2, 0x10)
    5cbc:	68c5      	andn      	r3, r1
    5cbe:	3ba8      	bseti      	r3, 8
    5cc0:	3bb2      	bseti      	r3, 18
    5cc2:	07c0      	br      	0x5c42	// 5c42 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_VDD_VREFN_EXIT)
    5cc4:	3846      	cmpnei      	r0, 6
    5cc6:	0810      	bt      	0x5ce6	// 5ce6 <ADC12_Configure_VREF_Selecte+0xb2>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00008000;	
    5cc8:	1175      	lrw      	r3, 0x20000050	// 5d9c <ADC12_Configure_VREF_Selecte+0x168>
    5cca:	32f0      	movi      	r2, 240
    5ccc:	9320      	ld.w      	r1, (r3, 0x0)
    5cce:	9160      	ld.w      	r3, (r1, 0x0)
    5cd0:	4248      	lsli      	r2, r2, 8
    5cd2:	68c9      	andn      	r3, r2
    5cd4:	3baf      	bseti      	r3, 15
    5cd6:	b160      	st.w      	r3, (r1, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x08<<6);
    5cd8:	1130      	lrw      	r1, 0x30103c0	// 5d98 <ADC12_Configure_VREF_Selecte+0x164>
    5cda:	116f      	lrw      	r3, 0x20000054	// 5d94 <ADC12_Configure_VREF_Selecte+0x160>
    5cdc:	9340      	ld.w      	r2, (r3, 0x0)
    5cde:	9264      	ld.w      	r3, (r2, 0x10)
    5ce0:	68c5      	andn      	r3, r1
    5ce2:	3ba9      	bseti      	r3, 9
    5ce4:	07af      	br      	0x5c42	// 5c42 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_EXIT_VREFN_EXIT)
    5ce6:	3847      	cmpnei      	r0, 7
    5ce8:	0817      	bt      	0x5d16	// 5d16 <ADC12_Configure_VREF_Selecte+0xe2>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00008000;
    5cea:	116d      	lrw      	r3, 0x20000050	// 5d9c <ADC12_Configure_VREF_Selecte+0x168>
    5cec:	31f0      	movi      	r1, 240
    5cee:	9340      	ld.w      	r2, (r3, 0x0)
    5cf0:	9260      	ld.w      	r3, (r2, 0x0)
    5cf2:	4128      	lsli      	r1, r1, 8
    5cf4:	68c5      	andn      	r3, r1
    5cf6:	3baf      	bseti      	r3, 15
    5cf8:	b260      	st.w      	r3, (r2, 0x0)
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;			
    5cfa:	31f0      	movi      	r1, 240
    5cfc:	9260      	ld.w      	r3, (r2, 0x0)
    5cfe:	4124      	lsli      	r1, r1, 4
    5d00:	68c5      	andn      	r3, r1
    5d02:	3bab      	bseti      	r3, 11
    5d04:	b260      	st.w      	r3, (r2, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x09<<6);
    5d06:	1125      	lrw      	r1, 0x30103c0	// 5d98 <ADC12_Configure_VREF_Selecte+0x164>
    5d08:	1163      	lrw      	r3, 0x20000054	// 5d94 <ADC12_Configure_VREF_Selecte+0x160>
    5d0a:	9340      	ld.w      	r2, (r3, 0x0)
    5d0c:	9264      	ld.w      	r3, (r2, 0x10)
    5d0e:	68c5      	andn      	r3, r1
    5d10:	3ba6      	bseti      	r3, 6
    5d12:	3ba9      	bseti      	r3, 9
    5d14:	0797      	br      	0x5c42	// 5c42 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR2048_VREFN_EXIT)
    5d16:	3848      	cmpnei      	r0, 8
    5d18:	0816      	bt      	0x5d44	// 5d44 <ADC12_Configure_VREF_Selecte+0x110>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00008000;	
    5d1a:	1161      	lrw      	r3, 0x20000050	// 5d9c <ADC12_Configure_VREF_Selecte+0x168>
    5d1c:	31f0      	movi      	r1, 240
    5d1e:	9340      	ld.w      	r2, (r3, 0x0)
    5d20:	9260      	ld.w      	r3, (r2, 0x0)
    5d22:	4128      	lsli      	r1, r1, 8
    5d24:	68c5      	andn      	r3, r1
    5d26:	3baf      	bseti      	r3, 15
    5d28:	b260      	st.w      	r3, (r2, 0x0)
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;
    5d2a:	31f0      	movi      	r1, 240
    5d2c:	9260      	ld.w      	r3, (r2, 0x0)
    5d2e:	4124      	lsli      	r1, r1, 4
    5d30:	68c5      	andn      	r3, r1
    5d32:	3bab      	bseti      	r3, 11
    5d34:	b260      	st.w      	r3, (r2, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0A<<6)|(0X01<<24)|(0X00<<25);			
    5d36:	1039      	lrw      	r1, 0x30103c0	// 5d98 <ADC12_Configure_VREF_Selecte+0x164>
    5d38:	1077      	lrw      	r3, 0x20000054	// 5d94 <ADC12_Configure_VREF_Selecte+0x160>
    5d3a:	9340      	ld.w      	r2, (r3, 0x0)
    5d3c:	9264      	ld.w      	r3, (r2, 0x10)
    5d3e:	68c5      	andn      	r3, r1
    5d40:	103a      	lrw      	r1, 0x1000280	// 5da8 <ADC12_Configure_VREF_Selecte+0x174>
    5d42:	07b5      	br      	0x5cac	// 5cac <ADC12_Configure_VREF_Selecte+0x78>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR4096_VREFN_EXIT)
    5d44:	3849      	cmpnei      	r0, 9
    5d46:	0816      	bt      	0x5d72	// 5d72 <ADC12_Configure_VREF_Selecte+0x13e>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00008000;	
    5d48:	1075      	lrw      	r3, 0x20000050	// 5d9c <ADC12_Configure_VREF_Selecte+0x168>
    5d4a:	31f0      	movi      	r1, 240
    5d4c:	9340      	ld.w      	r2, (r3, 0x0)
    5d4e:	9260      	ld.w      	r3, (r2, 0x0)
    5d50:	4128      	lsli      	r1, r1, 8
    5d52:	68c5      	andn      	r3, r1
    5d54:	3baf      	bseti      	r3, 15
    5d56:	b260      	st.w      	r3, (r2, 0x0)
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;
    5d58:	31f0      	movi      	r1, 240
    5d5a:	9260      	ld.w      	r3, (r2, 0x0)
    5d5c:	4124      	lsli      	r1, r1, 4
    5d5e:	68c5      	andn      	r3, r1
    5d60:	3bab      	bseti      	r3, 11
    5d62:	b260      	st.w      	r3, (r2, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0B<<6)|(0X01<<24)|(0X01<<25);	
    5d64:	102d      	lrw      	r1, 0x30103c0	// 5d98 <ADC12_Configure_VREF_Selecte+0x164>
    5d66:	106c      	lrw      	r3, 0x20000054	// 5d94 <ADC12_Configure_VREF_Selecte+0x160>
    5d68:	9340      	ld.w      	r2, (r3, 0x0)
    5d6a:	9264      	ld.w      	r3, (r2, 0x10)
    5d6c:	68c5      	andn      	r3, r1
    5d6e:	1030      	lrw      	r1, 0x30002c0	// 5dac <ADC12_Configure_VREF_Selecte+0x178>
    5d70:	079e      	br      	0x5cac	// 5cac <ADC12_Configure_VREF_Selecte+0x78>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_INTVREF1000_VREFN_EXIT)
    5d72:	384b      	cmpnei      	r0, 11
    5d74:	0b68      	bt      	0x5c44	// 5c44 <ADC12_Configure_VREF_Selecte+0x10>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00008000;					
    5d76:	106a      	lrw      	r3, 0x20000050	// 5d9c <ADC12_Configure_VREF_Selecte+0x168>
    5d78:	32f0      	movi      	r2, 240
    5d7a:	9320      	ld.w      	r1, (r3, 0x0)
    5d7c:	9160      	ld.w      	r3, (r1, 0x0)
    5d7e:	4248      	lsli      	r2, r2, 8
    5d80:	68c9      	andn      	r3, r2
    5d82:	3baf      	bseti      	r3, 15
    5d84:	b160      	st.w      	r3, (r1, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0C<<6)|(0X00<<16)|(0X02<<17);	
    5d86:	1028      	lrw      	r1, 0x30503c0	// 5da4 <ADC12_Configure_VREF_Selecte+0x170>
    5d88:	1063      	lrw      	r3, 0x20000054	// 5d94 <ADC12_Configure_VREF_Selecte+0x160>
    5d8a:	9340      	ld.w      	r2, (r3, 0x0)
    5d8c:	9264      	ld.w      	r3, (r2, 0x10)
    5d8e:	68c5      	andn      	r3, r1
    5d90:	1028      	lrw      	r1, 0x40300	// 5db0 <ADC12_Configure_VREF_Selecte+0x17c>
    5d92:	078d      	br      	0x5cac	// 5cac <ADC12_Configure_VREF_Selecte+0x78>
    5d94:	20000054 	.long	0x20000054
    5d98:	030103c0 	.long	0x030103c0
    5d9c:	20000050 	.long	0x20000050
    5da0:	030000c0 	.long	0x030000c0
    5da4:	030503c0 	.long	0x030503c0
    5da8:	01000280 	.long	0x01000280
    5dac:	030002c0 	.long	0x030002c0
    5db0:	00040300 	.long	0x00040300

Disassembly of section .text.ADC12_ConversionChannel_Config:

00005db4 <ADC12_ConversionChannel_Config>:
//ADC12_ADCINX:ADC12_ADCIN0~ADC12_ADCIN17,ADC12_INTVREF,ADC12_DIV4_VDD,ADC12_VSS
//ReturnValue:NONE
/*************************************************************/ 
void ADC12_ConversionChannel_Config(ADC12_InputSet_TypeDef ADC12_ADCINX ,
						ADC12_CV_RepeatNum_TypeDef CV_RepeatTime, ADC12_Control_TypeDef AVG_Set, U8_T SEQx)
{
    5db4:	14d4      	push      	r4-r7, r15
	switch(ADC12_ADCINX)
    5db6:	380f      	cmphsi      	r0, 16
{
    5db8:	6d83      	mov      	r6, r0
	switch(ADC12_ADCINX)
    5dba:	0818      	bt      	0x5dea	// 5dea <ADC12_ConversionChannel_Config+0x36>
    5dbc:	12af      	lrw      	r5, 0x20000050	// 5ef8 <ADC12_ConversionChannel_Config+0x144>
    5dbe:	1290      	lrw      	r4, 0x2000004c	// 5efc <ADC12_ConversionChannel_Config+0x148>
    5dc0:	e3ffe1f8 	bsr      	0x21b0	// 21b0 <___gnu_csky_case_uqi>
    5dc4:	322c2008 	.long	0x322c2008
    5dc8:	4d474039 	.long	0x4d474039
    5dcc:	6d659159 	.long	0x6d659159
    5dd0:	91887f76 	.long	0x91887f76
	{
		case 0:	
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC0 PB0.1
    5dd4:	9500      	ld.w      	r0, (r5, 0x0)
    5dd6:	90a0      	ld.w      	r5, (r0, 0x0)
    5dd8:	b0a0      	st.w      	r5, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    5dda:	90a1      	ld.w      	r5, (r0, 0x4)
    5ddc:	b0a1      	st.w      	r5, (r0, 0x4)
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFF0F)  | 0x00000010;			
    5dde:	9480      	ld.w      	r4, (r4, 0x0)
    5de0:	9400      	ld.w      	r0, (r4, 0x0)
    5de2:	35f0      	movi      	r5, 240
    5de4:	6815      	andn      	r0, r5
    5de6:	38a4      	bseti      	r0, 4
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFFF)  | 0x00000000;
			break;
		case 7:
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC7 PB0.2
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)  | 0x00000100;
    5de8:	b400      	st.w      	r0, (r4, 0x0)
    5dea:	1206      	lrw      	r0, 0x20000054	// 5f00 <ADC12_ConversionChannel_Config+0x14c>
    5dec:	4362      	lsli      	r3, r3, 2
    5dee:	9000      	ld.w      	r0, (r0, 0x0)
    5df0:	60c0      	addu      	r3, r0
		//case 27: break;
		case 0x1Cul: break;
		case 0x1Dul: break;
		case 0x1Eul: break;
	}
	ADC0->SEQ[SEQx] = ADC0->SEQ[SEQx] & 0;
    5df2:	930c      	ld.w      	r0, (r3, 0x30)
    5df4:	3000      	movi      	r0, 0
    5df6:	b30c      	st.w      	r0, (r3, 0x30)
	ADC0->SEQ[SEQx] = ADC0->SEQ[SEQx] | ADC12_ADCINX  | CV_RepeatTime | AVG_Set;
    5df8:	6c48      	or      	r1, r2
    5dfa:	930c      	ld.w      	r0, (r3, 0x30)
    5dfc:	6c58      	or      	r1, r6
    5dfe:	6c40      	or      	r1, r0
    5e00:	b32c      	st.w      	r1, (r3, 0x30)
}
    5e02:	1494      	pop      	r4-r7, r15
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFF0)  | 0x00000001;							//ADC1 PA0.0
    5e04:	95a0      	ld.w      	r5, (r5, 0x0)
    5e06:	9500      	ld.w      	r0, (r5, 0x0)
    5e08:	370f      	movi      	r7, 15
    5e0a:	681d      	andn      	r0, r7
    5e0c:	38a0      	bseti      	r0, 0
			GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)  | 0x10000000;							//ADC6 PA0.7
    5e0e:	b500      	st.w      	r0, (r5, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    5e10:	9501      	ld.w      	r0, (r5, 0x4)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0)  | 0x00000001;	
    5e12:	b501      	st.w      	r0, (r5, 0x4)
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFFF)  | 0x00000000;		
    5e14:	9400      	ld.w      	r0, (r4, 0x0)
    5e16:	9080      	ld.w      	r4, (r0, 0x0)
    5e18:	b080      	st.w      	r4, (r0, 0x0)
			break;
    5e1a:	07e8      	br      	0x5dea	// 5dea <ADC12_ConversionChannel_Config+0x36>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF0F)  | 0x00000010;							//ADC2 PA0.1
    5e1c:	95a0      	ld.w      	r5, (r5, 0x0)
    5e1e:	9500      	ld.w      	r0, (r5, 0x0)
    5e20:	37f0      	movi      	r7, 240
    5e22:	681d      	andn      	r0, r7
    5e24:	38a4      	bseti      	r0, 4
    5e26:	07f4      	br      	0x5e0e	// 5e0e <ADC12_ConversionChannel_Config+0x5a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00001000;							//ADC3 PA0.3
    5e28:	95a0      	ld.w      	r5, (r5, 0x0)
    5e2a:	37f0      	movi      	r7, 240
    5e2c:	9500      	ld.w      	r0, (r5, 0x0)
    5e2e:	47e8      	lsli      	r7, r7, 8
    5e30:	681d      	andn      	r0, r7
    5e32:	38ac      	bseti      	r0, 12
    5e34:	07ed      	br      	0x5e0e	// 5e0e <ADC12_ConversionChannel_Config+0x5a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF)  | 0x00100000;							//ADC4 PA0.5
    5e36:	95a0      	ld.w      	r5, (r5, 0x0)
    5e38:	37f0      	movi      	r7, 240
    5e3a:	9500      	ld.w      	r0, (r5, 0x0)
    5e3c:	47f0      	lsli      	r7, r7, 16
    5e3e:	681d      	andn      	r0, r7
    5e40:	38b4      	bseti      	r0, 20
    5e42:	07e6      	br      	0x5e0e	// 5e0e <ADC12_ConversionChannel_Config+0x5a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF)  | 0x01000000;							//ADC5 PA0.6
    5e44:	95a0      	ld.w      	r5, (r5, 0x0)
    5e46:	37f0      	movi      	r7, 240
    5e48:	9500      	ld.w      	r0, (r5, 0x0)
    5e4a:	47f4      	lsli      	r7, r7, 20
    5e4c:	681d      	andn      	r0, r7
    5e4e:	38b8      	bseti      	r0, 24
    5e50:	07df      	br      	0x5e0e	// 5e0e <ADC12_ConversionChannel_Config+0x5a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)  | 0x10000000;							//ADC6 PA0.7
    5e52:	95a0      	ld.w      	r5, (r5, 0x0)
    5e54:	9500      	ld.w      	r0, (r5, 0x0)
    5e56:	4004      	lsli      	r0, r0, 4
    5e58:	4804      	lsri      	r0, r0, 4
    5e5a:	38bc      	bseti      	r0, 28
    5e5c:	07d9      	br      	0x5e0e	// 5e0e <ADC12_ConversionChannel_Config+0x5a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC7 PB0.2
    5e5e:	9500      	ld.w      	r0, (r5, 0x0)
    5e60:	90a0      	ld.w      	r5, (r0, 0x0)
    5e62:	b0a0      	st.w      	r5, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    5e64:	90a1      	ld.w      	r5, (r0, 0x4)
    5e66:	b0a1      	st.w      	r5, (r0, 0x4)
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)  | 0x00000100;
    5e68:	9480      	ld.w      	r4, (r4, 0x0)
    5e6a:	35f0      	movi      	r5, 240
    5e6c:	9400      	ld.w      	r0, (r4, 0x0)
    5e6e:	45a4      	lsli      	r5, r5, 4
    5e70:	6815      	andn      	r0, r5
    5e72:	38a8      	bseti      	r0, 8
    5e74:	07ba      	br      	0x5de8	// 5de8 <ADC12_ConversionChannel_Config+0x34>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC8 PB0.3
    5e76:	9500      	ld.w      	r0, (r5, 0x0)
    5e78:	90a0      	ld.w      	r5, (r0, 0x0)
    5e7a:	b0a0      	st.w      	r5, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    5e7c:	90a1      	ld.w      	r5, (r0, 0x4)
    5e7e:	b0a1      	st.w      	r5, (r0, 0x4)
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF)  | 0x00001000;
    5e80:	9480      	ld.w      	r4, (r4, 0x0)
    5e82:	35f0      	movi      	r5, 240
    5e84:	9400      	ld.w      	r0, (r4, 0x0)
    5e86:	45a8      	lsli      	r5, r5, 8
    5e88:	6815      	andn      	r0, r5
    5e8a:	38ac      	bseti      	r0, 12
    5e8c:	07ae      	br      	0x5de8	// 5de8 <ADC12_ConversionChannel_Config+0x34>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC10 PA0.9
    5e8e:	95a0      	ld.w      	r5, (r5, 0x0)
    5e90:	9500      	ld.w      	r0, (r5, 0x0)
    5e92:	b500      	st.w      	r0, (r5, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFF0F)  | 0x00000010;	
    5e94:	9501      	ld.w      	r0, (r5, 0x4)
    5e96:	37f0      	movi      	r7, 240
    5e98:	681d      	andn      	r0, r7
    5e9a:	38a4      	bseti      	r0, 4
    5e9c:	07bb      	br      	0x5e12	// 5e12 <ADC12_ConversionChannel_Config+0x5e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC11 PA0.10
    5e9e:	95a0      	ld.w      	r5, (r5, 0x0)
    5ea0:	9500      	ld.w      	r0, (r5, 0x0)
    5ea2:	b500      	st.w      	r0, (r5, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF)  | 0x00000100;	
    5ea4:	37f0      	movi      	r7, 240
    5ea6:	9501      	ld.w      	r0, (r5, 0x4)
    5ea8:	47e4      	lsli      	r7, r7, 4
    5eaa:	681d      	andn      	r0, r7
    5eac:	38a8      	bseti      	r0, 8
    5eae:	07b2      	br      	0x5e12	// 5e12 <ADC12_ConversionChannel_Config+0x5e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC12 PA0.11
    5eb0:	95a0      	ld.w      	r5, (r5, 0x0)
    5eb2:	9500      	ld.w      	r0, (r5, 0x0)
    5eb4:	b500      	st.w      	r0, (r5, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF)  | 0x00001000;	
    5eb6:	37f0      	movi      	r7, 240
    5eb8:	9501      	ld.w      	r0, (r5, 0x4)
    5eba:	47e8      	lsli      	r7, r7, 8
    5ebc:	681d      	andn      	r0, r7
    5ebe:	38ac      	bseti      	r0, 12
    5ec0:	07a9      	br      	0x5e12	// 5e12 <ADC12_ConversionChannel_Config+0x5e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC13 PA0.12
    5ec2:	95a0      	ld.w      	r5, (r5, 0x0)
    5ec4:	9500      	ld.w      	r0, (r5, 0x0)
    5ec6:	b500      	st.w      	r0, (r5, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFF0FFFF)  | 0x00010000;	
    5ec8:	37f0      	movi      	r7, 240
    5eca:	9501      	ld.w      	r0, (r5, 0x4)
    5ecc:	47ec      	lsli      	r7, r7, 12
    5ece:	681d      	andn      	r0, r7
    5ed0:	38b0      	bseti      	r0, 16
    5ed2:	07a0      	br      	0x5e12	// 5e12 <ADC12_ConversionChannel_Config+0x5e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC14 PA0.13	
    5ed4:	95a0      	ld.w      	r5, (r5, 0x0)
    5ed6:	9500      	ld.w      	r0, (r5, 0x0)
    5ed8:	b500      	st.w      	r0, (r5, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)  | 0x00100000;	
    5eda:	37f0      	movi      	r7, 240
    5edc:	9501      	ld.w      	r0, (r5, 0x4)
    5ede:	47f0      	lsli      	r7, r7, 16
    5ee0:	681d      	andn      	r0, r7
    5ee2:	38b4      	bseti      	r0, 20
    5ee4:	0797      	br      	0x5e12	// 5e12 <ADC12_ConversionChannel_Config+0x5e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC15 PA0.8
    5ee6:	95a0      	ld.w      	r5, (r5, 0x0)
    5ee8:	9500      	ld.w      	r0, (r5, 0x0)
    5eea:	b500      	st.w      	r0, (r5, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0)  | 0x00000001;	
    5eec:	9501      	ld.w      	r0, (r5, 0x4)
    5eee:	370f      	movi      	r7, 15
    5ef0:	681d      	andn      	r0, r7
    5ef2:	38a0      	bseti      	r0, 0
    5ef4:	078f      	br      	0x5e12	// 5e12 <ADC12_ConversionChannel_Config+0x5e>
    5ef6:	0000      	bkpt
    5ef8:	20000050 	.long	0x20000050
    5efc:	2000004c 	.long	0x2000004c
    5f00:	20000054 	.long	0x20000054

Disassembly of section .text.I2C_SLAVE_CONFIG:

00005f04 <I2C_SLAVE_CONFIG>:
//IIC SLAVER Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void I2C_SLAVE_CONFIG(void)
{
    5f04:	14d0      	push      	r15
    5f06:	1423      	subi      	r14, r14, 12
	I2C_DeInit();
    5f08:	e3fffa1e 	bsr      	0x5344	// 5344 <I2C_DeInit>
	I2C_Slave_CONFIG(I2C_SDA_PA07,I2C_SCL_PA01,FAST_MODE,I2C_SLAVE_7BIT,0X57,0X50,0X50);//从机地址不能设置为0x00~0x07,0x78~0x7f
    5f0c:	3350      	movi      	r3, 80
    5f0e:	b862      	st.w      	r3, (r14, 0x8)
    5f10:	b861      	st.w      	r3, (r14, 0x4)
    5f12:	3357      	movi      	r3, 87
    5f14:	b860      	st.w      	r3, (r14, 0x0)
    5f16:	3204      	movi      	r2, 4
    5f18:	3300      	movi      	r3, 0
    5f1a:	3102      	movi      	r1, 2
    5f1c:	3002      	movi      	r0, 2
    5f1e:	e3fffa1f 	bsr      	0x535c	// 535c <I2C_Slave_CONFIG>
	I2C_SDA_TSETUP_THOLD_CONFIG(0x40,0x40,0x40);
    5f22:	3240      	movi      	r2, 64
    5f24:	3140      	movi      	r1, 64
    5f26:	3040      	movi      	r0, 64
    5f28:	e3fffab8 	bsr      	0x5498	// 5498 <I2C_SDA_TSETUP_THOLD_CONFIG>
	I2C_FIFO_TriggerData(0,0);															//发送FIFO设置为7
    5f2c:	3100      	movi      	r1, 0
    5f2e:	3000      	movi      	r0, 0
    5f30:	e3fffacc 	bsr      	0x54c8	// 54c8 <I2C_FIFO_TriggerData>
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_SCL_SLOW);
    5f34:	3180      	movi      	r1, 128
    5f36:	4127      	lsli      	r1, r1, 7
    5f38:	3001      	movi      	r0, 1
    5f3a:	e3fffab9 	bsr      	0x54ac	// 54ac <I2C_ConfigInterrupt_CMD>
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_STOP_DET);
    5f3e:	3180      	movi      	r1, 128
    5f40:	4122      	lsli      	r1, r1, 2
    5f42:	3001      	movi      	r0, 1
    5f44:	e3fffab4 	bsr      	0x54ac	// 54ac <I2C_ConfigInterrupt_CMD>
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_RD_REQ);
    5f48:	3120      	movi      	r1, 32
    5f4a:	3001      	movi      	r0, 1
    5f4c:	e3fffab0 	bsr      	0x54ac	// 54ac <I2C_ConfigInterrupt_CMD>
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_RX_FULL);
    5f50:	3104      	movi      	r1, 4
    5f52:	3001      	movi      	r0, 1
    5f54:	e3fffaac 	bsr      	0x54ac	// 54ac <I2C_ConfigInterrupt_CMD>
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_TX_ABRT);
    5f58:	3140      	movi      	r1, 64
    5f5a:	3001      	movi      	r0, 1
    5f5c:	e3fffaa8 	bsr      	0x54ac	// 54ac <I2C_ConfigInterrupt_CMD>
	I2C_Enable();
    5f60:	e3fffabc 	bsr      	0x54d8	// 54d8 <I2C_Enable>
	I2C_Int_Enable();
    5f64:	e3fffad6 	bsr      	0x5510	// 5510 <I2C_Int_Enable>
	
}
    5f68:	1403      	addi      	r14, r14, 12
    5f6a:	1490      	pop      	r15

Disassembly of section .text.UART1_CONFIG:

00005f6c <UART1_CONFIG>:
//UART1  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void UART1_CONFIG(U32_T baudrate)
{
    5f6c:	14d1      	push      	r4, r15
	U32_T br_div = 0;
	
	br_div = SYSCLK / baudrate;
    5f6e:	106c      	lrw      	r3, 0x20000000	// 5f9c <UART1_CONFIG+0x30>
{
    5f70:	6c43      	mov      	r1, r0
	br_div = SYSCLK / baudrate;
    5f72:	9300      	ld.w      	r0, (r3, 0x0)
    5f74:	e00005c8 	bsr      	0x6b04	// 6b04 <__udivsi3>
    5f78:	6d03      	mov      	r4, r0
	
	UART1_DeInit();                                                 //clear all UART Register
    5f7a:	e3fff923 	bsr      	0x51c0	// 51c0 <UART1_DeInit>
    UART_IO_Init(IO_UART1, 0);                                    	//use PA0.13->RXD1, PB0.0->TXD1
    5f7e:	3100      	movi      	r1, 0
    5f80:	3001      	movi      	r0, 1
    5f82:	e3fff95b 	bsr      	0x5238	// 5238 <UART_IO_Init>
    UARTInitRxIntEn(UART1, br_div, UART_PAR_NONE);	                    //baudrate=sysclock/416=115200
    5f86:	1067      	lrw      	r3, 0x20000040	// 5fa0 <UART1_CONFIG+0x34>
    5f88:	7451      	zexth      	r1, r4
    5f8a:	9300      	ld.w      	r0, (r3, 0x0)
    5f8c:	3200      	movi      	r2, 0
    5f8e:	e3fff9c9 	bsr      	0x5320	// 5320 <UARTInitRxIntEn>
	UART1_Int_Enable();
    5f92:	e3fff92f 	bsr      	0x51f0	// 51f0 <UART1_Int_Enable>
	UART1_WakeUp_Enable();
    5f96:	e3fff949 	bsr      	0x5228	// 5228 <UART1_WakeUp_Enable>
}
    5f9a:	1491      	pop      	r4, r15
    5f9c:	20000000 	.long	0x20000000
    5fa0:	20000040 	.long	0x20000040

Disassembly of section .text.fputc:

00005fa4 <fputc>:

/* 重定义fputc函数 */
int fputc(int ch, FILE *f)
{
#if Debug
	while((UART1->SR & 0X1) != 0);
    5fa4:	1065      	lrw      	r3, 0x20000040	// 5fb8 <fputc+0x14>
    5fa6:	3101      	movi      	r1, 1
    5fa8:	9340      	ld.w      	r2, (r3, 0x0)
    5faa:	9261      	ld.w      	r3, (r2, 0x4)
    5fac:	68c4      	and      	r3, r1
    5fae:	3b40      	cmpnei      	r3, 0
    5fb0:	0bfd      	bt      	0x5faa	// 5faa <fputc+0x6>
	UART1->DATA = ch;
    5fb2:	b200      	st.w      	r0, (r2, 0x0)
#endif
	return ch;
}
    5fb4:	783c      	jmp      	r15
    5fb6:	0000      	bkpt
    5fb8:	20000040 	.long	0x20000040

Disassembly of section .text.SYSCON_CONFIG:

00005fbc <SYSCON_CONFIG>:
	2.选择48MHZ HFOSC作为SYSCLK时钟源
	3.HCLK = SYSCLK / HCLK_DIV = 48MHZ / 1 = 48MHZ
	4.PCLK = HCLK / PCLK_DIV =  48MHZ / 1 = 48MHZ
  */
void SYSCON_CONFIG(void)
{
    5fbc:	14d0      	push      	r15
    5fbe:	1421      	subi      	r14, r14, 4
	/* SYSTEM CLK AND PCLK FUNTION */
	SYSCON_RST_VALUE(); /* SYSCON all register clr */
    5fc0:	e3fff4a4 	bsr      	0x4908	// 4908 <SYSCON_RST_VALUE>
	SYSCON_General_CMD(ENABLE,ENDIS_ISOSC); /* 打开ISOSC内部振荡器 */ 
    5fc4:	3101      	movi      	r1, 1
    5fc6:	3001      	movi      	r0, 1
    5fc8:	e3fff4cc 	bsr      	0x4960	// 4960 <SYSCON_General_CMD>
	SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_48M); /* 选择48MHZ HFOSC作为SYSCLK时钟源 */
    5fcc:	3000      	movi      	r0, 0
    5fce:	e3fff51f 	bsr      	0x4a0c	// 4a0c <SYSCON_HFOSC_SELECTE>
	SystemCLK_HCLKDIV_PCLKDIV_Config(SYSCLK_HFOSC, HCLK_DIV_1, PCLK_DIV_1, HFOSC_48M); /* HCLK = 48MHZ，SYSCLK = 48MHZ */
    5fd2:	3180      	movi      	r1, 128
    5fd4:	3308      	movi      	r3, 8
    5fd6:	3200      	movi      	r2, 0
    5fd8:	4121      	lsli      	r1, r1, 1
    5fda:	3002      	movi      	r0, 2
    5fdc:	e3fff4da 	bsr      	0x4990	// 4990 <SystemCLK_HCLKDIV_PCLKDIV_Config>
//------------  WDT FUNTION  --------------------------------/
    SYSCON_IWDCNT_Config(IWDT_TIME_2S,IWDT_INTW_DIV_7);      					//WDT TIME 1s,WDT alarm interrupt time=1s-1s*1/8=0.875S
    5fe0:	3080      	movi      	r0, 128
    5fe2:	3118      	movi      	r1, 24
    5fe4:	4003      	lsli      	r0, r0, 3
    5fe6:	e3fff54f 	bsr      	0x4a84	// 4a84 <SYSCON_IWDCNT_Config>
    SYSCON_WDT_CMD(DISABLE);                                                  	//enable WDT		
    5fea:	3000      	movi      	r0, 0
    5fec:	e3fff524 	bsr      	0x4a34	// 4a34 <SYSCON_WDT_CMD>
    SYSCON_IWDCNT_Reload();                                                   	//reload WDT
    5ff0:	e3fff540 	bsr      	0x4a70	// 4a70 <SYSCON_IWDCNT_Reload>
	//IWDT_Int_Enable();
//------------  WWDT FUNTION  --------------------------------/
	WWDT_CNT_Load(0xFF);
    5ff4:	30ff      	movi      	r0, 255
    5ff6:	e3fff8b7 	bsr      	0x5164	// 5164 <WWDT_CNT_Load>
	WWDT_CONFIG(PCLK_4096_DIV0,0xFF,WWDT_DBGDIS);
    5ffa:	3200      	movi      	r2, 0
    5ffc:	31ff      	movi      	r1, 255
    5ffe:	3000      	movi      	r0, 0
    6000:	e3fff8a6 	bsr      	0x514c	// 514c <WWDT_CONFIG>
	WWDT_Int_Config(DISABLE);
    6004:	3000      	movi      	r0, 0
    6006:	e3fff8b7 	bsr      	0x5174	// 5174 <WWDT_Int_Config>
	//WWDT_CMD(ENABLE);
//------------  CLO  --------------------------------/	
	//SYSCON_CLO_CONFIG(CLO_PA02);
	//SYSCON->OPT1=(SYSCON->OPT1&0XFFFF8000)|(0X01<<12)|(0X04<<8)|(0x00<<4);
//------------  LVD FUNTION  --------------------------------/ 
    SYSCON_LVD_Config(DISABLE_LVDEN,INTDET_LVL_3_3V,RSTDET_LVL_1_9V,DISABLE_LVD_INT,INTDET_POL_fall);   //LVD LVR Enable/Disable
    600a:	3340      	movi      	r3, 64
    600c:	3180      	movi      	r1, 128
    600e:	b860      	st.w      	r3, (r14, 0x0)
    6010:	3200      	movi      	r2, 0
    6012:	3300      	movi      	r3, 0
    6014:	4123      	lsli      	r1, r1, 3
    6016:	300a      	movi      	r0, 10
    6018:	e3fff542 	bsr      	0x4a9c	// 4a9c <SYSCON_LVD_Config>
    //LVD_Int_Enable();
//------------ EVTRG function --------------------------------/ 	
	SYSCON->EVTRG=0X00|0x01<<20;											//SYSCON_trgsrc0
    601c:	1067      	lrw      	r3, 0x2000005c	// 6038 <SYSCON_CONFIG+0x7c>
    601e:	3180      	movi      	r1, 128
    6020:	9340      	ld.w      	r2, (r3, 0x0)
    6022:	3380      	movi      	r3, 128
    6024:	6048      	addu      	r1, r2
    6026:	436d      	lsli      	r3, r3, 13
    6028:	b17d      	st.w      	r3, (r1, 0x74)
	SYSCON->EVPS=0X00;
    602a:	3300      	movi      	r3, 0
    602c:	b17e      	st.w      	r3, (r1, 0x78)
	
	SYSCON->IMER =EM_EVTRG0_ST;
    602e:	3380      	movi      	r3, 128
    6030:	436c      	lsli      	r3, r3, 12
    6032:	b27d      	st.w      	r3, (r2, 0x74)
//------------  SYSCON Vector  --------------------------------/ 	
	//SYSCON_Int_Enable();    														//SYSCON VECTOR
	//SYSCON_WakeUp_Enable();    													//Enable WDT wakeup INT
}
    6034:	1401      	addi      	r14, r14, 4
    6036:	1490      	pop      	r15
    6038:	2000005c 	.long	0x2000005c

Disassembly of section .text.APT32F102_init:

0000603c <APT32F102_init>:
//ReturnValue:NONE                                                                /
/*********************************************************************************/
/*********************************************************************************/  
/*********************************************************************************/
void APT32F102_init(void) 
{
    603c:	14d1      	push      	r4, r15
//------------------------------------------------------------/
//Peripheral clock enable and disable
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON->PCDR0 = 0xFFFFFFF0;
    603e:	1059      	lrw      	r2, 0x2000005c	// 60a0 <APT32F102_init+0x64>
    6040:	3100      	movi      	r1, 0
    6042:	9260      	ld.w      	r3, (r2, 0x0)
    6044:	290f      	subi      	r1, 16
    6046:	b32b      	st.w      	r1, (r3, 0x2c)
	SYSCON->PCDR1 = 0xFFFFFFFF;
    6048:	3100      	movi      	r1, 0
    604a:	2900      	subi      	r1, 1
    604c:	b32e      	st.w      	r1, (r3, 0x38)
	SYSCON->PCER0 = 0x00000691;                                        //PCLK Enable  0x00410071
    604e:	1036      	lrw      	r1, 0x691	// 60a4 <APT32F102_init+0x68>
    6050:	b32a      	st.w      	r1, (r3, 0x28)
    SYSCON->PCER1 = 0x00022A00;                                        //PCLK Enable
    6052:	1036      	lrw      	r1, 0x22a00	// 60a8 <APT32F102_init+0x6c>
    6054:	b32d      	st.w      	r1, (r3, 0x34)
    6056:	6d0b      	mov      	r4, r2
    while(!(SYSCON->PCSR0 & 0x1));                                    //Wait PCLK enabled	
    6058:	3101      	movi      	r1, 1
    605a:	934c      	ld.w      	r2, (r3, 0x30)
    605c:	6884      	and      	r2, r1
    605e:	3a40      	cmpnei      	r2, 0
    6060:	0ffd      	bf      	0x605a	// 605a <APT32F102_init+0x1e>
	
	/* ISOSC/IMOSC/EMOSC/SYSCLK/IWDT/LVD/EM_CMFAIL/EM_CMRCV/CMD_ERR OSC stable interrupt */
    SYSCON_CONFIG(); /* SYSCON initial */
    6062:	e3ffffad 	bsr      	0x5fbc	// 5fbc <SYSCON_CONFIG>
	SYSCON->GCDR |= 0x0B << 12; /* 禁止深度休眠下的ISOSC/IMOSC/EMOSC */
    6066:	9420      	ld.w      	r1, (r4, 0x0)
    6068:	32b0      	movi      	r2, 176
    606a:	9162      	ld.w      	r3, (r1, 0x8)
    606c:	4248      	lsli      	r2, r2, 8
    606e:	6cc8      	or      	r3, r2
    6070:	b162      	st.w      	r3, (r1, 0x8)
	SYSCON_INT_Priority();
    6072:	e3fff5b5 	bsr      	0x4bdc	// 4bdc <SYSCON_INT_Priority>
	CK_CPU_EnAllNormalIrq();                                         //enable all IRQ
    6076:	e000057d 	bsr      	0x6b70	// 6b70 <CK_CPU_EnAllNormalIrq>
	
	UART1_CONFIG(115200); /* uart1用于串口烧录，不要修改它的初始化及中断函数 */ 
    607a:	30e1      	movi      	r0, 225
    607c:	4009      	lsli      	r0, r0, 9
    607e:	e3ffff77 	bsr      	0x5f6c	// 5f6c <UART1_CONFIG>
	
	Coret_Init();
    6082:	e0001477 	bsr      	0x8970	// 8970 <Coret_Init>
	led_hardware_setup();
    6086:	e000059f 	bsr      	0x6bc4	// 6bc4 <led_hardware_setup>
	adc_hardware_setup();
    608a:	e00006d1 	bsr      	0x6e2c	// 6e2c <adc_hardware_setup>
	charging_hardware_setup();
    608e:	e000070b 	bsr      	0x6ea4	// 6ea4 <charging_hardware_setup>
	communicate_hardware_setup(300);
    6092:	3096      	movi      	r0, 150
    6094:	4001      	lsli      	r0, r0, 1
    6096:	e0000785 	bsr      	0x6fa0	// 6fa0 <communicate_hardware_setup>
	LPT_Init();
    609a:	e0000571 	bsr      	0x6b7c	// 6b7c <LPT_Init>

	//IFC_CONFIG();
}
    609e:	1491      	pop      	r4, r15
    60a0:	2000005c 	.long	0x2000005c
    60a4:	00000691 	.long	0x00000691
    60a8:	00022a00 	.long	0x00022a00

Disassembly of section .text.CORETHandler:

000060ac <CORETHandler>:
//CORET Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORETHandler(void) 
{
    60ac:	1460      	nie
    60ae:	1462      	ipush
    // ISR content ...
	CK801->CORET_CVR = 0x0;							// Clear counter and flag
    60b0:	1064      	lrw      	r3, 0x20000064	// 60c0 <CORETHandler+0x14>
    60b2:	3200      	movi      	r2, 0
    60b4:	9360      	ld.w      	r3, (r3, 0x0)
    60b6:	b346      	st.w      	r2, (r3, 0x18)
	nop;
    60b8:	6c03      	mov      	r0, r0
}
    60ba:	1463      	ipop
    60bc:	1461      	nir
    60be:	0000      	bkpt
    60c0:	20000064 	.long	0x20000064

Disassembly of section .text.SYSCONIntHandler:

000060c4 <SYSCONIntHandler>:
//SYSCON Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCONIntHandler(void) 
{
    60c4:	1460      	nie
    60c6:	1462      	ipush
    // ISR content ...
	if((SYSCON->MISR&ISOSC_ST)==ISOSC_ST)
    60c8:	1177      	lrw      	r3, 0x2000005c	// 61a4 <SYSCONIntHandler+0xe0>
    60ca:	3280      	movi      	r2, 128
    60cc:	9360      	ld.w      	r3, (r3, 0x0)
    60ce:	60c8      	addu      	r3, r2
    60d0:	9323      	ld.w      	r1, (r3, 0xc)
    60d2:	3001      	movi      	r0, 1
    60d4:	6840      	and      	r1, r0
    60d6:	3940      	cmpnei      	r1, 0
    60d8:	0c04      	bf      	0x60e0	// 60e0 <SYSCONIntHandler+0x1c>
	{
		SYSCON->ICR = EMOSC_ST;
	} 
	else if((SYSCON->MISR&HFOSC_ST)==HFOSC_ST)
	{
		SYSCON->ICR = HFOSC_ST;
    60da:	b301      	st.w      	r0, (r3, 0x4)
	}
	else if((SYSCON->MISR&CMD_ERR_ST)==CMD_ERR_ST)
	{
		SYSCON->ICR = CMD_ERR_ST;
	}
}
    60dc:	1463      	ipop
    60de:	1461      	nir
	else if((SYSCON->MISR&IMOSC_ST)==IMOSC_ST)
    60e0:	9323      	ld.w      	r1, (r3, 0xc)
    60e2:	3002      	movi      	r0, 2
    60e4:	6840      	and      	r1, r0
    60e6:	3940      	cmpnei      	r1, 0
    60e8:	0bf9      	bt      	0x60da	// 60da <SYSCONIntHandler+0x16>
	else if((SYSCON->MISR&EMOSC_ST)==EMOSC_ST)
    60ea:	9323      	ld.w      	r1, (r3, 0xc)
    60ec:	3008      	movi      	r0, 8
    60ee:	6840      	and      	r1, r0
    60f0:	3940      	cmpnei      	r1, 0
    60f2:	0bf4      	bt      	0x60da	// 60da <SYSCONIntHandler+0x16>
	else if((SYSCON->MISR&HFOSC_ST)==HFOSC_ST)
    60f4:	9323      	ld.w      	r1, (r3, 0xc)
    60f6:	3010      	movi      	r0, 16
    60f8:	6840      	and      	r1, r0
    60fa:	3940      	cmpnei      	r1, 0
    60fc:	0bef      	bt      	0x60da	// 60da <SYSCONIntHandler+0x16>
	else if((SYSCON->MISR&SYSCLK_ST)==SYSCLK_ST)
    60fe:	9323      	ld.w      	r1, (r3, 0xc)
    6100:	6848      	and      	r1, r2
    6102:	3940      	cmpnei      	r1, 0
    6104:	0c03      	bf      	0x610a	// 610a <SYSCONIntHandler+0x46>
		SYSCON->ICR = CMD_ERR_ST;
    6106:	b341      	st.w      	r2, (r3, 0x4)
}
    6108:	07ea      	br      	0x60dc	// 60dc <SYSCONIntHandler+0x18>
	else if((SYSCON->MISR&IWDT_INT_ST)==IWDT_INT_ST)
    610a:	3280      	movi      	r2, 128
    610c:	9323      	ld.w      	r1, (r3, 0xc)
    610e:	4241      	lsli      	r2, r2, 1
    6110:	6848      	and      	r1, r2
    6112:	3940      	cmpnei      	r1, 0
    6114:	0bf9      	bt      	0x6106	// 6106 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&WKI_INT_ST)==WKI_INT_ST)
    6116:	3280      	movi      	r2, 128
    6118:	9323      	ld.w      	r1, (r3, 0xc)
    611a:	4242      	lsli      	r2, r2, 2
    611c:	6848      	and      	r1, r2
    611e:	3940      	cmpnei      	r1, 0
    6120:	0bf3      	bt      	0x6106	// 6106 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&RAMERRINT_ST)==RAMERRINT_ST)
    6122:	3280      	movi      	r2, 128
    6124:	9323      	ld.w      	r1, (r3, 0xc)
    6126:	4243      	lsli      	r2, r2, 3
    6128:	6848      	and      	r1, r2
    612a:	3940      	cmpnei      	r1, 0
    612c:	0bed      	bt      	0x6106	// 6106 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&LVD_INT_ST)==LVD_INT_ST)
    612e:	3280      	movi      	r2, 128
    6130:	9323      	ld.w      	r1, (r3, 0xc)
    6132:	4244      	lsli      	r2, r2, 4
    6134:	6848      	and      	r1, r2
    6136:	3940      	cmpnei      	r1, 0
    6138:	0be7      	bt      	0x6106	// 6106 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&HWD_ERR)==HWD_ERR)
    613a:	3280      	movi      	r2, 128
    613c:	9323      	ld.w      	r1, (r3, 0xc)
    613e:	4245      	lsli      	r2, r2, 5
    6140:	6848      	and      	r1, r2
    6142:	3940      	cmpnei      	r1, 0
    6144:	0be1      	bt      	0x6106	// 6106 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&OPTERR_INT)==OPTERR_INT)
    6146:	3280      	movi      	r2, 128
    6148:	9323      	ld.w      	r1, (r3, 0xc)
    614a:	4247      	lsli      	r2, r2, 7
    614c:	6848      	and      	r1, r2
    614e:	3940      	cmpnei      	r1, 0
    6150:	0bdb      	bt      	0x6106	// 6106 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_CMLST_ST)==EM_CMLST_ST)
    6152:	3280      	movi      	r2, 128
    6154:	9323      	ld.w      	r1, (r3, 0xc)
    6156:	424b      	lsli      	r2, r2, 11
    6158:	6848      	and      	r1, r2
    615a:	3940      	cmpnei      	r1, 0
    615c:	0bd5      	bt      	0x6106	// 6106 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_EVTRG0_ST)==EM_EVTRG0_ST)
    615e:	3280      	movi      	r2, 128
    6160:	9323      	ld.w      	r1, (r3, 0xc)
    6162:	424c      	lsli      	r2, r2, 12
    6164:	6848      	and      	r1, r2
    6166:	3940      	cmpnei      	r1, 0
    6168:	0c04      	bf      	0x6170	// 6170 <SYSCONIntHandler+0xac>
		SYSCON->ICR = EM_EVTRG0_ST;
    616a:	b341      	st.w      	r2, (r3, 0x4)
		nop;
    616c:	6c03      	mov      	r0, r0
    616e:	07b7      	br      	0x60dc	// 60dc <SYSCONIntHandler+0x18>
	else if((SYSCON->MISR&EM_EVTRG1_ST)==EM_EVTRG1_ST)
    6170:	3280      	movi      	r2, 128
    6172:	9323      	ld.w      	r1, (r3, 0xc)
    6174:	424d      	lsli      	r2, r2, 13
    6176:	6848      	and      	r1, r2
    6178:	3940      	cmpnei      	r1, 0
    617a:	0bc6      	bt      	0x6106	// 6106 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_EVTRG2_ST)==EM_EVTRG2_ST)
    617c:	3280      	movi      	r2, 128
    617e:	9323      	ld.w      	r1, (r3, 0xc)
    6180:	424e      	lsli      	r2, r2, 14
    6182:	6848      	and      	r1, r2
    6184:	3940      	cmpnei      	r1, 0
    6186:	0bc0      	bt      	0x6106	// 6106 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_EVTRG3_ST)==EM_EVTRG3_ST)
    6188:	3280      	movi      	r2, 128
    618a:	9323      	ld.w      	r1, (r3, 0xc)
    618c:	424f      	lsli      	r2, r2, 15
    618e:	6848      	and      	r1, r2
    6190:	3940      	cmpnei      	r1, 0
    6192:	0bba      	bt      	0x6106	// 6106 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&CMD_ERR_ST)==CMD_ERR_ST)
    6194:	3280      	movi      	r2, 128
    6196:	9323      	ld.w      	r1, (r3, 0xc)
    6198:	4256      	lsli      	r2, r2, 22
    619a:	6848      	and      	r1, r2
    619c:	3940      	cmpnei      	r1, 0
    619e:	0bb4      	bt      	0x6106	// 6106 <SYSCONIntHandler+0x42>
    61a0:	079e      	br      	0x60dc	// 60dc <SYSCONIntHandler+0x18>
    61a2:	0000      	bkpt
    61a4:	2000005c 	.long	0x2000005c

Disassembly of section .text.IFCIntHandler:

000061a8 <IFCIntHandler>:
//IFC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void IFCIntHandler(void) 
{
    61a8:	1460      	nie
    61aa:	1462      	ipush
    61ac:	14c1      	push      	r4
    // ISR content ...
	//并行写模式
	if(IFC->MISR&ERS_END_INT)			//擦除指令完成
    61ae:	1174      	lrw      	r3, 0x20000060	// 627c <IFCIntHandler+0xd4>
    61b0:	3101      	movi      	r1, 1
    61b2:	9360      	ld.w      	r3, (r3, 0x0)
    61b4:	934b      	ld.w      	r2, (r3, 0x2c)
    61b6:	6884      	and      	r2, r1
    61b8:	3a40      	cmpnei      	r2, 0
    61ba:	0c18      	bf      	0x61ea	// 61ea <IFCIntHandler+0x42>
	{
		IFC->ICR=ERS_END_INT;
    61bc:	b32c      	st.w      	r1, (r3, 0x30)
		if((ifc_step==1)&&(f_Drom_writing==1))
    61be:	1131      	lrw      	r1, 0x200002d8	// 6280 <IFCIntHandler+0xd8>
    61c0:	8140      	ld.b      	r2, (r1, 0x0)
    61c2:	3a41      	cmpnei      	r2, 1
    61c4:	080f      	bt      	0x61e2	// 61e2 <IFCIntHandler+0x3a>
    61c6:	1150      	lrw      	r2, 0x2000021d	// 6284 <IFCIntHandler+0xdc>
    61c8:	8240      	ld.b      	r2, (r2, 0x0)
    61ca:	7488      	zextb      	r2, r2
    61cc:	3a41      	cmpnei      	r2, 1
    61ce:	080a      	bt      	0x61e2	// 61e2 <IFCIntHandler+0x3a>
		{
			SetUserKey;
    61d0:	110e      	lrw      	r0, 0x5a5a5a5a	// 6288 <IFCIntHandler+0xe0>
    61d2:	b308      	st.w      	r0, (r3, 0x20)
			IFC->CMR=0x01;					//将页缓存的数据写入闪存中
    61d4:	b343      	st.w      	r2, (r3, 0xc)
			IFC->FM_ADDR=R_INT_FlashAdd;		//
    61d6:	110e      	lrw      	r0, 0x200002d4	// 628c <IFCIntHandler+0xe4>
    61d8:	9000      	ld.w      	r0, (r0, 0x0)
    61da:	b306      	st.w      	r0, (r3, 0x18)
			IFC->CR=0X01;					//Start Program
    61dc:	b344      	st.w      	r2, (r3, 0x10)
			ifc_step=2;
    61de:	3302      	movi      	r3, 2
    61e0:	a160      	st.b      	r3, (r1, 0x0)
	}
	else if(IFC->MISR&OVW_ERR_INT)		//非法操作错误中断
	{
		IFC->ICR=OVW_ERR_INT;
	}
}
    61e2:	9880      	ld.w      	r4, (r14, 0x0)
    61e4:	1401      	addi      	r14, r14, 4
    61e6:	1463      	ipop
    61e8:	1461      	nir
	else if(IFC->MISR&RGM_END_INT)		//编译指令完成
    61ea:	934b      	ld.w      	r2, (r3, 0x2c)
    61ec:	3102      	movi      	r1, 2
    61ee:	6884      	and      	r2, r1
    61f0:	3a40      	cmpnei      	r2, 0
    61f2:	0c10      	bf      	0x6212	// 6212 <IFCIntHandler+0x6a>
		IFC->ICR=RGM_END_INT;
    61f4:	b32c      	st.w      	r1, (r3, 0x30)
		if((ifc_step==2)&&(f_Drom_writing==1))
    61f6:	1163      	lrw      	r3, 0x200002d8	// 6280 <IFCIntHandler+0xd8>
    61f8:	8360      	ld.b      	r3, (r3, 0x0)
    61fa:	3b42      	cmpnei      	r3, 2
    61fc:	0bf3      	bt      	0x61e2	// 61e2 <IFCIntHandler+0x3a>
    61fe:	1162      	lrw      	r3, 0x2000021d	// 6284 <IFCIntHandler+0xdc>
    6200:	8340      	ld.b      	r2, (r3, 0x0)
    6202:	3a41      	cmpnei      	r2, 1
    6204:	0bef      	bt      	0x61e2	// 61e2 <IFCIntHandler+0x3a>
			f_Drom_writing=0;
    6206:	3200      	movi      	r2, 0
    6208:	a340      	st.b      	r2, (r3, 0x0)
			f_Drom_write_complete=1;
    620a:	3201      	movi      	r2, 1
    620c:	1161      	lrw      	r3, 0x2000021e	// 6290 <IFCIntHandler+0xe8>
    620e:	a340      	st.b      	r2, (r3, 0x0)
    6210:	07e9      	br      	0x61e2	// 61e2 <IFCIntHandler+0x3a>
	else if(IFC->MISR&PEP_END_INT)		//预编程指令完成
    6212:	934b      	ld.w      	r2, (r3, 0x2c)
    6214:	3004      	movi      	r0, 4
    6216:	6880      	and      	r2, r0
    6218:	3a40      	cmpnei      	r2, 0
    621a:	0c15      	bf      	0x6244	// 6244 <IFCIntHandler+0x9c>
		IFC->ICR=PEP_END_INT;
    621c:	b30c      	st.w      	r0, (r3, 0x30)
		if((ifc_step==0)&&(f_Drom_writing==1))
    621e:	1019      	lrw      	r0, 0x200002d8	// 6280 <IFCIntHandler+0xd8>
    6220:	8040      	ld.b      	r2, (r0, 0x0)
    6222:	3a40      	cmpnei      	r2, 0
    6224:	0bdf      	bt      	0x61e2	// 61e2 <IFCIntHandler+0x3a>
    6226:	1058      	lrw      	r2, 0x2000021d	// 6284 <IFCIntHandler+0xdc>
    6228:	8240      	ld.b      	r2, (r2, 0x0)
    622a:	7488      	zextb      	r2, r2
    622c:	3a41      	cmpnei      	r2, 1
    622e:	0bda      	bt      	0x61e2	// 61e2 <IFCIntHandler+0x3a>
			SetUserKey;
    6230:	1096      	lrw      	r4, 0x5a5a5a5a	// 6288 <IFCIntHandler+0xe0>
    6232:	b388      	st.w      	r4, (r3, 0x20)
			IFC->CMR=0x02;					//页擦除
    6234:	b323      	st.w      	r1, (r3, 0xc)
			IFC->FM_ADDR=R_INT_FlashAdd;			//
    6236:	1036      	lrw      	r1, 0x200002d4	// 628c <IFCIntHandler+0xe4>
    6238:	9120      	ld.w      	r1, (r1, 0x0)
    623a:	b326      	st.w      	r1, (r3, 0x18)
			IFC->CR=0X01;					//Start Program
    623c:	b344      	st.w      	r2, (r3, 0x10)
			ifc_step=1;
    623e:	3301      	movi      	r3, 1
    6240:	a060      	st.b      	r3, (r0, 0x0)
    6242:	07d0      	br      	0x61e2	// 61e2 <IFCIntHandler+0x3a>
	else if(IFC->MISR&PROT_ERR_INT)		//保护错误中断
    6244:	3280      	movi      	r2, 128
    6246:	932b      	ld.w      	r1, (r3, 0x2c)
    6248:	4245      	lsli      	r2, r2, 5
    624a:	6848      	and      	r1, r2
    624c:	3940      	cmpnei      	r1, 0
    624e:	0c03      	bf      	0x6254	// 6254 <IFCIntHandler+0xac>
		IFC->ICR=OVW_ERR_INT;
    6250:	b34c      	st.w      	r2, (r3, 0x30)
}
    6252:	07c8      	br      	0x61e2	// 61e2 <IFCIntHandler+0x3a>
	else if(IFC->MISR&UDEF_ERR_INT)		//未定义指令错误中断
    6254:	3280      	movi      	r2, 128
    6256:	932b      	ld.w      	r1, (r3, 0x2c)
    6258:	4246      	lsli      	r2, r2, 6
    625a:	6848      	and      	r1, r2
    625c:	3940      	cmpnei      	r1, 0
    625e:	0bf9      	bt      	0x6250	// 6250 <IFCIntHandler+0xa8>
	else if(IFC->MISR&ADDR_ERR_INT)		//地址错误中断
    6260:	3280      	movi      	r2, 128
    6262:	932b      	ld.w      	r1, (r3, 0x2c)
    6264:	4247      	lsli      	r2, r2, 7
    6266:	6848      	and      	r1, r2
    6268:	3940      	cmpnei      	r1, 0
    626a:	0bf3      	bt      	0x6250	// 6250 <IFCIntHandler+0xa8>
	else if(IFC->MISR&OVW_ERR_INT)		//非法操作错误中断
    626c:	3280      	movi      	r2, 128
    626e:	932b      	ld.w      	r1, (r3, 0x2c)
    6270:	4248      	lsli      	r2, r2, 8
    6272:	6848      	and      	r1, r2
    6274:	3940      	cmpnei      	r1, 0
    6276:	0bed      	bt      	0x6250	// 6250 <IFCIntHandler+0xa8>
    6278:	07b5      	br      	0x61e2	// 61e2 <IFCIntHandler+0x3a>
    627a:	0000      	bkpt
    627c:	20000060 	.long	0x20000060
    6280:	200002d8 	.long	0x200002d8
    6284:	2000021d 	.long	0x2000021d
    6288:	5a5a5a5a 	.long	0x5a5a5a5a
    628c:	200002d4 	.long	0x200002d4
    6290:	2000021e 	.long	0x2000021e

Disassembly of section .text.BT0IntHandler:

00006294 <BT0IntHandler>:
    // ISR content ...
}

/* BT0 Interrupt */
void BT0IntHandler(void) 
{
    6294:	1460      	nie
    6296:	1462      	ipush
    6298:	14d0      	push      	r15
	if((BT0->MISR & BT_PEND) == BT_PEND)
    629a:	116d      	lrw      	r3, 0x20000010	// 634c <BT0IntHandler+0xb8>
    629c:	3201      	movi      	r2, 1
    629e:	9300      	ld.w      	r0, (r3, 0x0)
    62a0:	906c      	ld.w      	r3, (r0, 0x30)
    62a2:	68c8      	and      	r3, r2
    62a4:	3b40      	cmpnei      	r3, 0
    62a6:	0c40      	bf      	0x6326	// 6326 <BT0IntHandler+0x92>
	{
		BT0->ICR = BT_PEND;
    62a8:	b04d      	st.w      	r2, (r0, 0x34)

		static uint8_t flag = 0;
		static uint8_t invert = 0;
		static uint8_t cnt = 0;
	
		if(BT0->CMP == 0 && invert == 0)
    62aa:	9064      	ld.w      	r3, (r0, 0x10)
    62ac:	3b40      	cmpnei      	r3, 0
    62ae:	1169      	lrw      	r3, 0x2000021f	// 6350 <BT0IntHandler+0xbc>
    62b0:	0815      	bt      	0x62da	// 62da <BT0IntHandler+0x46>
    62b2:	8340      	ld.b      	r2, (r3, 0x0)
    62b4:	3a40      	cmpnei      	r2, 0
    62b6:	0812      	bt      	0x62da	// 62da <BT0IntHandler+0x46>
		{
			flag = 1;
    62b8:	3201      	movi      	r2, 1
    62ba:	a341      	st.b      	r2, (r3, 0x1)
			invert = 1;
    62bc:	a340      	st.b      	r2, (r3, 0x0)
#ifdef DRIVER_LED_DEBUG
			printf("flag=%u\r\n", flag);
#endif

		}
		if(cnt == 1)
    62be:	8342      	ld.b      	r2, (r3, 0x2)
    62c0:	3a41      	cmpnei      	r2, 1
    62c2:	081a      	bt      	0x62f6	// 62f6 <BT0IntHandler+0x62>
		{
			flag = 0;
    62c4:	3200      	movi      	r2, 0
    62c6:	a341      	st.b      	r2, (r3, 0x1)
			invert = 0;
    62c8:	a340      	st.b      	r2, (r3, 0x0)
			cnt = 0;
    62ca:	a342      	st.b      	r2, (r3, 0x2)
			BT_Stop(BT0);
    62cc:	e3fff76e 	bsr      	0x51a8	// 51a8 <BT_Stop>
	} 
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)
	{
		BT0->ICR = BT_EVTRG;
	} 
}
    62d0:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    62d4:	1401      	addi      	r14, r14, 4
    62d6:	1463      	ipop
    62d8:	1461      	nir
		}else if(BT0->CMP == 199 && invert == 1)
    62da:	9024      	ld.w      	r1, (r0, 0x10)
    62dc:	32c7      	movi      	r2, 199
    62de:	6486      	cmpne      	r1, r2
    62e0:	0bef      	bt      	0x62be	// 62be <BT0IntHandler+0x2a>
    62e2:	8340      	ld.b      	r2, (r3, 0x0)
    62e4:	3a41      	cmpnei      	r2, 1
    62e6:	0bec      	bt      	0x62be	// 62be <BT0IntHandler+0x2a>
			flag = 0;
    62e8:	3200      	movi      	r2, 0
    62ea:	a341      	st.b      	r2, (r3, 0x1)
			invert = 0;
    62ec:	a340      	st.b      	r2, (r3, 0x0)
			cnt++; /* 完成一次呼吸灯 */
    62ee:	8342      	ld.b      	r2, (r3, 0x2)
    62f0:	2200      	addi      	r2, 1
    62f2:	a342      	st.b      	r2, (r3, 0x2)
    62f4:	07e5      	br      	0x62be	// 62be <BT0IntHandler+0x2a>
		if(flag == 0) /* 暗到亮 */
    62f6:	8361      	ld.b      	r3, (r3, 0x1)
    62f8:	3b40      	cmpnei      	r3, 0
    62fa:	080b      	bt      	0x6310	// 6310 <BT0IntHandler+0x7c>
			if(BT0->CMP == 199)
    62fc:	9044      	ld.w      	r2, (r0, 0x10)
    62fe:	33c7      	movi      	r3, 199
    6300:	64ca      	cmpne      	r2, r3
				BT0->CMP -= 3; return;
    6302:	9064      	ld.w      	r3, (r0, 0x10)
			if(BT0->CMP == 199)
    6304:	0804      	bt      	0x630c	// 630c <BT0IntHandler+0x78>
				BT0->CMP -= 3; return;
    6306:	2b02      	subi      	r3, 3
			BT0->CMP -= 4;
    6308:	b064      	st.w      	r3, (r0, 0x10)
    630a:	07e3      	br      	0x62d0	// 62d0 <BT0IntHandler+0x3c>
    630c:	2b03      	subi      	r3, 4
    630e:	07fd      	br      	0x6308	// 6308 <BT0IntHandler+0x74>
		else if(flag == 1) /* 亮到暗 */
    6310:	3b41      	cmpnei      	r3, 1
    6312:	0bdf      	bt      	0x62d0	// 62d0 <BT0IntHandler+0x3c>
			if(BT0->CMP == 196)
    6314:	9044      	ld.w      	r2, (r0, 0x10)
    6316:	33c4      	movi      	r3, 196
    6318:	64ca      	cmpne      	r2, r3
				BT0->CMP += 3; return;
    631a:	9064      	ld.w      	r3, (r0, 0x10)
			if(BT0->CMP == 196)
    631c:	0803      	bt      	0x6322	// 6322 <BT0IntHandler+0x8e>
				BT0->CMP += 3; return;
    631e:	2302      	addi      	r3, 3
    6320:	07f4      	br      	0x6308	// 6308 <BT0IntHandler+0x74>
			BT0->CMP += 4;
    6322:	2303      	addi      	r3, 4
    6324:	07f2      	br      	0x6308	// 6308 <BT0IntHandler+0x74>
	else if((BT0->MISR&BT_CMP)==BT_CMP)
    6326:	906c      	ld.w      	r3, (r0, 0x30)
    6328:	3202      	movi      	r2, 2
    632a:	68c8      	and      	r3, r2
    632c:	3b40      	cmpnei      	r3, 0
    632e:	0c03      	bf      	0x6334	// 6334 <BT0IntHandler+0xa0>
		BT0->ICR = BT_EVTRG;
    6330:	b04d      	st.w      	r2, (r0, 0x34)
    6332:	07cf      	br      	0x62d0	// 62d0 <BT0IntHandler+0x3c>
	else if((BT0->MISR&BT_OVF)==BT_OVF)
    6334:	906c      	ld.w      	r3, (r0, 0x30)
    6336:	3204      	movi      	r2, 4
    6338:	68c8      	and      	r3, r2
    633a:	3b40      	cmpnei      	r3, 0
    633c:	0bfa      	bt      	0x6330	// 6330 <BT0IntHandler+0x9c>
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)
    633e:	906c      	ld.w      	r3, (r0, 0x30)
    6340:	3208      	movi      	r2, 8
    6342:	68c8      	and      	r3, r2
    6344:	3b40      	cmpnei      	r3, 0
    6346:	0bf5      	bt      	0x6330	// 6330 <BT0IntHandler+0x9c>
    6348:	07c4      	br      	0x62d0	// 62d0 <BT0IntHandler+0x3c>
    634a:	0000      	bkpt
    634c:	20000010 	.long	0x20000010
    6350:	2000021f 	.long	0x2000021f

Disassembly of section .text.GPT0IntHandler:

00006354 <GPT0IntHandler>:

/* GPT0 Interrupt */
void GPT0IntHandler(void) 
{
    6354:	1460      	nie
    6356:	1462      	ipush
    6358:	14d1      	push      	r4, r15
	if((GPT0->MISR & GPT_INT_PEND) == GPT_INT_PEND)
    635a:	1271      	lrw      	r3, 0x20000028	// 649c <GPT0IntHandler+0x148>
    635c:	3080      	movi      	r0, 128
    635e:	9340      	ld.w      	r2, (r3, 0x0)
    6360:	5a60      	addu      	r3, r2, r0
    6362:	3180      	movi      	r1, 128
    6364:	9395      	ld.w      	r4, (r3, 0x54)
    6366:	4129      	lsli      	r1, r1, 9
    6368:	6904      	and      	r4, r1
    636a:	3c40      	cmpnei      	r4, 0
    636c:	0c50      	bf      	0x640c	// 640c <GPT0IntHandler+0xb8>
	{
		GPT0->ICR = GPT_INT_PEND;
    636e:	b337      	st.w      	r1, (r3, 0x5c)
		
		static U8_T flag = 0;
		static U8_T BreathCnt = 0;
		static U8_T SoildTime = 0;
		
		if((GPT0->CMPA == 0) && (SoildTime == 25)) flag = 1;
    6370:	926b      	ld.w      	r3, (r2, 0x2c)
    6372:	3b40      	cmpnei      	r3, 0
    6374:	126b      	lrw      	r3, 0x2000021f	// 64a0 <GPT0IntHandler+0x14c>
    6376:	0815      	bt      	0x63a0	// 63a0 <GPT0IntHandler+0x4c>
    6378:	8323      	ld.b      	r1, (r3, 0x3)
    637a:	3959      	cmpnei      	r1, 25
    637c:	0812      	bt      	0x63a0	// 63a0 <GPT0IntHandler+0x4c>
    637e:	3101      	movi      	r1, 1
    6380:	a324      	st.b      	r1, (r3, 0x4)
		{
			flag = 0;
			BreathCnt = 0;
			SoildTime = 0;
		}	
		if(flag == 0)  /* 暗到亮 */
    6382:	8324      	ld.b      	r1, (r3, 0x4)
    6384:	3940      	cmpnei      	r1, 0
    6386:	0825      	bt      	0x63d0	// 63d0 <GPT0IntHandler+0x7c>
		{
			if(GPT0->CMPA == 0) SoildTime++; /* 亮0.5秒后变暗 */
    6388:	922b      	ld.w      	r1, (r2, 0x2c)
    638a:	3940      	cmpnei      	r1, 0
    638c:	0813      	bt      	0x63b2	// 63b2 <GPT0IntHandler+0x5e>
    638e:	8343      	ld.b      	r2, (r3, 0x3)
    6390:	2200      	addi      	r2, 1
    6392:	a343      	st.b      	r2, (r3, 0x3)
	}
	else if((GPT0->MISR & GPT_INT_CBD) == GPT_INT_CBD)
	{
		GPT0->ICR = GPT_INT_CBD;
	}
}
    6394:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    6398:	9880      	ld.w      	r4, (r14, 0x0)
    639a:	1402      	addi      	r14, r14, 8
    639c:	1463      	ipop
    639e:	1461      	nir
		else if(GPT0->CMPA == 200) 
    63a0:	920b      	ld.w      	r0, (r2, 0x2c)
    63a2:	31c8      	movi      	r1, 200
    63a4:	6442      	cmpne      	r0, r1
    63a6:	0bee      	bt      	0x6382	// 6382 <GPT0IntHandler+0x2e>
			flag = 0;
    63a8:	3100      	movi      	r1, 0
    63aa:	a324      	st.b      	r1, (r3, 0x4)
			BreathCnt = 0;
    63ac:	a325      	st.b      	r1, (r3, 0x5)
			SoildTime = 0;
    63ae:	a323      	st.b      	r1, (r3, 0x3)
    63b0:	07e9      	br      	0x6382	// 6382 <GPT0IntHandler+0x2e>
				if(GPT0->CMPA > 56) GPT0->CMPA -= 12; 
    63b2:	922b      	ld.w      	r1, (r2, 0x2c)
    63b4:	3338      	movi      	r3, 56
    63b6:	644c      	cmphs      	r3, r1
    63b8:	926b      	ld.w      	r3, (r2, 0x2c)
    63ba:	0804      	bt      	0x63c2	// 63c2 <GPT0IntHandler+0x6e>
    63bc:	2b0b      	subi      	r3, 12
				else if(GPT0->CMPA > 8) GPT0->CMPA -= 4; 
    63be:	b26b      	st.w      	r3, (r2, 0x2c)
    63c0:	07ea      	br      	0x6394	// 6394 <GPT0IntHandler+0x40>
    63c2:	3b08      	cmphsi      	r3, 9
    63c4:	926b      	ld.w      	r3, (r2, 0x2c)
    63c6:	0c03      	bf      	0x63cc	// 63cc <GPT0IntHandler+0x78>
    63c8:	2b03      	subi      	r3, 4
    63ca:	07fa      	br      	0x63be	// 63be <GPT0IntHandler+0x6a>
				else GPT0->CMPA -= 8; 
    63cc:	2b07      	subi      	r3, 8
    63ce:	07f8      	br      	0x63be	// 63be <GPT0IntHandler+0x6a>
		else if(flag == 1) /* 亮到暗 */
    63d0:	3941      	cmpnei      	r1, 1
    63d2:	0be1      	bt      	0x6394	// 6394 <GPT0IntHandler+0x40>
			if(GPT0->CMPA == 192) BreathCnt++; /* 完成一次呼吸灯 */
    63d4:	920b      	ld.w      	r0, (r2, 0x2c)
    63d6:	31c0      	movi      	r1, 192
    63d8:	6442      	cmpne      	r0, r1
    63da:	080a      	bt      	0x63ee	// 63ee <GPT0IntHandler+0x9a>
    63dc:	8345      	ld.b      	r2, (r3, 0x5)
    63de:	2200      	addi      	r2, 1
    63e0:	a345      	st.b      	r2, (r3, 0x5)
			if(BreathCnt == 1)
    63e2:	8365      	ld.b      	r3, (r3, 0x5)
    63e4:	3b41      	cmpnei      	r3, 1
    63e6:	0bd7      	bt      	0x6394	// 6394 <GPT0IntHandler+0x40>
				GPT_Stop();
    63e8:	e3fff6e4 	bsr      	0x51b0	// 51b0 <GPT_Stop>
				return;
    63ec:	07d4      	br      	0x6394	// 6394 <GPT0IntHandler+0x40>
				if(GPT0->CMPA < 144) GPT0->CMPA += 12;
    63ee:	920b      	ld.w      	r0, (r2, 0x2c)
    63f0:	318f      	movi      	r1, 143
    63f2:	6404      	cmphs      	r1, r0
    63f4:	0c05      	bf      	0x63fe	// 63fe <GPT0IntHandler+0xaa>
    63f6:	922b      	ld.w      	r1, (r2, 0x2c)
    63f8:	210b      	addi      	r1, 12
				else if(GPT0->CMPA < 192) GPT0->CMPA += 4;
    63fa:	b22b      	st.w      	r1, (r2, 0x2c)
    63fc:	07f3      	br      	0x63e2	// 63e2 <GPT0IntHandler+0x8e>
    63fe:	920b      	ld.w      	r0, (r2, 0x2c)
    6400:	31bf      	movi      	r1, 191
    6402:	6404      	cmphs      	r1, r0
    6404:	0fef      	bf      	0x63e2	// 63e2 <GPT0IntHandler+0x8e>
    6406:	922b      	ld.w      	r1, (r2, 0x2c)
    6408:	2103      	addi      	r1, 4
    640a:	07f8      	br      	0x63fa	// 63fa <GPT0IntHandler+0xa6>
	else if((GPT0->MISR & GPT_INT_TRGEV0) == GPT_INT_TRGEV0)
    640c:	9335      	ld.w      	r1, (r3, 0x54)
    640e:	3201      	movi      	r2, 1
    6410:	6848      	and      	r1, r2
    6412:	3940      	cmpnei      	r1, 0
    6414:	0c03      	bf      	0x641a	// 641a <GPT0IntHandler+0xc6>
		GPT0->ICR = GPT_INT_CBD;
    6416:	b357      	st.w      	r2, (r3, 0x5c)
    6418:	07be      	br      	0x6394	// 6394 <GPT0IntHandler+0x40>
	else if((GPT0->MISR & GPT_INT_TRGEV1) == GPT_INT_TRGEV1)
    641a:	9335      	ld.w      	r1, (r3, 0x54)
    641c:	3402      	movi      	r4, 2
    641e:	6850      	and      	r1, r4
    6420:	3940      	cmpnei      	r1, 0
    6422:	0c03      	bf      	0x6428	// 6428 <GPT0IntHandler+0xd4>
		GPT0->ICR = GPT_INT_TRGEV1;
    6424:	b397      	st.w      	r4, (r3, 0x5c)
    6426:	07b7      	br      	0x6394	// 6394 <GPT0IntHandler+0x40>
	else if((GPT0->MISR & GPT_INT_TRGEV2) == GPT_INT_TRGEV2)
    6428:	9335      	ld.w      	r1, (r3, 0x54)
    642a:	3404      	movi      	r4, 4
    642c:	6850      	and      	r1, r4
    642e:	3940      	cmpnei      	r1, 0
    6430:	0bf3      	bt      	0x6416	// 6416 <GPT0IntHandler+0xc2>
	else if((GPT0->MISR & GPT_TRGEV3) == GPT_INT_TRGEV3)
    6432:	9355      	ld.w      	r2, (r3, 0x54)
    6434:	3108      	movi      	r1, 8
    6436:	6884      	and      	r2, r1
    6438:	3a40      	cmpnei      	r2, 0
    643a:	0c03      	bf      	0x6440	// 6440 <GPT0IntHandler+0xec>
		GPT0->ICR = GPT_INT_CAPLD2;
    643c:	b337      	st.w      	r1, (r3, 0x5c)
    643e:	07ab      	br      	0x6394	// 6394 <GPT0IntHandler+0x40>
	else if((GPT0->MISR & GPT_INT_CAPLD0) == GPT_INT_CAPLD0)
    6440:	9355      	ld.w      	r2, (r3, 0x54)
    6442:	3110      	movi      	r1, 16
    6444:	6884      	and      	r2, r1
    6446:	3a40      	cmpnei      	r2, 0
    6448:	0bfa      	bt      	0x643c	// 643c <GPT0IntHandler+0xe8>
	else if((GPT0->MISR & GPT_INT_CAPLD1) == GPT_INT_CAPLD1)
    644a:	9355      	ld.w      	r2, (r3, 0x54)
    644c:	3120      	movi      	r1, 32
    644e:	6884      	and      	r2, r1
    6450:	3a40      	cmpnei      	r2, 0
    6452:	0bf5      	bt      	0x643c	// 643c <GPT0IntHandler+0xe8>
	else if((GPT0->MISR & GPT_INT_CAPLD2) == GPT_INT_CAPLD2)
    6454:	9355      	ld.w      	r2, (r3, 0x54)
    6456:	3140      	movi      	r1, 64
    6458:	6884      	and      	r2, r1
    645a:	3a40      	cmpnei      	r2, 0
    645c:	0bf0      	bt      	0x643c	// 643c <GPT0IntHandler+0xe8>
	else if((GPT0->MISR & GPT_INT_CAPLD3) == GPT_INT_CAPLD3)
    645e:	9355      	ld.w      	r2, (r3, 0x54)
    6460:	6880      	and      	r2, r0
    6462:	3a40      	cmpnei      	r2, 0
    6464:	0c03      	bf      	0x646a	// 646a <GPT0IntHandler+0x116>
		GPT0->ICR = GPT_INT_CAPLD3;
    6466:	b317      	st.w      	r0, (r3, 0x5c)
    6468:	0796      	br      	0x6394	// 6394 <GPT0IntHandler+0x40>
	else if((GPT0->MISR & GPT_INT_CAU) == GPT_INT_CAU)
    646a:	3280      	movi      	r2, 128
    646c:	9335      	ld.w      	r1, (r3, 0x54)
    646e:	4241      	lsli      	r2, r2, 1
    6470:	6848      	and      	r1, r2
    6472:	3940      	cmpnei      	r1, 0
    6474:	0bd1      	bt      	0x6416	// 6416 <GPT0IntHandler+0xc2>
	else if((GPT0->MISR & GPT_INT_CAD) == GPT_INT_CAD)
    6476:	3280      	movi      	r2, 128
    6478:	9335      	ld.w      	r1, (r3, 0x54)
    647a:	4242      	lsli      	r2, r2, 2
    647c:	6848      	and      	r1, r2
    647e:	3940      	cmpnei      	r1, 0
    6480:	0bcb      	bt      	0x6416	// 6416 <GPT0IntHandler+0xc2>
	else if((GPT0->MISR & GPT_INT_CBU) == GPT_INT_CBU)
    6482:	3280      	movi      	r2, 128
    6484:	9335      	ld.w      	r1, (r3, 0x54)
    6486:	4243      	lsli      	r2, r2, 3
    6488:	6848      	and      	r1, r2
    648a:	3940      	cmpnei      	r1, 0
    648c:	0bc5      	bt      	0x6416	// 6416 <GPT0IntHandler+0xc2>
	else if((GPT0->MISR & GPT_INT_CBD) == GPT_INT_CBD)
    648e:	3280      	movi      	r2, 128
    6490:	9335      	ld.w      	r1, (r3, 0x54)
    6492:	4244      	lsli      	r2, r2, 4
    6494:	6848      	and      	r1, r2
    6496:	3940      	cmpnei      	r1, 0
    6498:	0bbf      	bt      	0x6416	// 6416 <GPT0IntHandler+0xc2>
    649a:	077d      	br      	0x6394	// 6394 <GPT0IntHandler+0x40>
    649c:	20000028 	.long	0x20000028
    64a0:	2000021f 	.long	0x2000021f

Disassembly of section .text.WWDTHandler:

000064a4 <WWDTHandler>:
//WWDT Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void WWDTHandler(void)
{
    64a4:	1460      	nie
    64a6:	1462      	ipush
    64a8:	14d3      	push      	r4-r6, r15
	WWDT->ICR=0X01;
    64aa:	10b0      	lrw      	r5, 0x20000014	// 64e8 <WWDTHandler+0x44>
    64ac:	3401      	movi      	r4, 1
    64ae:	9560      	ld.w      	r3, (r5, 0x0)
    64b0:	b385      	st.w      	r4, (r3, 0x14)
	WWDT_CNT_Load(0xFF);
    64b2:	30ff      	movi      	r0, 255
	GPIO_Init(GPIOA0,4,0);
    64b4:	10ce      	lrw      	r6, 0x20000050	// 64ec <WWDTHandler+0x48>
	WWDT_CNT_Load(0xFF);
    64b6:	e3fff657 	bsr      	0x5164	// 5164 <WWDT_CNT_Load>
	GPIO_Init(GPIOA0,4,0);
    64ba:	3200      	movi      	r2, 0
    64bc:	3104      	movi      	r1, 4
    64be:	9600      	ld.w      	r0, (r6, 0x0)
    64c0:	e3fff3e0 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Reverse(GPIOA0,4);
    64c4:	9600      	ld.w      	r0, (r6, 0x0)
    64c6:	3104      	movi      	r1, 4
    64c8:	e3fff5cc 	bsr      	0x5060	// 5060 <GPIO_Reverse>
	
	if((WWDT->MISR&WWDT_EVI)==WWDT_EVI)
    64cc:	9540      	ld.w      	r2, (r5, 0x0)
    64ce:	9263      	ld.w      	r3, (r2, 0xc)
    64d0:	68d0      	and      	r3, r4
    64d2:	3b40      	cmpnei      	r3, 0
    64d4:	0c02      	bf      	0x64d8	// 64d8 <WWDTHandler+0x34>
	{
		WWDT->ICR = WWDT_EVI;
    64d6:	b285      	st.w      	r4, (r2, 0x14)
	} 
}
    64d8:	d9ee2003 	ld.w      	r15, (r14, 0xc)
    64dc:	98c2      	ld.w      	r6, (r14, 0x8)
    64de:	98a1      	ld.w      	r5, (r14, 0x4)
    64e0:	9880      	ld.w      	r4, (r14, 0x0)
    64e2:	1404      	addi      	r14, r14, 16
    64e4:	1463      	ipop
    64e6:	1461      	nir
    64e8:	20000014 	.long	0x20000014
    64ec:	20000050 	.long	0x20000050

Disassembly of section .text.BT1IntHandler:

000064f0 <BT1IntHandler>:
//BT1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT1IntHandler(void) 
{
    64f0:	1460      	nie
    64f2:	1462      	ipush
    // ISR content ...
	if((BT1->MISR & BT_PEND) == BT_PEND)
    64f4:	106f      	lrw      	r3, 0x2000000c	// 6530 <BT1IntHandler+0x40>
    64f6:	3101      	movi      	r1, 1
    64f8:	9360      	ld.w      	r3, (r3, 0x0)
    64fa:	934c      	ld.w      	r2, (r3, 0x30)
    64fc:	6884      	and      	r2, r1
    64fe:	3a40      	cmpnei      	r2, 0
    6500:	0c03      	bf      	0x6506	// 6506 <BT1IntHandler+0x16>
	{
		BT1->ICR = BT_OVF;
	} 
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)
	{
		BT1->ICR = BT_EVTRG;
    6502:	b32d      	st.w      	r1, (r3, 0x34)
	} 
}
    6504:	0409      	br      	0x6516	// 6516 <BT1IntHandler+0x26>
	else if((BT0->MISR&BT_CMP)==BT_CMP)
    6506:	104c      	lrw      	r2, 0x20000010	// 6534 <BT1IntHandler+0x44>
    6508:	3002      	movi      	r0, 2
    650a:	9240      	ld.w      	r2, (r2, 0x0)
    650c:	922c      	ld.w      	r1, (r2, 0x30)
    650e:	6840      	and      	r1, r0
    6510:	3940      	cmpnei      	r1, 0
    6512:	0c04      	bf      	0x651a	// 651a <BT1IntHandler+0x2a>
		BT1->ICR = BT_OVF;
    6514:	b30d      	st.w      	r0, (r3, 0x34)
}
    6516:	1463      	ipop
    6518:	1461      	nir
	else if((BT0->MISR&BT_OVF)==BT_OVF)
    651a:	922c      	ld.w      	r1, (r2, 0x30)
    651c:	3004      	movi      	r0, 4
    651e:	6840      	and      	r1, r0
    6520:	3940      	cmpnei      	r1, 0
    6522:	0bf9      	bt      	0x6514	// 6514 <BT1IntHandler+0x24>
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)
    6524:	924c      	ld.w      	r2, (r2, 0x30)
    6526:	3108      	movi      	r1, 8
    6528:	6884      	and      	r2, r1
    652a:	3a40      	cmpnei      	r2, 0
    652c:	0beb      	bt      	0x6502	// 6502 <BT1IntHandler+0x12>
    652e:	07f4      	br      	0x6516	// 6516 <BT1IntHandler+0x26>
    6530:	2000000c 	.long	0x2000000c
    6534:	20000010 	.long	0x20000010

Disassembly of section .text.RTCIntHandler:

00006538 <RTCIntHandler>:
//RTC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void RTCIntHandler(void) 
{
    6538:	1460      	nie
    653a:	1462      	ipush
    // ISR content ...
	if((RTC->MISR&ALRA_INT)==ALRA_INT)			//ALRAR 
    653c:	1079      	lrw      	r3, 0x2000001c	// 65a0 <RTCIntHandler+0x68>
    653e:	3101      	movi      	r1, 1
    6540:	9360      	ld.w      	r3, (r3, 0x0)
    6542:	934a      	ld.w      	r2, (r3, 0x28)
    6544:	6884      	and      	r2, r1
    6546:	3a40      	cmpnei      	r2, 0
    6548:	0c14      	bf      	0x6570	// 6570 <RTCIntHandler+0x38>
	{
		RTC->ICR=ALRA_INT;
		RTC->KEY=0XCA53;
    654a:	1057      	lrw      	r2, 0xca53	// 65a4 <RTCIntHandler+0x6c>
		RTC->ICR=ALRA_INT;
    654c:	b32b      	st.w      	r1, (r3, 0x2c)
		RTC->KEY=0XCA53;
    654e:	b34c      	st.w      	r2, (r3, 0x30)
		RTC->CR=RTC->CR|0x01;
    6550:	9342      	ld.w      	r2, (r3, 0x8)
    6552:	6c84      	or      	r2, r1
    6554:	b342      	st.w      	r2, (r3, 0x8)
		RTC->TIMR=(0x10<<16)|(0x00<<8)|(0x00);			//Hour bit6->0:am 1:pm	
    6556:	3280      	movi      	r2, 128
    6558:	424d      	lsli      	r2, r2, 13
    655a:	b340      	st.w      	r2, (r3, 0x0)
		while(RTC->CR&0x02);//busy 判断TIMR DATR ALRAR ALRBR数据写完
    655c:	3102      	movi      	r1, 2
    655e:	9342      	ld.w      	r2, (r3, 0x8)
    6560:	6884      	and      	r2, r1
    6562:	3a40      	cmpnei      	r2, 0
    6564:	0bfd      	bt      	0x655e	// 655e <RTCIntHandler+0x26>
		RTC->CR &= ~0x1;
    6566:	9342      	ld.w      	r2, (r3, 0x8)
    6568:	3a80      	bclri      	r2, 0
    656a:	b342      	st.w      	r2, (r3, 0x8)
	}
	else if((RTC->IMCR&RTC_TRGEV1_INT)==RTC_TRGEV1_INT)
	{
		RTC->ICR=RTC_TRGEV1_INT;
	}
}
    656c:	1463      	ipop
    656e:	1461      	nir
	else if((RTC->MISR&ALRB_INT)==ALRB_INT)			//ALRBR				
    6570:	934a      	ld.w      	r2, (r3, 0x28)
    6572:	3102      	movi      	r1, 2
    6574:	6884      	and      	r2, r1
    6576:	3a40      	cmpnei      	r2, 0
    6578:	0c03      	bf      	0x657e	// 657e <RTCIntHandler+0x46>
		RTC->ICR=RTC_TRGEV1_INT;
    657a:	b32b      	st.w      	r1, (r3, 0x2c)
}
    657c:	07f8      	br      	0x656c	// 656c <RTCIntHandler+0x34>
	else if((RTC->IMCR&CPRD_INT)==CPRD_INT)			//CPRD
    657e:	9349      	ld.w      	r2, (r3, 0x24)
    6580:	3104      	movi      	r1, 4
    6582:	6884      	and      	r2, r1
    6584:	3a40      	cmpnei      	r2, 0
    6586:	0bfa      	bt      	0x657a	// 657a <RTCIntHandler+0x42>
	else if((RTC->IMCR&RTC_TRGEV0_INT)==RTC_TRGEV0_INT)
    6588:	9349      	ld.w      	r2, (r3, 0x24)
    658a:	3108      	movi      	r1, 8
    658c:	6884      	and      	r2, r1
    658e:	3a40      	cmpnei      	r2, 0
    6590:	0bf5      	bt      	0x657a	// 657a <RTCIntHandler+0x42>
	else if((RTC->IMCR&RTC_TRGEV1_INT)==RTC_TRGEV1_INT)
    6592:	9349      	ld.w      	r2, (r3, 0x24)
    6594:	3110      	movi      	r1, 16
    6596:	6884      	and      	r2, r1
    6598:	3a40      	cmpnei      	r2, 0
    659a:	0bf0      	bt      	0x657a	// 657a <RTCIntHandler+0x42>
    659c:	07e8      	br      	0x656c	// 656c <RTCIntHandler+0x34>
    659e:	0000      	bkpt
    65a0:	2000001c 	.long	0x2000001c
    65a4:	0000ca53 	.long	0x0000ca53

Disassembly of section .text.UART0IntHandler:

000065a8 <UART0IntHandler>:

/* UART0 Interrupt */
void UART0IntHandler(void) 
{
    65a8:	1460      	nie
    65aa:	1462      	ipush
	if((UART0->ISR & UART_RX_INT_S) == UART_RX_INT_S)
    65ac:	1070      	lrw      	r3, 0x20000044	// 65ec <UART0IntHandler+0x44>
    65ae:	3102      	movi      	r1, 2
    65b0:	9360      	ld.w      	r3, (r3, 0x0)
    65b2:	9343      	ld.w      	r2, (r3, 0xc)
    65b4:	6884      	and      	r2, r1
    65b6:	3a40      	cmpnei      	r2, 0
    65b8:	0c03      	bf      	0x65be	// 65be <UART0IntHandler+0x16>
	{
		UART0->ISR = UART_RX_IOV_S;
	}
	else if((UART0->ISR & UART_TX_IOV_S) == UART_TX_IOV_S)
	{
		UART0->ISR = UART_TX_IOV_S;
    65ba:	b323      	st.w      	r1, (r3, 0xc)
	}
}
    65bc:	040a      	br      	0x65d0	// 65d0 <UART0IntHandler+0x28>
	else if((UART0->ISR & UART_TX_INT_S) == UART_TX_INT_S ) 
    65be:	9343      	ld.w      	r2, (r3, 0xc)
    65c0:	3101      	movi      	r1, 1
    65c2:	6884      	and      	r2, r1
    65c4:	3a40      	cmpnei      	r2, 0
    65c6:	0c07      	bf      	0x65d4	// 65d4 <UART0IntHandler+0x2c>
		UART0->ISR = UART_TX_INT_S;
    65c8:	b323      	st.w      	r1, (r3, 0xc)
		TxDataFlag = TRUE;
    65ca:	3201      	movi      	r2, 1
    65cc:	1069      	lrw      	r3, 0x20000219	// 65f0 <UART0IntHandler+0x48>
    65ce:	a340      	st.b      	r2, (r3, 0x0)
}
    65d0:	1463      	ipop
    65d2:	1461      	nir
	else if((UART0->ISR & UART_RX_IOV_S) == UART_RX_IOV_S)
    65d4:	9343      	ld.w      	r2, (r3, 0xc)
    65d6:	3108      	movi      	r1, 8
    65d8:	6884      	and      	r2, r1
    65da:	3a40      	cmpnei      	r2, 0
    65dc:	0bef      	bt      	0x65ba	// 65ba <UART0IntHandler+0x12>
	else if((UART0->ISR & UART_TX_IOV_S) == UART_TX_IOV_S)
    65de:	9343      	ld.w      	r2, (r3, 0xc)
    65e0:	3104      	movi      	r1, 4
    65e2:	6884      	and      	r2, r1
    65e4:	3a40      	cmpnei      	r2, 0
    65e6:	0bea      	bt      	0x65ba	// 65ba <UART0IntHandler+0x12>
    65e8:	07f4      	br      	0x65d0	// 65d0 <UART0IntHandler+0x28>
    65ea:	0000      	bkpt
    65ec:	20000044 	.long	0x20000044
    65f0:	20000219 	.long	0x20000219

Disassembly of section .text.UART1IntHandler:

000065f4 <UART1IntHandler>:
/*************************************************************/
extern volatile U8_T progDatabuf[32];
extern volatile int indx;

void UART1IntHandler(void) 
{
    65f4:	1460      	nie
    65f6:	1462      	ipush
    65f8:	14d2      	push      	r4-r5, r15
    // ISR content ...
	//Interupt
	if ((UART1->ISR&UART_RX_INT_S)==UART_RX_INT_S)
    65fa:	107f      	lrw      	r3, 0x20000040	// 6674 <UART1IntHandler+0x80>
    65fc:	3102      	movi      	r1, 2
    65fe:	9360      	ld.w      	r3, (r3, 0x0)
    6600:	9343      	ld.w      	r2, (r3, 0xc)
    6602:	6884      	and      	r2, r1
    6604:	3a40      	cmpnei      	r2, 0
    6606:	0c20      	bf      	0x6646	// 6646 <UART1IntHandler+0x52>
	{
		UART1->ISR=UART_RX_INT_S;
    6608:	b323      	st.w      	r1, (r3, 0xc)
		
		//modify by pilgrimage to adapt 5556KHZ HCLK
		progDatabuf[indx++] = UART1 -> DATA;
    660a:	109c      	lrw      	r4, 0x20000248	// 6678 <UART1IntHandler+0x84>
    660c:	10bc      	lrw      	r5, 0x20000228	// 667c <UART1IntHandler+0x88>
    660e:	9440      	ld.w      	r2, (r4, 0x0)
    6610:	5a22      	addi      	r1, r2, 1
    6612:	b420      	st.w      	r1, (r4, 0x0)
    6614:	9360      	ld.w      	r3, (r3, 0x0)
    6616:	6094      	addu      	r2, r5
    6618:	74cc      	zextb      	r3, r3
    661a:	a260      	st.b      	r3, (r2, 0x0)
		indx %= 30;
    661c:	9400      	ld.w      	r0, (r4, 0x0)
    661e:	311e      	movi      	r1, 30
    6620:	e0000284 	bsr      	0x6b28	// 6b28 <__modsi3>
    6624:	b400      	st.w      	r0, (r4, 0x0)
		if(progDatabuf[indx - 1] == 0xF8) program_trig_check();
    6626:	9460      	ld.w      	r3, (r4, 0x0)
    6628:	2b00      	subi      	r3, 1
    662a:	614c      	addu      	r5, r3
    662c:	8540      	ld.b      	r2, (r5, 0x0)
    662e:	33f8      	movi      	r3, 248
    6630:	64ca      	cmpne      	r2, r3
    6632:	0803      	bt      	0x6638	// 6638 <UART1IntHandler+0x44>
    6634:	e0000236 	bsr      	0x6aa0	// 6aa0 <program_trig_check>
	}
	else if ((UART1->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)
	{
		UART1->ISR=UART_TX_IOV_S;
	}
}
    6638:	d9ee2002 	ld.w      	r15, (r14, 0x8)
    663c:	98a1      	ld.w      	r5, (r14, 0x4)
    663e:	9880      	ld.w      	r4, (r14, 0x0)
    6640:	1403      	addi      	r14, r14, 12
    6642:	1463      	ipop
    6644:	1461      	nir
	else if( (UART1->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 
    6646:	9343      	ld.w      	r2, (r3, 0xc)
    6648:	3101      	movi      	r1, 1
    664a:	6884      	and      	r2, r1
    664c:	3a40      	cmpnei      	r2, 0
    664e:	0c06      	bf      	0x665a	// 665a <UART1IntHandler+0x66>
		UART1->ISR=UART_TX_INT_S;
    6650:	b323      	st.w      	r1, (r3, 0xc)
		TxDataFlag = TRUE;
    6652:	3201      	movi      	r2, 1
    6654:	106b      	lrw      	r3, 0x20000219	// 6680 <UART1IntHandler+0x8c>
    6656:	a340      	st.b      	r2, (r3, 0x0)
    6658:	07f0      	br      	0x6638	// 6638 <UART1IntHandler+0x44>
	else if ((UART1->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)
    665a:	9343      	ld.w      	r2, (r3, 0xc)
    665c:	3108      	movi      	r1, 8
    665e:	6884      	and      	r2, r1
    6660:	3a40      	cmpnei      	r2, 0
    6662:	0c03      	bf      	0x6668	// 6668 <UART1IntHandler+0x74>
		UART1->ISR=UART_TX_IOV_S;
    6664:	b323      	st.w      	r1, (r3, 0xc)
    6666:	07e9      	br      	0x6638	// 6638 <UART1IntHandler+0x44>
	else if ((UART1->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)
    6668:	9343      	ld.w      	r2, (r3, 0xc)
    666a:	3104      	movi      	r1, 4
    666c:	6884      	and      	r2, r1
    666e:	3a40      	cmpnei      	r2, 0
    6670:	0bfa      	bt      	0x6664	// 6664 <UART1IntHandler+0x70>
    6672:	07e3      	br      	0x6638	// 6638 <UART1IntHandler+0x44>
    6674:	20000040 	.long	0x20000040
    6678:	20000248 	.long	0x20000248
    667c:	20000228 	.long	0x20000228
    6680:	20000219 	.long	0x20000219

Disassembly of section .text.I2CIntHandler:

00006684 <I2CIntHandler>:
//I2C Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2CIntHandler(void) 
{
    6684:	1460      	nie
    6686:	1462      	ipush
    6688:	14d0      	push      	r15
    // ISR content ...
	I2C_Slave_Receive();
    668a:	e3fff74b 	bsr      	0x5520	// 5520 <I2C_Slave_Receive>
}
    668e:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    6692:	1401      	addi      	r14, r14, 4
    6694:	1463      	ipop
    6696:	1461      	nir

Disassembly of section .text.SPI0IntHandler:

00006698 <SPI0IntHandler>:
//SPI Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SPI0IntHandler(void) 
{
    6698:	1460      	nie
    669a:	1462      	ipush
    // ISR content ...
	if((SPI0->MISR&SPI_PORIM)==SPI_PORIM)					//Receive Overrun Interrupt
    669c:	106d      	lrw      	r3, 0x20000038	// 66d0 <SPI0IntHandler+0x38>
    669e:	3101      	movi      	r1, 1
    66a0:	9360      	ld.w      	r3, (r3, 0x0)
    66a2:	9347      	ld.w      	r2, (r3, 0x1c)
    66a4:	6884      	and      	r2, r1
    66a6:	3a40      	cmpnei      	r2, 0
    66a8:	0c03      	bf      	0x66ae	// 66ae <SPI0IntHandler+0x16>
			}
		}*/
	}
	else if((SPI0->MISR&SPI_TXIM)==SPI_TXIM)				//Transmit FIFO Interrupt
	{
		SPI0->ICR = SPI_TXIM;
    66aa:	b328      	st.w      	r1, (r3, 0x20)
	}

}
    66ac:	0410      	br      	0x66cc	// 66cc <SPI0IntHandler+0x34>
	else if((SPI0->MISR&SPI_RTIM)==SPI_RTIM)				//Receive Timeout Interrupt
    66ae:	9347      	ld.w      	r2, (r3, 0x1c)
    66b0:	3102      	movi      	r1, 2
    66b2:	6884      	and      	r2, r1
    66b4:	3a40      	cmpnei      	r2, 0
    66b6:	0bfa      	bt      	0x66aa	// 66aa <SPI0IntHandler+0x12>
	else if((SPI0->MISR&SPI_RXIM)==SPI_RXIM)				//Receive FIFO Interrupt,FIFO can be set 1/8,1/4,1/2 FIFO Interrupt
    66b8:	9347      	ld.w      	r2, (r3, 0x1c)
    66ba:	3104      	movi      	r1, 4
    66bc:	6884      	and      	r2, r1
    66be:	3a40      	cmpnei      	r2, 0
    66c0:	0bf5      	bt      	0x66aa	// 66aa <SPI0IntHandler+0x12>
	else if((SPI0->MISR&SPI_TXIM)==SPI_TXIM)				//Transmit FIFO Interrupt
    66c2:	9347      	ld.w      	r2, (r3, 0x1c)
    66c4:	3108      	movi      	r1, 8
    66c6:	6884      	and      	r2, r1
    66c8:	3a40      	cmpnei      	r2, 0
    66ca:	0bf0      	bt      	0x66aa	// 66aa <SPI0IntHandler+0x12>
}
    66cc:	1463      	ipop
    66ce:	1461      	nir
    66d0:	20000038 	.long	0x20000038

Disassembly of section .text.SIO0IntHandler:

000066d4 <SIO0IntHandler>:
//SIO Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SIO0IntHandler(void) 
{
    66d4:	1460      	nie
    66d6:	1462      	ipush
		delay_nms(10);
		SIO0->TXBUF=(0x03<<30)|(0x02<<28)|(0x03<<26)|(0x02<<24)|(0x03<<22)|(0x02<<20)|(0x03<<18)|(0x02<<16)|
				(0x01<<14)|(0x00<<12)|(0x01<<10)|(0x00<<8)|(0x01<<6)|(0x00<<4)|(0x01<<2)|(0x0<<0);		//0:D0,1:D1,2:DL,3:DH;	
	}*/
	
	if(SIO0->MISR&0X02)					//RXDNE
    66d8:	107d      	lrw      	r3, 0x20000030	// 674c <SIO0IntHandler+0x78>
    66da:	3102      	movi      	r1, 2
    66dc:	9360      	ld.w      	r3, (r3, 0x0)
    66de:	9349      	ld.w      	r2, (r3, 0x24)
    66e0:	6884      	and      	r2, r1
    66e2:	3a40      	cmpnei      	r2, 0
    66e4:	0c13      	bf      	0x670a	// 670a <SIO0IntHandler+0x36>
	{
		SIO0->ICR=0X02;
    66e6:	b32b      	st.w      	r1, (r3, 0x2c)
		if(R_SIORX_count>=1)
    66e8:	101a      	lrw      	r0, 0x2000031c	// 6750 <SIO0IntHandler+0x7c>
    66ea:	9040      	ld.w      	r2, (r0, 0x0)
    66ec:	3a20      	cmplti      	r2, 1
    66ee:	080c      	bt      	0x6706	// 6706 <SIO0IntHandler+0x32>
		{
			R_SIORX_buf[R_SIORX_count]=SIO0->RXBUF&0xff000000;			//8bit
    66f0:	9040      	ld.w      	r2, (r0, 0x0)
    66f2:	9327      	ld.w      	r1, (r3, 0x1c)
    66f4:	4938      	lsri      	r1, r1, 24
    66f6:	4262      	lsli      	r3, r2, 2
    66f8:	1057      	lrw      	r2, 0x20000320	// 6754 <SIO0IntHandler+0x80>
    66fa:	4138      	lsli      	r1, r1, 24
    66fc:	60c8      	addu      	r3, r2
    66fe:	b320      	st.w      	r1, (r3, 0x0)
			nop;
    6700:	6c03      	mov      	r0, r0
			R_SIORX_count=0;
    6702:	3300      	movi      	r3, 0
    6704:	b060      	st.w      	r3, (r0, 0x0)
	}
	else if(SIO0->MISR&0X020)				//TIMEOUT
	{
		SIO0->ICR=0X20;
	}
}
    6706:	1463      	ipop
    6708:	1461      	nir
	else if(SIO0->MISR&0X08)					//RXBUFFULL	
    670a:	9349      	ld.w      	r2, (r3, 0x24)
    670c:	3108      	movi      	r1, 8
    670e:	6884      	and      	r2, r1
    6710:	3a40      	cmpnei      	r2, 0
    6712:	0c10      	bf      	0x6732	// 6732 <SIO0IntHandler+0x5e>
		SIO0->ICR=0X08;
    6714:	b32b      	st.w      	r1, (r3, 0x2c)
		if(R_SIORX_count<1)
    6716:	102f      	lrw      	r1, 0x2000031c	// 6750 <SIO0IntHandler+0x7c>
    6718:	9140      	ld.w      	r2, (r1, 0x0)
    671a:	3a20      	cmplti      	r2, 1
    671c:	0ff5      	bf      	0x6706	// 6706 <SIO0IntHandler+0x32>
			R_SIORX_buf[R_SIORX_count]=SIO0->RXBUF;				//32bit
    671e:	9140      	ld.w      	r2, (r1, 0x0)
    6720:	9307      	ld.w      	r0, (r3, 0x1c)
    6722:	4262      	lsli      	r3, r2, 2
    6724:	104c      	lrw      	r2, 0x20000320	// 6754 <SIO0IntHandler+0x80>
    6726:	60c8      	addu      	r3, r2
    6728:	b300      	st.w      	r0, (r3, 0x0)
			R_SIORX_count++;
    672a:	9160      	ld.w      	r3, (r1, 0x0)
    672c:	2300      	addi      	r3, 1
    672e:	b160      	st.w      	r3, (r1, 0x0)
    6730:	07eb      	br      	0x6706	// 6706 <SIO0IntHandler+0x32>
	else if(SIO0->MISR&0X010)				//BREAK
    6732:	9349      	ld.w      	r2, (r3, 0x24)
    6734:	3110      	movi      	r1, 16
    6736:	6884      	and      	r2, r1
    6738:	3a40      	cmpnei      	r2, 0
    673a:	0c03      	bf      	0x6740	// 6740 <SIO0IntHandler+0x6c>
		SIO0->ICR=0X20;
    673c:	b32b      	st.w      	r1, (r3, 0x2c)
}
    673e:	07e4      	br      	0x6706	// 6706 <SIO0IntHandler+0x32>
	else if(SIO0->MISR&0X020)				//TIMEOUT
    6740:	9349      	ld.w      	r2, (r3, 0x24)
    6742:	3120      	movi      	r1, 32
    6744:	6884      	and      	r2, r1
    6746:	3a40      	cmpnei      	r2, 0
    6748:	0bfa      	bt      	0x673c	// 673c <SIO0IntHandler+0x68>
    674a:	07de      	br      	0x6706	// 6706 <SIO0IntHandler+0x32>
    674c:	20000030 	.long	0x20000030
    6750:	2000031c 	.long	0x2000031c
    6754:	20000320 	.long	0x20000320

Disassembly of section .text.EXI9to13IntHandler:

00006758 <EXI9to13IntHandler>:
//EXI4 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI9to13IntHandler(void) 
{
    6758:	1460      	nie
    675a:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN9)==EXI_PIN9) 
    675c:	1073      	lrw      	r3, 0x2000005c	// 67a8 <EXI9to13IntHandler+0x50>
    675e:	3280      	movi      	r2, 128
    6760:	9360      	ld.w      	r3, (r3, 0x0)
    6762:	237f      	addi      	r3, 128
    6764:	932c      	ld.w      	r1, (r3, 0x30)
    6766:	4242      	lsli      	r2, r2, 2
    6768:	6848      	and      	r1, r2
    676a:	3940      	cmpnei      	r1, 0
    676c:	0c03      	bf      	0x6772	// 6772 <EXI9to13IntHandler+0x1a>
	{
		SYSCON->EXICR = EXI_PIN12;
	} 
	else if ((SYSCON->EXIRS&EXI_PIN13)==EXI_PIN13) 
	{
		SYSCON->EXICR = EXI_PIN13;
    676e:	b34b      	st.w      	r2, (r3, 0x2c)
	}
}
    6770:	0419      	br      	0x67a2	// 67a2 <EXI9to13IntHandler+0x4a>
	else if ((SYSCON->EXIRS&EXI_PIN10)==EXI_PIN10) 
    6772:	3280      	movi      	r2, 128
    6774:	932c      	ld.w      	r1, (r3, 0x30)
    6776:	4243      	lsli      	r2, r2, 3
    6778:	6848      	and      	r1, r2
    677a:	3940      	cmpnei      	r1, 0
    677c:	0bf9      	bt      	0x676e	// 676e <EXI9to13IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN11)==EXI_PIN11) 
    677e:	3280      	movi      	r2, 128
    6780:	932c      	ld.w      	r1, (r3, 0x30)
    6782:	4244      	lsli      	r2, r2, 4
    6784:	6848      	and      	r1, r2
    6786:	3940      	cmpnei      	r1, 0
    6788:	0bf3      	bt      	0x676e	// 676e <EXI9to13IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN12)==EXI_PIN12) 
    678a:	3280      	movi      	r2, 128
    678c:	932c      	ld.w      	r1, (r3, 0x30)
    678e:	4245      	lsli      	r2, r2, 5
    6790:	6848      	and      	r1, r2
    6792:	3940      	cmpnei      	r1, 0
    6794:	0bed      	bt      	0x676e	// 676e <EXI9to13IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN13)==EXI_PIN13) 
    6796:	3280      	movi      	r2, 128
    6798:	932c      	ld.w      	r1, (r3, 0x30)
    679a:	4246      	lsli      	r2, r2, 6
    679c:	6848      	and      	r1, r2
    679e:	3940      	cmpnei      	r1, 0
    67a0:	0be7      	bt      	0x676e	// 676e <EXI9to13IntHandler+0x16>
}
    67a2:	1463      	ipop
    67a4:	1461      	nir
    67a6:	0000      	bkpt
    67a8:	2000005c 	.long	0x2000005c

Disassembly of section .text.PriviledgeVioHandler:

000067ac <PriviledgeVioHandler>:
    67ac:	783c      	jmp      	r15

Disassembly of section .text.PendTrapHandler:

000067ae <PendTrapHandler>:
    // ISR content ...

}

void PendTrapHandler(void) 
{
    67ae:	1460      	nie
    67b0:	1462      	ipush
    // ISR content ...

}
    67b2:	1463      	ipop
    67b4:	1461      	nir

Disassembly of section .text.Trap3Handler:

000067b6 <Trap3Handler>:
    67b6:	1460      	nie
    67b8:	1462      	ipush
    67ba:	1463      	ipop
    67bc:	1461      	nir

Disassembly of section .text.Trap2Handler:

000067be <Trap2Handler>:
    67be:	1460      	nie
    67c0:	1462      	ipush
    67c2:	1463      	ipop
    67c4:	1461      	nir

Disassembly of section .text.Trap1Handler:

000067c6 <Trap1Handler>:
    67c6:	1460      	nie
    67c8:	1462      	ipush
    67ca:	1463      	ipop
    67cc:	1461      	nir

Disassembly of section .text.Trap0Handler:

000067ce <Trap0Handler>:
    67ce:	1460      	nie
    67d0:	1462      	ipush
    67d2:	1463      	ipop
    67d4:	1461      	nir

Disassembly of section .text.UnrecExecpHandler:

000067d6 <UnrecExecpHandler>:
    67d6:	1460      	nie
    67d8:	1462      	ipush
    67da:	1463      	ipop
    67dc:	1461      	nir

Disassembly of section .text.BreakPointHandler:

000067de <BreakPointHandler>:
    67de:	1460      	nie
    67e0:	1462      	ipush
    67e2:	1463      	ipop
    67e4:	1461      	nir

Disassembly of section .text.AccessErrHandler:

000067e6 <AccessErrHandler>:
    67e6:	1460      	nie
    67e8:	1462      	ipush
    67ea:	1463      	ipop
    67ec:	1461      	nir

Disassembly of section .text.IllegalInstrHandler:

000067ee <IllegalInstrHandler>:
    67ee:	1460      	nie
    67f0:	1462      	ipush
    67f2:	1463      	ipop
    67f4:	1461      	nir

Disassembly of section .text.MisalignedHandler:

000067f6 <MisalignedHandler>:
    67f6:	1460      	nie
    67f8:	1462      	ipush
    67fa:	1463      	ipop
    67fc:	1461      	nir

Disassembly of section .text.TKEYIntHandler:

000067fe <TKEYIntHandler>:
    67fe:	1460      	nie
    6800:	1462      	ipush
    6802:	1463      	ipop
    6804:	1461      	nir

Disassembly of section .text.CNTAIntHandler:

00006806 <CNTAIntHandler>:
    6806:	1460      	nie
    6808:	1462      	ipush
    680a:	1463      	ipop
    680c:	1461      	nir

Disassembly of section .text.ADCIntHandler:

0000680e <ADCIntHandler>:
    680e:	1460      	nie
    6810:	1462      	ipush
    6812:	1463      	ipop
    6814:	1461      	nir

Disassembly of section .text.startup.main:

00006818 <main>:
#include "app_communicate.h"

extern void APT32F102_init(void);	

int main(void)
{	
    6818:	14d4      	push      	r4-r7, r15
    681a:	1427      	subi      	r14, r14, 28
	APT32F102_init();
    681c:	e3fffc10 	bsr      	0x603c	// 603c <APT32F102_init>
	printf("\r\n\r\nTWSBT013-charging case: V0.0.4\r\n");
    6820:	1211      	lrw      	r0, 0x8f1c	// 6964 <main+0x14c>
    6822:	e3ffe879 	bsr      	0x3914	// 3914 <__GI_puts>
	Coret_DelayMs(20); /* 延时使系统稳定 */
    6826:	3100      	movi      	r1, 0
    6828:	3014      	movi      	r0, 20
    682a:	e00010cb 	bsr      	0x89c0	// 89c0 <Coret_DelayMs>
	
	ReduceSYSCLKto5556KHZ();
    682e:	e0000415 	bsr      	0x7058	// 7058 <ReduceSYSCLKto5556KHZ>
	battery_power_update(battery_level_calculate(battery_adc_to_mv(adc_get_val(BATTERY_ADC))));
    6832:	3000      	movi      	r0, 0
    6834:	e000088e 	bsr      	0x7950	// 7950 <adc_get_val>
    6838:	e3ffe5fe 	bsr      	0x3434	// 3434 <__floatunsidf>
    683c:	3200      	movi      	r2, 0
    683e:	126b      	lrw      	r3, 0x3fe75400	// 6968 <main+0x150>
    6840:	e3ffe3e0 	bsr      	0x3000	// 3000 <__muldf3>
    6844:	3200      	movi      	r2, 0
    6846:	126a      	lrw      	r3, 0x40438000	// 696c <main+0x154>
    6848:	e3ffe4f6 	bsr      	0x3234	// 3234 <__divdf3>
    684c:	3200      	movi      	r2, 0
    684e:	1269      	lrw      	r3, 0x405e4000	// 6970 <main+0x158>
    6850:	e3ffe3d8 	bsr      	0x3000	// 3000 <__muldf3>
    6854:	e3ffdce8 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    6858:	e0000762 	bsr      	0x771c	// 771c <battery_level_calculate>
    685c:	7400      	zextb      	r0, r0
    685e:	e000074f 	bsr      	0x76fc	// 76fc <battery_power_update>
	app_start_100_millisecond_timer(APP_BATTERY_TIMER_ID);
    6862:	3001      	movi      	r0, 1
    6864:	e00006fe 	bsr      	0x7660	// 7660 <app_start_100_millisecond_timer>
	app_start_100_millisecond_timer(APP_OVERCURRENT_TIMER_ID);//常开过流保护检测定时器
    6868:	3003      	movi      	r0, 3
    686a:	e00006fb 	bsr      	0x7660	// 7660 <app_start_100_millisecond_timer>
	
	while(1)
	{
		/* time_1ms_handle */
		if(TimerFlag & TIMER_1MS_FLAG)
    686e:	1282      	lrw      	r4, 0x20000348	// 6974 <main+0x15c>
    6870:	8460      	ld.b      	r3, (r4, 0x0)
    6872:	3202      	movi      	r2, 2
    6874:	68c8      	and      	r3, r2
    6876:	3b40      	cmpnei      	r3, 0
    6878:	0c07      	bf      	0x6886	// 6886 <main+0x6e>
		{
			TimerFlag &= ~TIMER_1MS_FLAG;
    687a:	8460      	ld.b      	r3, (r4, 0x0)
    687c:	32fd      	movi      	r2, 253
    687e:	68c8      	and      	r3, r2
    6880:	a460      	st.b      	r3, (r4, 0x0)
			app_key_event_handle();
    6882:	e0000631 	bsr      	0x74e4	// 74e4 <app_key_event_handle>
		}
		
		/* time_10ms_handle */
		if(TimerFlag & TIMER_10MS_FLAG)
    6886:	8460      	ld.b      	r3, (r4, 0x0)
    6888:	3204      	movi      	r2, 4
    688a:	68c8      	and      	r3, r2
    688c:	3b40      	cmpnei      	r3, 0
    688e:	0c0b      	bf      	0x68a4	// 68a4 <main+0x8c>
		{
			TimerFlag &= ~TIMER_10MS_FLAG;
    6890:	32fb      	movi      	r2, 251
    6892:	8460      	ld.b      	r3, (r4, 0x0)
    6894:	68c8      	and      	r3, r2
    6896:	a460      	st.b      	r3, (r4, 0x0)
			handle_uart2_recv_data();
    6898:	e00004d4 	bsr      	0x7240	// 7240 <handle_uart2_recv_data>
			app_battery_handle_process();
    689c:	e0000db2 	bsr      	0x8400	// 8400 <app_battery_handle_process>
			box_open_close_handle_progress();
    68a0:	e0000a56 	bsr      	0x7d4c	// 7d4c <box_open_close_handle_progress>
		}
		
		/* time_100ms_handle */
		if(TimerFlag & TIMER_100MS_FLAG)
    68a4:	8460      	ld.b      	r3, (r4, 0x0)
    68a6:	3210      	movi      	r2, 16
    68a8:	68c8      	and      	r3, r2
    68aa:	3b40      	cmpnei      	r3, 0
    68ac:	0c0b      	bf      	0x68c2	// 68c2 <main+0xaa>
		{
			TimerFlag &= ~TIMER_100MS_FLAG;	
    68ae:	32ef      	movi      	r2, 239
    68b0:	8460      	ld.b      	r3, (r4, 0x0)
    68b2:	68c8      	and      	r3, r2
    68b4:	a460      	st.b      	r3, (r4, 0x0)
			communicate_process_handle();
    68b6:	e0000559 	bsr      	0x7368	// 7368 <communicate_process_handle>
			app_status_handle_process();
    68ba:	e0000ebd 	bsr      	0x8634	// 8634 <app_status_handle_process>
			app_100_millisecond_timer_check();
    68be:	e00006e9 	bsr      	0x7690	// 7690 <app_100_millisecond_timer_check>
		}
		
		/* time_1s_handle */
		if(TimerFlag & TIMER_1S_FLAG)
    68c2:	8460      	ld.b      	r3, (r4, 0x0)
    68c4:	3220      	movi      	r2, 32
    68c6:	68c8      	and      	r3, r2
    68c8:	3b40      	cmpnei      	r3, 0
    68ca:	0fd3      	bf      	0x6870	// 6870 <main+0x58>
		{
			TimerFlag &= ~TIMER_1S_FLAG;
    68cc:	32df      	movi      	r2, 223
    68ce:	8460      	ld.b      	r3, (r4, 0x0)
    68d0:	68c8      	and      	r3, r2
			
			U32_T L_pogo, R_pogo;
			L_pogo = adc_get_val(L_EARBUD_POGO_ADC);
    68d2:	3002      	movi      	r0, 2
			TimerFlag &= ~TIMER_1S_FLAG;
    68d4:	a460      	st.b      	r3, (r4, 0x0)
			L_pogo = adc_get_val(L_EARBUD_POGO_ADC);
    68d6:	e000083d 	bsr      	0x7950	// 7950 <adc_get_val>
    68da:	b803      	st.w      	r0, (r14, 0xc)
			R_pogo = adc_get_val(R_EARBUD_POGO_ADC);
    68dc:	3001      	movi      	r0, 1
    68de:	e0000839 	bsr      	0x7950	// 7950 <adc_get_val>
    68e2:	b804      	st.w      	r0, (r14, 0x10)
			printf("L: %lu, %lumV, %lumA R: %lu, %lumV, %lumA\r\n",\
			L_pogo,adc_to_mv(L_pogo), pogo_adc_to_mA(L_pogo),R_pogo,adc_to_mv(R_pogo), pogo_adc_to_mA(R_pogo));
    68e4:	9803      	ld.w      	r0, (r14, 0xc)
    68e6:	e3ffe5a7 	bsr      	0x3434	// 3434 <__floatunsidf>
    68ea:	6dc3      	mov      	r7, r0
    68ec:	9804      	ld.w      	r0, (r14, 0x10)
    68ee:	6d87      	mov      	r6, r1
    68f0:	e3ffe5a2 	bsr      	0x3434	// 3434 <__floatunsidf>
    68f4:	6d43      	mov      	r5, r0
    68f6:	b825      	st.w      	r1, (r14, 0x14)
    68f8:	6c1f      	mov      	r0, r7
    68fa:	3200      	movi      	r2, 0
    68fc:	107f      	lrw      	r3, 0x3fe76a00	// 6978 <main+0x160>
    68fe:	6c5b      	mov      	r1, r6
    6900:	e3ffe380 	bsr      	0x3000	// 3000 <__muldf3>
    6904:	3200      	movi      	r2, 0
    6906:	107e      	lrw      	r3, 0x3fe00000	// 697c <main+0x164>
    6908:	e3ffe37c 	bsr      	0x3000	// 3000 <__muldf3>
			printf("L: %lu, %lumV, %lumA R: %lu, %lumV, %lumA\r\n",\
    690c:	e3ffdc8c 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    6910:	b806      	st.w      	r0, (r14, 0x18)
			L_pogo,adc_to_mv(L_pogo), pogo_adc_to_mA(L_pogo),R_pogo,adc_to_mv(R_pogo), pogo_adc_to_mA(R_pogo));
    6912:	3200      	movi      	r2, 0
    6914:	1075      	lrw      	r3, 0x3fe75400	// 6968 <main+0x150>
    6916:	6c1f      	mov      	r0, r7
    6918:	6c5b      	mov      	r1, r6
    691a:	e3ffe373 	bsr      	0x3000	// 3000 <__muldf3>
			printf("L: %lu, %lumV, %lumA R: %lu, %lumV, %lumA\r\n",\
    691e:	e3ffdc83 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    6922:	6d83      	mov      	r6, r0
			L_pogo,adc_to_mv(L_pogo), pogo_adc_to_mA(L_pogo),R_pogo,adc_to_mv(R_pogo), pogo_adc_to_mA(R_pogo));
    6924:	3200      	movi      	r2, 0
    6926:	1075      	lrw      	r3, 0x3fe76a00	// 6978 <main+0x160>
    6928:	6c17      	mov      	r0, r5
    692a:	9825      	ld.w      	r1, (r14, 0x14)
    692c:	e3ffe36a 	bsr      	0x3000	// 3000 <__muldf3>
    6930:	3200      	movi      	r2, 0
    6932:	1073      	lrw      	r3, 0x3fe00000	// 697c <main+0x164>
    6934:	e3ffe366 	bsr      	0x3000	// 3000 <__muldf3>
			printf("L: %lu, %lumV, %lumA R: %lu, %lumV, %lumA\r\n",\
    6938:	e3ffdc76 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    693c:	b802      	st.w      	r0, (r14, 0x8)
			L_pogo,adc_to_mv(L_pogo), pogo_adc_to_mA(L_pogo),R_pogo,adc_to_mv(R_pogo), pogo_adc_to_mA(R_pogo));
    693e:	3200      	movi      	r2, 0
    6940:	106a      	lrw      	r3, 0x3fe75400	// 6968 <main+0x150>
    6942:	6c17      	mov      	r0, r5
    6944:	9825      	ld.w      	r1, (r14, 0x14)
    6946:	e3ffe35d 	bsr      	0x3000	// 3000 <__muldf3>
			printf("L: %lu, %lumV, %lumA R: %lu, %lumV, %lumA\r\n",\
    694a:	e3ffdc6d 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    694e:	9864      	ld.w      	r3, (r14, 0x10)
    6950:	b801      	st.w      	r0, (r14, 0x4)
    6952:	b860      	st.w      	r3, (r14, 0x0)
    6954:	6c9b      	mov      	r2, r6
    6956:	9866      	ld.w      	r3, (r14, 0x18)
    6958:	9823      	ld.w      	r1, (r14, 0xc)
    695a:	100a      	lrw      	r0, 0x8f40	// 6980 <main+0x168>
    695c:	e3ffe7ca 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
    6960:	0788      	br      	0x6870	// 6870 <main+0x58>
    6962:	0000      	bkpt
    6964:	00008f1c 	.long	0x00008f1c
    6968:	3fe75400 	.long	0x3fe75400
    696c:	40438000 	.long	0x40438000
    6970:	405e4000 	.long	0x405e4000
    6974:	20000348 	.long	0x20000348
    6978:	3fe76a00 	.long	0x3fe76a00
    697c:	3fe00000 	.long	0x3fe00000
    6980:	00008f40 	.long	0x00008f40

Disassembly of section .text.delayus_Bycode:

00006984 <delayus_Bycode>:
volatile int indx =0;
const char jmpIAPstr[11] = {"JumptoISP\n"};
const char rststr[8] = {"RSTACK\n"};

void delayus_Bycode(unsigned int t)
{
    6984:	1421      	subi      	r14, r14, 4
	volatile unsigned int i =  t>1?t-2:0;
    6986:	3801      	cmphsi      	r0, 2
    6988:	0c0a      	bf      	0x699c	// 699c <delayus_Bycode+0x18>
    698a:	2801      	subi      	r0, 2
    698c:	b800      	st.w      	r0, (r14, 0x0)
	while(i--){
    698e:	9860      	ld.w      	r3, (r14, 0x0)
    6990:	5b43      	subi      	r2, r3, 1
    6992:	3b40      	cmpnei      	r3, 0
    6994:	b840      	st.w      	r2, (r14, 0x0)
    6996:	0805      	bt      	0x69a0	// 69a0 <delayus_Bycode+0x1c>
		asm("nop");
		asm("nop");
		asm("nop");
		asm("nop");
	}
}
    6998:	1401      	addi      	r14, r14, 4
    699a:	783c      	jmp      	r15
	volatile unsigned int i =  t>1?t-2:0;
    699c:	3000      	movi      	r0, 0
    699e:	07f7      	br      	0x698c	// 698c <delayus_Bycode+0x8>
		asm("nop");
    69a0:	6c03      	mov      	r0, r0
		asm("nop");
    69a2:	6c03      	mov      	r0, r0
		asm("nop");
    69a4:	6c03      	mov      	r0, r0
		asm("nop");
    69a6:	6c03      	mov      	r0, r0
		asm("nop");
    69a8:	6c03      	mov      	r0, r0
		asm("nop");
    69aa:	6c03      	mov      	r0, r0
    69ac:	07f1      	br      	0x698e	// 698e <delayus_Bycode+0xa>

Disassembly of section .text.delayms_Bycode:

000069ae <delayms_Bycode>:

void delayms_Bycode(unsigned int t)
{
    69ae:	14d0      	push      	r15
    69b0:	1421      	subi      	r14, r14, 4
	volatile unsigned int i = t;
    69b2:	b800      	st.w      	r0, (r14, 0x0)
	while(i--){
    69b4:	9860      	ld.w      	r3, (r14, 0x0)
    69b6:	5b43      	subi      	r2, r3, 1
    69b8:	3b40      	cmpnei      	r3, 0
    69ba:	b840      	st.w      	r2, (r14, 0x0)
    69bc:	0803      	bt      	0x69c2	// 69c2 <delayms_Bycode+0x14>
		delayus_Bycode(103);
	}
}
    69be:	1401      	addi      	r14, r14, 4
    69c0:	1490      	pop      	r15
		delayus_Bycode(103);
    69c2:	3067      	movi      	r0, 103
    69c4:	e3ffffe0 	bsr      	0x6984	// 6984 <delayus_Bycode>
    69c8:	07f6      	br      	0x69b4	// 69b4 <delayms_Bycode+0x6>

Disassembly of section .text.JumpToIAP:

000069cc <JumpToIAP>:

void JumpToIAP(void)
{
	SYSCON -> RSR = 0xFFFFFFFF;
    69cc:	1065      	lrw      	r3, 0x2000005c	// 69e0 <JumpToIAP+0x14>
    69ce:	3180      	movi      	r1, 128
    69d0:	9340      	ld.w      	r2, (r3, 0x0)
    69d2:	3300      	movi      	r3, 0
    69d4:	6048      	addu      	r1, r2
    69d6:	2b00      	subi      	r3, 1
    69d8:	b164      	st.w      	r3, (r1, 0x10)
	SYSCON -> IDCCR = 0xE11E0081; //系统软复位
    69da:	1063      	lrw      	r3, 0xe11e0081	// 69e4 <JumpToIAP+0x18>
    69dc:	b260      	st.w      	r3, (r2, 0x0)
	//SYSCON_Software_Reset();
}
    69de:	783c      	jmp      	r15
    69e0:	2000005c 	.long	0x2000005c
    69e4:	e11e0081 	.long	0xe11e0081

Disassembly of section .text.prog_uart_send:

000069e8 <prog_uart_send>:

char inline Prog_get_char(void){
	return UART1 -> DATA;
}

void prog_uart_send(const char * cc,int len){
    69e8:	14d4      	push      	r4-r7, r15
    69ea:	6d43      	mov      	r5, r0
    69ec:	6d87      	mov      	r6, r1
	int i;
	for(i=0;i<len;i++){
    69ee:	6d03      	mov      	r4, r0
		UARTTxByte(UART1,cc[i]);
    69f0:	10e6      	lrw      	r7, 0x20000040	// 6a08 <prog_uart_send+0x20>
	for(i=0;i<len;i++){
    69f2:	5c75      	subu      	r3, r4, r5
    69f4:	658d      	cmplt      	r3, r6
    69f6:	0802      	bt      	0x69fa	// 69fa <prog_uart_send+0x12>
	}
}
    69f8:	1494      	pop      	r4-r7, r15
		UARTTxByte(UART1,cc[i]);
    69fa:	8420      	ld.b      	r1, (r4, 0x0)
    69fc:	9700      	ld.w      	r0, (r7, 0x0)
    69fe:	e3fff49c 	bsr      	0x5336	// 5336 <UARTTxByte>
    6a02:	2400      	addi      	r4, 1
    6a04:	07f7      	br      	0x69f2	// 69f2 <prog_uart_send+0xa>
    6a06:	0000      	bkpt
    6a08:	20000040 	.long	0x20000040

Disassembly of section .text.SendRstACK:

00006a0c <SendRstACK>:

void SendRstACK(void){
    6a0c:	14d1      	push      	r4, r15
	delayms_Bycode(1);
	prog_uart_send(rststr,7);
    6a0e:	108e      	lrw      	r4, 0x8a68	// 6a44 <SendRstACK+0x38>
	delayms_Bycode(1);
    6a10:	3001      	movi      	r0, 1
    6a12:	e3ffffce 	bsr      	0x69ae	// 69ae <delayms_Bycode>
	prog_uart_send(rststr,7);
    6a16:	3107      	movi      	r1, 7
    6a18:	6c13      	mov      	r0, r4
    6a1a:	e3ffffe7 	bsr      	0x69e8	// 69e8 <prog_uart_send>
	delayms_Bycode(1);
    6a1e:	3001      	movi      	r0, 1
    6a20:	e3ffffc7 	bsr      	0x69ae	// 69ae <delayms_Bycode>
	prog_uart_send(rststr,7);
    6a24:	3107      	movi      	r1, 7
    6a26:	6c13      	mov      	r0, r4
    6a28:	e3ffffe0 	bsr      	0x69e8	// 69e8 <prog_uart_send>
	delayms_Bycode(1);
    6a2c:	3001      	movi      	r0, 1
    6a2e:	e3ffffc0 	bsr      	0x69ae	// 69ae <delayms_Bycode>
	prog_uart_send(rststr,7);
    6a32:	3107      	movi      	r1, 7
    6a34:	6c13      	mov      	r0, r4
    6a36:	e3ffffd9 	bsr      	0x69e8	// 69e8 <prog_uart_send>
	delayms_Bycode(1);
    6a3a:	3001      	movi      	r0, 1
    6a3c:	e3ffffb9 	bsr      	0x69ae	// 69ae <delayms_Bycode>
}
    6a40:	1491      	pop      	r4, r15
    6a42:	0000      	bkpt
    6a44:	00008a68 	.long	0x00008a68

Disassembly of section .text.wait_syncpin_release:

00006a48 <wait_syncpin_release>:

void wait_syncpin_release(U8_T logic, U32_T timeout){
    6a48:	14d4      	push      	r4-r7, r15
    6a4a:	1421      	subi      	r14, r14, 4
	int deglitchcnt;
	U32_T timecnt=0;
	volatile U8_T level =0;
	if(logic) level =1;
    6a4c:	3840      	cmpnei      	r0, 0
	volatile U8_T level =0;
    6a4e:	3300      	movi      	r3, 0
void wait_syncpin_release(U8_T logic, U32_T timeout){
    6a50:	6dc7      	mov      	r7, r1
	volatile U8_T level =0;
    6a52:	dc6e0003 	st.b      	r3, (r14, 0x3)
	if(logic) level =1;
    6a56:	0c04      	bf      	0x6a5e	// 6a5e <wait_syncpin_release+0x16>
    6a58:	3301      	movi      	r3, 1
    6a5a:	dc6e0003 	st.b      	r3, (r14, 0x3)
	SYNC_PIN_AS_INPUT;
    6a5e:	10d0      	lrw      	r6, 0x20000050	// 6a9c <wait_syncpin_release+0x54>
    6a60:	3201      	movi      	r2, 1
    6a62:	310d      	movi      	r1, 13
    6a64:	9600      	ld.w      	r0, (r6, 0x0)
    6a66:	e3fff10d 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	U32_T timecnt=0;
    6a6a:	3500      	movi      	r5, 0
	deglitchcnt =0;
    6a6c:	3400      	movi      	r4, 0
	while(1){				
		delayms_Bycode(10);
    6a6e:	300a      	movi      	r0, 10
    6a70:	e3ffff9f 	bsr      	0x69ae	// 69ae <delayms_Bycode>
		if( MCURST_SYNC_IN == level) {
    6a74:	310d      	movi      	r1, 13
    6a76:	9600      	ld.w      	r0, (r6, 0x0)
    6a78:	e3fff2ff 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    6a7c:	d86e0003 	ld.b      	r3, (r14, 0x3)
    6a80:	64c2      	cmpne      	r0, r3
    6a82:	0806      	bt      	0x6a8e	// 6a8e <wait_syncpin_release+0x46>
			deglitchcnt++;
    6a84:	2400      	addi      	r4, 1
		}
		else {
			deglitchcnt=0;
		}
		if(deglitchcnt >= 10) break;
    6a86:	3c29      	cmplti      	r4, 10
    6a88:	0804      	bt      	0x6a90	// 6a90 <wait_syncpin_release+0x48>
		timecnt++;
		if(timeout > 0) {
			if(timecnt >= timeout) break;
		}
	}
}
    6a8a:	1401      	addi      	r14, r14, 4
    6a8c:	1494      	pop      	r4-r7, r15
			deglitchcnt=0;
    6a8e:	3400      	movi      	r4, 0
		if(timeout > 0) {
    6a90:	3f40      	cmpnei      	r7, 0
		timecnt++;
    6a92:	2500      	addi      	r5, 1
		if(timeout > 0) {
    6a94:	0fed      	bf      	0x6a6e	// 6a6e <wait_syncpin_release+0x26>
			if(timecnt >= timeout) break;
    6a96:	65d4      	cmphs      	r5, r7
    6a98:	0feb      	bf      	0x6a6e	// 6a6e <wait_syncpin_release+0x26>
    6a9a:	07f8      	br      	0x6a8a	// 6a8a <wait_syncpin_release+0x42>
    6a9c:	20000050 	.long	0x20000050

Disassembly of section .text.program_trig_check:

00006aa0 <program_trig_check>:

void program_trig_check(void){
    6aa0:	14d0      	push      	r15
	U8_T rstflag =0;

	if(strstr((const char *)progDatabuf,rstpattern)) rstflag =1;
    6aa2:	102d      	lrw      	r1, 0x8a70	// 6ad4 <program_trig_check+0x34>
    6aa4:	100d      	lrw      	r0, 0x20000228	// 6ad8 <program_trig_check+0x38>
    6aa6:	e3ffe7ff 	bsr      	0x3aa4	// 3aa4 <__GI_strstr>
    6aaa:	3840      	cmpnei      	r0, 0
    6aac:	0c13      	bf      	0x6ad2	// 6ad2 <program_trig_check+0x32>
	if(rstflag){
		rstflag =0;
		prog_uart_send(jmpIAPstr,10);
    6aae:	310a      	movi      	r1, 10
    6ab0:	100b      	lrw      	r0, 0x8a79	// 6adc <program_trig_check+0x3c>
    6ab2:	e3ffff9b 	bsr      	0x69e8	// 69e8 <prog_uart_send>
		SendRstACK();
    6ab6:	e3ffffab 	bsr      	0x6a0c	// 6a0c <SendRstACK>
		delayms_Bycode(10);
    6aba:	300a      	movi      	r0, 10
    6abc:	e3ffff79 	bsr      	0x69ae	// 69ae <delayms_Bycode>
		CK_CPU_DisAllNormalIrq();//关闭所有中断
    6ac0:	e000005b 	bsr      	0x6b76	// 6b76 <CK_CPU_DisAllNormalIrq>
		wait_syncpin_release(0, 600);
    6ac4:	3196      	movi      	r1, 150
    6ac6:	4122      	lsli      	r1, r1, 2
    6ac8:	3000      	movi      	r0, 0
    6aca:	e3ffffbf 	bsr      	0x6a48	// 6a48 <wait_syncpin_release>
		JumpToIAP();
    6ace:	e3ffff7f 	bsr      	0x69cc	// 69cc <JumpToIAP>
	}
    6ad2:	1490      	pop      	r15
    6ad4:	00008a70 	.long	0x00008a70
    6ad8:	20000228 	.long	0x20000228
    6adc:	00008a79 	.long	0x00008a79

Disassembly of section .text.__divsi3:

00006ae0 <__divsi3>:
CSP_BT_T    	*BT1      = (CSP_BT_T   *)APB_BT1Base ;
CSP_CRC_T   	*CRC      = (CSP_CRC_T  *)AHB_CRCBase ;
CSP_HWD_T   	*HWD      = (CSP_HWD_T  *)APB_HWDBase ;

int __divsi3 (  int a,   int b)
{   
    6ae0:	14c1      	push      	r4
	int PSR;
	__asm volatile(
    6ae2:	c0006023 	mfcr      	r3, cr<0, 0>
    6ae6:	c0807020 	psrclr      	ie
					"mfcr %0 , psr \n\r"
					"psrclr ie \n\r"
					: "=r"(PSR)
				   );

	HWD->CR = 0;
    6aea:	1046      	lrw      	r2, 0x20000004	// 6b00 <__divsi3+0x20>
    6aec:	3400      	movi      	r4, 0
    6aee:	9240      	ld.w      	r2, (r2, 0x0)
    6af0:	b284      	st.w      	r4, (r2, 0x10)
	HWD->DIVIDENT = a;
	HWD->DIVISOR = b;

	PSR |= 0x80000000;
    6af2:	3bbf      	bseti      	r3, 31
	HWD->DIVIDENT = a;
    6af4:	b200      	st.w      	r0, (r2, 0x0)
	HWD->DIVISOR = b;
    6af6:	b221      	st.w      	r1, (r2, 0x4)
	__asm volatile(
    6af8:	c0036420 	mtcr      	r3, cr<0, 0>
					 "mtcr %0 , psr \n\r"
					 : 
					 :"r"(PSR)
					);
					
	return HWD->QUOTIENT;
    6afc:	9202      	ld.w      	r0, (r2, 0x8)
}
    6afe:	1481      	pop      	r4
    6b00:	20000004 	.long	0x20000004

Disassembly of section .text.__udivsi3:

00006b04 <__udivsi3>:
 unsigned int __udivsi3 ( unsigned int a,  unsigned int b)
{   
    6b04:	14c1      	push      	r4
	int PSR;
	__asm volatile(
    6b06:	c0006023 	mfcr      	r3, cr<0, 0>
    6b0a:	c0807020 	psrclr      	ie
					"mfcr %0 , psr \n\r"
					"psrclr ie \n\r"
					: "=r"(PSR)
				   );
	
	HWD->CR = 1;
    6b0e:	1046      	lrw      	r2, 0x20000004	// 6b24 <__udivsi3+0x20>
    6b10:	3401      	movi      	r4, 1
    6b12:	9240      	ld.w      	r2, (r2, 0x0)
    6b14:	b284      	st.w      	r4, (r2, 0x10)
	HWD->DIVIDENT = a;
	HWD->DIVISOR = b;

	PSR |= 0x80000000;
    6b16:	3bbf      	bseti      	r3, 31
	HWD->DIVIDENT = a;
    6b18:	b200      	st.w      	r0, (r2, 0x0)
	HWD->DIVISOR = b;
    6b1a:	b221      	st.w      	r1, (r2, 0x4)
	__asm volatile(
    6b1c:	c0036420 	mtcr      	r3, cr<0, 0>
					 "mtcr %0 , psr \n\r"
					 : 
					 :"r"(PSR)
					);

	return HWD->QUOTIENT;
    6b20:	9202      	ld.w      	r0, (r2, 0x8)
}
    6b22:	1481      	pop      	r4
    6b24:	20000004 	.long	0x20000004

Disassembly of section .text.__modsi3:

00006b28 <__modsi3>:

int __modsi3 ( int a,  int b)
{   
    6b28:	14c1      	push      	r4
	int PSR;
	__asm volatile(
    6b2a:	c0006023 	mfcr      	r3, cr<0, 0>
    6b2e:	c0807020 	psrclr      	ie
					"mfcr %0 , psr \n\r"
					"psrclr ie \n\r"
					: "=r"(PSR)
				   );
	
	HWD->CR = 0;
    6b32:	1046      	lrw      	r2, 0x20000004	// 6b48 <__modsi3+0x20>
    6b34:	3400      	movi      	r4, 0
    6b36:	9240      	ld.w      	r2, (r2, 0x0)
    6b38:	b284      	st.w      	r4, (r2, 0x10)
	HWD->DIVIDENT = a;
	HWD->DIVISOR = b;

	PSR |= 0x80000000;
    6b3a:	3bbf      	bseti      	r3, 31
	HWD->DIVIDENT = a;
    6b3c:	b200      	st.w      	r0, (r2, 0x0)
	HWD->DIVISOR = b;
    6b3e:	b221      	st.w      	r1, (r2, 0x4)
	__asm volatile(
    6b40:	c0036420 	mtcr      	r3, cr<0, 0>
					 "mtcr %0 , psr \n\r"
					 : 
					 :"r"(PSR)
					);	
	return HWD->REMAIN;
    6b44:	9203      	ld.w      	r0, (r2, 0xc)
}
    6b46:	1481      	pop      	r4
    6b48:	20000004 	.long	0x20000004

Disassembly of section .text.__umodsi3:

00006b4c <__umodsi3>:

unsigned int __umodsi3 ( unsigned int a,  unsigned int b)
{   
    6b4c:	14c1      	push      	r4
	int PSR;
	__asm volatile(
    6b4e:	c0006023 	mfcr      	r3, cr<0, 0>
    6b52:	c0807020 	psrclr      	ie
					"mfcr %0 , psr \n\r"
					"psrclr ie \n\r"
					: "=r"(PSR)
				   );
	
	HWD->CR = 1;
    6b56:	1046      	lrw      	r2, 0x20000004	// 6b6c <__umodsi3+0x20>
    6b58:	3401      	movi      	r4, 1
    6b5a:	9240      	ld.w      	r2, (r2, 0x0)
    6b5c:	b284      	st.w      	r4, (r2, 0x10)
	HWD->DIVIDENT = a;
	HWD->DIVISOR = b;

	PSR |= 0x80000000;
    6b5e:	3bbf      	bseti      	r3, 31
	HWD->DIVIDENT = a;
    6b60:	b200      	st.w      	r0, (r2, 0x0)
	HWD->DIVISOR = b;
    6b62:	b221      	st.w      	r1, (r2, 0x4)
	__asm volatile(
    6b64:	c0036420 	mtcr      	r3, cr<0, 0>
					 "mtcr %0 , psr \n\r"
					 : 
					 :"r"(PSR)
					);	
	return HWD->REMAIN;
    6b68:	9203      	ld.w      	r0, (r2, 0xc)
}
    6b6a:	1481      	pop      	r4
    6b6c:	20000004 	.long	0x20000004

Disassembly of section .text.CK_CPU_EnAllNormalIrq:

00006b70 <CK_CPU_EnAllNormalIrq>:
}


void CK_CPU_EnAllNormalIrq(void)
{
  asm  ("psrset ee,ie");
    6b70:	c1807420 	psrset      	ee, ie
}
    6b74:	783c      	jmp      	r15

Disassembly of section .text.CK_CPU_DisAllNormalIrq:

00006b76 <CK_CPU_DisAllNormalIrq>:

void CK_CPU_DisAllNormalIrq(void)
{
 asm  ("psrclr ie");
    6b76:	c0807020 	psrclr      	ie
}
    6b7a:	783c      	jmp      	r15

Disassembly of section .text.LPT_Init:

00006b7c <LPT_Init>:
	CK_CPU_EnAllNormalIrq(); 
}

/* state machine时基初始化 */
void LPT_Init(void)
{
    6b7c:	14d1      	push      	r4, r15
    6b7e:	1422      	subi      	r14, r14, 8
	U32_T period = SYSCLK / 4 / 1000;
    6b80:	1070      	lrw      	r3, 0x20000000	// 6bc0 <LPT_Init+0x44>
    6b82:	9380      	ld.w      	r4, (r3, 0x0)
	
	LPT_DeInit();
    6b84:	e3fff282 	bsr      	0x5088	// 5088 <LPT_DeInit>
	/* LPTCLK = PCLK / 4；Immediate模式；不分频；连续计数工作模式 */
	LPT_Configure(LPTCLK_EN, LPT_PCLK_DIV4, LPT_IMMEDIATE, LPT_PSC_DIV0, 0, LPT_OPM_CONTINUOUS);
    6b88:	3300      	movi      	r3, 0
    6b8a:	b861      	st.w      	r3, (r14, 0x4)
    6b8c:	b860      	st.w      	r3, (r14, 0x0)
    6b8e:	3240      	movi      	r2, 64
    6b90:	3100      	movi      	r1, 0
    6b92:	3001      	movi      	r0, 1
    6b94:	e3fff298 	bsr      	0x50c4	// 50c4 <LPT_Configure>
	U32_T period = SYSCLK / 4 / 1000;
    6b98:	31fa      	movi      	r1, 250
    6b9a:	4124      	lsli      	r1, r1, 4
    6b9c:	6c13      	mov      	r0, r4
    6b9e:	e3ffffb3 	bsr      	0x6b04	// 6b04 <__udivsi3>
	LPT_Period_CMP_Write(period, 0); /* 每1ms进一次中断 */
    6ba2:	7401      	zexth      	r0, r0
    6ba4:	3100      	movi      	r1, 0
    6ba6:	e3fff2a5 	bsr      	0x50f0	// 50f0 <LPT_Period_CMP_Write>
	LPT_ConfigInterrupt_CMD(ENABLE, LPT_PEND); /* 使能周期结束中断 */
    6baa:	3104      	movi      	r1, 4
    6bac:	3001      	movi      	r0, 1
    6bae:	e3fff2b9 	bsr      	0x5120	// 5120 <LPT_ConfigInterrupt_CMD>
	LPT_INT_ENABLE(); /* 使能NVIC响应中断 */
    6bb2:	e3fff2c5 	bsr      	0x513c	// 513c <LPT_INT_ENABLE>
	LPT_Start();
    6bb6:	e3fff2a5 	bsr      	0x5100	// 5100 <LPT_Start>
}
    6bba:	1402      	addi      	r14, r14, 8
    6bbc:	1491      	pop      	r4, r15
    6bbe:	0000      	bkpt
    6bc0:	20000000 	.long	0x20000000

Disassembly of section .text.led_hardware_setup:

00006bc4 <led_hardware_setup>:
	3.LEDB--GPIOA0.08
	4.EPT_CLK = PCLK / (555 + 1) = 5556KHZ / 556 ≈ 10KHZ
	5.GPT_CLK = PCLK / (555 + 1) = 5556KHZ / 556 ≈ 10KHZ
  */
void led_hardware_setup(void)
{
    6bc4:	14d1      	push      	r4, r15
    6bc6:	1429      	subi      	r14, r14, 36
	/* 红灯引脚初始化 */
	EPT_Software_Prg();
    6bc8:	e3fff56a 	bsr      	0x569c	// 569c <EPT_Software_Prg>
	EPT_IO_SET(EPT_IO_CHBX, IO_NUM_PB02);
    6bcc:	3116      	movi      	r1, 22
    6bce:	3002      	movi      	r0, 2
    6bd0:	e3fff59e 	bsr      	0x570c	// 570c <EPT_IO_SET>
	/* PCLK作为时钟源；Immediate模式；递增模式；连续计数工作模式；EPTCLK = PCLK / (PSC + 1)；波形输出被停止时，GPIO高阻输出 */
	EPT_PWM_Config(EPT_Selecte_PCLK, EPT_CNTMD_increase, EPT_OPM_Continue, 55);
    6bd4:	3337      	movi      	r3, 55
    6bd6:	3200      	movi      	r2, 0
    6bd8:	3100      	movi      	r1, 0
    6bda:	3000      	movi      	r0, 0
    6bdc:	e3fff6ac 	bsr      	0x5934	// 5934 <EPT_PWM_Config>
	/* CMPB作为CA和CB的数据源；当CNT等于零时，置位输出；当CNT等于PRDR时，不动作；当CNT等于CA，且此时计数方向为递增时，清除输出 */
	EPT_PWMX_Output_Control(EPT_PWMB, EPT_CA_Selecte_CMPB, EPT_CB_Selecte_CMPB, EPT_PWM_ZRO_Event_OutHigh, EPT_PWM_PRD_Event_Nochange, EPT_PWM_CAU_Event_OutLow, EPT_PWM_CAD_Event_Nochange,
    6be0:	3400      	movi      	r4, 0
    6be2:	3310      	movi      	r3, 16
    6be4:	3280      	movi      	r2, 128
    6be6:	3180      	movi      	r1, 128
    6be8:	b888      	st.w      	r4, (r14, 0x20)
    6bea:	b887      	st.w      	r4, (r14, 0x1c)
    6bec:	b886      	st.w      	r4, (r14, 0x18)
    6bee:	b885      	st.w      	r4, (r14, 0x14)
    6bf0:	b884      	st.w      	r4, (r14, 0x10)
    6bf2:	b883      	st.w      	r4, (r14, 0xc)
    6bf4:	b882      	st.w      	r4, (r14, 0x8)
    6bf6:	b861      	st.w      	r3, (r14, 0x4)
    6bf8:	b880      	st.w      	r4, (r14, 0x0)
    6bfa:	424f      	lsli      	r2, r2, 15
    6bfc:	412d      	lsli      	r1, r1, 13
    6bfe:	3302      	movi      	r3, 2
    6c00:	3001      	movi      	r0, 1
    6c02:	e3fff6b3 	bsr      	0x5968	// 5968 <EPT_PWMX_Output_Control>
							EPT_PWM_CBU_Event_Nochange, EPT_PWM_CBD_Event_Nochange, EPT_PWM_T1U_Event_Nochange, EPT_PWM_T1D_Event_Nochange, EPT_PWM_T2U_Event_Nochange, EPT_PWM_T2D_Event_Nochange);	
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(2000, 0, 2000, 0, 0); /* PWM频率：50HZ */	
    6c06:	32fa      	movi      	r2, 250
    6c08:	4243      	lsli      	r2, r2, 3
    6c0a:	3300      	movi      	r3, 0
    6c0c:	6c0b      	mov      	r0, r2
    6c0e:	3100      	movi      	r1, 0
    6c10:	b880      	st.w      	r4, (r14, 0x0)
    6c12:	e3fff717 	bsr      	0x5a40	// 5a40 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config>
	EPT_Int_Enable(EPT_PEND); /* 使能周期结束中断 */
    6c16:	3080      	movi      	r0, 128
    6c18:	4009      	lsli      	r0, r0, 9
    6c1a:	e3fff721 	bsr      	0x5a5c	// 5a5c <EPT_Int_Enable>
	EPT_Vector_Int_Enable();
    6c1e:	e3fff729 	bsr      	0x5a70	// 5a70 <EPT_Vector_Int_Enable>
	//EPT_Start();
	EPT_Stop(); /* 红灯默认关闭 */

	/* 蓝灯引脚初始化 */
	GPIO_Init(blue_led_pin, Output); /* 输出模式，输入禁止 */
    6c22:	108a      	lrw      	r4, 0x20000050	// 6c48 <led_hardware_setup+0x84>
	EPT_Stop(); /* 红灯默认关闭 */
    6c24:	e3fff560 	bsr      	0x56e4	// 56e4 <EPT_Stop>
	GPIO_Init(blue_led_pin, Output); /* 输出模式，输入禁止 */
    6c28:	3200      	movi      	r2, 0
    6c2a:	9400      	ld.w      	r0, (r4, 0x0)
    6c2c:	3108      	movi      	r1, 8
    6c2e:	e3fff029 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_High(blue_led_pin);
    6c32:	9400      	ld.w      	r0, (r4, 0x0)
    6c34:	3108      	movi      	r1, 8
    6c36:	e3fff20d 	bsr      	0x5050	// 5050 <GPIO_Write_High>
	
	/* 绿灯引脚初始化 */
	EPT_IO_SET(EPT_IO_CHAY, IO_NUM_PB03);
    6c3a:	3113      	movi      	r1, 19
    6c3c:	3001      	movi      	r0, 1
    6c3e:	e3fff567 	bsr      	0x570c	// 570c <EPT_IO_SET>
	//GPIO_Init(green_led_pin, Output); /* 输出模式，输入禁止 */
	//GPIO_Write_High(green_led_pin);
}
    6c42:	1409      	addi      	r14, r14, 36
    6c44:	1491      	pop      	r4, r15
    6c46:	0000      	bkpt
    6c48:	20000050 	.long	0x20000050

Disassembly of section .text.EPT0IntHandler:

00006c4c <EPT0IntHandler>:

/* EPT0 Interrupt */
void EPT0IntHandler(void) 
{
    6c4c:	1460      	nie
    6c4e:	1462      	ipush
    6c50:	14d1      	push      	r4, r15
	if((EPT0->MISR & EPT_PEND) == EPT_PEND)
    6c52:	1374      	lrw      	r3, 0x20000024	// 6e20 <EPT0IntHandler+0x1d4>
    6c54:	3080      	movi      	r0, 128
    6c56:	9320      	ld.w      	r1, (r3, 0x0)
    6c58:	5960      	addu      	r3, r1, r0
    6c5a:	3280      	movi      	r2, 128
    6c5c:	9395      	ld.w      	r4, (r3, 0x54)
    6c5e:	4249      	lsli      	r2, r2, 9
    6c60:	6908      	and      	r4, r2
    6c62:	3c40      	cmpnei      	r4, 0
    6c64:	0c47      	bf      	0x6cf2	// 6cf2 <EPT0IntHandler+0xa6>
	{
		EPT0->ICR = EPT_PEND;
    6c66:	b357      	st.w      	r2, (r3, 0x5c)
		
		static U8_T flag = 0;
		static U8_T BreathCnt = 0;
		static U8_T SoildTime = 0;

		if((EPT0->CMPB == 0) && (SoildTime == 25)) flag = 1;
    6c68:	914c      	ld.w      	r2, (r1, 0x30)
    6c6a:	3a40      	cmpnei      	r2, 0
    6c6c:	134e      	lrw      	r2, 0x2000024c	// 6e24 <EPT0IntHandler+0x1d8>
    6c6e:	0817      	bt      	0x6c9c	// 6c9c <EPT0IntHandler+0x50>
    6c70:	8200      	ld.b      	r0, (r2, 0x0)
    6c72:	3859      	cmpnei      	r0, 25
    6c74:	0814      	bt      	0x6c9c	// 6c9c <EPT0IntHandler+0x50>
    6c76:	3001      	movi      	r0, 1
    6c78:	a201      	st.b      	r0, (r2, 0x1)
		{
			flag = 0;
			BreathCnt = 0;
			SoildTime = 0;
		}
		if(flag == 0) /* 暗到亮 */
    6c7a:	8201      	ld.b      	r0, (r2, 0x1)
    6c7c:	3840      	cmpnei      	r0, 0
    6c7e:	081d      	bt      	0x6cb8	// 6cb8 <EPT0IntHandler+0x6c>
		{
			if(EPT0->CMPB == 0) SoildTime++; /* 亮0.5秒后变暗 */
    6c80:	910c      	ld.w      	r0, (r1, 0x30)
    6c82:	3840      	cmpnei      	r0, 0
    6c84:	0816      	bt      	0x6cb0	// 6cb0 <EPT0IntHandler+0x64>
    6c86:	8220      	ld.b      	r1, (r2, 0x0)
    6c88:	2100      	addi      	r1, 1
    6c8a:	a220      	st.b      	r1, (r2, 0x0)
	else if((EPT0->MISR & EPT_CDD) == EPT_CDD)
	{
		EPT0->ICR = EPT_CDD;
	}
	//紧急中断
	if((EPT0->EMMISR & EPT_EP0_EMINT) == EPT_EP0_EMINT)
    6c8c:	934b      	ld.w      	r2, (r3, 0x2c)
    6c8e:	3001      	movi      	r0, 1
    6c90:	6880      	and      	r2, r0
    6c92:	3a40      	cmpnei      	r2, 0
    6c94:	3180      	movi      	r1, 128
    6c96:	0c8c      	bf      	0x6dae	// 6dae <EPT0IntHandler+0x162>
	{
		EPT0->EMICR = EPT_EP5_EMINT;
	}
	else if((EPT0->EMMISR & EPT_EP6_EMINT) == EPT_EP6_EMINT)
	{
		EPT0->EMICR = EPT_EP6_EMINT;
    6c98:	b30d      	st.w      	r0, (r3, 0x34)
    6c9a:	041e      	br      	0x6cd6	// 6cd6 <EPT0IntHandler+0x8a>
		else if(EPT0->CMPB == 2000) 
    6c9c:	30fa      	movi      	r0, 250
    6c9e:	918c      	ld.w      	r4, (r1, 0x30)
    6ca0:	4003      	lsli      	r0, r0, 3
    6ca2:	6412      	cmpne      	r4, r0
    6ca4:	0beb      	bt      	0x6c7a	// 6c7a <EPT0IntHandler+0x2e>
			flag = 0;
    6ca6:	3000      	movi      	r0, 0
    6ca8:	a201      	st.b      	r0, (r2, 0x1)
			BreathCnt = 0;
    6caa:	a202      	st.b      	r0, (r2, 0x2)
			SoildTime = 0;
    6cac:	a200      	st.b      	r0, (r2, 0x0)
    6cae:	07e6      	br      	0x6c7a	// 6c7a <EPT0IntHandler+0x2e>
			else EPT0->CMPB -= 80;
    6cb0:	914c      	ld.w      	r2, (r1, 0x30)
    6cb2:	2a4f      	subi      	r2, 80
    6cb4:	b14c      	st.w      	r2, (r1, 0x30)
    6cb6:	07eb      	br      	0x6c8c	// 6c8c <EPT0IntHandler+0x40>
		else if(flag == 1) /* 亮到暗 */
    6cb8:	3841      	cmpnei      	r0, 1
    6cba:	0be9      	bt      	0x6c8c	// 6c8c <EPT0IntHandler+0x40>
			if(EPT0->CMPB == 1976) BreathCnt++; /* 完成一次呼吸灯 */
    6cbc:	30f7      	movi      	r0, 247
    6cbe:	918c      	ld.w      	r4, (r1, 0x30)
    6cc0:	4003      	lsli      	r0, r0, 3
    6cc2:	6412      	cmpne      	r4, r0
    6cc4:	080f      	bt      	0x6ce2	// 6ce2 <EPT0IntHandler+0x96>
    6cc6:	8222      	ld.b      	r1, (r2, 0x2)
    6cc8:	2100      	addi      	r1, 1
    6cca:	a222      	st.b      	r1, (r2, 0x2)
			if(BreathCnt == 1)
    6ccc:	8242      	ld.b      	r2, (r2, 0x2)
    6cce:	3a41      	cmpnei      	r2, 1
    6cd0:	0bde      	bt      	0x6c8c	// 6c8c <EPT0IntHandler+0x40>
				EPT_Stop();
    6cd2:	e3fff509 	bsr      	0x56e4	// 56e4 <EPT_Stop>
	}
	else if((EPT0->EMMISR & EPT_EOM_FAULT_EMINT) == EPT_EOM_FAULT_EMINT)
	{
		EPT0->EMICR = EPT_EOM_FAULT_EMINT;
	}
}
    6cd6:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    6cda:	9880      	ld.w      	r4, (r14, 0x0)
    6cdc:	1402      	addi      	r14, r14, 8
    6cde:	1463      	ipop
    6ce0:	1461      	nir
				else if(EPT0->CMPB < 1976) EPT0->CMPB += 26;
    6ce2:	918c      	ld.w      	r4, (r1, 0x30)
    6ce4:	1211      	lrw      	r0, 0x7b7	// 6e28 <EPT0IntHandler+0x1dc>
    6ce6:	6500      	cmphs      	r0, r4
    6ce8:	0ff2      	bf      	0x6ccc	// 6ccc <EPT0IntHandler+0x80>
    6cea:	910c      	ld.w      	r0, (r1, 0x30)
    6cec:	2019      	addi      	r0, 26
    6cee:	b10c      	st.w      	r0, (r1, 0x30)
    6cf0:	07ee      	br      	0x6ccc	// 6ccc <EPT0IntHandler+0x80>
	else if((EPT0->MISR & EPT_TRGEV0_INT) == EPT_TRGEV0_INT)
    6cf2:	9355      	ld.w      	r2, (r3, 0x54)
    6cf4:	3101      	movi      	r1, 1
    6cf6:	6884      	and      	r2, r1
    6cf8:	3a40      	cmpnei      	r2, 0
    6cfa:	0c03      	bf      	0x6d00	// 6d00 <EPT0IntHandler+0xb4>
		EPT0->ICR = EPT_CAP_LD2;
    6cfc:	b337      	st.w      	r1, (r3, 0x5c)
    6cfe:	07c7      	br      	0x6c8c	// 6c8c <EPT0IntHandler+0x40>
	else if((EPT0->MISR & EPT_TRGEV1_INT) == EPT_TRGEV1_INT)
    6d00:	9355      	ld.w      	r2, (r3, 0x54)
    6d02:	3102      	movi      	r1, 2
    6d04:	6884      	and      	r2, r1
    6d06:	3a40      	cmpnei      	r2, 0
    6d08:	0bfa      	bt      	0x6cfc	// 6cfc <EPT0IntHandler+0xb0>
	else if((EPT0->MISR & EPT_TRGEV2_INT) == EPT_TRGEV2_INT)
    6d0a:	9355      	ld.w      	r2, (r3, 0x54)
    6d0c:	3104      	movi      	r1, 4
    6d0e:	6884      	and      	r2, r1
    6d10:	3a40      	cmpnei      	r2, 0
    6d12:	0bf5      	bt      	0x6cfc	// 6cfc <EPT0IntHandler+0xb0>
	else if((EPT0->MISR & EPT_TRGEV3_INT) == EPT_TRGEV3_INT)
    6d14:	9355      	ld.w      	r2, (r3, 0x54)
    6d16:	3108      	movi      	r1, 8
    6d18:	6884      	and      	r2, r1
    6d1a:	3a40      	cmpnei      	r2, 0
    6d1c:	0bf0      	bt      	0x6cfc	// 6cfc <EPT0IntHandler+0xb0>
	else if((EPT0->MISR & EPT_CAP_LD0) == EPT_CAP_LD0)
    6d1e:	9355      	ld.w      	r2, (r3, 0x54)
    6d20:	3110      	movi      	r1, 16
    6d22:	6884      	and      	r2, r1
    6d24:	3a40      	cmpnei      	r2, 0
    6d26:	0beb      	bt      	0x6cfc	// 6cfc <EPT0IntHandler+0xb0>
	else if((EPT0->MISR & EPT_CAP_LD1) == EPT_CAP_LD1)
    6d28:	9355      	ld.w      	r2, (r3, 0x54)
    6d2a:	3120      	movi      	r1, 32
    6d2c:	6884      	and      	r2, r1
    6d2e:	3a40      	cmpnei      	r2, 0
    6d30:	0be6      	bt      	0x6cfc	// 6cfc <EPT0IntHandler+0xb0>
	else if((EPT0->MISR & EPT_CAP_LD2) == EPT_CAP_LD2)
    6d32:	9355      	ld.w      	r2, (r3, 0x54)
    6d34:	3140      	movi      	r1, 64
    6d36:	6884      	and      	r2, r1
    6d38:	3a40      	cmpnei      	r2, 0
    6d3a:	0be1      	bt      	0x6cfc	// 6cfc <EPT0IntHandler+0xb0>
	else if((EPT0->MISR & EPT_CAP_LD3) == EPT_CAP_LD3)
    6d3c:	9355      	ld.w      	r2, (r3, 0x54)
    6d3e:	6880      	and      	r2, r0
    6d40:	3a40      	cmpnei      	r2, 0
    6d42:	0c03      	bf      	0x6d48	// 6d48 <EPT0IntHandler+0xfc>
		EPT0->ICR = EPT_CAP_LD3;
    6d44:	b317      	st.w      	r0, (r3, 0x5c)
    6d46:	07a3      	br      	0x6c8c	// 6c8c <EPT0IntHandler+0x40>
	else if((EPT0->MISR & EPT_CAU) == EPT_CAU)
    6d48:	3280      	movi      	r2, 128
    6d4a:	9335      	ld.w      	r1, (r3, 0x54)
    6d4c:	4241      	lsli      	r2, r2, 1
    6d4e:	6848      	and      	r1, r2
    6d50:	3940      	cmpnei      	r1, 0
    6d52:	0c03      	bf      	0x6d58	// 6d58 <EPT0IntHandler+0x10c>
		EPT0->ICR = EPT_CDD;
    6d54:	b357      	st.w      	r2, (r3, 0x5c)
    6d56:	079b      	br      	0x6c8c	// 6c8c <EPT0IntHandler+0x40>
	else if((EPT0->MISR & EPT_CAD) == EPT_CAD)
    6d58:	3280      	movi      	r2, 128
    6d5a:	9335      	ld.w      	r1, (r3, 0x54)
    6d5c:	4242      	lsli      	r2, r2, 2
    6d5e:	6848      	and      	r1, r2
    6d60:	3940      	cmpnei      	r1, 0
    6d62:	0bf9      	bt      	0x6d54	// 6d54 <EPT0IntHandler+0x108>
	else if((EPT0->MISR & EPT_CBU) == EPT_CBU)
    6d64:	3280      	movi      	r2, 128
    6d66:	9335      	ld.w      	r1, (r3, 0x54)
    6d68:	4243      	lsli      	r2, r2, 3
    6d6a:	6848      	and      	r1, r2
    6d6c:	3940      	cmpnei      	r1, 0
    6d6e:	0bf3      	bt      	0x6d54	// 6d54 <EPT0IntHandler+0x108>
	else if((EPT0->MISR & EPT_CBD) == EPT_CBD)
    6d70:	3280      	movi      	r2, 128
    6d72:	9335      	ld.w      	r1, (r3, 0x54)
    6d74:	4244      	lsli      	r2, r2, 4
    6d76:	6848      	and      	r1, r2
    6d78:	3940      	cmpnei      	r1, 0
    6d7a:	0bed      	bt      	0x6d54	// 6d54 <EPT0IntHandler+0x108>
	else if((EPT0->MISR & EPT_CCU) == EPT_CCU)
    6d7c:	3280      	movi      	r2, 128
    6d7e:	9335      	ld.w      	r1, (r3, 0x54)
    6d80:	4245      	lsli      	r2, r2, 5
    6d82:	6848      	and      	r1, r2
    6d84:	3940      	cmpnei      	r1, 0
    6d86:	0be7      	bt      	0x6d54	// 6d54 <EPT0IntHandler+0x108>
	else if((EPT0->MISR & EPT_CCD) == EPT_CCD)
    6d88:	3280      	movi      	r2, 128
    6d8a:	9335      	ld.w      	r1, (r3, 0x54)
    6d8c:	4246      	lsli      	r2, r2, 6
    6d8e:	6848      	and      	r1, r2
    6d90:	3940      	cmpnei      	r1, 0
    6d92:	0be1      	bt      	0x6d54	// 6d54 <EPT0IntHandler+0x108>
	else if((EPT0->MISR & EPT_CDU) == EPT_CDU)
    6d94:	3280      	movi      	r2, 128
    6d96:	9335      	ld.w      	r1, (r3, 0x54)
    6d98:	4247      	lsli      	r2, r2, 7
    6d9a:	6848      	and      	r1, r2
    6d9c:	3940      	cmpnei      	r1, 0
    6d9e:	0bdb      	bt      	0x6d54	// 6d54 <EPT0IntHandler+0x108>
	else if((EPT0->MISR & EPT_CDD) == EPT_CDD)
    6da0:	3280      	movi      	r2, 128
    6da2:	9335      	ld.w      	r1, (r3, 0x54)
    6da4:	4248      	lsli      	r2, r2, 8
    6da6:	6848      	and      	r1, r2
    6da8:	3940      	cmpnei      	r1, 0
    6daa:	0f71      	bf      	0x6c8c	// 6c8c <EPT0IntHandler+0x40>
    6dac:	07d4      	br      	0x6d54	// 6d54 <EPT0IntHandler+0x108>
	else if((EPT0->EMMISR & EPT_EP1_EMINT) == EPT_EP1_EMINT)
    6dae:	934b      	ld.w      	r2, (r3, 0x2c)
    6db0:	3002      	movi      	r0, 2
    6db2:	6880      	and      	r2, r0
    6db4:	3a40      	cmpnei      	r2, 0
    6db6:	0b71      	bt      	0x6c98	// 6c98 <EPT0IntHandler+0x4c>
	else if((EPT0->EMMISR & EPT_EP2_EMINT) == EPT_EP2_EMINT)
    6db8:	934b      	ld.w      	r2, (r3, 0x2c)
    6dba:	3004      	movi      	r0, 4
    6dbc:	6880      	and      	r2, r0
    6dbe:	3a40      	cmpnei      	r2, 0
    6dc0:	0b6c      	bt      	0x6c98	// 6c98 <EPT0IntHandler+0x4c>
	else if((EPT0->EMMISR & EPT_EP3_EMINT) == EPT_EP3_EMINT)
    6dc2:	934b      	ld.w      	r2, (r3, 0x2c)
    6dc4:	3008      	movi      	r0, 8
    6dc6:	6880      	and      	r2, r0
    6dc8:	3a40      	cmpnei      	r2, 0
    6dca:	0b67      	bt      	0x6c98	// 6c98 <EPT0IntHandler+0x4c>
	else if((EPT0->EMMISR & EPT_EP4_EMINT) == EPT_EP4_EMINT)
    6dcc:	934b      	ld.w      	r2, (r3, 0x2c)
    6dce:	3010      	movi      	r0, 16
    6dd0:	6880      	and      	r2, r0
    6dd2:	3a40      	cmpnei      	r2, 0
    6dd4:	0b62      	bt      	0x6c98	// 6c98 <EPT0IntHandler+0x4c>
	else if((EPT0->EMMISR & EPT_EP5_EMINT) == EPT_EP5_EMINT)
    6dd6:	934b      	ld.w      	r2, (r3, 0x2c)
    6dd8:	3020      	movi      	r0, 32
    6dda:	6880      	and      	r2, r0
    6ddc:	3a40      	cmpnei      	r2, 0
    6dde:	0b5d      	bt      	0x6c98	// 6c98 <EPT0IntHandler+0x4c>
	else if((EPT0->EMMISR & EPT_EP6_EMINT) == EPT_EP6_EMINT)
    6de0:	934b      	ld.w      	r2, (r3, 0x2c)
    6de2:	3040      	movi      	r0, 64
    6de4:	6880      	and      	r2, r0
    6de6:	3a40      	cmpnei      	r2, 0
    6de8:	0b58      	bt      	0x6c98	// 6c98 <EPT0IntHandler+0x4c>
	else if((EPT0->EMMISR & EPT_EP7_EMINT) == EPT_EP7_EMINT)
    6dea:	934b      	ld.w      	r2, (r3, 0x2c)
    6dec:	6884      	and      	r2, r1
    6dee:	3a40      	cmpnei      	r2, 0
    6df0:	0c03      	bf      	0x6df6	// 6df6 <EPT0IntHandler+0x1aa>
		EPT0->EMICR = EPT_EP7_EMINT;
    6df2:	b32d      	st.w      	r1, (r3, 0x34)
    6df4:	0771      	br      	0x6cd6	// 6cd6 <EPT0IntHandler+0x8a>
	else if((EPT0->EMMISR & EPT_CPU_FAULT_EMINT) == EPT_CPU_FAULT_EMINT)
    6df6:	3280      	movi      	r2, 128
    6df8:	932b      	ld.w      	r1, (r3, 0x2c)
    6dfa:	4241      	lsli      	r2, r2, 1
    6dfc:	6848      	and      	r1, r2
    6dfe:	3940      	cmpnei      	r1, 0
    6e00:	0c03      	bf      	0x6e06	// 6e06 <EPT0IntHandler+0x1ba>
		EPT0->EMICR = EPT_EOM_FAULT_EMINT;
    6e02:	b34d      	st.w      	r2, (r3, 0x34)
    6e04:	0769      	br      	0x6cd6	// 6cd6 <EPT0IntHandler+0x8a>
	else if((EPT0->EMMISR & EPT_MEM_FAULT_EMINT) == EPT_MEM_FAULT_EMINT)
    6e06:	3280      	movi      	r2, 128
    6e08:	932b      	ld.w      	r1, (r3, 0x2c)
    6e0a:	4242      	lsli      	r2, r2, 2
    6e0c:	6848      	and      	r1, r2
    6e0e:	3940      	cmpnei      	r1, 0
    6e10:	0bf9      	bt      	0x6e02	// 6e02 <EPT0IntHandler+0x1b6>
	else if((EPT0->EMMISR & EPT_EOM_FAULT_EMINT) == EPT_EOM_FAULT_EMINT)
    6e12:	3280      	movi      	r2, 128
    6e14:	932b      	ld.w      	r1, (r3, 0x2c)
    6e16:	4243      	lsli      	r2, r2, 3
    6e18:	6848      	and      	r1, r2
    6e1a:	3940      	cmpnei      	r1, 0
    6e1c:	0bf3      	bt      	0x6e02	// 6e02 <EPT0IntHandler+0x1b6>
    6e1e:	075c      	br      	0x6cd6	// 6cd6 <EPT0IntHandler+0x8a>
    6e20:	20000024 	.long	0x20000024
    6e24:	2000024c 	.long	0x2000024c
    6e28:	000007b7 	.long	0x000007b7

Disassembly of section .text.adc_hardware_setup:

00006e2c <adc_hardware_setup>:
	2.当选择INTVREF作为ADC参考电压时，ADC模拟模块的时钟频率不能超过2MHz。FVR做参考时，没有限制。
    3.FADC = PCLK / (2 * PRLVAL) = 48MHZ / (2 * 24) = 1MHZ
	
  */
void adc_hardware_setup(void)
{
    6e2c:	14d0      	push      	r15
    6e2e:	1422      	subi      	r14, r14, 8
	ADC12_RESET_VALUE();
    6e30:	e3fff62c 	bsr      	0x5a88	// 5a88 <ADC12_RESET_VALUE>
	ADC12_CLK_CMD(ADC_CLK_CR, ENABLE); /* 使能ADC时钟 */
    6e34:	3101      	movi      	r1, 1
    6e36:	3002      	movi      	r0, 2
    6e38:	e3fff676 	bsr      	0x5b24	// 5b24 <ADC12_CLK_CMD>
	/* 12位ADC，单次转换模式，转换优先序列寄存器为0，采样保持周期数为6，FADC=1MHZ，转换序列个数为4 */
	ADC12_Configure_Mode(ADC12_12BIT, One_shot_mode, 0, 6, 24, 4);
    6e3c:	3304      	movi      	r3, 4
    6e3e:	b861      	st.w      	r3, (r14, 0x4)
    6e40:	3318      	movi      	r3, 24
    6e42:	b860      	st.w      	r3, (r14, 0x0)
    6e44:	3200      	movi      	r2, 0
    6e46:	3306      	movi      	r3, 6
    6e48:	3100      	movi      	r1, 0
    6e4a:	3001      	movi      	r0, 1
    6e4c:	e3fff6b6 	bsr      	0x5bb8	// 5bb8 <ADC12_Configure_Mode>
	//ADC12_Configure_Mode(ADC12_12BIT, Continuous_mode, 0, 6, 24, 2);
	ADC12_Configure_VREF_Selecte(ADC12_VREFP_VDD_VREFN_VSS); /* 正向为内部VDD，负向为VSS */
    6e50:	3000      	movi      	r0, 0
    6e52:	e3fff6f1 	bsr      	0x5c34	// 5c34 <ADC12_Configure_VREF_Selecte>
	/* 转换序列0，选择ADCIN10通道, 6个转换周期, 连续重复采样次数为8，平均值计算使能 */
	ADC12_ConversionChannel_Config(ADC12_ADCIN10, ADC12_CV_RepeatNum8, ADC12_AVGEN, 0);
    6e56:	3280      	movi      	r2, 128
    6e58:	31c6      	movi      	r1, 198
    6e5a:	3300      	movi      	r3, 0
    6e5c:	4245      	lsli      	r2, r2, 5
    6e5e:	4127      	lsli      	r1, r1, 7
    6e60:	300a      	movi      	r0, 10
    6e62:	e3fff7a9 	bsr      	0x5db4	// 5db4 <ADC12_ConversionChannel_Config>
	/* 转换序列1，选择ADCIN4通道, 6个转换周期, 连续重复采样次数为8，平均值计算使能 */
	ADC12_ConversionChannel_Config(ADC12_ADCIN4, ADC12_CV_RepeatNum8, ADC12_AVGEN, 1);
    6e66:	3280      	movi      	r2, 128
    6e68:	31c6      	movi      	r1, 198
    6e6a:	3301      	movi      	r3, 1
    6e6c:	4245      	lsli      	r2, r2, 5
    6e6e:	4127      	lsli      	r1, r1, 7
    6e70:	3004      	movi      	r0, 4
    6e72:	e3fff7a1 	bsr      	0x5db4	// 5db4 <ADC12_ConversionChannel_Config>
	/* 转换序列2，选择ADCIN13通道, 6个转换周期, 连续重复采样次数为8，平均值计算使能 */
	ADC12_ConversionChannel_Config(ADC12_ADCIN13, ADC12_CV_RepeatNum8, ADC12_AVGEN, 2);
    6e76:	3280      	movi      	r2, 128
    6e78:	31c6      	movi      	r1, 198
    6e7a:	3302      	movi      	r3, 2
    6e7c:	4245      	lsli      	r2, r2, 5
    6e7e:	4127      	lsli      	r1, r1, 7
    6e80:	300d      	movi      	r0, 13
    6e82:	e3fff799 	bsr      	0x5db4	// 5db4 <ADC12_ConversionChannel_Config>
	/* 转换序列3，选择ADCIN11通道, 6个转换周期, 连续重复采样次数为8，平均值计算使能 */
	ADC12_ConversionChannel_Config(ADC12_ADCIN11, ADC12_CV_RepeatNum8, ADC12_AVGEN, 3);
    6e86:	3280      	movi      	r2, 128
    6e88:	31c6      	movi      	r1, 198
    6e8a:	3303      	movi      	r3, 3
    6e8c:	4245      	lsli      	r2, r2, 5
    6e8e:	4127      	lsli      	r1, r1, 7
    6e90:	300b      	movi      	r0, 11
    6e92:	e3fff791 	bsr      	0x5db4	// 5db4 <ADC12_ConversionChannel_Config>
	ADC12_CMD(ENABLE); /* 使能ADC模块 */
    6e96:	3001      	movi      	r0, 1
    6e98:	e3fff65c 	bsr      	0x5b50	// 5b50 <ADC12_CMD>
	ADC12_ready_wait(); /* 等待ADC完成下一个转换的准备 */
    6e9c:	e3fff66e 	bsr      	0x5b78	// 5b78 <ADC12_ready_wait>
	//ADC12_Control(ADC12_START);	/* 开始模数转换 */	
}
    6ea0:	1402      	addi      	r14, r14, 8
    6ea2:	1490      	pop      	r15

Disassembly of section .text.charging_hardware_setup:

00006ea4 <charging_hardware_setup>:
	2.GPIOB0.01--5V_EN
	3.GPIOA0.11--CHRG_STAT
	4.GPIOA0.00--NTC_DET
  */
void charging_hardware_setup(void)
{
    6ea4:	14d1      	push      	r4, r15
	/* 5V升压引脚初始化 */
	GPIO_Init(charge_5V_boost_pin, Output); /* 输出模式，输入禁止 */
    6ea6:	119d      	lrw      	r4, 0x2000004c	// 6f98 <charging_hardware_setup+0xf4>
    6ea8:	3200      	movi      	r2, 0
    6eaa:	9400      	ld.w      	r0, (r4, 0x0)
    6eac:	3101      	movi      	r1, 1
    6eae:	e3ffeee9 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_Low(charge_5V_boost_pin);
    6eb2:	9400      	ld.w      	r0, (r4, 0x0)
    6eb4:	3101      	movi      	r1, 1
    6eb6:	e3fff0d1 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
	
	/* USB5V插入检测引脚初始化 */
	GPIO_IntGroup_Set(GPIOA, 3, Selete_EXI_PIN3); /* 外部中断组1选择GPIOA0.01作为中断源 */								
    6eba:	3203      	movi      	r2, 3
    6ebc:	3103      	movi      	r1, 3
    6ebe:	3000      	movi      	r0, 0
    6ec0:	e3ffefbe 	bsr      	0x4e3c	// 4e3c <GPIO_IntGroup_Set>
	GPIOA0_EXI_Init(EXI3); /* GPIOA0.01设置为输入模式，输出禁止 */ 
	GPIO_PullHighLow_DIS(charge_USB5V_detect_pin);
    6ec4:	1196      	lrw      	r4, 0x20000050	// 6f9c <charging_hardware_setup+0xf8>
	GPIOA0_EXI_Init(EXI3); /* GPIOA0.01设置为输入模式，输出禁止 */ 
    6ec6:	3003      	movi      	r0, 3
    6ec8:	e3fff040 	bsr      	0x4f48	// 4f48 <GPIOA0_EXI_Init>
	GPIO_PullHighLow_DIS(charge_USB5V_detect_pin);
    6ecc:	9400      	ld.w      	r0, (r4, 0x0)
    6ece:	3103      	movi      	r1, 3
    6ed0:	e3ffefae 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
	EXTI_trigger_CMD(ENABLE, EXI_PIN3, _EXIRT); /* EXI1上升沿触发中断 */ 
    6ed4:	3200      	movi      	r2, 0
    6ed6:	3108      	movi      	r1, 8
    6ed8:	3001      	movi      	r0, 1
    6eda:	e3ffedf1 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	EXTI_trigger_CMD(ENABLE, EXI_PIN3, _EXIFT); /* EXI1下降沿触发中断 */ 
    6ede:	3201      	movi      	r2, 1
    6ee0:	3108      	movi      	r1, 8
    6ee2:	3001      	movi      	r0, 1
    6ee4:	e3ffedec 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	EXTI_interrupt_CMD(ENABLE, EXI_PIN3); /* 打开EXI1中断源 */
    6ee8:	3108      	movi      	r1, 8
    6eea:	3001      	movi      	r0, 1
    6eec:	e3ffee08 	bsr      	0x4afc	// 4afc <EXTI_interrupt_CMD>
	GPIO_EXI_EN(GPIOA0, EXI3); /* 使能EXI1外部中断 */
    6ef0:	9400      	ld.w      	r0, (r4, 0x0)
    6ef2:	3103      	movi      	r1, 3
    6ef4:	e3fff0a8 	bsr      	0x5044	// 5044 <GPIO_EXI_EN>
	EXI2_Int_Enable(); /* 使能NVIC对EXI1中断向量的响应 */
    6ef8:	e3ffee34 	bsr      	0x4b60	// 4b60 <EXI2_Int_Enable>
	EXI2_WakeUp_Enable();
    6efc:	e3ffee58 	bsr      	0x4bac	// 4bac <EXI2_WakeUp_Enable>
	
	/* 充电状态引脚初始化 */
	GPIO_Init(charge_status_pin, Intput);
    6f00:	3201      	movi      	r2, 1
    6f02:	9400      	ld.w      	r0, (r4, 0x0)
    6f04:	310b      	movi      	r1, 11
    6f06:	e3ffeebd 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_PullHigh_Init(charge_status_pin);
    6f0a:	9400      	ld.w      	r0, (r4, 0x0)
    6f0c:	310b      	movi      	r1, 11
    6f0e:	e3ffef7b 	bsr      	0x4e04	// 4e04 <GPIO_PullHigh_Init>
	
	/* 充电使能引脚初始化 */
	GPIO_Init(charge_enable_pin, Output); /* 输出模式，输入禁止 */
    6f12:	3200      	movi      	r2, 0
    6f14:	9400      	ld.w      	r0, (r4, 0x0)
    6f16:	3106      	movi      	r1, 6
    6f18:	e3ffeeb4 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_Low(charge_enable_pin);
    6f1c:	9400      	ld.w      	r0, (r4, 0x0)
    6f1e:	3106      	movi      	r1, 6
    6f20:	e3fff09c 	bsr      	0x5058	// 5058 <GPIO_Write_Low>

	/* ntc det引脚初始化 */
	GPIO_Init(NTC_detect_pin, Output); /* 输出模式，输入禁止 */
    6f24:	3200      	movi      	r2, 0
    6f26:	9400      	ld.w      	r0, (r4, 0x0)
    6f28:	310e      	movi      	r1, 14
    6f2a:	e3ffeeab 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_Low(NTC_detect_pin);
    6f2e:	9400      	ld.w      	r0, (r4, 0x0)
    6f30:	310e      	movi      	r1, 14
    6f32:	e3fff093 	bsr      	0x5058	// 5058 <GPIO_Write_Low>

	//充电分段电流引脚初始化
	GPIO_Init(charge_wireless_iset_pin, Output); /* 输出模式，输入禁止 */
    6f36:	3200      	movi      	r2, 0
    6f38:	9400      	ld.w      	r0, (r4, 0x0)
    6f3a:	3107      	movi      	r1, 7
    6f3c:	e3ffeea2 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_Low(charge_wireless_iset_pin);
    6f40:	9400      	ld.w      	r0, (r4, 0x0)
    6f42:	3107      	movi      	r1, 7
    6f44:	e3fff08a 	bsr      	0x5058	// 5058 <GPIO_Write_Low>

	GPIO_InPutOutPut_Disable(charge_wired_iset_pin);
    6f48:	9400      	ld.w      	r0, (r4, 0x0)
    6f4a:	310f      	movi      	r1, 15
    6f4c:	e3ffef0a 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	//GPIO_Init(charge_wired_iset_pin, Output); /* 输出模式，输入禁止 */
	//GPIO_Write_Low(charge_wired_iset_pin);

	//无线充5V检测引脚初始化
	GPIO_IntGroup_Set(GPIOA, 0, Selete_EXI_PIN0); /* 外部中断组1选择GPIOA0.01作为中断源 */								
    6f50:	3200      	movi      	r2, 0
    6f52:	3100      	movi      	r1, 0
    6f54:	3000      	movi      	r0, 0
    6f56:	e3ffef73 	bsr      	0x4e3c	// 4e3c <GPIO_IntGroup_Set>
	GPIOA0_EXI_Init(EXI0); /* GPIOA0.01设置为输入模式，输出禁止 */ 
    6f5a:	3000      	movi      	r0, 0
    6f5c:	e3ffeff6 	bsr      	0x4f48	// 4f48 <GPIOA0_EXI_Init>
	GPIO_PullHighLow_DIS(charge_wireless5V_dectect_pin);
    6f60:	9400      	ld.w      	r0, (r4, 0x0)
    6f62:	3100      	movi      	r1, 0
    6f64:	e3ffef64 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
	EXTI_trigger_CMD(ENABLE, EXI_PIN0, _EXIRT); /* EXI1上升沿触发中断 */ 
    6f68:	3200      	movi      	r2, 0
    6f6a:	3101      	movi      	r1, 1
    6f6c:	3001      	movi      	r0, 1
    6f6e:	e3ffeda7 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	EXTI_trigger_CMD(ENABLE, EXI_PIN0, _EXIFT); /* EXI1下降沿触发中断 */ 
    6f72:	3201      	movi      	r2, 1
    6f74:	3101      	movi      	r1, 1
    6f76:	3001      	movi      	r0, 1
    6f78:	e3ffeda2 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	EXTI_interrupt_CMD(ENABLE, EXI_PIN0); /* 打开EXI1中断源 */
    6f7c:	3101      	movi      	r1, 1
    6f7e:	3001      	movi      	r0, 1
    6f80:	e3ffedbe 	bsr      	0x4afc	// 4afc <EXTI_interrupt_CMD>
	GPIO_EXI_EN(GPIOA0, EXI0); /* 使能EXI1外部中断 */
    6f84:	9400      	ld.w      	r0, (r4, 0x0)
    6f86:	3100      	movi      	r1, 0
    6f88:	e3fff05e 	bsr      	0x5044	// 5044 <GPIO_EXI_EN>
	EXI0_Int_Enable(); /* 使能NVIC对EXI1中断向量的响应 */
    6f8c:	e3ffeddc 	bsr      	0x4b44	// 4b44 <EXI0_Int_Enable>
	EXI0_WakeUp_Enable();
    6f90:	e3ffedf8 	bsr      	0x4b80	// 4b80 <EXI0_WakeUp_Enable>
}
    6f94:	1491      	pop      	r4, r15
    6f96:	0000      	bkpt
    6f98:	2000004c 	.long	0x2000004c
    6f9c:	20000050 	.long	0x20000050

Disassembly of section .text.communicate_hardware_setup:

00006fa0 <communicate_hardware_setup>:
    1.GPIOA0.01--Hall_EN
	2.GPIOB0.05--Pattern EN
	3.GPIOA0.04--Pairing Button
  */
void communicate_hardware_setup(U32_T BaudRate)
{
    6fa0:	14d2      	push      	r4-r5, r15
	U32_T BaudDiv = 0;
		
	BaudDiv = SYSCLK / BaudRate;
    6fa2:	116b      	lrw      	r3, 0x20000000	// 704c <communicate_hardware_setup+0xac>
{
    6fa4:	6c43      	mov      	r1, r0
	BaudDiv = SYSCLK / BaudRate;
    6fa6:	9300      	ld.w      	r0, (r3, 0x0)
    6fa8:	e3fffdae 	bsr      	0x6b04	// 6b04 <__udivsi3>
    6fac:	6d43      	mov      	r5, r0

	/* 霍尔检测引脚初始化 */
	GPIO_IntGroup_Set(GPIOA, 1, Selete_EXI_PIN1); /* 外部中断组1选择GPIOA0.01作为中断源 */								
    6fae:	3201      	movi      	r2, 1
    6fb0:	3101      	movi      	r1, 1
    6fb2:	3000      	movi      	r0, 0
    6fb4:	e3ffef44 	bsr      	0x4e3c	// 4e3c <GPIO_IntGroup_Set>
	GPIOA0_EXI_Init(EXI1); /* GPIOA0.01设置为输入模式，输出禁止 */ 
	GPIO_PullHighLow_DIS(hall_en_pin);
    6fb8:	1186      	lrw      	r4, 0x20000050	// 7050 <communicate_hardware_setup+0xb0>
	GPIOA0_EXI_Init(EXI1); /* GPIOA0.01设置为输入模式，输出禁止 */ 
    6fba:	3001      	movi      	r0, 1
    6fbc:	e3ffefc6 	bsr      	0x4f48	// 4f48 <GPIOA0_EXI_Init>
	GPIO_PullHighLow_DIS(hall_en_pin);
    6fc0:	9400      	ld.w      	r0, (r4, 0x0)
    6fc2:	3101      	movi      	r1, 1
    6fc4:	e3ffef34 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
	EXTI_trigger_CMD(ENABLE, EXI_PIN1, _EXIRT); /* EXI1上升沿触发中断 */ 
    6fc8:	3200      	movi      	r2, 0
    6fca:	3102      	movi      	r1, 2
    6fcc:	3001      	movi      	r0, 1
    6fce:	e3ffed77 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	EXTI_trigger_CMD(ENABLE, EXI_PIN1, _EXIFT); /* EXI1下降沿触发中断 */ 
    6fd2:	3201      	movi      	r2, 1
    6fd4:	3102      	movi      	r1, 2
    6fd6:	3001      	movi      	r0, 1
    6fd8:	e3ffed72 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	EXTI_interrupt_CMD(ENABLE, EXI_PIN1); /* 打开EXI1中断源 */
    6fdc:	3102      	movi      	r1, 2
    6fde:	3001      	movi      	r0, 1
    6fe0:	e3ffed8e 	bsr      	0x4afc	// 4afc <EXTI_interrupt_CMD>
	GPIO_EXI_EN(GPIOA0, EXI1); /* 使能EXI1外部中断 */
    6fe4:	9400      	ld.w      	r0, (r4, 0x0)
    6fe6:	3101      	movi      	r1, 1
    6fe8:	e3fff02e 	bsr      	0x5044	// 5044 <GPIO_EXI_EN>
	EXI1_Int_Enable(); /* 使能NVIC对EXI1中断向量的响应 */
    6fec:	e3ffedb2 	bsr      	0x4b50	// 4b50 <EXI1_Int_Enable>
	EXI1_WakeUp_Enable();
    6ff0:	e3ffedce 	bsr      	0x4b8c	// 4b8c <EXI1_WakeUp_Enable>
	
	//GPIO_Init(pattern_en_pin, Output); /* 输出模式，输入禁止 */
	//GPIO_Write_Low(pattern_en_pin);
	
	/* 按键引脚初始化 */
	GPIO_IntGroup_Set(GPIOA, 4, Selete_EXI_PIN4); /* 外部中断组4选择GPIOA0.04作为中断源 */								
    6ff4:	3204      	movi      	r2, 4
    6ff6:	3104      	movi      	r1, 4
    6ff8:	3000      	movi      	r0, 0
    6ffa:	e3ffef21 	bsr      	0x4e3c	// 4e3c <GPIO_IntGroup_Set>
	GPIOA0_EXI_Init(EXI4); /* GPIOA0.04设置为输入模式，输出禁止 */ 
    6ffe:	3004      	movi      	r0, 4
    7000:	e3ffefa4 	bsr      	0x4f48	// 4f48 <GPIOA0_EXI_Init>
	GPIO_PullLow_Init(key_pin);
    7004:	9400      	ld.w      	r0, (r4, 0x0)
    7006:	3104      	movi      	r1, 4
    7008:	e3ffef08 	bsr      	0x4e18	// 4e18 <GPIO_PullLow_Init>
	EXTI_trigger_CMD(ENABLE, EXI_PIN4, _EXIRT); /* EXI4上升沿触发中断 */ 
    700c:	3200      	movi      	r2, 0
    700e:	3110      	movi      	r1, 16
    7010:	3001      	movi      	r0, 1
    7012:	e3ffed55 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	//EXTI_trigger_CMD(ENABLE, EXI_PIN4, _EXIFT); /* EXI4下降沿触发中断 */ 
	EXTI_interrupt_CMD(ENABLE, EXI_PIN4); /* 打开EXI4中断源 */
    7016:	3110      	movi      	r1, 16
    7018:	3001      	movi      	r0, 1
    701a:	e3ffed71 	bsr      	0x4afc	// 4afc <EXTI_interrupt_CMD>
	//GPIO_EXTI_interrupt(GPIOA0, EXI_PIN4);
	GPIO_EXI_EN(GPIOA0, EXI4); /* 使能EXI4外部中断 */
    701e:	9400      	ld.w      	r0, (r4, 0x0)
    7020:	3104      	movi      	r1, 4
    7022:	e3fff011 	bsr      	0x5044	// 5044 <GPIO_EXI_EN>
	EXI3_Int_Enable(); /* 使能NVIC对EXI3中断向量的响应 */
    7026:	e3ffeda5 	bsr      	0x4b70	// 4b70 <EXI3_Int_Enable>
	EXI3_WakeUp_Enable();
    702a:	e3ffedc9 	bsr      	0x4bbc	// 4bbc <EXI3_WakeUp_Enable>
	GPIO_Write_High(pattern_TX_pin);	
	GPIO_Init(pattern_RX_pin, Output);
	GPIO_Write_High(pattern_RX_pin);
	
	#else
	UART2_DeInit();                                                 //clear all UART Register
    702e:	e3fff0d5 	bsr      	0x51d8	// 51d8 <UART2_DeInit>
    UART_IO_Init(IO_UART2, 2);                                    	//use PB0.5->RXD2, PB0.4->TXD2
    7032:	3102      	movi      	r1, 2
    7034:	3002      	movi      	r0, 2
    7036:	e3fff101 	bsr      	0x5238	// 5238 <UART_IO_Init>
	//GPIO_Init(pattern_RX_pin, Output);
	//GPIO_Write_High(pattern_RX_pin);
	UARTInitRxIntEn(UART2, BaudDiv, UART_PAR_NONE);	                    //baudrate=sysclock/46=115200
    703a:	1067      	lrw      	r3, 0x2000003c	// 7054 <communicate_hardware_setup+0xb4>
    703c:	7455      	zexth      	r1, r5
    703e:	9300      	ld.w      	r0, (r3, 0x0)
    7040:	3200      	movi      	r2, 0
    7042:	e3fff16f 	bsr      	0x5320	// 5320 <UARTInitRxIntEn>
	UART2_Int_Enable();
    7046:	e3fff0e3 	bsr      	0x520c	// 520c <UART2_Int_Enable>
	#endif
}
    704a:	1492      	pop      	r4-r5, r15
    704c:	20000000 	.long	0x20000000
    7050:	20000050 	.long	0x20000050
    7054:	2000003c 	.long	0x2000003c

Disassembly of section .text.ReduceSYSCLKto5556KHZ:

00007058 <ReduceSYSCLKto5556KHZ>:
{
    7058:	14d0      	push      	r15
	CK_CPU_DisAllNormalIrq(); /* 关闭所有中断 */
    705a:	e3fffd8e 	bsr      	0x6b76	// 6b76 <CK_CPU_DisAllNormalIrq>
	SYSCLK = 5556000u;
    705e:	1141      	lrw      	r2, 0x54c720	// 70e0 <ReduceSYSCLKto5556KHZ+0x88>
    7060:	1161      	lrw      	r3, 0x20000000	// 70e4 <ReduceSYSCLKto5556KHZ+0x8c>
    7062:	b340      	st.w      	r2, (r3, 0x0)
	UARTClose(UART1);
    7064:	1161      	lrw      	r3, 0x20000040	// 70e8 <ReduceSYSCLKto5556KHZ+0x90>
    7066:	9300      	ld.w      	r0, (r3, 0x0)
    7068:	e3fff164 	bsr      	0x5330	// 5330 <UARTClose>
	UART1_CONFIG(115200);
    706c:	30e1      	movi      	r0, 225
    706e:	4009      	lsli      	r0, r0, 9
    7070:	e3fff77e 	bsr      	0x5f6c	// 5f6c <UART1_CONFIG>
	UARTClose(UART2);
    7074:	107e      	lrw      	r3, 0x2000003c	// 70ec <ReduceSYSCLKto5556KHZ+0x94>
    7076:	9300      	ld.w      	r0, (r3, 0x0)
    7078:	e3fff15c 	bsr      	0x5330	// 5330 <UARTClose>
	communicate_hardware_setup(200);
    707c:	30c8      	movi      	r0, 200
    707e:	e3ffff91 	bsr      	0x6fa0	// 6fa0 <communicate_hardware_setup>
	LPT_Stop();
    7082:	e3fff047 	bsr      	0x5110	// 5110 <LPT_Stop>
	LPT_Init();
    7086:	e3fffd7b 	bsr      	0x6b7c	// 6b7c <LPT_Init>
	SYSCON->GCDR |= 1 << 1; /* 关闭IMOSC */
    708a:	107a      	lrw      	r3, 0x2000005c	// 70f0 <ReduceSYSCLKto5556KHZ+0x98>
    708c:	3002      	movi      	r0, 2
    708e:	9360      	ld.w      	r3, (r3, 0x0)
    7090:	9322      	ld.w      	r1, (r3, 0x8)
    7092:	6c40      	or      	r1, r0
    7094:	b322      	st.w      	r1, (r3, 0x8)
	SYSCON->OPT1 = (SYSCON->OPT1 & 0xfffffffc) | 0; /* 切换5.556MHZ */
    7096:	9339      	ld.w      	r1, (r3, 0x64)
    7098:	3980      	bclri      	r1, 0
    709a:	3981      	bclri      	r1, 1
    709c:	b339      	st.w      	r1, (r3, 0x64)
	SYSCON->GCER |= 1 << 1;  /* 打开IMOSC */
    709e:	9341      	ld.w      	r2, (r3, 0x4)
    70a0:	6c80      	or      	r2, r0
    70a2:	b341      	st.w      	r2, (r3, 0x4)
	while((SYSCON->CKST & 0x2) == 0);
    70a4:	3102      	movi      	r1, 2
    70a6:	9344      	ld.w      	r2, (r3, 0x10)
    70a8:	6884      	and      	r2, r1
    70aa:	3a40      	cmpnei      	r2, 0
    70ac:	0ffd      	bf      	0x70a6	// 70a6 <ReduceSYSCLKto5556KHZ+0x4e>
	SYSCON->SCLKCR = 0xd22d << 16 ; /* 主时钟切换到IMOSC */
    70ae:	1052      	lrw      	r2, 0xd22d0000	// 70f4 <ReduceSYSCLKto5556KHZ+0x9c>
	while((SYSCON->CKST & 0x100) == 0);
    70b0:	3180      	movi      	r1, 128
	SYSCON->SCLKCR = 0xd22d << 16 ; /* 主时钟切换到IMOSC */
    70b2:	b347      	st.w      	r2, (r3, 0x1c)
	while((SYSCON->CKST & 0x100) == 0);
    70b4:	4121      	lsli      	r1, r1, 1
    70b6:	9344      	ld.w      	r2, (r3, 0x10)
    70b8:	6884      	and      	r2, r1
    70ba:	3a40      	cmpnei      	r2, 0
    70bc:	0ffd      	bf      	0x70b6	// 70b6 <ReduceSYSCLKto5556KHZ+0x5e>
	SYSCON->PCLKCR = 0xc33c << 16;
    70be:	104f      	lrw      	r2, 0xc33c0000	// 70f8 <ReduceSYSCLKto5556KHZ+0xa0>
    70c0:	b348      	st.w      	r2, (r3, 0x20)
	SYSCON->GCDR |= 1 << 4; /* 关闭高速时钟 */
    70c2:	9342      	ld.w      	r2, (r3, 0x8)
    70c4:	3aa4      	bseti      	r2, 4
    70c6:	b342      	st.w      	r2, (r3, 0x8)
	while(SYSCON->GCSR & 0x10);
    70c8:	3110      	movi      	r1, 16
    70ca:	9343      	ld.w      	r2, (r3, 0xc)
    70cc:	6884      	and      	r2, r1
    70ce:	3a40      	cmpnei      	r2, 0
    70d0:	0bfd      	bt      	0x70ca	// 70ca <ReduceSYSCLKto5556KHZ+0x72>
	Coret_DelayMs(20); /* 延时使系统稳定 */
    70d2:	3014      	movi      	r0, 20
    70d4:	3100      	movi      	r1, 0
    70d6:	e0000c75 	bsr      	0x89c0	// 89c0 <Coret_DelayMs>
	CK_CPU_EnAllNormalIrq(); 
    70da:	e3fffd4b 	bsr      	0x6b70	// 6b70 <CK_CPU_EnAllNormalIrq>
}
    70de:	1490      	pop      	r15
    70e0:	0054c720 	.long	0x0054c720
    70e4:	20000000 	.long	0x20000000
    70e8:	20000040 	.long	0x20000040
    70ec:	2000003c 	.long	0x2000003c
    70f0:	2000005c 	.long	0x2000005c
    70f4:	d22d0000 	.long	0xd22d0000
    70f8:	c33c0000 	.long	0xc33c0000

Disassembly of section .text.EXI1IntHandler:

000070fc <EXI1IntHandler>:

/* 不用编写中断服务函数，因为只用到中断唤醒CPU */
void EXI1IntHandler(void) 
{
    70fc:	1460      	nie
    70fe:	1462      	ipush
	if((SYSCON->EXIRS & EXI_PIN1) == EXI_PIN1) 
    7100:	1066      	lrw      	r3, 0x2000005c	// 7118 <EXI1IntHandler+0x1c>
    7102:	3102      	movi      	r1, 2
    7104:	9360      	ld.w      	r3, (r3, 0x0)
    7106:	237f      	addi      	r3, 128
    7108:	934c      	ld.w      	r2, (r3, 0x30)
    710a:	6884      	and      	r2, r1
    710c:	3a40      	cmpnei      	r2, 0
    710e:	0c02      	bf      	0x7112	// 7112 <EXI1IntHandler+0x16>
	{
		SYSCON->EXICR = EXI_PIN1; /* 清除EXI1中断标志 */
    7110:	b32b      	st.w      	r1, (r3, 0x2c)
	}
}
    7112:	1463      	ipop
    7114:	1461      	nir
    7116:	0000      	bkpt
    7118:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXI4to8IntHandler:

0000711c <EXI4to8IntHandler>:

void EXI4to8IntHandler(void) 
{
    711c:	1460      	nie
    711e:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN4)==EXI_PIN4) 
    7120:	1072      	lrw      	r3, 0x2000005c	// 7168 <EXI4to8IntHandler+0x4c>
    7122:	3280      	movi      	r2, 128
    7124:	9360      	ld.w      	r3, (r3, 0x0)
    7126:	60c8      	addu      	r3, r2
    7128:	932c      	ld.w      	r1, (r3, 0x30)
    712a:	3010      	movi      	r0, 16
    712c:	6840      	and      	r1, r0
    712e:	3940      	cmpnei      	r1, 0
    7130:	0c04      	bf      	0x7138	// 7138 <EXI4to8IntHandler+0x1c>
	{
		SYSCON->EXICR = EXI_PIN5;
	} 
	else if ((SYSCON->EXIRS&EXI_PIN6)==EXI_PIN6) 
	{
		SYSCON->EXICR = EXI_PIN6;
    7132:	b30b      	st.w      	r0, (r3, 0x2c)
	else if ((SYSCON->EXIRS&EXI_PIN8)==EXI_PIN8) 
	{
		SYSCON->EXICR = EXI_PIN8;
	}

}
    7134:	1463      	ipop
    7136:	1461      	nir
	else if ((SYSCON->EXIRS&EXI_PIN5)==EXI_PIN5) 
    7138:	932c      	ld.w      	r1, (r3, 0x30)
    713a:	3020      	movi      	r0, 32
    713c:	6840      	and      	r1, r0
    713e:	3940      	cmpnei      	r1, 0
    7140:	0bf9      	bt      	0x7132	// 7132 <EXI4to8IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN6)==EXI_PIN6) 
    7142:	932c      	ld.w      	r1, (r3, 0x30)
    7144:	3040      	movi      	r0, 64
    7146:	6840      	and      	r1, r0
    7148:	3940      	cmpnei      	r1, 0
    714a:	0bf4      	bt      	0x7132	// 7132 <EXI4to8IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN7)==EXI_PIN7) 
    714c:	932c      	ld.w      	r1, (r3, 0x30)
    714e:	6848      	and      	r1, r2
    7150:	3940      	cmpnei      	r1, 0
    7152:	0c03      	bf      	0x7158	// 7158 <EXI4to8IntHandler+0x3c>
		SYSCON->EXICR = EXI_PIN8;
    7154:	b34b      	st.w      	r2, (r3, 0x2c)
}
    7156:	07ef      	br      	0x7134	// 7134 <EXI4to8IntHandler+0x18>
	else if ((SYSCON->EXIRS&EXI_PIN8)==EXI_PIN8) 
    7158:	3280      	movi      	r2, 128
    715a:	932c      	ld.w      	r1, (r3, 0x30)
    715c:	4241      	lsli      	r2, r2, 1
    715e:	6848      	and      	r1, r2
    7160:	3940      	cmpnei      	r1, 0
    7162:	0bf9      	bt      	0x7154	// 7154 <EXI4to8IntHandler+0x38>
    7164:	07e8      	br      	0x7134	// 7134 <EXI4to8IntHandler+0x18>
    7166:	0000      	bkpt
    7168:	2000005c 	.long	0x2000005c

Disassembly of section .text.UART2IntHandler:

0000716c <UART2IntHandler>:
const char bt_pairing[] = 	 {0xF1, 0x07, 0x14, '\0'};
const char factory_reset[] = {0xF1, 0x02, 0x0F, '\0'};
const char freeman_mode[] =  {0xF1, 0x06, 0x13, '\0'};

void UART2IntHandler(void) 
{
    716c:	1460      	nie
    716e:	1462      	ipush
    7170:	14d4      	push      	r4-r7, r15
    7172:	1421      	subi      	r14, r14, 4
    // ISR content ...
	//Interupt
	if ((UART2->ISR&UART_RX_INT_S)==UART_RX_INT_S)
    7174:	116f      	lrw      	r3, 0x2000003c	// 7230 <UART2IntHandler+0xc4>
    7176:	3102      	movi      	r1, 2
    7178:	9340      	ld.w      	r2, (r3, 0x0)
    717a:	9263      	ld.w      	r3, (r2, 0xc)
    717c:	68c4      	and      	r3, r1
    717e:	3b40      	cmpnei      	r3, 0
    7180:	0c41      	bf      	0x7202	// 7202 <UART2IntHandler+0x96>
	{
		UART2->ISR=UART_RX_INT_S;
    7182:	b223      	st.w      	r1, (r2, 0xc)
		static U8_T buff_index = 0;
		static U8_T col_offset = 0;
		
		buff_index = (U32_T)(uart2_que.ptail - uart2_que.buffer) / sizeof(uart2_que.buffer[0]);
		
		if((UART2->SR & (1 << 1)) != 0) // 接收缓冲区不为空
    7184:	9261      	ld.w      	r3, (r2, 0x4)
    7186:	68c4      	and      	r3, r1
    7188:	3b40      	cmpnei      	r3, 0
    718a:	0c32      	bf      	0x71ee	// 71ee <UART2IntHandler+0x82>
		buff_index = (U32_T)(uart2_que.ptail - uart2_que.buffer) / sizeof(uart2_que.buffer[0]);
    718c:	11aa      	lrw      	r5, 0x20000068	// 7234 <UART2IntHandler+0xc8>
		{
			(*uart2_que.ptail)[col_offset++] = UART2->DATA;
    718e:	118b      	lrw      	r4, 0x20000250	// 7238 <UART2IntHandler+0xcc>
    7190:	84c0      	ld.b      	r6, (r4, 0x0)
		buff_index = (U32_T)(uart2_que.ptail - uart2_que.buffer) / sizeof(uart2_que.buffer[0]);
    7192:	9501      	ld.w      	r0, (r5, 0x4)
			(*uart2_que.ptail)[col_offset++] = UART2->DATA;
    7194:	5ee2      	addi      	r7, r6, 1
    7196:	9260      	ld.w      	r3, (r2, 0x0)
    7198:	6180      	addu      	r6, r0
    719a:	a660      	st.b      	r3, (r6, 0x0)
    719c:	75dc      	zextb      	r7, r7

			if((*uart2_que.ptail)[col_offset - 1] == 0x0A) //回车符
    719e:	95c1      	ld.w      	r6, (r5, 0x4)
    71a0:	5e7c      	addu      	r3, r6, r7
    71a2:	2b00      	subi      	r3, 1
    71a4:	8360      	ld.b      	r3, (r3, 0x0)
    71a6:	3b4a      	cmpnei      	r3, 10
			(*uart2_que.ptail)[col_offset++] = UART2->DATA;
    71a8:	a4e0      	st.b      	r7, (r4, 0x0)
			if((*uart2_que.ptail)[col_offset - 1] == 0x0A) //回车符
    71aa:	081d      	bt      	0x71e4	// 71e4 <UART2IntHandler+0x78>
		buff_index = (U32_T)(uart2_que.ptail - uart2_que.buffer) / sizeof(uart2_que.buffer[0]);
    71ac:	5d5e      	addi      	r2, r5, 8
    71ae:	5829      	subu      	r1, r0, r2
    71b0:	4164      	lsli      	r3, r1, 4
    71b2:	60c6      	subu      	r3, r1
    71b4:	4308      	lsli      	r0, r3, 8
    71b6:	60c0      	addu      	r3, r0
    71b8:	4310      	lsli      	r0, r3, 16
    71ba:	600c      	addu      	r0, r3
    71bc:	4004      	lsli      	r0, r0, 4
    71be:	6004      	addu      	r0, r1
    71c0:	3111      	movi      	r1, 17
    71c2:	b840      	st.w      	r2, (r14, 0x0)
    71c4:	e3fffca0 	bsr      	0x6b04	// 6b04 <__udivsi3>
			{
				uart2_que.data_lenth[buff_index] = col_offset;
				col_offset = 0;
    71c8:	3300      	movi      	r3, 0
				uart2_que.data_lenth[buff_index] = col_offset;
    71ca:	7400      	zextb      	r0, r0
				col_offset = 0;
    71cc:	a460      	st.b      	r3, (r4, 0x0)
				uart2_que.ptail++; // 准备下次数据接收
				/* 防止溢栈，从头接收 */
				if(uart2_que.ptail == uart2_que.buffer + BUFFER_NUMBER) uart2_que.ptail = uart2_que.buffer;
    71ce:	335d      	movi      	r3, 93
				uart2_que.ptail++; // 准备下次数据接收
    71d0:	2610      	addi      	r6, 17
				uart2_que.data_lenth[buff_index] = col_offset;
    71d2:	6014      	addu      	r0, r5
				if(uart2_que.ptail == uart2_que.buffer + BUFFER_NUMBER) uart2_que.ptail = uart2_que.buffer;
    71d4:	60d4      	addu      	r3, r5
				uart2_que.data_lenth[buff_index] = col_offset;
    71d6:	206d      	addi      	r0, 110
				if(uart2_que.ptail == uart2_que.buffer + BUFFER_NUMBER) uart2_que.ptail = uart2_que.buffer;
    71d8:	64da      	cmpne      	r6, r3
				uart2_que.data_lenth[buff_index] = col_offset;
    71da:	a0e0      	st.b      	r7, (r0, 0x0)
				uart2_que.ptail++; // 准备下次数据接收
    71dc:	b5c1      	st.w      	r6, (r5, 0x4)
				if(uart2_que.ptail == uart2_que.buffer + BUFFER_NUMBER) uart2_que.ptail = uart2_que.buffer;
    71de:	9840      	ld.w      	r2, (r14, 0x0)
    71e0:	0807      	bt      	0x71ee	// 71ee <UART2IntHandler+0x82>
    71e2:	b541      	st.w      	r2, (r5, 0x4)
			}
			
			if(col_offset >= BUFFER_SIZE) col_offset = 0; /* 防止溢栈，从头接收 */
    71e4:	8460      	ld.b      	r3, (r4, 0x0)
    71e6:	3b0f      	cmphsi      	r3, 16
    71e8:	0c03      	bf      	0x71ee	// 71ee <UART2IntHandler+0x82>
    71ea:	3300      	movi      	r3, 0
    71ec:	a460      	st.b      	r3, (r4, 0x0)
	}
	else if ((UART2->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)
	{
		UART2->ISR=UART_TX_IOV_S;
	}
}
    71ee:	1401      	addi      	r14, r14, 4
    71f0:	d9ee2004 	ld.w      	r15, (r14, 0x10)
    71f4:	98e3      	ld.w      	r7, (r14, 0xc)
    71f6:	98c2      	ld.w      	r6, (r14, 0x8)
    71f8:	98a1      	ld.w      	r5, (r14, 0x4)
    71fa:	9880      	ld.w      	r4, (r14, 0x0)
    71fc:	1405      	addi      	r14, r14, 20
    71fe:	1463      	ipop
    7200:	1461      	nir
	else if( (UART2->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 
    7202:	9263      	ld.w      	r3, (r2, 0xc)
    7204:	3101      	movi      	r1, 1
    7206:	68c4      	and      	r3, r1
    7208:	3b40      	cmpnei      	r3, 0
    720a:	0c06      	bf      	0x7216	// 7216 <UART2IntHandler+0xaa>
		UART2->ISR=UART_TX_INT_S;
    720c:	b223      	st.w      	r1, (r2, 0xc)
		TxDataFlag = TRUE;
    720e:	3201      	movi      	r2, 1
    7210:	106b      	lrw      	r3, 0x20000219	// 723c <UART2IntHandler+0xd0>
    7212:	a340      	st.b      	r2, (r3, 0x0)
    7214:	07ed      	br      	0x71ee	// 71ee <UART2IntHandler+0x82>
	else if ((UART2->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)
    7216:	9263      	ld.w      	r3, (r2, 0xc)
    7218:	3108      	movi      	r1, 8
    721a:	68c4      	and      	r3, r1
    721c:	3b40      	cmpnei      	r3, 0
    721e:	0c03      	bf      	0x7224	// 7224 <UART2IntHandler+0xb8>
		UART2->ISR=UART_TX_IOV_S;
    7220:	b223      	st.w      	r1, (r2, 0xc)
}
    7222:	07e6      	br      	0x71ee	// 71ee <UART2IntHandler+0x82>
	else if ((UART2->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)
    7224:	9263      	ld.w      	r3, (r2, 0xc)
    7226:	3104      	movi      	r1, 4
    7228:	68c4      	and      	r3, r1
    722a:	3b40      	cmpnei      	r3, 0
    722c:	0bfa      	bt      	0x7220	// 7220 <UART2IntHandler+0xb4>
    722e:	07e0      	br      	0x71ee	// 71ee <UART2IntHandler+0x82>
    7230:	2000003c 	.long	0x2000003c
    7234:	20000068 	.long	0x20000068
    7238:	20000250 	.long	0x20000250
    723c:	20000219 	.long	0x20000219

Disassembly of section .text.handle_uart2_recv_data:

00007240 <handle_uart2_recv_data>:

S8_T handle_uart2_recv_data(void)
{
    7240:	14d4      	push      	r4-r7, r15
    7242:	1421      	subi      	r14, r14, 4
	U8_T buff_index = 0;
	U8_T col_offset = 0;
	U8_T temp = 0;

	if(uart2_que.phead != uart2_que.ptail)
    7244:	109b      	lrw      	r4, 0x20000068	// 72b0 <handle_uart2_recv_data+0x70>
    7246:	9461      	ld.w      	r3, (r4, 0x4)
    7248:	9400      	ld.w      	r0, (r4, 0x0)
    724a:	64c2      	cmpne      	r0, r3
    724c:	0c23      	bf      	0x7292	// 7292 <handle_uart2_recv_data+0x52>
	{		
		buff_index = (U32_T)(uart2_que.phead - uart2_que.buffer) / sizeof(uart2_que.buffer[0]);
    724e:	5cbe      	addi      	r5, r4, 8
    7250:	5855      	subu      	r2, r0, r5
    7252:	4264      	lsli      	r3, r2, 4
    7254:	60ca      	subu      	r3, r2
    7256:	4308      	lsli      	r0, r3, 8
    7258:	60c0      	addu      	r3, r0
    725a:	4310      	lsli      	r0, r3, 16
    725c:	600c      	addu      	r0, r3
    725e:	4004      	lsli      	r0, r0, 4
    7260:	6008      	addu      	r0, r2
    7262:	3111      	movi      	r1, 17
    7264:	e3fffc50 	bsr      	0x6b04	// 6b04 <__udivsi3>
				break;
			}
		}
		*/
		
		for(col_offset = 0; col_offset < uart2_que.data_lenth[buff_index]; col_offset++)
    7268:	75c0      	zextb      	r7, r0
    726a:	3600      	movi      	r6, 0
    726c:	61d0      	addu      	r7, r4
    726e:	336e      	movi      	r3, 110
    7270:	60dc      	addu      	r3, r7
    7272:	8340      	ld.b      	r2, (r3, 0x0)
    7274:	6498      	cmphs      	r6, r2
    7276:	0c11      	bf      	0x7298	// 7298 <handle_uart2_recv_data+0x58>
		{
			printf("0x%X ", (*uart2_que.phead)[col_offset]);
		}
		printf("\r\n");
    7278:	100f      	lrw      	r0, 0x913e	// 72b4 <handle_uart2_recv_data+0x74>
    727a:	b860      	st.w      	r3, (r14, 0x0)
    727c:	e3ffe34c 	bsr      	0x3914	// 3914 <__GI_puts>

		uart2_que.data_lenth[buff_index] = 0;
    7280:	3200      	movi      	r2, 0
    7282:	9860      	ld.w      	r3, (r14, 0x0)
    7284:	a340      	st.b      	r2, (r3, 0x0)
		uart2_que.phead++; /* 准备下次数据处理 */
    7286:	9460      	ld.w      	r3, (r4, 0x0)
    7288:	2310      	addi      	r3, 17
	    /* 防止溢栈，从头处理 */
		if(uart2_que.phead == uart2_que.buffer + BUFFER_NUMBER) uart2_que.phead = uart2_que.buffer;
    728a:	104c      	lrw      	r2, 0x200000c5	// 72b8 <handle_uart2_recv_data+0x78>
    728c:	648e      	cmpne      	r3, r2
    728e:	0c0e      	bf      	0x72aa	// 72aa <handle_uart2_recv_data+0x6a>
		uart2_que.phead++; /* 准备下次数据处理 */
    7290:	b460      	st.w      	r3, (r4, 0x0)
	}

	return 0;
}
    7292:	3000      	movi      	r0, 0
    7294:	1401      	addi      	r14, r14, 4
    7296:	1494      	pop      	r4-r7, r15
			printf("0x%X ", (*uart2_que.phead)[col_offset]);
    7298:	9460      	ld.w      	r3, (r4, 0x0)
    729a:	60d8      	addu      	r3, r6
    729c:	8320      	ld.b      	r1, (r3, 0x0)
    729e:	1008      	lrw      	r0, 0x8f6c	// 72bc <handle_uart2_recv_data+0x7c>
		for(col_offset = 0; col_offset < uart2_que.data_lenth[buff_index]; col_offset++)
    72a0:	2600      	addi      	r6, 1
			printf("0x%X ", (*uart2_que.phead)[col_offset]);
    72a2:	e3ffe327 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
		for(col_offset = 0; col_offset < uart2_que.data_lenth[buff_index]; col_offset++)
    72a6:	7598      	zextb      	r6, r6
    72a8:	07e3      	br      	0x726e	// 726e <handle_uart2_recv_data+0x2e>
		if(uart2_que.phead == uart2_que.buffer + BUFFER_NUMBER) uart2_que.phead = uart2_que.buffer;
    72aa:	b4a0      	st.w      	r5, (r4, 0x0)
    72ac:	07f3      	br      	0x7292	// 7292 <handle_uart2_recv_data+0x52>
    72ae:	0000      	bkpt
    72b0:	20000068 	.long	0x20000068
    72b4:	0000913e 	.long	0x0000913e
    72b8:	200000c5 	.long	0x200000c5
    72bc:	00008f6c 	.long	0x00008f6c

Disassembly of section .text.IO_port_analog_uart_send_data:

000072c0 <IO_port_analog_uart_send_data>:

S8_T IO_port_analog_uart_send_data(const char *data)
{
    72c0:	14d3      	push      	r4-r6, r15
    72c2:	6d43      	mov      	r5, r0
	U16_T data_length = strlen(data);
    72c4:	e3ffe3c6 	bsr      	0x3a50	// 3a50 <__strlen_fast>
	U8_T i, j;

	//发码前先拉高RX电平
	UART_IO_Init(IO_UART2, 2);
	GPIO_Init(pattern_RX_pin, Output);
    72c8:	10d3      	lrw      	r6, 0x2000004c	// 7314 <IO_port_analog_uart_send_data+0x54>
	UART_IO_Init(IO_UART2, 2);
    72ca:	3102      	movi      	r1, 2
	U16_T data_length = strlen(data);
    72cc:	7501      	zexth      	r4, r0
	UART_IO_Init(IO_UART2, 2);
    72ce:	3002      	movi      	r0, 2
    72d0:	e3ffefb4 	bsr      	0x5238	// 5238 <UART_IO_Init>
	GPIO_Init(pattern_RX_pin, Output);
    72d4:	3200      	movi      	r2, 0
    72d6:	3105      	movi      	r1, 5
    72d8:	9600      	ld.w      	r0, (r6, 0x0)
    72da:	e3ffecd3 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_High(pattern_RX_pin);
    72de:	9600      	ld.w      	r0, (r6, 0x0)
    72e0:	3105      	movi      	r1, 5
    72e2:	e3ffeeb7 	bsr      	0x5050	// 5050 <GPIO_Write_High>
		}
		uart_TX_high;
		Coret_DelayUs(BIT_WIDTH_US);
		
		#else
		while((UART2->SR & 0X1) != 0);
    72e6:	106d      	lrw      	r3, 0x2000003c	// 7318 <IO_port_analog_uart_send_data+0x58>
    72e8:	3001      	movi      	r0, 1
    72ea:	9320      	ld.w      	r1, (r3, 0x0)
	for(i = 0; i < data_length; i++)
    72ec:	3300      	movi      	r3, 0
    72ee:	650c      	cmphs      	r3, r4
    72f0:	0c07      	bf      	0x72fe	// 72fe <IO_port_analog_uart_send_data+0x3e>
		UART2->DATA = data[i];
		#endif
	}

	//发码后恢复RX输入功能
	UART_IO_Init(IO_UART2, 2); 
    72f2:	3102      	movi      	r1, 2
    72f4:	3002      	movi      	r0, 2
    72f6:	e3ffefa1 	bsr      	0x5238	// 5238 <UART_IO_Init>
	//CK_CPU_EnAllNormalIrq();
	return 0;
}
    72fa:	3000      	movi      	r0, 0
    72fc:	1493      	pop      	r4-r6, r15
		while((UART2->SR & 0X1) != 0);
    72fe:	9141      	ld.w      	r2, (r1, 0x4)
    7300:	6880      	and      	r2, r0
    7302:	3a40      	cmpnei      	r2, 0
    7304:	0bfd      	bt      	0x72fe	// 72fe <IO_port_analog_uart_send_data+0x3e>
		UART2->DATA = data[i];
    7306:	5d4c      	addu      	r2, r5, r3
    7308:	8240      	ld.b      	r2, (r2, 0x0)
	for(i = 0; i < data_length; i++)
    730a:	2300      	addi      	r3, 1
		UART2->DATA = data[i];
    730c:	b140      	st.w      	r2, (r1, 0x0)
	for(i = 0; i < data_length; i++)
    730e:	74cc      	zextb      	r3, r3
    7310:	07ef      	br      	0x72ee	// 72ee <IO_port_analog_uart_send_data+0x2e>
    7312:	0000      	bkpt
    7314:	2000004c 	.long	0x2000004c
    7318:	2000003c 	.long	0x2000003c

Disassembly of section .text.send_communicate_event:

0000731c <send_communicate_event>:

S8_T send_communicate_event(enum COMMUNICATE_EVENT_T event)
{
	*com_que.ptail = event;
    731c:	1067      	lrw      	r3, 0x200000dc	// 7338 <send_communicate_event+0x1c>

	if(com_que.ptail == com_que.com_event + COM_QUE_SIZE - 1) {
    731e:	3110      	movi      	r1, 16
	*com_que.ptail = event;
    7320:	9346      	ld.w      	r2, (r3, 0x18)
	if(com_que.ptail == com_que.com_event + COM_QUE_SIZE - 1) {
    7322:	604c      	addu      	r1, r3
    7324:	644a      	cmpne      	r2, r1
	*com_que.ptail = event;
    7326:	b200      	st.w      	r0, (r2, 0x0)
	if(com_que.ptail == com_que.com_event + COM_QUE_SIZE - 1) {
    7328:	0804      	bt      	0x7330	// 7330 <send_communicate_event+0x14>
		com_que.ptail = com_que.com_event;
    732a:	b366      	st.w      	r3, (r3, 0x18)
	} else{
		com_que.ptail++;
	}
	
	return 0;
}
    732c:	3000      	movi      	r0, 0
    732e:	783c      	jmp      	r15
		com_que.ptail++;
    7330:	2203      	addi      	r2, 4
    7332:	b346      	st.w      	r2, (r3, 0x18)
    7334:	07fc      	br      	0x732c	// 732c <send_communicate_event+0x10>
    7336:	0000      	bkpt
    7338:	200000dc 	.long	0x200000dc

Disassembly of section .text.communicate_event_get:

0000733c <communicate_event_get>:

S8_T communicate_event_get(enum COMMUNICATE_EVENT_T *pevent)
{
	if(com_que.phead != com_que.ptail) {
    733c:	106a      	lrw      	r3, 0x200000dc	// 7364 <communicate_event_get+0x28>
    733e:	9345      	ld.w      	r2, (r3, 0x14)
    7340:	9326      	ld.w      	r1, (r3, 0x18)
    7342:	644a      	cmpne      	r2, r1
    7344:	0c0d      	bf      	0x735e	// 735e <communicate_event_get+0x22>
		*pevent = *com_que.phead;
    7346:	9220      	ld.w      	r1, (r2, 0x0)
    7348:	b020      	st.w      	r1, (r0, 0x0)
		if(com_que.phead == com_que.com_event + COM_QUE_SIZE - 1) {
    734a:	3110      	movi      	r1, 16
    734c:	604c      	addu      	r1, r3
    734e:	644a      	cmpne      	r2, r1
    7350:	0804      	bt      	0x7358	// 7358 <communicate_event_get+0x1c>
			com_que.phead = com_que.com_event;
    7352:	b365      	st.w      	r3, (r3, 0x14)
		} else{
			com_que.phead++;
		}
		return 0;
    7354:	3000      	movi      	r0, 0
	}
	return -1;
}
    7356:	783c      	jmp      	r15
			com_que.phead++;
    7358:	2203      	addi      	r2, 4
    735a:	b345      	st.w      	r2, (r3, 0x14)
    735c:	07fc      	br      	0x7354	// 7354 <communicate_event_get+0x18>
	return -1;
    735e:	3000      	movi      	r0, 0
    7360:	2800      	subi      	r0, 1
    7362:	07fa      	br      	0x7356	// 7356 <communicate_event_get+0x1a>
    7364:	200000dc 	.long	0x200000dc

Disassembly of section .text.communicate_process_handle:

00007368 <communicate_process_handle>:

S8_T communicate_process_handle(void)
{
    7368:	14d2      	push      	r4-r5, r15
	static U8_T comt_status = 0; //0：通信结束，1: 开始通信，2：通信中
	static enum COMMUNICATE_EVENT_T event = COMMUNICATE_EVENT_NONE;

	switch(comt_status)
    736a:	118d      	lrw      	r4, 0x20000250	// 741c <communicate_process_handle+0xb4>
    736c:	8461      	ld.b      	r3, (r4, 0x1)
    736e:	3b41      	cmpnei      	r3, 1
    7370:	6d53      	mov      	r5, r4
    7372:	0c22      	bf      	0x73b6	// 73b6 <communicate_process_handle+0x4e>
    7374:	3b40      	cmpnei      	r3, 0
    7376:	0c05      	bf      	0x7380	// 7380 <communicate_process_handle+0x18>
    7378:	3b42      	cmpnei      	r3, 2
    737a:	0c22      	bf      	0x73be	// 73be <communicate_process_handle+0x56>
			
		default:
			break;	
	}
	
	return 0;
    737c:	3000      	movi      	r0, 0
}
    737e:	1492      	pop      	r4-r5, r15
			if(communicate_event_get(&event) == -1) return -1;
    7380:	5c0e      	addi      	r0, r4, 4
    7382:	e3ffffdd 	bsr      	0x733c	// 733c <communicate_event_get>
    7386:	3300      	movi      	r3, 0
    7388:	2b00      	subi      	r3, 1
    738a:	64c2      	cmpne      	r0, r3
    738c:	0ff9      	bf      	0x737e	// 737e <communicate_process_handle+0x16>
			if(battery_status != APP_BATTERY_STATUS_NTC_ERROR && hall_status == APP_HALL_STATUS_OPEN_BOX && earphone_status != APP_EARPHONE_STATUS_OVER_CURRENT) {
    738e:	1165      	lrw      	r3, 0x2000018c	// 7420 <communicate_process_handle+0xb8>
    7390:	9360      	ld.w      	r3, (r3, 0x0)
    7392:	3b43      	cmpnei      	r3, 3
    7394:	0ff4      	bf      	0x737c	// 737c <communicate_process_handle+0x14>
    7396:	1164      	lrw      	r3, 0x20000198	// 7424 <communicate_process_handle+0xbc>
    7398:	9360      	ld.w      	r3, (r3, 0x0)
    739a:	3b40      	cmpnei      	r3, 0
    739c:	0bf0      	bt      	0x737c	// 737c <communicate_process_handle+0x14>
    739e:	1163      	lrw      	r3, 0x20000194	// 7428 <communicate_process_handle+0xc0>
    73a0:	9360      	ld.w      	r3, (r3, 0x0)
    73a2:	3b43      	cmpnei      	r3, 3
    73a4:	0fec      	bf      	0x737c	// 737c <communicate_process_handle+0x14>
				comt_status = 1;
    73a6:	3301      	movi      	r3, 1
    73a8:	a461      	st.b      	r3, (r4, 0x1)
				printf("%s: %d\r\n", __func__, event);
    73aa:	9441      	ld.w      	r2, (r4, 0x4)
    73ac:	1120      	lrw      	r1, 0x8a84	// 742c <communicate_process_handle+0xc4>
    73ae:	1101      	lrw      	r0, 0x8f72	// 7430 <communicate_process_handle+0xc8>
    73b0:	e3ffe2a0 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
    73b4:	07e4      	br      	0x737c	// 737c <communicate_process_handle+0x14>
			if(hall_status == APP_HALL_STATUS_CLOSE_BOX) 
    73b6:	107c      	lrw      	r3, 0x20000198	// 7424 <communicate_process_handle+0xbc>
    73b8:	9360      	ld.w      	r3, (r3, 0x0)
    73ba:	3b41      	cmpnei      	r3, 1
    73bc:	0804      	bt      	0x73c4	// 73c4 <communicate_process_handle+0x5c>
			comt_status = 0;
    73be:	3300      	movi      	r3, 0
    73c0:	a461      	st.b      	r3, (r4, 0x1)
    73c2:	07dd      	br      	0x737c	// 737c <communicate_process_handle+0x14>
			switch(event)
    73c4:	9401      	ld.w      	r0, (r4, 0x4)
    73c6:	2800      	subi      	r0, 1
    73c8:	3803      	cmphsi      	r0, 4
    73ca:	0813      	bt      	0x73f0	// 73f0 <communicate_process_handle+0x88>
    73cc:	e3ffd6f2 	bsr      	0x21b0	// 21b0 <___gnu_csky_case_uqi>
    73d0:	1c130d02 	.long	0x1c130d02
					IO_port_analog_uart_send_data(ptp_pairing);
    73d4:	1018      	lrw      	r0, 0x8a9f	// 7434 <communicate_process_handle+0xcc>
    73d6:	e3ffff75 	bsr      	0x72c0	// 72c0 <IO_port_analog_uart_send_data>
					if(battery_status == APP_BATTERY_STATUS_NORMAL) {
    73da:	1072      	lrw      	r3, 0x2000018c	// 7420 <communicate_process_handle+0xb8>
    73dc:	9360      	ld.w      	r3, (r3, 0x0)
    73de:	3b40      	cmpnei      	r3, 0
    73e0:	0808      	bt      	0x73f0	// 73f0 <communicate_process_handle+0x88>
						app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_PTP_PAIR);
    73e2:	300b      	movi      	r0, 11
						app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_FREEMAN);
    73e4:	e000090a 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
    73e8:	0404      	br      	0x73f0	// 73f0 <communicate_process_handle+0x88>
					IO_port_analog_uart_send_data(bt_pairing);
    73ea:	1014      	lrw      	r0, 0x8aa3	// 7438 <communicate_process_handle+0xd0>
    73ec:	e3ffff6a 	bsr      	0x72c0	// 72c0 <IO_port_analog_uart_send_data>
			comt_status = 2;
    73f0:	3302      	movi      	r3, 2
    73f2:	a561      	st.b      	r3, (r5, 0x1)
    73f4:	07c4      	br      	0x737c	// 737c <communicate_process_handle+0x14>
					IO_port_analog_uart_send_data(factory_reset);
    73f6:	1012      	lrw      	r0, 0x8aa7	// 743c <communicate_process_handle+0xd4>
    73f8:	e3ffff64 	bsr      	0x72c0	// 72c0 <IO_port_analog_uart_send_data>
					if(battery_status == APP_BATTERY_STATUS_NORMAL) {
    73fc:	1069      	lrw      	r3, 0x2000018c	// 7420 <communicate_process_handle+0xb8>
    73fe:	9360      	ld.w      	r3, (r3, 0x0)
    7400:	3b40      	cmpnei      	r3, 0
    7402:	0bf7      	bt      	0x73f0	// 73f0 <communicate_process_handle+0x88>
						app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_RESET);
    7404:	300d      	movi      	r0, 13
    7406:	07ef      	br      	0x73e4	// 73e4 <communicate_process_handle+0x7c>
					IO_port_analog_uart_send_data(freeman_mode);
    7408:	100e      	lrw      	r0, 0x8aab	// 7440 <communicate_process_handle+0xd8>
    740a:	e3ffff5b 	bsr      	0x72c0	// 72c0 <IO_port_analog_uart_send_data>
					if(battery_status == APP_BATTERY_STATUS_NORMAL) {
    740e:	1065      	lrw      	r3, 0x2000018c	// 7420 <communicate_process_handle+0xb8>
    7410:	9360      	ld.w      	r3, (r3, 0x0)
    7412:	3b40      	cmpnei      	r3, 0
    7414:	0bee      	bt      	0x73f0	// 73f0 <communicate_process_handle+0x88>
						app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_FREEMAN);
    7416:	300e      	movi      	r0, 14
    7418:	07e6      	br      	0x73e4	// 73e4 <communicate_process_handle+0x7c>
    741a:	0000      	bkpt
    741c:	20000250 	.long	0x20000250
    7420:	2000018c 	.long	0x2000018c
    7424:	20000198 	.long	0x20000198
    7428:	20000194 	.long	0x20000194
    742c:	00008a84 	.long	0x00008a84
    7430:	00008f72 	.long	0x00008f72
    7434:	00008a9f 	.long	0x00008a9f
    7438:	00008aa3 	.long	0x00008aa3
    743c:	00008aa7 	.long	0x00008aa7
    7440:	00008aab 	.long	0x00008aab

Disassembly of section .text.pwr_key_handle:

00007444 <pwr_key_handle>:

S8_T pwr_key_handle(enum KEY_CODE_T code, enum KEY_EVENT_T event)
{
    7444:	14d1      	push      	r4, r15
    7446:	6c83      	mov      	r2, r0
    7448:	6d07      	mov      	r4, r1
	printf("%s: %d %d\r\n", __func__, code, event);
    744a:	6cc7      	mov      	r3, r1
    744c:	100f      	lrw      	r0, 0x8f7b	// 7488 <pwr_key_handle+0x44>
    744e:	1030      	lrw      	r1, 0x8aaf	// 748c <pwr_key_handle+0x48>
    7450:	e3ffe250 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
	switch(event)
    7454:	5c0f      	subi      	r0, r4, 4
    7456:	3805      	cmphsi      	r0, 6
    7458:	0811      	bt      	0x747a	// 747a <pwr_key_handle+0x36>
    745a:	e3ffd6ab 	bsr      	0x21b0	// 21b0 <___gnu_csky_case_uqi>
    745e:	0e03      	.short	0x0e03
    7460:	1012070e 	.long	0x1012070e
	{
		case KEY_EVENT_TRIPLECLICK:
			send_communicate_event(COMMUNICATE_EVENT_PTP_PAIR);
    7464:	3001      	movi      	r0, 1
			send_communicate_event(COMMUNICATE_EVENT_BT_PAIR);
			break;

		case KEY_EVENT_LLONGPRESS:

			send_communicate_event(COMMUNICATE_EVENT_FACTORY_RESET);
    7466:	e3ffff5b 	bsr      	0x731c	// 731c <send_communicate_event>
			break;
    746a:	0408      	br      	0x747a	// 747a <pwr_key_handle+0x36>
			if(battery_status == APP_BATTERY_STATUS_NORMAL) {
    746c:	1069      	lrw      	r3, 0x2000018c	// 7490 <pwr_key_handle+0x4c>
    746e:	9360      	ld.w      	r3, (r3, 0x0)
    7470:	3b40      	cmpnei      	r3, 0
    7472:	0804      	bt      	0x747a	// 747a <pwr_key_handle+0x36>
				app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_BT_PAIR);
    7474:	300c      	movi      	r0, 12
    7476:	e00008c1 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
		default:
			break;

	}
	return 0;
}
    747a:	3000      	movi      	r0, 0
    747c:	1491      	pop      	r4, r15
			send_communicate_event(COMMUNICATE_EVENT_BT_PAIR);
    747e:	3002      	movi      	r0, 2
    7480:	07f3      	br      	0x7466	// 7466 <pwr_key_handle+0x22>
			send_communicate_event(COMMUNICATE_EVENT_FACTORY_RESET);
    7482:	3003      	movi      	r0, 3
    7484:	07f1      	br      	0x7466	// 7466 <pwr_key_handle+0x22>
    7486:	0000      	bkpt
    7488:	00008f7b 	.long	0x00008f7b
    748c:	00008aaf 	.long	0x00008aaf
    7490:	2000018c 	.long	0x2000018c

Disassembly of section .text.send_key_event:

00007494 <send_key_event>:

S8_T send_key_event(enum KEY_CODE_T code, enum KEY_EVENT_T event)
{
	key_que.ptail->code = code;
    7494:	1047      	lrw      	r2, 0x200000f8	// 74b0 <send_key_event+0x1c>
    7496:	926b      	ld.w      	r3, (r2, 0x2c)
	key_que.ptail->event = event;
    7498:	b321      	st.w      	r1, (r3, 0x4)

	if(key_que.ptail == key_que.key_status + KEY_QUE_SIZE - 1) {
    749a:	3120      	movi      	r1, 32
    749c:	6048      	addu      	r1, r2
    749e:	644e      	cmpne      	r3, r1
	key_que.ptail->code = code;
    74a0:	b300      	st.w      	r0, (r3, 0x0)
	if(key_que.ptail == key_que.key_status + KEY_QUE_SIZE - 1) {
    74a2:	0804      	bt      	0x74aa	// 74aa <send_key_event+0x16>
		key_que.ptail = key_que.key_status;
    74a4:	b24b      	st.w      	r2, (r2, 0x2c)
	} else{
		key_que.ptail++;
	}
	
	return 0;
}
    74a6:	3000      	movi      	r0, 0
    74a8:	783c      	jmp      	r15
		key_que.ptail++;
    74aa:	2307      	addi      	r3, 8
    74ac:	b26b      	st.w      	r3, (r2, 0x2c)
    74ae:	07fc      	br      	0x74a6	// 74a6 <send_key_event+0x12>
    74b0:	200000f8 	.long	0x200000f8

Disassembly of section .text.key_event_get:

000074b4 <key_event_get>:

S8_T key_event_get(struct KEY_STATUS_T *pkey_status)
{
	if(key_que.phead != key_que.ptail) {
    74b4:	104b      	lrw      	r2, 0x200000f8	// 74e0 <key_event_get+0x2c>
    74b6:	926a      	ld.w      	r3, (r2, 0x28)
    74b8:	922b      	ld.w      	r1, (r2, 0x2c)
    74ba:	644e      	cmpne      	r3, r1
    74bc:	0c0f      	bf      	0x74da	// 74da <key_event_get+0x26>
		pkey_status->code = key_que.phead->code;
    74be:	9320      	ld.w      	r1, (r3, 0x0)
    74c0:	b020      	st.w      	r1, (r0, 0x0)
		pkey_status->event = key_que.phead->event;
    74c2:	9321      	ld.w      	r1, (r3, 0x4)
    74c4:	b021      	st.w      	r1, (r0, 0x4)
		
		if(key_que.phead == key_que.key_status + KEY_QUE_SIZE - 1) {
    74c6:	3120      	movi      	r1, 32
    74c8:	6048      	addu      	r1, r2
    74ca:	644e      	cmpne      	r3, r1
    74cc:	0804      	bt      	0x74d4	// 74d4 <key_event_get+0x20>
			key_que.phead = key_que.key_status;
    74ce:	b24a      	st.w      	r2, (r2, 0x28)
		} else{
			key_que.phead++;
		}
		return 0;
    74d0:	3000      	movi      	r0, 0
	}
	return -1;
}
    74d2:	783c      	jmp      	r15
			key_que.phead++;
    74d4:	2307      	addi      	r3, 8
    74d6:	b26a      	st.w      	r3, (r2, 0x28)
    74d8:	07fc      	br      	0x74d0	// 74d0 <key_event_get+0x1c>
	return -1;
    74da:	3000      	movi      	r0, 0
    74dc:	2800      	subi      	r0, 1
    74de:	07fa      	br      	0x74d2	// 74d2 <key_event_get+0x1e>
    74e0:	200000f8 	.long	0x200000f8

Disassembly of section .text.app_key_event_handle:

000074e4 <app_key_event_handle>:

S8_T app_key_event_handle(void)
{
    74e4:	14d0      	push      	r15
    74e6:	1422      	subi      	r14, r14, 8
	struct KEY_STATUS_T key_status;
	
	if(key_event_get(&key_status) == -1) return -1; 
    74e8:	6c3b      	mov      	r0, r14
    74ea:	e3ffffe5 	bsr      	0x74b4	// 74b4 <key_event_get>
    74ee:	3300      	movi      	r3, 0
    74f0:	2b00      	subi      	r3, 1
    74f2:	64c2      	cmpne      	r0, r3
    74f4:	0c09      	bf      	0x7506	// 7506 <app_key_event_handle+0x22>
	
	switch(key_status.code)
    74f6:	9860      	ld.w      	r3, (r14, 0x0)
    74f8:	3b41      	cmpnei      	r3, 1
    74fa:	0805      	bt      	0x7504	// 7504 <app_key_event_handle+0x20>
	{
		case KEY_CODE_PWR:
			pwr_key_handle(key_status.code, key_status.event);
    74fc:	9821      	ld.w      	r1, (r14, 0x4)
    74fe:	3001      	movi      	r0, 1
    7500:	e3ffffa2 	bsr      	0x7444	// 7444 <pwr_key_handle>
		
		default:
			break;
	}
	
	return 0;
    7504:	3000      	movi      	r0, 0
}
    7506:	1402      	addi      	r14, r14, 8
    7508:	1490      	pop      	r15

Disassembly of section .text.key_scanf:

0000750c <key_scanf>:

enum KEY_CODE_T key_scanf(void)
{
    750c:	14d0      	push      	r15
	enum KEY_CODE_T code_down = KEY_CODE_NONE;
	
	if(GPIO_Read_Status(key_pin)) code_down |= KEY_CODE_PWR;
    750e:	1065      	lrw      	r3, 0x20000050	// 7520 <key_scanf+0x14>
    7510:	3104      	movi      	r1, 4
    7512:	9300      	ld.w      	r0, (r3, 0x0)
    7514:	e3ffedb1 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    7518:	3840      	cmpnei      	r0, 0
    751a:	3000      	movi      	r0, 0
    751c:	6001      	addc      	r0, r0

	return code_down;
}
    751e:	1490      	pop      	r15
    7520:	20000050 	.long	0x20000050

Disassembly of section .text.key_debounce_handler:

00007524 <key_debounce_handler>:

S8_T key_debounce_handler(void)
{
    7524:	14d2      	push      	r4-r5, r15
	static enum KEY_CODE_T code_click; //多击键值
	static U32_T key_press_cnt; //按下时间计数
	static U8_T cnt_click; //多击计数
	enum KEY_CODE_T key_buffer;
	
	key_buffer = key_scanf();
    7526:	e3fffff3 	bsr      	0x750c	// 750c <key_scanf>
	
	if(pre_keyval != key_buffer) {
    752a:	1151      	lrw      	r2, 0x20000250	// 75ec <key_debounce_handler+0xc8>
	key_buffer = key_scanf();
    752c:	6d43      	mov      	r5, r0
	if(pre_keyval != key_buffer) {
    752e:	9202      	ld.w      	r0, (r2, 0x8)
    7530:	6416      	cmpne      	r5, r0
    7532:	6d0b      	mov      	r4, r2
    7534:	0c27      	bf      	0x7582	// 7582 <key_debounce_handler+0x5e>
		if(pre_keyval > KEY_CODE_NONE && key_buffer == KEY_CODE_NONE) { //按键释放
    7536:	3840      	cmpnei      	r0, 0
    7538:	0c15      	bf      	0x7562	// 7562 <key_debounce_handler+0x3e>
    753a:	3d40      	cmpnei      	r5, 0
    753c:	0810      	bt      	0x755c	// 755c <key_debounce_handler+0x38>
			if(key_event == KEY_EVENT_LONGPRESS || key_event == KEY_EVENT_LLONGPRESS) {
    753e:	9263      	ld.w      	r3, (r2, 0xc)
    7540:	5b5b      	subi      	r2, r3, 7
    7542:	3a01      	cmphsi      	r2, 2
    7544:	080c      	bt      	0x755c	// 755c <key_debounce_handler+0x38>
				if(key_event == KEY_EVENT_LONGPRESS) {
    7546:	3b47      	cmpnei      	r3, 7
    7548:	0804      	bt      	0x7550	// 7550 <key_debounce_handler+0x2c>
					send_key_event(pre_keyval, KEY_EVENT_UPAFTER_LONGPRESS);
    754a:	3109      	movi      	r1, 9
    754c:	e3ffffa4 	bsr      	0x7494	// 7494 <send_key_event>
				}
				key_press_cnt = 0;
    7550:	3300      	movi      	r3, 0
				cnt_click = 0;
    7552:	3200      	movi      	r2, 0
				key_press_cnt = 0;
    7554:	b464      	st.w      	r3, (r4, 0x10)
				cnt_click = 0;
    7556:	a454      	st.b      	r2, (r4, 0x14)
				key_event = KEY_EVENT_NONE;
    7558:	b463      	st.w      	r3, (r4, 0xc)
				code_click = KEY_CODE_NONE;
    755a:	b466      	st.w      	r3, (r4, 0x18)
				printf("aaaap\r\n");
				//app_stop_5_second_timer(APP_DEEP_SLEEP_TIMER_ID);
			}
			*/
		}
		pre_keyval = key_buffer;	
    755c:	b4a2      	st.w      	r5, (r4, 0x8)
					break;
			}
		}	
	}
	return 0;
}
    755e:	3000      	movi      	r0, 0
    7560:	1492      	pop      	r4-r5, r15
		} else if(pre_keyval == KEY_CODE_NONE && key_buffer > KEY_CODE_NONE) { //按下按键
    7562:	3d40      	cmpnei      	r5, 0
    7564:	0ffc      	bf      	0x755c	// 755c <key_debounce_handler+0x38>
			if(key_event == KEY_EVENT_NONE) key_event = KEY_EVENT_DOWN;
    7566:	9263      	ld.w      	r3, (r2, 0xc)
    7568:	3b40      	cmpnei      	r3, 0
			key_press_cnt = 0;
    756a:	b204      	st.w      	r0, (r2, 0x10)
			code_click = key_buffer;
    756c:	b2a6      	st.w      	r5, (r2, 0x18)
			if(key_event == KEY_EVENT_NONE) key_event = KEY_EVENT_DOWN;
    756e:	0804      	bt      	0x7576	// 7576 <key_debounce_handler+0x52>
    7570:	3301      	movi      	r3, 1
    7572:	b263      	st.w      	r3, (r2, 0xc)
    7574:	07f4      	br      	0x755c	// 755c <key_debounce_handler+0x38>
			else if(key_event == KEY_EVENT_DOWN){
    7576:	3b41      	cmpnei      	r3, 1
    7578:	0bf2      	bt      	0x755c	// 755c <key_debounce_handler+0x38>
				cnt_click++;
    757a:	8274      	ld.b      	r3, (r2, 0x14)
    757c:	2300      	addi      	r3, 1
    757e:	a274      	st.b      	r3, (r2, 0x14)
    7580:	07ee      	br      	0x755c	// 755c <key_debounce_handler+0x38>
		key_press_cnt++;
    7582:	9264      	ld.w      	r3, (r2, 0x10)
    7584:	2300      	addi      	r3, 1
		if(key_buffer == KEY_CODE_NONE) {
    7586:	3d40      	cmpnei      	r5, 0
		key_press_cnt++;
    7588:	b264      	st.w      	r3, (r2, 0x10)
    758a:	9223      	ld.w      	r1, (r2, 0xc)
		if(key_buffer == KEY_CODE_NONE) {
    758c:	081b      	bt      	0x75c2	// 75c2 <key_debounce_handler+0x9e>
			if(key_event == KEY_EVENT_DOWN) {
    758e:	3941      	cmpnei      	r1, 1
    7590:	0812      	bt      	0x75b4	// 75b4 <key_debounce_handler+0x90>
				if(key_press_cnt >= KEY_DOUBLECLICK_THRESHOLD || cnt_click >= MAX_KEY_CLICK_COUNT) {
    7592:	3b07      	cmphsi      	r3, 8
    7594:	0804      	bt      	0x759c	// 759c <key_debounce_handler+0x78>
    7596:	8274      	ld.b      	r3, (r2, 0x14)
    7598:	3b03      	cmphsi      	r3, 4
    759a:	0fe2      	bf      	0x755e	// 755e <key_debounce_handler+0x3a>
					send_key_event(code_click, KEY_EVENT_CLICK + cnt_click);
    759c:	8434      	ld.b      	r1, (r4, 0x14)
    759e:	2101      	addi      	r1, 2
    75a0:	9406      	ld.w      	r0, (r4, 0x18)
    75a2:	e3ffff79 	bsr      	0x7494	// 7494 <send_key_event>
					key_press_cnt = 0;
    75a6:	3300      	movi      	r3, 0
					cnt_click = 0;
    75a8:	3200      	movi      	r2, 0
					key_press_cnt = 0;
    75aa:	b464      	st.w      	r3, (r4, 0x10)
					cnt_click = 0;
    75ac:	a454      	st.b      	r2, (r4, 0x14)
					key_event = KEY_EVENT_NONE;
    75ae:	b463      	st.w      	r3, (r4, 0xc)
					code_click = KEY_CODE_NONE;
    75b0:	b466      	st.w      	r3, (r4, 0x18)
    75b2:	07d6      	br      	0x755e	// 755e <key_debounce_handler+0x3a>
			} else if(key_event == KEY_EVENT_NONE){
    75b4:	3940      	cmpnei      	r1, 0
    75b6:	0bd4      	bt      	0x755e	// 755e <key_debounce_handler+0x3a>
				if(key_press_cnt >= KEY_IDLE_TIMEOUT) {
    75b8:	100e      	lrw      	r0, 0x18f	// 75f0 <key_debounce_handler+0xcc>
    75ba:	64c0      	cmphs      	r0, r3
    75bc:	0bd1      	bt      	0x755e	// 755e <key_debounce_handler+0x3a>
					key_press_cnt = 0;
    75be:	b224      	st.w      	r1, (r2, 0x10)
    75c0:	07cf      	br      	0x755e	// 755e <key_debounce_handler+0x3a>
			switch(key_event)
    75c2:	3941      	cmpnei      	r1, 1
    75c4:	0c0a      	bf      	0x75d8	// 75d8 <key_debounce_handler+0xb4>
    75c6:	3947      	cmpnei      	r1, 7
    75c8:	0bcb      	bt      	0x755e	// 755e <key_debounce_handler+0x3a>
					if(key_press_cnt >= KEY_LLONGPRESS_THRESHOLD) {
    75ca:	31c7      	movi      	r1, 199
    75cc:	64c4      	cmphs      	r1, r3
    75ce:	0bc8      	bt      	0x755e	// 755e <key_debounce_handler+0x3a>
						key_event = KEY_EVENT_LLONGPRESS;
    75d0:	3308      	movi      	r3, 8
    75d2:	b263      	st.w      	r3, (r2, 0xc)
						send_key_event(key_buffer, key_event);
    75d4:	3108      	movi      	r1, 8
    75d6:	0407      	br      	0x75e4	// 75e4 <key_debounce_handler+0xc0>
					if(key_press_cnt >= KEY_LONGPRESS_THRESHOLD) {
    75d8:	313b      	movi      	r1, 59
    75da:	64c4      	cmphs      	r1, r3
    75dc:	0bc1      	bt      	0x755e	// 755e <key_debounce_handler+0x3a>
						key_event = KEY_EVENT_LONGPRESS;
    75de:	3307      	movi      	r3, 7
    75e0:	b263      	st.w      	r3, (r2, 0xc)
						send_key_event(key_buffer, key_event);
    75e2:	3107      	movi      	r1, 7
						send_key_event(key_buffer, key_event);
    75e4:	6c17      	mov      	r0, r5
    75e6:	e3ffff57 	bsr      	0x7494	// 7494 <send_key_event>
    75ea:	07ba      	br      	0x755e	// 755e <key_debounce_handler+0x3a>
    75ec:	20000250 	.long	0x20000250
    75f0:	0000018f 	.long	0x0000018f

Disassembly of section .text.EarphoneWakeUp:

000075f4 <EarphoneWakeUp>:
	}
}

//要延时拉高5V一段时间唤醒耳机后再掉到通信电平
void EarphoneWakeUp(U8_T parm)
{
    75f4:	14d1      	push      	r4, r15
	printf("enter function->%s\r\n", __func__);

	GPIO_Write_Low(charge_5V_boost_pin);
    75f6:	108c      	lrw      	r4, 0x2000004c	// 7624 <EarphoneWakeUp+0x30>
	printf("enter function->%s\r\n", __func__);
    75f8:	102c      	lrw      	r1, 0x8abe	// 7628 <EarphoneWakeUp+0x34>
    75fa:	100d      	lrw      	r0, 0x8f87	// 762c <EarphoneWakeUp+0x38>
    75fc:	e3ffe17a 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
	GPIO_Write_Low(charge_5V_boost_pin);
    7600:	9400      	ld.w      	r0, (r4, 0x0)
    7602:	3101      	movi      	r1, 1
    7604:	e3ffed2a 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
	GPIO_Init(pattern_TX_pin, Output);
    7608:	3200      	movi      	r2, 0
    760a:	9400      	ld.w      	r0, (r4, 0x0)
    760c:	3104      	movi      	r1, 4
    760e:	e3ffeb39 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_High(pattern_TX_pin);
    7612:	9400      	ld.w      	r0, (r4, 0x0)
    7614:	3104      	movi      	r1, 4
    7616:	e3ffed1d 	bsr      	0x5050	// 5050 <GPIO_Write_High>
	GPIO_InPutOutPut_Disable(pattern_RX_pin);
    761a:	9400      	ld.w      	r0, (r4, 0x0)
    761c:	3105      	movi      	r1, 5
    761e:	e3ffeba1 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
}
    7622:	1491      	pop      	r4, r15
    7624:	2000004c 	.long	0x2000004c
    7628:	00008abe 	.long	0x00008abe
    762c:	00008f87 	.long	0x00008f87

Disassembly of section .text.app_stop_100_millisecond_timer:

00007630 <app_stop_100_millisecond_timer>:
{
    7630:	14d1      	push      	r4, r15
    7632:	6d03      	mov      	r4, r0
	printf("%s: %d\r\n",__func__, timer_id);
    7634:	6c83      	mov      	r2, r0
    7636:	1028      	lrw      	r1, 0x8acd	// 7654 <app_stop_100_millisecond_timer+0x24>
    7638:	1008      	lrw      	r0, 0x8f72	// 7658 <app_stop_100_millisecond_timer+0x28>
    763a:	e3ffe15b 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
    timer->timer_en = 0;
    763e:	4402      	lsli      	r0, r4, 2
    7640:	6010      	addu      	r0, r4
    7642:	1067      	lrw      	r3, 0x20000128	// 765c <app_stop_100_millisecond_timer+0x2c>
    7644:	4002      	lsli      	r0, r0, 2
    7646:	600c      	addu      	r0, r3
    7648:	3300      	movi      	r3, 0
    764a:	a061      	st.b      	r3, (r0, 0x1)
    timer->timer_count = 0;
    764c:	3300      	movi      	r3, 0
    764e:	b061      	st.w      	r3, (r0, 0x4)
}
    7650:	1491      	pop      	r4, r15
    7652:	0000      	bkpt
    7654:	00008acd 	.long	0x00008acd
    7658:	00008f72 	.long	0x00008f72
    765c:	20000128 	.long	0x20000128

Disassembly of section .text.app_start_100_millisecond_timer:

00007660 <app_start_100_millisecond_timer>:
{
    7660:	14d1      	push      	r4, r15
    7662:	6d03      	mov      	r4, r0
	printf("%s: %d\r\n",__func__, timer_id);
    7664:	6c83      	mov      	r2, r0
    7666:	1028      	lrw      	r1, 0x8aec	// 7684 <app_start_100_millisecond_timer+0x24>
    7668:	1008      	lrw      	r0, 0x8f72	// 7688 <app_start_100_millisecond_timer+0x28>
    766a:	e3ffe143 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
    timer->timer_en = 1;
    766e:	4402      	lsli      	r0, r4, 2
    7670:	6010      	addu      	r0, r4
    7672:	1067      	lrw      	r3, 0x20000128	// 768c <app_start_100_millisecond_timer+0x2c>
    7674:	4002      	lsli      	r0, r0, 2
    7676:	600c      	addu      	r0, r3
    7678:	3301      	movi      	r3, 1
    767a:	a061      	st.b      	r3, (r0, 0x1)
    timer->timer_count = 0;
    767c:	3300      	movi      	r3, 0
    767e:	b061      	st.w      	r3, (r0, 0x4)
}
    7680:	1491      	pop      	r4, r15
    7682:	0000      	bkpt
    7684:	00008aec 	.long	0x00008aec
    7688:	00008f72 	.long	0x00008f72
    768c:	20000128 	.long	0x20000128

Disassembly of section .text.app_100_millisecond_timer_check:

00007690 <app_100_millisecond_timer_check>:
{
    7690:	14d2      	push      	r4-r5, r15
    struct APP_100_MILLISECOND_TIMER_STRUCT *timer = app_100_millisecond_array;
    7692:	108f      	lrw      	r4, 0x20000128	// 76cc <app_100_millisecond_timer_check+0x3c>
    for(i = 0; i < ARRAY_SIZE(app_100_millisecond_array); i++) {
    7694:	3564      	movi      	r5, 100
    7696:	6150      	addu      	r5, r4
        if (timer->timer_en) {
    7698:	8461      	ld.b      	r3, (r4, 0x1)
    769a:	3b40      	cmpnei      	r3, 0
    769c:	0c10      	bf      	0x76bc	// 76bc <app_100_millisecond_timer_check+0x2c>
            timer->timer_count++;
    769e:	9461      	ld.w      	r3, (r4, 0x4)
    76a0:	2300      	addi      	r3, 1
            if (timer->timer_count >= timer->timer_period) {
    76a2:	9442      	ld.w      	r2, (r4, 0x8)
    76a4:	648c      	cmphs      	r3, r2
            timer->timer_count++;
    76a6:	b461      	st.w      	r3, (r4, 0x4)
            if (timer->timer_count >= timer->timer_period) {
    76a8:	0c0a      	bf      	0x76bc	// 76bc <app_100_millisecond_timer_check+0x2c>
                if(timer->timer_periodic == FALSE) timer->timer_en = 0;
    76aa:	8462      	ld.b      	r3, (r4, 0x2)
    76ac:	3b40      	cmpnei      	r3, 0
    76ae:	080b      	bt      	0x76c4	// 76c4 <app_100_millisecond_timer_check+0x34>
    76b0:	a461      	st.b      	r3, (r4, 0x1)
                if (timer->cb) timer->cb(timer->parm);
    76b2:	9463      	ld.w      	r3, (r4, 0xc)
    76b4:	3b40      	cmpnei      	r3, 0
    76b6:	0c03      	bf      	0x76bc	// 76bc <app_100_millisecond_timer_check+0x2c>
    76b8:	8410      	ld.b      	r0, (r4, 0x10)
    76ba:	7bcd      	jsr      	r3
        timer++;
    76bc:	2413      	addi      	r4, 20
    for(i = 0; i < ARRAY_SIZE(app_100_millisecond_array); i++) {
    76be:	6552      	cmpne      	r4, r5
    76c0:	0bec      	bt      	0x7698	// 7698 <app_100_millisecond_timer_check+0x8>
}
    76c2:	1492      	pop      	r4-r5, r15
				else timer->timer_count = 0;
    76c4:	3300      	movi      	r3, 0
    76c6:	b461      	st.w      	r3, (r4, 0x4)
    76c8:	07f5      	br      	0x76b2	// 76b2 <app_100_millisecond_timer_check+0x22>
    76ca:	0000      	bkpt
    76cc:	20000128 	.long	0x20000128

Disassembly of section .text.app_charge_type_get:

000076d0 <app_charge_type_get>:
{
    76d0:	14d2      	push      	r4-r5, r15
	if(GPIO_Read_Status(charge_USB5V_detect_pin)) charge_type = APP_CHARGE_TYPE_WIRED;
    76d2:	10aa      	lrw      	r5, 0x20000050	// 76f8 <app_charge_type_get+0x28>
    76d4:	3103      	movi      	r1, 3
    76d6:	9500      	ld.w      	r0, (r5, 0x0)
    76d8:	e3ffeccf 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    76dc:	3840      	cmpnei      	r0, 0
    76de:	6d03      	mov      	r4, r0
    76e0:	0809      	bt      	0x76f2	// 76f2 <app_charge_type_get+0x22>
	else if(GPIO_Read_Status(charge_wireless5V_dectect_pin)) charge_type = APP_CHARGE_TYPE_WIRELESS;
    76e2:	9500      	ld.w      	r0, (r5, 0x0)
    76e4:	3100      	movi      	r1, 0
    76e6:	e3ffecc8 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    76ea:	3840      	cmpnei      	r0, 0
    76ec:	6111      	addc      	r4, r4
    76ee:	4401      	lsli      	r0, r4, 1
}
    76f0:	1492      	pop      	r4-r5, r15
	if(GPIO_Read_Status(charge_USB5V_detect_pin)) charge_type = APP_CHARGE_TYPE_WIRED;
    76f2:	3001      	movi      	r0, 1
    76f4:	07fe      	br      	0x76f0	// 76f0 <app_charge_type_get+0x20>
    76f6:	0000      	bkpt
    76f8:	20000050 	.long	0x20000050

Disassembly of section .text.battery_power_update:

000076fc <battery_power_update>:
{
    76fc:	14d1      	push      	r4, r15
    76fe:	6d03      	mov      	r4, r0
	printf("%s: %d%%\r\n",__func__, percent);
    7700:	6c83      	mov      	r2, r0
    7702:	1024      	lrw      	r1, 0x8b2a	// 7710 <battery_power_update+0x14>
    7704:	1004      	lrw      	r0, 0x8f9c	// 7714 <battery_power_update+0x18>
    7706:	e3ffe0f5 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
	battery_percentage = percent;
    770a:	1064      	lrw      	r3, 0x20000188	// 7718 <battery_power_update+0x1c>
    770c:	a388      	st.b      	r4, (r3, 0x8)
}
    770e:	1491      	pop      	r4, r15
    7710:	00008b2a 	.long	0x00008b2a
    7714:	00008f9c 	.long	0x00008f9c
    7718:	20000188 	.long	0x20000188

Disassembly of section .text.battery_level_calculate:

0000771c <battery_level_calculate>:
{
    771c:	14d2      	push      	r4-r5, r15
	if(battery_mv <= APP_BATTERY_PD_MV) level = 0; //电量耗尽
    771e:	33c8      	movi      	r3, 200
    7720:	4364      	lsli      	r3, r3, 4
    7722:	640c      	cmphs      	r3, r0
{
    7724:	6d43      	mov      	r5, r0
	if(battery_mv <= APP_BATTERY_PD_MV) level = 0; //电量耗尽
    7726:	081d      	bt      	0x7760	// 7760 <battery_level_calculate+0x44>
		level = ((battery_mv - APP_BATTERY_PD_MV) / APP_BATTERY_MV_BASE + 1);
    7728:	100f      	lrw      	r0, 0xfffff380	// 7764 <battery_level_calculate+0x48>
    772a:	6014      	addu      	r0, r5
    772c:	e3ffda9c 	bsr      	0x2c64	// 2c64 <__floatunsisf>
    7730:	102e      	lrw      	r1, 0x411b3333	// 7768 <battery_level_calculate+0x4c>
    7732:	e3ffda11 	bsr      	0x2b54	// 2b54 <__divsf3>
    7736:	31fe      	movi      	r1, 254
    7738:	4136      	lsli      	r1, r1, 22
    773a:	e3ffd9dd 	bsr      	0x2af4	// 2af4 <__addsf3>
    773e:	e3ffda69 	bsr      	0x2c10	// 2c10 <__fixsfsi>
    7742:	6d03      	mov      	r4, r0
    7744:	3364      	movi      	r3, 100
    7746:	7402      	sextb      	r0, r0
    7748:	640d      	cmplt      	r3, r0
    774a:	0c02      	bf      	0x774e	// 774e <battery_level_calculate+0x32>
    774c:	3464      	movi      	r4, 100
    774e:	7512      	sextb      	r4, r4
	printf("%s: %ldmV %d%%\r\n",__func__, battery_mv, level);
    7750:	6cd3      	mov      	r3, r4
    7752:	6c97      	mov      	r2, r5
    7754:	1026      	lrw      	r1, 0x8b3f	// 776c <battery_level_calculate+0x50>
    7756:	1007      	lrw      	r0, 0x8fa7	// 7770 <battery_level_calculate+0x54>
    7758:	e3ffe0cc 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
}
    775c:	6c13      	mov      	r0, r4
    775e:	1492      	pop      	r4-r5, r15
	if(battery_mv <= APP_BATTERY_PD_MV) level = 0; //电量耗尽
    7760:	3400      	movi      	r4, 0
    7762:	07f7      	br      	0x7750	// 7750 <battery_level_calculate+0x34>
    7764:	fffff380 	.long	0xfffff380
    7768:	411b3333 	.long	0x411b3333
    776c:	00008b3f 	.long	0x00008b3f
    7770:	00008fa7 	.long	0x00008fa7

Disassembly of section .text.app_deinit:

00007774 <app_deinit>:

void app_deinit(void)
{
    7774:	14d2      	push      	r4-r5, r15
	GPIO_Write_Low(charge_5V_boost_pin);
    7776:	11a1      	lrw      	r5, 0x2000004c	// 77f8 <app_deinit+0x84>
    7778:	3101      	movi      	r1, 1
    777a:	9500      	ld.w      	r0, (r5, 0x0)
    777c:	e3ffec6e 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
	GPIO_Init(pattern_TX_pin, Output);
    7780:	3200      	movi      	r2, 0
    7782:	9500      	ld.w      	r0, (r5, 0x0)
    7784:	3104      	movi      	r1, 4
    7786:	e3ffea7d 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_Low(pattern_TX_pin);
    778a:	9500      	ld.w      	r0, (r5, 0x0)
    778c:	3104      	movi      	r1, 4
    778e:	e3ffec65 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
	GPIO_InPutOutPut_Disable(pattern_RX_pin);
    7792:	3105      	movi      	r1, 5
    7794:	9500      	ld.w      	r0, (r5, 0x0)
    7796:	e3ffeae5 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>

	ADC12_ready_wait();
    779a:	e3fff1ef 	bsr      	0x5b78	// 5b78 <ADC12_ready_wait>
	ADC12_Control(ADC12_STOP); //休眠前不停止ADC转换，这会造成唤醒后，MCU卡机
    779e:	3010      	movi      	r0, 16
    77a0:	e3fff1aa 	bsr      	0x5af4	// 5af4 <ADC12_Control>
	ADC12_CMD(DISABLE);
	GPIO_InPutOutPut_Disable(chg_l_adc_pin);
    77a4:	1096      	lrw      	r4, 0x20000050	// 77fc <app_deinit+0x88>
	ADC12_CMD(DISABLE);
    77a6:	3000      	movi      	r0, 0
    77a8:	e3fff1d4 	bsr      	0x5b50	// 5b50 <ADC12_CMD>
	GPIO_InPutOutPut_Disable(chg_l_adc_pin);
    77ac:	9400      	ld.w      	r0, (r4, 0x0)
    77ae:	3105      	movi      	r1, 5
    77b0:	e3ffead8 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_InPutOutPut_Disable(chg_r_adc_pin);
    77b4:	9400      	ld.w      	r0, (r4, 0x0)
    77b6:	310c      	movi      	r1, 12
    77b8:	e3ffead4 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_InPutOutPut_Disable(bat_adc_pin);
    77bc:	9400      	ld.w      	r0, (r4, 0x0)
    77be:	3109      	movi      	r1, 9
    77c0:	e3ffead0 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_InPutOutPut_Disable(ntc_adc_pin);
    77c4:	9400      	ld.w      	r0, (r4, 0x0)
    77c6:	310a      	movi      	r1, 10
    77c8:	e3ffeacc 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	
	GPIO_InPutOutPut_Disable(red_led_pin);
    77cc:	9500      	ld.w      	r0, (r5, 0x0)
    77ce:	3102      	movi      	r1, 2
    77d0:	e3ffeac8 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_InPutOutPut_Disable(blue_led_pin);
    77d4:	9400      	ld.w      	r0, (r4, 0x0)
    77d6:	3108      	movi      	r1, 8
    77d8:	e3ffeac4 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_InPutOutPut_Disable(green_led_pin);
    77dc:	9500      	ld.w      	r0, (r5, 0x0)
    77de:	3103      	movi      	r1, 3
    77e0:	e3ffeac0 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_InPutOutPut_Disable(NTC_detect_pin);
    77e4:	9400      	ld.w      	r0, (r4, 0x0)
    77e6:	310e      	movi      	r1, 14
    77e8:	e3ffeabc 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_Write_Low(NTC_detect_pin);
    77ec:	9400      	ld.w      	r0, (r4, 0x0)
    77ee:	310e      	movi      	r1, 14
    77f0:	e3ffec34 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
}
    77f4:	1492      	pop      	r4-r5, r15
    77f6:	0000      	bkpt
    77f8:	2000004c 	.long	0x2000004c
    77fc:	20000050 	.long	0x20000050

Disassembly of section .text.app_recover:

00007800 <app_recover>:

void app_recover(void)
{
    7800:	14d2      	push      	r4-r5, r15
	if(battery_status == APP_BATTERY_STATUS_NORMAL) {
    7802:	1172      	lrw      	r3, 0x20000128	// 78c8 <app_recover+0xc8>
    7804:	1192      	lrw      	r4, 0x2000004c	// 78cc <app_recover+0xcc>
    7806:	9359      	ld.w      	r2, (r3, 0x64)
    7808:	3a40      	cmpnei      	r2, 0
    780a:	0818      	bt      	0x783a	// 783a <app_recover+0x3a>
		if(hall_status == APP_HALL_STATUS_CLOSE_BOX) {
    780c:	935c      	ld.w      	r2, (r3, 0x70)
    780e:	3a41      	cmpnei      	r2, 1
    7810:	0815      	bt      	0x783a	// 783a <app_recover+0x3a>
			if(earphone_status == APP_EARPHONE_STATUS_CHARGING) {
    7812:	937b      	ld.w      	r3, (r3, 0x6c)
    7814:	3b41      	cmpnei      	r3, 1
    7816:	0812      	bt      	0x783a	// 783a <app_recover+0x3a>
				GPIO_Write_High(charge_5V_boost_pin);
    7818:	3101      	movi      	r1, 1
    781a:	9400      	ld.w      	r0, (r4, 0x0)
    781c:	e3ffec1a 	bsr      	0x5050	// 5050 <GPIO_Write_High>
				GPIO_Init(pattern_TX_pin, Output);
    7820:	3200      	movi      	r2, 0
    7822:	3104      	movi      	r1, 4
    7824:	9400      	ld.w      	r0, (r4, 0x0)
    7826:	e3ffea2d 	bsr      	0x4c80	// 4c80 <GPIO_Init>
				GPIO_Write_Low(pattern_TX_pin);
    782a:	3104      	movi      	r1, 4
    782c:	9400      	ld.w      	r0, (r4, 0x0)
    782e:	e3ffec15 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
				GPIO_InPutOutPut_Disable(pattern_RX_pin);
    7832:	3105      	movi      	r1, 5
    7834:	9400      	ld.w      	r0, (r4, 0x0)
    7836:	e3ffea95 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
			}
		}
	}

	ADC12_ConversionChannel_Config(ADC12_ADCIN10, ADC12_CV_RepeatNum8, ADC12_AVGEN, 0);
    783a:	3280      	movi      	r2, 128
    783c:	31c6      	movi      	r1, 198
    783e:	3300      	movi      	r3, 0
    7840:	4245      	lsli      	r2, r2, 5
    7842:	4127      	lsli      	r1, r1, 7
    7844:	300a      	movi      	r0, 10
    7846:	e3fff2b7 	bsr      	0x5db4	// 5db4 <ADC12_ConversionChannel_Config>
	ADC12_ConversionChannel_Config(ADC12_ADCIN4, ADC12_CV_RepeatNum8, ADC12_AVGEN, 1);
    784a:	3280      	movi      	r2, 128
    784c:	31c6      	movi      	r1, 198
    784e:	3301      	movi      	r3, 1
    7850:	4245      	lsli      	r2, r2, 5
    7852:	4127      	lsli      	r1, r1, 7
    7854:	3004      	movi      	r0, 4
    7856:	e3fff2af 	bsr      	0x5db4	// 5db4 <ADC12_ConversionChannel_Config>
	ADC12_ConversionChannel_Config(ADC12_ADCIN13, ADC12_CV_RepeatNum8, ADC12_AVGEN, 2);
    785a:	3280      	movi      	r2, 128
    785c:	31c6      	movi      	r1, 198
    785e:	3302      	movi      	r3, 2
    7860:	4245      	lsli      	r2, r2, 5
    7862:	4127      	lsli      	r1, r1, 7
    7864:	300d      	movi      	r0, 13
    7866:	e3fff2a7 	bsr      	0x5db4	// 5db4 <ADC12_ConversionChannel_Config>
	ADC12_ConversionChannel_Config(ADC12_ADCIN11, ADC12_CV_RepeatNum8, ADC12_AVGEN, 3);
    786a:	3280      	movi      	r2, 128
    786c:	31c6      	movi      	r1, 198
    786e:	3303      	movi      	r3, 3
    7870:	4245      	lsli      	r2, r2, 5
    7872:	4127      	lsli      	r1, r1, 7
    7874:	300b      	movi      	r0, 11
    7876:	e3fff29f 	bsr      	0x5db4	// 5db4 <ADC12_ConversionChannel_Config>
	ADC12_CMD(ENABLE);
    787a:	3001      	movi      	r0, 1
    787c:	e3fff16a 	bsr      	0x5b50	// 5b50 <ADC12_CMD>
	ADC12_ready_wait();
    7880:	e3fff17c 	bsr      	0x5b78	// 5b78 <ADC12_ready_wait>
	
	EPT_IO_SET(EPT_IO_CHBX, IO_NUM_PB02);
	GPIO_Init(blue_led_pin, Output);
    7884:	10b3      	lrw      	r5, 0x20000050	// 78d0 <app_recover+0xd0>
	EPT_IO_SET(EPT_IO_CHBX, IO_NUM_PB02);
    7886:	3116      	movi      	r1, 22
    7888:	3002      	movi      	r0, 2
    788a:	e3ffef41 	bsr      	0x570c	// 570c <EPT_IO_SET>
	GPIO_Init(blue_led_pin, Output);
    788e:	3200      	movi      	r2, 0
    7890:	3108      	movi      	r1, 8
    7892:	9500      	ld.w      	r0, (r5, 0x0)
    7894:	e3ffe9f6 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Init(green_led_pin, Output);
    7898:	9400      	ld.w      	r0, (r4, 0x0)
    789a:	3200      	movi      	r2, 0
    789c:	3103      	movi      	r1, 3
    789e:	e3ffe9f1 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Init(NTC_detect_pin, Output);
    78a2:	3200      	movi      	r2, 0
    78a4:	310e      	movi      	r1, 14
    78a6:	9500      	ld.w      	r0, (r5, 0x0)
    78a8:	e3ffe9ec 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	if(GPIO_Read_Status(charge_USB5V_detect_pin)) GPIO_Write_High(NTC_detect_pin);
    78ac:	3103      	movi      	r1, 3
    78ae:	9500      	ld.w      	r0, (r5, 0x0)
    78b0:	e3ffebe3 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    78b4:	3840      	cmpnei      	r0, 0
    78b6:	310e      	movi      	r1, 14
    78b8:	9500      	ld.w      	r0, (r5, 0x0)
    78ba:	0c04      	bf      	0x78c2	// 78c2 <app_recover+0xc2>
    78bc:	e3ffebca 	bsr      	0x5050	// 5050 <GPIO_Write_High>
	else GPIO_Write_Low(NTC_detect_pin);
}
    78c0:	1492      	pop      	r4-r5, r15
	else GPIO_Write_Low(NTC_detect_pin);
    78c2:	e3ffebcb 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
}
    78c6:	07fd      	br      	0x78c0	// 78c0 <app_recover+0xc0>
    78c8:	20000128 	.long	0x20000128
    78cc:	2000004c 	.long	0x2000004c
    78d0:	20000050 	.long	0x20000050

Disassembly of section .text.system_goto_deepsleep_mode:

000078d4 <system_goto_deepsleep_mode>:

void system_goto_deepsleep_mode(U8_T parm)
{	
    78d4:	14d2      	push      	r4-r5, r15
	is_system_active = FALSE;
    78d6:	3300      	movi      	r3, 0
    78d8:	1090      	lrw      	r4, 0x20000188	// 7918 <system_goto_deepsleep_mode+0x44>
    78da:	a474      	st.b      	r3, (r4, 0x14)
	app_deinit();
    78dc:	e3ffff4c 	bsr      	0x7774	// 7774 <app_deinit>
	app_status_indication_set(APP_STATUS_INDICATION_DSLEEP);
    78e0:	300f      	movi      	r0, 15
    78e2:	e000068b 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
	printf("system goto deepsleep\r\n");
    78e6:	100e      	lrw      	r0, 0x8fb8	// 791c <system_goto_deepsleep_mode+0x48>
    78e8:	e3ffe016 	bsr      	0x3914	// 3914 <__GI_puts>
	printf("bye bye~~\r\n");
    78ec:	100d      	lrw      	r0, 0x8fcf	// 7920 <system_goto_deepsleep_mode+0x4c>
    78ee:	e3ffe013 	bsr      	0x3914	// 3914 <__GI_puts>
	PCLK_goto_deepsleep_mode();
    78f2:	e3ffe91f 	bsr      	0x4b30	// 4b30 <PCLK_goto_deepsleep_mode>
	Coret_DelayMs(100); //系统唤醒后，延时使其稳定
    78f6:	3064      	movi      	r0, 100
    78f8:	3100      	movi      	r1, 0
    78fa:	e0000863 	bsr      	0x89c0	// 89c0 <Coret_DelayMs>
	do {
		app_recover();
		is_system_active = TRUE;
		printf("\r\n\r\nsystem wakeup~~\r\n");
    78fe:	10aa      	lrw      	r5, 0x8fda	// 7924 <system_goto_deepsleep_mode+0x50>
		app_recover();
    7900:	e3ffff80 	bsr      	0x7800	// 7800 <app_recover>
		is_system_active = TRUE;
    7904:	3301      	movi      	r3, 1
		printf("\r\n\r\nsystem wakeup~~\r\n");
    7906:	6c17      	mov      	r0, r5
		is_system_active = TRUE;
    7908:	a474      	st.b      	r3, (r4, 0x14)
		printf("\r\n\r\nsystem wakeup~~\r\n");
    790a:	e3ffe005 	bsr      	0x3914	// 3914 <__GI_puts>
	}while(is_system_active == FALSE);
    790e:	8474      	ld.b      	r3, (r4, 0x14)
    7910:	3b40      	cmpnei      	r3, 0
    7912:	0ff7      	bf      	0x7900	// 7900 <system_goto_deepsleep_mode+0x2c>
}
    7914:	1492      	pop      	r4-r5, r15
    7916:	0000      	bkpt
    7918:	20000188 	.long	0x20000188
    791c:	00008fb8 	.long	0x00008fb8
    7920:	00008fcf 	.long	0x00008fcf
    7924:	00008fda 	.long	0x00008fda

Disassembly of section .text.system_shutdown:

00007928 <system_shutdown>:

void system_shutdown(void)
{
    7928:	14d0      	push      	r15
	EXI1_WakeUp_Disable();
    792a:	e3ffe939 	bsr      	0x4b9c	// 4b9c <EXI1_WakeUp_Disable>
	EXI3_WakeUp_Disable();
    792e:	e3ffe94f 	bsr      	0x4bcc	// 4bcc <EXI3_WakeUp_Disable>
	EXTI_trigger_CMD(DISABLE, EXI_PIN3, _EXIFT);//禁止USB-C拔出唤醒
    7932:	3201      	movi      	r2, 1
    7934:	3108      	movi      	r1, 8
    7936:	3000      	movi      	r0, 0
    7938:	e3ffe8c2 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	printf("system shutdown!!!\r\n");
    793c:	1004      	lrw      	r0, 0x8fef	// 794c <system_shutdown+0x24>
    793e:	e3ffdfeb 	bsr      	0x3914	// 3914 <__GI_puts>
	system_goto_deepsleep_mode(0);
    7942:	3000      	movi      	r0, 0
    7944:	e3ffffc8 	bsr      	0x78d4	// 78d4 <system_goto_deepsleep_mode>
}
    7948:	1490      	pop      	r15
    794a:	0000      	bkpt
    794c:	00008fef 	.long	0x00008fef

Disassembly of section .text.adc_get_val:

00007950 <adc_get_val>:

/* 获取NTC检测脚的ADC转换数值 */
U32_T adc_get_val(enum ADC_CONV_SEQ adc_seq)
{
    7950:	14d1      	push      	r4, r15
    7952:	6d03      	mov      	r4, r0
	ADC12_ready_wait();
    7954:	e3fff112 	bsr      	0x5b78	// 5b78 <ADC12_ready_wait>
	ADC0->CSR |= (1 << (16 + adc_seq)); /* 清除SEQ0序列转换完成中断 */
    7958:	106a      	lrw      	r3, 0x20000054	// 7980 <adc_get_val+0x30>
    795a:	3010      	movi      	r0, 16
    795c:	9340      	ld.w      	r2, (r3, 0x0)
    795e:	6010      	addu      	r0, r4
    7960:	3301      	movi      	r3, 1
    7962:	9227      	ld.w      	r1, (r2, 0x1c)
    7964:	70c0      	lsl      	r3, r0
    7966:	6cc4      	or      	r3, r1
    7968:	b267      	st.w      	r3, (r2, 0x1c)
	ADC12_Control(ADC12_START);	/* 开始模数转换 */
    796a:	3008      	movi      	r0, 8
    796c:	e3fff0c4 	bsr      	0x5af4	// 5af4 <ADC12_Control>
	ADC12_SEQEND_wait(adc_seq);
    7970:	7410      	zextb      	r0, r4
    7972:	e3fff10d 	bsr      	0x5b8c	// 5b8c <ADC12_SEQEND_wait>
	return ADC12_DATA_OUPUT(adc_seq);
    7976:	7411      	zexth      	r0, r4
    7978:	e3fff116 	bsr      	0x5ba4	// 5ba4 <ADC12_DATA_OUPUT>
}
    797c:	1491      	pop      	r4, r15
    797e:	0000      	bkpt
    7980:	20000054 	.long	0x20000054

Disassembly of section .text.BatteryPowerCheck:

00007984 <BatteryPowerCheck>:
{
    7984:	14d1      	push      	r4, r15
	printf("enter function->%s\r\n", __func__);
    7986:	103c      	lrw      	r1, 0x8b57	// 79f4 <BatteryPowerCheck+0x70>
    7988:	101c      	lrw      	r0, 0x8f87	// 79f8 <BatteryPowerCheck+0x74>
    798a:	e3ffdfb3 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
	battery_mv = battery_adc_to_mv(adc_get_val(BATTERY_ADC));
    798e:	3000      	movi      	r0, 0
    7990:	e3ffffe0 	bsr      	0x7950	// 7950 <adc_get_val>
    7994:	e3ffdd50 	bsr      	0x3434	// 3434 <__floatunsidf>
    7998:	3200      	movi      	r2, 0
    799a:	1079      	lrw      	r3, 0x3fe75400	// 79fc <BatteryPowerCheck+0x78>
    799c:	e3ffdb32 	bsr      	0x3000	// 3000 <__muldf3>
    79a0:	3200      	movi      	r2, 0
    79a2:	1078      	lrw      	r3, 0x40438000	// 7a00 <BatteryPowerCheck+0x7c>
    79a4:	e3ffdc48 	bsr      	0x3234	// 3234 <__divdf3>
    79a8:	3200      	movi      	r2, 0
    79aa:	1077      	lrw      	r3, 0x405e4000	// 7a04 <BatteryPowerCheck+0x80>
    79ac:	e3ffdb2a 	bsr      	0x3000	// 3000 <__muldf3>
    79b0:	e3ffd43a 	bsr      	0x2224	// 2224 <__fixunsdfsi>
	level = battery_level_calculate(battery_mv);
    79b4:	e3fffeb4 	bsr      	0x771c	// 771c <battery_level_calculate>
    79b8:	6d03      	mov      	r4, r0
	if(app_charge_type_get() != APP_CHARGE_TYPE_DISCHARGE && app_battery_status_get() == APP_BATTERY_STATUS_CHARGING) {//使能充电IC时，电量只能加不能减
    79ba:	e3fffe8b 	bsr      	0x76d0	// 76d0 <app_charge_type_get>
    79be:	3840      	cmpnei      	r0, 0
    79c0:	1052      	lrw      	r2, 0x20000188	// 7a08 <BatteryPowerCheck+0x84>
    79c2:	1073      	lrw      	r3, 0x2000026c	// 7a0c <BatteryPowerCheck+0x88>
		if(level > battery_power_get()) battery_check_count++;
    79c4:	8248      	ld.b      	r2, (r2, 0x8)
	if(app_charge_type_get() != APP_CHARGE_TYPE_DISCHARGE && app_battery_status_get() == APP_BATTERY_STATUS_CHARGING) {//使能充电IC时，电量只能加不能减
    79c6:	0c15      	bf      	0x79f0	// 79f0 <BatteryPowerCheck+0x6c>
	return battery_status;
    79c8:	1032      	lrw      	r1, 0x20000128	// 7a10 <BatteryPowerCheck+0x8c>
	if(app_charge_type_get() != APP_CHARGE_TYPE_DISCHARGE && app_battery_status_get() == APP_BATTERY_STATUS_CHARGING) {//使能充电IC时，电量只能加不能减
    79ca:	9139      	ld.w      	r1, (r1, 0x64)
    79cc:	3941      	cmpnei      	r1, 1
    79ce:	0811      	bt      	0x79f0	// 79f0 <BatteryPowerCheck+0x6c>
		if(level > battery_power_get()) battery_check_count++;
    79d0:	6509      	cmplt      	r2, r4
    79d2:	0c0d      	bf      	0x79ec	// 79ec <BatteryPowerCheck+0x68>
    79d4:	8340      	ld.b      	r2, (r3, 0x0)
    79d6:	2200      	addi      	r2, 1
		else battery_check_count = 0;
    79d8:	a340      	st.b      	r2, (r3, 0x0)
	if(battery_check_count >= 3)
    79da:	8340      	ld.b      	r2, (r3, 0x0)
    79dc:	3a02      	cmphsi      	r2, 3
    79de:	0c06      	bf      	0x79ea	// 79ea <BatteryPowerCheck+0x66>
		battery_check_count = 0;
    79e0:	3200      	movi      	r2, 0
		battery_power_update(level);
    79e2:	7410      	zextb      	r0, r4
		battery_check_count = 0;
    79e4:	a340      	st.b      	r2, (r3, 0x0)
		battery_power_update(level);
    79e6:	e3fffe8b 	bsr      	0x76fc	// 76fc <battery_power_update>
}
    79ea:	1491      	pop      	r4, r15
		else battery_check_count = 0;
    79ec:	3200      	movi      	r2, 0
    79ee:	07f5      	br      	0x79d8	// 79d8 <BatteryPowerCheck+0x54>
		if(level < battery_power_get()) battery_check_count++;
    79f0:	6491      	cmplt      	r4, r2
    79f2:	07f0      	br      	0x79d2	// 79d2 <BatteryPowerCheck+0x4e>
    79f4:	00008b57 	.long	0x00008b57
    79f8:	00008f87 	.long	0x00008f87
    79fc:	3fe75400 	.long	0x3fe75400
    7a00:	40438000 	.long	0x40438000
    7a04:	405e4000 	.long	0x405e4000
    7a08:	20000188 	.long	0x20000188
    7a0c:	2000026c 	.long	0x2000026c
    7a10:	20000128 	.long	0x20000128

Disassembly of section .text.EarphoneStatusCheck:

00007a14 <EarphoneStatusCheck>:
{
    7a14:	14d4      	push      	r4-r7, r15
    7a16:	1422      	subi      	r14, r14, 8
	printf("enter function->%s\r\n", __func__);
    7a18:	1236      	lrw      	r1, 0x8b69	// 7b70 <EarphoneStatusCheck+0x15c>
    7a1a:	1217      	lrw      	r0, 0x8f87	// 7b74 <EarphoneStatusCheck+0x160>
    7a1c:	e3ffdf6a 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
	L_pogo_adc = adc_get_val(L_EARBUD_POGO_ADC);
    7a20:	3002      	movi      	r0, 2
    7a22:	e3ffff97 	bsr      	0x7950	// 7950 <adc_get_val>
    7a26:	6d83      	mov      	r6, r0
	R_pogo_adc = adc_get_val(R_EARBUD_POGO_ADC);
    7a28:	3001      	movi      	r0, 1
    7a2a:	e3ffff93 	bsr      	0x7950	// 7950 <adc_get_val>
    7a2e:	6d43      	mov      	r5, r0
	if(pogo_adc_to_mA(L_pogo_adc) >= EARPHONE_OVER_CURRENT_MA || pogo_adc_to_mA(R_pogo_adc) >= EARPHONE_OVER_CURRENT_MA) {
    7a30:	6c1b      	mov      	r0, r6
    7a32:	e3ffdd01 	bsr      	0x3434	// 3434 <__floatunsidf>
    7a36:	3200      	movi      	r2, 0
    7a38:	1270      	lrw      	r3, 0x3fe76a00	// 7b78 <EarphoneStatusCheck+0x164>
    7a3a:	e3ffdae3 	bsr      	0x3000	// 3000 <__muldf3>
    7a3e:	1270      	lrw      	r3, 0x3fe00000	// 7b7c <EarphoneStatusCheck+0x168>
    7a40:	3200      	movi      	r2, 0
    7a42:	e3ffdadf 	bsr      	0x3000	// 3000 <__muldf3>
    7a46:	e3ffd3ef 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7a4a:	3345      	movi      	r3, 69
    7a4c:	640c      	cmphs      	r3, r0
    7a4e:	126d      	lrw      	r3, 0x20000128	// 7b80 <EarphoneStatusCheck+0x16c>
    7a50:	6dc3      	mov      	r7, r0
    7a52:	128d      	lrw      	r4, 0x2000004c	// 7b84 <EarphoneStatusCheck+0x170>
    7a54:	b861      	st.w      	r3, (r14, 0x4)
    7a56:	0c12      	bf      	0x7a7a	// 7a7a <EarphoneStatusCheck+0x66>
    7a58:	6c17      	mov      	r0, r5
    7a5a:	e3ffdced 	bsr      	0x3434	// 3434 <__floatunsidf>
    7a5e:	3200      	movi      	r2, 0
    7a60:	1266      	lrw      	r3, 0x3fe76a00	// 7b78 <EarphoneStatusCheck+0x164>
    7a62:	e3ffdacf 	bsr      	0x3000	// 3000 <__muldf3>
    7a66:	3200      	movi      	r2, 0
    7a68:	1265      	lrw      	r3, 0x3fe00000	// 7b7c <EarphoneStatusCheck+0x168>
    7a6a:	e3ffdacb 	bsr      	0x3000	// 3000 <__muldf3>
    7a6e:	e3ffd3db 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7a72:	3245      	movi      	r2, 69
    7a74:	6408      	cmphs      	r2, r0
    7a76:	6cc3      	mov      	r3, r0
    7a78:	0841      	bt      	0x7afa	// 7afa <EarphoneStatusCheck+0xe6>
		GPIO_Write_Low(charge_5V_boost_pin);
    7a7a:	9400      	ld.w      	r0, (r4, 0x0)
    7a7c:	3101      	movi      	r1, 1
    7a7e:	e3ffeaed 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
		GPIO_Init(pattern_TX_pin, Output);
    7a82:	3200      	movi      	r2, 0
    7a84:	9400      	ld.w      	r0, (r4, 0x0)
    7a86:	3104      	movi      	r1, 4
    7a88:	e3ffe8fc 	bsr      	0x4c80	// 4c80 <GPIO_Init>
		GPIO_Write_Low(pattern_TX_pin);
    7a8c:	9400      	ld.w      	r0, (r4, 0x0)
    7a8e:	3104      	movi      	r1, 4
    7a90:	e3ffeae4 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
		GPIO_InPutOutPut_Disable(pattern_RX_pin);
    7a94:	9400      	ld.w      	r0, (r4, 0x0)
    7a96:	3105      	movi      	r1, 5
    7a98:	e3ffe964 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
		GPIO_Write_Low(charge_enable_pin);
    7a9c:	117b      	lrw      	r3, 0x20000050	// 7b88 <EarphoneStatusCheck+0x174>
    7a9e:	3106      	movi      	r1, 6
    7aa0:	9300      	ld.w      	r0, (r3, 0x0)
    7aa2:	e3ffeadb 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
	earphone_status = status;  
    7aa6:	1157      	lrw      	r2, 0x20000128	// 7b80 <EarphoneStatusCheck+0x16c>
    7aa8:	3303      	movi      	r3, 3
    7aaa:	b27b      	st.w      	r3, (r2, 0x6c)
		app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT);
    7aac:	300a      	movi      	r0, 10
	battery_status = status;
    7aae:	3304      	movi      	r3, 4
    7ab0:	b279      	st.w      	r3, (r2, 0x64)
		app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT);
    7ab2:	e00005a3 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
		app_stop_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
    7ab6:	3004      	movi      	r0, 4
    7ab8:	e3fffdbc 	bsr      	0x7630	// 7630 <app_stop_100_millisecond_timer>
		app_stop_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
    7abc:	3002      	movi      	r0, 2
    7abe:	e3fffdb9 	bsr      	0x7630	// 7630 <app_stop_100_millisecond_timer>
		app_stop_100_millisecond_timer(APP_OVERCURRENT_TIMER_ID);
    7ac2:	3003      	movi      	r0, 3
    7ac4:	e3fffdb6 	bsr      	0x7630	// 7630 <app_stop_100_millisecond_timer>
		app_stop_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);	
    7ac8:	3000      	movi      	r0, 0
    7aca:	e3fffdb3 	bsr      	0x7630	// 7630 <app_stop_100_millisecond_timer>
			L_pogo_adc, pogo_adc_to_mA(L_pogo_adc), R_pogo_adc, pogo_adc_to_mA(R_pogo_adc));
    7ace:	6c17      	mov      	r0, r5
    7ad0:	e3ffdcb2 	bsr      	0x3434	// 3434 <__floatunsidf>
    7ad4:	3200      	movi      	r2, 0
    7ad6:	1169      	lrw      	r3, 0x3fe76a00	// 7b78 <EarphoneStatusCheck+0x164>
    7ad8:	e3ffda94 	bsr      	0x3000	// 3000 <__muldf3>
    7adc:	3200      	movi      	r2, 0
    7ade:	1168      	lrw      	r3, 0x3fe00000	// 7b7c <EarphoneStatusCheck+0x168>
    7ae0:	e3ffda90 	bsr      	0x3000	// 3000 <__muldf3>
		printf("earphone charging overcurrent!!!: L: %lu, %lumA  R: %lu, %lumA\r\n",\
    7ae4:	e3ffd3a0 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7ae8:	b800      	st.w      	r0, (r14, 0x0)
    7aea:	6cd7      	mov      	r3, r5
    7aec:	6c9f      	mov      	r2, r7
    7aee:	6c5b      	mov      	r1, r6
    7af0:	1107      	lrw      	r0, 0x9003	// 7b8c <EarphoneStatusCheck+0x178>
		printf("charge for earphones: L: %lu, %lumA  R: %lu, %lumA\r\n",\
    7af2:	e3ffdeff 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
}
    7af6:	1402      	addi      	r14, r14, 8
    7af8:	1494      	pop      	r4-r7, r15
	} else if(pogo_adc_to_mA(L_pogo_adc) <= 0 && pogo_adc_to_mA(R_pogo_adc) <= 0){
    7afa:	3f40      	cmpnei      	r7, 0
    7afc:	b801      	st.w      	r0, (r14, 0x4)
		GPIO_Write_Low(charge_5V_boost_pin);
    7afe:	3101      	movi      	r1, 1
    7b00:	9400      	ld.w      	r0, (r4, 0x0)
	} else if(pogo_adc_to_mA(L_pogo_adc) <= 0 && pogo_adc_to_mA(R_pogo_adc) <= 0){
    7b02:	081b      	bt      	0x7b38	// 7b38 <EarphoneStatusCheck+0x124>
    7b04:	3b40      	cmpnei      	r3, 0
    7b06:	0819      	bt      	0x7b38	// 7b38 <EarphoneStatusCheck+0x124>
		GPIO_Write_Low(charge_5V_boost_pin);
    7b08:	e3ffeaa8 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
		GPIO_Init(pattern_TX_pin, Output);
    7b0c:	3200      	movi      	r2, 0
    7b0e:	9400      	ld.w      	r0, (r4, 0x0)
    7b10:	3104      	movi      	r1, 4
    7b12:	e3ffe8b7 	bsr      	0x4c80	// 4c80 <GPIO_Init>
		GPIO_Write_Low(pattern_TX_pin);
    7b16:	9400      	ld.w      	r0, (r4, 0x0)
    7b18:	3104      	movi      	r1, 4
    7b1a:	e3ffea9f 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
		GPIO_InPutOutPut_Disable(pattern_RX_pin);
    7b1e:	9400      	ld.w      	r0, (r4, 0x0)
    7b20:	3105      	movi      	r1, 5
    7b22:	e3ffe91f 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	earphone_status = status;  
    7b26:	1057      	lrw      	r2, 0x20000128	// 7b80 <EarphoneStatusCheck+0x16c>
    7b28:	9861      	ld.w      	r3, (r14, 0x4)
    7b2a:	b27b      	st.w      	r3, (r2, 0x6c)
		printf("no earphones in box: L: %lu, %lumA  R: %lu, %lumA\r\n",\
    7b2c:	b860      	st.w      	r3, (r14, 0x0)
    7b2e:	3200      	movi      	r2, 0
    7b30:	6cd7      	mov      	r3, r5
    7b32:	6c5b      	mov      	r1, r6
    7b34:	1017      	lrw      	r0, 0x9044	// 7b90 <EarphoneStatusCheck+0x17c>
    7b36:	07de      	br      	0x7af2	// 7af2 <EarphoneStatusCheck+0xde>
		GPIO_Write_High(charge_5V_boost_pin);
    7b38:	e3ffea8c 	bsr      	0x5050	// 5050 <GPIO_Write_High>
		GPIO_Init(pattern_TX_pin, Output);
    7b3c:	3200      	movi      	r2, 0
    7b3e:	9400      	ld.w      	r0, (r4, 0x0)
    7b40:	3104      	movi      	r1, 4
    7b42:	e3ffe89f 	bsr      	0x4c80	// 4c80 <GPIO_Init>
		GPIO_Write_Low(pattern_TX_pin);
    7b46:	9400      	ld.w      	r0, (r4, 0x0)
    7b48:	3104      	movi      	r1, 4
    7b4a:	e3ffea87 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
		GPIO_InPutOutPut_Disable(pattern_RX_pin);
    7b4e:	9400      	ld.w      	r0, (r4, 0x0)
    7b50:	3105      	movi      	r1, 5
    7b52:	e3ffe907 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	earphone_status = status;  
    7b56:	3201      	movi      	r2, 1
    7b58:	106a      	lrw      	r3, 0x20000128	// 7b80 <EarphoneStatusCheck+0x16c>
		app_status_indication_set(APP_STATUS_INDICATION_CHARGING_FOR_EARPHONE);
    7b5a:	3008      	movi      	r0, 8
	earphone_status = status;  
    7b5c:	b35b      	st.w      	r2, (r3, 0x6c)
		app_status_indication_set(APP_STATUS_INDICATION_CHARGING_FOR_EARPHONE);
    7b5e:	e000054d 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
		printf("charge for earphones: L: %lu, %lumA  R: %lu, %lumA\r\n",\
    7b62:	9861      	ld.w      	r3, (r14, 0x4)
    7b64:	b860      	st.w      	r3, (r14, 0x0)
    7b66:	6c9f      	mov      	r2, r7
    7b68:	6cd7      	mov      	r3, r5
    7b6a:	6c5b      	mov      	r1, r6
    7b6c:	100a      	lrw      	r0, 0x9078	// 7b94 <EarphoneStatusCheck+0x180>
    7b6e:	07c2      	br      	0x7af2	// 7af2 <EarphoneStatusCheck+0xde>
    7b70:	00008b69 	.long	0x00008b69
    7b74:	00008f87 	.long	0x00008f87
    7b78:	3fe76a00 	.long	0x3fe76a00
    7b7c:	3fe00000 	.long	0x3fe00000
    7b80:	20000128 	.long	0x20000128
    7b84:	2000004c 	.long	0x2000004c
    7b88:	20000050 	.long	0x20000050
    7b8c:	00009003 	.long	0x00009003
    7b90:	00009044 	.long	0x00009044
    7b94:	00009078 	.long	0x00009078

Disassembly of section .text.EarphoneOvercurrentCheck:

00007b98 <EarphoneOvercurrentCheck>:
{
    7b98:	14d4      	push      	r4-r7, r15
    7b9a:	1421      	subi      	r14, r14, 4
	L_pogo_adc = adc_get_val(L_EARBUD_POGO_ADC);
    7b9c:	3002      	movi      	r0, 2
    7b9e:	e3fffed9 	bsr      	0x7950	// 7950 <adc_get_val>
    7ba2:	6d83      	mov      	r6, r0
	R_pogo_adc = adc_get_val(R_EARBUD_POGO_ADC);
    7ba4:	3001      	movi      	r0, 1
    7ba6:	e3fffed5 	bsr      	0x7950	// 7950 <adc_get_val>
    7baa:	6d43      	mov      	r5, r0
	if(pogo_adc_to_mA(L_pogo_adc) >= EARPHONE_OVER_CURRENT_MA || pogo_adc_to_mA(R_pogo_adc) >= EARPHONE_OVER_CURRENT_MA) {//过流保护检测
    7bac:	6c1b      	mov      	r0, r6
    7bae:	e3ffdc43 	bsr      	0x3434	// 3434 <__floatunsidf>
    7bb2:	3200      	movi      	r2, 0
    7bb4:	116f      	lrw      	r3, 0x3fe76a00	// 7c70 <EarphoneOvercurrentCheck+0xd8>
    7bb6:	e3ffda25 	bsr      	0x3000	// 3000 <__muldf3>
    7bba:	3200      	movi      	r2, 0
    7bbc:	116e      	lrw      	r3, 0x3fe00000	// 7c74 <EarphoneOvercurrentCheck+0xdc>
    7bbe:	e3ffda21 	bsr      	0x3000	// 3000 <__muldf3>
    7bc2:	e3ffd331 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7bc6:	3445      	movi      	r4, 69
    7bc8:	6410      	cmphs      	r4, r0
    7bca:	6dc3      	mov      	r7, r0
    7bcc:	0c10      	bf      	0x7bec	// 7bec <EarphoneOvercurrentCheck+0x54>
    7bce:	6c17      	mov      	r0, r5
    7bd0:	e3ffdc32 	bsr      	0x3434	// 3434 <__floatunsidf>
    7bd4:	3200      	movi      	r2, 0
    7bd6:	1167      	lrw      	r3, 0x3fe76a00	// 7c70 <EarphoneOvercurrentCheck+0xd8>
    7bd8:	e3ffda14 	bsr      	0x3000	// 3000 <__muldf3>
    7bdc:	3200      	movi      	r2, 0
    7bde:	1166      	lrw      	r3, 0x3fe00000	// 7c74 <EarphoneOvercurrentCheck+0xdc>
    7be0:	e3ffda10 	bsr      	0x3000	// 3000 <__muldf3>
    7be4:	e3ffd320 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7be8:	6410      	cmphs      	r4, r0
    7bea:	0840      	bt      	0x7c6a	// 7c6a <EarphoneOvercurrentCheck+0xd2>
		GPIO_Write_Low(charge_5V_boost_pin);
    7bec:	1183      	lrw      	r4, 0x2000004c	// 7c78 <EarphoneOvercurrentCheck+0xe0>
    7bee:	3101      	movi      	r1, 1
    7bf0:	9400      	ld.w      	r0, (r4, 0x0)
    7bf2:	e3ffea33 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
		GPIO_Init(pattern_TX_pin, Output);
    7bf6:	3200      	movi      	r2, 0
    7bf8:	9400      	ld.w      	r0, (r4, 0x0)
    7bfa:	3104      	movi      	r1, 4
    7bfc:	e3ffe842 	bsr      	0x4c80	// 4c80 <GPIO_Init>
		GPIO_Write_Low(pattern_TX_pin);
    7c00:	9400      	ld.w      	r0, (r4, 0x0)
    7c02:	3104      	movi      	r1, 4
    7c04:	e3ffea2a 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
		GPIO_InPutOutPut_Disable(pattern_RX_pin);
    7c08:	9400      	ld.w      	r0, (r4, 0x0)
    7c0a:	3105      	movi      	r1, 5
    7c0c:	e3ffe8aa 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
		GPIO_Write_Low(charge_enable_pin);
    7c10:	107b      	lrw      	r3, 0x20000050	// 7c7c <EarphoneOvercurrentCheck+0xe4>
    7c12:	3106      	movi      	r1, 6
    7c14:	9300      	ld.w      	r0, (r3, 0x0)
    7c16:	e3ffea21 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
	earphone_status = status;  
    7c1a:	107a      	lrw      	r3, 0x20000128	// 7c80 <EarphoneOvercurrentCheck+0xe8>
    7c1c:	3203      	movi      	r2, 3
    7c1e:	b35b      	st.w      	r2, (r3, 0x6c)
		app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT);
    7c20:	300a      	movi      	r0, 10
	battery_status = status;
    7c22:	3204      	movi      	r2, 4
    7c24:	b359      	st.w      	r2, (r3, 0x64)
		app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT);
    7c26:	e00004e9 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
		app_stop_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
    7c2a:	3004      	movi      	r0, 4
    7c2c:	e3fffd02 	bsr      	0x7630	// 7630 <app_stop_100_millisecond_timer>
		app_stop_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
    7c30:	3002      	movi      	r0, 2
    7c32:	e3fffcff 	bsr      	0x7630	// 7630 <app_stop_100_millisecond_timer>
		app_stop_100_millisecond_timer(APP_OVERCURRENT_TIMER_ID);
    7c36:	3003      	movi      	r0, 3
    7c38:	e3fffcfc 	bsr      	0x7630	// 7630 <app_stop_100_millisecond_timer>
		app_stop_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
    7c3c:	3000      	movi      	r0, 0
    7c3e:	e3fffcf9 	bsr      	0x7630	// 7630 <app_stop_100_millisecond_timer>
			L_pogo_adc, pogo_adc_to_mA(L_pogo_adc), R_pogo_adc, pogo_adc_to_mA(R_pogo_adc));
    7c42:	6c17      	mov      	r0, r5
    7c44:	e3ffdbf8 	bsr      	0x3434	// 3434 <__floatunsidf>
    7c48:	3200      	movi      	r2, 0
    7c4a:	106a      	lrw      	r3, 0x3fe76a00	// 7c70 <EarphoneOvercurrentCheck+0xd8>
    7c4c:	e3ffd9da 	bsr      	0x3000	// 3000 <__muldf3>
    7c50:	3200      	movi      	r2, 0
    7c52:	1069      	lrw      	r3, 0x3fe00000	// 7c74 <EarphoneOvercurrentCheck+0xdc>
    7c54:	e3ffd9d6 	bsr      	0x3000	// 3000 <__muldf3>
		printf("earphone charging overcurrent!!!: L: %lu, %lumA  R: %lu, %lumA\r\n",\
    7c58:	e3ffd2e6 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7c5c:	b800      	st.w      	r0, (r14, 0x0)
    7c5e:	6cd7      	mov      	r3, r5
    7c60:	6c9f      	mov      	r2, r7
    7c62:	6c5b      	mov      	r1, r6
    7c64:	1008      	lrw      	r0, 0x9003	// 7c84 <EarphoneOvercurrentCheck+0xec>
    7c66:	e3ffde45 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
}
    7c6a:	1401      	addi      	r14, r14, 4
    7c6c:	1494      	pop      	r4-r7, r15
    7c6e:	0000      	bkpt
    7c70:	3fe76a00 	.long	0x3fe76a00
    7c74:	3fe00000 	.long	0x3fe00000
    7c78:	2000004c 	.long	0x2000004c
    7c7c:	20000050 	.long	0x20000050
    7c80:	20000128 	.long	0x20000128
    7c84:	00009003 	.long	0x00009003

Disassembly of section .text.is_hall_active:

00007c88 <is_hall_active>:

S8_T is_hall_active(void)
{
    7c88:	14d0      	push      	r15
	if(GPIO_Read_Status(hall_en_pin)) return 0;
    7c8a:	1065      	lrw      	r3, 0x20000050	// 7c9c <is_hall_active+0x14>
    7c8c:	3101      	movi      	r1, 1
    7c8e:	9300      	ld.w      	r0, (r3, 0x0)
    7c90:	e3ffe9f3 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    7c94:	3840      	cmpnei      	r0, 0
    7c96:	6403      	mvcv      	r0
    7c98:	7402      	sextb      	r0, r0
	else return 1;
}
    7c9a:	1490      	pop      	r15
    7c9c:	20000050 	.long	0x20000050

Disassembly of section .text.charging_case_battery_indication_handle:

00007ca0 <charging_case_battery_indication_handle>:

S8_T charging_case_battery_indication_handle(void)
{
    7ca0:	14d1      	push      	r4, r15
	return battery_percentage;
    7ca2:	106c      	lrw      	r3, 0x20000188	// 7cd0 <charging_case_battery_indication_handle+0x30>
    7ca4:	8368      	ld.b      	r3, (r3, 0x8)
	S8_T level = 0;

	level = battery_power_get();
    7ca6:	750e      	sextb      	r4, r3

	if(level <= 10){
    7ca8:	3c2a      	cmplti      	r4, 11
    7caa:	0c06      	bf      	0x7cb6	// 7cb6 <charging_case_battery_indication_handle+0x16>
		app_status_indication_set(APP_STATUS_INDICATION_BATTERY_WARNING);
    7cac:	3007      	movi      	r0, 7
	} else if(level > 10 && level <= 50){
		app_status_indication_set(APP_STATUS_INDICATION_BATTERY_MIDDLE);	
	} else if(level > 50){
		app_status_indication_set(APP_STATUS_INDICATION_BATTERY_HIGH);
    7cae:	e00004a5 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
	}
	
	return level;
}
    7cb2:	6c13      	mov      	r0, r4
    7cb4:	1491      	pop      	r4, r15
	} else if(level > 10 && level <= 50){
    7cb6:	2b0a      	subi      	r3, 11
    7cb8:	74cc      	zextb      	r3, r3
    7cba:	3227      	movi      	r2, 39
    7cbc:	64c8      	cmphs      	r2, r3
    7cbe:	0c03      	bf      	0x7cc4	// 7cc4 <charging_case_battery_indication_handle+0x24>
		app_status_indication_set(APP_STATUS_INDICATION_BATTERY_MIDDLE);	
    7cc0:	3005      	movi      	r0, 5
    7cc2:	07f6      	br      	0x7cae	// 7cae <charging_case_battery_indication_handle+0xe>
	} else if(level > 50){
    7cc4:	3332      	movi      	r3, 50
    7cc6:	650d      	cmplt      	r3, r4
    7cc8:	0ff5      	bf      	0x7cb2	// 7cb2 <charging_case_battery_indication_handle+0x12>
		app_status_indication_set(APP_STATUS_INDICATION_BATTERY_HIGH);
    7cca:	3004      	movi      	r0, 4
    7ccc:	07f1      	br      	0x7cae	// 7cae <charging_case_battery_indication_handle+0xe>
    7cce:	0000      	bkpt
    7cd0:	20000188 	.long	0x20000188

Disassembly of section .text.is_earphone_fully_charged:

00007cd4 <is_earphone_fully_charged>:

S8_T is_earphone_fully_charged(void)
{
    7cd4:	14d3      	push      	r4-r6, r15
    7cd6:	1421      	subi      	r14, r14, 4
	U32_T L_pogo_adc, R_pogo_adc;

	L_pogo_adc = adc_get_val(L_EARBUD_POGO_ADC);
    7cd8:	3002      	movi      	r0, 2
    7cda:	e3fffe3b 	bsr      	0x7950	// 7950 <adc_get_val>
    7cde:	6d03      	mov      	r4, r0
	R_pogo_adc = adc_get_val(R_EARBUD_POGO_ADC);
    7ce0:	3001      	movi      	r0, 1
    7ce2:	e3fffe37 	bsr      	0x7950	// 7950 <adc_get_val>
    7ce6:	6d83      	mov      	r6, r0
	if(pogo_adc_to_mA(L_pogo_adc) <= EARPHONE_FULL_CHARGE_MA && pogo_adc_to_mA(R_pogo_adc) <= EARPHONE_FULL_CHARGE_MA)
    7ce8:	6c13      	mov      	r0, r4
    7cea:	e3ffdba5 	bsr      	0x3434	// 3434 <__floatunsidf>
    7cee:	3200      	movi      	r2, 0
    7cf0:	1074      	lrw      	r3, 0x3fe76a00	// 7d40 <is_earphone_fully_charged+0x6c>
    7cf2:	e3ffd987 	bsr      	0x3000	// 3000 <__muldf3>
    7cf6:	3200      	movi      	r2, 0
    7cf8:	1073      	lrw      	r3, 0x3fe00000	// 7d44 <is_earphone_fully_charged+0x70>
    7cfa:	e3ffd983 	bsr      	0x3000	// 3000 <__muldf3>
    7cfe:	e3ffd293 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7d02:	3805      	cmphsi      	r0, 6
    7d04:	6d43      	mov      	r5, r0
    7d06:	081a      	bt      	0x7d3a	// 7d3a <is_earphone_fully_charged+0x66>
    7d08:	6c1b      	mov      	r0, r6
    7d0a:	e3ffdb95 	bsr      	0x3434	// 3434 <__floatunsidf>
    7d0e:	3200      	movi      	r2, 0
    7d10:	106c      	lrw      	r3, 0x3fe76a00	// 7d40 <is_earphone_fully_charged+0x6c>
    7d12:	e3ffd977 	bsr      	0x3000	// 3000 <__muldf3>
    7d16:	3200      	movi      	r2, 0
    7d18:	106b      	lrw      	r3, 0x3fe00000	// 7d44 <is_earphone_fully_charged+0x70>
    7d1a:	e3ffd973 	bsr      	0x3000	// 3000 <__muldf3>
    7d1e:	e3ffd283 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7d22:	3805      	cmphsi      	r0, 6
    7d24:	080b      	bt      	0x7d3a	// 7d3a <is_earphone_fully_charged+0x66>
	{
		printf("earphones are fully charged: L: %lu, %lumA	R: %lu, %lumA\r\n",\
    7d26:	b800      	st.w      	r0, (r14, 0x0)
    7d28:	6cdb      	mov      	r3, r6
    7d2a:	6c97      	mov      	r2, r5
    7d2c:	6c53      	mov      	r1, r4
    7d2e:	1007      	lrw      	r0, 0x90ad	// 7d48 <is_earphone_fully_charged+0x74>
    7d30:	e3ffdde0 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
			L_pogo_adc, pogo_adc_to_mA(L_pogo_adc), R_pogo_adc, pogo_adc_to_mA(R_pogo_adc));
		return TRUE;
    7d34:	3001      	movi      	r0, 1
	} 

	return FALSE;
}
    7d36:	1401      	addi      	r14, r14, 4
    7d38:	1493      	pop      	r4-r6, r15
	return FALSE;
    7d3a:	3000      	movi      	r0, 0
    7d3c:	07fd      	br      	0x7d36	// 7d36 <is_earphone_fully_charged+0x62>
    7d3e:	0000      	bkpt
    7d40:	3fe76a00 	.long	0x3fe76a00
    7d44:	3fe00000 	.long	0x3fe00000
    7d48:	000090ad 	.long	0x000090ad

Disassembly of section .text.box_open_close_handle_progress:

00007d4c <box_open_close_handle_progress>:

S8_T box_open_close_handle_progress(void)
{
    7d4c:	14d2      	push      	r4-r5, r15
	static enum APP_HALL_STATUS_T pre_status = APP_HALL_STATUS_INVALID;
	static U16_T time_cnt = 0;

	if(app_status_indication_get() == APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT) return -1;//过流保护
    7d4e:	e000046d 	bsr      	0x8628	// 8628 <app_status_indication_get>
    7d52:	384a      	cmpnei      	r0, 10
    7d54:	0d60      	bf      	0x8014	// 8014 <box_open_close_handle_progress+0x2c8>
	
	hall_status = is_hall_active()? APP_HALL_STATUS_CLOSE_BOX : APP_HALL_STATUS_OPEN_BOX;
    7d56:	e3ffff99 	bsr      	0x7c88	// 7c88 <is_hall_active>
    7d5a:	3840      	cmpnei      	r0, 0
    7d5c:	3300      	movi      	r3, 0
    7d5e:	60cd      	addc      	r3, r3
    7d60:	74cc      	zextb      	r3, r3
    7d62:	02af      	lrw      	r5, 0x20000128	// 8020 <box_open_close_handle_progress+0x2d4>

	switch(hall_status)
    7d64:	3b41      	cmpnei      	r3, 1
	hall_status = is_hall_active()? APP_HALL_STATUS_CLOSE_BOX : APP_HALL_STATUS_OPEN_BOX;
    7d66:	b57c      	st.w      	r3, (r5, 0x70)
    7d68:	6d17      	mov      	r4, r5
    7d6a:	957e      	ld.w      	r3, (r5, 0x78)
	switch(hall_status)
    7d6c:	08c8      	bt      	0x7efc	// 7efc <box_open_close_handle_progress+0x1b0>
	{
		case APP_HALL_STATUS_CLOSE_BOX:
			if(hall_status != pre_status) {
    7d6e:	3b41      	cmpnei      	r3, 1
    7d70:	0c4a      	bf      	0x7e04	// 7e04 <box_open_close_handle_progress+0xb8>
				time_cnt = 0;
    7d72:	0272      	lrw      	r3, 0x2000026c	// 8024 <box_open_close_handle_progress+0x2d8>
    7d74:	3200      	movi      	r2, 0
    7d76:	ab41      	st.h      	r2, (r3, 0x2)
				if(app_battery_status_get() == APP_BATTERY_STATUS_NTC_ERROR) {
    7d78:	9579      	ld.w      	r3, (r5, 0x64)
    7d7a:	3b43      	cmpnei      	r3, 3
    7d7c:	0823      	bt      	0x7dc2	// 7dc2 <box_open_close_handle_progress+0x76>
					GPIO_Write_Low(charge_5V_boost_pin);
    7d7e:	02b4      	lrw      	r5, 0x2000004c	// 8028 <box_open_close_handle_progress+0x2dc>
    7d80:	3101      	movi      	r1, 1
    7d82:	9500      	ld.w      	r0, (r5, 0x0)
    7d84:	e3ffe96a 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
					GPIO_Init(pattern_TX_pin, Output);
    7d88:	3200      	movi      	r2, 0
    7d8a:	3104      	movi      	r1, 4
    7d8c:	9500      	ld.w      	r0, (r5, 0x0)
    7d8e:	e3ffe779 	bsr      	0x4c80	// 4c80 <GPIO_Init>
					GPIO_Write_Low(pattern_TX_pin);
    7d92:	3104      	movi      	r1, 4
    7d94:	9500      	ld.w      	r0, (r5, 0x0)
    7d96:	e3ffe961 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
					GPIO_InPutOutPut_Disable(pattern_RX_pin);
    7d9a:	9500      	ld.w      	r0, (r5, 0x0)
    7d9c:	3105      	movi      	r1, 5
    7d9e:	e3ffe7e1 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	earphone_status = status;  
    7da2:	3304      	movi      	r3, 4
					earphone_status_update(APP_EARPHONE_STATUS_WAIT_FOR_CHARFE);
					printf("earphone charge NTC error!!!\r\n");
    7da4:	021d      	lrw      	r0, 0x90e8	// 802c <box_open_close_handle_progress+0x2e0>
	earphone_status = status;  
    7da6:	b47b      	st.w      	r3, (r4, 0x6c)
					printf("earphone charge NTC error!!!\r\n");
    7da8:	e3ffddb6 	bsr      	0x3914	// 3914 <__GI_puts>
					GPIO_Init(pattern_TX_pin, Output);
					GPIO_Write_Low(pattern_TX_pin);
					GPIO_InPutOutPut_Disable(pattern_RX_pin);
					app_start_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
				}
				EXI3_WakeUp_Disable(); //合盖，按键动作不唤醒
    7dac:	e3ffe710 	bsr      	0x4bcc	// 4bcc <EXI3_WakeUp_Disable>
				app_stop_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
    7db0:	3000      	movi      	r0, 0
    7db2:	e3fffc3f 	bsr      	0x7630	// 7630 <app_stop_100_millisecond_timer>
				app_stop_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
    7db6:	3004      	movi      	r0, 4
					GPIO_InPutOutPut_Disable(pattern_RX_pin);
					app_start_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
				}
				EXI3_WakeUp_Enable(); //开盖，按键动作要唤醒
				app_stop_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
				app_stop_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
    7db8:	e3fffc3c 	bsr      	0x7630	// 7630 <app_stop_100_millisecond_timer>
				pre_status = hall_status;
    7dbc:	947c      	ld.w      	r3, (r4, 0x70)
    7dbe:	b47e      	st.w      	r3, (r4, 0x78)
    7dc0:	042e      	br      	0x7e1c	// 7e1c <box_open_close_handle_progress+0xd0>
	return battery_percentage;
    7dc2:	3360      	movi      	r3, 96
    7dc4:	60d4      	addu      	r3, r5
				} else if(battery_power_get() > 0){
    7dc6:	8368      	ld.b      	r3, (r3, 0x8)
    7dc8:	3b40      	cmpnei      	r3, 0
    7dca:	0ff1      	bf      	0x7dac	// 7dac <box_open_close_handle_progress+0x60>
					if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) charging_case_battery_indication_handle();
    7dcc:	e3fffc82 	bsr      	0x76d0	// 76d0 <app_charge_type_get>
    7dd0:	3840      	cmpnei      	r0, 0
    7dd2:	0803      	bt      	0x7dd8	// 7dd8 <box_open_close_handle_progress+0x8c>
    7dd4:	e3ffff66 	bsr      	0x7ca0	// 7ca0 <charging_case_battery_indication_handle>
					GPIO_Write_High(charge_5V_boost_pin);
    7dd8:	03ab      	lrw      	r5, 0x2000004c	// 8028 <box_open_close_handle_progress+0x2dc>
    7dda:	3101      	movi      	r1, 1
    7ddc:	9500      	ld.w      	r0, (r5, 0x0)
    7dde:	e3ffe939 	bsr      	0x5050	// 5050 <GPIO_Write_High>
					GPIO_Init(pattern_TX_pin, Output);
    7de2:	3200      	movi      	r2, 0
    7de4:	9500      	ld.w      	r0, (r5, 0x0)
    7de6:	3104      	movi      	r1, 4
    7de8:	e3ffe74c 	bsr      	0x4c80	// 4c80 <GPIO_Init>
					GPIO_Write_Low(pattern_TX_pin);
    7dec:	9500      	ld.w      	r0, (r5, 0x0)
    7dee:	3104      	movi      	r1, 4
    7df0:	e3ffe934 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
					GPIO_InPutOutPut_Disable(pattern_RX_pin);
    7df4:	9500      	ld.w      	r0, (r5, 0x0)
    7df6:	3105      	movi      	r1, 5
    7df8:	e3ffe7b4 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
					app_start_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
    7dfc:	3002      	movi      	r0, 2
    7dfe:	e3fffc31 	bsr      	0x7660	// 7660 <app_start_100_millisecond_timer>
    7e02:	07d5      	br      	0x7dac	// 7dac <box_open_close_handle_progress+0x60>
	return timer->timer_en;
    7e04:	251f      	addi      	r5, 32
				if(TRUE == app_get_100_millisecond_timer_status(APP_EARPHONE_STATUS_CHECK_TIMER_ID)) return 1;//等待耳机状态检测结束
    7e06:	8569      	ld.b      	r3, (r5, 0x9)
    7e08:	3b41      	cmpnei      	r3, 1
    7e0a:	0d08      	bf      	0x801a	// 801a <box_open_close_handle_progress+0x2ce>
				time_cnt++;
    7e0c:	0359      	lrw      	r2, 0x2000026c	// 8024 <box_open_close_handle_progress+0x2d8>
    7e0e:	8a61      	ld.h      	r3, (r2, 0x2)
    7e10:	2300      	addi      	r3, 1
    7e12:	74cd      	zexth      	r3, r3
				if(time_cnt >= 200)
    7e14:	31c7      	movi      	r1, 199
    7e16:	64c4      	cmphs      	r1, r3
    7e18:	0c04      	bf      	0x7e20	// 7e20 <box_open_close_handle_progress+0xd4>
				time_cnt++;
    7e1a:	aa61      	st.h      	r3, (r2, 0x2)

		default:
			break;
	}
	
	return 0;
    7e1c:	3000      	movi      	r0, 0
}
    7e1e:	1492      	pop      	r4-r5, r15
					switch(earphone_status_get())
    7e20:	941b      	ld.w      	r0, (r4, 0x6c)
					time_cnt = 0;
    7e22:	3300      	movi      	r3, 0
					switch(earphone_status_get())
    7e24:	3804      	cmphsi      	r0, 5
					time_cnt = 0;
    7e26:	aa61      	st.h      	r3, (r2, 0x2)
					switch(earphone_status_get())
    7e28:	0bfa      	bt      	0x7e1c	// 7e1c <box_open_close_handle_progress+0xd0>
    7e2a:	e3ffd1cd 	bsr      	0x21c4	// 21c4 <___gnu_csky_case_uhi>
    7e2e:	005d      	.short	0x005d
    7e30:	005d0005 	.long	0x005d0005
    7e34:	004100d8 	.long	0x004100d8
							if(is_earphone_fully_charged())
    7e38:	e3ffff4e 	bsr      	0x7cd4	// 7cd4 <is_earphone_fully_charged>
    7e3c:	3840      	cmpnei      	r0, 0
    7e3e:	0c1e      	bf      	0x7e7a	// 7e7a <box_open_close_handle_progress+0x12e>
								GPIO_Write_Low(charge_5V_boost_pin);
    7e40:	13ba      	lrw      	r5, 0x2000004c	// 8028 <box_open_close_handle_progress+0x2dc>
    7e42:	3101      	movi      	r1, 1
    7e44:	9500      	ld.w      	r0, (r5, 0x0)
    7e46:	e3ffe909 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
								GPIO_Init(pattern_TX_pin, Output);
    7e4a:	3200      	movi      	r2, 0
    7e4c:	3104      	movi      	r1, 4
    7e4e:	9500      	ld.w      	r0, (r5, 0x0)
    7e50:	e3ffe718 	bsr      	0x4c80	// 4c80 <GPIO_Init>
								GPIO_Write_Low(pattern_TX_pin);
    7e54:	3104      	movi      	r1, 4
    7e56:	9500      	ld.w      	r0, (r5, 0x0)
    7e58:	e3ffe900 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
								GPIO_InPutOutPut_Disable(pattern_RX_pin);
    7e5c:	9500      	ld.w      	r0, (r5, 0x0)
    7e5e:	3105      	movi      	r1, 5
    7e60:	e3ffe780 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	earphone_status = status;  
    7e64:	3302      	movi      	r3, 2
    7e66:	b47b      	st.w      	r3, (r4, 0x6c)
								if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_start_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
    7e68:	e3fffc34 	bsr      	0x76d0	// 76d0 <app_charge_type_get>
    7e6c:	3840      	cmpnei      	r0, 0
    7e6e:	0803      	bt      	0x7e74	// 7e74 <box_open_close_handle_progress+0x128>
    7e70:	e3fffbf8 	bsr      	0x7660	// 7660 <app_start_100_millisecond_timer>
								app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_FULL_CHARGE);
    7e74:	3009      	movi      	r0, 9
    7e76:	e00003c1 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
							if(app_battery_status_get() == APP_BATTERY_STATUS_NTC_ERROR) {
    7e7a:	9479      	ld.w      	r3, (r4, 0x64)
    7e7c:	3b43      	cmpnei      	r3, 3
    7e7e:	0bcf      	bt      	0x7e1c	// 7e1c <box_open_close_handle_progress+0xd0>
								GPIO_Write_Low(charge_5V_boost_pin);
    7e80:	13aa      	lrw      	r5, 0x2000004c	// 8028 <box_open_close_handle_progress+0x2dc>
    7e82:	3101      	movi      	r1, 1
    7e84:	9500      	ld.w      	r0, (r5, 0x0)
    7e86:	e3ffe8e9 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
								GPIO_Init(pattern_TX_pin, Output);
    7e8a:	3200      	movi      	r2, 0
    7e8c:	3104      	movi      	r1, 4
    7e8e:	9500      	ld.w      	r0, (r5, 0x0)
    7e90:	e3ffe6f8 	bsr      	0x4c80	// 4c80 <GPIO_Init>
								GPIO_Write_Low(pattern_TX_pin);
    7e94:	3104      	movi      	r1, 4
    7e96:	9500      	ld.w      	r0, (r5, 0x0)
    7e98:	e3ffe8e0 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
								GPIO_InPutOutPut_Disable(pattern_RX_pin);
    7e9c:	9500      	ld.w      	r0, (r5, 0x0)
    7e9e:	3105      	movi      	r1, 5
    7ea0:	e3ffe760 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	earphone_status = status;  
    7ea4:	3304      	movi      	r3, 4
    7ea6:	b47b      	st.w      	r3, (r4, 0x6c)
								printf("earphone charge NTC error!!!\r\n");
    7ea8:	1301      	lrw      	r0, 0x90e8	// 802c <box_open_close_handle_progress+0x2e0>
    7eaa:	e3ffdd35 	bsr      	0x3914	// 3914 <__GI_puts>
    7eae:	07b7      	br      	0x7e1c	// 7e1c <box_open_close_handle_progress+0xd0>
							if(app_battery_status_get() != APP_BATTERY_STATUS_NTC_ERROR)
    7eb0:	9479      	ld.w      	r3, (r4, 0x64)
    7eb2:	3b43      	cmpnei      	r3, 3
    7eb4:	0fb4      	bf      	0x7e1c	// 7e1c <box_open_close_handle_progress+0xd0>
								GPIO_Write_High(charge_5V_boost_pin);
    7eb6:	129d      	lrw      	r4, 0x2000004c	// 8028 <box_open_close_handle_progress+0x2dc>
    7eb8:	3101      	movi      	r1, 1
    7eba:	9400      	ld.w      	r0, (r4, 0x0)
    7ebc:	e3ffe8ca 	bsr      	0x5050	// 5050 <GPIO_Write_High>
								GPIO_Init(pattern_TX_pin, Output);
    7ec0:	3200      	movi      	r2, 0
    7ec2:	3104      	movi      	r1, 4
    7ec4:	9400      	ld.w      	r0, (r4, 0x0)
    7ec6:	e3ffe6dd 	bsr      	0x4c80	// 4c80 <GPIO_Init>
								GPIO_Write_Low(pattern_TX_pin);
    7eca:	3104      	movi      	r1, 4
    7ecc:	9400      	ld.w      	r0, (r4, 0x0)
    7ece:	e3ffe8c5 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
								GPIO_InPutOutPut_Disable(pattern_RX_pin);
    7ed2:	9400      	ld.w      	r0, (r4, 0x0)
    7ed4:	3105      	movi      	r1, 5
    7ed6:	e3ffe745 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
								app_start_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
    7eda:	3002      	movi      	r0, 2
								app_start_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
    7edc:	e3fffbc2 	bsr      	0x7660	// 7660 <app_start_100_millisecond_timer>
								printf("earphone charge exit NTC error status!!!");
    7ee0:	1214      	lrw      	r0, 0x9106	// 8030 <box_open_close_handle_progress+0x2e4>
    7ee2:	e3ffdd07 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
    7ee6:	079b      	br      	0x7e1c	// 7e1c <box_open_close_handle_progress+0xd0>
							if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE)
    7ee8:	e3fffbf4 	bsr      	0x76d0	// 76d0 <app_charge_type_get>
    7eec:	3840      	cmpnei      	r0, 0
    7eee:	0b97      	bt      	0x7e1c	// 7e1c <box_open_close_handle_progress+0xd0>
								if(app_get_100_millisecond_timer_status(APP_DEEP_SLEEP_TIMER_ID) == FALSE)
    7ef0:	8461      	ld.b      	r3, (r4, 0x1)
    7ef2:	3b40      	cmpnei      	r3, 0
    7ef4:	0b94      	bt      	0x7e1c	// 7e1c <box_open_close_handle_progress+0xd0>
									app_start_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
    7ef6:	e3fffbb5 	bsr      	0x7660	// 7660 <app_start_100_millisecond_timer>
    7efa:	0791      	br      	0x7e1c	// 7e1c <box_open_close_handle_progress+0xd0>
			if(hall_status != pre_status) {
    7efc:	3b40      	cmpnei      	r3, 0
    7efe:	0c46      	bf      	0x7f8a	// 7f8a <box_open_close_handle_progress+0x23e>
				time_cnt = 0;
    7f00:	1269      	lrw      	r3, 0x2000026c	// 8024 <box_open_close_handle_progress+0x2d8>
    7f02:	3200      	movi      	r2, 0
    7f04:	ab41      	st.h      	r2, (r3, 0x2)
				if(app_battery_status_get() == APP_BATTERY_STATUS_NTC_ERROR) {
    7f06:	9579      	ld.w      	r3, (r5, 0x64)
    7f08:	3b43      	cmpnei      	r3, 3
    7f0a:	081f      	bt      	0x7f48	// 7f48 <box_open_close_handle_progress+0x1fc>
					GPIO_Write_Low(charge_5V_boost_pin);
    7f0c:	12a7      	lrw      	r5, 0x2000004c	// 8028 <box_open_close_handle_progress+0x2dc>
    7f0e:	3101      	movi      	r1, 1
    7f10:	9500      	ld.w      	r0, (r5, 0x0)
    7f12:	e3ffe8a3 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
					GPIO_Init(pattern_TX_pin, Output);
    7f16:	3200      	movi      	r2, 0
    7f18:	3104      	movi      	r1, 4
    7f1a:	9500      	ld.w      	r0, (r5, 0x0)
    7f1c:	e3ffe6b2 	bsr      	0x4c80	// 4c80 <GPIO_Init>
					GPIO_Write_Low(pattern_TX_pin);
    7f20:	3104      	movi      	r1, 4
    7f22:	9500      	ld.w      	r0, (r5, 0x0)
    7f24:	e3ffe89a 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
					GPIO_InPutOutPut_Disable(pattern_RX_pin);
    7f28:	9500      	ld.w      	r0, (r5, 0x0)
    7f2a:	3105      	movi      	r1, 5
    7f2c:	e3ffe71a 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	earphone_status = status;  
    7f30:	3304      	movi      	r3, 4
					printf("earphone charge NTC error!!!\r\n");
    7f32:	111f      	lrw      	r0, 0x90e8	// 802c <box_open_close_handle_progress+0x2e0>
	earphone_status = status;  
    7f34:	b47b      	st.w      	r3, (r4, 0x6c)
					printf("earphone charge NTC error!!!\r\n");
    7f36:	e3ffdcef 	bsr      	0x3914	// 3914 <__GI_puts>
				EXI3_WakeUp_Enable(); //开盖，按键动作要唤醒
    7f3a:	e3ffe641 	bsr      	0x4bbc	// 4bbc <EXI3_WakeUp_Enable>
				app_stop_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
    7f3e:	3000      	movi      	r0, 0
    7f40:	e3fffb78 	bsr      	0x7630	// 7630 <app_stop_100_millisecond_timer>
				app_stop_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
    7f44:	3002      	movi      	r0, 2
    7f46:	0739      	br      	0x7db8	// 7db8 <box_open_close_handle_progress+0x6c>
	return battery_percentage;
    7f48:	3360      	movi      	r3, 96
    7f4a:	60d4      	addu      	r3, r5
				} else if(battery_power_get() > 0){
    7f4c:	8368      	ld.b      	r3, (r3, 0x8)
    7f4e:	3b40      	cmpnei      	r3, 0
    7f50:	0ff5      	bf      	0x7f3a	// 7f3a <box_open_close_handle_progress+0x1ee>
					if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) charging_case_battery_indication_handle();
    7f52:	e3fffbbf 	bsr      	0x76d0	// 76d0 <app_charge_type_get>
    7f56:	3840      	cmpnei      	r0, 0
    7f58:	0803      	bt      	0x7f5e	// 7f5e <box_open_close_handle_progress+0x212>
    7f5a:	e3fffea3 	bsr      	0x7ca0	// 7ca0 <charging_case_battery_indication_handle>
					GPIO_Write_High(charge_5V_boost_pin);
    7f5e:	11b3      	lrw      	r5, 0x2000004c	// 8028 <box_open_close_handle_progress+0x2dc>
    7f60:	3101      	movi      	r1, 1
    7f62:	9500      	ld.w      	r0, (r5, 0x0)
    7f64:	e3ffe876 	bsr      	0x5050	// 5050 <GPIO_Write_High>
					GPIO_Init(pattern_TX_pin, Output);
    7f68:	3200      	movi      	r2, 0
    7f6a:	9500      	ld.w      	r0, (r5, 0x0)
    7f6c:	3104      	movi      	r1, 4
    7f6e:	e3ffe689 	bsr      	0x4c80	// 4c80 <GPIO_Init>
					GPIO_Write_Low(pattern_TX_pin);
    7f72:	9500      	ld.w      	r0, (r5, 0x0)
    7f74:	3104      	movi      	r1, 4
    7f76:	e3ffe871 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
					GPIO_InPutOutPut_Disable(pattern_RX_pin);
    7f7a:	9500      	ld.w      	r0, (r5, 0x0)
    7f7c:	3105      	movi      	r1, 5
    7f7e:	e3ffe6f1 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
					app_start_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
    7f82:	3004      	movi      	r0, 4
    7f84:	e3fffb6e 	bsr      	0x7660	// 7660 <app_start_100_millisecond_timer>
    7f88:	07d9      	br      	0x7f3a	// 7f3a <box_open_close_handle_progress+0x1ee>
	return timer->timer_en;
    7f8a:	3340      	movi      	r3, 64
    7f8c:	60d4      	addu      	r3, r5
				if(TRUE == app_get_100_millisecond_timer_status(APP_EARPHONE_WAKEUP_TIMER_ID)) return 1;//等待耳机状态检测结束
    7f8e:	8371      	ld.b      	r3, (r3, 0x11)
    7f90:	3b41      	cmpnei      	r3, 1
    7f92:	0c44      	bf      	0x801a	// 801a <box_open_close_handle_progress+0x2ce>
				time_cnt++;
    7f94:	1144      	lrw      	r2, 0x2000026c	// 8024 <box_open_close_handle_progress+0x2d8>
    7f96:	8a61      	ld.h      	r3, (r2, 0x2)
    7f98:	2300      	addi      	r3, 1
    7f9a:	74cd      	zexth      	r3, r3
				if(time_cnt >= 200)
    7f9c:	31c7      	movi      	r1, 199
    7f9e:	64c4      	cmphs      	r1, r3
    7fa0:	0b3d      	bt      	0x7e1a	// 7e1a <box_open_close_handle_progress+0xce>
					time_cnt = 0;
    7fa2:	3300      	movi      	r3, 0
    7fa4:	aa61      	st.h      	r3, (r2, 0x2)
					switch(earphone_status_get())
    7fa6:	957b      	ld.w      	r3, (r5, 0x6c)
    7fa8:	3b43      	cmpnei      	r3, 3
    7faa:	0c1a      	bf      	0x7fde	// 7fde <box_open_close_handle_progress+0x292>
    7fac:	3b44      	cmpnei      	r3, 4
    7fae:	9579      	ld.w      	r3, (r5, 0x64)
    7fb0:	081b      	bt      	0x7fe6	// 7fe6 <box_open_close_handle_progress+0x29a>
							if(app_battery_status_get() != APP_BATTERY_STATUS_NTC_ERROR)
    7fb2:	3b43      	cmpnei      	r3, 3
    7fb4:	0f34      	bf      	0x7e1c	// 7e1c <box_open_close_handle_progress+0xd0>
								GPIO_Write_High(charge_5V_boost_pin);
    7fb6:	109d      	lrw      	r4, 0x2000004c	// 8028 <box_open_close_handle_progress+0x2dc>
    7fb8:	3101      	movi      	r1, 1
    7fba:	9400      	ld.w      	r0, (r4, 0x0)
    7fbc:	e3ffe84a 	bsr      	0x5050	// 5050 <GPIO_Write_High>
								GPIO_Init(pattern_TX_pin, Output);
    7fc0:	3200      	movi      	r2, 0
    7fc2:	3104      	movi      	r1, 4
    7fc4:	9400      	ld.w      	r0, (r4, 0x0)
    7fc6:	e3ffe65d 	bsr      	0x4c80	// 4c80 <GPIO_Init>
								GPIO_Write_Low(pattern_TX_pin);
    7fca:	3104      	movi      	r1, 4
    7fcc:	9400      	ld.w      	r0, (r4, 0x0)
    7fce:	e3ffe845 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
								GPIO_InPutOutPut_Disable(pattern_RX_pin);
    7fd2:	9400      	ld.w      	r0, (r4, 0x0)
    7fd4:	3105      	movi      	r1, 5
    7fd6:	e3ffe6c5 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
								app_start_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
    7fda:	3004      	movi      	r0, 4
    7fdc:	0780      	br      	0x7edc	// 7edc <box_open_close_handle_progress+0x190>
							app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT);
    7fde:	300a      	movi      	r0, 10
    7fe0:	e000030c 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
    7fe4:	071c      	br      	0x7e1c	// 7e1c <box_open_close_handle_progress+0xd0>
							if(app_battery_status_get() == APP_BATTERY_STATUS_NTC_ERROR) {
    7fe6:	3b43      	cmpnei      	r3, 3
    7fe8:	0b1a      	bt      	0x7e1c	// 7e1c <box_open_close_handle_progress+0xd0>
								GPIO_Write_Low(charge_5V_boost_pin);
    7fea:	1090      	lrw      	r4, 0x2000004c	// 8028 <box_open_close_handle_progress+0x2dc>
    7fec:	3101      	movi      	r1, 1
    7fee:	9400      	ld.w      	r0, (r4, 0x0)
    7ff0:	e3ffe834 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
								GPIO_Init(pattern_TX_pin, Output);
    7ff4:	3200      	movi      	r2, 0
    7ff6:	3104      	movi      	r1, 4
    7ff8:	9400      	ld.w      	r0, (r4, 0x0)
    7ffa:	e3ffe643 	bsr      	0x4c80	// 4c80 <GPIO_Init>
								GPIO_Write_Low(pattern_TX_pin);
    7ffe:	3104      	movi      	r1, 4
    8000:	9400      	ld.w      	r0, (r4, 0x0)
    8002:	e3ffe82b 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
								GPIO_InPutOutPut_Disable(pattern_RX_pin);
    8006:	9400      	ld.w      	r0, (r4, 0x0)
    8008:	3105      	movi      	r1, 5
    800a:	e3ffe6ab 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	earphone_status = status;  
    800e:	3304      	movi      	r3, 4
    8010:	b57b      	st.w      	r3, (r5, 0x6c)
    8012:	074b      	br      	0x7ea8	// 7ea8 <box_open_close_handle_progress+0x15c>
	if(app_status_indication_get() == APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT) return -1;//过流保护
    8014:	3000      	movi      	r0, 0
    8016:	2800      	subi      	r0, 1
    8018:	0703      	br      	0x7e1e	// 7e1e <box_open_close_handle_progress+0xd2>
				if(TRUE == app_get_100_millisecond_timer_status(APP_EARPHONE_STATUS_CHECK_TIMER_ID)) return 1;//等待耳机状态检测结束
    801a:	3001      	movi      	r0, 1
    801c:	0701      	br      	0x7e1e	// 7e1e <box_open_close_handle_progress+0xd2>
    801e:	0000      	bkpt
    8020:	20000128 	.long	0x20000128
    8024:	2000026c 	.long	0x2000026c
    8028:	2000004c 	.long	0x2000004c
    802c:	000090e8 	.long	0x000090e8
    8030:	00009106 	.long	0x00009106

Disassembly of section .text.app_battery_handle_process_normal:

00008034 <app_battery_handle_process_normal>:


S8_T app_battery_handle_process_normal(enum APP_BATTERY_STATUS_T status)
{
    8034:	14d3      	push      	r4-r6, r15
	static enum APP_BATTERY_STATUS_T pre_status = APP_BATTERY_STATUS_INVALID;
	static U16_T time_cnt = 0;
	
	//printf("%s: %d\r\n",__func__, battery_status);
	
	switch(battery_status)
    8036:	1189      	lrw      	r4, 0x20000128	// 80d8 <app_battery_handle_process_normal+0xa4>
{
    8038:	6d83      	mov      	r6, r0
	switch(battery_status)
    803a:	9479      	ld.w      	r3, (r4, 0x64)
    803c:	3b40      	cmpnei      	r3, 0
    803e:	0c0f      	bf      	0x805c	// 805c <app_battery_handle_process_normal+0x28>
    8040:	3b44      	cmpnei      	r3, 4
    8042:	0c27      	bf      	0x8090	// 8090 <app_battery_handle_process_normal+0x5c>
			}
			break;
			
		default:

			GPIO_Write_Low(charge_enable_pin);
    8044:	11a6      	lrw      	r5, 0x20000050	// 80dc <app_battery_handle_process_normal+0xa8>
    8046:	3106      	movi      	r1, 6
    8048:	9500      	ld.w      	r0, (r5, 0x0)
    804a:	e3ffe807 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
			GPIO_Write_Low(NTC_detect_pin);
    804e:	9500      	ld.w      	r0, (r5, 0x0)
    8050:	310e      	movi      	r1, 14
    8052:	e3ffe803 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
			battery_status = status;
    8056:	b4d9      	st.w      	r6, (r4, 0x64)
			pre_status = APP_BATTERY_STATUS_INVALID;
    8058:	3305      	movi      	r3, 5
    805a:	0407      	br      	0x8068	// 8068 <app_battery_handle_process_normal+0x34>
			if(battery_status != pre_status) {
    805c:	945f      	ld.w      	r2, (r4, 0x7c)
    805e:	3a40      	cmpnei      	r2, 0
    8060:	1140      	lrw      	r2, 0x2000026c	// 80e0 <app_battery_handle_process_normal+0xac>
    8062:	0c05      	bf      	0x806c	// 806c <app_battery_handle_process_normal+0x38>
				time_cnt = 0;
    8064:	3100      	movi      	r1, 0
    8066:	aa22      	st.h      	r1, (r2, 0x4)
			pre_status = APP_BATTERY_STATUS_INVALID;
    8068:	b47f      	st.w      	r3, (r4, 0x7c)
			break;
    806a:	0411      	br      	0x808c	// 808c <app_battery_handle_process_normal+0x58>
				time_cnt++;
    806c:	8a62      	ld.h      	r3, (r2, 0x4)
    806e:	2300      	addi      	r3, 1
    8070:	74cd      	zexth      	r3, r3
				if(time_cnt >= 500) {
    8072:	103d      	lrw      	r1, 0x1f3	// 80e4 <app_battery_handle_process_normal+0xb0>
				if(time_cnt >= 400)
    8074:	64c4      	cmphs      	r1, r3
    8076:	0c03      	bf      	0x807c	// 807c <app_battery_handle_process_normal+0x48>
				time_cnt++;
    8078:	aa62      	st.h      	r3, (r2, 0x4)
    807a:	0409      	br      	0x808c	// 808c <app_battery_handle_process_normal+0x58>
					time_cnt = 0;
    807c:	3300      	movi      	r3, 0
	return battery_percentage;
    807e:	245f      	addi      	r4, 96
					time_cnt = 0;
    8080:	aa62      	st.h      	r3, (r2, 0x4)
					if(battery_power_get() <= 0) system_shutdown();
    8082:	8468      	ld.b      	r3, (r4, 0x8)
    8084:	3b40      	cmpnei      	r3, 0
    8086:	0803      	bt      	0x808c	// 808c <app_battery_handle_process_normal+0x58>
    8088:	e3fffc50 	bsr      	0x7928	// 7928 <system_shutdown>
	}
	return 0;
}
    808c:	3000      	movi      	r0, 0
    808e:	1493      	pop      	r4-r6, r15
			if(battery_status != pre_status) {
    8090:	947f      	ld.w      	r3, (r4, 0x7c)
    8092:	3b44      	cmpnei      	r3, 4
    8094:	1053      	lrw      	r2, 0x2000026c	// 80e0 <app_battery_handle_process_normal+0xac>
    8096:	0c1c      	bf      	0x80ce	// 80ce <app_battery_handle_process_normal+0x9a>
				time_cnt = 0;
    8098:	3300      	movi      	r3, 0
    809a:	aa62      	st.h      	r3, (r2, 0x4)
				GPIO_Write_Low(charge_enable_pin);
    809c:	3106      	movi      	r1, 6
    809e:	1070      	lrw      	r3, 0x20000050	// 80dc <app_battery_handle_process_normal+0xa8>
				GPIO_Write_Low(charge_5V_boost_pin);
    80a0:	10b2      	lrw      	r5, 0x2000004c	// 80e8 <app_battery_handle_process_normal+0xb4>
				GPIO_Write_Low(charge_enable_pin);
    80a2:	9300      	ld.w      	r0, (r3, 0x0)
    80a4:	e3ffe7da 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
				GPIO_Write_Low(charge_5V_boost_pin);
    80a8:	3101      	movi      	r1, 1
    80aa:	9500      	ld.w      	r0, (r5, 0x0)
    80ac:	e3ffe7d6 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
				GPIO_Init(pattern_TX_pin, Output);
    80b0:	3200      	movi      	r2, 0
    80b2:	3104      	movi      	r1, 4
    80b4:	9500      	ld.w      	r0, (r5, 0x0)
    80b6:	e3ffe5e5 	bsr      	0x4c80	// 4c80 <GPIO_Init>
				GPIO_Write_Low(pattern_TX_pin);
    80ba:	3104      	movi      	r1, 4
    80bc:	9500      	ld.w      	r0, (r5, 0x0)
    80be:	e3ffe7cd 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
				GPIO_InPutOutPut_Disable(pattern_RX_pin);
    80c2:	9500      	ld.w      	r0, (r5, 0x0)
    80c4:	3105      	movi      	r1, 5
    80c6:	e3ffe64d 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
				pre_status = battery_status;
    80ca:	9479      	ld.w      	r3, (r4, 0x64)
    80cc:	07ce      	br      	0x8068	// 8068 <app_battery_handle_process_normal+0x34>
				time_cnt++;
    80ce:	8a62      	ld.h      	r3, (r2, 0x4)
    80d0:	2300      	addi      	r3, 1
    80d2:	74cd      	zexth      	r3, r3
				if(time_cnt >= 400)
    80d4:	1026      	lrw      	r1, 0x18f	// 80ec <app_battery_handle_process_normal+0xb8>
    80d6:	07cf      	br      	0x8074	// 8074 <app_battery_handle_process_normal+0x40>
    80d8:	20000128 	.long	0x20000128
    80dc:	20000050 	.long	0x20000050
    80e0:	2000026c 	.long	0x2000026c
    80e4:	000001f3 	.long	0x000001f3
    80e8:	2000004c 	.long	0x2000004c
    80ec:	0000018f 	.long	0x0000018f

Disassembly of section .text.app_battery_handle_process_charge:

000080f0 <app_battery_handle_process_charge>:

S8_T app_battery_handle_process_charge(enum APP_BATTERY_STATUS_T status)
{
    80f0:	14d4      	push      	r4-r7, r15
	static U8_T full_charge_cnt = 0, ntc_trigger_cnt = 0;
	U32_T ntc_mv = 0;
	
	//printf("%s: %d\r\n",__func__, battery_status);

	switch(battery_status)
    80f2:	0290      	lrw      	r4, 0x20000128	// 83ac <app_battery_handle_process_charge+0x2bc>
    80f4:	3580      	movi      	r5, 128
    80f6:	9479      	ld.w      	r3, (r4, 0x64)
    80f8:	3b43      	cmpnei      	r3, 3
{
    80fa:	6dc3      	mov      	r7, r0
    80fc:	6d93      	mov      	r6, r4
    80fe:	6150      	addu      	r5, r4
	switch(battery_status)
    8100:	0cb2      	bf      	0x8264	// 8264 <app_battery_handle_process_charge+0x174>
    8102:	3b44      	cmpnei      	r3, 4
    8104:	0d1a      	bf      	0x8338	// 8338 <app_battery_handle_process_charge+0x248>
    8106:	3b41      	cmpnei      	r3, 1
    8108:	0949      	bt      	0x839a	// 839a <app_battery_handle_process_charge+0x2aa>
	{
		case APP_BATTERY_STATUS_CHARGING:
			if(battery_status != pre_status) {
    810a:	9560      	ld.w      	r3, (r5, 0x0)
    810c:	3b41      	cmpnei      	r3, 1
    810e:	0296      	lrw      	r4, 0x2000026c	// 83b0 <app_battery_handle_process_charge+0x2c0>
    8110:	0c2e      	bf      	0x816c	// 816c <app_battery_handle_process_charge+0x7c>
				time_cnt = full_charge_cnt = 0;
    8112:	3300      	movi      	r3, 0
				GPIO_Write_High(charge_enable_pin);
    8114:	02f7      	lrw      	r7, 0x20000050	// 83b4 <app_battery_handle_process_charge+0x2c4>
    8116:	3106      	movi      	r1, 6
				time_cnt = full_charge_cnt = 0;
    8118:	a466      	st.b      	r3, (r4, 0x6)
				GPIO_Write_High(charge_enable_pin);
    811a:	9700      	ld.w      	r0, (r7, 0x0)
				time_cnt = full_charge_cnt = 0;
    811c:	3300      	movi      	r3, 0
    811e:	ac64      	st.h      	r3, (r4, 0x8)
				GPIO_Write_High(charge_enable_pin);
    8120:	e3ffe798 	bsr      	0x5050	// 5050 <GPIO_Write_High>
				Coret_DelayMs(50);
    8124:	3032      	movi      	r0, 50
    8126:	3100      	movi      	r1, 0
    8128:	e000044c 	bsr      	0x89c0	// 89c0 <Coret_DelayMs>
				if(!GPIO_Read_Status(charge_status_pin)) {
    812c:	310b      	movi      	r1, 11
    812e:	9700      	ld.w      	r0, (r7, 0x0)
    8130:	e3ffe7a3 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    8134:	3840      	cmpnei      	r0, 0
    8136:	0816      	bt      	0x8162	// 8162 <app_battery_handle_process_charge+0x72>
					GPIO_Write_Low(charge_enable_pin);
    8138:	9700      	ld.w      	r0, (r7, 0x0)
    813a:	3106      	movi      	r1, 6
    813c:	e3ffe78e 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
					app_status_indication_set(APP_STATUS_INDICATION_FULLCHARGE);
    8140:	3001      	movi      	r0, 1
    8142:	e000025b 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
					printf("fully charge!!!\r\n");
    8146:	0302      	lrw      	r0, 0x912f	// 83b8 <app_battery_handle_process_charge+0x2c8>
				} else{
					app_status_indication_set(APP_STATUS_INDICATION_CHARGING);
					printf("charging....\r\n");
    8148:	e3ffdbe6 	bsr      	0x3914	// 3914 <__GI_puts>
				}
				pre_status = battery_status;
    814c:	9679      	ld.w      	r3, (r6, 0x64)
    814e:	b560      	st.w      	r3, (r5, 0x0)
						}
					}
				}	
			}

			ntc_time_cnt++;
    8150:	8c65      	ld.h      	r3, (r4, 0xa)
    8152:	2300      	addi      	r3, 1
    8154:	74cd      	zexth      	r3, r3
			if(ntc_time_cnt >= 500)
    8156:	0345      	lrw      	r2, 0x1f3	// 83bc <app_battery_handle_process_charge+0x2cc>
    8158:	64c8      	cmphs      	r2, r3
    815a:	0c53      	bf      	0x8200	// 8200 <app_battery_handle_process_charge+0x110>
					time_cnt = 0;
					if(battery_power_get() <= 0) system_shutdown();
				}	
			}

			ntc_time_cnt++;
    815c:	ac65      	st.h      	r3, (r4, 0xa)
			pre_status = APP_BATTERY_STATUS_INVALID;
			break;
	}
	
	return 0;
}
    815e:	3000      	movi      	r0, 0
    8160:	1494      	pop      	r4-r7, r15
					app_status_indication_set(APP_STATUS_INDICATION_CHARGING);
    8162:	3000      	movi      	r0, 0
    8164:	e000024a 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
					printf("charging....\r\n");
    8168:	0309      	lrw      	r0, 0x9140	// 83c0 <app_battery_handle_process_charge+0x2d0>
    816a:	07ef      	br      	0x8148	// 8148 <app_battery_handle_process_charge+0x58>
				time_cnt++;
    816c:	8c64      	ld.h      	r3, (r4, 0x8)
    816e:	2300      	addi      	r3, 1
    8170:	74cd      	zexth      	r3, r3
				if(time_cnt >= 400)
    8172:	034a      	lrw      	r2, 0x18f	// 83c4 <app_battery_handle_process_charge+0x2d4>
    8174:	64c8      	cmphs      	r2, r3
    8176:	0c03      	bf      	0x817c	// 817c <app_battery_handle_process_charge+0x8c>
				time_cnt++;
    8178:	ac64      	st.h      	r3, (r4, 0x8)
    817a:	07eb      	br      	0x8150	// 8150 <app_battery_handle_process_charge+0x60>
					time_cnt = 0;
    817c:	3300      	movi      	r3, 0
    817e:	ac64      	st.h      	r3, (r4, 0x8)
					if(APP_STATUS_INDICATION_FULLCHARGE != app_status_indication_get()) {
    8180:	e0000254 	bsr      	0x8628	// 8628 <app_status_indication_get>
    8184:	3841      	cmpnei      	r0, 1
    8186:	0c1d      	bf      	0x81c0	// 81c0 <app_battery_handle_process_charge+0xd0>
						if(!GPIO_Read_Status(charge_status_pin)) full_charge_cnt++;
    8188:	03b4      	lrw      	r5, 0x20000050	// 83b4 <app_battery_handle_process_charge+0x2c4>
    818a:	310b      	movi      	r1, 11
    818c:	9500      	ld.w      	r0, (r5, 0x0)
    818e:	e3ffe774 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    8192:	3840      	cmpnei      	r0, 0
    8194:	0814      	bt      	0x81bc	// 81bc <app_battery_handle_process_charge+0xcc>
    8196:	8466      	ld.b      	r3, (r4, 0x6)
    8198:	2300      	addi      	r3, 1
						else full_charge_cnt = 0;
    819a:	a466      	st.b      	r3, (r4, 0x6)
						if(full_charge_cnt >= 3)
    819c:	8466      	ld.b      	r3, (r4, 0x6)
    819e:	3b02      	cmphsi      	r3, 3
    81a0:	0fd8      	bf      	0x8150	// 8150 <app_battery_handle_process_charge+0x60>
							full_charge_cnt = 0;
    81a2:	3300      	movi      	r3, 0
							GPIO_Write_Low(charge_enable_pin);
    81a4:	9500      	ld.w      	r0, (r5, 0x0)
    81a6:	3106      	movi      	r1, 6
							full_charge_cnt = 0;
    81a8:	a466      	st.b      	r3, (r4, 0x6)
							GPIO_Write_Low(charge_enable_pin);
    81aa:	e3ffe757 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
							app_status_indication_set(APP_STATUS_INDICATION_FULLCHARGE);
    81ae:	3001      	movi      	r0, 1
    81b0:	e0000224 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
							printf("fully charge!!!\r\n");
    81b4:	031e      	lrw      	r0, 0x912f	// 83b8 <app_battery_handle_process_charge+0x2c8>
							printf("start recharge....\r\n");
    81b6:	e3ffdbaf 	bsr      	0x3914	// 3914 <__GI_puts>
    81ba:	07cb      	br      	0x8150	// 8150 <app_battery_handle_process_charge+0x60>
						else full_charge_cnt = 0;
    81bc:	3300      	movi      	r3, 0
    81be:	07ee      	br      	0x819a	// 819a <app_battery_handle_process_charge+0xaa>
						if(APP_BATTERY_RECHARGE_MV >= battery_adc_to_mv(adc_get_val(BATTERY_ADC)))
    81c0:	3000      	movi      	r0, 0
    81c2:	e3fffbc7 	bsr      	0x7950	// 7950 <adc_get_val>
    81c6:	e3ffd937 	bsr      	0x3434	// 3434 <__floatunsidf>
    81ca:	3200      	movi      	r2, 0
    81cc:	137f      	lrw      	r3, 0x3fe75400	// 83c8 <app_battery_handle_process_charge+0x2d8>
    81ce:	e3ffd719 	bsr      	0x3000	// 3000 <__muldf3>
    81d2:	3200      	movi      	r2, 0
    81d4:	137e      	lrw      	r3, 0x40438000	// 83cc <app_battery_handle_process_charge+0x2dc>
    81d6:	e3ffd82f 	bsr      	0x3234	// 3234 <__divdf3>
    81da:	137e      	lrw      	r3, 0x405e4000	// 83d0 <app_battery_handle_process_charge+0x2e0>
    81dc:	3200      	movi      	r2, 0
    81de:	e3ffd711 	bsr      	0x3000	// 3000 <__muldf3>
    81e2:	e3ffd021 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    81e6:	137c      	lrw      	r3, 0x102c	// 83d4 <app_battery_handle_process_charge+0x2e4>
    81e8:	640c      	cmphs      	r3, r0
    81ea:	0fb3      	bf      	0x8150	// 8150 <app_battery_handle_process_charge+0x60>
							GPIO_Write_High(charge_enable_pin);
    81ec:	1372      	lrw      	r3, 0x20000050	// 83b4 <app_battery_handle_process_charge+0x2c4>
    81ee:	3106      	movi      	r1, 6
    81f0:	9300      	ld.w      	r0, (r3, 0x0)
    81f2:	e3ffe72f 	bsr      	0x5050	// 5050 <GPIO_Write_High>
							app_status_indication_set(APP_STATUS_INDICATION_CHARGING);
    81f6:	3000      	movi      	r0, 0
    81f8:	e0000200 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
							printf("start recharge....\r\n");
    81fc:	1317      	lrw      	r0, 0x914e	// 83d8 <app_battery_handle_process_charge+0x2e8>
    81fe:	07dc      	br      	0x81b6	// 81b6 <app_battery_handle_process_charge+0xc6>
				ntc_time_cnt = 0;
    8200:	3300      	movi      	r3, 0
				ntc_mv = ntc_adc_to_mv(adc_get_val(NTC_ADC));
    8202:	3003      	movi      	r0, 3
				ntc_time_cnt = 0;
    8204:	ac65      	st.h      	r3, (r4, 0xa)
				ntc_mv = ntc_adc_to_mv(adc_get_val(NTC_ADC));
    8206:	e3fffba5 	bsr      	0x7950	// 7950 <adc_get_val>
    820a:	3380      	movi      	r3, 128
    820c:	4365      	lsli      	r3, r3, 5
    820e:	5b01      	subu      	r0, r3, r0
    8210:	e3ffd912 	bsr      	0x3434	// 3434 <__floatunsidf>
    8214:	3200      	movi      	r2, 0
    8216:	1372      	lrw      	r3, 0x3fe74c00	// 83dc <app_battery_handle_process_charge+0x2ec>
    8218:	e3ffd6f4 	bsr      	0x3000	// 3000 <__muldf3>
    821c:	6c83      	mov      	r2, r0
    821e:	6cc7      	mov      	r3, r1
    8220:	3000      	movi      	r0, 0
    8222:	1330      	lrw      	r1, 0x40a75800	// 83e0 <app_battery_handle_process_charge+0x2f0>
    8224:	e3ffd6d2 	bsr      	0x2fc8	// 2fc8 <__subdf3>
    8228:	e3ffcffe 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    822c:	6d43      	mov      	r5, r0
				printf("NTC: %ldmv\r\n", ntc_mv);
    822e:	6c43      	mov      	r1, r0
    8230:	130d      	lrw      	r0, 0x9162	// 83e4 <app_battery_handle_process_charge+0x2f4>
    8232:	e3ffdb5f 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
				if(ntc_mv > APP_NTC_STOPCHG_HIGH_MV || ntc_mv < APP_NTC_STOPCHG_LOW_MV) ntc_trigger_cnt++;
    8236:	134d      	lrw      	r2, 0xfffffc29	// 83e8 <app_battery_handle_process_charge+0x2f8>
    8238:	3397      	movi      	r3, 151
    823a:	6094      	addu      	r2, r5
    823c:	4363      	lsli      	r3, r3, 3
    823e:	648c      	cmphs      	r3, r2
    8240:	0810      	bt      	0x8260	// 8260 <app_battery_handle_process_charge+0x170>
    8242:	846c      	ld.b      	r3, (r4, 0xc)
    8244:	2300      	addi      	r3, 1
				else ntc_trigger_cnt = 0;
    8246:	a46c      	st.b      	r3, (r4, 0xc)
				if(ntc_trigger_cnt >= 3)
    8248:	846c      	ld.b      	r3, (r4, 0xc)
    824a:	3b02      	cmphsi      	r3, 3
    824c:	0f89      	bf      	0x815e	// 815e <app_battery_handle_process_charge+0x6e>
					ntc_trigger_cnt = 0;
    824e:	3300      	movi      	r3, 0
    8250:	a46c      	st.b      	r3, (r4, 0xc)
					printf("NTC error!!!: %ldmv\r\n", ntc_mv);
    8252:	6c57      	mov      	r1, r5
    8254:	1306      	lrw      	r0, 0x916f	// 83ec <app_battery_handle_process_charge+0x2fc>
    8256:	e3ffdb4d 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
					battery_status = APP_BATTERY_STATUS_NTC_ERROR;
    825a:	3303      	movi      	r3, 3
					battery_status = APP_BATTERY_STATUS_CHARGING;
    825c:	b679      	st.w      	r3, (r6, 0x64)
    825e:	0780      	br      	0x815e	// 815e <app_battery_handle_process_charge+0x6e>
				else ntc_trigger_cnt = 0;
    8260:	3300      	movi      	r3, 0
    8262:	07f2      	br      	0x8246	// 8246 <app_battery_handle_process_charge+0x156>
			if(battery_status != pre_status) {
    8264:	9560      	ld.w      	r3, (r5, 0x0)
    8266:	3b43      	cmpnei      	r3, 3
    8268:	1292      	lrw      	r4, 0x2000026c	// 83b0 <app_battery_handle_process_charge+0x2c0>
    826a:	0c53      	bf      	0x8310	// 8310 <app_battery_handle_process_charge+0x220>
				time_cnt = 0;
    826c:	3300      	movi      	r3, 0
    826e:	ac64      	st.h      	r3, (r4, 0x8)
				GPIO_Write_Low(charge_enable_pin);
    8270:	3106      	movi      	r1, 6
    8272:	1271      	lrw      	r3, 0x20000050	// 83b4 <app_battery_handle_process_charge+0x2c4>
				GPIO_Write_Low(charge_5V_boost_pin);
    8274:	12ff      	lrw      	r7, 0x2000004c	// 83f0 <app_battery_handle_process_charge+0x300>
				GPIO_Write_Low(charge_enable_pin);
    8276:	9300      	ld.w      	r0, (r3, 0x0)
    8278:	e3ffe6f0 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
				GPIO_Write_Low(charge_5V_boost_pin);
    827c:	3101      	movi      	r1, 1
    827e:	9700      	ld.w      	r0, (r7, 0x0)
    8280:	e3ffe6ec 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
				GPIO_Init(pattern_TX_pin, Output);
    8284:	3200      	movi      	r2, 0
    8286:	3104      	movi      	r1, 4
    8288:	9700      	ld.w      	r0, (r7, 0x0)
    828a:	e3ffe4fb 	bsr      	0x4c80	// 4c80 <GPIO_Init>
				GPIO_Write_Low(pattern_TX_pin);
    828e:	3104      	movi      	r1, 4
    8290:	9700      	ld.w      	r0, (r7, 0x0)
    8292:	e3ffe6e3 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
				GPIO_InPutOutPut_Disable(pattern_RX_pin);
    8296:	9700      	ld.w      	r0, (r7, 0x0)
    8298:	3105      	movi      	r1, 5
    829a:	e3ffe563 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
				app_status_indication_set(APP_STATUS_INDICATION_NTC_ERROR);
    829e:	3003      	movi      	r0, 3
    82a0:	e00001ac 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
				pre_status = battery_status;
    82a4:	9679      	ld.w      	r3, (r6, 0x64)
    82a6:	b560      	st.w      	r3, (r5, 0x0)
			ntc_time_cnt++;
    82a8:	8c65      	ld.h      	r3, (r4, 0xa)
    82aa:	2300      	addi      	r3, 1
    82ac:	74cd      	zexth      	r3, r3
			if(ntc_time_cnt >= 500)
    82ae:	1244      	lrw      	r2, 0x1f3	// 83bc <app_battery_handle_process_charge+0x2cc>
    82b0:	64c8      	cmphs      	r2, r3
    82b2:	0b55      	bt      	0x815c	// 815c <app_battery_handle_process_charge+0x6c>
				ntc_time_cnt = 0;
    82b4:	3300      	movi      	r3, 0
				ntc_mv = ntc_adc_to_mv(adc_get_val(NTC_ADC));
    82b6:	3003      	movi      	r0, 3
				ntc_time_cnt = 0;
    82b8:	ac65      	st.h      	r3, (r4, 0xa)
				ntc_mv = ntc_adc_to_mv(adc_get_val(NTC_ADC));
    82ba:	e3fffb4b 	bsr      	0x7950	// 7950 <adc_get_val>
    82be:	3380      	movi      	r3, 128
    82c0:	4365      	lsli      	r3, r3, 5
    82c2:	5b01      	subu      	r0, r3, r0
    82c4:	e3ffd8b8 	bsr      	0x3434	// 3434 <__floatunsidf>
    82c8:	3200      	movi      	r2, 0
    82ca:	1265      	lrw      	r3, 0x3fe74c00	// 83dc <app_battery_handle_process_charge+0x2ec>
    82cc:	e3ffd69a 	bsr      	0x3000	// 3000 <__muldf3>
    82d0:	6c83      	mov      	r2, r0
    82d2:	6cc7      	mov      	r3, r1
    82d4:	3000      	movi      	r0, 0
    82d6:	1223      	lrw      	r1, 0x40a75800	// 83e0 <app_battery_handle_process_charge+0x2f0>
    82d8:	e3ffd678 	bsr      	0x2fc8	// 2fc8 <__subdf3>
    82dc:	e3ffcfa4 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    82e0:	6d43      	mov      	r5, r0
				printf("NTC: %ldmv\r\n", ntc_mv);
    82e2:	6c43      	mov      	r1, r0
    82e4:	1200      	lrw      	r0, 0x9162	// 83e4 <app_battery_handle_process_charge+0x2f4>
    82e6:	e3ffdb05 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
				if(ntc_mv <= APP_NTC_RECHG_HIGH_MV && ntc_mv >= APP_NTC_RECHG_LOW_MV) ntc_trigger_cnt++;
    82ea:	1243      	lrw      	r2, 0xfffffbb5	// 83f4 <app_battery_handle_process_charge+0x304>
    82ec:	6094      	addu      	r2, r5
    82ee:	1263      	lrw      	r3, 0x3c1	// 83f8 <app_battery_handle_process_charge+0x308>
    82f0:	648c      	cmphs      	r3, r2
    82f2:	0c21      	bf      	0x8334	// 8334 <app_battery_handle_process_charge+0x244>
    82f4:	846c      	ld.b      	r3, (r4, 0xc)
    82f6:	2300      	addi      	r3, 1
				else ntc_trigger_cnt = 0;
    82f8:	a46c      	st.b      	r3, (r4, 0xc)
				if(ntc_trigger_cnt >= 3)
    82fa:	846c      	ld.b      	r3, (r4, 0xc)
    82fc:	3b02      	cmphsi      	r3, 3
    82fe:	0f30      	bf      	0x815e	// 815e <app_battery_handle_process_charge+0x6e>
					ntc_trigger_cnt = 0;
    8300:	3300      	movi      	r3, 0
    8302:	a46c      	st.b      	r3, (r4, 0xc)
					printf("NTC error-->recover charge!!!: %ldmv\r\n", ntc_mv);
    8304:	6c57      	mov      	r1, r5
    8306:	111e      	lrw      	r0, 0x9185	// 83fc <app_battery_handle_process_charge+0x30c>
    8308:	e3ffdaf4 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
					battery_status = APP_BATTERY_STATUS_CHARGING;
    830c:	3301      	movi      	r3, 1
    830e:	07a7      	br      	0x825c	// 825c <app_battery_handle_process_charge+0x16c>
				time_cnt++;
    8310:	8c64      	ld.h      	r3, (r4, 0x8)
    8312:	2300      	addi      	r3, 1
    8314:	74cd      	zexth      	r3, r3
				if(time_cnt >= 400)
    8316:	114c      	lrw      	r2, 0x18f	// 83c4 <app_battery_handle_process_charge+0x2d4>
    8318:	64c8      	cmphs      	r2, r3
    831a:	0c03      	bf      	0x8320	// 8320 <app_battery_handle_process_charge+0x230>
				time_cnt++;
    831c:	ac64      	st.h      	r3, (r4, 0x8)
    831e:	07c5      	br      	0x82a8	// 82a8 <app_battery_handle_process_charge+0x1b8>
					time_cnt = 0;
    8320:	3300      	movi      	r3, 0
    8322:	ac64      	st.h      	r3, (r4, 0x8)
	return battery_percentage;
    8324:	3360      	movi      	r3, 96
    8326:	60d8      	addu      	r3, r6
					if(battery_power_get() <= 0) system_shutdown();
    8328:	8368      	ld.b      	r3, (r3, 0x8)
    832a:	3b40      	cmpnei      	r3, 0
    832c:	0bbe      	bt      	0x82a8	// 82a8 <app_battery_handle_process_charge+0x1b8>
    832e:	e3fffafd 	bsr      	0x7928	// 7928 <system_shutdown>
    8332:	07bb      	br      	0x82a8	// 82a8 <app_battery_handle_process_charge+0x1b8>
				else ntc_trigger_cnt = 0;
    8334:	3300      	movi      	r3, 0
    8336:	07e1      	br      	0x82f8	// 82f8 <app_battery_handle_process_charge+0x208>
			if(battery_status != pre_status) {
    8338:	9560      	ld.w      	r3, (r5, 0x0)
    833a:	3b44      	cmpnei      	r3, 4
    833c:	105d      	lrw      	r2, 0x2000026c	// 83b0 <app_battery_handle_process_charge+0x2c0>
    833e:	0c1d      	bf      	0x8378	// 8378 <app_battery_handle_process_charge+0x288>
				time_cnt = 0;
    8340:	3300      	movi      	r3, 0
    8342:	aa64      	st.h      	r3, (r2, 0x8)
				GPIO_Write_Low(charge_enable_pin);
    8344:	3106      	movi      	r1, 6
    8346:	107c      	lrw      	r3, 0x20000050	// 83b4 <app_battery_handle_process_charge+0x2c4>
				GPIO_Write_Low(charge_5V_boost_pin);
    8348:	11ca      	lrw      	r6, 0x2000004c	// 83f0 <app_battery_handle_process_charge+0x300>
				GPIO_Write_Low(charge_enable_pin);
    834a:	9300      	ld.w      	r0, (r3, 0x0)
    834c:	e3ffe686 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
				GPIO_Write_Low(charge_5V_boost_pin);
    8350:	3101      	movi      	r1, 1
    8352:	9600      	ld.w      	r0, (r6, 0x0)
    8354:	e3ffe682 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
				GPIO_Init(pattern_TX_pin, Output);
    8358:	3200      	movi      	r2, 0
    835a:	3104      	movi      	r1, 4
    835c:	9600      	ld.w      	r0, (r6, 0x0)
    835e:	e3ffe491 	bsr      	0x4c80	// 4c80 <GPIO_Init>
				GPIO_Write_Low(pattern_TX_pin);
    8362:	3104      	movi      	r1, 4
    8364:	9600      	ld.w      	r0, (r6, 0x0)
    8366:	e3ffe679 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
				GPIO_InPutOutPut_Disable(pattern_RX_pin);
    836a:	9600      	ld.w      	r0, (r6, 0x0)
    836c:	3105      	movi      	r1, 5
    836e:	e3ffe4f9 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
				pre_status = battery_status;
    8372:	9479      	ld.w      	r3, (r4, 0x64)
			pre_status = APP_BATTERY_STATUS_INVALID;
    8374:	b560      	st.w      	r3, (r5, 0x0)
			break;
    8376:	06f4      	br      	0x815e	// 815e <app_battery_handle_process_charge+0x6e>
				time_cnt++;
    8378:	8a64      	ld.h      	r3, (r2, 0x8)
    837a:	2300      	addi      	r3, 1
    837c:	74cd      	zexth      	r3, r3
				if(time_cnt >= 400)
    837e:	1032      	lrw      	r1, 0x18f	// 83c4 <app_battery_handle_process_charge+0x2d4>
    8380:	64c4      	cmphs      	r1, r3
    8382:	0c03      	bf      	0x8388	// 8388 <app_battery_handle_process_charge+0x298>
				time_cnt++;
    8384:	aa64      	st.h      	r3, (r2, 0x8)
    8386:	06ec      	br      	0x815e	// 815e <app_battery_handle_process_charge+0x6e>
					time_cnt = 0;
    8388:	3300      	movi      	r3, 0
	return battery_percentage;
    838a:	245f      	addi      	r4, 96
					time_cnt = 0;
    838c:	aa64      	st.h      	r3, (r2, 0x8)
					if(battery_power_get() <= 0) system_shutdown();
    838e:	8468      	ld.b      	r3, (r4, 0x8)
    8390:	3b40      	cmpnei      	r3, 0
    8392:	0ae6      	bt      	0x815e	// 815e <app_battery_handle_process_charge+0x6e>
    8394:	e3fffaca 	bsr      	0x7928	// 7928 <system_shutdown>
    8398:	06e3      	br      	0x815e	// 815e <app_battery_handle_process_charge+0x6e>
			GPIO_Write_High(NTC_detect_pin);
    839a:	1067      	lrw      	r3, 0x20000050	// 83b4 <app_battery_handle_process_charge+0x2c4>
    839c:	310e      	movi      	r1, 14
    839e:	9300      	ld.w      	r0, (r3, 0x0)
    83a0:	e3ffe658 	bsr      	0x5050	// 5050 <GPIO_Write_High>
			battery_status = status;
    83a4:	b4f9      	st.w      	r7, (r4, 0x64)
			pre_status = APP_BATTERY_STATUS_INVALID;
    83a6:	3305      	movi      	r3, 5
    83a8:	07e6      	br      	0x8374	// 8374 <app_battery_handle_process_charge+0x284>
    83aa:	0000      	bkpt
    83ac:	20000128 	.long	0x20000128
    83b0:	2000026c 	.long	0x2000026c
    83b4:	20000050 	.long	0x20000050
    83b8:	0000912f 	.long	0x0000912f
    83bc:	000001f3 	.long	0x000001f3
    83c0:	00009140 	.long	0x00009140
    83c4:	0000018f 	.long	0x0000018f
    83c8:	3fe75400 	.long	0x3fe75400
    83cc:	40438000 	.long	0x40438000
    83d0:	405e4000 	.long	0x405e4000
    83d4:	0000102c 	.long	0x0000102c
    83d8:	0000914e 	.long	0x0000914e
    83dc:	3fe74c00 	.long	0x3fe74c00
    83e0:	40a75800 	.long	0x40a75800
    83e4:	00009162 	.long	0x00009162
    83e8:	fffffc29 	.long	0xfffffc29
    83ec:	0000916f 	.long	0x0000916f
    83f0:	2000004c 	.long	0x2000004c
    83f4:	fffffbb5 	.long	0xfffffbb5
    83f8:	000003c1 	.long	0x000003c1
    83fc:	00009185 	.long	0x00009185

Disassembly of section .text.app_battery_handle_process:

00008400 <app_battery_handle_process>:

S8_T app_battery_handle_process(void)
{
    8400:	14d0      	push      	r15
	switch(app_charge_type_get())
    8402:	e3fff967 	bsr      	0x76d0	// 76d0 <app_charge_type_get>
    8406:	3840      	cmpnei      	r0, 0
    8408:	0c08      	bf      	0x8418	// 8418 <app_battery_handle_process+0x18>
    840a:	3802      	cmphsi      	r0, 3
    840c:	0804      	bt      	0x8414	// 8414 <app_battery_handle_process+0x14>
	{
		case APP_CHARGE_TYPE_WIRED:
		case APP_CHARGE_TYPE_WIRELESS:	
			app_battery_handle_process_charge(APP_BATTERY_STATUS_CHARGING);
    840e:	3001      	movi      	r0, 1
    8410:	e3fffe70 	bsr      	0x80f0	// 80f0 <app_battery_handle_process_charge>
		case APP_CHARGE_TYPE_DISCHARGE:
			app_battery_handle_process_normal(APP_BATTERY_STATUS_NORMAL);
		break;
	}
	return 0;
}
    8414:	3000      	movi      	r0, 0
    8416:	1490      	pop      	r15
			app_battery_handle_process_normal(APP_BATTERY_STATUS_NORMAL);
    8418:	3000      	movi      	r0, 0
    841a:	e3fffe0d 	bsr      	0x8034	// 8034 <app_battery_handle_process_normal>
		break;
    841e:	07fb      	br      	0x8414	// 8414 <app_battery_handle_process+0x14>

Disassembly of section .text.EXI2to3IntHandler:

00008420 <EXI2to3IntHandler>:

void EXI2to3IntHandler(void) 
{
    8420:	1460      	nie
    8422:	1462      	ipush
    8424:	14d0      	push      	r15
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN2)==EXI_PIN2) 
    8426:	1070      	lrw      	r3, 0x2000005c	// 8464 <EXI2to3IntHandler+0x44>
    8428:	3104      	movi      	r1, 4
    842a:	9360      	ld.w      	r3, (r3, 0x0)
    842c:	237f      	addi      	r3, 128
    842e:	934c      	ld.w      	r2, (r3, 0x30)
    8430:	6884      	and      	r2, r1
    8432:	3a40      	cmpnei      	r2, 0
    8434:	0c07      	bf      	0x8442	// 8442 <EXI2to3IntHandler+0x22>
	{
		SYSCON->EXICR = EXI_PIN2;
    8436:	b32b      	st.w      	r1, (r3, 0x2c)
	{
		SYSCON->EXICR = EXI_PIN3;
		if(GPIO_Read_Status(charge_USB5V_detect_pin)) ;
		else app_status_indication_set(APP_STATUS_INDICATION_PLUGOUT);
	}
}
    8438:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    843c:	1401      	addi      	r14, r14, 4
    843e:	1463      	ipop
    8440:	1461      	nir
	else if ((SYSCON->EXIRS&EXI_PIN3)==EXI_PIN3) 
    8442:	934c      	ld.w      	r2, (r3, 0x30)
    8444:	3108      	movi      	r1, 8
    8446:	6884      	and      	r2, r1
    8448:	3a40      	cmpnei      	r2, 0
    844a:	0ff7      	bf      	0x8438	// 8438 <EXI2to3IntHandler+0x18>
		SYSCON->EXICR = EXI_PIN3;
    844c:	b32b      	st.w      	r1, (r3, 0x2c)
		if(GPIO_Read_Status(charge_USB5V_detect_pin)) ;
    844e:	3103      	movi      	r1, 3
    8450:	1066      	lrw      	r3, 0x20000050	// 8468 <EXI2to3IntHandler+0x48>
    8452:	9300      	ld.w      	r0, (r3, 0x0)
    8454:	e3ffe611 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    8458:	3840      	cmpnei      	r0, 0
    845a:	0bef      	bt      	0x8438	// 8438 <EXI2to3IntHandler+0x18>
		else app_status_indication_set(APP_STATUS_INDICATION_PLUGOUT);
    845c:	3002      	movi      	r0, 2
    845e:	e00000cd 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
}
    8462:	07eb      	br      	0x8438	// 8438 <EXI2to3IntHandler+0x18>
    8464:	2000005c 	.long	0x2000005c
    8468:	20000050 	.long	0x20000050

Disassembly of section .text.EXI0IntHandler:

0000846c <EXI0IntHandler>:

void EXI0IntHandler(void) 
{
    846c:	1460      	nie
    846e:	1462      	ipush
    8470:	14d0      	push      	r15
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN0)==EXI_PIN0) 
    8472:	106d      	lrw      	r3, 0x2000005c	// 84a4 <EXI0IntHandler+0x38>
    8474:	3101      	movi      	r1, 1
    8476:	9360      	ld.w      	r3, (r3, 0x0)
    8478:	237f      	addi      	r3, 128
    847a:	934c      	ld.w      	r2, (r3, 0x30)
    847c:	6884      	and      	r2, r1
    847e:	3a40      	cmpnei      	r2, 0
    8480:	0c0c      	bf      	0x8498	// 8498 <EXI0IntHandler+0x2c>
	{
		SYSCON->EXICR = EXI_PIN0;
    8482:	b32b      	st.w      	r1, (r3, 0x2c)
		if(GPIO_Read_Status(charge_wireless5V_dectect_pin)) ;
    8484:	3100      	movi      	r1, 0
    8486:	1069      	lrw      	r3, 0x20000050	// 84a8 <EXI0IntHandler+0x3c>
    8488:	9300      	ld.w      	r0, (r3, 0x0)
    848a:	e3ffe5f6 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    848e:	3840      	cmpnei      	r0, 0
    8490:	0804      	bt      	0x8498	// 8498 <EXI0IntHandler+0x2c>
 		else app_status_indication_set(APP_STATUS_INDICATION_PLUGOUT);
    8492:	3002      	movi      	r0, 2
    8494:	e00000b2 	bsr      	0x85f8	// 85f8 <app_status_indication_set>
	}
}
    8498:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    849c:	1401      	addi      	r14, r14, 4
    849e:	1463      	ipop
    84a0:	1461      	nir
    84a2:	0000      	bkpt
    84a4:	2000005c 	.long	0x2000005c
    84a8:	20000050 	.long	0x20000050

Disassembly of section .text.app_close_all_led:

000084ac <app_close_all_led>:
#include "app_battery.h"

enum APP_STATUS_INDICATION_T app_status = APP_STATUS_INDICATION_NUM;

void app_close_all_led(void)
{
    84ac:	14d1      	push      	r4, r15
	GPIO_InPutOutPut_Disable(red_led_pin);
    84ae:	1090      	lrw      	r4, 0x2000004c	// 84ec <app_close_all_led+0x40>
    84b0:	3102      	movi      	r1, 2
    84b2:	9400      	ld.w      	r0, (r4, 0x0)
    84b4:	e3ffe456 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_Write_High(red_led_pin);
    84b8:	9400      	ld.w      	r0, (r4, 0x0)
    84ba:	3102      	movi      	r1, 2
    84bc:	e3ffe5ca 	bsr      	0x5050	// 5050 <GPIO_Write_High>
	GPIO_InPutOutPut_Disable(green_led_pin);
    84c0:	9400      	ld.w      	r0, (r4, 0x0)
    84c2:	3103      	movi      	r1, 3
    84c4:	e3ffe44e 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_Write_High(green_led_pin);
    84c8:	9400      	ld.w      	r0, (r4, 0x0)
    84ca:	3103      	movi      	r1, 3
	GPIO_InPutOutPut_Disable(blue_led_pin);
    84cc:	1089      	lrw      	r4, 0x20000050	// 84f0 <app_close_all_led+0x44>
	GPIO_Write_High(green_led_pin);
    84ce:	e3ffe5c1 	bsr      	0x5050	// 5050 <GPIO_Write_High>
	GPIO_InPutOutPut_Disable(blue_led_pin);
    84d2:	9400      	ld.w      	r0, (r4, 0x0)
    84d4:	3108      	movi      	r1, 8
    84d6:	e3ffe445 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_Write_High(blue_led_pin);
    84da:	9400      	ld.w      	r0, (r4, 0x0)
    84dc:	3108      	movi      	r1, 8
    84de:	e3ffe5b9 	bsr      	0x5050	// 5050 <GPIO_Write_High>
	EPT_Vector_Int_Disable();
    84e2:	e3ffeacd 	bsr      	0x5a7c	// 5a7c <EPT_Vector_Int_Disable>
	EPT_Stop();
    84e6:	e3ffe8ff 	bsr      	0x56e4	// 56e4 <EPT_Stop>
}
    84ea:	1491      	pop      	r4, r15
    84ec:	2000004c 	.long	0x2000004c
    84f0:	20000050 	.long	0x20000050

Disassembly of section .text.app_red_led_turn_solid:

000084f4 <app_red_led_turn_solid>:

void app_red_led_turn_solid(void)
{
    84f4:	14d1      	push      	r4, r15
	GPIO_Init(red_led_pin, Output);
    84f6:	1086      	lrw      	r4, 0x2000004c	// 850c <app_red_led_turn_solid+0x18>
    84f8:	3200      	movi      	r2, 0
    84fa:	9400      	ld.w      	r0, (r4, 0x0)
    84fc:	3102      	movi      	r1, 2
    84fe:	e3ffe3c1 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_Low(red_led_pin);
    8502:	9400      	ld.w      	r0, (r4, 0x0)
    8504:	3102      	movi      	r1, 2
    8506:	e3ffe5a9 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
}
    850a:	1491      	pop      	r4, r15
    850c:	2000004c 	.long	0x2000004c

Disassembly of section .text.app_green_led_turn_solid:

00008510 <app_green_led_turn_solid>:

void app_green_led_turn_solid(void)
{
    8510:	14d1      	push      	r4, r15
	GPIO_Init(green_led_pin, Output);
    8512:	1086      	lrw      	r4, 0x2000004c	// 8528 <app_green_led_turn_solid+0x18>
    8514:	3200      	movi      	r2, 0
    8516:	9400      	ld.w      	r0, (r4, 0x0)
    8518:	3103      	movi      	r1, 3
    851a:	e3ffe3b3 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_Low(green_led_pin);
    851e:	9400      	ld.w      	r0, (r4, 0x0)
    8520:	3103      	movi      	r1, 3
    8522:	e3ffe59b 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
}
    8526:	1491      	pop      	r4, r15
    8528:	2000004c 	.long	0x2000004c

Disassembly of section .text.app_blue_led_turn_solid:

0000852c <app_blue_led_turn_solid>:

void app_blue_led_turn_solid(void)
{
    852c:	14d1      	push      	r4, r15
	GPIO_Init(blue_led_pin, Output);
    852e:	1086      	lrw      	r4, 0x20000050	// 8544 <app_blue_led_turn_solid+0x18>
    8530:	3200      	movi      	r2, 0
    8532:	9400      	ld.w      	r0, (r4, 0x0)
    8534:	3108      	movi      	r1, 8
    8536:	e3ffe3a5 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_Low(blue_led_pin);	
    853a:	9400      	ld.w      	r0, (r4, 0x0)
    853c:	3108      	movi      	r1, 8
    853e:	e3ffe58d 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
}
    8542:	1491      	pop      	r4, r15
    8544:	20000050 	.long	0x20000050

Disassembly of section .text.app_red_led_pwm_contrl:

00008548 <app_red_led_pwm_contrl>:

void app_red_led_pwm_contrl(U16_T comp_val, U8_T breath)
{
    8548:	14d3      	push      	r4-r6, r15
    854a:	1421      	subi      	r14, r14, 4
	GPIO_InPutOutPut_Disable(green_led_pin);
    854c:	1074      	lrw      	r3, 0x2000004c	// 859c <app_red_led_pwm_contrl+0x54>
{
    854e:	6d83      	mov      	r6, r0
    8550:	6d47      	mov      	r5, r1
	GPIO_InPutOutPut_Disable(green_led_pin);
    8552:	9300      	ld.w      	r0, (r3, 0x0)
    8554:	3103      	movi      	r1, 3
    8556:	e3ffe405 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	EPT_IO_SET(EPT_IO_CHBX, IO_NUM_PB02);
    855a:	3116      	movi      	r1, 22
    855c:	3002      	movi      	r0, 2
    855e:	e3ffe8d7 	bsr      	0x570c	// 570c <EPT_IO_SET>
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(2000, 0, comp_val, 0, 0);
    8562:	3400      	movi      	r4, 0
    8564:	30fa      	movi      	r0, 250
    8566:	b880      	st.w      	r4, (r14, 0x0)
    8568:	3300      	movi      	r3, 0
    856a:	6c9b      	mov      	r2, r6
    856c:	3100      	movi      	r1, 0
    856e:	4003      	lsli      	r0, r0, 3
    8570:	e3ffea68 	bsr      	0x5a40	// 5a40 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config>
	if(breath == TRUE) {
    8574:	3d41      	cmpnei      	r5, 1
    8576:	080f      	bt      	0x8594	// 8594 <app_red_led_pwm_contrl+0x4c>
		EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(2000, 0, 2000, 0, 0);
    8578:	32fa      	movi      	r2, 250
    857a:	4243      	lsli      	r2, r2, 3
    857c:	3300      	movi      	r3, 0
    857e:	3100      	movi      	r1, 0
    8580:	6c0b      	mov      	r0, r2
    8582:	b880      	st.w      	r4, (r14, 0x0)
    8584:	e3ffea5e 	bsr      	0x5a40	// 5a40 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config>
		EPT_Vector_Int_Enable();
    8588:	e3ffea74 	bsr      	0x5a70	// 5a70 <EPT_Vector_Int_Enable>
	} else EPT_Vector_Int_Disable();
	EPT_Start();
    858c:	e3ffe898 	bsr      	0x56bc	// 56bc <EPT_Start>
}
    8590:	1401      	addi      	r14, r14, 4
    8592:	1493      	pop      	r4-r6, r15
	} else EPT_Vector_Int_Disable();
    8594:	e3ffea74 	bsr      	0x5a7c	// 5a7c <EPT_Vector_Int_Disable>
    8598:	07fa      	br      	0x858c	// 858c <app_red_led_pwm_contrl+0x44>
    859a:	0000      	bkpt
    859c:	2000004c 	.long	0x2000004c

Disassembly of section .text.app_green_led_pwm_contrl:

000085a0 <app_green_led_pwm_contrl>:

void app_green_led_pwm_contrl(U16_T comp_val, U8_T breath)
{
    85a0:	14d3      	push      	r4-r6, r15
    85a2:	1421      	subi      	r14, r14, 4
	GPIO_InPutOutPut_Disable(red_led_pin);
    85a4:	1074      	lrw      	r3, 0x2000004c	// 85f4 <app_green_led_pwm_contrl+0x54>
{
    85a6:	6d83      	mov      	r6, r0
    85a8:	6d47      	mov      	r5, r1
	GPIO_InPutOutPut_Disable(red_led_pin);
    85aa:	9300      	ld.w      	r0, (r3, 0x0)
    85ac:	3102      	movi      	r1, 2
    85ae:	e3ffe3d9 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	EPT_IO_SET(EPT_IO_CHAY, IO_NUM_PB03);
    85b2:	3113      	movi      	r1, 19
    85b4:	3001      	movi      	r0, 1
    85b6:	e3ffe8ab 	bsr      	0x570c	// 570c <EPT_IO_SET>
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(2000, 0, comp_val, 0, 0);
    85ba:	3400      	movi      	r4, 0
    85bc:	30fa      	movi      	r0, 250
    85be:	b880      	st.w      	r4, (r14, 0x0)
    85c0:	3300      	movi      	r3, 0
    85c2:	6c9b      	mov      	r2, r6
    85c4:	3100      	movi      	r1, 0
    85c6:	4003      	lsli      	r0, r0, 3
    85c8:	e3ffea3c 	bsr      	0x5a40	// 5a40 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config>
	if(breath == TRUE) {
    85cc:	3d41      	cmpnei      	r5, 1
    85ce:	080f      	bt      	0x85ec	// 85ec <app_green_led_pwm_contrl+0x4c>
		EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(2000, 0, 2000, 0, 0);
    85d0:	32fa      	movi      	r2, 250
    85d2:	4243      	lsli      	r2, r2, 3
    85d4:	3300      	movi      	r3, 0
    85d6:	3100      	movi      	r1, 0
    85d8:	6c0b      	mov      	r0, r2
    85da:	b880      	st.w      	r4, (r14, 0x0)
    85dc:	e3ffea32 	bsr      	0x5a40	// 5a40 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config>
		EPT_Vector_Int_Enable();
    85e0:	e3ffea48 	bsr      	0x5a70	// 5a70 <EPT_Vector_Int_Enable>
	} else EPT_Vector_Int_Disable();
	EPT_Start();
    85e4:	e3ffe86c 	bsr      	0x56bc	// 56bc <EPT_Start>
}
    85e8:	1401      	addi      	r14, r14, 4
    85ea:	1493      	pop      	r4-r6, r15
	} else EPT_Vector_Int_Disable();
    85ec:	e3ffea48 	bsr      	0x5a7c	// 5a7c <EPT_Vector_Int_Disable>
    85f0:	07fa      	br      	0x85e4	// 85e4 <app_green_led_pwm_contrl+0x44>
    85f2:	0000      	bkpt
    85f4:	2000004c 	.long	0x2000004c

Disassembly of section .text.app_status_indication_set:

000085f8 <app_status_indication_set>:

S8_T app_status_indication_set(enum APP_STATUS_INDICATION_T status)
{
    85f8:	14d1      	push      	r4, r15
    85fa:	6d03      	mov      	r4, r0
	printf("%s: %d\r\n",__func__, status);
    85fc:	6c83      	mov      	r2, r0
    85fe:	1028      	lrw      	r1, 0x8b7d	// 861c <app_status_indication_set+0x24>
    8600:	1008      	lrw      	r0, 0x8f72	// 8620 <app_status_indication_set+0x28>
    8602:	e3ffd977 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>

	if(app_status == status) return 0;
    8606:	1068      	lrw      	r3, 0x200001ac	// 8624 <app_status_indication_set+0x2c>
    8608:	9340      	ld.w      	r2, (r3, 0x0)
    860a:	6492      	cmpne      	r4, r2
    860c:	0c06      	bf      	0x8618	// 8618 <app_status_indication_set+0x20>
	
	app_status = status;
    860e:	b380      	st.w      	r4, (r3, 0x0)
	app_close_all_led();
    8610:	e3ffff4e 	bsr      	0x84ac	// 84ac <app_close_all_led>
	
	return 1;
    8614:	3001      	movi      	r0, 1
}
    8616:	1491      	pop      	r4, r15
	if(app_status == status) return 0;
    8618:	3000      	movi      	r0, 0
    861a:	07fe      	br      	0x8616	// 8616 <app_status_indication_set+0x1e>
    861c:	00008b7d 	.long	0x00008b7d
    8620:	00008f72 	.long	0x00008f72
    8624:	200001ac 	.long	0x200001ac

Disassembly of section .text.app_status_indication_get:

00008628 <app_status_indication_get>:

U8_T app_status_indication_get(void)
{
	return app_status;
    8628:	1062      	lrw      	r3, 0x200001ac	// 8630 <app_status_indication_get+0x8>
    862a:	8300      	ld.b      	r0, (r3, 0x0)
}
    862c:	783c      	jmp      	r15
    862e:	0000      	bkpt
    8630:	200001ac 	.long	0x200001ac

Disassembly of section .text.app_status_handle_process:

00008634 <app_status_handle_process>:

S8_T app_status_handle_process(void)
{
    8634:	14d1      	push      	r4, r15
	static enum APP_STATUS_INDICATION_T pre_status = APP_STATUS_INDICATION_NUM;
	static enum APP_STATUS_INDICATION_T cur_status = APP_STATUS_INDICATION_NUM;
	static U16_T time_cnt = 0;
	static U8_T led_reverse_flag, led_flash_cnt = 0;
	
	switch(app_status)
    8636:	0373      	lrw      	r3, 0x200001ac	// 8864 <app_status_handle_process+0x230>
    8638:	6d0f      	mov      	r4, r3
    863a:	9300      	ld.w      	r0, (r3, 0x0)
    863c:	380f      	cmphsi      	r0, 16
    863e:	0910      	bt      	0x885e	// 885e <app_status_handle_process+0x22a>
    8640:	e3ffcdc2 	bsr      	0x21c4	// 21c4 <___gnu_csky_case_uhi>
    8644:	00260010 	.long	0x00260010
    8648:	003f003b 	.long	0x003f003b
    864c:	0076006b 	.long	0x0076006b
    8650:	00960086 	.long	0x00960086
    8654:	00c700b6 	.long	0x00c700b6
    8658:	00e500d0 	.long	0x00e500d0
    865c:	00f500f0 	.long	0x00f500f0
    8660:	010b00fa 	.long	0x010b00fa
	{
		case APP_STATUS_INDICATION_CHARGING:
			cur_status = app_status;
    8664:	3300      	movi      	r3, 0
    8666:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    8668:	9462      	ld.w      	r3, (r4, 0x8)
    866a:	3b40      	cmpnei      	r3, 0
    866c:	135f      	lrw      	r2, 0x2000027a	// 8868 <app_status_handle_process+0x234>
    866e:	0c0a      	bf      	0x8682	// 8682 <app_status_handle_process+0x4e>
			{
				time_cnt = 0;
				app_red_led_pwm_contrl(2000, TRUE);
    8670:	30fa      	movi      	r0, 250
				time_cnt = 0;
    8672:	3300      	movi      	r3, 0
				app_red_led_pwm_contrl(2000, TRUE);
    8674:	3101      	movi      	r1, 1
    8676:	4003      	lsli      	r0, r0, 3
				time_cnt = 0;
    8678:	aa60      	st.h      	r3, (r2, 0x0)
				app_red_led_pwm_contrl(2000, TRUE);
    867a:	e3ffff67 	bsr      	0x8548	// 8548 <app_red_led_pwm_contrl>
					time_cnt = 0;
					app_close_all_led();
					app_status = APP_STATUS_INDICATION_NUM;
				}
			}
			pre_status = cur_status;
    867e:	9461      	ld.w      	r3, (r4, 0x4)
    8680:	041e      	br      	0x86bc	// 86bc <app_status_handle_process+0x88>
				time_cnt++;
    8682:	8a60      	ld.h      	r3, (r2, 0x0)
    8684:	2300      	addi      	r3, 1
    8686:	74cd      	zexth      	r3, r3
				if(time_cnt >= 30) {
    8688:	3b1d      	cmphsi      	r3, 30
				time_cnt++;
    868a:	aa60      	st.h      	r3, (r2, 0x0)
				if(time_cnt >= 30) {
    868c:	0ff9      	bf      	0x867e	// 867e <app_status_handle_process+0x4a>
    868e:	07f1      	br      	0x8670	// 8670 <app_status_handle_process+0x3c>
			cur_status = app_status;
    8690:	3301      	movi      	r3, 1
    8692:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    8694:	9462      	ld.w      	r3, (r4, 0x8)
    8696:	3b41      	cmpnei      	r3, 1
    8698:	1354      	lrw      	r2, 0x2000027a	// 8868 <app_status_handle_process+0x234>
    869a:	0c09      	bf      	0x86ac	// 86ac <app_status_handle_process+0x78>
				app_green_led_pwm_contrl(2000, TRUE);
    869c:	30fa      	movi      	r0, 250
				time_cnt = 0;
    869e:	3300      	movi      	r3, 0
				app_green_led_pwm_contrl(2000, TRUE);
    86a0:	3101      	movi      	r1, 1
    86a2:	4003      	lsli      	r0, r0, 3
				time_cnt = 0;
    86a4:	aa60      	st.h      	r3, (r2, 0x0)
				app_green_led_pwm_contrl(2000, TRUE);
    86a6:	e3ffff7d 	bsr      	0x85a0	// 85a0 <app_green_led_pwm_contrl>
    86aa:	07ea      	br      	0x867e	// 867e <app_status_handle_process+0x4a>
				time_cnt++;
    86ac:	8a60      	ld.h      	r3, (r2, 0x0)
    86ae:	2300      	addi      	r3, 1
    86b0:	74cd      	zexth      	r3, r3
				if(time_cnt >= 30) {
    86b2:	3b1d      	cmphsi      	r3, 30
				time_cnt++;
    86b4:	aa60      	st.h      	r3, (r2, 0x0)
				if(time_cnt >= 30) {
    86b6:	0fe4      	bf      	0x867e	// 867e <app_status_handle_process+0x4a>
    86b8:	07f2      	br      	0x869c	// 869c <app_status_handle_process+0x68>
			pre_status = app_status;
    86ba:	3302      	movi      	r3, 2
			break;
			
		case APP_STATUS_INDICATION_DSLEEP:
			pre_status = app_status;
    86bc:	b462      	st.w      	r3, (r4, 0x8)
			pre_status = app_status;
			break;
	}
	
	return 0;
}
    86be:	3000      	movi      	r0, 0
    86c0:	1491      	pop      	r4, r15
			cur_status = app_status;
    86c2:	3303      	movi      	r3, 3
    86c4:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    86c6:	9462      	ld.w      	r3, (r4, 0x8)
    86c8:	3b43      	cmpnei      	r3, 3
    86ca:	1368      	lrw      	r3, 0x2000027a	// 8868 <app_status_handle_process+0x234>
    86cc:	0c07      	bf      	0x86da	// 86da <app_status_handle_process+0xa6>
				time_cnt = 0;
    86ce:	3200      	movi      	r2, 0
    86d0:	ab40      	st.h      	r2, (r3, 0x0)
				led_flash_cnt = 0;
    86d2:	a342      	st.b      	r2, (r3, 0x2)
					led_reverse_flag = 1;
    86d4:	3201      	movi      	r2, 1
    86d6:	a343      	st.b      	r2, (r3, 0x3)
    86d8:	0439      	br      	0x874a	// 874a <app_status_handle_process+0x116>
				time_cnt++;
    86da:	8b40      	ld.h      	r2, (r3, 0x0)
    86dc:	2200      	addi      	r2, 1
				if(led_flash_cnt < 3) {
    86de:	8322      	ld.b      	r1, (r3, 0x2)
				time_cnt++;
    86e0:	7489      	zexth      	r2, r2
				if(led_flash_cnt < 3) {
    86e2:	3902      	cmphsi      	r1, 3
				time_cnt++;
    86e4:	ab40      	st.h      	r2, (r3, 0x0)
				if(led_flash_cnt < 3) {
    86e6:	0815      	bt      	0x8710	// 8710 <app_status_handle_process+0xdc>
					if(led_reverse_flag == 0 && time_cnt >= 2) {
    86e8:	8303      	ld.b      	r0, (r3, 0x3)
    86ea:	3840      	cmpnei      	r0, 0
    86ec:	0806      	bt      	0x86f8	// 86f8 <app_status_handle_process+0xc4>
				if(led_reverse_flag == 0 && time_cnt >= 2) {
    86ee:	3a01      	cmphsi      	r2, 2
    86f0:	0fc7      	bf      	0x867e	// 867e <app_status_handle_process+0x4a>
					time_cnt = 0;
    86f2:	3200      	movi      	r2, 0
    86f4:	ab40      	st.h      	r2, (r3, 0x0)
    86f6:	07ef      	br      	0x86d4	// 86d4 <app_status_handle_process+0xa0>
					} else if(led_reverse_flag == 1 && time_cnt >= 2)
    86f8:	3841      	cmpnei      	r0, 1
    86fa:	0bc2      	bt      	0x867e	// 867e <app_status_handle_process+0x4a>
    86fc:	3a01      	cmphsi      	r2, 2
    86fe:	0fc0      	bf      	0x867e	// 867e <app_status_handle_process+0x4a>
						time_cnt = 0;
    8700:	3200      	movi      	r2, 0
						led_flash_cnt++;
    8702:	2100      	addi      	r1, 1
						time_cnt = 0;
    8704:	ab40      	st.h      	r2, (r3, 0x0)
						led_reverse_flag = 0;
    8706:	a343      	st.b      	r2, (r3, 0x3)
						led_flash_cnt++;
    8708:	a322      	st.b      	r1, (r3, 0x2)
					app_close_all_led();
    870a:	e3fffed1 	bsr      	0x84ac	// 84ac <app_close_all_led>
    870e:	07b8      	br      	0x867e	// 867e <app_status_handle_process+0x4a>
					if(time_cnt >= 10) {
    8710:	3a09      	cmphsi      	r2, 10
    8712:	0fb6      	bf      	0x867e	// 867e <app_status_handle_process+0x4a>
						led_flash_cnt = 0;
    8714:	3200      	movi      	r2, 0
    8716:	a342      	st.b      	r2, (r3, 0x2)
    8718:	07b3      	br      	0x867e	// 867e <app_status_handle_process+0x4a>
			cur_status = app_status;
    871a:	3304      	movi      	r3, 4
    871c:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    871e:	9462      	ld.w      	r3, (r4, 0x8)
    8720:	3b44      	cmpnei      	r3, 4
    8722:	1252      	lrw      	r2, 0x2000027a	// 8868 <app_status_handle_process+0x234>
    8724:	0c1f      	bf      	0x8762	// 8762 <app_status_handle_process+0x12e>
				time_cnt = 0;
    8726:	3300      	movi      	r3, 0
    8728:	aa60      	st.h      	r3, (r2, 0x0)
				app_green_led_turn_solid();
    872a:	e3fffef3 	bsr      	0x8510	// 8510 <app_green_led_turn_solid>
    872e:	07a8      	br      	0x867e	// 867e <app_status_handle_process+0x4a>
			cur_status = app_status;
    8730:	3305      	movi      	r3, 5
    8732:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    8734:	9462      	ld.w      	r3, (r4, 0x8)
    8736:	3b45      	cmpnei      	r3, 5
    8738:	124c      	lrw      	r2, 0x2000027a	// 8868 <app_status_handle_process+0x234>
    873a:	0c14      	bf      	0x8762	// 8762 <app_status_handle_process+0x12e>
				app_green_led_pwm_contrl(1680, FALSE);
    873c:	30d2      	movi      	r0, 210
				time_cnt = 0;
    873e:	3300      	movi      	r3, 0
				app_green_led_pwm_contrl(1680, FALSE);
    8740:	3100      	movi      	r1, 0
    8742:	4003      	lsli      	r0, r0, 3
				time_cnt = 0;
    8744:	aa60      	st.h      	r3, (r2, 0x0)
				app_green_led_pwm_contrl(1680, FALSE);
    8746:	e3ffff2d 	bsr      	0x85a0	// 85a0 <app_green_led_pwm_contrl>
					app_red_led_turn_solid();
    874a:	e3fffed5 	bsr      	0x84f4	// 84f4 <app_red_led_turn_solid>
    874e:	0798      	br      	0x867e	// 867e <app_status_handle_process+0x4a>
			cur_status = app_status;
    8750:	3306      	movi      	r3, 6
    8752:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    8754:	9462      	ld.w      	r3, (r4, 0x8)
    8756:	3b46      	cmpnei      	r3, 6
    8758:	1244      	lrw      	r2, 0x2000027a	// 8868 <app_status_handle_process+0x234>
    875a:	0c04      	bf      	0x8762	// 8762 <app_status_handle_process+0x12e>
				time_cnt = 0;
    875c:	3300      	movi      	r3, 0
    875e:	aa60      	st.h      	r3, (r2, 0x0)
    8760:	07f5      	br      	0x874a	// 874a <app_status_handle_process+0x116>
				time_cnt++;
    8762:	8a60      	ld.h      	r3, (r2, 0x0)
    8764:	2300      	addi      	r3, 1
    8766:	74cd      	zexth      	r3, r3
				if(time_cnt >= 20) {
    8768:	3b13      	cmphsi      	r3, 20
				if(time_cnt >= 10) {
    876a:	0871      	bt      	0x884c	// 884c <app_status_handle_process+0x218>
				time_cnt++;
    876c:	aa60      	st.h      	r3, (r2, 0x0)
    876e:	0788      	br      	0x867e	// 867e <app_status_handle_process+0x4a>
			cur_status = app_status;
    8770:	3307      	movi      	r3, 7
    8772:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    8774:	9462      	ld.w      	r3, (r4, 0x8)
    8776:	3b47      	cmpnei      	r3, 7
    8778:	117c      	lrw      	r3, 0x2000027a	// 8868 <app_status_handle_process+0x234>
    877a:	0baa      	bt      	0x86ce	// 86ce <app_status_handle_process+0x9a>
				time_cnt++;
    877c:	8b40      	ld.h      	r2, (r3, 0x0)
    877e:	2200      	addi      	r2, 1
				if(led_reverse_flag == 0 && time_cnt >= 2) {
    8780:	8323      	ld.b      	r1, (r3, 0x3)
				time_cnt++;
    8782:	7489      	zexth      	r2, r2
				if(led_reverse_flag == 0 && time_cnt >= 2) {
    8784:	3940      	cmpnei      	r1, 0
				time_cnt++;
    8786:	ab40      	st.h      	r2, (r3, 0x0)
				if(led_reverse_flag == 0 && time_cnt >= 2) {
    8788:	0fb3      	bf      	0x86ee	// 86ee <app_status_handle_process+0xba>
				} else if(led_reverse_flag == 1 && time_cnt >= 2)
    878a:	3941      	cmpnei      	r1, 1
    878c:	0b79      	bt      	0x867e	// 867e <app_status_handle_process+0x4a>
    878e:	3a01      	cmphsi      	r2, 2
    8790:	0f77      	bf      	0x867e	// 867e <app_status_handle_process+0x4a>
					time_cnt = 0;
    8792:	3200      	movi      	r2, 0
    8794:	ab40      	st.h      	r2, (r3, 0x0)
					led_reverse_flag = 0;
    8796:	a343      	st.b      	r2, (r3, 0x3)
					led_flash_cnt++;
    8798:	8342      	ld.b      	r2, (r3, 0x2)
    879a:	2200      	addi      	r2, 1
    879c:	7488      	zextb      	r2, r2
					if(led_flash_cnt >= 5) {
    879e:	3a04      	cmphsi      	r2, 5
    87a0:	0803      	bt      	0x87a6	// 87a6 <app_status_handle_process+0x172>
					led_flash_cnt++;
    87a2:	a342      	st.b      	r2, (r3, 0x2)
    87a4:	07b3      	br      	0x870a	// 870a <app_status_handle_process+0xd6>
						led_flash_cnt = 0;
    87a6:	3200      	movi      	r2, 0
    87a8:	a342      	st.b      	r2, (r3, 0x2)
						app_status = APP_STATUS_INDICATION_NUM;
    87aa:	3310      	movi      	r3, 16
    87ac:	b460      	st.w      	r3, (r4, 0x0)
    87ae:	07ae      	br      	0x870a	// 870a <app_status_handle_process+0xd6>
			cur_status = app_status;
    87b0:	3308      	movi      	r3, 8
    87b2:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    87b4:	9462      	ld.w      	r3, (r4, 0x8)
    87b6:	3b48      	cmpnei      	r3, 8
    87b8:	116c      	lrw      	r3, 0x2000027a	// 8868 <app_status_handle_process+0x234>
    87ba:	0b9c      	bt      	0x86f2	// 86f2 <app_status_handle_process+0xbe>
				time_cnt++;
    87bc:	8b40      	ld.h      	r2, (r3, 0x0)
    87be:	2200      	addi      	r2, 1
				if(led_reverse_flag == 0 && time_cnt >= 50) {
    87c0:	8323      	ld.b      	r1, (r3, 0x3)
				time_cnt++;
    87c2:	7489      	zexth      	r2, r2
				if(led_reverse_flag == 0 && time_cnt >= 50) {
    87c4:	3940      	cmpnei      	r1, 0
				time_cnt++;
    87c6:	ab40      	st.h      	r2, (r3, 0x0)
				if(led_reverse_flag == 0 && time_cnt >= 50) {
    87c8:	081b      	bt      	0x87fe	// 87fe <app_status_handle_process+0x1ca>
    87ca:	3131      	movi      	r1, 49
    87cc:	6484      	cmphs      	r1, r2
    87ce:	0b58      	bt      	0x867e	// 867e <app_status_handle_process+0x4a>
    87d0:	0791      	br      	0x86f2	// 86f2 <app_status_handle_process+0xbe>
			cur_status = app_status;
    87d2:	3309      	movi      	r3, 9
    87d4:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    87d6:	9462      	ld.w      	r3, (r4, 0x8)
    87d8:	3b49      	cmpnei      	r3, 9
    87da:	0f52      	bf      	0x867e	// 867e <app_status_handle_process+0x4a>
				time_cnt = 0;
    87dc:	1163      	lrw      	r3, 0x2000027a	// 8868 <app_status_handle_process+0x234>
    87de:	3200      	movi      	r2, 0
    87e0:	ab40      	st.h      	r2, (r3, 0x0)
    87e2:	0794      	br      	0x870a	// 870a <app_status_handle_process+0xd6>
			cur_status = app_status;
    87e4:	330a      	movi      	r3, 10
    87e6:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    87e8:	9462      	ld.w      	r3, (r4, 0x8)
    87ea:	3b4a      	cmpnei      	r3, 10
    87ec:	107f      	lrw      	r3, 0x2000027a	// 8868 <app_status_handle_process+0x234>
    87ee:	0b82      	bt      	0x86f2	// 86f2 <app_status_handle_process+0xbe>
				time_cnt++;
    87f0:	8b40      	ld.h      	r2, (r3, 0x0)
    87f2:	2200      	addi      	r2, 1
				if(led_reverse_flag == 0 && time_cnt >= 2) {
    87f4:	8323      	ld.b      	r1, (r3, 0x3)
				time_cnt++;
    87f6:	7489      	zexth      	r2, r2
				if(led_reverse_flag == 0 && time_cnt >= 2) {
    87f8:	3940      	cmpnei      	r1, 0
				time_cnt++;
    87fa:	ab40      	st.h      	r2, (r3, 0x0)
				if(led_reverse_flag == 0 && time_cnt >= 2) {
    87fc:	0f79      	bf      	0x86ee	// 86ee <app_status_handle_process+0xba>
				} else if(led_reverse_flag == 1 && time_cnt >= 2)
    87fe:	3941      	cmpnei      	r1, 1
    8800:	0b3f      	bt      	0x867e	// 867e <app_status_handle_process+0x4a>
    8802:	3a01      	cmphsi      	r2, 2
    8804:	0f3d      	bf      	0x867e	// 867e <app_status_handle_process+0x4a>
					time_cnt = 0;
    8806:	3200      	movi      	r2, 0
    8808:	ab40      	st.h      	r2, (r3, 0x0)
					led_reverse_flag = 0;
    880a:	a343      	st.b      	r2, (r3, 0x3)
    880c:	077f      	br      	0x870a	// 870a <app_status_handle_process+0xd6>
			cur_status = app_status;
    880e:	330b      	movi      	r3, 11
    8810:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    8812:	9462      	ld.w      	r3, (r4, 0x8)
    8814:	3b4b      	cmpnei      	r3, 11
    8816:	1055      	lrw      	r2, 0x2000027a	// 8868 <app_status_handle_process+0x234>
			if(cur_status != pre_status)
    8818:	0c15      	bf      	0x8842	// 8842 <app_status_handle_process+0x20e>
				time_cnt = 0;
    881a:	3300      	movi      	r3, 0
    881c:	aa60      	st.h      	r3, (r2, 0x0)
				app_blue_led_turn_solid();
    881e:	e3fffe87 	bsr      	0x852c	// 852c <app_blue_led_turn_solid>
    8822:	072e      	br      	0x867e	// 867e <app_status_handle_process+0x4a>
			cur_status = app_status;
    8824:	330c      	movi      	r3, 12
    8826:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    8828:	9462      	ld.w      	r3, (r4, 0x8)
    882a:	3b4c      	cmpnei      	r3, 12
    882c:	07f5      	br      	0x8816	// 8816 <app_status_handle_process+0x1e2>
			cur_status = app_status;
    882e:	330d      	movi      	r3, 13
    8830:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    8832:	9462      	ld.w      	r3, (r4, 0x8)
    8834:	3b4d      	cmpnei      	r3, 13
    8836:	07f0      	br      	0x8816	// 8816 <app_status_handle_process+0x1e2>
			cur_status = app_status;
    8838:	330e      	movi      	r3, 14
    883a:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    883c:	9462      	ld.w      	r3, (r4, 0x8)
    883e:	3b4e      	cmpnei      	r3, 14
    8840:	07eb      	br      	0x8816	// 8816 <app_status_handle_process+0x1e2>
				time_cnt++;
    8842:	8a60      	ld.h      	r3, (r2, 0x0)
    8844:	2300      	addi      	r3, 1
    8846:	74cd      	zexth      	r3, r3
				if(time_cnt >= 10) {
    8848:	3b09      	cmphsi      	r3, 10
    884a:	0790      	br      	0x876a	// 876a <app_status_handle_process+0x136>
					time_cnt = 0;
    884c:	3300      	movi      	r3, 0
    884e:	aa60      	st.h      	r3, (r2, 0x0)
					app_close_all_led();
    8850:	e3fffe2e 	bsr      	0x84ac	// 84ac <app_close_all_led>
					app_status = APP_STATUS_INDICATION_NUM;
    8854:	3310      	movi      	r3, 16
    8856:	b460      	st.w      	r3, (r4, 0x0)
    8858:	0713      	br      	0x867e	// 867e <app_status_handle_process+0x4a>
			pre_status = app_status;
    885a:	330f      	movi      	r3, 15
    885c:	0730      	br      	0x86bc	// 86bc <app_status_handle_process+0x88>
			pre_status = app_status;
    885e:	b302      	st.w      	r0, (r3, 0x8)
			break;
    8860:	072f      	br      	0x86be	// 86be <app_status_handle_process+0x8a>
    8862:	0000      	bkpt
    8864:	200001ac 	.long	0x200001ac
    8868:	2000027a 	.long	0x2000027a

Disassembly of section .text.timer_count:

0000886c <timer_count>:
static volatile U16_T Time5sCnt;
static volatile U16_T Time10sCnt;
volatile U8_T TimerFlag;

void timer_count(void)
{
    886c:	14d2      	push      	r4-r5, r15
	TimerFlag |= TIMER_1MS_FLAG;
    886e:	11ae      	lrw      	r5, 0x20000348	// 8924 <timer_count+0xb8>
    8870:	8560      	ld.b      	r3, (r5, 0x0)
    8872:	3ba1      	bseti      	r3, 1
    8874:	a560      	st.b      	r3, (r5, 0x0)
	Time1msCnt++;
    8876:	118d      	lrw      	r4, 0x2000027e	// 8928 <timer_count+0xbc>
    8878:	8c60      	ld.h      	r3, (r4, 0x0)
    887a:	2300      	addi      	r3, 1
    887c:	74cd      	zexth      	r3, r3
    887e:	ac60      	st.h      	r3, (r4, 0x0)
	
	if(Time1msCnt >= 10)
    8880:	8c60      	ld.h      	r3, (r4, 0x0)
    8882:	74cd      	zexth      	r3, r3
    8884:	3b09      	cmphsi      	r3, 10
    8886:	0c4d      	bf      	0x8920	// 8920 <timer_count+0xb4>
	{
		Time1msCnt = 0;
    8888:	3300      	movi      	r3, 0
    888a:	ac60      	st.h      	r3, (r4, 0x0)
		TimerFlag |= TIMER_10MS_FLAG;
    888c:	8560      	ld.b      	r3, (r5, 0x0)
    888e:	3ba2      	bseti      	r3, 2
    8890:	a560      	st.b      	r3, (r5, 0x0)
		Time10msCnt++;
    8892:	8c61      	ld.h      	r3, (r4, 0x2)
    8894:	2300      	addi      	r3, 1
    8896:	74cd      	zexth      	r3, r3
    8898:	ac61      	st.h      	r3, (r4, 0x2)
		
		if(Time10msCnt >= 5)
    889a:	8c61      	ld.h      	r3, (r4, 0x2)
    889c:	74cd      	zexth      	r3, r3
    889e:	3b04      	cmphsi      	r3, 5
    88a0:	0c40      	bf      	0x8920	// 8920 <timer_count+0xb4>
		{
			Time10msCnt = 0;
    88a2:	3300      	movi      	r3, 0
    88a4:	ac61      	st.h      	r3, (r4, 0x2)
			TimerFlag |= TIMER_50MS_FLAG;
    88a6:	8560      	ld.b      	r3, (r5, 0x0)
    88a8:	3ba3      	bseti      	r3, 3
    88aa:	a560      	st.b      	r3, (r5, 0x0)
			Time50msCnt++;
    88ac:	8c62      	ld.h      	r3, (r4, 0x4)
    88ae:	2300      	addi      	r3, 1
    88b0:	74cd      	zexth      	r3, r3
    88b2:	ac62      	st.h      	r3, (r4, 0x4)
			key_debounce_handler();
    88b4:	e3fff638 	bsr      	0x7524	// 7524 <key_debounce_handler>
			
			if(Time50msCnt >= 2)
    88b8:	8c62      	ld.h      	r3, (r4, 0x4)
    88ba:	74cd      	zexth      	r3, r3
    88bc:	3b01      	cmphsi      	r3, 2
    88be:	0c31      	bf      	0x8920	// 8920 <timer_count+0xb4>
			{
				Time50msCnt = 0;
    88c0:	3300      	movi      	r3, 0
    88c2:	ac62      	st.h      	r3, (r4, 0x4)
				TimerFlag |= TIMER_100MS_FLAG;
    88c4:	8560      	ld.b      	r3, (r5, 0x0)
    88c6:	3ba4      	bseti      	r3, 4
    88c8:	a560      	st.b      	r3, (r5, 0x0)
				Time100msCnt++;
    88ca:	8c63      	ld.h      	r3, (r4, 0x6)
    88cc:	2300      	addi      	r3, 1
    88ce:	74cd      	zexth      	r3, r3
    88d0:	ac63      	st.h      	r3, (r4, 0x6)
				
				if(Time100msCnt >= 10)
    88d2:	8c63      	ld.h      	r3, (r4, 0x6)
    88d4:	74cd      	zexth      	r3, r3
    88d6:	3b09      	cmphsi      	r3, 10
    88d8:	0c24      	bf      	0x8920	// 8920 <timer_count+0xb4>
				{
					Time100msCnt = 0;
    88da:	3300      	movi      	r3, 0
    88dc:	ac63      	st.h      	r3, (r4, 0x6)
					TimerFlag |= TIMER_1S_FLAG;
    88de:	8560      	ld.b      	r3, (r5, 0x0)
    88e0:	3ba5      	bseti      	r3, 5
    88e2:	a560      	st.b      	r3, (r5, 0x0)
					Time1sCnt++;
    88e4:	8c64      	ld.h      	r3, (r4, 0x8)
    88e6:	2300      	addi      	r3, 1
    88e8:	74cd      	zexth      	r3, r3
    88ea:	ac64      	st.h      	r3, (r4, 0x8)
					
					if(Time1sCnt >= 5)
    88ec:	8c64      	ld.h      	r3, (r4, 0x8)
    88ee:	74cd      	zexth      	r3, r3
    88f0:	3b04      	cmphsi      	r3, 5
    88f2:	0c17      	bf      	0x8920	// 8920 <timer_count+0xb4>
					{
						Time1sCnt = 0;
    88f4:	3300      	movi      	r3, 0
    88f6:	ac64      	st.h      	r3, (r4, 0x8)
						TimerFlag |= TIMER_5S_FLAG;
    88f8:	8560      	ld.b      	r3, (r5, 0x0)
    88fa:	3ba6      	bseti      	r3, 6
    88fc:	a560      	st.b      	r3, (r5, 0x0)
						Time5sCnt++;
    88fe:	8c65      	ld.h      	r3, (r4, 0xa)
    8900:	2300      	addi      	r3, 1
    8902:	74cd      	zexth      	r3, r3
    8904:	ac65      	st.h      	r3, (r4, 0xa)
						
						if(Time5sCnt >= 2)
    8906:	8c65      	ld.h      	r3, (r4, 0xa)
    8908:	74cd      	zexth      	r3, r3
    890a:	3b01      	cmphsi      	r3, 2
    890c:	0c0a      	bf      	0x8920	// 8920 <timer_count+0xb4>
						{
							Time5sCnt = 0;
    890e:	3300      	movi      	r3, 0
    8910:	ac65      	st.h      	r3, (r4, 0xa)
							TimerFlag |= TIMER_10S_FLAG;
    8912:	8560      	ld.b      	r3, (r5, 0x0)
    8914:	3ba7      	bseti      	r3, 7
    8916:	a560      	st.b      	r3, (r5, 0x0)
							Time10sCnt++;
    8918:	8c66      	ld.h      	r3, (r4, 0xc)
    891a:	2300      	addi      	r3, 1
    891c:	74cd      	zexth      	r3, r3
    891e:	ac66      	st.h      	r3, (r4, 0xc)
					}
				}
			}
		}
	}
}
    8920:	1492      	pop      	r4-r5, r15
    8922:	0000      	bkpt
    8924:	20000348 	.long	0x20000348
    8928:	2000027e 	.long	0x2000027e

Disassembly of section .text.LPTIntHandler:

0000892c <LPTIntHandler>:

/* LPT Interrupt */
void LPTIntHandler(void) 
{
    892c:	1460      	nie
    892e:	1462      	ipush
    8930:	14d0      	push      	r15
	if((LPT->MISR & LPT_PEND) == LPT_PEND)
    8932:	106f      	lrw      	r3, 0x20000018	// 896c <LPTIntHandler+0x40>
    8934:	3104      	movi      	r1, 4
    8936:	9360      	ld.w      	r3, (r3, 0x0)
    8938:	934e      	ld.w      	r2, (r3, 0x38)
    893a:	6884      	and      	r2, r1
    893c:	3a40      	cmpnei      	r2, 0
    893e:	0c09      	bf      	0x8950	// 8950 <LPTIntHandler+0x24>
	{
		LPT->ICR = LPT_PEND;
    8940:	b330      	st.w      	r1, (r3, 0x40)
		timer_count();
    8942:	e3ffff95 	bsr      	0x886c	// 886c <timer_count>
	} 
	else if((LPT->MISR & LPT_MATCH) == LPT_MATCH)
	{
		LPT->ICR = LPT_MATCH;
	}
}
    8946:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    894a:	1401      	addi      	r14, r14, 4
    894c:	1463      	ipop
    894e:	1461      	nir
	else if((LPT->MISR & LPT_TRGEV0) == LPT_TRGEV0)
    8950:	934e      	ld.w      	r2, (r3, 0x38)
    8952:	3101      	movi      	r1, 1
    8954:	6884      	and      	r2, r1
    8956:	3a40      	cmpnei      	r2, 0
    8958:	0c03      	bf      	0x895e	// 895e <LPTIntHandler+0x32>
		LPT->ICR = LPT_MATCH;
    895a:	b330      	st.w      	r1, (r3, 0x40)
}
    895c:	07f5      	br      	0x8946	// 8946 <LPTIntHandler+0x1a>
	else if((LPT->MISR & LPT_MATCH) == LPT_MATCH)
    895e:	934e      	ld.w      	r2, (r3, 0x38)
    8960:	3102      	movi      	r1, 2
    8962:	6884      	and      	r2, r1
    8964:	3a40      	cmpnei      	r2, 0
    8966:	0bfa      	bt      	0x895a	// 895a <LPTIntHandler+0x2e>
    8968:	07ef      	br      	0x8946	// 8946 <LPTIntHandler+0x1a>
    896a:	0000      	bkpt
    896c:	20000018 	.long	0x20000018

Disassembly of section .text.Coret_Init:

00008970 <Coret_Init>:
  *@函数返回值：void
  *@函数说明：
    1.CORETCLK = SYSCLK / 8
  */
void Coret_Init(void)
{
    8970:	14d0      	push      	r15
	SYSCON_General_CMD(ENABLE, ENDIS_SYSTICK); /* 打开CORET时钟 */
    8972:	3180      	movi      	r1, 128
    8974:	4124      	lsli      	r1, r1, 4
    8976:	3001      	movi      	r0, 1
    8978:	e3ffdff4 	bsr      	0x4960	// 4960 <SYSCON_General_CMD>
	
	CORET_DeInit();
    897c:	e3ffe148 	bsr      	0x4c0c	// 4c0c <CORET_DeInit>
	CORET_CLKSOURCE_EX(); /* 时钟源为(CORECLK/8) */													
    8980:	e3ffe168 	bsr      	0x4c50	// 4c50 <CORET_CLKSOURCE_EX>
	CORET_TICKINT_Enable(); /* 使能计数到0的中断 */	
    8984:	e3ffe16e 	bsr      	0x4c60	// 4c60 <CORET_TICKINT_Enable>
	CORET_reload(); /* 清零计数器，同时清零“计数到0”状态位 */
    8988:	e3ffe174 	bsr      	0x4c70	// 4c70 <CORET_reload>
	CORET_stop(); /* 停止计时 */
    898c:	e3ffe15a 	bsr      	0x4c40	// 4c40 <CORET_stop>
	
	CORET_Int_Disable(); /* 禁止NVIC响应中断 */			
    8990:	e3ffe14a 	bsr      	0x4c24	// 4c24 <CORET_Int_Disable>
}
    8994:	1490      	pop      	r15

Disassembly of section .text.StartTimer:

00008998 <StartTimer>:

void StartTimer(U32_T cnt)
{
    8998:	14d1      	push      	r4, r15
	CK801->CORET_RVR = cnt; /* 加载预重载值 */	
    899a:	1089      	lrw      	r4, 0x20000064	// 89bc <StartTimer+0x24>
    899c:	9460      	ld.w      	r3, (r4, 0x0)
    899e:	b305      	st.w      	r0, (r3, 0x14)
	CORET_reload(); /* 清零计数器，同时清零“计数到0”状态位 */
    89a0:	e3ffe168 	bsr      	0x4c70	// 4c70 <CORET_reload>
	CORET_start(); /* 开始计时 */
    89a4:	e3ffe146 	bsr      	0x4c30	// 4c30 <CORET_start>
	while((CK801->CORET_CSR & (1 << 16)) == 0); /* 等待计数到0 */
    89a8:	3280      	movi      	r2, 128
    89aa:	9420      	ld.w      	r1, (r4, 0x0)
    89ac:	4249      	lsli      	r2, r2, 9
    89ae:	9164      	ld.w      	r3, (r1, 0x10)
    89b0:	68c8      	and      	r3, r2
    89b2:	3b40      	cmpnei      	r3, 0
    89b4:	0ffd      	bf      	0x89ae	// 89ae <StartTimer+0x16>
	CORET_stop(); /* 停止计时 */
    89b6:	e3ffe145 	bsr      	0x4c40	// 4c40 <CORET_stop>
}
    89ba:	1491      	pop      	r4, r15
    89bc:	20000064 	.long	0x20000064

Disassembly of section .text.Coret_DelayMs:

000089c0 <Coret_DelayMs>:
  *@函数返回值：void
  *@函数说明：
    1.nus = (CORET_RVR + 1) / 1000 * (1 / CORETCLK)
  */
void Coret_DelayMs(U64_T nms)
{
    89c0:	14d4      	push      	r4-r7, r15
    89c2:	1423      	subi      	r14, r14, 12
	U64_T cnt, CntInteg, CntRemain;
	
	CORETCLK = SYSCLK / 8;
    89c4:	1165      	lrw      	r3, 0x20000000	// 8a58 <Coret_DelayMs+0x98>
{
    89c6:	6d03      	mov      	r4, r0
    89c8:	6d47      	mov      	r5, r1
	CORETCLK = SYSCLK / 8;
    89ca:	9360      	ld.w      	r3, (r3, 0x0)
    89cc:	4b63      	lsri      	r3, r3, 3
    89ce:	1124      	lrw      	r1, 0x2000034c	// 8a5c <Coret_DelayMs+0x9c>
    89d0:	b160      	st.w      	r3, (r1, 0x0)
	cnt = CORETCLK * nms / 1000;
    89d2:	9100      	ld.w      	r0, (r1, 0x0)
    89d4:	6c93      	mov      	r2, r4
    89d6:	6cd7      	mov      	r3, r5
    89d8:	3100      	movi      	r1, 0
    89da:	e3ffcc03 	bsr      	0x21e0	// 21e0 <__muldi3>
    89de:	32fa      	movi      	r2, 250
    89e0:	4242      	lsli      	r2, r2, 2
    89e2:	3300      	movi      	r3, 0
    89e4:	6d03      	mov      	r4, r0
    89e6:	6d47      	mov      	r5, r1
    89e8:	e3ffcc3a 	bsr      	0x225c	// 225c <__udivdi3>
	
	if(cnt > 16777215)
    89ec:	3940      	cmpnei      	r1, 0
	cnt = CORETCLK * nms / 1000;
    89ee:	6d83      	mov      	r6, r0
    89f0:	6dc7      	mov      	r7, r1
	if(cnt > 16777215)
    89f2:	0804      	bt      	0x89fa	// 89fa <Coret_DelayMs+0x3a>
    89f4:	107b      	lrw      	r3, 0xffffff	// 8a60 <Coret_DelayMs+0xa0>
    89f6:	640c      	cmphs      	r3, r0
    89f8:	0821      	bt      	0x8a3a	// 8a3a <Coret_DelayMs+0x7a>
	{
		CntInteg = cnt / 16777215;
    89fa:	105b      	lrw      	r2, 0xe7fffc18	// 8a64 <Coret_DelayMs+0xa4>
    89fc:	3303      	movi      	r3, 3
    89fe:	6c13      	mov      	r0, r4
    8a00:	6c57      	mov      	r1, r5
    8a02:	e3ffcc2d 	bsr      	0x225c	// 225c <__udivdi3>
    8a06:	6d03      	mov      	r4, r0
    8a08:	6d47      	mov      	r5, r1
		CntRemain = cnt % 16777215;
    8a0a:	1056      	lrw      	r2, 0xffffff	// 8a60 <Coret_DelayMs+0xa0>
    8a0c:	3300      	movi      	r3, 0
    8a0e:	6c1b      	mov      	r0, r6
    8a10:	6c5f      	mov      	r1, r7
    8a12:	e3ffcdfb 	bsr      	0x2608	// 2608 <__umoddi3>
		
		while(CntInteg--) StartTimer(16777215);
    8a16:	3600      	movi      	r6, 0
    8a18:	3700      	movi      	r7, 0
    8a1a:	3300      	movi      	r3, 0
		CntRemain = cnt % 16777215;
    8a1c:	6c83      	mov      	r2, r0
		while(CntInteg--) StartTimer(16777215);
    8a1e:	2e00      	subi      	r6, 1
    8a20:	2f00      	subi      	r7, 1
    8a22:	2b00      	subi      	r3, 1
    8a24:	6511      	cmplt      	r4, r4
    8a26:	6119      	addc      	r4, r6
    8a28:	615d      	addc      	r5, r7
    8a2a:	64d2      	cmpne      	r4, r3
    8a2c:	080b      	bt      	0x8a42	// 8a42 <Coret_DelayMs+0x82>
    8a2e:	64d6      	cmpne      	r5, r3
    8a30:	0809      	bt      	0x8a42	// 8a42 <Coret_DelayMs+0x82>
		if(CntRemain != 0) StartTimer(CntRemain);
    8a32:	6c48      	or      	r1, r2
    8a34:	3940      	cmpnei      	r1, 0
    8a36:	0c04      	bf      	0x8a3e	// 8a3e <Coret_DelayMs+0x7e>
    8a38:	6c0b      	mov      	r0, r2
	}else StartTimer(cnt);
    8a3a:	e3ffffaf 	bsr      	0x8998	// 8998 <StartTimer>
}
    8a3e:	1403      	addi      	r14, r14, 12
    8a40:	1494      	pop      	r4-r7, r15
		while(CntInteg--) StartTimer(16777215);
    8a42:	1008      	lrw      	r0, 0xffffff	// 8a60 <Coret_DelayMs+0xa0>
    8a44:	b822      	st.w      	r1, (r14, 0x8)
    8a46:	b841      	st.w      	r2, (r14, 0x4)
    8a48:	b860      	st.w      	r3, (r14, 0x0)
    8a4a:	e3ffffa7 	bsr      	0x8998	// 8998 <StartTimer>
    8a4e:	9822      	ld.w      	r1, (r14, 0x8)
    8a50:	9841      	ld.w      	r2, (r14, 0x4)
    8a52:	9860      	ld.w      	r3, (r14, 0x0)
    8a54:	07e8      	br      	0x8a24	// 8a24 <Coret_DelayMs+0x64>
    8a56:	0000      	bkpt
    8a58:	20000000 	.long	0x20000000
    8a5c:	2000034c 	.long	0x2000034c
    8a60:	00ffffff 	.long	0x00ffffff
    8a64:	e7fffc18 	.long	0xe7fffc18
