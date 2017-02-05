;;
;; This program is a test of JSR and JSRR.
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
	;; R0: 0
	;; R1: -1
	;; R2: 3
	;; R3: 4
	;; R4: 2
	;; R5: Not Used
	;; R6: Used to store address to load/store/call
	;; R7: Used to store return address
	;;
	;; Make sure that the contents of memory in ModelSim match
	;; the contents of memory in the LC3bSimulator.
	;;

	LEA R6, TVAL_1
	LDB R1, R6, 0			;; load byte: TVAL_1 + 0
	LDB R2, R6, 1			;; load byte: TVAL_1 + 1

	;; Testing JSR
	JSR ADD_FUNC

	LEA R6, TVAL_2
	STB R3, R6, 0 			;; store byte: TVAL_2 + 0

	;; Testing JSRR
	LEA R6, SUB_FUNC
	JSRR R6

	LEA R6, TVAL_2
	STB R4, R6, 1 			;; store byte: TVAL_2 + 1

HALT_PROG:
	BRnzp HALT_PROG

;; input: R1, R2
;; output: R3
ADD_FUNC:
	ADD R3, R2, R1
	RET

;; input: R1, R2
;; output: R4 = R2 - R1
SUB_FUNC:
	;; 2's complement
	NOT R1, R1
	ADD R1, R1, 1

	ADD R4,R2, R1
	RET

SEGMENT
DATA:
TVAL_1: 		DATA2 4x0301 ;; Args for testing STB, LDB, JSR, and JSRR
TVAL_2:  		DATA2 ?
