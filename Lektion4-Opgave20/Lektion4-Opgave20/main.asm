;
; Lektion4-Opgaver.asm
;
; Created: 15-03-2018 12:36:26
; Author : Sebastian
;

.INCLUDE "M32ADEF.INC"

.ORG 0x0000

.DEF NUM_HIGH=R17
.DEF NUM_LOW=R16
.DEF DENOMINATOR=R18

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


START:
			LDI NUM_HIGH,0x30
			LDI NUM_LOW,0xF5
			LDI DENOMINATOR,0x8F

			RCALL DIVIDE

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
DIVIDE:
			CLR R23
			CLR R24
			CLR R25

			ADIW R24,1
			SUB R16,R18
			SBC R17,R23
			BRCC DIVIDE
			
			SUBI R24,1
			SBC R25,R23

			ADD R18,R16
			MOV R17,R25
			MOV R16,R24

			RET