%Claire A, John K, Eric M, Nathan P, Nathan W
%Team Project Test Case
%2/27/18


%returns a string of the best time slot; takes a string of the class user
%wants to input, and a vector of the available times
function time_slot = find_best_time(name_of_class, times, isMWF) 
    [majors, majors_required_classes] =_courses_for_majors();
     %majors = list of majors (to be implemented with Excel file)
     %majors_required_classes = each row is for each major of the majors vector
     
     
    num_majors = 10*ones(1,length(majors)); %corresponds to majors vector; 10 econ majors, 20 business majors, etc. %do not have data, 10 used as placeholder
    possible_times = times; 
    time_slot_students = zeros(1, length(possible_times)); %creates vector of zeros representing available students at each time slot
    
     
       
    open_classes = ["Econ 104", "Math 109", "Math 246";
                      "Math 246", "", ""]; %each row is for a different time slot (9,10)
                           
    open_seats = [20 , 5 , 10;
                    1 , 0 , 0]; %each row corresponds to each time slot, each column represents the open seats in its corresponding class below
                  
   
    time_slot_index = 1; %initialize spot to store available students (1 = 9 AM, 2 = 10AM...)
    total_students = 0; %initialize total amount of available students
    for ii = 1:length(open_classes(:,1)) %for each time slot
         for jj = 1:length(majors) %for each major
               total_students = total_students + (num_majors(jj) - consider_open_seats(open_seats(ii, :), open_classes(ii, :), majors_required_classes(jj, :), num_majors(jj))); %add available students for each major for each hour to a running total
         end %ends for loop for each major
         time_slot_students(time_slot_index) = total_students; %put the total amount of open students into the open students at each time slot vector
         time_slot_index = time_slot_index + 1; %move the index to the next spot
   
         total_students = 0;%reset amount of availablle students
    end %ends for loop for each time slot 
    bar(time_slot_students);% creates a bar graph of open students at each time slot
    
    time_slot = possible_times(most_students(time_slot_students)); %timeslot = times(index of most available students)
end %ends find_best_time function
