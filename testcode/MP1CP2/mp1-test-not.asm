;;
;; This program is a test of NOT
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

	;; Testing NOT
	NOT R0, R0
	NOT R1, R1
	NOT R2, R2
	NOT R3, R3
	NOT R4, R4
	NOT R5, R5
	NOT R6, R6
	NOT R7, R7

HALT_PROG:
	BRnzp HALT_PROG

SEGMENT
DATA:
TVAL_1: DATA2 4x0001
TVAL_2: DATA2 4x0002
TVAL_3: DATA2 4x0003
TVAL_4: DATA2 4x0004
TVAL_5: DATA2 4x0005
TVAL_6: DATA2 4x0006
TVAL_7: DATA2 4x0007
TVAL_8: DATA2 4x0000
