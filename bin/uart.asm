;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module uart
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UART_begin
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
	Suart$UART_begin$0 ==.
;	uart.c: 32: void UART_begin(uint32_t BR) {
; genLabel
;	-----------------------------------------
;	 function UART_begin
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 2 bytes.
_UART_begin:
	Suart$UART_begin$1 ==.
	pushw	x
	Suart$UART_begin$2 ==.
	Suart$UART_begin$3 ==.
;	uart.c: 37: sfr_UART1.CR1.byte = sfr_UART1_CR1_RESET_VALUE;  // enable UART1, 8 data bits, no parity control
; genPointerSet
	mov	0x5234+0, #0x00
	Suart$UART_begin$4 ==.
;	uart.c: 38: sfr_UART1.CR2.byte = sfr_UART1_CR2_RESET_VALUE;  // no interrupts, disable sender/receiver 
; genPointerSet
	mov	0x5235+0, #0x00
	Suart$UART_begin$5 ==.
;	uart.c: 39: sfr_UART1.CR3.byte = sfr_UART1_CR3_RESET_VALUE;  // no LIN support, 1 stop bit, no clock output(?)
; genPointerSet
	mov	0x5236+0, #0x00
	Suart$UART_begin$6 ==.
;	uart.c: 42: val16 = (uint16_t) (((uint32_t) 16000000L)/BR);
; genIPush
	ldw	x, (0x07, sp)
	pushw	x
	Suart$UART_begin$7 ==.
	ldw	x, (0x07, sp)
	pushw	x
	Suart$UART_begin$8 ==.
; genIPush
	push	#0x00
	Suart$UART_begin$9 ==.
	push	#0x24
	Suart$UART_begin$10 ==.
	push	#0xf4
	Suart$UART_begin$11 ==.
	push	#0x00
	Suart$UART_begin$12 ==.
; genCall
	call	__divulong
	addw	sp, #8
	Suart$UART_begin$13 ==.
; genCast
; genAssign
	Suart$UART_begin$14 ==.
;	uart.c: 43: sfr_UART1.BRR2.byte = (uint8_t) (((val16 & 0xF000) >> 8) | (val16 & 0x000F));
; genCast
; genAssign
; peephole 5w replaced exgw-ldw by ldw.
	ldw	y, x
; genAnd
	clr	(0x02, sp)
	ld	a, xh
	and	a, #0xf0
; genGetByte
	ld	(0x02, sp), a
; genCast
; genAssign
	ld	a, yl
; genAnd
	and	a, #0x0f
; genOr
	or	a, (0x02, sp)
; genPointerSet
	ld	0x5233, a
	Suart$UART_begin$15 ==.
;	uart.c: 44: sfr_UART1.BRR1.byte = (uint8_t) ((val16 & 0x0FF0) >> 4);
; genAnd
	ld	a, xl
	and	a, #0xf0
	rlwa	x
; peephole r1 used rlwa.
	and	a, #0x0f
	ld	xh, a
; genRightShiftLiteral
	ld	a, #0x10
	div	x, a
; genCast
; genAssign
	ld	a, xl
; genPointerSet
	ld	0x5232, a
	Suart$UART_begin$16 ==.
;	uart.c: 47: sfr_UART1.CR2.REN  = 1;  // enable receiver
; genAssign
; genPointerSet
; peephole 0w removed dead load into x from #0x5235.
	bset	0x5235, #2
; peephole 203x replaced 'or' by 'bset' (index register) ('0x5235' -> '0x5235').
	Suart$UART_begin$17 ==.
;	uart.c: 48: sfr_UART1.CR2.TEN  = 1;  // enable sender
; genAssign
; genPointerSet
	ld	a, 0x5235
	or	a, #0x08
	ld	0x5235, a
; peephole 330x replaced 'ldw-ld-or-ld' by 'ld-or-ld direct' ('0x5235' -> '0x5235').
; genLabel
; peephole j30 removed unused label 00101$.
	Suart$UART_begin$18 ==.
;	uart.c: 54: } // UART2_begin
; genEndFunction
	ldw	x, (3, sp)
	addw	sp, #8
	Suart$UART_begin$19 ==.
	jp	(x)
	Suart$UART_begin$20 ==.
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
	.ascii "uart.c"
	.db	0
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.db	0
Ldebug_line_stmt:
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Suart$UART_begin$0)
	.db	3
	.sleb128	31
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Suart$UART_begin$3)
	.db	3
	.sleb128	5
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Suart$UART_begin$4)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Suart$UART_begin$5)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Suart$UART_begin$6)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Suart$UART_begin$14)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Suart$UART_begin$15)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Suart$UART_begin$16)
	.db	3
	.sleb128	3
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Suart$UART_begin$17)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Suart$UART_begin$18)
	.db	3
	.sleb128	6
	.db	1
Ldebug_line_end:

	.area .debug_loc (NOLOAD)
Ldebug_loc_start:

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
	.uleb128	3
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
	.uleb128	0

	.area .debug_info (NOLOAD)
	.dw	0,Ldebug_info_end-Ldebug_info_start
Ldebug_info_start:
	.dw	2
	.dw	0,(Ldebug_abbrev)
	.db	4
	.uleb128	1
	.ascii "uart.c"
	.db	0
	.dw	0,(Ldebug_line_start+-4)
	.db	1
	.ascii "SDCC version 4.4.0 #14620"
	.db	0
	.uleb128	2
	.dw	0,101
	.ascii "UART_begin"
	.db	0
	.dw	0,(_UART_begin)
	.db	1
	.uleb128	3
	.db	2
	.db	145
	.sleb128	2
	.ascii "BR"
	.db	0
	.dw	0,101
	.uleb128	4
	.db	6
	.db	84
	.db	147
	.uleb128	1
	.db	83
	.db	147
	.uleb128	1
	.ascii "val16"
	.db	0
	.dw	0,118
	.uleb128	0
	.uleb128	5
	.ascii "unsigned long"
	.db	0
	.db	4
	.db	7
	.uleb128	5
	.ascii "unsigned int"
	.db	0
	.db	2
	.db	7
	.uleb128	0
Ldebug_info_end:

	.area .debug_pubnames (NOLOAD)
	.dw	0,Ldebug_pubnames_end-Ldebug_pubnames_start
Ldebug_pubnames_start:
	.dw	2
	.dw	0,(Ldebug_info_start-4)
	.dw	0,4+Ldebug_info_end-Ldebug_info_start
	.dw	0,50
	.ascii "UART_begin"
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
	.dw	0,88
	.dw	0,(Ldebug_CIE0_start-4)
	.dw	0,(Suart$UART_begin$1)	;initial loc
	.dw	0,Suart$UART_begin$20-Suart$UART_begin$1
	.db	1
	.dw	0,(Suart$UART_begin$1)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Suart$UART_begin$2)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Suart$UART_begin$7)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Suart$UART_begin$8)
	.db	14
	.uleb128	8
	.db	1
	.dw	0,(Suart$UART_begin$9)
	.db	14
	.uleb128	9
	.db	1
	.dw	0,(Suart$UART_begin$10)
	.db	14
	.uleb128	10
	.db	1
	.dw	0,(Suart$UART_begin$11)
	.db	14
	.uleb128	11
	.db	1
	.dw	0,(Suart$UART_begin$12)
	.db	14
	.uleb128	12
	.db	1
	.dw	0,(Suart$UART_begin$13)
	.db	14
	.uleb128	4
	.db	1
	.dw	0,(Suart$UART_begin$19)
	.db	14
	.uleb128	-4
	.db	0
	.db	0
