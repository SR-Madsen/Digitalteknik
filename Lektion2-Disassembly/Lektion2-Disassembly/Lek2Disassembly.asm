;
; Lektion2-Disassembly.asm
;
; Created: 27-02-2018 14:02:55
; Author : Sebastian


.include "m32adef.inc"

.org 0x0000
			rjmp Start

.org 0x002A

Start:		LDI R16,0x20 ;E200
			LDI R17,0x21 ;E201
			ADD R16,R17 ;0F01
			STS 512,R16 ;9300 0200

Loop:		RJMP loop ;CFF - oprindeligt RJMP -1