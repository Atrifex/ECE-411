ORIGIN 0

;;*************************** Way 0 ***************************
;; This segment is used to test read miss/hit and write hit with with a
;; clean cache line in way 0
SEGMENT 0 TEST1:
DATA2 4x600D
DATA2 4xBAAD
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000

;; This segment is used to test write miss with with a clean and then read
;; hit with a dirty cache line in way 0
SEGMENT 16 TEST2:
DATA2 4xBAAD
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000

;; This segment is used to test read miss with with a dirty cache line in way 0
SEGMENT 16 TEST3:
DATA2 4xCAFE
DATA2 4xBABE
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000

;; This segment is used to test write miss/hit with with a dirty
;; cache line in way 0
SEGMENT 16 TEST4:
DATA2 4xBAAD
DATA2 4xBAAD
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000

;;*************************** Way 1 ***************************
;; This segment is used to test read miss/hit and write hit with with
;; a clean cache line in way 1
SEGMENT 208 TEST5:
DATA2 4x600D
DATA2 4xBAAD
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000

;; This segment is used to test write miss with with a clean and
;; then read hit with a dirty cache line in way 1
SEGMENT 16 TEST6:
DATA2 4xBAAD
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000

;; This segment is used to test read miss with with a dirty cache line in way 1
SEGMENT 16 TEST7:
DATA2 4xCAFE
DATA2 4xBABE
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000

;; This segment is used to test write miss/hit with with a
;; dirty cache line in way 1
SEGMENT 16 TEST8:
DATA2 4xBAAD
DATA2 4xBAAD
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
DATA2 4x0000
