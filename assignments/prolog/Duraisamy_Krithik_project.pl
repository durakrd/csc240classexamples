% Krithik Duraisamy
% CSC240 Prolog Project

states(TexMis, OkLouis, OkLouis, TexMis, Arkansas) :-
    member(TexMis, [blue, red, green]),
    member(OkLouis, [blue, red, green]),
    member(Arkansas, [blue, red, green]),
    TexMis \= OkLouis,
    TexMis \= Arkansas,
    Arkansas \= OkLouis.

manhattan([X1 | Y1], [X2 | Y2], Rtrn) :- X is X1 - X2, Y is Y1 - Y2,
					 abs(X, RX), abs(Y, RY),
					 Rtrn is RX + RY.

% Providing Index greater than upper bound returns full and empty lists
split_after([], Idx, [], []) :- Idx \= 0, !.
split_after([H | T], Idx, [H | T2], T3) :- Idx > 0, !, I is Idx - 1,
					   split_after(T, I, T2, T3).
split_after(T, 0, [], T).

% partition removes duplicates
partition(_, [], [], []) :- !.
partition(P, [P | T], Small, Large) :- !, partition(P, T, Small, Large).
partition(P, [H | T], [H | Small], Large) :- H < P, !, partition(P, T, Small, Large).
partition(P, [H | T], Small, [H | Large]) :- partition(P, T, Small, Large).

quicksort([], []) :- !.
quicksort([P | T], Srt) :- partition(P, T, Left, Right),
			   quicksort(Left, Lsrt),
			   quicksort(Right, Rsrt),
			   append(Lsrt, [P | Rsrt], Srt).

flattenit([], []) :- !.
flattenit([[Hin | Tin] | T2], [Hin | Rtrn]) :- flattenit(Tin, Rtrnin),
					       flattenit(T2, Rt2),
					       append(Rtrnin, Rt2, Rtrn), !.
flattenit([H | T], [H | Rtrn]) :- flattenit(T, Rtrn).

squish(Lst, Rtrn) :- flattenit(Lst, Flat), quicksort(Flat, Rtrn).
