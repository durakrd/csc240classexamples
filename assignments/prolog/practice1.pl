
%state/2(country, name).
state(unitedstates, arizona).
state(unitedstates, california).
state(unitedstates, newmexico).
state(unitedstates, texas).
state(unitedstates, louisiana).
state(unitedstates, oklahoma).
state(unitedstates, colorado).
state(unitedstates, utah).
state(unitedstates, nevada).
state(mexico, chihuahua).
state(mexico, sonora).
state(mexico, coahuila).
state(mexico, durango).
state(mexico, veracruz).
state(mexico, bajacalifornia).

isState(State) :- state(_, State).
biggerstate(State1, State2) :- stateinfo(State1, _, X), stateinfo(State2, _, Y), X > Y.

% stateinfo/3(Name, Population, Area-sq-mi)
stateinfo(chihuahua, 3400000, 96000).
stateinfo(sonora, 2700000, 69000).
stateinfo(coahuila, 2700000, 58000).
stateinfo(california, 34000000, 163000).
stateinfo(texas, 21000000, 269000).
stateinfo(arizona, 5000000, 111990).

% show/2(Title, Year, Rating).

show(seinfeld, 1989, 8.9).
show(the_xfiles, 1993, 8.7).
show(friends, 1994, 8.9).
show(firefly, 2002, 9.1).
show(the_walking_dead, 2010, 8.4).
show(sherlock, 2010, 9.1).
show(game_of_thrones, 2011, 9.3).
show(silicon_valley, 2014, 8.5).
show(atlanta, 2016, 8.5).
show(stranger_things, 2016, 8.7).
show(for_all_mankind, 2019, 7.9).
show(shadow_and_bone, 2019, 7.7).
show(the_mandalorian, 2019, 8.8).
show(loki, 2021, 8.3).
show(mr_robot, 2015, 8.6).

good_show(Show) :- show(Show, _, Rating), Rating >= 8.9.

%Equality Checking with Year
same_year(Show1, Show2) :- show(Show1, Year, _), show(Show2, Year, _), Show1 \= Show2.

quad(X, Y) :- Y is 4 * X.

bloop(Z, Y) :- Z >= 0, Y is Z * 2.
bloop(W, Y) :- W < 0, Y is W / 2.

mult(X,Y,Z) :- Z is X * Y.

bigger(X,Y,X) :- X >= Y.
bigger(Y,X,X) :- X >= Y.


absol(X,X) :- X > 0.
absol(X,Y) :- Y is X * -1, X < 0.
