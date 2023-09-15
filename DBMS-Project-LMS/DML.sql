#INSERT QUERIES 

INSERT INTO User (User_id, Email, Password, Type)
VALUES 
(1, 'amit.singh@dubai.bits-pilani.ac.in', 'password1', 0),
(2, 'mohit.sharma@dubai.bits-pilani.ac.in', 'password2', 0),
(3, 'anushka.jain@dubai.bits-pilani.ac.in', 'password3', 0),
(4, 'dhruv.agarwal@dubai.bits-pilani.ac.in', 'password4', 0),
(5, 'smita.patel@dubai.bits-pilani.ac.in', 'password5', 0),
(6, 'vivek.sharma@dubai.bits-pilani.ac.in', 'password6', 0),
(7, 'sneha.mishra@dubai.bits-pilani.ac.in', 'password7', 0),
(8, 'neha.joshi@dubai.bits-pilani.ac.in', 'password8', 0),
(9, 'saurabh.gupta@dubai.bits-pilani.ac.in', 'password9', 0),
(10, 'priya.shah@dubai.bits-pilani.ac.in', 'password10', 0),
(11, 'amrita.ray@dubai.bits-pilani.ac.in', 'password11', 1),
(12, 'rahul.sharma@dubai.bits-pilani.ac.in', 'password12', 1),
(13, 'pooja.sharma@dubai.bits-pilani.ac.in', 'password13', 1),
(14, 'kunal.mehta@dubai.bits-pilani.ac.in', 'password14', 1),
(15, 'neha.singh@dubai.bits-pilani.ac.in', 'password15', 1),
(16, 'rushit@dubai.bits-pilani.ac.in', 'password16', 2),
(17, 'riddhi@dubai.bits-pilani.ac.in', 'password17', 2),
(18, 'shivam@dubai.bits-pilani.ac.in', 'password18', 2),
(19, 'yohan@dubai.bits-pilani.ac.in', 'password19', 2),
(20, 'lexy', 123, 0),
(21, 'rahul.gupta@dubai.bits-pilani.ac.in', 'password21', 0),
(22, 'neha.shah@dubai.bits-pilani.ac.in', 'password22', 0),
(23, 'rajesh.verma@dubai.bits-pilani.ac.in', 'password23', 0),
(24, 'priya.sinha@dubai.bits-pilani.ac.in', 'password24', 0),
(25, 'aryan.malhotra@dubai.bits-pilani.ac.in', 'password25', 0),
(26, 'sneha.mehta@dubai.bits-pilani.ac.in', 'password26', 0),
(27, 'ravi.kumar@dubai.bits-pilani.ac.in', 'password27', 0),
(28, 'kavita.gupta@dubai.bits-pilani.ac.in', 'password28', 0),
(29, 'ajay.sharma@dubai.bits-pilani.ac.in', 'password29', 0),
(30, 'riya.agarwal@dubai.bits-pilani.ac.in', 'password30', 0),
(31, 'amit.patel@dubai.bits-pilani.ac.in', 'password31', 0),
(32, 'ananya.chopra@dubai.bits-pilani.ac.in', 'password32', 0),
(33, 'vikram.sharma@dubai.bits-pilani.ac.in', 'password33', 0),
(34, 'pooja.verma@dubai.bits-pilani.ac.in', 'password34', 0),
(35, 'rahul.gupta@dubai.bits-pilani.ac.in', 'password35', 0),
(36, 'neha.sinha@dubai.bits-pilani.ac.in', 'password36', 0),
(37, 'rajesh.malhotra@dubai.bits-pilani.ac.in', 'password37', 0),
(38, 'priya.mehta@dubai.bits-pilani.ac.in', 'password38', 0),
(39, 'aryan.kumar@dubai.bits-pilani.ac.in', 'password39', 0),
(40, 'sneha.gupta@dubai.bits-pilani.ac.in', 'password40', 0);


desc course;


INSERT INTO Course (Course_ID, Course_Name, Course_Description, Credits)
VALUES
    (1, 'Introduction to Programming', 'Learn the basics of programming',2),
    (2, 'Database Systems', 'Explore the design and implementation of database systems',4),
    (3, 'Web Development', 'Learn how to build dynamic web applications',2),
    (4, 'Algorithms and Data Structures', 'Learn algorithms and data structures for efficient computing',4),
    (5, 'Machine Learning', 'Study machine learning algorithms and techniques',3),
    (6, 'Artificial Intelligence', 'Explore the fundamentals of artificial intelligence and machine learning',3);
    
    INSERT INTO Course (Course_ID, Course_Name, Course_Description, Credits)
VALUES
    (7, 'Math101', 'Introduction to calculus', 3),
    (8, 'CS101', 'Introduction to computer science', 4),
    (9, 'Eng101', 'Composition and rhetoric', 3),
    (10, 'Bio101', 'Introduction to biology', 4),
    (11, 'Hist101', 'Western civilization', 3),
    (12, 'Econ101', 'Principles of microeconomics', 3);

    
insert into Enrolled_Course (   Student_ID, Course_ID, Enrollment_Date, Completion_Date )
    values
    (  20, 2, curdate() , date_add(date(now()), interval 30 day) ),
    ( 20, 5, curdate() , date_add(date(now()), interval 30 day) ),
    (  20, 7, curdate() , date_add(date(now()), interval 30 day) ),
    (  20, 10, curdate() , date_add(date(now()), interval 30 day) ),
    ( 20, 6,curdate()  , date_add(date(now()), interval 30 day) ),
    (  1, 1,curdate()  ,  date_add(date(now()), interval 30 day)),
    (  1, 4, curdate() , date_add(date(now()), interval 30 day) ),
    (  1, 2, curdate() , date_add(date(now()), interval 30 day) ),
    (  1, 10, curdate() , date_add(date(now()), interval 30 day) ),
    (  1, 9, curdate() , date_add(date(now()), interval 30 day) );
	
    
    
INSERT INTO Instructor (Instructor_ID, First_Name, Last_Name, Phone_No, Chamber_No)
VALUES 
(11, 'Amit', 'Ray', '+91-9876543210', 'C-101'),
(12, 'Rahul', 'Sharma', '+91-8765432109', 'D-202'),
(13, 'Pooja', 'Sharma', '+91-7654321098', 'A-303'),
(14, 'Kunal', 'Mehta', '+91-6543210987', 'B-404'),
(15, 'Neha', 'Singh', '+91-5432109876','C-231');
   
   
insert into Course_Instructor(Instructor_ID ,Course_ID)
values
(11,1),
(12,2),
(13,3),
(14,4),
(15,5),
(22,6),
(23,7),
(24,8),
(25,9),
(26,10),
(30,11),
(32,12);




insert into Registered_Section ( Section_ID ,Student_ID ,Instructor_ID ,Timing, Course_ID)
values
(1, 20, 12, '2nd', 2),
(3, 20, 15, '5th', 5),
(2, 20, 23, '3rd', 7),
(2, 20, 26, '1st', 10),
(2, 20, 22, '4th', 6),
(3, 1, 11, '5th', 1),
(3, 1, 14, '3rd', 4),
(2, 1, 12, '2nd', 2),
(1, 1, 26, '1st', 10),
(3, 1, 25, '4th', 9);



INSERT INTO Quiz (Quiz_ID, Course_ID, Instructor_ID, Quiz_Title, Date)
VALUES
(1, 2, 12, 'Quiz1', '2023-04-10'),
(2, 6, 22, 'Quiz1', '2023-04-14'),
(3, 7, 23, 'Quiz1', '2023-04-18'),
(4, 1, 11, 'Quiz1', '2023-04-11'),
(5, 10, 26, 'Quiz1', '2023-04-15'),
(6, 9, 25,'Quiz1', '2023-04-20');



INSERT INTO Midsem (Midsem_ID, Course_ID, Instructor_ID, Date)
VALUES 
(1, 2, 12, '2023-05-15'),	
(2, 6, 22, '2023-05-16'),
(3, 7, 23, '2023-05-17'),	
(4, 1, 11, '2023-05-15'),	-- student 2
(5, 10, 26, '2023-05-16'),
(6, 9, 25, '2023-05-17');





INSERT INTO MidsemGrade (MidsemGrade_ID, Midsem_ID, Student_ID, Grade_Value) 
VALUES 
         (1, 1, 20, 45.5),	
        (2, 2, 20, 58.2),
        (3, 3, 20, 50.0),
        (4, 4, 1, 59.9),	-- student 2
        (5, 5, 1, 55.7),
        (6, 6, 1, 40.0);




INSERT INTO QuizGrade (QuizGrade_ID, Quiz_ID, Student_ID, Grade_Value) 
VALUES 
(1, 1, 20, 18.50),
(2, 2, 20, 19.00),
(3, 3, 20, 16.75),
(4, 4, 1, 17.25),
(5, 5, 1, 18.00),
(6, 6, 1, 19.50);



INSERT INTO Compre (Compre_ID, Course_ID, Instructor_ID, Date)
VALUES 
(1, 2, 12, '2023-07-01'),	
(2, 6, 22, '2023-07-02'),
(3, 7, 23, '2023-07-03'),
(4, 1, 11, '2023-07-01'),	-- student 2
(5, 10, 26, '2023-07-02'),
(6, 9, 25, '2023-07-03');




INSERT INTO CompreGrade (CompreGrade_ID, Compre_ID, Student_ID, Grade_Value) VALUES 
  (1, 1, 20, 75),	
  (2, 2, 20, 60),
  (3, 3, 20, 80),
  (4, 4, 1, 90),	-- student 2
  (5, 5, 1, 70),
  (6, 6, 1, 85);
  

  
  