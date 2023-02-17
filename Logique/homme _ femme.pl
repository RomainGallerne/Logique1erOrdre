/*HOMMES*/
homme(albert).
homme(jean).
homme(paul).
homme(bertrand).
homme(louis).
homme(benoit).
homme(edgar).

/*FEMMES*/
femme(germaine).
femme(christiane).
femme(simone).
femme(marie).
femme(sophie).
femme(madeleine).

/*PARENTS*/
parent(albert,jean).
parent(jean,paul).
parent(paul,bertrand).
parent(paul,sophie).
parent(jean,simone).
parent(louis,benoit).
parent(paul,edgar).
parent(germaine,jean).
parent(christiane,simone).
parent(christiane,paul).
parent(simone,benoit).
parent(marie,bertrand).
parent(marie,sophie).
parent(madeleine,edgar).

/*REPONSES QUESTIONS A.II*/
pere(X,Y):-parent(X,Y),homme(X).
mere(X,Y):-parent(X,Y),femme(X).

fils(X,Y):-parent(Y,X),homme(X).
fille(X,Y):-parent(Y,X),femme(X).

grand_pere(X,Z):-pere(X,Y),parent(Y,Z).
grand_mere(X,Z):-mere(X,Y),parent(Y,Z).
grand_parent(X,Z):-parent(X,Y),parent(Y,Z).

frere(X,Y):-pere(P,X),pere(P,Y),mere(F,X),mere(F,Y),homme(X),X\==Y.
soeur(X,Y):-pere(P,X),pere(P,Y),mere(F,X),mere(F,Y),femme(X),X\==Y.

demi_frere(X,Y):-pere(P,X),pere(P,Y),homme(X),mere(U,X),mere(V,Y),U\==V,X\==Y.
demi_frere(X,Y):-mere(F,X),mere(F,Y),homme(X),pere(U,X),pere(V,Y),U\==V,X\==Y.

demi_soeur(X,Y):-pere(P,X),pere(P,Y),femme(X),mere(U,X),mere(V,Y),U\==V,X\==Y.
demi_soeur(X,Y):-mere(F,X),mere(F,Y),femme(X),pere(U,X),pere(V,Y),U\==V,X\==Y.

cousin(X,Y):-grand_parent(G,X),grand_parent(G,Y),pere(P1,X),pere(P2,Y),P1\==P2,mere(M1,X),mere(M2,Y),M1\==M2.

ancetre(X,Y):-X=Y.
ancetre(X,Y):-parent(X,Y).
ancetre(X,Z):-parent(Y,Z),ancetre(X,Y),Y\==X,Y\==Z.

descendant(X,Y):-ancetre(Y,X).

memefamille(X,Y):-ancetre(Z,X),ancetre(Z,Y).

/*REPONSES QUESTIONS A.I*/

/*
a) Est-ce que paul est un homme ?
homme(paul) -> true

b) Est-ce que benoit est une femme ?
femme(benoit) -> false

c) Qui est une femme ?
femme(X) -> 
	X = germaine
	X = christiane
	X = simone
	X = marie
	X = sophie
	X = madeleine

d) Qui est un homme ?
homme(X) -> 
	X = albert
	X = jean
	X = paul
	X = bertrand
	X = louis
	X = benoit
	X = edgar

e) Est-ce que marie est la mère de sophie ?
parent(marie,sophie),femme(marie) -> true

f) Qui est la mère de jean ?
parent(X,jean),femme(X) -> true

g) Quels sont les enfants de paul ?
parent(paul,X) ->
	X = bertrand
	X = sophie
	X = edgar

h) Quels sont les hommes qui sont pères ?
parent(X,Y),homme(X) ->
	X = albert
	X = jean
	X = paul
	X = louis
*/