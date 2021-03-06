;
; TenSecondCounter.asm
;
; Created: 07-03-2018 16:01:09
; Author : Sebastian
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


START:		LDI R16,0xA0	;NUL
			OUT PORTB,R16
			RCALL DELAY

			LDI R16,0xF3	;ET
			OUT PORTB,R16
			RCALL DELAY

			LDI R16,0x94	;TO
			OUT PORTB,R16
			RCALL DELAY

			LDI R16,0x91	;TRE
			OUT PORTB,R16
			RCALL DELAY

			LDI R16,0xC3	;FIRE
			OUT PORTB,R16
			RCALL DELAY

			LDI R16,0x89	;FEM
			OUT PORTB,R16
			RCALL DELAY

			LDI R16,0x88	;SEKS
			OUT PORTB,R16
			RCALL DELAY

			LDI R16,0xB3	;SYV
			OUT PORTB,R16
			RCALL DELAY

			LDI R16,0x80	;OTTE
			OUT PORTB,R16
			RCALL DELAY

			LDI R16,0x81	;NI
			OUT PORTB,R16
			RCALL DELAY

			RJMP START		;FORFRA


DELAY:		PUSH R16
			
			LDI R16,9
LOOP1:		LDI R17,100
LOOP2:			LDI R18,222
LOOP3:				DEC R18
					NOP
					NOP
					BRNE LOOP3
				DEC R17
				BRNE LOOP2
			DEC R16
			BRNE LOOP1
			
			POP R16
			RET