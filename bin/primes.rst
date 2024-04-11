                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module primes
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _memset
                                     12 	.globl __CalcPrimes
                                     13 ;--------------------------------------------------------
                                     14 ; ram data
                                     15 ;--------------------------------------------------------
                                     16 	.area DATA
                           000000    17 Fprimes$aIsPrime$0_0$0==.
      00000A                         18 _aIsPrime:
      00000A                         19 	.ds 990
                           0003DE    20 Fprimes$NumPrimes$0_0$0==.
      0003E8                         21 _NumPrimes:
      0003E8                         22 	.ds 2
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area INITIALIZED
                                     27 ;--------------------------------------------------------
                                     28 ; absolute external ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DABS (ABS)
                                     31 
                                     32 ; default segment ordering for linker
                                     33 	.area HOME
                                     34 	.area GSINIT
                                     35 	.area GSFINAL
                                     36 	.area CONST
                                     37 	.area INITIALIZER
                                     38 	.area CODE
                                     39 
                                     40 ;--------------------------------------------------------
                                     41 ; global & static initialisations
                                     42 ;--------------------------------------------------------
                                     43 	.area HOME
                                     44 	.area GSINIT
                                     45 	.area GSFINAL
                                     46 	.area GSINIT
                                     47 ;--------------------------------------------------------
                                     48 ; Home
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area HOME
                                     52 ;--------------------------------------------------------
                                     53 ; code
                                     54 ;--------------------------------------------------------
                                     55 	.area CODE
                           000000    56 	Sprimes$_CalcPrimes$0 ==.
                                     57 ;	primes.c: 25: void _CalcPrimes(void) {
                                     58 ; genLabel
                                     59 ;	-----------------------------------------
                                     60 ;	 function _CalcPrimes
                                     61 ;	-----------------------------------------
                                     62 ;	Register assignment might be sub-optimal.
                                     63 ;	Stack space usage: 4 bytes.
      008176                         64 __CalcPrimes:
                           000000    65 	Sprimes$_CalcPrimes$1 ==.
      008176 52 04            [ 2]   66 	sub	sp, #4
                           000002    67 	Sprimes$_CalcPrimes$2 ==.
                           000002    68 	Sprimes$_CalcPrimes$3 ==.
                                     69 ;	primes.c: 32: memset(aIsPrime, 1, sizeof(aIsPrime));
                                     70 ; skipping iCode since result will be rematerialized
                                     71 ; skipping iCode since result will be rematerialized
                                     72 ; genIPush
      008178 4B DE            [ 1]   73 	push	#0xde
                           000004    74 	Sprimes$_CalcPrimes$4 ==.
      00817A 4B 03            [ 1]   75 	push	#0x03
                           000006    76 	Sprimes$_CalcPrimes$5 ==.
                                     77 ; genIPush
      00817C 4B 01            [ 1]   78 	push	#0x01
                           000008    79 	Sprimes$_CalcPrimes$6 ==.
      00817E 4B 00            [ 1]   80 	push	#0x00
                           00000A    81 	Sprimes$_CalcPrimes$7 ==.
                                     82 ; genSend
      008180 AE 00 0A         [ 2]   83 	ldw	x, #(_aIsPrime+0)
                                     84 ; genCall
      008183 CD 84 FB         [ 4]   85 	call	_memset
                           000010    86 	Sprimes$_CalcPrimes$8 ==.
                           000010    87 	Sprimes$_CalcPrimes$9 ==.
                                     88 ;	primes.c: 36: for (i = 4; i < 1000; i += 2) {
                                     89 ; genAssign
      008186 90 AE 00 04      [ 2]   90 	ldw	y, #0x0004
                                     91 ; genLabel
      00818A                         92 00111$:
                           000014    93 	Sprimes$_CalcPrimes$10 ==.
                           000014    94 	Sprimes$_CalcPrimes$11 ==.
                                     95 ;	primes.c: 37: aIsPrime[i] = 0; // Cross it out: not a prime
                                     96 ; genPlus
      00818A 93               [ 1]   97 	ldw	x, y
                                     98 ; genPointerSet
                                     99 ; peephole 9a moved addition of offset into clear instruction
      00818B 72 4F 00 0A      [ 1]  100 	clr	((_aIsPrime+0), x)
                           000019   101 	Sprimes$_CalcPrimes$12 ==.
                           000019   102 	Sprimes$_CalcPrimes$13 ==.
                                    103 ;	primes.c: 36: for (i = 4; i < 1000; i += 2) {
                                    104 ; genPlus
      00818F 72 A9 00 02      [ 2]  105 	addw	y, #0x0002
                                    106 ; genCmp
                                    107 ; genCmpTnz
      008193 90 A3 03 E8      [ 2]  108 	cpw	y, #0x03e8
                                    109 ; peephole j5 changed absolute to relative unconditional jump.
      008197 25 F1            [ 1]  110 	jrc	00111$
                                    111 ; peephole j9 removed jra by using inverse jump logic
                                    112 ; peephole j30 removed unused label 00178$.
                                    113 ; skipping generated iCode
                           000023   114 	Sprimes$_CalcPrimes$14 ==.
                                    115 ;	primes.c: 43: for (i = 3; i * i < sizeof(aIsPrime); i++) {
                                    116 ; genAssign
      008199 AE 00 03         [ 2]  117 	ldw	x, #0x0003
      00819C 1F 03            [ 2]  118 	ldw	(0x03, sp), x
                                    119 ; genLabel
      00819E                        120 00113$:
                           000028   121 	Sprimes$_CalcPrimes$15 ==.
                           000028   122 	Sprimes$_CalcPrimes$16 ==.
                                    123 ;	primes.c: 44: if (aIsPrime[i]) {
                                    124 ; genPlus
      00819E 1E 03            [ 2]  125 	ldw	x, (0x03, sp)
                                    126 ; genPointerGet
                                    127 ; peephole 10b moved addition of offset into storage instruction
                                    128 ; genIfx
      0081A0 D6 00 0A         [ 1]  129 	ld	a, (_aIsPrime+0, x)
                                    130 ; peephole 30 removed redundant tnz.
                                    131 ; peephole j5 changed absolute to relative unconditional jump.
      0081A3 27 1C            [ 1]  132 	jreq	00114$
                                    133 ; peephole j10 removed jra by using inverse jump logic
                                    134 ; peephole j30 removed unused label 00179$.
                           00002F   135 	Sprimes$_CalcPrimes$17 ==.
                           00002F   136 	Sprimes$_CalcPrimes$18 ==.
                                    137 ;	primes.c: 45: j = i * i; // The square of this prime is the first we need to cross out
                                    138 ; genIPush
      0081A5 1E 03            [ 2]  139 	ldw	x, (0x03, sp)
      0081A7 89               [ 2]  140 	pushw	x
                           000032   141 	Sprimes$_CalcPrimes$19 ==.
                                    142 ; genSend
      0081A8 1E 05            [ 2]  143 	ldw	x, (0x05, sp)
                           000034   144 	Sprimes$_CalcPrimes$20 ==.
                                    145 ;	primes.c: 46: do {
                                    146 ; genCall
      0081AA CD 84 85         [ 4]  147 	call	__mulint
                           000037   148 	Sprimes$_CalcPrimes$21 ==.
      0081AD 51               [ 1]  149 	exgw	x, y
                           000038   150 	Sprimes$_CalcPrimes$22 ==.
                                    151 ; genLeftShiftLiteral
      0081AE 1E 03            [ 2]  152 	ldw	x, (0x03, sp)
      0081B0 58               [ 2]  153 	sllw	x
      0081B1 1F 01            [ 2]  154 	ldw	(0x01, sp), x
                           00003D   155 	Sprimes$_CalcPrimes$23 ==.
                           00003D   156 	Sprimes$_CalcPrimes$23 ==.
                                    157 ; genLabel
      0081B3                        158 00102$:
                           00003D   159 	Sprimes$_CalcPrimes$24 ==.
                                    160 ;	primes.c: 47: aIsPrime[j] = 0; // Cross it out: not a prime
                                    161 ; genPlus
      0081B3 93               [ 1]  162 	ldw	x, y
                                    163 ; genPointerSet
                                    164 ; peephole 9a moved addition of offset into clear instruction
      0081B4 72 4F 00 0A      [ 1]  165 	clr	((_aIsPrime+0), x)
                           000042   166 	Sprimes$_CalcPrimes$25 ==.
                                    167 ;	primes.c: 48: j += 2 * i;      // Skip even multiples (only 3*, 5*, 7* etc)
                                    168 ; genPlus
      0081B8 72 F9 01         [ 2]  169 	addw	y, (0x01, sp)
                           000045   170 	Sprimes$_CalcPrimes$26 ==.
                           000045   171 	Sprimes$_CalcPrimes$27 ==.
                                    172 ;	primes.c: 49: } while (j < sizeof(aIsPrime));
                                    173 ; genCmp
                                    174 ; genCmpTnz
      0081BB 90 A3 03 DE      [ 2]  175 	cpw	y, #0x03de
                                    176 ; peephole j5 changed absolute to relative unconditional jump.
      0081BF 25 F2            [ 1]  177 	jrc	00102$
                                    178 ; peephole j9 removed jra by using inverse jump logic
                                    179 ; peephole j30 removed unused label 00180$.
                                    180 ; skipping generated iCode
                           00004B   181 	Sprimes$_CalcPrimes$28 ==.
                                    182 ; genLabel
      0081C1                        183 00114$:
                           00004B   184 	Sprimes$_CalcPrimes$29 ==.
                           00004B   185 	Sprimes$_CalcPrimes$30 ==.
                                    186 ;	primes.c: 43: for (i = 3; i * i < sizeof(aIsPrime); i++) {
                                    187 ; genPlus
      0081C1 1E 03            [ 2]  188 	ldw	x, (0x03, sp)
      0081C3 5C               [ 1]  189 	incw	x
                                    190 ; peephole j30 removed unused label 00181$.
                                    191 ; genIPush
      0081C4 1F 03            [ 2]  192 	ldw	(0x03, sp), x
                                    193 ; peephole 4w removed redundant load from (0x03, sp) into x.
      0081C6 89               [ 2]  194 	pushw	x
                           000051   195 	Sprimes$_CalcPrimes$31 ==.
                                    196 ; genSend
      0081C7 1E 05            [ 2]  197 	ldw	x, (0x05, sp)
                                    198 ; genCall
      0081C9 CD 84 85         [ 4]  199 	call	__mulint
                           000056   200 	Sprimes$_CalcPrimes$32 ==.
                                    201 ; genCmp
                                    202 ; genCmpTnz
      0081CC A3 03 DE         [ 2]  203 	cpw	x, #0x03de
                                    204 ; peephole j5 changed absolute to relative unconditional jump.
      0081CF 25 CD            [ 1]  205 	jrc	00113$
                                    206 ; peephole j9 removed jra by using inverse jump logic
                                    207 ; peephole j30 removed unused label 00182$.
                                    208 ; skipping generated iCode
                           00005B   209 	Sprimes$_CalcPrimes$33 ==.
                                    210 ;	primes.c: 55: NumPrimes = 0;
                                    211 ; genAssign
      0081D1 5F               [ 1]  212 	clrw	x
      0081D2 CF 03 E8         [ 2]  213 	ldw	_NumPrimes+0, x
                           00005F   214 	Sprimes$_CalcPrimes$34 ==.
                                    215 ;	primes.c: 56: for (i = 2; i < sizeof(aIsPrime); i++) {
                                    216 ; genAssign
      0081D5 90 AE 00 02      [ 2]  217 	ldw	y, #0x0002
                                    218 ; genLabel
      0081D9                        219 00115$:
                           000063   220 	Sprimes$_CalcPrimes$35 ==.
                           000063   221 	Sprimes$_CalcPrimes$36 ==.
                                    222 ;	primes.c: 57: if (aIsPrime[i]) {
                                    223 ; genPlus
      0081D9 93               [ 1]  224 	ldw	x, y
                                    225 ; genPointerGet
                                    226 ; peephole 10b moved addition of offset into storage instruction
                                    227 ; genIfx
      0081DA D6 00 0A         [ 1]  228 	ld	a, (_aIsPrime+0, x)
                                    229 ; peephole 30 removed redundant tnz.
                                    230 ; peephole j5 changed absolute to relative unconditional jump.
      0081DD 27 07            [ 1]  231 	jreq	00116$
                                    232 ; peephole j10 removed jra by using inverse jump logic
                                    233 ; peephole j30 removed unused label 00183$.
                           000069   234 	Sprimes$_CalcPrimes$37 ==.
                           000069   235 	Sprimes$_CalcPrimes$38 ==.
                                    236 ;	primes.c: 58: NumPrimes++;
                                    237 ; genPlus
      0081DF CE 03 E8         [ 2]  238 	ldw	x, _NumPrimes+0
      0081E2 5C               [ 1]  239 	incw	x
                                    240 ; genAssign
      0081E3 CF 03 E8         [ 2]  241 	ldw	_NumPrimes+0, x
                           000070   242 	Sprimes$_CalcPrimes$39 ==.
                                    243 ; genLabel
      0081E6                        244 00116$:
                           000070   245 	Sprimes$_CalcPrimes$40 ==.
                           000070   246 	Sprimes$_CalcPrimes$41 ==.
                                    247 ;	primes.c: 56: for (i = 2; i < sizeof(aIsPrime); i++) {
                                    248 ; genPlus
      0081E6 90 5C            [ 1]  249 	incw	y
                                    250 ; genCmp
                                    251 ; genCmpTnz
      0081E8 90 A3 03 DE      [ 2]  252 	cpw	y, #0x03de
                                    253 ; peephole j5 changed absolute to relative unconditional jump.
      0081EC 25 EB            [ 1]  254 	jrc	00115$
                                    255 ; peephole j9 removed jra by using inverse jump logic
                                    256 ; peephole j30 removed unused label 00184$.
                                    257 ; skipping generated iCode
                                    258 ; genLabel
                                    259 ; peephole j30 removed unused label 00117$.
                           000078   260 	Sprimes$_CalcPrimes$42 ==.
                                    261 ;	primes.c: 61: }
                                    262 ; genEndFunction
      0081EE 5B 04            [ 2]  263 	addw	sp, #4
                           00007A   264 	Sprimes$_CalcPrimes$43 ==.
                           00007A   265 	Sprimes$_CalcPrimes$44 ==.
                           00007A   266 	XG$_CalcPrimes$0$0 ==.
      0081F0 81               [ 4]  267 	ret
                           00007B   268 	Sprimes$_CalcPrimes$45 ==.
                                    269 	.area CODE
                                    270 	.area CONST
                                    271 	.area INITIALIZER
                                    272 	.area CABS (ABS)
                                    273 
                                    274 	.area .debug_line (NOLOAD)
      000209 00 00 01 5E            275 	.dw	0,Ldebug_line_end-Ldebug_line_start
      00020D                        276 Ldebug_line_start:
      00020D 00 02                  277 	.dw	2
      00020F 00 00 00 94            278 	.dw	0,Ldebug_line_stmt-6-Ldebug_line_start
      000213 01                     279 	.db	1
      000214 01                     280 	.db	1
      000215 FB                     281 	.db	-5
      000216 0F                     282 	.db	15
      000217 0A                     283 	.db	10
      000218 00                     284 	.db	0
      000219 01                     285 	.db	1
      00021A 01                     286 	.db	1
      00021B 01                     287 	.db	1
      00021C 01                     288 	.db	1
      00021D 00                     289 	.db	0
      00021E 00                     290 	.db	0
      00021F 00                     291 	.db	0
      000220 01                     292 	.db	1
      000221 2F 75 73 72 2F 62 69   293 	.ascii "/usr/bin/../share/sdcc/include/stm8"
             6E 2F 2E 2E 2F 73 68
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65 2F 73 74 6D 38
      000244 00                     294 	.db	0
      000245 2F 75 73 72 2F 73 68   295 	.ascii "/usr/share/sdcc/include/stm8"
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65 2F 73 74 6D 38
      000261 00                     296 	.db	0
      000262 2F 75 73 72 2F 62 69   297 	.ascii "/usr/bin/../share/sdcc/include"
             6E 2F 2E 2E 2F 73 68
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65
      000280 00                     298 	.db	0
      000281 2F 75 73 72 2F 73 68   299 	.ascii "/usr/share/sdcc/include"
             61 72 65 2F 73 64 63
             63 2F 69 6E 63 6C 75
             64 65
      000298 00                     300 	.db	0
      000299 00                     301 	.db	0
      00029A 70 72 69 6D 65 73 2E   302 	.ascii "primes.c"
             63
      0002A2 00                     303 	.db	0
      0002A3 00                     304 	.uleb128	0
      0002A4 00                     305 	.uleb128	0
      0002A5 00                     306 	.uleb128	0
      0002A6 00                     307 	.db	0
      0002A7                        308 Ldebug_line_stmt:
      0002A7 00                     309 	.db	0
      0002A8 05                     310 	.uleb128	5
      0002A9 02                     311 	.db	2
      0002AA 00 00 81 76            312 	.dw	0,(Sprimes$_CalcPrimes$0)
      0002AE 03                     313 	.db	3
      0002AF 18                     314 	.sleb128	24
      0002B0 01                     315 	.db	1
      0002B1 00                     316 	.db	0
      0002B2 05                     317 	.uleb128	5
      0002B3 02                     318 	.db	2
      0002B4 00 00 81 78            319 	.dw	0,(Sprimes$_CalcPrimes$3)
      0002B8 03                     320 	.db	3
      0002B9 07                     321 	.sleb128	7
      0002BA 01                     322 	.db	1
      0002BB 00                     323 	.db	0
      0002BC 05                     324 	.uleb128	5
      0002BD 02                     325 	.db	2
      0002BE 00 00 81 86            326 	.dw	0,(Sprimes$_CalcPrimes$9)
      0002C2 03                     327 	.db	3
      0002C3 04                     328 	.sleb128	4
      0002C4 01                     329 	.db	1
      0002C5 00                     330 	.db	0
      0002C6 05                     331 	.uleb128	5
      0002C7 02                     332 	.db	2
      0002C8 00 00 81 8A            333 	.dw	0,(Sprimes$_CalcPrimes$11)
      0002CC 03                     334 	.db	3
      0002CD 01                     335 	.sleb128	1
      0002CE 01                     336 	.db	1
      0002CF 00                     337 	.db	0
      0002D0 05                     338 	.uleb128	5
      0002D1 02                     339 	.db	2
      0002D2 00 00 81 8F            340 	.dw	0,(Sprimes$_CalcPrimes$13)
      0002D6 03                     341 	.db	3
      0002D7 7F                     342 	.sleb128	-1
      0002D8 01                     343 	.db	1
      0002D9 00                     344 	.db	0
      0002DA 05                     345 	.uleb128	5
      0002DB 02                     346 	.db	2
      0002DC 00 00 81 99            347 	.dw	0,(Sprimes$_CalcPrimes$14)
      0002E0 03                     348 	.db	3
      0002E1 07                     349 	.sleb128	7
      0002E2 01                     350 	.db	1
      0002E3 00                     351 	.db	0
      0002E4 05                     352 	.uleb128	5
      0002E5 02                     353 	.db	2
      0002E6 00 00 81 9E            354 	.dw	0,(Sprimes$_CalcPrimes$16)
      0002EA 03                     355 	.db	3
      0002EB 01                     356 	.sleb128	1
      0002EC 01                     357 	.db	1
      0002ED 00                     358 	.db	0
      0002EE 05                     359 	.uleb128	5
      0002EF 02                     360 	.db	2
      0002F0 00 00 81 A5            361 	.dw	0,(Sprimes$_CalcPrimes$18)
      0002F4 03                     362 	.db	3
      0002F5 01                     363 	.sleb128	1
      0002F6 01                     364 	.db	1
      0002F7 00                     365 	.db	0
      0002F8 05                     366 	.uleb128	5
      0002F9 02                     367 	.db	2
      0002FA 00 00 81 AA            368 	.dw	0,(Sprimes$_CalcPrimes$20)
      0002FE 03                     369 	.db	3
      0002FF 01                     370 	.sleb128	1
      000300 01                     371 	.db	1
      000301 00                     372 	.db	0
      000302 05                     373 	.uleb128	5
      000303 02                     374 	.db	2
      000304 00 00 81 B3            375 	.dw	0,(Sprimes$_CalcPrimes$24)
      000308 03                     376 	.db	3
      000309 01                     377 	.sleb128	1
      00030A 01                     378 	.db	1
      00030B 00                     379 	.db	0
      00030C 05                     380 	.uleb128	5
      00030D 02                     381 	.db	2
      00030E 00 00 81 B8            382 	.dw	0,(Sprimes$_CalcPrimes$25)
      000312 03                     383 	.db	3
      000313 01                     384 	.sleb128	1
      000314 01                     385 	.db	1
      000315 00                     386 	.db	0
      000316 05                     387 	.uleb128	5
      000317 02                     388 	.db	2
      000318 00 00 81 BB            389 	.dw	0,(Sprimes$_CalcPrimes$27)
      00031C 03                     390 	.db	3
      00031D 01                     391 	.sleb128	1
      00031E 01                     392 	.db	1
      00031F 00                     393 	.db	0
      000320 05                     394 	.uleb128	5
      000321 02                     395 	.db	2
      000322 00 00 81 C1            396 	.dw	0,(Sprimes$_CalcPrimes$30)
      000326 03                     397 	.db	3
      000327 7A                     398 	.sleb128	-6
      000328 01                     399 	.db	1
      000329 00                     400 	.db	0
      00032A 05                     401 	.uleb128	5
      00032B 02                     402 	.db	2
      00032C 00 00 81 D1            403 	.dw	0,(Sprimes$_CalcPrimes$33)
      000330 03                     404 	.db	3
      000331 0C                     405 	.sleb128	12
      000332 01                     406 	.db	1
      000333 00                     407 	.db	0
      000334 05                     408 	.uleb128	5
      000335 02                     409 	.db	2
      000336 00 00 81 D5            410 	.dw	0,(Sprimes$_CalcPrimes$34)
      00033A 03                     411 	.db	3
      00033B 01                     412 	.sleb128	1
      00033C 01                     413 	.db	1
      00033D 00                     414 	.db	0
      00033E 05                     415 	.uleb128	5
      00033F 02                     416 	.db	2
      000340 00 00 81 D9            417 	.dw	0,(Sprimes$_CalcPrimes$36)
      000344 03                     418 	.db	3
      000345 01                     419 	.sleb128	1
      000346 01                     420 	.db	1
      000347 00                     421 	.db	0
      000348 05                     422 	.uleb128	5
      000349 02                     423 	.db	2
      00034A 00 00 81 DF            424 	.dw	0,(Sprimes$_CalcPrimes$38)
      00034E 03                     425 	.db	3
      00034F 01                     426 	.sleb128	1
      000350 01                     427 	.db	1
      000351 00                     428 	.db	0
      000352 05                     429 	.uleb128	5
      000353 02                     430 	.db	2
      000354 00 00 81 E6            431 	.dw	0,(Sprimes$_CalcPrimes$41)
      000358 03                     432 	.db	3
      000359 7E                     433 	.sleb128	-2
      00035A 01                     434 	.db	1
      00035B 00                     435 	.db	0
      00035C 05                     436 	.uleb128	5
      00035D 02                     437 	.db	2
      00035E 00 00 81 EE            438 	.dw	0,(Sprimes$_CalcPrimes$42)
      000362 03                     439 	.db	3
      000363 05                     440 	.sleb128	5
      000364 01                     441 	.db	1
      000365 09                     442 	.db	9
      000366 00 03                  443 	.dw	1+Sprimes$_CalcPrimes$44-Sprimes$_CalcPrimes$42
      000368 00                     444 	.db	0
      000369 01                     445 	.uleb128	1
      00036A 01                     446 	.db	1
      00036B                        447 Ldebug_line_end:
                                    448 
                                    449 	.area .debug_loc (NOLOAD)
      000120                        450 Ldebug_loc_start:
      000120 00 00 81 F0            451 	.dw	0,(Sprimes$_CalcPrimes$43)
      000124 00 00 81 F1            452 	.dw	0,(Sprimes$_CalcPrimes$45)
      000128 00 02                  453 	.dw	2
      00012A 78                     454 	.db	120
      00012B 01                     455 	.sleb128	1
      00012C 00 00 81 CC            456 	.dw	0,(Sprimes$_CalcPrimes$32)
      000130 00 00 81 F0            457 	.dw	0,(Sprimes$_CalcPrimes$43)
      000134 00 02                  458 	.dw	2
      000136 78                     459 	.db	120
      000137 05                     460 	.sleb128	5
      000138 00 00 81 C7            461 	.dw	0,(Sprimes$_CalcPrimes$31)
      00013C 00 00 81 CC            462 	.dw	0,(Sprimes$_CalcPrimes$32)
      000140 00 02                  463 	.dw	2
      000142 78                     464 	.db	120
      000143 07                     465 	.sleb128	7
      000144 00 00 81 AD            466 	.dw	0,(Sprimes$_CalcPrimes$21)
      000148 00 00 81 C7            467 	.dw	0,(Sprimes$_CalcPrimes$31)
      00014C 00 02                  468 	.dw	2
      00014E 78                     469 	.db	120
      00014F 05                     470 	.sleb128	5
      000150 00 00 81 A8            471 	.dw	0,(Sprimes$_CalcPrimes$19)
      000154 00 00 81 AD            472 	.dw	0,(Sprimes$_CalcPrimes$21)
      000158 00 02                  473 	.dw	2
      00015A 78                     474 	.db	120
      00015B 07                     475 	.sleb128	7
      00015C 00 00 81 86            476 	.dw	0,(Sprimes$_CalcPrimes$8)
      000160 00 00 81 A8            477 	.dw	0,(Sprimes$_CalcPrimes$19)
      000164 00 02                  478 	.dw	2
      000166 78                     479 	.db	120
      000167 05                     480 	.sleb128	5
      000168 00 00 81 80            481 	.dw	0,(Sprimes$_CalcPrimes$7)
      00016C 00 00 81 86            482 	.dw	0,(Sprimes$_CalcPrimes$8)
      000170 00 02                  483 	.dw	2
      000172 78                     484 	.db	120
      000173 09                     485 	.sleb128	9
      000174 00 00 81 7E            486 	.dw	0,(Sprimes$_CalcPrimes$6)
      000178 00 00 81 80            487 	.dw	0,(Sprimes$_CalcPrimes$7)
      00017C 00 02                  488 	.dw	2
      00017E 78                     489 	.db	120
      00017F 08                     490 	.sleb128	8
      000180 00 00 81 7C            491 	.dw	0,(Sprimes$_CalcPrimes$5)
      000184 00 00 81 7E            492 	.dw	0,(Sprimes$_CalcPrimes$6)
      000188 00 02                  493 	.dw	2
      00018A 78                     494 	.db	120
      00018B 07                     495 	.sleb128	7
      00018C 00 00 81 7A            496 	.dw	0,(Sprimes$_CalcPrimes$4)
      000190 00 00 81 7C            497 	.dw	0,(Sprimes$_CalcPrimes$5)
      000194 00 02                  498 	.dw	2
      000196 78                     499 	.db	120
      000197 06                     500 	.sleb128	6
      000198 00 00 81 78            501 	.dw	0,(Sprimes$_CalcPrimes$2)
      00019C 00 00 81 7A            502 	.dw	0,(Sprimes$_CalcPrimes$4)
      0001A0 00 02                  503 	.dw	2
      0001A2 78                     504 	.db	120
      0001A3 05                     505 	.sleb128	5
      0001A4 00 00 81 76            506 	.dw	0,(Sprimes$_CalcPrimes$1)
      0001A8 00 00 81 78            507 	.dw	0,(Sprimes$_CalcPrimes$2)
      0001AC 00 02                  508 	.dw	2
      0001AE 78                     509 	.db	120
      0001AF 01                     510 	.sleb128	1
      0001B0 00 00 00 00            511 	.dw	0,0
      0001B4 00 00 00 00            512 	.dw	0,0
                                    513 
                                    514 	.area .debug_abbrev (NOLOAD)
      000094                        515 Ldebug_abbrev:
      000094 01                     516 	.uleb128	1
      000095 11                     517 	.uleb128	17
      000096 01                     518 	.db	1
      000097 03                     519 	.uleb128	3
      000098 08                     520 	.uleb128	8
      000099 10                     521 	.uleb128	16
      00009A 06                     522 	.uleb128	6
      00009B 13                     523 	.uleb128	19
      00009C 0B                     524 	.uleb128	11
      00009D 25                     525 	.uleb128	37
      00009E 08                     526 	.uleb128	8
      00009F 00                     527 	.uleb128	0
      0000A0 00                     528 	.uleb128	0
      0000A1 02                     529 	.uleb128	2
      0000A2 2E                     530 	.uleb128	46
      0000A3 01                     531 	.db	1
      0000A4 01                     532 	.uleb128	1
      0000A5 13                     533 	.uleb128	19
      0000A6 03                     534 	.uleb128	3
      0000A7 08                     535 	.uleb128	8
      0000A8 11                     536 	.uleb128	17
      0000A9 01                     537 	.uleb128	1
      0000AA 12                     538 	.uleb128	18
      0000AB 01                     539 	.uleb128	1
      0000AC 3F                     540 	.uleb128	63
      0000AD 0C                     541 	.uleb128	12
      0000AE 40                     542 	.uleb128	64
      0000AF 06                     543 	.uleb128	6
      0000B0 00                     544 	.uleb128	0
      0000B1 00                     545 	.uleb128	0
      0000B2 03                     546 	.uleb128	3
      0000B3 0B                     547 	.uleb128	11
      0000B4 00                     548 	.db	0
      0000B5 11                     549 	.uleb128	17
      0000B6 01                     550 	.uleb128	1
      0000B7 12                     551 	.uleb128	18
      0000B8 01                     552 	.uleb128	1
      0000B9 00                     553 	.uleb128	0
      0000BA 00                     554 	.uleb128	0
      0000BB 04                     555 	.uleb128	4
      0000BC 0B                     556 	.uleb128	11
      0000BD 01                     557 	.db	1
      0000BE 01                     558 	.uleb128	1
      0000BF 13                     559 	.uleb128	19
      0000C0 11                     560 	.uleb128	17
      0000C1 01                     561 	.uleb128	1
      0000C2 12                     562 	.uleb128	18
      0000C3 01                     563 	.uleb128	1
      0000C4 00                     564 	.uleb128	0
      0000C5 00                     565 	.uleb128	0
      0000C6 05                     566 	.uleb128	5
      0000C7 0B                     567 	.uleb128	11
      0000C8 01                     568 	.db	1
      0000C9 11                     569 	.uleb128	17
      0000CA 01                     570 	.uleb128	1
      0000CB 12                     571 	.uleb128	18
      0000CC 01                     572 	.uleb128	1
      0000CD 00                     573 	.uleb128	0
      0000CE 00                     574 	.uleb128	0
      0000CF 06                     575 	.uleb128	6
      0000D0 34                     576 	.uleb128	52
      0000D1 00                     577 	.db	0
      0000D2 02                     578 	.uleb128	2
      0000D3 0A                     579 	.uleb128	10
      0000D4 03                     580 	.uleb128	3
      0000D5 08                     581 	.uleb128	8
      0000D6 49                     582 	.uleb128	73
      0000D7 13                     583 	.uleb128	19
      0000D8 00                     584 	.uleb128	0
      0000D9 00                     585 	.uleb128	0
      0000DA 07                     586 	.uleb128	7
      0000DB 24                     587 	.uleb128	36
      0000DC 00                     588 	.db	0
      0000DD 03                     589 	.uleb128	3
      0000DE 08                     590 	.uleb128	8
      0000DF 0B                     591 	.uleb128	11
      0000E0 0B                     592 	.uleb128	11
      0000E1 3E                     593 	.uleb128	62
      0000E2 0B                     594 	.uleb128	11
      0000E3 00                     595 	.uleb128	0
      0000E4 00                     596 	.uleb128	0
      0000E5 08                     597 	.uleb128	8
      0000E6 01                     598 	.uleb128	1
      0000E7 01                     599 	.db	1
      0000E8 01                     600 	.uleb128	1
      0000E9 13                     601 	.uleb128	19
      0000EA 0B                     602 	.uleb128	11
      0000EB 05                     603 	.uleb128	5
      0000EC 49                     604 	.uleb128	73
      0000ED 13                     605 	.uleb128	19
      0000EE 00                     606 	.uleb128	0
      0000EF 00                     607 	.uleb128	0
      0000F0 09                     608 	.uleb128	9
      0000F1 21                     609 	.uleb128	33
      0000F2 00                     610 	.db	0
      0000F3 2F                     611 	.uleb128	47
      0000F4 05                     612 	.uleb128	5
      0000F5 00                     613 	.uleb128	0
      0000F6 00                     614 	.uleb128	0
      0000F7 00                     615 	.uleb128	0
                                    616 
                                    617 	.area .debug_info (NOLOAD)
      0001D9 00 00 01 06            618 	.dw	0,Ldebug_info_end-Ldebug_info_start
      0001DD                        619 Ldebug_info_start:
      0001DD 00 02                  620 	.dw	2
      0001DF 00 00 00 94            621 	.dw	0,(Ldebug_abbrev)
      0001E3 04                     622 	.db	4
      0001E4 01                     623 	.uleb128	1
      0001E5 70 72 69 6D 65 73 2E   624 	.ascii "primes.c"
             63
      0001ED 00                     625 	.db	0
      0001EE 00 00 02 09            626 	.dw	0,(Ldebug_line_start+-4)
      0001F2 01                     627 	.db	1
      0001F3 53 44 43 43 20 76 65   628 	.ascii "SDCC version 4.4.0 #14620"
             72 73 69 6F 6E 20 34
             2E 34 2E 30 20 23 31
             34 36 32 30
      00020C 00                     629 	.db	0
      00020D 02                     630 	.uleb128	2
      00020E 00 00 00 B0            631 	.dw	0,176
      000212 5F 43 61 6C 63 50 72   632 	.ascii "_CalcPrimes"
             69 6D 65 73
      00021D 00                     633 	.db	0
      00021E 00 00 81 76            634 	.dw	0,(__CalcPrimes)
      000222 00 00 81 F1            635 	.dw	0,(XG$_CalcPrimes$0$0+1)
      000226 01                     636 	.db	1
      000227 00 00 01 20            637 	.dw	0,(Ldebug_loc_start)
      00022B 03                     638 	.uleb128	3
      00022C 00 00 81 8A            639 	.dw	0,(Sprimes$_CalcPrimes$10)
      000230 00 00 81 8F            640 	.dw	0,(Sprimes$_CalcPrimes$12)
      000234 04                     641 	.uleb128	4
      000235 00 00 00 7C            642 	.dw	0,124
      000239 00 00 81 9E            643 	.dw	0,(Sprimes$_CalcPrimes$15)
      00023D 00 00 81 C1            644 	.dw	0,(Sprimes$_CalcPrimes$29)
      000241 05                     645 	.uleb128	5
      000242 00 00 81 B3            646 	.dw	0,(Sprimes$_CalcPrimes$23)
      000246 00 00 81 C1            647 	.dw	0,(Sprimes$_CalcPrimes$28)
      00024A 03                     648 	.uleb128	3
      00024B 00 00 81 AE            649 	.dw	0,(Sprimes$_CalcPrimes$22)
      00024F 00 00 81 B3            650 	.dw	0,(Sprimes$_CalcPrimes$23)
      000253 00                     651 	.uleb128	0
      000254 00                     652 	.uleb128	0
      000255 04                     653 	.uleb128	4
      000256 00 00 00 93            654 	.dw	0,147
      00025A 00 00 81 D9            655 	.dw	0,(Sprimes$_CalcPrimes$35)
      00025E 00 00 81 E6            656 	.dw	0,(Sprimes$_CalcPrimes$40)
      000262 03                     657 	.uleb128	3
      000263 00 00 81 DF            658 	.dw	0,(Sprimes$_CalcPrimes$37)
      000267 00 00 81 E6            659 	.dw	0,(Sprimes$_CalcPrimes$39)
      00026B 00                     660 	.uleb128	0
      00026C 06                     661 	.uleb128	6
      00026D 06                     662 	.db	6
      00026E 54                     663 	.db	84
      00026F 93                     664 	.db	147
      000270 01                     665 	.uleb128	1
      000271 53                     666 	.db	83
      000272 93                     667 	.db	147
      000273 01                     668 	.uleb128	1
      000274 69                     669 	.ascii "i"
      000275 00                     670 	.db	0
      000276 00 00 00 B0            671 	.dw	0,176
      00027A 06                     672 	.uleb128	6
      00027B 06                     673 	.db	6
      00027C 54                     674 	.db	84
      00027D 93                     675 	.db	147
      00027E 01                     676 	.uleb128	1
      00027F 53                     677 	.db	83
      000280 93                     678 	.db	147
      000281 01                     679 	.uleb128	1
      000282 6A                     680 	.ascii "j"
      000283 00                     681 	.db	0
      000284 00 00 00 B0            682 	.dw	0,176
      000288 00                     683 	.uleb128	0
      000289 07                     684 	.uleb128	7
      00028A 75 6E 73 69 67 6E 65   685 	.ascii "unsigned int"
             64 20 69 6E 74
      000296 00                     686 	.db	0
      000297 02                     687 	.db	2
      000298 07                     688 	.db	7
      000299 07                     689 	.uleb128	7
      00029A 75 6E 73 69 67 6E 65   690 	.ascii "unsigned char"
             64 20 63 68 61 72
      0002A7 00                     691 	.db	0
      0002A8 01                     692 	.db	1
      0002A9 08                     693 	.db	8
      0002AA 08                     694 	.uleb128	8
      0002AB 00 00 00 E0            695 	.dw	0,224
      0002AF 03 DE                  696 	.dw	990
      0002B1 00 00 00 C0            697 	.dw	0,192
      0002B5 09                     698 	.uleb128	9
      0002B6 03 DD                  699 	.dw	989
      0002B8 00                     700 	.uleb128	0
      0002B9 06                     701 	.uleb128	6
      0002BA 05                     702 	.db	5
      0002BB 03                     703 	.db	3
      0002BC 00 00 00 0A            704 	.dw	0,(_aIsPrime)
      0002C0 61 49 73 50 72 69 6D   705 	.ascii "aIsPrime"
             65
      0002C8 00                     706 	.db	0
      0002C9 00 00 00 D1            707 	.dw	0,209
      0002CD 06                     708 	.uleb128	6
      0002CE 05                     709 	.db	5
      0002CF 03                     710 	.db	3
      0002D0 00 00 03 E8            711 	.dw	0,(_NumPrimes)
      0002D4 4E 75 6D 50 72 69 6D   712 	.ascii "NumPrimes"
             65 73
      0002DD 00                     713 	.db	0
      0002DE 00 00 00 B0            714 	.dw	0,176
      0002E2 00                     715 	.uleb128	0
      0002E3                        716 Ldebug_info_end:
                                    717 
                                    718 	.area .debug_pubnames (NOLOAD)
      000051 00 00 00 1E            719 	.dw	0,Ldebug_pubnames_end-Ldebug_pubnames_start
      000055                        720 Ldebug_pubnames_start:
      000055 00 02                  721 	.dw	2
      000057 00 00 01 D9            722 	.dw	0,(Ldebug_info_start-4)
      00005B 00 00 01 0A            723 	.dw	0,4+Ldebug_info_end-Ldebug_info_start
      00005F 00 00 00 34            724 	.dw	0,52
      000063 5F 43 61 6C 63 50 72   725 	.ascii "_CalcPrimes"
             69 6D 65 73
      00006E 00                     726 	.db	0
      00006F 00 00 00 00            727 	.dw	0,0
      000073                        728 Ldebug_pubnames_end:
                                    729 
                                    730 	.area .debug_frame (NOLOAD)
      000108 00 00                  731 	.dw	0
      00010A 00 10                  732 	.dw	Ldebug_CIE0_end-Ldebug_CIE0_start
      00010C                        733 Ldebug_CIE0_start:
      00010C FF FF                  734 	.dw	0xffff
      00010E FF FF                  735 	.dw	0xffff
      000110 01                     736 	.db	1
      000111 00                     737 	.db	0
      000112 01                     738 	.uleb128	1
      000113 7F                     739 	.sleb128	-1
      000114 09                     740 	.db	9
      000115 0C                     741 	.db	12
      000116 08                     742 	.uleb128	8
      000117 02                     743 	.uleb128	2
      000118 89                     744 	.db	137
      000119 01                     745 	.uleb128	1
      00011A 00                     746 	.db	0
      00011B 00                     747 	.db	0
      00011C                        748 Ldebug_CIE0_end:
      00011C 00 00 00 60            749 	.dw	0,96
      000120 00 00 01 08            750 	.dw	0,(Ldebug_CIE0_start-4)
      000124 00 00 81 76            751 	.dw	0,(Sprimes$_CalcPrimes$1)	;initial loc
      000128 00 00 00 7B            752 	.dw	0,Sprimes$_CalcPrimes$45-Sprimes$_CalcPrimes$1
      00012C 01                     753 	.db	1
      00012D 00 00 81 76            754 	.dw	0,(Sprimes$_CalcPrimes$1)
      000131 0E                     755 	.db	14
      000132 02                     756 	.uleb128	2
      000133 01                     757 	.db	1
      000134 00 00 81 78            758 	.dw	0,(Sprimes$_CalcPrimes$2)
      000138 0E                     759 	.db	14
      000139 06                     760 	.uleb128	6
      00013A 01                     761 	.db	1
      00013B 00 00 81 7A            762 	.dw	0,(Sprimes$_CalcPrimes$4)
      00013F 0E                     763 	.db	14
      000140 07                     764 	.uleb128	7
      000141 01                     765 	.db	1
      000142 00 00 81 7C            766 	.dw	0,(Sprimes$_CalcPrimes$5)
      000146 0E                     767 	.db	14
      000147 08                     768 	.uleb128	8
      000148 01                     769 	.db	1
      000149 00 00 81 7E            770 	.dw	0,(Sprimes$_CalcPrimes$6)
      00014D 0E                     771 	.db	14
      00014E 09                     772 	.uleb128	9
      00014F 01                     773 	.db	1
      000150 00 00 81 80            774 	.dw	0,(Sprimes$_CalcPrimes$7)
      000154 0E                     775 	.db	14
      000155 0A                     776 	.uleb128	10
      000156 01                     777 	.db	1
      000157 00 00 81 86            778 	.dw	0,(Sprimes$_CalcPrimes$8)
      00015B 0E                     779 	.db	14
      00015C 06                     780 	.uleb128	6
      00015D 01                     781 	.db	1
      00015E 00 00 81 A8            782 	.dw	0,(Sprimes$_CalcPrimes$19)
      000162 0E                     783 	.db	14
      000163 08                     784 	.uleb128	8
      000164 01                     785 	.db	1
      000165 00 00 81 AD            786 	.dw	0,(Sprimes$_CalcPrimes$21)
      000169 0E                     787 	.db	14
      00016A 06                     788 	.uleb128	6
      00016B 01                     789 	.db	1
      00016C 00 00 81 C7            790 	.dw	0,(Sprimes$_CalcPrimes$31)
      000170 0E                     791 	.db	14
      000171 08                     792 	.uleb128	8
      000172 01                     793 	.db	1
      000173 00 00 81 CC            794 	.dw	0,(Sprimes$_CalcPrimes$32)
      000177 0E                     795 	.db	14
      000178 06                     796 	.uleb128	6
      000179 01                     797 	.db	1
      00017A 00 00 81 F0            798 	.dw	0,(Sprimes$_CalcPrimes$43)
      00017E 0E                     799 	.db	14
      00017F 02                     800 	.uleb128	2
