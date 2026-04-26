parent(ava,bob).
parent(mike,bob).
parent(emma, sophia).
parent(william, sophia).
parent(emma, mia).
parent(william, mia).
parent(bob,alice).
parent(bob,steve).
parent(mia,alice).
parent(mia,steve).
parent(liam,alexander).
parent(liam,evelyn).
parent(liam,isabella).
parent(sophia,alexander).
parent(sophia,evelyn).
parent(sophia,isabella).
sister(mia, sophia).
sister(mia, henry).
sister(sophia, henry).
sister(alice,steve).
sister(evelyn, alexander).
sister(evelyn, isabella).
sister(isabella, alexander).
brother(henry, mia).
brother(henry, sophia).
brother(steve,alice).
brother(alexander,evelyn).
brother(alexander,isabella).
grandparent(ava,alice).
grandparent(ava,steve).
grandparent(mike,alice).
grandparent(mike,steve).
grandparent(william,alice).
grandparent(william,steve).
grandparent(william,alexander).
grandparent(william,evelyn).
grandparent(william,isabella).
grandparent(emma,alice).
grandparent(emma,steve).
grandparent(emma,alexander).
grandparent(emma,evelyn).
grandparent(emma,isabella).

all_even([]).
all_even([H | T]) :- 0 is H mod 2, all_even(T).

swap_negative([], []).
swap_negative([H | T], [H | T2]) :- H >= 0, swap_negative(T, T2), !.
swap_negative([_ | T], [negative | T2]) :- swap_negative(T, T2).

bigger_than([], _, []).
bigger_than([H | T], Num, [H | T2]) :- H > Num, bigger_than(T, Num, T2).
bigger_than([H | T], Num, T2) :- H =< Num, bigger_than(T, Num, T2).

uncle(Unc, Neph) :- brother(Unc, Par), parent(Par, Neph).
aunt(Aunt, Neph) :- sister(Aunt, Par), parent(Par, Neph).

cousin(K1, K2) :- grandparent(G, K1), grandparent(G, K2).

fib(N, 0) :- N =< 0, !.
fib(1, 1) :- !.
fib(N, F) :- N > 1, N1 is N - 1, N2 is N - 2,
	     fib(N1, F1), fib(N2, F2), F is F1 + F2.

car([H | _], H).
cdr([_ | T], T).

double([], []) :- !.
double([H | T], [H2 | T2]) :- H2 is H * 2, double(T, T2), !.
double(F, S) :- S is 2 * F.

member_of(X, [X | _]).
member_of(X, [_ | T]) :- member_of(X, T).

get_odds([], []) :- !.
get_odds([H | T], [H | T2]) :- 1 is H mod 2, get_odds(T, T2), !.
get_odds([_| T], T2) :- get_odds(T, T2).

sum_all([], 0).
sum_all([H | T], S) :- sum_all(T, Sum1), S is Sum1 + H.

mult_all([X], X) :- !.
mult_all([H | T], P) :- mult_all(T, Prod), P is Prod * H.

square_list([], []).
square_list([H | T], [H2 | T2]) :- H2 is H * H, square_list(T, T2). 
