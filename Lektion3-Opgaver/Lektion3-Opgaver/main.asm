;
; Lektion3-Opgaver.asm
;
; Created: 06-03-2018 13:57:54
; Author : Sebastian
;

.include "m32adef.inc"

.org 0x0000
			RJMP INI

.org 0x002A
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


START:		LDI R16,0xF0
			OUT PORTB,R16

			LDI R16,0xFF
LOOP1:		LDI R17,0xFF
LOOP2:			DEC R17
				NOP
				NOP
				NOP
				NOP
				NOP
				NOP
				BRNE LOOP2
			DEC R16
			BRNE LOOP1

			LDI R16,0x0F
			OUT PORTB,R16

			LDI R16,0xFF
LOOP3:		LDI R17,0xFF
LOOP4:			DEC R17
				NOP
				NOP
				NOP
				NOP
				NOP
				NOP
				BRNE LOOP4
			DEC R16
			BRNE LOOP3

			RJMP START