;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module timer4
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM4_init
	.globl _delay
	.globl _delayMicroseconds
	.globl _TIM4_UPD_ISR
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
	Stimer4$micros$0 ==.
;	timer4.h: 91: INLINE uint32_t micros(void) {
; genLabel
;	-----------------------------------------
;	 function micros
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 10 bytes.
_micros:
	Stimer4$micros$1 ==.
	sub	sp, #10
	Stimer4$micros$2 ==.
	Stimer4$micros$3 ==.
;	timer4.h: 97: sfr_TIM4.CR1.CEN = 0;
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5340.
	bres	0x5340, #0
; peephole 205x replaced 'and' by 'bres' (index register) ('0x5340' -> '0x5340').
	Stimer4$micros$4 ==.
;	timer4.h: 100: cnt = sfr_TIM4.CNTR.byte;
; genPointerGet
	ld	a, 0x5346
	ld	(0x01, sp), a
	Stimer4$micros$5 ==.
;	timer4.h: 102: uif = sfr_TIM4.SR.byte;
; genPointerGet
	ld	a, 0x5344
; genCast
; genAssign
	ld	(0x02, sp), a
	Stimer4$micros$6 ==.
;	timer4.h: 108: sfr_TIM4.CR1.CEN = 1;
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5340.
	bset	0x5340, #0
; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
	Stimer4$micros$7 ==.
;	timer4.h: 111: us  = g_micros;
; genAssign
	ldw	y, _g_micros+2
	ldw	x, _g_micros+0
	ldw	(0x03, sp), x
	Stimer4$micros$8 ==.
;	timer4.h: 115: us += ((uint16_t) cnt) << 2;
; genCast
; genAssign
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
; genLeftShiftLiteral
	sllw	x
	sllw	x
; genCast
; genAssign
	ldw	(0x09, sp), x
	clrw	x
; genPlus
	addw	y, (0x09, sp)
	ld	a, xl
	adc	a, (0x04, sp)
	rlwa	x
; peephole r1 used rlwa.
	adc	a, (0x03, sp)
	ld	xh, a
	Stimer4$micros$9 ==.
;	timer4.h: 119: if ((uif & 0x01) && (cnt != 250))
; genAnd
	ld	a, (0x02, sp)
	srl	a
; peephole j5 changed absolute to relative unconditional jump.
	jrnc	00102$
; peephole j6 removed jra by using inverse jump logic
; peephole j30 removed unused label 00120$.
; skipping generated iCode
; genCmpEQorNE
	ld	a, (0x01, sp)
	cp	a, #0xfa
; peephole j5 changed absolute to relative unconditional jump.
	jreq	00102$
; peephole j10 removed jra by using inverse jump logic
; peephole j30 removed unused label 00122$.
	Stimer4$micros$10 ==.
; skipping generated iCode
	Stimer4$micros$11 ==.
;	timer4.h: 120: us += 1000L;
; genPlus
	addw	y, #0x03e8
	ld	a, xl
	adc	a, #0x00
	rlwa	x
; peephole r1 used rlwa.
	adc	a, #0x00
	ld	xh, a
; genLabel
00102$:
	Stimer4$micros$12 ==.
;	timer4.h: 122: return(us);
; genReturn
	exgw	x, y
; genLabel
; peephole j30 removed unused label 00104$.
	Stimer4$micros$13 ==.
;	timer4.h: 124: } // micros()
; genEndFunction
	addw	sp, #10
	Stimer4$micros$14 ==.
	Stimer4$micros$15 ==.
	XFtimer4$micros$0$0 ==.
	ret
	Stimer4$micros$16 ==.
	Stimer4$TIM4_init$17 ==.
;	timer4.c: 31: void TIM4_init(void) {
; genLabel
;	-----------------------------------------
;	 function TIM4_init
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM4_init:
	Stimer4$TIM4_init$18 ==.
	Stimer4$TIM4_init$19 ==.
;	timer4.c: 39: sfr_TIM4.CR1.CEN = 0;
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5340.
	bres	0x5340, #0
; peephole 205x replaced 'and' by 'bres' (index register) ('0x5340' -> '0x5340').
	Stimer4$TIM4_init$20 ==.
;	timer4.c: 42: g_flagMilli = 0;
; genAssign
	clr	_g_flagMilli+0
	Stimer4$TIM4_init$21 ==.
;	timer4.c: 43: g_millis    = 0;
; genAssign
	clrw	x
	ldw	_g_millis+2, x
	ldw	_g_millis+0, x
	Stimer4$TIM4_init$22 ==.
;	timer4.c: 44: g_micros    = 0;
; genAssign
	clrw	x
	ldw	_g_micros+2, x
	ldw	_g_micros+0, x
	Stimer4$TIM4_init$23 ==.
;	timer4.c: 47: sfr_TIM4.CNTR.byte = 0x00;
; genPointerSet
	mov	0x5346+0, #0x00
	Stimer4$TIM4_init$24 ==.
;	timer4.c: 50: sfr_TIM4.CR1.ARPE = 1;
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5340.
	bset	0x5340, #7
; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
	Stimer4$TIM4_init$25 ==.
;	timer4.c: 53: sfr_TIM4.EGR.byte  = 0x00;
; genPointerSet
	mov	0x5345+0, #0x00
	Stimer4$TIM4_init$26 ==.
;	timer4.c: 56: sfr_TIM4.PSCR.PSC = 6;
; genAssign
; genPointerSet
	ld	a, 0x5347
	and	a, #0xf8
	or	a, #0x06
	ld	0x5347, a
; peephole 340x exchanged 'ldw-ld-and-or-ld' by 'ld-and-or-ld direct' ('0x5347' -> '0x5347').
	Stimer4$TIM4_init$27 ==.
;	timer4.c: 59: sfr_TIM4.ARR.byte  = 250;
; genPointerSet
	mov	0x5348+0, #0xfa
	Stimer4$TIM4_init$28 ==.
;	timer4.c: 62: sfr_TIM4.IER.UIE = 1;
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5343.
	bset	0x5343, #0
; peephole 203x replaced 'or' by 'bset' (index register) ('0x5343' -> '0x5343').
	Stimer4$TIM4_init$29 ==.
;	timer4.c: 65: sfr_TIM4.CR1.CEN = 1;
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5340.
	bset	0x5340, #0
; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
; genLabel
; peephole j30 removed unused label 00101$.
	Stimer4$TIM4_init$30 ==.
;	timer4.c: 67: } // TIM4_init
; genEndFunction
	Stimer4$TIM4_init$31 ==.
	XG$TIM4_init$0$0 ==.
	ret
	Stimer4$TIM4_init$32 ==.
	Stimer4$delay$33 ==.
;	timer4.c: 85: void delay(uint32_t ms) {
; genLabel
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 17 bytes.
_delay:
	Stimer4$delay$34 ==.
	sub	sp, #17
	Stimer4$delay$35 ==.
	Stimer4$delay$36 ==.
;	timer4.c: 87: uint32_t start = micros();
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5340.
	bres	0x5340, #0
; peephole 205x replaced 'and' by 'bres' (index register) ('0x5340' -> '0x5340').
; genPointerGet
	ld	a, 0x5346
	ld	(0x08, sp), a
; genPointerGet
	ld	a, 0x5344
; genCast
; genAssign
	ld	(0x09, sp), a
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5340.
	bset	0x5340, #0
; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
; genAssign
	ldw	y, _g_micros+2
	ldw	x, _g_micros+0
	ldw	(0x0a, sp), x
; genCast
; genAssign
	clrw	x
	ld	a, (0x08, sp)
	ld	xl, a
; genLeftShiftLiteral
	sllw	x
	sllw	x
; genCast
; genAssign
	ldw	(0x10, sp), x
	clrw	x
; genPlus
	addw	y, (0x10, sp)
	ld	a, xl
	adc	a, (0x0b, sp)
	rlwa	x
; peephole r1 used rlwa.
	adc	a, (0x0a, sp)
	ld	xh, a
; genAnd
	ld	a, (0x09, sp)
	srl	a
; peephole j5 changed absolute to relative unconditional jump.
	jrnc	00106$
; peephole j6 removed jra by using inverse jump logic
; peephole j30 removed unused label 00156$.
; skipping generated iCode
; genCmpEQorNE
	ld	a, (0x08, sp)
	cp	a, #0xfa
; peephole j5 changed absolute to relative unconditional jump.
	jreq	00106$
; peephole j10 removed jra by using inverse jump logic
; peephole j30 removed unused label 00158$.
	Stimer4$delay$37 ==.
; skipping generated iCode
; genPlus
	addw	y, #0x03e8
	ld	a, xl
	adc	a, #0x00
	rlwa	x
; peephole r1 used rlwa.
	adc	a, #0x00
	ld	xh, a
; genLabel
00106$:
	Stimer4$delay$38 ==.
	Stimer4$delay$38 ==.
; genAssign
	ldw	(0x03, sp), y
	ldw	(0x01, sp), x
	Stimer4$delay$39 ==.
	Stimer4$delay$40 ==.
;	timer4.c: 90: ms *= 1000L;
; genIPush
	ldw	x, (0x16, sp)
	pushw	x
	Stimer4$delay$41 ==.
	ldw	x, (0x16, sp)
	pushw	x
	Stimer4$delay$42 ==.
; genIPush
	push	#0xe8
	Stimer4$delay$43 ==.
	push	#0x03
	Stimer4$delay$44 ==.
	clrw	x
	pushw	x
	Stimer4$delay$45 ==.
; genCall
	call	__mullong
	addw	sp, #8
	Stimer4$delay$46 ==.
; genAssign
	ldw	(0x16, sp), x
	ldw	(0x14, sp), y
	Stimer4$delay$47 ==.
;	timer4.c: 91: while (micros() - start < ms)
; genLabel
00101$:
	Stimer4$delay$48 ==.
;	timer4.h: 97: sfr_TIM4.CR1.CEN = 0;
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5340.
	bres	0x5340, #0
; peephole 205x replaced 'and' by 'bres' (index register) ('0x5340' -> '0x5340').
;	timer4.h: 100: cnt = sfr_TIM4.CNTR.byte;
; genPointerGet
	ld	a, 0x5346
	ld	(0x05, sp), a
;	timer4.h: 102: uif = sfr_TIM4.SR.byte;
; genPointerGet
	ld	a, 0x5344
; genCast
; genAssign
	ld	yl, a
;	timer4.h: 108: sfr_TIM4.CR1.CEN = 1;
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5340.
	bset	0x5340, #0
; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
;	timer4.h: 111: us  = g_micros;
; genAssign
	ldw	x, _g_micros+2
	ldw	(0x08, sp), x
	ldw	x, _g_micros+0
	ldw	(0x06, sp), x
;	timer4.h: 115: us += ((uint16_t) cnt) << 2;
; genCast
; genAssign
	clrw	x
	ld	a, (0x05, sp)
	ld	xl, a
; genLeftShiftLiteral
	sllw	x
	sllw	x
; genCast
; genAssign
	clr	a
	clr	(0x0a, sp)
; genPlus
	addw	x, (0x08, sp)
	ldw	(0x10, sp), x
	adc	a, (0x07, sp)
	ld	(0x0f, sp), a
	clr	a
	adc	a, (0x06, sp)
	ld	(0x0e, sp), a
;	timer4.h: 119: if ((uif & 0x01) && (cnt != 250))
; genAnd
	srlw	y
; peephole j5 changed absolute to relative unconditional jump.
	jrnc	00110$
; peephole j6 removed jra by using inverse jump logic
; peephole j30 removed unused label 00160$.
; skipping generated iCode
; genCmpEQorNE
	ld	a, (0x05, sp)
	cp	a, #0xfa
; peephole j5 changed absolute to relative unconditional jump.
	jreq	00110$
; peephole j10 removed jra by using inverse jump logic
; peephole j30 removed unused label 00162$.
	Stimer4$delay$49 ==.
; skipping generated iCode
;	timer4.h: 120: us += 1000L;
; genPlus
	ldw	x, (0x10, sp)
	addw	x, #0x03e8
	ldw	(0x10, sp), x
	ld	a, (0x0f, sp)
	adc	a, #0x00
	ld	(0x0f, sp), a
	ld	a, (0x0e, sp)
	adc	a, #0x00
	ld	(0x0e, sp), a
; genLabel
00110$:
	Stimer4$delay$50 ==.
	Stimer4$delay$50 ==.
	Stimer4$delay$51 ==.
;	timer4.c: 91: while (micros() - start < ms)
; genMinus
	ldw	x, (0x10, sp)
	subw	x, (0x03, sp)
	ld	a, (0x0f, sp)
	sbc	a, (0x02, sp)
	push	a
	Stimer4$delay$52 ==.
	ld	a, (0x0f, sp)
	sbc	a, (0x02, sp)
	ld	(0x0b, sp), a
	Stimer4$delay$53 ==.
; genCmp
; genCmpTnz
; peephole 6 removed dead pop / push pair.
	Stimer4$delay$54 ==.
	cpw	x, (0x17, sp)
	pop	a
	Stimer4$delay$55 ==.
	sbc	a, (0x15, sp)
	ld	a, (0x0a, sp)
	sbc	a, (0x14, sp)
; peephole j5 changed absolute to relative unconditional jump.
	jrnc	00112$
; peephole j6 removed jra by using inverse jump logic
; peephole j30 removed unused label 00164$.
; skipping generated iCode
	Stimer4$delay$56 ==.
	Stimer4$delay$57 ==.
;	timer4.c: 92: NOP();
;	genInline
	nop
; genGoto
	jra	00101$
; peephole j5 changed absolute to relative unconditional jump.
; genLabel
00112$:
	Stimer4$delay$58 ==.
;	timer4.c: 94: } // delay()
; genEndFunction
	ldw	x, (18, sp)
	addw	sp, #23
	Stimer4$delay$59 ==.
	jp	(x)
	Stimer4$delay$60 ==.
	Stimer4$delayMicroseconds$61 ==.
;	timer4.c: 112: void delayMicroseconds(uint32_t us) {
; genLabel
;	-----------------------------------------
;	 function delayMicroseconds
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 17 bytes.
_delayMicroseconds:
	Stimer4$delayMicroseconds$62 ==.
	sub	sp, #17
	Stimer4$delayMicroseconds$63 ==.
	Stimer4$delayMicroseconds$64 ==.
;	timer4.c: 114: uint32_t start = micros();
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5340.
	bres	0x5340, #0
; peephole 205x replaced 'and' by 'bres' (index register) ('0x5340' -> '0x5340').
; genPointerGet
	ld	a, 0x5346
	ld	(0x08, sp), a
; genPointerGet
	ld	a, 0x5344
; genCast
; genAssign
	ld	(0x09, sp), a
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5340.
	bset	0x5340, #0
; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
; genAssign
	ldw	y, _g_micros+2
	ldw	x, _g_micros+0
	ldw	(0x0a, sp), x
; genCast
; genAssign
	clrw	x
	ld	a, (0x08, sp)
	ld	xl, a
; genLeftShiftLiteral
	sllw	x
	sllw	x
; genCast
; genAssign
	ldw	(0x10, sp), x
	clrw	x
; genPlus
	addw	y, (0x10, sp)
	ld	a, xl
	adc	a, (0x0b, sp)
	rlwa	x
; peephole r1 used rlwa.
	adc	a, (0x0a, sp)
	ld	xh, a
; genAnd
	ld	a, (0x09, sp)
	srl	a
; peephole j5 changed absolute to relative unconditional jump.
	jrnc	00106$
; peephole j6 removed jra by using inverse jump logic
; peephole j30 removed unused label 00156$.
; skipping generated iCode
; genCmpEQorNE
	ld	a, (0x08, sp)
	cp	a, #0xfa
; peephole j5 changed absolute to relative unconditional jump.
	jreq	00106$
; peephole j10 removed jra by using inverse jump logic
; peephole j30 removed unused label 00158$.
	Stimer4$delayMicroseconds$65 ==.
; skipping generated iCode
; genPlus
	addw	y, #0x03e8
	ld	a, xl
	adc	a, #0x00
	rlwa	x
; peephole r1 used rlwa.
	adc	a, #0x00
	ld	xh, a
; genLabel
00106$:
	Stimer4$delayMicroseconds$66 ==.
	Stimer4$delayMicroseconds$66 ==.
; genAssign
	ldw	(0x03, sp), y
	ldw	(0x01, sp), x
	Stimer4$delayMicroseconds$67 ==.
	Stimer4$delayMicroseconds$68 ==.
;	timer4.c: 117: while (micros() - start < us)
; genLabel
00101$:
	Stimer4$delayMicroseconds$69 ==.
;	timer4.h: 97: sfr_TIM4.CR1.CEN = 0;
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5340.
	bres	0x5340, #0
; peephole 205x replaced 'and' by 'bres' (index register) ('0x5340' -> '0x5340').
;	timer4.h: 100: cnt = sfr_TIM4.CNTR.byte;
; genPointerGet
	ld	a, 0x5346
	ld	(0x05, sp), a
;	timer4.h: 102: uif = sfr_TIM4.SR.byte;
; genPointerGet
	ld	a, 0x5344
; genCast
; genAssign
	ld	yl, a
;	timer4.h: 108: sfr_TIM4.CR1.CEN = 1;
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5340.
	bset	0x5340, #0
; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
;	timer4.h: 111: us  = g_micros;
; genAssign
	ldw	x, _g_micros+2
	ldw	(0x08, sp), x
	ldw	x, _g_micros+0
	ldw	(0x06, sp), x
;	timer4.h: 115: us += ((uint16_t) cnt) << 2;
; genCast
; genAssign
	clrw	x
	ld	a, (0x05, sp)
	ld	xl, a
; genLeftShiftLiteral
	sllw	x
	sllw	x
; genCast
; genAssign
	clr	a
	clr	(0x0a, sp)
; genPlus
	addw	x, (0x08, sp)
	ldw	(0x10, sp), x
	adc	a, (0x07, sp)
	ld	(0x0f, sp), a
	clr	a
	adc	a, (0x06, sp)
	ld	(0x0e, sp), a
;	timer4.h: 119: if ((uif & 0x01) && (cnt != 250))
; genAnd
	srlw	y
; peephole j5 changed absolute to relative unconditional jump.
	jrnc	00110$
; peephole j6 removed jra by using inverse jump logic
; peephole j30 removed unused label 00160$.
; skipping generated iCode
; genCmpEQorNE
	ld	a, (0x05, sp)
	cp	a, #0xfa
; peephole j5 changed absolute to relative unconditional jump.
	jreq	00110$
; peephole j10 removed jra by using inverse jump logic
; peephole j30 removed unused label 00162$.
	Stimer4$delayMicroseconds$70 ==.
; skipping generated iCode
;	timer4.h: 120: us += 1000L;
; genPlus
	ldw	x, (0x10, sp)
	addw	x, #0x03e8
	ldw	(0x10, sp), x
	ld	a, (0x0f, sp)
	adc	a, #0x00
	ld	(0x0f, sp), a
	ld	a, (0x0e, sp)
	adc	a, #0x00
	ld	(0x0e, sp), a
; genLabel
00110$:
	Stimer4$delayMicroseconds$71 ==.
	Stimer4$delayMicroseconds$71 ==.
	Stimer4$delayMicroseconds$72 ==.
;	timer4.c: 117: while (micros() - start < us)
; genMinus
	ldw	x, (0x10, sp)
	subw	x, (0x03, sp)
	ld	a, (0x0f, sp)
	sbc	a, (0x02, sp)
	push	a
	Stimer4$delayMicroseconds$73 ==.
	ld	a, (0x0f, sp)
	sbc	a, (0x02, sp)
	ld	(0x0b, sp), a
	Stimer4$delayMicroseconds$74 ==.
; genCmp
; genCmpTnz
; peephole 6 removed dead pop / push pair.
	Stimer4$delayMicroseconds$75 ==.
	cpw	x, (0x17, sp)
	pop	a
	Stimer4$delayMicroseconds$76 ==.
	sbc	a, (0x15, sp)
	ld	a, (0x0a, sp)
	sbc	a, (0x14, sp)
; peephole j5 changed absolute to relative unconditional jump.
	jrnc	00112$
; peephole j6 removed jra by using inverse jump logic
; peephole j30 removed unused label 00164$.
; skipping generated iCode
	Stimer4$delayMicroseconds$77 ==.
	Stimer4$delayMicroseconds$78 ==.
;	timer4.c: 118: NOP();
;	genInline
	nop
; genGoto
	jra	00101$
; peephole j5 changed absolute to relative unconditional jump.
; genLabel
00112$:
	Stimer4$delayMicroseconds$79 ==.
;	timer4.c: 120: } // delayMicroseconds()
; genEndFunction
	ldw	x, (18, sp)
	addw	sp, #23
	Stimer4$delayMicroseconds$80 ==.
	jp	(x)
	Stimer4$delayMicroseconds$81 ==.
	Stimer4$TIM4_UPD_ISR$82 ==.
;	timer4.c: 137: ISR_HANDLER(TIM4_UPD_ISR, _TIM4_OVR_UIF_VECTOR_)
; genLabel
;	-----------------------------------------
;	 function TIM4_UPD_ISR
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_TIM4_UPD_ISR:
	Stimer4$TIM4_UPD_ISR$83 ==.
	Stimer4$TIM4_UPD_ISR$84 ==.
;	timer4.c: 146: sfr_TIM4.SR.UIF = 0;
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5344.
	bres	0x5344, #0
; peephole 205x replaced 'and' by 'bres' (index register) ('0x5344' -> '0x5344').
	Stimer4$TIM4_UPD_ISR$85 ==.
;	timer4.c: 152: g_micros += 1000L;
; genPlus
	ldw	x, _g_micros+2
	addw	x, #0x03e8
	ldw	y, _g_micros+0
	jrnc	00103$
	incw	y
00103$:
; genAssign
	ldw	_g_micros+2, x
	ldw	_g_micros+0, y
	Stimer4$TIM4_UPD_ISR$86 ==.
;	timer4.c: 153: g_millis++;
; genAssign
	ldw	x, _g_millis+2
	ldw	y, _g_millis+0
; genPlus
	incw	x
	jrne	00104$
	incw	y
00104$:
; genAssign
	ldw	_g_millis+2, x
	ldw	_g_millis+0, y
	Stimer4$TIM4_UPD_ISR$87 ==.
;	timer4.c: 154: g_flagMilli = 1;
; genAssign
	mov	_g_flagMilli+0, #0x01
	Stimer4$TIM4_UPD_ISR$88 ==.
;	timer4.c: 156: return;
; genReturn
; genLabel
; peephole j30 removed unused label 00101$.
	Stimer4$TIM4_UPD_ISR$89 ==.
;	timer4.c: 158: } // TIM4_UPD_ISR
; genEndFunction
	Stimer4$TIM4_UPD_ISR$90 ==.
	XG$TIM4_UPD_ISR$0$0 ==.
	iret
	Stimer4$TIM4_UPD_ISR$91 ==.
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)

	.area .debug_line (NOLOAD)
	.dw	0,Ldebug_line_end-Ldebug_line_start
Ldebug_line_start:
	.dw	2
	.dw	0,Ldebug_line_stmt-6-Ldebug_line_start
	.db	1
	.db	1
	.db	-5
	.db	15
	.db	10
	.db	0
	.db	1
	.db	1
	.db	1
	.db	1
	.db	0
	.db	0
	.db	0
	.db	1
	.ascii "/usr/bin/../share/sdcc/include/stm8"
	.db	0
	.ascii "/usr/share/sdcc/include/stm8"
	.db	0
	.ascii "/usr/bin/../share/sdcc/include"
	.db	0
	.ascii "/usr/share/sdcc/include"
	.db	0
	.db	0
	.ascii "timer4.h"
	.db	0
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.ascii "timer4.c"
	.db	0
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.db	0
Ldebug_line_stmt:
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$micros$0)
	.db	3
	.sleb128	90
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$micros$3)
	.db	3
	.sleb128	6
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$micros$4)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$micros$5)
	.db	3
	.sleb128	2
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$micros$6)
	.db	3
	.sleb128	6
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$micros$7)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$micros$8)
	.db	3
	.sleb128	4
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$micros$9)
	.db	3
	.sleb128	4
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$micros$11)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$micros$12)
	.db	3
	.sleb128	2
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$micros$13)
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Stimer4$micros$15-Stimer4$micros$13
	.db	0
	.uleb128	1
	.db	1
	.db	4
	.uleb128	2
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_init$17)
	.db	3
	.sleb128	30
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_init$19)
	.db	3
	.sleb128	8
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_init$20)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_init$21)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_init$22)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_init$23)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_init$24)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_init$25)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_init$26)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_init$27)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_init$28)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_init$29)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_init$30)
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Stimer4$TIM4_init$31-Stimer4$TIM4_init$30
	.db	0
	.uleb128	1
	.db	1
	.db	4
	.uleb128	2
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$delay$33)
	.db	3
	.sleb128	84
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$delay$40)
	.db	3
	.sleb128	5
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$delay$47)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$delay$51)
	.db	3
	.sleb128	0
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$delay$57)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$delay$58)
	.db	3
	.sleb128	2
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$delayMicroseconds$61)
	.db	3
	.sleb128	18
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$delayMicroseconds$68)
	.db	3
	.sleb128	5
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$delayMicroseconds$72)
	.db	3
	.sleb128	0
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$delayMicroseconds$78)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$delayMicroseconds$79)
	.db	3
	.sleb128	2
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_UPD_ISR$82)
	.db	3
	.sleb128	17
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_UPD_ISR$84)
	.db	3
	.sleb128	9
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_UPD_ISR$85)
	.db	3
	.sleb128	6
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_UPD_ISR$86)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_UPD_ISR$87)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_UPD_ISR$88)
	.db	3
	.sleb128	2
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Stimer4$TIM4_UPD_ISR$89)
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Stimer4$TIM4_UPD_ISR$90-Stimer4$TIM4_UPD_ISR$89
	.db	0
	.uleb128	1
	.db	1
Ldebug_line_end:

	.area .debug_loc (NOLOAD)
Ldebug_loc_start:
	.dw	0,(Stimer4$TIM4_UPD_ISR$83)
	.dw	0,(Stimer4$TIM4_UPD_ISR$91)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Stimer4$delayMicroseconds$80)
	.dw	0,(Stimer4$delayMicroseconds$81)
	.dw	2
	.db	120
	.sleb128	-5
	.dw	0,(Stimer4$delayMicroseconds$76)
	.dw	0,(Stimer4$delayMicroseconds$80)
	.dw	2
	.db	120
	.sleb128	18
	.dw	0,(Stimer4$delayMicroseconds$75)
	.dw	0,(Stimer4$delayMicroseconds$76)
	.dw	2
	.db	120
	.sleb128	19
	.dw	0,(Stimer4$delayMicroseconds$74)
	.dw	0,(Stimer4$delayMicroseconds$75)
	.dw	2
	.db	120
	.sleb128	18
	.dw	0,(Stimer4$delayMicroseconds$73)
	.dw	0,(Stimer4$delayMicroseconds$74)
	.dw	2
	.db	120
	.sleb128	19
	.dw	0,(Stimer4$delayMicroseconds$70)
	.dw	0,(Stimer4$delayMicroseconds$73)
	.dw	2
	.db	120
	.sleb128	18
	.dw	0,(Stimer4$delayMicroseconds$65)
	.dw	0,(Stimer4$delayMicroseconds$70)
	.dw	2
	.db	120
	.sleb128	18
	.dw	0,(Stimer4$delayMicroseconds$63)
	.dw	0,(Stimer4$delayMicroseconds$65)
	.dw	2
	.db	120
	.sleb128	18
	.dw	0,(Stimer4$delayMicroseconds$62)
	.dw	0,(Stimer4$delayMicroseconds$63)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Stimer4$delay$59)
	.dw	0,(Stimer4$delay$60)
	.dw	2
	.db	120
	.sleb128	-5
	.dw	0,(Stimer4$delay$55)
	.dw	0,(Stimer4$delay$59)
	.dw	2
	.db	120
	.sleb128	18
	.dw	0,(Stimer4$delay$54)
	.dw	0,(Stimer4$delay$55)
	.dw	2
	.db	120
	.sleb128	19
	.dw	0,(Stimer4$delay$53)
	.dw	0,(Stimer4$delay$54)
	.dw	2
	.db	120
	.sleb128	18
	.dw	0,(Stimer4$delay$52)
	.dw	0,(Stimer4$delay$53)
	.dw	2
	.db	120
	.sleb128	19
	.dw	0,(Stimer4$delay$49)
	.dw	0,(Stimer4$delay$52)
	.dw	2
	.db	120
	.sleb128	18
	.dw	0,(Stimer4$delay$46)
	.dw	0,(Stimer4$delay$49)
	.dw	2
	.db	120
	.sleb128	18
	.dw	0,(Stimer4$delay$45)
	.dw	0,(Stimer4$delay$46)
	.dw	2
	.db	120
	.sleb128	26
	.dw	0,(Stimer4$delay$44)
	.dw	0,(Stimer4$delay$45)
	.dw	2
	.db	120
	.sleb128	24
	.dw	0,(Stimer4$delay$43)
	.dw	0,(Stimer4$delay$44)
	.dw	2
	.db	120
	.sleb128	23
	.dw	0,(Stimer4$delay$42)
	.dw	0,(Stimer4$delay$43)
	.dw	2
	.db	120
	.sleb128	22
	.dw	0,(Stimer4$delay$41)
	.dw	0,(Stimer4$delay$42)
	.dw	2
	.db	120
	.sleb128	20
	.dw	0,(Stimer4$delay$37)
	.dw	0,(Stimer4$delay$41)
	.dw	2
	.db	120
	.sleb128	18
	.dw	0,(Stimer4$delay$35)
	.dw	0,(Stimer4$delay$37)
	.dw	2
	.db	120
	.sleb128	18
	.dw	0,(Stimer4$delay$34)
	.dw	0,(Stimer4$delay$35)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Stimer4$TIM4_init$18)
	.dw	0,(Stimer4$TIM4_init$32)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Stimer4$micros$14)
	.dw	0,(Stimer4$micros$16)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Stimer4$micros$10)
	.dw	0,(Stimer4$micros$14)
	.dw	2
	.db	120
	.sleb128	11
	.dw	0,(Stimer4$micros$2)
	.dw	0,(Stimer4$micros$10)
	.dw	2
	.db	120
	.sleb128	11
	.dw	0,(Stimer4$micros$1)
	.dw	0,(Stimer4$micros$2)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0

	.area .debug_abbrev (NOLOAD)
Ldebug_abbrev:
	.uleb128	1
	.uleb128	17
	.db	1
	.uleb128	3
	.uleb128	8
	.uleb128	16
	.uleb128	6
	.uleb128	19
	.uleb128	11
	.uleb128	37
	.uleb128	8
	.uleb128	0
	.uleb128	0
	.uleb128	2
	.uleb128	36
	.db	0
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	11
	.uleb128	62
	.uleb128	11
	.uleb128	0
	.uleb128	0
	.uleb128	3
	.uleb128	46
	.db	1
	.uleb128	1
	.uleb128	19
	.uleb128	3
	.uleb128	8
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	63
	.uleb128	12
	.uleb128	64
	.uleb128	6
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	4
	.uleb128	52
	.db	0
	.uleb128	2
	.uleb128	10
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	5
	.uleb128	46
	.db	0
	.uleb128	3
	.uleb128	8
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	63
	.uleb128	12
	.uleb128	64
	.uleb128	6
	.uleb128	0
	.uleb128	0
	.uleb128	6
	.uleb128	46
	.db	1
	.uleb128	1
	.uleb128	19
	.uleb128	3
	.uleb128	8
	.uleb128	17
	.uleb128	1
	.uleb128	63
	.uleb128	12
	.uleb128	0
	.uleb128	0
	.uleb128	7
	.uleb128	5
	.db	0
	.uleb128	2
	.uleb128	10
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	8
	.uleb128	11
	.db	1
	.uleb128	1
	.uleb128	19
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.uleb128	9
	.uleb128	11
	.db	1
	.uleb128	0
	.uleb128	0
	.uleb128	10
	.uleb128	11
	.db	1
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.uleb128	11
	.uleb128	46
	.db	0
	.uleb128	3
	.uleb128	8
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	54
	.uleb128	11
	.uleb128	63
	.uleb128	12
	.uleb128	64
	.uleb128	6
	.uleb128	0
	.uleb128	0
	.uleb128	12
	.uleb128	53
	.db	0
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	13
	.uleb128	52
	.db	0
	.uleb128	2
	.uleb128	10
	.uleb128	3
	.uleb128	8
	.uleb128	60
	.uleb128	12
	.uleb128	63
	.uleb128	12
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	0

	.area .debug_info (NOLOAD)
	.dw	0,Ldebug_info_end-Ldebug_info_start
Ldebug_info_start:
	.dw	2
	.dw	0,(Ldebug_abbrev)
	.db	4
	.uleb128	1
	.ascii "timer4.c"
	.db	0
	.dw	0,(Ldebug_line_start+-4)
	.db	1
	.ascii "SDCC version 4.4.0 #14620"
	.db	0
	.uleb128	2
	.ascii "unsigned long"
	.db	0
	.db	4
	.db	7
	.uleb128	3
	.dw	0,144
	.ascii "micros"
	.db	0
	.dw	0,(_micros)
	.dw	0,(XFtimer4$micros$0$0+1)
	.db	0
	.dw	0,(Ldebug_loc_start+328)
	.dw	0,52
	.uleb128	4
	.db	2
	.db	145
	.sleb128	-10
	.ascii "cnt"
	.db	0
	.dw	0,144
	.uleb128	4
	.db	2
	.db	145
	.sleb128	-9
	.ascii "uif"
	.db	0
	.dw	0,144
	.uleb128	4
	.db	12
	.db	82
	.db	147
	.uleb128	1
	.db	81
	.db	147
	.uleb128	1
	.db	84
	.db	147
	.uleb128	1
	.db	83
	.db	147
	.uleb128	1
	.ascii "us"
	.db	0
	.dw	0,52
	.uleb128	0
	.uleb128	2
	.ascii "unsigned char"
	.db	0
	.db	1
	.db	8
	.uleb128	5
	.ascii "TIM4_init"
	.db	0
	.dw	0,(_TIM4_init)
	.dw	0,(XG$TIM4_init$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+308)
	.uleb128	6
	.dw	0,398
	.ascii "delay"
	.db	0
	.dw	0,(_delay)
	.db	1
	.uleb128	7
	.db	2
	.db	145
	.sleb128	2
	.ascii "ms"
	.db	0
	.dw	0,52
	.uleb128	8
	.dw	0,283
	.dw	0,(Stimer4$delay$38)
	.dw	0,(Stimer4$delay$39)
	.uleb128	9
	.uleb128	10
	.dw	0,(Stimer4$delay$36)
	.dw	0,(Stimer4$delay$38)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	-10
	.ascii "cnt"
	.db	0
	.dw	0,144
	.uleb128	4
	.db	2
	.db	145
	.sleb128	-9
	.ascii "uif"
	.db	0
	.dw	0,144
	.uleb128	4
	.db	12
	.db	82
	.db	147
	.uleb128	1
	.db	81
	.db	147
	.uleb128	1
	.db	84
	.db	147
	.uleb128	1
	.db	83
	.db	147
	.uleb128	1
	.ascii "us"
	.db	0
	.dw	0,52
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.uleb128	8
	.dw	0,343
	.dw	0,(Stimer4$delay$50)
	.dw	0,(Stimer4$delay$56)
	.uleb128	9
	.uleb128	10
	.dw	0,(Stimer4$delay$48)
	.dw	0,(Stimer4$delay$50)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	-13
	.ascii "cnt"
	.db	0
	.dw	0,144
	.uleb128	4
	.db	1
	.db	83
	.ascii "uif"
	.db	0
	.dw	0,144
	.uleb128	4
	.db	2
	.db	145
	.sleb128	-4
	.ascii "us"
	.db	0
	.dw	0,52
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.uleb128	4
	.db	2
	.db	145
	.sleb128	0
	.ascii "__200000501"
	.db	0
	.dw	0,52
	.uleb128	4
	.db	2
	.db	145
	.sleb128	0
	.ascii "__200000499"
	.db	0
	.dw	0,52
	.uleb128	4
	.db	2
	.db	145
	.sleb128	-17
	.ascii "start"
	.db	0
	.dw	0,52
	.uleb128	0
	.uleb128	6
	.dw	0,623
	.ascii "delayMicroseconds"
	.db	0
	.dw	0,(_delayMicroseconds)
	.db	1
	.uleb128	7
	.db	2
	.db	145
	.sleb128	2
	.ascii "us"
	.db	0
	.dw	0,52
	.uleb128	8
	.dw	0,508
	.dw	0,(Stimer4$delayMicroseconds$66)
	.dw	0,(Stimer4$delayMicroseconds$67)
	.uleb128	9
	.uleb128	10
	.dw	0,(Stimer4$delayMicroseconds$64)
	.dw	0,(Stimer4$delayMicroseconds$66)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	-10
	.ascii "cnt"
	.db	0
	.dw	0,144
	.uleb128	4
	.db	2
	.db	145
	.sleb128	-9
	.ascii "uif"
	.db	0
	.dw	0,144
	.uleb128	4
	.db	12
	.db	82
	.db	147
	.uleb128	1
	.db	81
	.db	147
	.uleb128	1
	.db	84
	.db	147
	.uleb128	1
	.db	83
	.db	147
	.uleb128	1
	.ascii "us"
	.db	0
	.dw	0,52
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.uleb128	8
	.dw	0,568
	.dw	0,(Stimer4$delayMicroseconds$71)
	.dw	0,(Stimer4$delayMicroseconds$77)
	.uleb128	9
	.uleb128	10
	.dw	0,(Stimer4$delayMicroseconds$69)
	.dw	0,(Stimer4$delayMicroseconds$71)
	.uleb128	4
	.db	2
	.db	145
	.sleb128	-13
	.ascii "cnt"
	.db	0
	.dw	0,144
	.uleb128	4
	.db	1
	.db	83
	.ascii "uif"
	.db	0
	.dw	0,144
	.uleb128	4
	.db	2
	.db	145
	.sleb128	-4
	.ascii "us"
	.db	0
	.dw	0,52
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.uleb128	4
	.db	2
	.db	145
	.sleb128	0
	.ascii "__200000505"
	.db	0
	.dw	0,52
	.uleb128	4
	.db	2
	.db	145
	.sleb128	0
	.ascii "__200000503"
	.db	0
	.dw	0,52
	.uleb128	4
	.db	2
	.db	145
	.sleb128	-17
	.ascii "start"
	.db	0
	.dw	0,52
	.uleb128	0
	.uleb128	11
	.ascii "TIM4_UPD_ISR"
	.db	0
	.dw	0,(_TIM4_UPD_ISR)
	.dw	0,(XG$TIM4_UPD_ISR$0$0+1)
	.db	3
	.db	1
	.dw	0,(Ldebug_loc_start)
	.uleb128	12
	.dw	0,52
	.uleb128	13
	.db	5
	.db	3
	.dw	0,(_g_millis)
	.ascii "g_millis"
	.db	0
	.db	1
	.db	1
	.dw	0,651
	.uleb128	13
	.db	5
	.db	3
	.dw	0,(_g_micros)
	.ascii "g_micros"
	.db	0
	.db	1
	.db	1
	.dw	0,651
	.uleb128	0
Ldebug_info_end:

	.area .debug_pubnames (NOLOAD)
	.dw	0,Ldebug_pubnames_end-Ldebug_pubnames_start
Ldebug_pubnames_start:
	.dw	2
	.dw	0,(Ldebug_info_start-4)
	.dw	0,4+Ldebug_info_end-Ldebug_info_start
	.dw	0,161
	.ascii "TIM4_init"
	.db	0
	.dw	0,185
	.ascii "delay"
	.db	0
	.dw	0,398
	.ascii "delayMicroseconds"
	.db	0
	.dw	0,623
	.ascii "TIM4_UPD_ISR"
	.db	0
	.dw	0,656
	.ascii "g_millis"
	.db	0
	.dw	0,678
	.ascii "g_micros"
	.db	0
	.dw	0,0
Ldebug_pubnames_end:

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE0_end-Ldebug_CIE0_start
Ldebug_CIE0_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	9
	.db	137
	.uleb128	1
	.db	0
	.db	0
Ldebug_CIE0_end:
	.dw	0,20
	.dw	0,(Ldebug_CIE0_start-4)
	.dw	0,(Stimer4$TIM4_UPD_ISR$83)	;initial loc
	.dw	0,Stimer4$TIM4_UPD_ISR$91-Stimer4$TIM4_UPD_ISR$83
	.db	1
	.dw	0,(Stimer4$TIM4_UPD_ISR$83)
	.db	14
	.uleb128	9
	.db	0

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE1_end-Ldebug_CIE1_start
Ldebug_CIE1_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
	.db	0
	.db	0
Ldebug_CIE1_end:
	.dw	0,80
	.dw	0,(Ldebug_CIE1_start-4)
	.dw	0,(Stimer4$delayMicroseconds$62)	;initial loc
	.dw	0,Stimer4$delayMicroseconds$81-Stimer4$delayMicroseconds$62
	.db	1
	.dw	0,(Stimer4$delayMicroseconds$62)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Stimer4$delayMicroseconds$63)
	.db	14
	.uleb128	19
	.db	1
	.dw	0,(Stimer4$delayMicroseconds$65)
	.db	14
	.uleb128	19
	.db	1
	.dw	0,(Stimer4$delayMicroseconds$70)
	.db	14
	.uleb128	19
	.db	1
	.dw	0,(Stimer4$delayMicroseconds$73)
	.db	14
	.uleb128	20
	.db	1
	.dw	0,(Stimer4$delayMicroseconds$74)
	.db	14
	.uleb128	19
	.db	1
	.dw	0,(Stimer4$delayMicroseconds$75)
	.db	14
	.uleb128	20
	.db	1
	.dw	0,(Stimer4$delayMicroseconds$76)
	.db	14
	.uleb128	19
	.db	1
	.dw	0,(Stimer4$delayMicroseconds$80)
	.db	14
	.uleb128	-4
	.db	0

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE2_end-Ldebug_CIE2_start
Ldebug_CIE2_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
	.db	0
	.db	0
Ldebug_CIE2_end:
	.dw	0,124
	.dw	0,(Ldebug_CIE2_start-4)
	.dw	0,(Stimer4$delay$34)	;initial loc
	.dw	0,Stimer4$delay$60-Stimer4$delay$34
	.db	1
	.dw	0,(Stimer4$delay$34)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Stimer4$delay$35)
	.db	14
	.uleb128	19
	.db	1
	.dw	0,(Stimer4$delay$37)
	.db	14
	.uleb128	19
	.db	1
	.dw	0,(Stimer4$delay$41)
	.db	14
	.uleb128	21
	.db	1
	.dw	0,(Stimer4$delay$42)
	.db	14
	.uleb128	23
	.db	1
	.dw	0,(Stimer4$delay$43)
	.db	14
	.uleb128	24
	.db	1
	.dw	0,(Stimer4$delay$44)
	.db	14
	.uleb128	25
	.db	1
	.dw	0,(Stimer4$delay$45)
	.db	14
	.uleb128	27
	.db	1
	.dw	0,(Stimer4$delay$46)
	.db	14
	.uleb128	19
	.db	1
	.dw	0,(Stimer4$delay$49)
	.db	14
	.uleb128	19
	.db	1
	.dw	0,(Stimer4$delay$52)
	.db	14
	.uleb128	20
	.db	1
	.dw	0,(Stimer4$delay$53)
	.db	14
	.uleb128	19
	.db	1
	.dw	0,(Stimer4$delay$54)
	.db	14
	.uleb128	20
	.db	1
	.dw	0,(Stimer4$delay$55)
	.db	14
	.uleb128	19
	.db	1
	.dw	0,(Stimer4$delay$59)
	.db	14
	.uleb128	-4
	.db	0
	.db	0
	.db	0

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE3_end-Ldebug_CIE3_start
Ldebug_CIE3_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
	.db	0
	.db	0
Ldebug_CIE3_end:
	.dw	0,20
	.dw	0,(Ldebug_CIE3_start-4)
	.dw	0,(Stimer4$TIM4_init$18)	;initial loc
	.dw	0,Stimer4$TIM4_init$32-Stimer4$TIM4_init$18
	.db	1
	.dw	0,(Stimer4$TIM4_init$18)
	.db	14
	.uleb128	2
	.db	0

	.area .debug_frame (NOLOAD)
	.dw	0
	.dw	Ldebug_CIE4_end-Ldebug_CIE4_start
Ldebug_CIE4_start:
	.dw	0xffff
	.dw	0xffff
	.db	1
	.db	0
	.uleb128	1
	.sleb128	-1
	.db	9
	.db	12
	.uleb128	8
	.uleb128	2
	.db	137
	.uleb128	1
	.db	0
	.db	0
Ldebug_CIE4_end:
	.dw	0,40
	.dw	0,(Ldebug_CIE4_start-4)
	.dw	0,(Stimer4$micros$1)	;initial loc
	.dw	0,Stimer4$micros$16-Stimer4$micros$1
	.db	1
	.dw	0,(Stimer4$micros$1)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Stimer4$micros$2)
	.db	14
	.uleb128	12
	.db	1
	.dw	0,(Stimer4$micros$10)
	.db	14
	.uleb128	12
	.db	1
	.dw	0,(Stimer4$micros$14)
	.db	14
	.uleb128	2
