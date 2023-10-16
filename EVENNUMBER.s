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
start
    LDR R0, =number      ; Load the address of 'number' into R0
    LDR R1, [R0]        ; Load the value at address in R0 (i.e., 'number') into R1
    AND R2, R1, #1       ; Perform bitwise AND operation with 1. If the number is even, the result will be 0.
    CMP R2, #0          ; Compare R2 with 0
    BEQ even            ; If R2 is 0 (i.e., number is even), branch to 'even' label
    BNE odd             ; If R2 is not 0 (i.e., number is odd), branch to 'odd' label

even
    ; Code to handle even number (e.g., set a flag, print a message, etc.)
    B stop
odd
    ; Code to handle odd number (e.g., set a flag, print a message, etc.)
	B stop
stop
    ; End of program or loop back to start, based on requirement
number DCD 10           ; Example number to check. Change this value to test with different numbers.
    END