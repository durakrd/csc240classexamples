
remove_dups([X, X], [X]) :- !.
remove_dups([H1, H2], [H1, H2]) :- !.
remove_dups([H, H | T], T2) :- remove_dups([H | T], T2), !.
remove_dups([H1, H2 | T], [H1 | T2]) :- remove_dups([H2 | T], T2).

%% insertion_sort([], []) :- !.
%% insertion_sort([X], [X]) :- !.
%% insertion_sort([H1, H2 | T], [H1, H3 | T3]) :- H1 =< H2,
%% 					   insertion_sort([H2 | T], [H3 | T2]),
%% 					   H3 =< H2,
%% 					   insertion_sort([H2 | T2], T3).				   
%% insertion_sort([H1, H2 | T], [H2 | T2]) :- H2 =< H1, !, insertion_sort([H1 | T], T2).

placer([], X, [X]) :- !.
placer([H | T], X, [X | [H | T]]) :- X =< H, !.
placer([H | T], X, [H | Rtrn]) :- placer(T, X, Rtrn).

insertion_sort([], []) :- !.
insertion_sort([H | T], Rtrn) :- insertion_sort(T, T2), placer(T2, H, Rtrn).

recur_func(0, 1) :- !.
recur_func(1, 1) :- !.
recur_func(X, Rtrn) :- X1 is X-1, X2 is X-2, recur_func(X1, Y1), recur_func(X2, Y2), Rtrn is Y1^2 + Y2.

finalexam(X, X, X) :- !.
finalexam(X, Y, Y) :- 0 is (X+Y) mod 2, !.
finalexam(X, Y, 3) :- 0 is (X+Y) mod 3, !.
finalexam(_, Y, Y).
