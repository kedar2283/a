	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x40001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	ALIGN
	AREA SwapSection, CODE   ; Code section
    ENTRY                ; Entry point of the program
	EXPORT Reset_Handler
Reset_Handler
    LDR   R0, =x         ; Load the address of x into R0
    LDR   R1, [R0]       ; Load the value at address x into R1
    LDR   R2, =y         ; Load the address of y into R2
    LDR   R3, [R2]       ; Load the value at address y into R3
    STR   R1, [R2]       ; Store the value of x at the address of y
    STR   R3, [R0]       ; Store the value of y at the address of x
STOP
	B STOP
x DCD 5 ; First 32 bit number
y DCD 10 ; Second 32 bit number 
	END
