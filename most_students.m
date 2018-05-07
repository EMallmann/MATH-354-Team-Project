%returns index of the highest value in a vector
%in this case the most amount of students available
function time_slot_position = most_students(students) 
   time_slot_position = 1; %index of highest value = 1
   most_students = students(1); %highest number = first value in vector
   
   for ii = 1:length(students)
       
       if students(ii) > most_students %if current value in the vector is greater than the current highest value
           most_students = students(ii); %highest value = current value in vector
           time_slot_position = ii; %index of highest value = index of current value
       end %ends higher number check
       
   end %ends loop through vector
   
end %ends most_students function 
