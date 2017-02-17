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
	LDB R1, R0, 0
	LDB R2, R0, 3
	LDB R3, R0, 4
	LDB R4, R0, 7
	LDB R5, R0, 8
	LDB R6, R0, 11
	LDB R7, R0, 12

	;; Testing STB
	STB R1, R0, 1
	STB R2, R0, 2
	STB R3, R0, 5
	STB R4, R0, 6
	STB R5, R0, 9
	STB R6, R0, 10
	STB R7, R0, 13


HALT_PROG:
	BRnzp HALT_PROG

SEGMENT
DATA:
TVAL_1: 		DATA2 4x0001 ;; Args for testing LDB and STB
TVAL_2: 		DATA2 4x0200 ;; Args for testing LDB and STB
TVAL_3: 		DATA2 4x0003 ;; Args for testing LDB and STB
TVAL_4: 		DATA2 4x0400 ;; Args for testing LDB and STB
TVAL_5: 		DATA2 4x0005 ;; Args for testing LDB and STB
TVAL_6: 		DATA2 4x0600 ;; Args for testing LDB and STB
TVAL_7: 		DATA2 4x0007 ;; Args for testing LDB and STB