% student_marks(Name, Marks)
student_marks(alice, 92).
student_marks(bob, 65).
student_marks(charlie, 35).

% Rules for classification
performance(Name, topper) :-
    student_marks(Name, M),
    M >= 85.

performance(Name, average) :-
    student_marks(Name, M),
    M >= 50,
    M < 85.

performance(Name, fail) :-
    student_marks(Name, M),
    M < 50.