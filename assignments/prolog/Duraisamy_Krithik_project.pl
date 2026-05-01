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
