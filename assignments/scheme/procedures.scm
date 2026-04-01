#lang scheme

(define square
  (lambda (x)
    (* x x)))
(square 4)
(square -7)

(define celsius->fahrenheit
  (lambda (temp)
    (+ 32.0 (* temp (/ 9.0 5.0)))))
(celsius->fahrenheit 0)
(celsius->fahrenheit 100)
(celsius->fahrenheit 70)

(define fahrenheit->celsius
  (lambda (temp)
  (* (/ 5.0 9.0) (- temp 32))))
(fahrenheit->celsius 32)
(fahrenheit->celsius 212)
(fahrenheit->celsius 70)

(define price-with-tax
  (lambda (s r)
    (* s (+ 1 (/ r 100.0)))))
(price-with-tax 10 12)
(price-with-tax 1432 8)

(define after-tax-income
  (lambda (s r)
    (* s (- 1 (/ r 100.0)))))
(after-tax-income 50000 15)
(after-tax-income 100000 30)

(define square-the-smaller
  (lambda (x y)
    (if (< x y) (* x x)
        (* y y))))
(square-the-smaller 3 4)
(square-the-smaller 12 11)

(define three-square-sum
  (lambda (a b c)
    (+ (* a a) (* b b) (* c c))))
(three-square-sum 1 1 1)
(three-square-sum 1 2 3)
(three-square-sum 1 10 100)

(define four-in-a-row?
  (lambda (l m n o)
    (cond
      ((>= l m) #f)
      ((>= m n) #f)
      ((>= n o) #f)
      (else #t))))

(four-in-a-row? 1 2 3 4)
(four-in-a-row? 1 2 3 3)
(four-in-a-row? 1 1 2 3)


(define fifth-element
  (lambda (lst)
    (if (> 5 (length lst)) '()
        (cadr (cdddr lst)))))

(fifth-element '(1 2 3 4))
(fifth-element '(1 2 3 4 5))
(fifth-element '(1 2 3 4 5 6 7 8))

(define car-to-cdr-power
  (lambda (lst)
    (if (= 1 (length lst)) (car lst)
        (expt (car lst) (cadr lst)))))

(car-to-cdr-power '(5))
(car-to-cdr-power '(2 10))
(car-to-cdr-power '(3 4 5 6))

(define div-by-small-prime
  (lambda (n)
    (cond
      ((= (remainder n 2) 0) #t)
      ((= (remainder n 3) 0) #t)
      ((= (remainder n 5) 0) #t)
      ((= (remainder n 7) 0) #t)
      (else #f))))

(div-by-small-prime 12)
(div-by-small-prime 15)
(div-by-small-prime 63)
(div-by-small-prime 67)

(define 24hr-to-12hr-time
  (lambda (t)
    (cond
      ((= (car t) 0) (list 12 (cadr t)))
      ((> (car t) 12) (list (- (car t) 12) (cadr t)))
      (else t))))

(24hr-to-12hr-time '(05 30))
(24hr-to-12hr-time '(00 00))
(24hr-to-12hr-time '(17 00))

