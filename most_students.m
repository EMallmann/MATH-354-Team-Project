function time_slot_position = most_students(students)
   time_slot_position = 1;
   most_students = students(1);
   for ii = 1:length(students)
       if students(ii) > most_students
           most_students = students(ii);
           time_slot_position = ii; 
       end
   end
end
