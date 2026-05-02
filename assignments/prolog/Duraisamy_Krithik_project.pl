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

atm_mem(_, []) :- !, fail.
atm_mem(A, [A | _]) :- !.
atm_mem(A, [_ | T]) :- atm_mem(A, T).

atm_dup_rem([], []) :- !.
atm_dup_rem([A | T], Rtrn) :- atm_mem(A, T), !, atm_dup_rem(T, Rtrn).
atm_dup_rem([A | T], [A | Rtrn]) :- atm_dup_rem(T, Rtrn).

flattenit([], []) :- !.
flattenit([[Hin | Tin] | T2], [Hin | Rtrn]) :- flattenit(Tin, Rtrnin),
					       flattenit(T2, Rt2),
					       append(Rtrnin, Rt2, Rtrn), !.
flattenit([H | T], [H | Rtrn]) :- flattenit(T, Rtrn).

% Seperate logic for list of atoms
squish([A | T], Rtrn) :- atom(A), !, flattenit([A | T], Flat),
			 atm_dup_rem(Flat, Rtrn).
squish(Lst, Rtrn) :- flattenit(Lst, Flat), quicksort(Flat, Rtrn).

eval_term([C | E], X, Y) :- Y is C * (X^E).

eval_poly([], _, 0) :- !.
eval_poly([T | P], X, N) :- eval_term(T, X, Y), eval_poly(P, X, N1),
			    N is N1 + Y.

gen_poly(P) :- assert((f(X, N) :- eval_poly(P, X, N))).

:- states(TX,OK,LA,MS,AR), 
        write(['  states1:', 'TX', TX, ' OK', OK, ' LA', LA, ' MS', MS, ' AR', AR]), nl.
:- states(TX,OK,LA,MS,AR), TX = blue, 
        write(['  states1:', 'TX', TX, ' OK', OK, ' LA', LA, ' MS', MS, ' AR', AR]), nl.
:- nl, write('manhattan/3:'), 
        write(' '), manhattan([-4 | -4], [2 | 2], X), write(X),
        write('  '), manhattan([1 | 7], [4 | 11], Y), write(Y),
        write('  '), manhattan([-2 | 8], [3 | -4], Z), write(Z), nl.
:- nl, write('split_after/4:'),
        write('  '), split_after([a,b,c],2,X,Y), write(X), write(Y), 
        write('  '), split_after([a,b,c,d,e,f,g,h],5,A,B), write(A), write(B), nl.
:- nl, write('squish/2:'), nl.
:- write(' '), squish([a,b,c,d,e,f],X), write(X),
        write(' '), squish([1,1,9,2,2,3,4,[5,6,[7,8],1,[2,4],9]],Y), write(Y), nl.
:- write(' '), squish([[2,4,6,8],1,2,[3,4,[5,6],7],8,9,[1,[2]]],X), write(X),
        write(' '), squish([[7],[8,7,1,5,4,5],[7,5,3,6,3,2]], Y), write(Y), nl.
:- nl, write('Polynomials:'), nl.
:- write('  eval_term: '), eval_term([1 | 1],2,X), write(X), 
        write(' '), eval_term([3 | 2],5,Y), write(Y), nl.
:- write('  eval_poly: '), eval_poly([[3 | 2]],5, X), write(X),
        write('  '), eval_poly([[1 | 2], [2 | 1], [3 | 0]],1, Y), write(Y),
        write('  '), eval_poly([[1 | 2], [2 | 1], [3 | 0]],2, Z), write(Z),
        write('  '), eval_poly([[2 | 3], [3 | 2], [7 | 1], [9 | 0]],5,K), write(K), nl.
:- retractall(f(_X,_Y)).   % make sure f/2 is not already defined
:- write('  gen_poly1: '), gen_poly([[1 | 2], [2 | 1], [3 | 0]]), f(2,X), write(X),
        write('  '), f(5,Y), write(Y), nl.
:- retractall(f(_X,_Y)).   % retract f/2 defined above
:- write('  gen_poly2: '), gen_poly([[2 | 3], [3 | 2], [7 | 1], [9 | 0]]), f(1,X), write(X),
        write('  '), f(5,Y), write(Y).
