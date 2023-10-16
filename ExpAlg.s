	AREA RESET, DATA, READONLY 	
	EXPORT __Vectors
__Vectors 
	DCD 0x40001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	ALIGN
    AREA CodeSection, CODE       ; Code section
    ENTRY                        ; Entry point of the program
	EXPORT Reset_Handler
Reset_Handler
    LDR R0, =a           ; Load the value of 'a' into R0
    LDR R1, =p           ; Load the value of 'b' into R1
    LDR R2, =c           ; Load the value of 'c' into R2

	LDR R6, [R0]
	LDR R7, [R1]
	LDR R8, [R2]
	
    MUL R3, R6, R6       ; R3 = a * a
    MUL R4, R7, R7       ; R4 = b * b

    ADD R3, R3, R4       ; R3 = a*a + b*b
    ADD R3, R3, R8       ; R3 = a*a + b*b + c

    NOP

a DCD 3                 ; Example value for 'a'. Change this to test with different numbers.
p DCD 4                 ; Example value for 'b'. Change this to test with different numbers.
c DCD 5                 ; Example value for 'c'. Change this to test with different numbers.
    END