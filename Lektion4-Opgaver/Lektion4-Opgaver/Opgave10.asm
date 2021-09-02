;
; Lektion4-Opgaver.asm
;
; Created: 15-03-2018 12:36:26
; Author : Sebastian
;

.INCLUDE "M32ADEF.INC"

.ORG 0x0000
			RJMP INI

.ORG 0x002A
INI:		
			;STACK POINTER
			LDI R16,HIGH(RAMEND)
			OUT SPH,R16
			LDI R16,LOW(RAMEND)
			OUT SPL,R16

			;SWITCH SETUP
			LDI R16,0x00
			OUT DDRC,R16
			LDI R16,0xFF
			OUT PORTC,R16

			;LED SETUP
			OUT DDRB,R16
			OUT PORTB,R16

			;KNAP S10 + S11 SETUP
			CBI DDRD,2
			CBI DDRD,6

			SBI PORTD,2
			SBI PORTD,6


START:		;ADDEND 1
			LDI R16,LOW(0x3B8D)
			LDI R17,HIGH(0x3B8D)

			;ADDEND 2
			LDI R18,LOW(0x3CE7)
			LDI R19,HIGH(0x3CE7)

			;CALL SUB-ROUTINE TIL ADDITION
			RCALL SUM16

			;TJEK KNAPPER
			SBIS PIND,6
			RCALL WRITE_HIGH
			SBIS PIND,2
			RCALL WRITE_LOW

			;RESET LED
			LDI R16,0xFF
			OUT PORTB,R16

			RJMP START

; -------------------------- OUTPUT HIGH --------------------------
WRITE_HIGH:
			COM R17
			OUT PORTB,R17

			RJMP START

; -------------------------- OUTPUT LOW --------------------------
WRITE_LOW:
			COM R16
			OUT PORTB,R16

			RJMP START

; -------------------------- SUB-ROUTINE --------------------------
SUM16:		
			ADD R16,R18
			ADC R17,R19

			RET