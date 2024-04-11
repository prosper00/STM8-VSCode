                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _UART_begin
                                     13 	.globl _TIM4_init
                                     14 	.globl _printf
                                     15 	.globl __CalcPrimes
                                     16 	.globl _g_micros
                                     17 	.globl _g_millis
                                     18 	.globl _g_flagMilli
                                     19 	.globl _putchar
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DATA
                           000000    24 G$g_flagMilli$0_0$0==.
      000001                         25 _g_flagMilli::
      000001                         26 	.ds 1
                           000001    27 G$g_millis$0_0$0==.
      000002                         28 _g_millis::
      000002                         29 	.ds 4
                           000005    30 G$g_micros$0_0$0==.
      000006                         31 _g_micros::
      000006                         32 	.ds 4
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area INITIALIZED
                                     37 ;--------------------------------------------------------
                                     38 ; Stack segment in internal ram
                                     39 ;--------------------------------------------------------
                                     40 	.area SSEG
      0003EA                         41 __start__stack:
      0003EA                         42 	.ds	1
                                     43 
                                     44 ;--------------------------------------------------------
                                     45 ; absolute external ram data
                                     46 ;--------------------------------------------------------
                                     47 	.area DABS (ABS)
                                     48 
                                     49 ; default segment ordering for linker
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area CONST
                                     54 	.area INITIALIZER
                                     55 	.area CODE
                                     56 
                                     57 ;--------------------------------------------------------
                                     58 ; interrupt vector
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
      008000                         61 __interrupt_vect:
      008000 82 00 80 6B             62 	int s_GSINIT ; reset
      008004 82 00 00 00             63 	int 0x000000 ; trap
      008008 82 00 00 00             64 	int 0x000000 ; int0
      00800C 82 00 00 00             65 	int 0x000000 ; int1
      008010 82 00 00 00             66 	int 0x000000 ; int2
      008014 82 00 00 00             67 	int 0x000000 ; int3
      008018 82 00 00 00             68 	int 0x000000 ; int4
      00801C 82 00 00 00             69 	int 0x000000 ; int5
      008020 82 00 00 00             70 	int 0x000000 ; int6
      008024 82 00 00 00             71 	int 0x000000 ; int7
      008028 82 00 00 00             72 	int 0x000000 ; int8
      00802C 82 00 00 00             73 	int 0x000000 ; int9
      008030 82 00 00 00             74 	int 0x000000 ; int10
      008034 82 00 00 00             75 	int 0x000000 ; int11
      008038 82 00 00 00             76 	int 0x000000 ; int12
      00803C 82 00 00 00             77 	int 0x000000 ; int13
      008040 82 00 00 00             78 	int 0x000000 ; int14
      008044 82 00 00 00             79 	int 0x000000 ; int15
      008048 82 00 00 00             80 	int 0x000000 ; int16
      00804C 82 00 00 00             81 	int 0x000000 ; int17
      008050 82 00 00 00             82 	int 0x000000 ; int18
      008054 82 00 00 00             83 	int 0x000000 ; int19
      008058 82 00 00 00             84 	int 0x000000 ; int20
      00805C 82 00 00 00             85 	int 0x000000 ; int21
      008060 82 00 00 00             86 	int 0x000000 ; int22
      008064 82 00 84 03             87 	int _TIM4_UPD_ISR ; int23
                                     88 ;--------------------------------------------------------
                                     89 ; global & static initialisations
                                     90 ;--------------------------------------------------------
                                     91 	.area HOME
                                     92 	.area GSINIT
                                     93 	.area GSFINAL
                                     94 	.area GSINIT
      00806B CD 85 1D         [ 4]   95 	call	___sdcc_external_startup
      00806E 4D               [ 1]   96 	tnz	a
      00806F 27 03            [ 1]   97 	jreq	__sdcc_init_data
      008071 CC 80 68         [ 2]   98 	jp	__sdcc_program_startup
      008074                         99 __sdcc_init_data:
                                    100 ; stm8_genXINIT() start
      008074 AE 03 E9         [ 2]  101 	ldw x, #l_DATA
      008077 27 07            [ 1]  102 	jreq	00002$
      008079                        103 00001$:
      008079 72 4F 00 00      [ 1]  104 	clr (s_DATA - 1, x)
      00807D 5A               [ 2]  105 	decw x
      00807E 26 F9            [ 1]  106 	jrne	00001$
      008080                        107 00002$:
      008080 AE 00 00         [ 2]  108 	ldw	x, #l_INITIALIZER
      008083 27 09            [ 1]  109 	jreq	00004$
      008085                        110 00003$:
      008085 D6 80 A6         [ 1]  111 	ld	a, (s_INITIALIZER - 1, x)
      008088 D7 03 E9         [ 1]  112 	ld	(s_INITIALIZED - 1, x), a
      00808B 5A               [ 2]  113 	decw	x
      00808C 26 F7            [ 1]  114 	jrne	00003$
      00808E                        115 00004$:
                                    116 ; stm8_genXINIT() end
                                    117 	.area GSFINAL
      00808E CC 80 68         [ 2]  118 	jp	__sdcc_program_startup
                                    119 ;--------------------------------------------------------
                                    120 ; Home
                                    121 ;--------------------------------------------------------
                                    122 	.area HOME
                                    123 	.area HOME
      008068                        124 __sdcc_program_startup:
      008068 CC 80 FB         [ 2]  125 	jp	_main
                                    126 ;	return from main will return to caller
                                    127 ;--------------------------------------------------------
                                    128 ; code
                                    129 ;--------------------------------------------------------
                                    130 	.area CODE
                           000000   131 	Smain$micros$0 ==.
                                    132 ;	timer4.h: 91: INLINE uint32_t micros(void) {
                                    133 ; genLabel
                                    134 ;	-----------------------------------------
                                    135 ;	 function micros
                                    136 ;	-----------------------------------------
                                    137 ;	Register assignment might be sub-optimal.
                                    138 ;	Stack space usage: 10 bytes.
      0080A7                        139 _micros:
                           000000   140 	Smain$micros$1 ==.
      0080A7 52 0A            [ 2]  141 	sub	sp, #10
                           000002   142 	Smain$micros$2 ==.
                           000002   143 	Smain$micros$3 ==.
                                    144 ;	timer4.h: 97: sfr_TIM4.CR1.CEN = 0;
                                    145 ; genAssign
                                    146 ; genPointerSet
                                    147 ; peephole 0w removed dead load into x from #0x5340.
      0080A9 72 11 53 40      [ 1]  148 	bres	0x5340, #0
                                    149 ; peephole 205x replaced 'and' by 'bres' (index register) ('0x5340' -> '0x5340').
                           000006   150 	Smain$micros$4 ==.
                                    151 ;	timer4.h: 100: cnt = sfr_TIM4.CNTR.byte;
                                    152 ; genPointerGet
      0080AD C6 53 46         [ 1]  153 	ld	a, 0x5346
      0080B0 6B 01            [ 1]  154 	ld	(0x01, sp), a
                           00000B   155 	Smain$micros$5 ==.
                                    156 ;	timer4.h: 102: uif = sfr_TIM4.SR.byte;
                                    157 ; genPointerGet
      0080B2 C6 53 44         [ 1]  158 	ld	a, 0x5344
                                    159 ; genCast
                                    160 ; genAssign
      0080B5 6B 02            [ 1]  161 	ld	(0x02, sp), a
                           000010   162 	Smain$micros$6 ==.
                                    163 ;	timer4.h: 108: sfr_TIM4.CR1.CEN = 1;
                                    164 ; genAssign
                                    165 ; genPointerSet
                                    166 ; peephole 0w removed dead load into x from #0x5340.
      0080B7 72 10 53 40      [ 1]  167 	bset	0x5340, #0
                                    168 ; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
                           000014   169 	Smain$micros$7 ==.
                                    170 ;	timer4.h: 111: us  = g_micros;
                                    171 ; genAssign
      0080BB 90 CE 00 08      [ 2]  172 	ldw	y, _g_micros+2
      0080BF CE 00 06         [ 2]  173 	ldw	x, _g_micros+0
      0080C2 1F 03            [ 2]  174 	ldw	(0x03, sp), x
                           00001D   175 	Smain$micros$8 ==.
                                    176 ;	timer4.h: 115: us += ((uint16_t) cnt) << 2;
                                    177 ; genCast
                                    178 ; genAssign
      0080C4 5F               [ 1]  179 	clrw	x
      0080C5 7B 01            [ 1]  180 	ld	a, (0x01, sp)
      0080C7 97               [ 1]  181 	ld	xl, a
                                    182 ; genLeftShiftLiteral
      0080C8 58               [ 2]  183 	sllw	x
      0080C9 58               [ 2]  184 	sllw	x
                                    185 ; genCast
                                    186 ; genAssign
      0080CA 1F 09            [ 2]  187 	ldw	(0x09, sp), x
      0080CC 5F               [ 1]  188 	clrw	x
                                    189 ; genPlus
      0080CD 72 F9 09         [ 2]  190 	addw	y, (0x09, sp)
      0080D0 9F               [ 1]  191 	ld	a, xl
      0080D1 19 04            [ 1]  192 	adc	a, (0x04, sp)
      0080D3 02               [ 1]  193 	rlwa	x
                                    194 ; peephole r1 used rlwa.
      0080D4 19 03            [ 1]  195 	adc	a, (0x03, sp)
      0080D6 95               [ 1]  196 	ld	xh, a
                           000030   197 	Smain$micros$9 ==.
                                    198 ;	timer4.h: 119: if ((uif & 0x01) && (cnt != 250))
                                    199 ; genAnd
      0080D7 7B 02            [ 1]  200 	ld	a, (0x02, sp)
      0080D9 44               [ 1]  201 	srl	a
                                    202 ; peephole j5 changed absolute to relative unconditional jump.
      0080DA 24 11            [ 1]  203 	jrnc	00102$
                                    204 ; peephole j6 removed jra by using inverse jump logic
                                    205 ; peephole j30 removed unused label 00120$.
                                    206 ; skipping generated iCode
                                    207 ; genCmpEQorNE
      0080DC 7B 01            [ 1]  208 	ld	a, (0x01, sp)
      0080DE A1 FA            [ 1]  209 	cp	a, #0xfa
                                    210 ; peephole j5 changed absolute to relative unconditional jump.
      0080E0 27 0B            [ 1]  211 	jreq	00102$
                                    212 ; peephole j10 removed jra by using inverse jump logic
                                    213 ; peephole j30 removed unused label 00122$.
                           00003B   214 	Smain$micros$10 ==.
                                    215 ; skipping generated iCode
                           00003B   216 	Smain$micros$11 ==.
                                    217 ;	timer4.h: 120: us += 1000L;
                                    218 ; genPlus
      0080E2 72 A9 03 E8      [ 2]  219 	addw	y, #0x03e8
      0080E6 9F               [ 1]  220 	ld	a, xl
      0080E7 A9 00            [ 1]  221 	adc	a, #0x00
      0080E9 02               [ 1]  222 	rlwa	x
                                    223 ; peephole r1 used rlwa.
      0080EA A9 00            [ 1]  224 	adc	a, #0x00
      0080EC 95               [ 1]  225 	ld	xh, a
                                    226 ; genLabel
      0080ED                        227 00102$:
                           000046   228 	Smain$micros$12 ==.
                                    229 ;	timer4.h: 122: return(us);
                                    230 ; genReturn
      0080ED 51               [ 1]  231 	exgw	x, y
                                    232 ; genLabel
                                    233 ; peephole j30 removed unused label 00104$.
                           000047   234 	Smain$micros$13 ==.
                                    235 ;	timer4.h: 124: } // micros()
                                    236 ; genEndFunction
      0080EE 5B 0A            [ 2]  237 	addw	sp, #10
                           000049   238 	Smain$micros$14 ==.
                           000049   239 	Smain$micros$15 ==.
                           000049   240 	XFmain$micros$0$0 ==.
      0080F0 81               [ 4]  241 	ret
                           00004A   242 	Smain$micros$16 ==.
                           00004A   243 	Smain$putchar$17 ==.
                                    244 ;	main.c: 34: int putchar(int data) {
                                    245 ; genLabel
                                    246 ;	-----------------------------------------
                                    247 ;	 function putchar
                                    248 ;	-----------------------------------------
                                    249 ;	Register assignment is optimal.
                                    250 ;	Stack space usage: 0 bytes.
      0080F1                        251 _putchar:
                           00004A   252 	Smain$putchar$18 ==.
                                    253 ; genReceive
                           00004A   254 	Smain$putchar$19 ==.
                           00004A   255 	Smain$putchar$20 ==.
                                    256 ;	main.c: 37: UART_write(data);
                                    257 ; genLabel
      0080F1                        258 00101$:
                                    259 ; genAssign
                                    260 ; genPointerGet
                                    261 ; peephole 630x replaced 'ldw-ld' by 'ld direct' ('0x5230' -> '0x5230').
                                    262 ; genIfx
                                    263 ; peephole 511 replaced 'swap-bcp' (8) by 'bcp' (128).
                                    264 ; peephole 510 replaced 'srl-bcp' (4) by 'bcp' (8).
                                    265 ; peephole 510 replaced 'srl-bcp' (2) by 'bcp' (4).
                                    266 ; peephole 510 replaced 'srl-bcp' (0x01) by 'bcp' (2).
                                    267 ; peephole 500 replaced 'and' by 'bcp'.
                                    268 ; peephole 23 removed redundant tnz.
                                    269 ; peephole j531x replaced 'ld-bcp-jrne' by 'btjt' ('0x5230').
                                    270 ; peephole j5 changed absolute to relative unconditional jump.
      0080F1 72 0F 52 30 FB   [ 2]  271 	btjf	0x5230, #7, 00101$
                                    272 ; peephole j33 removed jra by using inverse bit-test-jump logic
                                    273 ; peephole j30 removed unused label 00121$.
                                    274 ; genCast
                                    275 ; genAssign
      0080F6 9F               [ 1]  276 	ld	a, xl
                                    277 ; genPointerSet
      0080F7 C7 52 31         [ 1]  278 	ld	0x5231, a
                           000053   279 	Smain$putchar$21 ==.
                           000053   280 	Smain$putchar$22 ==.
                                    281 ;	main.c: 40: return (data);
                                    282 ; genReturn
                                    283 ; genLabel
                                    284 ; peephole j30 removed unused label 00104$.
                           000053   285 	Smain$putchar$23 ==.
                                    286 ;	main.c: 42: } // putchar
                                    287 ; genEndFunction
                           000053   288 	Smain$putchar$24 ==.
                           000053   289 	XG$putchar$0$0 ==.
      0080FA 81               [ 4]  290 	ret
                           000054   291 	Smain$putchar$25 ==.
                           000054   292 	Smain$main$26 ==.
                                    293 ;	main.c: 47: void main(void) {
                                    294 ; genLabel
                                    295 ;	-----------------------------------------
                                    296 ;	 function main
                                    297 ;	-----------------------------------------
                                    298 ;	Register assignment might be sub-optimal.
                                    299 ;	Stack space usage: 4 bytes.
      0080FB                        300 _main:
                           000054   301 	Smain$main$27 ==.
      0080FB 52 04            [ 2]  302 	sub	sp, #4
                           000056   303 	Smain$main$28 ==.
                           000056   304 	Smain$main$29 ==.
                                    305 ;	main.c: 52: DISABLE_INTERRUPTS();
                                    306 ;	genInline
      0080FD 9B               [ 1]  307 	sim
                           000057   308 	Smain$main$30 ==.
                                    309 ;	main.c: 55: sfr_CLK.CKDIVR.byte = 0x00;
                                    310 ; genPointerSet
      0080FE 35 00 50 C6      [ 1]  311 	mov	0x50c6+0, #0x00
                           00005B   312 	Smain$main$31 ==.
                                    313 ;	main.c: 58: sfr_PORTB.DDR.DDR5 = 1; // input(=0) or output(=1)
                                    314 ; genAssign
                                    315 ; genPointerSet
                                    316 ; peephole 0w removed dead load into x from #0x5007.
      008102 72 1A 50 07      [ 1]  317 	bset	0x5007, #5
                                    318 ; peephole 203x replaced 'or' by 'bset' (index register) ('0x5007' -> '0x5007').
                           00005F   319 	Smain$main$32 ==.
                                    320 ;	main.c: 59: sfr_PORTB.CR1.C15 =
                                    321 ; genAssign
                                    322 ; genPointerSet
                                    323 ; peephole 0w removed dead load into x from #0x5008.
      008106 72 1A 50 08      [ 1]  324 	bset	0x5008, #5
                                    325 ; peephole 203x replaced 'or' by 'bset' (index register) ('0x5008' -> '0x5008').
                           000063   326 	Smain$main$33 ==.
                                    327 ;	main.c: 61: sfr_PORTB.CR2.C25 =
                                    328 ; genAssign
                                    329 ; genPointerSet
      00810A C6 50 09         [ 1]  330 	ld	a, 0x5009
      00810D AA 20            [ 1]  331 	or	a, #0x20
      00810F C7 50 09         [ 1]  332 	ld	0x5009, a
                                    333 ; peephole 330x replaced 'ldw-ld-or-ld' by 'ld-or-ld direct' ('0x5009' -> '0x5009').
                           00006B   334 	Smain$main$34 ==.
                                    335 ;	main.c: 65: UART_begin(19200);
                                    336 ; genIPush
      008112 4B 00            [ 1]  337 	push	#0x00
                           00006D   338 	Smain$main$35 ==.
      008114 4B 4B            [ 1]  339 	push	#0x4b
                           00006F   340 	Smain$main$36 ==.
      008116 5F               [ 1]  341 	clrw	x
      008117 89               [ 2]  342 	pushw	x
                           000071   343 	Smain$main$37 ==.
                                    344 ; genCall
      008118 CD 84 34         [ 4]  345 	call	_UART_begin
                           000074   346 	Smain$main$38 ==.
                           000074   347 	Smain$main$39 ==.
                                    348 ;	main.c: 68: TIM4_init();
                                    349 ; genCall
      00811B CD 82 3B         [ 4]  350 	call	_TIM4_init
                           000077   351 	Smain$main$40 ==.
                                    352 ;	main.c: 71: ENABLE_INTERRUPTS();
                                    353 ;	genInline
      00811E 9A               [ 1]  354 	rim
                           000078   355 	Smain$main$41 ==.
                           000078   356 	Smain$main$42 ==.
                                    357 ;	main.c: 95: while (1) {
                                    358 ; genLabel
      00811F                        359 00105$:
                           000078   360 	Smain$main$43 ==.
                           000078   361 	Smain$main$44 ==.
                                    362 ;	main.c: 96: tEnd = (millis() + 1000);
                                    363 ; genPlus
      00811F CE 00 04         [ 2]  364 	ldw	x, _g_millis+2
      008122 1C 03 E8         [ 2]  365 	addw	x, #0x03e8
      008125 1F 03            [ 2]  366 	ldw	(0x03, sp), x
      008127 CE 00 02         [ 2]  367 	ldw	x, _g_millis+0
      00812A 24 01            [ 1]  368 	jrnc	00131$
      00812C 5C               [ 1]  369 	incw	x
      00812D                        370 00131$:
                           000086   371 	Smain$main$45 ==.
                           000086   372 	Smain$main$46 ==.
                                    373 ;	main.c: 99: while (tEnd >= millis()) {
                                    374 ; genAssign
      00812D 90 5F            [ 1]  375 	clrw	y
                                    376 ; genLabel
      00812F                        377 00101$:
                                    378 ; genCmp
                                    379 ; genCmpTnz
      00812F 7B 04            [ 1]  380 	ld	a, (0x04, sp)
      008131 C1 00 05         [ 1]  381 	cp	a, _g_millis+3
      008134 7B 03            [ 1]  382 	ld	a, (0x03, sp)
      008136 C2 00 04         [ 1]  383 	sbc	a, _g_millis+2
      008139 9F               [ 1]  384 	ld	a, xl
      00813A C2 00 03         [ 1]  385 	sbc	a, _g_millis+1
      00813D 9E               [ 1]  386 	ld	a, xh
      00813E C2 00 02         [ 1]  387 	sbc	a, _g_millis+0
                                    388 ; peephole j5 changed absolute to relative unconditional jump.
      008141 25 0D            [ 1]  389 	jrc	00103$
                                    390 ; peephole j9 removed jra by using inverse jump logic
                                    391 ; peephole j30 removed unused label 00132$.
                                    392 ; skipping generated iCode
                           00009C   393 	Smain$main$47 ==.
                           00009C   394 	Smain$main$48 ==.
                                    395 ;	main.c: 100: _CalcPrimes();
                                    396 ; genCall
      008143 89               [ 2]  397 	pushw	x
                           00009D   398 	Smain$main$49 ==.
      008144 90 89            [ 2]  399 	pushw	y
                           00009F   400 	Smain$main$50 ==.
      008146 CD 81 76         [ 4]  401 	call	__CalcPrimes
      008149 90 85            [ 2]  402 	popw	y
                           0000A4   403 	Smain$main$51 ==.
      00814B 85               [ 2]  404 	popw	x
                           0000A5   405 	Smain$main$52 ==.
                           0000A5   406 	Smain$main$53 ==.
                                    407 ;	main.c: 101: Cnt++;
                                    408 ; genPlus
      00814C 90 5C            [ 1]  409 	incw	y
                           0000A7   410 	Smain$main$54 ==.
                                    411 ; genGoto
      00814E 20 DF            [ 2]  412 	jra	00101$
                                    413 ; peephole j5 changed absolute to relative unconditional jump.
                                    414 ; genLabel
      008150                        415 00103$:
                           0000A9   416 	Smain$main$55 ==.
                                    417 ;	main.c: 103: printf("CNT = %d \n", Cnt);
                                    418 ; skipping iCode since result will be rematerialized
                                    419 ; skipping iCode since result will be rematerialized
                                    420 ; genIPush
      008150 90 89            [ 2]  421 	pushw	y
                           0000AB   422 	Smain$main$56 ==.
                                    423 ; genIPush
      008152 4B 91            [ 1]  424 	push	#<(___str_0+0)
                           0000AD   425 	Smain$main$57 ==.
      008154 4B 80            [ 1]  426 	push	#((___str_0+0) >> 8)
                           0000AF   427 	Smain$main$58 ==.
                                    428 ; genCall
      008156 CD 85 37         [ 4]  429 	call	_printf
      008159 5B 04            [ 2]  430 	addw	sp, #4
                           0000B4   431 	Smain$main$59 ==.
                           0000B4   432 	Smain$main$60 ==.
                                    433 ;	main.c: 104: sfr_PORTB.ODR.ODR5 ^= 1;
                                    434 ; genAssign
                                    435 ; genAssign
                                    436 ; genPointerGet
      00815B AE 50 05         [ 2]  437 	ldw	x, #0x5005
      00815E F6               [ 1]  438 	ld	a, (x)
                                    439 ; peephole 101 removed use of extra index register (y).
      00815F 4E               [ 1]  440 	swap	a
      008160 44               [ 1]  441 	srl	a
      008161 A4 01            [ 1]  442 	and	a, #0x01
                                    443 ; genXor
      008163 A8 01            [ 1]  444 	xor	a, #0x01
                                    445 ; genPointerSet
      008165 4E               [ 1]  446 	swap	a
      008166 48               [ 1]  447 	sll	a
      008167 A4 20            [ 1]  448 	and	a, #0x20
      008169 88               [ 1]  449 	push	a
                           0000C3   450 	Smain$main$61 ==.
      00816A F6               [ 1]  451 	ld	a, (x)
      00816B A4 DF            [ 1]  452 	and	a, #0xdf
      00816D 1A 01            [ 1]  453 	or	a, (1, sp)
      00816F F7               [ 1]  454 	ld	(x), a
      008170 84               [ 1]  455 	pop	a
                           0000CA   456 	Smain$main$62 ==.
                           0000CA   457 	Smain$main$63 ==.
                           0000CA   458 	Smain$main$64 ==.
                                    459 ;	main.c: 105: tEnd = 0;
                                    460 ; genGoto
      008171 20 AC            [ 2]  461 	jra	00105$
                                    462 ; peephole j5 changed absolute to relative unconditional jump.
                           0000CC   463 	Smain$main$65 ==.
                                    464 ; genLabel
                                    465 ; peephole j30 removed unused label 00107$.
                           0000CC   466 	Smain$main$66 ==.
                                    467 ;	main.c: 108: } // main
                                    468 ; genEndFunction
      008173 5B 04            [ 2]  469 	addw	sp, #4
                           0000CE   470 	Smain$main$67 ==.
                           0000CE   471 	Smain$main$68 ==.
                           0000CE   472 	XG$main$0$0 ==.
      008175 81               [ 4]  473 	ret
                           0000CF   474 	Smain$main$69 ==.
                                    475 	.area CODE
                                    476 	.area CONST
                           000000   477 Fmain$__str_0$0_0$0 == .
                                    478 	.area CONST
      008091                        479 ___str_0:
      008091 43 4E 54 20 3D 20 25   480 	.ascii "CNT = %d "
             64 20
      00809A 0A                     481 	.db 0x0a
      00809B 00                     482 	.db 0x00
                                    483 	.area CODE
                                    484 	.area INITIALIZER
                                    485 	.area CABS (ABS)
                                    486 
                                    487 	.area .debug_line (NOLOAD)
      000000 00 00 02 05            488 	.dw	0,Ldebug_line_end-Ldebug_line_start
      000004                        489 Ldebug_line_start:
      000004 00 02                  490 	.dw	2
      000006 00 00 00 9E            491 	.dw	0,Ldebug_line_stmt-6-Ldebug_line_start
      00000A 01                     492 	.db	1
      00000B 01                     493 	.db	1
      00000C FB                     494 	.db	-5
      00000D 0F                     495 	.db	15
      00000E 0A                     496 	.db	10
      00000F 00                     497 	.db	0
      000010 01                     498 	.db	1
      000011 01                     499 	.db	1
      000012 01                     500 	.db	1
      000013 01                     501 	.db	1
      000014 00                     502 	.db	0
      000015 00                     503 	.db	0
      000016 00                     504 	.db	0
      000017 01                     505 	.db	1
      000018 2F 75 73 72 2F 62 69   506 	.ascii "/usr/bin/../share/sdcc/include/stm8"
             6E 2F 2E 2E 2F 73 68
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65 2F 73 74 6D 38
      00003B 00                     507 	.db	0
      00003C 2F 75 73 72 2F 73 68   508 	.ascii "/usr/share/sdcc/include/stm8"
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65 2F 73 74 6D 38
      000058 00                     509 	.db	0
      000059 2F 75 73 72 2F 62 69   510 	.ascii "/usr/bin/../share/sdcc/include"
             6E 2F 2E 2E 2F 73 68
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65
      000077 00                     511 	.db	0
      000078 2F 75 73 72 2F 73 68   512 	.ascii "/usr/share/sdcc/include"
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65
      00008F 00                     513 	.db	0
      000090 00                     514 	.db	0
      000091 74 69 6D 65 72 34 2E   515 	.ascii "timer4.h"
             68
      000099 00                     516 	.db	0
      00009A 00                     517 	.uleb128	0
      00009B 00                     518 	.uleb128	0
      00009C 00                     519 	.uleb128	0
      00009D 6D 61 69 6E 2E 63      520 	.ascii "main.c"
      0000A3 00                     521 	.db	0
      0000A4 00                     522 	.uleb128	0
      0000A5 00                     523 	.uleb128	0
      0000A6 00                     524 	.uleb128	0
      0000A7 00                     525 	.db	0
      0000A8                        526 Ldebug_line_stmt:
      0000A8 00                     527 	.db	0
      0000A9 05                     528 	.uleb128	5
      0000AA 02                     529 	.db	2
      0000AB 00 00 80 A7            530 	.dw	0,(Smain$micros$0)
      0000AF 03                     531 	.db	3
      0000B0 DA 00                  532 	.sleb128	90
      0000B2 01                     533 	.db	1
      0000B3 00                     534 	.db	0
      0000B4 05                     535 	.uleb128	5
      0000B5 02                     536 	.db	2
      0000B6 00 00 80 A9            537 	.dw	0,(Smain$micros$3)
      0000BA 03                     538 	.db	3
      0000BB 06                     539 	.sleb128	6
      0000BC 01                     540 	.db	1
      0000BD 00                     541 	.db	0
      0000BE 05                     542 	.uleb128	5
      0000BF 02                     543 	.db	2
      0000C0 00 00 80 AD            544 	.dw	0,(Smain$micros$4)
      0000C4 03                     545 	.db	3
      0000C5 03                     546 	.sleb128	3
      0000C6 01                     547 	.db	1
      0000C7 00                     548 	.db	0
      0000C8 05                     549 	.uleb128	5
      0000C9 02                     550 	.db	2
      0000CA 00 00 80 B2            551 	.dw	0,(Smain$micros$5)
      0000CE 03                     552 	.db	3
      0000CF 02                     553 	.sleb128	2
      0000D0 01                     554 	.db	1
      0000D1 00                     555 	.db	0
      0000D2 05                     556 	.uleb128	5
      0000D3 02                     557 	.db	2
      0000D4 00 00 80 B7            558 	.dw	0,(Smain$micros$6)
      0000D8 03                     559 	.db	3
      0000D9 06                     560 	.sleb128	6
      0000DA 01                     561 	.db	1
      0000DB 00                     562 	.db	0
      0000DC 05                     563 	.uleb128	5
      0000DD 02                     564 	.db	2
      0000DE 00 00 80 BB            565 	.dw	0,(Smain$micros$7)
      0000E2 03                     566 	.db	3
      0000E3 03                     567 	.sleb128	3
      0000E4 01                     568 	.db	1
      0000E5 00                     569 	.db	0
      0000E6 05                     570 	.uleb128	5
      0000E7 02                     571 	.db	2
      0000E8 00 00 80 C4            572 	.dw	0,(Smain$micros$8)
      0000EC 03                     573 	.db	3
      0000ED 04                     574 	.sleb128	4
      0000EE 01                     575 	.db	1
      0000EF 00                     576 	.db	0
      0000F0 05                     577 	.uleb128	5
      0000F1 02                     578 	.db	2
      0000F2 00 00 80 D7            579 	.dw	0,(Smain$micros$9)
      0000F6 03                     580 	.db	3
      0000F7 04                     581 	.sleb128	4
      0000F8 01                     582 	.db	1
      0000F9 00                     583 	.db	0
      0000FA 05                     584 	.uleb128	5
      0000FB 02                     585 	.db	2
      0000FC 00 00 80 E2            586 	.dw	0,(Smain$micros$11)
      000100 03                     587 	.db	3
      000101 01                     588 	.sleb128	1
      000102 01                     589 	.db	1
      000103 00                     590 	.db	0
      000104 05                     591 	.uleb128	5
      000105 02                     592 	.db	2
      000106 00 00 80 ED            593 	.dw	0,(Smain$micros$12)
      00010A 03                     594 	.db	3
      00010B 02                     595 	.sleb128	2
      00010C 01                     596 	.db	1
      00010D 00                     597 	.db	0
      00010E 05                     598 	.uleb128	5
      00010F 02                     599 	.db	2
      000110 00 00 80 EE            600 	.dw	0,(Smain$micros$13)
      000114 03                     601 	.db	3
      000115 02                     602 	.sleb128	2
      000116 01                     603 	.db	1
      000117 09                     604 	.db	9
      000118 00 03                  605 	.dw	1+Smain$micros$15-Smain$micros$13
      00011A 00                     606 	.db	0
      00011B 01                     607 	.uleb128	1
      00011C 01                     608 	.db	1
      00011D 04                     609 	.db	4
      00011E 02                     610 	.uleb128	2
      00011F 00                     611 	.db	0
      000120 05                     612 	.uleb128	5
      000121 02                     613 	.db	2
      000122 00 00 80 F1            614 	.dw	0,(Smain$putchar$17)
      000126 03                     615 	.db	3
      000127 21                     616 	.sleb128	33
      000128 01                     617 	.db	1
      000129 00                     618 	.db	0
      00012A 05                     619 	.uleb128	5
      00012B 02                     620 	.db	2
      00012C 00 00 80 F1            621 	.dw	0,(Smain$putchar$20)
      000130 03                     622 	.db	3
      000131 03                     623 	.sleb128	3
      000132 01                     624 	.db	1
      000133 00                     625 	.db	0
      000134 05                     626 	.uleb128	5
      000135 02                     627 	.db	2
      000136 00 00 80 FA            628 	.dw	0,(Smain$putchar$22)
      00013A 03                     629 	.db	3
      00013B 03                     630 	.sleb128	3
      00013C 01                     631 	.db	1
      00013D 00                     632 	.db	0
      00013E 05                     633 	.uleb128	5
      00013F 02                     634 	.db	2
      000140 00 00 80 FA            635 	.dw	0,(Smain$putchar$23)
      000144 03                     636 	.db	3
      000145 02                     637 	.sleb128	2
      000146 01                     638 	.db	1
      000147 09                     639 	.db	9
      000148 00 01                  640 	.dw	1+Smain$putchar$24-Smain$putchar$23
      00014A 00                     641 	.db	0
      00014B 01                     642 	.uleb128	1
      00014C 01                     643 	.db	1
      00014D 04                     644 	.db	4
      00014E 02                     645 	.uleb128	2
      00014F 00                     646 	.db	0
      000150 05                     647 	.uleb128	5
      000151 02                     648 	.db	2
      000152 00 00 80 FB            649 	.dw	0,(Smain$main$26)
      000156 03                     650 	.db	3
      000157 2E                     651 	.sleb128	46
      000158 01                     652 	.db	1
      000159 00                     653 	.db	0
      00015A 05                     654 	.uleb128	5
      00015B 02                     655 	.db	2
      00015C 00 00 80 FD            656 	.dw	0,(Smain$main$29)
      000160 03                     657 	.db	3
      000161 05                     658 	.sleb128	5
      000162 01                     659 	.db	1
      000163 00                     660 	.db	0
      000164 05                     661 	.uleb128	5
      000165 02                     662 	.db	2
      000166 00 00 80 FE            663 	.dw	0,(Smain$main$30)
      00016A 03                     664 	.db	3
      00016B 03                     665 	.sleb128	3
      00016C 01                     666 	.db	1
      00016D 00                     667 	.db	0
      00016E 05                     668 	.uleb128	5
      00016F 02                     669 	.db	2
      000170 00 00 81 02            670 	.dw	0,(Smain$main$31)
      000174 03                     671 	.db	3
      000175 03                     672 	.sleb128	3
      000176 01                     673 	.db	1
      000177 00                     674 	.db	0
      000178 05                     675 	.uleb128	5
      000179 02                     676 	.db	2
      00017A 00 00 81 06            677 	.dw	0,(Smain$main$32)
      00017E 03                     678 	.db	3
      00017F 01                     679 	.sleb128	1
      000180 01                     680 	.db	1
      000181 00                     681 	.db	0
      000182 05                     682 	.uleb128	5
      000183 02                     683 	.db	2
      000184 00 00 81 0A            684 	.dw	0,(Smain$main$33)
      000188 03                     685 	.db	3
      000189 02                     686 	.sleb128	2
      00018A 01                     687 	.db	1
      00018B 00                     688 	.db	0
      00018C 05                     689 	.uleb128	5
      00018D 02                     690 	.db	2
      00018E 00 00 81 12            691 	.dw	0,(Smain$main$34)
      000192 03                     692 	.db	3
      000193 04                     693 	.sleb128	4
      000194 01                     694 	.db	1
      000195 00                     695 	.db	0
      000196 05                     696 	.uleb128	5
      000197 02                     697 	.db	2
      000198 00 00 81 1B            698 	.dw	0,(Smain$main$39)
      00019C 03                     699 	.db	3
      00019D 03                     700 	.sleb128	3
      00019E 01                     701 	.db	1
      00019F 00                     702 	.db	0
      0001A0 05                     703 	.uleb128	5
      0001A1 02                     704 	.db	2
      0001A2 00 00 81 1E            705 	.dw	0,(Smain$main$40)
      0001A6 03                     706 	.db	3
      0001A7 03                     707 	.sleb128	3
      0001A8 01                     708 	.db	1
      0001A9 00                     709 	.db	0
      0001AA 05                     710 	.uleb128	5
      0001AB 02                     711 	.db	2
      0001AC 00 00 81 1F            712 	.dw	0,(Smain$main$42)
      0001B0 03                     713 	.db	3
      0001B1 18                     714 	.sleb128	24
      0001B2 01                     715 	.db	1
      0001B3 00                     716 	.db	0
      0001B4 05                     717 	.uleb128	5
      0001B5 02                     718 	.db	2
      0001B6 00 00 81 1F            719 	.dw	0,(Smain$main$44)
      0001BA 03                     720 	.db	3
      0001BB 01                     721 	.sleb128	1
      0001BC 01                     722 	.db	1
      0001BD 00                     723 	.db	0
      0001BE 05                     724 	.uleb128	5
      0001BF 02                     725 	.db	2
      0001C0 00 00 81 2D            726 	.dw	0,(Smain$main$46)
      0001C4 03                     727 	.db	3
      0001C5 03                     728 	.sleb128	3
      0001C6 01                     729 	.db	1
      0001C7 00                     730 	.db	0
      0001C8 05                     731 	.uleb128	5
      0001C9 02                     732 	.db	2
      0001CA 00 00 81 43            733 	.dw	0,(Smain$main$48)
      0001CE 03                     734 	.db	3
      0001CF 01                     735 	.sleb128	1
      0001D0 01                     736 	.db	1
      0001D1 00                     737 	.db	0
      0001D2 05                     738 	.uleb128	5
      0001D3 02                     739 	.db	2
      0001D4 00 00 81 4C            740 	.dw	0,(Smain$main$53)
      0001D8 03                     741 	.db	3
      0001D9 01                     742 	.sleb128	1
      0001DA 01                     743 	.db	1
      0001DB 00                     744 	.db	0
      0001DC 05                     745 	.uleb128	5
      0001DD 02                     746 	.db	2
      0001DE 00 00 81 50            747 	.dw	0,(Smain$main$55)
      0001E2 03                     748 	.db	3
      0001E3 02                     749 	.sleb128	2
      0001E4 01                     750 	.db	1
      0001E5 00                     751 	.db	0
      0001E6 05                     752 	.uleb128	5
      0001E7 02                     753 	.db	2
      0001E8 00 00 81 5B            754 	.dw	0,(Smain$main$60)
      0001EC 03                     755 	.db	3
      0001ED 01                     756 	.sleb128	1
      0001EE 01                     757 	.db	1
      0001EF 00                     758 	.db	0
      0001F0 05                     759 	.uleb128	5
      0001F1 02                     760 	.db	2
      0001F2 00 00 81 71            761 	.dw	0,(Smain$main$64)
      0001F6 03                     762 	.db	3
      0001F7 01                     763 	.sleb128	1
      0001F8 01                     764 	.db	1
      0001F9 00                     765 	.db	0
      0001FA 05                     766 	.uleb128	5
      0001FB 02                     767 	.db	2
      0001FC 00 00 81 73            768 	.dw	0,(Smain$main$66)
      000200 03                     769 	.db	3
      000201 03                     770 	.sleb128	3
      000202 01                     771 	.db	1
      000203 09                     772 	.db	9
      000204 00 03                  773 	.dw	1+Smain$main$68-Smain$main$66
      000206 00                     774 	.db	0
      000207 01                     775 	.uleb128	1
      000208 01                     776 	.db	1
      000209                        777 Ldebug_line_end:
                                    778 
                                    779 	.area .debug_loc (NOLOAD)
      000000                        780 Ldebug_loc_start:
      000000 00 00 81 75            781 	.dw	0,(Smain$main$67)
      000004 00 00 81 76            782 	.dw	0,(Smain$main$69)
      000008 00 02                  783 	.dw	2
      00000A 78                     784 	.db	120
      00000B 01                     785 	.sleb128	1
      00000C 00 00 81 71            786 	.dw	0,(Smain$main$62)
      000010 00 00 81 75            787 	.dw	0,(Smain$main$67)
      000014 00 02                  788 	.dw	2
      000016 78                     789 	.db	120
      000017 05                     790 	.sleb128	5
      000018 00 00 81 6A            791 	.dw	0,(Smain$main$61)
      00001C 00 00 81 71            792 	.dw	0,(Smain$main$62)
      000020 00 02                  793 	.dw	2
      000022 78                     794 	.db	120
      000023 06                     795 	.sleb128	6
      000024 00 00 81 5B            796 	.dw	0,(Smain$main$59)
      000028 00 00 81 6A            797 	.dw	0,(Smain$main$61)
      00002C 00 02                  798 	.dw	2
      00002E 78                     799 	.db	120
      00002F 05                     800 	.sleb128	5
      000030 00 00 81 56            801 	.dw	0,(Smain$main$58)
      000034 00 00 81 5B            802 	.dw	0,(Smain$main$59)
      000038 00 02                  803 	.dw	2
      00003A 78                     804 	.db	120
      00003B 09                     805 	.sleb128	9
      00003C 00 00 81 54            806 	.dw	0,(Smain$main$57)
      000040 00 00 81 56            807 	.dw	0,(Smain$main$58)
      000044 00 02                  808 	.dw	2
      000046 78                     809 	.db	120
      000047 08                     810 	.sleb128	8
      000048 00 00 81 52            811 	.dw	0,(Smain$main$56)
      00004C 00 00 81 54            812 	.dw	0,(Smain$main$57)
      000050 00 02                  813 	.dw	2
      000052 78                     814 	.db	120
      000053 07                     815 	.sleb128	7
      000054 00 00 81 4C            816 	.dw	0,(Smain$main$52)
      000058 00 00 81 52            817 	.dw	0,(Smain$main$56)
      00005C 00 02                  818 	.dw	2
      00005E 78                     819 	.db	120
      00005F 05                     820 	.sleb128	5
      000060 00 00 81 4B            821 	.dw	0,(Smain$main$51)
      000064 00 00 81 4C            822 	.dw	0,(Smain$main$52)
      000068 00 02                  823 	.dw	2
      00006A 78                     824 	.db	120
      00006B 07                     825 	.sleb128	7
      00006C 00 00 81 46            826 	.dw	0,(Smain$main$50)
      000070 00 00 81 4B            827 	.dw	0,(Smain$main$51)
      000074 00 02                  828 	.dw	2
      000076 78                     829 	.db	120
      000077 09                     830 	.sleb128	9
      000078 00 00 81 44            831 	.dw	0,(Smain$main$49)
      00007C 00 00 81 46            832 	.dw	0,(Smain$main$50)
      000080 00 02                  833 	.dw	2
      000082 78                     834 	.db	120
      000083 07                     835 	.sleb128	7
      000084 00 00 81 1B            836 	.dw	0,(Smain$main$38)
      000088 00 00 81 44            837 	.dw	0,(Smain$main$49)
      00008C 00 02                  838 	.dw	2
      00008E 78                     839 	.db	120
      00008F 05                     840 	.sleb128	5
      000090 00 00 81 18            841 	.dw	0,(Smain$main$37)
      000094 00 00 81 1B            842 	.dw	0,(Smain$main$38)
      000098 00 02                  843 	.dw	2
      00009A 78                     844 	.db	120
      00009B 09                     845 	.sleb128	9
      00009C 00 00 81 16            846 	.dw	0,(Smain$main$36)
      0000A0 00 00 81 18            847 	.dw	0,(Smain$main$37)
      0000A4 00 02                  848 	.dw	2
      0000A6 78                     849 	.db	120
      0000A7 07                     850 	.sleb128	7
      0000A8 00 00 81 14            851 	.dw	0,(Smain$main$35)
      0000AC 00 00 81 16            852 	.dw	0,(Smain$main$36)
      0000B0 00 02                  853 	.dw	2
      0000B2 78                     854 	.db	120
      0000B3 06                     855 	.sleb128	6
      0000B4 00 00 80 FD            856 	.dw	0,(Smain$main$28)
      0000B8 00 00 81 14            857 	.dw	0,(Smain$main$35)
      0000BC 00 02                  858 	.dw	2
      0000BE 78                     859 	.db	120
      0000BF 05                     860 	.sleb128	5
      0000C0 00 00 80 FB            861 	.dw	0,(Smain$main$27)
      0000C4 00 00 80 FD            862 	.dw	0,(Smain$main$28)
      0000C8 00 02                  863 	.dw	2
      0000CA 78                     864 	.db	120
      0000CB 01                     865 	.sleb128	1
      0000CC 00 00 00 00            866 	.dw	0,0
      0000D0 00 00 00 00            867 	.dw	0,0
      0000D4 00 00 80 F1            868 	.dw	0,(Smain$putchar$18)
      0000D8 00 00 80 FB            869 	.dw	0,(Smain$putchar$25)
      0000DC 00 02                  870 	.dw	2
      0000DE 78                     871 	.db	120
      0000DF 01                     872 	.sleb128	1
      0000E0 00 00 00 00            873 	.dw	0,0
      0000E4 00 00 00 00            874 	.dw	0,0
      0000E8 00 00 80 F0            875 	.dw	0,(Smain$micros$14)
      0000EC 00 00 80 F1            876 	.dw	0,(Smain$micros$16)
      0000F0 00 02                  877 	.dw	2
      0000F2 78                     878 	.db	120
      0000F3 01                     879 	.sleb128	1
      0000F4 00 00 80 E2            880 	.dw	0,(Smain$micros$10)
      0000F8 00 00 80 F0            881 	.dw	0,(Smain$micros$14)
      0000FC 00 02                  882 	.dw	2
      0000FE 78                     883 	.db	120
      0000FF 0B                     884 	.sleb128	11
      000100 00 00 80 A9            885 	.dw	0,(Smain$micros$2)
      000104 00 00 80 E2            886 	.dw	0,(Smain$micros$10)
      000108 00 02                  887 	.dw	2
      00010A 78                     888 	.db	120
      00010B 0B                     889 	.sleb128	11
      00010C 00 00 80 A7            890 	.dw	0,(Smain$micros$1)
      000110 00 00 80 A9            891 	.dw	0,(Smain$micros$2)
      000114 00 02                  892 	.dw	2
      000116 78                     893 	.db	120
      000117 01                     894 	.sleb128	1
      000118 00 00 00 00            895 	.dw	0,0
      00011C 00 00 00 00            896 	.dw	0,0
                                    897 
                                    898 	.area .debug_abbrev (NOLOAD)
      000000                        899 Ldebug_abbrev:
      000000 01                     900 	.uleb128	1
      000001 11                     901 	.uleb128	17
      000002 01                     902 	.db	1
      000003 03                     903 	.uleb128	3
      000004 08                     904 	.uleb128	8
      000005 10                     905 	.uleb128	16
      000006 06                     906 	.uleb128	6
      000007 13                     907 	.uleb128	19
      000008 0B                     908 	.uleb128	11
      000009 25                     909 	.uleb128	37
      00000A 08                     910 	.uleb128	8
      00000B 00                     911 	.uleb128	0
      00000C 00                     912 	.uleb128	0
      00000D 02                     913 	.uleb128	2
      00000E 24                     914 	.uleb128	36
      00000F 00                     915 	.db	0
      000010 03                     916 	.uleb128	3
      000011 08                     917 	.uleb128	8
      000012 0B                     918 	.uleb128	11
      000013 0B                     919 	.uleb128	11
      000014 3E                     920 	.uleb128	62
      000015 0B                     921 	.uleb128	11
      000016 00                     922 	.uleb128	0
      000017 00                     923 	.uleb128	0
      000018 03                     924 	.uleb128	3
      000019 2E                     925 	.uleb128	46
      00001A 01                     926 	.db	1
      00001B 01                     927 	.uleb128	1
      00001C 13                     928 	.uleb128	19
      00001D 03                     929 	.uleb128	3
      00001E 08                     930 	.uleb128	8
      00001F 11                     931 	.uleb128	17
      000020 01                     932 	.uleb128	1
      000021 12                     933 	.uleb128	18
      000022 01                     934 	.uleb128	1
      000023 3F                     935 	.uleb128	63
      000024 0C                     936 	.uleb128	12
      000025 40                     937 	.uleb128	64
      000026 06                     938 	.uleb128	6
      000027 49                     939 	.uleb128	73
      000028 13                     940 	.uleb128	19
      000029 00                     941 	.uleb128	0
      00002A 00                     942 	.uleb128	0
      00002B 04                     943 	.uleb128	4
      00002C 34                     944 	.uleb128	52
      00002D 00                     945 	.db	0
      00002E 02                     946 	.uleb128	2
      00002F 0A                     947 	.uleb128	10
      000030 03                     948 	.uleb128	3
      000031 08                     949 	.uleb128	8
      000032 49                     950 	.uleb128	73
      000033 13                     951 	.uleb128	19
      000034 00                     952 	.uleb128	0
      000035 00                     953 	.uleb128	0
      000036 05                     954 	.uleb128	5
      000037 05                     955 	.uleb128	5
      000038 00                     956 	.db	0
      000039 02                     957 	.uleb128	2
      00003A 0A                     958 	.uleb128	10
      00003B 03                     959 	.uleb128	3
      00003C 08                     960 	.uleb128	8
      00003D 49                     961 	.uleb128	73
      00003E 13                     962 	.uleb128	19
      00003F 00                     963 	.uleb128	0
      000040 00                     964 	.uleb128	0
      000041 06                     965 	.uleb128	6
      000042 0B                     966 	.uleb128	11
      000043 00                     967 	.db	0
      000044 11                     968 	.uleb128	17
      000045 01                     969 	.uleb128	1
      000046 12                     970 	.uleb128	18
      000047 01                     971 	.uleb128	1
      000048 00                     972 	.uleb128	0
      000049 00                     973 	.uleb128	0
      00004A 07                     974 	.uleb128	7
      00004B 2E                     975 	.uleb128	46
      00004C 01                     976 	.db	1
      00004D 01                     977 	.uleb128	1
      00004E 13                     978 	.uleb128	19
      00004F 03                     979 	.uleb128	3
      000050 08                     980 	.uleb128	8
      000051 11                     981 	.uleb128	17
      000052 01                     982 	.uleb128	1
      000053 12                     983 	.uleb128	18
      000054 01                     984 	.uleb128	1
      000055 3F                     985 	.uleb128	63
      000056 0C                     986 	.uleb128	12
      000057 40                     987 	.uleb128	64
      000058 06                     988 	.uleb128	6
      000059 00                     989 	.uleb128	0
      00005A 00                     990 	.uleb128	0
      00005B 08                     991 	.uleb128	8
      00005C 0B                     992 	.uleb128	11
      00005D 01                     993 	.db	1
      00005E 01                     994 	.uleb128	1
      00005F 13                     995 	.uleb128	19
      000060 11                     996 	.uleb128	17
      000061 01                     997 	.uleb128	1
      000062 12                     998 	.uleb128	18
      000063 01                     999 	.uleb128	1
      000064 00                    1000 	.uleb128	0
      000065 00                    1001 	.uleb128	0
      000066 09                    1002 	.uleb128	9
      000067 35                    1003 	.uleb128	53
      000068 00                    1004 	.db	0
      000069 49                    1005 	.uleb128	73
      00006A 13                    1006 	.uleb128	19
      00006B 00                    1007 	.uleb128	0
      00006C 00                    1008 	.uleb128	0
      00006D 0A                    1009 	.uleb128	10
      00006E 34                    1010 	.uleb128	52
      00006F 00                    1011 	.db	0
      000070 02                    1012 	.uleb128	2
      000071 0A                    1013 	.uleb128	10
      000072 03                    1014 	.uleb128	3
      000073 08                    1015 	.uleb128	8
      000074 3F                    1016 	.uleb128	63
      000075 0C                    1017 	.uleb128	12
      000076 49                    1018 	.uleb128	73
      000077 13                    1019 	.uleb128	19
      000078 00                    1020 	.uleb128	0
      000079 00                    1021 	.uleb128	0
      00007A 0B                    1022 	.uleb128	11
      00007B 26                    1023 	.uleb128	38
      00007C 00                    1024 	.db	0
      00007D 49                    1025 	.uleb128	73
      00007E 13                    1026 	.uleb128	19
      00007F 00                    1027 	.uleb128	0
      000080 00                    1028 	.uleb128	0
      000081 0C                    1029 	.uleb128	12
      000082 01                    1030 	.uleb128	1
      000083 01                    1031 	.db	1
      000084 01                    1032 	.uleb128	1
      000085 13                    1033 	.uleb128	19
      000086 0B                    1034 	.uleb128	11
      000087 0B                    1035 	.uleb128	11
      000088 49                    1036 	.uleb128	73
      000089 13                    1037 	.uleb128	19
      00008A 00                    1038 	.uleb128	0
      00008B 00                    1039 	.uleb128	0
      00008C 0D                    1040 	.uleb128	13
      00008D 21                    1041 	.uleb128	33
      00008E 00                    1042 	.db	0
      00008F 2F                    1043 	.uleb128	47
      000090 0B                    1044 	.uleb128	11
      000091 00                    1045 	.uleb128	0
      000092 00                    1046 	.uleb128	0
      000093 00                    1047 	.uleb128	0
                                   1048 
                                   1049 	.area .debug_info (NOLOAD)
      000000 00 00 01 D5           1050 	.dw	0,Ldebug_info_end-Ldebug_info_start
      000004                       1051 Ldebug_info_start:
      000004 00 02                 1052 	.dw	2
      000006 00 00 00 00           1053 	.dw	0,(Ldebug_abbrev)
      00000A 04                    1054 	.db	4
      00000B 01                    1055 	.uleb128	1
      00000C 6D 61 69 6E 2E 63     1056 	.ascii "main.c"
      000012 00                    1057 	.db	0
      000013 00 00 00 00           1058 	.dw	0,(Ldebug_line_start+-4)
      000017 01                    1059 	.db	1
      000018 53 44 43 43 20 76 65  1060 	.ascii "SDCC version 4.4.0 #14620"
             72 73 69 6F 6E 20 34
             2E 34 2E 30 20 23 31
             34 36 32 30
      000031 00                    1061 	.db	0
      000032 02                    1062 	.uleb128	2
      000033 75 6E 73 69 67 6E 65  1063 	.ascii "unsigned long"
             64 20 6C 6F 6E 67
      000040 00                    1064 	.db	0
      000041 04                    1065 	.db	4
      000042 07                    1066 	.db	7
      000043 03                    1067 	.uleb128	3
      000044 00 00 00 8E           1068 	.dw	0,142
      000048 6D 69 63 72 6F 73     1069 	.ascii "micros"
      00004E 00                    1070 	.db	0
      00004F 00 00 80 A7           1071 	.dw	0,(_micros)
      000053 00 00 80 F1           1072 	.dw	0,(XFmain$micros$0$0+1)
      000057 00                    1073 	.db	0
      000058 00 00 00 E8           1074 	.dw	0,(Ldebug_loc_start+232)
      00005C 00 00 00 32           1075 	.dw	0,50
      000060 04                    1076 	.uleb128	4
      000061 02                    1077 	.db	2
      000062 91                    1078 	.db	145
      000063 76                    1079 	.sleb128	-10
      000064 63 6E 74              1080 	.ascii "cnt"
      000067 00                    1081 	.db	0
      000068 00 00 00 8E           1082 	.dw	0,142
      00006C 04                    1083 	.uleb128	4
      00006D 02                    1084 	.db	2
      00006E 91                    1085 	.db	145
      00006F 77                    1086 	.sleb128	-9
      000070 75 69 66              1087 	.ascii "uif"
      000073 00                    1088 	.db	0
      000074 00 00 00 8E           1089 	.dw	0,142
      000078 04                    1090 	.uleb128	4
      000079 0C                    1091 	.db	12
      00007A 52                    1092 	.db	82
      00007B 93                    1093 	.db	147
      00007C 01                    1094 	.uleb128	1
      00007D 51                    1095 	.db	81
      00007E 93                    1096 	.db	147
      00007F 01                    1097 	.uleb128	1
      000080 54                    1098 	.db	84
      000081 93                    1099 	.db	147
      000082 01                    1100 	.uleb128	1
      000083 53                    1101 	.db	83
      000084 93                    1102 	.db	147
      000085 01                    1103 	.uleb128	1
      000086 75 73                 1104 	.ascii "us"
      000088 00                    1105 	.db	0
      000089 00 00 00 32           1106 	.dw	0,50
      00008D 00                    1107 	.uleb128	0
      00008E 02                    1108 	.uleb128	2
      00008F 75 6E 73 69 67 6E 65  1109 	.ascii "unsigned char"
             64 20 63 68 61 72
      00009C 00                    1110 	.db	0
      00009D 01                    1111 	.db	1
      00009E 08                    1112 	.db	8
      00009F 02                    1113 	.uleb128	2
      0000A0 69 6E 74              1114 	.ascii "int"
      0000A3 00                    1115 	.db	0
      0000A4 02                    1116 	.db	2
      0000A5 05                    1117 	.db	5
      0000A6 03                    1118 	.uleb128	3
      0000A7 00 00 00 DF           1119 	.dw	0,223
      0000AB 70 75 74 63 68 61 72  1120 	.ascii "putchar"
      0000B2 00                    1121 	.db	0
      0000B3 00 00 80 F1           1122 	.dw	0,(_putchar)
      0000B7 00 00 80 FB           1123 	.dw	0,(XG$putchar$0$0+1)
      0000BB 01                    1124 	.db	1
      0000BC 00 00 00 D4           1125 	.dw	0,(Ldebug_loc_start+212)
      0000C0 00 00 00 9F           1126 	.dw	0,159
      0000C4 05                    1127 	.uleb128	5
      0000C5 06                    1128 	.db	6
      0000C6 52                    1129 	.db	82
      0000C7 93                    1130 	.db	147
      0000C8 01                    1131 	.uleb128	1
      0000C9 51                    1132 	.db	81
      0000CA 93                    1133 	.db	147
      0000CB 01                    1134 	.uleb128	1
      0000CC 64 61 74 61           1135 	.ascii "data"
      0000D0 00                    1136 	.db	0
      0000D1 00 00 00 9F           1137 	.dw	0,159
      0000D5 06                    1138 	.uleb128	6
      0000D6 00 00 80 F1           1139 	.dw	0,(Smain$putchar$19)
      0000DA 00 00 80 FA           1140 	.dw	0,(Smain$putchar$21)
      0000DE 00                    1141 	.uleb128	0
      0000DF 07                    1142 	.uleb128	7
      0000E0 00 00 01 57           1143 	.dw	0,343
      0000E4 6D 61 69 6E           1144 	.ascii "main"
      0000E8 00                    1145 	.db	0
      0000E9 00 00 80 FB           1146 	.dw	0,(_main)
      0000ED 00 00 81 76           1147 	.dw	0,(XG$main$0$0+1)
      0000F1 01                    1148 	.db	1
      0000F2 00 00 00 00           1149 	.dw	0,(Ldebug_loc_start)
      0000F6 08                    1150 	.uleb128	8
      0000F7 00 00 01 44           1151 	.dw	0,324
      0000FB 00 00 81 1F           1152 	.dw	0,(Smain$main$41)
      0000FF 00 00 81 73           1153 	.dw	0,(Smain$main$65)
      000103 08                    1154 	.uleb128	8
      000104 00 00 01 1A           1155 	.dw	0,282
      000108 00 00 81 1F           1156 	.dw	0,(Smain$main$43)
      00010C 00 00 81 71           1157 	.dw	0,(Smain$main$63)
      000110 06                    1158 	.uleb128	6
      000111 00 00 81 43           1159 	.dw	0,(Smain$main$47)
      000115 00 00 81 4E           1160 	.dw	0,(Smain$main$54)
      000119 00                    1161 	.uleb128	0
      00011A 04                    1162 	.uleb128	4
      00011B 0E                    1163 	.db	14
      00011C 52                    1164 	.db	82
      00011D 93                    1165 	.db	147
      00011E 01                    1166 	.uleb128	1
      00011F 51                    1167 	.db	81
      000120 93                    1168 	.db	147
      000121 01                    1169 	.uleb128	1
      000122 91                    1170 	.db	145
      000123 7E                    1171 	.sleb128	-2
      000124 93                    1172 	.db	147
      000125 01                    1173 	.uleb128	1
      000126 91                    1174 	.db	145
      000127 7F                    1175 	.sleb128	-1
      000128 93                    1176 	.db	147
      000129 01                    1177 	.uleb128	1
      00012A 74 45 6E 64           1178 	.ascii "tEnd"
      00012E 00                    1179 	.db	0
      00012F 00 00 00 32           1180 	.dw	0,50
      000133 04                    1181 	.uleb128	4
      000134 06                    1182 	.db	6
      000135 54                    1183 	.db	84
      000136 93                    1184 	.db	147
      000137 01                    1185 	.uleb128	1
      000138 53                    1186 	.db	83
      000139 93                    1187 	.db	147
      00013A 01                    1188 	.uleb128	1
      00013B 43 6E 74              1189 	.ascii "Cnt"
      00013E 00                    1190 	.db	0
      00013F 00 00 01 57           1191 	.dw	0,343
      000143 00                    1192 	.uleb128	0
      000144 04                    1193 	.uleb128	4
      000145 02                    1194 	.db	2
      000146 91                    1195 	.db	145
      000147 00                    1196 	.sleb128	0
      000148 6E 65 78 74 50 72 69  1197 	.ascii "nextPrint"
             6E 74
      000151 00                    1198 	.db	0
      000152 00 00 00 32           1199 	.dw	0,50
      000156 00                    1200 	.uleb128	0
      000157 02                    1201 	.uleb128	2
      000158 75 6E 73 69 67 6E 65  1202 	.ascii "unsigned int"
             64 20 69 6E 74
      000164 00                    1203 	.db	0
      000165 02                    1204 	.db	2
      000166 07                    1205 	.db	7
      000167 09                    1206 	.uleb128	9
      000168 00 00 00 8E           1207 	.dw	0,142
      00016C 0A                    1208 	.uleb128	10
      00016D 05                    1209 	.db	5
      00016E 03                    1210 	.db	3
      00016F 00 00 00 01           1211 	.dw	0,(_g_flagMilli)
      000173 67 5F 66 6C 61 67 4D  1212 	.ascii "g_flagMilli"
             69 6C 6C 69
      00017E 00                    1213 	.db	0
      00017F 01                    1214 	.db	1
      000180 00 00 01 67           1215 	.dw	0,359
      000184 09                    1216 	.uleb128	9
      000185 00 00 00 32           1217 	.dw	0,50
      000189 0A                    1218 	.uleb128	10
      00018A 05                    1219 	.db	5
      00018B 03                    1220 	.db	3
      00018C 00 00 00 02           1221 	.dw	0,(_g_millis)
      000190 67 5F 6D 69 6C 6C 69  1222 	.ascii "g_millis"
             73
      000198 00                    1223 	.db	0
      000199 01                    1224 	.db	1
      00019A 00 00 01 84           1225 	.dw	0,388
      00019E 0A                    1226 	.uleb128	10
      00019F 05                    1227 	.db	5
      0001A0 03                    1228 	.db	3
      0001A1 00 00 00 06           1229 	.dw	0,(_g_micros)
      0001A5 67 5F 6D 69 63 72 6F  1230 	.ascii "g_micros"
             73
      0001AD 00                    1231 	.db	0
      0001AE 01                    1232 	.db	1
      0001AF 00 00 01 84           1233 	.dw	0,388
      0001B3 0B                    1234 	.uleb128	11
      0001B4 00 00 00 8E           1235 	.dw	0,142
      0001B8 0C                    1236 	.uleb128	12
      0001B9 00 00 01 C5           1237 	.dw	0,453
      0001BD 0B                    1238 	.db	11
      0001BE 00 00 01 B3           1239 	.dw	0,435
      0001C2 0D                    1240 	.uleb128	13
      0001C3 0A                    1241 	.db	10
      0001C4 00                    1242 	.uleb128	0
      0001C5 04                    1243 	.uleb128	4
      0001C6 05                    1244 	.db	5
      0001C7 03                    1245 	.db	3
      0001C8 00 00 80 91           1246 	.dw	0,(___str_0)
      0001CC 5F 5F 73 74 72 5F 30  1247 	.ascii "__str_0"
      0001D3 00                    1248 	.db	0
      0001D4 00 00 01 B8           1249 	.dw	0,440
      0001D8 00                    1250 	.uleb128	0
      0001D9                       1251 Ldebug_info_end:
                                   1252 
                                   1253 	.area .debug_pubnames (NOLOAD)
      000000 00 00 00 4D           1254 	.dw	0,Ldebug_pubnames_end-Ldebug_pubnames_start
      000004                       1255 Ldebug_pubnames_start:
      000004 00 02                 1256 	.dw	2
      000006 00 00 00 00           1257 	.dw	0,(Ldebug_info_start-4)
      00000A 00 00 01 D9           1258 	.dw	0,4+Ldebug_info_end-Ldebug_info_start
      00000E 00 00 00 A6           1259 	.dw	0,166
      000012 70 75 74 63 68 61 72  1260 	.ascii "putchar"
      000019 00                    1261 	.db	0
      00001A 00 00 00 DF           1262 	.dw	0,223
      00001E 6D 61 69 6E           1263 	.ascii "main"
      000022 00                    1264 	.db	0
      000023 00 00 01 6C           1265 	.dw	0,364
      000027 67 5F 66 6C 61 67 4D  1266 	.ascii "g_flagMilli"
             69 6C 6C 69
      000032 00                    1267 	.db	0
      000033 00 00 01 89           1268 	.dw	0,393
      000037 67 5F 6D 69 6C 6C 69  1269 	.ascii "g_millis"
             73
      00003F 00                    1270 	.db	0
      000040 00 00 01 9E           1271 	.dw	0,414
      000044 67 5F 6D 69 63 72 6F  1272 	.ascii "g_micros"
             73
      00004C 00                    1273 	.db	0
      00004D 00 00 00 00           1274 	.dw	0,0
      000051                       1275 Ldebug_pubnames_end:
                                   1276 
                                   1277 	.area .debug_frame (NOLOAD)
      000000 00 00                 1278 	.dw	0
      000002 00 10                 1279 	.dw	Ldebug_CIE0_end-Ldebug_CIE0_start
      000004                       1280 Ldebug_CIE0_start:
      000004 FF FF                 1281 	.dw	0xffff
      000006 FF FF                 1282 	.dw	0xffff
      000008 01                    1283 	.db	1
      000009 00                    1284 	.db	0
      00000A 01                    1285 	.uleb128	1
      00000B 7F                    1286 	.sleb128	-1
      00000C 09                    1287 	.db	9
      00000D 0C                    1288 	.db	12
      00000E 08                    1289 	.uleb128	8
      00000F 02                    1290 	.uleb128	2
      000010 89                    1291 	.db	137
      000011 01                    1292 	.uleb128	1
      000012 00                    1293 	.db	0
      000013 00                    1294 	.db	0
      000014                       1295 Ldebug_CIE0_end:
      000014 00 00 00 84           1296 	.dw	0,132
      000018 00 00 00 00           1297 	.dw	0,(Ldebug_CIE0_start-4)
      00001C 00 00 80 FB           1298 	.dw	0,(Smain$main$27)	;initial loc
      000020 00 00 00 7B           1299 	.dw	0,Smain$main$69-Smain$main$27
      000024 01                    1300 	.db	1
      000025 00 00 80 FB           1301 	.dw	0,(Smain$main$27)
      000029 0E                    1302 	.db	14
      00002A 02                    1303 	.uleb128	2
      00002B 01                    1304 	.db	1
      00002C 00 00 80 FD           1305 	.dw	0,(Smain$main$28)
      000030 0E                    1306 	.db	14
      000031 06                    1307 	.uleb128	6
      000032 01                    1308 	.db	1
      000033 00 00 81 14           1309 	.dw	0,(Smain$main$35)
      000037 0E                    1310 	.db	14
      000038 07                    1311 	.uleb128	7
      000039 01                    1312 	.db	1
      00003A 00 00 81 16           1313 	.dw	0,(Smain$main$36)
      00003E 0E                    1314 	.db	14
      00003F 08                    1315 	.uleb128	8
      000040 01                    1316 	.db	1
      000041 00 00 81 18           1317 	.dw	0,(Smain$main$37)
      000045 0E                    1318 	.db	14
      000046 0A                    1319 	.uleb128	10
      000047 01                    1320 	.db	1
      000048 00 00 81 1B           1321 	.dw	0,(Smain$main$38)
      00004C 0E                    1322 	.db	14
      00004D 06                    1323 	.uleb128	6
      00004E 01                    1324 	.db	1
      00004F 00 00 81 44           1325 	.dw	0,(Smain$main$49)
      000053 0E                    1326 	.db	14
      000054 08                    1327 	.uleb128	8
      000055 01                    1328 	.db	1
      000056 00 00 81 46           1329 	.dw	0,(Smain$main$50)
      00005A 0E                    1330 	.db	14
      00005B 0A                    1331 	.uleb128	10
      00005C 01                    1332 	.db	1
      00005D 00 00 81 4B           1333 	.dw	0,(Smain$main$51)
      000061 0E                    1334 	.db	14
      000062 08                    1335 	.uleb128	8
      000063 01                    1336 	.db	1
      000064 00 00 81 4C           1337 	.dw	0,(Smain$main$52)
      000068 0E                    1338 	.db	14
      000069 06                    1339 	.uleb128	6
      00006A 01                    1340 	.db	1
      00006B 00 00 81 52           1341 	.dw	0,(Smain$main$56)
      00006F 0E                    1342 	.db	14
      000070 08                    1343 	.uleb128	8
      000071 01                    1344 	.db	1
      000072 00 00 81 54           1345 	.dw	0,(Smain$main$57)
      000076 0E                    1346 	.db	14
      000077 09                    1347 	.uleb128	9
      000078 01                    1348 	.db	1
      000079 00 00 81 56           1349 	.dw	0,(Smain$main$58)
      00007D 0E                    1350 	.db	14
      00007E 0A                    1351 	.uleb128	10
      00007F 01                    1352 	.db	1
      000080 00 00 81 5B           1353 	.dw	0,(Smain$main$59)
      000084 0E                    1354 	.db	14
      000085 06                    1355 	.uleb128	6
      000086 01                    1356 	.db	1
      000087 00 00 81 6A           1357 	.dw	0,(Smain$main$61)
      00008B 0E                    1358 	.db	14
      00008C 07                    1359 	.uleb128	7
      00008D 01                    1360 	.db	1
      00008E 00 00 81 71           1361 	.dw	0,(Smain$main$62)
      000092 0E                    1362 	.db	14
      000093 06                    1363 	.uleb128	6
      000094 01                    1364 	.db	1
      000095 00 00 81 75           1365 	.dw	0,(Smain$main$67)
      000099 0E                    1366 	.db	14
      00009A 02                    1367 	.uleb128	2
      00009B 00                    1368 	.db	0
                                   1369 
                                   1370 	.area .debug_frame (NOLOAD)
      00009C 00 00                 1371 	.dw	0
      00009E 00 10                 1372 	.dw	Ldebug_CIE1_end-Ldebug_CIE1_start
      0000A0                       1373 Ldebug_CIE1_start:
      0000A0 FF FF                 1374 	.dw	0xffff
      0000A2 FF FF                 1375 	.dw	0xffff
      0000A4 01                    1376 	.db	1
      0000A5 00                    1377 	.db	0
      0000A6 01                    1378 	.uleb128	1
      0000A7 7F                    1379 	.sleb128	-1
      0000A8 09                    1380 	.db	9
      0000A9 0C                    1381 	.db	12
      0000AA 08                    1382 	.uleb128	8
      0000AB 02                    1383 	.uleb128	2
      0000AC 89                    1384 	.db	137
      0000AD 01                    1385 	.uleb128	1
      0000AE 00                    1386 	.db	0
      0000AF 00                    1387 	.db	0
      0000B0                       1388 Ldebug_CIE1_end:
      0000B0 00 00 00 14           1389 	.dw	0,20
      0000B4 00 00 00 9C           1390 	.dw	0,(Ldebug_CIE1_start-4)
      0000B8 00 00 80 F1           1391 	.dw	0,(Smain$putchar$18)	;initial loc
      0000BC 00 00 00 0A           1392 	.dw	0,Smain$putchar$25-Smain$putchar$18
      0000C0 01                    1393 	.db	1
      0000C1 00 00 80 F1           1394 	.dw	0,(Smain$putchar$18)
      0000C5 0E                    1395 	.db	14
      0000C6 02                    1396 	.uleb128	2
      0000C7 00                    1397 	.db	0
                                   1398 
                                   1399 	.area .debug_frame (NOLOAD)
      0000C8 00 00                 1400 	.dw	0
      0000CA 00 10                 1401 	.dw	Ldebug_CIE2_end-Ldebug_CIE2_start
      0000CC                       1402 Ldebug_CIE2_start:
      0000CC FF FF                 1403 	.dw	0xffff
      0000CE FF FF                 1404 	.dw	0xffff
      0000D0 01                    1405 	.db	1
      0000D1 00                    1406 	.db	0
      0000D2 01                    1407 	.uleb128	1
      0000D3 7F                    1408 	.sleb128	-1
      0000D4 09                    1409 	.db	9
      0000D5 0C                    1410 	.db	12
      0000D6 08                    1411 	.uleb128	8
      0000D7 02                    1412 	.uleb128	2
      0000D8 89                    1413 	.db	137
      0000D9 01                    1414 	.uleb128	1
      0000DA 00                    1415 	.db	0
      0000DB 00                    1416 	.db	0
      0000DC                       1417 Ldebug_CIE2_end:
      0000DC 00 00 00 28           1418 	.dw	0,40
      0000E0 00 00 00 C8           1419 	.dw	0,(Ldebug_CIE2_start-4)
      0000E4 00 00 80 A7           1420 	.dw	0,(Smain$micros$1)	;initial loc
      0000E8 00 00 00 4A           1421 	.dw	0,Smain$micros$16-Smain$micros$1
      0000EC 01                    1422 	.db	1
      0000ED 00 00 80 A7           1423 	.dw	0,(Smain$micros$1)
      0000F1 0E                    1424 	.db	14
      0000F2 02                    1425 	.uleb128	2
      0000F3 01                    1426 	.db	1
      0000F4 00 00 80 A9           1427 	.dw	0,(Smain$micros$2)
      0000F8 0E                    1428 	.db	14
      0000F9 0C                    1429 	.uleb128	12
      0000FA 01                    1430 	.db	1
      0000FB 00 00 80 E2           1431 	.dw	0,(Smain$micros$10)
      0000FF 0E                    1432 	.db	14
      000100 0C                    1433 	.uleb128	12
      000101 01                    1434 	.db	1
      000102 00 00 80 F0           1435 	.dw	0,(Smain$micros$14)
      000106 0E                    1436 	.db	14
      000107 02                    1437 	.uleb128	2
