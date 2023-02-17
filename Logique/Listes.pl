premier(X,L):- [X|_]=L.
appartient(X,L):- premier(X,L).
appartient(X,[Y|L]):- appartient(X,L),Y\==X.

non_appartient(X,L):- \+ appartient(X,L).

sans_repetition([]).
sans_repetition([Y|L]):- non_appartient(Y,L),sans_repetition(L).

ajout_tete(X,L1,L2):- [X|L1]=L2.

ajout_queue(X,[],L2):- [X]=L2.
ajout_queue(X,[Y|L1],[Y|L2]):- ajout_queue(X,L1,L2).

supprimer(_,[],[]).
supprimer(X,[X|L1],L2):- L1=L2.
supprimer(X,[Y|L1],[Y|L2]):- supprimer(X,L1,L2).

supprimer_fin([_],[]).
supprimer_fin([Y|L1],[Y|L2]):- supprimer_fin(L1,L2).

fusion([],L2,L3):- L2=L3.
fusion(L1,[],L3):- L1=L3.
fusion(L1,L2,L3):- fusionL1(L1,L2,L3).
fusionL1([],L2,L3):- L2=L3.
fusionL1([X|L1],L2,[X|L3]):- fusionL2(L1,L2,L3).
fusionL2(L1,[],L3):- L1=L3.
fusionL2(L1,[X|L2],[X|L3]):- fusionL1(L1,L2,L3).