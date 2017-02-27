ORIGIN 0

;; This segment is used to test read miss/hit with with a clean cache line
SEGMENT 0 TEST1:
DATA2 4x06D0
DATA2 4x600D
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000

;; This segment is used to test write miss/hit with with a clean cache line
;; Once the write has occured, we can also test read hit on a dirty cache line
;; once the write has completed
SEGMENT 16 TEST2:
DATA2 ?
DATA2 ?
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000

;; This segment is used to test read miss with with a dirty cache line
SEGMENT 16 TEST3:
DATA2 4xAAEE
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000

;; This segment is used to test write miss/hit with with a dirty cache line
SEGMENT 16 TEST4:
DATA2 ?
DATA2 ?
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
