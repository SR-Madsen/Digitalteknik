.include "m32adef.inc"

.org 0x0000
			rjmp Start


.org 0x002A

.equ TEMP0=0x60
.equ TEMP1=0x61
.equ TEMP2=0x62
.equ TEMP3=0x63
.equ TEMP4=0x64
.equ TEMP5=0x65

Start:		LDI R16,0x11
			LDI R29,0x00
			STS TEMP0,R16
			STS TEMP1,R16
			STS TEMP2,R16
			STS TEMP3,R16
			STS TEMP4,R16
			STS TEMP5,R16

			LDS R16,TEMP0
			ADD R29,R16
			LDS R16,TEMP1
			ADD R29,R16
			LDS R16,TEMP2
			ADD R29,R16
			LDS R16,TEMP3
			ADD R29,R16
			LDS R16,TEMP4
			ADD R29,R16
			LDS R16,TEMP5
			ADD R29,R16

End:		rjmp End