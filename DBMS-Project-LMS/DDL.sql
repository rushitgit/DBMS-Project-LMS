CREATE SCHEMA `student_erp` ;
use `student_erp` ;

#CREATE STATEMENTS- DDL
CREATE TABLE User (
    User_id INT PRIMARY KEY,
    Email VARCHAR(100),
    Password VARCHAR(40),
    Type int
); 

CREATE TABLE Student (
   
    Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(25),
    Last_Name VARCHAR(30),
    Date_of_Birth DATE,
    Address VARCHAR(255),
    Phone_No VARCHAR(15),
    FOREIGN KEY (Student_id) REFERENCES User(User_id)
);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY ,
    Course_Name VARCHAR(55),
    Course_Description VARCHAR(100),
    Credits INT
);

CREATE TABLE Enrolled_Course (
    Enrolled_Course_ID INT PRIMARY KEY AUTO_INCREMENT,
    Student_ID INT,
    Course_ID INT,
    Enrollment_Date DATE,
    Completion_Date DATE,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

CREATE TABLE Instructor (
    Instructor_ID INT PRIMARY KEY,
    First_Name VARCHAR(25),
    Last_Name VARCHAR(50),
    Phone_No VARCHAR(15),
    Chamber_No VARCHAR(10)
);

CREATE TABLE Section (
    Section_ID INT PRIMARY KEY,
    Class_number VARCHAR(10)
);

CREATE TABLE Registered_Section (
    Section_ID INT,
    Student_ID INT,
    Instructor_ID INT,
    Timing VARCHAR(20),
    course_id int,
    FOREIGN KEY (Section_ID) REFERENCES Section(Section_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID),
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id)
);


CREATE TABLE Course_Instructor (
    Instructor_ID INT,
    Course_ID INT,
    FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

CREATE TABLE Assignment (
    Assignment_ID INT PRIMARY KEY auto_increment,
    Course_ID INT,
    Instructor_ID INT,
    Assignment_Title VARCHAR(255),
    Assignment_Description VARCHAR(255),
    Due_Date DATE,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
    FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID)
);

CREATE TABLE AssignmentGrade (
    Assignment_ID INT,
    Student_ID INT,
    Grade_Value DECIMAL(4,2),
    PRIMARY KEY (Assignment_ID, Student_ID),
    FOREIGN KEY (Assignment_ID) REFERENCES Assignment(Assignment_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

CREATE TABLE Quiz (
    Quiz_ID INT PRIMARY KEY,
    Course_ID INT,
    Instructor_ID INT,
    Quiz_Title VARCHAR(255),
    Date DATE,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
    FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID)
);

CREATE TABLE QuizGrade (
    QuizGrade_ID INT PRIMARY KEY,
    Quiz_ID INT,
    Student_ID INT,
    Grade_Value DECIMAL(4,2),
    FOREIGN KEY (Quiz_ID) REFERENCES Quiz(Quiz_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

CREATE TABLE Midsem (
    Midsem_ID INT PRIMARY KEY,
    Course_ID INT,
    Instructor_ID INT,
    Date DATE,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
    FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID)
);

CREATE TABLE MidsemGrade (
    MidsemGrade_ID INT PRIMARY KEY,
    Midsem_ID INT,
    Student_ID INT,
    Grade_Value DECIMAL(4,2),
    FOREIGN KEY (Midsem_ID) REFERENCES Midsem(Midsem_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

CREATE TABLE Compre (
  Compre_ID INT PRIMARY KEY,
  Course_ID INT,
  Instructor_ID INT,
  Date DATE,
  FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
  FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID)
);

CREATE TABLE CompreGrade (
  CompreGrade_ID INT PRIMARY KEY,
  Compre_ID INT,
  Student_ID INT,
  Grade_Value INT,
  FOREIGN KEY (Compre_ID) REFERENCES Compre(Compre_ID),
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);








#A function to retrieve the highest grade for a given student in a given course:

Delimiter //
CREATE FUNCTION max_student_grade(student_id INT, course_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE max_grade INT;
  SELECT MAX(Grade_Value) INTO max_grade FROM AssignmentGrade WHERE Student_ID = student_id AND Course_ID = course_id;
  RETURN max_grade;
END//
Delimiter ;

#A function to calculate the average grade for a given course:

Delimiter //
CREATE FUNCTION avg_course_grades(course_id INT)
RETURNS DECIMAL(4,2)
DETERMINISTIC
BEGIN
  DECLARE avg_grade DECIMAL(4,2);
  SELECT AVG(Grade_Value) INTO avg_grade FROM AssignmentGrade group by course_id having course_id= course_id;
  RETURN avg_grade;
END//
Delimiter ;



Delimiter //
CREATE FUNCTION avg_course_grades_midsem(course_id INT)
RETURNS DECIMAL(4,2)
DETERMINISTIC
BEGIN
  DECLARE avg_grade DECIMAL(4,2);
  SELECT AVG(Grade_Value) INTO avg_grade FROM midsemgrade group by course_id having course_id= course_id;
  RETURN avg_grade;
END//
Delimiter ;


Delimiter //
CREATE FUNCTION avg_course_grades_compre(course_id INT)
RETURNS DECIMAL(4,2)
DETERMINISTIC
BEGIN
  DECLARE avg_grade DECIMAL(4,2);
  SELECT AVG(Grade_Value) INTO avg_grade FROM compregrade group by course_id having course_id= course_id;
  RETURN avg_grade;
END//
Delimiter ;




Delimiter //
CREATE FUNCTION avg_course_grades_quiz(course_id INT)
RETURNS DECIMAL(4,2)
DETERMINISTIC
BEGIN
  DECLARE avg_grade DECIMAL(4,2);
  SELECT AVG(Grade_Value) INTO avg_grade FROM quizgrade group by course_id having course_id= course_id;
  RETURN avg_grade;
END//
Delimiter ;






#A function that takes a student ID as input and returns the total number of courses the student is currently enrolled in.

Delimiter //
CREATE FUNCTION COUNT_ENROLLED_COURSES_final(std_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE num_courses INT;
    SELECT COUNT(*) INTO num_courses
    FROM Enrolled_Course group by student_id having student_id= std_id ;
    RETURN num_courses;
END//
Delimiter ;