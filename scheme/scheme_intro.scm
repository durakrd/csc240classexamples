#lang scheme
(+ 1 (* 3 10) 5)

(define a 1)
(define b 2)
(define c 3)
(+ a b c)

(define act1lst '(a b c d e))
(car (cdr act1lst))

(define addtwo
  (lambda (x)
    (+ x 2)))
(addtwo 6)

(define x 10)
(define y 'test)
(define z "string")

(+ 4 (* 3 6))
(* 7 (- 5 2))
(+ -6 (/ 15 3))

(define list3A '(X 1 2 3 4 5))
(car list3A)

(define list3B '(1 X 2 3 4 5))
(car (cdr list3B))

(define list3C '((1 X 2 3 4 5)))
(car (cdr (car list3C)))

(define list3D '((1 2) (3 X 4) 5))
(car (cdr (car (cdr list3D))))

(define prac1-5
  (lambda (x)
    (+ (* x x) (* 2 x) 3)))
(prac1-5 2)

(define fib
  (lambda (n)
    (if (<= n 0) 0
        (if (= n 1) 1
        (+ (fib (- n 1)) (fib (- n 2)))))))
(fib 4)
(fib 7)

(define quad
  (lambda (x)
    (* 4 x)))
(quad 4)

(define bloop
  (lambda (x)
    (if (>= x 0) (* 2 x)
        (/ x 2))))
(bloop 3)
(bloop -4)

(define mult
  (lambda (x y)
    (* x y)))
(mult 4 5)

(define bigger
  (lambda (x y)
    (if (> x y) x
        y)))
(bigger 10 7)

(define absol
  (lambda (x)
    (if (>= x 0) x
        (* -1 x))))
(absol -5)
(absol 8)

(define transform
  (lambda (x)
    (cond
      ((string? x) (string->symbol x))
      ((symbol? x) (symbol->string x)))))
(transform 'symb)
(transform "string")
(transform 4) ;does not affect numeral