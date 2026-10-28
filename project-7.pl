% heuristic(Node, H_Value)
heuristic(a, 5).
heuristic(b, 3).
heuristic(c, 4).
heuristic(d, 1).
heuristic(goal, 0).

edge(a, b, 2).
edge(a, c, 3).
edge(b, d, 4).
edge(c, goal, 5).
edge(d, goal, 1).

greedy([[Node|Path] | _], Goal, [Node|Path]) :- Node = Goal.
greedy([[Node|Path] | Queue], Goal, FinalPath) :-
    findall([Next, Node | Path],
            (edge(Node, Next, _), \+ member(Next, [Node|Path])),
            NewPaths),
    append(Queue, NewPaths, UnsortedQueue),
    sort_by_heuristic(UnsortedQueue, SortedQueue),
    greedy(SortedQueue, Goal, FinalPath).

sort_by_heuristic(Paths, Sorted) :-
    map_list_to_pairs(heuristic_val, Paths, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, Sorted).

heuristic_val([Node|_], H) :- heuristic(Node, H).