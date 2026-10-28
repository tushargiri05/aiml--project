score(a, 10).
score(b, 25).
score(c, 15).
score(d, 40).
score(e, 35).

neighbor(a, b).
neighbor(a, c).
neighbor(b, d).
neighbor(b, e).

hill_climb(Current, Current) :-
    \+ (neighbor(Current, Next), score(Next, S_next), score(Current, S_curr), S_next > S_curr).
hill_climb(Current, Best) :-
    neighbor(Current, Next),
    score(Next, S_next),
    score(Current, S_curr),
    S_next > S_curr,
    hill_climb(Next, Best).