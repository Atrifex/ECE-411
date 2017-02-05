;;
;; This program is a test of AND
;; In the comments you can find the expected end results for each register.
;; Other end conditions will also be speficied to make sure that success
;; has actually occured.
;;
;; Author: Rishi Thakkar
;; Date: 2/2/2017
;; Assignment: MP1
;;



ORIGIN 0
SEGMENT
CODE:

	;; ************* Expected End Results *************
	;; R0: 0xFFF0
	;; R1: 0x01FF
	;; R2 - R7: Used for many tasks
	;;
	;; To check for correctness, you will need to compare the
	;; register values after every instruction and that the contents
	;; of memory in ModelSim match the contents of memory in the
	;; LC3bSimulator.
	;;

	;; Prepare register values
	LEA R0, DATA
	LDR R1, R0, TVAL_1
	LDR R2, R0, TVAL_2
	LDR R3, R0, TVAL_3
	LDR R4, R0, TVAL_4
	LDR R5, R0, TVAL_5
	LDR R6, R0, TVAL_6
	LDR R7, R0, TVAL_7
	LDR R0, R0, TVAL_8

	;; Testing AND with registers
	AND R1, R1, R2
	AND R1, R1, R3
	AND R1, R1, R4
	AND R1, R1, R5
	AND R1, R1, R6
	AND R1, R1, R7
	AND R1, R1, R0			;; Make sure R1 = 0x01FF

	;; Testing AND imm.
	LEA R0, DATA
	LDR R0, R0, TVAL_1
	AND R0, R0, 15
	AND R0, R0, 7
	AND R0, R0, 3
	AND R0, R0, 1
	AND R0, R0, 0			;; Make sure R0 = 0x0000

HALT_PROG:
	BRnzp HALT_PROG

SEGMENT
DATA:
ZERO: 	DATA2 4x0000
TVAL_1: DATA2 4xFFFF
TVAL_2: DATA2 4x7FFF
TVAL_3: DATA2 4x3FFF
TVAL_4: DATA2 4x1FFF
TVAL_5: DATA2 4x0FFF
TVAL_6: DATA2 4x07FF
TVAL_7: DATA2 4x03FF
TVAL_8: DATA2 4x01FF
