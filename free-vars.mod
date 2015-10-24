module free-vars.

app emty L L.
app (cons E L1) L2 (cons E L3) :- app L1 L2 L3.

mem X (cons X L).
mem X (cons Y L) :- mem X L.

fv_fm (imp F1 F2) L L' :- fv_fm F1 L L1, fv_fm F2 L L2, app L1 L2 L'.
fv_fm (all P) L L' :- pi x \ bind x => fv_fm (P x) L L'.
fv_fm (eq N1 N2) L L' :- fv_tm N1 L L1, fv_tm N2 L L2, app L1 L2 L'.
fv_fm (ad N1 N2) L L' :- fv_tm N1 L L1, fv_tm N2 L L2, app L1 L2 L'.

fv_tm z L emty.
fv_tm (s X) L L' :- fv_tm X L L'.
fv_tm X L emty :- bind X.
fv_tm X L (cons X emty) :- mem X L.

free_in_fm X (imp F1 F2) :- free_in_fm X F1.
free_in_fm X (imp F1 F2) :- free_in_fm X F2.
free_in_fm X (all P) :- pi y \ free_in_fm X (P y).
free_in_fm X (eq F1 F2) :- free_in_tm X F1.
free_in_fm X (eq F1 F2) :- free_in_tm X F2.
free_in_fm X (ad F1 F2) :- free_in_tm X F1.
free_in_fm X (ad F1 F2) :- free_in_tm X F2.

free_in_tm X (s Y) :- free_in_tm X Y.
free_in_tm X X.
