% Facts : stock(Symbol, CompanyName, Price).
stock(etp,'Energy Transfer Partners, L.P.', 15.93).
stock(jpm,'JPMorgan Chase &amp; Co.', 107.52).
stock(bab,'Alibaba Group Holding Limited', 175.15).
stock(kmi,'Kinder Morgan, Inc.', 14.75).
stock(avgo,'Broadcom Limited', 228.28).
stock(feye,'FireEye, Inc.', 16.80).
stock(sep,'Spectra Energy Partners, LP', 32.72).
stock(ddd,'3D Systems 0', 11.082).
stock(ihrt,'iHeartMedia, Inc.', 0.52).
stock(sjm,'The J. M. Smucker Company', 119.81).

% Rules
price(Symbol, Price) :- stock(Symbol, _Name, Price).
name(Symbol, Name) :- stock(Symbol, Name, _Price).

% stock(etp,X,Y).

% name(bab,X).

% price(etp, Price).

%Introduction to Prolog Excercise
add(A, B, C, D) :- D is A + B + C.

animal(bear, mammal).
animal(lizard, reptile).
animal(horse, mammal).
animal(squirrel, mammal).
animal(alligator, reptile).
animal(whale, mammal).

% Pokemon, type
pokemon(pikachu, electric).
pokemon(charizard, flying).
pokemon(charizard, fire).
pokemon(garchomp, dragon).
pokemon(garchomp, ground).

% weak type, strong type
weak(electric, ground).
weak(flying, electric).

weakness(X, Y) :- pokemon(X, Typex), pokemon(Y, Typey), weak(Typex, Typey).
defeats(X, Y) :- pokemon(X, Typex), pokemon(Y, Typey), weak(Typey,Typex).

