ORIGIN 4x0000

SEGMENT  CodeSegment:
	;; ********* Register Usage *********
	;; R0 = 0 ; assumed to contain zero at startup
	;; R1 = Input/Accumulator for ouput
	;; R2 = Counter for factorialLoop
	;; R3 = Counter for multLoop
	;; R4 = Intermediate value
	;; R5 = -1
	;; R6 - R7 are unused

	;; Load input and constant data
    LDR R1, R0, INPUT		;; R1 <= Input
	LDR R5, R0, NEG_ONE		;; R4 <= -1
	ADD R2, R1, R5			;; R2 <= Input - 1

FACTORIAL_LOOP:
	;; Check counter variable to see if program needs to continue
	AND R2, R2, R5			;; Sets cc
	BRnz HALT				;; if(R2 <= 0), then factorial has been calculated

	;; Setup up values for MULT_LOOP
	ADD R3, R2, R5			;; R3 <= R2 - 1 
	ADD R4, R1, R0			;; R4 <= R1 ; sets R4 to current total
	MULT_LOOP:
		;; Check counter variable to see if program needs to continue
		AND R3, R3, R5			;; Sets cc
		BRnz MULT_DONE			;; if(R3 <= 0), then factorial has been calculated

		ADD R1, R1, R4 			;; add intermediate value to total

		ADD R3, R3, R5			;; decrement counter
		BRnzp MULT_LOOP

MULT_DONE:
	ADD R2, R2, R5 			;; decrement counter
	BRnzp FACTORIAL_LOOP

HALT:
    BRnzp HALT

INPUT:    DATA2 4x0006		;; Change this variable to modify input into factorial program

;; General Constants
NEG_ONE:  DATA2 4xFFFF		;; used for decrementing a register within the program
