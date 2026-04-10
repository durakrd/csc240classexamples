#lang scheme

(define ex1 '(1 2 (3 (4 5)) 6))

(car ex1)

(cadr ex1)

(caaddr ex1)

(caadr (caddr ex1))

(cadr (cadr (caddr ex1)))

(cadddr ex1)

;; Skipping this one
(define ex2 '(a b (c d e) (f (g (h) i) (j k)) l (m n o (p q) r) s))
