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
    LDR R0, =string      ; Load the base address of 'string' into R0
    MOV R1, #0           ; Initialize R1 to 0. R1 will store the length of the string.

loop
    LDRB R2, [R0, R1]   ; Load the byte (character) at address (R0 + R1) into R2
    CMP R2, #0          ; Compare the loaded byte with null terminator (0)
    BEQ done            ; If byte is null terminator, branch to 'done' label
    ADD R1, R1, #1      ; Increment R1 (length counter)
    B loop              ; Repeat the loop

done
    ; At this point, R1 contains the length of the string.
    ; You can add code here to display the length or use it in further operations.

stop
    ; End of program or loop back to start, based on requirement
	B stop
string DCB "Hello, ARM!", 0   ; Example string to find the length. The string is null-terminated.

    END
