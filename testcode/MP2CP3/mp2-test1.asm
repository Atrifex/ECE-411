ORIGIN 0
SEGMENT CodeSegment:

Start:
    LEA R0, test1
    ADD R1, R1, 6
    STR R1, R0, VAL1

HALT:
    BR HALT

SEGMENT test1:
VAL1: DATA2 ?
