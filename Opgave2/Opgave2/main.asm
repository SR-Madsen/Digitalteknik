;
; Opgave2.asm

; Author: Sebastian
;

.INCLUDE "M32ADEF.INC"

.ORG 0x0000
			RJMP INI

.ORG 0x002A
INI:		LDI R16,HIGH(RAMEND)
			OUT SPH,R16
			LDI R16,LOW(RAMEND)
			OUT SPL,R16
						
			LDI R16,0x00
			OUT DDRC,R16
			LDI R16,0xFF
			OUT PORTC,R16

			OUT DDRB,R16
			OUT PORTB,R16


START:		IN R16,PINC
			CPI R16,0xFF
			BREQ CASE0

			CPI R16,0xFE
			BREQ CASE1

			CPI R16,0xFD
			BREQ CASE2

			CPI R16,0xFB
			BREQ CASE3

			CPI R16,0xF7
			BREQ CASE4

			CPI R16,0xEF
			BREQ CASE5

			CPI R16,0xDF
			BREQ CASE6

			CPI R16,0xBF
			BREQ CASE7

			CPI R16,0x7F
			BREQ CASE8

			BRNE CASEE


CASE0:
			LDI R17,0xA0
			OUT PORTB,R17

			RJMP START


CASE1:
			LDI R17,0xF3
			OUT PORTB,R17
			
			RJMP START


CASE2:
			LDI R17,0x94
			OUT PORTB,R17
			
			RJMP START


CASE3:
			LDI R17,0x91
			OUT PORTB,R17
			
			RJMP START


CASE4:
			LDI R17,0xC3
			OUT PORTB,R17
			
			RJMP START


CASE5:
			LDI R17,0x89
			OUT PORTB,R17
			
			RJMP START


CASE6:
			LDI R17,0x88
			OUT PORTB,R17
			
			RJMP START


CASE7:
			LDI R17,0xB3
			OUT PORTB,R17
			
			RJMP START


CASE8:
			LDI R17,0x80
			OUT PORTB,R17

			RJMP START


CASEE:
			LDI R17,0x8C
			OUT PORTB,R17
			
			RJMP START