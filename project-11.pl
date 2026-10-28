color(red).
color(blue).
color(green).

map_color(WA, NT, SA, Q, NSW, V) :-
    color(WA), color(NT), color(SA),
    color(Q), color(NSW), color(V),
    WA \= NT,
    WA \= SA,
    NT \= SA,
    NT \= Q,
    SA \= Q,
    SA \= NSW,
    SA \= V,
    Q \= NSW,
    NSW \= V.