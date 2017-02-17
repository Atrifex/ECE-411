;;
;; This program is a test of LDR and STR
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
	;; Make sure that the contents of memory in ModelSim match
	;; the contents of memory in the LC3bSimulator.
	;;

	LEA R0, DATA
	;; Testing LDR
	LDR R1, R0, LVAL_1
	LDR R2, R0, LVAL_2
	LDR R3, R0, LVAL_3
	LDR R4, R0, LVAL_4
	LDR R5, R0, LVAL_5
	LDR R6, R0, LVAL_6
	LDR R7, R0, LVAL_7

	;; Testing STR
	STR R1, R0, SVAL_1
	STR R2, R0, SVAL_2
	STR R3, R0, SVAL_3
	STR R4, R0, SVAL_4
	STR R5, R0, SVAL_5
	STR R6, R0, SVAL_6
	STR R7, R0, SVAL_7


HALT_PROG:
	BRnzp HALT_PROG

SEGMENT
DATA:
LVAL_1: 		DATA2 4x0001 ;; Args for testing LDI and STI
LVAL_2: 		DATA2 4x0002 ;; Args for testing LDI and STI
LVAL_3: 		DATA2 4x0003 ;; Args for testing LDI and STI
LVAL_4: 		DATA2 4x0004 ;; Args for testing LDI and STI
LVAL_5: 		DATA2 4x0005 ;; Args for testing LDI and STI
LVAL_6: 		DATA2 4x0006 ;; Args for testing LDI and STI
LVAL_7: 		DATA2 4x0007 ;; Args for testing LDI and STI

SVAL_1: 		DATA2 ? 	 ;; Args for testing LDI and STI
SVAL_2: 		DATA2 ? 	 ;; Args for testing LDI and STI
SVAL_3: 		DATA2 ? 	 ;; Args for testing LDI and STI
SVAL_4: 		DATA2 ? 	 ;; Args for testing LDI and STI
SVAL_5: 		DATA2 ? 	 ;; Args for testing LDI and STI
SVAL_6: 		DATA2 ? 	 ;; Args for testing LDI and STI
SVAL_7: 		DATA2 ? 	 ;; Args for testing LDI and STI
