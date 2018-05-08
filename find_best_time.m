%Claire A, John K, Eric M, Nathan P, Nathan W
%Team Project Test Case
%2/27/18


%returns a string of the best time slot; takes a string of the class user
%wants to input, and a vector of the available times
function time_slot = find_best_time(isM, isT,isW,isR,isF,times,name_of_class) 
    
     majors = courses_for_majors();
     load('CCC_organized.mat', 'common_courses');
     majors_required_classes = common_courses;
     % Uncomment the next two lines to perform test case
     %majors = majors(218:219, :);
     %majors_required_classes = majors_required_classes(218:219,: );
     
     
    num_majors = 13*ones(1,length(majors)); %corresponds to majors vector; 10 econ majors, 20 business majors, etc. %do not have data, 10 used as placeholder
    possible_times = times;
    time_slot_students = zeros(1, length(possible_times)); %creates vector of zeros representing available students at each time slot
    
     
       
    [open_classes,open_seats] = class_times(isM, isT, isW, isR, isF, times);
   
                           
    
                  
   
     time_slot_index = 1; %initialize spot to store available students (1 = 9 AM, 2 = 10AM...)
     total_students = 0; %initialize total amount of available students
     for ii = 1:length(open_classes(:,1)) %for each time slot
          for jj = 1:length(majors) %for each major
                [conflicts, open_seats(ii, :), num_majors(jj)] = consider_open_seats(open_seats(ii, :), open_classes(ii, :), majors_required_classes(jj, :), num_majors(jj));
                if num_majors(jj) - conflicts > 0 && length(intersect(majors_required_classes(jj,:),name_of_class)) > 0
                    total_students = total_students + (num_majors(jj) -conflicts);
                end
          end %ends for loop for each major
         time_slot_students(time_slot_index) = total_students; %put the total amount of open students into the open students at each time slot vector
          time_slot_index = time_slot_index + 1; %move the index to the next spot
  
          total_students = 0;%reset amount of availablle students
     end %ends for loop for each time slot 
     display(time_slot_students);% creates a bar graph of open students at each time slot
    
    time_slot = possible_times(most_students(time_slot_students)); %timeslot = times(index of most available students)
end %ends find_best_time function
