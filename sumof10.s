	AREA	RESET, DATA, READONLY
	EXPORT __Vectors

__Vectors
	DCD 0x40001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
		
Reset_Handler
	MOV R0, #10
	MOV R1, #1
	MOV R2, #0
	B loop
STOP
	B STOP
loop
   ADD R2, R2, R1
   ADD R1, R1, #1
   SUB R0, R0, #1
   CMP R0, #0
   BNE loop
   
   END