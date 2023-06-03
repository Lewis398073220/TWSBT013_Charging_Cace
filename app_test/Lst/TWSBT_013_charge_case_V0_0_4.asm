
E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test//Obj/TWSBT_013_charge_case_V0_0_4.elf:     file format elf32-csky-little


Disassembly of section .text:

00002000 <vector_table>:
    2000:	00002108 	.long	0x00002108
    2004:	00006806 	.long	0x00006806
    2008:	000067f6 	.long	0x000067f6
    200c:	00002180 	.long	0x00002180
    2010:	000067fe 	.long	0x000067fe
    2014:	000067bc 	.long	0x000067bc
    2018:	00002180 	.long	0x00002180
    201c:	000067ee 	.long	0x000067ee
    2020:	000067e6 	.long	0x000067e6
    2024:	00002180 	.long	0x00002180
    2028:	00002180 	.long	0x00002180
    202c:	00002180 	.long	0x00002180
    2030:	00002180 	.long	0x00002180
    2034:	00002180 	.long	0x00002180
    2038:	00002180 	.long	0x00002180
    203c:	00002180 	.long	0x00002180
    2040:	000067de 	.long	0x000067de
    2044:	000067d6 	.long	0x000067d6
    2048:	000067ce 	.long	0x000067ce
    204c:	000067c6 	.long	0x000067c6
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
    207c:	000067be 	.long	0x000067be
    2080:	000060bc 	.long	0x000060bc
    2084:	000060d4 	.long	0x000060d4
    2088:	000061b8 	.long	0x000061b8
    208c:	0000681e 	.long	0x0000681e
    2090:	00006c5c 	.long	0x00006c5c
    2094:	00002180 	.long	0x00002180
    2098:	000064b4 	.long	0x000064b4
    209c:	00008584 	.long	0x00008584
    20a0:	00007124 	.long	0x00007124
    20a4:	00006364 	.long	0x00006364
    20a8:	00002180 	.long	0x00002180
    20ac:	00002180 	.long	0x00002180
    20b0:	00006548 	.long	0x00006548
    20b4:	000065b8 	.long	0x000065b8
    20b8:	00006604 	.long	0x00006604
    20bc:	00007194 	.long	0x00007194
    20c0:	00002180 	.long	0x00002180
    20c4:	00006694 	.long	0x00006694
    20c8:	00002180 	.long	0x00002180
    20cc:	000066a8 	.long	0x000066a8
    20d0:	000066e4 	.long	0x000066e4
    20d4:	0000850c 	.long	0x0000850c
    20d8:	00007144 	.long	0x00007144
    20dc:	00006768 	.long	0x00006768
    20e0:	00006816 	.long	0x00006816
    20e4:	0000680e 	.long	0x0000680e
    20e8:	00008a48 	.long	0x00008a48
    20ec:	00002180 	.long	0x00002180
    20f0:	000062a4 	.long	0x000062a4
    20f4:	00006500 	.long	0x00006500
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
    214e:	1013      	lrw      	r0, 0x6828	// 2198 <DummyHandler+0x18>
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
    2198:	00006828 	.long	0x00006828
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
    2286:	0100      	lrw      	r0, 0x8d18	// 2600 <__udivdi3+0x3a4>
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
    22ac:	e0002458 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    22b0:	b801      	st.w      	r0, (r14, 0x4)
    22b2:	6c53      	mov      	r1, r4
    22b4:	6c17      	mov      	r0, r5
    22b6:	e000242f 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    22e6:	e000243b 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    22ea:	9862      	ld.w      	r3, (r14, 0x8)
    22ec:	b801      	st.w      	r0, (r14, 0x4)
    22ee:	6c53      	mov      	r1, r4
    22f0:	6c0f      	mov      	r0, r3
    22f2:	e0002411 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    233a:	020d      	lrw      	r0, 0x8d18	// 2600 <__udivdi3+0x3a4>
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
    2364:	e00023d8 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    237c:	023e      	lrw      	r1, 0x8d18	// 2600 <__udivdi3+0x3a4>
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
    239c:	e00023e0 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    23a0:	b802      	st.w      	r0, (r14, 0x8)
    23a2:	6c57      	mov      	r1, r5
    23a4:	6c13      	mov      	r0, r4
    23a6:	e00023b7 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    23d4:	e00023c4 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    23d8:	9863      	ld.w      	r3, (r14, 0xc)
    23da:	6c57      	mov      	r1, r5
    23dc:	b802      	st.w      	r0, (r14, 0x8)
    23de:	6c0f      	mov      	r0, r3
    23e0:	e000239a 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    2466:	e000237b 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    246a:	9864      	ld.w      	r3, (r14, 0x10)
    246c:	6d83      	mov      	r6, r0
    246e:	6c57      	mov      	r1, r5
    2470:	6c0f      	mov      	r0, r3
    2472:	e0002351 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    249e:	e000235f 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    24a2:	b804      	st.w      	r0, (r14, 0x10)
    24a4:	6c57      	mov      	r1, r5
    24a6:	6c1b      	mov      	r0, r6
    24a8:	e0002336 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    252e:	e0002317 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    2532:	9862      	ld.w      	r3, (r14, 0x8)
    2534:	6d03      	mov      	r4, r0
    2536:	6c57      	mov      	r1, r5
    2538:	6c0f      	mov      	r0, r3
    253a:	e00022ed 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    256c:	e00022f8 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    2570:	6dc3      	mov      	r7, r0
    2572:	6c57      	mov      	r1, r5
    2574:	6c13      	mov      	r0, r4
    2576:	e00022cf 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    2600:	00008d18 	.long	0x00008d18
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
    2634:	01c4      	lrw      	r6, 0x8d18	// 29a0 <__umoddi3+0x398>
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
    2662:	e000227d 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    2666:	9862      	ld.w      	r3, (r14, 0x8)
    2668:	6d43      	mov      	r5, r0
    266a:	6c53      	mov      	r1, r4
    266c:	6c0f      	mov      	r0, r3
    266e:	e0002253 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    2696:	e0002263 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    269a:	9862      	ld.w      	r3, (r14, 0x8)
    269c:	6d43      	mov      	r5, r0
    269e:	6c53      	mov      	r1, r4
    26a0:	6c0f      	mov      	r0, r3
    26a2:	e0002239 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    26e6:	02f0      	lrw      	r7, 0x8d18	// 29a0 <__umoddi3+0x398>
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
    2716:	e00021ff 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    272e:	0322      	lrw      	r1, 0x8d18	// 29a0 <__umoddi3+0x398>
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
    274e:	e0002207 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    2752:	6d43      	mov      	r5, r0
    2754:	6c5f      	mov      	r1, r7
    2756:	6c13      	mov      	r0, r4
    2758:	e00021de 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    277e:	e00021ef 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    2782:	6d43      	mov      	r5, r0
    2784:	6c5f      	mov      	r1, r7
    2786:	6c13      	mov      	r0, r4
    2788:	e00021c6 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    2800:	e00021ae 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    2804:	9846      	ld.w      	r2, (r14, 0x18)
    2806:	b805      	st.w      	r0, (r14, 0x14)
    2808:	6c53      	mov      	r1, r4
    280a:	6c0b      	mov      	r0, r2
    280c:	e0002184 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    2838:	e0002192 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    283c:	9866      	ld.w      	r3, (r14, 0x18)
    283e:	6c53      	mov      	r1, r4
    2840:	b805      	st.w      	r0, (r14, 0x14)
    2842:	6c0f      	mov      	r0, r3
    2844:	e0002168 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    28e8:	e000213a 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    28ec:	9863      	ld.w      	r3, (r14, 0xc)
    28ee:	6d43      	mov      	r5, r0
    28f0:	6c5f      	mov      	r1, r7
    28f2:	6c0f      	mov      	r0, r3
    28f4:	e0002110 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    291a:	e0002121 	bsr      	0x6b5c	// 6b5c <__umodsi3>
    291e:	6d03      	mov      	r4, r0
    2920:	6c5f      	mov      	r1, r7
    2922:	6c17      	mov      	r0, r5
    2924:	e00020f8 	bsr      	0x6b14	// 6b14 <__udivsi3>
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
    29a0:	00008d18 	.long	0x00008d18
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
    2ab2:	1010      	lrw      	r0, 0x8cf4	// 2af0 <_fpadd_parts+0x148>
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
    2af0:	00008cf4 	.long	0x00008cf4

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
    2bd6:	100e      	lrw      	r0, 0x8cf4	// 2c0c <__divsf3+0xb8>
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
    2c0c:	00008cf4 	.long	0x00008cf4

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
    2ea0:	111d      	lrw      	r0, 0x8d04	// 2f94 <_fpadd_parts+0x2d0>
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
    2f94:	00008d04 	.long	0x00008d04

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
    31e0:	1013      	lrw      	r0, 0x8d04	// 322c <__muldf3+0x22c>
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
    322c:	00008d04 	.long	0x00008d04
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
    332e:	1016      	lrw      	r0, 0x8d04	// 3384 <__divdf3+0x150>
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
    3384:	00008d04 	.long	0x00008d04

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
    34a6:	1048      	lrw      	r2, 0x8d18	// 34c4 <__clzsi2+0x3c>
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
    34c4:	00008d18 	.long	0x00008d18

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
    3916:	1085      	lrw      	r4, 0x200001f4	// 3928 <__GI_puts+0x14>
    3918:	9420      	ld.w      	r1, (r4, 0x0)
    391a:	e0000033 	bsr      	0x3980	// 3980 <__GI_fputs>
    391e:	9420      	ld.w      	r1, (r4, 0x0)
    3920:	300a      	movi      	r0, 10
    3922:	e0001349 	bsr      	0x5fb4	// 5fb4 <fputc>
    3926:	1491      	pop      	r4, r15
    3928:	200001f4 	.long	0x200001f4

0000392c <__stdio_outs>:
    392c:	14d3      	push      	r4-r6, r15
    392e:	10ac      	lrw      	r5, 0x200001f4	// 395c <__stdio_outs+0x30>
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
    3952:	e0001331 	bsr      	0x5fb4	// 5fb4 <fputc>
    3956:	2400      	addi      	r4, 1
    3958:	07f3      	br      	0x393e	// 393e <__stdio_outs+0x12>
    395a:	0000      	bkpt
    395c:	200001f4 	.long	0x200001f4

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
    39ba:	e00012fd 	bsr      	0x5fb4	// 5fb4 <fputc>
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
    3dbc:	0195      	lrw      	r4, 0x932a	// 40e4 <__v2_printf+0x574>
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
    3e0c:	0228      	lrw      	r1, 0x9319	// 40e8 <__v2_printf+0x578>
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
    3eea:	033e      	lrw      	r1, 0x2000036c	// 40ec <__v2_printf+0x57c>
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
    4068:	103f      	lrw      	r1, 0x932a	// 40e4 <__v2_printf+0x574>
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
    40e4:	0000932a 	.long	0x0000932a
    40e8:	00009319 	.long	0x00009319
    40ec:	2000036c 	.long	0x2000036c
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
    41e8:	1129      	lrw      	r1, 0x8e18	// 428c <__v2_printf+0x71c>
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
    4236:	1037      	lrw      	r1, 0x8e28	// 4290 <__v2_printf+0x720>
    4238:	e3fffc82 	bsr      	0x3b3c	// 3b3c <PAD.1851>
    423c:	5d19      	subu      	r0, r5, r6
    423e:	1b0c      	addi      	r3, r14, 48
    4240:	3510      	movi      	r5, 16
    4242:	614c      	addu      	r5, r3
    4244:	6f57      	mov      	r13, r5
    4246:	6d77      	mov      	r5, r13
    4248:	1032      	lrw      	r1, 0x8e28	// 4290 <__v2_printf+0x720>
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
    426a:	1029      	lrw      	r1, 0x8e18	// 428c <__v2_printf+0x71c>
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
    428c:	00008e18 	.long	0x00008e18
    4290:	00008e28 	.long	0x00008e28

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
    42d4:	0244      	lrw      	r2, 0x933b	// 45c0 <__GI___dtostr+0x306>
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
    42f4:	024b      	lrw      	r2, 0x933f	// 45c4 <__GI___dtostr+0x30a>
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
    4532:	e00012df 	bsr      	0x6af0	// 6af0 <__divsi3>
    4536:	202f      	addi      	r0, 48
    4538:	a500      	st.b      	r0, (r5, 0x0)
    453a:	2500      	addi      	r5, 1
    453c:	6c5f      	mov      	r1, r7
    453e:	9808      	ld.w      	r0, (r14, 0x20)
    4540:	e00012fc 	bsr      	0x6b38	// 6b38 <__modsi3>
    4544:	2c00      	subi      	r4, 1
    4546:	b808      	st.w      	r0, (r14, 0x20)
    4548:	3100      	movi      	r1, 0
    454a:	b823      	st.w      	r1, (r14, 0xc)
    454c:	6c1f      	mov      	r0, r7
    454e:	310a      	movi      	r1, 10
    4550:	2e00      	subi      	r6, 1
    4552:	e00012cf 	bsr      	0x6af0	// 6af0 <__divsi3>
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
    45c0:	0000933b 	.long	0x0000933b
    45c4:	0000933f 	.long	0x0000933f
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
    46f0:	1023      	lrw      	r1, 0x8e38	// 46fc <__GI_strerror+0x14>
    46f2:	6004      	addu      	r0, r1
    46f4:	9000      	ld.w      	r0, (r0, 0x0)
    46f6:	783c      	jmp      	r15
    46f8:	1002      	lrw      	r0, 0x9118	// 4700 <__GI_strerror+0x18>
    46fa:	07fe      	br      	0x46f6	// 46f6 <__GI_strerror+0xe>
    46fc:	00008e38 	.long	0x00008e38
    4700:	00009118 	.long	0x00009118

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
    485c:	1029      	lrw      	r1, 0x9acc	// 4880 <__main+0x28>
    485e:	6442      	cmpne      	r0, r1
    4860:	0c05      	bf      	0x486a	// 486a <__main+0x12>
//    __memcpy_fast( dst, src, (_end_data - _start_data));
    memcpy( dst, src, (_end_data - _start_data));
    4862:	1049      	lrw      	r2, 0x20000234	// 4884 <__main+0x2c>
    4864:	6082      	subu      	r2, r0
    4866:	e3fff931 	bsr      	0x3ac8	// 3ac8 <__memcpy_fast>
  }

  /* zero the bss 
   */
  if( _ebss - _bss_start ) {
    486a:	1048      	lrw      	r2, 0x20000374	// 4888 <__main+0x30>
    486c:	1008      	lrw      	r0, 0x20000234	// 488c <__main+0x34>
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
    4880:	00009acc 	.long	0x00009acc
    4884:	20000234 	.long	0x20000234
    4888:	20000374 	.long	0x20000374
    488c:	20000234 	.long	0x20000234

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

Disassembly of section .text.UART2_Int_Disable:

00005228 <UART2_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART2_Int_Disable(void)
{
    INTC_ICER_WRITE(UART2_INT);							//INT Vector Enable UART0/1 Interrupt in CK802
    5228:	3380      	movi      	r3, 128
    522a:	4368      	lsli      	r3, r3, 8
    522c:	1042      	lrw      	r2, 0xe000e180	// 5234 <UART2_Int_Disable+0xc>
    522e:	b260      	st.w      	r3, (r2, 0x0)
}
    5230:	783c      	jmp      	r15
    5232:	0000      	bkpt
    5234:	e000e180 	.long	0xe000e180

Disassembly of section .text.UART1_WakeUp_Enable:

00005238 <UART1_WakeUp_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART1_WakeUp_Enable(void)
{
    INTC_IWER_WRITE(UART1_INT);    
    5238:	3380      	movi      	r3, 128
    523a:	4367      	lsli      	r3, r3, 7
    523c:	1042      	lrw      	r2, 0xe000e100	// 5244 <UART1_WakeUp_Enable+0xc>
    523e:	b270      	st.w      	r3, (r2, 0x40)
}
    5240:	783c      	jmp      	r15
    5242:	0000      	bkpt
    5244:	e000e100 	.long	0xe000e100

Disassembly of section .text.UART_IO_Init:

00005248 <UART_IO_Init>:
//UART_IO_G:0 1
//ReturnValue:NONE
/*************************************************************/
void UART_IO_Init(UART_NUM_TypeDef IO_UART_NUM , U8_T UART_IO_G)
{
    if (IO_UART_NUM==IO_UART0)
    5248:	3840      	cmpnei      	r0, 0
    524a:	0821      	bt      	0x528c	// 528c <UART_IO_Init+0x44>
    {
		if(UART_IO_G==0)
    524c:	3940      	cmpnei      	r1, 0
    524e:	080a      	bt      	0x5262	// 5262 <UART_IO_Init+0x1a>
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF00)  | 0x00000044;       //PA0.1->RXD0, PA0.0->TXD0
    5250:	1176      	lrw      	r3, 0x20000050	// 5328 <UART_IO_Init+0xe0>
    5252:	31ff      	movi      	r1, 255
    5254:	9340      	ld.w      	r2, (r3, 0x0)
    5256:	9260      	ld.w      	r3, (r2, 0x0)
    5258:	68c5      	andn      	r3, r1
    525a:	3ba2      	bseti      	r3, 2
    525c:	3ba6      	bseti      	r3, 6
    }
	 if (IO_UART_NUM==IO_UART2)
    {
        if(UART_IO_G==0)
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF00)  | 0x00000077;       //PA0.0->RXD2, PA0.1->TXD2
    525e:	b260      	st.w      	r3, (r2, 0x0)
    5260:	0415      	br      	0x528a	// 528a <UART_IO_Init+0x42>
		else if(UART_IO_G==1)
    5262:	3941      	cmpnei      	r1, 1
    5264:	0813      	bt      	0x528a	// 528a <UART_IO_Init+0x42>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF)  | 0x00700000;      //PA0.5->RXD0, PA0.12->TXD0
    5266:	1171      	lrw      	r3, 0x20000050	// 5328 <UART_IO_Init+0xe0>
    5268:	31f0      	movi      	r1, 240
    526a:	9340      	ld.w      	r2, (r3, 0x0)
    526c:	9260      	ld.w      	r3, (r2, 0x0)
    526e:	4130      	lsli      	r1, r1, 16
    5270:	68c5      	andn      	r3, r1
    5272:	31e0      	movi      	r1, 224
    5274:	412f      	lsli      	r1, r1, 15
    5276:	6cc4      	or      	r3, r1
    5278:	b260      	st.w      	r3, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFF0FFFF)  | 0x00070000;      
    527a:	31f0      	movi      	r1, 240
    527c:	9261      	ld.w      	r3, (r2, 0x4)
    527e:	412c      	lsli      	r1, r1, 12
    5280:	68c5      	andn      	r3, r1
    5282:	31e0      	movi      	r1, 224
    5284:	412b      	lsli      	r1, r1, 11
    5286:	6cc4      	or      	r3, r1
    5288:	b261      	st.w      	r3, (r2, 0x4)
		else if(UART_IO_G==2)
		{
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF00FFFF) | 0X00660000;        //PB0.5->RXD2, PB0.4->TXD2
		}
    }
}
    528a:	783c      	jmp      	r15
     if (IO_UART_NUM==IO_UART1)
    528c:	3841      	cmpnei      	r0, 1
    528e:	082b      	bt      	0x52e4	// 52e4 <UART_IO_Init+0x9c>
        if(UART_IO_G==0)
    5290:	3940      	cmpnei      	r1, 0
    5292:	0814      	bt      	0x52ba	// 52ba <UART_IO_Init+0x72>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)  | 0x00000007;       //PA0.13->RXD1, PB0.0->TXD1
    5294:	1166      	lrw      	r3, 0x2000004c	// 532c <UART_IO_Init+0xe4>
    5296:	310f      	movi      	r1, 15
    5298:	9340      	ld.w      	r2, (r3, 0x0)
    529a:	9260      	ld.w      	r3, (r2, 0x0)
    529c:	68c5      	andn      	r3, r1
    529e:	3107      	movi      	r1, 7
    52a0:	6cc4      	or      	r3, r1
    52a2:	b260      	st.w      	r3, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)  | 0x00700000;       
    52a4:	32f0      	movi      	r2, 240
    52a6:	1161      	lrw      	r3, 0x20000050	// 5328 <UART_IO_Init+0xe0>
    52a8:	4250      	lsli      	r2, r2, 16
    52aa:	9320      	ld.w      	r1, (r3, 0x0)
    52ac:	9161      	ld.w      	r3, (r1, 0x4)
    52ae:	68c9      	andn      	r3, r2
    52b0:	32e0      	movi      	r2, 224
    52b2:	424f      	lsli      	r2, r2, 15
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF) | 0X77000000;        //PA0.15->RXD1, PA0.14->TXD1
    52b4:	6cc8      	or      	r3, r2
    52b6:	b161      	st.w      	r3, (r1, 0x4)
    52b8:	07e9      	br      	0x528a	// 528a <UART_IO_Init+0x42>
		else if(UART_IO_G==1)
    52ba:	3941      	cmpnei      	r1, 1
    52bc:	080c      	bt      	0x52d4	// 52d4 <UART_IO_Init+0x8c>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF00FFF) | 0X00077000;        //PA0.4->RXD1, PA0.3->TXD1
    52be:	107b      	lrw      	r3, 0x20000050	// 5328 <UART_IO_Init+0xe0>
    52c0:	32ff      	movi      	r2, 255
    52c2:	9320      	ld.w      	r1, (r3, 0x0)
    52c4:	424c      	lsli      	r2, r2, 12
    52c6:	9160      	ld.w      	r3, (r1, 0x0)
    52c8:	68c9      	andn      	r3, r2
    52ca:	32ee      	movi      	r2, 238
    52cc:	424b      	lsli      	r2, r2, 11
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF00FFFF) | 0X00660000;        //PB0.5->RXD2, PB0.4->TXD2
    52ce:	6cc8      	or      	r3, r2
    52d0:	b160      	st.w      	r3, (r1, 0x0)
}
    52d2:	07dc      	br      	0x528a	// 528a <UART_IO_Init+0x42>
		else if(UART_IO_G==2)
    52d4:	3942      	cmpnei      	r1, 2
    52d6:	0bda      	bt      	0x528a	// 528a <UART_IO_Init+0x42>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF) | 0X77000000;        //PA0.15->RXD1, PA0.14->TXD1
    52d8:	1074      	lrw      	r3, 0x20000050	// 5328 <UART_IO_Init+0xe0>
    52da:	32ee      	movi      	r2, 238
    52dc:	9320      	ld.w      	r1, (r3, 0x0)
    52de:	9161      	ld.w      	r3, (r1, 0x4)
    52e0:	4257      	lsli      	r2, r2, 23
    52e2:	07e9      	br      	0x52b4	// 52b4 <UART_IO_Init+0x6c>
	 if (IO_UART_NUM==IO_UART2)
    52e4:	3842      	cmpnei      	r0, 2
    52e6:	0bd2      	bt      	0x528a	// 528a <UART_IO_Init+0x42>
        if(UART_IO_G==0)
    52e8:	3940      	cmpnei      	r1, 0
    52ea:	0809      	bt      	0x52fc	// 52fc <UART_IO_Init+0xb4>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF00)  | 0x00000077;       //PA0.0->RXD2, PA0.1->TXD2
    52ec:	106f      	lrw      	r3, 0x20000050	// 5328 <UART_IO_Init+0xe0>
    52ee:	31ff      	movi      	r1, 255
    52f0:	9340      	ld.w      	r2, (r3, 0x0)
    52f2:	9260      	ld.w      	r3, (r2, 0x0)
    52f4:	68c5      	andn      	r3, r1
    52f6:	3177      	movi      	r1, 119
    52f8:	6cc4      	or      	r3, r1
    52fa:	07b2      	br      	0x525e	// 525e <UART_IO_Init+0x16>
		else if(UART_IO_G==1)
    52fc:	3941      	cmpnei      	r1, 1
    52fe:	0809      	bt      	0x5310	// 5310 <UART_IO_Init+0xc8>
			GPIOA0->CONLR = (GPIOA0->CONLR&0X00FFFFFF) | 0X77000000;        //PA0.7->RXD2, PA0.6->TXD2
    5300:	106a      	lrw      	r3, 0x20000050	// 5328 <UART_IO_Init+0xe0>
    5302:	32ee      	movi      	r2, 238
    5304:	9320      	ld.w      	r1, (r3, 0x0)
    5306:	9160      	ld.w      	r3, (r1, 0x0)
    5308:	4368      	lsli      	r3, r3, 8
    530a:	4b68      	lsri      	r3, r3, 8
    530c:	4257      	lsli      	r2, r2, 23
    530e:	07e0      	br      	0x52ce	// 52ce <UART_IO_Init+0x86>
		else if(UART_IO_G==2)
    5310:	3942      	cmpnei      	r1, 2
    5312:	0bbc      	bt      	0x528a	// 528a <UART_IO_Init+0x42>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF00FFFF) | 0X00660000;        //PB0.5->RXD2, PB0.4->TXD2
    5314:	1066      	lrw      	r3, 0x2000004c	// 532c <UART_IO_Init+0xe4>
    5316:	32ff      	movi      	r2, 255
    5318:	9320      	ld.w      	r1, (r3, 0x0)
    531a:	4250      	lsli      	r2, r2, 16
    531c:	9160      	ld.w      	r3, (r1, 0x0)
    531e:	68c9      	andn      	r3, r2
    5320:	32cc      	movi      	r2, 204
    5322:	424f      	lsli      	r2, r2, 15
    5324:	07d5      	br      	0x52ce	// 52ce <UART_IO_Init+0x86>
    5326:	0000      	bkpt
    5328:	20000050 	.long	0x20000050
    532c:	2000004c 	.long	0x2000004c

Disassembly of section .text.UARTInitRxIntEn:

00005330 <UARTInitRxIntEn>:
//ReturnValue:NONE
/*************************************************************/
void UARTInitRxIntEn(CSP_UART_T *uart,U16_T baudrate_u16,UART_PAR_TypeDef PAR_DAT)
{
   // Set Transmitter Enable
   CSP_UART_SET_CTRL(uart, UART_TX | UART_RX | UART_RX_INT);
    5330:	330b      	movi      	r3, 11
    5332:	b062      	st.w      	r3, (r0, 0x8)
   // Set Baudrate
   CSP_UART_SET_BRDIV(uart, baudrate_u16);
    5334:	b024      	st.w      	r1, (r0, 0x10)
   uart->CTRL|=PAR_DAT|(0X01<<31);
    5336:	9062      	ld.w      	r3, (r0, 0x8)
    5338:	3abf      	bseti      	r2, 31
    533a:	6c8c      	or      	r2, r3
    533c:	b042      	st.w      	r2, (r0, 0x8)
}
    533e:	783c      	jmp      	r15

Disassembly of section .text.UARTClose:

00005340 <UARTClose>:
//ReturnValue:NONE
/*************************************************************/
void UARTClose(CSP_UART_T *uart)
{
	// Set Transmitter Disable
	CSP_UART_SET_CTRL(uart, 0x00);
    5340:	3300      	movi      	r3, 0
    5342:	b062      	st.w      	r3, (r0, 0x8)
}
    5344:	783c      	jmp      	r15

Disassembly of section .text.UARTTxByte:

00005346 <UARTTxByte>:
/*************************************************************/
void UARTTxByte(CSP_UART_T *uart,U8_T txdata_u8)
{
	unsigned int  DataI;
	// Write the transmit buffer
	CSP_UART_SET_DATA(uart,txdata_u8);
    5346:	b020      	st.w      	r1, (r0, 0x0)
	do
	{
		DataI = CSP_UART_GET_SR(uart);
		DataI = DataI & UART_TX_FULL;
    5348:	3201      	movi      	r2, 1
		DataI = CSP_UART_GET_SR(uart);
    534a:	9061      	ld.w      	r3, (r0, 0x4)
		DataI = DataI & UART_TX_FULL;
    534c:	68c8      	and      	r3, r2
	}
	while(DataI == UART_TX_FULL);    //Loop  when tx is full
    534e:	3b40      	cmpnei      	r3, 0
    5350:	0bfd      	bt      	0x534a	// 534a <UARTTxByte+0x4>
	while ( (CSP_UART_GET_ISR(uart) & UART_TX_INT_S) != UART_TX_INT_S ) {}

	// Clear status bit for the next transmit
	CSP_UART_SET_ISR(uart, UART_TX_INT_S);*/

}
    5352:	783c      	jmp      	r15

Disassembly of section .text.I2C_DeInit:

00005354 <I2C_DeInit>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_DeInit(void)
{
    I2C0->ENABLE  	= 0;
    5354:	1064      	lrw      	r3, 0x20000034	// 5364 <I2C_DeInit+0x10>
    5356:	3200      	movi      	r2, 0
    5358:	9360      	ld.w      	r3, (r3, 0x0)
    535a:	b34f      	st.w      	r2, (r3, 0x3c)
    I2C0->IMSCR  	= 0;
    535c:	b357      	st.w      	r2, (r3, 0x5c)
    I2C0->ICR   	= 0X7FFF;
    535e:	1043      	lrw      	r2, 0x7fff	// 5368 <I2C_DeInit+0x14>
    5360:	b359      	st.w      	r2, (r3, 0x64)
} 
    5362:	783c      	jmp      	r15
    5364:	20000034 	.long	0x20000034
    5368:	00007fff 	.long	0x00007fff

Disassembly of section .text.I2C_Slave_CONFIG:

0000536c <I2C_Slave_CONFIG>:
//I2C_SALVE_ADD:I2C SLAVE ADDRESS
//ReturnValue:NONE
/*************************************************************/
void I2C_Slave_CONFIG(I2C_SDA_TypeDef I2C_SDA_IO,I2C_SCL_TypeDef I2C_SCL_IO,I2C_SPEEDMODE_TypeDef SPEEDMODE,
						I2C_SLAVEBITS_TypeDef SLAVEBITS,U16_T I2C_SALVE_ADDS,U16_T SS_SCLHX,U16_T SS_SCLLX)
{
    536c:	14c4      	push      	r4-r7
    536e:	1421      	subi      	r14, r14, 4
    5370:	d88e100a 	ld.h      	r4, (r14, 0x14)
	//SDA IO Initial
    if(I2C_SDA_IO==I2C_SDA_PA00)
    5374:	3840      	cmpnei      	r0, 0
{
    5376:	b880      	st.w      	r4, (r14, 0x0)
    5378:	d8ae100c 	ld.h      	r5, (r14, 0x18)
    537c:	d88e100e 	ld.h      	r4, (r14, 0x1c)
    if(I2C_SDA_IO==I2C_SDA_PA00)
    5380:	080a      	bt      	0x5394	// 5394 <I2C_Slave_CONFIG+0x28>
    {
    GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFF0)  | 0x00000005;            //PA0.0->SDA
    5382:	1206      	lrw      	r0, 0x20000050	// 5498 <I2C_Slave_CONFIG+0x12c>
    5384:	370f      	movi      	r7, 15
    5386:	90c0      	ld.w      	r6, (r0, 0x0)
    5388:	9600      	ld.w      	r0, (r6, 0x0)
    538a:	681d      	andn      	r0, r7
    538c:	38a0      	bseti      	r0, 0
    538e:	38a2      	bseti      	r0, 2
    {
    GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00006000;            //PA0.3->SDA   ///
    }
	else if (I2C_SDA_IO==I2C_SDA_PA07)
    {
    GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)  | 0x40000000;            //PA0.7->SDA        
    5390:	b600      	st.w      	r0, (r6, 0x0)
    5392:	040c      	br      	0x53aa	// 53aa <I2C_Slave_CONFIG+0x3e>
    else if(I2C_SDA_IO==I2C_SDA_PA03)
    5394:	3841      	cmpnei      	r0, 1
    5396:	0827      	bt      	0x53e4	// 53e4 <I2C_Slave_CONFIG+0x78>
    GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00006000;            //PA0.3->SDA   ///
    5398:	1200      	lrw      	r0, 0x20000050	// 5498 <I2C_Slave_CONFIG+0x12c>
    539a:	36f0      	movi      	r6, 240
    539c:	90e0      	ld.w      	r7, (r0, 0x0)
    539e:	9700      	ld.w      	r0, (r7, 0x0)
    53a0:	46c8      	lsli      	r6, r6, 8
    53a2:	6819      	andn      	r0, r6
    53a4:	38ad      	bseti      	r0, 13
    53a6:	38ae      	bseti      	r0, 14
    53a8:	b700      	st.w      	r0, (r7, 0x0)
	else if(I2C_SDA_IO==I2C_SDA_PA014)
    {
    GPIOA0->CONHR = (GPIOA0->CONHR&0XF0FFFFFF)  | 0x06000000;            //PA0.14->SDA
    }
	//SCL IO Initial
	if (I2C_SCL_IO==I2C_SCL_PB00)
    53aa:	3940      	cmpnei      	r1, 0
    53ac:	083c      	bt      	0x5424	// 5424 <I2C_Slave_CONFIG+0xb8>
    {
    GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)  | 0x00000006;            //PB0.0->SCL        
    53ae:	113c      	lrw      	r1, 0x2000004c	// 549c <I2C_Slave_CONFIG+0x130>
    53b0:	360f      	movi      	r6, 15
    53b2:	9100      	ld.w      	r0, (r1, 0x0)
    53b4:	9020      	ld.w      	r1, (r0, 0x0)
    53b6:	6859      	andn      	r1, r6
    53b8:	39a1      	bseti      	r1, 1
    53ba:	39a2      	bseti      	r1, 2
    }
	else if (I2C_SCL_IO==I2C_SCL_PB02)
    {
    GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)  | 0x00000400;            //PB0.2->SCL        
    53bc:	b020      	st.w      	r1, (r0, 0x0)
    }
	else if(I2C_SCL_IO==I2C_SCL_PA015)
    {
    GPIOA0->CONHR = (GPIOA0->CONHR&0X0FFFFFFF)  | 0x60000000;            //PA0.15->SCL  
    }
	I2C0->ENABLE = (I2C0->ENABLE&0XFFFFFFFE)|I2C_DISABLE;
    53be:	1139      	lrw      	r1, 0x20000034	// 54a0 <I2C_Slave_CONFIG+0x134>
	I2C0->CR =(I2C0->CR&0XFFFFF000)| I2C_MASTER_DIS |I2C_SLAVE_EN | SPEEDMODE | SLAVEBITS;
    53c0:	11d9      	lrw      	r6, 0xfff	// 54a4 <I2C_Slave_CONFIG+0x138>
	I2C0->ENABLE = (I2C0->ENABLE&0XFFFFFFFE)|I2C_DISABLE;
    53c2:	9120      	ld.w      	r1, (r1, 0x0)
    53c4:	910f      	ld.w      	r0, (r1, 0x3c)
    53c6:	3880      	bclri      	r0, 0
    53c8:	b10f      	st.w      	r0, (r1, 0x3c)
	I2C0->CR =(I2C0->CR&0XFFFFF000)| I2C_MASTER_DIS |I2C_SLAVE_EN | SPEEDMODE | SLAVEBITS;
    53ca:	9100      	ld.w      	r0, (r1, 0x0)
    53cc:	6819      	andn      	r0, r6
    53ce:	6cc0      	or      	r3, r0
    53d0:	6cc8      	or      	r3, r2
    53d2:	b160      	st.w      	r3, (r1, 0x0)
	I2C0->SADDR = I2C_SALVE_ADDS;
	if(SPEEDMODE==FAST_MODE)
    53d4:	3a44      	cmpnei      	r2, 4
	I2C0->SADDR = I2C_SALVE_ADDS;
    53d6:	9860      	ld.w      	r3, (r14, 0x0)
    53d8:	b162      	st.w      	r3, (r1, 0x8)
	if(SPEEDMODE==FAST_MODE)
    53da:	085a      	bt      	0x548e	// 548e <I2C_Slave_CONFIG+0x122>
	{
		I2C0->FS_SCLH  = SS_SCLHX;  							//SCL high time
    53dc:	b1a7      	st.w      	r5, (r1, 0x1c)
		I2C0->FS_SCLL  = SS_SCLLX;  							//SCL low  time
    53de:	b188      	st.w      	r4, (r1, 0x20)
	else if(SPEEDMODE==STANDARD_MODE)
	{
		I2C0->SS_SCLH  = SS_SCLHX;  							//SCL high time
		I2C0->SS_SCLL  = SS_SCLLX;  							//SCL low  time
	}
}
    53e0:	1401      	addi      	r14, r14, 4
    53e2:	1484      	pop      	r4-r7
	else if (I2C_SDA_IO==I2C_SDA_PA07)
    53e4:	3842      	cmpnei      	r0, 2
    53e6:	0808      	bt      	0x53f6	// 53f6 <I2C_Slave_CONFIG+0x8a>
    GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)  | 0x40000000;            //PA0.7->SDA        
    53e8:	110c      	lrw      	r0, 0x20000050	// 5498 <I2C_Slave_CONFIG+0x12c>
    53ea:	90c0      	ld.w      	r6, (r0, 0x0)
    53ec:	9600      	ld.w      	r0, (r6, 0x0)
    53ee:	4004      	lsli      	r0, r0, 4
    53f0:	4804      	lsri      	r0, r0, 4
    53f2:	38be      	bseti      	r0, 30
    53f4:	07ce      	br      	0x5390	// 5390 <I2C_Slave_CONFIG+0x24>
	else if(I2C_SDA_IO==I2C_SDA_PA013)
    53f6:	3843      	cmpnei      	r0, 3
    53f8:	080b      	bt      	0x540e	// 540e <I2C_Slave_CONFIG+0xa2>
    GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)  | 0x00600000;            //PA0.13->SDA
    53fa:	1108      	lrw      	r0, 0x20000050	// 5498 <I2C_Slave_CONFIG+0x12c>
    53fc:	36f0      	movi      	r6, 240
    53fe:	90e0      	ld.w      	r7, (r0, 0x0)
    5400:	9701      	ld.w      	r0, (r7, 0x4)
    5402:	46d0      	lsli      	r6, r6, 16
    5404:	6819      	andn      	r0, r6
    5406:	38b5      	bseti      	r0, 21
    5408:	38b6      	bseti      	r0, 22
    GPIOA0->CONHR = (GPIOA0->CONHR&0XF0FFFFFF)  | 0x06000000;            //PA0.14->SDA
    540a:	b701      	st.w      	r0, (r7, 0x4)
    540c:	07cf      	br      	0x53aa	// 53aa <I2C_Slave_CONFIG+0x3e>
	else if(I2C_SDA_IO==I2C_SDA_PA014)
    540e:	3844      	cmpnei      	r0, 4
    5410:	0bcd      	bt      	0x53aa	// 53aa <I2C_Slave_CONFIG+0x3e>
    GPIOA0->CONHR = (GPIOA0->CONHR&0XF0FFFFFF)  | 0x06000000;            //PA0.14->SDA
    5412:	1102      	lrw      	r0, 0x20000050	// 5498 <I2C_Slave_CONFIG+0x12c>
    5414:	36f0      	movi      	r6, 240
    5416:	90e0      	ld.w      	r7, (r0, 0x0)
    5418:	9701      	ld.w      	r0, (r7, 0x4)
    541a:	46d4      	lsli      	r6, r6, 20
    541c:	6819      	andn      	r0, r6
    541e:	38b9      	bseti      	r0, 25
    5420:	38ba      	bseti      	r0, 26
    5422:	07f4      	br      	0x540a	// 540a <I2C_Slave_CONFIG+0x9e>
	else if (I2C_SCL_IO==I2C_SCL_PB02)
    5424:	3941      	cmpnei      	r1, 1
    5426:	0809      	bt      	0x5438	// 5438 <I2C_Slave_CONFIG+0xcc>
    GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)  | 0x00000400;            //PB0.2->SCL        
    5428:	103d      	lrw      	r1, 0x2000004c	// 549c <I2C_Slave_CONFIG+0x130>
    542a:	36f0      	movi      	r6, 240
    542c:	9100      	ld.w      	r0, (r1, 0x0)
    542e:	9020      	ld.w      	r1, (r0, 0x0)
    5430:	46c4      	lsli      	r6, r6, 4
    5432:	6859      	andn      	r1, r6
    5434:	39aa      	bseti      	r1, 10
    5436:	07c3      	br      	0x53bc	// 53bc <I2C_Slave_CONFIG+0x50>
    else if(I2C_SCL_IO==I2C_SCL_PA01)
    5438:	3942      	cmpnei      	r1, 2
    543a:	0809      	bt      	0x544c	// 544c <I2C_Slave_CONFIG+0xe0>
    GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF0F)  | 0x00000050;            //PA0.1->SCL
    543c:	1037      	lrw      	r1, 0x20000050	// 5498 <I2C_Slave_CONFIG+0x12c>
    543e:	36f0      	movi      	r6, 240
    5440:	9100      	ld.w      	r0, (r1, 0x0)
    5442:	9020      	ld.w      	r1, (r0, 0x0)
    5444:	6859      	andn      	r1, r6
    5446:	39a4      	bseti      	r1, 4
    5448:	39a6      	bseti      	r1, 6
    544a:	07b9      	br      	0x53bc	// 53bc <I2C_Slave_CONFIG+0x50>
    else if(I2C_SCL_IO==I2C_SCL_PA04)
    544c:	3943      	cmpnei      	r1, 3
    544e:	080a      	bt      	0x5462	// 5462 <I2C_Slave_CONFIG+0xf6>
     GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF0FFFF)  | 0x00060000;            //PA0.4->SCL   //
    5450:	1032      	lrw      	r1, 0x20000050	// 5498 <I2C_Slave_CONFIG+0x12c>
    5452:	36f0      	movi      	r6, 240
    5454:	9100      	ld.w      	r0, (r1, 0x0)
    5456:	9020      	ld.w      	r1, (r0, 0x0)
    5458:	46cc      	lsli      	r6, r6, 12
    545a:	6859      	andn      	r1, r6
    545c:	39b1      	bseti      	r1, 17
    545e:	39b2      	bseti      	r1, 18
    5460:	07ae      	br      	0x53bc	// 53bc <I2C_Slave_CONFIG+0x50>
	else if(I2C_SCL_IO==I2C_SCL_PA06)
    5462:	3944      	cmpnei      	r1, 4
    5464:	080a      	bt      	0x5478	// 5478 <I2C_Slave_CONFIG+0x10c>
    GPIOA0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF)  | 0x06000000;            //PA0.6->SCL  
    5466:	102d      	lrw      	r1, 0x20000050	// 5498 <I2C_Slave_CONFIG+0x12c>
    5468:	36f0      	movi      	r6, 240
    546a:	9100      	ld.w      	r0, (r1, 0x0)
    546c:	9020      	ld.w      	r1, (r0, 0x0)
    546e:	46d4      	lsli      	r6, r6, 20
    5470:	6859      	andn      	r1, r6
    5472:	39b9      	bseti      	r1, 25
    5474:	39ba      	bseti      	r1, 26
    5476:	07a3      	br      	0x53bc	// 53bc <I2C_Slave_CONFIG+0x50>
	else if(I2C_SCL_IO==I2C_SCL_PA015)
    5478:	3945      	cmpnei      	r1, 5
    547a:	0ba2      	bt      	0x53be	// 53be <I2C_Slave_CONFIG+0x52>
    GPIOA0->CONHR = (GPIOA0->CONHR&0X0FFFFFFF)  | 0x60000000;            //PA0.15->SCL  
    547c:	1027      	lrw      	r1, 0x20000050	// 5498 <I2C_Slave_CONFIG+0x12c>
    547e:	9100      	ld.w      	r0, (r1, 0x0)
    5480:	9021      	ld.w      	r1, (r0, 0x4)
    5482:	4124      	lsli      	r1, r1, 4
    5484:	4924      	lsri      	r1, r1, 4
    5486:	39bd      	bseti      	r1, 29
    5488:	39be      	bseti      	r1, 30
    548a:	b021      	st.w      	r1, (r0, 0x4)
    548c:	0799      	br      	0x53be	// 53be <I2C_Slave_CONFIG+0x52>
	else if(SPEEDMODE==STANDARD_MODE)
    548e:	3a42      	cmpnei      	r2, 2
    5490:	0ba8      	bt      	0x53e0	// 53e0 <I2C_Slave_CONFIG+0x74>
		I2C0->SS_SCLH  = SS_SCLHX;  							//SCL high time
    5492:	b1a5      	st.w      	r5, (r1, 0x14)
		I2C0->SS_SCLL  = SS_SCLLX;  							//SCL low  time
    5494:	b186      	st.w      	r4, (r1, 0x18)
}
    5496:	07a5      	br      	0x53e0	// 53e0 <I2C_Slave_CONFIG+0x74>
    5498:	20000050 	.long	0x20000050
    549c:	2000004c 	.long	0x2000004c
    54a0:	20000034 	.long	0x20000034
    54a4:	00000fff 	.long	0x00000fff

Disassembly of section .text.I2C_SDA_TSETUP_THOLD_CONFIG:

000054a8 <I2C_SDA_TSETUP_THOLD_CONFIG>:
//ReturnValue:NONE
/*************************************************************/
void I2C_SDA_TSETUP_THOLD_CONFIG(U8_T SDA_TSETUP , U8_T SDA_RX_THOLD , U16_T SDA_TX_THOLD)
{
	I2C0->SDA_TSETUP=SDA_TSETUP;
	I2C0->SDA_THOLD=(SDA_RX_THOLD<<16)|SDA_TX_THOLD;
    54a8:	4130      	lsli      	r1, r1, 16
	I2C0->SDA_TSETUP=SDA_TSETUP;
    54aa:	1064      	lrw      	r3, 0x20000034	// 54b8 <I2C_SDA_TSETUP_THOLD_CONFIG+0x10>
	I2C0->SDA_THOLD=(SDA_RX_THOLD<<16)|SDA_TX_THOLD;
    54ac:	6c84      	or      	r2, r1
	I2C0->SDA_TSETUP=SDA_TSETUP;
    54ae:	9360      	ld.w      	r3, (r3, 0x0)
    54b0:	b312      	st.w      	r0, (r3, 0x48)
	I2C0->SDA_THOLD=(SDA_RX_THOLD<<16)|SDA_TX_THOLD;
    54b2:	b353      	st.w      	r2, (r3, 0x4c)
}
    54b4:	783c      	jmp      	r15
    54b6:	0000      	bkpt
    54b8:	20000034 	.long	0x20000034

Disassembly of section .text.I2C_ConfigInterrupt_CMD:

000054bc <I2C_ConfigInterrupt_CMD>:
//				 I2C_RESTART_DET,I2C_MST_ON_HOLD,I2C_SCL_SLOW   
//NewState:ENABLE/DISABLE
//ReturnValue:NONE
/*************************************************************/
void I2C_ConfigInterrupt_CMD(FunctionalStatus NewState,U32_T INT_TYPE)
{
    54bc:	1066      	lrw      	r3, 0x20000034	// 54d4 <I2C_ConfigInterrupt_CMD+0x18>
	if(NewState != DISABLE)
    54be:	3840      	cmpnei      	r0, 0
	{
		I2C0->IMSCR |= INT_TYPE;
    54c0:	9340      	ld.w      	r2, (r3, 0x0)
    54c2:	9277      	ld.w      	r3, (r2, 0x5c)
	if(NewState != DISABLE)
    54c4:	0c04      	bf      	0x54cc	// 54cc <I2C_ConfigInterrupt_CMD+0x10>
		I2C0->IMSCR |= INT_TYPE;
    54c6:	6c4c      	or      	r1, r3
    54c8:	b237      	st.w      	r1, (r2, 0x5c)
	}
	else
	{
		I2C0->IMSCR &= (~INT_TYPE);
	}
}
    54ca:	783c      	jmp      	r15
		I2C0->IMSCR &= (~INT_TYPE);
    54cc:	68c5      	andn      	r3, r1
    54ce:	b277      	st.w      	r3, (r2, 0x5c)
}
    54d0:	07fd      	br      	0x54ca	// 54ca <I2C_ConfigInterrupt_CMD+0xe>
    54d2:	0000      	bkpt
    54d4:	20000034 	.long	0x20000034

Disassembly of section .text.I2C_FIFO_TriggerData:

000054d8 <I2C_FIFO_TriggerData>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_FIFO_TriggerData(U16_T RX_FLSEL,U16_T TX_FLSEL)
{
	I2C0->RX_FLSEL = RX_FLSEL;  							
    54d8:	1063      	lrw      	r3, 0x20000034	// 54e4 <I2C_FIFO_TriggerData+0xc>
    54da:	9360      	ld.w      	r3, (r3, 0x0)
    54dc:	b30b      	st.w      	r0, (r3, 0x2c)
	I2C0->TX_FLSEL = TX_FLSEL;  							
    54de:	b32c      	st.w      	r1, (r3, 0x30)
}
    54e0:	783c      	jmp      	r15
    54e2:	0000      	bkpt
    54e4:	20000034 	.long	0x20000034

Disassembly of section .text.I2C_Enable:

000054e8 <I2C_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_Enable(void)
{
	I2C0->ENABLE = (I2C0->ENABLE&0XFFFFFFFE)|I2C_ENABLE;                         //Enable I2C
    54e8:	1066      	lrw      	r3, 0x20000034	// 5500 <I2C_Enable+0x18>
	while((I2C0->STATUS&0x1000)!=0x1000);
    54ea:	3280      	movi      	r2, 128
	I2C0->ENABLE = (I2C0->ENABLE&0XFFFFFFFE)|I2C_ENABLE;                         //Enable I2C
    54ec:	9320      	ld.w      	r1, (r3, 0x0)
    54ee:	916f      	ld.w      	r3, (r1, 0x3c)
    54f0:	3ba0      	bseti      	r3, 0
    54f2:	b16f      	st.w      	r3, (r1, 0x3c)
	while((I2C0->STATUS&0x1000)!=0x1000);
    54f4:	4245      	lsli      	r2, r2, 5
    54f6:	9170      	ld.w      	r3, (r1, 0x40)
    54f8:	68c8      	and      	r3, r2
    54fa:	3b40      	cmpnei      	r3, 0
    54fc:	0ffd      	bf      	0x54f6	// 54f6 <I2C_Enable+0xe>
}
    54fe:	783c      	jmp      	r15
    5500:	20000034 	.long	0x20000034

Disassembly of section .text.I2C_Disable:

00005504 <I2C_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_Disable(void)
{
	I2C0->ENABLE =(I2C0->ENABLE&0XFFFFFFFE)|I2C_DISABLE;                         //Disable I2C
    5504:	1066      	lrw      	r3, 0x20000034	// 551c <I2C_Disable+0x18>
	while((I2C0->STATUS&0x1000)==0x1000);
    5506:	3280      	movi      	r2, 128
	I2C0->ENABLE =(I2C0->ENABLE&0XFFFFFFFE)|I2C_DISABLE;                         //Disable I2C
    5508:	9320      	ld.w      	r1, (r3, 0x0)
    550a:	916f      	ld.w      	r3, (r1, 0x3c)
    550c:	3b80      	bclri      	r3, 0
    550e:	b16f      	st.w      	r3, (r1, 0x3c)
	while((I2C0->STATUS&0x1000)==0x1000);
    5510:	4245      	lsli      	r2, r2, 5
    5512:	9170      	ld.w      	r3, (r1, 0x40)
    5514:	68c8      	and      	r3, r2
    5516:	3b40      	cmpnei      	r3, 0
    5518:	0bfd      	bt      	0x5512	// 5512 <I2C_Disable+0xe>
}
    551a:	783c      	jmp      	r15
    551c:	20000034 	.long	0x20000034

Disassembly of section .text.I2C_Int_Enable:

00005520 <I2C_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_Int_Enable(void)
{
	INTC_ISER_WRITE(I2C_INT);                             //Enable I2C interrupt
    5520:	3380      	movi      	r3, 128
    5522:	436a      	lsli      	r3, r3, 10
    5524:	1042      	lrw      	r2, 0xe000e100	// 552c <I2C_Int_Enable+0xc>
    5526:	b260      	st.w      	r3, (r2, 0x0)
}
    5528:	783c      	jmp      	r15
    552a:	0000      	bkpt
    552c:	e000e100 	.long	0xe000e100

Disassembly of section .text.I2C_Slave_Receive:

00005530 <I2C_Slave_Receive>:
//I2C slave Receive
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_Slave_Receive(void)
{
    5530:	14d2      	push      	r4-r5, r15
	U16_T R_READ_BUF=0;
if(!(((I2C0->MISR&I2C_SCL_SLOW)==I2C_SCL_SLOW)
    5532:	1295      	lrw      	r4, 0x20000034	// 5684 <I2C_Slave_Receive+0x154>
    5534:	3180      	movi      	r1, 128
    5536:	9460      	ld.w      	r3, (r4, 0x0)
    5538:	9356      	ld.w      	r2, (r3, 0x58)
    553a:	4127      	lsli      	r1, r1, 7
    553c:	6884      	and      	r2, r1
    553e:	3a40      	cmpnei      	r2, 0
    5540:	0892      	bt      	0x5664	// 5664 <I2C_Slave_Receive+0x134>
			||((I2C0->MISR&I2C_TX_ABRT)==I2C_TX_ABRT)))				 //SCLK锁死,IIC发送中止))
    5542:	9356      	ld.w      	r2, (r3, 0x58)
    5544:	3140      	movi      	r1, 64
    5546:	6884      	and      	r2, r1
if(!(((I2C0->MISR&I2C_SCL_SLOW)==I2C_SCL_SLOW)
    5548:	3a40      	cmpnei      	r2, 0
    554a:	088d      	bt      	0x5664	// 5664 <I2C_Slave_Receive+0x134>
{
	if((I2C0->MISR&I2C_RX_FULL)==I2C_RX_FULL)        //有接收到数据
    554c:	9356      	ld.w      	r2, (r3, 0x58)
    554e:	3104      	movi      	r1, 4
    5550:	6884      	and      	r2, r1
    5552:	3a40      	cmpnei      	r2, 0
    5554:	0c14      	bf      	0x557c	// 557c <I2C_Slave_Receive+0x4c>
	{
		if(RdIndex==0)
    5556:	122d      	lrw      	r1, 0x20000236	// 5688 <I2C_Slave_Receive+0x158>
    5558:	8141      	ld.b      	r2, (r1, 0x1)
    555a:	3a40      	cmpnei      	r2, 0
    555c:	124c      	lrw      	r2, 0x200002cd	// 568c <I2C_Slave_Receive+0x15c>
    555e:	084f      	bt      	0x55fc	// 55fc <I2C_Slave_Receive+0xcc>
		{
			RdIndex=1;
    5560:	3001      	movi      	r0, 1
    5562:	a101      	st.b      	r0, (r1, 0x1)
			I2C_Data_Adress=I2C0->DATA_CMD&0XFF;
    5564:	9324      	ld.w      	r1, (r3, 0x10)
    5566:	7444      	zextb      	r1, r1
    5568:	a220      	st.b      	r1, (r2, 0x0)
			I2C_St_Adress=I2C_Data_Adress;
    556a:	8240      	ld.b      	r2, (r2, 0x0)
    556c:	7488      	zextb      	r2, r2
    556e:	1229      	lrw      	r1, 0x200002ac	// 5690 <I2C_Slave_Receive+0x160>
    5570:	a140      	st.b      	r2, (r1, 0x0)
			{
				I2CRdBuffer[I2C_Data_Adress]= I2C0->DATA_CMD&0XFF;
			}
			I2C_Data_Adress++;
		}
		I2C0->ICR = I2C_RX_FULL;
    5572:	3204      	movi      	r2, 4
    5574:	b359      	st.w      	r2, (r3, 0x64)
		R_IIC_ERROR_CONT=0;
    5576:	3200      	movi      	r2, 0
    5578:	1267      	lrw      	r3, 0x200002a8	// 5694 <I2C_Slave_Receive+0x164>
    557a:	b340      	st.w      	r2, (r3, 0x0)
	}
		
	if((I2C0->MISR&I2C_RD_REQ)==I2C_RD_REQ)			//读请求产生
    557c:	9460      	ld.w      	r3, (r4, 0x0)
    557e:	9356      	ld.w      	r2, (r3, 0x58)
    5580:	3120      	movi      	r1, 32
    5582:	6884      	and      	r2, r1
    5584:	3a40      	cmpnei      	r2, 0
    5586:	0c1d      	bf      	0x55c0	// 55c0 <I2C_Slave_Receive+0x90>
	{
		if(RdIndex==1)
    5588:	1220      	lrw      	r1, 0x20000236	// 5688 <I2C_Slave_Receive+0x158>
    558a:	8141      	ld.b      	r2, (r1, 0x1)
    558c:	3a41      	cmpnei      	r2, 1
    558e:	0814      	bt      	0x55b6	// 55b6 <I2C_Slave_Receive+0x86>
		{
			RdIndex=2;
    5590:	3202      	movi      	r2, 2
    5592:	a141      	st.b      	r2, (r1, 0x1)
			WrIndex = I2C_St_Adress;
    5594:	115f      	lrw      	r2, 0x200002ac	// 5690 <I2C_Slave_Receive+0x160>
    5596:	8240      	ld.b      	r2, (r2, 0x0)
    5598:	7488      	zextb      	r2, r2
    559a:	a142      	st.b      	r2, (r1, 0x2)
			//I2C_ConfigInterrupt_CMD(ENABLE,I2C_TX_EMPTY);
			if(WrIndex<BUFSIZE)
    559c:	8142      	ld.b      	r2, (r1, 0x2)
    559e:	7488      	zextb      	r2, r2
    55a0:	3a1f      	cmphsi      	r2, 32
    55a2:	080a      	bt      	0x55b6	// 55b6 <I2C_Slave_Receive+0x86>
			{
				I2C0->DATA_CMD= (I2C0->DATA_CMD&0XFFFFFF00) |I2CWrBuffer[WrIndex];
    55a4:	9344      	ld.w      	r2, (r3, 0x10)
    55a6:	8122      	ld.b      	r1, (r1, 0x2)
    55a8:	111c      	lrw      	r0, 0x200002ad	// 5698 <I2C_Slave_Receive+0x168>
    55aa:	6040      	addu      	r1, r0
    55ac:	30ff      	movi      	r0, 255
    55ae:	8120      	ld.b      	r1, (r1, 0x0)
    55b0:	6881      	andn      	r2, r0
    55b2:	6c84      	or      	r2, r1
    55b4:	b344      	st.w      	r2, (r3, 0x10)
			}	
		}	
		I2C0->ICR = I2C_RD_REQ;
    55b6:	3220      	movi      	r2, 32
    55b8:	b359      	st.w      	r2, (r3, 0x64)
		R_IIC_ERROR_CONT=0;
    55ba:	3100      	movi      	r1, 0
    55bc:	1156      	lrw      	r2, 0x200002a8	// 5694 <I2C_Slave_Receive+0x164>
    55be:	b220      	st.w      	r1, (r2, 0x0)
	} 
                         
	if((I2C0->MISR&I2C_TX_EMPTY)==I2C_TX_EMPTY)				//IIC发送为空
    55c0:	9356      	ld.w      	r2, (r3, 0x58)
    55c2:	3110      	movi      	r1, 16
    55c4:	6884      	and      	r2, r1
    55c6:	3a40      	cmpnei      	r2, 0
    55c8:	0c3d      	bf      	0x5642	// 5642 <I2C_Slave_Receive+0x112>
	{
		if(RdIndex==2)
    55ca:	1150      	lrw      	r2, 0x20000236	// 5688 <I2C_Slave_Receive+0x158>
    55cc:	8221      	ld.b      	r1, (r2, 0x1)
    55ce:	3942      	cmpnei      	r1, 2
    55d0:	0825      	bt      	0x561a	// 561a <I2C_Slave_Receive+0xea>
		{
			if(WrIndex+1<BUFSIZE)
    55d2:	8222      	ld.b      	r1, (r2, 0x2)
    55d4:	7444      	zextb      	r1, r1
    55d6:	393e      	cmplti      	r1, 31
    55d8:	0c0a      	bf      	0x55ec	// 55ec <I2C_Slave_Receive+0xbc>
			{
				I2C0->DATA_CMD= (I2C0->DATA_CMD&0XFFFFFF00) |I2CWrBuffer[WrIndex+1];
    55da:	9324      	ld.w      	r1, (r3, 0x10)
    55dc:	11b0      	lrw      	r5, 0x200002ae	// 569c <I2C_Slave_Receive+0x16c>
    55de:	8202      	ld.b      	r0, (r2, 0x2)
    55e0:	6014      	addu      	r0, r5
    55e2:	35ff      	movi      	r5, 255
    55e4:	8000      	ld.b      	r0, (r0, 0x0)
    55e6:	6855      	andn      	r1, r5
    55e8:	6c40      	or      	r1, r0
    55ea:	b324      	st.w      	r1, (r3, 0x10)
			}
			WrIndex++;
    55ec:	8262      	ld.b      	r3, (r2, 0x2)
    55ee:	2300      	addi      	r3, 1
    55f0:	74cc      	zextb      	r3, r3
    55f2:	a262      	st.b      	r3, (r2, 0x2)
			else
			{
				R_IIC_ERROR_CONT++;
			}
		}
		I2C0->CR = I2C_TX_EMPTY;
    55f4:	9460      	ld.w      	r3, (r4, 0x0)
    55f6:	3210      	movi      	r2, 16
		I2C0->DATA_CMD= (I2C0->DATA_CMD&0XFFFFFF00);
		I2C_SLAVE_CONFIG(); 
		RdIndex=0;	
		//I2C_ConfigInterrupt_CMD(ENABLE,I2C_TX_EMPTY);				
		I2C0->ICR = I2C_SCL_SLOW|I2C_TX_ABRT;
		R_IIC_ERROR_CONT=0;
    55f8:	b340      	st.w      	r2, (r3, 0x0)
	
}
}
    55fa:	1492      	pop      	r4-r5, r15
			if(I2C_Data_Adress<BUFSIZE)
    55fc:	8220      	ld.b      	r1, (r2, 0x0)
    55fe:	7444      	zextb      	r1, r1
    5600:	391f      	cmphsi      	r1, 32
    5602:	0807      	bt      	0x5610	// 5610 <I2C_Slave_Receive+0xe0>
				I2CRdBuffer[I2C_Data_Adress]= I2C0->DATA_CMD&0XFF;
    5604:	8220      	ld.b      	r1, (r2, 0x0)
    5606:	11a7      	lrw      	r5, 0x200002ce	// 56a0 <I2C_Slave_Receive+0x170>
    5608:	6054      	addu      	r1, r5
    560a:	9304      	ld.w      	r0, (r3, 0x10)
    560c:	7400      	zextb      	r0, r0
    560e:	a100      	st.b      	r0, (r1, 0x0)
			I2C_Data_Adress++;
    5610:	8220      	ld.b      	r1, (r2, 0x0)
    5612:	2100      	addi      	r1, 1
    5614:	7444      	zextb      	r1, r1
    5616:	a220      	st.b      	r1, (r2, 0x0)
    5618:	07ad      	br      	0x5572	// 5572 <I2C_Slave_Receive+0x42>
			if(R_IIC_ERROR_CONT>10000)
    561a:	10bf      	lrw      	r5, 0x200002a8	// 5694 <I2C_Slave_Receive+0x164>
    561c:	1162      	lrw      	r3, 0x2710	// 56a4 <I2C_Slave_Receive+0x174>
    561e:	9540      	ld.w      	r2, (r5, 0x0)
    5620:	648c      	cmphs      	r3, r2
    5622:	080d      	bt      	0x563c	// 563c <I2C_Slave_Receive+0x10c>
				I2C_Disable();
    5624:	e3ffff70 	bsr      	0x5504	// 5504 <I2C_Disable>
				I2C0->DATA_CMD= (I2C0->DATA_CMD&0XFFFFFF00);
    5628:	9440      	ld.w      	r2, (r4, 0x0)
    562a:	9264      	ld.w      	r3, (r2, 0x10)
    562c:	31ff      	movi      	r1, 255
    562e:	68c5      	andn      	r3, r1
    5630:	b264      	st.w      	r3, (r2, 0x10)
				I2C_SLAVE_CONFIG();
    5632:	e0000471 	bsr      	0x5f14	// 5f14 <I2C_SLAVE_CONFIG>
				R_IIC_ERROR_CONT=0;
    5636:	3300      	movi      	r3, 0
				R_IIC_ERROR_CONT++;
    5638:	b560      	st.w      	r3, (r5, 0x0)
    563a:	07dd      	br      	0x55f4	// 55f4 <I2C_Slave_Receive+0xc4>
    563c:	9560      	ld.w      	r3, (r5, 0x0)
    563e:	2300      	addi      	r3, 1
    5640:	07fc      	br      	0x5638	// 5638 <I2C_Slave_Receive+0x108>
	else if((I2C0->MISR&I2C_STOP_DET)==I2C_STOP_DET)
    5642:	3280      	movi      	r2, 128
    5644:	9336      	ld.w      	r1, (r3, 0x58)
    5646:	4242      	lsli      	r2, r2, 2
    5648:	6848      	and      	r1, r2
    564a:	3940      	cmpnei      	r1, 0
    564c:	0fd7      	bf      	0x55fa	// 55fa <I2C_Slave_Receive+0xca>
		I2C0->ICR =I2C_STOP_DET;
    564e:	b359      	st.w      	r2, (r3, 0x64)
		if(RdIndex!=0)
    5650:	104e      	lrw      	r2, 0x20000236	// 5688 <I2C_Slave_Receive+0x158>
    5652:	8221      	ld.b      	r1, (r2, 0x1)
    5654:	3940      	cmpnei      	r1, 0
    5656:	0c03      	bf      	0x565c	// 565c <I2C_Slave_Receive+0x12c>
			RdIndex=0;
    5658:	3100      	movi      	r1, 0
    565a:	a221      	st.b      	r1, (r2, 0x1)
		R_READ_BUF=I2C0->DATA_CMD&0XFF;
    565c:	9364      	ld.w      	r3, (r3, 0x10)
		R_IIC_ERROR_CONT=0;
    565e:	3200      	movi      	r2, 0
    5660:	106d      	lrw      	r3, 0x200002a8	// 5694 <I2C_Slave_Receive+0x164>
    5662:	07cb      	br      	0x55f8	// 55f8 <I2C_Slave_Receive+0xc8>
		I2C_Disable();
    5664:	e3ffff50 	bsr      	0x5504	// 5504 <I2C_Disable>
		I2C0->DATA_CMD= (I2C0->DATA_CMD&0XFFFFFF00);
    5668:	9440      	ld.w      	r2, (r4, 0x0)
    566a:	9264      	ld.w      	r3, (r2, 0x10)
    566c:	31ff      	movi      	r1, 255
    566e:	68c5      	andn      	r3, r1
    5670:	b264      	st.w      	r3, (r2, 0x10)
		I2C_SLAVE_CONFIG(); 
    5672:	e0000451 	bsr      	0x5f14	// 5f14 <I2C_SLAVE_CONFIG>
		RdIndex=0;	
    5676:	1065      	lrw      	r3, 0x20000236	// 5688 <I2C_Slave_Receive+0x158>
    5678:	3200      	movi      	r2, 0
    567a:	a341      	st.b      	r2, (r3, 0x1)
		I2C0->ICR = I2C_SCL_SLOW|I2C_TX_ABRT;
    567c:	9460      	ld.w      	r3, (r4, 0x0)
    567e:	104b      	lrw      	r2, 0x4040	// 56a8 <I2C_Slave_Receive+0x178>
    5680:	b359      	st.w      	r2, (r3, 0x64)
    5682:	07ee      	br      	0x565e	// 565e <I2C_Slave_Receive+0x12e>
    5684:	20000034 	.long	0x20000034
    5688:	20000236 	.long	0x20000236
    568c:	200002cd 	.long	0x200002cd
    5690:	200002ac 	.long	0x200002ac
    5694:	200002a8 	.long	0x200002a8
    5698:	200002ad 	.long	0x200002ad
    569c:	200002ae 	.long	0x200002ae
    56a0:	200002ce 	.long	0x200002ce
    56a4:	00002710 	.long	0x00002710
    56a8:	00004040 	.long	0x00004040

Disassembly of section .text.EPT_Software_Prg:

000056ac <EPT_Software_Prg>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/    
void EPT_Software_Prg(void)
{
	EPT0->CEDR|=0X01;
    56ac:	1067      	lrw      	r3, 0x20000024	// 56c8 <EPT_Software_Prg+0x1c>
	EPT0->RSSR=(EPT0->RSSR&0XFFFF0FFF)|(0X05<<12);
    56ae:	31f0      	movi      	r1, 240
	EPT0->CEDR|=0X01;
    56b0:	9340      	ld.w      	r2, (r3, 0x0)
    56b2:	9260      	ld.w      	r3, (r2, 0x0)
    56b4:	3ba0      	bseti      	r3, 0
    56b6:	b260      	st.w      	r3, (r2, 0x0)
	EPT0->RSSR=(EPT0->RSSR&0XFFFF0FFF)|(0X05<<12);
    56b8:	9261      	ld.w      	r3, (r2, 0x4)
    56ba:	4128      	lsli      	r1, r1, 8
    56bc:	68c5      	andn      	r3, r1
    56be:	3bac      	bseti      	r3, 12
    56c0:	3bae      	bseti      	r3, 14
    56c2:	b261      	st.w      	r3, (r2, 0x4)
}
    56c4:	783c      	jmp      	r15
    56c6:	0000      	bkpt
    56c8:	20000024 	.long	0x20000024

Disassembly of section .text.EPT_Start:

000056cc <EPT_Start>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/   
void EPT_Start(void)
{
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
    56cc:	1068      	lrw      	r3, 0x20000024	// 56ec <EPT_Start+0x20>
    56ce:	3280      	movi      	r2, 128
    56d0:	9360      	ld.w      	r3, (r3, 0x0)
    56d2:	608c      	addu      	r2, r3
    56d4:	1027      	lrw      	r1, 0xa55ac73a	// 56f0 <EPT_Start+0x24>
    56d6:	b23a      	st.w      	r1, (r2, 0x68)
	EPT0->RSSR|=0X01;
    56d8:	9341      	ld.w      	r2, (r3, 0x4)
    56da:	3aa0      	bseti      	r2, 0
    56dc:	b341      	st.w      	r2, (r3, 0x4)
	while(!(EPT0->RSSR&0x01));
    56de:	3101      	movi      	r1, 1
    56e0:	9341      	ld.w      	r2, (r3, 0x4)
    56e2:	6884      	and      	r2, r1
    56e4:	3a40      	cmpnei      	r2, 0
    56e6:	0ffd      	bf      	0x56e0	// 56e0 <EPT_Start+0x14>
} 
    56e8:	783c      	jmp      	r15
    56ea:	0000      	bkpt
    56ec:	20000024 	.long	0x20000024
    56f0:	a55ac73a 	.long	0xa55ac73a

Disassembly of section .text.EPT_Stop:

000056f4 <EPT_Stop>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/   
void EPT_Stop(void)
{
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
    56f4:	1068      	lrw      	r3, 0x20000024	// 5714 <EPT_Stop+0x20>
    56f6:	3280      	movi      	r2, 128
    56f8:	9360      	ld.w      	r3, (r3, 0x0)
    56fa:	608c      	addu      	r2, r3
    56fc:	1027      	lrw      	r1, 0xa55ac73a	// 5718 <EPT_Stop+0x24>
    56fe:	b23a      	st.w      	r1, (r2, 0x68)
	EPT0->RSSR&=0Xfe;
    5700:	9341      	ld.w      	r2, (r3, 0x4)
    5702:	31fe      	movi      	r1, 254
    5704:	6884      	and      	r2, r1
    5706:	b341      	st.w      	r2, (r3, 0x4)
	while(EPT0->RSSR&0x01);
    5708:	3101      	movi      	r1, 1
    570a:	9341      	ld.w      	r2, (r3, 0x4)
    570c:	6884      	and      	r2, r1
    570e:	3a40      	cmpnei      	r2, 0
    5710:	0bfd      	bt      	0x570a	// 570a <EPT_Stop+0x16>
}
    5712:	783c      	jmp      	r15
    5714:	20000024 	.long	0x20000024
    5718:	a55ac73a 	.long	0xa55ac73a

Disassembly of section .text.EPT_IO_SET:

0000571c <EPT_IO_SET>:
//EPT_IO_X:EPT_IO_CHAX,EPT_IO_CHAY,EPT_IO_CHBX,EPT_IO_CHBY,EPT_IO_CHCX,EPT_IO_CHCX,EPT_IO_CHD,EPT_IO_EPI
//ReturnValue:NONE
/*************************************************************/    
void EPT_IO_SET(EPT_IO_Mode_Type EPT_IO_X , EPT_IO_NUM_Type IO_Num_X)
{
	if(EPT_IO_X==EPT_IO_CHAX)
    571c:	3840      	cmpnei      	r0, 0
    571e:	0822      	bt      	0x5762	// 5762 <EPT_IO_SET+0x46>
	{
		if(IO_Num_X==IO_NUM_PA07)
    5720:	3950      	cmpnei      	r1, 16
    5722:	080a      	bt      	0x5736	// 5736 <EPT_IO_SET+0x1a>
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)|0X60000000;				//PA0.7
    5724:	0379      	lrw      	r3, 0x20000050	// 593c <EPT_IO_SET+0x220>
    5726:	9340      	ld.w      	r2, (r3, 0x0)
    5728:	9260      	ld.w      	r3, (r2, 0x0)
    572a:	4364      	lsli      	r3, r3, 4
    572c:	4b64      	lsri      	r3, r3, 4
    572e:	3bbd      	bseti      	r3, 29
    5730:	3bbe      	bseti      	r3, 30
		{
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF)|0X00004000;				//PB0.3
		}
		else if(IO_Num_X==IO_NUM_PB00)
		{
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)|0X00000005;				//PB0.0
    5732:	b260      	st.w      	r3, (r2, 0x0)
		else if(IO_Num_X==IO_NUM_PB02)
		{
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)|0X00000700;				//PB0.2 EPI3
		}
	}
}
    5734:	783c      	jmp      	r15
		else if(IO_Num_X==IO_NUM_PA10)
    5736:	3951      	cmpnei      	r1, 17
    5738:	080b      	bt      	0x574e	// 574e <EPT_IO_SET+0x32>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF)|0X00000500;				//PA0.10
    573a:	037e      	lrw      	r3, 0x20000050	// 593c <EPT_IO_SET+0x220>
    573c:	32f0      	movi      	r2, 240
    573e:	9320      	ld.w      	r1, (r3, 0x0)
    5740:	9161      	ld.w      	r3, (r1, 0x4)
    5742:	4244      	lsli      	r2, r2, 4
    5744:	68c9      	andn      	r3, r2
    5746:	3ba8      	bseti      	r3, 8
    5748:	3baa      	bseti      	r3, 10
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)|0X00400000;				//PA0.13 EPI1
    574a:	b161      	st.w      	r3, (r1, 0x4)
    574c:	07f4      	br      	0x5734	// 5734 <EPT_IO_SET+0x18>
		else if(IO_Num_X==IO_NUM_PA15)
    574e:	3952      	cmpnei      	r1, 18
    5750:	0bf2      	bt      	0x5734	// 5734 <EPT_IO_SET+0x18>
			GPIOA0->CONHR = (GPIOA0->CONHR&0X0FFFFFFF)|0X40000000;				//PA0.15
    5752:	137b      	lrw      	r3, 0x20000050	// 593c <EPT_IO_SET+0x220>
    5754:	9340      	ld.w      	r2, (r3, 0x0)
    5756:	9261      	ld.w      	r3, (r2, 0x4)
    5758:	4364      	lsli      	r3, r3, 4
    575a:	4b64      	lsri      	r3, r3, 4
    575c:	3bbe      	bseti      	r3, 30
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0)|0X00000004;				//PA0.8
    575e:	b261      	st.w      	r3, (r2, 0x4)
    5760:	07ea      	br      	0x5734	// 5734 <EPT_IO_SET+0x18>
	else if(EPT_IO_X==EPT_IO_CHAY)
    5762:	3841      	cmpnei      	r0, 1
    5764:	0821      	bt      	0x57a6	// 57a6 <EPT_IO_SET+0x8a>
		if(IO_Num_X==IO_NUM_PB03)
    5766:	3953      	cmpnei      	r1, 19
    5768:	080a      	bt      	0x577c	// 577c <EPT_IO_SET+0x60>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF)|0X00005000;				//PB0.3
    576a:	1376      	lrw      	r3, 0x2000004c	// 5940 <EPT_IO_SET+0x224>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)|0X00005000;				//PA0.3
    576c:	9320      	ld.w      	r1, (r3, 0x0)
    576e:	32f0      	movi      	r2, 240
    5770:	9160      	ld.w      	r3, (r1, 0x0)
    5772:	4248      	lsli      	r2, r2, 8
    5774:	68c9      	andn      	r3, r2
    5776:	3bac      	bseti      	r3, 12
    5778:	3bae      	bseti      	r3, 14
    577a:	0422      	br      	0x57be	// 57be <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PB05)
    577c:	3954      	cmpnei      	r1, 20
    577e:	0809      	bt      	0x5790	// 5790 <EPT_IO_SET+0x74>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF0FFFFF)|0X00400000;				//PB0.5
    5780:	1370      	lrw      	r3, 0x2000004c	// 5940 <EPT_IO_SET+0x224>
    5782:	32f0      	movi      	r2, 240
    5784:	9320      	ld.w      	r1, (r3, 0x0)
    5786:	9160      	ld.w      	r3, (r1, 0x0)
    5788:	4250      	lsli      	r2, r2, 16
    578a:	68c9      	andn      	r3, r2
    578c:	3bb6      	bseti      	r3, 22
    578e:	0418      	br      	0x57be	// 57be <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PA12)
    5790:	3955      	cmpnei      	r1, 21
    5792:	0bd1      	bt      	0x5734	// 5734 <EPT_IO_SET+0x18>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFF0FFFF)|0X00050000;				//PA0.12
    5794:	136a      	lrw      	r3, 0x20000050	// 593c <EPT_IO_SET+0x220>
    5796:	32f0      	movi      	r2, 240
    5798:	9320      	ld.w      	r1, (r3, 0x0)
    579a:	9161      	ld.w      	r3, (r1, 0x4)
    579c:	424c      	lsli      	r2, r2, 12
    579e:	68c9      	andn      	r3, r2
    57a0:	3bb0      	bseti      	r3, 16
    57a2:	3bb2      	bseti      	r3, 18
    57a4:	07d3      	br      	0x574a	// 574a <EPT_IO_SET+0x2e>
	else if(EPT_IO_X==EPT_IO_CHBX)
    57a6:	3842      	cmpnei      	r0, 2
    57a8:	0822      	bt      	0x57ec	// 57ec <EPT_IO_SET+0xd0>
		if(IO_Num_X==IO_NUM_PB02)
    57aa:	3956      	cmpnei      	r1, 22
    57ac:	080b      	bt      	0x57c2	// 57c2 <EPT_IO_SET+0xa6>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)|0X00000600;				//PB0.2
    57ae:	1365      	lrw      	r3, 0x2000004c	// 5940 <EPT_IO_SET+0x224>
    57b0:	32f0      	movi      	r2, 240
    57b2:	9320      	ld.w      	r1, (r3, 0x0)
    57b4:	9160      	ld.w      	r3, (r1, 0x0)
    57b6:	4244      	lsli      	r2, r2, 4
    57b8:	68c9      	andn      	r3, r2
    57ba:	3ba9      	bseti      	r3, 9
    57bc:	3baa      	bseti      	r3, 10
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)|0X00000700;				//PB0.2 EPI3
    57be:	b160      	st.w      	r3, (r1, 0x0)
}
    57c0:	07ba      	br      	0x5734	// 5734 <EPT_IO_SET+0x18>
		else if(IO_Num_X==IO_NUM_PA11)
    57c2:	3957      	cmpnei      	r1, 23
    57c4:	080a      	bt      	0x57d8	// 57d8 <EPT_IO_SET+0xbc>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF)|0X00005000;				//PA0.11
    57c6:	127e      	lrw      	r3, 0x20000050	// 593c <EPT_IO_SET+0x220>
    57c8:	32f0      	movi      	r2, 240
    57ca:	9320      	ld.w      	r1, (r3, 0x0)
    57cc:	9161      	ld.w      	r3, (r1, 0x4)
    57ce:	4248      	lsli      	r2, r2, 8
    57d0:	68c9      	andn      	r3, r2
    57d2:	3bac      	bseti      	r3, 12
    57d4:	3bae      	bseti      	r3, 14
    57d6:	07ba      	br      	0x574a	// 574a <EPT_IO_SET+0x2e>
		else if(IO_Num_X==IO_NUM_PA14)
    57d8:	3958      	cmpnei      	r1, 24
    57da:	0bad      	bt      	0x5734	// 5734 <EPT_IO_SET+0x18>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XF0FFFFFF)|0X04000000;				//PA0.14
    57dc:	1278      	lrw      	r3, 0x20000050	// 593c <EPT_IO_SET+0x220>
    57de:	32f0      	movi      	r2, 240
    57e0:	9320      	ld.w      	r1, (r3, 0x0)
    57e2:	9161      	ld.w      	r3, (r1, 0x4)
    57e4:	4254      	lsli      	r2, r2, 20
    57e6:	68c9      	andn      	r3, r2
    57e8:	3bba      	bseti      	r3, 26
    57ea:	07b0      	br      	0x574a	// 574a <EPT_IO_SET+0x2e>
	else if(EPT_IO_X==EPT_IO_CHBY)
    57ec:	3843      	cmpnei      	r0, 3
    57ee:	0820      	bt      	0x582e	// 582e <EPT_IO_SET+0x112>
		if(IO_Num_X==IO_NUM_PB04)
    57f0:	3959      	cmpnei      	r1, 25
    57f2:	080a      	bt      	0x5806	// 5806 <EPT_IO_SET+0xea>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFF0FFFF)|0X00050000;				//PB0.4
    57f4:	1273      	lrw      	r3, 0x2000004c	// 5940 <EPT_IO_SET+0x224>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF0FFFF)|0X00050000;				//PA0.4
    57f6:	9320      	ld.w      	r1, (r3, 0x0)
    57f8:	32f0      	movi      	r2, 240
    57fa:	9160      	ld.w      	r3, (r1, 0x0)
    57fc:	424c      	lsli      	r2, r2, 12
    57fe:	68c9      	andn      	r3, r2
    5800:	3bb0      	bseti      	r3, 16
    5802:	3bb2      	bseti      	r3, 18
    5804:	07dd      	br      	0x57be	// 57be <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PA05)
    5806:	395a      	cmpnei      	r1, 26
    5808:	0809      	bt      	0x581a	// 581a <EPT_IO_SET+0xfe>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF)|0X00800000;				//PA0.5
    580a:	126d      	lrw      	r3, 0x20000050	// 593c <EPT_IO_SET+0x220>
    580c:	32f0      	movi      	r2, 240
    580e:	9320      	ld.w      	r1, (r3, 0x0)
    5810:	9160      	ld.w      	r3, (r1, 0x0)
    5812:	4250      	lsli      	r2, r2, 16
    5814:	68c9      	andn      	r3, r2
    5816:	3bb7      	bseti      	r3, 23
    5818:	07d3      	br      	0x57be	// 57be <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PA08)
    581a:	395b      	cmpnei      	r1, 27
    581c:	0b8c      	bt      	0x5734	// 5734 <EPT_IO_SET+0x18>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0)|0X00000005;				//PA0.8
    581e:	1268      	lrw      	r3, 0x20000050	// 593c <EPT_IO_SET+0x220>
    5820:	310f      	movi      	r1, 15
    5822:	9340      	ld.w      	r2, (r3, 0x0)
    5824:	9261      	ld.w      	r3, (r2, 0x4)
    5826:	68c5      	andn      	r3, r1
    5828:	3ba0      	bseti      	r3, 0
    582a:	3ba2      	bseti      	r3, 2
    582c:	0799      	br      	0x575e	// 575e <EPT_IO_SET+0x42>
	else if(EPT_IO_X==EPT_IO_CHCX)
    582e:	3844      	cmpnei      	r0, 4
    5830:	081b      	bt      	0x5866	// 5866 <EPT_IO_SET+0x14a>
		if(IO_Num_X==IO_NUM_PB05)
    5832:	3954      	cmpnei      	r1, 20
    5834:	0fa6      	bf      	0x5780	// 5780 <EPT_IO_SET+0x64>
		else if(IO_Num_X==IO_NUM_PA03)
    5836:	395c      	cmpnei      	r1, 28
    5838:	0803      	bt      	0x583e	// 583e <EPT_IO_SET+0x122>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)|0X00005000;				//PA0.3
    583a:	1261      	lrw      	r3, 0x20000050	// 593c <EPT_IO_SET+0x220>
    583c:	0798      	br      	0x576c	// 576c <EPT_IO_SET+0x50>
		else if(IO_Num_X==IO_NUM_PB03)
    583e:	3953      	cmpnei      	r1, 19
    5840:	0809      	bt      	0x5852	// 5852 <EPT_IO_SET+0x136>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF)|0X00004000;				//PB0.3
    5842:	1260      	lrw      	r3, 0x2000004c	// 5940 <EPT_IO_SET+0x224>
    5844:	32f0      	movi      	r2, 240
    5846:	9320      	ld.w      	r1, (r3, 0x0)
    5848:	9160      	ld.w      	r3, (r1, 0x0)
    584a:	4248      	lsli      	r2, r2, 8
    584c:	68c9      	andn      	r3, r2
    584e:	3bae      	bseti      	r3, 14
    5850:	07b7      	br      	0x57be	// 57be <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PB00)
    5852:	395d      	cmpnei      	r1, 29
    5854:	0b70      	bt      	0x5734	// 5734 <EPT_IO_SET+0x18>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)|0X00000005;				//PB0.0
    5856:	117b      	lrw      	r3, 0x2000004c	// 5940 <EPT_IO_SET+0x224>
    5858:	310f      	movi      	r1, 15
    585a:	9340      	ld.w      	r2, (r3, 0x0)
    585c:	9260      	ld.w      	r3, (r2, 0x0)
    585e:	68c5      	andn      	r3, r1
    5860:	3ba0      	bseti      	r3, 0
    5862:	3ba2      	bseti      	r3, 2
    5864:	0767      	br      	0x5732	// 5732 <EPT_IO_SET+0x16>
	else if(EPT_IO_X==EPT_IO_CHCY)
    5866:	3845      	cmpnei      	r0, 5
    5868:	0825      	bt      	0x58b2	// 58b2 <EPT_IO_SET+0x196>
		if(IO_Num_X==IO_NUM_PB04)
    586a:	3959      	cmpnei      	r1, 25
    586c:	0809      	bt      	0x587e	// 587e <EPT_IO_SET+0x162>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFF0FFFF)|0X00040000;				//PB0.4
    586e:	1175      	lrw      	r3, 0x2000004c	// 5940 <EPT_IO_SET+0x224>
    5870:	32f0      	movi      	r2, 240
    5872:	9320      	ld.w      	r1, (r3, 0x0)
    5874:	9160      	ld.w      	r3, (r1, 0x0)
    5876:	424c      	lsli      	r2, r2, 12
    5878:	68c9      	andn      	r3, r2
    587a:	3bb2      	bseti      	r3, 18
    587c:	07a1      	br      	0x57be	// 57be <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PA04)
    587e:	395e      	cmpnei      	r1, 30
    5880:	0803      	bt      	0x5886	// 5886 <EPT_IO_SET+0x16a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF0FFFF)|0X00050000;				//PA0.4
    5882:	116f      	lrw      	r3, 0x20000050	// 593c <EPT_IO_SET+0x220>
    5884:	07b9      	br      	0x57f6	// 57f6 <EPT_IO_SET+0xda>
		else if(IO_Num_X==IO_NUM_PA09)
    5886:	395f      	cmpnei      	r1, 31
    5888:	0809      	bt      	0x589a	// 589a <EPT_IO_SET+0x17e>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFF0F)|0X00000070;				//PA0.9
    588a:	116d      	lrw      	r3, 0x20000050	// 593c <EPT_IO_SET+0x220>
    588c:	31f0      	movi      	r1, 240
    588e:	9340      	ld.w      	r2, (r3, 0x0)
    5890:	9261      	ld.w      	r3, (r2, 0x4)
    5892:	68c5      	andn      	r3, r1
    5894:	3170      	movi      	r1, 112
    5896:	6cc4      	or      	r3, r1
    5898:	0763      	br      	0x575e	// 575e <EPT_IO_SET+0x42>
		else if(IO_Num_X==IO_NUM_PA013)
    589a:	3320      	movi      	r3, 32
    589c:	64c6      	cmpne      	r1, r3
    589e:	0b4b      	bt      	0x5734	// 5734 <EPT_IO_SET+0x18>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)|0X00500000;				//PA0.13
    58a0:	1167      	lrw      	r3, 0x20000050	// 593c <EPT_IO_SET+0x220>
    58a2:	32f0      	movi      	r2, 240
    58a4:	9320      	ld.w      	r1, (r3, 0x0)
    58a6:	9161      	ld.w      	r3, (r1, 0x4)
    58a8:	4250      	lsli      	r2, r2, 16
    58aa:	68c9      	andn      	r3, r2
    58ac:	3bb4      	bseti      	r3, 20
    58ae:	3bb6      	bseti      	r3, 22
    58b0:	074d      	br      	0x574a	// 574a <EPT_IO_SET+0x2e>
	else if(EPT_IO_X==EPT_IO_CHD)
    58b2:	3846      	cmpnei      	r0, 6
    58b4:	0815      	bt      	0x58de	// 58de <EPT_IO_SET+0x1c2>
		if(IO_Num_X==IO_NUM_PB03)
    58b6:	3953      	cmpnei      	r1, 19
    58b8:	080a      	bt      	0x58cc	// 58cc <EPT_IO_SET+0x1b0>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF)|0X00006000;				//PB0.3
    58ba:	1162      	lrw      	r3, 0x2000004c	// 5940 <EPT_IO_SET+0x224>
    58bc:	32f0      	movi      	r2, 240
    58be:	9320      	ld.w      	r1, (r3, 0x0)
    58c0:	9160      	ld.w      	r3, (r1, 0x0)
    58c2:	4248      	lsli      	r2, r2, 8
    58c4:	68c9      	andn      	r3, r2
    58c6:	3bad      	bseti      	r3, 13
    58c8:	3bae      	bseti      	r3, 14
    58ca:	077a      	br      	0x57be	// 57be <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PA08)
    58cc:	395b      	cmpnei      	r1, 27
    58ce:	0b33      	bt      	0x5734	// 5734 <EPT_IO_SET+0x18>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0)|0X00000004;				//PA0.8
    58d0:	107b      	lrw      	r3, 0x20000050	// 593c <EPT_IO_SET+0x220>
    58d2:	310f      	movi      	r1, 15
    58d4:	9340      	ld.w      	r2, (r3, 0x0)
    58d6:	9261      	ld.w      	r3, (r2, 0x4)
    58d8:	68c5      	andn      	r3, r1
    58da:	3ba2      	bseti      	r3, 2
    58dc:	0741      	br      	0x575e	// 575e <EPT_IO_SET+0x42>
	else if(EPT_IO_X==EPT_IO_EPI)
    58de:	3847      	cmpnei      	r0, 7
    58e0:	0b2a      	bt      	0x5734	// 5734 <EPT_IO_SET+0x18>
		if(IO_Num_X==IO_NUM_PA07)
    58e2:	3950      	cmpnei      	r1, 16
    58e4:	0809      	bt      	0x58f6	// 58f6 <EPT_IO_SET+0x1da>
			GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)|0X50000000;				//PA0.7 EPI0
    58e6:	1076      	lrw      	r3, 0x20000050	// 593c <EPT_IO_SET+0x220>
    58e8:	9340      	ld.w      	r2, (r3, 0x0)
    58ea:	9260      	ld.w      	r3, (r2, 0x0)
    58ec:	4364      	lsli      	r3, r3, 4
    58ee:	4b64      	lsri      	r3, r3, 4
    58f0:	3bbc      	bseti      	r3, 28
    58f2:	3bbe      	bseti      	r3, 30
    58f4:	071f      	br      	0x5732	// 5732 <EPT_IO_SET+0x16>
		else if(IO_Num_X==IO_NUM_PA013)
    58f6:	3320      	movi      	r3, 32
    58f8:	64c6      	cmpne      	r1, r3
    58fa:	0809      	bt      	0x590c	// 590c <EPT_IO_SET+0x1f0>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)|0X00400000;				//PA0.13 EPI1
    58fc:	1070      	lrw      	r3, 0x20000050	// 593c <EPT_IO_SET+0x220>
    58fe:	32f0      	movi      	r2, 240
    5900:	9320      	ld.w      	r1, (r3, 0x0)
    5902:	9161      	ld.w      	r3, (r1, 0x4)
    5904:	4250      	lsli      	r2, r2, 16
    5906:	68c9      	andn      	r3, r2
    5908:	3bb6      	bseti      	r3, 22
    590a:	0720      	br      	0x574a	// 574a <EPT_IO_SET+0x2e>
		else if(IO_Num_X==IO_NUM_PB03)
    590c:	3953      	cmpnei      	r1, 19
    590e:	080b      	bt      	0x5924	// 5924 <EPT_IO_SET+0x208>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF)|0X00007000;				//PB0.3 EPI2
    5910:	106c      	lrw      	r3, 0x2000004c	// 5940 <EPT_IO_SET+0x224>
    5912:	32f0      	movi      	r2, 240
    5914:	9320      	ld.w      	r1, (r3, 0x0)
    5916:	4248      	lsli      	r2, r2, 8
    5918:	9160      	ld.w      	r3, (r1, 0x0)
    591a:	68c9      	andn      	r3, r2
    591c:	32e0      	movi      	r2, 224
    591e:	4247      	lsli      	r2, r2, 7
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)|0X00000700;				//PB0.2 EPI3
    5920:	6cc8      	or      	r3, r2
    5922:	074e      	br      	0x57be	// 57be <EPT_IO_SET+0xa2>
		else if(IO_Num_X==IO_NUM_PB02)
    5924:	3956      	cmpnei      	r1, 22
    5926:	0b07      	bt      	0x5734	// 5734 <EPT_IO_SET+0x18>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)|0X00000700;				//PB0.2 EPI3
    5928:	1066      	lrw      	r3, 0x2000004c	// 5940 <EPT_IO_SET+0x224>
    592a:	32f0      	movi      	r2, 240
    592c:	9320      	ld.w      	r1, (r3, 0x0)
    592e:	4244      	lsli      	r2, r2, 4
    5930:	9160      	ld.w      	r3, (r1, 0x0)
    5932:	68c9      	andn      	r3, r2
    5934:	32e0      	movi      	r2, 224
    5936:	4243      	lsli      	r2, r2, 3
    5938:	07f4      	br      	0x5920	// 5920 <EPT_IO_SET+0x204>
    593a:	0000      	bkpt
    593c:	20000050 	.long	0x20000050
    5940:	2000004c 	.long	0x2000004c

Disassembly of section .text.EPT_PWM_Config:

00005944 <EPT_PWM_Config>:
/*************************************************************/  
//Fclk=Fpclk/(PSC+1)
void EPT_PWM_Config(EPT_TCLK_Selecte_Type EPT_TCLK_Selecte_X , EPT_CNTMD_SELECTE_Type EPT_CNTMD_SELECTE_X  , EPT_OPM_SELECTE_Type EPT_OPM_SELECTE_X
					, U16_T EPT_PSCR)		
//start选immediate模式,debug挂起PWM输出高阻,pwm停止时输出高阻,start控制位同步触发,ZRO载入PSCR(bit17:bit16)
{
    5944:	14c3      	push      	r4-r6
    5946:	6d8b      	mov      	r6, r2
	EPT0->CEDR=(EPT0->CEDR&0XFFFFFF00)|(0X01|EPT_TCLK_Selecte_X|(0X01<<1)|(0X01<<6));
    5948:	104a      	lrw      	r2, 0x20000024	// 5970 <EPT_PWM_Config+0x2c>
	if(EPT_TCLK_Selecte_X==EPT_Selecte_PCLK)
    594a:	3840      	cmpnei      	r0, 0
	EPT0->CEDR=(EPT0->CEDR&0XFFFFFF00)|(0X01|EPT_TCLK_Selecte_X|(0X01<<1)|(0X01<<6));
    594c:	92a0      	ld.w      	r5, (r2, 0x0)
    594e:	9580      	ld.w      	r4, (r5, 0x0)
    5950:	32ff      	movi      	r2, 255
    5952:	6909      	andn      	r4, r2
    5954:	3243      	movi      	r2, 67
    5956:	6d08      	or      	r4, r2
    5958:	6d00      	or      	r4, r0
    595a:	b580      	st.w      	r4, (r5, 0x0)
	if(EPT_TCLK_Selecte_X==EPT_Selecte_PCLK)
    595c:	0802      	bt      	0x5960	// 5960 <EPT_PWM_Config+0x1c>
	{
		EPT0->PSCR=EPT_PSCR;
    595e:	b562      	st.w      	r3, (r5, 0x8)
	}
	EPT0->CR=(EPT0->CR&0xfff8ffc0)|EPT_CNTMD_SELECTE_X|(0x0<<2)|(0x0<<3)|(0x0<<4)|EPT_OPM_SELECTE_X|(0X0<<16)|(0x1<<18);
    5960:	9543      	ld.w      	r2, (r5, 0xc)
    5962:	1065      	lrw      	r3, 0x7003f	// 5974 <EPT_PWM_Config+0x30>
    5964:	688d      	andn      	r2, r3
    5966:	6c98      	or      	r2, r6
    5968:	3ab2      	bseti      	r2, 18
    596a:	6c48      	or      	r1, r2
    596c:	b523      	st.w      	r1, (r5, 0xc)
} 
    596e:	1483      	pop      	r4-r6
    5970:	20000024 	.long	0x20000024
    5974:	0007003f 	.long	0x0007003f

Disassembly of section .text.EPT_PWMX_Output_Control:

00005978 <EPT_PWMX_Output_Control>:
							 EPT_PWM_CAU_Output_Type EPT_PWM_CAU_Event_Output , EPT_PWM_CAD_Output_Type EPT_PWM_CAD_Event_Output ,
							 EPT_PWM_CBU_Output_Type EPT_PWM_CBU_Event_Output , EPT_PWM_CBD_Output_Type EPT_PWM_CBD_Event_Output ,
							 EPT_PWM_T1U_Output_Type EPT_PWM_T1U_Event_Output , EPT_PWM_T1D_Output_Type EPT_PWM_T1D_Event_Output ,
							 EPT_PWM_T2U_Output_Type EPT_PWM_T2U_Event_Output , EPT_PWM_T2D_Output_Type EPT_PWM_T2D_Event_Output 
							 )
{
    5978:	14c4      	push      	r4-r7
    597a:	1425      	subi      	r14, r14, 20
    597c:	9889      	ld.w      	r4, (r14, 0x24)
    597e:	b880      	st.w      	r4, (r14, 0x0)
    5980:	988a      	ld.w      	r4, (r14, 0x28)
    5982:	b881      	st.w      	r4, (r14, 0x4)
    5984:	988b      	ld.w      	r4, (r14, 0x2c)
    5986:	b882      	st.w      	r4, (r14, 0x8)
    5988:	988c      	ld.w      	r4, (r14, 0x30)
    598a:	b883      	st.w      	r4, (r14, 0xc)
	if(EPT_PWMX_Selecte==EPT_PWMA)
    598c:	3840      	cmpnei      	r0, 0
{
    598e:	988d      	ld.w      	r4, (r14, 0x34)
    5990:	b884      	st.w      	r4, (r14, 0x10)
    5992:	98ce      	ld.w      	r6, (r14, 0x38)
    5994:	98ef      	ld.w      	r7, (r14, 0x3c)
    5996:	98b0      	ld.w      	r5, (r14, 0x40)
    5998:	9891      	ld.w      	r4, (r14, 0x44)
	if(EPT_PWMX_Selecte==EPT_PWMA)
    599a:	0816      	bt      	0x59c6	// 59c6 <EPT_PWMX_Output_Control+0x4e>
	{
		EPT0->AQCRA=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    599c:	6d14      	or      	r4, r5
    599e:	6d1c      	or      	r4, r7
    59a0:	98a4      	ld.w      	r5, (r14, 0x10)
    59a2:	6d18      	or      	r4, r6
    59a4:	6d14      	or      	r4, r5
    59a6:	98a3      	ld.w      	r5, (r14, 0xc)
    59a8:	6d14      	or      	r4, r5
    59aa:	98a2      	ld.w      	r5, (r14, 0x8)
    59ac:	6d14      	or      	r4, r5
    59ae:	98a1      	ld.w      	r5, (r14, 0x4)
    59b0:	6d14      	or      	r4, r5
    59b2:	98a0      	ld.w      	r5, (r14, 0x0)
    59b4:	6d14      	or      	r4, r5
    59b6:	6cd0      	or      	r3, r4
		EPT0->AQCRA=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    59b8:	1105      	lrw      	r0, 0x20000024	// 5a4c <EPT_PWMX_Output_Control+0xd4>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    59ba:	6c8c      	or      	r2, r3
		EPT0->AQCRA=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    59bc:	9000      	ld.w      	r0, (r0, 0x0)
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    59be:	6c48      	or      	r1, r2
		EPT0->AQCRA=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    59c0:	b032      	st.w      	r1, (r0, 0x48)
	{
		EPT0->AQCRD=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
	}
	
}
    59c2:	1405      	addi      	r14, r14, 20
    59c4:	1484      	pop      	r4-r7
	else if(EPT_PWMX_Selecte==EPT_PWMB)
    59c6:	3841      	cmpnei      	r0, 1
    59c8:	0815      	bt      	0x59f2	// 59f2 <EPT_PWMX_Output_Control+0x7a>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    59ca:	6d14      	or      	r4, r5
    59cc:	6d1c      	or      	r4, r7
    59ce:	98a4      	ld.w      	r5, (r14, 0x10)
    59d0:	6d18      	or      	r4, r6
    59d2:	6d14      	or      	r4, r5
    59d4:	98a3      	ld.w      	r5, (r14, 0xc)
    59d6:	6d14      	or      	r4, r5
    59d8:	98a2      	ld.w      	r5, (r14, 0x8)
    59da:	6d14      	or      	r4, r5
    59dc:	98a1      	ld.w      	r5, (r14, 0x4)
    59de:	6d14      	or      	r4, r5
    59e0:	98a0      	ld.w      	r5, (r14, 0x0)
    59e2:	6d14      	or      	r4, r5
    59e4:	6cd0      	or      	r3, r4
		EPT0->AQCRB=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    59e6:	101a      	lrw      	r0, 0x20000024	// 5a4c <EPT_PWMX_Output_Control+0xd4>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    59e8:	6c8c      	or      	r2, r3
		EPT0->AQCRB=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    59ea:	9000      	ld.w      	r0, (r0, 0x0)
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    59ec:	6c48      	or      	r1, r2
		EPT0->AQCRB=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    59ee:	b033      	st.w      	r1, (r0, 0x4c)
    59f0:	07e9      	br      	0x59c2	// 59c2 <EPT_PWMX_Output_Control+0x4a>
	else if(EPT_PWMX_Selecte==EPT_PWMC)
    59f2:	3842      	cmpnei      	r0, 2
    59f4:	0815      	bt      	0x5a1e	// 5a1e <EPT_PWMX_Output_Control+0xa6>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    59f6:	6d14      	or      	r4, r5
    59f8:	6d1c      	or      	r4, r7
    59fa:	98a4      	ld.w      	r5, (r14, 0x10)
    59fc:	6d18      	or      	r4, r6
    59fe:	6d14      	or      	r4, r5
    5a00:	98a3      	ld.w      	r5, (r14, 0xc)
    5a02:	6d14      	or      	r4, r5
    5a04:	98a2      	ld.w      	r5, (r14, 0x8)
    5a06:	6d14      	or      	r4, r5
    5a08:	98a1      	ld.w      	r5, (r14, 0x4)
    5a0a:	6d14      	or      	r4, r5
    5a0c:	98a0      	ld.w      	r5, (r14, 0x0)
    5a0e:	6d14      	or      	r4, r5
    5a10:	6cd0      	or      	r3, r4
		EPT0->AQCRC=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    5a12:	100f      	lrw      	r0, 0x20000024	// 5a4c <EPT_PWMX_Output_Control+0xd4>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    5a14:	6c8c      	or      	r2, r3
		EPT0->AQCRC=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    5a16:	9000      	ld.w      	r0, (r0, 0x0)
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    5a18:	6c48      	or      	r1, r2
		EPT0->AQCRC=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    5a1a:	b034      	st.w      	r1, (r0, 0x50)
    5a1c:	07d3      	br      	0x59c2	// 59c2 <EPT_PWMX_Output_Control+0x4a>
	else if(EPT_PWMX_Selecte==EPT_PWMD)
    5a1e:	3843      	cmpnei      	r0, 3
    5a20:	0bd1      	bt      	0x59c2	// 59c2 <EPT_PWMX_Output_Control+0x4a>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    5a22:	6d14      	or      	r4, r5
    5a24:	6d1c      	or      	r4, r7
    5a26:	98a4      	ld.w      	r5, (r14, 0x10)
    5a28:	6d18      	or      	r4, r6
    5a2a:	6d14      	or      	r4, r5
    5a2c:	98a3      	ld.w      	r5, (r14, 0xc)
    5a2e:	6d14      	or      	r4, r5
    5a30:	98a2      	ld.w      	r5, (r14, 0x8)
    5a32:	6d14      	or      	r4, r5
    5a34:	98a1      	ld.w      	r5, (r14, 0x4)
    5a36:	6d14      	or      	r4, r5
    5a38:	98a0      	ld.w      	r5, (r14, 0x0)
    5a3a:	6d14      	or      	r4, r5
    5a3c:	6cd0      	or      	r3, r4
		EPT0->AQCRD=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    5a3e:	1004      	lrw      	r0, 0x20000024	// 5a4c <EPT_PWMX_Output_Control+0xd4>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    5a40:	6c8c      	or      	r2, r3
		EPT0->AQCRD=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    5a42:	9000      	ld.w      	r0, (r0, 0x0)
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
    5a44:	6c48      	or      	r1, r2
		EPT0->AQCRD=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
    5a46:	b035      	st.w      	r1, (r0, 0x54)
}
    5a48:	07bd      	br      	0x59c2	// 59c2 <EPT_PWMX_Output_Control+0x4a>
    5a4a:	0000      	bkpt
    5a4c:	20000024 	.long	0x20000024

Disassembly of section .text.EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config:

00005a50 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config>:
//EPT_CMPB_Value:0~0xff
//EPT_CMPC_Value:0~0xff
//EPT_CMPD_Value:0~0xff
/*************************************************************/ 
void EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(U16_T EPT_PRDR_Value , U16_T EPT_CMPA_Value , U16_T EPT_CMPB_Value , U16_T EPT_CMPC_Value , U16_T EPT_CMPD_Value)
{
    5a50:	14c2      	push      	r4-r5
	EPT0->PRDR=EPT_PRDR_Value;
    5a52:	1086      	lrw      	r4, 0x20000024	// 5a68 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config+0x18>
{
    5a54:	d8ae1004 	ld.h      	r5, (r14, 0x8)
	EPT0->PRDR=EPT_PRDR_Value;
    5a58:	9480      	ld.w      	r4, (r4, 0x0)
    5a5a:	b409      	st.w      	r0, (r4, 0x24)
	EPT0->CMPA=EPT_CMPA_Value;
    5a5c:	b42b      	st.w      	r1, (r4, 0x2c)
	EPT0->CMPB=EPT_CMPB_Value;
    5a5e:	b44c      	st.w      	r2, (r4, 0x30)
	EPT0->CMPC=EPT_CMPC_Value;
    5a60:	b46d      	st.w      	r3, (r4, 0x34)
	EPT0->CMPD=EPT_CMPD_Value;
    5a62:	b4ae      	st.w      	r5, (r4, 0x38)
}
    5a64:	1482      	pop      	r4-r5
    5a66:	0000      	bkpt
    5a68:	20000024 	.long	0x20000024

Disassembly of section .text.EPT_Int_Enable:

00005a6c <EPT_Int_Enable>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void EPT_Int_Enable(EPT_INT_TypeDef EPT_X_INT)
{
	EPT0->ICR 	= EPT_X_INT;							//clear LVD INT status
    5a6c:	1064      	lrw      	r3, 0x20000024	// 5a7c <EPT_Int_Enable+0x10>
    5a6e:	9360      	ld.w      	r3, (r3, 0x0)
    5a70:	237f      	addi      	r3, 128
    5a72:	b317      	st.w      	r0, (r3, 0x5c)
	EPT0->IMCR  |= EPT_X_INT;
    5a74:	9356      	ld.w      	r2, (r3, 0x58)
    5a76:	6c08      	or      	r0, r2
    5a78:	b316      	st.w      	r0, (r3, 0x58)
}
    5a7a:	783c      	jmp      	r15
    5a7c:	20000024 	.long	0x20000024

Disassembly of section .text.EPT_Vector_Int_Enable:

00005a80 <EPT_Vector_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPT_Vector_Int_Enable(void)
{
	INTC_ISER_WRITE(EPT0_INT);    
    5a80:	3210      	movi      	r2, 16
    5a82:	1062      	lrw      	r3, 0xe000e100	// 5a88 <EPT_Vector_Int_Enable+0x8>
    5a84:	b340      	st.w      	r2, (r3, 0x0)
}
    5a86:	783c      	jmp      	r15
    5a88:	e000e100 	.long	0xe000e100

Disassembly of section .text.EPT_Vector_Int_Disable:

00005a8c <EPT_Vector_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPT_Vector_Int_Disable(void)
{
    INTC_ICER_WRITE(EPT0_INT);    
    5a8c:	3210      	movi      	r2, 16
    5a8e:	1062      	lrw      	r3, 0xe000e180	// 5a94 <EPT_Vector_Int_Disable+0x8>
    5a90:	b340      	st.w      	r2, (r3, 0x0)
}
    5a92:	783c      	jmp      	r15
    5a94:	e000e180 	.long	0xe000e180

Disassembly of section .text.ADC12_RESET_VALUE:

00005a98 <ADC12_RESET_VALUE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void ADC12_RESET_VALUE(void)
{
	 ADC0->ECR	=	ADC_ECR_RST;     				/**< ECR  reset value  */
    5a98:	107a      	lrw      	r3, 0x20000054	// 5b00 <ADC12_RESET_VALUE+0x68>
	 ADC0->DCR	=	ADC_DCR_RST;                  	/**< DCR  reset value  */
	 ADC0->PMSR	= 	ADC_PMSR_RST;       		  	/**< PMSR reset value  */
	 ADC0->CR	=	ADC_CR_RST;             		/**< CR   reset value  */
    5a9a:	3180      	movi      	r1, 128
	 ADC0->ECR	=	ADC_ECR_RST;     				/**< ECR  reset value  */
    5a9c:	9360      	ld.w      	r3, (r3, 0x0)
    5a9e:	3200      	movi      	r2, 0
	 ADC0->CR	=	ADC_CR_RST;             		/**< CR   reset value  */
    5aa0:	4138      	lsli      	r1, r1, 24
	 ADC0->ECR	=	ADC_ECR_RST;     				/**< ECR  reset value  */
    5aa2:	b340      	st.w      	r2, (r3, 0x0)
	 ADC0->DCR	=	ADC_DCR_RST;                  	/**< DCR  reset value  */
    5aa4:	b341      	st.w      	r2, (r3, 0x4)
	 ADC0->PMSR	= 	ADC_PMSR_RST;       		  	/**< PMSR reset value  */
    5aa6:	b342      	st.w      	r2, (r3, 0x8)
	 ADC0->CR	=	ADC_CR_RST;             		/**< CR   reset value  */
    5aa8:	b324      	st.w      	r1, (r3, 0x10)
	 ADC0->CSR	=   ADC_CSR_RST;                  	/**< CSR  reset value  */
	 ADC0->SR 	=	ADC_SR_RST;                   	/**< SR   reset value  */
	 ADC0->IER 	=	ADC_IER_RST;                	/**< IER  reset value  */
	 ADC0->IDR 	=	ADC_IDR_RST;              		/**< IDR  reset value  */
	 ADC0->IMR  	=	ADC_IMR_RST;               		/**< IMR  reset value  */
	 ADC0->SEQ[0]=	ADC_SEQx_RST;             		/**< SEQ0  reset value */
    5aaa:	3180      	movi      	r1, 128
	 ADC0->MR	=   ADC_MR_RST;                  	/**< MR   reset value  */
    5aac:	b345      	st.w      	r2, (r3, 0x14)
	 ADC0->CSR	=   ADC_CSR_RST;                  	/**< CSR  reset value  */
    5aae:	b347      	st.w      	r2, (r3, 0x1c)
	 ADC0->SR 	=	ADC_SR_RST;                   	/**< SR   reset value  */
    5ab0:	b348      	st.w      	r2, (r3, 0x20)
	 ADC0->IER 	=	ADC_IER_RST;                	/**< IER  reset value  */
    5ab2:	b349      	st.w      	r2, (r3, 0x24)
	 ADC0->IDR 	=	ADC_IDR_RST;              		/**< IDR  reset value  */
    5ab4:	b34a      	st.w      	r2, (r3, 0x28)
	 ADC0->IMR  	=	ADC_IMR_RST;               		/**< IMR  reset value  */
    5ab6:	b34b      	st.w      	r2, (r3, 0x2c)
	 ADC0->SEQ[0]=	ADC_SEQx_RST;             		/**< SEQ0  reset value */
    5ab8:	b32c      	st.w      	r1, (r3, 0x30)
	 ADC0->SEQ[1]=	ADC_SEQx_RST;             		/**< SEQ1  reset value */
    5aba:	b32d      	st.w      	r1, (r3, 0x34)
	 ADC0->SEQ[2]=	ADC_SEQx_RST;             		/**< SEQ2  reset value */
    5abc:	b32e      	st.w      	r1, (r3, 0x38)
	 ADC0->SEQ[3]=	ADC_SEQx_RST;             		/**< SEQ3  reset value */
    5abe:	b32f      	st.w      	r1, (r3, 0x3c)
	 ADC0->SEQ[4]=	ADC_SEQx_RST;             		/**< SEQ4  reset value */
    5ac0:	b330      	st.w      	r1, (r3, 0x40)
	 ADC0->SEQ[5]=	ADC_SEQx_RST;             		/**< SEQ5  reset value */
    5ac2:	b331      	st.w      	r1, (r3, 0x44)
	 ADC0->SEQ[6]=	ADC_SEQx_RST;             		/**< SEQ6  reset value */
    5ac4:	b332      	st.w      	r1, (r3, 0x48)
	 ADC0->SEQ[7]=	ADC_SEQx_RST;             		/**< SEQ7  reset value */
    5ac6:	b333      	st.w      	r1, (r3, 0x4c)
	 ADC0->SEQ[8]=	ADC_SEQx_RST;             		/**< SEQ8  reset value */
    5ac8:	b334      	st.w      	r1, (r3, 0x50)
	 ADC0->SEQ[9]=	ADC_SEQx_RST;             		/**< SEQ9  reset value */
    5aca:	b335      	st.w      	r1, (r3, 0x54)
	 ADC0->SEQ[10]=	ADC_SEQx_RST;             		/**< SEQ10  reset value */
    5acc:	b336      	st.w      	r1, (r3, 0x58)
	 ADC0->SEQ[11]=	ADC_SEQx_RST;             		/**< SEQ11  reset value */
    5ace:	b337      	st.w      	r1, (r3, 0x5c)
	 ADC0->SEQ[12]=	ADC_SEQx_RST;             		/**< SEQ12  reset value */
    5ad0:	b338      	st.w      	r1, (r3, 0x60)
	 ADC0->SEQ[13]=	ADC_SEQx_RST;             		/**< SEQ13  reset value */
    5ad2:	b339      	st.w      	r1, (r3, 0x64)
	 ADC0->SEQ[14]=	ADC_SEQx_RST;             		/**< SEQ14  reset value */
    5ad4:	b33a      	st.w      	r1, (r3, 0x68)
	 ADC0->SEQ[15]=	ADC_SEQx_RST;             		/**< SEQ15  reset value */
    5ad6:	b33b      	st.w      	r1, (r3, 0x6c)
	 ADC0->DR[0]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ad8:	23ff      	addi      	r3, 256
    5ada:	b340      	st.w      	r2, (r3, 0x0)
	 ADC0->DR[1]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5adc:	b341      	st.w      	r2, (r3, 0x4)
	 ADC0->DR[2]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ade:	b342      	st.w      	r2, (r3, 0x8)
	 ADC0->DR[3]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ae0:	b343      	st.w      	r2, (r3, 0xc)
	 ADC0->DR[4]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ae2:	b344      	st.w      	r2, (r3, 0x10)
	 ADC0->DR[5]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ae4:	b345      	st.w      	r2, (r3, 0x14)
	 ADC0->DR[6]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ae6:	b346      	st.w      	r2, (r3, 0x18)
	 ADC0->DR[7]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5ae8:	b347      	st.w      	r2, (r3, 0x1c)
	 ADC0->DR[8]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5aea:	b348      	st.w      	r2, (r3, 0x20)
	 ADC0->DR[9]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5aec:	b349      	st.w      	r2, (r3, 0x24)
	 ADC0->DR[10]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5aee:	b34a      	st.w      	r2, (r3, 0x28)
	 ADC0->DR[11]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5af0:	b34b      	st.w      	r2, (r3, 0x2c)
	 ADC0->DR[12]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5af2:	b34c      	st.w      	r2, (r3, 0x30)
	 ADC0->DR[13]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5af4:	b34d      	st.w      	r2, (r3, 0x34)
	 ADC0->DR[14]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5af6:	b34e      	st.w      	r2, (r3, 0x38)
	 ADC0->DR[15]  =	ADC_DR_RST;                		/**< DR   reset value  */
    5af8:	b34f      	st.w      	r2, (r3, 0x3c)
	 ADC0->CMP0   =	ADC_CMP0_RST;               	/**< CMP1 reset value  */
    5afa:	b350      	st.w      	r2, (r3, 0x40)
	 ADC0->CMP1   =	ADC_CMP1_RST;                	/**< CMP2 reset value  */
    5afc:	b351      	st.w      	r2, (r3, 0x44)
}  
    5afe:	783c      	jmp      	r15
    5b00:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_Control:

00005b04 <ADC12_Control>:
//ReturnValue:NONE
/*************************************************************/  
  //control:ADC enable/disable ,start/stop,swrst
void ADC12_Control(ADC12_Control_TypeDef ADC12_Control_x )
{
	ADC0->CR |= ADC12_Control_x;							// 
    5b04:	1063      	lrw      	r3, 0x20000054	// 5b10 <ADC12_Control+0xc>
    5b06:	9340      	ld.w      	r2, (r3, 0x0)
    5b08:	9264      	ld.w      	r3, (r2, 0x10)
    5b0a:	6c0c      	or      	r0, r3
    5b0c:	b204      	st.w      	r0, (r2, 0x10)
}
    5b0e:	783c      	jmp      	r15
    5b10:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_CMD.part.0:

00005b14 <ADC12_CMD.part.0>:
//ADC12 ENABLE
//EntryParameter:NewState
//NewState:ENABLE , DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ADC12_CMD(FunctionalStatus NewState)
    5b14:	14d0      	push      	r15
{
	if (NewState != DISABLE)
	{
		ADC12_Control(ADC12_ADCEN);						//ADC12 ENABLE
    5b16:	3002      	movi      	r0, 2
    5b18:	e3fffff6 	bsr      	0x5b04	// 5b04 <ADC12_Control>
		while(!(ADC0->SR &ADC12_ADCENS));
    5b1c:	1065      	lrw      	r3, 0x20000054	// 5b30 <ADC12_CMD.part.0+0x1c>
    5b1e:	3280      	movi      	r2, 128
    5b20:	9320      	ld.w      	r1, (r3, 0x0)
    5b22:	4241      	lsli      	r2, r2, 1
    5b24:	9168      	ld.w      	r3, (r1, 0x20)
    5b26:	68c8      	and      	r3, r2
    5b28:	3b40      	cmpnei      	r3, 0
    5b2a:	0ffd      	bf      	0x5b24	// 5b24 <ADC12_CMD.part.0+0x10>
	else
	{
		ADC12_Control(ADC12_ADCDIS);					//ADC12 DISABLE
		while(ADC0->SR&ADC12_ADCENS);
	}
}
    5b2c:	1490      	pop      	r15
    5b2e:	0000      	bkpt
    5b30:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_CLK_CMD:

00005b34 <ADC12_CLK_CMD>:
	if (NewState != DISABLE)
    5b34:	3940      	cmpnei      	r1, 0
    5b36:	106a      	lrw      	r3, 0x20000054	// 5b5c <ADC12_CLK_CMD+0x28>
		ADC0->ECR  |= ADC_CLK_CMD;						//ENABLE
    5b38:	9340      	ld.w      	r2, (r3, 0x0)
	if (NewState != DISABLE)
    5b3a:	0c09      	bf      	0x5b4c	// 5b4c <ADC12_CLK_CMD+0x18>
		ADC0->ECR  |= ADC_CLK_CMD;						//ENABLE
    5b3c:	9260      	ld.w      	r3, (r2, 0x0)
    5b3e:	6cc0      	or      	r3, r0
    5b40:	b260      	st.w      	r3, (r2, 0x0)
		while(!(ADC0->PMSR&ADC_CLK_CMD));
    5b42:	9262      	ld.w      	r3, (r2, 0x8)
    5b44:	68c0      	and      	r3, r0
    5b46:	3b40      	cmpnei      	r3, 0
    5b48:	0ffd      	bf      	0x5b42	// 5b42 <ADC12_CLK_CMD+0xe>
}
    5b4a:	783c      	jmp      	r15
		ADC0->DCR  |= ADC_CLK_CMD;						//DISABLE
    5b4c:	9261      	ld.w      	r3, (r2, 0x4)
    5b4e:	6cc0      	or      	r3, r0
    5b50:	b261      	st.w      	r3, (r2, 0x4)
		while(ADC0->PMSR&ADC_CLK_CMD);
    5b52:	9262      	ld.w      	r3, (r2, 0x8)
    5b54:	68c0      	and      	r3, r0
    5b56:	3b40      	cmpnei      	r3, 0
    5b58:	0bfd      	bt      	0x5b52	// 5b52 <ADC12_CLK_CMD+0x1e>
    5b5a:	07f8      	br      	0x5b4a	// 5b4a <ADC12_CLK_CMD+0x16>
    5b5c:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_CMD:

00005b60 <ADC12_CMD>:
{
    5b60:	14d0      	push      	r15
	if (NewState != DISABLE)
    5b62:	3840      	cmpnei      	r0, 0
    5b64:	0c04      	bf      	0x5b6c	// 5b6c <ADC12_CMD+0xc>
    5b66:	e3ffffd7 	bsr      	0x5b14	// 5b14 <ADC12_CMD.part.0>
}
    5b6a:	1490      	pop      	r15
		ADC12_Control(ADC12_ADCDIS);					//ADC12 DISABLE
    5b6c:	3004      	movi      	r0, 4
    5b6e:	e3ffffcb 	bsr      	0x5b04	// 5b04 <ADC12_Control>
		while(ADC0->SR&ADC12_ADCENS);
    5b72:	1065      	lrw      	r3, 0x20000054	// 5b84 <ADC12_CMD+0x24>
    5b74:	3280      	movi      	r2, 128
    5b76:	9320      	ld.w      	r1, (r3, 0x0)
    5b78:	4241      	lsli      	r2, r2, 1
    5b7a:	9168      	ld.w      	r3, (r1, 0x20)
    5b7c:	68c8      	and      	r3, r2
    5b7e:	3b40      	cmpnei      	r3, 0
    5b80:	0bfd      	bt      	0x5b7a	// 5b7a <ADC12_CMD+0x1a>
    5b82:	07f4      	br      	0x5b6a	// 5b6a <ADC12_CMD+0xa>
    5b84:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_ready_wait:

00005b88 <ADC12_ready_wait>:
//EntryParameter:NONE
//ReturnValue:ADC12 READ FLAG
/*************************************************************/ 
void ADC12_ready_wait(void)  
{
	while(!(ADC0->SR&ADC12_READY));   					// Waiting for ADC0 Ready
    5b88:	1064      	lrw      	r3, 0x20000054	// 5b98 <ADC12_ready_wait+0x10>
    5b8a:	3202      	movi      	r2, 2
    5b8c:	9320      	ld.w      	r1, (r3, 0x0)
    5b8e:	9168      	ld.w      	r3, (r1, 0x20)
    5b90:	68c8      	and      	r3, r2
    5b92:	3b40      	cmpnei      	r3, 0
    5b94:	0ffd      	bf      	0x5b8e	// 5b8e <ADC12_ready_wait+0x6>
}
    5b96:	783c      	jmp      	r15
    5b98:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_SEQEND_wait:

00005b9c <ADC12_SEQEND_wait>:
//EntryParameter:NONE
//ReturnValue:ADC12 EOC
/*************************************************************/ 
void ADC12_SEQEND_wait(U8_T val)
{
	while(!(ADC0->SR & (0x01ul << (16+val))));			// EOC wait
    5b9c:	200f      	addi      	r0, 16
    5b9e:	1065      	lrw      	r3, 0x20000054	// 5bb0 <ADC12_SEQEND_wait+0x14>
    5ba0:	3201      	movi      	r2, 1
    5ba2:	9320      	ld.w      	r1, (r3, 0x0)
    5ba4:	7080      	lsl      	r2, r0
    5ba6:	9168      	ld.w      	r3, (r1, 0x20)
    5ba8:	68c8      	and      	r3, r2
    5baa:	3b40      	cmpnei      	r3, 0
    5bac:	0ffd      	bf      	0x5ba6	// 5ba6 <ADC12_SEQEND_wait+0xa>
}  
    5bae:	783c      	jmp      	r15
    5bb0:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_DATA_OUPUT:

00005bb4 <ADC12_DATA_OUPUT>:
//EntryParameter:NONE
//ReturnValue:ADC12 DR
/*************************************************************/ 
U16_T ADC12_DATA_OUPUT(U16_T Data_index )
{
	return(ADC0->DR[Data_index]);
    5bb4:	203f      	addi      	r0, 64
    5bb6:	1064      	lrw      	r3, 0x20000054	// 5bc4 <ADC12_DATA_OUPUT+0x10>
    5bb8:	4002      	lsli      	r0, r0, 2
    5bba:	9360      	ld.w      	r3, (r3, 0x0)
    5bbc:	600c      	addu      	r0, r3
    5bbe:	9000      	ld.w      	r0, (r0, 0x0)
    5bc0:	7401      	zexth      	r0, r0
} 
    5bc2:	783c      	jmp      	r15
    5bc4:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_Configure_Mode:

00005bc8 <ADC12_Configure_Mode>:
  //10BIT or 12BIT adc ;
  //ADC12_BIT_SELECTED:ADC12_12BIT/ADC12_10BIT;
  //ADC12_ConverMode:One_shot_mode/Continuous_mode;
  //adc date output=last number of Conversions;
void  ADC12_Configure_Mode(ADC12_10bitor12bit_TypeDef ADC12_BIT_SELECTED  , ADC12_ConverMode_TypeDef  ADC12_ConverMode  , U8_T ADC12_PRI, U8_T adc12_SHR , U8_T ADC12_DIV , U8_T NumConver) 
{
    5bc8:	14d4      	push      	r4-r7, r15
    5bca:	1422      	subi      	r14, r14, 8
    5bcc:	1c08      	addi      	r4, r14, 32
    5bce:	84a0      	ld.b      	r5, (r4, 0x0)
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    5bd0:	2d00      	subi      	r5, 1
{
    5bd2:	6dc3      	mov      	r7, r0
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    5bd4:	10db      	lrw      	r6, 0x20000054	// 5c40 <ADC12_Configure_Mode+0x78>
{
    5bd6:	d80e001c 	ld.b      	r0, (r14, 0x1c)
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    5bda:	45aa      	lsli      	r5, r5, 10
    5bdc:	9680      	ld.w      	r4, (r6, 0x0)
    5bde:	6d40      	or      	r5, r0
	if(ADC12_ConverMode==One_shot_mode)
    5be0:	3940      	cmpnei      	r1, 0
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    5be2:	b4a5      	st.w      	r5, (r4, 0x14)
	if(ADC12_ConverMode==One_shot_mode)
    5be4:	081c      	bt      	0x5c1c	// 5c1c <ADC12_Configure_Mode+0x54>
	{
		ADC0->MR&=~CONTCV;								//one short mode
    5be6:	9425      	ld.w      	r1, (r4, 0x14)
    5be8:	4121      	lsli      	r1, r1, 1
    5bea:	4921      	lsri      	r1, r1, 1
		while(ADC0->SR&ADC12_CTCVS);							
    5bec:	3080      	movi      	r0, 128
		ADC0->MR&=~CONTCV;								//one short mode
    5bee:	b425      	st.w      	r1, (r4, 0x14)
		while(ADC0->SR&ADC12_CTCVS);							
    5bf0:	4002      	lsli      	r0, r0, 2
    5bf2:	9428      	ld.w      	r1, (r4, 0x20)
    5bf4:	6840      	and      	r1, r0
    5bf6:	3940      	cmpnei      	r1, 0
    5bf8:	0bfd      	bt      	0x5bf2	// 5bf2 <ADC12_Configure_Mode+0x2a>
    5bfa:	b861      	st.w      	r3, (r14, 0x4)
    5bfc:	b840      	st.w      	r2, (r14, 0x0)
    5bfe:	e3ffff8b 	bsr      	0x5b14	// 5b14 <ADC12_CMD.part.0>
	{
		ADC0->MR|=CONTCV;								//Continuous mode
		while(!(ADC0->SR&ADC12_CTCVS));							
	}
	ADC12_CMD(ENABLE);									//ADC0 enable
	if(ADC12_BIT_SELECTED)
    5c02:	3f40      	cmpnei      	r7, 0
    5c04:	9840      	ld.w      	r2, (r14, 0x0)
    5c06:	9861      	ld.w      	r3, (r14, 0x4)
    5c08:	0c16      	bf      	0x5c34	// 5c34 <ADC12_Configure_Mode+0x6c>
	{
		ADC0->CR|=ADC12_10BITor12BIT;
    5c0a:	9600      	ld.w      	r0, (r6, 0x0)
    5c0c:	9024      	ld.w      	r1, (r0, 0x10)
    5c0e:	39bf      	bseti      	r1, 31
	}
	else
	{
		ADC0->CR&=~ADC12_10BITor12BIT;
    5c10:	b024      	st.w      	r1, (r0, 0x10)
	}
	//ADC0->CR|=ADC12_VREF_VDD | ADC12_FVR_DIS;
	ADC0->PRI=ADC12_PRI;
    5c12:	9620      	ld.w      	r1, (r6, 0x0)
    5c14:	b15c      	st.w      	r2, (r1, 0x70)
	ADC0->SHR=adc12_SHR;						//采样保持周期
    5c16:	b166      	st.w      	r3, (r1, 0x18)
} 
    5c18:	1402      	addi      	r14, r14, 8
    5c1a:	1494      	pop      	r4-r7, r15
	else if(ADC12_ConverMode==Continuous_mode)
    5c1c:	3941      	cmpnei      	r1, 1
    5c1e:	0bee      	bt      	0x5bfa	// 5bfa <ADC12_Configure_Mode+0x32>
		ADC0->MR|=CONTCV;								//Continuous mode
    5c20:	9425      	ld.w      	r1, (r4, 0x14)
    5c22:	39bf      	bseti      	r1, 31
		while(!(ADC0->SR&ADC12_CTCVS));							
    5c24:	3080      	movi      	r0, 128
		ADC0->MR|=CONTCV;								//Continuous mode
    5c26:	b425      	st.w      	r1, (r4, 0x14)
		while(!(ADC0->SR&ADC12_CTCVS));							
    5c28:	4002      	lsli      	r0, r0, 2
    5c2a:	9428      	ld.w      	r1, (r4, 0x20)
    5c2c:	6840      	and      	r1, r0
    5c2e:	3940      	cmpnei      	r1, 0
    5c30:	0ffd      	bf      	0x5c2a	// 5c2a <ADC12_Configure_Mode+0x62>
    5c32:	07e4      	br      	0x5bfa	// 5bfa <ADC12_Configure_Mode+0x32>
		ADC0->CR&=~ADC12_10BITor12BIT;
    5c34:	9600      	ld.w      	r0, (r6, 0x0)
    5c36:	9024      	ld.w      	r1, (r0, 0x10)
    5c38:	4121      	lsli      	r1, r1, 1
    5c3a:	4921      	lsri      	r1, r1, 1
    5c3c:	07ea      	br      	0x5c10	// 5c10 <ADC12_Configure_Mode+0x48>
    5c3e:	0000      	bkpt
    5c40:	20000054 	.long	0x20000054

Disassembly of section .text.ADC12_Configure_VREF_Selecte:

00005c44 <ADC12_Configure_VREF_Selecte>:
//EntryParameter:NONE
//ReturnValue:None
/*************************************************************/ 
void ADC12_Configure_VREF_Selecte(ADC12_VREFP_VREFN_Selected_TypeDef ADC12_VREFP_X_VREFN_X )
{
	if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_VDD_VREFN_VSS)
    5c44:	3840      	cmpnei      	r0, 0
    5c46:	0808      	bt      	0x5c56	// 5c56 <ADC12_Configure_VREF_Selecte+0x12>
	{
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x00<<6);
    5c48:	1277      	lrw      	r3, 0x20000054	// 5da4 <ADC12_Configure_VREF_Selecte+0x160>
    5c4a:	1238      	lrw      	r1, 0x30103c0	// 5da8 <ADC12_Configure_VREF_Selecte+0x164>
    5c4c:	9340      	ld.w      	r2, (r3, 0x0)
    5c4e:	9264      	ld.w      	r3, (r2, 0x10)
    5c50:	68c5      	andn      	r3, r1
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0B<<6)|(0X01<<24)|(0X01<<25);	
	}
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_INTVREF1000_VREFN_EXIT)
	{
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00008000;					
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0C<<6)|(0X00<<16)|(0X02<<17);	
    5c52:	b264      	st.w      	r3, (r2, 0x10)
	}
}
    5c54:	783c      	jmp      	r15
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_EXIT_VREFN_VSS)
    5c56:	3841      	cmpnei      	r0, 1
    5c58:	0810      	bt      	0x5c78	// 5c78 <ADC12_Configure_VREF_Selecte+0x34>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;							
    5c5a:	1275      	lrw      	r3, 0x20000050	// 5dac <ADC12_Configure_VREF_Selecte+0x168>
    5c5c:	32f0      	movi      	r2, 240
    5c5e:	9320      	ld.w      	r1, (r3, 0x0)
    5c60:	9160      	ld.w      	r3, (r1, 0x0)
    5c62:	4244      	lsli      	r2, r2, 4
    5c64:	68c9      	andn      	r3, r2
    5c66:	3bab      	bseti      	r3, 11
    5c68:	b160      	st.w      	r3, (r1, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x01<<6);
    5c6a:	1230      	lrw      	r1, 0x30103c0	// 5da8 <ADC12_Configure_VREF_Selecte+0x164>
    5c6c:	126e      	lrw      	r3, 0x20000054	// 5da4 <ADC12_Configure_VREF_Selecte+0x160>
    5c6e:	9340      	ld.w      	r2, (r3, 0x0)
    5c70:	9264      	ld.w      	r3, (r2, 0x10)
    5c72:	68c5      	andn      	r3, r1
    5c74:	3ba6      	bseti      	r3, 6
    5c76:	07ee      	br      	0x5c52	// 5c52 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR2048_VREFN_VSS)
    5c78:	3842      	cmpnei      	r0, 2
    5c7a:	0811      	bt      	0x5c9c	// 5c9c <ADC12_Configure_VREF_Selecte+0x58>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;							
    5c7c:	126c      	lrw      	r3, 0x20000050	// 5dac <ADC12_Configure_VREF_Selecte+0x168>
    5c7e:	32f0      	movi      	r2, 240
    5c80:	9320      	ld.w      	r1, (r3, 0x0)
    5c82:	9160      	ld.w      	r3, (r1, 0x0)
    5c84:	4244      	lsli      	r2, r2, 4
    5c86:	68c9      	andn      	r3, r2
    5c88:	3bab      	bseti      	r3, 11
    5c8a:	b160      	st.w      	r3, (r1, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x02<<6)|(0X01<<24)|(0X00<<25);
    5c8c:	1227      	lrw      	r1, 0x30103c0	// 5da8 <ADC12_Configure_VREF_Selecte+0x164>
    5c8e:	1266      	lrw      	r3, 0x20000054	// 5da4 <ADC12_Configure_VREF_Selecte+0x160>
    5c90:	9340      	ld.w      	r2, (r3, 0x0)
    5c92:	9264      	ld.w      	r3, (r2, 0x10)
    5c94:	68c5      	andn      	r3, r1
    5c96:	3ba7      	bseti      	r3, 7
    5c98:	3bb8      	bseti      	r3, 24
    5c9a:	07dc      	br      	0x5c52	// 5c52 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR4096_VREFN_VSS)
    5c9c:	3843      	cmpnei      	r0, 3
    5c9e:	0811      	bt      	0x5cc0	// 5cc0 <ADC12_Configure_VREF_Selecte+0x7c>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;							
    5ca0:	1263      	lrw      	r3, 0x20000050	// 5dac <ADC12_Configure_VREF_Selecte+0x168>
    5ca2:	32f0      	movi      	r2, 240
    5ca4:	9320      	ld.w      	r1, (r3, 0x0)
    5ca6:	9160      	ld.w      	r3, (r1, 0x0)
    5ca8:	4244      	lsli      	r2, r2, 4
    5caa:	68c9      	andn      	r3, r2
    5cac:	3bab      	bseti      	r3, 11
    5cae:	b160      	st.w      	r3, (r1, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x03<<6)|(0X01<<24)|(0X01<<25);
    5cb0:	113e      	lrw      	r1, 0x30103c0	// 5da8 <ADC12_Configure_VREF_Selecte+0x164>
    5cb2:	117d      	lrw      	r3, 0x20000054	// 5da4 <ADC12_Configure_VREF_Selecte+0x160>
    5cb4:	9340      	ld.w      	r2, (r3, 0x0)
    5cb6:	9264      	ld.w      	r3, (r2, 0x10)
    5cb8:	68c5      	andn      	r3, r1
    5cba:	113e      	lrw      	r1, 0x30000c0	// 5db0 <ADC12_Configure_VREF_Selecte+0x16c>
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0C<<6)|(0X00<<16)|(0X02<<17);	
    5cbc:	6cc4      	or      	r3, r1
    5cbe:	07ca      	br      	0x5c52	// 5c52 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_INTVREF1000_VREFN_VSS)
    5cc0:	3845      	cmpnei      	r0, 5
    5cc2:	0809      	bt      	0x5cd4	// 5cd4 <ADC12_Configure_VREF_Selecte+0x90>
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x04<<6)|(0X00<<16)|(0X02<<17);
    5cc4:	1178      	lrw      	r3, 0x20000054	// 5da4 <ADC12_Configure_VREF_Selecte+0x160>
    5cc6:	113c      	lrw      	r1, 0x30503c0	// 5db4 <ADC12_Configure_VREF_Selecte+0x170>
    5cc8:	9340      	ld.w      	r2, (r3, 0x0)
    5cca:	9264      	ld.w      	r3, (r2, 0x10)
    5ccc:	68c5      	andn      	r3, r1
    5cce:	3ba8      	bseti      	r3, 8
    5cd0:	3bb2      	bseti      	r3, 18
    5cd2:	07c0      	br      	0x5c52	// 5c52 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_VDD_VREFN_EXIT)
    5cd4:	3846      	cmpnei      	r0, 6
    5cd6:	0810      	bt      	0x5cf6	// 5cf6 <ADC12_Configure_VREF_Selecte+0xb2>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00008000;	
    5cd8:	1175      	lrw      	r3, 0x20000050	// 5dac <ADC12_Configure_VREF_Selecte+0x168>
    5cda:	32f0      	movi      	r2, 240
    5cdc:	9320      	ld.w      	r1, (r3, 0x0)
    5cde:	9160      	ld.w      	r3, (r1, 0x0)
    5ce0:	4248      	lsli      	r2, r2, 8
    5ce2:	68c9      	andn      	r3, r2
    5ce4:	3baf      	bseti      	r3, 15
    5ce6:	b160      	st.w      	r3, (r1, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x08<<6);
    5ce8:	1130      	lrw      	r1, 0x30103c0	// 5da8 <ADC12_Configure_VREF_Selecte+0x164>
    5cea:	116f      	lrw      	r3, 0x20000054	// 5da4 <ADC12_Configure_VREF_Selecte+0x160>
    5cec:	9340      	ld.w      	r2, (r3, 0x0)
    5cee:	9264      	ld.w      	r3, (r2, 0x10)
    5cf0:	68c5      	andn      	r3, r1
    5cf2:	3ba9      	bseti      	r3, 9
    5cf4:	07af      	br      	0x5c52	// 5c52 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_EXIT_VREFN_EXIT)
    5cf6:	3847      	cmpnei      	r0, 7
    5cf8:	0817      	bt      	0x5d26	// 5d26 <ADC12_Configure_VREF_Selecte+0xe2>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00008000;
    5cfa:	116d      	lrw      	r3, 0x20000050	// 5dac <ADC12_Configure_VREF_Selecte+0x168>
    5cfc:	31f0      	movi      	r1, 240
    5cfe:	9340      	ld.w      	r2, (r3, 0x0)
    5d00:	9260      	ld.w      	r3, (r2, 0x0)
    5d02:	4128      	lsli      	r1, r1, 8
    5d04:	68c5      	andn      	r3, r1
    5d06:	3baf      	bseti      	r3, 15
    5d08:	b260      	st.w      	r3, (r2, 0x0)
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;			
    5d0a:	31f0      	movi      	r1, 240
    5d0c:	9260      	ld.w      	r3, (r2, 0x0)
    5d0e:	4124      	lsli      	r1, r1, 4
    5d10:	68c5      	andn      	r3, r1
    5d12:	3bab      	bseti      	r3, 11
    5d14:	b260      	st.w      	r3, (r2, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x09<<6);
    5d16:	1125      	lrw      	r1, 0x30103c0	// 5da8 <ADC12_Configure_VREF_Selecte+0x164>
    5d18:	1163      	lrw      	r3, 0x20000054	// 5da4 <ADC12_Configure_VREF_Selecte+0x160>
    5d1a:	9340      	ld.w      	r2, (r3, 0x0)
    5d1c:	9264      	ld.w      	r3, (r2, 0x10)
    5d1e:	68c5      	andn      	r3, r1
    5d20:	3ba6      	bseti      	r3, 6
    5d22:	3ba9      	bseti      	r3, 9
    5d24:	0797      	br      	0x5c52	// 5c52 <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR2048_VREFN_EXIT)
    5d26:	3848      	cmpnei      	r0, 8
    5d28:	0816      	bt      	0x5d54	// 5d54 <ADC12_Configure_VREF_Selecte+0x110>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00008000;	
    5d2a:	1161      	lrw      	r3, 0x20000050	// 5dac <ADC12_Configure_VREF_Selecte+0x168>
    5d2c:	31f0      	movi      	r1, 240
    5d2e:	9340      	ld.w      	r2, (r3, 0x0)
    5d30:	9260      	ld.w      	r3, (r2, 0x0)
    5d32:	4128      	lsli      	r1, r1, 8
    5d34:	68c5      	andn      	r3, r1
    5d36:	3baf      	bseti      	r3, 15
    5d38:	b260      	st.w      	r3, (r2, 0x0)
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;
    5d3a:	31f0      	movi      	r1, 240
    5d3c:	9260      	ld.w      	r3, (r2, 0x0)
    5d3e:	4124      	lsli      	r1, r1, 4
    5d40:	68c5      	andn      	r3, r1
    5d42:	3bab      	bseti      	r3, 11
    5d44:	b260      	st.w      	r3, (r2, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0A<<6)|(0X01<<24)|(0X00<<25);			
    5d46:	1039      	lrw      	r1, 0x30103c0	// 5da8 <ADC12_Configure_VREF_Selecte+0x164>
    5d48:	1077      	lrw      	r3, 0x20000054	// 5da4 <ADC12_Configure_VREF_Selecte+0x160>
    5d4a:	9340      	ld.w      	r2, (r3, 0x0)
    5d4c:	9264      	ld.w      	r3, (r2, 0x10)
    5d4e:	68c5      	andn      	r3, r1
    5d50:	103a      	lrw      	r1, 0x1000280	// 5db8 <ADC12_Configure_VREF_Selecte+0x174>
    5d52:	07b5      	br      	0x5cbc	// 5cbc <ADC12_Configure_VREF_Selecte+0x78>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR4096_VREFN_EXIT)
    5d54:	3849      	cmpnei      	r0, 9
    5d56:	0816      	bt      	0x5d82	// 5d82 <ADC12_Configure_VREF_Selecte+0x13e>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00008000;	
    5d58:	1075      	lrw      	r3, 0x20000050	// 5dac <ADC12_Configure_VREF_Selecte+0x168>
    5d5a:	31f0      	movi      	r1, 240
    5d5c:	9340      	ld.w      	r2, (r3, 0x0)
    5d5e:	9260      	ld.w      	r3, (r2, 0x0)
    5d60:	4128      	lsli      	r1, r1, 8
    5d62:	68c5      	andn      	r3, r1
    5d64:	3baf      	bseti      	r3, 15
    5d66:	b260      	st.w      	r3, (r2, 0x0)
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000800;
    5d68:	31f0      	movi      	r1, 240
    5d6a:	9260      	ld.w      	r3, (r2, 0x0)
    5d6c:	4124      	lsli      	r1, r1, 4
    5d6e:	68c5      	andn      	r3, r1
    5d70:	3bab      	bseti      	r3, 11
    5d72:	b260      	st.w      	r3, (r2, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0B<<6)|(0X01<<24)|(0X01<<25);	
    5d74:	102d      	lrw      	r1, 0x30103c0	// 5da8 <ADC12_Configure_VREF_Selecte+0x164>
    5d76:	106c      	lrw      	r3, 0x20000054	// 5da4 <ADC12_Configure_VREF_Selecte+0x160>
    5d78:	9340      	ld.w      	r2, (r3, 0x0)
    5d7a:	9264      	ld.w      	r3, (r2, 0x10)
    5d7c:	68c5      	andn      	r3, r1
    5d7e:	1030      	lrw      	r1, 0x30002c0	// 5dbc <ADC12_Configure_VREF_Selecte+0x178>
    5d80:	079e      	br      	0x5cbc	// 5cbc <ADC12_Configure_VREF_Selecte+0x78>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_INTVREF1000_VREFN_EXIT)
    5d82:	384b      	cmpnei      	r0, 11
    5d84:	0b68      	bt      	0x5c54	// 5c54 <ADC12_Configure_VREF_Selecte+0x10>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00008000;					
    5d86:	106a      	lrw      	r3, 0x20000050	// 5dac <ADC12_Configure_VREF_Selecte+0x168>
    5d88:	32f0      	movi      	r2, 240
    5d8a:	9320      	ld.w      	r1, (r3, 0x0)
    5d8c:	9160      	ld.w      	r3, (r1, 0x0)
    5d8e:	4248      	lsli      	r2, r2, 8
    5d90:	68c9      	andn      	r3, r2
    5d92:	3baf      	bseti      	r3, 15
    5d94:	b160      	st.w      	r3, (r1, 0x0)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0C<<6)|(0X00<<16)|(0X02<<17);	
    5d96:	1028      	lrw      	r1, 0x30503c0	// 5db4 <ADC12_Configure_VREF_Selecte+0x170>
    5d98:	1063      	lrw      	r3, 0x20000054	// 5da4 <ADC12_Configure_VREF_Selecte+0x160>
    5d9a:	9340      	ld.w      	r2, (r3, 0x0)
    5d9c:	9264      	ld.w      	r3, (r2, 0x10)
    5d9e:	68c5      	andn      	r3, r1
    5da0:	1028      	lrw      	r1, 0x40300	// 5dc0 <ADC12_Configure_VREF_Selecte+0x17c>
    5da2:	078d      	br      	0x5cbc	// 5cbc <ADC12_Configure_VREF_Selecte+0x78>
    5da4:	20000054 	.long	0x20000054
    5da8:	030103c0 	.long	0x030103c0
    5dac:	20000050 	.long	0x20000050
    5db0:	030000c0 	.long	0x030000c0
    5db4:	030503c0 	.long	0x030503c0
    5db8:	01000280 	.long	0x01000280
    5dbc:	030002c0 	.long	0x030002c0
    5dc0:	00040300 	.long	0x00040300

Disassembly of section .text.ADC12_ConversionChannel_Config:

00005dc4 <ADC12_ConversionChannel_Config>:
//ADC12_ADCINX:ADC12_ADCIN0~ADC12_ADCIN17,ADC12_INTVREF,ADC12_DIV4_VDD,ADC12_VSS
//ReturnValue:NONE
/*************************************************************/ 
void ADC12_ConversionChannel_Config(ADC12_InputSet_TypeDef ADC12_ADCINX ,
						ADC12_CV_RepeatNum_TypeDef CV_RepeatTime, ADC12_Control_TypeDef AVG_Set, U8_T SEQx)
{
    5dc4:	14d4      	push      	r4-r7, r15
	switch(ADC12_ADCINX)
    5dc6:	380f      	cmphsi      	r0, 16
{
    5dc8:	6d83      	mov      	r6, r0
	switch(ADC12_ADCINX)
    5dca:	0818      	bt      	0x5dfa	// 5dfa <ADC12_ConversionChannel_Config+0x36>
    5dcc:	12af      	lrw      	r5, 0x20000050	// 5f08 <ADC12_ConversionChannel_Config+0x144>
    5dce:	1290      	lrw      	r4, 0x2000004c	// 5f0c <ADC12_ConversionChannel_Config+0x148>
    5dd0:	e3ffe1f0 	bsr      	0x21b0	// 21b0 <___gnu_csky_case_uqi>
    5dd4:	322c2008 	.long	0x322c2008
    5dd8:	4d474039 	.long	0x4d474039
    5ddc:	6d659159 	.long	0x6d659159
    5de0:	91887f76 	.long	0x91887f76
	{
		case 0:	
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC0 PB0.1
    5de4:	9500      	ld.w      	r0, (r5, 0x0)
    5de6:	90a0      	ld.w      	r5, (r0, 0x0)
    5de8:	b0a0      	st.w      	r5, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    5dea:	90a1      	ld.w      	r5, (r0, 0x4)
    5dec:	b0a1      	st.w      	r5, (r0, 0x4)
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFF0F)  | 0x00000010;			
    5dee:	9480      	ld.w      	r4, (r4, 0x0)
    5df0:	9400      	ld.w      	r0, (r4, 0x0)
    5df2:	35f0      	movi      	r5, 240
    5df4:	6815      	andn      	r0, r5
    5df6:	38a4      	bseti      	r0, 4
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFFF)  | 0x00000000;
			break;
		case 7:
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC7 PB0.2
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)  | 0x00000100;
    5df8:	b400      	st.w      	r0, (r4, 0x0)
    5dfa:	1206      	lrw      	r0, 0x20000054	// 5f10 <ADC12_ConversionChannel_Config+0x14c>
    5dfc:	4362      	lsli      	r3, r3, 2
    5dfe:	9000      	ld.w      	r0, (r0, 0x0)
    5e00:	60c0      	addu      	r3, r0
		//case 27: break;
		case 0x1Cul: break;
		case 0x1Dul: break;
		case 0x1Eul: break;
	}
	ADC0->SEQ[SEQx] = ADC0->SEQ[SEQx] & 0;
    5e02:	930c      	ld.w      	r0, (r3, 0x30)
    5e04:	3000      	movi      	r0, 0
    5e06:	b30c      	st.w      	r0, (r3, 0x30)
	ADC0->SEQ[SEQx] = ADC0->SEQ[SEQx] | ADC12_ADCINX  | CV_RepeatTime | AVG_Set;
    5e08:	6c48      	or      	r1, r2
    5e0a:	930c      	ld.w      	r0, (r3, 0x30)
    5e0c:	6c58      	or      	r1, r6
    5e0e:	6c40      	or      	r1, r0
    5e10:	b32c      	st.w      	r1, (r3, 0x30)
}
    5e12:	1494      	pop      	r4-r7, r15
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFF0)  | 0x00000001;							//ADC1 PA0.0
    5e14:	95a0      	ld.w      	r5, (r5, 0x0)
    5e16:	9500      	ld.w      	r0, (r5, 0x0)
    5e18:	370f      	movi      	r7, 15
    5e1a:	681d      	andn      	r0, r7
    5e1c:	38a0      	bseti      	r0, 0
			GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)  | 0x10000000;							//ADC6 PA0.7
    5e1e:	b500      	st.w      	r0, (r5, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    5e20:	9501      	ld.w      	r0, (r5, 0x4)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0)  | 0x00000001;	
    5e22:	b501      	st.w      	r0, (r5, 0x4)
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFFF)  | 0x00000000;		
    5e24:	9400      	ld.w      	r0, (r4, 0x0)
    5e26:	9080      	ld.w      	r4, (r0, 0x0)
    5e28:	b080      	st.w      	r4, (r0, 0x0)
			break;
    5e2a:	07e8      	br      	0x5dfa	// 5dfa <ADC12_ConversionChannel_Config+0x36>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF0F)  | 0x00000010;							//ADC2 PA0.1
    5e2c:	95a0      	ld.w      	r5, (r5, 0x0)
    5e2e:	9500      	ld.w      	r0, (r5, 0x0)
    5e30:	37f0      	movi      	r7, 240
    5e32:	681d      	andn      	r0, r7
    5e34:	38a4      	bseti      	r0, 4
    5e36:	07f4      	br      	0x5e1e	// 5e1e <ADC12_ConversionChannel_Config+0x5a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00001000;							//ADC3 PA0.3
    5e38:	95a0      	ld.w      	r5, (r5, 0x0)
    5e3a:	37f0      	movi      	r7, 240
    5e3c:	9500      	ld.w      	r0, (r5, 0x0)
    5e3e:	47e8      	lsli      	r7, r7, 8
    5e40:	681d      	andn      	r0, r7
    5e42:	38ac      	bseti      	r0, 12
    5e44:	07ed      	br      	0x5e1e	// 5e1e <ADC12_ConversionChannel_Config+0x5a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF)  | 0x00100000;							//ADC4 PA0.5
    5e46:	95a0      	ld.w      	r5, (r5, 0x0)
    5e48:	37f0      	movi      	r7, 240
    5e4a:	9500      	ld.w      	r0, (r5, 0x0)
    5e4c:	47f0      	lsli      	r7, r7, 16
    5e4e:	681d      	andn      	r0, r7
    5e50:	38b4      	bseti      	r0, 20
    5e52:	07e6      	br      	0x5e1e	// 5e1e <ADC12_ConversionChannel_Config+0x5a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF)  | 0x01000000;							//ADC5 PA0.6
    5e54:	95a0      	ld.w      	r5, (r5, 0x0)
    5e56:	37f0      	movi      	r7, 240
    5e58:	9500      	ld.w      	r0, (r5, 0x0)
    5e5a:	47f4      	lsli      	r7, r7, 20
    5e5c:	681d      	andn      	r0, r7
    5e5e:	38b8      	bseti      	r0, 24
    5e60:	07df      	br      	0x5e1e	// 5e1e <ADC12_ConversionChannel_Config+0x5a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)  | 0x10000000;							//ADC6 PA0.7
    5e62:	95a0      	ld.w      	r5, (r5, 0x0)
    5e64:	9500      	ld.w      	r0, (r5, 0x0)
    5e66:	4004      	lsli      	r0, r0, 4
    5e68:	4804      	lsri      	r0, r0, 4
    5e6a:	38bc      	bseti      	r0, 28
    5e6c:	07d9      	br      	0x5e1e	// 5e1e <ADC12_ConversionChannel_Config+0x5a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC7 PB0.2
    5e6e:	9500      	ld.w      	r0, (r5, 0x0)
    5e70:	90a0      	ld.w      	r5, (r0, 0x0)
    5e72:	b0a0      	st.w      	r5, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    5e74:	90a1      	ld.w      	r5, (r0, 0x4)
    5e76:	b0a1      	st.w      	r5, (r0, 0x4)
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)  | 0x00000100;
    5e78:	9480      	ld.w      	r4, (r4, 0x0)
    5e7a:	35f0      	movi      	r5, 240
    5e7c:	9400      	ld.w      	r0, (r4, 0x0)
    5e7e:	45a4      	lsli      	r5, r5, 4
    5e80:	6815      	andn      	r0, r5
    5e82:	38a8      	bseti      	r0, 8
    5e84:	07ba      	br      	0x5df8	// 5df8 <ADC12_ConversionChannel_Config+0x34>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC8 PB0.3
    5e86:	9500      	ld.w      	r0, (r5, 0x0)
    5e88:	90a0      	ld.w      	r5, (r0, 0x0)
    5e8a:	b0a0      	st.w      	r5, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    5e8c:	90a1      	ld.w      	r5, (r0, 0x4)
    5e8e:	b0a1      	st.w      	r5, (r0, 0x4)
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF)  | 0x00001000;
    5e90:	9480      	ld.w      	r4, (r4, 0x0)
    5e92:	35f0      	movi      	r5, 240
    5e94:	9400      	ld.w      	r0, (r4, 0x0)
    5e96:	45a8      	lsli      	r5, r5, 8
    5e98:	6815      	andn      	r0, r5
    5e9a:	38ac      	bseti      	r0, 12
    5e9c:	07ae      	br      	0x5df8	// 5df8 <ADC12_ConversionChannel_Config+0x34>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC10 PA0.9
    5e9e:	95a0      	ld.w      	r5, (r5, 0x0)
    5ea0:	9500      	ld.w      	r0, (r5, 0x0)
    5ea2:	b500      	st.w      	r0, (r5, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFF0F)  | 0x00000010;	
    5ea4:	9501      	ld.w      	r0, (r5, 0x4)
    5ea6:	37f0      	movi      	r7, 240
    5ea8:	681d      	andn      	r0, r7
    5eaa:	38a4      	bseti      	r0, 4
    5eac:	07bb      	br      	0x5e22	// 5e22 <ADC12_ConversionChannel_Config+0x5e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC11 PA0.10
    5eae:	95a0      	ld.w      	r5, (r5, 0x0)
    5eb0:	9500      	ld.w      	r0, (r5, 0x0)
    5eb2:	b500      	st.w      	r0, (r5, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF)  | 0x00000100;	
    5eb4:	37f0      	movi      	r7, 240
    5eb6:	9501      	ld.w      	r0, (r5, 0x4)
    5eb8:	47e4      	lsli      	r7, r7, 4
    5eba:	681d      	andn      	r0, r7
    5ebc:	38a8      	bseti      	r0, 8
    5ebe:	07b2      	br      	0x5e22	// 5e22 <ADC12_ConversionChannel_Config+0x5e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC12 PA0.11
    5ec0:	95a0      	ld.w      	r5, (r5, 0x0)
    5ec2:	9500      	ld.w      	r0, (r5, 0x0)
    5ec4:	b500      	st.w      	r0, (r5, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF)  | 0x00001000;	
    5ec6:	37f0      	movi      	r7, 240
    5ec8:	9501      	ld.w      	r0, (r5, 0x4)
    5eca:	47e8      	lsli      	r7, r7, 8
    5ecc:	681d      	andn      	r0, r7
    5ece:	38ac      	bseti      	r0, 12
    5ed0:	07a9      	br      	0x5e22	// 5e22 <ADC12_ConversionChannel_Config+0x5e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC13 PA0.12
    5ed2:	95a0      	ld.w      	r5, (r5, 0x0)
    5ed4:	9500      	ld.w      	r0, (r5, 0x0)
    5ed6:	b500      	st.w      	r0, (r5, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFF0FFFF)  | 0x00010000;	
    5ed8:	37f0      	movi      	r7, 240
    5eda:	9501      	ld.w      	r0, (r5, 0x4)
    5edc:	47ec      	lsli      	r7, r7, 12
    5ede:	681d      	andn      	r0, r7
    5ee0:	38b0      	bseti      	r0, 16
    5ee2:	07a0      	br      	0x5e22	// 5e22 <ADC12_ConversionChannel_Config+0x5e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC14 PA0.13	
    5ee4:	95a0      	ld.w      	r5, (r5, 0x0)
    5ee6:	9500      	ld.w      	r0, (r5, 0x0)
    5ee8:	b500      	st.w      	r0, (r5, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)  | 0x00100000;	
    5eea:	37f0      	movi      	r7, 240
    5eec:	9501      	ld.w      	r0, (r5, 0x4)
    5eee:	47f0      	lsli      	r7, r7, 16
    5ef0:	681d      	andn      	r0, r7
    5ef2:	38b4      	bseti      	r0, 20
    5ef4:	0797      	br      	0x5e22	// 5e22 <ADC12_ConversionChannel_Config+0x5e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC15 PA0.8
    5ef6:	95a0      	ld.w      	r5, (r5, 0x0)
    5ef8:	9500      	ld.w      	r0, (r5, 0x0)
    5efa:	b500      	st.w      	r0, (r5, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0)  | 0x00000001;	
    5efc:	9501      	ld.w      	r0, (r5, 0x4)
    5efe:	370f      	movi      	r7, 15
    5f00:	681d      	andn      	r0, r7
    5f02:	38a0      	bseti      	r0, 0
    5f04:	078f      	br      	0x5e22	// 5e22 <ADC12_ConversionChannel_Config+0x5e>
    5f06:	0000      	bkpt
    5f08:	20000050 	.long	0x20000050
    5f0c:	2000004c 	.long	0x2000004c
    5f10:	20000054 	.long	0x20000054

Disassembly of section .text.I2C_SLAVE_CONFIG:

00005f14 <I2C_SLAVE_CONFIG>:
//IIC SLAVER Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void I2C_SLAVE_CONFIG(void)
{
    5f14:	14d0      	push      	r15
    5f16:	1423      	subi      	r14, r14, 12
	I2C_DeInit();
    5f18:	e3fffa1e 	bsr      	0x5354	// 5354 <I2C_DeInit>
	I2C_Slave_CONFIG(I2C_SDA_PA07,I2C_SCL_PA01,FAST_MODE,I2C_SLAVE_7BIT,0X57,0X50,0X50);//从机地址不能设置为0x00~0x07,0x78~0x7f
    5f1c:	3350      	movi      	r3, 80
    5f1e:	b862      	st.w      	r3, (r14, 0x8)
    5f20:	b861      	st.w      	r3, (r14, 0x4)
    5f22:	3357      	movi      	r3, 87
    5f24:	b860      	st.w      	r3, (r14, 0x0)
    5f26:	3204      	movi      	r2, 4
    5f28:	3300      	movi      	r3, 0
    5f2a:	3102      	movi      	r1, 2
    5f2c:	3002      	movi      	r0, 2
    5f2e:	e3fffa1f 	bsr      	0x536c	// 536c <I2C_Slave_CONFIG>
	I2C_SDA_TSETUP_THOLD_CONFIG(0x40,0x40,0x40);
    5f32:	3240      	movi      	r2, 64
    5f34:	3140      	movi      	r1, 64
    5f36:	3040      	movi      	r0, 64
    5f38:	e3fffab8 	bsr      	0x54a8	// 54a8 <I2C_SDA_TSETUP_THOLD_CONFIG>
	I2C_FIFO_TriggerData(0,0);															//发送FIFO设置为7
    5f3c:	3100      	movi      	r1, 0
    5f3e:	3000      	movi      	r0, 0
    5f40:	e3fffacc 	bsr      	0x54d8	// 54d8 <I2C_FIFO_TriggerData>
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_SCL_SLOW);
    5f44:	3180      	movi      	r1, 128
    5f46:	4127      	lsli      	r1, r1, 7
    5f48:	3001      	movi      	r0, 1
    5f4a:	e3fffab9 	bsr      	0x54bc	// 54bc <I2C_ConfigInterrupt_CMD>
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_STOP_DET);
    5f4e:	3180      	movi      	r1, 128
    5f50:	4122      	lsli      	r1, r1, 2
    5f52:	3001      	movi      	r0, 1
    5f54:	e3fffab4 	bsr      	0x54bc	// 54bc <I2C_ConfigInterrupt_CMD>
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_RD_REQ);
    5f58:	3120      	movi      	r1, 32
    5f5a:	3001      	movi      	r0, 1
    5f5c:	e3fffab0 	bsr      	0x54bc	// 54bc <I2C_ConfigInterrupt_CMD>
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_RX_FULL);
    5f60:	3104      	movi      	r1, 4
    5f62:	3001      	movi      	r0, 1
    5f64:	e3fffaac 	bsr      	0x54bc	// 54bc <I2C_ConfigInterrupt_CMD>
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_TX_ABRT);
    5f68:	3140      	movi      	r1, 64
    5f6a:	3001      	movi      	r0, 1
    5f6c:	e3fffaa8 	bsr      	0x54bc	// 54bc <I2C_ConfigInterrupt_CMD>
	I2C_Enable();
    5f70:	e3fffabc 	bsr      	0x54e8	// 54e8 <I2C_Enable>
	I2C_Int_Enable();
    5f74:	e3fffad6 	bsr      	0x5520	// 5520 <I2C_Int_Enable>
	
}
    5f78:	1403      	addi      	r14, r14, 12
    5f7a:	1490      	pop      	r15

Disassembly of section .text.UART1_CONFIG:

00005f7c <UART1_CONFIG>:
//UART1  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void UART1_CONFIG(U32_T baudrate)
{
    5f7c:	14d1      	push      	r4, r15
	U32_T br_div = 0;
	
	br_div = SYSCLK / baudrate;
    5f7e:	106c      	lrw      	r3, 0x20000000	// 5fac <UART1_CONFIG+0x30>
{
    5f80:	6c43      	mov      	r1, r0
	br_div = SYSCLK / baudrate;
    5f82:	9300      	ld.w      	r0, (r3, 0x0)
    5f84:	e00005c8 	bsr      	0x6b14	// 6b14 <__udivsi3>
    5f88:	6d03      	mov      	r4, r0
	
	UART1_DeInit();                                                 //clear all UART Register
    5f8a:	e3fff91b 	bsr      	0x51c0	// 51c0 <UART1_DeInit>
    UART_IO_Init(IO_UART1, 0);                                    	//use PA0.13->RXD1, PB0.0->TXD1
    5f8e:	3100      	movi      	r1, 0
    5f90:	3001      	movi      	r0, 1
    5f92:	e3fff95b 	bsr      	0x5248	// 5248 <UART_IO_Init>
    UARTInitRxIntEn(UART1, br_div, UART_PAR_NONE);	                    //baudrate=sysclock/416=115200
    5f96:	1067      	lrw      	r3, 0x20000040	// 5fb0 <UART1_CONFIG+0x34>
    5f98:	7451      	zexth      	r1, r4
    5f9a:	9300      	ld.w      	r0, (r3, 0x0)
    5f9c:	3200      	movi      	r2, 0
    5f9e:	e3fff9c9 	bsr      	0x5330	// 5330 <UARTInitRxIntEn>
	UART1_Int_Enable();
    5fa2:	e3fff927 	bsr      	0x51f0	// 51f0 <UART1_Int_Enable>
	UART1_WakeUp_Enable();
    5fa6:	e3fff949 	bsr      	0x5238	// 5238 <UART1_WakeUp_Enable>
}
    5faa:	1491      	pop      	r4, r15
    5fac:	20000000 	.long	0x20000000
    5fb0:	20000040 	.long	0x20000040

Disassembly of section .text.fputc:

00005fb4 <fputc>:

/* 重定义fputc函数 */
int fputc(int ch, FILE *f)
{
#if Debug
	while((UART1->SR & 0X1) != 0);
    5fb4:	1065      	lrw      	r3, 0x20000040	// 5fc8 <fputc+0x14>
    5fb6:	3101      	movi      	r1, 1
    5fb8:	9340      	ld.w      	r2, (r3, 0x0)
    5fba:	9261      	ld.w      	r3, (r2, 0x4)
    5fbc:	68c4      	and      	r3, r1
    5fbe:	3b40      	cmpnei      	r3, 0
    5fc0:	0bfd      	bt      	0x5fba	// 5fba <fputc+0x6>
	UART1->DATA = ch;
    5fc2:	b200      	st.w      	r0, (r2, 0x0)
#endif
	return ch;
}
    5fc4:	783c      	jmp      	r15
    5fc6:	0000      	bkpt
    5fc8:	20000040 	.long	0x20000040

Disassembly of section .text.SYSCON_CONFIG:

00005fcc <SYSCON_CONFIG>:
	2.选择48MHZ HFOSC作为SYSCLK时钟源
	3.HCLK = SYSCLK / HCLK_DIV = 48MHZ / 1 = 48MHZ
	4.PCLK = HCLK / PCLK_DIV =  48MHZ / 1 = 48MHZ
  */
void SYSCON_CONFIG(void)
{
    5fcc:	14d0      	push      	r15
    5fce:	1421      	subi      	r14, r14, 4
	/* SYSTEM CLK AND PCLK FUNTION */
	SYSCON_RST_VALUE(); /* SYSCON all register clr */
    5fd0:	e3fff49c 	bsr      	0x4908	// 4908 <SYSCON_RST_VALUE>
	SYSCON_General_CMD(ENABLE,ENDIS_ISOSC); /* 打开ISOSC内部振荡器 */ 
    5fd4:	3101      	movi      	r1, 1
    5fd6:	3001      	movi      	r0, 1
    5fd8:	e3fff4c4 	bsr      	0x4960	// 4960 <SYSCON_General_CMD>
	SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_48M); /* 选择48MHZ HFOSC作为SYSCLK时钟源 */
    5fdc:	3000      	movi      	r0, 0
    5fde:	e3fff517 	bsr      	0x4a0c	// 4a0c <SYSCON_HFOSC_SELECTE>
	SystemCLK_HCLKDIV_PCLKDIV_Config(SYSCLK_HFOSC, HCLK_DIV_1, PCLK_DIV_1, HFOSC_48M); /* HCLK = 48MHZ，SYSCLK = 48MHZ */
    5fe2:	3180      	movi      	r1, 128
    5fe4:	3308      	movi      	r3, 8
    5fe6:	3200      	movi      	r2, 0
    5fe8:	4121      	lsli      	r1, r1, 1
    5fea:	3002      	movi      	r0, 2
    5fec:	e3fff4d2 	bsr      	0x4990	// 4990 <SystemCLK_HCLKDIV_PCLKDIV_Config>
//------------  WDT FUNTION  --------------------------------/
    SYSCON_IWDCNT_Config(IWDT_TIME_2S,IWDT_INTW_DIV_7);      					//WDT TIME 1s,WDT alarm interrupt time=1s-1s*1/8=0.875S
    5ff0:	3080      	movi      	r0, 128
    5ff2:	3118      	movi      	r1, 24
    5ff4:	4003      	lsli      	r0, r0, 3
    5ff6:	e3fff547 	bsr      	0x4a84	// 4a84 <SYSCON_IWDCNT_Config>
    SYSCON_WDT_CMD(DISABLE);                                                  	//enable WDT		
    5ffa:	3000      	movi      	r0, 0
    5ffc:	e3fff51c 	bsr      	0x4a34	// 4a34 <SYSCON_WDT_CMD>
    SYSCON_IWDCNT_Reload();                                                   	//reload WDT
    6000:	e3fff538 	bsr      	0x4a70	// 4a70 <SYSCON_IWDCNT_Reload>
	//IWDT_Int_Enable();
//------------  WWDT FUNTION  --------------------------------/
	WWDT_CNT_Load(0xFF);
    6004:	30ff      	movi      	r0, 255
    6006:	e3fff8af 	bsr      	0x5164	// 5164 <WWDT_CNT_Load>
	WWDT_CONFIG(PCLK_4096_DIV0,0xFF,WWDT_DBGDIS);
    600a:	3200      	movi      	r2, 0
    600c:	31ff      	movi      	r1, 255
    600e:	3000      	movi      	r0, 0
    6010:	e3fff89e 	bsr      	0x514c	// 514c <WWDT_CONFIG>
	WWDT_Int_Config(DISABLE);
    6014:	3000      	movi      	r0, 0
    6016:	e3fff8af 	bsr      	0x5174	// 5174 <WWDT_Int_Config>
	//WWDT_CMD(ENABLE);
//------------  CLO  --------------------------------/	
	//SYSCON_CLO_CONFIG(CLO_PA02);
	//SYSCON->OPT1=(SYSCON->OPT1&0XFFFF8000)|(0X01<<12)|(0X04<<8)|(0x00<<4);
//------------  LVD FUNTION  --------------------------------/ 
    SYSCON_LVD_Config(DISABLE_LVDEN,INTDET_LVL_3_3V,RSTDET_LVL_1_9V,DISABLE_LVD_INT,INTDET_POL_fall);   //LVD LVR Enable/Disable
    601a:	3340      	movi      	r3, 64
    601c:	3180      	movi      	r1, 128
    601e:	b860      	st.w      	r3, (r14, 0x0)
    6020:	3200      	movi      	r2, 0
    6022:	3300      	movi      	r3, 0
    6024:	4123      	lsli      	r1, r1, 3
    6026:	300a      	movi      	r0, 10
    6028:	e3fff53a 	bsr      	0x4a9c	// 4a9c <SYSCON_LVD_Config>
    //LVD_Int_Enable();
//------------ EVTRG function --------------------------------/ 	
	SYSCON->EVTRG=0X00|0x01<<20;											//SYSCON_trgsrc0
    602c:	1067      	lrw      	r3, 0x2000005c	// 6048 <SYSCON_CONFIG+0x7c>
    602e:	3180      	movi      	r1, 128
    6030:	9340      	ld.w      	r2, (r3, 0x0)
    6032:	3380      	movi      	r3, 128
    6034:	6048      	addu      	r1, r2
    6036:	436d      	lsli      	r3, r3, 13
    6038:	b17d      	st.w      	r3, (r1, 0x74)
	SYSCON->EVPS=0X00;
    603a:	3300      	movi      	r3, 0
    603c:	b17e      	st.w      	r3, (r1, 0x78)
	
	SYSCON->IMER =EM_EVTRG0_ST;
    603e:	3380      	movi      	r3, 128
    6040:	436c      	lsli      	r3, r3, 12
    6042:	b27d      	st.w      	r3, (r2, 0x74)
//------------  SYSCON Vector  --------------------------------/ 	
	//SYSCON_Int_Enable();    														//SYSCON VECTOR
	//SYSCON_WakeUp_Enable();    													//Enable WDT wakeup INT
}
    6044:	1401      	addi      	r14, r14, 4
    6046:	1490      	pop      	r15
    6048:	2000005c 	.long	0x2000005c

Disassembly of section .text.APT32F102_init:

0000604c <APT32F102_init>:
//ReturnValue:NONE                                                                /
/*********************************************************************************/
/*********************************************************************************/  
/*********************************************************************************/
void APT32F102_init(void) 
{
    604c:	14d1      	push      	r4, r15
//------------------------------------------------------------/
//Peripheral clock enable and disable
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON->PCDR0 = 0xFFFFFFF0;
    604e:	1059      	lrw      	r2, 0x2000005c	// 60b0 <APT32F102_init+0x64>
    6050:	3100      	movi      	r1, 0
    6052:	9260      	ld.w      	r3, (r2, 0x0)
    6054:	290f      	subi      	r1, 16
    6056:	b32b      	st.w      	r1, (r3, 0x2c)
	SYSCON->PCDR1 = 0xFFFFFFFF;
    6058:	3100      	movi      	r1, 0
    605a:	2900      	subi      	r1, 1
    605c:	b32e      	st.w      	r1, (r3, 0x38)
	SYSCON->PCER0 = 0x00000691;                                        //PCLK Enable  0x00410071
    605e:	1036      	lrw      	r1, 0x691	// 60b4 <APT32F102_init+0x68>
    6060:	b32a      	st.w      	r1, (r3, 0x28)
    SYSCON->PCER1 = 0x00022A00;                                        //PCLK Enable
    6062:	1036      	lrw      	r1, 0x22a00	// 60b8 <APT32F102_init+0x6c>
    6064:	b32d      	st.w      	r1, (r3, 0x34)
    6066:	6d0b      	mov      	r4, r2
    while(!(SYSCON->PCSR0 & 0x1));                                    //Wait PCLK enabled	
    6068:	3101      	movi      	r1, 1
    606a:	934c      	ld.w      	r2, (r3, 0x30)
    606c:	6884      	and      	r2, r1
    606e:	3a40      	cmpnei      	r2, 0
    6070:	0ffd      	bf      	0x606a	// 606a <APT32F102_init+0x1e>
	
	/* ISOSC/IMOSC/EMOSC/SYSCLK/IWDT/LVD/EM_CMFAIL/EM_CMRCV/CMD_ERR OSC stable interrupt */
    SYSCON_CONFIG(); /* SYSCON initial */
    6072:	e3ffffad 	bsr      	0x5fcc	// 5fcc <SYSCON_CONFIG>
	SYSCON->GCDR |= 0x0B << 12; /* 禁止深度休眠下的ISOSC/IMOSC/EMOSC */
    6076:	9420      	ld.w      	r1, (r4, 0x0)
    6078:	32b0      	movi      	r2, 176
    607a:	9162      	ld.w      	r3, (r1, 0x8)
    607c:	4248      	lsli      	r2, r2, 8
    607e:	6cc8      	or      	r3, r2
    6080:	b162      	st.w      	r3, (r1, 0x8)
	SYSCON_INT_Priority();
    6082:	e3fff5ad 	bsr      	0x4bdc	// 4bdc <SYSCON_INT_Priority>
	CK_CPU_EnAllNormalIrq();                                         //enable all IRQ
    6086:	e000057d 	bsr      	0x6b80	// 6b80 <CK_CPU_EnAllNormalIrq>
	
	UART1_CONFIG(115200); /* uart1用于串口烧录，不要修改它的初始化及中断函数 */ 
    608a:	30e1      	movi      	r0, 225
    608c:	4009      	lsli      	r0, r0, 9
    608e:	e3ffff77 	bsr      	0x5f7c	// 5f7c <UART1_CONFIG>
	
	Coret_Init();
    6092:	e00014fd 	bsr      	0x8a8c	// 8a8c <Coret_Init>
	led_hardware_setup();
    6096:	e000059f 	bsr      	0x6bd4	// 6bd4 <led_hardware_setup>
	adc_hardware_setup();
    609a:	e00006d1 	bsr      	0x6e3c	// 6e3c <adc_hardware_setup>
	charging_hardware_setup();
    609e:	e000070b 	bsr      	0x6eb4	// 6eb4 <charging_hardware_setup>
	communicate_hardware_setup(300);
    60a2:	3096      	movi      	r0, 150
    60a4:	4001      	lsli      	r0, r0, 1
    60a6:	e0000791 	bsr      	0x6fc8	// 6fc8 <communicate_hardware_setup>
	LPT_Init();
    60aa:	e0000571 	bsr      	0x6b8c	// 6b8c <LPT_Init>

	//IFC_CONFIG();
}
    60ae:	1491      	pop      	r4, r15
    60b0:	2000005c 	.long	0x2000005c
    60b4:	00000691 	.long	0x00000691
    60b8:	00022a00 	.long	0x00022a00

Disassembly of section .text.CORETHandler:

000060bc <CORETHandler>:
//CORET Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORETHandler(void) 
{
    60bc:	1460      	nie
    60be:	1462      	ipush
    // ISR content ...
	CK801->CORET_CVR = 0x0;							// Clear counter and flag
    60c0:	1064      	lrw      	r3, 0x20000064	// 60d0 <CORETHandler+0x14>
    60c2:	3200      	movi      	r2, 0
    60c4:	9360      	ld.w      	r3, (r3, 0x0)
    60c6:	b346      	st.w      	r2, (r3, 0x18)
	nop;
    60c8:	6c03      	mov      	r0, r0
}
    60ca:	1463      	ipop
    60cc:	1461      	nir
    60ce:	0000      	bkpt
    60d0:	20000064 	.long	0x20000064

Disassembly of section .text.SYSCONIntHandler:

000060d4 <SYSCONIntHandler>:
//SYSCON Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCONIntHandler(void) 
{
    60d4:	1460      	nie
    60d6:	1462      	ipush
    // ISR content ...
	if((SYSCON->MISR&ISOSC_ST)==ISOSC_ST)
    60d8:	1177      	lrw      	r3, 0x2000005c	// 61b4 <SYSCONIntHandler+0xe0>
    60da:	3280      	movi      	r2, 128
    60dc:	9360      	ld.w      	r3, (r3, 0x0)
    60de:	60c8      	addu      	r3, r2
    60e0:	9323      	ld.w      	r1, (r3, 0xc)
    60e2:	3001      	movi      	r0, 1
    60e4:	6840      	and      	r1, r0
    60e6:	3940      	cmpnei      	r1, 0
    60e8:	0c04      	bf      	0x60f0	// 60f0 <SYSCONIntHandler+0x1c>
	{
		SYSCON->ICR = EMOSC_ST;
	} 
	else if((SYSCON->MISR&HFOSC_ST)==HFOSC_ST)
	{
		SYSCON->ICR = HFOSC_ST;
    60ea:	b301      	st.w      	r0, (r3, 0x4)
	}
	else if((SYSCON->MISR&CMD_ERR_ST)==CMD_ERR_ST)
	{
		SYSCON->ICR = CMD_ERR_ST;
	}
}
    60ec:	1463      	ipop
    60ee:	1461      	nir
	else if((SYSCON->MISR&IMOSC_ST)==IMOSC_ST)
    60f0:	9323      	ld.w      	r1, (r3, 0xc)
    60f2:	3002      	movi      	r0, 2
    60f4:	6840      	and      	r1, r0
    60f6:	3940      	cmpnei      	r1, 0
    60f8:	0bf9      	bt      	0x60ea	// 60ea <SYSCONIntHandler+0x16>
	else if((SYSCON->MISR&EMOSC_ST)==EMOSC_ST)
    60fa:	9323      	ld.w      	r1, (r3, 0xc)
    60fc:	3008      	movi      	r0, 8
    60fe:	6840      	and      	r1, r0
    6100:	3940      	cmpnei      	r1, 0
    6102:	0bf4      	bt      	0x60ea	// 60ea <SYSCONIntHandler+0x16>
	else if((SYSCON->MISR&HFOSC_ST)==HFOSC_ST)
    6104:	9323      	ld.w      	r1, (r3, 0xc)
    6106:	3010      	movi      	r0, 16
    6108:	6840      	and      	r1, r0
    610a:	3940      	cmpnei      	r1, 0
    610c:	0bef      	bt      	0x60ea	// 60ea <SYSCONIntHandler+0x16>
	else if((SYSCON->MISR&SYSCLK_ST)==SYSCLK_ST)
    610e:	9323      	ld.w      	r1, (r3, 0xc)
    6110:	6848      	and      	r1, r2
    6112:	3940      	cmpnei      	r1, 0
    6114:	0c03      	bf      	0x611a	// 611a <SYSCONIntHandler+0x46>
		SYSCON->ICR = CMD_ERR_ST;
    6116:	b341      	st.w      	r2, (r3, 0x4)
}
    6118:	07ea      	br      	0x60ec	// 60ec <SYSCONIntHandler+0x18>
	else if((SYSCON->MISR&IWDT_INT_ST)==IWDT_INT_ST)
    611a:	3280      	movi      	r2, 128
    611c:	9323      	ld.w      	r1, (r3, 0xc)
    611e:	4241      	lsli      	r2, r2, 1
    6120:	6848      	and      	r1, r2
    6122:	3940      	cmpnei      	r1, 0
    6124:	0bf9      	bt      	0x6116	// 6116 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&WKI_INT_ST)==WKI_INT_ST)
    6126:	3280      	movi      	r2, 128
    6128:	9323      	ld.w      	r1, (r3, 0xc)
    612a:	4242      	lsli      	r2, r2, 2
    612c:	6848      	and      	r1, r2
    612e:	3940      	cmpnei      	r1, 0
    6130:	0bf3      	bt      	0x6116	// 6116 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&RAMERRINT_ST)==RAMERRINT_ST)
    6132:	3280      	movi      	r2, 128
    6134:	9323      	ld.w      	r1, (r3, 0xc)
    6136:	4243      	lsli      	r2, r2, 3
    6138:	6848      	and      	r1, r2
    613a:	3940      	cmpnei      	r1, 0
    613c:	0bed      	bt      	0x6116	// 6116 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&LVD_INT_ST)==LVD_INT_ST)
    613e:	3280      	movi      	r2, 128
    6140:	9323      	ld.w      	r1, (r3, 0xc)
    6142:	4244      	lsli      	r2, r2, 4
    6144:	6848      	and      	r1, r2
    6146:	3940      	cmpnei      	r1, 0
    6148:	0be7      	bt      	0x6116	// 6116 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&HWD_ERR)==HWD_ERR)
    614a:	3280      	movi      	r2, 128
    614c:	9323      	ld.w      	r1, (r3, 0xc)
    614e:	4245      	lsli      	r2, r2, 5
    6150:	6848      	and      	r1, r2
    6152:	3940      	cmpnei      	r1, 0
    6154:	0be1      	bt      	0x6116	// 6116 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&OPTERR_INT)==OPTERR_INT)
    6156:	3280      	movi      	r2, 128
    6158:	9323      	ld.w      	r1, (r3, 0xc)
    615a:	4247      	lsli      	r2, r2, 7
    615c:	6848      	and      	r1, r2
    615e:	3940      	cmpnei      	r1, 0
    6160:	0bdb      	bt      	0x6116	// 6116 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_CMLST_ST)==EM_CMLST_ST)
    6162:	3280      	movi      	r2, 128
    6164:	9323      	ld.w      	r1, (r3, 0xc)
    6166:	424b      	lsli      	r2, r2, 11
    6168:	6848      	and      	r1, r2
    616a:	3940      	cmpnei      	r1, 0
    616c:	0bd5      	bt      	0x6116	// 6116 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_EVTRG0_ST)==EM_EVTRG0_ST)
    616e:	3280      	movi      	r2, 128
    6170:	9323      	ld.w      	r1, (r3, 0xc)
    6172:	424c      	lsli      	r2, r2, 12
    6174:	6848      	and      	r1, r2
    6176:	3940      	cmpnei      	r1, 0
    6178:	0c04      	bf      	0x6180	// 6180 <SYSCONIntHandler+0xac>
		SYSCON->ICR = EM_EVTRG0_ST;
    617a:	b341      	st.w      	r2, (r3, 0x4)
		nop;
    617c:	6c03      	mov      	r0, r0
    617e:	07b7      	br      	0x60ec	// 60ec <SYSCONIntHandler+0x18>
	else if((SYSCON->MISR&EM_EVTRG1_ST)==EM_EVTRG1_ST)
    6180:	3280      	movi      	r2, 128
    6182:	9323      	ld.w      	r1, (r3, 0xc)
    6184:	424d      	lsli      	r2, r2, 13
    6186:	6848      	and      	r1, r2
    6188:	3940      	cmpnei      	r1, 0
    618a:	0bc6      	bt      	0x6116	// 6116 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_EVTRG2_ST)==EM_EVTRG2_ST)
    618c:	3280      	movi      	r2, 128
    618e:	9323      	ld.w      	r1, (r3, 0xc)
    6190:	424e      	lsli      	r2, r2, 14
    6192:	6848      	and      	r1, r2
    6194:	3940      	cmpnei      	r1, 0
    6196:	0bc0      	bt      	0x6116	// 6116 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_EVTRG3_ST)==EM_EVTRG3_ST)
    6198:	3280      	movi      	r2, 128
    619a:	9323      	ld.w      	r1, (r3, 0xc)
    619c:	424f      	lsli      	r2, r2, 15
    619e:	6848      	and      	r1, r2
    61a0:	3940      	cmpnei      	r1, 0
    61a2:	0bba      	bt      	0x6116	// 6116 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&CMD_ERR_ST)==CMD_ERR_ST)
    61a4:	3280      	movi      	r2, 128
    61a6:	9323      	ld.w      	r1, (r3, 0xc)
    61a8:	4256      	lsli      	r2, r2, 22
    61aa:	6848      	and      	r1, r2
    61ac:	3940      	cmpnei      	r1, 0
    61ae:	0bb4      	bt      	0x6116	// 6116 <SYSCONIntHandler+0x42>
    61b0:	079e      	br      	0x60ec	// 60ec <SYSCONIntHandler+0x18>
    61b2:	0000      	bkpt
    61b4:	2000005c 	.long	0x2000005c

Disassembly of section .text.IFCIntHandler:

000061b8 <IFCIntHandler>:
//IFC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void IFCIntHandler(void) 
{
    61b8:	1460      	nie
    61ba:	1462      	ipush
    61bc:	14c1      	push      	r4
    // ISR content ...
	//并行写模式
	if(IFC->MISR&ERS_END_INT)			//擦除指令完成
    61be:	1174      	lrw      	r3, 0x20000060	// 628c <IFCIntHandler+0xd4>
    61c0:	3101      	movi      	r1, 1
    61c2:	9360      	ld.w      	r3, (r3, 0x0)
    61c4:	934b      	ld.w      	r2, (r3, 0x2c)
    61c6:	6884      	and      	r2, r1
    61c8:	3a40      	cmpnei      	r2, 0
    61ca:	0c18      	bf      	0x61fa	// 61fa <IFCIntHandler+0x42>
	{
		IFC->ICR=ERS_END_INT;
    61cc:	b32c      	st.w      	r1, (r3, 0x30)
		if((ifc_step==1)&&(f_Drom_writing==1))
    61ce:	1131      	lrw      	r1, 0x200002f4	// 6290 <IFCIntHandler+0xd8>
    61d0:	8140      	ld.b      	r2, (r1, 0x0)
    61d2:	3a41      	cmpnei      	r2, 1
    61d4:	080f      	bt      	0x61f2	// 61f2 <IFCIntHandler+0x3a>
    61d6:	1150      	lrw      	r2, 0x20000239	// 6294 <IFCIntHandler+0xdc>
    61d8:	8240      	ld.b      	r2, (r2, 0x0)
    61da:	7488      	zextb      	r2, r2
    61dc:	3a41      	cmpnei      	r2, 1
    61de:	080a      	bt      	0x61f2	// 61f2 <IFCIntHandler+0x3a>
		{
			SetUserKey;
    61e0:	110e      	lrw      	r0, 0x5a5a5a5a	// 6298 <IFCIntHandler+0xe0>
    61e2:	b308      	st.w      	r0, (r3, 0x20)
			IFC->CMR=0x01;					//将页缓存的数据写入闪存中
    61e4:	b343      	st.w      	r2, (r3, 0xc)
			IFC->FM_ADDR=R_INT_FlashAdd;		//
    61e6:	110e      	lrw      	r0, 0x200002f0	// 629c <IFCIntHandler+0xe4>
    61e8:	9000      	ld.w      	r0, (r0, 0x0)
    61ea:	b306      	st.w      	r0, (r3, 0x18)
			IFC->CR=0X01;					//Start Program
    61ec:	b344      	st.w      	r2, (r3, 0x10)
			ifc_step=2;
    61ee:	3302      	movi      	r3, 2
    61f0:	a160      	st.b      	r3, (r1, 0x0)
	}
	else if(IFC->MISR&OVW_ERR_INT)		//非法操作错误中断
	{
		IFC->ICR=OVW_ERR_INT;
	}
}
    61f2:	9880      	ld.w      	r4, (r14, 0x0)
    61f4:	1401      	addi      	r14, r14, 4
    61f6:	1463      	ipop
    61f8:	1461      	nir
	else if(IFC->MISR&RGM_END_INT)		//编译指令完成
    61fa:	934b      	ld.w      	r2, (r3, 0x2c)
    61fc:	3102      	movi      	r1, 2
    61fe:	6884      	and      	r2, r1
    6200:	3a40      	cmpnei      	r2, 0
    6202:	0c10      	bf      	0x6222	// 6222 <IFCIntHandler+0x6a>
		IFC->ICR=RGM_END_INT;
    6204:	b32c      	st.w      	r1, (r3, 0x30)
		if((ifc_step==2)&&(f_Drom_writing==1))
    6206:	1163      	lrw      	r3, 0x200002f4	// 6290 <IFCIntHandler+0xd8>
    6208:	8360      	ld.b      	r3, (r3, 0x0)
    620a:	3b42      	cmpnei      	r3, 2
    620c:	0bf3      	bt      	0x61f2	// 61f2 <IFCIntHandler+0x3a>
    620e:	1162      	lrw      	r3, 0x20000239	// 6294 <IFCIntHandler+0xdc>
    6210:	8340      	ld.b      	r2, (r3, 0x0)
    6212:	3a41      	cmpnei      	r2, 1
    6214:	0bef      	bt      	0x61f2	// 61f2 <IFCIntHandler+0x3a>
			f_Drom_writing=0;
    6216:	3200      	movi      	r2, 0
    6218:	a340      	st.b      	r2, (r3, 0x0)
			f_Drom_write_complete=1;
    621a:	3201      	movi      	r2, 1
    621c:	1161      	lrw      	r3, 0x2000023a	// 62a0 <IFCIntHandler+0xe8>
    621e:	a340      	st.b      	r2, (r3, 0x0)
    6220:	07e9      	br      	0x61f2	// 61f2 <IFCIntHandler+0x3a>
	else if(IFC->MISR&PEP_END_INT)		//预编程指令完成
    6222:	934b      	ld.w      	r2, (r3, 0x2c)
    6224:	3004      	movi      	r0, 4
    6226:	6880      	and      	r2, r0
    6228:	3a40      	cmpnei      	r2, 0
    622a:	0c15      	bf      	0x6254	// 6254 <IFCIntHandler+0x9c>
		IFC->ICR=PEP_END_INT;
    622c:	b30c      	st.w      	r0, (r3, 0x30)
		if((ifc_step==0)&&(f_Drom_writing==1))
    622e:	1019      	lrw      	r0, 0x200002f4	// 6290 <IFCIntHandler+0xd8>
    6230:	8040      	ld.b      	r2, (r0, 0x0)
    6232:	3a40      	cmpnei      	r2, 0
    6234:	0bdf      	bt      	0x61f2	// 61f2 <IFCIntHandler+0x3a>
    6236:	1058      	lrw      	r2, 0x20000239	// 6294 <IFCIntHandler+0xdc>
    6238:	8240      	ld.b      	r2, (r2, 0x0)
    623a:	7488      	zextb      	r2, r2
    623c:	3a41      	cmpnei      	r2, 1
    623e:	0bda      	bt      	0x61f2	// 61f2 <IFCIntHandler+0x3a>
			SetUserKey;
    6240:	1096      	lrw      	r4, 0x5a5a5a5a	// 6298 <IFCIntHandler+0xe0>
    6242:	b388      	st.w      	r4, (r3, 0x20)
			IFC->CMR=0x02;					//页擦除
    6244:	b323      	st.w      	r1, (r3, 0xc)
			IFC->FM_ADDR=R_INT_FlashAdd;			//
    6246:	1036      	lrw      	r1, 0x200002f0	// 629c <IFCIntHandler+0xe4>
    6248:	9120      	ld.w      	r1, (r1, 0x0)
    624a:	b326      	st.w      	r1, (r3, 0x18)
			IFC->CR=0X01;					//Start Program
    624c:	b344      	st.w      	r2, (r3, 0x10)
			ifc_step=1;
    624e:	3301      	movi      	r3, 1
    6250:	a060      	st.b      	r3, (r0, 0x0)
    6252:	07d0      	br      	0x61f2	// 61f2 <IFCIntHandler+0x3a>
	else if(IFC->MISR&PROT_ERR_INT)		//保护错误中断
    6254:	3280      	movi      	r2, 128
    6256:	932b      	ld.w      	r1, (r3, 0x2c)
    6258:	4245      	lsli      	r2, r2, 5
    625a:	6848      	and      	r1, r2
    625c:	3940      	cmpnei      	r1, 0
    625e:	0c03      	bf      	0x6264	// 6264 <IFCIntHandler+0xac>
		IFC->ICR=OVW_ERR_INT;
    6260:	b34c      	st.w      	r2, (r3, 0x30)
}
    6262:	07c8      	br      	0x61f2	// 61f2 <IFCIntHandler+0x3a>
	else if(IFC->MISR&UDEF_ERR_INT)		//未定义指令错误中断
    6264:	3280      	movi      	r2, 128
    6266:	932b      	ld.w      	r1, (r3, 0x2c)
    6268:	4246      	lsli      	r2, r2, 6
    626a:	6848      	and      	r1, r2
    626c:	3940      	cmpnei      	r1, 0
    626e:	0bf9      	bt      	0x6260	// 6260 <IFCIntHandler+0xa8>
	else if(IFC->MISR&ADDR_ERR_INT)		//地址错误中断
    6270:	3280      	movi      	r2, 128
    6272:	932b      	ld.w      	r1, (r3, 0x2c)
    6274:	4247      	lsli      	r2, r2, 7
    6276:	6848      	and      	r1, r2
    6278:	3940      	cmpnei      	r1, 0
    627a:	0bf3      	bt      	0x6260	// 6260 <IFCIntHandler+0xa8>
	else if(IFC->MISR&OVW_ERR_INT)		//非法操作错误中断
    627c:	3280      	movi      	r2, 128
    627e:	932b      	ld.w      	r1, (r3, 0x2c)
    6280:	4248      	lsli      	r2, r2, 8
    6282:	6848      	and      	r1, r2
    6284:	3940      	cmpnei      	r1, 0
    6286:	0bed      	bt      	0x6260	// 6260 <IFCIntHandler+0xa8>
    6288:	07b5      	br      	0x61f2	// 61f2 <IFCIntHandler+0x3a>
    628a:	0000      	bkpt
    628c:	20000060 	.long	0x20000060
    6290:	200002f4 	.long	0x200002f4
    6294:	20000239 	.long	0x20000239
    6298:	5a5a5a5a 	.long	0x5a5a5a5a
    629c:	200002f0 	.long	0x200002f0
    62a0:	2000023a 	.long	0x2000023a

Disassembly of section .text.BT0IntHandler:

000062a4 <BT0IntHandler>:
    // ISR content ...
}

/* BT0 Interrupt */
void BT0IntHandler(void) 
{
    62a4:	1460      	nie
    62a6:	1462      	ipush
    62a8:	14d0      	push      	r15
	if((BT0->MISR & BT_PEND) == BT_PEND)
    62aa:	116d      	lrw      	r3, 0x20000010	// 635c <BT0IntHandler+0xb8>
    62ac:	3201      	movi      	r2, 1
    62ae:	9300      	ld.w      	r0, (r3, 0x0)
    62b0:	906c      	ld.w      	r3, (r0, 0x30)
    62b2:	68c8      	and      	r3, r2
    62b4:	3b40      	cmpnei      	r3, 0
    62b6:	0c40      	bf      	0x6336	// 6336 <BT0IntHandler+0x92>
	{
		BT0->ICR = BT_PEND;
    62b8:	b04d      	st.w      	r2, (r0, 0x34)

		static uint8_t flag = 0;
		static uint8_t invert = 0;
		static uint8_t cnt = 0;
	
		if(BT0->CMP == 0 && invert == 0)
    62ba:	9064      	ld.w      	r3, (r0, 0x10)
    62bc:	3b40      	cmpnei      	r3, 0
    62be:	1169      	lrw      	r3, 0x2000023b	// 6360 <BT0IntHandler+0xbc>
    62c0:	0815      	bt      	0x62ea	// 62ea <BT0IntHandler+0x46>
    62c2:	8340      	ld.b      	r2, (r3, 0x0)
    62c4:	3a40      	cmpnei      	r2, 0
    62c6:	0812      	bt      	0x62ea	// 62ea <BT0IntHandler+0x46>
		{
			flag = 1;
    62c8:	3201      	movi      	r2, 1
    62ca:	a341      	st.b      	r2, (r3, 0x1)
			invert = 1;
    62cc:	a340      	st.b      	r2, (r3, 0x0)
#ifdef DRIVER_LED_DEBUG
			printf("flag=%u\r\n", flag);
#endif

		}
		if(cnt == 1)
    62ce:	8342      	ld.b      	r2, (r3, 0x2)
    62d0:	3a41      	cmpnei      	r2, 1
    62d2:	081a      	bt      	0x6306	// 6306 <BT0IntHandler+0x62>
		{
			flag = 0;
    62d4:	3200      	movi      	r2, 0
    62d6:	a341      	st.b      	r2, (r3, 0x1)
			invert = 0;
    62d8:	a340      	st.b      	r2, (r3, 0x0)
			cnt = 0;
    62da:	a342      	st.b      	r2, (r3, 0x2)
			BT_Stop(BT0);
    62dc:	e3fff766 	bsr      	0x51a8	// 51a8 <BT_Stop>
	} 
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)
	{
		BT0->ICR = BT_EVTRG;
	} 
}
    62e0:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    62e4:	1401      	addi      	r14, r14, 4
    62e6:	1463      	ipop
    62e8:	1461      	nir
		}else if(BT0->CMP == 199 && invert == 1)
    62ea:	9024      	ld.w      	r1, (r0, 0x10)
    62ec:	32c7      	movi      	r2, 199
    62ee:	6486      	cmpne      	r1, r2
    62f0:	0bef      	bt      	0x62ce	// 62ce <BT0IntHandler+0x2a>
    62f2:	8340      	ld.b      	r2, (r3, 0x0)
    62f4:	3a41      	cmpnei      	r2, 1
    62f6:	0bec      	bt      	0x62ce	// 62ce <BT0IntHandler+0x2a>
			flag = 0;
    62f8:	3200      	movi      	r2, 0
    62fa:	a341      	st.b      	r2, (r3, 0x1)
			invert = 0;
    62fc:	a340      	st.b      	r2, (r3, 0x0)
			cnt++; /* 完成一次呼吸灯 */
    62fe:	8342      	ld.b      	r2, (r3, 0x2)
    6300:	2200      	addi      	r2, 1
    6302:	a342      	st.b      	r2, (r3, 0x2)
    6304:	07e5      	br      	0x62ce	// 62ce <BT0IntHandler+0x2a>
		if(flag == 0) /* 暗到亮 */
    6306:	8361      	ld.b      	r3, (r3, 0x1)
    6308:	3b40      	cmpnei      	r3, 0
    630a:	080b      	bt      	0x6320	// 6320 <BT0IntHandler+0x7c>
			if(BT0->CMP == 199)
    630c:	9044      	ld.w      	r2, (r0, 0x10)
    630e:	33c7      	movi      	r3, 199
    6310:	64ca      	cmpne      	r2, r3
				BT0->CMP -= 3; return;
    6312:	9064      	ld.w      	r3, (r0, 0x10)
			if(BT0->CMP == 199)
    6314:	0804      	bt      	0x631c	// 631c <BT0IntHandler+0x78>
				BT0->CMP -= 3; return;
    6316:	2b02      	subi      	r3, 3
			BT0->CMP -= 4;
    6318:	b064      	st.w      	r3, (r0, 0x10)
    631a:	07e3      	br      	0x62e0	// 62e0 <BT0IntHandler+0x3c>
    631c:	2b03      	subi      	r3, 4
    631e:	07fd      	br      	0x6318	// 6318 <BT0IntHandler+0x74>
		else if(flag == 1) /* 亮到暗 */
    6320:	3b41      	cmpnei      	r3, 1
    6322:	0bdf      	bt      	0x62e0	// 62e0 <BT0IntHandler+0x3c>
			if(BT0->CMP == 196)
    6324:	9044      	ld.w      	r2, (r0, 0x10)
    6326:	33c4      	movi      	r3, 196
    6328:	64ca      	cmpne      	r2, r3
				BT0->CMP += 3; return;
    632a:	9064      	ld.w      	r3, (r0, 0x10)
			if(BT0->CMP == 196)
    632c:	0803      	bt      	0x6332	// 6332 <BT0IntHandler+0x8e>
				BT0->CMP += 3; return;
    632e:	2302      	addi      	r3, 3
    6330:	07f4      	br      	0x6318	// 6318 <BT0IntHandler+0x74>
			BT0->CMP += 4;
    6332:	2303      	addi      	r3, 4
    6334:	07f2      	br      	0x6318	// 6318 <BT0IntHandler+0x74>
	else if((BT0->MISR&BT_CMP)==BT_CMP)
    6336:	906c      	ld.w      	r3, (r0, 0x30)
    6338:	3202      	movi      	r2, 2
    633a:	68c8      	and      	r3, r2
    633c:	3b40      	cmpnei      	r3, 0
    633e:	0c03      	bf      	0x6344	// 6344 <BT0IntHandler+0xa0>
		BT0->ICR = BT_EVTRG;
    6340:	b04d      	st.w      	r2, (r0, 0x34)
    6342:	07cf      	br      	0x62e0	// 62e0 <BT0IntHandler+0x3c>
	else if((BT0->MISR&BT_OVF)==BT_OVF)
    6344:	906c      	ld.w      	r3, (r0, 0x30)
    6346:	3204      	movi      	r2, 4
    6348:	68c8      	and      	r3, r2
    634a:	3b40      	cmpnei      	r3, 0
    634c:	0bfa      	bt      	0x6340	// 6340 <BT0IntHandler+0x9c>
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)
    634e:	906c      	ld.w      	r3, (r0, 0x30)
    6350:	3208      	movi      	r2, 8
    6352:	68c8      	and      	r3, r2
    6354:	3b40      	cmpnei      	r3, 0
    6356:	0bf5      	bt      	0x6340	// 6340 <BT0IntHandler+0x9c>
    6358:	07c4      	br      	0x62e0	// 62e0 <BT0IntHandler+0x3c>
    635a:	0000      	bkpt
    635c:	20000010 	.long	0x20000010
    6360:	2000023b 	.long	0x2000023b

Disassembly of section .text.GPT0IntHandler:

00006364 <GPT0IntHandler>:

/* GPT0 Interrupt */
void GPT0IntHandler(void) 
{
    6364:	1460      	nie
    6366:	1462      	ipush
    6368:	14d1      	push      	r4, r15
	if((GPT0->MISR & GPT_INT_PEND) == GPT_INT_PEND)
    636a:	1271      	lrw      	r3, 0x20000028	// 64ac <GPT0IntHandler+0x148>
    636c:	3080      	movi      	r0, 128
    636e:	9340      	ld.w      	r2, (r3, 0x0)
    6370:	5a60      	addu      	r3, r2, r0
    6372:	3180      	movi      	r1, 128
    6374:	9395      	ld.w      	r4, (r3, 0x54)
    6376:	4129      	lsli      	r1, r1, 9
    6378:	6904      	and      	r4, r1
    637a:	3c40      	cmpnei      	r4, 0
    637c:	0c50      	bf      	0x641c	// 641c <GPT0IntHandler+0xb8>
	{
		GPT0->ICR = GPT_INT_PEND;
    637e:	b337      	st.w      	r1, (r3, 0x5c)
		
		static U8_T flag = 0;
		static U8_T BreathCnt = 0;
		static U8_T SoildTime = 0;
		
		if((GPT0->CMPA == 0) && (SoildTime == 25)) flag = 1;
    6380:	926b      	ld.w      	r3, (r2, 0x2c)
    6382:	3b40      	cmpnei      	r3, 0
    6384:	126b      	lrw      	r3, 0x2000023b	// 64b0 <GPT0IntHandler+0x14c>
    6386:	0815      	bt      	0x63b0	// 63b0 <GPT0IntHandler+0x4c>
    6388:	8323      	ld.b      	r1, (r3, 0x3)
    638a:	3959      	cmpnei      	r1, 25
    638c:	0812      	bt      	0x63b0	// 63b0 <GPT0IntHandler+0x4c>
    638e:	3101      	movi      	r1, 1
    6390:	a324      	st.b      	r1, (r3, 0x4)
		{
			flag = 0;
			BreathCnt = 0;
			SoildTime = 0;
		}	
		if(flag == 0)  /* 暗到亮 */
    6392:	8324      	ld.b      	r1, (r3, 0x4)
    6394:	3940      	cmpnei      	r1, 0
    6396:	0825      	bt      	0x63e0	// 63e0 <GPT0IntHandler+0x7c>
		{
			if(GPT0->CMPA == 0) SoildTime++; /* 亮0.5秒后变暗 */
    6398:	922b      	ld.w      	r1, (r2, 0x2c)
    639a:	3940      	cmpnei      	r1, 0
    639c:	0813      	bt      	0x63c2	// 63c2 <GPT0IntHandler+0x5e>
    639e:	8343      	ld.b      	r2, (r3, 0x3)
    63a0:	2200      	addi      	r2, 1
    63a2:	a343      	st.b      	r2, (r3, 0x3)
	}
	else if((GPT0->MISR & GPT_INT_CBD) == GPT_INT_CBD)
	{
		GPT0->ICR = GPT_INT_CBD;
	}
}
    63a4:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    63a8:	9880      	ld.w      	r4, (r14, 0x0)
    63aa:	1402      	addi      	r14, r14, 8
    63ac:	1463      	ipop
    63ae:	1461      	nir
		else if(GPT0->CMPA == 200) 
    63b0:	920b      	ld.w      	r0, (r2, 0x2c)
    63b2:	31c8      	movi      	r1, 200
    63b4:	6442      	cmpne      	r0, r1
    63b6:	0bee      	bt      	0x6392	// 6392 <GPT0IntHandler+0x2e>
			flag = 0;
    63b8:	3100      	movi      	r1, 0
    63ba:	a324      	st.b      	r1, (r3, 0x4)
			BreathCnt = 0;
    63bc:	a325      	st.b      	r1, (r3, 0x5)
			SoildTime = 0;
    63be:	a323      	st.b      	r1, (r3, 0x3)
    63c0:	07e9      	br      	0x6392	// 6392 <GPT0IntHandler+0x2e>
				if(GPT0->CMPA > 56) GPT0->CMPA -= 12; 
    63c2:	922b      	ld.w      	r1, (r2, 0x2c)
    63c4:	3338      	movi      	r3, 56
    63c6:	644c      	cmphs      	r3, r1
    63c8:	926b      	ld.w      	r3, (r2, 0x2c)
    63ca:	0804      	bt      	0x63d2	// 63d2 <GPT0IntHandler+0x6e>
    63cc:	2b0b      	subi      	r3, 12
				else if(GPT0->CMPA > 8) GPT0->CMPA -= 4; 
    63ce:	b26b      	st.w      	r3, (r2, 0x2c)
    63d0:	07ea      	br      	0x63a4	// 63a4 <GPT0IntHandler+0x40>
    63d2:	3b08      	cmphsi      	r3, 9
    63d4:	926b      	ld.w      	r3, (r2, 0x2c)
    63d6:	0c03      	bf      	0x63dc	// 63dc <GPT0IntHandler+0x78>
    63d8:	2b03      	subi      	r3, 4
    63da:	07fa      	br      	0x63ce	// 63ce <GPT0IntHandler+0x6a>
				else GPT0->CMPA -= 8; 
    63dc:	2b07      	subi      	r3, 8
    63de:	07f8      	br      	0x63ce	// 63ce <GPT0IntHandler+0x6a>
		else if(flag == 1) /* 亮到暗 */
    63e0:	3941      	cmpnei      	r1, 1
    63e2:	0be1      	bt      	0x63a4	// 63a4 <GPT0IntHandler+0x40>
			if(GPT0->CMPA == 192) BreathCnt++; /* 完成一次呼吸灯 */
    63e4:	920b      	ld.w      	r0, (r2, 0x2c)
    63e6:	31c0      	movi      	r1, 192
    63e8:	6442      	cmpne      	r0, r1
    63ea:	080a      	bt      	0x63fe	// 63fe <GPT0IntHandler+0x9a>
    63ec:	8345      	ld.b      	r2, (r3, 0x5)
    63ee:	2200      	addi      	r2, 1
    63f0:	a345      	st.b      	r2, (r3, 0x5)
			if(BreathCnt == 1)
    63f2:	8365      	ld.b      	r3, (r3, 0x5)
    63f4:	3b41      	cmpnei      	r3, 1
    63f6:	0bd7      	bt      	0x63a4	// 63a4 <GPT0IntHandler+0x40>
				GPT_Stop();
    63f8:	e3fff6dc 	bsr      	0x51b0	// 51b0 <GPT_Stop>
				return;
    63fc:	07d4      	br      	0x63a4	// 63a4 <GPT0IntHandler+0x40>
				if(GPT0->CMPA < 144) GPT0->CMPA += 12;
    63fe:	920b      	ld.w      	r0, (r2, 0x2c)
    6400:	318f      	movi      	r1, 143
    6402:	6404      	cmphs      	r1, r0
    6404:	0c05      	bf      	0x640e	// 640e <GPT0IntHandler+0xaa>
    6406:	922b      	ld.w      	r1, (r2, 0x2c)
    6408:	210b      	addi      	r1, 12
				else if(GPT0->CMPA < 192) GPT0->CMPA += 4;
    640a:	b22b      	st.w      	r1, (r2, 0x2c)
    640c:	07f3      	br      	0x63f2	// 63f2 <GPT0IntHandler+0x8e>
    640e:	920b      	ld.w      	r0, (r2, 0x2c)
    6410:	31bf      	movi      	r1, 191
    6412:	6404      	cmphs      	r1, r0
    6414:	0fef      	bf      	0x63f2	// 63f2 <GPT0IntHandler+0x8e>
    6416:	922b      	ld.w      	r1, (r2, 0x2c)
    6418:	2103      	addi      	r1, 4
    641a:	07f8      	br      	0x640a	// 640a <GPT0IntHandler+0xa6>
	else if((GPT0->MISR & GPT_INT_TRGEV0) == GPT_INT_TRGEV0)
    641c:	9335      	ld.w      	r1, (r3, 0x54)
    641e:	3201      	movi      	r2, 1
    6420:	6848      	and      	r1, r2
    6422:	3940      	cmpnei      	r1, 0
    6424:	0c03      	bf      	0x642a	// 642a <GPT0IntHandler+0xc6>
		GPT0->ICR = GPT_INT_CBD;
    6426:	b357      	st.w      	r2, (r3, 0x5c)
    6428:	07be      	br      	0x63a4	// 63a4 <GPT0IntHandler+0x40>
	else if((GPT0->MISR & GPT_INT_TRGEV1) == GPT_INT_TRGEV1)
    642a:	9335      	ld.w      	r1, (r3, 0x54)
    642c:	3402      	movi      	r4, 2
    642e:	6850      	and      	r1, r4
    6430:	3940      	cmpnei      	r1, 0
    6432:	0c03      	bf      	0x6438	// 6438 <GPT0IntHandler+0xd4>
		GPT0->ICR = GPT_INT_TRGEV1;
    6434:	b397      	st.w      	r4, (r3, 0x5c)
    6436:	07b7      	br      	0x63a4	// 63a4 <GPT0IntHandler+0x40>
	else if((GPT0->MISR & GPT_INT_TRGEV2) == GPT_INT_TRGEV2)
    6438:	9335      	ld.w      	r1, (r3, 0x54)
    643a:	3404      	movi      	r4, 4
    643c:	6850      	and      	r1, r4
    643e:	3940      	cmpnei      	r1, 0
    6440:	0bf3      	bt      	0x6426	// 6426 <GPT0IntHandler+0xc2>
	else if((GPT0->MISR & GPT_TRGEV3) == GPT_INT_TRGEV3)
    6442:	9355      	ld.w      	r2, (r3, 0x54)
    6444:	3108      	movi      	r1, 8
    6446:	6884      	and      	r2, r1
    6448:	3a40      	cmpnei      	r2, 0
    644a:	0c03      	bf      	0x6450	// 6450 <GPT0IntHandler+0xec>
		GPT0->ICR = GPT_INT_CAPLD2;
    644c:	b337      	st.w      	r1, (r3, 0x5c)
    644e:	07ab      	br      	0x63a4	// 63a4 <GPT0IntHandler+0x40>
	else if((GPT0->MISR & GPT_INT_CAPLD0) == GPT_INT_CAPLD0)
    6450:	9355      	ld.w      	r2, (r3, 0x54)
    6452:	3110      	movi      	r1, 16
    6454:	6884      	and      	r2, r1
    6456:	3a40      	cmpnei      	r2, 0
    6458:	0bfa      	bt      	0x644c	// 644c <GPT0IntHandler+0xe8>
	else if((GPT0->MISR & GPT_INT_CAPLD1) == GPT_INT_CAPLD1)
    645a:	9355      	ld.w      	r2, (r3, 0x54)
    645c:	3120      	movi      	r1, 32
    645e:	6884      	and      	r2, r1
    6460:	3a40      	cmpnei      	r2, 0
    6462:	0bf5      	bt      	0x644c	// 644c <GPT0IntHandler+0xe8>
	else if((GPT0->MISR & GPT_INT_CAPLD2) == GPT_INT_CAPLD2)
    6464:	9355      	ld.w      	r2, (r3, 0x54)
    6466:	3140      	movi      	r1, 64
    6468:	6884      	and      	r2, r1
    646a:	3a40      	cmpnei      	r2, 0
    646c:	0bf0      	bt      	0x644c	// 644c <GPT0IntHandler+0xe8>
	else if((GPT0->MISR & GPT_INT_CAPLD3) == GPT_INT_CAPLD3)
    646e:	9355      	ld.w      	r2, (r3, 0x54)
    6470:	6880      	and      	r2, r0
    6472:	3a40      	cmpnei      	r2, 0
    6474:	0c03      	bf      	0x647a	// 647a <GPT0IntHandler+0x116>
		GPT0->ICR = GPT_INT_CAPLD3;
    6476:	b317      	st.w      	r0, (r3, 0x5c)
    6478:	0796      	br      	0x63a4	// 63a4 <GPT0IntHandler+0x40>
	else if((GPT0->MISR & GPT_INT_CAU) == GPT_INT_CAU)
    647a:	3280      	movi      	r2, 128
    647c:	9335      	ld.w      	r1, (r3, 0x54)
    647e:	4241      	lsli      	r2, r2, 1
    6480:	6848      	and      	r1, r2
    6482:	3940      	cmpnei      	r1, 0
    6484:	0bd1      	bt      	0x6426	// 6426 <GPT0IntHandler+0xc2>
	else if((GPT0->MISR & GPT_INT_CAD) == GPT_INT_CAD)
    6486:	3280      	movi      	r2, 128
    6488:	9335      	ld.w      	r1, (r3, 0x54)
    648a:	4242      	lsli      	r2, r2, 2
    648c:	6848      	and      	r1, r2
    648e:	3940      	cmpnei      	r1, 0
    6490:	0bcb      	bt      	0x6426	// 6426 <GPT0IntHandler+0xc2>
	else if((GPT0->MISR & GPT_INT_CBU) == GPT_INT_CBU)
    6492:	3280      	movi      	r2, 128
    6494:	9335      	ld.w      	r1, (r3, 0x54)
    6496:	4243      	lsli      	r2, r2, 3
    6498:	6848      	and      	r1, r2
    649a:	3940      	cmpnei      	r1, 0
    649c:	0bc5      	bt      	0x6426	// 6426 <GPT0IntHandler+0xc2>
	else if((GPT0->MISR & GPT_INT_CBD) == GPT_INT_CBD)
    649e:	3280      	movi      	r2, 128
    64a0:	9335      	ld.w      	r1, (r3, 0x54)
    64a2:	4244      	lsli      	r2, r2, 4
    64a4:	6848      	and      	r1, r2
    64a6:	3940      	cmpnei      	r1, 0
    64a8:	0bbf      	bt      	0x6426	// 6426 <GPT0IntHandler+0xc2>
    64aa:	077d      	br      	0x63a4	// 63a4 <GPT0IntHandler+0x40>
    64ac:	20000028 	.long	0x20000028
    64b0:	2000023b 	.long	0x2000023b

Disassembly of section .text.WWDTHandler:

000064b4 <WWDTHandler>:
//WWDT Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void WWDTHandler(void)
{
    64b4:	1460      	nie
    64b6:	1462      	ipush
    64b8:	14d3      	push      	r4-r6, r15
	WWDT->ICR=0X01;
    64ba:	10b0      	lrw      	r5, 0x20000014	// 64f8 <WWDTHandler+0x44>
    64bc:	3401      	movi      	r4, 1
    64be:	9560      	ld.w      	r3, (r5, 0x0)
    64c0:	b385      	st.w      	r4, (r3, 0x14)
	WWDT_CNT_Load(0xFF);
    64c2:	30ff      	movi      	r0, 255
	GPIO_Init(GPIOA0,4,0);
    64c4:	10ce      	lrw      	r6, 0x20000050	// 64fc <WWDTHandler+0x48>
	WWDT_CNT_Load(0xFF);
    64c6:	e3fff64f 	bsr      	0x5164	// 5164 <WWDT_CNT_Load>
	GPIO_Init(GPIOA0,4,0);
    64ca:	3200      	movi      	r2, 0
    64cc:	3104      	movi      	r1, 4
    64ce:	9600      	ld.w      	r0, (r6, 0x0)
    64d0:	e3fff3d8 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Reverse(GPIOA0,4);
    64d4:	9600      	ld.w      	r0, (r6, 0x0)
    64d6:	3104      	movi      	r1, 4
    64d8:	e3fff5c4 	bsr      	0x5060	// 5060 <GPIO_Reverse>
	
	if((WWDT->MISR&WWDT_EVI)==WWDT_EVI)
    64dc:	9540      	ld.w      	r2, (r5, 0x0)
    64de:	9263      	ld.w      	r3, (r2, 0xc)
    64e0:	68d0      	and      	r3, r4
    64e2:	3b40      	cmpnei      	r3, 0
    64e4:	0c02      	bf      	0x64e8	// 64e8 <WWDTHandler+0x34>
	{
		WWDT->ICR = WWDT_EVI;
    64e6:	b285      	st.w      	r4, (r2, 0x14)
	} 
}
    64e8:	d9ee2003 	ld.w      	r15, (r14, 0xc)
    64ec:	98c2      	ld.w      	r6, (r14, 0x8)
    64ee:	98a1      	ld.w      	r5, (r14, 0x4)
    64f0:	9880      	ld.w      	r4, (r14, 0x0)
    64f2:	1404      	addi      	r14, r14, 16
    64f4:	1463      	ipop
    64f6:	1461      	nir
    64f8:	20000014 	.long	0x20000014
    64fc:	20000050 	.long	0x20000050

Disassembly of section .text.BT1IntHandler:

00006500 <BT1IntHandler>:
//BT1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT1IntHandler(void) 
{
    6500:	1460      	nie
    6502:	1462      	ipush
    // ISR content ...
	if((BT1->MISR & BT_PEND) == BT_PEND)
    6504:	106f      	lrw      	r3, 0x2000000c	// 6540 <BT1IntHandler+0x40>
    6506:	3101      	movi      	r1, 1
    6508:	9360      	ld.w      	r3, (r3, 0x0)
    650a:	934c      	ld.w      	r2, (r3, 0x30)
    650c:	6884      	and      	r2, r1
    650e:	3a40      	cmpnei      	r2, 0
    6510:	0c03      	bf      	0x6516	// 6516 <BT1IntHandler+0x16>
	{
		BT1->ICR = BT_OVF;
	} 
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)
	{
		BT1->ICR = BT_EVTRG;
    6512:	b32d      	st.w      	r1, (r3, 0x34)
	} 
}
    6514:	0409      	br      	0x6526	// 6526 <BT1IntHandler+0x26>
	else if((BT0->MISR&BT_CMP)==BT_CMP)
    6516:	104c      	lrw      	r2, 0x20000010	// 6544 <BT1IntHandler+0x44>
    6518:	3002      	movi      	r0, 2
    651a:	9240      	ld.w      	r2, (r2, 0x0)
    651c:	922c      	ld.w      	r1, (r2, 0x30)
    651e:	6840      	and      	r1, r0
    6520:	3940      	cmpnei      	r1, 0
    6522:	0c04      	bf      	0x652a	// 652a <BT1IntHandler+0x2a>
		BT1->ICR = BT_OVF;
    6524:	b30d      	st.w      	r0, (r3, 0x34)
}
    6526:	1463      	ipop
    6528:	1461      	nir
	else if((BT0->MISR&BT_OVF)==BT_OVF)
    652a:	922c      	ld.w      	r1, (r2, 0x30)
    652c:	3004      	movi      	r0, 4
    652e:	6840      	and      	r1, r0
    6530:	3940      	cmpnei      	r1, 0
    6532:	0bf9      	bt      	0x6524	// 6524 <BT1IntHandler+0x24>
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)
    6534:	924c      	ld.w      	r2, (r2, 0x30)
    6536:	3108      	movi      	r1, 8
    6538:	6884      	and      	r2, r1
    653a:	3a40      	cmpnei      	r2, 0
    653c:	0beb      	bt      	0x6512	// 6512 <BT1IntHandler+0x12>
    653e:	07f4      	br      	0x6526	// 6526 <BT1IntHandler+0x26>
    6540:	2000000c 	.long	0x2000000c
    6544:	20000010 	.long	0x20000010

Disassembly of section .text.RTCIntHandler:

00006548 <RTCIntHandler>:
//RTC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void RTCIntHandler(void) 
{
    6548:	1460      	nie
    654a:	1462      	ipush
    // ISR content ...
	if((RTC->MISR&ALRA_INT)==ALRA_INT)			//ALRAR 
    654c:	1079      	lrw      	r3, 0x2000001c	// 65b0 <RTCIntHandler+0x68>
    654e:	3101      	movi      	r1, 1
    6550:	9360      	ld.w      	r3, (r3, 0x0)
    6552:	934a      	ld.w      	r2, (r3, 0x28)
    6554:	6884      	and      	r2, r1
    6556:	3a40      	cmpnei      	r2, 0
    6558:	0c14      	bf      	0x6580	// 6580 <RTCIntHandler+0x38>
	{
		RTC->ICR=ALRA_INT;
		RTC->KEY=0XCA53;
    655a:	1057      	lrw      	r2, 0xca53	// 65b4 <RTCIntHandler+0x6c>
		RTC->ICR=ALRA_INT;
    655c:	b32b      	st.w      	r1, (r3, 0x2c)
		RTC->KEY=0XCA53;
    655e:	b34c      	st.w      	r2, (r3, 0x30)
		RTC->CR=RTC->CR|0x01;
    6560:	9342      	ld.w      	r2, (r3, 0x8)
    6562:	6c84      	or      	r2, r1
    6564:	b342      	st.w      	r2, (r3, 0x8)
		RTC->TIMR=(0x10<<16)|(0x00<<8)|(0x00);			//Hour bit6->0:am 1:pm	
    6566:	3280      	movi      	r2, 128
    6568:	424d      	lsli      	r2, r2, 13
    656a:	b340      	st.w      	r2, (r3, 0x0)
		while(RTC->CR&0x02);//busy 判断TIMR DATR ALRAR ALRBR数据写完
    656c:	3102      	movi      	r1, 2
    656e:	9342      	ld.w      	r2, (r3, 0x8)
    6570:	6884      	and      	r2, r1
    6572:	3a40      	cmpnei      	r2, 0
    6574:	0bfd      	bt      	0x656e	// 656e <RTCIntHandler+0x26>
		RTC->CR &= ~0x1;
    6576:	9342      	ld.w      	r2, (r3, 0x8)
    6578:	3a80      	bclri      	r2, 0
    657a:	b342      	st.w      	r2, (r3, 0x8)
	}
	else if((RTC->IMCR&RTC_TRGEV1_INT)==RTC_TRGEV1_INT)
	{
		RTC->ICR=RTC_TRGEV1_INT;
	}
}
    657c:	1463      	ipop
    657e:	1461      	nir
	else if((RTC->MISR&ALRB_INT)==ALRB_INT)			//ALRBR				
    6580:	934a      	ld.w      	r2, (r3, 0x28)
    6582:	3102      	movi      	r1, 2
    6584:	6884      	and      	r2, r1
    6586:	3a40      	cmpnei      	r2, 0
    6588:	0c03      	bf      	0x658e	// 658e <RTCIntHandler+0x46>
		RTC->ICR=RTC_TRGEV1_INT;
    658a:	b32b      	st.w      	r1, (r3, 0x2c)
}
    658c:	07f8      	br      	0x657c	// 657c <RTCIntHandler+0x34>
	else if((RTC->IMCR&CPRD_INT)==CPRD_INT)			//CPRD
    658e:	9349      	ld.w      	r2, (r3, 0x24)
    6590:	3104      	movi      	r1, 4
    6592:	6884      	and      	r2, r1
    6594:	3a40      	cmpnei      	r2, 0
    6596:	0bfa      	bt      	0x658a	// 658a <RTCIntHandler+0x42>
	else if((RTC->IMCR&RTC_TRGEV0_INT)==RTC_TRGEV0_INT)
    6598:	9349      	ld.w      	r2, (r3, 0x24)
    659a:	3108      	movi      	r1, 8
    659c:	6884      	and      	r2, r1
    659e:	3a40      	cmpnei      	r2, 0
    65a0:	0bf5      	bt      	0x658a	// 658a <RTCIntHandler+0x42>
	else if((RTC->IMCR&RTC_TRGEV1_INT)==RTC_TRGEV1_INT)
    65a2:	9349      	ld.w      	r2, (r3, 0x24)
    65a4:	3110      	movi      	r1, 16
    65a6:	6884      	and      	r2, r1
    65a8:	3a40      	cmpnei      	r2, 0
    65aa:	0bf0      	bt      	0x658a	// 658a <RTCIntHandler+0x42>
    65ac:	07e8      	br      	0x657c	// 657c <RTCIntHandler+0x34>
    65ae:	0000      	bkpt
    65b0:	2000001c 	.long	0x2000001c
    65b4:	0000ca53 	.long	0x0000ca53

Disassembly of section .text.UART0IntHandler:

000065b8 <UART0IntHandler>:

/* UART0 Interrupt */
void UART0IntHandler(void) 
{
    65b8:	1460      	nie
    65ba:	1462      	ipush
	if((UART0->ISR & UART_RX_INT_S) == UART_RX_INT_S)
    65bc:	1070      	lrw      	r3, 0x20000044	// 65fc <UART0IntHandler+0x44>
    65be:	3102      	movi      	r1, 2
    65c0:	9360      	ld.w      	r3, (r3, 0x0)
    65c2:	9343      	ld.w      	r2, (r3, 0xc)
    65c4:	6884      	and      	r2, r1
    65c6:	3a40      	cmpnei      	r2, 0
    65c8:	0c03      	bf      	0x65ce	// 65ce <UART0IntHandler+0x16>
	{
		UART0->ISR = UART_RX_IOV_S;
	}
	else if((UART0->ISR & UART_TX_IOV_S) == UART_TX_IOV_S)
	{
		UART0->ISR = UART_TX_IOV_S;
    65ca:	b323      	st.w      	r1, (r3, 0xc)
	}
}
    65cc:	040a      	br      	0x65e0	// 65e0 <UART0IntHandler+0x28>
	else if((UART0->ISR & UART_TX_INT_S) == UART_TX_INT_S ) 
    65ce:	9343      	ld.w      	r2, (r3, 0xc)
    65d0:	3101      	movi      	r1, 1
    65d2:	6884      	and      	r2, r1
    65d4:	3a40      	cmpnei      	r2, 0
    65d6:	0c07      	bf      	0x65e4	// 65e4 <UART0IntHandler+0x2c>
		UART0->ISR = UART_TX_INT_S;
    65d8:	b323      	st.w      	r1, (r3, 0xc)
		TxDataFlag = TRUE;
    65da:	3201      	movi      	r2, 1
    65dc:	1069      	lrw      	r3, 0x20000235	// 6600 <UART0IntHandler+0x48>
    65de:	a340      	st.b      	r2, (r3, 0x0)
}
    65e0:	1463      	ipop
    65e2:	1461      	nir
	else if((UART0->ISR & UART_RX_IOV_S) == UART_RX_IOV_S)
    65e4:	9343      	ld.w      	r2, (r3, 0xc)
    65e6:	3108      	movi      	r1, 8
    65e8:	6884      	and      	r2, r1
    65ea:	3a40      	cmpnei      	r2, 0
    65ec:	0bef      	bt      	0x65ca	// 65ca <UART0IntHandler+0x12>
	else if((UART0->ISR & UART_TX_IOV_S) == UART_TX_IOV_S)
    65ee:	9343      	ld.w      	r2, (r3, 0xc)
    65f0:	3104      	movi      	r1, 4
    65f2:	6884      	and      	r2, r1
    65f4:	3a40      	cmpnei      	r2, 0
    65f6:	0bea      	bt      	0x65ca	// 65ca <UART0IntHandler+0x12>
    65f8:	07f4      	br      	0x65e0	// 65e0 <UART0IntHandler+0x28>
    65fa:	0000      	bkpt
    65fc:	20000044 	.long	0x20000044
    6600:	20000235 	.long	0x20000235

Disassembly of section .text.UART1IntHandler:

00006604 <UART1IntHandler>:
/*************************************************************/
extern volatile U8_T progDatabuf[32];
extern volatile int indx;

void UART1IntHandler(void) 
{
    6604:	1460      	nie
    6606:	1462      	ipush
    6608:	14d2      	push      	r4-r5, r15
    // ISR content ...
	//Interupt
	if ((UART1->ISR&UART_RX_INT_S)==UART_RX_INT_S)
    660a:	107f      	lrw      	r3, 0x20000040	// 6684 <UART1IntHandler+0x80>
    660c:	3102      	movi      	r1, 2
    660e:	9360      	ld.w      	r3, (r3, 0x0)
    6610:	9343      	ld.w      	r2, (r3, 0xc)
    6612:	6884      	and      	r2, r1
    6614:	3a40      	cmpnei      	r2, 0
    6616:	0c20      	bf      	0x6656	// 6656 <UART1IntHandler+0x52>
	{
		UART1->ISR=UART_RX_INT_S;
    6618:	b323      	st.w      	r1, (r3, 0xc)
		
		//modify by pilgrimage to adapt 5556KHZ HCLK
		progDatabuf[indx++] = UART1 -> DATA;
    661a:	109c      	lrw      	r4, 0x20000264	// 6688 <UART1IntHandler+0x84>
    661c:	10bc      	lrw      	r5, 0x20000244	// 668c <UART1IntHandler+0x88>
    661e:	9440      	ld.w      	r2, (r4, 0x0)
    6620:	5a22      	addi      	r1, r2, 1
    6622:	b420      	st.w      	r1, (r4, 0x0)
    6624:	9360      	ld.w      	r3, (r3, 0x0)
    6626:	6094      	addu      	r2, r5
    6628:	74cc      	zextb      	r3, r3
    662a:	a260      	st.b      	r3, (r2, 0x0)
		indx %= 30;
    662c:	9400      	ld.w      	r0, (r4, 0x0)
    662e:	311e      	movi      	r1, 30
    6630:	e0000284 	bsr      	0x6b38	// 6b38 <__modsi3>
    6634:	b400      	st.w      	r0, (r4, 0x0)
		if(progDatabuf[indx - 1] == 0xF8) program_trig_check();
    6636:	9460      	ld.w      	r3, (r4, 0x0)
    6638:	2b00      	subi      	r3, 1
    663a:	614c      	addu      	r5, r3
    663c:	8540      	ld.b      	r2, (r5, 0x0)
    663e:	33f8      	movi      	r3, 248
    6640:	64ca      	cmpne      	r2, r3
    6642:	0803      	bt      	0x6648	// 6648 <UART1IntHandler+0x44>
    6644:	e0000236 	bsr      	0x6ab0	// 6ab0 <program_trig_check>
	}
	else if ((UART1->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)
	{
		UART1->ISR=UART_TX_IOV_S;
	}
}
    6648:	d9ee2002 	ld.w      	r15, (r14, 0x8)
    664c:	98a1      	ld.w      	r5, (r14, 0x4)
    664e:	9880      	ld.w      	r4, (r14, 0x0)
    6650:	1403      	addi      	r14, r14, 12
    6652:	1463      	ipop
    6654:	1461      	nir
	else if( (UART1->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 
    6656:	9343      	ld.w      	r2, (r3, 0xc)
    6658:	3101      	movi      	r1, 1
    665a:	6884      	and      	r2, r1
    665c:	3a40      	cmpnei      	r2, 0
    665e:	0c06      	bf      	0x666a	// 666a <UART1IntHandler+0x66>
		UART1->ISR=UART_TX_INT_S;
    6660:	b323      	st.w      	r1, (r3, 0xc)
		TxDataFlag = TRUE;
    6662:	3201      	movi      	r2, 1
    6664:	106b      	lrw      	r3, 0x20000235	// 6690 <UART1IntHandler+0x8c>
    6666:	a340      	st.b      	r2, (r3, 0x0)
    6668:	07f0      	br      	0x6648	// 6648 <UART1IntHandler+0x44>
	else if ((UART1->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)
    666a:	9343      	ld.w      	r2, (r3, 0xc)
    666c:	3108      	movi      	r1, 8
    666e:	6884      	and      	r2, r1
    6670:	3a40      	cmpnei      	r2, 0
    6672:	0c03      	bf      	0x6678	// 6678 <UART1IntHandler+0x74>
		UART1->ISR=UART_TX_IOV_S;
    6674:	b323      	st.w      	r1, (r3, 0xc)
    6676:	07e9      	br      	0x6648	// 6648 <UART1IntHandler+0x44>
	else if ((UART1->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)
    6678:	9343      	ld.w      	r2, (r3, 0xc)
    667a:	3104      	movi      	r1, 4
    667c:	6884      	and      	r2, r1
    667e:	3a40      	cmpnei      	r2, 0
    6680:	0bfa      	bt      	0x6674	// 6674 <UART1IntHandler+0x70>
    6682:	07e3      	br      	0x6648	// 6648 <UART1IntHandler+0x44>
    6684:	20000040 	.long	0x20000040
    6688:	20000264 	.long	0x20000264
    668c:	20000244 	.long	0x20000244
    6690:	20000235 	.long	0x20000235

Disassembly of section .text.I2CIntHandler:

00006694 <I2CIntHandler>:
//I2C Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2CIntHandler(void) 
{
    6694:	1460      	nie
    6696:	1462      	ipush
    6698:	14d0      	push      	r15
    // ISR content ...
	I2C_Slave_Receive();
    669a:	e3fff74b 	bsr      	0x5530	// 5530 <I2C_Slave_Receive>
}
    669e:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    66a2:	1401      	addi      	r14, r14, 4
    66a4:	1463      	ipop
    66a6:	1461      	nir

Disassembly of section .text.SPI0IntHandler:

000066a8 <SPI0IntHandler>:
//SPI Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SPI0IntHandler(void) 
{
    66a8:	1460      	nie
    66aa:	1462      	ipush
    // ISR content ...
	if((SPI0->MISR&SPI_PORIM)==SPI_PORIM)					//Receive Overrun Interrupt
    66ac:	106d      	lrw      	r3, 0x20000038	// 66e0 <SPI0IntHandler+0x38>
    66ae:	3101      	movi      	r1, 1
    66b0:	9360      	ld.w      	r3, (r3, 0x0)
    66b2:	9347      	ld.w      	r2, (r3, 0x1c)
    66b4:	6884      	and      	r2, r1
    66b6:	3a40      	cmpnei      	r2, 0
    66b8:	0c03      	bf      	0x66be	// 66be <SPI0IntHandler+0x16>
			}
		}*/
	}
	else if((SPI0->MISR&SPI_TXIM)==SPI_TXIM)				//Transmit FIFO Interrupt
	{
		SPI0->ICR = SPI_TXIM;
    66ba:	b328      	st.w      	r1, (r3, 0x20)
	}

}
    66bc:	0410      	br      	0x66dc	// 66dc <SPI0IntHandler+0x34>
	else if((SPI0->MISR&SPI_RTIM)==SPI_RTIM)				//Receive Timeout Interrupt
    66be:	9347      	ld.w      	r2, (r3, 0x1c)
    66c0:	3102      	movi      	r1, 2
    66c2:	6884      	and      	r2, r1
    66c4:	3a40      	cmpnei      	r2, 0
    66c6:	0bfa      	bt      	0x66ba	// 66ba <SPI0IntHandler+0x12>
	else if((SPI0->MISR&SPI_RXIM)==SPI_RXIM)				//Receive FIFO Interrupt,FIFO can be set 1/8,1/4,1/2 FIFO Interrupt
    66c8:	9347      	ld.w      	r2, (r3, 0x1c)
    66ca:	3104      	movi      	r1, 4
    66cc:	6884      	and      	r2, r1
    66ce:	3a40      	cmpnei      	r2, 0
    66d0:	0bf5      	bt      	0x66ba	// 66ba <SPI0IntHandler+0x12>
	else if((SPI0->MISR&SPI_TXIM)==SPI_TXIM)				//Transmit FIFO Interrupt
    66d2:	9347      	ld.w      	r2, (r3, 0x1c)
    66d4:	3108      	movi      	r1, 8
    66d6:	6884      	and      	r2, r1
    66d8:	3a40      	cmpnei      	r2, 0
    66da:	0bf0      	bt      	0x66ba	// 66ba <SPI0IntHandler+0x12>
}
    66dc:	1463      	ipop
    66de:	1461      	nir
    66e0:	20000038 	.long	0x20000038

Disassembly of section .text.SIO0IntHandler:

000066e4 <SIO0IntHandler>:
//SIO Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SIO0IntHandler(void) 
{
    66e4:	1460      	nie
    66e6:	1462      	ipush
		delay_nms(10);
		SIO0->TXBUF=(0x03<<30)|(0x02<<28)|(0x03<<26)|(0x02<<24)|(0x03<<22)|(0x02<<20)|(0x03<<18)|(0x02<<16)|
				(0x01<<14)|(0x00<<12)|(0x01<<10)|(0x00<<8)|(0x01<<6)|(0x00<<4)|(0x01<<2)|(0x0<<0);		//0:D0,1:D1,2:DL,3:DH;	
	}*/
	
	if(SIO0->MISR&0X02)					//RXDNE
    66e8:	107d      	lrw      	r3, 0x20000030	// 675c <SIO0IntHandler+0x78>
    66ea:	3102      	movi      	r1, 2
    66ec:	9360      	ld.w      	r3, (r3, 0x0)
    66ee:	9349      	ld.w      	r2, (r3, 0x24)
    66f0:	6884      	and      	r2, r1
    66f2:	3a40      	cmpnei      	r2, 0
    66f4:	0c13      	bf      	0x671a	// 671a <SIO0IntHandler+0x36>
	{
		SIO0->ICR=0X02;
    66f6:	b32b      	st.w      	r1, (r3, 0x2c)
		if(R_SIORX_count>=1)
    66f8:	101a      	lrw      	r0, 0x20000338	// 6760 <SIO0IntHandler+0x7c>
    66fa:	9040      	ld.w      	r2, (r0, 0x0)
    66fc:	3a20      	cmplti      	r2, 1
    66fe:	080c      	bt      	0x6716	// 6716 <SIO0IntHandler+0x32>
		{
			R_SIORX_buf[R_SIORX_count]=SIO0->RXBUF&0xff000000;			//8bit
    6700:	9040      	ld.w      	r2, (r0, 0x0)
    6702:	9327      	ld.w      	r1, (r3, 0x1c)
    6704:	4938      	lsri      	r1, r1, 24
    6706:	4262      	lsli      	r3, r2, 2
    6708:	1057      	lrw      	r2, 0x2000033c	// 6764 <SIO0IntHandler+0x80>
    670a:	4138      	lsli      	r1, r1, 24
    670c:	60c8      	addu      	r3, r2
    670e:	b320      	st.w      	r1, (r3, 0x0)
			nop;
    6710:	6c03      	mov      	r0, r0
			R_SIORX_count=0;
    6712:	3300      	movi      	r3, 0
    6714:	b060      	st.w      	r3, (r0, 0x0)
	}
	else if(SIO0->MISR&0X020)				//TIMEOUT
	{
		SIO0->ICR=0X20;
	}
}
    6716:	1463      	ipop
    6718:	1461      	nir
	else if(SIO0->MISR&0X08)					//RXBUFFULL	
    671a:	9349      	ld.w      	r2, (r3, 0x24)
    671c:	3108      	movi      	r1, 8
    671e:	6884      	and      	r2, r1
    6720:	3a40      	cmpnei      	r2, 0
    6722:	0c10      	bf      	0x6742	// 6742 <SIO0IntHandler+0x5e>
		SIO0->ICR=0X08;
    6724:	b32b      	st.w      	r1, (r3, 0x2c)
		if(R_SIORX_count<1)
    6726:	102f      	lrw      	r1, 0x20000338	// 6760 <SIO0IntHandler+0x7c>
    6728:	9140      	ld.w      	r2, (r1, 0x0)
    672a:	3a20      	cmplti      	r2, 1
    672c:	0ff5      	bf      	0x6716	// 6716 <SIO0IntHandler+0x32>
			R_SIORX_buf[R_SIORX_count]=SIO0->RXBUF;				//32bit
    672e:	9140      	ld.w      	r2, (r1, 0x0)
    6730:	9307      	ld.w      	r0, (r3, 0x1c)
    6732:	4262      	lsli      	r3, r2, 2
    6734:	104c      	lrw      	r2, 0x2000033c	// 6764 <SIO0IntHandler+0x80>
    6736:	60c8      	addu      	r3, r2
    6738:	b300      	st.w      	r0, (r3, 0x0)
			R_SIORX_count++;
    673a:	9160      	ld.w      	r3, (r1, 0x0)
    673c:	2300      	addi      	r3, 1
    673e:	b160      	st.w      	r3, (r1, 0x0)
    6740:	07eb      	br      	0x6716	// 6716 <SIO0IntHandler+0x32>
	else if(SIO0->MISR&0X010)				//BREAK
    6742:	9349      	ld.w      	r2, (r3, 0x24)
    6744:	3110      	movi      	r1, 16
    6746:	6884      	and      	r2, r1
    6748:	3a40      	cmpnei      	r2, 0
    674a:	0c03      	bf      	0x6750	// 6750 <SIO0IntHandler+0x6c>
		SIO0->ICR=0X20;
    674c:	b32b      	st.w      	r1, (r3, 0x2c)
}
    674e:	07e4      	br      	0x6716	// 6716 <SIO0IntHandler+0x32>
	else if(SIO0->MISR&0X020)				//TIMEOUT
    6750:	9349      	ld.w      	r2, (r3, 0x24)
    6752:	3120      	movi      	r1, 32
    6754:	6884      	and      	r2, r1
    6756:	3a40      	cmpnei      	r2, 0
    6758:	0bfa      	bt      	0x674c	// 674c <SIO0IntHandler+0x68>
    675a:	07de      	br      	0x6716	// 6716 <SIO0IntHandler+0x32>
    675c:	20000030 	.long	0x20000030
    6760:	20000338 	.long	0x20000338
    6764:	2000033c 	.long	0x2000033c

Disassembly of section .text.EXI9to13IntHandler:

00006768 <EXI9to13IntHandler>:
//EXI4 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI9to13IntHandler(void) 
{
    6768:	1460      	nie
    676a:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN9)==EXI_PIN9) 
    676c:	1073      	lrw      	r3, 0x2000005c	// 67b8 <EXI9to13IntHandler+0x50>
    676e:	3280      	movi      	r2, 128
    6770:	9360      	ld.w      	r3, (r3, 0x0)
    6772:	237f      	addi      	r3, 128
    6774:	932c      	ld.w      	r1, (r3, 0x30)
    6776:	4242      	lsli      	r2, r2, 2
    6778:	6848      	and      	r1, r2
    677a:	3940      	cmpnei      	r1, 0
    677c:	0c03      	bf      	0x6782	// 6782 <EXI9to13IntHandler+0x1a>
	{
		SYSCON->EXICR = EXI_PIN12;
	} 
	else if ((SYSCON->EXIRS&EXI_PIN13)==EXI_PIN13) 
	{
		SYSCON->EXICR = EXI_PIN13;
    677e:	b34b      	st.w      	r2, (r3, 0x2c)
	}
}
    6780:	0419      	br      	0x67b2	// 67b2 <EXI9to13IntHandler+0x4a>
	else if ((SYSCON->EXIRS&EXI_PIN10)==EXI_PIN10) 
    6782:	3280      	movi      	r2, 128
    6784:	932c      	ld.w      	r1, (r3, 0x30)
    6786:	4243      	lsli      	r2, r2, 3
    6788:	6848      	and      	r1, r2
    678a:	3940      	cmpnei      	r1, 0
    678c:	0bf9      	bt      	0x677e	// 677e <EXI9to13IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN11)==EXI_PIN11) 
    678e:	3280      	movi      	r2, 128
    6790:	932c      	ld.w      	r1, (r3, 0x30)
    6792:	4244      	lsli      	r2, r2, 4
    6794:	6848      	and      	r1, r2
    6796:	3940      	cmpnei      	r1, 0
    6798:	0bf3      	bt      	0x677e	// 677e <EXI9to13IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN12)==EXI_PIN12) 
    679a:	3280      	movi      	r2, 128
    679c:	932c      	ld.w      	r1, (r3, 0x30)
    679e:	4245      	lsli      	r2, r2, 5
    67a0:	6848      	and      	r1, r2
    67a2:	3940      	cmpnei      	r1, 0
    67a4:	0bed      	bt      	0x677e	// 677e <EXI9to13IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN13)==EXI_PIN13) 
    67a6:	3280      	movi      	r2, 128
    67a8:	932c      	ld.w      	r1, (r3, 0x30)
    67aa:	4246      	lsli      	r2, r2, 6
    67ac:	6848      	and      	r1, r2
    67ae:	3940      	cmpnei      	r1, 0
    67b0:	0be7      	bt      	0x677e	// 677e <EXI9to13IntHandler+0x16>
}
    67b2:	1463      	ipop
    67b4:	1461      	nir
    67b6:	0000      	bkpt
    67b8:	2000005c 	.long	0x2000005c

Disassembly of section .text.PriviledgeVioHandler:

000067bc <PriviledgeVioHandler>:
    67bc:	783c      	jmp      	r15

Disassembly of section .text.PendTrapHandler:

000067be <PendTrapHandler>:
    // ISR content ...

}

void PendTrapHandler(void) 
{
    67be:	1460      	nie
    67c0:	1462      	ipush
    // ISR content ...

}
    67c2:	1463      	ipop
    67c4:	1461      	nir

Disassembly of section .text.Trap3Handler:

000067c6 <Trap3Handler>:
    67c6:	1460      	nie
    67c8:	1462      	ipush
    67ca:	1463      	ipop
    67cc:	1461      	nir

Disassembly of section .text.Trap2Handler:

000067ce <Trap2Handler>:
    67ce:	1460      	nie
    67d0:	1462      	ipush
    67d2:	1463      	ipop
    67d4:	1461      	nir

Disassembly of section .text.Trap1Handler:

000067d6 <Trap1Handler>:
    67d6:	1460      	nie
    67d8:	1462      	ipush
    67da:	1463      	ipop
    67dc:	1461      	nir

Disassembly of section .text.Trap0Handler:

000067de <Trap0Handler>:
    67de:	1460      	nie
    67e0:	1462      	ipush
    67e2:	1463      	ipop
    67e4:	1461      	nir

Disassembly of section .text.UnrecExecpHandler:

000067e6 <UnrecExecpHandler>:
    67e6:	1460      	nie
    67e8:	1462      	ipush
    67ea:	1463      	ipop
    67ec:	1461      	nir

Disassembly of section .text.BreakPointHandler:

000067ee <BreakPointHandler>:
    67ee:	1460      	nie
    67f0:	1462      	ipush
    67f2:	1463      	ipop
    67f4:	1461      	nir

Disassembly of section .text.AccessErrHandler:

000067f6 <AccessErrHandler>:
    67f6:	1460      	nie
    67f8:	1462      	ipush
    67fa:	1463      	ipop
    67fc:	1461      	nir

Disassembly of section .text.IllegalInstrHandler:

000067fe <IllegalInstrHandler>:
    67fe:	1460      	nie
    6800:	1462      	ipush
    6802:	1463      	ipop
    6804:	1461      	nir

Disassembly of section .text.MisalignedHandler:

00006806 <MisalignedHandler>:
    6806:	1460      	nie
    6808:	1462      	ipush
    680a:	1463      	ipop
    680c:	1461      	nir

Disassembly of section .text.TKEYIntHandler:

0000680e <TKEYIntHandler>:
    680e:	1460      	nie
    6810:	1462      	ipush
    6812:	1463      	ipop
    6814:	1461      	nir

Disassembly of section .text.CNTAIntHandler:

00006816 <CNTAIntHandler>:
    6816:	1460      	nie
    6818:	1462      	ipush
    681a:	1463      	ipop
    681c:	1461      	nir

Disassembly of section .text.ADCIntHandler:

0000681e <ADCIntHandler>:
    681e:	1460      	nie
    6820:	1462      	ipush
    6822:	1463      	ipop
    6824:	1461      	nir

Disassembly of section .text.startup.main:

00006828 <main>:
#include "app_communicate.h"

extern void APT32F102_init(void);	

int main(void)
{	
    6828:	14d4      	push      	r4-r7, r15
    682a:	1427      	subi      	r14, r14, 28
	APT32F102_init();
    682c:	e3fffc10 	bsr      	0x604c	// 604c <APT32F102_init>
	printf("\r\n\r\nTWSBT013-charging case: V0.0.6\r\n");
    6830:	1211      	lrw      	r0, 0x9078	// 6974 <main+0x14c>
    6832:	e3ffe871 	bsr      	0x3914	// 3914 <__GI_puts>
	Coret_DelayMs(20); /* 延时使系统稳定 */
    6836:	3100      	movi      	r1, 0
    6838:	3014      	movi      	r0, 20
    683a:	e0001151 	bsr      	0x8adc	// 8adc <Coret_DelayMs>
	
	ReduceSYSCLKto5556KHZ();
    683e:	e0000421 	bsr      	0x7080	// 7080 <ReduceSYSCLKto5556KHZ>
	/* 待机电流Debug
	Coret_DelayMs(8000);
	system_goto_deepsleep_mode(0);
	*/
	
	battery_power_update(battery_level_calculate(battery_adc_to_mv(adc_get_val(BATTERY_ADC))));
    6842:	3000      	movi      	r0, 0
    6844:	e0000900 	bsr      	0x7a44	// 7a44 <adc_get_val>
    6848:	e3ffe5f6 	bsr      	0x3434	// 3434 <__floatunsidf>
    684c:	3200      	movi      	r2, 0
    684e:	126b      	lrw      	r3, 0x3fe75400	// 6978 <main+0x150>
    6850:	e3ffe3d8 	bsr      	0x3000	// 3000 <__muldf3>
    6854:	3200      	movi      	r2, 0
    6856:	126a      	lrw      	r3, 0x40438000	// 697c <main+0x154>
    6858:	e3ffe4ee 	bsr      	0x3234	// 3234 <__divdf3>
    685c:	3200      	movi      	r2, 0
    685e:	1269      	lrw      	r3, 0x405e4000	// 6980 <main+0x158>
    6860:	e3ffe3d0 	bsr      	0x3000	// 3000 <__muldf3>
    6864:	e3ffdce0 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    6868:	e00007aa 	bsr      	0x77bc	// 77bc <battery_level_calculate>
    686c:	7400      	zextb      	r0, r0
    686e:	e0000797 	bsr      	0x779c	// 779c <battery_power_update>
	app_start_100_millisecond_timer(APP_BATTERY_TIMER_ID);
    6872:	3001      	movi      	r0, 1
    6874:	e00006de 	bsr      	0x7630	// 7630 <app_start_100_millisecond_timer>
	app_start_100_millisecond_timer(APP_OVERCURRENT_TIMER_ID);//常开过流保护检测定时器
    6878:	3003      	movi      	r0, 3
    687a:	e00006db 	bsr      	0x7630	// 7630 <app_start_100_millisecond_timer>
	
	while(1)
	{
		/* time_1ms_handle */
		if(TimerFlag & TIMER_1MS_FLAG)
    687e:	1282      	lrw      	r4, 0x20000364	// 6984 <main+0x15c>
    6880:	8460      	ld.b      	r3, (r4, 0x0)
    6882:	3202      	movi      	r2, 2
    6884:	68c8      	and      	r3, r2
    6886:	3b40      	cmpnei      	r3, 0
    6888:	0c07      	bf      	0x6896	// 6896 <main+0x6e>
		{
			TimerFlag &= ~TIMER_1MS_FLAG;
    688a:	8460      	ld.b      	r3, (r4, 0x0)
    688c:	32fd      	movi      	r2, 253
    688e:	68c8      	and      	r3, r2
    6890:	a460      	st.b      	r3, (r4, 0x0)
			app_key_event_handle();
    6892:	e000062f 	bsr      	0x74f0	// 74f0 <app_key_event_handle>
		}
		
		/* time_10ms_handle */
		if(TimerFlag & TIMER_10MS_FLAG)
    6896:	8460      	ld.b      	r3, (r4, 0x0)
    6898:	3204      	movi      	r2, 4
    689a:	68c8      	and      	r3, r2
    689c:	3b40      	cmpnei      	r3, 0
    689e:	0c0b      	bf      	0x68b4	// 68b4 <main+0x8c>
		{
			TimerFlag &= ~TIMER_10MS_FLAG;
    68a0:	32fb      	movi      	r2, 251
    68a2:	8460      	ld.b      	r3, (r4, 0x0)
    68a4:	68c8      	and      	r3, r2
    68a6:	a460      	st.b      	r3, (r4, 0x0)
			handle_uart2_recv_data();
    68a8:	e00004e0 	bsr      	0x7268	// 7268 <handle_uart2_recv_data>
			app_battery_handle_process();
    68ac:	e0000e20 	bsr      	0x84ec	// 84ec <app_battery_handle_process>
			box_open_close_handle_progress();
    68b0:	e0000b8c 	bsr      	0x7fc8	// 7fc8 <box_open_close_handle_progress>
		}
		
		/* time_100ms_handle */
		if(TimerFlag & TIMER_100MS_FLAG)
    68b4:	8460      	ld.b      	r3, (r4, 0x0)
    68b6:	3210      	movi      	r2, 16
    68b8:	68c8      	and      	r3, r2
    68ba:	3b40      	cmpnei      	r3, 0
    68bc:	0c0b      	bf      	0x68d2	// 68d2 <main+0xaa>
		{
			TimerFlag &= ~TIMER_100MS_FLAG;	
    68be:	32ef      	movi      	r2, 239
    68c0:	8460      	ld.b      	r3, (r4, 0x0)
    68c2:	68c8      	and      	r3, r2
    68c4:	a460      	st.b      	r3, (r4, 0x0)
			communicate_process_handle();
    68c6:	e0000557 	bsr      	0x7374	// 7374 <communicate_process_handle>
			app_status_handle_process();
    68ca:	e0000f57 	bsr      	0x8778	// 8778 <app_status_handle_process>
			app_100_millisecond_timer_check();
    68ce:	e00006c9 	bsr      	0x7660	// 7660 <app_100_millisecond_timer_check>
		}
		
		/* time_1s_handle */
		if(TimerFlag & TIMER_1S_FLAG)
    68d2:	8460      	ld.b      	r3, (r4, 0x0)
    68d4:	3220      	movi      	r2, 32
    68d6:	68c8      	and      	r3, r2
    68d8:	3b40      	cmpnei      	r3, 0
    68da:	0fd3      	bf      	0x6880	// 6880 <main+0x58>
		{
			TimerFlag &= ~TIMER_1S_FLAG;
    68dc:	32df      	movi      	r2, 223
    68de:	8460      	ld.b      	r3, (r4, 0x0)
    68e0:	68c8      	and      	r3, r2
			
			U32_T L_pogo, R_pogo;
			L_pogo = adc_get_val(L_EARBUD_POGO_ADC);
    68e2:	3002      	movi      	r0, 2
			TimerFlag &= ~TIMER_1S_FLAG;
    68e4:	a460      	st.b      	r3, (r4, 0x0)
			L_pogo = adc_get_val(L_EARBUD_POGO_ADC);
    68e6:	e00008af 	bsr      	0x7a44	// 7a44 <adc_get_val>
    68ea:	b803      	st.w      	r0, (r14, 0xc)
			R_pogo = adc_get_val(R_EARBUD_POGO_ADC);
    68ec:	3001      	movi      	r0, 1
    68ee:	e00008ab 	bsr      	0x7a44	// 7a44 <adc_get_val>
    68f2:	b804      	st.w      	r0, (r14, 0x10)
			printf("L: %lu, %lumV, %lumA R: %lu, %lumV, %lumA\r\n",\
			L_pogo,adc_to_mv(L_pogo), pogo_adc_to_mA(L_pogo),R_pogo,adc_to_mv(R_pogo), pogo_adc_to_mA(R_pogo));
    68f4:	9803      	ld.w      	r0, (r14, 0xc)
    68f6:	e3ffe59f 	bsr      	0x3434	// 3434 <__floatunsidf>
    68fa:	6dc3      	mov      	r7, r0
    68fc:	9804      	ld.w      	r0, (r14, 0x10)
    68fe:	6d87      	mov      	r6, r1
    6900:	e3ffe59a 	bsr      	0x3434	// 3434 <__floatunsidf>
    6904:	6d43      	mov      	r5, r0
    6906:	b825      	st.w      	r1, (r14, 0x14)
    6908:	6c1f      	mov      	r0, r7
    690a:	3200      	movi      	r2, 0
    690c:	107f      	lrw      	r3, 0x3fe76a00	// 6988 <main+0x160>
    690e:	6c5b      	mov      	r1, r6
    6910:	e3ffe378 	bsr      	0x3000	// 3000 <__muldf3>
    6914:	3200      	movi      	r2, 0
    6916:	107e      	lrw      	r3, 0x3fe00000	// 698c <main+0x164>
    6918:	e3ffe374 	bsr      	0x3000	// 3000 <__muldf3>
			printf("L: %lu, %lumV, %lumA R: %lu, %lumV, %lumA\r\n",\
    691c:	e3ffdc84 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    6920:	b806      	st.w      	r0, (r14, 0x18)
			L_pogo,adc_to_mv(L_pogo), pogo_adc_to_mA(L_pogo),R_pogo,adc_to_mv(R_pogo), pogo_adc_to_mA(R_pogo));
    6922:	3200      	movi      	r2, 0
    6924:	1075      	lrw      	r3, 0x3fe75400	// 6978 <main+0x150>
    6926:	6c1f      	mov      	r0, r7
    6928:	6c5b      	mov      	r1, r6
    692a:	e3ffe36b 	bsr      	0x3000	// 3000 <__muldf3>
			printf("L: %lu, %lumV, %lumA R: %lu, %lumV, %lumA\r\n",\
    692e:	e3ffdc7b 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    6932:	6d83      	mov      	r6, r0
			L_pogo,adc_to_mv(L_pogo), pogo_adc_to_mA(L_pogo),R_pogo,adc_to_mv(R_pogo), pogo_adc_to_mA(R_pogo));
    6934:	3200      	movi      	r2, 0
    6936:	1075      	lrw      	r3, 0x3fe76a00	// 6988 <main+0x160>
    6938:	6c17      	mov      	r0, r5
    693a:	9825      	ld.w      	r1, (r14, 0x14)
    693c:	e3ffe362 	bsr      	0x3000	// 3000 <__muldf3>
    6940:	3200      	movi      	r2, 0
    6942:	1073      	lrw      	r3, 0x3fe00000	// 698c <main+0x164>
    6944:	e3ffe35e 	bsr      	0x3000	// 3000 <__muldf3>
			printf("L: %lu, %lumV, %lumA R: %lu, %lumV, %lumA\r\n",\
    6948:	e3ffdc6e 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    694c:	b802      	st.w      	r0, (r14, 0x8)
			L_pogo,adc_to_mv(L_pogo), pogo_adc_to_mA(L_pogo),R_pogo,adc_to_mv(R_pogo), pogo_adc_to_mA(R_pogo));
    694e:	3200      	movi      	r2, 0
    6950:	106a      	lrw      	r3, 0x3fe75400	// 6978 <main+0x150>
    6952:	6c17      	mov      	r0, r5
    6954:	9825      	ld.w      	r1, (r14, 0x14)
    6956:	e3ffe355 	bsr      	0x3000	// 3000 <__muldf3>
			printf("L: %lu, %lumV, %lumA R: %lu, %lumV, %lumA\r\n",\
    695a:	e3ffdc65 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    695e:	9864      	ld.w      	r3, (r14, 0x10)
    6960:	b801      	st.w      	r0, (r14, 0x4)
    6962:	b860      	st.w      	r3, (r14, 0x0)
    6964:	6c9b      	mov      	r2, r6
    6966:	9866      	ld.w      	r3, (r14, 0x18)
    6968:	9823      	ld.w      	r1, (r14, 0xc)
    696a:	100a      	lrw      	r0, 0x909c	// 6990 <main+0x168>
    696c:	e3ffe7c2 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
    6970:	0788      	br      	0x6880	// 6880 <main+0x58>
    6972:	0000      	bkpt
    6974:	00009078 	.long	0x00009078
    6978:	3fe75400 	.long	0x3fe75400
    697c:	40438000 	.long	0x40438000
    6980:	405e4000 	.long	0x405e4000
    6984:	20000364 	.long	0x20000364
    6988:	3fe76a00 	.long	0x3fe76a00
    698c:	3fe00000 	.long	0x3fe00000
    6990:	0000909c 	.long	0x0000909c

Disassembly of section .text.delayus_Bycode:

00006994 <delayus_Bycode>:
volatile int indx =0;
const char jmpIAPstr[11] = {"JumptoISP\n"};
const char rststr[8] = {"RSTACK\n"};

void delayus_Bycode(unsigned int t)
{
    6994:	1421      	subi      	r14, r14, 4
	volatile unsigned int i =  t>1?t-2:0;
    6996:	3801      	cmphsi      	r0, 2
    6998:	0c0a      	bf      	0x69ac	// 69ac <delayus_Bycode+0x18>
    699a:	2801      	subi      	r0, 2
    699c:	b800      	st.w      	r0, (r14, 0x0)
	while(i--){
    699e:	9860      	ld.w      	r3, (r14, 0x0)
    69a0:	5b43      	subi      	r2, r3, 1
    69a2:	3b40      	cmpnei      	r3, 0
    69a4:	b840      	st.w      	r2, (r14, 0x0)
    69a6:	0805      	bt      	0x69b0	// 69b0 <delayus_Bycode+0x1c>
		asm("nop");
		asm("nop");
		asm("nop");
		asm("nop");
	}
}
    69a8:	1401      	addi      	r14, r14, 4
    69aa:	783c      	jmp      	r15
	volatile unsigned int i =  t>1?t-2:0;
    69ac:	3000      	movi      	r0, 0
    69ae:	07f7      	br      	0x699c	// 699c <delayus_Bycode+0x8>
		asm("nop");
    69b0:	6c03      	mov      	r0, r0
		asm("nop");
    69b2:	6c03      	mov      	r0, r0
		asm("nop");
    69b4:	6c03      	mov      	r0, r0
		asm("nop");
    69b6:	6c03      	mov      	r0, r0
		asm("nop");
    69b8:	6c03      	mov      	r0, r0
		asm("nop");
    69ba:	6c03      	mov      	r0, r0
    69bc:	07f1      	br      	0x699e	// 699e <delayus_Bycode+0xa>

Disassembly of section .text.delayms_Bycode:

000069be <delayms_Bycode>:

void delayms_Bycode(unsigned int t)
{
    69be:	14d0      	push      	r15
    69c0:	1421      	subi      	r14, r14, 4
	volatile unsigned int i = t;
    69c2:	b800      	st.w      	r0, (r14, 0x0)
	while(i--){
    69c4:	9860      	ld.w      	r3, (r14, 0x0)
    69c6:	5b43      	subi      	r2, r3, 1
    69c8:	3b40      	cmpnei      	r3, 0
    69ca:	b840      	st.w      	r2, (r14, 0x0)
    69cc:	0803      	bt      	0x69d2	// 69d2 <delayms_Bycode+0x14>
		delayus_Bycode(103);
	}
}
    69ce:	1401      	addi      	r14, r14, 4
    69d0:	1490      	pop      	r15
		delayus_Bycode(103);
    69d2:	3067      	movi      	r0, 103
    69d4:	e3ffffe0 	bsr      	0x6994	// 6994 <delayus_Bycode>
    69d8:	07f6      	br      	0x69c4	// 69c4 <delayms_Bycode+0x6>

Disassembly of section .text.JumpToIAP:

000069dc <JumpToIAP>:

void JumpToIAP(void)
{
	SYSCON -> RSR = 0xFFFFFFFF;
    69dc:	1065      	lrw      	r3, 0x2000005c	// 69f0 <JumpToIAP+0x14>
    69de:	3180      	movi      	r1, 128
    69e0:	9340      	ld.w      	r2, (r3, 0x0)
    69e2:	3300      	movi      	r3, 0
    69e4:	6048      	addu      	r1, r2
    69e6:	2b00      	subi      	r3, 1
    69e8:	b164      	st.w      	r3, (r1, 0x10)
	SYSCON -> IDCCR = 0xE11E0081; //系统软复位
    69ea:	1063      	lrw      	r3, 0xe11e0081	// 69f4 <JumpToIAP+0x18>
    69ec:	b260      	st.w      	r3, (r2, 0x0)
	//SYSCON_Software_Reset();
}
    69ee:	783c      	jmp      	r15
    69f0:	2000005c 	.long	0x2000005c
    69f4:	e11e0081 	.long	0xe11e0081

Disassembly of section .text.prog_uart_send:

000069f8 <prog_uart_send>:

char inline Prog_get_char(void){
	return UART1 -> DATA;
}

void prog_uart_send(const char * cc,int len){
    69f8:	14d4      	push      	r4-r7, r15
    69fa:	6d43      	mov      	r5, r0
    69fc:	6d87      	mov      	r6, r1
	int i;
	for(i=0;i<len;i++){
    69fe:	6d03      	mov      	r4, r0
		UARTTxByte(UART1,cc[i]);
    6a00:	10e6      	lrw      	r7, 0x20000040	// 6a18 <prog_uart_send+0x20>
	for(i=0;i<len;i++){
    6a02:	5c75      	subu      	r3, r4, r5
    6a04:	658d      	cmplt      	r3, r6
    6a06:	0802      	bt      	0x6a0a	// 6a0a <prog_uart_send+0x12>
	}
}
    6a08:	1494      	pop      	r4-r7, r15
		UARTTxByte(UART1,cc[i]);
    6a0a:	8420      	ld.b      	r1, (r4, 0x0)
    6a0c:	9700      	ld.w      	r0, (r7, 0x0)
    6a0e:	e3fff49c 	bsr      	0x5346	// 5346 <UARTTxByte>
    6a12:	2400      	addi      	r4, 1
    6a14:	07f7      	br      	0x6a02	// 6a02 <prog_uart_send+0xa>
    6a16:	0000      	bkpt
    6a18:	20000040 	.long	0x20000040

Disassembly of section .text.SendRstACK:

00006a1c <SendRstACK>:

void SendRstACK(void){
    6a1c:	14d1      	push      	r4, r15
	delayms_Bycode(1);
	prog_uart_send(rststr,7);
    6a1e:	108e      	lrw      	r4, 0x8b84	// 6a54 <SendRstACK+0x38>
	delayms_Bycode(1);
    6a20:	3001      	movi      	r0, 1
    6a22:	e3ffffce 	bsr      	0x69be	// 69be <delayms_Bycode>
	prog_uart_send(rststr,7);
    6a26:	3107      	movi      	r1, 7
    6a28:	6c13      	mov      	r0, r4
    6a2a:	e3ffffe7 	bsr      	0x69f8	// 69f8 <prog_uart_send>
	delayms_Bycode(1);
    6a2e:	3001      	movi      	r0, 1
    6a30:	e3ffffc7 	bsr      	0x69be	// 69be <delayms_Bycode>
	prog_uart_send(rststr,7);
    6a34:	3107      	movi      	r1, 7
    6a36:	6c13      	mov      	r0, r4
    6a38:	e3ffffe0 	bsr      	0x69f8	// 69f8 <prog_uart_send>
	delayms_Bycode(1);
    6a3c:	3001      	movi      	r0, 1
    6a3e:	e3ffffc0 	bsr      	0x69be	// 69be <delayms_Bycode>
	prog_uart_send(rststr,7);
    6a42:	3107      	movi      	r1, 7
    6a44:	6c13      	mov      	r0, r4
    6a46:	e3ffffd9 	bsr      	0x69f8	// 69f8 <prog_uart_send>
	delayms_Bycode(1);
    6a4a:	3001      	movi      	r0, 1
    6a4c:	e3ffffb9 	bsr      	0x69be	// 69be <delayms_Bycode>
}
    6a50:	1491      	pop      	r4, r15
    6a52:	0000      	bkpt
    6a54:	00008b84 	.long	0x00008b84

Disassembly of section .text.wait_syncpin_release:

00006a58 <wait_syncpin_release>:

void wait_syncpin_release(U8_T logic, U32_T timeout){
    6a58:	14d4      	push      	r4-r7, r15
    6a5a:	1421      	subi      	r14, r14, 4
	int deglitchcnt;
	U32_T timecnt=0;
	volatile U8_T level =0;
	if(logic) level =1;
    6a5c:	3840      	cmpnei      	r0, 0
	volatile U8_T level =0;
    6a5e:	3300      	movi      	r3, 0
void wait_syncpin_release(U8_T logic, U32_T timeout){
    6a60:	6dc7      	mov      	r7, r1
	volatile U8_T level =0;
    6a62:	dc6e0003 	st.b      	r3, (r14, 0x3)
	if(logic) level =1;
    6a66:	0c04      	bf      	0x6a6e	// 6a6e <wait_syncpin_release+0x16>
    6a68:	3301      	movi      	r3, 1
    6a6a:	dc6e0003 	st.b      	r3, (r14, 0x3)
	SYNC_PIN_AS_INPUT;
    6a6e:	10d0      	lrw      	r6, 0x20000050	// 6aac <wait_syncpin_release+0x54>
    6a70:	3201      	movi      	r2, 1
    6a72:	310d      	movi      	r1, 13
    6a74:	9600      	ld.w      	r0, (r6, 0x0)
    6a76:	e3fff105 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	U32_T timecnt=0;
    6a7a:	3500      	movi      	r5, 0
	deglitchcnt =0;
    6a7c:	3400      	movi      	r4, 0
	while(1){				
		delayms_Bycode(10);
    6a7e:	300a      	movi      	r0, 10
    6a80:	e3ffff9f 	bsr      	0x69be	// 69be <delayms_Bycode>
		if( MCURST_SYNC_IN == level) {
    6a84:	310d      	movi      	r1, 13
    6a86:	9600      	ld.w      	r0, (r6, 0x0)
    6a88:	e3fff2f7 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    6a8c:	d86e0003 	ld.b      	r3, (r14, 0x3)
    6a90:	64c2      	cmpne      	r0, r3
    6a92:	0806      	bt      	0x6a9e	// 6a9e <wait_syncpin_release+0x46>
			deglitchcnt++;
    6a94:	2400      	addi      	r4, 1
		}
		else {
			deglitchcnt=0;
		}
		if(deglitchcnt >= 10) break;
    6a96:	3c29      	cmplti      	r4, 10
    6a98:	0804      	bt      	0x6aa0	// 6aa0 <wait_syncpin_release+0x48>
		timecnt++;
		if(timeout > 0) {
			if(timecnt >= timeout) break;
		}
	}
}
    6a9a:	1401      	addi      	r14, r14, 4
    6a9c:	1494      	pop      	r4-r7, r15
			deglitchcnt=0;
    6a9e:	3400      	movi      	r4, 0
		if(timeout > 0) {
    6aa0:	3f40      	cmpnei      	r7, 0
		timecnt++;
    6aa2:	2500      	addi      	r5, 1
		if(timeout > 0) {
    6aa4:	0fed      	bf      	0x6a7e	// 6a7e <wait_syncpin_release+0x26>
			if(timecnt >= timeout) break;
    6aa6:	65d4      	cmphs      	r5, r7
    6aa8:	0feb      	bf      	0x6a7e	// 6a7e <wait_syncpin_release+0x26>
    6aaa:	07f8      	br      	0x6a9a	// 6a9a <wait_syncpin_release+0x42>
    6aac:	20000050 	.long	0x20000050

Disassembly of section .text.program_trig_check:

00006ab0 <program_trig_check>:

void program_trig_check(void){
    6ab0:	14d0      	push      	r15
	U8_T rstflag =0;

	if(strstr((const char *)progDatabuf,rstpattern)) rstflag =1;
    6ab2:	102d      	lrw      	r1, 0x8b8c	// 6ae4 <program_trig_check+0x34>
    6ab4:	100d      	lrw      	r0, 0x20000244	// 6ae8 <program_trig_check+0x38>
    6ab6:	e3ffe7f7 	bsr      	0x3aa4	// 3aa4 <__GI_strstr>
    6aba:	3840      	cmpnei      	r0, 0
    6abc:	0c13      	bf      	0x6ae2	// 6ae2 <program_trig_check+0x32>
	if(rstflag){
		rstflag =0;
		prog_uart_send(jmpIAPstr,10);
    6abe:	310a      	movi      	r1, 10
    6ac0:	100b      	lrw      	r0, 0x8b95	// 6aec <program_trig_check+0x3c>
    6ac2:	e3ffff9b 	bsr      	0x69f8	// 69f8 <prog_uart_send>
		SendRstACK();
    6ac6:	e3ffffab 	bsr      	0x6a1c	// 6a1c <SendRstACK>
		delayms_Bycode(10);
    6aca:	300a      	movi      	r0, 10
    6acc:	e3ffff79 	bsr      	0x69be	// 69be <delayms_Bycode>
		CK_CPU_DisAllNormalIrq();//关闭所有中断
    6ad0:	e000005b 	bsr      	0x6b86	// 6b86 <CK_CPU_DisAllNormalIrq>
		wait_syncpin_release(0, 600);
    6ad4:	3196      	movi      	r1, 150
    6ad6:	4122      	lsli      	r1, r1, 2
    6ad8:	3000      	movi      	r0, 0
    6ada:	e3ffffbf 	bsr      	0x6a58	// 6a58 <wait_syncpin_release>
		JumpToIAP();
    6ade:	e3ffff7f 	bsr      	0x69dc	// 69dc <JumpToIAP>
	}
    6ae2:	1490      	pop      	r15
    6ae4:	00008b8c 	.long	0x00008b8c
    6ae8:	20000244 	.long	0x20000244
    6aec:	00008b95 	.long	0x00008b95

Disassembly of section .text.__divsi3:

00006af0 <__divsi3>:
CSP_BT_T    	*BT1      = (CSP_BT_T   *)APB_BT1Base ;
CSP_CRC_T   	*CRC      = (CSP_CRC_T  *)AHB_CRCBase ;
CSP_HWD_T   	*HWD      = (CSP_HWD_T  *)APB_HWDBase ;

int __divsi3 (  int a,   int b)
{   
    6af0:	14c1      	push      	r4
	int PSR;
	__asm volatile(
    6af2:	c0006023 	mfcr      	r3, cr<0, 0>
    6af6:	c0807020 	psrclr      	ie
					"mfcr %0 , psr \n\r"
					"psrclr ie \n\r"
					: "=r"(PSR)
				   );

	HWD->CR = 0;
    6afa:	1046      	lrw      	r2, 0x20000004	// 6b10 <__divsi3+0x20>
    6afc:	3400      	movi      	r4, 0
    6afe:	9240      	ld.w      	r2, (r2, 0x0)
    6b00:	b284      	st.w      	r4, (r2, 0x10)
	HWD->DIVIDENT = a;
	HWD->DIVISOR = b;

	PSR |= 0x80000000;
    6b02:	3bbf      	bseti      	r3, 31
	HWD->DIVIDENT = a;
    6b04:	b200      	st.w      	r0, (r2, 0x0)
	HWD->DIVISOR = b;
    6b06:	b221      	st.w      	r1, (r2, 0x4)
	__asm volatile(
    6b08:	c0036420 	mtcr      	r3, cr<0, 0>
					 "mtcr %0 , psr \n\r"
					 : 
					 :"r"(PSR)
					);
					
	return HWD->QUOTIENT;
    6b0c:	9202      	ld.w      	r0, (r2, 0x8)
}
    6b0e:	1481      	pop      	r4
    6b10:	20000004 	.long	0x20000004

Disassembly of section .text.__udivsi3:

00006b14 <__udivsi3>:
 unsigned int __udivsi3 ( unsigned int a,  unsigned int b)
{   
    6b14:	14c1      	push      	r4
	int PSR;
	__asm volatile(
    6b16:	c0006023 	mfcr      	r3, cr<0, 0>
    6b1a:	c0807020 	psrclr      	ie
					"mfcr %0 , psr \n\r"
					"psrclr ie \n\r"
					: "=r"(PSR)
				   );
	
	HWD->CR = 1;
    6b1e:	1046      	lrw      	r2, 0x20000004	// 6b34 <__udivsi3+0x20>
    6b20:	3401      	movi      	r4, 1
    6b22:	9240      	ld.w      	r2, (r2, 0x0)
    6b24:	b284      	st.w      	r4, (r2, 0x10)
	HWD->DIVIDENT = a;
	HWD->DIVISOR = b;

	PSR |= 0x80000000;
    6b26:	3bbf      	bseti      	r3, 31
	HWD->DIVIDENT = a;
    6b28:	b200      	st.w      	r0, (r2, 0x0)
	HWD->DIVISOR = b;
    6b2a:	b221      	st.w      	r1, (r2, 0x4)
	__asm volatile(
    6b2c:	c0036420 	mtcr      	r3, cr<0, 0>
					 "mtcr %0 , psr \n\r"
					 : 
					 :"r"(PSR)
					);

	return HWD->QUOTIENT;
    6b30:	9202      	ld.w      	r0, (r2, 0x8)
}
    6b32:	1481      	pop      	r4
    6b34:	20000004 	.long	0x20000004

Disassembly of section .text.__modsi3:

00006b38 <__modsi3>:

int __modsi3 ( int a,  int b)
{   
    6b38:	14c1      	push      	r4
	int PSR;
	__asm volatile(
    6b3a:	c0006023 	mfcr      	r3, cr<0, 0>
    6b3e:	c0807020 	psrclr      	ie
					"mfcr %0 , psr \n\r"
					"psrclr ie \n\r"
					: "=r"(PSR)
				   );
	
	HWD->CR = 0;
    6b42:	1046      	lrw      	r2, 0x20000004	// 6b58 <__modsi3+0x20>
    6b44:	3400      	movi      	r4, 0
    6b46:	9240      	ld.w      	r2, (r2, 0x0)
    6b48:	b284      	st.w      	r4, (r2, 0x10)
	HWD->DIVIDENT = a;
	HWD->DIVISOR = b;

	PSR |= 0x80000000;
    6b4a:	3bbf      	bseti      	r3, 31
	HWD->DIVIDENT = a;
    6b4c:	b200      	st.w      	r0, (r2, 0x0)
	HWD->DIVISOR = b;
    6b4e:	b221      	st.w      	r1, (r2, 0x4)
	__asm volatile(
    6b50:	c0036420 	mtcr      	r3, cr<0, 0>
					 "mtcr %0 , psr \n\r"
					 : 
					 :"r"(PSR)
					);	
	return HWD->REMAIN;
    6b54:	9203      	ld.w      	r0, (r2, 0xc)
}
    6b56:	1481      	pop      	r4
    6b58:	20000004 	.long	0x20000004

Disassembly of section .text.__umodsi3:

00006b5c <__umodsi3>:

unsigned int __umodsi3 ( unsigned int a,  unsigned int b)
{   
    6b5c:	14c1      	push      	r4
	int PSR;
	__asm volatile(
    6b5e:	c0006023 	mfcr      	r3, cr<0, 0>
    6b62:	c0807020 	psrclr      	ie
					"mfcr %0 , psr \n\r"
					"psrclr ie \n\r"
					: "=r"(PSR)
				   );
	
	HWD->CR = 1;
    6b66:	1046      	lrw      	r2, 0x20000004	// 6b7c <__umodsi3+0x20>
    6b68:	3401      	movi      	r4, 1
    6b6a:	9240      	ld.w      	r2, (r2, 0x0)
    6b6c:	b284      	st.w      	r4, (r2, 0x10)
	HWD->DIVIDENT = a;
	HWD->DIVISOR = b;

	PSR |= 0x80000000;
    6b6e:	3bbf      	bseti      	r3, 31
	HWD->DIVIDENT = a;
    6b70:	b200      	st.w      	r0, (r2, 0x0)
	HWD->DIVISOR = b;
    6b72:	b221      	st.w      	r1, (r2, 0x4)
	__asm volatile(
    6b74:	c0036420 	mtcr      	r3, cr<0, 0>
					 "mtcr %0 , psr \n\r"
					 : 
					 :"r"(PSR)
					);	
	return HWD->REMAIN;
    6b78:	9203      	ld.w      	r0, (r2, 0xc)
}
    6b7a:	1481      	pop      	r4
    6b7c:	20000004 	.long	0x20000004

Disassembly of section .text.CK_CPU_EnAllNormalIrq:

00006b80 <CK_CPU_EnAllNormalIrq>:
}


void CK_CPU_EnAllNormalIrq(void)
{
  asm  ("psrset ee,ie");
    6b80:	c1807420 	psrset      	ee, ie
}
    6b84:	783c      	jmp      	r15

Disassembly of section .text.CK_CPU_DisAllNormalIrq:

00006b86 <CK_CPU_DisAllNormalIrq>:

void CK_CPU_DisAllNormalIrq(void)
{
 asm  ("psrclr ie");
    6b86:	c0807020 	psrclr      	ie
}
    6b8a:	783c      	jmp      	r15

Disassembly of section .text.LPT_Init:

00006b8c <LPT_Init>:
	CK_CPU_EnAllNormalIrq(); 
}

/* state machine时基初始化 */
void LPT_Init(void)
{
    6b8c:	14d1      	push      	r4, r15
    6b8e:	1422      	subi      	r14, r14, 8
	U32_T period = SYSCLK / 4 / 1000;
    6b90:	1070      	lrw      	r3, 0x20000000	// 6bd0 <LPT_Init+0x44>
    6b92:	9380      	ld.w      	r4, (r3, 0x0)
	
	LPT_DeInit();
    6b94:	e3fff27a 	bsr      	0x5088	// 5088 <LPT_DeInit>
	/* LPTCLK = PCLK / 4；Immediate模式；不分频；连续计数工作模式 */
	LPT_Configure(LPTCLK_EN, LPT_PCLK_DIV4, LPT_IMMEDIATE, LPT_PSC_DIV0, 0, LPT_OPM_CONTINUOUS);
    6b98:	3300      	movi      	r3, 0
    6b9a:	b861      	st.w      	r3, (r14, 0x4)
    6b9c:	b860      	st.w      	r3, (r14, 0x0)
    6b9e:	3240      	movi      	r2, 64
    6ba0:	3100      	movi      	r1, 0
    6ba2:	3001      	movi      	r0, 1
    6ba4:	e3fff290 	bsr      	0x50c4	// 50c4 <LPT_Configure>
	U32_T period = SYSCLK / 4 / 1000;
    6ba8:	31fa      	movi      	r1, 250
    6baa:	4124      	lsli      	r1, r1, 4
    6bac:	6c13      	mov      	r0, r4
    6bae:	e3ffffb3 	bsr      	0x6b14	// 6b14 <__udivsi3>
	LPT_Period_CMP_Write(period, 0); /* 每1ms进一次中断 */
    6bb2:	7401      	zexth      	r0, r0
    6bb4:	3100      	movi      	r1, 0
    6bb6:	e3fff29d 	bsr      	0x50f0	// 50f0 <LPT_Period_CMP_Write>
	LPT_ConfigInterrupt_CMD(ENABLE, LPT_PEND); /* 使能周期结束中断 */
    6bba:	3104      	movi      	r1, 4
    6bbc:	3001      	movi      	r0, 1
    6bbe:	e3fff2b1 	bsr      	0x5120	// 5120 <LPT_ConfigInterrupt_CMD>
	LPT_INT_ENABLE(); /* 使能NVIC响应中断 */
    6bc2:	e3fff2bd 	bsr      	0x513c	// 513c <LPT_INT_ENABLE>
	LPT_Start();
    6bc6:	e3fff29d 	bsr      	0x5100	// 5100 <LPT_Start>
}
    6bca:	1402      	addi      	r14, r14, 8
    6bcc:	1491      	pop      	r4, r15
    6bce:	0000      	bkpt
    6bd0:	20000000 	.long	0x20000000

Disassembly of section .text.led_hardware_setup:

00006bd4 <led_hardware_setup>:
	3.LEDB--GPIOA0.08
	4.EPT_CLK = PCLK / (555 + 1) = 5556KHZ / 556 ≈ 10KHZ
	5.GPT_CLK = PCLK / (555 + 1) = 5556KHZ / 556 ≈ 10KHZ
  */
void led_hardware_setup(void)
{
    6bd4:	14d1      	push      	r4, r15
    6bd6:	1429      	subi      	r14, r14, 36
	/* 红灯引脚初始化 */
	EPT_Software_Prg();
    6bd8:	e3fff56a 	bsr      	0x56ac	// 56ac <EPT_Software_Prg>
	EPT_IO_SET(EPT_IO_CHBX, IO_NUM_PB02);
    6bdc:	3116      	movi      	r1, 22
    6bde:	3002      	movi      	r0, 2
    6be0:	e3fff59e 	bsr      	0x571c	// 571c <EPT_IO_SET>
	/* PCLK作为时钟源；Immediate模式；递增模式；连续计数工作模式；EPTCLK = PCLK / (PSC + 1)；波形输出被停止时，GPIO高阻输出 */
	EPT_PWM_Config(EPT_Selecte_PCLK, EPT_CNTMD_increase, EPT_OPM_Continue, 55);
    6be4:	3337      	movi      	r3, 55
    6be6:	3200      	movi      	r2, 0
    6be8:	3100      	movi      	r1, 0
    6bea:	3000      	movi      	r0, 0
    6bec:	e3fff6ac 	bsr      	0x5944	// 5944 <EPT_PWM_Config>
	/* CMPB作为CA和CB的数据源；当CNT等于零时，置位输出；当CNT等于PRDR时，不动作；当CNT等于CA，且此时计数方向为递增时，清除输出 */
	EPT_PWMX_Output_Control(EPT_PWMB, EPT_CA_Selecte_CMPB, EPT_CB_Selecte_CMPB, EPT_PWM_ZRO_Event_OutHigh, EPT_PWM_PRD_Event_Nochange, EPT_PWM_CAU_Event_OutLow, EPT_PWM_CAD_Event_Nochange,
    6bf0:	3400      	movi      	r4, 0
    6bf2:	3310      	movi      	r3, 16
    6bf4:	3280      	movi      	r2, 128
    6bf6:	3180      	movi      	r1, 128
    6bf8:	b888      	st.w      	r4, (r14, 0x20)
    6bfa:	b887      	st.w      	r4, (r14, 0x1c)
    6bfc:	b886      	st.w      	r4, (r14, 0x18)
    6bfe:	b885      	st.w      	r4, (r14, 0x14)
    6c00:	b884      	st.w      	r4, (r14, 0x10)
    6c02:	b883      	st.w      	r4, (r14, 0xc)
    6c04:	b882      	st.w      	r4, (r14, 0x8)
    6c06:	b861      	st.w      	r3, (r14, 0x4)
    6c08:	b880      	st.w      	r4, (r14, 0x0)
    6c0a:	424f      	lsli      	r2, r2, 15
    6c0c:	412d      	lsli      	r1, r1, 13
    6c0e:	3302      	movi      	r3, 2
    6c10:	3001      	movi      	r0, 1
    6c12:	e3fff6b3 	bsr      	0x5978	// 5978 <EPT_PWMX_Output_Control>
							EPT_PWM_CBU_Event_Nochange, EPT_PWM_CBD_Event_Nochange, EPT_PWM_T1U_Event_Nochange, EPT_PWM_T1D_Event_Nochange, EPT_PWM_T2U_Event_Nochange, EPT_PWM_T2D_Event_Nochange);	
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(2000, 0, 2000, 0, 0); /* PWM频率：50HZ */	
    6c16:	32fa      	movi      	r2, 250
    6c18:	4243      	lsli      	r2, r2, 3
    6c1a:	3300      	movi      	r3, 0
    6c1c:	6c0b      	mov      	r0, r2
    6c1e:	3100      	movi      	r1, 0
    6c20:	b880      	st.w      	r4, (r14, 0x0)
    6c22:	e3fff717 	bsr      	0x5a50	// 5a50 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config>
	EPT_Int_Enable(EPT_PEND); /* 使能周期结束中断 */
    6c26:	3080      	movi      	r0, 128
    6c28:	4009      	lsli      	r0, r0, 9
    6c2a:	e3fff721 	bsr      	0x5a6c	// 5a6c <EPT_Int_Enable>
	EPT_Vector_Int_Enable();
    6c2e:	e3fff729 	bsr      	0x5a80	// 5a80 <EPT_Vector_Int_Enable>
	//EPT_Start();
	EPT_Stop(); /* 红灯默认关闭 */

	/* 蓝灯引脚初始化 */
	GPIO_Init(blue_led_pin, Output); /* 输出模式，输入禁止 */
    6c32:	108a      	lrw      	r4, 0x20000050	// 6c58 <led_hardware_setup+0x84>
	EPT_Stop(); /* 红灯默认关闭 */
    6c34:	e3fff560 	bsr      	0x56f4	// 56f4 <EPT_Stop>
	GPIO_Init(blue_led_pin, Output); /* 输出模式，输入禁止 */
    6c38:	3200      	movi      	r2, 0
    6c3a:	9400      	ld.w      	r0, (r4, 0x0)
    6c3c:	3108      	movi      	r1, 8
    6c3e:	e3fff021 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_High(blue_led_pin);
    6c42:	9400      	ld.w      	r0, (r4, 0x0)
    6c44:	3108      	movi      	r1, 8
    6c46:	e3fff205 	bsr      	0x5050	// 5050 <GPIO_Write_High>
	
	/* 绿灯引脚初始化 */
	EPT_IO_SET(EPT_IO_CHAY, IO_NUM_PB03);
    6c4a:	3113      	movi      	r1, 19
    6c4c:	3001      	movi      	r0, 1
    6c4e:	e3fff567 	bsr      	0x571c	// 571c <EPT_IO_SET>
	//GPIO_Init(green_led_pin, Output); /* 输出模式，输入禁止 */
	//GPIO_Write_High(green_led_pin);
}
    6c52:	1409      	addi      	r14, r14, 36
    6c54:	1491      	pop      	r4, r15
    6c56:	0000      	bkpt
    6c58:	20000050 	.long	0x20000050

Disassembly of section .text.EPT0IntHandler:

00006c5c <EPT0IntHandler>:

/* EPT0 Interrupt */
void EPT0IntHandler(void) 
{
    6c5c:	1460      	nie
    6c5e:	1462      	ipush
    6c60:	14d1      	push      	r4, r15
	if((EPT0->MISR & EPT_PEND) == EPT_PEND)
    6c62:	1374      	lrw      	r3, 0x20000024	// 6e30 <EPT0IntHandler+0x1d4>
    6c64:	3080      	movi      	r0, 128
    6c66:	9320      	ld.w      	r1, (r3, 0x0)
    6c68:	5960      	addu      	r3, r1, r0
    6c6a:	3280      	movi      	r2, 128
    6c6c:	9395      	ld.w      	r4, (r3, 0x54)
    6c6e:	4249      	lsli      	r2, r2, 9
    6c70:	6908      	and      	r4, r2
    6c72:	3c40      	cmpnei      	r4, 0
    6c74:	0c47      	bf      	0x6d02	// 6d02 <EPT0IntHandler+0xa6>
	{
		EPT0->ICR = EPT_PEND;
    6c76:	b357      	st.w      	r2, (r3, 0x5c)
		
		static U8_T flag = 0;
		static U8_T BreathCnt = 0;
		static U8_T SoildTime = 0;

		if((EPT0->CMPB == 0) && (SoildTime == 25)) flag = 1;
    6c78:	914c      	ld.w      	r2, (r1, 0x30)
    6c7a:	3a40      	cmpnei      	r2, 0
    6c7c:	134e      	lrw      	r2, 0x20000268	// 6e34 <EPT0IntHandler+0x1d8>
    6c7e:	0817      	bt      	0x6cac	// 6cac <EPT0IntHandler+0x50>
    6c80:	8200      	ld.b      	r0, (r2, 0x0)
    6c82:	3859      	cmpnei      	r0, 25
    6c84:	0814      	bt      	0x6cac	// 6cac <EPT0IntHandler+0x50>
    6c86:	3001      	movi      	r0, 1
    6c88:	a201      	st.b      	r0, (r2, 0x1)
		{
			flag = 0;
			BreathCnt = 0;
			SoildTime = 0;
		}
		if(flag == 0) /* 暗到亮 */
    6c8a:	8201      	ld.b      	r0, (r2, 0x1)
    6c8c:	3840      	cmpnei      	r0, 0
    6c8e:	081d      	bt      	0x6cc8	// 6cc8 <EPT0IntHandler+0x6c>
		{
			if(EPT0->CMPB == 0) SoildTime++; /* 亮0.5秒后变暗 */
    6c90:	910c      	ld.w      	r0, (r1, 0x30)
    6c92:	3840      	cmpnei      	r0, 0
    6c94:	0816      	bt      	0x6cc0	// 6cc0 <EPT0IntHandler+0x64>
    6c96:	8220      	ld.b      	r1, (r2, 0x0)
    6c98:	2100      	addi      	r1, 1
    6c9a:	a220      	st.b      	r1, (r2, 0x0)
	else if((EPT0->MISR & EPT_CDD) == EPT_CDD)
	{
		EPT0->ICR = EPT_CDD;
	}
	//紧急中断
	if((EPT0->EMMISR & EPT_EP0_EMINT) == EPT_EP0_EMINT)
    6c9c:	934b      	ld.w      	r2, (r3, 0x2c)
    6c9e:	3001      	movi      	r0, 1
    6ca0:	6880      	and      	r2, r0
    6ca2:	3a40      	cmpnei      	r2, 0
    6ca4:	3180      	movi      	r1, 128
    6ca6:	0c8c      	bf      	0x6dbe	// 6dbe <EPT0IntHandler+0x162>
	{
		EPT0->EMICR = EPT_EP5_EMINT;
	}
	else if((EPT0->EMMISR & EPT_EP6_EMINT) == EPT_EP6_EMINT)
	{
		EPT0->EMICR = EPT_EP6_EMINT;
    6ca8:	b30d      	st.w      	r0, (r3, 0x34)
    6caa:	041e      	br      	0x6ce6	// 6ce6 <EPT0IntHandler+0x8a>
		else if(EPT0->CMPB == 2000) 
    6cac:	30fa      	movi      	r0, 250
    6cae:	918c      	ld.w      	r4, (r1, 0x30)
    6cb0:	4003      	lsli      	r0, r0, 3
    6cb2:	6412      	cmpne      	r4, r0
    6cb4:	0beb      	bt      	0x6c8a	// 6c8a <EPT0IntHandler+0x2e>
			flag = 0;
    6cb6:	3000      	movi      	r0, 0
    6cb8:	a201      	st.b      	r0, (r2, 0x1)
			BreathCnt = 0;
    6cba:	a202      	st.b      	r0, (r2, 0x2)
			SoildTime = 0;
    6cbc:	a200      	st.b      	r0, (r2, 0x0)
    6cbe:	07e6      	br      	0x6c8a	// 6c8a <EPT0IntHandler+0x2e>
			else EPT0->CMPB -= 80;
    6cc0:	914c      	ld.w      	r2, (r1, 0x30)
    6cc2:	2a4f      	subi      	r2, 80
    6cc4:	b14c      	st.w      	r2, (r1, 0x30)
    6cc6:	07eb      	br      	0x6c9c	// 6c9c <EPT0IntHandler+0x40>
		else if(flag == 1) /* 亮到暗 */
    6cc8:	3841      	cmpnei      	r0, 1
    6cca:	0be9      	bt      	0x6c9c	// 6c9c <EPT0IntHandler+0x40>
			if(EPT0->CMPB == 1976) BreathCnt++; /* 完成一次呼吸灯 */
    6ccc:	30f7      	movi      	r0, 247
    6cce:	918c      	ld.w      	r4, (r1, 0x30)
    6cd0:	4003      	lsli      	r0, r0, 3
    6cd2:	6412      	cmpne      	r4, r0
    6cd4:	080f      	bt      	0x6cf2	// 6cf2 <EPT0IntHandler+0x96>
    6cd6:	8222      	ld.b      	r1, (r2, 0x2)
    6cd8:	2100      	addi      	r1, 1
    6cda:	a222      	st.b      	r1, (r2, 0x2)
			if(BreathCnt == 1)
    6cdc:	8242      	ld.b      	r2, (r2, 0x2)
    6cde:	3a41      	cmpnei      	r2, 1
    6ce0:	0bde      	bt      	0x6c9c	// 6c9c <EPT0IntHandler+0x40>
				EPT_Stop();
    6ce2:	e3fff509 	bsr      	0x56f4	// 56f4 <EPT_Stop>
	}
	else if((EPT0->EMMISR & EPT_EOM_FAULT_EMINT) == EPT_EOM_FAULT_EMINT)
	{
		EPT0->EMICR = EPT_EOM_FAULT_EMINT;
	}
}
    6ce6:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    6cea:	9880      	ld.w      	r4, (r14, 0x0)
    6cec:	1402      	addi      	r14, r14, 8
    6cee:	1463      	ipop
    6cf0:	1461      	nir
				else if(EPT0->CMPB < 1976) EPT0->CMPB += 26;
    6cf2:	918c      	ld.w      	r4, (r1, 0x30)
    6cf4:	1211      	lrw      	r0, 0x7b7	// 6e38 <EPT0IntHandler+0x1dc>
    6cf6:	6500      	cmphs      	r0, r4
    6cf8:	0ff2      	bf      	0x6cdc	// 6cdc <EPT0IntHandler+0x80>
    6cfa:	910c      	ld.w      	r0, (r1, 0x30)
    6cfc:	2019      	addi      	r0, 26
    6cfe:	b10c      	st.w      	r0, (r1, 0x30)
    6d00:	07ee      	br      	0x6cdc	// 6cdc <EPT0IntHandler+0x80>
	else if((EPT0->MISR & EPT_TRGEV0_INT) == EPT_TRGEV0_INT)
    6d02:	9355      	ld.w      	r2, (r3, 0x54)
    6d04:	3101      	movi      	r1, 1
    6d06:	6884      	and      	r2, r1
    6d08:	3a40      	cmpnei      	r2, 0
    6d0a:	0c03      	bf      	0x6d10	// 6d10 <EPT0IntHandler+0xb4>
		EPT0->ICR = EPT_CAP_LD2;
    6d0c:	b337      	st.w      	r1, (r3, 0x5c)
    6d0e:	07c7      	br      	0x6c9c	// 6c9c <EPT0IntHandler+0x40>
	else if((EPT0->MISR & EPT_TRGEV1_INT) == EPT_TRGEV1_INT)
    6d10:	9355      	ld.w      	r2, (r3, 0x54)
    6d12:	3102      	movi      	r1, 2
    6d14:	6884      	and      	r2, r1
    6d16:	3a40      	cmpnei      	r2, 0
    6d18:	0bfa      	bt      	0x6d0c	// 6d0c <EPT0IntHandler+0xb0>
	else if((EPT0->MISR & EPT_TRGEV2_INT) == EPT_TRGEV2_INT)
    6d1a:	9355      	ld.w      	r2, (r3, 0x54)
    6d1c:	3104      	movi      	r1, 4
    6d1e:	6884      	and      	r2, r1
    6d20:	3a40      	cmpnei      	r2, 0
    6d22:	0bf5      	bt      	0x6d0c	// 6d0c <EPT0IntHandler+0xb0>
	else if((EPT0->MISR & EPT_TRGEV3_INT) == EPT_TRGEV3_INT)
    6d24:	9355      	ld.w      	r2, (r3, 0x54)
    6d26:	3108      	movi      	r1, 8
    6d28:	6884      	and      	r2, r1
    6d2a:	3a40      	cmpnei      	r2, 0
    6d2c:	0bf0      	bt      	0x6d0c	// 6d0c <EPT0IntHandler+0xb0>
	else if((EPT0->MISR & EPT_CAP_LD0) == EPT_CAP_LD0)
    6d2e:	9355      	ld.w      	r2, (r3, 0x54)
    6d30:	3110      	movi      	r1, 16
    6d32:	6884      	and      	r2, r1
    6d34:	3a40      	cmpnei      	r2, 0
    6d36:	0beb      	bt      	0x6d0c	// 6d0c <EPT0IntHandler+0xb0>
	else if((EPT0->MISR & EPT_CAP_LD1) == EPT_CAP_LD1)
    6d38:	9355      	ld.w      	r2, (r3, 0x54)
    6d3a:	3120      	movi      	r1, 32
    6d3c:	6884      	and      	r2, r1
    6d3e:	3a40      	cmpnei      	r2, 0
    6d40:	0be6      	bt      	0x6d0c	// 6d0c <EPT0IntHandler+0xb0>
	else if((EPT0->MISR & EPT_CAP_LD2) == EPT_CAP_LD2)
    6d42:	9355      	ld.w      	r2, (r3, 0x54)
    6d44:	3140      	movi      	r1, 64
    6d46:	6884      	and      	r2, r1
    6d48:	3a40      	cmpnei      	r2, 0
    6d4a:	0be1      	bt      	0x6d0c	// 6d0c <EPT0IntHandler+0xb0>
	else if((EPT0->MISR & EPT_CAP_LD3) == EPT_CAP_LD3)
    6d4c:	9355      	ld.w      	r2, (r3, 0x54)
    6d4e:	6880      	and      	r2, r0
    6d50:	3a40      	cmpnei      	r2, 0
    6d52:	0c03      	bf      	0x6d58	// 6d58 <EPT0IntHandler+0xfc>
		EPT0->ICR = EPT_CAP_LD3;
    6d54:	b317      	st.w      	r0, (r3, 0x5c)
    6d56:	07a3      	br      	0x6c9c	// 6c9c <EPT0IntHandler+0x40>
	else if((EPT0->MISR & EPT_CAU) == EPT_CAU)
    6d58:	3280      	movi      	r2, 128
    6d5a:	9335      	ld.w      	r1, (r3, 0x54)
    6d5c:	4241      	lsli      	r2, r2, 1
    6d5e:	6848      	and      	r1, r2
    6d60:	3940      	cmpnei      	r1, 0
    6d62:	0c03      	bf      	0x6d68	// 6d68 <EPT0IntHandler+0x10c>
		EPT0->ICR = EPT_CDD;
    6d64:	b357      	st.w      	r2, (r3, 0x5c)
    6d66:	079b      	br      	0x6c9c	// 6c9c <EPT0IntHandler+0x40>
	else if((EPT0->MISR & EPT_CAD) == EPT_CAD)
    6d68:	3280      	movi      	r2, 128
    6d6a:	9335      	ld.w      	r1, (r3, 0x54)
    6d6c:	4242      	lsli      	r2, r2, 2
    6d6e:	6848      	and      	r1, r2
    6d70:	3940      	cmpnei      	r1, 0
    6d72:	0bf9      	bt      	0x6d64	// 6d64 <EPT0IntHandler+0x108>
	else if((EPT0->MISR & EPT_CBU) == EPT_CBU)
    6d74:	3280      	movi      	r2, 128
    6d76:	9335      	ld.w      	r1, (r3, 0x54)
    6d78:	4243      	lsli      	r2, r2, 3
    6d7a:	6848      	and      	r1, r2
    6d7c:	3940      	cmpnei      	r1, 0
    6d7e:	0bf3      	bt      	0x6d64	// 6d64 <EPT0IntHandler+0x108>
	else if((EPT0->MISR & EPT_CBD) == EPT_CBD)
    6d80:	3280      	movi      	r2, 128
    6d82:	9335      	ld.w      	r1, (r3, 0x54)
    6d84:	4244      	lsli      	r2, r2, 4
    6d86:	6848      	and      	r1, r2
    6d88:	3940      	cmpnei      	r1, 0
    6d8a:	0bed      	bt      	0x6d64	// 6d64 <EPT0IntHandler+0x108>
	else if((EPT0->MISR & EPT_CCU) == EPT_CCU)
    6d8c:	3280      	movi      	r2, 128
    6d8e:	9335      	ld.w      	r1, (r3, 0x54)
    6d90:	4245      	lsli      	r2, r2, 5
    6d92:	6848      	and      	r1, r2
    6d94:	3940      	cmpnei      	r1, 0
    6d96:	0be7      	bt      	0x6d64	// 6d64 <EPT0IntHandler+0x108>
	else if((EPT0->MISR & EPT_CCD) == EPT_CCD)
    6d98:	3280      	movi      	r2, 128
    6d9a:	9335      	ld.w      	r1, (r3, 0x54)
    6d9c:	4246      	lsli      	r2, r2, 6
    6d9e:	6848      	and      	r1, r2
    6da0:	3940      	cmpnei      	r1, 0
    6da2:	0be1      	bt      	0x6d64	// 6d64 <EPT0IntHandler+0x108>
	else if((EPT0->MISR & EPT_CDU) == EPT_CDU)
    6da4:	3280      	movi      	r2, 128
    6da6:	9335      	ld.w      	r1, (r3, 0x54)
    6da8:	4247      	lsli      	r2, r2, 7
    6daa:	6848      	and      	r1, r2
    6dac:	3940      	cmpnei      	r1, 0
    6dae:	0bdb      	bt      	0x6d64	// 6d64 <EPT0IntHandler+0x108>
	else if((EPT0->MISR & EPT_CDD) == EPT_CDD)
    6db0:	3280      	movi      	r2, 128
    6db2:	9335      	ld.w      	r1, (r3, 0x54)
    6db4:	4248      	lsli      	r2, r2, 8
    6db6:	6848      	and      	r1, r2
    6db8:	3940      	cmpnei      	r1, 0
    6dba:	0f71      	bf      	0x6c9c	// 6c9c <EPT0IntHandler+0x40>
    6dbc:	07d4      	br      	0x6d64	// 6d64 <EPT0IntHandler+0x108>
	else if((EPT0->EMMISR & EPT_EP1_EMINT) == EPT_EP1_EMINT)
    6dbe:	934b      	ld.w      	r2, (r3, 0x2c)
    6dc0:	3002      	movi      	r0, 2
    6dc2:	6880      	and      	r2, r0
    6dc4:	3a40      	cmpnei      	r2, 0
    6dc6:	0b71      	bt      	0x6ca8	// 6ca8 <EPT0IntHandler+0x4c>
	else if((EPT0->EMMISR & EPT_EP2_EMINT) == EPT_EP2_EMINT)
    6dc8:	934b      	ld.w      	r2, (r3, 0x2c)
    6dca:	3004      	movi      	r0, 4
    6dcc:	6880      	and      	r2, r0
    6dce:	3a40      	cmpnei      	r2, 0
    6dd0:	0b6c      	bt      	0x6ca8	// 6ca8 <EPT0IntHandler+0x4c>
	else if((EPT0->EMMISR & EPT_EP3_EMINT) == EPT_EP3_EMINT)
    6dd2:	934b      	ld.w      	r2, (r3, 0x2c)
    6dd4:	3008      	movi      	r0, 8
    6dd6:	6880      	and      	r2, r0
    6dd8:	3a40      	cmpnei      	r2, 0
    6dda:	0b67      	bt      	0x6ca8	// 6ca8 <EPT0IntHandler+0x4c>
	else if((EPT0->EMMISR & EPT_EP4_EMINT) == EPT_EP4_EMINT)
    6ddc:	934b      	ld.w      	r2, (r3, 0x2c)
    6dde:	3010      	movi      	r0, 16
    6de0:	6880      	and      	r2, r0
    6de2:	3a40      	cmpnei      	r2, 0
    6de4:	0b62      	bt      	0x6ca8	// 6ca8 <EPT0IntHandler+0x4c>
	else if((EPT0->EMMISR & EPT_EP5_EMINT) == EPT_EP5_EMINT)
    6de6:	934b      	ld.w      	r2, (r3, 0x2c)
    6de8:	3020      	movi      	r0, 32
    6dea:	6880      	and      	r2, r0
    6dec:	3a40      	cmpnei      	r2, 0
    6dee:	0b5d      	bt      	0x6ca8	// 6ca8 <EPT0IntHandler+0x4c>
	else if((EPT0->EMMISR & EPT_EP6_EMINT) == EPT_EP6_EMINT)
    6df0:	934b      	ld.w      	r2, (r3, 0x2c)
    6df2:	3040      	movi      	r0, 64
    6df4:	6880      	and      	r2, r0
    6df6:	3a40      	cmpnei      	r2, 0
    6df8:	0b58      	bt      	0x6ca8	// 6ca8 <EPT0IntHandler+0x4c>
	else if((EPT0->EMMISR & EPT_EP7_EMINT) == EPT_EP7_EMINT)
    6dfa:	934b      	ld.w      	r2, (r3, 0x2c)
    6dfc:	6884      	and      	r2, r1
    6dfe:	3a40      	cmpnei      	r2, 0
    6e00:	0c03      	bf      	0x6e06	// 6e06 <EPT0IntHandler+0x1aa>
		EPT0->EMICR = EPT_EP7_EMINT;
    6e02:	b32d      	st.w      	r1, (r3, 0x34)
    6e04:	0771      	br      	0x6ce6	// 6ce6 <EPT0IntHandler+0x8a>
	else if((EPT0->EMMISR & EPT_CPU_FAULT_EMINT) == EPT_CPU_FAULT_EMINT)
    6e06:	3280      	movi      	r2, 128
    6e08:	932b      	ld.w      	r1, (r3, 0x2c)
    6e0a:	4241      	lsli      	r2, r2, 1
    6e0c:	6848      	and      	r1, r2
    6e0e:	3940      	cmpnei      	r1, 0
    6e10:	0c03      	bf      	0x6e16	// 6e16 <EPT0IntHandler+0x1ba>
		EPT0->EMICR = EPT_EOM_FAULT_EMINT;
    6e12:	b34d      	st.w      	r2, (r3, 0x34)
    6e14:	0769      	br      	0x6ce6	// 6ce6 <EPT0IntHandler+0x8a>
	else if((EPT0->EMMISR & EPT_MEM_FAULT_EMINT) == EPT_MEM_FAULT_EMINT)
    6e16:	3280      	movi      	r2, 128
    6e18:	932b      	ld.w      	r1, (r3, 0x2c)
    6e1a:	4242      	lsli      	r2, r2, 2
    6e1c:	6848      	and      	r1, r2
    6e1e:	3940      	cmpnei      	r1, 0
    6e20:	0bf9      	bt      	0x6e12	// 6e12 <EPT0IntHandler+0x1b6>
	else if((EPT0->EMMISR & EPT_EOM_FAULT_EMINT) == EPT_EOM_FAULT_EMINT)
    6e22:	3280      	movi      	r2, 128
    6e24:	932b      	ld.w      	r1, (r3, 0x2c)
    6e26:	4243      	lsli      	r2, r2, 3
    6e28:	6848      	and      	r1, r2
    6e2a:	3940      	cmpnei      	r1, 0
    6e2c:	0bf3      	bt      	0x6e12	// 6e12 <EPT0IntHandler+0x1b6>
    6e2e:	075c      	br      	0x6ce6	// 6ce6 <EPT0IntHandler+0x8a>
    6e30:	20000024 	.long	0x20000024
    6e34:	20000268 	.long	0x20000268
    6e38:	000007b7 	.long	0x000007b7

Disassembly of section .text.adc_hardware_setup:

00006e3c <adc_hardware_setup>:
	2.当选择INTVREF作为ADC参考电压时，ADC模拟模块的时钟频率不能超过2MHz。FVR做参考时，没有限制。
    3.FADC = PCLK / (2 * PRLVAL) = 48MHZ / (2 * 24) = 1MHZ
	
  */
void adc_hardware_setup(void)
{
    6e3c:	14d0      	push      	r15
    6e3e:	1422      	subi      	r14, r14, 8
	ADC12_RESET_VALUE();
    6e40:	e3fff62c 	bsr      	0x5a98	// 5a98 <ADC12_RESET_VALUE>
	ADC12_CLK_CMD(ADC_CLK_CR, ENABLE); /* 使能ADC时钟 */
    6e44:	3101      	movi      	r1, 1
    6e46:	3002      	movi      	r0, 2
    6e48:	e3fff676 	bsr      	0x5b34	// 5b34 <ADC12_CLK_CMD>
	/* 12位ADC，单次转换模式，转换优先序列寄存器为0，采样保持周期数为6，FADC=1MHZ，转换序列个数为4 */
	ADC12_Configure_Mode(ADC12_12BIT, One_shot_mode, 0, 6, 24, 4);
    6e4c:	3304      	movi      	r3, 4
    6e4e:	b861      	st.w      	r3, (r14, 0x4)
    6e50:	3318      	movi      	r3, 24
    6e52:	b860      	st.w      	r3, (r14, 0x0)
    6e54:	3200      	movi      	r2, 0
    6e56:	3306      	movi      	r3, 6
    6e58:	3100      	movi      	r1, 0
    6e5a:	3001      	movi      	r0, 1
    6e5c:	e3fff6b6 	bsr      	0x5bc8	// 5bc8 <ADC12_Configure_Mode>
	//ADC12_Configure_Mode(ADC12_12BIT, Continuous_mode, 0, 6, 24, 2);
	ADC12_Configure_VREF_Selecte(ADC12_VREFP_VDD_VREFN_VSS); /* 正向为内部VDD，负向为VSS */
    6e60:	3000      	movi      	r0, 0
    6e62:	e3fff6f1 	bsr      	0x5c44	// 5c44 <ADC12_Configure_VREF_Selecte>
	/* 转换序列0，选择ADCIN10通道, 6个转换周期, 连续重复采样次数为8，平均值计算使能 */
	ADC12_ConversionChannel_Config(ADC12_ADCIN10, ADC12_CV_RepeatNum8, ADC12_AVGEN, 0);
    6e66:	3280      	movi      	r2, 128
    6e68:	31c6      	movi      	r1, 198
    6e6a:	3300      	movi      	r3, 0
    6e6c:	4245      	lsli      	r2, r2, 5
    6e6e:	4127      	lsli      	r1, r1, 7
    6e70:	300a      	movi      	r0, 10
    6e72:	e3fff7a9 	bsr      	0x5dc4	// 5dc4 <ADC12_ConversionChannel_Config>
	/* 转换序列1，选择ADCIN4通道, 6个转换周期, 连续重复采样次数为8，平均值计算使能 */
	ADC12_ConversionChannel_Config(ADC12_ADCIN4, ADC12_CV_RepeatNum8, ADC12_AVGEN, 1);
    6e76:	3280      	movi      	r2, 128
    6e78:	31c6      	movi      	r1, 198
    6e7a:	3301      	movi      	r3, 1
    6e7c:	4245      	lsli      	r2, r2, 5
    6e7e:	4127      	lsli      	r1, r1, 7
    6e80:	3004      	movi      	r0, 4
    6e82:	e3fff7a1 	bsr      	0x5dc4	// 5dc4 <ADC12_ConversionChannel_Config>
	/* 转换序列2，选择ADCIN13通道, 6个转换周期, 连续重复采样次数为8，平均值计算使能 */
	ADC12_ConversionChannel_Config(ADC12_ADCIN13, ADC12_CV_RepeatNum8, ADC12_AVGEN, 2);
    6e86:	3280      	movi      	r2, 128
    6e88:	31c6      	movi      	r1, 198
    6e8a:	3302      	movi      	r3, 2
    6e8c:	4245      	lsli      	r2, r2, 5
    6e8e:	4127      	lsli      	r1, r1, 7
    6e90:	300d      	movi      	r0, 13
    6e92:	e3fff799 	bsr      	0x5dc4	// 5dc4 <ADC12_ConversionChannel_Config>
	/* 转换序列3，选择ADCIN11通道, 6个转换周期, 连续重复采样次数为8，平均值计算使能 */
	ADC12_ConversionChannel_Config(ADC12_ADCIN11, ADC12_CV_RepeatNum8, ADC12_AVGEN, 3);
    6e96:	3280      	movi      	r2, 128
    6e98:	31c6      	movi      	r1, 198
    6e9a:	3303      	movi      	r3, 3
    6e9c:	4245      	lsli      	r2, r2, 5
    6e9e:	4127      	lsli      	r1, r1, 7
    6ea0:	300b      	movi      	r0, 11
    6ea2:	e3fff791 	bsr      	0x5dc4	// 5dc4 <ADC12_ConversionChannel_Config>
	ADC12_CMD(ENABLE); /* 使能ADC模块 */
    6ea6:	3001      	movi      	r0, 1
    6ea8:	e3fff65c 	bsr      	0x5b60	// 5b60 <ADC12_CMD>
	ADC12_ready_wait(); /* 等待ADC完成下一个转换的准备 */
    6eac:	e3fff66e 	bsr      	0x5b88	// 5b88 <ADC12_ready_wait>
	//ADC12_Control(ADC12_START);	/* 开始模数转换 */	
}
    6eb0:	1402      	addi      	r14, r14, 8
    6eb2:	1490      	pop      	r15

Disassembly of section .text.charging_hardware_setup:

00006eb4 <charging_hardware_setup>:
	2.GPIOB0.01--5V_EN
	3.GPIOA0.11--CHRG_STAT
	4.GPIOA0.00--NTC_DET
  */
void charging_hardware_setup(void)
{
    6eb4:	14d1      	push      	r4, r15
	//5V升压引脚初始化
	GPIO_Init(charge_5V_boost_pin, Output); /* 输出模式，输入禁止 */
    6eb6:	1283      	lrw      	r4, 0x2000004c	// 6fc0 <charging_hardware_setup+0x10c>
    6eb8:	3200      	movi      	r2, 0
    6eba:	9400      	ld.w      	r0, (r4, 0x0)
    6ebc:	3101      	movi      	r1, 1
    6ebe:	e3ffeee1 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_Low(charge_5V_boost_pin);
    6ec2:	9400      	ld.w      	r0, (r4, 0x0)
    6ec4:	3101      	movi      	r1, 1
    6ec6:	e3fff0c9 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
	
	//USB5V插入检测引脚初始化
	GPIO_IntGroup_Set(GPIOA, 3, Selete_EXI_PIN3); //外部中断组1选择GPIOA0.01作为中断源								
    6eca:	3203      	movi      	r2, 3
    6ecc:	3103      	movi      	r1, 3
    6ece:	3000      	movi      	r0, 0
    6ed0:	e3ffefb6 	bsr      	0x4e3c	// 4e3c <GPIO_IntGroup_Set>
	GPIOA0_EXI_Init(EXI3); //GPIOA0.01设置为输入模式，输出禁止
	GPIO_PullHighLow_DIS(charge_USB5V_detect_pin);
    6ed4:	119c      	lrw      	r4, 0x20000050	// 6fc4 <charging_hardware_setup+0x110>
	GPIOA0_EXI_Init(EXI3); //GPIOA0.01设置为输入模式，输出禁止
    6ed6:	3003      	movi      	r0, 3
    6ed8:	e3fff038 	bsr      	0x4f48	// 4f48 <GPIOA0_EXI_Init>
	GPIO_PullHighLow_DIS(charge_USB5V_detect_pin);
    6edc:	9400      	ld.w      	r0, (r4, 0x0)
    6ede:	3103      	movi      	r1, 3
    6ee0:	e3ffefa6 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
	EXTI_trigger_CMD(ENABLE, EXI_PIN3, _EXIRT); //EXI1上升沿触发中断
    6ee4:	3200      	movi      	r2, 0
    6ee6:	3108      	movi      	r1, 8
    6ee8:	3001      	movi      	r0, 1
    6eea:	e3ffede9 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	EXTI_trigger_CMD(ENABLE, EXI_PIN3, _EXIFT); //EXI1下降沿触发中断
    6eee:	3201      	movi      	r2, 1
    6ef0:	3108      	movi      	r1, 8
    6ef2:	3001      	movi      	r0, 1
    6ef4:	e3ffede4 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	EXTI_interrupt_CMD(ENABLE, EXI_PIN3); //打开EXI1中断源
    6ef8:	3108      	movi      	r1, 8
    6efa:	3001      	movi      	r0, 1
    6efc:	e3ffee00 	bsr      	0x4afc	// 4afc <EXTI_interrupt_CMD>
	GPIO_EXI_EN(GPIOA0, EXI3); //使能EXI1外部中断
    6f00:	9400      	ld.w      	r0, (r4, 0x0)
    6f02:	3103      	movi      	r1, 3
    6f04:	e3fff0a0 	bsr      	0x5044	// 5044 <GPIO_EXI_EN>
	EXI2_Int_Enable(); //使能NVIC对EXI1中断向量的响应
    6f08:	e3ffee2c 	bsr      	0x4b60	// 4b60 <EXI2_Int_Enable>
	EXI2_WakeUp_Enable();
    6f0c:	e3ffee50 	bsr      	0x4bac	// 4bac <EXI2_WakeUp_Enable>
	
	//充电状态引脚初始化
	GPIO_Init(charge_status_pin, Intput);
    6f10:	3201      	movi      	r2, 1
    6f12:	9400      	ld.w      	r0, (r4, 0x0)
    6f14:	310b      	movi      	r1, 11
    6f16:	e3ffeeb5 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_PullHigh_Init(charge_status_pin);
    6f1a:	9400      	ld.w      	r0, (r4, 0x0)
    6f1c:	310b      	movi      	r1, 11
    6f1e:	e3ffef73 	bsr      	0x4e04	// 4e04 <GPIO_PullHigh_Init>
	
	//充电使能引脚初始化
	GPIO_Init(charge_enable_pin, Output); /* 输出模式，输入禁止 */
    6f22:	3200      	movi      	r2, 0
    6f24:	9400      	ld.w      	r0, (r4, 0x0)
    6f26:	3106      	movi      	r1, 6
    6f28:	e3ffeeac 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_Low(charge_enable_pin);
    6f2c:	9400      	ld.w      	r0, (r4, 0x0)
    6f2e:	3106      	movi      	r1, 6
    6f30:	e3fff094 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
	GPIO_PullHighLow_DIS(charge_enable_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗
    6f34:	9400      	ld.w      	r0, (r4, 0x0)
    6f36:	3106      	movi      	r1, 6
    6f38:	e3ffef7a 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>

	//ntc det引脚初始化
	GPIO_Init(NTC_detect_pin, Output); /* 输出模式，输入禁止 */
    6f3c:	3200      	movi      	r2, 0
    6f3e:	9400      	ld.w      	r0, (r4, 0x0)
    6f40:	310e      	movi      	r1, 14
    6f42:	e3ffee9f 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_Low(NTC_detect_pin);
    6f46:	9400      	ld.w      	r0, (r4, 0x0)
    6f48:	310e      	movi      	r1, 14
    6f4a:	e3fff087 	bsr      	0x5058	// 5058 <GPIO_Write_Low>

	//充电分段电流引脚初始化
	GPIO_Init(charge_wireless_iset_pin, Output); /* 输出模式，输入禁止 */
    6f4e:	3200      	movi      	r2, 0
    6f50:	9400      	ld.w      	r0, (r4, 0x0)
    6f52:	3107      	movi      	r1, 7
    6f54:	e3ffee96 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_PullHighLow_DIS(charge_wireless_iset_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗
    6f58:	9400      	ld.w      	r0, (r4, 0x0)
    6f5a:	3107      	movi      	r1, 7
    6f5c:	e3ffef68 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
	GPIO_Write_Low(charge_wireless_iset_pin);
    6f60:	9400      	ld.w      	r0, (r4, 0x0)
    6f62:	3107      	movi      	r1, 7
    6f64:	e3fff07a 	bsr      	0x5058	// 5058 <GPIO_Write_Low>

	GPIO_InPutOutPut_Disable(charge_wired_iset_pin);
    6f68:	9400      	ld.w      	r0, (r4, 0x0)
    6f6a:	310f      	movi      	r1, 15
    6f6c:	e3ffeefa 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_PullHighLow_DIS(charge_wired_iset_pin);
    6f70:	9400      	ld.w      	r0, (r4, 0x0)
    6f72:	310f      	movi      	r1, 15
    6f74:	e3ffef5c 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
	//GPIO_Init(charge_wired_iset_pin, Output); /* 输出模式，输入禁止 */
	//GPIO_Write_Low(charge_wired_iset_pin);

	//无线充5V检测引脚初始化
	GPIO_IntGroup_Set(GPIOA, 0, Selete_EXI_PIN0); /* 外部中断组1选择GPIOA0.01作为中断源 */								
    6f78:	3200      	movi      	r2, 0
    6f7a:	3100      	movi      	r1, 0
    6f7c:	3000      	movi      	r0, 0
    6f7e:	e3ffef5f 	bsr      	0x4e3c	// 4e3c <GPIO_IntGroup_Set>
	GPIOA0_EXI_Init(EXI0); /* GPIOA0.01设置为输入模式，输出禁止 */ 
    6f82:	3000      	movi      	r0, 0
    6f84:	e3ffefe2 	bsr      	0x4f48	// 4f48 <GPIOA0_EXI_Init>
	GPIO_PullHighLow_DIS(charge_wireless5V_dectect_pin);
    6f88:	9400      	ld.w      	r0, (r4, 0x0)
    6f8a:	3100      	movi      	r1, 0
    6f8c:	e3ffef50 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
	EXTI_trigger_CMD(ENABLE, EXI_PIN0, _EXIRT); /* EXI1上升沿触发中断 */ 
    6f90:	3200      	movi      	r2, 0
    6f92:	3101      	movi      	r1, 1
    6f94:	3001      	movi      	r0, 1
    6f96:	e3ffed93 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	EXTI_trigger_CMD(ENABLE, EXI_PIN0, _EXIFT); /* EXI1下降沿触发中断 */ 
    6f9a:	3201      	movi      	r2, 1
    6f9c:	3101      	movi      	r1, 1
    6f9e:	3001      	movi      	r0, 1
    6fa0:	e3ffed8e 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	EXTI_interrupt_CMD(ENABLE, EXI_PIN0); /* 打开EXI1中断源 */
    6fa4:	3101      	movi      	r1, 1
    6fa6:	3001      	movi      	r0, 1
    6fa8:	e3ffedaa 	bsr      	0x4afc	// 4afc <EXTI_interrupt_CMD>
	GPIO_EXI_EN(GPIOA0, EXI0); /* 使能EXI1外部中断 */
    6fac:	9400      	ld.w      	r0, (r4, 0x0)
    6fae:	3100      	movi      	r1, 0
    6fb0:	e3fff04a 	bsr      	0x5044	// 5044 <GPIO_EXI_EN>
	EXI0_Int_Enable(); /* 使能NVIC对EXI1中断向量的响应 */
    6fb4:	e3ffedc8 	bsr      	0x4b44	// 4b44 <EXI0_Int_Enable>
	EXI0_WakeUp_Enable();
    6fb8:	e3ffede4 	bsr      	0x4b80	// 4b80 <EXI0_WakeUp_Enable>
}
    6fbc:	1491      	pop      	r4, r15
    6fbe:	0000      	bkpt
    6fc0:	2000004c 	.long	0x2000004c
    6fc4:	20000050 	.long	0x20000050

Disassembly of section .text.communicate_hardware_setup:

00006fc8 <communicate_hardware_setup>:
    1.GPIOA0.01--Hall_EN
	2.GPIOB0.05--Pattern EN
	3.GPIOA0.04--Pairing Button
  */
void communicate_hardware_setup(U32_T BaudRate)
{
    6fc8:	14d2      	push      	r4-r5, r15
	U32_T BaudDiv = 0;
		
	BaudDiv = SYSCLK / BaudRate;
    6fca:	116b      	lrw      	r3, 0x20000000	// 7074 <communicate_hardware_setup+0xac>
{
    6fcc:	6c43      	mov      	r1, r0
	BaudDiv = SYSCLK / BaudRate;
    6fce:	9300      	ld.w      	r0, (r3, 0x0)
    6fd0:	e3fffda2 	bsr      	0x6b14	// 6b14 <__udivsi3>
    6fd4:	6d43      	mov      	r5, r0

	/* 霍尔检测引脚初始化 */
	GPIO_IntGroup_Set(GPIOA, 1, Selete_EXI_PIN1); /* 外部中断组1选择GPIOA0.01作为中断源 */								
    6fd6:	3201      	movi      	r2, 1
    6fd8:	3101      	movi      	r1, 1
    6fda:	3000      	movi      	r0, 0
    6fdc:	e3ffef30 	bsr      	0x4e3c	// 4e3c <GPIO_IntGroup_Set>
	GPIOA0_EXI_Init(EXI1); /* GPIOA0.01设置为输入模式，输出禁止 */ 
	GPIO_PullHighLow_DIS(hall_en_pin);
    6fe0:	1186      	lrw      	r4, 0x20000050	// 7078 <communicate_hardware_setup+0xb0>
	GPIOA0_EXI_Init(EXI1); /* GPIOA0.01设置为输入模式，输出禁止 */ 
    6fe2:	3001      	movi      	r0, 1
    6fe4:	e3ffefb2 	bsr      	0x4f48	// 4f48 <GPIOA0_EXI_Init>
	GPIO_PullHighLow_DIS(hall_en_pin);
    6fe8:	9400      	ld.w      	r0, (r4, 0x0)
    6fea:	3101      	movi      	r1, 1
    6fec:	e3ffef20 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
	EXTI_trigger_CMD(ENABLE, EXI_PIN1, _EXIRT); /* EXI1上升沿触发中断 */ 
    6ff0:	3200      	movi      	r2, 0
    6ff2:	3102      	movi      	r1, 2
    6ff4:	3001      	movi      	r0, 1
    6ff6:	e3ffed63 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	EXTI_trigger_CMD(ENABLE, EXI_PIN1, _EXIFT); /* EXI1下降沿触发中断 */ 
    6ffa:	3201      	movi      	r2, 1
    6ffc:	3102      	movi      	r1, 2
    6ffe:	3001      	movi      	r0, 1
    7000:	e3ffed5e 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	EXTI_interrupt_CMD(ENABLE, EXI_PIN1); /* 打开EXI1中断源 */
    7004:	3102      	movi      	r1, 2
    7006:	3001      	movi      	r0, 1
    7008:	e3ffed7a 	bsr      	0x4afc	// 4afc <EXTI_interrupt_CMD>
	GPIO_EXI_EN(GPIOA0, EXI1); /* 使能EXI1外部中断 */
    700c:	9400      	ld.w      	r0, (r4, 0x0)
    700e:	3101      	movi      	r1, 1
    7010:	e3fff01a 	bsr      	0x5044	// 5044 <GPIO_EXI_EN>
	EXI1_Int_Enable(); /* 使能NVIC对EXI1中断向量的响应 */
    7014:	e3ffed9e 	bsr      	0x4b50	// 4b50 <EXI1_Int_Enable>
	EXI1_WakeUp_Enable();
    7018:	e3ffedba 	bsr      	0x4b8c	// 4b8c <EXI1_WakeUp_Enable>
	
	/* 按键引脚初始化 */
	GPIO_IntGroup_Set(GPIOA, 4, Selete_EXI_PIN4); /* 外部中断组4选择GPIOA0.04作为中断源 */								
    701c:	3204      	movi      	r2, 4
    701e:	3104      	movi      	r1, 4
    7020:	3000      	movi      	r0, 0
    7022:	e3ffef0d 	bsr      	0x4e3c	// 4e3c <GPIO_IntGroup_Set>
	GPIOA0_EXI_Init(EXI4); /* GPIOA0.04设置为输入模式，输出禁止 */ 
    7026:	3004      	movi      	r0, 4
    7028:	e3ffef90 	bsr      	0x4f48	// 4f48 <GPIOA0_EXI_Init>
	GPIO_PullLow_Init(key_pin);
    702c:	9400      	ld.w      	r0, (r4, 0x0)
    702e:	3104      	movi      	r1, 4
    7030:	e3ffeef4 	bsr      	0x4e18	// 4e18 <GPIO_PullLow_Init>
	EXTI_trigger_CMD(ENABLE, EXI_PIN4, _EXIRT); /* EXI4上升沿触发中断 */ 
    7034:	3200      	movi      	r2, 0
    7036:	3110      	movi      	r1, 16
    7038:	3001      	movi      	r0, 1
    703a:	e3ffed41 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	//EXTI_trigger_CMD(ENABLE, EXI_PIN4, _EXIFT); /* EXI4下降沿触发中断 */ 
	EXTI_interrupt_CMD(ENABLE, EXI_PIN4); /* 打开EXI4中断源 */
    703e:	3110      	movi      	r1, 16
    7040:	3001      	movi      	r0, 1
    7042:	e3ffed5d 	bsr      	0x4afc	// 4afc <EXTI_interrupt_CMD>
	//GPIO_EXTI_interrupt(GPIOA0, EXI_PIN4);
	GPIO_EXI_EN(GPIOA0, EXI4); /* 使能EXI4外部中断 */
    7046:	9400      	ld.w      	r0, (r4, 0x0)
    7048:	3104      	movi      	r1, 4
    704a:	e3ffeffd 	bsr      	0x5044	// 5044 <GPIO_EXI_EN>
	EXI3_Int_Enable(); /* 使能NVIC对EXI3中断向量的响应 */
    704e:	e3ffed91 	bsr      	0x4b70	// 4b70 <EXI3_Int_Enable>
	EXI3_WakeUp_Enable();
    7052:	e3ffedb5 	bsr      	0x4bbc	// 4bbc <EXI3_WakeUp_Enable>
	GPIO_Init(pattern_TX_pin, Output);
	GPIO_Write_High(pattern_TX_pin);	
	GPIO_Init(pattern_RX_pin, Output);
	GPIO_Write_High(pattern_RX_pin);
	#else
	UART2_DeInit();                                                 //clear all UART Register
    7056:	e3fff0c1 	bsr      	0x51d8	// 51d8 <UART2_DeInit>
    UART_IO_Init(IO_UART2, 2);                                    	//use PB0.5->RXD2, PB0.4->TXD2
    705a:	3102      	movi      	r1, 2
    705c:	3002      	movi      	r0, 2
    705e:	e3fff0f5 	bsr      	0x5248	// 5248 <UART_IO_Init>
	UARTInitRxIntEn(UART2, BaudDiv, UART_PAR_NONE);	                    //baudrate=sysclock/46=115200
    7062:	1067      	lrw      	r3, 0x2000003c	// 707c <communicate_hardware_setup+0xb4>
    7064:	7455      	zexth      	r1, r5
    7066:	9300      	ld.w      	r0, (r3, 0x0)
    7068:	3200      	movi      	r2, 0
    706a:	e3fff163 	bsr      	0x5330	// 5330 <UARTInitRxIntEn>
	UART2_Int_Enable();
    706e:	e3fff0cf 	bsr      	0x520c	// 520c <UART2_Int_Enable>
	#endif
}
    7072:	1492      	pop      	r4-r5, r15
    7074:	20000000 	.long	0x20000000
    7078:	20000050 	.long	0x20000050
    707c:	2000003c 	.long	0x2000003c

Disassembly of section .text.ReduceSYSCLKto5556KHZ:

00007080 <ReduceSYSCLKto5556KHZ>:
{
    7080:	14d0      	push      	r15
	CK_CPU_DisAllNormalIrq(); /* 关闭所有中断 */
    7082:	e3fffd82 	bsr      	0x6b86	// 6b86 <CK_CPU_DisAllNormalIrq>
	SYSCLK = 5556000u;
    7086:	1141      	lrw      	r2, 0x54c720	// 7108 <ReduceSYSCLKto5556KHZ+0x88>
    7088:	1161      	lrw      	r3, 0x20000000	// 710c <ReduceSYSCLKto5556KHZ+0x8c>
    708a:	b340      	st.w      	r2, (r3, 0x0)
	UARTClose(UART1);
    708c:	1161      	lrw      	r3, 0x20000040	// 7110 <ReduceSYSCLKto5556KHZ+0x90>
    708e:	9300      	ld.w      	r0, (r3, 0x0)
    7090:	e3fff158 	bsr      	0x5340	// 5340 <UARTClose>
	UART1_CONFIG(115200);
    7094:	30e1      	movi      	r0, 225
    7096:	4009      	lsli      	r0, r0, 9
    7098:	e3fff772 	bsr      	0x5f7c	// 5f7c <UART1_CONFIG>
	UARTClose(UART2);
    709c:	107e      	lrw      	r3, 0x2000003c	// 7114 <ReduceSYSCLKto5556KHZ+0x94>
    709e:	9300      	ld.w      	r0, (r3, 0x0)
    70a0:	e3fff150 	bsr      	0x5340	// 5340 <UARTClose>
	communicate_hardware_setup(200);
    70a4:	30c8      	movi      	r0, 200
    70a6:	e3ffff91 	bsr      	0x6fc8	// 6fc8 <communicate_hardware_setup>
	LPT_Stop();
    70aa:	e3fff033 	bsr      	0x5110	// 5110 <LPT_Stop>
	LPT_Init();
    70ae:	e3fffd6f 	bsr      	0x6b8c	// 6b8c <LPT_Init>
	SYSCON->GCDR |= 1 << 1; /* 关闭IMOSC */
    70b2:	107a      	lrw      	r3, 0x2000005c	// 7118 <ReduceSYSCLKto5556KHZ+0x98>
    70b4:	3002      	movi      	r0, 2
    70b6:	9360      	ld.w      	r3, (r3, 0x0)
    70b8:	9322      	ld.w      	r1, (r3, 0x8)
    70ba:	6c40      	or      	r1, r0
    70bc:	b322      	st.w      	r1, (r3, 0x8)
	SYSCON->OPT1 = (SYSCON->OPT1 & 0xfffffffc) | 0; /* 切换5.556MHZ */
    70be:	9339      	ld.w      	r1, (r3, 0x64)
    70c0:	3980      	bclri      	r1, 0
    70c2:	3981      	bclri      	r1, 1
    70c4:	b339      	st.w      	r1, (r3, 0x64)
	SYSCON->GCER |= 1 << 1;  /* 打开IMOSC */
    70c6:	9341      	ld.w      	r2, (r3, 0x4)
    70c8:	6c80      	or      	r2, r0
    70ca:	b341      	st.w      	r2, (r3, 0x4)
	while((SYSCON->CKST & 0x2) == 0);
    70cc:	3102      	movi      	r1, 2
    70ce:	9344      	ld.w      	r2, (r3, 0x10)
    70d0:	6884      	and      	r2, r1
    70d2:	3a40      	cmpnei      	r2, 0
    70d4:	0ffd      	bf      	0x70ce	// 70ce <ReduceSYSCLKto5556KHZ+0x4e>
	SYSCON->SCLKCR = 0xd22d << 16 ; /* 主时钟切换到IMOSC */
    70d6:	1052      	lrw      	r2, 0xd22d0000	// 711c <ReduceSYSCLKto5556KHZ+0x9c>
	while((SYSCON->CKST & 0x100) == 0);
    70d8:	3180      	movi      	r1, 128
	SYSCON->SCLKCR = 0xd22d << 16 ; /* 主时钟切换到IMOSC */
    70da:	b347      	st.w      	r2, (r3, 0x1c)
	while((SYSCON->CKST & 0x100) == 0);
    70dc:	4121      	lsli      	r1, r1, 1
    70de:	9344      	ld.w      	r2, (r3, 0x10)
    70e0:	6884      	and      	r2, r1
    70e2:	3a40      	cmpnei      	r2, 0
    70e4:	0ffd      	bf      	0x70de	// 70de <ReduceSYSCLKto5556KHZ+0x5e>
	SYSCON->PCLKCR = 0xc33c << 16;
    70e6:	104f      	lrw      	r2, 0xc33c0000	// 7120 <ReduceSYSCLKto5556KHZ+0xa0>
    70e8:	b348      	st.w      	r2, (r3, 0x20)
	SYSCON->GCDR |= 1 << 4; /* 关闭高速时钟 */
    70ea:	9342      	ld.w      	r2, (r3, 0x8)
    70ec:	3aa4      	bseti      	r2, 4
    70ee:	b342      	st.w      	r2, (r3, 0x8)
	while(SYSCON->GCSR & 0x10);
    70f0:	3110      	movi      	r1, 16
    70f2:	9343      	ld.w      	r2, (r3, 0xc)
    70f4:	6884      	and      	r2, r1
    70f6:	3a40      	cmpnei      	r2, 0
    70f8:	0bfd      	bt      	0x70f2	// 70f2 <ReduceSYSCLKto5556KHZ+0x72>
	Coret_DelayMs(20); /* 延时使系统稳定 */
    70fa:	3014      	movi      	r0, 20
    70fc:	3100      	movi      	r1, 0
    70fe:	e0000cef 	bsr      	0x8adc	// 8adc <Coret_DelayMs>
	CK_CPU_EnAllNormalIrq(); 
    7102:	e3fffd3f 	bsr      	0x6b80	// 6b80 <CK_CPU_EnAllNormalIrq>
}
    7106:	1490      	pop      	r15
    7108:	0054c720 	.long	0x0054c720
    710c:	20000000 	.long	0x20000000
    7110:	20000040 	.long	0x20000040
    7114:	2000003c 	.long	0x2000003c
    7118:	2000005c 	.long	0x2000005c
    711c:	d22d0000 	.long	0xd22d0000
    7120:	c33c0000 	.long	0xc33c0000

Disassembly of section .text.EXI1IntHandler:

00007124 <EXI1IntHandler>:

/* 不用编写中断服务函数，因为只用到中断唤醒CPU */
void EXI1IntHandler(void) 
{
    7124:	1460      	nie
    7126:	1462      	ipush
	if((SYSCON->EXIRS & EXI_PIN1) == EXI_PIN1) 
    7128:	1066      	lrw      	r3, 0x2000005c	// 7140 <EXI1IntHandler+0x1c>
    712a:	3102      	movi      	r1, 2
    712c:	9360      	ld.w      	r3, (r3, 0x0)
    712e:	237f      	addi      	r3, 128
    7130:	934c      	ld.w      	r2, (r3, 0x30)
    7132:	6884      	and      	r2, r1
    7134:	3a40      	cmpnei      	r2, 0
    7136:	0c02      	bf      	0x713a	// 713a <EXI1IntHandler+0x16>
	{
		SYSCON->EXICR = EXI_PIN1; /* 清除EXI1中断标志 */
    7138:	b32b      	st.w      	r1, (r3, 0x2c)
	}
}
    713a:	1463      	ipop
    713c:	1461      	nir
    713e:	0000      	bkpt
    7140:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXI4to8IntHandler:

00007144 <EXI4to8IntHandler>:

void EXI4to8IntHandler(void) 
{
    7144:	1460      	nie
    7146:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN4)==EXI_PIN4) 
    7148:	1072      	lrw      	r3, 0x2000005c	// 7190 <EXI4to8IntHandler+0x4c>
    714a:	3280      	movi      	r2, 128
    714c:	9360      	ld.w      	r3, (r3, 0x0)
    714e:	60c8      	addu      	r3, r2
    7150:	932c      	ld.w      	r1, (r3, 0x30)
    7152:	3010      	movi      	r0, 16
    7154:	6840      	and      	r1, r0
    7156:	3940      	cmpnei      	r1, 0
    7158:	0c04      	bf      	0x7160	// 7160 <EXI4to8IntHandler+0x1c>
	{
		SYSCON->EXICR = EXI_PIN5;
	} 
	else if ((SYSCON->EXIRS&EXI_PIN6)==EXI_PIN6) 
	{
		SYSCON->EXICR = EXI_PIN6;
    715a:	b30b      	st.w      	r0, (r3, 0x2c)
	else if ((SYSCON->EXIRS&EXI_PIN8)==EXI_PIN8) 
	{
		SYSCON->EXICR = EXI_PIN8;
	}

}
    715c:	1463      	ipop
    715e:	1461      	nir
	else if ((SYSCON->EXIRS&EXI_PIN5)==EXI_PIN5) 
    7160:	932c      	ld.w      	r1, (r3, 0x30)
    7162:	3020      	movi      	r0, 32
    7164:	6840      	and      	r1, r0
    7166:	3940      	cmpnei      	r1, 0
    7168:	0bf9      	bt      	0x715a	// 715a <EXI4to8IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN6)==EXI_PIN6) 
    716a:	932c      	ld.w      	r1, (r3, 0x30)
    716c:	3040      	movi      	r0, 64
    716e:	6840      	and      	r1, r0
    7170:	3940      	cmpnei      	r1, 0
    7172:	0bf4      	bt      	0x715a	// 715a <EXI4to8IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN7)==EXI_PIN7) 
    7174:	932c      	ld.w      	r1, (r3, 0x30)
    7176:	6848      	and      	r1, r2
    7178:	3940      	cmpnei      	r1, 0
    717a:	0c03      	bf      	0x7180	// 7180 <EXI4to8IntHandler+0x3c>
		SYSCON->EXICR = EXI_PIN8;
    717c:	b34b      	st.w      	r2, (r3, 0x2c)
}
    717e:	07ef      	br      	0x715c	// 715c <EXI4to8IntHandler+0x18>
	else if ((SYSCON->EXIRS&EXI_PIN8)==EXI_PIN8) 
    7180:	3280      	movi      	r2, 128
    7182:	932c      	ld.w      	r1, (r3, 0x30)
    7184:	4241      	lsli      	r2, r2, 1
    7186:	6848      	and      	r1, r2
    7188:	3940      	cmpnei      	r1, 0
    718a:	0bf9      	bt      	0x717c	// 717c <EXI4to8IntHandler+0x38>
    718c:	07e8      	br      	0x715c	// 715c <EXI4to8IntHandler+0x18>
    718e:	0000      	bkpt
    7190:	2000005c 	.long	0x2000005c

Disassembly of section .text.UART2IntHandler:

00007194 <UART2IntHandler>:
const char bt_pairing[] = 	 {0xF1, 0x07, 0x14, '\0'};
const char factory_reset[] = {0xF1, 0x02, 0x0F, '\0'};
const char freeman_mode[] =  {0xF1, 0x06, 0x13, '\0'};

void UART2IntHandler(void) 
{
    7194:	1460      	nie
    7196:	1462      	ipush
    7198:	14d4      	push      	r4-r7, r15
    719a:	1421      	subi      	r14, r14, 4
    // ISR content ...
	//Interupt
	if ((UART2->ISR&UART_RX_INT_S)==UART_RX_INT_S)
    719c:	116f      	lrw      	r3, 0x2000003c	// 7258 <UART2IntHandler+0xc4>
    719e:	3102      	movi      	r1, 2
    71a0:	9340      	ld.w      	r2, (r3, 0x0)
    71a2:	9263      	ld.w      	r3, (r2, 0xc)
    71a4:	68c4      	and      	r3, r1
    71a6:	3b40      	cmpnei      	r3, 0
    71a8:	0c41      	bf      	0x722a	// 722a <UART2IntHandler+0x96>
	{
		UART2->ISR=UART_RX_INT_S;
    71aa:	b223      	st.w      	r1, (r2, 0xc)
		static U8_T buff_index = 0;
		static U8_T col_offset = 0;
		
		buff_index = (U32_T)(uart2_que.ptail - uart2_que.buffer) / sizeof(uart2_que.buffer[0]);
		
		if((UART2->SR & (1 << 1)) != 0) // 接收缓冲区不为空
    71ac:	9261      	ld.w      	r3, (r2, 0x4)
    71ae:	68c4      	and      	r3, r1
    71b0:	3b40      	cmpnei      	r3, 0
    71b2:	0c32      	bf      	0x7216	// 7216 <UART2IntHandler+0x82>
		buff_index = (U32_T)(uart2_que.ptail - uart2_que.buffer) / sizeof(uart2_que.buffer[0]);
    71b4:	11aa      	lrw      	r5, 0x20000068	// 725c <UART2IntHandler+0xc8>
		{
			(*uart2_que.ptail)[col_offset++] = UART2->DATA;
    71b6:	118b      	lrw      	r4, 0x2000026c	// 7260 <UART2IntHandler+0xcc>
    71b8:	84c0      	ld.b      	r6, (r4, 0x0)
		buff_index = (U32_T)(uart2_que.ptail - uart2_que.buffer) / sizeof(uart2_que.buffer[0]);
    71ba:	9501      	ld.w      	r0, (r5, 0x4)
			(*uart2_que.ptail)[col_offset++] = UART2->DATA;
    71bc:	5ee2      	addi      	r7, r6, 1
    71be:	9260      	ld.w      	r3, (r2, 0x0)
    71c0:	6180      	addu      	r6, r0
    71c2:	a660      	st.b      	r3, (r6, 0x0)
    71c4:	75dc      	zextb      	r7, r7

			if((*uart2_que.ptail)[col_offset - 1] == 0x0A) //回车符
    71c6:	95c1      	ld.w      	r6, (r5, 0x4)
    71c8:	5e7c      	addu      	r3, r6, r7
    71ca:	2b00      	subi      	r3, 1
    71cc:	8360      	ld.b      	r3, (r3, 0x0)
    71ce:	3b4a      	cmpnei      	r3, 10
			(*uart2_que.ptail)[col_offset++] = UART2->DATA;
    71d0:	a4e0      	st.b      	r7, (r4, 0x0)
			if((*uart2_que.ptail)[col_offset - 1] == 0x0A) //回车符
    71d2:	081d      	bt      	0x720c	// 720c <UART2IntHandler+0x78>
		buff_index = (U32_T)(uart2_que.ptail - uart2_que.buffer) / sizeof(uart2_que.buffer[0]);
    71d4:	5d5e      	addi      	r2, r5, 8
    71d6:	5829      	subu      	r1, r0, r2
    71d8:	4164      	lsli      	r3, r1, 4
    71da:	60c6      	subu      	r3, r1
    71dc:	4308      	lsli      	r0, r3, 8
    71de:	60c0      	addu      	r3, r0
    71e0:	4310      	lsli      	r0, r3, 16
    71e2:	600c      	addu      	r0, r3
    71e4:	4004      	lsli      	r0, r0, 4
    71e6:	6004      	addu      	r0, r1
    71e8:	3111      	movi      	r1, 17
    71ea:	b840      	st.w      	r2, (r14, 0x0)
    71ec:	e3fffc94 	bsr      	0x6b14	// 6b14 <__udivsi3>
			{
				uart2_que.data_lenth[buff_index] = col_offset;
				col_offset = 0;
    71f0:	3300      	movi      	r3, 0
				uart2_que.data_lenth[buff_index] = col_offset;
    71f2:	7400      	zextb      	r0, r0
				col_offset = 0;
    71f4:	a460      	st.b      	r3, (r4, 0x0)
				uart2_que.ptail++; // 准备下次数据接收
				/* 防止溢栈，从头接收 */
				if(uart2_que.ptail == uart2_que.buffer + BUFFER_NUMBER) uart2_que.ptail = uart2_que.buffer;
    71f6:	335d      	movi      	r3, 93
				uart2_que.ptail++; // 准备下次数据接收
    71f8:	2610      	addi      	r6, 17
				uart2_que.data_lenth[buff_index] = col_offset;
    71fa:	6014      	addu      	r0, r5
				if(uart2_que.ptail == uart2_que.buffer + BUFFER_NUMBER) uart2_que.ptail = uart2_que.buffer;
    71fc:	60d4      	addu      	r3, r5
				uart2_que.data_lenth[buff_index] = col_offset;
    71fe:	206d      	addi      	r0, 110
				if(uart2_que.ptail == uart2_que.buffer + BUFFER_NUMBER) uart2_que.ptail = uart2_que.buffer;
    7200:	64da      	cmpne      	r6, r3
				uart2_que.data_lenth[buff_index] = col_offset;
    7202:	a0e0      	st.b      	r7, (r0, 0x0)
				uart2_que.ptail++; // 准备下次数据接收
    7204:	b5c1      	st.w      	r6, (r5, 0x4)
				if(uart2_que.ptail == uart2_que.buffer + BUFFER_NUMBER) uart2_que.ptail = uart2_que.buffer;
    7206:	9840      	ld.w      	r2, (r14, 0x0)
    7208:	0807      	bt      	0x7216	// 7216 <UART2IntHandler+0x82>
    720a:	b541      	st.w      	r2, (r5, 0x4)
			}
			
			if(col_offset >= BUFFER_SIZE) col_offset = 0; /* 防止溢栈，从头接收 */
    720c:	8460      	ld.b      	r3, (r4, 0x0)
    720e:	3b0f      	cmphsi      	r3, 16
    7210:	0c03      	bf      	0x7216	// 7216 <UART2IntHandler+0x82>
    7212:	3300      	movi      	r3, 0
    7214:	a460      	st.b      	r3, (r4, 0x0)
	}
	else if ((UART2->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)
	{
		UART2->ISR=UART_TX_IOV_S;
	}
}
    7216:	1401      	addi      	r14, r14, 4
    7218:	d9ee2004 	ld.w      	r15, (r14, 0x10)
    721c:	98e3      	ld.w      	r7, (r14, 0xc)
    721e:	98c2      	ld.w      	r6, (r14, 0x8)
    7220:	98a1      	ld.w      	r5, (r14, 0x4)
    7222:	9880      	ld.w      	r4, (r14, 0x0)
    7224:	1405      	addi      	r14, r14, 20
    7226:	1463      	ipop
    7228:	1461      	nir
	else if( (UART2->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 
    722a:	9263      	ld.w      	r3, (r2, 0xc)
    722c:	3101      	movi      	r1, 1
    722e:	68c4      	and      	r3, r1
    7230:	3b40      	cmpnei      	r3, 0
    7232:	0c06      	bf      	0x723e	// 723e <UART2IntHandler+0xaa>
		UART2->ISR=UART_TX_INT_S;
    7234:	b223      	st.w      	r1, (r2, 0xc)
		TxDataFlag = TRUE;
    7236:	3201      	movi      	r2, 1
    7238:	106b      	lrw      	r3, 0x20000235	// 7264 <UART2IntHandler+0xd0>
    723a:	a340      	st.b      	r2, (r3, 0x0)
    723c:	07ed      	br      	0x7216	// 7216 <UART2IntHandler+0x82>
	else if ((UART2->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)
    723e:	9263      	ld.w      	r3, (r2, 0xc)
    7240:	3108      	movi      	r1, 8
    7242:	68c4      	and      	r3, r1
    7244:	3b40      	cmpnei      	r3, 0
    7246:	0c03      	bf      	0x724c	// 724c <UART2IntHandler+0xb8>
		UART2->ISR=UART_TX_IOV_S;
    7248:	b223      	st.w      	r1, (r2, 0xc)
}
    724a:	07e6      	br      	0x7216	// 7216 <UART2IntHandler+0x82>
	else if ((UART2->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)
    724c:	9263      	ld.w      	r3, (r2, 0xc)
    724e:	3104      	movi      	r1, 4
    7250:	68c4      	and      	r3, r1
    7252:	3b40      	cmpnei      	r3, 0
    7254:	0bfa      	bt      	0x7248	// 7248 <UART2IntHandler+0xb4>
    7256:	07e0      	br      	0x7216	// 7216 <UART2IntHandler+0x82>
    7258:	2000003c 	.long	0x2000003c
    725c:	20000068 	.long	0x20000068
    7260:	2000026c 	.long	0x2000026c
    7264:	20000235 	.long	0x20000235

Disassembly of section .text.handle_uart2_recv_data:

00007268 <handle_uart2_recv_data>:

S8_T handle_uart2_recv_data(void)
{
    7268:	14d4      	push      	r4-r7, r15
    726a:	1421      	subi      	r14, r14, 4
	U8_T buff_index = 0;
	U8_T col_offset = 0;
	U8_T temp = 0;

	if(uart2_que.phead != uart2_que.ptail)
    726c:	109b      	lrw      	r4, 0x20000068	// 72d8 <handle_uart2_recv_data+0x70>
    726e:	9461      	ld.w      	r3, (r4, 0x4)
    7270:	9400      	ld.w      	r0, (r4, 0x0)
    7272:	64c2      	cmpne      	r0, r3
    7274:	0c23      	bf      	0x72ba	// 72ba <handle_uart2_recv_data+0x52>
	{		
		buff_index = (U32_T)(uart2_que.phead - uart2_que.buffer) / sizeof(uart2_que.buffer[0]);
    7276:	5cbe      	addi      	r5, r4, 8
    7278:	5855      	subu      	r2, r0, r5
    727a:	4264      	lsli      	r3, r2, 4
    727c:	60ca      	subu      	r3, r2
    727e:	4308      	lsli      	r0, r3, 8
    7280:	60c0      	addu      	r3, r0
    7282:	4310      	lsli      	r0, r3, 16
    7284:	600c      	addu      	r0, r3
    7286:	4004      	lsli      	r0, r0, 4
    7288:	6008      	addu      	r0, r2
    728a:	3111      	movi      	r1, 17
    728c:	e3fffc44 	bsr      	0x6b14	// 6b14 <__udivsi3>
				break;
			}
		}
		*/
		
		for(col_offset = 0; col_offset < uart2_que.data_lenth[buff_index]; col_offset++)
    7290:	75c0      	zextb      	r7, r0
    7292:	3600      	movi      	r6, 0
    7294:	61d0      	addu      	r7, r4
    7296:	336e      	movi      	r3, 110
    7298:	60dc      	addu      	r3, r7
    729a:	8340      	ld.b      	r2, (r3, 0x0)
    729c:	6498      	cmphs      	r6, r2
    729e:	0c11      	bf      	0x72c0	// 72c0 <handle_uart2_recv_data+0x58>
		{
			printf("0x%X ", (*uart2_que.phead)[col_offset]);
		}
		printf("\r\n");
    72a0:	100f      	lrw      	r0, 0x92df	// 72dc <handle_uart2_recv_data+0x74>
    72a2:	b860      	st.w      	r3, (r14, 0x0)
    72a4:	e3ffe338 	bsr      	0x3914	// 3914 <__GI_puts>

		uart2_que.data_lenth[buff_index] = 0;
    72a8:	3200      	movi      	r2, 0
    72aa:	9860      	ld.w      	r3, (r14, 0x0)
    72ac:	a340      	st.b      	r2, (r3, 0x0)
		uart2_que.phead++; /* 准备下次数据处理 */
    72ae:	9460      	ld.w      	r3, (r4, 0x0)
    72b0:	2310      	addi      	r3, 17
	    /* 防止溢栈，从头处理 */
		if(uart2_que.phead == uart2_que.buffer + BUFFER_NUMBER) uart2_que.phead = uart2_que.buffer;
    72b2:	104c      	lrw      	r2, 0x200000c5	// 72e0 <handle_uart2_recv_data+0x78>
    72b4:	648e      	cmpne      	r3, r2
    72b6:	0c0e      	bf      	0x72d2	// 72d2 <handle_uart2_recv_data+0x6a>
		uart2_que.phead++; /* 准备下次数据处理 */
    72b8:	b460      	st.w      	r3, (r4, 0x0)
	}

	return 0;
}
    72ba:	3000      	movi      	r0, 0
    72bc:	1401      	addi      	r14, r14, 4
    72be:	1494      	pop      	r4-r7, r15
			printf("0x%X ", (*uart2_que.phead)[col_offset]);
    72c0:	9460      	ld.w      	r3, (r4, 0x0)
    72c2:	60d8      	addu      	r3, r6
    72c4:	8320      	ld.b      	r1, (r3, 0x0)
    72c6:	1008      	lrw      	r0, 0x90c8	// 72e4 <handle_uart2_recv_data+0x7c>
		for(col_offset = 0; col_offset < uart2_que.data_lenth[buff_index]; col_offset++)
    72c8:	2600      	addi      	r6, 1
			printf("0x%X ", (*uart2_que.phead)[col_offset]);
    72ca:	e3ffe313 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
		for(col_offset = 0; col_offset < uart2_que.data_lenth[buff_index]; col_offset++)
    72ce:	7598      	zextb      	r6, r6
    72d0:	07e3      	br      	0x7296	// 7296 <handle_uart2_recv_data+0x2e>
		if(uart2_que.phead == uart2_que.buffer + BUFFER_NUMBER) uart2_que.phead = uart2_que.buffer;
    72d2:	b4a0      	st.w      	r5, (r4, 0x0)
    72d4:	07f3      	br      	0x72ba	// 72ba <handle_uart2_recv_data+0x52>
    72d6:	0000      	bkpt
    72d8:	20000068 	.long	0x20000068
    72dc:	000092df 	.long	0x000092df
    72e0:	200000c5 	.long	0x200000c5
    72e4:	000090c8 	.long	0x000090c8

Disassembly of section .text.IO_port_analog_uart_send_data:

000072e8 <IO_port_analog_uart_send_data>:

S8_T IO_port_analog_uart_send_data(const char *data)
{
    72e8:	14d2      	push      	r4-r5, r15
    72ea:	6d43      	mov      	r5, r0
	U16_T data_length = strlen(data);
    72ec:	e3ffe3b2 	bsr      	0x3a50	// 3a50 <__strlen_fast>
    72f0:	7501      	zexth      	r4, r0
	U8_T i, j;

	//发码前先拉高RX电平
	pogo_pin_output_contrl(APP_OUTPUT_TYPE_SENDDATA);
    72f2:	3001      	movi      	r0, 1
    72f4:	e00001d6 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
		}
		uart_TX_high;
		Coret_DelayUs(BIT_WIDTH_US);
		
		#else
		while((UART2->SR & 0X1) != 0);
    72f8:	106b      	lrw      	r3, 0x2000003c	// 7324 <IO_port_analog_uart_send_data+0x3c>
    72fa:	3001      	movi      	r0, 1
    72fc:	9320      	ld.w      	r1, (r3, 0x0)
	for(i = 0; i < data_length; i++)
    72fe:	3300      	movi      	r3, 0
    7300:	650c      	cmphs      	r3, r4
    7302:	0c06      	bf      	0x730e	// 730e <IO_port_analog_uart_send_data+0x26>
		UART2->DATA = data[i];
		#endif
	}

	//发码后恢复RX输入功能
	pogo_pin_output_contrl(APP_OUTPUT_TYPE_REVDATA);
    7304:	3002      	movi      	r0, 2
    7306:	e00001cd 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
	//CK_CPU_EnAllNormalIrq();
	return 0;
}
    730a:	3000      	movi      	r0, 0
    730c:	1492      	pop      	r4-r5, r15
		while((UART2->SR & 0X1) != 0);
    730e:	9141      	ld.w      	r2, (r1, 0x4)
    7310:	6880      	and      	r2, r0
    7312:	3a40      	cmpnei      	r2, 0
    7314:	0bfd      	bt      	0x730e	// 730e <IO_port_analog_uart_send_data+0x26>
		UART2->DATA = data[i];
    7316:	5d4c      	addu      	r2, r5, r3
    7318:	8240      	ld.b      	r2, (r2, 0x0)
	for(i = 0; i < data_length; i++)
    731a:	2300      	addi      	r3, 1
		UART2->DATA = data[i];
    731c:	b140      	st.w      	r2, (r1, 0x0)
	for(i = 0; i < data_length; i++)
    731e:	74cc      	zextb      	r3, r3
    7320:	07f0      	br      	0x7300	// 7300 <IO_port_analog_uart_send_data+0x18>
    7322:	0000      	bkpt
    7324:	2000003c 	.long	0x2000003c

Disassembly of section .text.send_communicate_event:

00007328 <send_communicate_event>:

S8_T send_communicate_event(enum COMMUNICATE_EVENT_T event)
{
	*com_que.ptail = event;
    7328:	1067      	lrw      	r3, 0x200000dc	// 7344 <send_communicate_event+0x1c>

	if(com_que.ptail == com_que.com_event + COM_QUE_SIZE - 1) {
    732a:	3110      	movi      	r1, 16
	*com_que.ptail = event;
    732c:	9346      	ld.w      	r2, (r3, 0x18)
	if(com_que.ptail == com_que.com_event + COM_QUE_SIZE - 1) {
    732e:	604c      	addu      	r1, r3
    7330:	644a      	cmpne      	r2, r1
	*com_que.ptail = event;
    7332:	b200      	st.w      	r0, (r2, 0x0)
	if(com_que.ptail == com_que.com_event + COM_QUE_SIZE - 1) {
    7334:	0804      	bt      	0x733c	// 733c <send_communicate_event+0x14>
		com_que.ptail = com_que.com_event;
    7336:	b366      	st.w      	r3, (r3, 0x18)
	} else{
		com_que.ptail++;
	}
	
	return 0;
}
    7338:	3000      	movi      	r0, 0
    733a:	783c      	jmp      	r15
		com_que.ptail++;
    733c:	2203      	addi      	r2, 4
    733e:	b346      	st.w      	r2, (r3, 0x18)
    7340:	07fc      	br      	0x7338	// 7338 <send_communicate_event+0x10>
    7342:	0000      	bkpt
    7344:	200000dc 	.long	0x200000dc

Disassembly of section .text.communicate_event_get:

00007348 <communicate_event_get>:

S8_T communicate_event_get(enum COMMUNICATE_EVENT_T *pevent)
{
	if(com_que.phead != com_que.ptail) {
    7348:	106a      	lrw      	r3, 0x200000dc	// 7370 <communicate_event_get+0x28>
    734a:	9345      	ld.w      	r2, (r3, 0x14)
    734c:	9326      	ld.w      	r1, (r3, 0x18)
    734e:	644a      	cmpne      	r2, r1
    7350:	0c0d      	bf      	0x736a	// 736a <communicate_event_get+0x22>
		*pevent = *com_que.phead;
    7352:	9220      	ld.w      	r1, (r2, 0x0)
    7354:	b020      	st.w      	r1, (r0, 0x0)
		if(com_que.phead == com_que.com_event + COM_QUE_SIZE - 1) {
    7356:	3110      	movi      	r1, 16
    7358:	604c      	addu      	r1, r3
    735a:	644a      	cmpne      	r2, r1
    735c:	0804      	bt      	0x7364	// 7364 <communicate_event_get+0x1c>
			com_que.phead = com_que.com_event;
    735e:	b365      	st.w      	r3, (r3, 0x14)
		} else{
			com_que.phead++;
		}
		return 0;
    7360:	3000      	movi      	r0, 0
	}
	return -1;
}
    7362:	783c      	jmp      	r15
			com_que.phead++;
    7364:	2203      	addi      	r2, 4
    7366:	b345      	st.w      	r2, (r3, 0x14)
    7368:	07fc      	br      	0x7360	// 7360 <communicate_event_get+0x18>
	return -1;
    736a:	3000      	movi      	r0, 0
    736c:	2800      	subi      	r0, 1
    736e:	07fa      	br      	0x7362	// 7362 <communicate_event_get+0x1a>
    7370:	200000dc 	.long	0x200000dc

Disassembly of section .text.communicate_process_handle:

00007374 <communicate_process_handle>:

S8_T communicate_process_handle(void)
{
    7374:	14d2      	push      	r4-r5, r15
	static U8_T comt_status = 0; //0：通信结束，1: 开始通信，2：通信中
	static enum COMMUNICATE_EVENT_T event = COMMUNICATE_EVENT_NONE;

	switch(comt_status)
    7376:	118d      	lrw      	r4, 0x2000026c	// 7428 <communicate_process_handle+0xb4>
    7378:	8461      	ld.b      	r3, (r4, 0x1)
    737a:	3b41      	cmpnei      	r3, 1
    737c:	6d53      	mov      	r5, r4
    737e:	0c22      	bf      	0x73c2	// 73c2 <communicate_process_handle+0x4e>
    7380:	3b40      	cmpnei      	r3, 0
    7382:	0c05      	bf      	0x738c	// 738c <communicate_process_handle+0x18>
    7384:	3b42      	cmpnei      	r3, 2
    7386:	0c22      	bf      	0x73ca	// 73ca <communicate_process_handle+0x56>
			
		default:
			break;	
	}
	
	return 0;
    7388:	3000      	movi      	r0, 0
}
    738a:	1492      	pop      	r4-r5, r15
			if(communicate_event_get(&event) == -1) return -1;
    738c:	5c0e      	addi      	r0, r4, 4
    738e:	e3ffffdd 	bsr      	0x7348	// 7348 <communicate_event_get>
    7392:	3300      	movi      	r3, 0
    7394:	2b00      	subi      	r3, 1
    7396:	64c2      	cmpne      	r0, r3
    7398:	0ff9      	bf      	0x738a	// 738a <communicate_process_handle+0x16>
			if(battery_status != APP_BATTERY_STATUS_NTC_ERROR && hall_status == APP_HALL_STATUS_OPEN_BOX && earphone_status != APP_EARPHONE_STATUS_OVER_CURRENT) {
    739a:	1165      	lrw      	r3, 0x200001a4	// 742c <communicate_process_handle+0xb8>
    739c:	9360      	ld.w      	r3, (r3, 0x0)
    739e:	3b43      	cmpnei      	r3, 3
    73a0:	0ff4      	bf      	0x7388	// 7388 <communicate_process_handle+0x14>
    73a2:	1164      	lrw      	r3, 0x200001b8	// 7430 <communicate_process_handle+0xbc>
    73a4:	9360      	ld.w      	r3, (r3, 0x0)
    73a6:	3b40      	cmpnei      	r3, 0
    73a8:	0bf0      	bt      	0x7388	// 7388 <communicate_process_handle+0x14>
    73aa:	1163      	lrw      	r3, 0x200001a0	// 7434 <communicate_process_handle+0xc0>
    73ac:	9360      	ld.w      	r3, (r3, 0x0)
    73ae:	3b43      	cmpnei      	r3, 3
    73b0:	0fec      	bf      	0x7388	// 7388 <communicate_process_handle+0x14>
				comt_status = 1;
    73b2:	3301      	movi      	r3, 1
    73b4:	a461      	st.b      	r3, (r4, 0x1)
				printf("%s: %d\r\n", __func__, event);
    73b6:	9441      	ld.w      	r2, (r4, 0x4)
    73b8:	1120      	lrw      	r1, 0x8ba0	// 7438 <communicate_process_handle+0xc4>
    73ba:	1101      	lrw      	r0, 0x90ce	// 743c <communicate_process_handle+0xc8>
    73bc:	e3ffe29a 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
    73c0:	07e4      	br      	0x7388	// 7388 <communicate_process_handle+0x14>
			if(hall_status == APP_HALL_STATUS_CLOSE_BOX) 
    73c2:	107c      	lrw      	r3, 0x200001b8	// 7430 <communicate_process_handle+0xbc>
    73c4:	9360      	ld.w      	r3, (r3, 0x0)
    73c6:	3b41      	cmpnei      	r3, 1
    73c8:	0804      	bt      	0x73d0	// 73d0 <communicate_process_handle+0x5c>
			comt_status = 0;
    73ca:	3300      	movi      	r3, 0
    73cc:	a461      	st.b      	r3, (r4, 0x1)
    73ce:	07dd      	br      	0x7388	// 7388 <communicate_process_handle+0x14>
			switch(event)
    73d0:	9401      	ld.w      	r0, (r4, 0x4)
    73d2:	2800      	subi      	r0, 1
    73d4:	3803      	cmphsi      	r0, 4
    73d6:	0813      	bt      	0x73fc	// 73fc <communicate_process_handle+0x88>
    73d8:	e3ffd6ec 	bsr      	0x21b0	// 21b0 <___gnu_csky_case_uqi>
    73dc:	1c130d02 	.long	0x1c130d02
					IO_port_analog_uart_send_data(ptp_pairing);
    73e0:	1018      	lrw      	r0, 0x8bbb	// 7440 <communicate_process_handle+0xcc>
    73e2:	e3ffff83 	bsr      	0x72e8	// 72e8 <IO_port_analog_uart_send_data>
					if(battery_status == APP_BATTERY_STATUS_NORMAL) {
    73e6:	1072      	lrw      	r3, 0x200001a4	// 742c <communicate_process_handle+0xb8>
    73e8:	9360      	ld.w      	r3, (r3, 0x0)
    73ea:	3b40      	cmpnei      	r3, 0
    73ec:	0808      	bt      	0x73fc	// 73fc <communicate_process_handle+0x88>
						app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_PTP_PAIR);
    73ee:	300b      	movi      	r0, 11
						app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_FREEMAN);
    73f0:	e00009a6 	bsr      	0x873c	// 873c <app_status_indication_set>
    73f4:	0404      	br      	0x73fc	// 73fc <communicate_process_handle+0x88>
					IO_port_analog_uart_send_data(bt_pairing);
    73f6:	1014      	lrw      	r0, 0x8bbf	// 7444 <communicate_process_handle+0xd0>
    73f8:	e3ffff78 	bsr      	0x72e8	// 72e8 <IO_port_analog_uart_send_data>
			comt_status = 2;
    73fc:	3302      	movi      	r3, 2
    73fe:	a561      	st.b      	r3, (r5, 0x1)
    7400:	07c4      	br      	0x7388	// 7388 <communicate_process_handle+0x14>
					IO_port_analog_uart_send_data(factory_reset);
    7402:	1012      	lrw      	r0, 0x8bc3	// 7448 <communicate_process_handle+0xd4>
    7404:	e3ffff72 	bsr      	0x72e8	// 72e8 <IO_port_analog_uart_send_data>
					if(battery_status == APP_BATTERY_STATUS_NORMAL) {
    7408:	1069      	lrw      	r3, 0x200001a4	// 742c <communicate_process_handle+0xb8>
    740a:	9360      	ld.w      	r3, (r3, 0x0)
    740c:	3b40      	cmpnei      	r3, 0
    740e:	0bf7      	bt      	0x73fc	// 73fc <communicate_process_handle+0x88>
						app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_RESET);
    7410:	300d      	movi      	r0, 13
    7412:	07ef      	br      	0x73f0	// 73f0 <communicate_process_handle+0x7c>
					IO_port_analog_uart_send_data(freeman_mode);
    7414:	100e      	lrw      	r0, 0x8bc7	// 744c <communicate_process_handle+0xd8>
    7416:	e3ffff69 	bsr      	0x72e8	// 72e8 <IO_port_analog_uart_send_data>
					if(battery_status == APP_BATTERY_STATUS_NORMAL) {
    741a:	1065      	lrw      	r3, 0x200001a4	// 742c <communicate_process_handle+0xb8>
    741c:	9360      	ld.w      	r3, (r3, 0x0)
    741e:	3b40      	cmpnei      	r3, 0
    7420:	0bee      	bt      	0x73fc	// 73fc <communicate_process_handle+0x88>
						app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_FREEMAN);
    7422:	300e      	movi      	r0, 14
    7424:	07e6      	br      	0x73f0	// 73f0 <communicate_process_handle+0x7c>
    7426:	0000      	bkpt
    7428:	2000026c 	.long	0x2000026c
    742c:	200001a4 	.long	0x200001a4
    7430:	200001b8 	.long	0x200001b8
    7434:	200001a0 	.long	0x200001a0
    7438:	00008ba0 	.long	0x00008ba0
    743c:	000090ce 	.long	0x000090ce
    7440:	00008bbb 	.long	0x00008bbb
    7444:	00008bbf 	.long	0x00008bbf
    7448:	00008bc3 	.long	0x00008bc3
    744c:	00008bc7 	.long	0x00008bc7

Disassembly of section .text.pwr_key_handle:

00007450 <pwr_key_handle>:

S8_T pwr_key_handle(enum KEY_CODE_T code, enum KEY_EVENT_T event)
{
    7450:	14d1      	push      	r4, r15
    7452:	6c83      	mov      	r2, r0
    7454:	6d07      	mov      	r4, r1
	printf("%s: %d %d\r\n", __func__, code, event);
    7456:	6cc7      	mov      	r3, r1
    7458:	100f      	lrw      	r0, 0x90d7	// 7494 <pwr_key_handle+0x44>
    745a:	1030      	lrw      	r1, 0x8bcb	// 7498 <pwr_key_handle+0x48>
    745c:	e3ffe24a 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
	switch(event)
    7460:	5c0f      	subi      	r0, r4, 4
    7462:	3805      	cmphsi      	r0, 6
    7464:	0811      	bt      	0x7486	// 7486 <pwr_key_handle+0x36>
    7466:	e3ffd6a5 	bsr      	0x21b0	// 21b0 <___gnu_csky_case_uqi>
    746a:	0e03      	.short	0x0e03
    746c:	1012070e 	.long	0x1012070e
	{
		case KEY_EVENT_TRIPLECLICK:
			send_communicate_event(COMMUNICATE_EVENT_PTP_PAIR);
    7470:	3001      	movi      	r0, 1
			send_communicate_event(COMMUNICATE_EVENT_BT_PAIR);
			break;

		case KEY_EVENT_LLONGPRESS:

			send_communicate_event(COMMUNICATE_EVENT_FACTORY_RESET);
    7472:	e3ffff5b 	bsr      	0x7328	// 7328 <send_communicate_event>
			break;
    7476:	0408      	br      	0x7486	// 7486 <pwr_key_handle+0x36>
			if(battery_status == APP_BATTERY_STATUS_NORMAL) {
    7478:	1069      	lrw      	r3, 0x200001a4	// 749c <pwr_key_handle+0x4c>
    747a:	9360      	ld.w      	r3, (r3, 0x0)
    747c:	3b40      	cmpnei      	r3, 0
    747e:	0804      	bt      	0x7486	// 7486 <pwr_key_handle+0x36>
				app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_BT_PAIR);
    7480:	300c      	movi      	r0, 12
    7482:	e000095d 	bsr      	0x873c	// 873c <app_status_indication_set>
		default:
			break;

	}
	return 0;
}
    7486:	3000      	movi      	r0, 0
    7488:	1491      	pop      	r4, r15
			send_communicate_event(COMMUNICATE_EVENT_BT_PAIR);
    748a:	3002      	movi      	r0, 2
    748c:	07f3      	br      	0x7472	// 7472 <pwr_key_handle+0x22>
			send_communicate_event(COMMUNICATE_EVENT_FACTORY_RESET);
    748e:	3003      	movi      	r0, 3
    7490:	07f1      	br      	0x7472	// 7472 <pwr_key_handle+0x22>
    7492:	0000      	bkpt
    7494:	000090d7 	.long	0x000090d7
    7498:	00008bcb 	.long	0x00008bcb
    749c:	200001a4 	.long	0x200001a4

Disassembly of section .text.send_key_event:

000074a0 <send_key_event>:

S8_T send_key_event(enum KEY_CODE_T code, enum KEY_EVENT_T event)
{
	key_que.ptail->code = code;
    74a0:	1047      	lrw      	r2, 0x200000f8	// 74bc <send_key_event+0x1c>
    74a2:	926b      	ld.w      	r3, (r2, 0x2c)
	key_que.ptail->event = event;
    74a4:	b321      	st.w      	r1, (r3, 0x4)

	if(key_que.ptail == key_que.key_status + KEY_QUE_SIZE - 1) {
    74a6:	3120      	movi      	r1, 32
    74a8:	6048      	addu      	r1, r2
    74aa:	644e      	cmpne      	r3, r1
	key_que.ptail->code = code;
    74ac:	b300      	st.w      	r0, (r3, 0x0)
	if(key_que.ptail == key_que.key_status + KEY_QUE_SIZE - 1) {
    74ae:	0804      	bt      	0x74b6	// 74b6 <send_key_event+0x16>
		key_que.ptail = key_que.key_status;
    74b0:	b24b      	st.w      	r2, (r2, 0x2c)
	} else{
		key_que.ptail++;
	}
	
	return 0;
}
    74b2:	3000      	movi      	r0, 0
    74b4:	783c      	jmp      	r15
		key_que.ptail++;
    74b6:	2307      	addi      	r3, 8
    74b8:	b26b      	st.w      	r3, (r2, 0x2c)
    74ba:	07fc      	br      	0x74b2	// 74b2 <send_key_event+0x12>
    74bc:	200000f8 	.long	0x200000f8

Disassembly of section .text.key_event_get:

000074c0 <key_event_get>:

S8_T key_event_get(struct KEY_STATUS_T *pkey_status)
{
	if(key_que.phead != key_que.ptail) {
    74c0:	104b      	lrw      	r2, 0x200000f8	// 74ec <key_event_get+0x2c>
    74c2:	926a      	ld.w      	r3, (r2, 0x28)
    74c4:	922b      	ld.w      	r1, (r2, 0x2c)
    74c6:	644e      	cmpne      	r3, r1
    74c8:	0c0f      	bf      	0x74e6	// 74e6 <key_event_get+0x26>
		pkey_status->code = key_que.phead->code;
    74ca:	9320      	ld.w      	r1, (r3, 0x0)
    74cc:	b020      	st.w      	r1, (r0, 0x0)
		pkey_status->event = key_que.phead->event;
    74ce:	9321      	ld.w      	r1, (r3, 0x4)
    74d0:	b021      	st.w      	r1, (r0, 0x4)
		
		if(key_que.phead == key_que.key_status + KEY_QUE_SIZE - 1) {
    74d2:	3120      	movi      	r1, 32
    74d4:	6048      	addu      	r1, r2
    74d6:	644e      	cmpne      	r3, r1
    74d8:	0804      	bt      	0x74e0	// 74e0 <key_event_get+0x20>
			key_que.phead = key_que.key_status;
    74da:	b24a      	st.w      	r2, (r2, 0x28)
		} else{
			key_que.phead++;
		}
		return 0;
    74dc:	3000      	movi      	r0, 0
	}
	return -1;
}
    74de:	783c      	jmp      	r15
			key_que.phead++;
    74e0:	2307      	addi      	r3, 8
    74e2:	b26a      	st.w      	r3, (r2, 0x28)
    74e4:	07fc      	br      	0x74dc	// 74dc <key_event_get+0x1c>
	return -1;
    74e6:	3000      	movi      	r0, 0
    74e8:	2800      	subi      	r0, 1
    74ea:	07fa      	br      	0x74de	// 74de <key_event_get+0x1e>
    74ec:	200000f8 	.long	0x200000f8

Disassembly of section .text.app_key_event_handle:

000074f0 <app_key_event_handle>:

S8_T app_key_event_handle(void)
{
    74f0:	14d0      	push      	r15
    74f2:	1422      	subi      	r14, r14, 8
	struct KEY_STATUS_T key_status;
	
	if(key_event_get(&key_status) == -1) return -1; 
    74f4:	6c3b      	mov      	r0, r14
    74f6:	e3ffffe5 	bsr      	0x74c0	// 74c0 <key_event_get>
    74fa:	3300      	movi      	r3, 0
    74fc:	2b00      	subi      	r3, 1
    74fe:	64c2      	cmpne      	r0, r3
    7500:	0c09      	bf      	0x7512	// 7512 <app_key_event_handle+0x22>
	
	switch(key_status.code)
    7502:	9860      	ld.w      	r3, (r14, 0x0)
    7504:	3b41      	cmpnei      	r3, 1
    7506:	0805      	bt      	0x7510	// 7510 <app_key_event_handle+0x20>
	{
		case KEY_CODE_PWR:
			pwr_key_handle(key_status.code, key_status.event);
    7508:	9821      	ld.w      	r1, (r14, 0x4)
    750a:	3001      	movi      	r0, 1
    750c:	e3ffffa2 	bsr      	0x7450	// 7450 <pwr_key_handle>
		
		default:
			break;
	}
	
	return 0;
    7510:	3000      	movi      	r0, 0
}
    7512:	1402      	addi      	r14, r14, 8
    7514:	1490      	pop      	r15

Disassembly of section .text.key_scanf:

00007518 <key_scanf>:

enum KEY_CODE_T key_scanf(void)
{
    7518:	14d0      	push      	r15
	enum KEY_CODE_T code_down = KEY_CODE_NONE;
	
	if(GPIO_Read_Status(key_pin)) code_down |= KEY_CODE_PWR;
    751a:	1065      	lrw      	r3, 0x20000050	// 752c <key_scanf+0x14>
    751c:	3104      	movi      	r1, 4
    751e:	9300      	ld.w      	r0, (r3, 0x0)
    7520:	e3ffedab 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    7524:	3840      	cmpnei      	r0, 0
    7526:	3000      	movi      	r0, 0
    7528:	6001      	addc      	r0, r0

	return code_down;
}
    752a:	1490      	pop      	r15
    752c:	20000050 	.long	0x20000050

Disassembly of section .text.key_debounce_handler:

00007530 <key_debounce_handler>:

S8_T key_debounce_handler(void)
{
    7530:	14d2      	push      	r4-r5, r15
	static enum KEY_CODE_T code_click; //多击键值
	static U32_T key_press_cnt; //按下时间计数
	static U8_T cnt_click; //多击计数
	enum KEY_CODE_T key_buffer;
	
	key_buffer = key_scanf();
    7532:	e3fffff3 	bsr      	0x7518	// 7518 <key_scanf>
	
	if(pre_keyval != key_buffer) {
    7536:	1151      	lrw      	r2, 0x2000026c	// 75f8 <key_debounce_handler+0xc8>
	key_buffer = key_scanf();
    7538:	6d43      	mov      	r5, r0
	if(pre_keyval != key_buffer) {
    753a:	9202      	ld.w      	r0, (r2, 0x8)
    753c:	6416      	cmpne      	r5, r0
    753e:	6d0b      	mov      	r4, r2
    7540:	0c27      	bf      	0x758e	// 758e <key_debounce_handler+0x5e>
		if(pre_keyval > KEY_CODE_NONE && key_buffer == KEY_CODE_NONE) { //按键释放
    7542:	3840      	cmpnei      	r0, 0
    7544:	0c15      	bf      	0x756e	// 756e <key_debounce_handler+0x3e>
    7546:	3d40      	cmpnei      	r5, 0
    7548:	0810      	bt      	0x7568	// 7568 <key_debounce_handler+0x38>
			if(key_event == KEY_EVENT_LONGPRESS || key_event == KEY_EVENT_LLONGPRESS) {
    754a:	9263      	ld.w      	r3, (r2, 0xc)
    754c:	5b5b      	subi      	r2, r3, 7
    754e:	3a01      	cmphsi      	r2, 2
    7550:	080c      	bt      	0x7568	// 7568 <key_debounce_handler+0x38>
				if(key_event == KEY_EVENT_LONGPRESS) {
    7552:	3b47      	cmpnei      	r3, 7
    7554:	0804      	bt      	0x755c	// 755c <key_debounce_handler+0x2c>
					send_key_event(pre_keyval, KEY_EVENT_UPAFTER_LONGPRESS);
    7556:	3109      	movi      	r1, 9
    7558:	e3ffffa4 	bsr      	0x74a0	// 74a0 <send_key_event>
				}
				key_press_cnt = 0;
    755c:	3300      	movi      	r3, 0
				cnt_click = 0;
    755e:	3200      	movi      	r2, 0
				key_press_cnt = 0;
    7560:	b464      	st.w      	r3, (r4, 0x10)
				cnt_click = 0;
    7562:	a454      	st.b      	r2, (r4, 0x14)
				key_event = KEY_EVENT_NONE;
    7564:	b463      	st.w      	r3, (r4, 0xc)
				code_click = KEY_CODE_NONE;
    7566:	b466      	st.w      	r3, (r4, 0x18)
				printf("aaaap\r\n");
				//app_stop_5_second_timer(APP_DEEP_SLEEP_TIMER_ID);
			}
			*/
		}
		pre_keyval = key_buffer;	
    7568:	b4a2      	st.w      	r5, (r4, 0x8)
					break;
			}
		}	
	}
	return 0;
}
    756a:	3000      	movi      	r0, 0
    756c:	1492      	pop      	r4-r5, r15
		} else if(pre_keyval == KEY_CODE_NONE && key_buffer > KEY_CODE_NONE) { //按下按键
    756e:	3d40      	cmpnei      	r5, 0
    7570:	0ffc      	bf      	0x7568	// 7568 <key_debounce_handler+0x38>
			if(key_event == KEY_EVENT_NONE) key_event = KEY_EVENT_DOWN;
    7572:	9263      	ld.w      	r3, (r2, 0xc)
    7574:	3b40      	cmpnei      	r3, 0
			key_press_cnt = 0;
    7576:	b204      	st.w      	r0, (r2, 0x10)
			code_click = key_buffer;
    7578:	b2a6      	st.w      	r5, (r2, 0x18)
			if(key_event == KEY_EVENT_NONE) key_event = KEY_EVENT_DOWN;
    757a:	0804      	bt      	0x7582	// 7582 <key_debounce_handler+0x52>
    757c:	3301      	movi      	r3, 1
    757e:	b263      	st.w      	r3, (r2, 0xc)
    7580:	07f4      	br      	0x7568	// 7568 <key_debounce_handler+0x38>
			else if(key_event == KEY_EVENT_DOWN){
    7582:	3b41      	cmpnei      	r3, 1
    7584:	0bf2      	bt      	0x7568	// 7568 <key_debounce_handler+0x38>
				cnt_click++;
    7586:	8274      	ld.b      	r3, (r2, 0x14)
    7588:	2300      	addi      	r3, 1
    758a:	a274      	st.b      	r3, (r2, 0x14)
    758c:	07ee      	br      	0x7568	// 7568 <key_debounce_handler+0x38>
		key_press_cnt++;
    758e:	9264      	ld.w      	r3, (r2, 0x10)
    7590:	2300      	addi      	r3, 1
		if(key_buffer == KEY_CODE_NONE) {
    7592:	3d40      	cmpnei      	r5, 0
		key_press_cnt++;
    7594:	b264      	st.w      	r3, (r2, 0x10)
    7596:	9223      	ld.w      	r1, (r2, 0xc)
		if(key_buffer == KEY_CODE_NONE) {
    7598:	081b      	bt      	0x75ce	// 75ce <key_debounce_handler+0x9e>
			if(key_event == KEY_EVENT_DOWN) {
    759a:	3941      	cmpnei      	r1, 1
    759c:	0812      	bt      	0x75c0	// 75c0 <key_debounce_handler+0x90>
				if(key_press_cnt >= KEY_DOUBLECLICK_THRESHOLD || cnt_click >= MAX_KEY_CLICK_COUNT) {
    759e:	3b07      	cmphsi      	r3, 8
    75a0:	0804      	bt      	0x75a8	// 75a8 <key_debounce_handler+0x78>
    75a2:	8274      	ld.b      	r3, (r2, 0x14)
    75a4:	3b03      	cmphsi      	r3, 4
    75a6:	0fe2      	bf      	0x756a	// 756a <key_debounce_handler+0x3a>
					send_key_event(code_click, KEY_EVENT_CLICK + cnt_click);
    75a8:	8434      	ld.b      	r1, (r4, 0x14)
    75aa:	2101      	addi      	r1, 2
    75ac:	9406      	ld.w      	r0, (r4, 0x18)
    75ae:	e3ffff79 	bsr      	0x74a0	// 74a0 <send_key_event>
					key_press_cnt = 0;
    75b2:	3300      	movi      	r3, 0
					cnt_click = 0;
    75b4:	3200      	movi      	r2, 0
					key_press_cnt = 0;
    75b6:	b464      	st.w      	r3, (r4, 0x10)
					cnt_click = 0;
    75b8:	a454      	st.b      	r2, (r4, 0x14)
					key_event = KEY_EVENT_NONE;
    75ba:	b463      	st.w      	r3, (r4, 0xc)
					code_click = KEY_CODE_NONE;
    75bc:	b466      	st.w      	r3, (r4, 0x18)
    75be:	07d6      	br      	0x756a	// 756a <key_debounce_handler+0x3a>
			} else if(key_event == KEY_EVENT_NONE){
    75c0:	3940      	cmpnei      	r1, 0
    75c2:	0bd4      	bt      	0x756a	// 756a <key_debounce_handler+0x3a>
				if(key_press_cnt >= KEY_IDLE_TIMEOUT) {
    75c4:	100e      	lrw      	r0, 0x18f	// 75fc <key_debounce_handler+0xcc>
    75c6:	64c0      	cmphs      	r0, r3
    75c8:	0bd1      	bt      	0x756a	// 756a <key_debounce_handler+0x3a>
					key_press_cnt = 0;
    75ca:	b224      	st.w      	r1, (r2, 0x10)
    75cc:	07cf      	br      	0x756a	// 756a <key_debounce_handler+0x3a>
			switch(key_event)
    75ce:	3941      	cmpnei      	r1, 1
    75d0:	0c0a      	bf      	0x75e4	// 75e4 <key_debounce_handler+0xb4>
    75d2:	3947      	cmpnei      	r1, 7
    75d4:	0bcb      	bt      	0x756a	// 756a <key_debounce_handler+0x3a>
					if(key_press_cnt >= KEY_LLONGPRESS_THRESHOLD) {
    75d6:	31c7      	movi      	r1, 199
    75d8:	64c4      	cmphs      	r1, r3
    75da:	0bc8      	bt      	0x756a	// 756a <key_debounce_handler+0x3a>
						key_event = KEY_EVENT_LLONGPRESS;
    75dc:	3308      	movi      	r3, 8
    75de:	b263      	st.w      	r3, (r2, 0xc)
						send_key_event(key_buffer, key_event);
    75e0:	3108      	movi      	r1, 8
    75e2:	0407      	br      	0x75f0	// 75f0 <key_debounce_handler+0xc0>
					if(key_press_cnt >= KEY_LONGPRESS_THRESHOLD) {
    75e4:	313b      	movi      	r1, 59
    75e6:	64c4      	cmphs      	r1, r3
    75e8:	0bc1      	bt      	0x756a	// 756a <key_debounce_handler+0x3a>
						key_event = KEY_EVENT_LONGPRESS;
    75ea:	3307      	movi      	r3, 7
    75ec:	b263      	st.w      	r3, (r2, 0xc)
						send_key_event(key_buffer, key_event);
    75ee:	3107      	movi      	r1, 7
						send_key_event(key_buffer, key_event);
    75f0:	6c17      	mov      	r0, r5
    75f2:	e3ffff57 	bsr      	0x74a0	// 74a0 <send_key_event>
    75f6:	07ba      	br      	0x756a	// 756a <key_debounce_handler+0x3a>
    75f8:	2000026c 	.long	0x2000026c
    75fc:	0000018f 	.long	0x0000018f

Disassembly of section .text.app_stop_100_millisecond_timer:

00007600 <app_stop_100_millisecond_timer>:
	INIT_APP_TIMER(APP_NTC_TIMER_ID, FALSE, TRUE, 0, 50, NTCStatusCheck, 0),
};


void app_stop_100_millisecond_timer(U8_T timer_id)
{
    7600:	14d1      	push      	r4, r15
    7602:	6d03      	mov      	r4, r0
	printf("%s: %d\r\n",__func__, timer_id);
    7604:	6c83      	mov      	r2, r0
    7606:	1028      	lrw      	r1, 0x8bda	// 7624 <app_stop_100_millisecond_timer+0x24>
    7608:	1008      	lrw      	r0, 0x90ce	// 7628 <app_stop_100_millisecond_timer+0x28>
    760a:	e3ffe173 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
	
    struct APP_100_MILLISECOND_TIMER_STRUCT *timer = &app_100_millisecond_array[timer_id];

    timer->timer_en = 0;
    760e:	4402      	lsli      	r0, r4, 2
    7610:	6010      	addu      	r0, r4
    7612:	1067      	lrw      	r3, 0x20000128	// 762c <app_stop_100_millisecond_timer+0x2c>
    7614:	4002      	lsli      	r0, r0, 2
    7616:	600c      	addu      	r0, r3
    7618:	3300      	movi      	r3, 0
    761a:	a061      	st.b      	r3, (r0, 0x1)
    timer->timer_count = 0;
    761c:	3300      	movi      	r3, 0
    761e:	b061      	st.w      	r3, (r0, 0x4)
}
    7620:	1491      	pop      	r4, r15
    7622:	0000      	bkpt
    7624:	00008bda 	.long	0x00008bda
    7628:	000090ce 	.long	0x000090ce
    762c:	20000128 	.long	0x20000128

Disassembly of section .text.app_start_100_millisecond_timer:

00007630 <app_start_100_millisecond_timer>:

void app_start_100_millisecond_timer(U8_T timer_id)
{
    7630:	14d1      	push      	r4, r15
    7632:	6d03      	mov      	r4, r0
	printf("%s: %d\r\n",__func__, timer_id);
    7634:	6c83      	mov      	r2, r0
    7636:	1028      	lrw      	r1, 0x8bf9	// 7654 <app_start_100_millisecond_timer+0x24>
    7638:	1008      	lrw      	r0, 0x90ce	// 7658 <app_start_100_millisecond_timer+0x28>
    763a:	e3ffe15b 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
	
    struct APP_100_MILLISECOND_TIMER_STRUCT *timer = &app_100_millisecond_array[timer_id];

    timer->timer_en = 1;
    763e:	4402      	lsli      	r0, r4, 2
    7640:	6010      	addu      	r0, r4
    7642:	1067      	lrw      	r3, 0x20000128	// 765c <app_start_100_millisecond_timer+0x2c>
    7644:	4002      	lsli      	r0, r0, 2
    7646:	600c      	addu      	r0, r3
    7648:	3301      	movi      	r3, 1
    764a:	a061      	st.b      	r3, (r0, 0x1)
    timer->timer_count = 0;
    764c:	3300      	movi      	r3, 0
    764e:	b061      	st.w      	r3, (r0, 0x4)
}
    7650:	1491      	pop      	r4, r15
    7652:	0000      	bkpt
    7654:	00008bf9 	.long	0x00008bf9
    7658:	000090ce 	.long	0x000090ce
    765c:	20000128 	.long	0x20000128

Disassembly of section .text.app_100_millisecond_timer_check:

00007660 <app_100_millisecond_timer_check>:

	return timer->timer_en;
}

void app_100_millisecond_timer_check(void)
{
    7660:	14d2      	push      	r4-r5, r15
    struct APP_100_MILLISECOND_TIMER_STRUCT *timer = app_100_millisecond_array;
    7662:	108f      	lrw      	r4, 0x20000128	// 769c <app_100_millisecond_timer_check+0x3c>
    U8_T i;

    for(i = 0; i < ARRAY_SIZE(app_100_millisecond_array); i++) {
    7664:	3578      	movi      	r5, 120
    7666:	6150      	addu      	r5, r4
        if (timer->timer_en) {
    7668:	8461      	ld.b      	r3, (r4, 0x1)
    766a:	3b40      	cmpnei      	r3, 0
    766c:	0c10      	bf      	0x768c	// 768c <app_100_millisecond_timer_check+0x2c>
            timer->timer_count++;
    766e:	9461      	ld.w      	r3, (r4, 0x4)
    7670:	2300      	addi      	r3, 1
            if (timer->timer_count >= timer->timer_period) {
    7672:	9442      	ld.w      	r2, (r4, 0x8)
    7674:	648c      	cmphs      	r3, r2
            timer->timer_count++;
    7676:	b461      	st.w      	r3, (r4, 0x4)
            if (timer->timer_count >= timer->timer_period) {
    7678:	0c0a      	bf      	0x768c	// 768c <app_100_millisecond_timer_check+0x2c>
                if(timer->timer_periodic == FALSE) timer->timer_en = 0;
    767a:	8462      	ld.b      	r3, (r4, 0x2)
    767c:	3b40      	cmpnei      	r3, 0
    767e:	080b      	bt      	0x7694	// 7694 <app_100_millisecond_timer_check+0x34>
    7680:	a461      	st.b      	r3, (r4, 0x1)
				else timer->timer_count = 0;
                if (timer->cb) timer->cb(timer->parm);
    7682:	9463      	ld.w      	r3, (r4, 0xc)
    7684:	3b40      	cmpnei      	r3, 0
    7686:	0c03      	bf      	0x768c	// 768c <app_100_millisecond_timer_check+0x2c>
    7688:	8410      	ld.b      	r0, (r4, 0x10)
    768a:	7bcd      	jsr      	r3
            }
        }
        timer++;
    768c:	2413      	addi      	r4, 20
    for(i = 0; i < ARRAY_SIZE(app_100_millisecond_array); i++) {
    768e:	6552      	cmpne      	r4, r5
    7690:	0bec      	bt      	0x7668	// 7668 <app_100_millisecond_timer_check+0x8>
    }
}
    7692:	1492      	pop      	r4-r5, r15
				else timer->timer_count = 0;
    7694:	3300      	movi      	r3, 0
    7696:	b461      	st.w      	r3, (r4, 0x4)
    7698:	07f5      	br      	0x7682	// 7682 <app_100_millisecond_timer_check+0x22>
    769a:	0000      	bkpt
    769c:	20000128 	.long	0x20000128

Disassembly of section .text.pogo_pin_output_contrl:

000076a0 <pogo_pin_output_contrl>:

S8_T pogo_pin_output_contrl(enum APP_OUTPUT_TYPE_T output_type)
{
    76a0:	14d1      	push      	r4, r15
    76a2:	6d03      	mov      	r4, r0
	printf("%s: %d\r\n",__func__, output_type);
    76a4:	6c83      	mov      	r2, r0
    76a6:	1126      	lrw      	r1, 0x8c37	// 773c <pogo_pin_output_contrl+0x9c>
    76a8:	1106      	lrw      	r0, 0x90ce	// 7740 <pogo_pin_output_contrl+0xa0>
    76aa:	e3ffe123 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
	switch(output_type)
    76ae:	3c03      	cmphsi      	r4, 4
    76b0:	0842      	bt      	0x7734	// 7734 <pogo_pin_output_contrl+0x94>
    76b2:	6c13      	mov      	r0, r4
    76b4:	1184      	lrw      	r4, 0x2000004c	// 7744 <pogo_pin_output_contrl+0xa4>
    76b6:	e3ffd57d 	bsr      	0x21b0	// 21b0 <___gnu_csky_case_uqi>
    76ba:	1802      	.short	0x1802
    76bc:	382d      	.short	0x382d
	{
		case APP_OUTPUT_TYPE_BOOST5V:
			GPIO_Write_High(charge_5V_boost_pin);
    76be:	3101      	movi      	r1, 1
    76c0:	9400      	ld.w      	r0, (r4, 0x0)
    76c2:	e3ffecc7 	bsr      	0x5050	// 5050 <GPIO_Write_High>
			UART2_Int_Enable();//启用uart接收中断
		break;

		case APP_OUTPUT_TYPE_OUTPUTLOW:
			GPIO_Write_Low(charge_5V_boost_pin);
			GPIO_Init(pattern_TX_pin, Output);
    76c6:	3200      	movi      	r2, 0
    76c8:	9400      	ld.w      	r0, (r4, 0x0)
    76ca:	3104      	movi      	r1, 4
    76cc:	e3ffeada 	bsr      	0x4c80	// 4c80 <GPIO_Init>
			GPIO_Write_Low(pattern_TX_pin);
    76d0:	9400      	ld.w      	r0, (r4, 0x0)
    76d2:	3104      	movi      	r1, 4
    76d4:	e3ffecc2 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
			GPIO_InPutOutPut_Disable(pattern_RX_pin);
    76d8:	9400      	ld.w      	r0, (r4, 0x0)
    76da:	3105      	movi      	r1, 5
    76dc:	e3ffeb42 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
			GPIO_Write_Low(pattern_RX_pin);
    76e0:	9400      	ld.w      	r0, (r4, 0x0)
    76e2:	3105      	movi      	r1, 5
    76e4:	e3ffecba 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
    76e8:	0412      	br      	0x770c	// 770c <pogo_pin_output_contrl+0x6c>
			GPIO_Write_Low(charge_5V_boost_pin);
    76ea:	3101      	movi      	r1, 1
    76ec:	9400      	ld.w      	r0, (r4, 0x0)
    76ee:	e3ffecb5 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
			UART_IO_Init(IO_UART2, 2);
    76f2:	3102      	movi      	r1, 2
    76f4:	3002      	movi      	r0, 2
    76f6:	e3ffeda9 	bsr      	0x5248	// 5248 <UART_IO_Init>
			GPIO_Init(pattern_RX_pin, Output);
    76fa:	3105      	movi      	r1, 5
    76fc:	9400      	ld.w      	r0, (r4, 0x0)
    76fe:	3200      	movi      	r2, 0
    7700:	e3ffeac0 	bsr      	0x4c80	// 4c80 <GPIO_Init>
			GPIO_Write_High(pattern_RX_pin);
    7704:	9400      	ld.w      	r0, (r4, 0x0)
    7706:	3105      	movi      	r1, 5
    7708:	e3ffeca4 	bsr      	0x5050	// 5050 <GPIO_Write_High>
			UART2_Int_Disable();//禁止uart接收中断
    770c:	e3ffed8e 	bsr      	0x5228	// 5228 <UART2_Int_Disable>
		default:
			printf("invaild output type!\r\n");
		break;
	}
	return 0;
}
    7710:	3000      	movi      	r0, 0
    7712:	1491      	pop      	r4, r15
			GPIO_Write_Low(charge_5V_boost_pin);
    7714:	9400      	ld.w      	r0, (r4, 0x0)
    7716:	3101      	movi      	r1, 1
    7718:	e3ffeca0 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
			UART_IO_Init(IO_UART2, 2);
    771c:	3102      	movi      	r1, 2
    771e:	3002      	movi      	r0, 2
    7720:	e3ffed94 	bsr      	0x5248	// 5248 <UART_IO_Init>
			UART2_Int_Enable();//启用uart接收中断
    7724:	e3ffed74 	bsr      	0x520c	// 520c <UART2_Int_Enable>
		break;
    7728:	07f4      	br      	0x7710	// 7710 <pogo_pin_output_contrl+0x70>
			GPIO_Write_Low(charge_5V_boost_pin);
    772a:	3101      	movi      	r1, 1
    772c:	9400      	ld.w      	r0, (r4, 0x0)
    772e:	e3ffec95 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
    7732:	07ca      	br      	0x76c6	// 76c6 <pogo_pin_output_contrl+0x26>
			printf("invaild output type!\r\n");
    7734:	1005      	lrw      	r0, 0x90e3	// 7748 <pogo_pin_output_contrl+0xa8>
    7736:	e3ffe0ef 	bsr      	0x3914	// 3914 <__GI_puts>
		break;
    773a:	07eb      	br      	0x7710	// 7710 <pogo_pin_output_contrl+0x70>
    773c:	00008c37 	.long	0x00008c37
    7740:	000090ce 	.long	0x000090ce
    7744:	2000004c 	.long	0x2000004c
    7748:	000090e3 	.long	0x000090e3

Disassembly of section .text.EarphoneWakeUp:

0000774c <EarphoneWakeUp>:
	}
}

//要延时拉高5V一段时间唤醒耳机后再掉到通信电平
void EarphoneWakeUp(U8_T parm)
{
    774c:	14d0      	push      	r15
	printf("enter function->%s\r\n", __func__);
    774e:	1026      	lrw      	r1, 0x8c4e	// 7764 <EarphoneWakeUp+0x18>
    7750:	1006      	lrw      	r0, 0x90f9	// 7768 <EarphoneWakeUp+0x1c>
    7752:	e3ffe0cf 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>

	pogo_pin_output_contrl(APP_OUTPUT_TYPE_REVDATA);
    7756:	3002      	movi      	r0, 2
    7758:	e3ffffa4 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
	earphone_status = status;  
    775c:	3205      	movi      	r2, 5
    775e:	1064      	lrw      	r3, 0x20000128	// 776c <EarphoneWakeUp+0x20>
    7760:	b35e      	st.w      	r2, (r3, 0x78)
	earphone_status_update(APP_EARPHONE_STATUS_COMM);
}
    7762:	1490      	pop      	r15
    7764:	00008c4e 	.long	0x00008c4e
    7768:	000090f9 	.long	0x000090f9
    776c:	20000128 	.long	0x20000128

Disassembly of section .text.app_charge_type_get:

00007770 <app_charge_type_get>:
{
    7770:	14d2      	push      	r4-r5, r15
	if(GPIO_Read_Status(charge_USB5V_detect_pin)) charge_type = APP_CHARGE_TYPE_WIRED;
    7772:	10aa      	lrw      	r5, 0x20000050	// 7798 <app_charge_type_get+0x28>
    7774:	3103      	movi      	r1, 3
    7776:	9500      	ld.w      	r0, (r5, 0x0)
    7778:	e3ffec7f 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    777c:	3840      	cmpnei      	r0, 0
    777e:	6d03      	mov      	r4, r0
    7780:	0809      	bt      	0x7792	// 7792 <app_charge_type_get+0x22>
	else if(GPIO_Read_Status(charge_wireless5V_dectect_pin)) charge_type = APP_CHARGE_TYPE_WIRELESS;
    7782:	9500      	ld.w      	r0, (r5, 0x0)
    7784:	3100      	movi      	r1, 0
    7786:	e3ffec78 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    778a:	3840      	cmpnei      	r0, 0
    778c:	6111      	addc      	r4, r4
    778e:	4401      	lsli      	r0, r4, 1
}
    7790:	1492      	pop      	r4-r5, r15
	if(GPIO_Read_Status(charge_USB5V_detect_pin)) charge_type = APP_CHARGE_TYPE_WIRED;
    7792:	3001      	movi      	r0, 1
    7794:	07fe      	br      	0x7790	// 7790 <app_charge_type_get+0x20>
    7796:	0000      	bkpt
    7798:	20000050 	.long	0x20000050

Disassembly of section .text.battery_power_update:

0000779c <battery_power_update>:
{
    779c:	14d1      	push      	r4, r15
    779e:	6d03      	mov      	r4, r0
	printf("%s: %d%%\r\n",__func__, percent);
    77a0:	6c83      	mov      	r2, r0
    77a2:	1024      	lrw      	r1, 0x8c5d	// 77b0 <battery_power_update+0x14>
    77a4:	1004      	lrw      	r0, 0x910e	// 77b4 <battery_power_update+0x18>
    77a6:	e3ffe0a5 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
	battery_percentage = percent;
    77aa:	1064      	lrw      	r3, 0x200001a8	// 77b8 <battery_power_update+0x1c>
    77ac:	a380      	st.b      	r4, (r3, 0x0)
}
    77ae:	1491      	pop      	r4, r15
    77b0:	00008c5d 	.long	0x00008c5d
    77b4:	0000910e 	.long	0x0000910e
    77b8:	200001a8 	.long	0x200001a8

Disassembly of section .text.battery_level_calculate:

000077bc <battery_level_calculate>:
{
    77bc:	14d2      	push      	r4-r5, r15
	if(battery_mv <= APP_BATTERY_PD_MV) level = 0; //电量耗尽
    77be:	33c8      	movi      	r3, 200
    77c0:	4364      	lsli      	r3, r3, 4
    77c2:	640c      	cmphs      	r3, r0
{
    77c4:	6d43      	mov      	r5, r0
	if(battery_mv <= APP_BATTERY_PD_MV) level = 0; //电量耗尽
    77c6:	081d      	bt      	0x7800	// 7800 <battery_level_calculate+0x44>
		level = ((battery_mv - APP_BATTERY_PD_MV) / APP_BATTERY_MV_BASE + 1);
    77c8:	100f      	lrw      	r0, 0xfffff380	// 7804 <battery_level_calculate+0x48>
    77ca:	6014      	addu      	r0, r5
    77cc:	e3ffda4c 	bsr      	0x2c64	// 2c64 <__floatunsisf>
    77d0:	102e      	lrw      	r1, 0x411b3333	// 7808 <battery_level_calculate+0x4c>
    77d2:	e3ffd9c1 	bsr      	0x2b54	// 2b54 <__divsf3>
    77d6:	31fe      	movi      	r1, 254
    77d8:	4136      	lsli      	r1, r1, 22
    77da:	e3ffd98d 	bsr      	0x2af4	// 2af4 <__addsf3>
    77de:	e3ffda19 	bsr      	0x2c10	// 2c10 <__fixsfsi>
    77e2:	6d03      	mov      	r4, r0
    77e4:	3364      	movi      	r3, 100
    77e6:	7402      	sextb      	r0, r0
    77e8:	640d      	cmplt      	r3, r0
    77ea:	0c02      	bf      	0x77ee	// 77ee <battery_level_calculate+0x32>
    77ec:	3464      	movi      	r4, 100
    77ee:	7512      	sextb      	r4, r4
	printf("%s: %ldmV %d%%\r\n",__func__, battery_mv, level);
    77f0:	6cd3      	mov      	r3, r4
    77f2:	6c97      	mov      	r2, r5
    77f4:	1026      	lrw      	r1, 0x8c72	// 780c <battery_level_calculate+0x50>
    77f6:	1007      	lrw      	r0, 0x9119	// 7810 <battery_level_calculate+0x54>
    77f8:	e3ffe07c 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
}
    77fc:	6c13      	mov      	r0, r4
    77fe:	1492      	pop      	r4-r5, r15
	if(battery_mv <= APP_BATTERY_PD_MV) level = 0; //电量耗尽
    7800:	3400      	movi      	r4, 0
    7802:	07f7      	br      	0x77f0	// 77f0 <battery_level_calculate+0x34>
    7804:	fffff380 	.long	0xfffff380
    7808:	411b3333 	.long	0x411b3333
    780c:	00008c72 	.long	0x00008c72
    7810:	00009119 	.long	0x00009119

Disassembly of section .text.ntc_status_update:

00007814 <ntc_status_update>:
{
    7814:	14d1      	push      	r4, r15
    7816:	6d03      	mov      	r4, r0
	printf("%s: %d\r\n",__func__, status);
    7818:	6c83      	mov      	r2, r0
    781a:	1024      	lrw      	r1, 0x8c8a	// 7828 <ntc_status_update+0x14>
    781c:	1004      	lrw      	r0, 0x90ce	// 782c <ntc_status_update+0x18>
    781e:	e3ffe069 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
	NTC_status = status;
    7822:	1064      	lrw      	r3, 0x200001a8	// 7830 <ntc_status_update+0x1c>
    7824:	b381      	st.w      	r4, (r3, 0x4)
}
    7826:	1491      	pop      	r4, r15
    7828:	00008c8a 	.long	0x00008c8a
    782c:	000090ce 	.long	0x000090ce
    7830:	200001a8 	.long	0x200001a8

Disassembly of section .text.charge_current_control:

00007834 <charge_current_control>:
{
    7834:	14d2      	push      	r4-r5, r15
    7836:	6d03      	mov      	r4, r0
    7838:	6d47      	mov      	r5, r1
	printf("%s: %d %d\r\n",__func__, ntc_status, charge_type);
    783a:	6cc7      	mov      	r3, r1
    783c:	6c83      	mov      	r2, r0
    783e:	1127      	lrw      	r1, 0x8c9c	// 78d8 <charge_current_control+0xa4>
    7840:	1107      	lrw      	r0, 0x90d7	// 78dc <charge_current_control+0xa8>
    7842:	e3ffe057 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
	switch(ntc_status)
    7846:	3c41      	cmpnei      	r4, 1
    7848:	0c07      	bf      	0x7856	// 7856 <charge_current_control+0x22>
    784a:	3c40      	cmpnei      	r4, 0
    784c:	0c3b      	bf      	0x78c2	// 78c2 <charge_current_control+0x8e>
    784e:	3c42      	cmpnei      	r4, 2
    7850:	0c39      	bf      	0x78c2	// 78c2 <charge_current_control+0x8e>
}
    7852:	3000      	movi      	r0, 0
    7854:	1492      	pop      	r4-r5, r15
			if(charge_type == APP_CHARGE_TYPE_WIRED) {
    7856:	3d41      	cmpnei      	r5, 1
    7858:	1182      	lrw      	r4, 0x20000050	// 78e0 <charge_current_control+0xac>
    785a:	081c      	bt      	0x7892	// 7892 <charge_current_control+0x5e>
				GPIO_Init(charge_wireless_iset_pin, Output); /* 输出模式，输入禁止 */
    785c:	3200      	movi      	r2, 0
    785e:	9400      	ld.w      	r0, (r4, 0x0)
    7860:	3107      	movi      	r1, 7
    7862:	e3ffea0f 	bsr      	0x4c80	// 4c80 <GPIO_Init>
				GPIO_PullHighLow_DIS(charge_wireless_iset_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗
    7866:	9400      	ld.w      	r0, (r4, 0x0)
    7868:	3107      	movi      	r1, 7
    786a:	e3ffeae1 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
				GPIO_Write_Low(charge_wireless_iset_pin);
    786e:	9400      	ld.w      	r0, (r4, 0x0)
    7870:	3107      	movi      	r1, 7
    7872:	e3ffebf3 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
				GPIO_Init(charge_wired_iset_pin, Output); /* 输出模式，输入禁止 */
    7876:	3200      	movi      	r2, 0
    7878:	9400      	ld.w      	r0, (r4, 0x0)
    787a:	310f      	movi      	r1, 15
    787c:	e3ffea02 	bsr      	0x4c80	// 4c80 <GPIO_Init>
				GPIO_PullHighLow_DIS(charge_wired_iset_pin);
    7880:	9400      	ld.w      	r0, (r4, 0x0)
    7882:	310f      	movi      	r1, 15
    7884:	e3ffead4 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
				GPIO_Write_Low(charge_wired_iset_pin);
    7888:	9400      	ld.w      	r0, (r4, 0x0)
    788a:	310f      	movi      	r1, 15
    788c:	e3ffebe6 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
    7890:	07e1      	br      	0x7852	// 7852 <charge_current_control+0x1e>
			} else if(charge_type == APP_CHARGE_TYPE_WIRELESS){
    7892:	3d42      	cmpnei      	r5, 2
    7894:	0818      	bt      	0x78c4	// 78c4 <charge_current_control+0x90>
				GPIO_Init(charge_wireless_iset_pin, Output); /* 输出模式，输入禁止 */
    7896:	3200      	movi      	r2, 0
    7898:	3107      	movi      	r1, 7
    789a:	9400      	ld.w      	r0, (r4, 0x0)
    789c:	e3ffe9f2 	bsr      	0x4c80	// 4c80 <GPIO_Init>
				GPIO_PullHighLow_DIS(charge_wireless_iset_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗
    78a0:	3107      	movi      	r1, 7
    78a2:	9400      	ld.w      	r0, (r4, 0x0)
    78a4:	e3ffeac4 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
				GPIO_Write_Low(charge_wireless_iset_pin);
    78a8:	3107      	movi      	r1, 7
    78aa:	9400      	ld.w      	r0, (r4, 0x0)
    78ac:	e3ffebd6 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
			GPIO_InPutOutPut_Disable(charge_wired_iset_pin);
    78b0:	9400      	ld.w      	r0, (r4, 0x0)
    78b2:	310f      	movi      	r1, 15
    78b4:	e3ffea56 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
			GPIO_PullHighLow_DIS(charge_wired_iset_pin);
    78b8:	9400      	ld.w      	r0, (r4, 0x0)
    78ba:	310f      	movi      	r1, 15
    78bc:	e3ffeab8 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
		break;
    78c0:	07c9      	br      	0x7852	// 7852 <charge_current_control+0x1e>
			GPIO_InPutOutPut_Disable(charge_wireless_iset_pin);
    78c2:	1088      	lrw      	r4, 0x20000050	// 78e0 <charge_current_control+0xac>
    78c4:	9400      	ld.w      	r0, (r4, 0x0)
    78c6:	3107      	movi      	r1, 7
    78c8:	e3ffea4c 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
			GPIO_PullHighLow_DIS(charge_wireless_iset_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗
    78cc:	3107      	movi      	r1, 7
    78ce:	9400      	ld.w      	r0, (r4, 0x0)
    78d0:	e3ffeaae 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
    78d4:	07ee      	br      	0x78b0	// 78b0 <charge_current_control+0x7c>
    78d6:	0000      	bkpt
    78d8:	00008c9c 	.long	0x00008c9c
    78dc:	000090d7 	.long	0x000090d7
    78e0:	20000050 	.long	0x20000050

Disassembly of section .text.ntc_status_measure:

000078e4 <ntc_status_measure>:
	return NTC_status;
    78e4:	1076      	lrw      	r3, 0x200001a8	// 793c <ntc_status_measure+0x58>
	switch(ntc_status_get())
    78e6:	9361      	ld.w      	r3, (r3, 0x4)
    78e8:	3b40      	cmpnei      	r3, 0
    78ea:	0c0b      	bf      	0x7900	// 7900 <ntc_status_measure+0x1c>
    78ec:	3b02      	cmphsi      	r3, 3
    78ee:	1055      	lrw      	r2, 0xfffffc29	// 7940 <ntc_status_measure+0x5c>
    78f0:	3397      	movi      	r3, 151
    78f2:	6080      	addu      	r2, r0
    78f4:	4363      	lsli      	r3, r3, 3
    78f6:	0812      	bt      	0x791a	// 791a <ntc_status_measure+0x36>
			if(ntc_mv > APP_NTC_STOPCHG_HIGH_MV || ntc_mv < APP_NTC_STOPCHG_LOW_MV) 
    78f8:	648c      	cmphs      	r3, r2
    78fa:	081f      	bt      	0x7938	// 7938 <ntc_status_measure+0x54>
				ntc_status = APP_NTC_STATUS_STOPCHG;
    78fc:	3000      	movi      	r0, 0
    78fe:	040d      	br      	0x7918	// 7918 <ntc_status_measure+0x34>
			if(ntc_mv <= APP_NTC_RECHG_HIGH_MV && ntc_mv >= APP_NTC_RECHG_LOW_MV)//复充温度
    7900:	1031      	lrw      	r1, 0xfffffbb5	// 7944 <ntc_status_measure+0x60>
    7902:	6040      	addu      	r1, r0
    7904:	1051      	lrw      	r2, 0x3c1	// 7948 <ntc_status_measure+0x64>
    7906:	6448      	cmphs      	r2, r1
    7908:	0c18      	bf      	0x7938	// 7938 <ntc_status_measure+0x54>
				if(ntc_mv <= APP_NTC_STOPCHG_HIGH_MV && ntc_mv >= APP_NTC_NORMAL_MV) {
    790a:	1051      	lrw      	r2, 0xfffff907	// 794c <ntc_status_measure+0x68>
    790c:	6008      	addu      	r0, r2
    790e:	32cb      	movi      	r2, 203
    7910:	4241      	lsli      	r2, r2, 1
					ntc_status = APP_NTC_STATUS_NORMAL_LOW_TEMP;
    7912:	6408      	cmphs      	r2, r0
    7914:	60cd      	addc      	r3, r3
    7916:	5b02      	addi      	r0, r3, 1
}
    7918:	783c      	jmp      	r15
			if(ntc_mv > APP_NTC_STOPCHG_HIGH_MV || ntc_mv < APP_NTC_STOPCHG_LOW_MV) {
    791a:	648c      	cmphs      	r3, r2
    791c:	0ff0      	bf      	0x78fc	// 78fc <ntc_status_measure+0x18>
			} else if(ntc_mv <= APP_NTC_STOPCHG_HIGH_MV && ntc_mv >= APP_NTC_NORMAL_MV) {
    791e:	106c      	lrw      	r3, 0xfffff907	// 794c <ntc_status_measure+0x68>
    7920:	600c      	addu      	r0, r3
    7922:	33cb      	movi      	r3, 203
    7924:	4361      	lsli      	r3, r3, 1
    7926:	640c      	cmphs      	r3, r0
    7928:	0806      	bt      	0x7934	// 7934 <ntc_status_measure+0x50>
			} else if(ntc_mv < APP_NTC_NORMAL_MV && ntc_mv >= APP_NTC_STOPCHG_LOW_MV){
    792a:	106a      	lrw      	r3, 0x321	// 7950 <ntc_status_measure+0x6c>
    792c:	648c      	cmphs      	r3, r2
    792e:	0c05      	bf      	0x7938	// 7938 <ntc_status_measure+0x54>
					ntc_status = APP_NTC_STATUS_NORMAL_HIGH_TEMP;
    7930:	3001      	movi      	r0, 1
    7932:	07f3      	br      	0x7918	// 7918 <ntc_status_measure+0x34>
					ntc_status = APP_NTC_STATUS_NORMAL_LOW_TEMP;
    7934:	3002      	movi      	r0, 2
    7936:	07f1      	br      	0x7918	// 7918 <ntc_status_measure+0x34>
	enum APP_NTC_STATUS_T ntc_status = APP_NTC_STATUS_INVALID;
    7938:	3003      	movi      	r0, 3
	return ntc_status;
    793a:	07ef      	br      	0x7918	// 7918 <ntc_status_measure+0x34>
    793c:	200001a8 	.long	0x200001a8
    7940:	fffffc29 	.long	0xfffffc29
    7944:	fffffbb5 	.long	0xfffffbb5
    7948:	000003c1 	.long	0x000003c1
    794c:	fffff907 	.long	0xfffff907
    7950:	00000321 	.long	0x00000321

Disassembly of section .text.app_deinit:

00007954 <app_deinit>:

void app_deinit(void)
{
    7954:	14d2      	push      	r4-r5, r15
	//charging
	GPIO_InPutOutPut_Disable(charge_status_pin);
    7956:	119a      	lrw      	r4, 0x20000050	// 7a3c <app_deinit+0xe8>
    7958:	310b      	movi      	r1, 11
    795a:	9400      	ld.w      	r0, (r4, 0x0)
    795c:	e3ffea02 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_PullHighLow_DIS(charge_status_pin);
	GPIO_Write_Low(charge_5V_boost_pin);
    7960:	11b8      	lrw      	r5, 0x2000004c	// 7a40 <app_deinit+0xec>
	GPIO_PullHighLow_DIS(charge_status_pin);
    7962:	310b      	movi      	r1, 11
    7964:	9400      	ld.w      	r0, (r4, 0x0)
    7966:	e3ffea63 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
	GPIO_Write_Low(charge_5V_boost_pin);
    796a:	9500      	ld.w      	r0, (r5, 0x0)
    796c:	3101      	movi      	r1, 1
    796e:	e3ffeb75 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
	GPIO_InPutOutPut_Disable(charge_wired_iset_pin);
    7972:	9400      	ld.w      	r0, (r4, 0x0)
    7974:	310f      	movi      	r1, 15
    7976:	e3ffe9f5 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_InPutOutPut_Disable(charge_wireless_iset_pin);
    797a:	9400      	ld.w      	r0, (r4, 0x0)
    797c:	3107      	movi      	r1, 7
    797e:	e3ffe9f1 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_PullHighLow_DIS(charge_wireless_iset_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗
    7982:	9400      	ld.w      	r0, (r4, 0x0)
    7984:	3107      	movi      	r1, 7
    7986:	e3ffea53 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
	GPIO_InPutOutPut_Disable(charge_enable_pin);
    798a:	9400      	ld.w      	r0, (r4, 0x0)
    798c:	3106      	movi      	r1, 6
    798e:	e3ffe9e9 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_PullHighLow_DIS(charge_enable_pin);//烧录复用口要禁用内部上下拉，否则会带来待机功耗
    7992:	9400      	ld.w      	r0, (r4, 0x0)
    7994:	3106      	movi      	r1, 6
    7996:	e3ffea4b 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
	GPIO_Write_Low(NTC_detect_pin);
    799a:	9400      	ld.w      	r0, (r4, 0x0)
    799c:	310e      	movi      	r1, 14
    799e:	e3ffeb5d 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
	EXTI_trigger_CMD(DISABLE, EXI_PIN3, _EXIFT);//禁用拔出USB唤醒
    79a2:	3201      	movi      	r2, 1
    79a4:	3108      	movi      	r1, 8
    79a6:	3000      	movi      	r0, 0
    79a8:	e3ffe88a 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	EXTI_trigger_CMD(DISABLE, EXI_PIN0, _EXIFT);//禁用移开无线充电源唤醒
    79ac:	3201      	movi      	r2, 1
    79ae:	3101      	movi      	r1, 1
    79b0:	3000      	movi      	r0, 0
    79b2:	e3ffe885 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>

	//adc
	ADC12_ready_wait();
    79b6:	e3fff0e9 	bsr      	0x5b88	// 5b88 <ADC12_ready_wait>
	ADC12_Control(ADC12_STOP); //休眠前不停止ADC转换，这会造成唤醒后，MCU卡机
    79ba:	3010      	movi      	r0, 16
    79bc:	e3fff0a4 	bsr      	0x5b04	// 5b04 <ADC12_Control>
	ADC12_CMD(DISABLE);
    79c0:	3000      	movi      	r0, 0
    79c2:	e3fff0cf 	bsr      	0x5b60	// 5b60 <ADC12_CMD>
	GPIO_InPutOutPut_Disable(chg_l_adc_pin);
    79c6:	9400      	ld.w      	r0, (r4, 0x0)
    79c8:	3105      	movi      	r1, 5
    79ca:	e3ffe9cb 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_InPutOutPut_Disable(chg_r_adc_pin);
    79ce:	9400      	ld.w      	r0, (r4, 0x0)
    79d0:	310c      	movi      	r1, 12
    79d2:	e3ffe9c7 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_InPutOutPut_Disable(bat_adc_pin);
    79d6:	9400      	ld.w      	r0, (r4, 0x0)
    79d8:	3109      	movi      	r1, 9
    79da:	e3ffe9c3 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_InPutOutPut_Disable(ntc_adc_pin);
    79de:	9400      	ld.w      	r0, (r4, 0x0)
    79e0:	310a      	movi      	r1, 10
    79e2:	e3ffe9bf 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>

	//LED
	GPIO_InPutOutPut_Disable(red_led_pin);
    79e6:	9500      	ld.w      	r0, (r5, 0x0)
    79e8:	3102      	movi      	r1, 2
    79ea:	e3ffe9bb 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_InPutOutPut_Disable(blue_led_pin);
    79ee:	9400      	ld.w      	r0, (r4, 0x0)
    79f0:	3108      	movi      	r1, 8
    79f2:	e3ffe9b7 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_InPutOutPut_Disable(green_led_pin);
    79f6:	9500      	ld.w      	r0, (r5, 0x0)
    79f8:	3103      	movi      	r1, 3
    79fa:	e3ffe9b3 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>

	//communicate
	GPIO_Init(pattern_TX_pin, Output);
    79fe:	3200      	movi      	r2, 0
    7a00:	9500      	ld.w      	r0, (r5, 0x0)
    7a02:	3104      	movi      	r1, 4
    7a04:	e3ffe93e 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_Low(pattern_TX_pin);
    7a08:	9500      	ld.w      	r0, (r5, 0x0)
    7a0a:	3104      	movi      	r1, 4
    7a0c:	e3ffeb26 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
	GPIO_InPutOutPut_Disable(pattern_RX_pin);
    7a10:	9500      	ld.w      	r0, (r5, 0x0)
    7a12:	3105      	movi      	r1, 5
    7a14:	e3ffe9a6 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	
	GPIO_InPutOutPut_Disable(debug_RX_pin);
    7a18:	9400      	ld.w      	r0, (r4, 0x0)
    7a1a:	310d      	movi      	r1, 13
    7a1c:	e3ffe9a2 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_InPutOutPut_Disable(debug_TX_pin);
    7a20:	9500      	ld.w      	r0, (r5, 0x0)
    7a22:	3100      	movi      	r1, 0
    7a24:	e3ffe99e 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>

	GPIO_InPutOutPut_Disable(key_pin);//改善按下按键会增加功耗问题，合盖按键不唤醒
    7a28:	9400      	ld.w      	r0, (r4, 0x0)
    7a2a:	3104      	movi      	r1, 4
    7a2c:	e3ffe99a 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_PullHighLow_DIS(key_pin);
    7a30:	9400      	ld.w      	r0, (r4, 0x0)
    7a32:	3104      	movi      	r1, 4
    7a34:	e3ffe9fc 	bsr      	0x4e2c	// 4e2c <GPIO_PullHighLow_DIS>
}
    7a38:	1492      	pop      	r4-r5, r15
    7a3a:	0000      	bkpt
    7a3c:	20000050 	.long	0x20000050
    7a40:	2000004c 	.long	0x2000004c

Disassembly of section .text.adc_get_val:

00007a44 <adc_get_val>:
	system_goto_deepsleep_mode(0);
}

/* 获取NTC检测脚的ADC转换数值 */
U32_T adc_get_val(enum ADC_CONV_SEQ adc_seq)
{
    7a44:	14d1      	push      	r4, r15
    7a46:	6d03      	mov      	r4, r0
	ADC12_ready_wait();
    7a48:	e3fff0a0 	bsr      	0x5b88	// 5b88 <ADC12_ready_wait>
	ADC0->CSR |= (1 << (16 + adc_seq)); /* 清除SEQ0序列转换完成中断 */
    7a4c:	106a      	lrw      	r3, 0x20000054	// 7a74 <adc_get_val+0x30>
    7a4e:	3010      	movi      	r0, 16
    7a50:	9340      	ld.w      	r2, (r3, 0x0)
    7a52:	6010      	addu      	r0, r4
    7a54:	3301      	movi      	r3, 1
    7a56:	9227      	ld.w      	r1, (r2, 0x1c)
    7a58:	70c0      	lsl      	r3, r0
    7a5a:	6cc4      	or      	r3, r1
    7a5c:	b267      	st.w      	r3, (r2, 0x1c)
	ADC12_Control(ADC12_START);	/* 开始模数转换 */
    7a5e:	3008      	movi      	r0, 8
    7a60:	e3fff052 	bsr      	0x5b04	// 5b04 <ADC12_Control>
	ADC12_SEQEND_wait(adc_seq);
    7a64:	7410      	zextb      	r0, r4
    7a66:	e3fff09b 	bsr      	0x5b9c	// 5b9c <ADC12_SEQEND_wait>
	return ADC12_DATA_OUPUT(adc_seq);
    7a6a:	7411      	zexth      	r0, r4
    7a6c:	e3fff0a4 	bsr      	0x5bb4	// 5bb4 <ADC12_DATA_OUPUT>
}
    7a70:	1491      	pop      	r4, r15
    7a72:	0000      	bkpt
    7a74:	20000054 	.long	0x20000054

Disassembly of section .text.BatteryPowerCheck:

00007a78 <BatteryPowerCheck>:
{
    7a78:	14d1      	push      	r4, r15
	printf("enter function->%s\r\n", __func__);
    7a7a:	103c      	lrw      	r1, 0x8cb3	// 7ae8 <BatteryPowerCheck+0x70>
    7a7c:	101c      	lrw      	r0, 0x90f9	// 7aec <BatteryPowerCheck+0x74>
    7a7e:	e3ffdf39 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
	battery_mv = battery_adc_to_mv(adc_get_val(BATTERY_ADC));
    7a82:	3000      	movi      	r0, 0
    7a84:	e3ffffe0 	bsr      	0x7a44	// 7a44 <adc_get_val>
    7a88:	e3ffdcd6 	bsr      	0x3434	// 3434 <__floatunsidf>
    7a8c:	3200      	movi      	r2, 0
    7a8e:	1079      	lrw      	r3, 0x3fe75400	// 7af0 <BatteryPowerCheck+0x78>
    7a90:	e3ffdab8 	bsr      	0x3000	// 3000 <__muldf3>
    7a94:	3200      	movi      	r2, 0
    7a96:	1078      	lrw      	r3, 0x40438000	// 7af4 <BatteryPowerCheck+0x7c>
    7a98:	e3ffdbce 	bsr      	0x3234	// 3234 <__divdf3>
    7a9c:	3200      	movi      	r2, 0
    7a9e:	1077      	lrw      	r3, 0x405e4000	// 7af8 <BatteryPowerCheck+0x80>
    7aa0:	e3ffdab0 	bsr      	0x3000	// 3000 <__muldf3>
    7aa4:	e3ffd3c0 	bsr      	0x2224	// 2224 <__fixunsdfsi>
	level = battery_level_calculate(battery_mv);
    7aa8:	e3fffe8a 	bsr      	0x77bc	// 77bc <battery_level_calculate>
    7aac:	6d03      	mov      	r4, r0
	if(app_charge_type_get() != APP_CHARGE_TYPE_DISCHARGE && app_battery_status_get() == APP_BATTERY_STATUS_CHARGING) {//使能充电IC时，电量只能加不能减
    7aae:	e3fffe61 	bsr      	0x7770	// 7770 <app_charge_type_get>
    7ab2:	3840      	cmpnei      	r0, 0
    7ab4:	1052      	lrw      	r2, 0x200001a8	// 7afc <BatteryPowerCheck+0x84>
    7ab6:	1073      	lrw      	r3, 0x20000288	// 7b00 <BatteryPowerCheck+0x88>
		if(level > battery_power_get()) battery_check_count++;
    7ab8:	8240      	ld.b      	r2, (r2, 0x0)
	if(app_charge_type_get() != APP_CHARGE_TYPE_DISCHARGE && app_battery_status_get() == APP_BATTERY_STATUS_CHARGING) {//使能充电IC时，电量只能加不能减
    7aba:	0c15      	bf      	0x7ae4	// 7ae4 <BatteryPowerCheck+0x6c>
	return battery_status;
    7abc:	1032      	lrw      	r1, 0x20000128	// 7b04 <BatteryPowerCheck+0x8c>
	if(app_charge_type_get() != APP_CHARGE_TYPE_DISCHARGE && app_battery_status_get() == APP_BATTERY_STATUS_CHARGING) {//使能充电IC时，电量只能加不能减
    7abe:	913f      	ld.w      	r1, (r1, 0x7c)
    7ac0:	3941      	cmpnei      	r1, 1
    7ac2:	0811      	bt      	0x7ae4	// 7ae4 <BatteryPowerCheck+0x6c>
		if(level > battery_power_get()) battery_check_count++;
    7ac4:	6509      	cmplt      	r2, r4
    7ac6:	0c0d      	bf      	0x7ae0	// 7ae0 <BatteryPowerCheck+0x68>
    7ac8:	8340      	ld.b      	r2, (r3, 0x0)
    7aca:	2200      	addi      	r2, 1
		else battery_check_count = 0;
    7acc:	a340      	st.b      	r2, (r3, 0x0)
	if(battery_check_count >= 3)
    7ace:	8340      	ld.b      	r2, (r3, 0x0)
    7ad0:	3a02      	cmphsi      	r2, 3
    7ad2:	0c06      	bf      	0x7ade	// 7ade <BatteryPowerCheck+0x66>
		battery_check_count = 0;
    7ad4:	3200      	movi      	r2, 0
		battery_power_update(level);
    7ad6:	7410      	zextb      	r0, r4
		battery_check_count = 0;
    7ad8:	a340      	st.b      	r2, (r3, 0x0)
		battery_power_update(level);
    7ada:	e3fffe61 	bsr      	0x779c	// 779c <battery_power_update>
}
    7ade:	1491      	pop      	r4, r15
		else battery_check_count = 0;
    7ae0:	3200      	movi      	r2, 0
    7ae2:	07f5      	br      	0x7acc	// 7acc <BatteryPowerCheck+0x54>
		if(level < battery_power_get()) battery_check_count++;
    7ae4:	6491      	cmplt      	r4, r2
    7ae6:	07f0      	br      	0x7ac6	// 7ac6 <BatteryPowerCheck+0x4e>
    7ae8:	00008cb3 	.long	0x00008cb3
    7aec:	000090f9 	.long	0x000090f9
    7af0:	3fe75400 	.long	0x3fe75400
    7af4:	40438000 	.long	0x40438000
    7af8:	405e4000 	.long	0x405e4000
    7afc:	200001a8 	.long	0x200001a8
    7b00:	20000288 	.long	0x20000288
    7b04:	20000128 	.long	0x20000128

Disassembly of section .text.NTCStatusCheck:

00007b08 <NTCStatusCheck>:
{
    7b08:	14d1      	push      	r4, r15
	ntc_mv = ntc_adc_to_mv(adc_get_val(NTC_ADC));
    7b0a:	3003      	movi      	r0, 3
    7b0c:	e3ffff9c 	bsr      	0x7a44	// 7a44 <adc_get_val>
    7b10:	3380      	movi      	r3, 128
    7b12:	4365      	lsli      	r3, r3, 5
    7b14:	5b01      	subu      	r0, r3, r0
    7b16:	e3ffdc8f 	bsr      	0x3434	// 3434 <__floatunsidf>
    7b1a:	3200      	movi      	r2, 0
    7b1c:	1079      	lrw      	r3, 0x3fe74c00	// 7b80 <NTCStatusCheck+0x78>
    7b1e:	e3ffda71 	bsr      	0x3000	// 3000 <__muldf3>
    7b22:	6c83      	mov      	r2, r0
    7b24:	6cc7      	mov      	r3, r1
    7b26:	3000      	movi      	r0, 0
    7b28:	1037      	lrw      	r1, 0x40a75800	// 7b84 <NTCStatusCheck+0x7c>
    7b2a:	e3ffda4f 	bsr      	0x2fc8	// 2fc8 <__subdf3>
    7b2e:	e3ffd37b 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7b32:	6d03      	mov      	r4, r0
	printf("NTC: %ldmv\r\n", ntc_mv);
    7b34:	6c43      	mov      	r1, r0
    7b36:	1015      	lrw      	r0, 0x912a	// 7b88 <NTCStatusCheck+0x80>
    7b38:	e3ffdedc 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
	ntc_status = ntc_status_measure(ntc_mv);
    7b3c:	6c13      	mov      	r0, r4
    7b3e:	e3fffed3 	bsr      	0x78e4	// 78e4 <ntc_status_measure>
	if(pre_ntc_status != ntc_status) {//NTC状态改变
    7b42:	1053      	lrw      	r2, 0x200001a8	// 7b8c <NTCStatusCheck+0x84>
    7b44:	9262      	ld.w      	r3, (r2, 0x8)
    7b46:	64c2      	cmpne      	r0, r3
    7b48:	1072      	lrw      	r3, 0x20000288	// 7b90 <NTCStatusCheck+0x88>
    7b4a:	0c07      	bf      	0x7b58	// 7b58 <NTCStatusCheck+0x50>
		status_change_flag = TRUE;
    7b4c:	3101      	movi      	r1, 1
    7b4e:	a321      	st.b      	r1, (r3, 0x1)
		ntc_trigger_cnt = 0;
    7b50:	3100      	movi      	r1, 0
    7b52:	a322      	st.b      	r1, (r3, 0x2)
		pre_ntc_status = ntc_status;
    7b54:	b202      	st.w      	r0, (r2, 0x8)
}
    7b56:	1491      	pop      	r4, r15
		if(status_change_flag == TRUE)
    7b58:	8341      	ld.b      	r2, (r3, 0x1)
    7b5a:	3a41      	cmpnei      	r2, 1
    7b5c:	0bfd      	bt      	0x7b56	// 7b56 <NTCStatusCheck+0x4e>
			ntc_trigger_cnt++;
    7b5e:	8342      	ld.b      	r2, (r3, 0x2)
    7b60:	2200      	addi      	r2, 1
    7b62:	7488      	zextb      	r2, r2
			if(ntc_trigger_cnt >= 2)//连续检测到三次一样则更新NTC状态
    7b64:	3a01      	cmphsi      	r2, 2
    7b66:	0803      	bt      	0x7b6c	// 7b6c <NTCStatusCheck+0x64>
			ntc_trigger_cnt++;
    7b68:	a342      	st.b      	r2, (r3, 0x2)
    7b6a:	07f6      	br      	0x7b56	// 7b56 <NTCStatusCheck+0x4e>
				ntc_trigger_cnt = 0;
    7b6c:	3200      	movi      	r2, 0
    7b6e:	a342      	st.b      	r2, (r3, 0x2)
				status_change_flag = FALSE;
    7b70:	a341      	st.b      	r2, (r3, 0x1)
				ntc_status_update(ntc_status);
    7b72:	e3fffe51 	bsr      	0x7814	// 7814 <ntc_status_update>
				app_stop_100_millisecond_timer(APP_NTC_TIMER_ID);//更新后停止定时器，作为信号量发送用
    7b76:	3005      	movi      	r0, 5
    7b78:	e3fffd44 	bsr      	0x7600	// 7600 <app_stop_100_millisecond_timer>
}
    7b7c:	07ed      	br      	0x7b56	// 7b56 <NTCStatusCheck+0x4e>
    7b7e:	0000      	bkpt
    7b80:	3fe74c00 	.long	0x3fe74c00
    7b84:	40a75800 	.long	0x40a75800
    7b88:	0000912a 	.long	0x0000912a
    7b8c:	200001a8 	.long	0x200001a8
    7b90:	20000288 	.long	0x20000288

Disassembly of section .text.EarphoneStatusCheck:

00007b94 <EarphoneStatusCheck>:
{
    7b94:	14d4      	push      	r4-r7, r15
    7b96:	1422      	subi      	r14, r14, 8
	printf("enter function->%s\r\n", __func__);
    7b98:	112d      	lrw      	r1, 0x8cc5	// 7c4c <EarphoneStatusCheck+0xb8>
    7b9a:	110e      	lrw      	r0, 0x90f9	// 7c50 <EarphoneStatusCheck+0xbc>
    7b9c:	e3ffdeaa 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
	L_pogo_adc = adc_get_val(L_EARBUD_POGO_ADC);
    7ba0:	3002      	movi      	r0, 2
    7ba2:	e3ffff51 	bsr      	0x7a44	// 7a44 <adc_get_val>
    7ba6:	6d43      	mov      	r5, r0
	R_pogo_adc = adc_get_val(R_EARBUD_POGO_ADC);
    7ba8:	3001      	movi      	r0, 1
    7baa:	e3ffff4d 	bsr      	0x7a44	// 7a44 <adc_get_val>
    7bae:	6d03      	mov      	r4, r0
	if(pogo_adc_to_mA(L_pogo_adc) <= 0 && pogo_adc_to_mA(R_pogo_adc) <= 0){
    7bb0:	6c17      	mov      	r0, r5
    7bb2:	e3ffdc41 	bsr      	0x3434	// 3434 <__floatunsidf>
    7bb6:	3200      	movi      	r2, 0
    7bb8:	1167      	lrw      	r3, 0x3fe76a00	// 7c54 <EarphoneStatusCheck+0xc0>
    7bba:	e3ffda23 	bsr      	0x3000	// 3000 <__muldf3>
    7bbe:	3200      	movi      	r2, 0
    7bc0:	1166      	lrw      	r3, 0x3fe00000	// 7c58 <EarphoneStatusCheck+0xc4>
    7bc2:	e3ffda1f 	bsr      	0x3000	// 3000 <__muldf3>
    7bc6:	e3ffd32f 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7bca:	3840      	cmpnei      	r0, 0
    7bcc:	6d83      	mov      	r6, r0
    7bce:	11e4      	lrw      	r7, 0x20000128	// 7c5c <EarphoneStatusCheck+0xc8>
    7bd0:	081f      	bt      	0x7c0e	// 7c0e <EarphoneStatusCheck+0x7a>
    7bd2:	6c13      	mov      	r0, r4
    7bd4:	e3ffdc30 	bsr      	0x3434	// 3434 <__floatunsidf>
    7bd8:	3200      	movi      	r2, 0
    7bda:	107f      	lrw      	r3, 0x3fe76a00	// 7c54 <EarphoneStatusCheck+0xc0>
    7bdc:	e3ffda12 	bsr      	0x3000	// 3000 <__muldf3>
    7be0:	3200      	movi      	r2, 0
    7be2:	107e      	lrw      	r3, 0x3fe00000	// 7c58 <EarphoneStatusCheck+0xc4>
    7be4:	e3ffda0e 	bsr      	0x3000	// 3000 <__muldf3>
    7be8:	e3ffd31e 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7bec:	3840      	cmpnei      	r0, 0
    7bee:	0810      	bt      	0x7c0e	// 7c0e <EarphoneStatusCheck+0x7a>
    7bf0:	b801      	st.w      	r0, (r14, 0x4)
		pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
    7bf2:	3003      	movi      	r0, 3
    7bf4:	e3fffd56 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
	earphone_status = status;  
    7bf8:	9861      	ld.w      	r3, (r14, 0x4)
    7bfa:	b77e      	st.w      	r3, (r7, 0x78)
		printf("no earphones in box: L: %lu, %lumA  R: %lu, %lumA\r\n",\
    7bfc:	b860      	st.w      	r3, (r14, 0x0)
    7bfe:	3200      	movi      	r2, 0
    7c00:	6cd3      	mov      	r3, r4
    7c02:	6c57      	mov      	r1, r5
    7c04:	1017      	lrw      	r0, 0x9137	// 7c60 <EarphoneStatusCheck+0xcc>
		printf("charge for earphones: L: %lu, %lumA  R: %lu, %lumA\r\n",\
    7c06:	e3ffde75 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
}
    7c0a:	1402      	addi      	r14, r14, 8
    7c0c:	1494      	pop      	r4-r7, r15
		pogo_pin_output_contrl(APP_OUTPUT_TYPE_BOOST5V);
    7c0e:	3000      	movi      	r0, 0
    7c10:	e3fffd48 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
	earphone_status = status;  
    7c14:	3301      	movi      	r3, 1
    7c16:	b77e      	st.w      	r3, (r7, 0x78)
		if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_status_indication_set(APP_STATUS_INDICATION_CHARGING_FOR_EARPHONE);
    7c18:	e3fffdac 	bsr      	0x7770	// 7770 <app_charge_type_get>
    7c1c:	3840      	cmpnei      	r0, 0
    7c1e:	0804      	bt      	0x7c26	// 7c26 <EarphoneStatusCheck+0x92>
    7c20:	3008      	movi      	r0, 8
    7c22:	e000058d 	bsr      	0x873c	// 873c <app_status_indication_set>
			L_pogo_adc, pogo_adc_to_mA(L_pogo_adc), R_pogo_adc, pogo_adc_to_mA(R_pogo_adc));
    7c26:	6c13      	mov      	r0, r4
    7c28:	e3ffdc06 	bsr      	0x3434	// 3434 <__floatunsidf>
    7c2c:	3200      	movi      	r2, 0
    7c2e:	106a      	lrw      	r3, 0x3fe76a00	// 7c54 <EarphoneStatusCheck+0xc0>
    7c30:	e3ffd9e8 	bsr      	0x3000	// 3000 <__muldf3>
    7c34:	3200      	movi      	r2, 0
    7c36:	1069      	lrw      	r3, 0x3fe00000	// 7c58 <EarphoneStatusCheck+0xc4>
    7c38:	e3ffd9e4 	bsr      	0x3000	// 3000 <__muldf3>
		printf("charge for earphones: L: %lu, %lumA  R: %lu, %lumA\r\n",\
    7c3c:	e3ffd2f4 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7c40:	b800      	st.w      	r0, (r14, 0x0)
    7c42:	6cd3      	mov      	r3, r4
    7c44:	6c9b      	mov      	r2, r6
    7c46:	6c57      	mov      	r1, r5
    7c48:	1007      	lrw      	r0, 0x916b	// 7c64 <EarphoneStatusCheck+0xd0>
    7c4a:	07de      	br      	0x7c06	// 7c06 <EarphoneStatusCheck+0x72>
    7c4c:	00008cc5 	.long	0x00008cc5
    7c50:	000090f9 	.long	0x000090f9
    7c54:	3fe76a00 	.long	0x3fe76a00
    7c58:	3fe00000 	.long	0x3fe00000
    7c5c:	20000128 	.long	0x20000128
    7c60:	00009137 	.long	0x00009137
    7c64:	0000916b 	.long	0x0000916b

Disassembly of section .text.EarphoneOvercurrentCheck:

00007c68 <EarphoneOvercurrentCheck>:
{
    7c68:	14d4      	push      	r4-r7, r15
    7c6a:	1421      	subi      	r14, r14, 4
	L_pogo_adc = adc_get_val(L_EARBUD_POGO_ADC);
    7c6c:	3002      	movi      	r0, 2
    7c6e:	e3fffeeb 	bsr      	0x7a44	// 7a44 <adc_get_val>
    7c72:	6d83      	mov      	r6, r0
	R_pogo_adc = adc_get_val(R_EARBUD_POGO_ADC);
    7c74:	3001      	movi      	r0, 1
    7c76:	e3fffee7 	bsr      	0x7a44	// 7a44 <adc_get_val>
    7c7a:	6d43      	mov      	r5, r0
	if(pogo_adc_to_mA(L_pogo_adc) >= EARPHONE_OVER_CURRENT_MA || pogo_adc_to_mA(R_pogo_adc) >= EARPHONE_OVER_CURRENT_MA) {//过流保护检测
    7c7c:	6c1b      	mov      	r0, r6
    7c7e:	e3ffdbdb 	bsr      	0x3434	// 3434 <__floatunsidf>
    7c82:	3200      	movi      	r2, 0
    7c84:	116d      	lrw      	r3, 0x3fe76a00	// 7d38 <EarphoneOvercurrentCheck+0xd0>
    7c86:	e3ffd9bd 	bsr      	0x3000	// 3000 <__muldf3>
    7c8a:	116d      	lrw      	r3, 0x3fe00000	// 7d3c <EarphoneOvercurrentCheck+0xd4>
    7c8c:	3200      	movi      	r2, 0
    7c8e:	e3ffd9b9 	bsr      	0x3000	// 3000 <__muldf3>
    7c92:	e3ffd2c9 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7c96:	3363      	movi      	r3, 99
    7c98:	640c      	cmphs      	r3, r0
    7c9a:	6dc3      	mov      	r7, r0
    7c9c:	1189      	lrw      	r4, 0x20000288	// 7d40 <EarphoneOvercurrentCheck+0xd8>
    7c9e:	0c11      	bf      	0x7cc0	// 7cc0 <EarphoneOvercurrentCheck+0x58>
    7ca0:	6c17      	mov      	r0, r5
    7ca2:	e3ffdbc9 	bsr      	0x3434	// 3434 <__floatunsidf>
    7ca6:	3200      	movi      	r2, 0
    7ca8:	1164      	lrw      	r3, 0x3fe76a00	// 7d38 <EarphoneOvercurrentCheck+0xd0>
    7caa:	e3ffd9ab 	bsr      	0x3000	// 3000 <__muldf3>
    7cae:	1164      	lrw      	r3, 0x3fe00000	// 7d3c <EarphoneOvercurrentCheck+0xd4>
    7cb0:	3200      	movi      	r2, 0
    7cb2:	e3ffd9a7 	bsr      	0x3000	// 3000 <__muldf3>
    7cb6:	e3ffd2b7 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7cba:	3363      	movi      	r3, 99
    7cbc:	640c      	cmphs      	r3, r0
    7cbe:	083b      	bt      	0x7d34	// 7d34 <EarphoneOvercurrentCheck+0xcc>
		overcur_cnt++;
    7cc0:	8463      	ld.b      	r3, (r4, 0x3)
    7cc2:	2300      	addi      	r3, 1
	}else overcur_cnt = 0;
    7cc4:	a463      	st.b      	r3, (r4, 0x3)
	if(overcur_cnt >= 3) {//过流保护处理
    7cc6:	8463      	ld.b      	r3, (r4, 0x3)
    7cc8:	3b02      	cmphsi      	r3, 3
    7cca:	0c33      	bf      	0x7d30	// 7d30 <EarphoneOvercurrentCheck+0xc8>
		overcur_cnt = 0;
    7ccc:	3300      	movi      	r3, 0
		pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
    7cce:	3003      	movi      	r0, 3
		overcur_cnt = 0;
    7cd0:	a463      	st.b      	r3, (r4, 0x3)
		pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
    7cd2:	e3fffce7 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
		GPIO_Write_Low(charge_enable_pin);
    7cd6:	107c      	lrw      	r3, 0x20000050	// 7d44 <EarphoneOvercurrentCheck+0xdc>
    7cd8:	3106      	movi      	r1, 6
    7cda:	9300      	ld.w      	r0, (r3, 0x0)
    7cdc:	e3ffe9be 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
	earphone_status = status;  
    7ce0:	107a      	lrw      	r3, 0x20000128	// 7d48 <EarphoneOvercurrentCheck+0xe0>
    7ce2:	3203      	movi      	r2, 3
    7ce4:	b35e      	st.w      	r2, (r3, 0x78)
		app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT);
    7ce6:	300a      	movi      	r0, 10
	battery_status = status;
    7ce8:	3204      	movi      	r2, 4
    7cea:	b35f      	st.w      	r2, (r3, 0x7c)
		app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT);
    7cec:	e0000528 	bsr      	0x873c	// 873c <app_status_indication_set>
		app_stop_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
    7cf0:	3004      	movi      	r0, 4
    7cf2:	e3fffc87 	bsr      	0x7600	// 7600 <app_stop_100_millisecond_timer>
		app_stop_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
    7cf6:	3002      	movi      	r0, 2
    7cf8:	e3fffc84 	bsr      	0x7600	// 7600 <app_stop_100_millisecond_timer>
		app_stop_100_millisecond_timer(APP_OVERCURRENT_TIMER_ID);
    7cfc:	3003      	movi      	r0, 3
    7cfe:	e3fffc81 	bsr      	0x7600	// 7600 <app_stop_100_millisecond_timer>
		app_stop_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
    7d02:	3000      	movi      	r0, 0
    7d04:	e3fffc7e 	bsr      	0x7600	// 7600 <app_stop_100_millisecond_timer>
			L_pogo_adc, pogo_adc_to_mA(L_pogo_adc), R_pogo_adc, pogo_adc_to_mA(R_pogo_adc));
    7d08:	6c17      	mov      	r0, r5
    7d0a:	e3ffdb95 	bsr      	0x3434	// 3434 <__floatunsidf>
    7d0e:	3200      	movi      	r2, 0
    7d10:	106a      	lrw      	r3, 0x3fe76a00	// 7d38 <EarphoneOvercurrentCheck+0xd0>
    7d12:	e3ffd977 	bsr      	0x3000	// 3000 <__muldf3>
    7d16:	3200      	movi      	r2, 0
    7d18:	1069      	lrw      	r3, 0x3fe00000	// 7d3c <EarphoneOvercurrentCheck+0xd4>
    7d1a:	e3ffd973 	bsr      	0x3000	// 3000 <__muldf3>
		printf("earphone charging overcurrent!!!: L: %lu, %lumA  R: %lu, %lumA\r\n",\
    7d1e:	e3ffd283 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7d22:	b800      	st.w      	r0, (r14, 0x0)
    7d24:	6cd7      	mov      	r3, r5
    7d26:	6c9f      	mov      	r2, r7
    7d28:	6c5b      	mov      	r1, r6
    7d2a:	1009      	lrw      	r0, 0x91a0	// 7d4c <EarphoneOvercurrentCheck+0xe4>
    7d2c:	e3ffdde2 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
}
    7d30:	1401      	addi      	r14, r14, 4
    7d32:	1494      	pop      	r4-r7, r15
	}else overcur_cnt = 0;
    7d34:	3300      	movi      	r3, 0
    7d36:	07c7      	br      	0x7cc4	// 7cc4 <EarphoneOvercurrentCheck+0x5c>
    7d38:	3fe76a00 	.long	0x3fe76a00
    7d3c:	3fe00000 	.long	0x3fe00000
    7d40:	20000288 	.long	0x20000288
    7d44:	20000050 	.long	0x20000050
    7d48:	20000128 	.long	0x20000128
    7d4c:	000091a0 	.long	0x000091a0

Disassembly of section .text.app_recover:

00007d50 <app_recover>:
{
    7d50:	14d2      	push      	r4-r5, r15
	UART1_CONFIG(115200);
    7d52:	30e1      	movi      	r0, 225
    7d54:	4009      	lsli      	r0, r0, 9
    7d56:	e3fff113 	bsr      	0x5f7c	// 5f7c <UART1_CONFIG>
	GPIO_Init(charge_status_pin, Intput);
    7d5a:	1286      	lrw      	r4, 0x20000050	// 7e70 <app_recover+0x120>
	Coret_DelayMs(20);//延时使NTC电压稳定
    7d5c:	3014      	movi      	r0, 20
    7d5e:	3100      	movi      	r1, 0
    7d60:	e00006be 	bsr      	0x8adc	// 8adc <Coret_DelayMs>
	GPIO_Init(charge_status_pin, Intput);
    7d64:	3201      	movi      	r2, 1
    7d66:	310b      	movi      	r1, 11
    7d68:	9400      	ld.w      	r0, (r4, 0x0)
    7d6a:	e3ffe78b 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_PullHigh_Init(charge_status_pin);
    7d6e:	310b      	movi      	r1, 11
    7d70:	9400      	ld.w      	r0, (r4, 0x0)
    7d72:	e3ffe849 	bsr      	0x4e04	// 4e04 <GPIO_PullHigh_Init>
	GPIO_Init(charge_enable_pin, Output);
    7d76:	3200      	movi      	r2, 0
    7d78:	3106      	movi      	r1, 6
    7d7a:	9400      	ld.w      	r0, (r4, 0x0)
    7d7c:	e3ffe782 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	if(app_charge_type_get() != APP_CHARGE_TYPE_DISCHARGE) 
    7d80:	e3fffcf8 	bsr      	0x7770	// 7770 <app_charge_type_get>
    7d84:	3840      	cmpnei      	r0, 0
    7d86:	0c30      	bf      	0x7de6	// 7de6 <app_recover+0x96>
		GPIO_Write_High(charge_enable_pin);
    7d88:	3106      	movi      	r1, 6
    7d8a:	9400      	ld.w      	r0, (r4, 0x0)
    7d8c:	e3ffe962 	bsr      	0x5050	// 5050 <GPIO_Write_High>
		GPIO_Write_High(NTC_detect_pin);
    7d90:	310e      	movi      	r1, 14
    7d92:	9400      	ld.w      	r0, (r4, 0x0)
    7d94:	e3ffe95e 	bsr      	0x5050	// 5050 <GPIO_Write_High>
		Coret_DelayMs(20);//延时使NTC电压稳定
    7d98:	3100      	movi      	r1, 0
    7d9a:	3014      	movi      	r0, 20
    7d9c:	e00006a0 	bsr      	0x8adc	// 8adc <Coret_DelayMs>
		ntc_status_update(ntc_status_measure(ntc_adc_to_mv(adc_get_val(NTC_ADC))));
    7da0:	3003      	movi      	r0, 3
    7da2:	e3fffe51 	bsr      	0x7a44	// 7a44 <adc_get_val>
    7da6:	3380      	movi      	r3, 128
    7da8:	4365      	lsli      	r3, r3, 5
    7daa:	5b01      	subu      	r0, r3, r0
    7dac:	e3ffdb44 	bsr      	0x3434	// 3434 <__floatunsidf>
    7db0:	3200      	movi      	r2, 0
    7db2:	1171      	lrw      	r3, 0x3fe74c00	// 7e74 <app_recover+0x124>
    7db4:	e3ffd926 	bsr      	0x3000	// 3000 <__muldf3>
    7db8:	6c83      	mov      	r2, r0
    7dba:	6cc7      	mov      	r3, r1
    7dbc:	3000      	movi      	r0, 0
    7dbe:	112f      	lrw      	r1, 0x40a75800	// 7e78 <app_recover+0x128>
    7dc0:	e3ffd904 	bsr      	0x2fc8	// 2fc8 <__subdf3>
    7dc4:	e3ffd230 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7dc8:	e3fffd8e 	bsr      	0x78e4	// 78e4 <ntc_status_measure>
    7dcc:	e3fffd24 	bsr      	0x7814	// 7814 <ntc_status_update>
	return NTC_status;
    7dd0:	116b      	lrw      	r3, 0x200001a8	// 7e7c <app_recover+0x12c>
    7dd2:	93a1      	ld.w      	r5, (r3, 0x4)
		charge_current_control(ntc_status_get(), app_charge_type_get());
    7dd4:	e3fffcce 	bsr      	0x7770	// 7770 <app_charge_type_get>
    7dd8:	6c43      	mov      	r1, r0
    7dda:	6c17      	mov      	r0, r5
    7ddc:	e3fffd2c 	bsr      	0x7834	// 7834 <charge_current_control>
		app_start_100_millisecond_timer(APP_NTC_TIMER_ID);//重新开启NTC检测定时器
    7de0:	3005      	movi      	r0, 5
    7de2:	e3fffc27 	bsr      	0x7630	// 7630 <app_start_100_millisecond_timer>
	EXTI_trigger_CMD(ENABLE, EXI_PIN3, _EXIFT);//启用拔出USB唤醒
    7de6:	3201      	movi      	r2, 1
    7de8:	3108      	movi      	r1, 8
    7dea:	3001      	movi      	r0, 1
    7dec:	e3ffe668 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	EXTI_trigger_CMD(ENABLE, EXI_PIN0, _EXIFT);//启用移开无线充电源唤醒
    7df0:	3201      	movi      	r2, 1
    7df2:	3101      	movi      	r1, 1
    7df4:	3001      	movi      	r0, 1
    7df6:	e3ffe663 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	ADC12_ConversionChannel_Config(ADC12_ADCIN10, ADC12_CV_RepeatNum8, ADC12_AVGEN, 0);
    7dfa:	3280      	movi      	r2, 128
    7dfc:	31c6      	movi      	r1, 198
    7dfe:	3300      	movi      	r3, 0
    7e00:	4245      	lsli      	r2, r2, 5
    7e02:	4127      	lsli      	r1, r1, 7
    7e04:	300a      	movi      	r0, 10
    7e06:	e3ffefdf 	bsr      	0x5dc4	// 5dc4 <ADC12_ConversionChannel_Config>
	ADC12_ConversionChannel_Config(ADC12_ADCIN4, ADC12_CV_RepeatNum8, ADC12_AVGEN, 1);
    7e0a:	3280      	movi      	r2, 128
    7e0c:	31c6      	movi      	r1, 198
    7e0e:	3301      	movi      	r3, 1
    7e10:	4245      	lsli      	r2, r2, 5
    7e12:	4127      	lsli      	r1, r1, 7
    7e14:	3004      	movi      	r0, 4
    7e16:	e3ffefd7 	bsr      	0x5dc4	// 5dc4 <ADC12_ConversionChannel_Config>
	ADC12_ConversionChannel_Config(ADC12_ADCIN13, ADC12_CV_RepeatNum8, ADC12_AVGEN, 2);
    7e1a:	3280      	movi      	r2, 128
    7e1c:	31c6      	movi      	r1, 198
    7e1e:	3302      	movi      	r3, 2
    7e20:	4245      	lsli      	r2, r2, 5
    7e22:	4127      	lsli      	r1, r1, 7
    7e24:	300d      	movi      	r0, 13
    7e26:	e3ffefcf 	bsr      	0x5dc4	// 5dc4 <ADC12_ConversionChannel_Config>
	ADC12_ConversionChannel_Config(ADC12_ADCIN11, ADC12_CV_RepeatNum8, ADC12_AVGEN, 3);
    7e2a:	3280      	movi      	r2, 128
    7e2c:	31c6      	movi      	r1, 198
    7e2e:	3303      	movi      	r3, 3
    7e30:	4245      	lsli      	r2, r2, 5
    7e32:	4127      	lsli      	r1, r1, 7
    7e34:	300b      	movi      	r0, 11
    7e36:	e3ffefc7 	bsr      	0x5dc4	// 5dc4 <ADC12_ConversionChannel_Config>
	ADC12_CMD(ENABLE);
    7e3a:	3001      	movi      	r0, 1
    7e3c:	e3ffee92 	bsr      	0x5b60	// 5b60 <ADC12_CMD>
	ADC12_ready_wait();
    7e40:	e3ffeea4 	bsr      	0x5b88	// 5b88 <ADC12_ready_wait>
	EPT_IO_SET(EPT_IO_CHBX, IO_NUM_PB02);
    7e44:	3116      	movi      	r1, 22
    7e46:	3002      	movi      	r0, 2
    7e48:	e3ffec6a 	bsr      	0x571c	// 571c <EPT_IO_SET>
	GPIO_Init(blue_led_pin, Output);
    7e4c:	3200      	movi      	r2, 0
    7e4e:	9400      	ld.w      	r0, (r4, 0x0)
    7e50:	3108      	movi      	r1, 8
    7e52:	e3ffe717 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	EPT_IO_SET(EPT_IO_CHAY, IO_NUM_PB03);
    7e56:	3113      	movi      	r1, 19
    7e58:	3001      	movi      	r0, 1
    7e5a:	e3ffec61 	bsr      	0x571c	// 571c <EPT_IO_SET>
	GPIOA0_EXI_Init(EXI4); /* GPIOA0.04设置为输入模式，输出禁止 */ 
    7e5e:	3004      	movi      	r0, 4
    7e60:	e3ffe874 	bsr      	0x4f48	// 4f48 <GPIOA0_EXI_Init>
	GPIO_PullLow_Init(key_pin);
    7e64:	9400      	ld.w      	r0, (r4, 0x0)
    7e66:	3104      	movi      	r1, 4
    7e68:	e3ffe7d8 	bsr      	0x4e18	// 4e18 <GPIO_PullLow_Init>
}
    7e6c:	1492      	pop      	r4-r5, r15
    7e6e:	0000      	bkpt
    7e70:	20000050 	.long	0x20000050
    7e74:	3fe74c00 	.long	0x3fe74c00
    7e78:	40a75800 	.long	0x40a75800
    7e7c:	200001a8 	.long	0x200001a8

Disassembly of section .text.system_goto_deepsleep_mode:

00007e80 <system_goto_deepsleep_mode>:
{	
    7e80:	14d2      	push      	r4-r5, r15
	is_system_active = FALSE;
    7e82:	3300      	movi      	r3, 0
    7e84:	1092      	lrw      	r4, 0x200001a8	// 7ecc <system_goto_deepsleep_mode+0x4c>
	app_status_indication_set(APP_STATUS_INDICATION_DSLEEP);
    7e86:	300f      	movi      	r0, 15
	is_system_active = FALSE;
    7e88:	a46c      	st.b      	r3, (r4, 0xc)
	app_status_indication_set(APP_STATUS_INDICATION_DSLEEP);
    7e8a:	e0000459 	bsr      	0x873c	// 873c <app_status_indication_set>
	printf("system goto deepsleep\r\n");
    7e8e:	1011      	lrw      	r0, 0x91e1	// 7ed0 <system_goto_deepsleep_mode+0x50>
    7e90:	e3ffdd42 	bsr      	0x3914	// 3914 <__GI_puts>
	printf("bye bye~~\r\n");
    7e94:	1010      	lrw      	r0, 0x91f8	// 7ed4 <system_goto_deepsleep_mode+0x54>
    7e96:	e3ffdd3f 	bsr      	0x3914	// 3914 <__GI_puts>
	app_deinit();
    7e9a:	e3fffd5d 	bsr      	0x7954	// 7954 <app_deinit>
	PCLK_goto_deepsleep_mode();
    7e9e:	e3ffe649 	bsr      	0x4b30	// 4b30 <PCLK_goto_deepsleep_mode>
	Coret_DelayMs(100); //系统唤醒后，延时使其稳定
    7ea2:	3064      	movi      	r0, 100
    7ea4:	3100      	movi      	r1, 0
    7ea6:	e000061b 	bsr      	0x8adc	// 8adc <Coret_DelayMs>
		printf("\r\n\r\nsystem wakeup!!!\r\n");
    7eaa:	10ac      	lrw      	r5, 0x9203	// 7ed8 <system_goto_deepsleep_mode+0x58>
		app_recover();
    7eac:	e3ffff52 	bsr      	0x7d50	// 7d50 <app_recover>
		Coret_DelayMs(20);//延时使初始化稳定
    7eb0:	3014      	movi      	r0, 20
    7eb2:	3100      	movi      	r1, 0
    7eb4:	e0000614 	bsr      	0x8adc	// 8adc <Coret_DelayMs>
		is_system_active = TRUE;
    7eb8:	3301      	movi      	r3, 1
		printf("\r\n\r\nsystem wakeup!!!\r\n");
    7eba:	6c17      	mov      	r0, r5
		is_system_active = TRUE;
    7ebc:	a46c      	st.b      	r3, (r4, 0xc)
		printf("\r\n\r\nsystem wakeup!!!\r\n");
    7ebe:	e3ffdd2b 	bsr      	0x3914	// 3914 <__GI_puts>
	}while(is_system_active == FALSE);
    7ec2:	846c      	ld.b      	r3, (r4, 0xc)
    7ec4:	3b40      	cmpnei      	r3, 0
    7ec6:	0ff3      	bf      	0x7eac	// 7eac <system_goto_deepsleep_mode+0x2c>
}
    7ec8:	1492      	pop      	r4-r5, r15
    7eca:	0000      	bkpt
    7ecc:	200001a8 	.long	0x200001a8
    7ed0:	000091e1 	.long	0x000091e1
    7ed4:	000091f8 	.long	0x000091f8
    7ed8:	00009203 	.long	0x00009203

Disassembly of section .text.system_shutdown:

00007edc <system_shutdown>:
{
    7edc:	14d0      	push      	r15
	EXI1_WakeUp_Disable();
    7ede:	e3ffe65f 	bsr      	0x4b9c	// 4b9c <EXI1_WakeUp_Disable>
	EXI3_WakeUp_Disable();
    7ee2:	e3ffe675 	bsr      	0x4bcc	// 4bcc <EXI3_WakeUp_Disable>
	EXTI_trigger_CMD(DISABLE, EXI_PIN3, _EXIFT);//禁止USB-C拔出唤醒
    7ee6:	3201      	movi      	r2, 1
    7ee8:	3108      	movi      	r1, 8
    7eea:	3000      	movi      	r0, 0
    7eec:	e3ffe5e8 	bsr      	0x4abc	// 4abc <EXTI_trigger_CMD>
	printf("system shutdown!!!\r\n");
    7ef0:	1004      	lrw      	r0, 0x9219	// 7f00 <system_shutdown+0x24>
    7ef2:	e3ffdd11 	bsr      	0x3914	// 3914 <__GI_puts>
	system_goto_deepsleep_mode(0);
    7ef6:	3000      	movi      	r0, 0
    7ef8:	e3ffffc4 	bsr      	0x7e80	// 7e80 <system_goto_deepsleep_mode>
}
    7efc:	1490      	pop      	r15
    7efe:	0000      	bkpt
    7f00:	00009219 	.long	0x00009219

Disassembly of section .text.is_hall_active:

00007f04 <is_hall_active>:

S8_T is_hall_active(void)
{
    7f04:	14d0      	push      	r15
	if(GPIO_Read_Status(hall_en_pin)) return 0;
    7f06:	1065      	lrw      	r3, 0x20000050	// 7f18 <is_hall_active+0x14>
    7f08:	3101      	movi      	r1, 1
    7f0a:	9300      	ld.w      	r0, (r3, 0x0)
    7f0c:	e3ffe8b5 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    7f10:	3840      	cmpnei      	r0, 0
    7f12:	6403      	mvcv      	r0
    7f14:	7402      	sextb      	r0, r0
	else return 1;
}
    7f16:	1490      	pop      	r15
    7f18:	20000050 	.long	0x20000050

Disassembly of section .text.charging_case_battery_indication_handle:

00007f1c <charging_case_battery_indication_handle>:

S8_T charging_case_battery_indication_handle(void)
{
    7f1c:	14d1      	push      	r4, r15
	return battery_percentage;
    7f1e:	106c      	lrw      	r3, 0x200001a8	// 7f4c <charging_case_battery_indication_handle+0x30>
    7f20:	8360      	ld.b      	r3, (r3, 0x0)
	S8_T level = 0;

	level = battery_power_get();
    7f22:	750e      	sextb      	r4, r3

	if(level <= 10){
    7f24:	3c2a      	cmplti      	r4, 11
    7f26:	0c06      	bf      	0x7f32	// 7f32 <charging_case_battery_indication_handle+0x16>
		app_status_indication_set(APP_STATUS_INDICATION_BATTERY_WARNING);
    7f28:	3007      	movi      	r0, 7
	} else if(level > 10 && level <= 50){
		app_status_indication_set(APP_STATUS_INDICATION_BATTERY_MIDDLE);	
	} else if(level > 50){
		app_status_indication_set(APP_STATUS_INDICATION_BATTERY_HIGH);
    7f2a:	e0000409 	bsr      	0x873c	// 873c <app_status_indication_set>
	}
	
	return level;
}
    7f2e:	6c13      	mov      	r0, r4
    7f30:	1491      	pop      	r4, r15
	} else if(level > 10 && level <= 50){
    7f32:	2b0a      	subi      	r3, 11
    7f34:	74cc      	zextb      	r3, r3
    7f36:	3227      	movi      	r2, 39
    7f38:	64c8      	cmphs      	r2, r3
    7f3a:	0c03      	bf      	0x7f40	// 7f40 <charging_case_battery_indication_handle+0x24>
		app_status_indication_set(APP_STATUS_INDICATION_BATTERY_MIDDLE);	
    7f3c:	3005      	movi      	r0, 5
    7f3e:	07f6      	br      	0x7f2a	// 7f2a <charging_case_battery_indication_handle+0xe>
	} else if(level > 50){
    7f40:	3332      	movi      	r3, 50
    7f42:	650d      	cmplt      	r3, r4
    7f44:	0ff5      	bf      	0x7f2e	// 7f2e <charging_case_battery_indication_handle+0x12>
		app_status_indication_set(APP_STATUS_INDICATION_BATTERY_HIGH);
    7f46:	3004      	movi      	r0, 4
    7f48:	07f1      	br      	0x7f2a	// 7f2a <charging_case_battery_indication_handle+0xe>
    7f4a:	0000      	bkpt
    7f4c:	200001a8 	.long	0x200001a8

Disassembly of section .text.is_earphone_fully_charged:

00007f50 <is_earphone_fully_charged>:

S8_T is_earphone_fully_charged(void)
{
    7f50:	14d3      	push      	r4-r6, r15
    7f52:	1421      	subi      	r14, r14, 4
	U32_T L_pogo_adc, R_pogo_adc;

	L_pogo_adc = adc_get_val(L_EARBUD_POGO_ADC);
    7f54:	3002      	movi      	r0, 2
    7f56:	e3fffd77 	bsr      	0x7a44	// 7a44 <adc_get_val>
    7f5a:	6d03      	mov      	r4, r0
	R_pogo_adc = adc_get_val(R_EARBUD_POGO_ADC);
    7f5c:	3001      	movi      	r0, 1
    7f5e:	e3fffd73 	bsr      	0x7a44	// 7a44 <adc_get_val>
    7f62:	6d83      	mov      	r6, r0
	if(pogo_adc_to_mA(L_pogo_adc) <= EARPHONE_FULL_CHARGE_MA && pogo_adc_to_mA(R_pogo_adc) <= EARPHONE_FULL_CHARGE_MA)
    7f64:	6c13      	mov      	r0, r4
    7f66:	e3ffda67 	bsr      	0x3434	// 3434 <__floatunsidf>
    7f6a:	3200      	movi      	r2, 0
    7f6c:	1074      	lrw      	r3, 0x3fe76a00	// 7fbc <is_earphone_fully_charged+0x6c>
    7f6e:	e3ffd849 	bsr      	0x3000	// 3000 <__muldf3>
    7f72:	3200      	movi      	r2, 0
    7f74:	1073      	lrw      	r3, 0x3fe00000	// 7fc0 <is_earphone_fully_charged+0x70>
    7f76:	e3ffd845 	bsr      	0x3000	// 3000 <__muldf3>
    7f7a:	e3ffd155 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7f7e:	3805      	cmphsi      	r0, 6
    7f80:	6d43      	mov      	r5, r0
    7f82:	081a      	bt      	0x7fb6	// 7fb6 <is_earphone_fully_charged+0x66>
    7f84:	6c1b      	mov      	r0, r6
    7f86:	e3ffda57 	bsr      	0x3434	// 3434 <__floatunsidf>
    7f8a:	3200      	movi      	r2, 0
    7f8c:	106c      	lrw      	r3, 0x3fe76a00	// 7fbc <is_earphone_fully_charged+0x6c>
    7f8e:	e3ffd839 	bsr      	0x3000	// 3000 <__muldf3>
    7f92:	3200      	movi      	r2, 0
    7f94:	106b      	lrw      	r3, 0x3fe00000	// 7fc0 <is_earphone_fully_charged+0x70>
    7f96:	e3ffd835 	bsr      	0x3000	// 3000 <__muldf3>
    7f9a:	e3ffd145 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    7f9e:	3805      	cmphsi      	r0, 6
    7fa0:	080b      	bt      	0x7fb6	// 7fb6 <is_earphone_fully_charged+0x66>
	{
		printf("earphones are fully charged: L: %lu, %lumA	R: %lu, %lumA\r\n",\
    7fa2:	b800      	st.w      	r0, (r14, 0x0)
    7fa4:	6cdb      	mov      	r3, r6
    7fa6:	6c97      	mov      	r2, r5
    7fa8:	6c53      	mov      	r1, r4
    7faa:	1007      	lrw      	r0, 0x922d	// 7fc4 <is_earphone_fully_charged+0x74>
    7fac:	e3ffdca2 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
			L_pogo_adc, pogo_adc_to_mA(L_pogo_adc), R_pogo_adc, pogo_adc_to_mA(R_pogo_adc));
		return TRUE;
    7fb0:	3001      	movi      	r0, 1
	} 

	return FALSE;
}
    7fb2:	1401      	addi      	r14, r14, 4
    7fb4:	1493      	pop      	r4-r6, r15
	return FALSE;
    7fb6:	3000      	movi      	r0, 0
    7fb8:	07fd      	br      	0x7fb2	// 7fb2 <is_earphone_fully_charged+0x62>
    7fba:	0000      	bkpt
    7fbc:	3fe76a00 	.long	0x3fe76a00
    7fc0:	3fe00000 	.long	0x3fe00000
    7fc4:	0000922d 	.long	0x0000922d

Disassembly of section .text.box_open_close_handle_progress:

00007fc8 <box_open_close_handle_progress>:

S8_T box_open_close_handle_progress(void)
{
    7fc8:	14d3      	push      	r4-r6, r15
	static enum APP_HALL_STATUS_T pre_status = APP_HALL_STATUS_INVALID;
	static U16_T time_cnt = 0;

	if(app_status_indication_get() == APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT) return -1;//过流保护
    7fca:	e00003d1 	bsr      	0x876c	// 876c <app_status_indication_get>
    7fce:	384a      	cmpnei      	r0, 10
    7fd0:	0ce6      	bf      	0x819c	// 819c <box_open_close_handle_progress+0x1d4>
	
	hall_status = is_hall_active()? APP_HALL_STATUS_CLOSE_BOX : APP_HALL_STATUS_OPEN_BOX;
    7fd2:	e3ffff99 	bsr      	0x7f04	// 7f04 <is_hall_active>
    7fd6:	3840      	cmpnei      	r0, 0
    7fd8:	3300      	movi      	r3, 0
    7fda:	60cd      	addc      	r3, r3
    7fdc:	74cc      	zextb      	r3, r3
    7fde:	1393      	lrw      	r4, 0x20000128	// 81a8 <box_open_close_handle_progress+0x1e0>
    7fe0:	3580      	movi      	r5, 128
    7fe2:	6150      	addu      	r5, r4

	switch(hall_status)
    7fe4:	3b41      	cmpnei      	r3, 1
	hall_status = is_hall_active()? APP_HALL_STATUS_CLOSE_BOX : APP_HALL_STATUS_OPEN_BOX;
    7fe6:	b564      	st.w      	r3, (r5, 0x10)
    7fe8:	6d93      	mov      	r6, r4
    7fea:	9565      	ld.w      	r3, (r5, 0x14)
	switch(hall_status)
    7fec:	0887      	bt      	0x80fa	// 80fa <box_open_close_handle_progress+0x132>
	{
		case APP_HALL_STATUS_CLOSE_BOX:
			if(hall_status != pre_status) {
    7fee:	3b41      	cmpnei      	r3, 1
    7ff0:	0c2a      	bf      	0x8044	// 8044 <box_open_close_handle_progress+0x7c>
				time_cnt = 0;
    7ff2:	136f      	lrw      	r3, 0x20000288	// 81ac <box_open_close_handle_progress+0x1e4>
    7ff4:	3200      	movi      	r2, 0
    7ff6:	ab42      	st.h      	r2, (r3, 0x4)
				if(app_battery_status_get() == APP_BATTERY_STATUS_NTC_ERROR) {
    7ff8:	947f      	ld.w      	r3, (r4, 0x7c)
    7ffa:	3b43      	cmpnei      	r3, 3
    7ffc:	0814      	bt      	0x8024	// 8024 <box_open_close_handle_progress+0x5c>
					pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
    7ffe:	3003      	movi      	r0, 3
    8000:	e3fffb50 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
	earphone_status = status;  
    8004:	3304      	movi      	r3, 4
					earphone_status_update(APP_EARPHONE_STATUS_WAIT_FOR_CHARFE);
					printf("earphone charge NTC error!!!\r\n");
    8006:	130b      	lrw      	r0, 0x9268	// 81b0 <box_open_close_handle_progress+0x1e8>
	earphone_status = status;  
    8008:	b47e      	st.w      	r3, (r4, 0x78)
					printf("earphone charge NTC error!!!\r\n");
    800a:	e3ffdc85 	bsr      	0x3914	// 3914 <__GI_puts>
				} else if(battery_power_get() > 0){
					if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) charging_case_battery_indication_handle();
					pogo_pin_output_contrl(APP_OUTPUT_TYPE_BOOST5V);
					app_start_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
				}
				EXI3_WakeUp_Disable(); //合盖，按键动作不唤醒
    800e:	e3ffe5df 	bsr      	0x4bcc	// 4bcc <EXI3_WakeUp_Disable>
				app_stop_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
    8012:	3000      	movi      	r0, 0
    8014:	e3fffaf6 	bsr      	0x7600	// 7600 <app_stop_100_millisecond_timer>
				app_stop_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
    8018:	3004      	movi      	r0, 4
					pogo_pin_output_contrl(APP_OUTPUT_TYPE_BOOST5V);
					app_start_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
				}
				EXI3_WakeUp_Enable(); //开盖，按键动作要唤醒
				app_stop_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
				app_stop_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
    801a:	e3fffaf3 	bsr      	0x7600	// 7600 <app_stop_100_millisecond_timer>
				pre_status = hall_status;
    801e:	9564      	ld.w      	r3, (r5, 0x10)
    8020:	b565      	st.w      	r3, (r5, 0x14)
    8022:	041d      	br      	0x805c	// 805c <box_open_close_handle_progress+0x94>
				} else if(battery_power_get() > 0){
    8024:	8560      	ld.b      	r3, (r5, 0x0)
    8026:	3b40      	cmpnei      	r3, 0
    8028:	0ff3      	bf      	0x800e	// 800e <box_open_close_handle_progress+0x46>
					if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) charging_case_battery_indication_handle();
    802a:	e3fffba3 	bsr      	0x7770	// 7770 <app_charge_type_get>
    802e:	3840      	cmpnei      	r0, 0
    8030:	0803      	bt      	0x8036	// 8036 <box_open_close_handle_progress+0x6e>
    8032:	e3ffff75 	bsr      	0x7f1c	// 7f1c <charging_case_battery_indication_handle>
					pogo_pin_output_contrl(APP_OUTPUT_TYPE_BOOST5V);
    8036:	3000      	movi      	r0, 0
    8038:	e3fffb34 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
					app_start_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
    803c:	3002      	movi      	r0, 2
    803e:	e3fffaf9 	bsr      	0x7630	// 7630 <app_start_100_millisecond_timer>
    8042:	07e6      	br      	0x800e	// 800e <box_open_close_handle_progress+0x46>
	return timer->timer_en;
    8044:	241f      	addi      	r4, 32
				if(TRUE == app_get_100_millisecond_timer_status(APP_EARPHONE_STATUS_CHECK_TIMER_ID)) return 1;//等待耳机状态检测结束
    8046:	8469      	ld.b      	r3, (r4, 0x9)
    8048:	3b41      	cmpnei      	r3, 1
    804a:	0cac      	bf      	0x81a2	// 81a2 <box_open_close_handle_progress+0x1da>
				time_cnt++;
    804c:	1258      	lrw      	r2, 0x20000288	// 81ac <box_open_close_handle_progress+0x1e4>
    804e:	8a62      	ld.h      	r3, (r2, 0x4)
    8050:	2300      	addi      	r3, 1
    8052:	74cd      	zexth      	r3, r3
				if(time_cnt >= 200)
    8054:	31c7      	movi      	r1, 199
    8056:	64c4      	cmphs      	r1, r3
    8058:	0c04      	bf      	0x8060	// 8060 <box_open_close_handle_progress+0x98>
				time_cnt++;
    805a:	aa62      	st.h      	r3, (r2, 0x4)

		default:
			break;
	}
	
	return 0;
    805c:	3000      	movi      	r0, 0
    805e:	04a1      	br      	0x81a0	// 81a0 <box_open_close_handle_progress+0x1d8>
					switch(earphone_status_get())
    8060:	961e      	ld.w      	r0, (r6, 0x78)
					time_cnt = 0;
    8062:	3300      	movi      	r3, 0
					switch(earphone_status_get())
    8064:	3804      	cmphsi      	r0, 5
					time_cnt = 0;
    8066:	aa62      	st.h      	r3, (r2, 0x4)
					switch(earphone_status_get())
    8068:	0bfa      	bt      	0x805c	// 805c <box_open_close_handle_progress+0x94>
    806a:	e3ffd0a3 	bsr      	0x21b0	// 21b0 <___gnu_csky_case_uqi>
    806e:	033c      	.short	0x033c
    8070:	002f823c 	.long	0x002f823c
							if(is_earphone_fully_charged()) {
    8074:	e3ffff6e 	bsr      	0x7f50	// 7f50 <is_earphone_fully_charged>
    8078:	3840      	cmpnei      	r0, 0
    807a:	0c1f      	bf      	0x80b8	// 80b8 <box_open_close_handle_progress+0xf0>
								pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
    807c:	3003      	movi      	r0, 3
    807e:	e3fffb11 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
	earphone_status = status;  
    8082:	3302      	movi      	r3, 2
    8084:	b67e      	st.w      	r3, (r6, 0x78)
								if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_start_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
    8086:	e3fffb75 	bsr      	0x7770	// 7770 <app_charge_type_get>
    808a:	3840      	cmpnei      	r0, 0
    808c:	0803      	bt      	0x8092	// 8092 <box_open_close_handle_progress+0xca>
    808e:	e3fffad1 	bsr      	0x7630	// 7630 <app_start_100_millisecond_timer>
								if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_FULL_CHARGE);
    8092:	e3fffb6f 	bsr      	0x7770	// 7770 <app_charge_type_get>
    8096:	3840      	cmpnei      	r0, 0
    8098:	0804      	bt      	0x80a0	// 80a0 <box_open_close_handle_progress+0xd8>
    809a:	3009      	movi      	r0, 9
									if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_status_indication_set(APP_STATUS_INDICATION_CHARGING_FOR_EARPHONE);
    809c:	e0000350 	bsr      	0x873c	// 873c <app_status_indication_set>
							if(app_battery_status_get() == APP_BATTERY_STATUS_NTC_ERROR) {
    80a0:	967f      	ld.w      	r3, (r6, 0x7c)
    80a2:	3b43      	cmpnei      	r3, 3
    80a4:	0bdc      	bt      	0x805c	// 805c <box_open_close_handle_progress+0x94>
								pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
    80a6:	3003      	movi      	r0, 3
    80a8:	e3fffafc 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
	earphone_status = status;  
    80ac:	3304      	movi      	r3, 4
    80ae:	b67e      	st.w      	r3, (r6, 0x78)
								printf("earphone charge NTC error!!!\r\n");
    80b0:	1200      	lrw      	r0, 0x9268	// 81b0 <box_open_close_handle_progress+0x1e8>
    80b2:	e3ffdc31 	bsr      	0x3914	// 3914 <__GI_puts>
    80b6:	07d3      	br      	0x805c	// 805c <box_open_close_handle_progress+0x94>
								if(app_status_indication_get() != APP_STATUS_INDICATION_CHARGING_FOR_EARPHONE)
    80b8:	e000035a 	bsr      	0x876c	// 876c <app_status_indication_get>
    80bc:	3848      	cmpnei      	r0, 8
    80be:	0ff1      	bf      	0x80a0	// 80a0 <box_open_close_handle_progress+0xd8>
									if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_status_indication_set(APP_STATUS_INDICATION_CHARGING_FOR_EARPHONE);
    80c0:	e3fffb58 	bsr      	0x7770	// 7770 <app_charge_type_get>
    80c4:	3840      	cmpnei      	r0, 0
    80c6:	0bed      	bt      	0x80a0	// 80a0 <box_open_close_handle_progress+0xd8>
    80c8:	3008      	movi      	r0, 8
    80ca:	07e9      	br      	0x809c	// 809c <box_open_close_handle_progress+0xd4>
							if(app_battery_status_get() != APP_BATTERY_STATUS_NTC_ERROR)
    80cc:	967f      	ld.w      	r3, (r6, 0x7c)
    80ce:	3b43      	cmpnei      	r3, 3
    80d0:	0fc6      	bf      	0x805c	// 805c <box_open_close_handle_progress+0x94>
								pogo_pin_output_contrl(APP_OUTPUT_TYPE_BOOST5V);
    80d2:	3000      	movi      	r0, 0
    80d4:	e3fffae6 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
								app_start_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
    80d8:	3002      	movi      	r0, 2
								app_start_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
    80da:	e3fffaab 	bsr      	0x7630	// 7630 <app_start_100_millisecond_timer>
								printf("earphone charge exit NTC error status!!!");
    80de:	1116      	lrw      	r0, 0x9286	// 81b4 <box_open_close_handle_progress+0x1ec>
    80e0:	e3ffdc08 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
    80e4:	07bc      	br      	0x805c	// 805c <box_open_close_handle_progress+0x94>
							if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE)
    80e6:	e3fffb45 	bsr      	0x7770	// 7770 <app_charge_type_get>
    80ea:	3840      	cmpnei      	r0, 0
    80ec:	0bb8      	bt      	0x805c	// 805c <box_open_close_handle_progress+0x94>
								if(app_get_100_millisecond_timer_status(APP_DEEP_SLEEP_TIMER_ID) == FALSE)
    80ee:	8661      	ld.b      	r3, (r6, 0x1)
    80f0:	3b40      	cmpnei      	r3, 0
    80f2:	0bb5      	bt      	0x805c	// 805c <box_open_close_handle_progress+0x94>
									app_start_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
    80f4:	e3fffa9e 	bsr      	0x7630	// 7630 <app_start_100_millisecond_timer>
    80f8:	07b2      	br      	0x805c	// 805c <box_open_close_handle_progress+0x94>
			if(hall_status != pre_status) {
    80fa:	3b40      	cmpnei      	r3, 0
    80fc:	0c26      	bf      	0x8148	// 8148 <box_open_close_handle_progress+0x180>
				time_cnt = 0;
    80fe:	116c      	lrw      	r3, 0x20000288	// 81ac <box_open_close_handle_progress+0x1e4>
    8100:	3200      	movi      	r2, 0
    8102:	ab42      	st.h      	r2, (r3, 0x4)
				if(app_battery_status_get() == APP_BATTERY_STATUS_NTC_ERROR) {
    8104:	947f      	ld.w      	r3, (r4, 0x7c)
    8106:	3b43      	cmpnei      	r3, 3
    8108:	0810      	bt      	0x8128	// 8128 <box_open_close_handle_progress+0x160>
					pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
    810a:	3003      	movi      	r0, 3
    810c:	e3fffaca 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
	earphone_status = status;  
    8110:	3306      	movi      	r3, 6
					printf("earphone charge NTC error!!!\r\n");
    8112:	1108      	lrw      	r0, 0x9268	// 81b0 <box_open_close_handle_progress+0x1e8>
	earphone_status = status;  
    8114:	b47e      	st.w      	r3, (r4, 0x78)
					printf("earphone charge NTC error!!!\r\n");
    8116:	e3ffdbff 	bsr      	0x3914	// 3914 <__GI_puts>
				EXI3_WakeUp_Enable(); //开盖，按键动作要唤醒
    811a:	e3ffe551 	bsr      	0x4bbc	// 4bbc <EXI3_WakeUp_Enable>
				app_stop_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
    811e:	3000      	movi      	r0, 0
    8120:	e3fffa70 	bsr      	0x7600	// 7600 <app_stop_100_millisecond_timer>
				app_stop_100_millisecond_timer(APP_EARPHONE_STATUS_CHECK_TIMER_ID);
    8124:	3002      	movi      	r0, 2
    8126:	077a      	br      	0x801a	// 801a <box_open_close_handle_progress+0x52>
				} else if(battery_power_get() > 0){
    8128:	8560      	ld.b      	r3, (r5, 0x0)
    812a:	3b40      	cmpnei      	r3, 0
    812c:	0ff7      	bf      	0x811a	// 811a <box_open_close_handle_progress+0x152>
					if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) charging_case_battery_indication_handle();
    812e:	e3fffb21 	bsr      	0x7770	// 7770 <app_charge_type_get>
    8132:	3840      	cmpnei      	r0, 0
    8134:	0803      	bt      	0x813a	// 813a <box_open_close_handle_progress+0x172>
    8136:	e3fffef3 	bsr      	0x7f1c	// 7f1c <charging_case_battery_indication_handle>
					pogo_pin_output_contrl(APP_OUTPUT_TYPE_BOOST5V);
    813a:	3000      	movi      	r0, 0
    813c:	e3fffab2 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
					app_start_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
    8140:	3004      	movi      	r0, 4
    8142:	e3fffa77 	bsr      	0x7630	// 7630 <app_start_100_millisecond_timer>
    8146:	07ea      	br      	0x811a	// 811a <box_open_close_handle_progress+0x152>
	return timer->timer_en;
    8148:	3340      	movi      	r3, 64
    814a:	60d0      	addu      	r3, r4
				if(TRUE == app_get_100_millisecond_timer_status(APP_EARPHONE_WAKEUP_TIMER_ID)) return 1;//等待耳机状态检测结束
    814c:	8371      	ld.b      	r3, (r3, 0x11)
    814e:	3b41      	cmpnei      	r3, 1
    8150:	0c29      	bf      	0x81a2	// 81a2 <box_open_close_handle_progress+0x1da>
				time_cnt++;
    8152:	1057      	lrw      	r2, 0x20000288	// 81ac <box_open_close_handle_progress+0x1e4>
    8154:	8a62      	ld.h      	r3, (r2, 0x4)
    8156:	2300      	addi      	r3, 1
    8158:	74cd      	zexth      	r3, r3
				if(time_cnt >= 200)
    815a:	31c7      	movi      	r1, 199
    815c:	64c4      	cmphs      	r1, r3
    815e:	0b7e      	bt      	0x805a	// 805a <box_open_close_handle_progress+0x92>
					time_cnt = 0;
    8160:	3300      	movi      	r3, 0
    8162:	aa62      	st.h      	r3, (r2, 0x4)
					switch(earphone_status_get())
    8164:	947e      	ld.w      	r3, (r4, 0x78)
    8166:	3b45      	cmpnei      	r3, 5
    8168:	0c11      	bf      	0x818a	// 818a <box_open_close_handle_progress+0x1c2>
    816a:	3b46      	cmpnei      	r3, 6
    816c:	0c07      	bf      	0x817a	// 817a <box_open_close_handle_progress+0x1b2>
    816e:	3b43      	cmpnei      	r3, 3
    8170:	0b76      	bt      	0x805c	// 805c <box_open_close_handle_progress+0x94>
							app_status_indication_set(APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT);
    8172:	300a      	movi      	r0, 10
    8174:	e00002e4 	bsr      	0x873c	// 873c <app_status_indication_set>
    8178:	0772      	br      	0x805c	// 805c <box_open_close_handle_progress+0x94>
							if(app_battery_status_get() != APP_BATTERY_STATUS_NTC_ERROR)
    817a:	947f      	ld.w      	r3, (r4, 0x7c)
    817c:	3b43      	cmpnei      	r3, 3
    817e:	0f6f      	bf      	0x805c	// 805c <box_open_close_handle_progress+0x94>
								pogo_pin_output_contrl(APP_OUTPUT_TYPE_BOOST5V);
    8180:	3000      	movi      	r0, 0
    8182:	e3fffa8f 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
								app_start_100_millisecond_timer(APP_EARPHONE_WAKEUP_TIMER_ID);
    8186:	3004      	movi      	r0, 4
    8188:	07a9      	br      	0x80da	// 80da <box_open_close_handle_progress+0x112>
							if(app_battery_status_get() == APP_BATTERY_STATUS_NTC_ERROR) {
    818a:	947f      	ld.w      	r3, (r4, 0x7c)
    818c:	3b43      	cmpnei      	r3, 3
    818e:	0b67      	bt      	0x805c	// 805c <box_open_close_handle_progress+0x94>
								pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
    8190:	3003      	movi      	r0, 3
    8192:	e3fffa87 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
	earphone_status = status;  
    8196:	3306      	movi      	r3, 6
    8198:	b47e      	st.w      	r3, (r4, 0x78)
    819a:	078b      	br      	0x80b0	// 80b0 <box_open_close_handle_progress+0xe8>
	if(app_status_indication_get() == APP_STATUS_INDICATION_EARPHONE_OVER_CURRENT) return -1;//过流保护
    819c:	3000      	movi      	r0, 0
    819e:	2800      	subi      	r0, 1
}
    81a0:	1493      	pop      	r4-r6, r15
				if(TRUE == app_get_100_millisecond_timer_status(APP_EARPHONE_STATUS_CHECK_TIMER_ID)) return 1;//等待耳机状态检测结束
    81a2:	3001      	movi      	r0, 1
    81a4:	07fe      	br      	0x81a0	// 81a0 <box_open_close_handle_progress+0x1d8>
    81a6:	0000      	bkpt
    81a8:	20000128 	.long	0x20000128
    81ac:	20000288 	.long	0x20000288
    81b0:	00009268 	.long	0x00009268
    81b4:	00009286 	.long	0x00009286

Disassembly of section .text.app_battery_handle_process_normal:

000081b8 <app_battery_handle_process_normal>:


S8_T app_battery_handle_process_normal(enum APP_BATTERY_STATUS_T status)
{
    81b8:	14d4      	push      	r4-r7, r15
	static enum APP_BATTERY_STATUS_T pre_status = APP_BATTERY_STATUS_INVALID;
	static U16_T time_cnt = 0;
	
	//printf("%s: %d\r\n",__func__, battery_status);
	
	switch(battery_status)
    81ba:	11a4      	lrw      	r5, 0x20000128	// 8248 <app_battery_handle_process_normal+0x90>
    81bc:	3480      	movi      	r4, 128
    81be:	957f      	ld.w      	r3, (r5, 0x7c)
    81c0:	3b40      	cmpnei      	r3, 0
{
    81c2:	6dc3      	mov      	r7, r0
    81c4:	6114      	addu      	r4, r5
	switch(battery_status)
    81c6:	0c12      	bf      	0x81ea	// 81ea <app_battery_handle_process_normal+0x32>
    81c8:	3b44      	cmpnei      	r3, 4
    81ca:	0c29      	bf      	0x821c	// 821c <app_battery_handle_process_normal+0x64>
			}
			break;
			
		default:

			GPIO_Write_Low(charge_enable_pin);
    81cc:	11c0      	lrw      	r6, 0x20000050	// 824c <app_battery_handle_process_normal+0x94>
    81ce:	3106      	movi      	r1, 6
    81d0:	9600      	ld.w      	r0, (r6, 0x0)
    81d2:	e3ffe743 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
			GPIO_Write_Low(NTC_detect_pin);
    81d6:	9600      	ld.w      	r0, (r6, 0x0)
    81d8:	310e      	movi      	r1, 14
    81da:	e3ffe73f 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
			app_stop_100_millisecond_timer(APP_NTC_TIMER_ID);
    81de:	3005      	movi      	r0, 5
    81e0:	e3fffa10 	bsr      	0x7600	// 7600 <app_stop_100_millisecond_timer>
			battery_status = status;
    81e4:	b5ff      	st.w      	r7, (r5, 0x7c)
			pre_status = APP_BATTERY_STATUS_INVALID;
    81e6:	3305      	movi      	r3, 5
    81e8:	0407      	br      	0x81f6	// 81f6 <app_battery_handle_process_normal+0x3e>
			if(battery_status != pre_status) {
    81ea:	9446      	ld.w      	r2, (r4, 0x18)
    81ec:	3a40      	cmpnei      	r2, 0
    81ee:	1059      	lrw      	r2, 0x20000288	// 8250 <app_battery_handle_process_normal+0x98>
    81f0:	0c05      	bf      	0x81fa	// 81fa <app_battery_handle_process_normal+0x42>
				time_cnt = 0;
    81f2:	3100      	movi      	r1, 0
    81f4:	aa23      	st.h      	r1, (r2, 0x6)
			pre_status = APP_BATTERY_STATUS_INVALID;
    81f6:	b466      	st.w      	r3, (r4, 0x18)
			break;
    81f8:	0410      	br      	0x8218	// 8218 <app_battery_handle_process_normal+0x60>
				time_cnt++;
    81fa:	8a63      	ld.h      	r3, (r2, 0x6)
    81fc:	2300      	addi      	r3, 1
    81fe:	74cd      	zexth      	r3, r3
				if(time_cnt >= 500) {
    8200:	1035      	lrw      	r1, 0x1f3	// 8254 <app_battery_handle_process_normal+0x9c>
				if(time_cnt >= 400)
    8202:	64c4      	cmphs      	r1, r3
    8204:	0c03      	bf      	0x820a	// 820a <app_battery_handle_process_normal+0x52>
				time_cnt++;
    8206:	aa63      	st.h      	r3, (r2, 0x6)
    8208:	0408      	br      	0x8218	// 8218 <app_battery_handle_process_normal+0x60>
					time_cnt = 0;
    820a:	3300      	movi      	r3, 0
    820c:	aa63      	st.h      	r3, (r2, 0x6)
					if(battery_power_get() <= 0) system_shutdown();
    820e:	8460      	ld.b      	r3, (r4, 0x0)
    8210:	3b40      	cmpnei      	r3, 0
    8212:	0803      	bt      	0x8218	// 8218 <app_battery_handle_process_normal+0x60>
    8214:	e3fffe64 	bsr      	0x7edc	// 7edc <system_shutdown>
	}
	return 0;
}
    8218:	3000      	movi      	r0, 0
    821a:	1494      	pop      	r4-r7, r15
			if(battery_status != pre_status) {
    821c:	9466      	ld.w      	r3, (r4, 0x18)
    821e:	3b44      	cmpnei      	r3, 4
    8220:	104c      	lrw      	r2, 0x20000288	// 8250 <app_battery_handle_process_normal+0x98>
    8222:	0c0d      	bf      	0x823c	// 823c <app_battery_handle_process_normal+0x84>
				time_cnt = 0;
    8224:	3300      	movi      	r3, 0
    8226:	aa63      	st.h      	r3, (r2, 0x6)
				GPIO_Write_Low(charge_enable_pin);
    8228:	3106      	movi      	r1, 6
    822a:	1069      	lrw      	r3, 0x20000050	// 824c <app_battery_handle_process_normal+0x94>
    822c:	9300      	ld.w      	r0, (r3, 0x0)
    822e:	e3ffe715 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
				pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
    8232:	3003      	movi      	r0, 3
    8234:	e3fffa36 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
				pre_status = battery_status;
    8238:	957f      	ld.w      	r3, (r5, 0x7c)
    823a:	07de      	br      	0x81f6	// 81f6 <app_battery_handle_process_normal+0x3e>
				time_cnt++;
    823c:	8a63      	ld.h      	r3, (r2, 0x6)
    823e:	2300      	addi      	r3, 1
    8240:	74cd      	zexth      	r3, r3
				if(time_cnt >= 400)
    8242:	1026      	lrw      	r1, 0x18f	// 8258 <app_battery_handle_process_normal+0xa0>
    8244:	07df      	br      	0x8202	// 8202 <app_battery_handle_process_normal+0x4a>
    8246:	0000      	bkpt
    8248:	20000128 	.long	0x20000128
    824c:	20000050 	.long	0x20000050
    8250:	20000288 	.long	0x20000288
    8254:	000001f3 	.long	0x000001f3
    8258:	0000018f 	.long	0x0000018f

Disassembly of section .text.app_battery_handle_process_charge:

0000825c <app_battery_handle_process_charge>:

S8_T app_battery_handle_process_charge(enum APP_BATTERY_STATUS_T status)
{
    825c:	14d4      	push      	r4-r7, r15
	static U16_T time_cnt = 0;
	static U8_T full_charge_cnt = 0;
	
	//printf("%s: %d\r\n",__func__, battery_status);

	switch(battery_status)
    825e:	03cb      	lrw      	r6, 0x20000128	// 84ac <app_battery_handle_process_charge+0x250>
    8260:	3480      	movi      	r4, 128
    8262:	967f      	ld.w      	r3, (r6, 0x7c)
    8264:	3b43      	cmpnei      	r3, 3
{
    8266:	6d43      	mov      	r5, r0
    8268:	6ddb      	mov      	r7, r6
    826a:	6118      	addu      	r4, r6
	switch(battery_status)
    826c:	0ca6      	bf      	0x83b8	// 83b8 <app_battery_handle_process_charge+0x15c>
    826e:	3b44      	cmpnei      	r3, 4
    8270:	0cda      	bf      	0x8424	// 8424 <app_battery_handle_process_charge+0x1c8>
    8272:	3b41      	cmpnei      	r3, 1
    8274:	08f9      	bt      	0x8466	// 8466 <app_battery_handle_process_charge+0x20a>
	{
		case APP_BATTERY_STATUS_CHARGING:
			if(battery_status != pre_status) {
    8276:	9447      	ld.w      	r2, (r4, 0x1c)
    8278:	3a41      	cmpnei      	r2, 1
    827a:	03b1      	lrw      	r5, 0x20000288	// 84b0 <app_battery_handle_process_charge+0x254>
    827c:	0c24      	bf      	0x82c4	// 82c4 <app_battery_handle_process_charge+0x68>
				time_cnt = full_charge_cnt = 0;
    827e:	3200      	movi      	r2, 0
				pre_status = battery_status;
    8280:	b467      	st.w      	r3, (r4, 0x1c)
				if(ntc_status_get() == APP_NTC_STATUS_STOPCHG)
    8282:	9461      	ld.w      	r3, (r4, 0x4)
				time_cnt = full_charge_cnt = 0;
    8284:	a548      	st.b      	r2, (r5, 0x8)
				if(ntc_status_get() == APP_NTC_STATUS_STOPCHG)
    8286:	3b40      	cmpnei      	r3, 0
				time_cnt = full_charge_cnt = 0;
    8288:	3200      	movi      	r2, 0
    828a:	ad45      	st.h      	r2, (r5, 0xa)
				if(ntc_status_get() == APP_NTC_STATUS_STOPCHG)
    828c:	0809      	bt      	0x829e	// 829e <app_battery_handle_process_charge+0x42>
				{
					printf("NTC error!!!: %d\r\n", ntc_status_get());
    828e:	3100      	movi      	r1, 0
    8290:	0316      	lrw      	r0, 0x92af	// 84b4 <app_battery_handle_process_charge+0x258>
    8292:	e3ffdb2f 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
					battery_status = APP_BATTERY_STATUS_NTC_ERROR;
    8296:	3303      	movi      	r3, 3
    8298:	b67f      	st.w      	r3, (r6, 0x7c)
			pre_status = APP_BATTERY_STATUS_INVALID;
			break;
	}
	
	return 0;
}
    829a:	3000      	movi      	r0, 0
    829c:	1494      	pop      	r4-r7, r15
				GPIO_Write_High(charge_enable_pin);
    829e:	0378      	lrw      	r3, 0x20000050	// 84b8 <app_battery_handle_process_charge+0x25c>
    82a0:	3106      	movi      	r1, 6
    82a2:	9300      	ld.w      	r0, (r3, 0x0)
    82a4:	e3ffe6d6 	bsr      	0x5050	// 5050 <GPIO_Write_High>
	return NTC_status;
    82a8:	94a1      	ld.w      	r5, (r4, 0x4)
				charge_current_control(ntc_status_get(), app_charge_type_get());
    82aa:	e3fffa63 	bsr      	0x7770	// 7770 <app_charge_type_get>
    82ae:	6c43      	mov      	r1, r0
    82b0:	6c17      	mov      	r0, r5
    82b2:	e3fffac1 	bsr      	0x7834	// 7834 <charge_current_control>
				app_status_indication_set(APP_STATUS_INDICATION_CHARGING);
    82b6:	3000      	movi      	r0, 0
    82b8:	e0000242 	bsr      	0x873c	// 873c <app_status_indication_set>
				printf("charging....\r\n");
    82bc:	031f      	lrw      	r0, 0x92c2	// 84bc <app_battery_handle_process_charge+0x260>
							printf("start recharge....\r\n");
    82be:	e3ffdb2b 	bsr      	0x3914	// 3914 <__GI_puts>
    82c2:	0408      	br      	0x82d2	// 82d2 <app_battery_handle_process_charge+0x76>
				time_cnt++;
    82c4:	8d65      	ld.h      	r3, (r5, 0xa)
    82c6:	2300      	addi      	r3, 1
    82c8:	74cd      	zexth      	r3, r3
				if(time_cnt >= 400)
    82ca:	135e      	lrw      	r2, 0x18f	// 84c0 <app_battery_handle_process_charge+0x264>
    82cc:	64c8      	cmphs      	r2, r3
    82ce:	0c1a      	bf      	0x8302	// 8302 <app_battery_handle_process_charge+0xa6>
				time_cnt++;
    82d0:	ad65      	st.h      	r3, (r5, 0xa)
			if(FALSE == app_get_100_millisecond_timer_status(APP_NTC_TIMER_ID))//等待NTC状态发送变化
    82d2:	137d      	lrw      	r3, 0x20000188	// 84c4 <app_battery_handle_process_charge+0x268>
    82d4:	8365      	ld.b      	r3, (r3, 0x5)
    82d6:	3b40      	cmpnei      	r3, 0
    82d8:	0be1      	bt      	0x829a	// 829a <app_battery_handle_process_charge+0x3e>
	return NTC_status;
    82da:	94a1      	ld.w      	r5, (r4, 0x4)
				charge_current_control(ntc_status_get(), app_charge_type_get());
    82dc:	e3fffa4a 	bsr      	0x7770	// 7770 <app_charge_type_get>
    82e0:	6c43      	mov      	r1, r0
    82e2:	6c17      	mov      	r0, r5
    82e4:	e3fffaa8 	bsr      	0x7834	// 7834 <charge_current_control>
				if(ntc_status_get() == APP_NTC_STATUS_STOPCHG)
    82e8:	9461      	ld.w      	r3, (r4, 0x4)
    82ea:	3b40      	cmpnei      	r3, 0
    82ec:	0807      	bt      	0x82fa	// 82fa <app_battery_handle_process_charge+0x9e>
					printf("NTC error!!!: %d\r\n", ntc_status_get());
    82ee:	3100      	movi      	r1, 0
    82f0:	1311      	lrw      	r0, 0x92af	// 84b4 <app_battery_handle_process_charge+0x258>
    82f2:	e3ffdaff 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
					battery_status = APP_BATTERY_STATUS_NTC_ERROR;
    82f6:	3303      	movi      	r3, 3
    82f8:	b77f      	st.w      	r3, (r7, 0x7c)
				app_start_100_millisecond_timer(APP_NTC_TIMER_ID);//重新开启NTC检测定时器
    82fa:	3005      	movi      	r0, 5
    82fc:	e3fff99a 	bsr      	0x7630	// 7630 <app_start_100_millisecond_timer>
    8300:	07cd      	br      	0x829a	// 829a <app_battery_handle_process_charge+0x3e>
					time_cnt = 0;
    8302:	3300      	movi      	r3, 0
    8304:	ad65      	st.h      	r3, (r5, 0xa)
					if(APP_STATUS_INDICATION_FULLCHARGE != app_status_indication_get()) {
    8306:	e0000233 	bsr      	0x876c	// 876c <app_status_indication_get>
    830a:	3841      	cmpnei      	r0, 1
    830c:	0c1b      	bf      	0x8342	// 8342 <app_battery_handle_process_charge+0xe6>
						if(!GPIO_Read_Status(charge_status_pin)) full_charge_cnt++;
    830e:	13cb      	lrw      	r6, 0x20000050	// 84b8 <app_battery_handle_process_charge+0x25c>
    8310:	310b      	movi      	r1, 11
    8312:	9600      	ld.w      	r0, (r6, 0x0)
    8314:	e3ffe6b1 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    8318:	3840      	cmpnei      	r0, 0
    831a:	0812      	bt      	0x833e	// 833e <app_battery_handle_process_charge+0xe2>
    831c:	8568      	ld.b      	r3, (r5, 0x8)
    831e:	2300      	addi      	r3, 1
						else full_charge_cnt = 0;
    8320:	a568      	st.b      	r3, (r5, 0x8)
						if(full_charge_cnt >= 3)
    8322:	8568      	ld.b      	r3, (r5, 0x8)
    8324:	3b02      	cmphsi      	r3, 3
    8326:	0fd6      	bf      	0x82d2	// 82d2 <app_battery_handle_process_charge+0x76>
							full_charge_cnt = 0;
    8328:	3300      	movi      	r3, 0
							GPIO_Write_Low(charge_enable_pin);
    832a:	9600      	ld.w      	r0, (r6, 0x0)
    832c:	3106      	movi      	r1, 6
							full_charge_cnt = 0;
    832e:	a568      	st.b      	r3, (r5, 0x8)
							GPIO_Write_Low(charge_enable_pin);
    8330:	e3ffe694 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
							app_status_indication_set(APP_STATUS_INDICATION_FULLCHARGE);
    8334:	3001      	movi      	r0, 1
    8336:	e0000203 	bsr      	0x873c	// 873c <app_status_indication_set>
							printf("fully charge!!!\r\n");
    833a:	1304      	lrw      	r0, 0x92d0	// 84c8 <app_battery_handle_process_charge+0x26c>
    833c:	07c1      	br      	0x82be	// 82be <app_battery_handle_process_charge+0x62>
						else full_charge_cnt = 0;
    833e:	3300      	movi      	r3, 0
    8340:	07f0      	br      	0x8320	// 8320 <app_battery_handle_process_charge+0xc4>
						if(earphone_status_get() == APP_EARPHONE_STATUS_FULLCHARGE || earphone_status_get() == APP_EARPHONE_STATUS_NO_IN_BOX)
    8342:	967e      	ld.w      	r3, (r6, 0x78)
    8344:	3b81      	bclri      	r3, 1
    8346:	3560      	movi      	r5, 96
    8348:	3b40      	cmpnei      	r3, 0
    834a:	6158      	addu      	r5, r6
    834c:	080d      	bt      	0x8366	// 8366 <app_battery_handle_process_charge+0x10a>
							if(app_get_100_millisecond_timer_status(APP_NTC_TIMER_ID) == TRUE)
    834e:	8565      	ld.b      	r3, (r5, 0x5)
    8350:	3b41      	cmpnei      	r3, 1
    8352:	0804      	bt      	0x835a	// 835a <app_battery_handle_process_charge+0xfe>
								app_stop_100_millisecond_timer(APP_NTC_TIMER_ID);//关闭NTC检测定时器
    8354:	3005      	movi      	r0, 5
    8356:	e3fff955 	bsr      	0x7600	// 7600 <app_stop_100_millisecond_timer>
							if(app_get_100_millisecond_timer_status(APP_DEEP_SLEEP_TIMER_ID) == FALSE)
    835a:	8761      	ld.b      	r3, (r7, 0x1)
    835c:	3b40      	cmpnei      	r3, 0
    835e:	0804      	bt      	0x8366	// 8366 <app_battery_handle_process_charge+0x10a>
								app_start_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
    8360:	3000      	movi      	r0, 0
    8362:	e3fff967 	bsr      	0x7630	// 7630 <app_start_100_millisecond_timer>
						if(APP_BATTERY_RECHARGE_MV >= battery_adc_to_mv(adc_get_val(BATTERY_ADC)))
    8366:	3000      	movi      	r0, 0
    8368:	e3fffb6e 	bsr      	0x7a44	// 7a44 <adc_get_val>
    836c:	e3ffd864 	bsr      	0x3434	// 3434 <__floatunsidf>
    8370:	3200      	movi      	r2, 0
    8372:	1277      	lrw      	r3, 0x3fe75400	// 84cc <app_battery_handle_process_charge+0x270>
    8374:	e3ffd646 	bsr      	0x3000	// 3000 <__muldf3>
    8378:	3200      	movi      	r2, 0
    837a:	1276      	lrw      	r3, 0x40438000	// 84d0 <app_battery_handle_process_charge+0x274>
    837c:	e3ffd75c 	bsr      	0x3234	// 3234 <__divdf3>
    8380:	1275      	lrw      	r3, 0x405e4000	// 84d4 <app_battery_handle_process_charge+0x278>
    8382:	3200      	movi      	r2, 0
    8384:	e3ffd63e 	bsr      	0x3000	// 3000 <__muldf3>
    8388:	e3ffcf4e 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    838c:	1273      	lrw      	r3, 0x1004	// 84d8 <app_battery_handle_process_charge+0x27c>
    838e:	640c      	cmphs      	r3, r0
    8390:	0fa1      	bf      	0x82d2	// 82d2 <app_battery_handle_process_charge+0x76>
							GPIO_Write_High(charge_enable_pin);
    8392:	126a      	lrw      	r3, 0x20000050	// 84b8 <app_battery_handle_process_charge+0x25c>
    8394:	3106      	movi      	r1, 6
    8396:	9300      	ld.w      	r0, (r3, 0x0)
    8398:	e3ffe65c 	bsr      	0x5050	// 5050 <GPIO_Write_High>
							if(app_get_100_millisecond_timer_status(APP_NTC_TIMER_ID) == FALSE)
    839c:	8565      	ld.b      	r3, (r5, 0x5)
    839e:	3b40      	cmpnei      	r3, 0
    83a0:	0804      	bt      	0x83a8	// 83a8 <app_battery_handle_process_charge+0x14c>
								app_start_100_millisecond_timer(APP_NTC_TIMER_ID);//重新开启NTC检测定时器
    83a2:	3005      	movi      	r0, 5
    83a4:	e3fff946 	bsr      	0x7630	// 7630 <app_start_100_millisecond_timer>
							app_status_indication_set(APP_STATUS_INDICATION_CHARGING);
    83a8:	3000      	movi      	r0, 0
    83aa:	e00001c9 	bsr      	0x873c	// 873c <app_status_indication_set>
							app_stop_100_millisecond_timer(APP_DEEP_SLEEP_TIMER_ID);
    83ae:	3000      	movi      	r0, 0
    83b0:	e3fff928 	bsr      	0x7600	// 7600 <app_stop_100_millisecond_timer>
							printf("start recharge....\r\n");
    83b4:	120a      	lrw      	r0, 0x92e1	// 84dc <app_battery_handle_process_charge+0x280>
    83b6:	0784      	br      	0x82be	// 82be <app_battery_handle_process_charge+0x62>
			if(battery_status != pre_status) {
    83b8:	9467      	ld.w      	r3, (r4, 0x1c)
    83ba:	3b43      	cmpnei      	r3, 3
    83bc:	115d      	lrw      	r2, 0x20000288	// 84b0 <app_battery_handle_process_charge+0x254>
    83be:	0c23      	bf      	0x8404	// 8404 <app_battery_handle_process_charge+0x1a8>
				time_cnt = 0;
    83c0:	3300      	movi      	r3, 0
    83c2:	aa65      	st.h      	r3, (r2, 0xa)
				GPIO_Write_Low(charge_enable_pin);
    83c4:	3106      	movi      	r1, 6
    83c6:	117d      	lrw      	r3, 0x20000050	// 84b8 <app_battery_handle_process_charge+0x25c>
    83c8:	9300      	ld.w      	r0, (r3, 0x0)
    83ca:	e3ffe647 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
				pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
    83ce:	3003      	movi      	r0, 3
    83d0:	e3fff968 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
				app_status_indication_set(APP_STATUS_INDICATION_NTC_ERROR);
    83d4:	3003      	movi      	r0, 3
    83d6:	e00001b3 	bsr      	0x873c	// 873c <app_status_indication_set>
				pre_status = battery_status;
    83da:	967f      	ld.w      	r3, (r6, 0x7c)
    83dc:	b467      	st.w      	r3, (r4, 0x1c)
			if(FALSE == app_get_100_millisecond_timer_status(APP_NTC_TIMER_ID))//等待NTC状态发送变化
    83de:	117a      	lrw      	r3, 0x20000188	// 84c4 <app_battery_handle_process_charge+0x268>
    83e0:	8365      	ld.b      	r3, (r3, 0x5)
    83e2:	3b40      	cmpnei      	r3, 0
    83e4:	0b5b      	bt      	0x829a	// 829a <app_battery_handle_process_charge+0x3e>
	return NTC_status;
    83e6:	94a1      	ld.w      	r5, (r4, 0x4)
				charge_current_control(ntc_status_get(), app_charge_type_get());
    83e8:	e3fff9c4 	bsr      	0x7770	// 7770 <app_charge_type_get>
    83ec:	6c43      	mov      	r1, r0
    83ee:	6c17      	mov      	r0, r5
    83f0:	e3fffa22 	bsr      	0x7834	// 7834 <charge_current_control>
	return NTC_status;
    83f4:	9421      	ld.w      	r1, (r4, 0x4)
				if(ntc_status_get() != APP_NTC_STATUS_STOPCHG)
    83f6:	3940      	cmpnei      	r1, 0
    83f8:	0f81      	bf      	0x82fa	// 82fa <app_battery_handle_process_charge+0x9e>
					printf("NTC error-->recover charge!!!: %d\r\n", ntc_status_get());
    83fa:	111a      	lrw      	r0, 0x92f5	// 84e0 <app_battery_handle_process_charge+0x284>
    83fc:	e3ffda7a 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>
					battery_status = APP_BATTERY_STATUS_CHARGING;
    8400:	3301      	movi      	r3, 1
    8402:	077b      	br      	0x82f8	// 82f8 <app_battery_handle_process_charge+0x9c>
				time_cnt++;
    8404:	8a65      	ld.h      	r3, (r2, 0xa)
    8406:	2300      	addi      	r3, 1
    8408:	74cd      	zexth      	r3, r3
				if(time_cnt >= 400)
    840a:	112e      	lrw      	r1, 0x18f	// 84c0 <app_battery_handle_process_charge+0x264>
    840c:	64c4      	cmphs      	r1, r3
    840e:	0c03      	bf      	0x8414	// 8414 <app_battery_handle_process_charge+0x1b8>
				time_cnt++;
    8410:	aa65      	st.h      	r3, (r2, 0xa)
    8412:	07e6      	br      	0x83de	// 83de <app_battery_handle_process_charge+0x182>
					time_cnt = 0;
    8414:	3300      	movi      	r3, 0
    8416:	aa65      	st.h      	r3, (r2, 0xa)
					if(battery_power_get() <= 0) system_shutdown();
    8418:	8460      	ld.b      	r3, (r4, 0x0)
    841a:	3b40      	cmpnei      	r3, 0
    841c:	0be1      	bt      	0x83de	// 83de <app_battery_handle_process_charge+0x182>
    841e:	e3fffd5f 	bsr      	0x7edc	// 7edc <system_shutdown>
    8422:	07de      	br      	0x83de	// 83de <app_battery_handle_process_charge+0x182>
			if(battery_status != pre_status) {
    8424:	9467      	ld.w      	r3, (r4, 0x1c)
    8426:	3b44      	cmpnei      	r3, 4
    8428:	1142      	lrw      	r2, 0x20000288	// 84b0 <app_battery_handle_process_charge+0x254>
    842a:	0c0e      	bf      	0x8446	// 8446 <app_battery_handle_process_charge+0x1ea>
				time_cnt = 0;
    842c:	3300      	movi      	r3, 0
    842e:	aa65      	st.h      	r3, (r2, 0xa)
				GPIO_Write_Low(charge_enable_pin);
    8430:	3106      	movi      	r1, 6
    8432:	1162      	lrw      	r3, 0x20000050	// 84b8 <app_battery_handle_process_charge+0x25c>
    8434:	9300      	ld.w      	r0, (r3, 0x0)
    8436:	e3ffe611 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
				pogo_pin_output_contrl(APP_OUTPUT_TYPE_OUTPUTLOW);
    843a:	3003      	movi      	r0, 3
    843c:	e3fff932 	bsr      	0x76a0	// 76a0 <pogo_pin_output_contrl>
				pre_status = battery_status;
    8440:	967f      	ld.w      	r3, (r6, 0x7c)
			pre_status = APP_BATTERY_STATUS_INVALID;
    8442:	b467      	st.w      	r3, (r4, 0x1c)
			break;
    8444:	072b      	br      	0x829a	// 829a <app_battery_handle_process_charge+0x3e>
				time_cnt++;
    8446:	8a65      	ld.h      	r3, (r2, 0xa)
    8448:	2300      	addi      	r3, 1
    844a:	74cd      	zexth      	r3, r3
				if(time_cnt >= 400)
    844c:	103d      	lrw      	r1, 0x18f	// 84c0 <app_battery_handle_process_charge+0x264>
    844e:	64c4      	cmphs      	r1, r3
    8450:	0c03      	bf      	0x8456	// 8456 <app_battery_handle_process_charge+0x1fa>
				time_cnt++;
    8452:	aa65      	st.h      	r3, (r2, 0xa)
    8454:	0723      	br      	0x829a	// 829a <app_battery_handle_process_charge+0x3e>
					time_cnt = 0;
    8456:	3300      	movi      	r3, 0
    8458:	aa65      	st.h      	r3, (r2, 0xa)
					if(battery_power_get() <= 0) system_shutdown();
    845a:	8460      	ld.b      	r3, (r4, 0x0)
    845c:	3b40      	cmpnei      	r3, 0
    845e:	0b1e      	bt      	0x829a	// 829a <app_battery_handle_process_charge+0x3e>
    8460:	e3fffd3e 	bsr      	0x7edc	// 7edc <system_shutdown>
    8464:	071b      	br      	0x829a	// 829a <app_battery_handle_process_charge+0x3e>
			GPIO_Write_High(NTC_detect_pin);
    8466:	1075      	lrw      	r3, 0x20000050	// 84b8 <app_battery_handle_process_charge+0x25c>
    8468:	310e      	movi      	r1, 14
    846a:	9300      	ld.w      	r0, (r3, 0x0)
    846c:	e3ffe5f2 	bsr      	0x5050	// 5050 <GPIO_Write_High>
			ntc_status_update(ntc_status_measure(ntc_adc_to_mv(adc_get_val(NTC_ADC))));
    8470:	3003      	movi      	r0, 3
    8472:	e3fffae9 	bsr      	0x7a44	// 7a44 <adc_get_val>
    8476:	3380      	movi      	r3, 128
    8478:	4365      	lsli      	r3, r3, 5
    847a:	5b01      	subu      	r0, r3, r0
    847c:	e3ffd7dc 	bsr      	0x3434	// 3434 <__floatunsidf>
    8480:	3200      	movi      	r2, 0
    8482:	1079      	lrw      	r3, 0x3fe74c00	// 84e4 <app_battery_handle_process_charge+0x288>
    8484:	e3ffd5be 	bsr      	0x3000	// 3000 <__muldf3>
    8488:	6cc7      	mov      	r3, r1
    848a:	6c83      	mov      	r2, r0
    848c:	1037      	lrw      	r1, 0x40a75800	// 84e8 <app_battery_handle_process_charge+0x28c>
    848e:	3000      	movi      	r0, 0
    8490:	e3ffd59c 	bsr      	0x2fc8	// 2fc8 <__subdf3>
    8494:	e3ffcec8 	bsr      	0x2224	// 2224 <__fixunsdfsi>
    8498:	e3fffa26 	bsr      	0x78e4	// 78e4 <ntc_status_measure>
    849c:	e3fff9bc 	bsr      	0x7814	// 7814 <ntc_status_update>
			app_start_100_millisecond_timer(APP_NTC_TIMER_ID);
    84a0:	3005      	movi      	r0, 5
    84a2:	e3fff8c7 	bsr      	0x7630	// 7630 <app_start_100_millisecond_timer>
			battery_status = status;
    84a6:	b6bf      	st.w      	r5, (r6, 0x7c)
			pre_status = APP_BATTERY_STATUS_INVALID;
    84a8:	3305      	movi      	r3, 5
    84aa:	07cc      	br      	0x8442	// 8442 <app_battery_handle_process_charge+0x1e6>
    84ac:	20000128 	.long	0x20000128
    84b0:	20000288 	.long	0x20000288
    84b4:	000092af 	.long	0x000092af
    84b8:	20000050 	.long	0x20000050
    84bc:	000092c2 	.long	0x000092c2
    84c0:	0000018f 	.long	0x0000018f
    84c4:	20000188 	.long	0x20000188
    84c8:	000092d0 	.long	0x000092d0
    84cc:	3fe75400 	.long	0x3fe75400
    84d0:	40438000 	.long	0x40438000
    84d4:	405e4000 	.long	0x405e4000
    84d8:	00001004 	.long	0x00001004
    84dc:	000092e1 	.long	0x000092e1
    84e0:	000092f5 	.long	0x000092f5
    84e4:	3fe74c00 	.long	0x3fe74c00
    84e8:	40a75800 	.long	0x40a75800

Disassembly of section .text.app_battery_handle_process:

000084ec <app_battery_handle_process>:

S8_T app_battery_handle_process(void)
{
    84ec:	14d0      	push      	r15
	switch(app_charge_type_get())
    84ee:	e3fff941 	bsr      	0x7770	// 7770 <app_charge_type_get>
    84f2:	3840      	cmpnei      	r0, 0
    84f4:	0c08      	bf      	0x8504	// 8504 <app_battery_handle_process+0x18>
    84f6:	3802      	cmphsi      	r0, 3
    84f8:	0804      	bt      	0x8500	// 8500 <app_battery_handle_process+0x14>
	{
		case APP_CHARGE_TYPE_WIRED:
		case APP_CHARGE_TYPE_WIRELESS:	
			app_battery_handle_process_charge(APP_BATTERY_STATUS_CHARGING);
    84fa:	3001      	movi      	r0, 1
    84fc:	e3fffeb0 	bsr      	0x825c	// 825c <app_battery_handle_process_charge>
		case APP_CHARGE_TYPE_DISCHARGE:
			app_battery_handle_process_normal(APP_BATTERY_STATUS_NORMAL);
		break;
	}
	return 0;
}
    8500:	3000      	movi      	r0, 0
    8502:	1490      	pop      	r15
			app_battery_handle_process_normal(APP_BATTERY_STATUS_NORMAL);
    8504:	3000      	movi      	r0, 0
    8506:	e3fffe59 	bsr      	0x81b8	// 81b8 <app_battery_handle_process_normal>
		break;
    850a:	07fb      	br      	0x8500	// 8500 <app_battery_handle_process+0x14>

Disassembly of section .text.EXI2to3IntHandler:

0000850c <EXI2to3IntHandler>:

void EXI2to3IntHandler(void) 
{
    850c:	1460      	nie
    850e:	1462      	ipush
    8510:	14d1      	push      	r4, r15
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN2)==EXI_PIN2) 
    8512:	107a      	lrw      	r3, 0x2000005c	// 8578 <EXI2to3IntHandler+0x6c>
    8514:	3104      	movi      	r1, 4
    8516:	9360      	ld.w      	r3, (r3, 0x0)
    8518:	237f      	addi      	r3, 128
    851a:	934c      	ld.w      	r2, (r3, 0x30)
    851c:	6884      	and      	r2, r1
    851e:	3a40      	cmpnei      	r2, 0
    8520:	0c08      	bf      	0x8530	// 8530 <EXI2to3IntHandler+0x24>
	{
		SYSCON->EXICR = EXI_PIN2;
    8522:	b32b      	st.w      	r1, (r3, 0x2c)
		{
			charge_current_control(ntc_status_get(), app_charge_type_get());//有线充转无线充时，充电电流要转换
			if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_status_indication_set(APP_STATUS_INDICATION_PLUGOUT);
		}
	}
}
    8524:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    8528:	9880      	ld.w      	r4, (r14, 0x0)
    852a:	1402      	addi      	r14, r14, 8
    852c:	1463      	ipop
    852e:	1461      	nir
	else if ((SYSCON->EXIRS&EXI_PIN3)==EXI_PIN3) 
    8530:	934c      	ld.w      	r2, (r3, 0x30)
    8532:	3108      	movi      	r1, 8
    8534:	6884      	and      	r2, r1
    8536:	3a40      	cmpnei      	r2, 0
    8538:	0ff6      	bf      	0x8524	// 8524 <EXI2to3IntHandler+0x18>
		SYSCON->EXICR = EXI_PIN3;
    853a:	b32b      	st.w      	r1, (r3, 0x2c)
		if(GPIO_Read_Status(charge_USB5V_detect_pin)) charge_current_control(ntc_status_get(), app_charge_type_get());
    853c:	3103      	movi      	r1, 3
    853e:	1070      	lrw      	r3, 0x20000050	// 857c <EXI2to3IntHandler+0x70>
    8540:	9300      	ld.w      	r0, (r3, 0x0)
    8542:	e3ffe59a 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    8546:	3840      	cmpnei      	r0, 0
    8548:	106e      	lrw      	r3, 0x200001a8	// 8580 <EXI2to3IntHandler+0x74>
	return NTC_status;
    854a:	9381      	ld.w      	r4, (r3, 0x4)
		if(GPIO_Read_Status(charge_USB5V_detect_pin)) charge_current_control(ntc_status_get(), app_charge_type_get());
    854c:	0c08      	bf      	0x855c	// 855c <EXI2to3IntHandler+0x50>
    854e:	e3fff911 	bsr      	0x7770	// 7770 <app_charge_type_get>
    8552:	6c43      	mov      	r1, r0
    8554:	6c13      	mov      	r0, r4
    8556:	e3fff96f 	bsr      	0x7834	// 7834 <charge_current_control>
    855a:	07e5      	br      	0x8524	// 8524 <EXI2to3IntHandler+0x18>
			charge_current_control(ntc_status_get(), app_charge_type_get());//有线充转无线充时，充电电流要转换
    855c:	e3fff90a 	bsr      	0x7770	// 7770 <app_charge_type_get>
    8560:	6c43      	mov      	r1, r0
    8562:	6c13      	mov      	r0, r4
    8564:	e3fff968 	bsr      	0x7834	// 7834 <charge_current_control>
			if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_status_indication_set(APP_STATUS_INDICATION_PLUGOUT);
    8568:	e3fff904 	bsr      	0x7770	// 7770 <app_charge_type_get>
    856c:	3840      	cmpnei      	r0, 0
    856e:	0bdb      	bt      	0x8524	// 8524 <EXI2to3IntHandler+0x18>
    8570:	3002      	movi      	r0, 2
    8572:	e00000e5 	bsr      	0x873c	// 873c <app_status_indication_set>
}
    8576:	07d7      	br      	0x8524	// 8524 <EXI2to3IntHandler+0x18>
    8578:	2000005c 	.long	0x2000005c
    857c:	20000050 	.long	0x20000050
    8580:	200001a8 	.long	0x200001a8

Disassembly of section .text.EXI0IntHandler:

00008584 <EXI0IntHandler>:

void EXI0IntHandler(void) 
{
    8584:	1460      	nie
    8586:	1462      	ipush
    8588:	14d1      	push      	r4, r15
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN0)==EXI_PIN0) 
    858a:	1077      	lrw      	r3, 0x2000005c	// 85e4 <EXI0IntHandler+0x60>
    858c:	3101      	movi      	r1, 1
    858e:	9360      	ld.w      	r3, (r3, 0x0)
    8590:	237f      	addi      	r3, 128
    8592:	934c      	ld.w      	r2, (r3, 0x30)
    8594:	6884      	and      	r2, r1
    8596:	3a40      	cmpnei      	r2, 0
    8598:	0c11      	bf      	0x85ba	// 85ba <EXI0IntHandler+0x36>
	{
		SYSCON->EXICR = EXI_PIN0;
    859a:	b32b      	st.w      	r1, (r3, 0x2c)
		if(GPIO_Read_Status(charge_wireless5V_dectect_pin)) charge_current_control(ntc_status_get(), app_charge_type_get());
    859c:	3100      	movi      	r1, 0
    859e:	1073      	lrw      	r3, 0x20000050	// 85e8 <EXI0IntHandler+0x64>
    85a0:	9300      	ld.w      	r0, (r3, 0x0)
    85a2:	e3ffe56a 	bsr      	0x5076	// 5076 <GPIO_Read_Status>
    85a6:	3840      	cmpnei      	r0, 0
    85a8:	1071      	lrw      	r3, 0x200001a8	// 85ec <EXI0IntHandler+0x68>
	return NTC_status;
    85aa:	9381      	ld.w      	r4, (r3, 0x4)
		if(GPIO_Read_Status(charge_wireless5V_dectect_pin)) charge_current_control(ntc_status_get(), app_charge_type_get());
    85ac:	0c0d      	bf      	0x85c6	// 85c6 <EXI0IntHandler+0x42>
    85ae:	e3fff8e1 	bsr      	0x7770	// 7770 <app_charge_type_get>
    85b2:	6c43      	mov      	r1, r0
    85b4:	6c13      	mov      	r0, r4
    85b6:	e3fff93f 	bsr      	0x7834	// 7834 <charge_current_control>
		{
			charge_current_control(ntc_status_get(), app_charge_type_get());
			if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_status_indication_set(APP_STATUS_INDICATION_PLUGOUT);
		}
	}
}
    85ba:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    85be:	9880      	ld.w      	r4, (r14, 0x0)
    85c0:	1402      	addi      	r14, r14, 8
    85c2:	1463      	ipop
    85c4:	1461      	nir
			charge_current_control(ntc_status_get(), app_charge_type_get());
    85c6:	e3fff8d5 	bsr      	0x7770	// 7770 <app_charge_type_get>
    85ca:	6c43      	mov      	r1, r0
    85cc:	6c13      	mov      	r0, r4
    85ce:	e3fff933 	bsr      	0x7834	// 7834 <charge_current_control>
			if(app_charge_type_get() == APP_CHARGE_TYPE_DISCHARGE) app_status_indication_set(APP_STATUS_INDICATION_PLUGOUT);
    85d2:	e3fff8cf 	bsr      	0x7770	// 7770 <app_charge_type_get>
    85d6:	3840      	cmpnei      	r0, 0
    85d8:	0bf1      	bt      	0x85ba	// 85ba <EXI0IntHandler+0x36>
    85da:	3002      	movi      	r0, 2
    85dc:	e00000b0 	bsr      	0x873c	// 873c <app_status_indication_set>
}
    85e0:	07ed      	br      	0x85ba	// 85ba <EXI0IntHandler+0x36>
    85e2:	0000      	bkpt
    85e4:	2000005c 	.long	0x2000005c
    85e8:	20000050 	.long	0x20000050
    85ec:	200001a8 	.long	0x200001a8

Disassembly of section .text.app_close_all_led:

000085f0 <app_close_all_led>:
#include "app_battery.h"

enum APP_STATUS_INDICATION_T app_status = APP_STATUS_INDICATION_NUM;

void app_close_all_led(void)
{
    85f0:	14d1      	push      	r4, r15
	GPIO_InPutOutPut_Disable(red_led_pin);
    85f2:	1090      	lrw      	r4, 0x2000004c	// 8630 <app_close_all_led+0x40>
    85f4:	3102      	movi      	r1, 2
    85f6:	9400      	ld.w      	r0, (r4, 0x0)
    85f8:	e3ffe3b4 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_Write_High(red_led_pin);
    85fc:	9400      	ld.w      	r0, (r4, 0x0)
    85fe:	3102      	movi      	r1, 2
    8600:	e3ffe528 	bsr      	0x5050	// 5050 <GPIO_Write_High>
	GPIO_InPutOutPut_Disable(green_led_pin);
    8604:	9400      	ld.w      	r0, (r4, 0x0)
    8606:	3103      	movi      	r1, 3
    8608:	e3ffe3ac 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_Write_High(green_led_pin);
    860c:	9400      	ld.w      	r0, (r4, 0x0)
    860e:	3103      	movi      	r1, 3
	GPIO_InPutOutPut_Disable(blue_led_pin);
    8610:	1089      	lrw      	r4, 0x20000050	// 8634 <app_close_all_led+0x44>
	GPIO_Write_High(green_led_pin);
    8612:	e3ffe51f 	bsr      	0x5050	// 5050 <GPIO_Write_High>
	GPIO_InPutOutPut_Disable(blue_led_pin);
    8616:	9400      	ld.w      	r0, (r4, 0x0)
    8618:	3108      	movi      	r1, 8
    861a:	e3ffe3a3 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	GPIO_Write_High(blue_led_pin);
    861e:	9400      	ld.w      	r0, (r4, 0x0)
    8620:	3108      	movi      	r1, 8
    8622:	e3ffe517 	bsr      	0x5050	// 5050 <GPIO_Write_High>
	EPT_Vector_Int_Disable();
    8626:	e3ffea33 	bsr      	0x5a8c	// 5a8c <EPT_Vector_Int_Disable>
	EPT_Stop();
    862a:	e3ffe865 	bsr      	0x56f4	// 56f4 <EPT_Stop>
}
    862e:	1491      	pop      	r4, r15
    8630:	2000004c 	.long	0x2000004c
    8634:	20000050 	.long	0x20000050

Disassembly of section .text.app_red_led_turn_solid:

00008638 <app_red_led_turn_solid>:

void app_red_led_turn_solid(void)
{
    8638:	14d1      	push      	r4, r15
	GPIO_Init(red_led_pin, Output);
    863a:	1086      	lrw      	r4, 0x2000004c	// 8650 <app_red_led_turn_solid+0x18>
    863c:	3200      	movi      	r2, 0
    863e:	9400      	ld.w      	r0, (r4, 0x0)
    8640:	3102      	movi      	r1, 2
    8642:	e3ffe31f 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_Low(red_led_pin);
    8646:	9400      	ld.w      	r0, (r4, 0x0)
    8648:	3102      	movi      	r1, 2
    864a:	e3ffe507 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
}
    864e:	1491      	pop      	r4, r15
    8650:	2000004c 	.long	0x2000004c

Disassembly of section .text.app_green_led_turn_solid:

00008654 <app_green_led_turn_solid>:

void app_green_led_turn_solid(void)
{
    8654:	14d1      	push      	r4, r15
	GPIO_Init(green_led_pin, Output);
    8656:	1086      	lrw      	r4, 0x2000004c	// 866c <app_green_led_turn_solid+0x18>
    8658:	3200      	movi      	r2, 0
    865a:	9400      	ld.w      	r0, (r4, 0x0)
    865c:	3103      	movi      	r1, 3
    865e:	e3ffe311 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_Low(green_led_pin);
    8662:	9400      	ld.w      	r0, (r4, 0x0)
    8664:	3103      	movi      	r1, 3
    8666:	e3ffe4f9 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
}
    866a:	1491      	pop      	r4, r15
    866c:	2000004c 	.long	0x2000004c

Disassembly of section .text.app_blue_led_turn_solid:

00008670 <app_blue_led_turn_solid>:

void app_blue_led_turn_solid(void)
{
    8670:	14d1      	push      	r4, r15
	GPIO_Init(blue_led_pin, Output);
    8672:	1086      	lrw      	r4, 0x20000050	// 8688 <app_blue_led_turn_solid+0x18>
    8674:	3200      	movi      	r2, 0
    8676:	9400      	ld.w      	r0, (r4, 0x0)
    8678:	3108      	movi      	r1, 8
    867a:	e3ffe303 	bsr      	0x4c80	// 4c80 <GPIO_Init>
	GPIO_Write_Low(blue_led_pin);	
    867e:	9400      	ld.w      	r0, (r4, 0x0)
    8680:	3108      	movi      	r1, 8
    8682:	e3ffe4eb 	bsr      	0x5058	// 5058 <GPIO_Write_Low>
}
    8686:	1491      	pop      	r4, r15
    8688:	20000050 	.long	0x20000050

Disassembly of section .text.app_red_led_pwm_contrl:

0000868c <app_red_led_pwm_contrl>:

void app_red_led_pwm_contrl(U16_T comp_val, U8_T breath)
{
    868c:	14d3      	push      	r4-r6, r15
    868e:	1421      	subi      	r14, r14, 4
	GPIO_InPutOutPut_Disable(green_led_pin);
    8690:	1074      	lrw      	r3, 0x2000004c	// 86e0 <app_red_led_pwm_contrl+0x54>
{
    8692:	6d83      	mov      	r6, r0
    8694:	6d47      	mov      	r5, r1
	GPIO_InPutOutPut_Disable(green_led_pin);
    8696:	9300      	ld.w      	r0, (r3, 0x0)
    8698:	3103      	movi      	r1, 3
    869a:	e3ffe363 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	EPT_IO_SET(EPT_IO_CHBX, IO_NUM_PB02);
    869e:	3116      	movi      	r1, 22
    86a0:	3002      	movi      	r0, 2
    86a2:	e3ffe83d 	bsr      	0x571c	// 571c <EPT_IO_SET>
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(2000, 0, comp_val, 0, 0);
    86a6:	3400      	movi      	r4, 0
    86a8:	30fa      	movi      	r0, 250
    86aa:	b880      	st.w      	r4, (r14, 0x0)
    86ac:	3300      	movi      	r3, 0
    86ae:	6c9b      	mov      	r2, r6
    86b0:	3100      	movi      	r1, 0
    86b2:	4003      	lsli      	r0, r0, 3
    86b4:	e3ffe9ce 	bsr      	0x5a50	// 5a50 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config>
	if(breath == TRUE) {
    86b8:	3d41      	cmpnei      	r5, 1
    86ba:	080f      	bt      	0x86d8	// 86d8 <app_red_led_pwm_contrl+0x4c>
		EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(2000, 0, 2000, 0, 0);
    86bc:	32fa      	movi      	r2, 250
    86be:	4243      	lsli      	r2, r2, 3
    86c0:	3300      	movi      	r3, 0
    86c2:	3100      	movi      	r1, 0
    86c4:	6c0b      	mov      	r0, r2
    86c6:	b880      	st.w      	r4, (r14, 0x0)
    86c8:	e3ffe9c4 	bsr      	0x5a50	// 5a50 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config>
		EPT_Vector_Int_Enable();
    86cc:	e3ffe9da 	bsr      	0x5a80	// 5a80 <EPT_Vector_Int_Enable>
	} else EPT_Vector_Int_Disable();
	EPT_Start();
    86d0:	e3ffe7fe 	bsr      	0x56cc	// 56cc <EPT_Start>
}
    86d4:	1401      	addi      	r14, r14, 4
    86d6:	1493      	pop      	r4-r6, r15
	} else EPT_Vector_Int_Disable();
    86d8:	e3ffe9da 	bsr      	0x5a8c	// 5a8c <EPT_Vector_Int_Disable>
    86dc:	07fa      	br      	0x86d0	// 86d0 <app_red_led_pwm_contrl+0x44>
    86de:	0000      	bkpt
    86e0:	2000004c 	.long	0x2000004c

Disassembly of section .text.app_green_led_pwm_contrl:

000086e4 <app_green_led_pwm_contrl>:

void app_green_led_pwm_contrl(U16_T comp_val, U8_T breath)
{
    86e4:	14d3      	push      	r4-r6, r15
    86e6:	1421      	subi      	r14, r14, 4
	GPIO_InPutOutPut_Disable(red_led_pin);
    86e8:	1074      	lrw      	r3, 0x2000004c	// 8738 <app_green_led_pwm_contrl+0x54>
{
    86ea:	6d83      	mov      	r6, r0
    86ec:	6d47      	mov      	r5, r1
	GPIO_InPutOutPut_Disable(red_led_pin);
    86ee:	9300      	ld.w      	r0, (r3, 0x0)
    86f0:	3102      	movi      	r1, 2
    86f2:	e3ffe337 	bsr      	0x4d60	// 4d60 <GPIO_InPutOutPut_Disable>
	EPT_IO_SET(EPT_IO_CHAY, IO_NUM_PB03);
    86f6:	3113      	movi      	r1, 19
    86f8:	3001      	movi      	r0, 1
    86fa:	e3ffe811 	bsr      	0x571c	// 571c <EPT_IO_SET>
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(2000, 0, comp_val, 0, 0);
    86fe:	3400      	movi      	r4, 0
    8700:	30fa      	movi      	r0, 250
    8702:	b880      	st.w      	r4, (r14, 0x0)
    8704:	3300      	movi      	r3, 0
    8706:	6c9b      	mov      	r2, r6
    8708:	3100      	movi      	r1, 0
    870a:	4003      	lsli      	r0, r0, 3
    870c:	e3ffe9a2 	bsr      	0x5a50	// 5a50 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config>
	if(breath == TRUE) {
    8710:	3d41      	cmpnei      	r5, 1
    8712:	080f      	bt      	0x8730	// 8730 <app_green_led_pwm_contrl+0x4c>
		EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(2000, 0, 2000, 0, 0);
    8714:	32fa      	movi      	r2, 250
    8716:	4243      	lsli      	r2, r2, 3
    8718:	3300      	movi      	r3, 0
    871a:	3100      	movi      	r1, 0
    871c:	6c0b      	mov      	r0, r2
    871e:	b880      	st.w      	r4, (r14, 0x0)
    8720:	e3ffe998 	bsr      	0x5a50	// 5a50 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config>
		EPT_Vector_Int_Enable();
    8724:	e3ffe9ae 	bsr      	0x5a80	// 5a80 <EPT_Vector_Int_Enable>
	} else EPT_Vector_Int_Disable();
	EPT_Start();
    8728:	e3ffe7d2 	bsr      	0x56cc	// 56cc <EPT_Start>
}
    872c:	1401      	addi      	r14, r14, 4
    872e:	1493      	pop      	r4-r6, r15
	} else EPT_Vector_Int_Disable();
    8730:	e3ffe9ae 	bsr      	0x5a8c	// 5a8c <EPT_Vector_Int_Disable>
    8734:	07fa      	br      	0x8728	// 8728 <app_green_led_pwm_contrl+0x44>
    8736:	0000      	bkpt
    8738:	2000004c 	.long	0x2000004c

Disassembly of section .text.app_status_indication_set:

0000873c <app_status_indication_set>:

S8_T app_status_indication_set(enum APP_STATUS_INDICATION_T status)
{
    873c:	14d1      	push      	r4, r15
    873e:	6d03      	mov      	r4, r0
	printf("%s: %d\r\n",__func__, status);
    8740:	6c83      	mov      	r2, r0
    8742:	1028      	lrw      	r1, 0x8cd9	// 8760 <app_status_indication_set+0x24>
    8744:	1008      	lrw      	r0, 0x90ce	// 8764 <app_status_indication_set+0x28>
    8746:	e3ffd8d5 	bsr      	0x38f0	// 38f0 <__cskyvprintfprintf>

	if(app_status == status) return 0;
    874a:	1068      	lrw      	r3, 0x200001c8	// 8768 <app_status_indication_set+0x2c>
    874c:	9340      	ld.w      	r2, (r3, 0x0)
    874e:	6492      	cmpne      	r4, r2
    8750:	0c06      	bf      	0x875c	// 875c <app_status_indication_set+0x20>
	
	app_status = status;
    8752:	b380      	st.w      	r4, (r3, 0x0)
	app_close_all_led();
    8754:	e3ffff4e 	bsr      	0x85f0	// 85f0 <app_close_all_led>
	
	return 1;
    8758:	3001      	movi      	r0, 1
}
    875a:	1491      	pop      	r4, r15
	if(app_status == status) return 0;
    875c:	3000      	movi      	r0, 0
    875e:	07fe      	br      	0x875a	// 875a <app_status_indication_set+0x1e>
    8760:	00008cd9 	.long	0x00008cd9
    8764:	000090ce 	.long	0x000090ce
    8768:	200001c8 	.long	0x200001c8

Disassembly of section .text.app_status_indication_get:

0000876c <app_status_indication_get>:

U8_T app_status_indication_get(void)
{
	return app_status;
    876c:	1062      	lrw      	r3, 0x200001c8	// 8774 <app_status_indication_get+0x8>
    876e:	8300      	ld.b      	r0, (r3, 0x0)
}
    8770:	783c      	jmp      	r15
    8772:	0000      	bkpt
    8774:	200001c8 	.long	0x200001c8

Disassembly of section .text.app_status_handle_process:

00008778 <app_status_handle_process>:

S8_T app_status_handle_process(void)
{
    8778:	14d1      	push      	r4, r15
	static enum APP_STATUS_INDICATION_T pre_status = APP_STATUS_INDICATION_NUM;
	static enum APP_STATUS_INDICATION_T cur_status = APP_STATUS_INDICATION_NUM;
	static U16_T time_cnt = 0;
	static U8_T led_reverse_flag, led_flash_cnt = 0;
	
	switch(app_status)
    877a:	037d      	lrw      	r3, 0x200001c8	// 8980 <app_status_handle_process+0x208>
    877c:	6d0f      	mov      	r4, r3
    877e:	9300      	ld.w      	r0, (r3, 0x0)
    8780:	380f      	cmphsi      	r0, 16
    8782:	08fd      	bt      	0x897c	// 897c <app_status_handle_process+0x204>
    8784:	e3ffcd20 	bsr      	0x21c4	// 21c4 <___gnu_csky_case_uhi>
    8788:	00260010 	.long	0x00260010
    878c:	002c002a 	.long	0x002c002a
    8790:	00630058 	.long	0x00630058
    8794:	00830073 	.long	0x00830073
    8798:	00b400a3 	.long	0x00b400a3
    879c:	00d200bd 	.long	0x00d200bd
    87a0:	00e200dd 	.long	0x00e200dd
    87a4:	00f800e7 	.long	0x00f800e7
	{
		case APP_STATUS_INDICATION_CHARGING:
			cur_status = app_status;
    87a8:	3300      	movi      	r3, 0
    87aa:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    87ac:	9462      	ld.w      	r3, (r4, 0x8)
    87ae:	3b40      	cmpnei      	r3, 0
    87b0:	1355      	lrw      	r2, 0x20000296	// 8984 <app_status_handle_process+0x20c>
    87b2:	0c0a      	bf      	0x87c6	// 87c6 <app_status_handle_process+0x4e>
			{
				time_cnt = 0;
				app_red_led_pwm_contrl(2000, TRUE);
    87b4:	30fa      	movi      	r0, 250
				time_cnt = 0;
    87b6:	3300      	movi      	r3, 0
				app_red_led_pwm_contrl(2000, TRUE);
    87b8:	3101      	movi      	r1, 1
    87ba:	4003      	lsli      	r0, r0, 3
				time_cnt = 0;
    87bc:	aa60      	st.h      	r3, (r2, 0x0)
				app_red_led_pwm_contrl(2000, TRUE);
    87be:	e3ffff67 	bsr      	0x868c	// 868c <app_red_led_pwm_contrl>
					time_cnt = 0;
					app_close_all_led();
					app_status = APP_STATUS_INDICATION_NUM;
				}
			}
			pre_status = cur_status;
    87c2:	9461      	ld.w      	r3, (r4, 0x4)
    87c4:	0409      	br      	0x87d6	// 87d6 <app_status_handle_process+0x5e>
				time_cnt++;
    87c6:	8a60      	ld.h      	r3, (r2, 0x0)
    87c8:	2300      	addi      	r3, 1
    87ca:	74cd      	zexth      	r3, r3
				if(time_cnt >= 30) {
    87cc:	3b1d      	cmphsi      	r3, 30
				time_cnt++;
    87ce:	aa60      	st.h      	r3, (r2, 0x0)
				if(time_cnt >= 30) {
    87d0:	0ff9      	bf      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
    87d2:	07f1      	br      	0x87b4	// 87b4 <app_status_handle_process+0x3c>
			pre_status = app_status;
    87d4:	3301      	movi      	r3, 1
    87d6:	b462      	st.w      	r3, (r4, 0x8)
			pre_status = app_status;
			break;
	}
	
	return 0;
}
    87d8:	3000      	movi      	r0, 0
    87da:	1491      	pop      	r4, r15
			pre_status = app_status;
    87dc:	3302      	movi      	r3, 2
    87de:	07fc      	br      	0x87d6	// 87d6 <app_status_handle_process+0x5e>
			cur_status = app_status;
    87e0:	3303      	movi      	r3, 3
    87e2:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    87e4:	9462      	ld.w      	r3, (r4, 0x8)
    87e6:	3b43      	cmpnei      	r3, 3
    87e8:	1367      	lrw      	r3, 0x20000296	// 8984 <app_status_handle_process+0x20c>
    87ea:	0c07      	bf      	0x87f8	// 87f8 <app_status_handle_process+0x80>
				time_cnt = 0;
    87ec:	3200      	movi      	r2, 0
    87ee:	ab40      	st.h      	r2, (r3, 0x0)
				led_flash_cnt = 0;
    87f0:	a342      	st.b      	r2, (r3, 0x2)
					led_reverse_flag = 1;
    87f2:	3201      	movi      	r2, 1
    87f4:	a343      	st.b      	r2, (r3, 0x3)
    87f6:	0439      	br      	0x8868	// 8868 <app_status_handle_process+0xf0>
				time_cnt++;
    87f8:	8b40      	ld.h      	r2, (r3, 0x0)
    87fa:	2200      	addi      	r2, 1
				if(led_flash_cnt < 3) {
    87fc:	8322      	ld.b      	r1, (r3, 0x2)
				time_cnt++;
    87fe:	7489      	zexth      	r2, r2
				if(led_flash_cnt < 3) {
    8800:	3902      	cmphsi      	r1, 3
				time_cnt++;
    8802:	ab40      	st.h      	r2, (r3, 0x0)
				if(led_flash_cnt < 3) {
    8804:	0815      	bt      	0x882e	// 882e <app_status_handle_process+0xb6>
					if(led_reverse_flag == 0 && time_cnt >= 2) {
    8806:	8303      	ld.b      	r0, (r3, 0x3)
    8808:	3840      	cmpnei      	r0, 0
    880a:	0806      	bt      	0x8816	// 8816 <app_status_handle_process+0x9e>
				if(led_reverse_flag == 0 && time_cnt >= 2) {
    880c:	3a01      	cmphsi      	r2, 2
    880e:	0fda      	bf      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
					time_cnt = 0;
    8810:	3200      	movi      	r2, 0
    8812:	ab40      	st.h      	r2, (r3, 0x0)
    8814:	07ef      	br      	0x87f2	// 87f2 <app_status_handle_process+0x7a>
					} else if(led_reverse_flag == 1 && time_cnt >= 2)
    8816:	3841      	cmpnei      	r0, 1
    8818:	0bd5      	bt      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
    881a:	3a01      	cmphsi      	r2, 2
    881c:	0fd3      	bf      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
						time_cnt = 0;
    881e:	3200      	movi      	r2, 0
						led_flash_cnt++;
    8820:	2100      	addi      	r1, 1
						time_cnt = 0;
    8822:	ab40      	st.h      	r2, (r3, 0x0)
						led_reverse_flag = 0;
    8824:	a343      	st.b      	r2, (r3, 0x3)
						led_flash_cnt++;
    8826:	a322      	st.b      	r1, (r3, 0x2)
					app_close_all_led();
    8828:	e3fffee4 	bsr      	0x85f0	// 85f0 <app_close_all_led>
    882c:	07cb      	br      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
					if(time_cnt >= 10) {
    882e:	3a09      	cmphsi      	r2, 10
    8830:	0fc9      	bf      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
						led_flash_cnt = 0;
    8832:	3200      	movi      	r2, 0
    8834:	a342      	st.b      	r2, (r3, 0x2)
    8836:	07c6      	br      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
			cur_status = app_status;
    8838:	3304      	movi      	r3, 4
    883a:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    883c:	9462      	ld.w      	r3, (r4, 0x8)
    883e:	3b44      	cmpnei      	r3, 4
    8840:	1251      	lrw      	r2, 0x20000296	// 8984 <app_status_handle_process+0x20c>
    8842:	0c1f      	bf      	0x8880	// 8880 <app_status_handle_process+0x108>
				time_cnt = 0;
    8844:	3300      	movi      	r3, 0
    8846:	aa60      	st.h      	r3, (r2, 0x0)
				app_green_led_turn_solid();
    8848:	e3ffff06 	bsr      	0x8654	// 8654 <app_green_led_turn_solid>
    884c:	07bb      	br      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
			cur_status = app_status;
    884e:	3305      	movi      	r3, 5
    8850:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    8852:	9462      	ld.w      	r3, (r4, 0x8)
    8854:	3b45      	cmpnei      	r3, 5
    8856:	124c      	lrw      	r2, 0x20000296	// 8984 <app_status_handle_process+0x20c>
    8858:	0c14      	bf      	0x8880	// 8880 <app_status_handle_process+0x108>
				app_green_led_pwm_contrl(1680, FALSE);
    885a:	30d2      	movi      	r0, 210
				time_cnt = 0;
    885c:	3300      	movi      	r3, 0
				app_green_led_pwm_contrl(1680, FALSE);
    885e:	3100      	movi      	r1, 0
    8860:	4003      	lsli      	r0, r0, 3
				time_cnt = 0;
    8862:	aa60      	st.h      	r3, (r2, 0x0)
				app_green_led_pwm_contrl(1680, FALSE);
    8864:	e3ffff40 	bsr      	0x86e4	// 86e4 <app_green_led_pwm_contrl>
					app_red_led_turn_solid();
    8868:	e3fffee8 	bsr      	0x8638	// 8638 <app_red_led_turn_solid>
    886c:	07ab      	br      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
			cur_status = app_status;
    886e:	3306      	movi      	r3, 6
    8870:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    8872:	9462      	ld.w      	r3, (r4, 0x8)
    8874:	3b46      	cmpnei      	r3, 6
    8876:	1244      	lrw      	r2, 0x20000296	// 8984 <app_status_handle_process+0x20c>
    8878:	0c04      	bf      	0x8880	// 8880 <app_status_handle_process+0x108>
				time_cnt = 0;
    887a:	3300      	movi      	r3, 0
    887c:	aa60      	st.h      	r3, (r2, 0x0)
    887e:	07f5      	br      	0x8868	// 8868 <app_status_handle_process+0xf0>
				time_cnt++;
    8880:	8a60      	ld.h      	r3, (r2, 0x0)
    8882:	2300      	addi      	r3, 1
    8884:	74cd      	zexth      	r3, r3
				if(time_cnt >= 20) {
    8886:	3b13      	cmphsi      	r3, 20
				if(time_cnt >= 10) {
    8888:	0871      	bt      	0x896a	// 896a <app_status_handle_process+0x1f2>
				time_cnt++;
    888a:	aa60      	st.h      	r3, (r2, 0x0)
    888c:	079b      	br      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
			cur_status = app_status;
    888e:	3307      	movi      	r3, 7
    8890:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    8892:	9462      	ld.w      	r3, (r4, 0x8)
    8894:	3b47      	cmpnei      	r3, 7
    8896:	117c      	lrw      	r3, 0x20000296	// 8984 <app_status_handle_process+0x20c>
    8898:	0baa      	bt      	0x87ec	// 87ec <app_status_handle_process+0x74>
				time_cnt++;
    889a:	8b40      	ld.h      	r2, (r3, 0x0)
    889c:	2200      	addi      	r2, 1
				if(led_reverse_flag == 0 && time_cnt >= 2) {
    889e:	8323      	ld.b      	r1, (r3, 0x3)
				time_cnt++;
    88a0:	7489      	zexth      	r2, r2
				if(led_reverse_flag == 0 && time_cnt >= 2) {
    88a2:	3940      	cmpnei      	r1, 0
				time_cnt++;
    88a4:	ab40      	st.h      	r2, (r3, 0x0)
				if(led_reverse_flag == 0 && time_cnt >= 2) {
    88a6:	0fb3      	bf      	0x880c	// 880c <app_status_handle_process+0x94>
				} else if(led_reverse_flag == 1 && time_cnt >= 2)
    88a8:	3941      	cmpnei      	r1, 1
    88aa:	0b8c      	bt      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
    88ac:	3a01      	cmphsi      	r2, 2
    88ae:	0f8a      	bf      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
					time_cnt = 0;
    88b0:	3200      	movi      	r2, 0
    88b2:	ab40      	st.h      	r2, (r3, 0x0)
					led_reverse_flag = 0;
    88b4:	a343      	st.b      	r2, (r3, 0x3)
					led_flash_cnt++;
    88b6:	8342      	ld.b      	r2, (r3, 0x2)
    88b8:	2200      	addi      	r2, 1
    88ba:	7488      	zextb      	r2, r2
					if(led_flash_cnt >= 5) {
    88bc:	3a04      	cmphsi      	r2, 5
    88be:	0803      	bt      	0x88c4	// 88c4 <app_status_handle_process+0x14c>
					led_flash_cnt++;
    88c0:	a342      	st.b      	r2, (r3, 0x2)
    88c2:	07b3      	br      	0x8828	// 8828 <app_status_handle_process+0xb0>
						led_flash_cnt = 0;
    88c4:	3200      	movi      	r2, 0
    88c6:	a342      	st.b      	r2, (r3, 0x2)
						app_status = APP_STATUS_INDICATION_NUM;
    88c8:	3310      	movi      	r3, 16
    88ca:	b460      	st.w      	r3, (r4, 0x0)
    88cc:	07ae      	br      	0x8828	// 8828 <app_status_handle_process+0xb0>
			cur_status = app_status;
    88ce:	3308      	movi      	r3, 8
    88d0:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    88d2:	9462      	ld.w      	r3, (r4, 0x8)
    88d4:	3b48      	cmpnei      	r3, 8
    88d6:	116c      	lrw      	r3, 0x20000296	// 8984 <app_status_handle_process+0x20c>
    88d8:	0b9c      	bt      	0x8810	// 8810 <app_status_handle_process+0x98>
				time_cnt++;
    88da:	8b40      	ld.h      	r2, (r3, 0x0)
    88dc:	2200      	addi      	r2, 1
				if(led_reverse_flag == 0 && time_cnt >= 50) {
    88de:	8323      	ld.b      	r1, (r3, 0x3)
				time_cnt++;
    88e0:	7489      	zexth      	r2, r2
				if(led_reverse_flag == 0 && time_cnt >= 50) {
    88e2:	3940      	cmpnei      	r1, 0
				time_cnt++;
    88e4:	ab40      	st.h      	r2, (r3, 0x0)
				if(led_reverse_flag == 0 && time_cnt >= 50) {
    88e6:	081b      	bt      	0x891c	// 891c <app_status_handle_process+0x1a4>
    88e8:	3131      	movi      	r1, 49
    88ea:	6484      	cmphs      	r1, r2
    88ec:	0b6b      	bt      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
    88ee:	0791      	br      	0x8810	// 8810 <app_status_handle_process+0x98>
			cur_status = app_status;
    88f0:	3309      	movi      	r3, 9
    88f2:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    88f4:	9462      	ld.w      	r3, (r4, 0x8)
    88f6:	3b49      	cmpnei      	r3, 9
    88f8:	0f65      	bf      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
				time_cnt = 0;
    88fa:	1163      	lrw      	r3, 0x20000296	// 8984 <app_status_handle_process+0x20c>
    88fc:	3200      	movi      	r2, 0
    88fe:	ab40      	st.h      	r2, (r3, 0x0)
    8900:	0794      	br      	0x8828	// 8828 <app_status_handle_process+0xb0>
			cur_status = app_status;
    8902:	330a      	movi      	r3, 10
    8904:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    8906:	9462      	ld.w      	r3, (r4, 0x8)
    8908:	3b4a      	cmpnei      	r3, 10
    890a:	107f      	lrw      	r3, 0x20000296	// 8984 <app_status_handle_process+0x20c>
    890c:	0b82      	bt      	0x8810	// 8810 <app_status_handle_process+0x98>
				time_cnt++;
    890e:	8b40      	ld.h      	r2, (r3, 0x0)
    8910:	2200      	addi      	r2, 1
				if(led_reverse_flag == 0 && time_cnt >= 2) {
    8912:	8323      	ld.b      	r1, (r3, 0x3)
				time_cnt++;
    8914:	7489      	zexth      	r2, r2
				if(led_reverse_flag == 0 && time_cnt >= 2) {
    8916:	3940      	cmpnei      	r1, 0
				time_cnt++;
    8918:	ab40      	st.h      	r2, (r3, 0x0)
				if(led_reverse_flag == 0 && time_cnt >= 2) {
    891a:	0f79      	bf      	0x880c	// 880c <app_status_handle_process+0x94>
				} else if(led_reverse_flag == 1 && time_cnt >= 2)
    891c:	3941      	cmpnei      	r1, 1
    891e:	0b52      	bt      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
    8920:	3a01      	cmphsi      	r2, 2
    8922:	0f50      	bf      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
					time_cnt = 0;
    8924:	3200      	movi      	r2, 0
    8926:	ab40      	st.h      	r2, (r3, 0x0)
					led_reverse_flag = 0;
    8928:	a343      	st.b      	r2, (r3, 0x3)
    892a:	077f      	br      	0x8828	// 8828 <app_status_handle_process+0xb0>
			cur_status = app_status;
    892c:	330b      	movi      	r3, 11
    892e:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    8930:	9462      	ld.w      	r3, (r4, 0x8)
    8932:	3b4b      	cmpnei      	r3, 11
    8934:	1054      	lrw      	r2, 0x20000296	// 8984 <app_status_handle_process+0x20c>
			if(cur_status != pre_status)
    8936:	0c15      	bf      	0x8960	// 8960 <app_status_handle_process+0x1e8>
				time_cnt = 0;
    8938:	3300      	movi      	r3, 0
    893a:	aa60      	st.h      	r3, (r2, 0x0)
				app_blue_led_turn_solid();
    893c:	e3fffe9a 	bsr      	0x8670	// 8670 <app_blue_led_turn_solid>
    8940:	0741      	br      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
			cur_status = app_status;
    8942:	330c      	movi      	r3, 12
    8944:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    8946:	9462      	ld.w      	r3, (r4, 0x8)
    8948:	3b4c      	cmpnei      	r3, 12
    894a:	07f5      	br      	0x8934	// 8934 <app_status_handle_process+0x1bc>
			cur_status = app_status;
    894c:	330d      	movi      	r3, 13
    894e:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    8950:	9462      	ld.w      	r3, (r4, 0x8)
    8952:	3b4d      	cmpnei      	r3, 13
    8954:	07f0      	br      	0x8934	// 8934 <app_status_handle_process+0x1bc>
			cur_status = app_status;
    8956:	330e      	movi      	r3, 14
    8958:	b461      	st.w      	r3, (r4, 0x4)
			if(cur_status != pre_status)
    895a:	9462      	ld.w      	r3, (r4, 0x8)
    895c:	3b4e      	cmpnei      	r3, 14
    895e:	07eb      	br      	0x8934	// 8934 <app_status_handle_process+0x1bc>
				time_cnt++;
    8960:	8a60      	ld.h      	r3, (r2, 0x0)
    8962:	2300      	addi      	r3, 1
    8964:	74cd      	zexth      	r3, r3
				if(time_cnt >= 10) {
    8966:	3b09      	cmphsi      	r3, 10
    8968:	0790      	br      	0x8888	// 8888 <app_status_handle_process+0x110>
					time_cnt = 0;
    896a:	3300      	movi      	r3, 0
    896c:	aa60      	st.h      	r3, (r2, 0x0)
					app_close_all_led();
    896e:	e3fffe41 	bsr      	0x85f0	// 85f0 <app_close_all_led>
					app_status = APP_STATUS_INDICATION_NUM;
    8972:	3310      	movi      	r3, 16
    8974:	b460      	st.w      	r3, (r4, 0x0)
    8976:	0726      	br      	0x87c2	// 87c2 <app_status_handle_process+0x4a>
			pre_status = app_status;
    8978:	330f      	movi      	r3, 15
    897a:	072e      	br      	0x87d6	// 87d6 <app_status_handle_process+0x5e>
			pre_status = app_status;
    897c:	b302      	st.w      	r0, (r3, 0x8)
			break;
    897e:	072d      	br      	0x87d8	// 87d8 <app_status_handle_process+0x60>
    8980:	200001c8 	.long	0x200001c8
    8984:	20000296 	.long	0x20000296

Disassembly of section .text.timer_count:

00008988 <timer_count>:
static volatile U16_T Time5sCnt;
static volatile U16_T Time10sCnt;
volatile U8_T TimerFlag;

void timer_count(void)
{
    8988:	14d2      	push      	r4-r5, r15
	TimerFlag |= TIMER_1MS_FLAG;
    898a:	11ae      	lrw      	r5, 0x20000364	// 8a40 <timer_count+0xb8>
    898c:	8560      	ld.b      	r3, (r5, 0x0)
    898e:	3ba1      	bseti      	r3, 1
    8990:	a560      	st.b      	r3, (r5, 0x0)
	Time1msCnt++;
    8992:	118d      	lrw      	r4, 0x2000029a	// 8a44 <timer_count+0xbc>
    8994:	8c60      	ld.h      	r3, (r4, 0x0)
    8996:	2300      	addi      	r3, 1
    8998:	74cd      	zexth      	r3, r3
    899a:	ac60      	st.h      	r3, (r4, 0x0)
	
	if(Time1msCnt >= 10)
    899c:	8c60      	ld.h      	r3, (r4, 0x0)
    899e:	74cd      	zexth      	r3, r3
    89a0:	3b09      	cmphsi      	r3, 10
    89a2:	0c4d      	bf      	0x8a3c	// 8a3c <timer_count+0xb4>
	{
		Time1msCnt = 0;
    89a4:	3300      	movi      	r3, 0
    89a6:	ac60      	st.h      	r3, (r4, 0x0)
		TimerFlag |= TIMER_10MS_FLAG;
    89a8:	8560      	ld.b      	r3, (r5, 0x0)
    89aa:	3ba2      	bseti      	r3, 2
    89ac:	a560      	st.b      	r3, (r5, 0x0)
		Time10msCnt++;
    89ae:	8c61      	ld.h      	r3, (r4, 0x2)
    89b0:	2300      	addi      	r3, 1
    89b2:	74cd      	zexth      	r3, r3
    89b4:	ac61      	st.h      	r3, (r4, 0x2)
		
		if(Time10msCnt >= 5)
    89b6:	8c61      	ld.h      	r3, (r4, 0x2)
    89b8:	74cd      	zexth      	r3, r3
    89ba:	3b04      	cmphsi      	r3, 5
    89bc:	0c40      	bf      	0x8a3c	// 8a3c <timer_count+0xb4>
		{
			Time10msCnt = 0;
    89be:	3300      	movi      	r3, 0
    89c0:	ac61      	st.h      	r3, (r4, 0x2)
			TimerFlag |= TIMER_50MS_FLAG;
    89c2:	8560      	ld.b      	r3, (r5, 0x0)
    89c4:	3ba3      	bseti      	r3, 3
    89c6:	a560      	st.b      	r3, (r5, 0x0)
			Time50msCnt++;
    89c8:	8c62      	ld.h      	r3, (r4, 0x4)
    89ca:	2300      	addi      	r3, 1
    89cc:	74cd      	zexth      	r3, r3
    89ce:	ac62      	st.h      	r3, (r4, 0x4)
			key_debounce_handler();
    89d0:	e3fff5b0 	bsr      	0x7530	// 7530 <key_debounce_handler>
			
			if(Time50msCnt >= 2)
    89d4:	8c62      	ld.h      	r3, (r4, 0x4)
    89d6:	74cd      	zexth      	r3, r3
    89d8:	3b01      	cmphsi      	r3, 2
    89da:	0c31      	bf      	0x8a3c	// 8a3c <timer_count+0xb4>
			{
				Time50msCnt = 0;
    89dc:	3300      	movi      	r3, 0
    89de:	ac62      	st.h      	r3, (r4, 0x4)
				TimerFlag |= TIMER_100MS_FLAG;
    89e0:	8560      	ld.b      	r3, (r5, 0x0)
    89e2:	3ba4      	bseti      	r3, 4
    89e4:	a560      	st.b      	r3, (r5, 0x0)
				Time100msCnt++;
    89e6:	8c63      	ld.h      	r3, (r4, 0x6)
    89e8:	2300      	addi      	r3, 1
    89ea:	74cd      	zexth      	r3, r3
    89ec:	ac63      	st.h      	r3, (r4, 0x6)
				
				if(Time100msCnt >= 10)
    89ee:	8c63      	ld.h      	r3, (r4, 0x6)
    89f0:	74cd      	zexth      	r3, r3
    89f2:	3b09      	cmphsi      	r3, 10
    89f4:	0c24      	bf      	0x8a3c	// 8a3c <timer_count+0xb4>
				{
					Time100msCnt = 0;
    89f6:	3300      	movi      	r3, 0
    89f8:	ac63      	st.h      	r3, (r4, 0x6)
					TimerFlag |= TIMER_1S_FLAG;
    89fa:	8560      	ld.b      	r3, (r5, 0x0)
    89fc:	3ba5      	bseti      	r3, 5
    89fe:	a560      	st.b      	r3, (r5, 0x0)
					Time1sCnt++;
    8a00:	8c64      	ld.h      	r3, (r4, 0x8)
    8a02:	2300      	addi      	r3, 1
    8a04:	74cd      	zexth      	r3, r3
    8a06:	ac64      	st.h      	r3, (r4, 0x8)
					
					if(Time1sCnt >= 5)
    8a08:	8c64      	ld.h      	r3, (r4, 0x8)
    8a0a:	74cd      	zexth      	r3, r3
    8a0c:	3b04      	cmphsi      	r3, 5
    8a0e:	0c17      	bf      	0x8a3c	// 8a3c <timer_count+0xb4>
					{
						Time1sCnt = 0;
    8a10:	3300      	movi      	r3, 0
    8a12:	ac64      	st.h      	r3, (r4, 0x8)
						TimerFlag |= TIMER_5S_FLAG;
    8a14:	8560      	ld.b      	r3, (r5, 0x0)
    8a16:	3ba6      	bseti      	r3, 6
    8a18:	a560      	st.b      	r3, (r5, 0x0)
						Time5sCnt++;
    8a1a:	8c65      	ld.h      	r3, (r4, 0xa)
    8a1c:	2300      	addi      	r3, 1
    8a1e:	74cd      	zexth      	r3, r3
    8a20:	ac65      	st.h      	r3, (r4, 0xa)
						
						if(Time5sCnt >= 2)
    8a22:	8c65      	ld.h      	r3, (r4, 0xa)
    8a24:	74cd      	zexth      	r3, r3
    8a26:	3b01      	cmphsi      	r3, 2
    8a28:	0c0a      	bf      	0x8a3c	// 8a3c <timer_count+0xb4>
						{
							Time5sCnt = 0;
    8a2a:	3300      	movi      	r3, 0
    8a2c:	ac65      	st.h      	r3, (r4, 0xa)
							TimerFlag |= TIMER_10S_FLAG;
    8a2e:	8560      	ld.b      	r3, (r5, 0x0)
    8a30:	3ba7      	bseti      	r3, 7
    8a32:	a560      	st.b      	r3, (r5, 0x0)
							Time10sCnt++;
    8a34:	8c66      	ld.h      	r3, (r4, 0xc)
    8a36:	2300      	addi      	r3, 1
    8a38:	74cd      	zexth      	r3, r3
    8a3a:	ac66      	st.h      	r3, (r4, 0xc)
					}
				}
			}
		}
	}
}
    8a3c:	1492      	pop      	r4-r5, r15
    8a3e:	0000      	bkpt
    8a40:	20000364 	.long	0x20000364
    8a44:	2000029a 	.long	0x2000029a

Disassembly of section .text.LPTIntHandler:

00008a48 <LPTIntHandler>:

/* LPT Interrupt */
void LPTIntHandler(void) 
{
    8a48:	1460      	nie
    8a4a:	1462      	ipush
    8a4c:	14d0      	push      	r15
	if((LPT->MISR & LPT_PEND) == LPT_PEND)
    8a4e:	106f      	lrw      	r3, 0x20000018	// 8a88 <LPTIntHandler+0x40>
    8a50:	3104      	movi      	r1, 4
    8a52:	9360      	ld.w      	r3, (r3, 0x0)
    8a54:	934e      	ld.w      	r2, (r3, 0x38)
    8a56:	6884      	and      	r2, r1
    8a58:	3a40      	cmpnei      	r2, 0
    8a5a:	0c09      	bf      	0x8a6c	// 8a6c <LPTIntHandler+0x24>
	{
		LPT->ICR = LPT_PEND;
    8a5c:	b330      	st.w      	r1, (r3, 0x40)
		timer_count();
    8a5e:	e3ffff95 	bsr      	0x8988	// 8988 <timer_count>
	} 
	else if((LPT->MISR & LPT_MATCH) == LPT_MATCH)
	{
		LPT->ICR = LPT_MATCH;
	}
}
    8a62:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    8a66:	1401      	addi      	r14, r14, 4
    8a68:	1463      	ipop
    8a6a:	1461      	nir
	else if((LPT->MISR & LPT_TRGEV0) == LPT_TRGEV0)
    8a6c:	934e      	ld.w      	r2, (r3, 0x38)
    8a6e:	3101      	movi      	r1, 1
    8a70:	6884      	and      	r2, r1
    8a72:	3a40      	cmpnei      	r2, 0
    8a74:	0c03      	bf      	0x8a7a	// 8a7a <LPTIntHandler+0x32>
		LPT->ICR = LPT_MATCH;
    8a76:	b330      	st.w      	r1, (r3, 0x40)
}
    8a78:	07f5      	br      	0x8a62	// 8a62 <LPTIntHandler+0x1a>
	else if((LPT->MISR & LPT_MATCH) == LPT_MATCH)
    8a7a:	934e      	ld.w      	r2, (r3, 0x38)
    8a7c:	3102      	movi      	r1, 2
    8a7e:	6884      	and      	r2, r1
    8a80:	3a40      	cmpnei      	r2, 0
    8a82:	0bfa      	bt      	0x8a76	// 8a76 <LPTIntHandler+0x2e>
    8a84:	07ef      	br      	0x8a62	// 8a62 <LPTIntHandler+0x1a>
    8a86:	0000      	bkpt
    8a88:	20000018 	.long	0x20000018

Disassembly of section .text.Coret_Init:

00008a8c <Coret_Init>:
  *@函数返回值：void
  *@函数说明：
    1.CORETCLK = SYSCLK / 8
  */
void Coret_Init(void)
{
    8a8c:	14d0      	push      	r15
	SYSCON_General_CMD(ENABLE, ENDIS_SYSTICK); /* 打开CORET时钟 */
    8a8e:	3180      	movi      	r1, 128
    8a90:	4124      	lsli      	r1, r1, 4
    8a92:	3001      	movi      	r0, 1
    8a94:	e3ffdf66 	bsr      	0x4960	// 4960 <SYSCON_General_CMD>
	
	CORET_DeInit();
    8a98:	e3ffe0ba 	bsr      	0x4c0c	// 4c0c <CORET_DeInit>
	CORET_CLKSOURCE_EX(); /* 时钟源为(CORECLK/8) */													
    8a9c:	e3ffe0da 	bsr      	0x4c50	// 4c50 <CORET_CLKSOURCE_EX>
	CORET_TICKINT_Enable(); /* 使能计数到0的中断 */	
    8aa0:	e3ffe0e0 	bsr      	0x4c60	// 4c60 <CORET_TICKINT_Enable>
	CORET_reload(); /* 清零计数器，同时清零“计数到0”状态位 */
    8aa4:	e3ffe0e6 	bsr      	0x4c70	// 4c70 <CORET_reload>
	CORET_stop(); /* 停止计时 */
    8aa8:	e3ffe0cc 	bsr      	0x4c40	// 4c40 <CORET_stop>
	
	CORET_Int_Disable(); /* 禁止NVIC响应中断 */			
    8aac:	e3ffe0bc 	bsr      	0x4c24	// 4c24 <CORET_Int_Disable>
}
    8ab0:	1490      	pop      	r15

Disassembly of section .text.StartTimer:

00008ab4 <StartTimer>:

void StartTimer(U32_T cnt)
{
    8ab4:	14d1      	push      	r4, r15
	CK801->CORET_RVR = cnt; /* 加载预重载值 */	
    8ab6:	1089      	lrw      	r4, 0x20000064	// 8ad8 <StartTimer+0x24>
    8ab8:	9460      	ld.w      	r3, (r4, 0x0)
    8aba:	b305      	st.w      	r0, (r3, 0x14)
	CORET_reload(); /* 清零计数器，同时清零“计数到0”状态位 */
    8abc:	e3ffe0da 	bsr      	0x4c70	// 4c70 <CORET_reload>
	CORET_start(); /* 开始计时 */
    8ac0:	e3ffe0b8 	bsr      	0x4c30	// 4c30 <CORET_start>
	while((CK801->CORET_CSR & (1 << 16)) == 0); /* 等待计数到0 */
    8ac4:	3280      	movi      	r2, 128
    8ac6:	9420      	ld.w      	r1, (r4, 0x0)
    8ac8:	4249      	lsli      	r2, r2, 9
    8aca:	9164      	ld.w      	r3, (r1, 0x10)
    8acc:	68c8      	and      	r3, r2
    8ace:	3b40      	cmpnei      	r3, 0
    8ad0:	0ffd      	bf      	0x8aca	// 8aca <StartTimer+0x16>
	CORET_stop(); /* 停止计时 */
    8ad2:	e3ffe0b7 	bsr      	0x4c40	// 4c40 <CORET_stop>
}
    8ad6:	1491      	pop      	r4, r15
    8ad8:	20000064 	.long	0x20000064

Disassembly of section .text.Coret_DelayMs:

00008adc <Coret_DelayMs>:
  *@函数返回值：void
  *@函数说明：
    1.nus = (CORET_RVR + 1) / 1000 * (1 / CORETCLK)
  */
void Coret_DelayMs(U64_T nms)
{
    8adc:	14d4      	push      	r4-r7, r15
    8ade:	1423      	subi      	r14, r14, 12
	U64_T cnt, CntInteg, CntRemain;
	
	CORETCLK = SYSCLK / 8;
    8ae0:	1165      	lrw      	r3, 0x20000000	// 8b74 <Coret_DelayMs+0x98>
{
    8ae2:	6d03      	mov      	r4, r0
    8ae4:	6d47      	mov      	r5, r1
	CORETCLK = SYSCLK / 8;
    8ae6:	9360      	ld.w      	r3, (r3, 0x0)
    8ae8:	4b63      	lsri      	r3, r3, 3
    8aea:	1124      	lrw      	r1, 0x20000368	// 8b78 <Coret_DelayMs+0x9c>
    8aec:	b160      	st.w      	r3, (r1, 0x0)
	cnt = CORETCLK * nms / 1000;
    8aee:	9100      	ld.w      	r0, (r1, 0x0)
    8af0:	6c93      	mov      	r2, r4
    8af2:	6cd7      	mov      	r3, r5
    8af4:	3100      	movi      	r1, 0
    8af6:	e3ffcb75 	bsr      	0x21e0	// 21e0 <__muldi3>
    8afa:	32fa      	movi      	r2, 250
    8afc:	4242      	lsli      	r2, r2, 2
    8afe:	3300      	movi      	r3, 0
    8b00:	6d03      	mov      	r4, r0
    8b02:	6d47      	mov      	r5, r1
    8b04:	e3ffcbac 	bsr      	0x225c	// 225c <__udivdi3>
	
	if(cnt > 16777215)
    8b08:	3940      	cmpnei      	r1, 0
	cnt = CORETCLK * nms / 1000;
    8b0a:	6d83      	mov      	r6, r0
    8b0c:	6dc7      	mov      	r7, r1
	if(cnt > 16777215)
    8b0e:	0804      	bt      	0x8b16	// 8b16 <Coret_DelayMs+0x3a>
    8b10:	107b      	lrw      	r3, 0xffffff	// 8b7c <Coret_DelayMs+0xa0>
    8b12:	640c      	cmphs      	r3, r0
    8b14:	0821      	bt      	0x8b56	// 8b56 <Coret_DelayMs+0x7a>
	{
		CntInteg = cnt / 16777215;
    8b16:	105b      	lrw      	r2, 0xe7fffc18	// 8b80 <Coret_DelayMs+0xa4>
    8b18:	3303      	movi      	r3, 3
    8b1a:	6c13      	mov      	r0, r4
    8b1c:	6c57      	mov      	r1, r5
    8b1e:	e3ffcb9f 	bsr      	0x225c	// 225c <__udivdi3>
    8b22:	6d03      	mov      	r4, r0
    8b24:	6d47      	mov      	r5, r1
		CntRemain = cnt % 16777215;
    8b26:	1056      	lrw      	r2, 0xffffff	// 8b7c <Coret_DelayMs+0xa0>
    8b28:	3300      	movi      	r3, 0
    8b2a:	6c1b      	mov      	r0, r6
    8b2c:	6c5f      	mov      	r1, r7
    8b2e:	e3ffcd6d 	bsr      	0x2608	// 2608 <__umoddi3>
		
		while(CntInteg--) StartTimer(16777215);
    8b32:	3600      	movi      	r6, 0
    8b34:	3700      	movi      	r7, 0
    8b36:	3300      	movi      	r3, 0
		CntRemain = cnt % 16777215;
    8b38:	6c83      	mov      	r2, r0
		while(CntInteg--) StartTimer(16777215);
    8b3a:	2e00      	subi      	r6, 1
    8b3c:	2f00      	subi      	r7, 1
    8b3e:	2b00      	subi      	r3, 1
    8b40:	6511      	cmplt      	r4, r4
    8b42:	6119      	addc      	r4, r6
    8b44:	615d      	addc      	r5, r7
    8b46:	64d2      	cmpne      	r4, r3
    8b48:	080b      	bt      	0x8b5e	// 8b5e <Coret_DelayMs+0x82>
    8b4a:	64d6      	cmpne      	r5, r3
    8b4c:	0809      	bt      	0x8b5e	// 8b5e <Coret_DelayMs+0x82>
		if(CntRemain != 0) StartTimer(CntRemain);
    8b4e:	6c48      	or      	r1, r2
    8b50:	3940      	cmpnei      	r1, 0
    8b52:	0c04      	bf      	0x8b5a	// 8b5a <Coret_DelayMs+0x7e>
    8b54:	6c0b      	mov      	r0, r2
	}else StartTimer(cnt);
    8b56:	e3ffffaf 	bsr      	0x8ab4	// 8ab4 <StartTimer>
}
    8b5a:	1403      	addi      	r14, r14, 12
    8b5c:	1494      	pop      	r4-r7, r15
		while(CntInteg--) StartTimer(16777215);
    8b5e:	1008      	lrw      	r0, 0xffffff	// 8b7c <Coret_DelayMs+0xa0>
    8b60:	b822      	st.w      	r1, (r14, 0x8)
    8b62:	b841      	st.w      	r2, (r14, 0x4)
    8b64:	b860      	st.w      	r3, (r14, 0x0)
    8b66:	e3ffffa7 	bsr      	0x8ab4	// 8ab4 <StartTimer>
    8b6a:	9822      	ld.w      	r1, (r14, 0x8)
    8b6c:	9841      	ld.w      	r2, (r14, 0x4)
    8b6e:	9860      	ld.w      	r3, (r14, 0x0)
    8b70:	07e8      	br      	0x8b40	// 8b40 <Coret_DelayMs+0x64>
    8b72:	0000      	bkpt
    8b74:	20000000 	.long	0x20000000
    8b78:	20000368 	.long	0x20000368
    8b7c:	00ffffff 	.long	0x00ffffff
    8b80:	e7fffc18 	.long	0xe7fffc18
