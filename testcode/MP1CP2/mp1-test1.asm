;; 
;; This program is a limited test of LDB, STB, JSR and JSRR. 
;; An all-encompassing test for each instruction will be performed separately in dedicated programs.
;; In the comments you can find the expected end results for each register.
;; Other end conditions will also be speficied to make sure that success has actually occured.
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

	;; Testing LDB
	LEA R6, LDB_TVAL
	LDB R1, R6, 0			;; load byte: LDB_TVAL + 0
	LDB R2, R6, 1			;; load byte: LDB_TVAL + 1
	
	;; Testing JSR
	JSR ADD_FUNC

	;; Testing STB
	LEA R6, STB_TVAL
	STB R3, R6, 0 			;; store byte: STB_TVAL + 0
		
	;; Testing JSRR
	LEA R6, SUB_FUNC
	JSRR R6

	;; Testing STB
	LEA R6, STB_TVAL
	STB R4, R6, 1 			;; store byte: STB_TVAL + 0

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
LDB_TVAL: 		DATA2 4x0301 ;; Args for testing STB, LDB, JSR, and JSRR
STB_TVAL:  		DATA2 ?
