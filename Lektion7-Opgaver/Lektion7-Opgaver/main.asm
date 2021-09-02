.INCLUDE "M32ADEF.INC"

.ORG 0x0000
			RJMP INI

.ORG 0x002A
INI:
			LDI R16,HIGH(RAMEND)
			OUT SPH,R16
			LDI R16,LOW(RAMEND)
			OUT SPL,R16

			LDI R16,0xFF
			OUT DDRB,R16
			OUT PORTB,R16

			LDI R16,0
			OUT DDRA,R16

/*
START:
			LDI R16,0xF0
			OUT PORTB,R16

			LDI R16,0x02
			OUT TIFR,R16

			LDI R16,244
			OUT OCR0,R16

			LDI R16,0x0D
			OUT TCCR0,R16

LOOP1:		IN R17,TIFR
			SBRS R17,OCF0
			RJMP LOOP1

			LDI R16,0x0F
			OUT PORTB,R16

			LDI R16,0x02
			OUT TIFR,R16
			
			LDI R16,244
			OUT OCR0,R16

			LDI R16,0x0D
			OUT TCCR0,R16

LOOP2:		IN R17,TIFR
			SBRS R17,OCF0
			RJMP LOOP2

			RJMP START
*/

/*
			LDI R16,0x20
			OUT ADMUX,R16

			LDI R16,0xE4
			OUT ADCSRA,R16

LOOP:		
			SBIS ADCSRA,ADIF
			RJMP LOOP

			SBI ADCSRA,ADIF
			IN R16,ADCH
			COM R16
			OUT PORTB,R16

			RJMP LOOP
*/
