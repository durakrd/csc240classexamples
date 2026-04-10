#lang scheme

(define introduction
  (lambda (name home)
    (list 'My 'name 'is name 'and 'I 'am 'from home)))

(introduction 'Luke 'Tatooine)

(define two-by-two
  (lambda (w x y z)
  (cons (cons w x) (cons y z))))

(two-by-two 1 2 3 4)
(two-by-two 'a 'b 'c 'd)

(define three-by-three
  (lambda (a b c d e f g h i)
    (list (list a b c) (list d e f) (list g h i))))

(three-by-three 1 2 3 4 5 6 7 8 9)

(define player-checker
  (lambda (player)
    (cond
      ((eq? player 'rock) #t)
      ((eq? player 'scissors) #t)
      ((eq? player 'paper) #t)
      (else #f))))

(define determine-winner
  (lambda (player1 player2)
    (cond
      ((and (eq? player1 'rock) (equal? player2 'scissors)) "Player 1 wins!")
      ((and (eq? player1 'rock) (equal? player2 'paper)) "Player 2 wins!")
      ((and (eq? player1 'paper) (equal? player2 'scissors)) "Player 2 wins!")
      ((and (eq? player1 'paper) (equal? player2 'rock)) "Player 1 wins!")
      ((and (eq? player1 'scissors) (equal? player2 'rock)) "Player 2 wins!")
      ((and (eq? player1 'scissors) (equal? player2 'paper)) "Player 1 wins!")
      (else "Tie"))))

(define rock-paper-scissors
  (lambda (player1 player2)
    (if (and (player-checker player1) (player-checker player2))
        (determine-winner player1 player2)
        "Invalid Choices")))

(rock-paper-scissors 'rock 'paper)
(rock-paper-scissors 'rock 'rock)
(rock-paper-scissors 'lizard 'spock)

(define subset?
  (lambda (x s)
    (cond
      ((null? x) #t)
      ((member (car x) s) (subset? (cdr x) s))
      (else #f))))

(subset? '() '(1 2 3))
(subset? '(2) '(1 2 3))
(subset? '(1 2 3) '(1 2 3))
(subset? '(2 4) '(1 2 3))

(define set-equal?
  (lambda (s1 s2)
    (and (subset? s1 s2) (subset? s2 s1))))

(set-equal? '(1 2 3) '(3 2 1))
(set-equal? '('r 'e 's 't 'f 'u 'l) '('f 'l 'u 's 't 'e 'r 'd))
(set-equal? '(1 2 3 4) '(0 1 2 3))

(define nope
  (lambda (n)
    (if (<= n 0) '()
        (cons 'no (nope (- n 1))))))

(nope 2)
(nope 10)

(define first-half
  (lambda (lst)
    (if (= 0 (length lst)) '()
        (if (= 1 (length lst)) lst
            (cons (car lst)  (first-half (cdr (reverse (cdr (reverse lst))))))))))

(first-half '(Hello World))
(first-half '(1 2 3 4 5))

(define parens-depth
  (lambda (n)
    (if (not (list? n)) 0
        (if (null? n) 1
            (if (not (list? (car n))) (parens-depth (cdr n))
                (max (+ 1 (parens-depth (car n))) (parens-depth (cdr n))))))))

(parens-depth '(1 2 3))
(parens-depth '(1 2 (3 4) (5 (6 (7 8) 9))))
(parens-depth 'deep)

