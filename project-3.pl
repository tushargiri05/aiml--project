% Member
my_member(X, [X|_]).
my_member(X, [_|Tail]) :- my_member(X, Tail).

% Length
my_length([], 0).
my_length([_|Tail], N) :-
    my_length(Tail, N1),
    N is N1 + 1.

% Append
my_append([], L, L).
my_append([H|T], L2, [H|Res]) :-
    my_append(T, L2, Res).

% Reverse
my_rev([], []).
my_rev([H|T], Rev) :-
    my_rev(T, RevT),
    my_append(RevT, [H], Rev).