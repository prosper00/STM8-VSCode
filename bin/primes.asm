;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module primes
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memset
	.globl __CalcPrimes
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
Fprimes$aIsPrime$0_0$0==.
_aIsPrime:
	.ds 990
Fprimes$NumPrimes$0_0$0==.
_NumPrimes:
	.ds 2
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
	Sprimes$_CalcPrimes$0 ==.
;	primes.c: 25: void _CalcPrimes(void) {
; genLabel
;	-----------------------------------------
;	 function _CalcPrimes
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 4 bytes.
__CalcPrimes:
	Sprimes$_CalcPrimes$1 ==.
	sub	sp, #4
	Sprimes$_CalcPrimes$2 ==.
	Sprimes$_CalcPrimes$3 ==.
;	primes.c: 32: memset(aIsPrime, 1, sizeof(aIsPrime));
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	push	#0xde
	Sprimes$_CalcPrimes$4 ==.
	push	#0x03
	Sprimes$_CalcPrimes$5 ==.
; genIPush
	push	#0x01
	Sprimes$_CalcPrimes$6 ==.
	push	#0x00
	Sprimes$_CalcPrimes$7 ==.
; genSend
	ldw	x, #(_aIsPrime+0)
; genCall
	call	_memset
	Sprimes$_CalcPrimes$8 ==.
	Sprimes$_CalcPrimes$9 ==.
;	primes.c: 36: for (i = 4; i < 1000; i += 2) {
; genAssign
	ldw	y, #0x0004
; genLabel
00111$:
	Sprimes$_CalcPrimes$10 ==.
	Sprimes$_CalcPrimes$11 ==.
;	primes.c: 37: aIsPrime[i] = 0; // Cross it out: not a prime
; genPlus
	ldw	x, y
; genPointerSet
; peephole 9a moved addition of offset into clear instruction
	clr	((_aIsPrime+0), x)
	Sprimes$_CalcPrimes$12 ==.
	Sprimes$_CalcPrimes$13 ==.
;	primes.c: 36: for (i = 4; i < 1000; i += 2) {
; genPlus
	addw	y, #0x0002
; genCmp
; genCmpTnz
	cpw	y, #0x03e8
; peephole j5 changed absolute to relative unconditional jump.
	jrc	00111$
; peephole j9 removed jra by using inverse jump logic
; peephole j30 removed unused label 00178$.
; skipping generated iCode
	Sprimes$_CalcPrimes$14 ==.
;	primes.c: 43: for (i = 3; i * i < sizeof(aIsPrime); i++) {
; genAssign
	ldw	x, #0x0003
	ldw	(0x03, sp), x
; genLabel
00113$:
	Sprimes$_CalcPrimes$15 ==.
	Sprimes$_CalcPrimes$16 ==.
;	primes.c: 44: if (aIsPrime[i]) {
; genPlus
	ldw	x, (0x03, sp)
; genPointerGet
; peephole 10b moved addition of offset into storage instruction
; genIfx
	ld	a, (_aIsPrime+0, x)
; peephole 30 removed redundant tnz.
; peephole j5 changed absolute to relative unconditional jump.
	jreq	00114$
; peephole j10 removed jra by using inverse jump logic
; peephole j30 removed unused label 00179$.
	Sprimes$_CalcPrimes$17 ==.
	Sprimes$_CalcPrimes$18 ==.
;	primes.c: 45: j = i * i; // The square of this prime is the first we need to cross out
; genIPush
	ldw	x, (0x03, sp)
	pushw	x
	Sprimes$_CalcPrimes$19 ==.
; genSend
	ldw	x, (0x05, sp)
	Sprimes$_CalcPrimes$20 ==.
;	primes.c: 46: do {
; genCall
	call	__mulint
	Sprimes$_CalcPrimes$21 ==.
	exgw	x, y
	Sprimes$_CalcPrimes$22 ==.
; genLeftShiftLiteral
	ldw	x, (0x03, sp)
	sllw	x
	ldw	(0x01, sp), x
	Sprimes$_CalcPrimes$23 ==.
	Sprimes$_CalcPrimes$23 ==.
; genLabel
00102$:
	Sprimes$_CalcPrimes$24 ==.
;	primes.c: 47: aIsPrime[j] = 0; // Cross it out: not a prime
; genPlus
	ldw	x, y
; genPointerSet
; peephole 9a moved addition of offset into clear instruction
	clr	((_aIsPrime+0), x)
	Sprimes$_CalcPrimes$25 ==.
;	primes.c: 48: j += 2 * i;      // Skip even multiples (only 3*, 5*, 7* etc)
; genPlus
	addw	y, (0x01, sp)
	Sprimes$_CalcPrimes$26 ==.
	Sprimes$_CalcPrimes$27 ==.
;	primes.c: 49: } while (j < sizeof(aIsPrime));
; genCmp
; genCmpTnz
	cpw	y, #0x03de
; peephole j5 changed absolute to relative unconditional jump.
	jrc	00102$
; peephole j9 removed jra by using inverse jump logic
; peephole j30 removed unused label 00180$.
; skipping generated iCode
	Sprimes$_CalcPrimes$28 ==.
; genLabel
00114$:
	Sprimes$_CalcPrimes$29 ==.
	Sprimes$_CalcPrimes$30 ==.
;	primes.c: 43: for (i = 3; i * i < sizeof(aIsPrime); i++) {
; genPlus
	ldw	x, (0x03, sp)
	incw	x
; peephole j30 removed unused label 00181$.
; genIPush
	ldw	(0x03, sp), x
; peephole 4w removed redundant load from (0x03, sp) into x.
	pushw	x
	Sprimes$_CalcPrimes$31 ==.
; genSend
	ldw	x, (0x05, sp)
; genCall
	call	__mulint
	Sprimes$_CalcPrimes$32 ==.
; genCmp
; genCmpTnz
	cpw	x, #0x03de
; peephole j5 changed absolute to relative unconditional jump.
	jrc	00113$
; peephole j9 removed jra by using inverse jump logic
; peephole j30 removed unused label 00182$.
; skipping generated iCode
	Sprimes$_CalcPrimes$33 ==.
;	primes.c: 55: NumPrimes = 0;
; genAssign
	clrw	x
	ldw	_NumPrimes+0, x
	Sprimes$_CalcPrimes$34 ==.
;	primes.c: 56: for (i = 2; i < sizeof(aIsPrime); i++) {
; genAssign
	ldw	y, #0x0002
; genLabel
00115$:
	Sprimes$_CalcPrimes$35 ==.
	Sprimes$_CalcPrimes$36 ==.
;	primes.c: 57: if (aIsPrime[i]) {
; genPlus
	ldw	x, y
; genPointerGet
; peephole 10b moved addition of offset into storage instruction
; genIfx
	ld	a, (_aIsPrime+0, x)
; peephole 30 removed redundant tnz.
; peephole j5 changed absolute to relative unconditional jump.
	jreq	00116$
; peephole j10 removed jra by using inverse jump logic
; peephole j30 removed unused label 00183$.
	Sprimes$_CalcPrimes$37 ==.
	Sprimes$_CalcPrimes$38 ==.
;	primes.c: 58: NumPrimes++;
; genPlus
	ldw	x, _NumPrimes+0
	incw	x
; genAssign
	ldw	_NumPrimes+0, x
	Sprimes$_CalcPrimes$39 ==.
; genLabel
00116$:
	Sprimes$_CalcPrimes$40 ==.
	Sprimes$_CalcPrimes$41 ==.
;	primes.c: 56: for (i = 2; i < sizeof(aIsPrime); i++) {
; genPlus
	incw	y
; genCmp
; genCmpTnz
	cpw	y, #0x03de
; peephole j5 changed absolute to relative unconditional jump.
	jrc	00115$
; peephole j9 removed jra by using inverse jump logic
; peephole j30 removed unused label 00184$.
; skipping generated iCode
; genLabel
; peephole j30 removed unused label 00117$.
	Sprimes$_CalcPrimes$42 ==.
;	primes.c: 61: }
; genEndFunction
	addw	sp, #4
	Sprimes$_CalcPrimes$43 ==.
	Sprimes$_CalcPrimes$44 ==.
	XG$_CalcPrimes$0$0 ==.
	ret
	Sprimes$_CalcPrimes$45 ==.
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
	.ascii "primes.c"
	.db	0
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.db	0
Ldebug_line_stmt:
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$0)
	.db	3
	.sleb128	24
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$3)
	.db	3
	.sleb128	7
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$9)
	.db	3
	.sleb128	4
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$11)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$13)
	.db	3
	.sleb128	-1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$14)
	.db	3
	.sleb128	7
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$16)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$18)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$20)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$24)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$25)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$27)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$30)
	.db	3
	.sleb128	-6
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$33)
	.db	3
	.sleb128	12
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$34)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$36)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$38)
	.db	3
	.sleb128	1
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$41)
	.db	3
	.sleb128	-2
	.db	1
	.db	0
	.uleb128	5
	.db	2
	.dw	0,(Sprimes$_CalcPrimes$42)
	.db	3
	.sleb128	5
	.db	1
	.db	9
	.dw	1+Sprimes$_CalcPrimes$44-Sprimes$_CalcPrimes$42
	.db	0
	.uleb128	1
	.db	1
Ldebug_line_end:

	.area .debug_loc (NOLOAD)
Ldebug_loc_start:
	.dw	0,(Sprimes$_CalcPrimes$43)
	.dw	0,(Sprimes$_CalcPrimes$45)
	.dw	2
	.db	120
	.sleb128	1
	.dw	0,(Sprimes$_CalcPrimes$32)
	.dw	0,(Sprimes$_CalcPrimes$43)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Sprimes$_CalcPrimes$31)
	.dw	0,(Sprimes$_CalcPrimes$32)
	.dw	2
	.db	120
	.sleb128	7
	.dw	0,(Sprimes$_CalcPrimes$21)
	.dw	0,(Sprimes$_CalcPrimes$31)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Sprimes$_CalcPrimes$19)
	.dw	0,(Sprimes$_CalcPrimes$21)
	.dw	2
	.db	120
	.sleb128	7
	.dw	0,(Sprimes$_CalcPrimes$8)
	.dw	0,(Sprimes$_CalcPrimes$19)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Sprimes$_CalcPrimes$7)
	.dw	0,(Sprimes$_CalcPrimes$8)
	.dw	2
	.db	120
	.sleb128	9
	.dw	0,(Sprimes$_CalcPrimes$6)
	.dw	0,(Sprimes$_CalcPrimes$7)
	.dw	2
	.db	120
	.sleb128	8
	.dw	0,(Sprimes$_CalcPrimes$5)
	.dw	0,(Sprimes$_CalcPrimes$6)
	.dw	2
	.db	120
	.sleb128	7
	.dw	0,(Sprimes$_CalcPrimes$4)
	.dw	0,(Sprimes$_CalcPrimes$5)
	.dw	2
	.db	120
	.sleb128	6
	.dw	0,(Sprimes$_CalcPrimes$2)
	.dw	0,(Sprimes$_CalcPrimes$4)
	.dw	2
	.db	120
	.sleb128	5
	.dw	0,(Sprimes$_CalcPrimes$1)
	.dw	0,(Sprimes$_CalcPrimes$2)
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
	.uleb128	3
	.uleb128	11
	.db	0
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.uleb128	4
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
	.uleb128	5
	.uleb128	11
	.db	1
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.uleb128	6
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
	.uleb128	7
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
	.uleb128	8
	.uleb128	1
	.db	1
	.uleb128	1
	.uleb128	19
	.uleb128	11
	.uleb128	5
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	9
	.uleb128	33
	.db	0
	.uleb128	47
	.uleb128	5
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
	.ascii "primes.c"
	.db	0
	.dw	0,(Ldebug_line_start+-4)
	.db	1
	.ascii "SDCC version 4.4.0 #14620"
	.db	0
	.uleb128	2
	.dw	0,176
	.ascii "_CalcPrimes"
	.db	0
	.dw	0,(__CalcPrimes)
	.dw	0,(XG$_CalcPrimes$0$0+1)
	.db	1
	.dw	0,(Ldebug_loc_start)
	.uleb128	3
	.dw	0,(Sprimes$_CalcPrimes$10)
	.dw	0,(Sprimes$_CalcPrimes$12)
	.uleb128	4
	.dw	0,124
	.dw	0,(Sprimes$_CalcPrimes$15)
	.dw	0,(Sprimes$_CalcPrimes$29)
	.uleb128	5
	.dw	0,(Sprimes$_CalcPrimes$23)
	.dw	0,(Sprimes$_CalcPrimes$28)
	.uleb128	3
	.dw	0,(Sprimes$_CalcPrimes$22)
	.dw	0,(Sprimes$_CalcPrimes$23)
	.uleb128	0
	.uleb128	0
	.uleb128	4
	.dw	0,147
	.dw	0,(Sprimes$_CalcPrimes$35)
	.dw	0,(Sprimes$_CalcPrimes$40)
	.uleb128	3
	.dw	0,(Sprimes$_CalcPrimes$37)
	.dw	0,(Sprimes$_CalcPrimes$39)
	.uleb128	0
	.uleb128	6
	.db	6
	.db	84
	.db	147
	.uleb128	1
	.db	83
	.db	147
	.uleb128	1
	.ascii "i"
	.db	0
	.dw	0,176
	.uleb128	6
	.db	6
	.db	84
	.db	147
	.uleb128	1
	.db	83
	.db	147
	.uleb128	1
	.ascii "j"
	.db	0
	.dw	0,176
	.uleb128	0
	.uleb128	7
	.ascii "unsigned int"
	.db	0
	.db	2
	.db	7
	.uleb128	7
	.ascii "unsigned char"
	.db	0
	.db	1
	.db	8
	.uleb128	8
	.dw	0,224
	.dw	990
	.dw	0,192
	.uleb128	9
	.dw	989
	.uleb128	0
	.uleb128	6
	.db	5
	.db	3
	.dw	0,(_aIsPrime)
	.ascii "aIsPrime"
	.db	0
	.dw	0,209
	.uleb128	6
	.db	5
	.db	3
	.dw	0,(_NumPrimes)
	.ascii "NumPrimes"
	.db	0
	.dw	0,176
	.uleb128	0
Ldebug_info_end:

	.area .debug_pubnames (NOLOAD)
	.dw	0,Ldebug_pubnames_end-Ldebug_pubnames_start
Ldebug_pubnames_start:
	.dw	2
	.dw	0,(Ldebug_info_start-4)
	.dw	0,4+Ldebug_info_end-Ldebug_info_start
	.dw	0,52
	.ascii "_CalcPrimes"
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
	.dw	0,96
	.dw	0,(Ldebug_CIE0_start-4)
	.dw	0,(Sprimes$_CalcPrimes$1)	;initial loc
	.dw	0,Sprimes$_CalcPrimes$45-Sprimes$_CalcPrimes$1
	.db	1
	.dw	0,(Sprimes$_CalcPrimes$1)
	.db	14
	.uleb128	2
	.db	1
	.dw	0,(Sprimes$_CalcPrimes$2)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Sprimes$_CalcPrimes$4)
	.db	14
	.uleb128	7
	.db	1
	.dw	0,(Sprimes$_CalcPrimes$5)
	.db	14
	.uleb128	8
	.db	1
	.dw	0,(Sprimes$_CalcPrimes$6)
	.db	14
	.uleb128	9
	.db	1
	.dw	0,(Sprimes$_CalcPrimes$7)
	.db	14
	.uleb128	10
	.db	1
	.dw	0,(Sprimes$_CalcPrimes$8)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Sprimes$_CalcPrimes$19)
	.db	14
	.uleb128	8
	.db	1
	.dw	0,(Sprimes$_CalcPrimes$21)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Sprimes$_CalcPrimes$31)
	.db	14
	.uleb128	8
	.db	1
	.dw	0,(Sprimes$_CalcPrimes$32)
	.db	14
	.uleb128	6
	.db	1
	.dw	0,(Sprimes$_CalcPrimes$43)
	.db	14
	.uleb128	2
