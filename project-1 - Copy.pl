% Facts: student(Name), course(CourseCode), enrolled(Name, CourseCode)
student(alice).
student(bob).
course(cs101).
course(cs102).

enrolled(alice, cs101).
enrolled(alice, cs102).
enrolled(bob, cs101).

% Rule: takes_course(Student, Course)
takes_course(S, C) :- student(S), enrolled(S, C).