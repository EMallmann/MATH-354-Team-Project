function subtract_conflicts = consider_open_seats(open_seats, time_slot, major_required, num_students)
    subtract_conflicts = 0;                   % intializing subtract_conflicts and setting as 0
    seats = open_seats;                       % sets seats to the passed in vector open_seats
    students = num_students;                  % sets the vector students to the passed in vector num_students
    
    for ii = 1: length(time_slot)             %iterating over times the classes are offers
        for jj = 1 : length(major_required)   %iterating over students of a certain major
            
           if time_slot(ii) == major_required(jj) && time_slot(ii) ~= "" && major_required(jj) ~= ""  
                                              % the && statements are used to ignore blank spaces in the respectful vectors
               if open_seats(ii) >= students
                    subtract_conflicts = subtract_conflicts + students;
                                              %update students and open seats
               else
                    subtract_conflicts = subtract_conflicts + open_seats(ii);
                                              %update students and open seats
               end % ends inner if-else statement
           end % ends outter if statements
        end % ends the inner for loop iterating over students in a major
    end % ends the outer for loop iterating over times classes are offered
end  % ends the function passing the amount of conflicts back to subtract from the total conflicts in the main function
