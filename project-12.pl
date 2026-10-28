solution([], _, _).
solution([Q|Queens], Row, N) :-
    member(Q, [1,2,3,4,5,6,7,8]), % 8-Queens board
    safe(Q, Queens, 1),
    NextRow is Row + 1,
    solution(Queens, NextRow, N).

safe(_, [], _).
safe(Q, [Q1|Queens], D) :-
    Q =\= Q1,
    Q + D =\= Q1,
    Q - D =\= Q1,
    D1 is D + 1,
    safe(Q, Queens, D1).

n_queens(N, Queens) :-
    length(Queens, N),
    solution(Queens, 1, N).