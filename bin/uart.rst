                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module uart
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _UART_begin
                                     12 ;--------------------------------------------------------
                                     13 ; ram data
                                     14 ;--------------------------------------------------------
                                     15 	.area DATA
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area INITIALIZED
                                     20 ;--------------------------------------------------------
                                     21 ; absolute external ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DABS (ABS)
                                     24 
                                     25 ; default segment ordering for linker
                                     26 	.area HOME
                                     27 	.area GSINIT
                                     28 	.area GSFINAL
                                     29 	.area CONST
                                     30 	.area INITIALIZER
                                     31 	.area CODE
                                     32 
                                     33 ;--------------------------------------------------------
                                     34 ; global & static initialisations
                                     35 ;--------------------------------------------------------
                                     36 	.area HOME
                                     37 	.area GSINIT
                                     38 	.area GSFINAL
                                     39 	.area GSINIT
                                     40 ;--------------------------------------------------------
                                     41 ; Home
                                     42 ;--------------------------------------------------------
                                     43 	.area HOME
                                     44 	.area HOME
                                     45 ;--------------------------------------------------------
                                     46 ; code
                                     47 ;--------------------------------------------------------
                                     48 	.area CODE
                           000000    49 	Suart$UART_begin$0 ==.
                                     50 ;	uart.c: 32: void UART_begin(uint32_t BR) {
                                     51 ; genLabel
                                     52 ;	-----------------------------------------
                                     53 ;	 function UART_begin
                                     54 ;	-----------------------------------------
                                     55 ;	Register assignment might be sub-optimal.
                                     56 ;	Stack space usage: 2 bytes.
      008434                         57 _UART_begin:
                           000000    58 	Suart$UART_begin$1 ==.
      008434 89               [ 2]   59 	pushw	x
                           000001    60 	Suart$UART_begin$2 ==.
                           000001    61 	Suart$UART_begin$3 ==.
                                     62 ;	uart.c: 37: sfr_UART1.CR1.byte = sfr_UART1_CR1_RESET_VALUE;  // enable UART1, 8 data bits, no parity control
                                     63 ; genPointerSet
      008435 35 00 52 34      [ 1]   64 	mov	0x5234+0, #0x00
                           000005    65 	Suart$UART_begin$4 ==.
                                     66 ;	uart.c: 38: sfr_UART1.CR2.byte = sfr_UART1_CR2_RESET_VALUE;  // no interrupts, disable sender/receiver 
                                     67 ; genPointerSet
      008439 35 00 52 35      [ 1]   68 	mov	0x5235+0, #0x00
                           000009    69 	Suart$UART_begin$5 ==.
                                     70 ;	uart.c: 39: sfr_UART1.CR3.byte = sfr_UART1_CR3_RESET_VALUE;  // no LIN support, 1 stop bit, no clock output(?)
                                     71 ; genPointerSet
      00843D 35 00 52 36      [ 1]   72 	mov	0x5236+0, #0x00
                           00000D    73 	Suart$UART_begin$6 ==.
                                     74 ;	uart.c: 42: val16 = (uint16_t) (((uint32_t) 16000000L)/BR);
                                     75 ; genIPush
      008441 1E 07            [ 2]   76 	ldw	x, (0x07, sp)
      008443 89               [ 2]   77 	pushw	x
                           000010    78 	Suart$UART_begin$7 ==.
      008444 1E 07            [ 2]   79 	ldw	x, (0x07, sp)
      008446 89               [ 2]   80 	pushw	x
                           000013    81 	Suart$UART_begin$8 ==.
                                     82 ; genIPush
      008447 4B 00            [ 1]   83 	push	#0x00
                           000015    84 	Suart$UART_begin$9 ==.
      008449 4B 24            [ 1]   85 	push	#0x24
                           000017    86 	Suart$UART_begin$10 ==.
      00844B 4B F4            [ 1]   87 	push	#0xf4
                           000019    88 	Suart$UART_begin$11 ==.
      00844D 4B 00            [ 1]   89 	push	#0x00
                           00001B    90 	Suart$UART_begin$12 ==.
                                     91 ; genCall
      00844F CD 84 A2         [ 4]   92 	call	__divulong
      008452 5B 08            [ 2]   93 	addw	sp, #8
                           000020    94 	Suart$UART_begin$13 ==.
                                     95 ; genCast
                                     96 ; genAssign
                           000020    97 	Suart$UART_begin$14 ==.
                                     98 ;	uart.c: 43: sfr_UART1.BRR2.byte = (uint8_t) (((val16 & 0xF000) >> 8) | (val16 & 0x000F));
                                     99 ; genCast
                                    100 ; genAssign
                                    101 ; peephole 5w replaced exgw-ldw by ldw.
      008454 90 93            [ 1]  102 	ldw	y, x
                                    103 ; genAnd
      008456 0F 02            [ 1]  104 	clr	(0x02, sp)
      008458 9E               [ 1]  105 	ld	a, xh
      008459 A4 F0            [ 1]  106 	and	a, #0xf0
                                    107 ; genGetByte
      00845B 6B 02            [ 1]  108 	ld	(0x02, sp), a
                                    109 ; genCast
                                    110 ; genAssign
      00845D 90 9F            [ 1]  111 	ld	a, yl
                                    112 ; genAnd
      00845F A4 0F            [ 1]  113 	and	a, #0x0f
                                    114 ; genOr
      008461 1A 02            [ 1]  115 	or	a, (0x02, sp)
                                    116 ; genPointerSet
      008463 C7 52 33         [ 1]  117 	ld	0x5233, a
                           000032   118 	Suart$UART_begin$15 ==.
                                    119 ;	uart.c: 44: sfr_UART1.BRR1.byte = (uint8_t) ((val16 & 0x0FF0) >> 4);
                                    120 ; genAnd
      008466 9F               [ 1]  121 	ld	a, xl
      008467 A4 F0            [ 1]  122 	and	a, #0xf0
      008469 02               [ 1]  123 	rlwa	x
                                    124 ; peephole r1 used rlwa.
      00846A A4 0F            [ 1]  125 	and	a, #0x0f
      00846C 95               [ 1]  126 	ld	xh, a
                                    127 ; genRightShiftLiteral
      00846D A6 10            [ 1]  128 	ld	a, #0x10
      00846F 62               [ 2]  129 	div	x, a
                                    130 ; genCast
                                    131 ; genAssign
      008470 9F               [ 1]  132 	ld	a, xl
                                    133 ; genPointerSet
      008471 C7 52 32         [ 1]  134 	ld	0x5232, a
                           000040   135 	Suart$UART_begin$16 ==.
                                    136 ;	uart.c: 47: sfr_UART1.CR2.REN  = 1;  // enable receiver
                                    137 ; genAssign
                                    138 ; genPointerSet
                                    139 ; peephole 0w removed dead load into x from #0x5235.
      008474 72 14 52 35      [ 1]  140 	bset	0x5235, #2
                                    141 ; peephole 203x replaced 'or' by 'bset' (index register) ('0x5235' -> '0x5235').
                           000044   142 	Suart$UART_begin$17 ==.
                                    143 ;	uart.c: 48: sfr_UART1.CR2.TEN  = 1;  // enable sender
                                    144 ; genAssign
                                    145 ; genPointerSet
      008478 C6 52 35         [ 1]  146 	ld	a, 0x5235
      00847B AA 08            [ 1]  147 	or	a, #0x08
      00847D C7 52 35         [ 1]  148 	ld	0x5235, a
                                    149 ; peephole 330x replaced 'ldw-ld-or-ld' by 'ld-or-ld direct' ('0x5235' -> '0x5235').
                                    150 ; genLabel
                                    151 ; peephole j30 removed unused label 00101$.
                           00004C   152 	Suart$UART_begin$18 ==.
                                    153 ;	uart.c: 54: } // UART2_begin
                                    154 ; genEndFunction
      008480 1E 03            [ 2]  155 	ldw	x, (3, sp)
      008482 5B 08            [ 2]  156 	addw	sp, #8
                           000050   157 	Suart$UART_begin$19 ==.
      008484 FC               [ 2]  158 	jp	(x)
                           000051   159 	Suart$UART_begin$20 ==.
                                    160 	.area CODE
                                    161 	.area CONST
                                    162 	.area INITIALIZER
                                    163 	.area CABS (ABS)
                                    164 
                                    165 	.area .debug_line (NOLOAD)
      0005D1 00 00 00 FC            166 	.dw	0,Ldebug_line_end-Ldebug_line_start
      0005D5                        167 Ldebug_line_start:
      0005D5 00 02                  168 	.dw	2
      0005D7 00 00 00 92            169 	.dw	0,Ldebug_line_stmt-6-Ldebug_line_start
      0005DB 01                     170 	.db	1
      0005DC 01                     171 	.db	1
      0005DD FB                     172 	.db	-5
      0005DE 0F                     173 	.db	15
      0005DF 0A                     174 	.db	10
      0005E0 00                     175 	.db	0
      0005E1 01                     176 	.db	1
      0005E2 01                     177 	.db	1
      0005E3 01                     178 	.db	1
      0005E4 01                     179 	.db	1
      0005E5 00                     180 	.db	0
      0005E6 00                     181 	.db	0
      0005E7 00                     182 	.db	0
      0005E8 01                     183 	.db	1
      0005E9 2F 75 73 72 2F 62 69   184 	.ascii "/usr/bin/../share/sdcc/include/stm8"
             6E 2F 2E 2E 2F 73 68
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65 2F 73 74 6D 38
      00060C 00                     185 	.db	0
      00060D 2F 75 73 72 2F 73 68   186 	.ascii "/usr/share/sdcc/include/stm8"
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65 2F 73 74 6D 38
      000629 00                     187 	.db	0
      00062A 2F 75 73 72 2F 62 69   188 	.ascii "/usr/bin/../share/sdcc/include"
             6E 2F 2E 2E 2F 73 68
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65
      000648 00                     189 	.db	0
      000649 2F 75 73 72 2F 73 68   190 	.ascii "/usr/share/sdcc/include"
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65
      000660 00                     191 	.db	0
      000661 00                     192 	.db	0
      000662 75 61 72 74 2E 63      193 	.ascii "uart.c"
      000668 00                     194 	.db	0
      000669 00                     195 	.uleb128	0
      00066A 00                     196 	.uleb128	0
      00066B 00                     197 	.uleb128	0
      00066C 00                     198 	.db	0
      00066D                        199 Ldebug_line_stmt:
      00066D 00                     200 	.db	0
      00066E 05                     201 	.uleb128	5
      00066F 02                     202 	.db	2
      000670 00 00 84 34            203 	.dw	0,(Suart$UART_begin$0)
      000674 03                     204 	.db	3
      000675 1F                     205 	.sleb128	31
      000676 01                     206 	.db	1
      000677 00                     207 	.db	0
      000678 05                     208 	.uleb128	5
      000679 02                     209 	.db	2
      00067A 00 00 84 35            210 	.dw	0,(Suart$UART_begin$3)
      00067E 03                     211 	.db	3
      00067F 05                     212 	.sleb128	5
      000680 01                     213 	.db	1
      000681 00                     214 	.db	0
      000682 05                     215 	.uleb128	5
      000683 02                     216 	.db	2
      000684 00 00 84 39            217 	.dw	0,(Suart$UART_begin$4)
      000688 03                     218 	.db	3
      000689 01                     219 	.sleb128	1
      00068A 01                     220 	.db	1
      00068B 00                     221 	.db	0
      00068C 05                     222 	.uleb128	5
      00068D 02                     223 	.db	2
      00068E 00 00 84 3D            224 	.dw	0,(Suart$UART_begin$5)
      000692 03                     225 	.db	3
      000693 01                     226 	.sleb128	1
      000694 01                     227 	.db	1
      000695 00                     228 	.db	0
      000696 05                     229 	.uleb128	5
      000697 02                     230 	.db	2
      000698 00 00 84 41            231 	.dw	0,(Suart$UART_begin$6)
      00069C 03                     232 	.db	3
      00069D 03                     233 	.sleb128	3
      00069E 01                     234 	.db	1
      00069F 00                     235 	.db	0
      0006A0 05                     236 	.uleb128	5
      0006A1 02                     237 	.db	2
      0006A2 00 00 84 54            238 	.dw	0,(Suart$UART_begin$14)
      0006A6 03                     239 	.db	3
      0006A7 01                     240 	.sleb128	1
      0006A8 01                     241 	.db	1
      0006A9 00                     242 	.db	0
      0006AA 05                     243 	.uleb128	5
      0006AB 02                     244 	.db	2
      0006AC 00 00 84 66            245 	.dw	0,(Suart$UART_begin$15)
      0006B0 03                     246 	.db	3
      0006B1 01                     247 	.sleb128	1
      0006B2 01                     248 	.db	1
      0006B3 00                     249 	.db	0
      0006B4 05                     250 	.uleb128	5
      0006B5 02                     251 	.db	2
      0006B6 00 00 84 74            252 	.dw	0,(Suart$UART_begin$16)
      0006BA 03                     253 	.db	3
      0006BB 03                     254 	.sleb128	3
      0006BC 01                     255 	.db	1
      0006BD 00                     256 	.db	0
      0006BE 05                     257 	.uleb128	5
      0006BF 02                     258 	.db	2
      0006C0 00 00 84 78            259 	.dw	0,(Suart$UART_begin$17)
      0006C4 03                     260 	.db	3
      0006C5 01                     261 	.sleb128	1
      0006C6 01                     262 	.db	1
      0006C7 00                     263 	.db	0
      0006C8 05                     264 	.uleb128	5
      0006C9 02                     265 	.db	2
      0006CA 00 00 84 80            266 	.dw	0,(Suart$UART_begin$18)
      0006CE 03                     267 	.db	3
      0006CF 06                     268 	.sleb128	6
      0006D0 01                     269 	.db	1
      0006D1                        270 Ldebug_line_end:
                                    271 
                                    272 	.area .debug_loc (NOLOAD)
      000338                        273 Ldebug_loc_start:
                                    274 
                                    275 	.area .debug_abbrev (NOLOAD)
      000196                        276 Ldebug_abbrev:
      000196 01                     277 	.uleb128	1
      000197 11                     278 	.uleb128	17
      000198 01                     279 	.db	1
      000199 03                     280 	.uleb128	3
      00019A 08                     281 	.uleb128	8
      00019B 10                     282 	.uleb128	16
      00019C 06                     283 	.uleb128	6
      00019D 13                     284 	.uleb128	19
      00019E 0B                     285 	.uleb128	11
      00019F 25                     286 	.uleb128	37
      0001A0 08                     287 	.uleb128	8
      0001A1 00                     288 	.uleb128	0
      0001A2 00                     289 	.uleb128	0
      0001A3 02                     290 	.uleb128	2
      0001A4 2E                     291 	.uleb128	46
      0001A5 01                     292 	.db	1
      0001A6 01                     293 	.uleb128	1
      0001A7 13                     294 	.uleb128	19
      0001A8 03                     295 	.uleb128	3
      0001A9 08                     296 	.uleb128	8
      0001AA 11                     297 	.uleb128	17
      0001AB 01                     298 	.uleb128	1
      0001AC 3F                     299 	.uleb128	63
      0001AD 0C                     300 	.uleb128	12
      0001AE 00                     301 	.uleb128	0
      0001AF 00                     302 	.uleb128	0
      0001B0 03                     303 	.uleb128	3
      0001B1 05                     304 	.uleb128	5
      0001B2 00                     305 	.db	0
      0001B3 02                     306 	.uleb128	2
      0001B4 0A                     307 	.uleb128	10
      0001B5 03                     308 	.uleb128	3
      0001B6 08                     309 	.uleb128	8
      0001B7 49                     310 	.uleb128	73
      0001B8 13                     311 	.uleb128	19
      0001B9 00                     312 	.uleb128	0
      0001BA 00                     313 	.uleb128	0
      0001BB 04                     314 	.uleb128	4
      0001BC 34                     315 	.uleb128	52
      0001BD 00                     316 	.db	0
      0001BE 02                     317 	.uleb128	2
      0001BF 0A                     318 	.uleb128	10
      0001C0 03                     319 	.uleb128	3
      0001C1 08                     320 	.uleb128	8
      0001C2 49                     321 	.uleb128	73
      0001C3 13                     322 	.uleb128	19
      0001C4 00                     323 	.uleb128	0
      0001C5 00                     324 	.uleb128	0
      0001C6 05                     325 	.uleb128	5
      0001C7 24                     326 	.uleb128	36
      0001C8 00                     327 	.db	0
      0001C9 03                     328 	.uleb128	3
      0001CA 08                     329 	.uleb128	8
      0001CB 0B                     330 	.uleb128	11
      0001CC 0B                     331 	.uleb128	11
      0001CD 3E                     332 	.uleb128	62
      0001CE 0B                     333 	.uleb128	11
      0001CF 00                     334 	.uleb128	0
      0001D0 00                     335 	.uleb128	0
      0001D1 00                     336 	.uleb128	0
                                    337 
                                    338 	.area .debug_info (NOLOAD)
      0005A0 00 00 00 83            339 	.dw	0,Ldebug_info_end-Ldebug_info_start
      0005A4                        340 Ldebug_info_start:
      0005A4 00 02                  341 	.dw	2
      0005A6 00 00 01 96            342 	.dw	0,(Ldebug_abbrev)
      0005AA 04                     343 	.db	4
      0005AB 01                     344 	.uleb128	1
      0005AC 75 61 72 74 2E 63      345 	.ascii "uart.c"
      0005B2 00                     346 	.db	0
      0005B3 00 00 05 D1            347 	.dw	0,(Ldebug_line_start+-4)
      0005B7 01                     348 	.db	1
      0005B8 53 44 43 43 20 76 65   349 	.ascii "SDCC version 4.4.0 #14620"
             72 73 69 6F 6E 20 34
             2E 34 2E 30 20 23 31
             34 36 32 30
      0005D1 00                     350 	.db	0
      0005D2 02                     351 	.uleb128	2
      0005D3 00 00 00 65            352 	.dw	0,101
      0005D7 55 41 52 54 5F 62 65   353 	.ascii "UART_begin"
             67 69 6E
      0005E1 00                     354 	.db	0
      0005E2 00 00 84 34            355 	.dw	0,(_UART_begin)
      0005E6 01                     356 	.db	1
      0005E7 03                     357 	.uleb128	3
      0005E8 02                     358 	.db	2
      0005E9 91                     359 	.db	145
      0005EA 02                     360 	.sleb128	2
      0005EB 42 52                  361 	.ascii "BR"
      0005ED 00                     362 	.db	0
      0005EE 00 00 00 65            363 	.dw	0,101
      0005F2 04                     364 	.uleb128	4
      0005F3 06                     365 	.db	6
      0005F4 54                     366 	.db	84
      0005F5 93                     367 	.db	147
      0005F6 01                     368 	.uleb128	1
      0005F7 53                     369 	.db	83
      0005F8 93                     370 	.db	147
      0005F9 01                     371 	.uleb128	1
      0005FA 76 61 6C 31 36         372 	.ascii "val16"
      0005FF 00                     373 	.db	0
      000600 00 00 00 76            374 	.dw	0,118
      000604 00                     375 	.uleb128	0
      000605 05                     376 	.uleb128	5
      000606 75 6E 73 69 67 6E 65   377 	.ascii "unsigned long"
             64 20 6C 6F 6E 67
      000613 00                     378 	.db	0
      000614 04                     379 	.db	4
      000615 07                     380 	.db	7
      000616 05                     381 	.uleb128	5
      000617 75 6E 73 69 67 6E 65   382 	.ascii "unsigned int"
             64 20 69 6E 74
      000623 00                     383 	.db	0
      000624 02                     384 	.db	2
      000625 07                     385 	.db	7
      000626 00                     386 	.uleb128	0
      000627                        387 Ldebug_info_end:
                                    388 
                                    389 	.area .debug_pubnames (NOLOAD)
      0000DE 00 00 00 1D            390 	.dw	0,Ldebug_pubnames_end-Ldebug_pubnames_start
      0000E2                        391 Ldebug_pubnames_start:
      0000E2 00 02                  392 	.dw	2
      0000E4 00 00 05 A0            393 	.dw	0,(Ldebug_info_start-4)
      0000E8 00 00 00 87            394 	.dw	0,4+Ldebug_info_end-Ldebug_info_start
      0000EC 00 00 00 32            395 	.dw	0,50
      0000F0 55 41 52 54 5F 62 65   396 	.ascii "UART_begin"
             67 69 6E
      0000FA 00                     397 	.db	0
      0000FB 00 00 00 00            398 	.dw	0,0
      0000FF                        399 Ldebug_pubnames_end:
                                    400 
                                    401 	.area .debug_frame (NOLOAD)
      000314 00 00                  402 	.dw	0
      000316 00 10                  403 	.dw	Ldebug_CIE0_end-Ldebug_CIE0_start
      000318                        404 Ldebug_CIE0_start:
      000318 FF FF                  405 	.dw	0xffff
      00031A FF FF                  406 	.dw	0xffff
      00031C 01                     407 	.db	1
      00031D 00                     408 	.db	0
      00031E 01                     409 	.uleb128	1
      00031F 7F                     410 	.sleb128	-1
      000320 09                     411 	.db	9
      000321 0C                     412 	.db	12
      000322 08                     413 	.uleb128	8
      000323 02                     414 	.uleb128	2
      000324 89                     415 	.db	137
      000325 01                     416 	.uleb128	1
      000326 00                     417 	.db	0
      000327 00                     418 	.db	0
      000328                        419 Ldebug_CIE0_end:
      000328 00 00 00 58            420 	.dw	0,88
      00032C 00 00 03 14            421 	.dw	0,(Ldebug_CIE0_start-4)
      000330 00 00 84 34            422 	.dw	0,(Suart$UART_begin$1)	;initial loc
      000334 00 00 00 51            423 	.dw	0,Suart$UART_begin$20-Suart$UART_begin$1
      000338 01                     424 	.db	1
      000339 00 00 84 34            425 	.dw	0,(Suart$UART_begin$1)
      00033D 0E                     426 	.db	14
      00033E 02                     427 	.uleb128	2
      00033F 01                     428 	.db	1
      000340 00 00 84 35            429 	.dw	0,(Suart$UART_begin$2)
      000344 0E                     430 	.db	14
      000345 04                     431 	.uleb128	4
      000346 01                     432 	.db	1
      000347 00 00 84 44            433 	.dw	0,(Suart$UART_begin$7)
      00034B 0E                     434 	.db	14
      00034C 06                     435 	.uleb128	6
      00034D 01                     436 	.db	1
      00034E 00 00 84 47            437 	.dw	0,(Suart$UART_begin$8)
      000352 0E                     438 	.db	14
      000353 08                     439 	.uleb128	8
      000354 01                     440 	.db	1
      000355 00 00 84 49            441 	.dw	0,(Suart$UART_begin$9)
      000359 0E                     442 	.db	14
      00035A 09                     443 	.uleb128	9
      00035B 01                     444 	.db	1
      00035C 00 00 84 4B            445 	.dw	0,(Suart$UART_begin$10)
      000360 0E                     446 	.db	14
      000361 0A                     447 	.uleb128	10
      000362 01                     448 	.db	1
      000363 00 00 84 4D            449 	.dw	0,(Suart$UART_begin$11)
      000367 0E                     450 	.db	14
      000368 0B                     451 	.uleb128	11
      000369 01                     452 	.db	1
      00036A 00 00 84 4F            453 	.dw	0,(Suart$UART_begin$12)
      00036E 0E                     454 	.db	14
      00036F 0C                     455 	.uleb128	12
      000370 01                     456 	.db	1
      000371 00 00 84 54            457 	.dw	0,(Suart$UART_begin$13)
      000375 0E                     458 	.db	14
      000376 04                     459 	.uleb128	4
      000377 01                     460 	.db	1
      000378 00 00 84 84            461 	.dw	0,(Suart$UART_begin$19)
      00037C 0E                     462 	.db	14
      00037D FC FF FF FF 0F         463 	.uleb128	-4
      000382 00                     464 	.db	0
      000383 00                     465 	.db	0
