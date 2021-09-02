.INCLUDE "M32ADEF.INC"

.ORG 0x0000
			RJMP SETUP

.ORG 0x0014
			RJMP TIMER0

.ORG 0x002A
; --------------------------------------- SETUP ---------------------------------------
SETUP:		
			;STACK POINTER
			LDI R16,HIGH(RAMEND)
			OUT SPH,R16
			LDI R16,LOW(RAMEND)
			OUT SPL,R16

			;PORTD OUTPUT AND TURN OFF LEDS
			LDI R17,0xFF
			OUT DDRB,R17
			OUT PORTB,R17

			;ENABLE TIMER0 INTERRUPT
			LDI R18,0x02
			OUT TIMSK,R18

; -------------------------------------- TIMER ----------------------------------------
			LDI R17,0x00 ;RESET TIMER
			OUT TCNT0,R17

			LDI R16,249 ;COMPARE AT TCNT0 = 249
			OUT OCR0,R16

			LDI R17,0x0C ;SETUP AS CTC, PRESCALING OF 256 (RESULTING COMPARE MATCH EVERY 4 MS)
			OUT TCCR0,R17

			SEI

			CLR R30
; -------------------------------------- MAIN LOOP -------------------------------------
LOOP:
			TST R31
			BRBS SREG_Z,LOOP
			DEC R31

			INC R30
			COM R30
			OUT PORTB,R30
			COM R30

			RJMP LOOP

; ---------------------------------- TIMER0 INTERRUPT ----------------------------------
TIMER0:		
			INC R31 ;SET TIMER FLAG, THEN RETURN
			RETI