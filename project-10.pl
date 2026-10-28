accept_prob(DeltaE, Temp, Prob) :-
    Prob is exp(DeltaE / Temp).

simulated_annealing(Current, Temp, CoolingRate, FinalState) :-
    Temp > 0.1,
    neighbor(Current, Next),
    score(Next, S_next),
    score(Current, S_curr),
    DeltaE is S_next - S_curr,
    ( DeltaE > 0 ->
        NewState = Next
    ;   random(0.0, 1.0, R),
        accept_prob(DeltaE, Temp, P),
        ( R < P -> NewState = Next ; NewState = Current )
    ),
    NewTemp is Temp * CoolingRate,
    simulated_annealing(NewState, NewTemp, CoolingRate, FinalState).
simulated_annealing(Current, Temp, _, Current) :-
    Temp =< 0.1.