% :- autoload(library(lists), [member/2]).

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

distance([X1 | Y1], [X2 | Y2], D) :- D is ((X1 - X2)^2 + (Y1 - Y2)^2)^(1/2).

clean_list([], []) :- !.
clean_list([H | T], [H | R]) :- integer(H), !, clean_list(T, R).
clean_list([_ | T], R) :- clean_list(T, R).

squares([], []) :- !.
squares([H | T], [H2 | R]) :- integer(H), !, H2 is H^2, squares(T, R).
squares([_ | T], R) :- squares(T, R).

sum_lst([], 0) :- !.
sum_lst([H | T], Sum) :- sum_lst(T, TempSum), Sum is TempSum + H.

sum_squares(Lst, Sum) :- squares(Lst, Return), sum_lst(Return, Sum).

get_values([], []) :- !.
get_values([[H | T] | T2], [Sum | Rtrn]) :- !, sum_lst([H | T], Sum),
					    get_values(T2, Rtrn).
get_values([H | T], [H | Rtrn]) :- get_values(T, Rtrn).

scr_lst([0,1,2,3,4,5,6,7,8,9,10]).
fbscore(TDwn, FldGl, Sfty, Extr, X) :- scr_lst(L),
				       member(TDwn, L), member(Extr, L),
  				       Extr =< TDwn, member(FldGl, L),
				       member(Sfty, L),
				       X is 6*TDwn + 3*FldGl + 2*Sfty + Extr.

nomatch([], _, []) :- !.
nomatch([H | T], [H | T2], Rtrn) :- !, nomatch(T, T2, Rtrn).
nomatch([H | T], [_ | T2], [H | Rtrn]) :- !, nomatch(T, T2, Rtrn).
nomatch(Lst, [], Lst).
