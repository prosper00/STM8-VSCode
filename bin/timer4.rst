                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module timer4
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_init
                                     12 	.globl _delay
                                     13 	.globl _delayMicroseconds
                                     14 	.globl _TIM4_UPD_ISR
                                     15 ;--------------------------------------------------------
                                     16 ; ram data
                                     17 ;--------------------------------------------------------
                                     18 	.area DATA
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area INITIALIZED
                                     23 ;--------------------------------------------------------
                                     24 ; absolute external ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area DABS (ABS)
                                     27 
                                     28 ; default segment ordering for linker
                                     29 	.area HOME
                                     30 	.area GSINIT
                                     31 	.area GSFINAL
                                     32 	.area CONST
                                     33 	.area INITIALIZER
                                     34 	.area CODE
                                     35 
                                     36 ;--------------------------------------------------------
                                     37 ; global & static initialisations
                                     38 ;--------------------------------------------------------
                                     39 	.area HOME
                                     40 	.area GSINIT
                                     41 	.area GSFINAL
                                     42 	.area GSINIT
                                     43 ;--------------------------------------------------------
                                     44 ; Home
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area HOME
                                     48 ;--------------------------------------------------------
                                     49 ; code
                                     50 ;--------------------------------------------------------
                                     51 	.area CODE
                           000000    52 	Stimer4$micros$0 ==.
                                     53 ;	timer4.h: 91: INLINE uint32_t micros(void) {
                                     54 ; genLabel
                                     55 ;	-----------------------------------------
                                     56 ;	 function micros
                                     57 ;	-----------------------------------------
                                     58 ;	Register assignment might be sub-optimal.
                                     59 ;	Stack space usage: 10 bytes.
      0081F1                         60 _micros:
                           000000    61 	Stimer4$micros$1 ==.
      0081F1 52 0A            [ 2]   62 	sub	sp, #10
                           000002    63 	Stimer4$micros$2 ==.
                           000002    64 	Stimer4$micros$3 ==.
                                     65 ;	timer4.h: 97: sfr_TIM4.CR1.CEN = 0;
                                     66 ; genAssign
                                     67 ; genPointerSet
                                     68 ; peephole 0w removed dead load into x from #0x5340.
      0081F3 72 11 53 40      [ 1]   69 	bres	0x5340, #0
                                     70 ; peephole 205x replaced 'and' by 'bres' (index register) ('0x5340' -> '0x5340').
                           000006    71 	Stimer4$micros$4 ==.
                                     72 ;	timer4.h: 100: cnt = sfr_TIM4.CNTR.byte;
                                     73 ; genPointerGet
      0081F7 C6 53 46         [ 1]   74 	ld	a, 0x5346
      0081FA 6B 01            [ 1]   75 	ld	(0x01, sp), a
                           00000B    76 	Stimer4$micros$5 ==.
                                     77 ;	timer4.h: 102: uif = sfr_TIM4.SR.byte;
                                     78 ; genPointerGet
      0081FC C6 53 44         [ 1]   79 	ld	a, 0x5344
                                     80 ; genCast
                                     81 ; genAssign
      0081FF 6B 02            [ 1]   82 	ld	(0x02, sp), a
                           000010    83 	Stimer4$micros$6 ==.
                                     84 ;	timer4.h: 108: sfr_TIM4.CR1.CEN = 1;
                                     85 ; genAssign
                                     86 ; genPointerSet
                                     87 ; peephole 0w removed dead load into x from #0x5340.
      008201 72 10 53 40      [ 1]   88 	bset	0x5340, #0
                                     89 ; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
                           000014    90 	Stimer4$micros$7 ==.
                                     91 ;	timer4.h: 111: us  = g_micros;
                                     92 ; genAssign
      008205 90 CE 00 08      [ 2]   93 	ldw	y, _g_micros+2
      008209 CE 00 06         [ 2]   94 	ldw	x, _g_micros+0
      00820C 1F 03            [ 2]   95 	ldw	(0x03, sp), x
                           00001D    96 	Stimer4$micros$8 ==.
                                     97 ;	timer4.h: 115: us += ((uint16_t) cnt) << 2;
                                     98 ; genCast
                                     99 ; genAssign
      00820E 5F               [ 1]  100 	clrw	x
      00820F 7B 01            [ 1]  101 	ld	a, (0x01, sp)
      008211 97               [ 1]  102 	ld	xl, a
                                    103 ; genLeftShiftLiteral
      008212 58               [ 2]  104 	sllw	x
      008213 58               [ 2]  105 	sllw	x
                                    106 ; genCast
                                    107 ; genAssign
      008214 1F 09            [ 2]  108 	ldw	(0x09, sp), x
      008216 5F               [ 1]  109 	clrw	x
                                    110 ; genPlus
      008217 72 F9 09         [ 2]  111 	addw	y, (0x09, sp)
      00821A 9F               [ 1]  112 	ld	a, xl
      00821B 19 04            [ 1]  113 	adc	a, (0x04, sp)
      00821D 02               [ 1]  114 	rlwa	x
                                    115 ; peephole r1 used rlwa.
      00821E 19 03            [ 1]  116 	adc	a, (0x03, sp)
      008220 95               [ 1]  117 	ld	xh, a
                           000030   118 	Stimer4$micros$9 ==.
                                    119 ;	timer4.h: 119: if ((uif & 0x01) && (cnt != 250))
                                    120 ; genAnd
      008221 7B 02            [ 1]  121 	ld	a, (0x02, sp)
      008223 44               [ 1]  122 	srl	a
                                    123 ; peephole j5 changed absolute to relative unconditional jump.
      008224 24 11            [ 1]  124 	jrnc	00102$
                                    125 ; peephole j6 removed jra by using inverse jump logic
                                    126 ; peephole j30 removed unused label 00120$.
                                    127 ; skipping generated iCode
                                    128 ; genCmpEQorNE
      008226 7B 01            [ 1]  129 	ld	a, (0x01, sp)
      008228 A1 FA            [ 1]  130 	cp	a, #0xfa
                                    131 ; peephole j5 changed absolute to relative unconditional jump.
      00822A 27 0B            [ 1]  132 	jreq	00102$
                                    133 ; peephole j10 removed jra by using inverse jump logic
                                    134 ; peephole j30 removed unused label 00122$.
                           00003B   135 	Stimer4$micros$10 ==.
                                    136 ; skipping generated iCode
                           00003B   137 	Stimer4$micros$11 ==.
                                    138 ;	timer4.h: 120: us += 1000L;
                                    139 ; genPlus
      00822C 72 A9 03 E8      [ 2]  140 	addw	y, #0x03e8
      008230 9F               [ 1]  141 	ld	a, xl
      008231 A9 00            [ 1]  142 	adc	a, #0x00
      008233 02               [ 1]  143 	rlwa	x
                                    144 ; peephole r1 used rlwa.
      008234 A9 00            [ 1]  145 	adc	a, #0x00
      008236 95               [ 1]  146 	ld	xh, a
                                    147 ; genLabel
      008237                        148 00102$:
                           000046   149 	Stimer4$micros$12 ==.
                                    150 ;	timer4.h: 122: return(us);
                                    151 ; genReturn
      008237 51               [ 1]  152 	exgw	x, y
                                    153 ; genLabel
                                    154 ; peephole j30 removed unused label 00104$.
                           000047   155 	Stimer4$micros$13 ==.
                                    156 ;	timer4.h: 124: } // micros()
                                    157 ; genEndFunction
      008238 5B 0A            [ 2]  158 	addw	sp, #10
                           000049   159 	Stimer4$micros$14 ==.
                           000049   160 	Stimer4$micros$15 ==.
                           000049   161 	XFtimer4$micros$0$0 ==.
      00823A 81               [ 4]  162 	ret
                           00004A   163 	Stimer4$micros$16 ==.
                           00004A   164 	Stimer4$TIM4_init$17 ==.
                                    165 ;	timer4.c: 31: void TIM4_init(void) {
                                    166 ; genLabel
                                    167 ;	-----------------------------------------
                                    168 ;	 function TIM4_init
                                    169 ;	-----------------------------------------
                                    170 ;	Register assignment is optimal.
                                    171 ;	Stack space usage: 0 bytes.
      00823B                        172 _TIM4_init:
                           00004A   173 	Stimer4$TIM4_init$18 ==.
                           00004A   174 	Stimer4$TIM4_init$19 ==.
                                    175 ;	timer4.c: 39: sfr_TIM4.CR1.CEN = 0;
                                    176 ; genAssign
                                    177 ; genPointerSet
                                    178 ; peephole 0w removed dead load into x from #0x5340.
      00823B 72 11 53 40      [ 1]  179 	bres	0x5340, #0
                                    180 ; peephole 205x replaced 'and' by 'bres' (index register) ('0x5340' -> '0x5340').
                           00004E   181 	Stimer4$TIM4_init$20 ==.
                                    182 ;	timer4.c: 42: g_flagMilli = 0;
                                    183 ; genAssign
      00823F 72 5F 00 01      [ 1]  184 	clr	_g_flagMilli+0
                           000052   185 	Stimer4$TIM4_init$21 ==.
                                    186 ;	timer4.c: 43: g_millis    = 0;
                                    187 ; genAssign
      008243 5F               [ 1]  188 	clrw	x
      008244 CF 00 04         [ 2]  189 	ldw	_g_millis+2, x
      008247 CF 00 02         [ 2]  190 	ldw	_g_millis+0, x
                           000059   191 	Stimer4$TIM4_init$22 ==.
                                    192 ;	timer4.c: 44: g_micros    = 0;
                                    193 ; genAssign
      00824A 5F               [ 1]  194 	clrw	x
      00824B CF 00 08         [ 2]  195 	ldw	_g_micros+2, x
      00824E CF 00 06         [ 2]  196 	ldw	_g_micros+0, x
                           000060   197 	Stimer4$TIM4_init$23 ==.
                                    198 ;	timer4.c: 47: sfr_TIM4.CNTR.byte = 0x00;
                                    199 ; genPointerSet
      008251 35 00 53 46      [ 1]  200 	mov	0x5346+0, #0x00
                           000064   201 	Stimer4$TIM4_init$24 ==.
                                    202 ;	timer4.c: 50: sfr_TIM4.CR1.ARPE = 1;
                                    203 ; genAssign
                                    204 ; genPointerSet
                                    205 ; peephole 0w removed dead load into x from #0x5340.
      008255 72 1E 53 40      [ 1]  206 	bset	0x5340, #7
                                    207 ; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
                           000068   208 	Stimer4$TIM4_init$25 ==.
                                    209 ;	timer4.c: 53: sfr_TIM4.EGR.byte  = 0x00;
                                    210 ; genPointerSet
      008259 35 00 53 45      [ 1]  211 	mov	0x5345+0, #0x00
                           00006C   212 	Stimer4$TIM4_init$26 ==.
                                    213 ;	timer4.c: 56: sfr_TIM4.PSCR.PSC = 6;
                                    214 ; genAssign
                                    215 ; genPointerSet
      00825D C6 53 47         [ 1]  216 	ld	a, 0x5347
      008260 A4 F8            [ 1]  217 	and	a, #0xf8
      008262 AA 06            [ 1]  218 	or	a, #0x06
      008264 C7 53 47         [ 1]  219 	ld	0x5347, a
                                    220 ; peephole 340x exchanged 'ldw-ld-and-or-ld' by 'ld-and-or-ld direct' ('0x5347' -> '0x5347').
                           000076   221 	Stimer4$TIM4_init$27 ==.
                                    222 ;	timer4.c: 59: sfr_TIM4.ARR.byte  = 250;
                                    223 ; genPointerSet
      008267 35 FA 53 48      [ 1]  224 	mov	0x5348+0, #0xfa
                           00007A   225 	Stimer4$TIM4_init$28 ==.
                                    226 ;	timer4.c: 62: sfr_TIM4.IER.UIE = 1;
                                    227 ; genAssign
                                    228 ; genPointerSet
                                    229 ; peephole 0w removed dead load into x from #0x5343.
      00826B 72 10 53 43      [ 1]  230 	bset	0x5343, #0
                                    231 ; peephole 203x replaced 'or' by 'bset' (index register) ('0x5343' -> '0x5343').
                           00007E   232 	Stimer4$TIM4_init$29 ==.
                                    233 ;	timer4.c: 65: sfr_TIM4.CR1.CEN = 1;
                                    234 ; genAssign
                                    235 ; genPointerSet
                                    236 ; peephole 0w removed dead load into x from #0x5340.
      00826F 72 10 53 40      [ 1]  237 	bset	0x5340, #0
                                    238 ; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
                                    239 ; genLabel
                                    240 ; peephole j30 removed unused label 00101$.
                           000082   241 	Stimer4$TIM4_init$30 ==.
                                    242 ;	timer4.c: 67: } // TIM4_init
                                    243 ; genEndFunction
                           000082   244 	Stimer4$TIM4_init$31 ==.
                           000082   245 	XG$TIM4_init$0$0 ==.
      008273 81               [ 4]  246 	ret
                           000083   247 	Stimer4$TIM4_init$32 ==.
                           000083   248 	Stimer4$delay$33 ==.
                                    249 ;	timer4.c: 85: void delay(uint32_t ms) {
                                    250 ; genLabel
                                    251 ;	-----------------------------------------
                                    252 ;	 function delay
                                    253 ;	-----------------------------------------
                                    254 ;	Register assignment might be sub-optimal.
                                    255 ;	Stack space usage: 17 bytes.
      008274                        256 _delay:
                           000083   257 	Stimer4$delay$34 ==.
      008274 52 11            [ 2]  258 	sub	sp, #17
                           000085   259 	Stimer4$delay$35 ==.
                           000085   260 	Stimer4$delay$36 ==.
                                    261 ;	timer4.c: 87: uint32_t start = micros();
                                    262 ; genAssign
                                    263 ; genPointerSet
                                    264 ; peephole 0w removed dead load into x from #0x5340.
      008276 72 11 53 40      [ 1]  265 	bres	0x5340, #0
                                    266 ; peephole 205x replaced 'and' by 'bres' (index register) ('0x5340' -> '0x5340').
                                    267 ; genPointerGet
      00827A C6 53 46         [ 1]  268 	ld	a, 0x5346
      00827D 6B 08            [ 1]  269 	ld	(0x08, sp), a
                                    270 ; genPointerGet
      00827F C6 53 44         [ 1]  271 	ld	a, 0x5344
                                    272 ; genCast
                                    273 ; genAssign
      008282 6B 09            [ 1]  274 	ld	(0x09, sp), a
                                    275 ; genAssign
                                    276 ; genPointerSet
                                    277 ; peephole 0w removed dead load into x from #0x5340.
      008284 72 10 53 40      [ 1]  278 	bset	0x5340, #0
                                    279 ; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
                                    280 ; genAssign
      008288 90 CE 00 08      [ 2]  281 	ldw	y, _g_micros+2
      00828C CE 00 06         [ 2]  282 	ldw	x, _g_micros+0
      00828F 1F 0A            [ 2]  283 	ldw	(0x0a, sp), x
                                    284 ; genCast
                                    285 ; genAssign
      008291 5F               [ 1]  286 	clrw	x
      008292 7B 08            [ 1]  287 	ld	a, (0x08, sp)
      008294 97               [ 1]  288 	ld	xl, a
                                    289 ; genLeftShiftLiteral
      008295 58               [ 2]  290 	sllw	x
      008296 58               [ 2]  291 	sllw	x
                                    292 ; genCast
                                    293 ; genAssign
      008297 1F 10            [ 2]  294 	ldw	(0x10, sp), x
      008299 5F               [ 1]  295 	clrw	x
                                    296 ; genPlus
      00829A 72 F9 10         [ 2]  297 	addw	y, (0x10, sp)
      00829D 9F               [ 1]  298 	ld	a, xl
      00829E 19 0B            [ 1]  299 	adc	a, (0x0b, sp)
      0082A0 02               [ 1]  300 	rlwa	x
                                    301 ; peephole r1 used rlwa.
      0082A1 19 0A            [ 1]  302 	adc	a, (0x0a, sp)
      0082A3 95               [ 1]  303 	ld	xh, a
                                    304 ; genAnd
      0082A4 7B 09            [ 1]  305 	ld	a, (0x09, sp)
      0082A6 44               [ 1]  306 	srl	a
                                    307 ; peephole j5 changed absolute to relative unconditional jump.
      0082A7 24 11            [ 1]  308 	jrnc	00106$
                                    309 ; peephole j6 removed jra by using inverse jump logic
                                    310 ; peephole j30 removed unused label 00156$.
                                    311 ; skipping generated iCode
                                    312 ; genCmpEQorNE
      0082A9 7B 08            [ 1]  313 	ld	a, (0x08, sp)
      0082AB A1 FA            [ 1]  314 	cp	a, #0xfa
                                    315 ; peephole j5 changed absolute to relative unconditional jump.
      0082AD 27 0B            [ 1]  316 	jreq	00106$
                                    317 ; peephole j10 removed jra by using inverse jump logic
                                    318 ; peephole j30 removed unused label 00158$.
                           0000BE   319 	Stimer4$delay$37 ==.
                                    320 ; skipping generated iCode
                                    321 ; genPlus
      0082AF 72 A9 03 E8      [ 2]  322 	addw	y, #0x03e8
      0082B3 9F               [ 1]  323 	ld	a, xl
      0082B4 A9 00            [ 1]  324 	adc	a, #0x00
      0082B6 02               [ 1]  325 	rlwa	x
                                    326 ; peephole r1 used rlwa.
      0082B7 A9 00            [ 1]  327 	adc	a, #0x00
      0082B9 95               [ 1]  328 	ld	xh, a
                                    329 ; genLabel
      0082BA                        330 00106$:
                           0000C9   331 	Stimer4$delay$38 ==.
                           0000C9   332 	Stimer4$delay$38 ==.
                                    333 ; genAssign
      0082BA 17 03            [ 2]  334 	ldw	(0x03, sp), y
      0082BC 1F 01            [ 2]  335 	ldw	(0x01, sp), x
                           0000CD   336 	Stimer4$delay$39 ==.
                           0000CD   337 	Stimer4$delay$40 ==.
                                    338 ;	timer4.c: 90: ms *= 1000L;
                                    339 ; genIPush
      0082BE 1E 16            [ 2]  340 	ldw	x, (0x16, sp)
      0082C0 89               [ 2]  341 	pushw	x
                           0000D0   342 	Stimer4$delay$41 ==.
      0082C1 1E 16            [ 2]  343 	ldw	x, (0x16, sp)
      0082C3 89               [ 2]  344 	pushw	x
                           0000D3   345 	Stimer4$delay$42 ==.
                                    346 ; genIPush
      0082C4 4B E8            [ 1]  347 	push	#0xe8
                           0000D5   348 	Stimer4$delay$43 ==.
      0082C6 4B 03            [ 1]  349 	push	#0x03
                           0000D7   350 	Stimer4$delay$44 ==.
      0082C8 5F               [ 1]  351 	clrw	x
      0082C9 89               [ 2]  352 	pushw	x
                           0000D9   353 	Stimer4$delay$45 ==.
                                    354 ; genCall
      0082CA CD 85 48         [ 4]  355 	call	__mullong
      0082CD 5B 08            [ 2]  356 	addw	sp, #8
                           0000DE   357 	Stimer4$delay$46 ==.
                                    358 ; genAssign
      0082CF 1F 16            [ 2]  359 	ldw	(0x16, sp), x
      0082D1 17 14            [ 2]  360 	ldw	(0x14, sp), y
                           0000E2   361 	Stimer4$delay$47 ==.
                                    362 ;	timer4.c: 91: while (micros() - start < ms)
                                    363 ; genLabel
      0082D3                        364 00101$:
                           0000E2   365 	Stimer4$delay$48 ==.
                                    366 ;	timer4.h: 97: sfr_TIM4.CR1.CEN = 0;
                                    367 ; genAssign
                                    368 ; genPointerSet
                                    369 ; peephole 0w removed dead load into x from #0x5340.
      0082D3 72 11 53 40      [ 1]  370 	bres	0x5340, #0
                                    371 ; peephole 205x replaced 'and' by 'bres' (index register) ('0x5340' -> '0x5340').
                                    372 ;	timer4.h: 100: cnt = sfr_TIM4.CNTR.byte;
                                    373 ; genPointerGet
      0082D7 C6 53 46         [ 1]  374 	ld	a, 0x5346
      0082DA 6B 05            [ 1]  375 	ld	(0x05, sp), a
                                    376 ;	timer4.h: 102: uif = sfr_TIM4.SR.byte;
                                    377 ; genPointerGet
      0082DC C6 53 44         [ 1]  378 	ld	a, 0x5344
                                    379 ; genCast
                                    380 ; genAssign
      0082DF 90 97            [ 1]  381 	ld	yl, a
                                    382 ;	timer4.h: 108: sfr_TIM4.CR1.CEN = 1;
                                    383 ; genAssign
                                    384 ; genPointerSet
                                    385 ; peephole 0w removed dead load into x from #0x5340.
      0082E1 72 10 53 40      [ 1]  386 	bset	0x5340, #0
                                    387 ; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
                                    388 ;	timer4.h: 111: us  = g_micros;
                                    389 ; genAssign
      0082E5 CE 00 08         [ 2]  390 	ldw	x, _g_micros+2
      0082E8 1F 08            [ 2]  391 	ldw	(0x08, sp), x
      0082EA CE 00 06         [ 2]  392 	ldw	x, _g_micros+0
      0082ED 1F 06            [ 2]  393 	ldw	(0x06, sp), x
                                    394 ;	timer4.h: 115: us += ((uint16_t) cnt) << 2;
                                    395 ; genCast
                                    396 ; genAssign
      0082EF 5F               [ 1]  397 	clrw	x
      0082F0 7B 05            [ 1]  398 	ld	a, (0x05, sp)
      0082F2 97               [ 1]  399 	ld	xl, a
                                    400 ; genLeftShiftLiteral
      0082F3 58               [ 2]  401 	sllw	x
      0082F4 58               [ 2]  402 	sllw	x
                                    403 ; genCast
                                    404 ; genAssign
      0082F5 4F               [ 1]  405 	clr	a
      0082F6 0F 0A            [ 1]  406 	clr	(0x0a, sp)
                                    407 ; genPlus
      0082F8 72 FB 08         [ 2]  408 	addw	x, (0x08, sp)
      0082FB 1F 10            [ 2]  409 	ldw	(0x10, sp), x
      0082FD 19 07            [ 1]  410 	adc	a, (0x07, sp)
      0082FF 6B 0F            [ 1]  411 	ld	(0x0f, sp), a
      008301 4F               [ 1]  412 	clr	a
      008302 19 06            [ 1]  413 	adc	a, (0x06, sp)
      008304 6B 0E            [ 1]  414 	ld	(0x0e, sp), a
                                    415 ;	timer4.h: 119: if ((uif & 0x01) && (cnt != 250))
                                    416 ; genAnd
      008306 90 54            [ 2]  417 	srlw	y
                                    418 ; peephole j5 changed absolute to relative unconditional jump.
      008308 24 19            [ 1]  419 	jrnc	00110$
                                    420 ; peephole j6 removed jra by using inverse jump logic
                                    421 ; peephole j30 removed unused label 00160$.
                                    422 ; skipping generated iCode
                                    423 ; genCmpEQorNE
      00830A 7B 05            [ 1]  424 	ld	a, (0x05, sp)
      00830C A1 FA            [ 1]  425 	cp	a, #0xfa
                                    426 ; peephole j5 changed absolute to relative unconditional jump.
      00830E 27 13            [ 1]  427 	jreq	00110$
                                    428 ; peephole j10 removed jra by using inverse jump logic
                                    429 ; peephole j30 removed unused label 00162$.
                           00011F   430 	Stimer4$delay$49 ==.
                                    431 ; skipping generated iCode
                                    432 ;	timer4.h: 120: us += 1000L;
                                    433 ; genPlus
      008310 1E 10            [ 2]  434 	ldw	x, (0x10, sp)
      008312 1C 03 E8         [ 2]  435 	addw	x, #0x03e8
      008315 1F 10            [ 2]  436 	ldw	(0x10, sp), x
      008317 7B 0F            [ 1]  437 	ld	a, (0x0f, sp)
      008319 A9 00            [ 1]  438 	adc	a, #0x00
      00831B 6B 0F            [ 1]  439 	ld	(0x0f, sp), a
      00831D 7B 0E            [ 1]  440 	ld	a, (0x0e, sp)
      00831F A9 00            [ 1]  441 	adc	a, #0x00
      008321 6B 0E            [ 1]  442 	ld	(0x0e, sp), a
                                    443 ; genLabel
      008323                        444 00110$:
                           000132   445 	Stimer4$delay$50 ==.
                           000132   446 	Stimer4$delay$50 ==.
                           000132   447 	Stimer4$delay$51 ==.
                                    448 ;	timer4.c: 91: while (micros() - start < ms)
                                    449 ; genMinus
      008323 1E 10            [ 2]  450 	ldw	x, (0x10, sp)
      008325 72 F0 03         [ 2]  451 	subw	x, (0x03, sp)
      008328 7B 0F            [ 1]  452 	ld	a, (0x0f, sp)
      00832A 12 02            [ 1]  453 	sbc	a, (0x02, sp)
      00832C 88               [ 1]  454 	push	a
                           00013C   455 	Stimer4$delay$52 ==.
      00832D 7B 0F            [ 1]  456 	ld	a, (0x0f, sp)
      00832F 12 02            [ 1]  457 	sbc	a, (0x02, sp)
      008331 6B 0B            [ 1]  458 	ld	(0x0b, sp), a
                           000142   459 	Stimer4$delay$53 ==.
                                    460 ; genCmp
                                    461 ; genCmpTnz
                                    462 ; peephole 6 removed dead pop / push pair.
                           000142   463 	Stimer4$delay$54 ==.
      008333 13 17            [ 2]  464 	cpw	x, (0x17, sp)
      008335 84               [ 1]  465 	pop	a
                           000145   466 	Stimer4$delay$55 ==.
      008336 12 15            [ 1]  467 	sbc	a, (0x15, sp)
      008338 7B 0A            [ 1]  468 	ld	a, (0x0a, sp)
      00833A 12 14            [ 1]  469 	sbc	a, (0x14, sp)
                                    470 ; peephole j5 changed absolute to relative unconditional jump.
      00833C 24 03            [ 1]  471 	jrnc	00112$
                                    472 ; peephole j6 removed jra by using inverse jump logic
                                    473 ; peephole j30 removed unused label 00164$.
                                    474 ; skipping generated iCode
                           00014D   475 	Stimer4$delay$56 ==.
                           00014D   476 	Stimer4$delay$57 ==.
                                    477 ;	timer4.c: 92: NOP();
                                    478 ;	genInline
      00833E 9D               [ 1]  479 	nop
                                    480 ; genGoto
      00833F 20 92            [ 2]  481 	jra	00101$
                                    482 ; peephole j5 changed absolute to relative unconditional jump.
                                    483 ; genLabel
      008341                        484 00112$:
                           000150   485 	Stimer4$delay$58 ==.
                                    486 ;	timer4.c: 94: } // delay()
                                    487 ; genEndFunction
      008341 1E 12            [ 2]  488 	ldw	x, (18, sp)
      008343 5B 17            [ 2]  489 	addw	sp, #23
                           000154   490 	Stimer4$delay$59 ==.
      008345 FC               [ 2]  491 	jp	(x)
                           000155   492 	Stimer4$delay$60 ==.
                           000155   493 	Stimer4$delayMicroseconds$61 ==.
                                    494 ;	timer4.c: 112: void delayMicroseconds(uint32_t us) {
                                    495 ; genLabel
                                    496 ;	-----------------------------------------
                                    497 ;	 function delayMicroseconds
                                    498 ;	-----------------------------------------
                                    499 ;	Register assignment might be sub-optimal.
                                    500 ;	Stack space usage: 17 bytes.
      008346                        501 _delayMicroseconds:
                           000155   502 	Stimer4$delayMicroseconds$62 ==.
      008346 52 11            [ 2]  503 	sub	sp, #17
                           000157   504 	Stimer4$delayMicroseconds$63 ==.
                           000157   505 	Stimer4$delayMicroseconds$64 ==.
                                    506 ;	timer4.c: 114: uint32_t start = micros();
                                    507 ; genAssign
                                    508 ; genPointerSet
                                    509 ; peephole 0w removed dead load into x from #0x5340.
      008348 72 11 53 40      [ 1]  510 	bres	0x5340, #0
                                    511 ; peephole 205x replaced 'and' by 'bres' (index register) ('0x5340' -> '0x5340').
                                    512 ; genPointerGet
      00834C C6 53 46         [ 1]  513 	ld	a, 0x5346
      00834F 6B 08            [ 1]  514 	ld	(0x08, sp), a
                                    515 ; genPointerGet
      008351 C6 53 44         [ 1]  516 	ld	a, 0x5344
                                    517 ; genCast
                                    518 ; genAssign
      008354 6B 09            [ 1]  519 	ld	(0x09, sp), a
                                    520 ; genAssign
                                    521 ; genPointerSet
                                    522 ; peephole 0w removed dead load into x from #0x5340.
      008356 72 10 53 40      [ 1]  523 	bset	0x5340, #0
                                    524 ; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
                                    525 ; genAssign
      00835A 90 CE 00 08      [ 2]  526 	ldw	y, _g_micros+2
      00835E CE 00 06         [ 2]  527 	ldw	x, _g_micros+0
      008361 1F 0A            [ 2]  528 	ldw	(0x0a, sp), x
                                    529 ; genCast
                                    530 ; genAssign
      008363 5F               [ 1]  531 	clrw	x
      008364 7B 08            [ 1]  532 	ld	a, (0x08, sp)
      008366 97               [ 1]  533 	ld	xl, a
                                    534 ; genLeftShiftLiteral
      008367 58               [ 2]  535 	sllw	x
      008368 58               [ 2]  536 	sllw	x
                                    537 ; genCast
                                    538 ; genAssign
      008369 1F 10            [ 2]  539 	ldw	(0x10, sp), x
      00836B 5F               [ 1]  540 	clrw	x
                                    541 ; genPlus
      00836C 72 F9 10         [ 2]  542 	addw	y, (0x10, sp)
      00836F 9F               [ 1]  543 	ld	a, xl
      008370 19 0B            [ 1]  544 	adc	a, (0x0b, sp)
      008372 02               [ 1]  545 	rlwa	x
                                    546 ; peephole r1 used rlwa.
      008373 19 0A            [ 1]  547 	adc	a, (0x0a, sp)
      008375 95               [ 1]  548 	ld	xh, a
                                    549 ; genAnd
      008376 7B 09            [ 1]  550 	ld	a, (0x09, sp)
      008378 44               [ 1]  551 	srl	a
                                    552 ; peephole j5 changed absolute to relative unconditional jump.
      008379 24 11            [ 1]  553 	jrnc	00106$
                                    554 ; peephole j6 removed jra by using inverse jump logic
                                    555 ; peephole j30 removed unused label 00156$.
                                    556 ; skipping generated iCode
                                    557 ; genCmpEQorNE
      00837B 7B 08            [ 1]  558 	ld	a, (0x08, sp)
      00837D A1 FA            [ 1]  559 	cp	a, #0xfa
                                    560 ; peephole j5 changed absolute to relative unconditional jump.
      00837F 27 0B            [ 1]  561 	jreq	00106$
                                    562 ; peephole j10 removed jra by using inverse jump logic
                                    563 ; peephole j30 removed unused label 00158$.
                           000190   564 	Stimer4$delayMicroseconds$65 ==.
                                    565 ; skipping generated iCode
                                    566 ; genPlus
      008381 72 A9 03 E8      [ 2]  567 	addw	y, #0x03e8
      008385 9F               [ 1]  568 	ld	a, xl
      008386 A9 00            [ 1]  569 	adc	a, #0x00
      008388 02               [ 1]  570 	rlwa	x
                                    571 ; peephole r1 used rlwa.
      008389 A9 00            [ 1]  572 	adc	a, #0x00
      00838B 95               [ 1]  573 	ld	xh, a
                                    574 ; genLabel
      00838C                        575 00106$:
                           00019B   576 	Stimer4$delayMicroseconds$66 ==.
                           00019B   577 	Stimer4$delayMicroseconds$66 ==.
                                    578 ; genAssign
      00838C 17 03            [ 2]  579 	ldw	(0x03, sp), y
      00838E 1F 01            [ 2]  580 	ldw	(0x01, sp), x
                           00019F   581 	Stimer4$delayMicroseconds$67 ==.
                           00019F   582 	Stimer4$delayMicroseconds$68 ==.
                                    583 ;	timer4.c: 117: while (micros() - start < us)
                                    584 ; genLabel
      008390                        585 00101$:
                           00019F   586 	Stimer4$delayMicroseconds$69 ==.
                                    587 ;	timer4.h: 97: sfr_TIM4.CR1.CEN = 0;
                                    588 ; genAssign
                                    589 ; genPointerSet
                                    590 ; peephole 0w removed dead load into x from #0x5340.
      008390 72 11 53 40      [ 1]  591 	bres	0x5340, #0
                                    592 ; peephole 205x replaced 'and' by 'bres' (index register) ('0x5340' -> '0x5340').
                                    593 ;	timer4.h: 100: cnt = sfr_TIM4.CNTR.byte;
                                    594 ; genPointerGet
      008394 C6 53 46         [ 1]  595 	ld	a, 0x5346
      008397 6B 05            [ 1]  596 	ld	(0x05, sp), a
                                    597 ;	timer4.h: 102: uif = sfr_TIM4.SR.byte;
                                    598 ; genPointerGet
      008399 C6 53 44         [ 1]  599 	ld	a, 0x5344
                                    600 ; genCast
                                    601 ; genAssign
      00839C 90 97            [ 1]  602 	ld	yl, a
                                    603 ;	timer4.h: 108: sfr_TIM4.CR1.CEN = 1;
                                    604 ; genAssign
                                    605 ; genPointerSet
                                    606 ; peephole 0w removed dead load into x from #0x5340.
      00839E 72 10 53 40      [ 1]  607 	bset	0x5340, #0
                                    608 ; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
                                    609 ;	timer4.h: 111: us  = g_micros;
                                    610 ; genAssign
      0083A2 CE 00 08         [ 2]  611 	ldw	x, _g_micros+2
      0083A5 1F 08            [ 2]  612 	ldw	(0x08, sp), x
      0083A7 CE 00 06         [ 2]  613 	ldw	x, _g_micros+0
      0083AA 1F 06            [ 2]  614 	ldw	(0x06, sp), x
                                    615 ;	timer4.h: 115: us += ((uint16_t) cnt) << 2;
                                    616 ; genCast
                                    617 ; genAssign
      0083AC 5F               [ 1]  618 	clrw	x
      0083AD 7B 05            [ 1]  619 	ld	a, (0x05, sp)
      0083AF 97               [ 1]  620 	ld	xl, a
                                    621 ; genLeftShiftLiteral
      0083B0 58               [ 2]  622 	sllw	x
      0083B1 58               [ 2]  623 	sllw	x
                                    624 ; genCast
                                    625 ; genAssign
      0083B2 4F               [ 1]  626 	clr	a
      0083B3 0F 0A            [ 1]  627 	clr	(0x0a, sp)
                                    628 ; genPlus
      0083B5 72 FB 08         [ 2]  629 	addw	x, (0x08, sp)
      0083B8 1F 10            [ 2]  630 	ldw	(0x10, sp), x
      0083BA 19 07            [ 1]  631 	adc	a, (0x07, sp)
      0083BC 6B 0F            [ 1]  632 	ld	(0x0f, sp), a
      0083BE 4F               [ 1]  633 	clr	a
      0083BF 19 06            [ 1]  634 	adc	a, (0x06, sp)
      0083C1 6B 0E            [ 1]  635 	ld	(0x0e, sp), a
                                    636 ;	timer4.h: 119: if ((uif & 0x01) && (cnt != 250))
                                    637 ; genAnd
      0083C3 90 54            [ 2]  638 	srlw	y
                                    639 ; peephole j5 changed absolute to relative unconditional jump.
      0083C5 24 19            [ 1]  640 	jrnc	00110$
                                    641 ; peephole j6 removed jra by using inverse jump logic
                                    642 ; peephole j30 removed unused label 00160$.
                                    643 ; skipping generated iCode
                                    644 ; genCmpEQorNE
      0083C7 7B 05            [ 1]  645 	ld	a, (0x05, sp)
      0083C9 A1 FA            [ 1]  646 	cp	a, #0xfa
                                    647 ; peephole j5 changed absolute to relative unconditional jump.
      0083CB 27 13            [ 1]  648 	jreq	00110$
                                    649 ; peephole j10 removed jra by using inverse jump logic
                                    650 ; peephole j30 removed unused label 00162$.
                           0001DC   651 	Stimer4$delayMicroseconds$70 ==.
                                    652 ; skipping generated iCode
                                    653 ;	timer4.h: 120: us += 1000L;
                                    654 ; genPlus
      0083CD 1E 10            [ 2]  655 	ldw	x, (0x10, sp)
      0083CF 1C 03 E8         [ 2]  656 	addw	x, #0x03e8
      0083D2 1F 10            [ 2]  657 	ldw	(0x10, sp), x
      0083D4 7B 0F            [ 1]  658 	ld	a, (0x0f, sp)
      0083D6 A9 00            [ 1]  659 	adc	a, #0x00
      0083D8 6B 0F            [ 1]  660 	ld	(0x0f, sp), a
      0083DA 7B 0E            [ 1]  661 	ld	a, (0x0e, sp)
      0083DC A9 00            [ 1]  662 	adc	a, #0x00
      0083DE 6B 0E            [ 1]  663 	ld	(0x0e, sp), a
                                    664 ; genLabel
      0083E0                        665 00110$:
                           0001EF   666 	Stimer4$delayMicroseconds$71 ==.
                           0001EF   667 	Stimer4$delayMicroseconds$71 ==.
                           0001EF   668 	Stimer4$delayMicroseconds$72 ==.
                                    669 ;	timer4.c: 117: while (micros() - start < us)
                                    670 ; genMinus
      0083E0 1E 10            [ 2]  671 	ldw	x, (0x10, sp)
      0083E2 72 F0 03         [ 2]  672 	subw	x, (0x03, sp)
      0083E5 7B 0F            [ 1]  673 	ld	a, (0x0f, sp)
      0083E7 12 02            [ 1]  674 	sbc	a, (0x02, sp)
      0083E9 88               [ 1]  675 	push	a
                           0001F9   676 	Stimer4$delayMicroseconds$73 ==.
      0083EA 7B 0F            [ 1]  677 	ld	a, (0x0f, sp)
      0083EC 12 02            [ 1]  678 	sbc	a, (0x02, sp)
      0083EE 6B 0B            [ 1]  679 	ld	(0x0b, sp), a
                           0001FF   680 	Stimer4$delayMicroseconds$74 ==.
                                    681 ; genCmp
                                    682 ; genCmpTnz
                                    683 ; peephole 6 removed dead pop / push pair.
                           0001FF   684 	Stimer4$delayMicroseconds$75 ==.
      0083F0 13 17            [ 2]  685 	cpw	x, (0x17, sp)
      0083F2 84               [ 1]  686 	pop	a
                           000202   687 	Stimer4$delayMicroseconds$76 ==.
      0083F3 12 15            [ 1]  688 	sbc	a, (0x15, sp)
      0083F5 7B 0A            [ 1]  689 	ld	a, (0x0a, sp)
      0083F7 12 14            [ 1]  690 	sbc	a, (0x14, sp)
                                    691 ; peephole j5 changed absolute to relative unconditional jump.
      0083F9 24 03            [ 1]  692 	jrnc	00112$
                                    693 ; peephole j6 removed jra by using inverse jump logic
                                    694 ; peephole j30 removed unused label 00164$.
                                    695 ; skipping generated iCode
                           00020A   696 	Stimer4$delayMicroseconds$77 ==.
                           00020A   697 	Stimer4$delayMicroseconds$78 ==.
                                    698 ;	timer4.c: 118: NOP();
                                    699 ;	genInline
      0083FB 9D               [ 1]  700 	nop
                                    701 ; genGoto
      0083FC 20 92            [ 2]  702 	jra	00101$
                                    703 ; peephole j5 changed absolute to relative unconditional jump.
                                    704 ; genLabel
      0083FE                        705 00112$:
                           00020D   706 	Stimer4$delayMicroseconds$79 ==.
                                    707 ;	timer4.c: 120: } // delayMicroseconds()
                                    708 ; genEndFunction
      0083FE 1E 12            [ 2]  709 	ldw	x, (18, sp)
      008400 5B 17            [ 2]  710 	addw	sp, #23
                           000211   711 	Stimer4$delayMicroseconds$80 ==.
      008402 FC               [ 2]  712 	jp	(x)
                           000212   713 	Stimer4$delayMicroseconds$81 ==.
                           000212   714 	Stimer4$TIM4_UPD_ISR$82 ==.
                                    715 ;	timer4.c: 137: ISR_HANDLER(TIM4_UPD_ISR, _TIM4_OVR_UIF_VECTOR_)
                                    716 ; genLabel
                                    717 ;	-----------------------------------------
                                    718 ;	 function TIM4_UPD_ISR
                                    719 ;	-----------------------------------------
                                    720 ;	Register assignment might be sub-optimal.
                                    721 ;	Stack space usage: 0 bytes.
      008403                        722 _TIM4_UPD_ISR:
                           000212   723 	Stimer4$TIM4_UPD_ISR$83 ==.
                           000212   724 	Stimer4$TIM4_UPD_ISR$84 ==.
                                    725 ;	timer4.c: 146: sfr_TIM4.SR.UIF = 0;
                                    726 ; genAssign
                                    727 ; genPointerSet
                                    728 ; peephole 0w removed dead load into x from #0x5344.
      008403 72 11 53 44      [ 1]  729 	bres	0x5344, #0
                                    730 ; peephole 205x replaced 'and' by 'bres' (index register) ('0x5344' -> '0x5344').
                           000216   731 	Stimer4$TIM4_UPD_ISR$85 ==.
                                    732 ;	timer4.c: 152: g_micros += 1000L;
                                    733 ; genPlus
      008407 CE 00 08         [ 2]  734 	ldw	x, _g_micros+2
      00840A 1C 03 E8         [ 2]  735 	addw	x, #0x03e8
      00840D 90 CE 00 06      [ 2]  736 	ldw	y, _g_micros+0
      008411 24 02            [ 1]  737 	jrnc	00103$
      008413 90 5C            [ 1]  738 	incw	y
      008415                        739 00103$:
                                    740 ; genAssign
      008415 CF 00 08         [ 2]  741 	ldw	_g_micros+2, x
      008418 90 CF 00 06      [ 2]  742 	ldw	_g_micros+0, y
                           00022B   743 	Stimer4$TIM4_UPD_ISR$86 ==.
                                    744 ;	timer4.c: 153: g_millis++;
                                    745 ; genAssign
      00841C CE 00 04         [ 2]  746 	ldw	x, _g_millis+2
      00841F 90 CE 00 02      [ 2]  747 	ldw	y, _g_millis+0
                                    748 ; genPlus
      008423 5C               [ 1]  749 	incw	x
      008424 26 02            [ 1]  750 	jrne	00104$
      008426 90 5C            [ 1]  751 	incw	y
      008428                        752 00104$:
                                    753 ; genAssign
      008428 CF 00 04         [ 2]  754 	ldw	_g_millis+2, x
      00842B 90 CF 00 02      [ 2]  755 	ldw	_g_millis+0, y
                           00023E   756 	Stimer4$TIM4_UPD_ISR$87 ==.
                                    757 ;	timer4.c: 154: g_flagMilli = 1;
                                    758 ; genAssign
      00842F 35 01 00 01      [ 1]  759 	mov	_g_flagMilli+0, #0x01
                           000242   760 	Stimer4$TIM4_UPD_ISR$88 ==.
                                    761 ;	timer4.c: 156: return;
                                    762 ; genReturn
                                    763 ; genLabel
                                    764 ; peephole j30 removed unused label 00101$.
                           000242   765 	Stimer4$TIM4_UPD_ISR$89 ==.
                                    766 ;	timer4.c: 158: } // TIM4_UPD_ISR
                                    767 ; genEndFunction
                           000242   768 	Stimer4$TIM4_UPD_ISR$90 ==.
                           000242   769 	XG$TIM4_UPD_ISR$0$0 ==.
      008433 80               [11]  770 	iret
                           000243   771 	Stimer4$TIM4_UPD_ISR$91 ==.
                                    772 	.area CODE
                                    773 	.area CONST
                                    774 	.area INITIALIZER
                                    775 	.area CABS (ABS)
                                    776 
                                    777 	.area .debug_line (NOLOAD)
      00036B 00 00 02 62            778 	.dw	0,Ldebug_line_end-Ldebug_line_start
      00036F                        779 Ldebug_line_start:
      00036F 00 02                  780 	.dw	2
      000371 00 00 00 A0            781 	.dw	0,Ldebug_line_stmt-6-Ldebug_line_start
      000375 01                     782 	.db	1
      000376 01                     783 	.db	1
      000377 FB                     784 	.db	-5
      000378 0F                     785 	.db	15
      000379 0A                     786 	.db	10
      00037A 00                     787 	.db	0
      00037B 01                     788 	.db	1
      00037C 01                     789 	.db	1
      00037D 01                     790 	.db	1
      00037E 01                     791 	.db	1
      00037F 00                     792 	.db	0
      000380 00                     793 	.db	0
      000381 00                     794 	.db	0
      000382 01                     795 	.db	1
      000383 2F 75 73 72 2F 62 69   796 	.ascii "/usr/bin/../share/sdcc/include/stm8"
             6E 2F 2E 2E 2F 73 68
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65 2F 73 74 6D 38
      0003A6 00                     797 	.db	0
      0003A7 2F 75 73 72 2F 73 68   798 	.ascii "/usr/share/sdcc/include/stm8"
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65 2F 73 74 6D 38
      0003C3 00                     799 	.db	0
      0003C4 2F 75 73 72 2F 62 69   800 	.ascii "/usr/bin/../share/sdcc/include"
             6E 2F 2E 2E 2F 73 68
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65
      0003E2 00                     801 	.db	0
      0003E3 2F 75 73 72 2F 73 68   802 	.ascii "/usr/share/sdcc/include"
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65
      0003FA 00                     803 	.db	0
      0003FB 00                     804 	.db	0
      0003FC 74 69 6D 65 72 34 2E   805 	.ascii "timer4.h"
             68
      000404 00                     806 	.db	0
      000405 00                     807 	.uleb128	0
      000406 00                     808 	.uleb128	0
      000407 00                     809 	.uleb128	0
      000408 74 69 6D 65 72 34 2E   810 	.ascii "timer4.c"
             63
      000410 00                     811 	.db	0
      000411 00                     812 	.uleb128	0
      000412 00                     813 	.uleb128	0
      000413 00                     814 	.uleb128	0
      000414 00                     815 	.db	0
      000415                        816 Ldebug_line_stmt:
      000415 00                     817 	.db	0
      000416 05                     818 	.uleb128	5
      000417 02                     819 	.db	2
      000418 00 00 81 F1            820 	.dw	0,(Stimer4$micros$0)
      00041C 03                     821 	.db	3
      00041D DA 00                  822 	.sleb128	90
      00041F 01                     823 	.db	1
      000420 00                     824 	.db	0
      000421 05                     825 	.uleb128	5
      000422 02                     826 	.db	2
      000423 00 00 81 F3            827 	.dw	0,(Stimer4$micros$3)
      000427 03                     828 	.db	3
      000428 06                     829 	.sleb128	6
      000429 01                     830 	.db	1
      00042A 00                     831 	.db	0
      00042B 05                     832 	.uleb128	5
      00042C 02                     833 	.db	2
      00042D 00 00 81 F7            834 	.dw	0,(Stimer4$micros$4)
      000431 03                     835 	.db	3
      000432 03                     836 	.sleb128	3
      000433 01                     837 	.db	1
      000434 00                     838 	.db	0
      000435 05                     839 	.uleb128	5
      000436 02                     840 	.db	2
      000437 00 00 81 FC            841 	.dw	0,(Stimer4$micros$5)
      00043B 03                     842 	.db	3
      00043C 02                     843 	.sleb128	2
      00043D 01                     844 	.db	1
      00043E 00                     845 	.db	0
      00043F 05                     846 	.uleb128	5
      000440 02                     847 	.db	2
      000441 00 00 82 01            848 	.dw	0,(Stimer4$micros$6)
      000445 03                     849 	.db	3
      000446 06                     850 	.sleb128	6
      000447 01                     851 	.db	1
      000448 00                     852 	.db	0
      000449 05                     853 	.uleb128	5
      00044A 02                     854 	.db	2
      00044B 00 00 82 05            855 	.dw	0,(Stimer4$micros$7)
      00044F 03                     856 	.db	3
      000450 03                     857 	.sleb128	3
      000451 01                     858 	.db	1
      000452 00                     859 	.db	0
      000453 05                     860 	.uleb128	5
      000454 02                     861 	.db	2
      000455 00 00 82 0E            862 	.dw	0,(Stimer4$micros$8)
      000459 03                     863 	.db	3
      00045A 04                     864 	.sleb128	4
      00045B 01                     865 	.db	1
      00045C 00                     866 	.db	0
      00045D 05                     867 	.uleb128	5
      00045E 02                     868 	.db	2
      00045F 00 00 82 21            869 	.dw	0,(Stimer4$micros$9)
      000463 03                     870 	.db	3
      000464 04                     871 	.sleb128	4
      000465 01                     872 	.db	1
      000466 00                     873 	.db	0
      000467 05                     874 	.uleb128	5
      000468 02                     875 	.db	2
      000469 00 00 82 2C            876 	.dw	0,(Stimer4$micros$11)
      00046D 03                     877 	.db	3
      00046E 01                     878 	.sleb128	1
      00046F 01                     879 	.db	1
      000470 00                     880 	.db	0
      000471 05                     881 	.uleb128	5
      000472 02                     882 	.db	2
      000473 00 00 82 37            883 	.dw	0,(Stimer4$micros$12)
      000477 03                     884 	.db	3
      000478 02                     885 	.sleb128	2
      000479 01                     886 	.db	1
      00047A 00                     887 	.db	0
      00047B 05                     888 	.uleb128	5
      00047C 02                     889 	.db	2
      00047D 00 00 82 38            890 	.dw	0,(Stimer4$micros$13)
      000481 03                     891 	.db	3
      000482 02                     892 	.sleb128	2
      000483 01                     893 	.db	1
      000484 09                     894 	.db	9
      000485 00 03                  895 	.dw	1+Stimer4$micros$15-Stimer4$micros$13
      000487 00                     896 	.db	0
      000488 01                     897 	.uleb128	1
      000489 01                     898 	.db	1
      00048A 04                     899 	.db	4
      00048B 02                     900 	.uleb128	2
      00048C 00                     901 	.db	0
      00048D 05                     902 	.uleb128	5
      00048E 02                     903 	.db	2
      00048F 00 00 82 3B            904 	.dw	0,(Stimer4$TIM4_init$17)
      000493 03                     905 	.db	3
      000494 1E                     906 	.sleb128	30
      000495 01                     907 	.db	1
      000496 00                     908 	.db	0
      000497 05                     909 	.uleb128	5
      000498 02                     910 	.db	2
      000499 00 00 82 3B            911 	.dw	0,(Stimer4$TIM4_init$19)
      00049D 03                     912 	.db	3
      00049E 08                     913 	.sleb128	8
      00049F 01                     914 	.db	1
      0004A0 00                     915 	.db	0
      0004A1 05                     916 	.uleb128	5
      0004A2 02                     917 	.db	2
      0004A3 00 00 82 3F            918 	.dw	0,(Stimer4$TIM4_init$20)
      0004A7 03                     919 	.db	3
      0004A8 03                     920 	.sleb128	3
      0004A9 01                     921 	.db	1
      0004AA 00                     922 	.db	0
      0004AB 05                     923 	.uleb128	5
      0004AC 02                     924 	.db	2
      0004AD 00 00 82 43            925 	.dw	0,(Stimer4$TIM4_init$21)
      0004B1 03                     926 	.db	3
      0004B2 01                     927 	.sleb128	1
      0004B3 01                     928 	.db	1
      0004B4 00                     929 	.db	0
      0004B5 05                     930 	.uleb128	5
      0004B6 02                     931 	.db	2
      0004B7 00 00 82 4A            932 	.dw	0,(Stimer4$TIM4_init$22)
      0004BB 03                     933 	.db	3
      0004BC 01                     934 	.sleb128	1
      0004BD 01                     935 	.db	1
      0004BE 00                     936 	.db	0
      0004BF 05                     937 	.uleb128	5
      0004C0 02                     938 	.db	2
      0004C1 00 00 82 51            939 	.dw	0,(Stimer4$TIM4_init$23)
      0004C5 03                     940 	.db	3
      0004C6 03                     941 	.sleb128	3
      0004C7 01                     942 	.db	1
      0004C8 00                     943 	.db	0
      0004C9 05                     944 	.uleb128	5
      0004CA 02                     945 	.db	2
      0004CB 00 00 82 55            946 	.dw	0,(Stimer4$TIM4_init$24)
      0004CF 03                     947 	.db	3
      0004D0 03                     948 	.sleb128	3
      0004D1 01                     949 	.db	1
      0004D2 00                     950 	.db	0
      0004D3 05                     951 	.uleb128	5
      0004D4 02                     952 	.db	2
      0004D5 00 00 82 59            953 	.dw	0,(Stimer4$TIM4_init$25)
      0004D9 03                     954 	.db	3
      0004DA 03                     955 	.sleb128	3
      0004DB 01                     956 	.db	1
      0004DC 00                     957 	.db	0
      0004DD 05                     958 	.uleb128	5
      0004DE 02                     959 	.db	2
      0004DF 00 00 82 5D            960 	.dw	0,(Stimer4$TIM4_init$26)
      0004E3 03                     961 	.db	3
      0004E4 03                     962 	.sleb128	3
      0004E5 01                     963 	.db	1
      0004E6 00                     964 	.db	0
      0004E7 05                     965 	.uleb128	5
      0004E8 02                     966 	.db	2
      0004E9 00 00 82 67            967 	.dw	0,(Stimer4$TIM4_init$27)
      0004ED 03                     968 	.db	3
      0004EE 03                     969 	.sleb128	3
      0004EF 01                     970 	.db	1
      0004F0 00                     971 	.db	0
      0004F1 05                     972 	.uleb128	5
      0004F2 02                     973 	.db	2
      0004F3 00 00 82 6B            974 	.dw	0,(Stimer4$TIM4_init$28)
      0004F7 03                     975 	.db	3
      0004F8 03                     976 	.sleb128	3
      0004F9 01                     977 	.db	1
      0004FA 00                     978 	.db	0
      0004FB 05                     979 	.uleb128	5
      0004FC 02                     980 	.db	2
      0004FD 00 00 82 6F            981 	.dw	0,(Stimer4$TIM4_init$29)
      000501 03                     982 	.db	3
      000502 03                     983 	.sleb128	3
      000503 01                     984 	.db	1
      000504 00                     985 	.db	0
      000505 05                     986 	.uleb128	5
      000506 02                     987 	.db	2
      000507 00 00 82 73            988 	.dw	0,(Stimer4$TIM4_init$30)
      00050B 03                     989 	.db	3
      00050C 02                     990 	.sleb128	2
      00050D 01                     991 	.db	1
      00050E 09                     992 	.db	9
      00050F 00 01                  993 	.dw	1+Stimer4$TIM4_init$31-Stimer4$TIM4_init$30
      000511 00                     994 	.db	0
      000512 01                     995 	.uleb128	1
      000513 01                     996 	.db	1
      000514 04                     997 	.db	4
      000515 02                     998 	.uleb128	2
      000516 00                     999 	.db	0
      000517 05                    1000 	.uleb128	5
      000518 02                    1001 	.db	2
      000519 00 00 82 74           1002 	.dw	0,(Stimer4$delay$33)
      00051D 03                    1003 	.db	3
      00051E D4 00                 1004 	.sleb128	84
      000520 01                    1005 	.db	1
      000521 00                    1006 	.db	0
      000522 05                    1007 	.uleb128	5
      000523 02                    1008 	.db	2
      000524 00 00 82 BE           1009 	.dw	0,(Stimer4$delay$40)
      000528 03                    1010 	.db	3
      000529 05                    1011 	.sleb128	5
      00052A 01                    1012 	.db	1
      00052B 00                    1013 	.db	0
      00052C 05                    1014 	.uleb128	5
      00052D 02                    1015 	.db	2
      00052E 00 00 82 D3           1016 	.dw	0,(Stimer4$delay$47)
      000532 03                    1017 	.db	3
      000533 01                    1018 	.sleb128	1
      000534 01                    1019 	.db	1
      000535 00                    1020 	.db	0
      000536 05                    1021 	.uleb128	5
      000537 02                    1022 	.db	2
      000538 00 00 83 23           1023 	.dw	0,(Stimer4$delay$51)
      00053C 03                    1024 	.db	3
      00053D 00                    1025 	.sleb128	0
      00053E 01                    1026 	.db	1
      00053F 00                    1027 	.db	0
      000540 05                    1028 	.uleb128	5
      000541 02                    1029 	.db	2
      000542 00 00 83 3E           1030 	.dw	0,(Stimer4$delay$57)
      000546 03                    1031 	.db	3
      000547 01                    1032 	.sleb128	1
      000548 01                    1033 	.db	1
      000549 00                    1034 	.db	0
      00054A 05                    1035 	.uleb128	5
      00054B 02                    1036 	.db	2
      00054C 00 00 83 41           1037 	.dw	0,(Stimer4$delay$58)
      000550 03                    1038 	.db	3
      000551 02                    1039 	.sleb128	2
      000552 01                    1040 	.db	1
      000553 00                    1041 	.db	0
      000554 05                    1042 	.uleb128	5
      000555 02                    1043 	.db	2
      000556 00 00 83 46           1044 	.dw	0,(Stimer4$delayMicroseconds$61)
      00055A 03                    1045 	.db	3
      00055B 12                    1046 	.sleb128	18
      00055C 01                    1047 	.db	1
      00055D 00                    1048 	.db	0
      00055E 05                    1049 	.uleb128	5
      00055F 02                    1050 	.db	2
      000560 00 00 83 90           1051 	.dw	0,(Stimer4$delayMicroseconds$68)
      000564 03                    1052 	.db	3
      000565 05                    1053 	.sleb128	5
      000566 01                    1054 	.db	1
      000567 00                    1055 	.db	0
      000568 05                    1056 	.uleb128	5
      000569 02                    1057 	.db	2
      00056A 00 00 83 E0           1058 	.dw	0,(Stimer4$delayMicroseconds$72)
      00056E 03                    1059 	.db	3
      00056F 00                    1060 	.sleb128	0
      000570 01                    1061 	.db	1
      000571 00                    1062 	.db	0
      000572 05                    1063 	.uleb128	5
      000573 02                    1064 	.db	2
      000574 00 00 83 FB           1065 	.dw	0,(Stimer4$delayMicroseconds$78)
      000578 03                    1066 	.db	3
      000579 01                    1067 	.sleb128	1
      00057A 01                    1068 	.db	1
      00057B 00                    1069 	.db	0
      00057C 05                    1070 	.uleb128	5
      00057D 02                    1071 	.db	2
      00057E 00 00 83 FE           1072 	.dw	0,(Stimer4$delayMicroseconds$79)
      000582 03                    1073 	.db	3
      000583 02                    1074 	.sleb128	2
      000584 01                    1075 	.db	1
      000585 00                    1076 	.db	0
      000586 05                    1077 	.uleb128	5
      000587 02                    1078 	.db	2
      000588 00 00 84 03           1079 	.dw	0,(Stimer4$TIM4_UPD_ISR$82)
      00058C 03                    1080 	.db	3
      00058D 11                    1081 	.sleb128	17
      00058E 01                    1082 	.db	1
      00058F 00                    1083 	.db	0
      000590 05                    1084 	.uleb128	5
      000591 02                    1085 	.db	2
      000592 00 00 84 03           1086 	.dw	0,(Stimer4$TIM4_UPD_ISR$84)
      000596 03                    1087 	.db	3
      000597 09                    1088 	.sleb128	9
      000598 01                    1089 	.db	1
      000599 00                    1090 	.db	0
      00059A 05                    1091 	.uleb128	5
      00059B 02                    1092 	.db	2
      00059C 00 00 84 07           1093 	.dw	0,(Stimer4$TIM4_UPD_ISR$85)
      0005A0 03                    1094 	.db	3
      0005A1 06                    1095 	.sleb128	6
      0005A2 01                    1096 	.db	1
      0005A3 00                    1097 	.db	0
      0005A4 05                    1098 	.uleb128	5
      0005A5 02                    1099 	.db	2
      0005A6 00 00 84 1C           1100 	.dw	0,(Stimer4$TIM4_UPD_ISR$86)
      0005AA 03                    1101 	.db	3
      0005AB 01                    1102 	.sleb128	1
      0005AC 01                    1103 	.db	1
      0005AD 00                    1104 	.db	0
      0005AE 05                    1105 	.uleb128	5
      0005AF 02                    1106 	.db	2
      0005B0 00 00 84 2F           1107 	.dw	0,(Stimer4$TIM4_UPD_ISR$87)
      0005B4 03                    1108 	.db	3
      0005B5 01                    1109 	.sleb128	1
      0005B6 01                    1110 	.db	1
      0005B7 00                    1111 	.db	0
      0005B8 05                    1112 	.uleb128	5
      0005B9 02                    1113 	.db	2
      0005BA 00 00 84 33           1114 	.dw	0,(Stimer4$TIM4_UPD_ISR$88)
      0005BE 03                    1115 	.db	3
      0005BF 02                    1116 	.sleb128	2
      0005C0 01                    1117 	.db	1
      0005C1 00                    1118 	.db	0
      0005C2 05                    1119 	.uleb128	5
      0005C3 02                    1120 	.db	2
      0005C4 00 00 84 33           1121 	.dw	0,(Stimer4$TIM4_UPD_ISR$89)
      0005C8 03                    1122 	.db	3
      0005C9 02                    1123 	.sleb128	2
      0005CA 01                    1124 	.db	1
      0005CB 09                    1125 	.db	9
      0005CC 00 01                 1126 	.dw	1+Stimer4$TIM4_UPD_ISR$90-Stimer4$TIM4_UPD_ISR$89
      0005CE 00                    1127 	.db	0
      0005CF 01                    1128 	.uleb128	1
      0005D0 01                    1129 	.db	1
      0005D1                       1130 Ldebug_line_end:
                                   1131 
                                   1132 	.area .debug_loc (NOLOAD)
      0001B8                       1133 Ldebug_loc_start:
      0001B8 00 00 84 03           1134 	.dw	0,(Stimer4$TIM4_UPD_ISR$83)
      0001BC 00 00 84 34           1135 	.dw	0,(Stimer4$TIM4_UPD_ISR$91)
      0001C0 00 02                 1136 	.dw	2
      0001C2 78                    1137 	.db	120
      0001C3 01                    1138 	.sleb128	1
      0001C4 00 00 84 02           1139 	.dw	0,(Stimer4$delayMicroseconds$80)
      0001C8 00 00 84 03           1140 	.dw	0,(Stimer4$delayMicroseconds$81)
      0001CC 00 02                 1141 	.dw	2
      0001CE 78                    1142 	.db	120
      0001CF 7B                    1143 	.sleb128	-5
      0001D0 00 00 83 F3           1144 	.dw	0,(Stimer4$delayMicroseconds$76)
      0001D4 00 00 84 02           1145 	.dw	0,(Stimer4$delayMicroseconds$80)
      0001D8 00 02                 1146 	.dw	2
      0001DA 78                    1147 	.db	120
      0001DB 12                    1148 	.sleb128	18
      0001DC 00 00 83 F0           1149 	.dw	0,(Stimer4$delayMicroseconds$75)
      0001E0 00 00 83 F3           1150 	.dw	0,(Stimer4$delayMicroseconds$76)
      0001E4 00 02                 1151 	.dw	2
      0001E6 78                    1152 	.db	120
      0001E7 13                    1153 	.sleb128	19
      0001E8 00 00 83 F0           1154 	.dw	0,(Stimer4$delayMicroseconds$74)
      0001EC 00 00 83 F0           1155 	.dw	0,(Stimer4$delayMicroseconds$75)
      0001F0 00 02                 1156 	.dw	2
      0001F2 78                    1157 	.db	120
      0001F3 12                    1158 	.sleb128	18
      0001F4 00 00 83 EA           1159 	.dw	0,(Stimer4$delayMicroseconds$73)
      0001F8 00 00 83 F0           1160 	.dw	0,(Stimer4$delayMicroseconds$74)
      0001FC 00 02                 1161 	.dw	2
      0001FE 78                    1162 	.db	120
      0001FF 13                    1163 	.sleb128	19
      000200 00 00 83 CD           1164 	.dw	0,(Stimer4$delayMicroseconds$70)
      000204 00 00 83 EA           1165 	.dw	0,(Stimer4$delayMicroseconds$73)
      000208 00 02                 1166 	.dw	2
      00020A 78                    1167 	.db	120
      00020B 12                    1168 	.sleb128	18
      00020C 00 00 83 81           1169 	.dw	0,(Stimer4$delayMicroseconds$65)
      000210 00 00 83 CD           1170 	.dw	0,(Stimer4$delayMicroseconds$70)
      000214 00 02                 1171 	.dw	2
      000216 78                    1172 	.db	120
      000217 12                    1173 	.sleb128	18
      000218 00 00 83 48           1174 	.dw	0,(Stimer4$delayMicroseconds$63)
      00021C 00 00 83 81           1175 	.dw	0,(Stimer4$delayMicroseconds$65)
      000220 00 02                 1176 	.dw	2
      000222 78                    1177 	.db	120
      000223 12                    1178 	.sleb128	18
      000224 00 00 83 46           1179 	.dw	0,(Stimer4$delayMicroseconds$62)
      000228 00 00 83 48           1180 	.dw	0,(Stimer4$delayMicroseconds$63)
      00022C 00 02                 1181 	.dw	2
      00022E 78                    1182 	.db	120
      00022F 01                    1183 	.sleb128	1
      000230 00 00 83 45           1184 	.dw	0,(Stimer4$delay$59)
      000234 00 00 83 46           1185 	.dw	0,(Stimer4$delay$60)
      000238 00 02                 1186 	.dw	2
      00023A 78                    1187 	.db	120
      00023B 7B                    1188 	.sleb128	-5
      00023C 00 00 83 36           1189 	.dw	0,(Stimer4$delay$55)
      000240 00 00 83 45           1190 	.dw	0,(Stimer4$delay$59)
      000244 00 02                 1191 	.dw	2
      000246 78                    1192 	.db	120
      000247 12                    1193 	.sleb128	18
      000248 00 00 83 33           1194 	.dw	0,(Stimer4$delay$54)
      00024C 00 00 83 36           1195 	.dw	0,(Stimer4$delay$55)
      000250 00 02                 1196 	.dw	2
      000252 78                    1197 	.db	120
      000253 13                    1198 	.sleb128	19
      000254 00 00 83 33           1199 	.dw	0,(Stimer4$delay$53)
      000258 00 00 83 33           1200 	.dw	0,(Stimer4$delay$54)
      00025C 00 02                 1201 	.dw	2
      00025E 78                    1202 	.db	120
      00025F 12                    1203 	.sleb128	18
      000260 00 00 83 2D           1204 	.dw	0,(Stimer4$delay$52)
      000264 00 00 83 33           1205 	.dw	0,(Stimer4$delay$53)
      000268 00 02                 1206 	.dw	2
      00026A 78                    1207 	.db	120
      00026B 13                    1208 	.sleb128	19
      00026C 00 00 83 10           1209 	.dw	0,(Stimer4$delay$49)
      000270 00 00 83 2D           1210 	.dw	0,(Stimer4$delay$52)
      000274 00 02                 1211 	.dw	2
      000276 78                    1212 	.db	120
      000277 12                    1213 	.sleb128	18
      000278 00 00 82 CF           1214 	.dw	0,(Stimer4$delay$46)
      00027C 00 00 83 10           1215 	.dw	0,(Stimer4$delay$49)
      000280 00 02                 1216 	.dw	2
      000282 78                    1217 	.db	120
      000283 12                    1218 	.sleb128	18
      000284 00 00 82 CA           1219 	.dw	0,(Stimer4$delay$45)
      000288 00 00 82 CF           1220 	.dw	0,(Stimer4$delay$46)
      00028C 00 02                 1221 	.dw	2
      00028E 78                    1222 	.db	120
      00028F 1A                    1223 	.sleb128	26
      000290 00 00 82 C8           1224 	.dw	0,(Stimer4$delay$44)
      000294 00 00 82 CA           1225 	.dw	0,(Stimer4$delay$45)
      000298 00 02                 1226 	.dw	2
      00029A 78                    1227 	.db	120
      00029B 18                    1228 	.sleb128	24
      00029C 00 00 82 C6           1229 	.dw	0,(Stimer4$delay$43)
      0002A0 00 00 82 C8           1230 	.dw	0,(Stimer4$delay$44)
      0002A4 00 02                 1231 	.dw	2
      0002A6 78                    1232 	.db	120
      0002A7 17                    1233 	.sleb128	23
      0002A8 00 00 82 C4           1234 	.dw	0,(Stimer4$delay$42)
      0002AC 00 00 82 C6           1235 	.dw	0,(Stimer4$delay$43)
      0002B0 00 02                 1236 	.dw	2
      0002B2 78                    1237 	.db	120
      0002B3 16                    1238 	.sleb128	22
      0002B4 00 00 82 C1           1239 	.dw	0,(Stimer4$delay$41)
      0002B8 00 00 82 C4           1240 	.dw	0,(Stimer4$delay$42)
      0002BC 00 02                 1241 	.dw	2
      0002BE 78                    1242 	.db	120
      0002BF 14                    1243 	.sleb128	20
      0002C0 00 00 82 AF           1244 	.dw	0,(Stimer4$delay$37)
      0002C4 00 00 82 C1           1245 	.dw	0,(Stimer4$delay$41)
      0002C8 00 02                 1246 	.dw	2
      0002CA 78                    1247 	.db	120
      0002CB 12                    1248 	.sleb128	18
      0002CC 00 00 82 76           1249 	.dw	0,(Stimer4$delay$35)
      0002D0 00 00 82 AF           1250 	.dw	0,(Stimer4$delay$37)
      0002D4 00 02                 1251 	.dw	2
      0002D6 78                    1252 	.db	120
      0002D7 12                    1253 	.sleb128	18
      0002D8 00 00 82 74           1254 	.dw	0,(Stimer4$delay$34)
      0002DC 00 00 82 76           1255 	.dw	0,(Stimer4$delay$35)
      0002E0 00 02                 1256 	.dw	2
      0002E2 78                    1257 	.db	120
      0002E3 01                    1258 	.sleb128	1
      0002E4 00 00 00 00           1259 	.dw	0,0
      0002E8 00 00 00 00           1260 	.dw	0,0
      0002EC 00 00 82 3B           1261 	.dw	0,(Stimer4$TIM4_init$18)
      0002F0 00 00 82 74           1262 	.dw	0,(Stimer4$TIM4_init$32)
      0002F4 00 02                 1263 	.dw	2
      0002F6 78                    1264 	.db	120
      0002F7 01                    1265 	.sleb128	1
      0002F8 00 00 00 00           1266 	.dw	0,0
      0002FC 00 00 00 00           1267 	.dw	0,0
      000300 00 00 82 3A           1268 	.dw	0,(Stimer4$micros$14)
      000304 00 00 82 3B           1269 	.dw	0,(Stimer4$micros$16)
      000308 00 02                 1270 	.dw	2
      00030A 78                    1271 	.db	120
      00030B 01                    1272 	.sleb128	1
      00030C 00 00 82 2C           1273 	.dw	0,(Stimer4$micros$10)
      000310 00 00 82 3A           1274 	.dw	0,(Stimer4$micros$14)
      000314 00 02                 1275 	.dw	2
      000316 78                    1276 	.db	120
      000317 0B                    1277 	.sleb128	11
      000318 00 00 81 F3           1278 	.dw	0,(Stimer4$micros$2)
      00031C 00 00 82 2C           1279 	.dw	0,(Stimer4$micros$10)
      000320 00 02                 1280 	.dw	2
      000322 78                    1281 	.db	120
      000323 0B                    1282 	.sleb128	11
      000324 00 00 81 F1           1283 	.dw	0,(Stimer4$micros$1)
      000328 00 00 81 F3           1284 	.dw	0,(Stimer4$micros$2)
      00032C 00 02                 1285 	.dw	2
      00032E 78                    1286 	.db	120
      00032F 01                    1287 	.sleb128	1
      000330 00 00 00 00           1288 	.dw	0,0
      000334 00 00 00 00           1289 	.dw	0,0
                                   1290 
                                   1291 	.area .debug_abbrev (NOLOAD)
      0000F8                       1292 Ldebug_abbrev:
      0000F8 01                    1293 	.uleb128	1
      0000F9 11                    1294 	.uleb128	17
      0000FA 01                    1295 	.db	1
      0000FB 03                    1296 	.uleb128	3
      0000FC 08                    1297 	.uleb128	8
      0000FD 10                    1298 	.uleb128	16
      0000FE 06                    1299 	.uleb128	6
      0000FF 13                    1300 	.uleb128	19
      000100 0B                    1301 	.uleb128	11
      000101 25                    1302 	.uleb128	37
      000102 08                    1303 	.uleb128	8
      000103 00                    1304 	.uleb128	0
      000104 00                    1305 	.uleb128	0
      000105 02                    1306 	.uleb128	2
      000106 24                    1307 	.uleb128	36
      000107 00                    1308 	.db	0
      000108 03                    1309 	.uleb128	3
      000109 08                    1310 	.uleb128	8
      00010A 0B                    1311 	.uleb128	11
      00010B 0B                    1312 	.uleb128	11
      00010C 3E                    1313 	.uleb128	62
      00010D 0B                    1314 	.uleb128	11
      00010E 00                    1315 	.uleb128	0
      00010F 00                    1316 	.uleb128	0
      000110 03                    1317 	.uleb128	3
      000111 2E                    1318 	.uleb128	46
      000112 01                    1319 	.db	1
      000113 01                    1320 	.uleb128	1
      000114 13                    1321 	.uleb128	19
      000115 03                    1322 	.uleb128	3
      000116 08                    1323 	.uleb128	8
      000117 11                    1324 	.uleb128	17
      000118 01                    1325 	.uleb128	1
      000119 12                    1326 	.uleb128	18
      00011A 01                    1327 	.uleb128	1
      00011B 3F                    1328 	.uleb128	63
      00011C 0C                    1329 	.uleb128	12
      00011D 40                    1330 	.uleb128	64
      00011E 06                    1331 	.uleb128	6
      00011F 49                    1332 	.uleb128	73
      000120 13                    1333 	.uleb128	19
      000121 00                    1334 	.uleb128	0
      000122 00                    1335 	.uleb128	0
      000123 04                    1336 	.uleb128	4
      000124 34                    1337 	.uleb128	52
      000125 00                    1338 	.db	0
      000126 02                    1339 	.uleb128	2
      000127 0A                    1340 	.uleb128	10
      000128 03                    1341 	.uleb128	3
      000129 08                    1342 	.uleb128	8
      00012A 49                    1343 	.uleb128	73
      00012B 13                    1344 	.uleb128	19
      00012C 00                    1345 	.uleb128	0
      00012D 00                    1346 	.uleb128	0
      00012E 05                    1347 	.uleb128	5
      00012F 2E                    1348 	.uleb128	46
      000130 00                    1349 	.db	0
      000131 03                    1350 	.uleb128	3
      000132 08                    1351 	.uleb128	8
      000133 11                    1352 	.uleb128	17
      000134 01                    1353 	.uleb128	1
      000135 12                    1354 	.uleb128	18
      000136 01                    1355 	.uleb128	1
      000137 3F                    1356 	.uleb128	63
      000138 0C                    1357 	.uleb128	12
      000139 40                    1358 	.uleb128	64
      00013A 06                    1359 	.uleb128	6
      00013B 00                    1360 	.uleb128	0
      00013C 00                    1361 	.uleb128	0
      00013D 06                    1362 	.uleb128	6
      00013E 2E                    1363 	.uleb128	46
      00013F 01                    1364 	.db	1
      000140 01                    1365 	.uleb128	1
      000141 13                    1366 	.uleb128	19
      000142 03                    1367 	.uleb128	3
      000143 08                    1368 	.uleb128	8
      000144 11                    1369 	.uleb128	17
      000145 01                    1370 	.uleb128	1
      000146 3F                    1371 	.uleb128	63
      000147 0C                    1372 	.uleb128	12
      000148 00                    1373 	.uleb128	0
      000149 00                    1374 	.uleb128	0
      00014A 07                    1375 	.uleb128	7
      00014B 05                    1376 	.uleb128	5
      00014C 00                    1377 	.db	0
      00014D 02                    1378 	.uleb128	2
      00014E 0A                    1379 	.uleb128	10
      00014F 03                    1380 	.uleb128	3
      000150 08                    1381 	.uleb128	8
      000151 49                    1382 	.uleb128	73
      000152 13                    1383 	.uleb128	19
      000153 00                    1384 	.uleb128	0
      000154 00                    1385 	.uleb128	0
      000155 08                    1386 	.uleb128	8
      000156 0B                    1387 	.uleb128	11
      000157 01                    1388 	.db	1
      000158 01                    1389 	.uleb128	1
      000159 13                    1390 	.uleb128	19
      00015A 11                    1391 	.uleb128	17
      00015B 01                    1392 	.uleb128	1
      00015C 12                    1393 	.uleb128	18
      00015D 01                    1394 	.uleb128	1
      00015E 00                    1395 	.uleb128	0
      00015F 00                    1396 	.uleb128	0
      000160 09                    1397 	.uleb128	9
      000161 0B                    1398 	.uleb128	11
      000162 01                    1399 	.db	1
      000163 00                    1400 	.uleb128	0
      000164 00                    1401 	.uleb128	0
      000165 0A                    1402 	.uleb128	10
      000166 0B                    1403 	.uleb128	11
      000167 01                    1404 	.db	1
      000168 11                    1405 	.uleb128	17
      000169 01                    1406 	.uleb128	1
      00016A 12                    1407 	.uleb128	18
      00016B 01                    1408 	.uleb128	1
      00016C 00                    1409 	.uleb128	0
      00016D 00                    1410 	.uleb128	0
      00016E 0B                    1411 	.uleb128	11
      00016F 2E                    1412 	.uleb128	46
      000170 00                    1413 	.db	0
      000171 03                    1414 	.uleb128	3
      000172 08                    1415 	.uleb128	8
      000173 11                    1416 	.uleb128	17
      000174 01                    1417 	.uleb128	1
      000175 12                    1418 	.uleb128	18
      000176 01                    1419 	.uleb128	1
      000177 36                    1420 	.uleb128	54
      000178 0B                    1421 	.uleb128	11
      000179 3F                    1422 	.uleb128	63
      00017A 0C                    1423 	.uleb128	12
      00017B 40                    1424 	.uleb128	64
      00017C 06                    1425 	.uleb128	6
      00017D 00                    1426 	.uleb128	0
      00017E 00                    1427 	.uleb128	0
      00017F 0C                    1428 	.uleb128	12
      000180 35                    1429 	.uleb128	53
      000181 00                    1430 	.db	0
      000182 49                    1431 	.uleb128	73
      000183 13                    1432 	.uleb128	19
      000184 00                    1433 	.uleb128	0
      000185 00                    1434 	.uleb128	0
      000186 0D                    1435 	.uleb128	13
      000187 34                    1436 	.uleb128	52
      000188 00                    1437 	.db	0
      000189 02                    1438 	.uleb128	2
      00018A 0A                    1439 	.uleb128	10
      00018B 03                    1440 	.uleb128	3
      00018C 08                    1441 	.uleb128	8
      00018D 3C                    1442 	.uleb128	60
      00018E 0C                    1443 	.uleb128	12
      00018F 3F                    1444 	.uleb128	63
      000190 0C                    1445 	.uleb128	12
      000191 49                    1446 	.uleb128	73
      000192 13                    1447 	.uleb128	19
      000193 00                    1448 	.uleb128	0
      000194 00                    1449 	.uleb128	0
      000195 00                    1450 	.uleb128	0
                                   1451 
                                   1452 	.area .debug_info (NOLOAD)
      0002E3 00 00 02 B9           1453 	.dw	0,Ldebug_info_end-Ldebug_info_start
      0002E7                       1454 Ldebug_info_start:
      0002E7 00 02                 1455 	.dw	2
      0002E9 00 00 00 F8           1456 	.dw	0,(Ldebug_abbrev)
      0002ED 04                    1457 	.db	4
      0002EE 01                    1458 	.uleb128	1
      0002EF 74 69 6D 65 72 34 2E  1459 	.ascii "timer4.c"
             63
      0002F7 00                    1460 	.db	0
      0002F8 00 00 03 6B           1461 	.dw	0,(Ldebug_line_start+-4)
      0002FC 01                    1462 	.db	1
      0002FD 53 44 43 43 20 76 65  1463 	.ascii "SDCC version 4.4.0 #14620"
             72 73 69 6F 6E 20 34
             2E 34 2E 30 20 23 31
             34 36 32 30
      000316 00                    1464 	.db	0
      000317 02                    1465 	.uleb128	2
      000318 75 6E 73 69 67 6E 65  1466 	.ascii "unsigned long"
             64 20 6C 6F 6E 67
      000325 00                    1467 	.db	0
      000326 04                    1468 	.db	4
      000327 07                    1469 	.db	7
      000328 03                    1470 	.uleb128	3
      000329 00 00 00 90           1471 	.dw	0,144
      00032D 6D 69 63 72 6F 73     1472 	.ascii "micros"
      000333 00                    1473 	.db	0
      000334 00 00 81 F1           1474 	.dw	0,(_micros)
      000338 00 00 82 3B           1475 	.dw	0,(XFtimer4$micros$0$0+1)
      00033C 00                    1476 	.db	0
      00033D 00 00 03 00           1477 	.dw	0,(Ldebug_loc_start+328)
      000341 00 00 00 34           1478 	.dw	0,52
      000345 04                    1479 	.uleb128	4
      000346 02                    1480 	.db	2
      000347 91                    1481 	.db	145
      000348 76                    1482 	.sleb128	-10
      000349 63 6E 74              1483 	.ascii "cnt"
      00034C 00                    1484 	.db	0
      00034D 00 00 00 90           1485 	.dw	0,144
      000351 04                    1486 	.uleb128	4
      000352 02                    1487 	.db	2
      000353 91                    1488 	.db	145
      000354 77                    1489 	.sleb128	-9
      000355 75 69 66              1490 	.ascii "uif"
      000358 00                    1491 	.db	0
      000359 00 00 00 90           1492 	.dw	0,144
      00035D 04                    1493 	.uleb128	4
      00035E 0C                    1494 	.db	12
      00035F 52                    1495 	.db	82
      000360 93                    1496 	.db	147
      000361 01                    1497 	.uleb128	1
      000362 51                    1498 	.db	81
      000363 93                    1499 	.db	147
      000364 01                    1500 	.uleb128	1
      000365 54                    1501 	.db	84
      000366 93                    1502 	.db	147
      000367 01                    1503 	.uleb128	1
      000368 53                    1504 	.db	83
      000369 93                    1505 	.db	147
      00036A 01                    1506 	.uleb128	1
      00036B 75 73                 1507 	.ascii "us"
      00036D 00                    1508 	.db	0
      00036E 00 00 00 34           1509 	.dw	0,52
      000372 00                    1510 	.uleb128	0
      000373 02                    1511 	.uleb128	2
      000374 75 6E 73 69 67 6E 65  1512 	.ascii "unsigned char"
             64 20 63 68 61 72
      000381 00                    1513 	.db	0
      000382 01                    1514 	.db	1
      000383 08                    1515 	.db	8
      000384 05                    1516 	.uleb128	5
      000385 54 49 4D 34 5F 69 6E  1517 	.ascii "TIM4_init"
             69 74
      00038E 00                    1518 	.db	0
      00038F 00 00 82 3B           1519 	.dw	0,(_TIM4_init)
      000393 00 00 82 74           1520 	.dw	0,(XG$TIM4_init$0$0+1)
      000397 01                    1521 	.db	1
      000398 00 00 02 EC           1522 	.dw	0,(Ldebug_loc_start+308)
      00039C 06                    1523 	.uleb128	6
      00039D 00 00 01 8E           1524 	.dw	0,398
      0003A1 64 65 6C 61 79        1525 	.ascii "delay"
      0003A6 00                    1526 	.db	0
      0003A7 00 00 82 74           1527 	.dw	0,(_delay)
      0003AB 01                    1528 	.db	1
      0003AC 07                    1529 	.uleb128	7
      0003AD 02                    1530 	.db	2
      0003AE 91                    1531 	.db	145
      0003AF 02                    1532 	.sleb128	2
      0003B0 6D 73                 1533 	.ascii "ms"
      0003B2 00                    1534 	.db	0
      0003B3 00 00 00 34           1535 	.dw	0,52
      0003B7 08                    1536 	.uleb128	8
      0003B8 00 00 01 1B           1537 	.dw	0,283
      0003BC 00 00 82 BA           1538 	.dw	0,(Stimer4$delay$38)
      0003C0 00 00 82 BE           1539 	.dw	0,(Stimer4$delay$39)
      0003C4 09                    1540 	.uleb128	9
      0003C5 0A                    1541 	.uleb128	10
      0003C6 00 00 82 76           1542 	.dw	0,(Stimer4$delay$36)
      0003CA 00 00 82 BA           1543 	.dw	0,(Stimer4$delay$38)
      0003CE 04                    1544 	.uleb128	4
      0003CF 02                    1545 	.db	2
      0003D0 91                    1546 	.db	145
      0003D1 76                    1547 	.sleb128	-10
      0003D2 63 6E 74              1548 	.ascii "cnt"
      0003D5 00                    1549 	.db	0
      0003D6 00 00 00 90           1550 	.dw	0,144
      0003DA 04                    1551 	.uleb128	4
      0003DB 02                    1552 	.db	2
      0003DC 91                    1553 	.db	145
      0003DD 77                    1554 	.sleb128	-9
      0003DE 75 69 66              1555 	.ascii "uif"
      0003E1 00                    1556 	.db	0
      0003E2 00 00 00 90           1557 	.dw	0,144
      0003E6 04                    1558 	.uleb128	4
      0003E7 0C                    1559 	.db	12
      0003E8 52                    1560 	.db	82
      0003E9 93                    1561 	.db	147
      0003EA 01                    1562 	.uleb128	1
      0003EB 51                    1563 	.db	81
      0003EC 93                    1564 	.db	147
      0003ED 01                    1565 	.uleb128	1
      0003EE 54                    1566 	.db	84
      0003EF 93                    1567 	.db	147
      0003F0 01                    1568 	.uleb128	1
      0003F1 53                    1569 	.db	83
      0003F2 93                    1570 	.db	147
      0003F3 01                    1571 	.uleb128	1
      0003F4 75 73                 1572 	.ascii "us"
      0003F6 00                    1573 	.db	0
      0003F7 00 00 00 34           1574 	.dw	0,52
      0003FB 00                    1575 	.uleb128	0
      0003FC 00                    1576 	.uleb128	0
      0003FD 00                    1577 	.uleb128	0
      0003FE 08                    1578 	.uleb128	8
      0003FF 00 00 01 57           1579 	.dw	0,343
      000403 00 00 83 23           1580 	.dw	0,(Stimer4$delay$50)
      000407 00 00 83 3E           1581 	.dw	0,(Stimer4$delay$56)
      00040B 09                    1582 	.uleb128	9
      00040C 0A                    1583 	.uleb128	10
      00040D 00 00 82 D3           1584 	.dw	0,(Stimer4$delay$48)
      000411 00 00 83 23           1585 	.dw	0,(Stimer4$delay$50)
      000415 04                    1586 	.uleb128	4
      000416 02                    1587 	.db	2
      000417 91                    1588 	.db	145
      000418 73                    1589 	.sleb128	-13
      000419 63 6E 74              1590 	.ascii "cnt"
      00041C 00                    1591 	.db	0
      00041D 00 00 00 90           1592 	.dw	0,144
      000421 04                    1593 	.uleb128	4
      000422 01                    1594 	.db	1
      000423 53                    1595 	.db	83
      000424 75 69 66              1596 	.ascii "uif"
      000427 00                    1597 	.db	0
      000428 00 00 00 90           1598 	.dw	0,144
      00042C 04                    1599 	.uleb128	4
      00042D 02                    1600 	.db	2
      00042E 91                    1601 	.db	145
      00042F 7C                    1602 	.sleb128	-4
      000430 75 73                 1603 	.ascii "us"
      000432 00                    1604 	.db	0
      000433 00 00 00 34           1605 	.dw	0,52
      000437 00                    1606 	.uleb128	0
      000438 00                    1607 	.uleb128	0
      000439 00                    1608 	.uleb128	0
      00043A 04                    1609 	.uleb128	4
      00043B 02                    1610 	.db	2
      00043C 91                    1611 	.db	145
      00043D 00                    1612 	.sleb128	0
      00043E 5F 5F 32 30 30 30 30  1613 	.ascii "__200000501"
             30 35 30 31
      000449 00                    1614 	.db	0
      00044A 00 00 00 34           1615 	.dw	0,52
      00044E 04                    1616 	.uleb128	4
      00044F 02                    1617 	.db	2
      000450 91                    1618 	.db	145
      000451 00                    1619 	.sleb128	0
      000452 5F 5F 32 30 30 30 30  1620 	.ascii "__200000499"
             30 34 39 39
      00045D 00                    1621 	.db	0
      00045E 00 00 00 34           1622 	.dw	0,52
      000462 04                    1623 	.uleb128	4
      000463 02                    1624 	.db	2
      000464 91                    1625 	.db	145
      000465 6F                    1626 	.sleb128	-17
      000466 73 74 61 72 74        1627 	.ascii "start"
      00046B 00                    1628 	.db	0
      00046C 00 00 00 34           1629 	.dw	0,52
      000470 00                    1630 	.uleb128	0
      000471 06                    1631 	.uleb128	6
      000472 00 00 02 6F           1632 	.dw	0,623
      000476 64 65 6C 61 79 4D 69  1633 	.ascii "delayMicroseconds"
             63 72 6F 73 65 63 6F
             6E 64 73
      000487 00                    1634 	.db	0
      000488 00 00 83 46           1635 	.dw	0,(_delayMicroseconds)
      00048C 01                    1636 	.db	1
      00048D 07                    1637 	.uleb128	7
      00048E 02                    1638 	.db	2
      00048F 91                    1639 	.db	145
      000490 02                    1640 	.sleb128	2
      000491 75 73                 1641 	.ascii "us"
      000493 00                    1642 	.db	0
      000494 00 00 00 34           1643 	.dw	0,52
      000498 08                    1644 	.uleb128	8
      000499 00 00 01 FC           1645 	.dw	0,508
      00049D 00 00 83 8C           1646 	.dw	0,(Stimer4$delayMicroseconds$66)
      0004A1 00 00 83 90           1647 	.dw	0,(Stimer4$delayMicroseconds$67)
      0004A5 09                    1648 	.uleb128	9
      0004A6 0A                    1649 	.uleb128	10
      0004A7 00 00 83 48           1650 	.dw	0,(Stimer4$delayMicroseconds$64)
      0004AB 00 00 83 8C           1651 	.dw	0,(Stimer4$delayMicroseconds$66)
      0004AF 04                    1652 	.uleb128	4
      0004B0 02                    1653 	.db	2
      0004B1 91                    1654 	.db	145
      0004B2 76                    1655 	.sleb128	-10
      0004B3 63 6E 74              1656 	.ascii "cnt"
      0004B6 00                    1657 	.db	0
      0004B7 00 00 00 90           1658 	.dw	0,144
      0004BB 04                    1659 	.uleb128	4
      0004BC 02                    1660 	.db	2
      0004BD 91                    1661 	.db	145
      0004BE 77                    1662 	.sleb128	-9
      0004BF 75 69 66              1663 	.ascii "uif"
      0004C2 00                    1664 	.db	0
      0004C3 00 00 00 90           1665 	.dw	0,144
      0004C7 04                    1666 	.uleb128	4
      0004C8 0C                    1667 	.db	12
      0004C9 52                    1668 	.db	82
      0004CA 93                    1669 	.db	147
      0004CB 01                    1670 	.uleb128	1
      0004CC 51                    1671 	.db	81
      0004CD 93                    1672 	.db	147
      0004CE 01                    1673 	.uleb128	1
      0004CF 54                    1674 	.db	84
      0004D0 93                    1675 	.db	147
      0004D1 01                    1676 	.uleb128	1
      0004D2 53                    1677 	.db	83
      0004D3 93                    1678 	.db	147
      0004D4 01                    1679 	.uleb128	1
      0004D5 75 73                 1680 	.ascii "us"
      0004D7 00                    1681 	.db	0
      0004D8 00 00 00 34           1682 	.dw	0,52
      0004DC 00                    1683 	.uleb128	0
      0004DD 00                    1684 	.uleb128	0
      0004DE 00                    1685 	.uleb128	0
      0004DF 08                    1686 	.uleb128	8
      0004E0 00 00 02 38           1687 	.dw	0,568
      0004E4 00 00 83 E0           1688 	.dw	0,(Stimer4$delayMicroseconds$71)
      0004E8 00 00 83 FB           1689 	.dw	0,(Stimer4$delayMicroseconds$77)
      0004EC 09                    1690 	.uleb128	9
      0004ED 0A                    1691 	.uleb128	10
      0004EE 00 00 83 90           1692 	.dw	0,(Stimer4$delayMicroseconds$69)
      0004F2 00 00 83 E0           1693 	.dw	0,(Stimer4$delayMicroseconds$71)
      0004F6 04                    1694 	.uleb128	4
      0004F7 02                    1695 	.db	2
      0004F8 91                    1696 	.db	145
      0004F9 73                    1697 	.sleb128	-13
      0004FA 63 6E 74              1698 	.ascii "cnt"
      0004FD 00                    1699 	.db	0
      0004FE 00 00 00 90           1700 	.dw	0,144
      000502 04                    1701 	.uleb128	4
      000503 01                    1702 	.db	1
      000504 53                    1703 	.db	83
      000505 75 69 66              1704 	.ascii "uif"
      000508 00                    1705 	.db	0
      000509 00 00 00 90           1706 	.dw	0,144
      00050D 04                    1707 	.uleb128	4
      00050E 02                    1708 	.db	2
      00050F 91                    1709 	.db	145
      000510 7C                    1710 	.sleb128	-4
      000511 75 73                 1711 	.ascii "us"
      000513 00                    1712 	.db	0
      000514 00 00 00 34           1713 	.dw	0,52
      000518 00                    1714 	.uleb128	0
      000519 00                    1715 	.uleb128	0
      00051A 00                    1716 	.uleb128	0
      00051B 04                    1717 	.uleb128	4
      00051C 02                    1718 	.db	2
      00051D 91                    1719 	.db	145
      00051E 00                    1720 	.sleb128	0
      00051F 5F 5F 32 30 30 30 30  1721 	.ascii "__200000505"
             30 35 30 35
      00052A 00                    1722 	.db	0
      00052B 00 00 00 34           1723 	.dw	0,52
      00052F 04                    1724 	.uleb128	4
      000530 02                    1725 	.db	2
      000531 91                    1726 	.db	145
      000532 00                    1727 	.sleb128	0
      000533 5F 5F 32 30 30 30 30  1728 	.ascii "__200000503"
             30 35 30 33
      00053E 00                    1729 	.db	0
      00053F 00 00 00 34           1730 	.dw	0,52
      000543 04                    1731 	.uleb128	4
      000544 02                    1732 	.db	2
      000545 91                    1733 	.db	145
      000546 6F                    1734 	.sleb128	-17
      000547 73 74 61 72 74        1735 	.ascii "start"
      00054C 00                    1736 	.db	0
      00054D 00 00 00 34           1737 	.dw	0,52
      000551 00                    1738 	.uleb128	0
      000552 0B                    1739 	.uleb128	11
      000553 54 49 4D 34 5F 55 50  1740 	.ascii "TIM4_UPD_ISR"
             44 5F 49 53 52
      00055F 00                    1741 	.db	0
      000560 00 00 84 03           1742 	.dw	0,(_TIM4_UPD_ISR)
      000564 00 00 84 34           1743 	.dw	0,(XG$TIM4_UPD_ISR$0$0+1)
      000568 03                    1744 	.db	3
      000569 01                    1745 	.db	1
      00056A 00 00 01 B8           1746 	.dw	0,(Ldebug_loc_start)
      00056E 0C                    1747 	.uleb128	12
      00056F 00 00 00 34           1748 	.dw	0,52
      000573 0D                    1749 	.uleb128	13
      000574 05                    1750 	.db	5
      000575 03                    1751 	.db	3
      000576 00 00 00 02           1752 	.dw	0,(_g_millis)
      00057A 67 5F 6D 69 6C 6C 69  1753 	.ascii "g_millis"
             73
      000582 00                    1754 	.db	0
      000583 01                    1755 	.db	1
      000584 01                    1756 	.db	1
      000585 00 00 02 8B           1757 	.dw	0,651
      000589 0D                    1758 	.uleb128	13
      00058A 05                    1759 	.db	5
      00058B 03                    1760 	.db	3
      00058C 00 00 00 06           1761 	.dw	0,(_g_micros)
      000590 67 5F 6D 69 63 72 6F  1762 	.ascii "g_micros"
             73
      000598 00                    1763 	.db	0
      000599 01                    1764 	.db	1
      00059A 01                    1765 	.db	1
      00059B 00 00 02 8B           1766 	.dw	0,651
      00059F 00                    1767 	.uleb128	0
      0005A0                       1768 Ldebug_info_end:
                                   1769 
                                   1770 	.area .debug_pubnames (NOLOAD)
      000073 00 00 00 67           1771 	.dw	0,Ldebug_pubnames_end-Ldebug_pubnames_start
      000077                       1772 Ldebug_pubnames_start:
      000077 00 02                 1773 	.dw	2
      000079 00 00 02 E3           1774 	.dw	0,(Ldebug_info_start-4)
      00007D 00 00 02 BD           1775 	.dw	0,4+Ldebug_info_end-Ldebug_info_start
      000081 00 00 00 A1           1776 	.dw	0,161
      000085 54 49 4D 34 5F 69 6E  1777 	.ascii "TIM4_init"
             69 74
      00008E 00                    1778 	.db	0
      00008F 00 00 00 B9           1779 	.dw	0,185
      000093 64 65 6C 61 79        1780 	.ascii "delay"
      000098 00                    1781 	.db	0
      000099 00 00 01 8E           1782 	.dw	0,398
      00009D 64 65 6C 61 79 4D 69  1783 	.ascii "delayMicroseconds"
             63 72 6F 73 65 63 6F
             6E 64 73
      0000AE 00                    1784 	.db	0
      0000AF 00 00 02 6F           1785 	.dw	0,623
      0000B3 54 49 4D 34 5F 55 50  1786 	.ascii "TIM4_UPD_ISR"
             44 5F 49 53 52
      0000BF 00                    1787 	.db	0
      0000C0 00 00 02 90           1788 	.dw	0,656
      0000C4 67 5F 6D 69 6C 6C 69  1789 	.ascii "g_millis"
             73
      0000CC 00                    1790 	.db	0
      0000CD 00 00 02 A6           1791 	.dw	0,678
      0000D1 67 5F 6D 69 63 72 6F  1792 	.ascii "g_micros"
             73
      0000D9 00                    1793 	.db	0
      0000DA 00 00 00 00           1794 	.dw	0,0
      0000DE                       1795 Ldebug_pubnames_end:
                                   1796 
                                   1797 	.area .debug_frame (NOLOAD)
      000180 00 00                 1798 	.dw	0
      000182 00 10                 1799 	.dw	Ldebug_CIE0_end-Ldebug_CIE0_start
      000184                       1800 Ldebug_CIE0_start:
      000184 FF FF                 1801 	.dw	0xffff
      000186 FF FF                 1802 	.dw	0xffff
      000188 01                    1803 	.db	1
      000189 00                    1804 	.db	0
      00018A 01                    1805 	.uleb128	1
      00018B 7F                    1806 	.sleb128	-1
      00018C 09                    1807 	.db	9
      00018D 0C                    1808 	.db	12
      00018E 08                    1809 	.uleb128	8
      00018F 09                    1810 	.uleb128	9
      000190 89                    1811 	.db	137
      000191 01                    1812 	.uleb128	1
      000192 00                    1813 	.db	0
      000193 00                    1814 	.db	0
      000194                       1815 Ldebug_CIE0_end:
      000194 00 00 00 14           1816 	.dw	0,20
      000198 00 00 01 80           1817 	.dw	0,(Ldebug_CIE0_start-4)
      00019C 00 00 84 03           1818 	.dw	0,(Stimer4$TIM4_UPD_ISR$83)	;initial loc
      0001A0 00 00 00 31           1819 	.dw	0,Stimer4$TIM4_UPD_ISR$91-Stimer4$TIM4_UPD_ISR$83
      0001A4 01                    1820 	.db	1
      0001A5 00 00 84 03           1821 	.dw	0,(Stimer4$TIM4_UPD_ISR$83)
      0001A9 0E                    1822 	.db	14
      0001AA 09                    1823 	.uleb128	9
      0001AB 00                    1824 	.db	0
                                   1825 
                                   1826 	.area .debug_frame (NOLOAD)
      0001AC 00 00                 1827 	.dw	0
      0001AE 00 10                 1828 	.dw	Ldebug_CIE1_end-Ldebug_CIE1_start
      0001B0                       1829 Ldebug_CIE1_start:
      0001B0 FF FF                 1830 	.dw	0xffff
      0001B2 FF FF                 1831 	.dw	0xffff
      0001B4 01                    1832 	.db	1
      0001B5 00                    1833 	.db	0
      0001B6 01                    1834 	.uleb128	1
      0001B7 7F                    1835 	.sleb128	-1
      0001B8 09                    1836 	.db	9
      0001B9 0C                    1837 	.db	12
      0001BA 08                    1838 	.uleb128	8
      0001BB 02                    1839 	.uleb128	2
      0001BC 89                    1840 	.db	137
      0001BD 01                    1841 	.uleb128	1
      0001BE 00                    1842 	.db	0
      0001BF 00                    1843 	.db	0
      0001C0                       1844 Ldebug_CIE1_end:
      0001C0 00 00 00 50           1845 	.dw	0,80
      0001C4 00 00 01 AC           1846 	.dw	0,(Ldebug_CIE1_start-4)
      0001C8 00 00 83 46           1847 	.dw	0,(Stimer4$delayMicroseconds$62)	;initial loc
      0001CC 00 00 00 BD           1848 	.dw	0,Stimer4$delayMicroseconds$81-Stimer4$delayMicroseconds$62
      0001D0 01                    1849 	.db	1
      0001D1 00 00 83 46           1850 	.dw	0,(Stimer4$delayMicroseconds$62)
      0001D5 0E                    1851 	.db	14
      0001D6 02                    1852 	.uleb128	2
      0001D7 01                    1853 	.db	1
      0001D8 00 00 83 48           1854 	.dw	0,(Stimer4$delayMicroseconds$63)
      0001DC 0E                    1855 	.db	14
      0001DD 13                    1856 	.uleb128	19
      0001DE 01                    1857 	.db	1
      0001DF 00 00 83 81           1858 	.dw	0,(Stimer4$delayMicroseconds$65)
      0001E3 0E                    1859 	.db	14
      0001E4 13                    1860 	.uleb128	19
      0001E5 01                    1861 	.db	1
      0001E6 00 00 83 CD           1862 	.dw	0,(Stimer4$delayMicroseconds$70)
      0001EA 0E                    1863 	.db	14
      0001EB 13                    1864 	.uleb128	19
      0001EC 01                    1865 	.db	1
      0001ED 00 00 83 EA           1866 	.dw	0,(Stimer4$delayMicroseconds$73)
      0001F1 0E                    1867 	.db	14
      0001F2 14                    1868 	.uleb128	20
      0001F3 01                    1869 	.db	1
      0001F4 00 00 83 F0           1870 	.dw	0,(Stimer4$delayMicroseconds$74)
      0001F8 0E                    1871 	.db	14
      0001F9 13                    1872 	.uleb128	19
      0001FA 01                    1873 	.db	1
      0001FB 00 00 83 F0           1874 	.dw	0,(Stimer4$delayMicroseconds$75)
      0001FF 0E                    1875 	.db	14
      000200 14                    1876 	.uleb128	20
      000201 01                    1877 	.db	1
      000202 00 00 83 F3           1878 	.dw	0,(Stimer4$delayMicroseconds$76)
      000206 0E                    1879 	.db	14
      000207 13                    1880 	.uleb128	19
      000208 01                    1881 	.db	1
      000209 00 00 84 02           1882 	.dw	0,(Stimer4$delayMicroseconds$80)
      00020D 0E                    1883 	.db	14
      00020E FC FF FF FF 0F        1884 	.uleb128	-4
      000213 00                    1885 	.db	0
                                   1886 
                                   1887 	.area .debug_frame (NOLOAD)
      000214 00 00                 1888 	.dw	0
      000216 00 10                 1889 	.dw	Ldebug_CIE2_end-Ldebug_CIE2_start
      000218                       1890 Ldebug_CIE2_start:
      000218 FF FF                 1891 	.dw	0xffff
      00021A FF FF                 1892 	.dw	0xffff
      00021C 01                    1893 	.db	1
      00021D 00                    1894 	.db	0
      00021E 01                    1895 	.uleb128	1
      00021F 7F                    1896 	.sleb128	-1
      000220 09                    1897 	.db	9
      000221 0C                    1898 	.db	12
      000222 08                    1899 	.uleb128	8
      000223 02                    1900 	.uleb128	2
      000224 89                    1901 	.db	137
      000225 01                    1902 	.uleb128	1
      000226 00                    1903 	.db	0
      000227 00                    1904 	.db	0
      000228                       1905 Ldebug_CIE2_end:
      000228 00 00 00 7C           1906 	.dw	0,124
      00022C 00 00 02 14           1907 	.dw	0,(Ldebug_CIE2_start-4)
      000230 00 00 82 74           1908 	.dw	0,(Stimer4$delay$34)	;initial loc
      000234 00 00 00 D2           1909 	.dw	0,Stimer4$delay$60-Stimer4$delay$34
      000238 01                    1910 	.db	1
      000239 00 00 82 74           1911 	.dw	0,(Stimer4$delay$34)
      00023D 0E                    1912 	.db	14
      00023E 02                    1913 	.uleb128	2
      00023F 01                    1914 	.db	1
      000240 00 00 82 76           1915 	.dw	0,(Stimer4$delay$35)
      000244 0E                    1916 	.db	14
      000245 13                    1917 	.uleb128	19
      000246 01                    1918 	.db	1
      000247 00 00 82 AF           1919 	.dw	0,(Stimer4$delay$37)
      00024B 0E                    1920 	.db	14
      00024C 13                    1921 	.uleb128	19
      00024D 01                    1922 	.db	1
      00024E 00 00 82 C1           1923 	.dw	0,(Stimer4$delay$41)
      000252 0E                    1924 	.db	14
      000253 15                    1925 	.uleb128	21
      000254 01                    1926 	.db	1
      000255 00 00 82 C4           1927 	.dw	0,(Stimer4$delay$42)
      000259 0E                    1928 	.db	14
      00025A 17                    1929 	.uleb128	23
      00025B 01                    1930 	.db	1
      00025C 00 00 82 C6           1931 	.dw	0,(Stimer4$delay$43)
      000260 0E                    1932 	.db	14
      000261 18                    1933 	.uleb128	24
      000262 01                    1934 	.db	1
      000263 00 00 82 C8           1935 	.dw	0,(Stimer4$delay$44)
      000267 0E                    1936 	.db	14
      000268 19                    1937 	.uleb128	25
      000269 01                    1938 	.db	1
      00026A 00 00 82 CA           1939 	.dw	0,(Stimer4$delay$45)
      00026E 0E                    1940 	.db	14
      00026F 1B                    1941 	.uleb128	27
      000270 01                    1942 	.db	1
      000271 00 00 82 CF           1943 	.dw	0,(Stimer4$delay$46)
      000275 0E                    1944 	.db	14
      000276 13                    1945 	.uleb128	19
      000277 01                    1946 	.db	1
      000278 00 00 83 10           1947 	.dw	0,(Stimer4$delay$49)
      00027C 0E                    1948 	.db	14
      00027D 13                    1949 	.uleb128	19
      00027E 01                    1950 	.db	1
      00027F 00 00 83 2D           1951 	.dw	0,(Stimer4$delay$52)
      000283 0E                    1952 	.db	14
      000284 14                    1953 	.uleb128	20
      000285 01                    1954 	.db	1
      000286 00 00 83 33           1955 	.dw	0,(Stimer4$delay$53)
      00028A 0E                    1956 	.db	14
      00028B 13                    1957 	.uleb128	19
      00028C 01                    1958 	.db	1
      00028D 00 00 83 33           1959 	.dw	0,(Stimer4$delay$54)
      000291 0E                    1960 	.db	14
      000292 14                    1961 	.uleb128	20
      000293 01                    1962 	.db	1
      000294 00 00 83 36           1963 	.dw	0,(Stimer4$delay$55)
      000298 0E                    1964 	.db	14
      000299 13                    1965 	.uleb128	19
      00029A 01                    1966 	.db	1
      00029B 00 00 83 45           1967 	.dw	0,(Stimer4$delay$59)
      00029F 0E                    1968 	.db	14
      0002A0 FC FF FF FF 0F        1969 	.uleb128	-4
      0002A5 00                    1970 	.db	0
      0002A6 00                    1971 	.db	0
      0002A7 00                    1972 	.db	0
                                   1973 
                                   1974 	.area .debug_frame (NOLOAD)
      0002A8 00 00                 1975 	.dw	0
      0002AA 00 10                 1976 	.dw	Ldebug_CIE3_end-Ldebug_CIE3_start
      0002AC                       1977 Ldebug_CIE3_start:
      0002AC FF FF                 1978 	.dw	0xffff
      0002AE FF FF                 1979 	.dw	0xffff
      0002B0 01                    1980 	.db	1
      0002B1 00                    1981 	.db	0
      0002B2 01                    1982 	.uleb128	1
      0002B3 7F                    1983 	.sleb128	-1
      0002B4 09                    1984 	.db	9
      0002B5 0C                    1985 	.db	12
      0002B6 08                    1986 	.uleb128	8
      0002B7 02                    1987 	.uleb128	2
      0002B8 89                    1988 	.db	137
      0002B9 01                    1989 	.uleb128	1
      0002BA 00                    1990 	.db	0
      0002BB 00                    1991 	.db	0
      0002BC                       1992 Ldebug_CIE3_end:
      0002BC 00 00 00 14           1993 	.dw	0,20
      0002C0 00 00 02 A8           1994 	.dw	0,(Ldebug_CIE3_start-4)
      0002C4 00 00 82 3B           1995 	.dw	0,(Stimer4$TIM4_init$18)	;initial loc
      0002C8 00 00 00 39           1996 	.dw	0,Stimer4$TIM4_init$32-Stimer4$TIM4_init$18
      0002CC 01                    1997 	.db	1
      0002CD 00 00 82 3B           1998 	.dw	0,(Stimer4$TIM4_init$18)
      0002D1 0E                    1999 	.db	14
      0002D2 02                    2000 	.uleb128	2
      0002D3 00                    2001 	.db	0
                                   2002 
                                   2003 	.area .debug_frame (NOLOAD)
      0002D4 00 00                 2004 	.dw	0
      0002D6 00 10                 2005 	.dw	Ldebug_CIE4_end-Ldebug_CIE4_start
      0002D8                       2006 Ldebug_CIE4_start:
      0002D8 FF FF                 2007 	.dw	0xffff
      0002DA FF FF                 2008 	.dw	0xffff
      0002DC 01                    2009 	.db	1
      0002DD 00                    2010 	.db	0
      0002DE 01                    2011 	.uleb128	1
      0002DF 7F                    2012 	.sleb128	-1
      0002E0 09                    2013 	.db	9
      0002E1 0C                    2014 	.db	12
      0002E2 08                    2015 	.uleb128	8
      0002E3 02                    2016 	.uleb128	2
      0002E4 89                    2017 	.db	137
      0002E5 01                    2018 	.uleb128	1
      0002E6 00                    2019 	.db	0
      0002E7 00                    2020 	.db	0
      0002E8                       2021 Ldebug_CIE4_end:
      0002E8 00 00 00 28           2022 	.dw	0,40
      0002EC 00 00 02 D4           2023 	.dw	0,(Ldebug_CIE4_start-4)
      0002F0 00 00 81 F1           2024 	.dw	0,(Stimer4$micros$1)	;initial loc
      0002F4 00 00 00 4A           2025 	.dw	0,Stimer4$micros$16-Stimer4$micros$1
      0002F8 01                    2026 	.db	1
      0002F9 00 00 81 F1           2027 	.dw	0,(Stimer4$micros$1)
      0002FD 0E                    2028 	.db	14
      0002FE 02                    2029 	.uleb128	2
      0002FF 01                    2030 	.db	1
      000300 00 00 81 F3           2031 	.dw	0,(Stimer4$micros$2)
      000304 0E                    2032 	.db	14
      000305 0C                    2033 	.uleb128	12
      000306 01                    2034 	.db	1
      000307 00 00 82 2C           2035 	.dw	0,(Stimer4$micros$10)
      00030B 0E                    2036 	.db	14
      00030C 0C                    2037 	.uleb128	12
      00030D 01                    2038 	.db	1
      00030E 00 00 82 3A           2039 	.dw	0,(Stimer4$micros$14)
      000312 0E                    2040 	.db	14
      000313 02                    2041 	.uleb128	2
