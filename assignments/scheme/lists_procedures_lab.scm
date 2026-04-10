#lang scheme

(define dec-all
  (lambda (lst)
    (if (null? lst) '()
        (cons (- (car lst) 1) (dec-all (cdr lst))))))

(dec-all '(1 2 3 4))
(dec-all '(2))

(define only-rationals
  (lambda (lst)
    (if (null? lst) '()
        (if (rational? (car lst)) (cons (car lst) (only-rationals (cdr lst)))
            (only-rationals (cdr lst))))))

(only-rationals '(1 2 3 4))
(only-rationals '(1 'two '(1 1 1) 4 "five" 6 7 *))
(only-rationals (list 1 (/ 7 3.5) (/ 27 5) 3+2i))


(define recursive-sub
  (lambda (x y)
    (if (= y 0) x
        (recursive-sub (- x 1) (- y 1)))))

(recursive-sub 9 5)
(recursive-sub 7 22)
(recursive-sub 0 6)

(define rev
  (lambda (lst)
    (if (null? lst) '()
        (append (rev (cdr lst)) (list (car lst))))))

(rev '(1 2 3 4))
(rev '())
(rev '(a b c '() 1 2 3))

(define len
  (lambda (lst)
    (cond
      ((not (list? lst)) 0)
      ((null? lst) 0)
      (else (+ 1 (len (cdr lst)))))))

(len '(1 2 3 4 5 6))
(len 'notalist)
(len '(1 2 (3 4) (5 6 (7 8) 9) 10))

(define third-to-last
  (lambda (lst)
    (cond
      ((< (len lst) 3) '())
      ((= (len lst) 3) (car lst))
      (else (caddr(rev lst))))))

(third-to-last '(1 2 3))
(third-to-last '(1 2 3 4 5 6))
(third-to-last '(1 2))

(define min
  (lambda (lst)
    (if (= 1 (len lst)) (car lst)
        (let ((tempmin (min (cdr lst))))
         (if (< (car lst) tempmin) (car lst)
             tempmin)))))

(min '(23 19))
(min (list 1 2 3 4 3 2 1))

(define member-of
  (lambda (e lst)
    (if (null? lst) #f
        (if (equal? e (car lst)) #t
            (member-of e (cdr lst))))))

(member-of 1 '(4 3 2 1))
(member-of 1 '(a b c d))
(member-of 1 '(4 3 (2 1)))

(define count-times
  (lambda (n lst)
    (if (null? lst) 0
        (if (equal? n (car lst)) (+ 1 (count-times n (cdr lst)))
            (count-times n (cdr lst))))))

(count-times 'a '(a b c d e f a f e d c b a))
(count-times '(1 2 3) '(1 2 (1 2 3) 3 (1 2 3)))

(define get-odds
  (lambda (lst)
    (if (null? lst) '()
        (if (= 0 (remainder (car lst) 2)) (get-odds (cdr lst))
            (cons (car lst) (get-odds (cdr lst)))))))

(get-odds '(1 2 3 4 5 6 7 8 9))
(get-odds '(2 4 8 10))

(define sum-all
  (lambda (lst)
    (if (null? lst) 0
        (+ (car lst) (sum-all (cdr lst))))))

(sum-all '(1 3 6 9 10))
(sum-all '(4 8 15 16 23 42))

(define mult-all
  (lambda (lst)
    (if (null? lst) 1
        (* (car lst) (mult-all (cdr lst))))))

(mult-all '(1 3 6 9 10))
(mult-all '(4 8 15 16 23 42))

(define square-list
  (lambda (lst)
    (if (null? lst) '()
        (cons (expt (car lst) 2) (square-list (cdr lst))))))

(square-list '(1 3 6 9 10))
(square-list '(4 8 15 16 23 42))

;; (define poly-check
;;   (lambda (poly)
;;     (equal? (car poly) (car(rev poly)))))

(define dist
  (lambda (p1 p2)
    (expt (+ (expt (- (car p2) (car p1)) 2) (expt (- (cdr p2) (cdr p1)) 2)) 0.5)))

(define perimeter
  (lambda (poly)
    (if (= (len poly) 1) 0
        (+ (dist (car poly) (cadr poly)) (perimeter (cdr poly))))))

(perimeter '((2 . 4) (3 . 9) (-1 . 3) (-3 . -4) (2 . 4)))
(perimeter '((0 . 0) (1 . 0) (1 . 1) (0 . 1))) ; not a complete polygon
(perimeter '((3 . 3)))


