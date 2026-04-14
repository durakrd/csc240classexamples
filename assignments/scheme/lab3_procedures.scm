#lang scheme

(define add-rest
  (lambda (lst)
    (if (null? (cdr lst)) lst
        (cons (apply + lst) (add-rest (cdr lst))))))

(add-rest '(1 2 3))
(add-rest '(1 2 3 4 5 6))
(add-rest '(4 8 15 16 23 42))

(define dec-all
  (lambda (lst)
    (map (lambda (x) (- x 1)) lst)))

(dec-all '(1 2 3 4))
(dec-all '(2))

(define mult-list
  (lambda (lst) (apply * lst)))

(mult-list '(1 2 3 4))
(mult-list '(2))

(define only-rationals
  (lambda (lst)
    (filter rational? lst)))

(only-rationals '(1 2 3 4))
(only-rationals '(1 'two '(1 1 1) 4 "five" 6 7 *))
(only-rationals (list 1 (/ 7 3.5) (/ 27 5) 3+2i))

(define check-it
  (lambda (x y)
    (cond
      ((< x y) (+ x y))
      ((= x y) y)
      (else (- x y)))))

(check-it 23 19)
(check-it 10 10)
(check-it 19 23)

(define (sum-diff a b)
  (let ((+ -)
        (- +))
    (+ (- a a) (- b b))))
(sum-diff 7 4)

(define cube-list1
  (lambda (lst)
    (if (null? lst) '()
        (cons (expt (car lst) 3) (cube-list1 (cdr lst))))))

(cube-list1 '(1 2 3 4 5 6))
(cube-list1 '(4 8 15 16 23 42))

(define cube-list2
  (lambda (lst)
    (map (lambda (x) (* x x x)) lst)))

(cube-list2 '(1 2 3 4 5 6))
(cube-list2 '(4 8 15 16 23 42))

(define remove-them1
  (lambda (lst1 lst2)
    (if (null? lst1) '()
        (if (member (car lst1) lst2) (remove-them1 (cdr lst1) lst2)
            (cons (car lst1) (remove-them1 (cdr lst1) lst2))))))

(remove-them1 '(1 2 3 4 5 6) '(3 6))
(remove-them1 '(1 2 3 4 5 6) '(7 8))
(remove-them1 '(1 2 3 2 4 2 5 2 6 2) '(1 2 5))

(define remove-them2
  (lambda (lst1 lst2)
    (filter (lambda (x) (not (member x lst2))) lst1)))

(remove-them2 '(1 2 3 4 5 6) '(3 6))
(remove-them2 '(1 2 3 4 5 6) '(7 8))
(remove-them2 '(1 2 3 2 4 2 5 2 6 2) '(1 2 5))

(define mult-position
  (lambda (lst)
    (position-helper lst 1)))

(define position-helper
  (lambda (ls cnt)
    (if (null? ls) '()
        (cons (* cnt (car ls)) (position-helper (cdr ls) (+ cnt 1))))))

(mult-position '(1 2 3 4 5))
(mult-position '(1 1 1 1 1))
(mult-position '(5 4 3 2 1))

(define gpa
  (lambda (lst)
    (/ (apply + (map grder lst)) (length lst))))

(define grder
  (lambda (grd)
    (cond
      ((equal? grd 'A) 4.0)
      ((equal? grd 'B) 3.0)
      ((equal? grd 'C) 2.0)
      ((equal? grd 'D) 1.0)
      (else 0.0))))

(gpa '(A B A A A))
(gpa '(A C D F B C A B))
(gpa '(A B A B))
(gpa '(A C B A D F A))

(define clean-list
  (lambda (lst)
    (filter number? lst)))

(clean-list '(1 'two (/ 6 2) '(1 1) 5 "Six" 'seven (* 2 4) 9 (sqrt 100)))
(clean-list (list 1 'two (/ 6 2) '(1 1) 5 "Six" 'seven (* 2 4) 9 (sqrt 100)))

(define sum-squares1
  (lambda (lst)
    (cond
      ((null? lst) 0)
      ((number? (car lst)) (+ (expt (car lst) 2) (sum-squares1 (cdr lst))))
      (else (sum-squares1 (cdr lst))))))

(sum-squares1 '(1 2 3 4 5 6))
(sum-squares1 '(4 8 15 16 23 42))
(sum-squares1 '(1 'two (/ 6 2) '(1 1) 5 "Six" 'seven (* 2 4) 9 (sqrt 100)))


(define sum-squares2
  (lambda (lst)
    (apply + (map sqr (clean-list lst)))))

(sum-squares2 '(1 2 3 4 5 6))
(sum-squares2 '(4 8 15 16 23 42))
(sum-squares2 '(1 'two (/ 6 2) '(1 1) 5 "Six" 'seven (* 2 4) 9 (sqrt 100)))

(define swap-names
  (lambda (lst)
    (map num-convert lst)))

(define num-convert
  (lambda (num)
    (cond
      ((= num 0) 'zero)
      ((= num 1) 'one)
      ((= num 2) 'two)
      ((= num 3) 'three)
      ((= num 4) 'four)
      ((= num 5) 'five)
      ((= num 6) 'six)
      ((= num 7) 'seven)
      ((= num 8) 'eight)
      ((= num 9) 'nine))))

(swap-names '(2 4 8 5 0 4))
(swap-names '(1 2 3 4 5 6))
(swap-names '(2 3 1 9))

((lambda (a b)
   (+ (* a a) b))
 3 7)

(let
  ((a 1)
   (b 3)
   (c 2))
  (- (* b b) (* 4 a c)))

(define find-show
  (lambda (database name)
    (cond
      ((null? database) '())
      ((eq? (caar database) name) (cdr (car database)))
      (else (find-show (cdr database) name)))))

(define find-year
  (lambda (database name)
    (cadr (find-show database name))))

(define good-shows
  (lambda (database rating)
    (map car (filter (lambda (info)
                       (<= rating (caddr (cdr info))))
                     database))))

(define shows '(
                (the_x_files . ("The X-Files" 1993 8.7))
                (gunsmoke . ("Gunsmoke" 1955 7.9))
                (the_brady_bunch . ("The Brady Bunch" 1969 6.5))
                (stranger_things . ("Stranger Things" 2016 8.8))))

(find-show shows 'the_brady_bunch)
(good-shows shows 7.9)
(find-year shows 'stranger_things)
