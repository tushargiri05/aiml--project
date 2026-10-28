% timetable(Course, Day, Time, Room, Faculty)
timetable(cs101, monday, '10:00', room_a, dr_smith).
timetable(cs102, tuesday, '11:00', room_b, dr_jones).

% Query helper: faculty_schedule(Faculty, Day, Course, Room)
faculty_schedule(Faculty, Day, Course, Room) :-
    timetable(Course, Day, _, Room, Faculty).