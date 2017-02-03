;; 
;; This program is a limited test of SHF
;; An all-encompassing test for this instruction will be performed separately in dedicated programs.
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
	;; R0: 0x10
	;; R1: 0x4
	;; R2: 0x1
	;; R3: 0xFFFF
	;; R4 - R7: Not Used
	;;
	;; Make sure that the contents of memory in ModelSim match
	;; the contents of memory in the LC3bSimulator.
	;;

	LEA R0, DATA

	;; Testing LSHF
	LDR R1, R0, LSHF_TVAL
	LSHF R1, R1, 2			;; R1 <- 0x4 (0x0001 << 2)

	;; Testing RSHFL
	LDR R2, R0, RSHFL_TVAL
	RSHFL R2, R2, 15		;; R2 <- 0x1 (0xFFFF >> 15)

	;; Testing RSHFA
	LDR R3, R0, RSHFA_TVAL
	RSHFA R3, R3, 15		;; R3 <- 0xFFFF (0x8000 >> 15)

HALT_PROG:
	BRnzp HALT_PROG

SEGMENT
DATA:
LSHF_TVAL:		DATA2 4x0001 ;; Arg for testing LSHF
RSHFL_TVAL: 	DATA2 4xFFFF ;; Arg for testing RSHFL
RSHFA_TVAL: 	DATA2 4x8000 ;; Arg for testing RSHFA
