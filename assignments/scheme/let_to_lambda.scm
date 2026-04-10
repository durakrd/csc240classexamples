#lang scheme

"Lambda Conversions"

((lambda (x) (+ x 1)) 10)

((lambda (a b) (+ a b)) 1 2)

((lambda (a b) (* a b)) 10 5)

((lambda (x) (+ (* x 2) 3)) 5)

((lambda (a b c) (a b c)) + 7 5)

((lambda (a b) (a b)) (lambda (x) (* x x)) 5)

(newline)
"Let Conversions"

(let
    ((x 5))
  (+ x 1))

(let
    ((x 3)
     (y 5))
    (* x y))

(let
    ((x number?)
     (y 3))
    (x y))

(let
    ((a 4)
     (b 6)
     (x 8)
     (y 3))
  (* (+ x a) (+ y b)))
