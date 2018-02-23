function subtract_conflicts = consider_open_seats(open_seats, time_slot, major_required, num_students)
    subtract_conflicts = 0;
    seats = open_seats;
    students = num_students;
    for ii = 1: length(time_slot)
        for jj = 1 : length(major_required)
            
           if time_slot(ii) == major_required(jj) && time_slot(ii) ~= "" && major_required(jj) ~= "" %&& students(jj) > 0
               if open_seats(ii) >= students
                    subtract_conflicts = subtract_conflicts + students;
                    %update students and open seats
               else
                    subtract_conflicts = subtract_conflicts + open_seats(ii);
                    %update students and open seats
               end
                
                
           end
        end
    end
    
end
