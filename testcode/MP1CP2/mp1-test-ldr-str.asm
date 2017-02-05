;;
;; This program is a test of LDB and STB
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
	;; Testing LDB
	LDB R1, R0, LVAL_1
	LDB R2, R0, LVAL_2
	LDB R3, R0, LVAL_3
	LDB R4, R0, LVAL_4
	LDB R5, R0, LVAL_5
	LDB R6, R0, LVAL_6
	LDB R7, R0, LVAL_7

	;; Testing STB
	STB R1, R0, SVAL_1
	STB R2, R0, SVAL_2
	STB R3, R0, SVAL_3
	STB R4, R0, SVAL_4
	STB R5, R0, SVAL_5
	STB R6, R0, SVAL_6
	STB R7, R0, SVAL_7


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
