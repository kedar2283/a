	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x40001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	ALIGN
    AREA CodeSection, CODE   ; Code section
    ENTRY                    ; Entry point of the program
	EXPORT Reset_Handler
Reset_Handler
    LDR   R0, =numbers       ; Load the base address of numbers into R0
    LDR   R1, =sum           ; Load the address of sum into R1
    LDR   R2, =count         ; Load the address of count into R2
    LDR   R3, [R2]           ; Load the value of count into R3
    MOV   R4, #0             ; Initialize the running sum to 0
sum_loop
    LDR   R5, [R0], #4       ; Load the next number from the list into R5 and increment R0
    ADD   R4, R4, R5         ; Add the number to the running sum
    SUBS  R3, R3, #1         ; Decrement the count
    BNE   sum_loop           ; If count is not zero, loop again

    STR   R4, [R1]           ; Store the final sum value

    LDR   R2, =count         ; Reload the address of count into R2
    LDR   R3, [R2]           ; Load the value of count into R3
    SDIV  R6, R4, R3         ; Divide the sum by count to get average
    LDR   R7, =avg           ; Load the address of avg into R7
    STR   R6, [R7]           ; Store the average value
STOP
	B STOP
numbers DCD 1, 2, 3, 4 		 ; Define a list of numbers
count   DCD 4                ; Number of elements
sum     DCD 0                ; Initialize sum to 0
avg     DCD 0                ; Initialize average to 0
    END                      ; End of the program
