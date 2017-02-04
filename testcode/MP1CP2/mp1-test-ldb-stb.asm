;;
;; This program is a limited test of JSR and JSRR.
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

	LEA R0, DATA
	LDB R1, R0, 0			;; load byte: TVAL_1 + 0
	LDB R2, R0, 3			;; load byte: TVAL_1 + 1

HALT_PROG:
	BRnzp HALT_PROG

SEGMENT
DATA:
TVAL_1: 		DATA2 4x0001 ;; Args for testing LDB and STB
TVAL_2: 		DATA2 4x0002 ;; Args for testing LDB and STB
TVAL_3: 		DATA2 4x0003 ;; Args for testing LDB and STB
TVAL_4: 		DATA2 4x0004 ;; Args for testing LDB and STB
TVAL_5: 		DATA2 4x0005 ;; Args for testing LDB and STB
TVAL_6: 		DATA2 4x0006 ;; Args for testing LDB and STB
TVAL_7: 		DATA2 4x0007 ;; Args for testing LDB and STB
TVAL_8: 		DATA2 4x0008 ;; Args for testing LDB and STB
