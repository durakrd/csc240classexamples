#lang scheme

(define flattener
  (lambda (lst)
    (cond
      ((null? lst) '())
      ((list? (car lst)) (append (flatten (car lst) (cdr lst))))
      (else (cons (car lst) (flatten (cdr lst)))))))

(flattener '(1 (2 3) (4 (5 6))))


(define recur-func
  (lambda (x)
    (if (or (= x 0) (= x 1)) 1
        (+ (expt (recur-func (- x 1)) 2) (recur-func (- x 2))))))

(recur-func 3)


(define finalexam
  (lambda (lst)
    (cond
      ((null? lst) '())
      ((= 0 (modulo (car lst) 3)) (cons 'xx (finalexam (cdr lst))))
      (else (cons (car lst) (finalexam (cdr lst)))))))

(finalexam '(1 2 3 4 5 6 7))
