male(fritz).
male(erich).
male(conrad).
male(dennis).
male(berti).
male(albert).

female(X) :- not(male(X)).

parent(berti, albert).
parent(beate, albert).

parent(conrad, berti).
parent(claudia, berti).

parent(erich, conrad).
parent(eva, conrad).

parent(fritz, eva).

parent(dennis, beate).
parent(dora, beate).

father(X, Y) :- male(X) , parent(X, Y).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- ancestor(X, Z) , parent(Z, Y).

female_ancestor(X, Y)
  :- ancestor(X, Y) , female(X).
