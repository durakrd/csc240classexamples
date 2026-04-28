:- autoload(library(lists), [member/2]).

% Completely misread the question but still think this is pretty cool
indexCheck(_, [], _) :- !, fail.
indexCheck(N, [N | _], 1) :- !.
indexCheck(N, [_ | T], X) :- indexCheck(N, T, Totl), X is Totl + 1.

atPosition(1, [H | _], H) :- !.
atPosition(N, [_ | T], Ele) :- N1 is N - 1, atPosition(N1, T, Ele).

square_positives([], []) :- !.
square_positives([H | T], [H2 | T2]) :- H >= 0, !, H2 is H * H,
					square_positives(T, T2).
square_positives([_ | T], T2) :- square_positives(T, T2).

pair_reverse([H1, H2], [H2, H1]) :- !.
pair_reverse([H1, H2, X], [H2, H1, X]) :- !.
pair_reverse([H1, H2 | T], [H2, H1 | T2]) :- pair_reverse(T, T2).

check_it(X, Y, A) :- X < Y, !, A is Y - X.
check_it(Y, Y, Y) :- !.
check_it(X, Y, A) :- A is X - Y.

cadr([_, X | _], X).

% not_member(_, []) :- !.
% not_member(H, [H | _]) :- !, fail.
% not_member(H, [_ | T]) :- not_member(H, T).

remove_them([], _, []) :- !.
remove_them([H | T], Lst2, R) :- member(H, Lst2), !, remove_them(T, Lst2, R).
remove_them([H | T], Lst2, [H | R]) :- remove_them(T, Lst2, R).
