;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _UART_begin
	.globl _TIM4_init
	.globl _printf
	.globl __CalcPrimes
	.globl _g_micros
	.globl _g_millis
	.globl _g_flagMilli
	.globl _putchar
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
G$g_flagMilli$0_0$0==.
_g_flagMilli::
	.ds 1
G$g_millis$0_0$0==.
_g_millis::
	.ds 4
G$g_micros$0_0$0==.
_g_micros::
	.ds 4
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

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
; interrupt vector
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
	int 0x000000 ; trap
	int 0x000000 ; int0
	int 0x000000 ; int1
	int 0x000000 ; int2
	int 0x000000 ; int3
	int 0x000000 ; int4
	int 0x000000 ; int5
	int 0x000000 ; int6
	int 0x000000 ; int7
	int 0x000000 ; int8
	int 0x000000 ; int9
	int 0x000000 ; int10
	int 0x000000 ; int11
	int 0x000000 ; int12
	int 0x000000 ; int13
	int 0x000000 ; int14
	int 0x000000 ; int15
	int 0x000000 ; int16
	int 0x000000 ; int17
	int 0x000000 ; int18
	int 0x000000 ; int19
	int 0x000000 ; int20
	int 0x000000 ; int21
	int 0x000000 ; int22
	int _TIM4_UPD_ISR ; int23
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
	call	___sdcc_external_startup
	tnz	a
	jreq	__sdcc_init_data
	jp	__sdcc_program_startup
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
	Smain$micros$0 ==.
;	timer4.h: 91: INLINE uint32_t micros(void) {
; genLabel
;	-----------------------------------------
;	 function micros
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 10 bytes.
_micros:
	Smain$micros$1 ==.
	sub	sp, #10
	Smain$micros$2 ==.
	Smain$micros$3 ==.
;	timer4.h: 97: sfr_TIM4.CR1.CEN = 0;
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5340.
	bres	0x5340, #0
; peephole 205x replaced 'and' by 'bres' (index register) ('0x5340' -> '0x5340').
	Smain$micros$4 ==.
;	timer4.h: 100: cnt = sfr_TIM4.CNTR.byte;
; genPointerGet
	ld	a, 0x5346
	ld	(0x01, sp), a
	Smain$micros$5 ==.
;	timer4.h: 102: uif = sfr_TIM4.SR.byte;
; genPointerGet
	ld	a, 0x5344
; genCast
; genAssign
	ld	(0x02, sp), a
	Smain$micros$6 ==.
;	timer4.h: 108: sfr_TIM4.CR1.CEN = 1;
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5340.
	bset	0x5340, #0
; peephole 203x replaced 'or' by 'bset' (index register) ('0x5340' -> '0x5340').
	Smain$micros$7 ==.
;	timer4.h: 111: us  = g_micros;
; genAssign
	ldw	y, _g_micros+2
	ldw	x, _g_micros+0
	ldw	(0x03, sp), x
	Smain$micros$8 ==.
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
	Smain$micros$9 ==.
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
	Smain$micros$10 ==.
; skipping generated iCode
	Smain$micros$11 ==.
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
	Smain$micros$12 ==.
;	timer4.h: 122: return(us);
; genReturn
	exgw	x, y
; genLabel
; peephole j30 removed unused label 00104$.
	Smain$micros$13 ==.
;	timer4.h: 124: } // micros()
; genEndFunction
	addw	sp, #10
	Smain$micros$14 ==.
	Smain$micros$15 ==.
	XFmain$micros$0$0 ==.
	ret
	Smain$micros$16 ==.
	Smain$putchar$17 ==.
;	main.c: 34: int putchar(int data) {
; genLabel
;	-----------------------------------------
;	 function putchar
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_putchar:
	Smain$putchar$18 ==.
; genReceive
	Smain$putchar$19 ==.
	Smain$putchar$20 ==.
;	main.c: 37: UART_write(data);
; genLabel
00101$:
; genAssign
; genPointerGet
; peephole 630x replaced 'ldw-ld' by 'ld direct' ('0x5230' -> '0x5230').
; genIfx
; peephole 511 replaced 'swap-bcp' (8) by 'bcp' (128).
; peephole 510 replaced 'srl-bcp' (4) by 'bcp' (8).
; peephole 510 replaced 'srl-bcp' (2) by 'bcp' (4).
; peephole 510 replaced 'srl-bcp' (0x01) by 'bcp' (2).
; peephole 500 replaced 'and' by 'bcp'.
; peephole 23 removed redundant tnz.
; peephole j531x replaced 'ld-bcp-jrne' by 'btjt' ('0x5230').
; peephole j5 changed absolute to relative unconditional jump.
	btjf	0x5230, #7, 00101$
; peephole j33 removed jra by using inverse bit-test-jump logic
; peephole j30 removed unused label 00121$.
; genCast
; genAssign
	ld	a, xl
; genPointerSet
	ld	0x5231, a
	Smain$putchar$21 ==.
	Smain$putchar$22 ==.
;	main.c: 40: return (data);
; genReturn
; genLabel
; peephole j30 removed unused label 00104$.
	Smain$putchar$23 ==.
;	main.c: 42: } // putchar
; genEndFunction
	Smain$putchar$24 ==.
	XG$putchar$0$0 ==.
	ret
	Smain$putchar$25 ==.
	Smain$main$26 ==.
;	main.c: 47: void main(void) {
; genLabel
;	-----------------------------------------
;	 function main
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 4 bytes.
_main:
	Smain$main$27 ==.
	sub	sp, #4
	Smain$main$28 ==.
	Smain$main$29 ==.
;	main.c: 52: DISABLE_INTERRUPTS();
;	genInline
	sim
	Smain$main$30 ==.
;	main.c: 55: sfr_CLK.CKDIVR.byte = 0x00;
; genPointerSet
	mov	0x50c6+0, #0x00
	Smain$main$31 ==.
;	main.c: 58: sfr_PORTB.DDR.DDR5 = 1; // input(=0) or output(=1)
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5007.
	bset	0x5007, #5
; peephole 203x replaced 'or' by 'bset' (index register) ('0x5007' -> '0x5007').
	Smain$main$32 ==.
;	main.c: 59: sfr_PORTB.CR1.C15 =
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5008.
	bset	0x5008, #5
; peephole 203x replaced 'or' by 'bset' (index register) ('0x5008' -> '0x5008').
	Smain$main$33 ==.
;	main.c: 61: sfr_PORTB.CR2.C25 =
; genAssign
; genPointerSet
	ld	a, 0x5009
	or	a, #0x20
	ld	0x5009, a
; peephole 330x replaced 'ldw-ld-or-ld' by 'ld-or-ld direct' ('0x5009' -> '0x5009').
	Smain$main$34 ==.
;	main.c: 65: UART_begin(19200);
; genIPush
	push	#0x00
	Smain$main$35 ==.
	push	#0x4b
	Smain$main$36 ==.
	clrw	x
	pushw	x
	Smain$main$37 ==.
; genCall
	call	_UART_begin
	Smain$main$38 ==.
	Smain$main$39 ==.
;	main.c: 68: TIM4_init();
; genCall
	call	_TIM4_init
	Smain$main$40 ==.
;	main.c: 71: ENABLE_INTERRUPTS();
;	genInline
	rim
	Smain$main$41 ==.
	Smain$main$42 ==.
;	main.c: 95: while (1) {
; genLabel
00105$:
	Smain$main$43 ==.
	Smain$main$44 ==.
;	main.c: 96: tEnd = (millis() + 1000);
; genPlus
	ldw	x, _g_millis+2
	addw	x, #0x03e8
	ldw	(0x03, sp), x
	ldw	x, _g_millis+0
	jrnc	00131$
	incw	x
00131$:
	Smain$main$45 ==.
	Smain$main$46 ==.
;	main.c: 99: while (tEnd >= millis()) {
; genAssign
	clrw	y
; genLabel
00101$:
; genCmp
; genCmpTnz
	ld	a, (0x04, sp)
	cp	a, _g_millis+3
	ld	a, (0x03, sp)
	sbc	a, _g_millis+2
	ld	a, xl
	sbc	a, _g_millis+1
	ld	a, xh
	sbc	a, _g_millis+0
; peephole j5 changed absolute to relative unconditional jump.
	jrc	00103$
; peephole j9 removed jra by using inverse jump logic
; peephole j30 removed unused label 00132$.
; skipping generated iCode
	Smain$main$47 ==.
	Smain$main$48 ==.
;	main.c: 100: _CalcPrimes();
; genCall
	pushw	x
	Smain$main$49 ==.
	pushw	y
	Smain$main$50 ==.
	call	__CalcPrimes
	popw	y
	Smain$main$51 ==.
	popw	x
	Smain$main$52 ==.
	Smain$main$53 ==.
;	main.c: 101: Cnt++;
; genPlus
	incw	y
	Smain$main$54 ==.
; genGoto
	jra	00101$
; peephole j5 changed absolute to relative unconditional jump.
; genLabel
00103$:
	Smain$main$55 ==.
;	main.c: 103: printf("CNT = %d \n", Cnt);
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	pushw	y
	Smain$main$56 ==.
; genIPush
	push	#<(___str_0+0)
	Smain$main$57 ==.
	push	#((___str_0+0) >> 8)
	Smain$main$58 ==.
; genCall
	call	_printf
	addw	sp, #4
	Smain$main$59 ==.
	Smain$main$60 ==.
;	main.c: 104: sfr_PORTB.ODR.ODR5 ^= 1;
; genAssign
; genAssign
; genPointerGet
	ldw	x, #0x5005
	ld	a, (x)
; peephole 101 removed use of extra index register (y).
	swap	a
	srl	a
	and	a, #0x01
; genXor
	xor	a, #0x01
; genPointerSet
	swap	a
	sll	a
	and	a, #0x20
	push	a
	Smain$main$61 ==.
	ld	a, (x)
	and	a, #0xdf
	or	a, (1, sp)
	ld	(x), a
	pop	a
	Smain$main$62 ==.
	Smain$main$63 ==.
	Smain$main$64 ==.
;	main.c: 105: tEnd = 0;
; genGoto
	jra	00105$
; peephole j5 changed absolute to relative unconditional jump.
	Smain$main$65 ==.
; genLabel
; peephole j30 removed unused label 00107$.
	Smain$main$66 ==.
;	main.c: 108: } // main
; genEndFunction
	addw	sp, #4
	Smain$main$67 ==.
	Smain$main$68 ==.
	XG$main$0$0 ==.
	ret
	Smain$main$69 ==.
	.area CODE
	.area CONST
Fmain$__str_0$0_0$0 == .
	.area CONST
___str_0:
	.ascii "CNT = %d "
	.db 0x0a
	.db 0x00
	.area CODE
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
	.ascii "main.c"
	.db	0
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.db	0
Ldebug_line_stmt:
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$micros$0)
	.db	3
	.sleb128	90
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$micros$3)
	.db	3
	.sleb128	6
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$micros$4)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$micros$5)
	.db	3
	.sleb128	2
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$micros$6)
	.db	3
	.sleb128	6
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$micros$7)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$micros$8)
	.db	3
	.sleb128	4
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$micros$9)
	.db	3
	.sleb128	4
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$micros$11)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$micros$12)
	.db	3
	.sleb128	2
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$micros$13)
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Smain$micros$15-Smain$micros$13
	.db	0
	.uleb128	1
	.db	1
	.db	4
	.uleb128	2
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$putchar$17)
	.db	3
	.sleb128	33
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$putchar$20)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$putchar$22)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$putchar$23)
	.db	3
	.sleb128	2
	.db	1
	.db	9
	.dw	1+Smain$putchar$24-Smain$putchar$23
	.db	0
	.uleb128	1
	.db	1
	.db	4
	.uleb128	2
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$26)
	.db	3
	.sleb128	46
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$29)
	.db	3
	.sleb128	5
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$30)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$31)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$32)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$33)
	.db	3
	.sleb128	2
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$34)
	.db	3
	.sleb128	4
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$39)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$40)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$42)
	.db	3
	.sleb128	24
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$44)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$46)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$48)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$53)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$55)
	.db	3
	.sleb128	2
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$60)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$64)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Smain$main$66)
	.db	3
	.sleb128	3
	.db	1
	.db	9
	.dw	1+Smain$main$68-Smain$main$66
	.db	0
	.uleb128	1
	.db	1
Ldebug_line_end:

	.area .debug_loc (NOLOAD)
Ldebug_loc_start:
	.dw	0,(Smain$main$67)
	.dw	0,(Smain$main$69)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smain$main$62)
	.dw	0,(Smain$main$67)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smain$main$61)
	.dw	0,(Smain$main$62)
	.dw	2
	.db	120
	.sleb128	6
	.dw	0,(Smain$main$59)
	.dw	0,(Smain$main$61)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smain$main$58)
	.dw	0,(Smain$main$59)
	.dw	2
	.db	120
	.sleb128	9
	.dw	0,(Smain$main$57)
	.dw	0,(Smain$main$58)
	.dw	2
	.db	120
	.sleb128	8
	.dw	0,(Smain$main$56)
	.dw	0,(Smain$main$57)
	.dw	2
	.db	120
	.sleb128	7
	.dw	0,(Smain$main$52)
	.dw	0,(Smain$main$56)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smain$main$51)
	.dw	0,(Smain$main$52)
	.dw	2
	.db	120
	.sleb128	7
	.dw	0,(Smain$main$50)
	.dw	0,(Smain$main$51)
	.dw	2
	.db	120
	.sleb128	9
	.dw	0,(Smain$main$49)
	.dw	0,(Smain$main$50)
	.dw	2
	.db	120
	.sleb128	7
	.dw	0,(Smain$main$38)
	.dw	0,(Smain$main$49)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smain$main$37)
	.dw	0,(Smain$main$38)
	.dw	2
	.db	120
	.sleb128	9
	.dw	0,(Smain$main$36)
	.dw	0,(Smain$main$37)
	.dw	2
	.db	120
	.sleb128	7
	.dw	0,(Smain$main$35)
	.dw	0,(Smain$main$36)
	.dw	2
	.db	120
	.sleb128	6
	.dw	0,(Smain$main$28)
	.dw	0,(Smain$main$35)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Smain$main$27)
	.dw	0,(Smain$main$28)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Smain$putchar$18)
	.dw	0,(Smain$putchar$25)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,0
	.dw	0,0
	.dw	0,(Smain$micros$14)
	.dw	0,(Smain$micros$16)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Smain$micros$10)
	.dw	0,(Smain$micros$14)
	.dw	2
	.db	120
	.sleb128	11
	.dw	0,(Smain$micros$2)
	.dw	0,(Smain$micros$10)
	.dw	2
	.db	120
	.sleb128	11
	.dw	0,(Smain$micros$1)
	.dw	0,(Smain$micros$2)
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
	.uleb128	6
	.uleb128	11
	.db	0
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.uleb128	7
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
	.uleb128	53
	.db	0
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	10
	.uleb128	52
	.db	0
	.uleb128	2
	.uleb128	10
	.uleb128	3
	.uleb128	8
	.uleb128	63
	.uleb128	12
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	11
	.uleb128	38
	.db	0
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	12
	.uleb128	1
	.db	1
	.uleb128	1
	.uleb128	19
	.uleb128	11
	.uleb128	11
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	13
	.uleb128	33
	.db	0
	.uleb128	47
	.uleb128	11
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
	.ascii "main.c"
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
	.dw	0,142
	.ascii "micros"
	.db	0
	.dw	0,(_micros)
	.dw	0,(XFmain$micros$0$0+1)
	.db	0
	.dw	0,(Ldebug_loc_start+232)
	.dw	0,50
	.uleb128	4
	.db	2
	.db	145
	.sleb128	-10
	.ascii "cnt"
	.db	0
	.dw	0,142
	.uleb128	4
	.db	2
	.db	145
	.sleb128	-9
	.ascii "uif"
	.db	0
	.dw	0,142
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
	.dw	0,50
	.uleb128	0
	.uleb128	2
	.ascii "unsigned char"
	.db	0
	.db	1
	.db	8
	.uleb128	2
	.ascii "int"
	.db	0
	.db	2
	.db	5
	.uleb128	3
	.dw	0,223
	.ascii "putchar"
	.db	0
	.dw	0,(_putchar)
	.dw	0,(XG$putchar$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start+212)
	.dw	0,159
	.uleb128	5
	.db	6
	.db	82
	.db	147
	.uleb128	1
	.db	81
	.db	147
	.uleb128	1
	.ascii "data"
	.db	0
	.dw	0,159
	.uleb128	6
	.dw	0,(Smain$putchar$19)
	.dw	0,(Smain$putchar$21)
	.uleb128	0
	.uleb128	7
	.dw	0,343
	.ascii "main"
	.db	0
	.dw	0,(_main)
	.dw	0,(XG$main$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start)
	.uleb128	8
	.dw	0,324
	.dw	0,(Smain$main$41)
	.dw	0,(Smain$main$65)
	.uleb128	8
	.dw	0,282
	.dw	0,(Smain$main$43)
	.dw	0,(Smain$main$63)
	.uleb128	6
	.dw	0,(Smain$main$47)
	.dw	0,(Smain$main$54)
	.uleb128	0
	.uleb128	4
	.db	14
	.db	82
	.db	147
	.uleb128	1
	.db	81
	.db	147
	.uleb128	1
	.db	145
	.sleb128	-2
	.db	147
	.uleb128	1
	.db	145
	.sleb128	-1
	.db	147
	.uleb128	1
	.ascii "tEnd"
	.db	0
	.dw	0,50
	.uleb128	4
	.db	6
	.db	84
	.db	147
	.uleb128	1
	.db	83
	.db	147
	.uleb128	1
	.ascii "Cnt"
	.db	0
	.dw	0,343
	.uleb128	0
	.uleb128	4
	.db	2
	.db	145
	.sleb128	0
	.ascii "nextPrint"
	.db	0
	.dw	0,50
	.uleb128	0
	.uleb128	2
	.ascii "unsigned int"
	.db	0
	.db	2
	.db	7
	.uleb128	9
	.dw	0,142
	.uleb128	10
	.db	5
	.db	3
	.dw	0,(_g_flagMilli)
	.ascii "g_flagMilli"
	.db	0
	.db	1
	.dw	0,359
	.uleb128	9
	.dw	0,50
	.uleb128	10
	.db	5
	.db	3
	.dw	0,(_g_millis)
	.ascii "g_millis"
	.db	0
	.db	1
	.dw	0,388
	.uleb128	10
	.db	5
	.db	3
	.dw	0,(_g_micros)
	.ascii "g_micros"
	.db	0
	.db	1
	.dw	0,388
	.uleb128	11
	.dw	0,142
	.uleb128	12
	.dw	0,453
	.db	11
	.dw	0,435
	.uleb128	13
	.db	10
	.uleb128	0
	.uleb128	4
	.db	5
	.db	3
	.dw	0,(___str_0)
	.ascii "__str_0"
	.db	0
	.dw	0,440
	.uleb128	0
Ldebug_info_end:

	.area .debug_pubnames (NOLOAD)
	.dw	0,Ldebug_pubnames_end-Ldebug_pubnames_start
Ldebug_pubnames_start:
	.dw	2
	.dw	0,(Ldebug_info_start-4)
	.dw	0,4+Ldebug_info_end-Ldebug_info_start
	.dw	0,166
	.ascii "putchar"
	.db	0
	.dw	0,223
	.ascii "main"
	.db	0
	.dw	0,364
	.ascii "g_flagMilli"
	.db	0
	.dw	0,393
	.ascii "g_millis"
	.db	0
	.dw	0,414
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
	.uleb128	2
	.db	137
	.uleb128	1
	.db	0
	.db	0
Ldebug_CIE0_end:
	.dw	0,132
	.dw	0,(Ldebug_CIE0_start-4)
	.dw	0,(Smain$main$27)	;initial loc
	.dw	0,Smain$main$69-Smain$main$27
	.db	1
	.dw	0,(Smain$main$27)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smain$main$28)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smain$main$35)
	.db	14
	.uleb128	7
	.db	1
	.dw	0,(Smain$main$36)
	.db	14
	.uleb128	8
	.db	1
	.dw	0,(Smain$main$37)
	.db	14
	.uleb128	10
	.db	1
	.dw	0,(Smain$main$38)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smain$main$49)
	.db	14
	.uleb128	8
	.db	1
	.dw	0,(Smain$main$50)
	.db	14
	.uleb128	10
	.db	1
	.dw	0,(Smain$main$51)
	.db	14
	.uleb128	8
	.db	1
	.dw	0,(Smain$main$52)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smain$main$56)
	.db	14
	.uleb128	8
	.db	1
	.dw	0,(Smain$main$57)
	.db	14
	.uleb128	9
	.db	1
	.dw	0,(Smain$main$58)
	.db	14
	.uleb128	10
	.db	1
	.dw	0,(Smain$main$59)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smain$main$61)
	.db	14
	.uleb128	7
	.db	1
	.dw	0,(Smain$main$62)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Smain$main$67)
	.db	14
	.uleb128	2
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
	.dw	0,20
	.dw	0,(Ldebug_CIE1_start-4)
	.dw	0,(Smain$putchar$18)	;initial loc
	.dw	0,Smain$putchar$25-Smain$putchar$18
	.db	1
	.dw	0,(Smain$putchar$18)
	.db	14
	.uleb128	2
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
	.dw	0,40
	.dw	0,(Ldebug_CIE2_start-4)
	.dw	0,(Smain$micros$1)	;initial loc
	.dw	0,Smain$micros$16-Smain$micros$1
	.db	1
	.dw	0,(Smain$micros$1)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Smain$micros$2)
	.db	14
	.uleb128	12
	.db	1
	.dw	0,(Smain$micros$10)
	.db	14
	.uleb128	12
	.db	1
	.dw	0,(Smain$micros$14)
	.db	14
	.uleb128	2
