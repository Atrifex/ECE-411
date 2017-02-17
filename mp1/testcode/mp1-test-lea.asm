;;
;; This program is a test of LEA
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
	;; R0: 0x0008
	;; R1: 0x0001
	;; R2: 0x0003
	;; R3: 0x0003
	;; R4: 0x0004
	;; R5: 0x0005
	;; R6: 0x0006
	;; R7: 0x0007
	;;
	;; To check for correctness, you will need to compare the
	;; register values after every instruction and that the contents
	;; of memory in ModelSim match the contents of memory in the
	;; LC3bSimulator.
	;;

	;; Testing LEA
	LEA R0, TVAL_1
	LDR R1, R0, 0

	LEA R0, TVAL_2
	LDR R2, R0, 0

	LEA R0, TVAL_3
	LDR R3, R0, 0

	LEA R0, TVAL_4
	LDR R4, R0, 0

	LEA R0, TVAL_5
	LDR R5, R0, 0

	LEA R0, TVAL_6
	LDR R6, R0, 0

	LEA R0, TVAL_7
	LDR R7, R0, 0

	LEA R0, TVAL_8
	LDR R0, R0, 0

HALT_PROG:
	BRnzp HALT_PROG

SEGMENT
TVAL_1: DATA2 4x0001
SEGMENT
TVAL_2: DATA2 4x0002
SEGMENT
TVAL_3: DATA2 4x0003
SEGMENT
TVAL_4: DATA2 4x0004
SEGMENT
TVAL_5: DATA2 4x0005
SEGMENT
TVAL_6: DATA2 4x0006
SEGMENT
TVAL_7: DATA2 4x0007
SEGMENT
TVAL_8: DATA2 4x0008
