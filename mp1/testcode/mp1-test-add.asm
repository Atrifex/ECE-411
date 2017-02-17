;;
;; This program is a  test of ADD
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
	;; R0: 0x0078
	;; R1: 0x0024
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

	;; Testing add with registers
	ADD R1, R1, R0
	ADD R1, R1, R2
	ADD R1, R1, R3
	ADD R1, R1, R4
	ADD R1, R1, R5
	ADD R1, R1, R6
	ADD R1, R1, R7 				;; Make sure R1 = 0x0024

	;; Testing add imm.
	LEA R0, DATA
	LDR R0, R0, ZERO
	ADD R0, R0, 0
	ADD R0, R0, 1
	ADD R0, R0, 2
	ADD R0, R0, 3
	ADD R0, R0, 4
	ADD R0, R0, 5
	ADD R0, R0, 6
	ADD R0, R0, 7
	ADD R0, R0, 8
	ADD R0, R0, 9
	ADD R0, R0, 10
	ADD R0, R0, 11
	ADD R0, R0, 12
	ADD R0, R0, 13
	ADD R0, R0, 14
	ADD R0, R0, 15				;; Make sure R0 = 0x0078


HALT_PROG:
	BRnzp HALT_PROG

SEGMENT
DATA:
ZERO: 	DATA2 4x0000
TVAL_1: DATA2 4x0001
TVAL_2: DATA2 4x0002
TVAL_3: DATA2 4x0003
TVAL_4: DATA2 4x0004
TVAL_5: DATA2 4x0005
TVAL_6: DATA2 4x0006
TVAL_7: DATA2 4x0007
TVAL_8: DATA2 4x0008
