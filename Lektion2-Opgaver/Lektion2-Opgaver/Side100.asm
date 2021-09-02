;
; Lektion2-Opgaver.asm
;
; Created: 03-03-2018 09:24:00
; Author : Sebastian
;

.include "m32adef.inc"

.org 0x0000
			rjmp Start

.org 0x002A

;Opgave 2.27 a)
Start:		LDI R16,0x11
			STS 0x100,R16
			STS 0x101,R16
			STS 0x102,R16
			STS 0x103,R16
			STS 0x104,R16
			STS 0x105,R16

;Opgave 2.27 b)
			LDS R16,0x100
			ADD R20,R16
			LDS R16,0x101
			ADD R20,R16
			LDS R16,0x102
			ADD R20,R16
			LDS R16,0x103
			ADD R20,R16
			LDS R16,0x104
			ADD R20,R16
			LDS R16,0x105
			ADD R20,R16

;Opgave 2.28
			STS 0x105,R20

;Opgave 2.29 a)
			LDI R16,0x15
			STS 0x67,R16

;Opgave 2.29 b)
			LDS R16,0x67
			LDI R19,0x00
			ADD R19,R16
			ADD R19,R16
			ADD R19,R16
			ADD R19,R16
			ADD R19,R16

;Opgave 2.30
			STS 0x67,R19

End:		rjmp End