;; Krithik Duraisamy
#lang scheme

(require "scmprojtest.scm")

(define remove-next-to-last
  (lambda (lst)
    (if (null? (cddr lst)) (cdr lst)
        (cons (car lst) (remove-next-to-last (cdr lst))))))

(define manhattan
  (lambda (a b)
    (+ (abs (- (car a) (car b)))
       (abs (- (cdr a) (cdr b))))))

(define remove-dups
  (lambda (lst)
    (cond
      ((null? (cdr lst)) lst)
      ((eq? (car lst) (cadr lst)) (remove-dups (cdr lst)))
      (else (cons (car lst) (remove-dups (cdr lst)))))))

(define deep-search
  (lambda (lst X)
    (cond
      ((not (pair? lst)) (eq? lst X))
      ((pair? (car lst)) (or (deep-search (car lst) X) (deep-search (cdr lst) X)))
      (else (or (eq? (car lst) X) (deep-search (cdr lst) X))))))

(define inorder
  (lambda (tree)
    (if (pair? tree) (append (inorder (car tree)) (inorder (cdr tree)))
        (list tree))))

(define tree-exists?
  (lambda (tree ele)
    (deep-search tree ele)))

(define get-poly-fun
  (lambda (p)
    (lambda (x)
      (apply +
             (map (lambda (term)
                    (* (car term) (expt x (cdr term))))
                  p)))))

(define eval-poly
  (lambda (p x)
    ((get-poly-fun p) x)))

; Test code
(display "=========== Start of test code ===========")(newline)
(test-remove-next-to-last remove-next-to-last)
(test-manhattan manhattan)
(test-remove-dups remove-dups)
(test-deep-search deep-search)
(test-inorder inorder)
(test-tree-exists tree-exists?)
(test-eval-poly eval-poly)
(test-get-poly-fun get-poly-fun)
(display "============ End of test code ============")(newline)
