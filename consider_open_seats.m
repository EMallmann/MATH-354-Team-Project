%returns the amount of students open to take the new class for one major at one time period
%takes a matrix of the open number of seats, a string for the time
%period, a matrix of the required classes for the major, and the number of
%students in the major

%Assumes worst case scenario for dept making new class - every student
%who has the class required will fill up a different class that is required
%for that student at the same time period instead of this one first.

function [open_students_at_time_slot,open_seats,students] = consider_open_seats(open_seats, time_slot, major_required, num_students)
    open_students_at_time_slot = 0; %initialize open students at 0.
    students = num_students;
    for ii = 1: length(time_slot) %for each time period
        for jj = 1 : length(major_required) %for each major
            
           if time_slot(ii) == major_required(jj) && time_slot(ii) ~= "" && major_required(jj) ~= "" %does the student need this class? && exclude empty strings matching
               if open_seats(ii) >= students %more seats than students
                    open_students_at_time_slot = open_students_at_time_slot + students; %add number of students available 
                   open_seats(ii) = open_seats(ii) - students; %adjust the number of open seats
                    students = 0; %number of students open to take classes at this time period zero
                    
               else %more students than seats
                    open_students_at_time_slot = open_students_at_time_slot + open_seats(ii); %add number of seats available
                   open_seats(ii) = 0; %no open seats left
                   students = students - open_seats(ii); %adjust the number of students to open to take classes at this time period
                  
                    
               end %ends students and seats check
           end %ends class required = class at time check
        end %ends each major
    end %ends each time slot
end %ends consider_open_seats function
