#Query to select type from user with username variable
select type from user where email = '{username}';

#Query to select password from user with username variable
select password from user where email= '{username}';

#Query to select user_id from user with email variable
select user_id from user where email= '{username}';

#Query for getting first name, last name from student with user_id as variable
select first_name, last_name from student where student_id= {userid};

#Query for getting details of course enrolled in by the student
select credits, course_name from course where course_id in (select course_id from enrolled_course where student_id={userid});

#Query to get number of enrolled courses
select COUNT_ENROLLED_COURSES_final({userid});

#Query to get assignment grades
select agrade.grade_value, course.Course_name from assignmentgrade agrade natural join assignment natural join course where student_id={userid};

#Query to midesem grades
select agrade.grade_value, course.Course_name from midsemgrade agrade natural join midsem natural join course where student_id={userid};

#Query to get quiz grades
select agrade.grade_value, course.Course_name from quizgrade agrade natural join quiz natural join course where student_id={userid};

#Query to get compre grades
select agrade.grade_value, course.Course_name from compregrade agrade natural join compre natural join course where student_id={userid};

#Query to get courses taught by instructor
select course.course_name from course natural join course_instructor natural join instructor;