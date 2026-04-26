:- autoload(library(lists), [member/2, reverse/2]).

introduction(Name, Place, [my, name, is, Name, and, i, am, from, Place]).

two_by_two(A, B, C, D, [[A | B], C | D]).

three_by_three(A,B,C,D,E,F,G,H,I, [[A,B,C],[D,E,F],[G,H,I]]).

rock_paper_scissors(rock, paper, paper).
rock_paper_scissors(paper, rock, paper).
rock_paper_scissors(paper, scissors, scissors).
rock_paper_scissors(scissors, paper, scissors).
rock_paper_scissors(rock, scissors, rock).
rock_paper_scissors(scissors, rock, rock).
rock_paper_scissors(X, X, tie).
rock_paper_scissors(_, _, invalid_choice).

subset([], _).
subset([H | T], T2) :- member(H, T2), subset(T, T2).

set_equal(T, T2) :- subset(T, T2), subset(T2, T).

nope(0, []).
nope(Num, [no | T]) :- N1 is Num - 1, nope(N1, T).

first_half([], []) :- !.
first_half([X], [X]) :- !.
first_half([H | T], [H | T2]) :- reverse(T, [_ | Ls]), reverse(Ls, F),
				 first_half(F, T2). 

parens_depth([], 1).
parens_depth([[H2 | T2] | T], X) :- parens_depth([H2 | T2], Fd), parens_depth(T, Sd),
				 FD is Fd + 1, X is max(FD, Sd).
parens_depth([_ | T], X) :- parens_depth(T, X).
parens_depth(_, 0).
