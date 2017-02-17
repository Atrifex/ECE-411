;;
;; This program is a test of BR and JMP
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
	;; R0: 0x600D
	;; R1 - R7: Not used
	;;
	;; To check for correctness, you will need to compare the
	;; register values after every instruction and that the contents
	;; of memory in ModelSim match the contents of memory in the
	;; LC3bSimulator.
	;;
	;;

	;; Prepare register values
	LEA R0, DATA

	LDR R1, R0, TVAL_1
	BRn GOOD1
	BR BAD

GOOD1:
	LDR R1, R0, TVAL_2
	BRp GOOD2
	BR BAD

GOOD2:
	LDR R1, R0, TVAL_3
	BRz JPM_TEST
	BR BAD

JPM_TEST:
	LEA R1, GOOD
	JMP R1

GOOD:
	LDR R0, R0, GOOD_END
	LEA R1, DONE
	JMP R1

BAD:
	LDR R0, R0, BAD_END
	LEA R1, DONE
	JMP R1

DONE:
	BR DONE


SEGMENT
DATA:
ZERO: 	DATA2 4x0000
TVAL_1: DATA2 4xFFFF
TVAL_2: DATA2 4x0005
TVAL_3: DATA2 4x0000
GOOD_END: DATA2	4x600D
BAD_END: DATA2 4xFBAD