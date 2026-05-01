

square(X, Sqr) :- Sqr is X^2.

celsius_to_fahrenheit(C, F) :- F is (9.0*C)/5.0 + 32.0.

fahrenheit_to_celsius(F, C) :- C is (5.0/9.0)*(F - 32.0).

price_with_tax(P, R, Rtrn) :- Rtrn is P * (1 + (R/100)).

after_tax_income(S, R, Rtrn) :- Rtrn is S * (1 - (R/100)).

square_the_smallest(X, Y, Rtrn) :- X > Y, !, Rtrn is Y^2.
square_the_smallest(X, Y, Rtrn) :- X < Y, !, Rtrn is X^2.
square_the_smallest(X, X, Rtrn) :- Rtrn is X^2.

three_square_sum(A, B, C, Rtrn) :- Rtrn is A^2 + B^2 + C^2.

four_in_a_row(L, M, N, O) :- L < M, M < N, N < O.

fifth_element([_, _, _, _, X | _], X).

head_to_tail_power([H | T], X) :- X is H^T.

div_by_small_prime(N) :- member(L, [2,3,5,7]), 0 is N mod L.

convert_24hr_to_12hr_time([H | M], [H2 | M]) :- H > 12, !, H2 is H - 12.
convert_24hr_to_12hr_time([0 | M], [12 | M]) :- !.
convert_24hr_to_12hr_time(T, T).
