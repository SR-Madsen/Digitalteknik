.INCLUDE "M32ADEF.INC"

.ORG 0x0000
			RJMP SETUP

.ORG 0x0004
			RJMP INT_1 ;PORTD,3 (INT1)

.ORG 0x002A
; --------------------------------------- SETUP ---------------------------------------
SETUP:		
			;STACK POINTER
			LDI R16,HIGH(RAMEND)
			OUT SPH,R16
			LDI R16,LOW(RAMEND)
			OUT SPL,R16

			;KLARG?R BEN D3 TIL INTERRUPT INPUT
			CBI DDRD,3
			SBI PORTD,3

			;SL? BEN D5 OG D6 TIL OUTPUT. P? BENENE ER LED'ER, DER BRUGES SOM FEEDBACK, N?R EN INTERRUPT REGISTRERES.
			SBI DDRD,5
			SBI DDRD,6

			;SL? INT1 TIL I FALLING-EDGE-MODE (DA DEN KUN SKAL AKTIVERES ?N GANG, N?R MAN F.EKS. K?RER OVER M?LSTREGEN).
			LDI R16,0x80
			OUT GICR,R16
			LDI R17,0x08
			OUT MCUCR,R17

			SEI

;--------- MAIN FUNC -------
			;F?RST AKTIVERES DEN ENE LED. SOM STANDARD ER DEN ALTS? T?NDT

LOOP:		;LOOP FOR AT TESTE, OM EN INTERRUPT ER REGISTRERET
			TST R24
			BRBS SREG_Z,LOOP

			DEC R24

			;HVIS EN INTERRUPT REGISTRERES, SLUKKES DEN ENE LED, OG DEN ANDEN T?NDES.
			LDI R18,0x60
			IN R19,PORTD
			EOR R19,R18
			OUT PORTD,R19

			RJMP LOOP


;--------- INTERRUPT -------
INT_1:
			INC R24 ;FLAG TIL ANVENDELSE I "MAIN"
			RETI