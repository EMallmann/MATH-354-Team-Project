%Claire A, John K, Eric M, Nathan P, Nathan W
%Team Project Test Case
%2/27/18


%returns a string of the best time slot; takes a string of the class user
%wants to input, and a vector of the available times
function time_slot = find_best_time(isM, isT,isW,isR,isF,times,name_of_class) 
    
     %load majors, num majors, and common courses for each major matrices
     majors = courses_for_majors();
     load('CCC_organized.mat', 'common_courses');
     majors_required_classes = common_courses;
     load('majors.mat', 'major_counts');
     
     
    num_majors = major_counts; %corresponds to majors vector; 
    possible_times = times;
    time_slot_students = zeros(1, length(possible_times)); %creates vector of zeros representing available students at each time slot
    
     
     %return open classes and their respective open seats in two matrices from class_times function  
    [open_classes,open_seats] = class_times(isM, isT, isW, isR, isF, times);
   
                           
    
                  
   
     time_slot_index = 1; %initialize spot to store available students (1 = 9 AM, 2 = 10AM...)
     total_students = 0; %initialize total amount of available students
     for ii = 1:length(open_classes(:,1)) %for each time slot
          for jj = 1:length(majors) %for each major
                %update the number of students with conflicts at each time
                %the open seats for each class, and the number majors
                %still available
                [conflicts, open_seats(ii, :), num_majors(jj)] = consider_open_seats(open_seats(ii, :), open_classes(ii, :), majors_required_classes(jj, :), num_majors(jj));
               
                %does the major take this class? If so, subtract avaible
                %students by how many have a potential conflict
                if num_majors(jj) - conflicts > 0 && length(intersect(majors_required_classes(jj,:),name_of_class)) > 0
                    total_students = total_students + (num_majors(jj) -conflicts);
                end
                
          end %ends for loop for each major
         time_slot_students(time_slot_index) = total_students; %put the total amount of open students into the open students at each time slot vector
          time_slot_index = time_slot_index + 1; %move the index to the next spot
  
          total_students = 0;%reset amount of availablle students
     end %ends for loop for each time slot 
   
    
    time_slot = possible_times(most_students(time_slot_students)); %timeslot = times(index of most available students)
end %ends find_best_time function
