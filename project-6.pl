% edge(Node1, Node2)
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(d, e).

% BFS Path Finder
bfs([[Goal|Path] | _], Goal, [Goal|Path]).
bfs([[Node|Path] | Queue], Goal, FinalPath) :-
    findall([Next, Node | Path],
            (edge(Node, Next), \+ member(Next, [Node|Path])),
            NewPaths),
    append(Queue, NewPaths, UpdatedQueue),
    bfs(UpdatedQueue, Goal, FinalPath).

% Wrapper
shortest_path(Start, Goal, Path) :-
    bfs([[Start]], Goal, RevPath),
    reverse(RevPath, Path).