# Tables involved

## User Table

The `User` table contains information about users in the system. Each user is identified by a unique `User_id`, and has an associated email address, username, password, and user type (student or instructor).

| Column   | Type         | Constraints |
|----------|--------------|-------------|
| User_id  | INT          | PRIMARY KEY |
| Email    | VARCHAR(255) |             |
| Password | VARCHAR(255) |             |
| Type     | VARCHAR(255) |             |

## Student Table

The `Student` table contains information about students in the system. Each student is associated with a `User_id`, and has an associated student ID, first name, last name, date of birth, address, and phone number.

| Column        | Type         | Constraints                           |
|---------------|--------------|---------------------------------------|
| User_id       | INT          | FOREIGN KEY (references User.User_id) |
| Student_ID    | INT          | PRIMARY KEY                           |
| First_Name    | VARCHAR(255) |                                       |
| Last_Name     | VARCHAR(255) |                                       |
| Date_of_Birth | DATE         |                                       |
| Address       | VARCHAR(255) |                                       |
| Phone_No      | VARCHAR(255) |                                       |

## Course Table

The `Course` table contains information about courses in the system. Each course is identified by a unique `Course_ID`, and has an associated course name, course description, and number of credits.

| Column             | Type         | Constraints |
|--------------------|--------------|-------------|
| Course_ID          | INT          | PRIMARY KEY |
| Course_Name        | VARCHAR(255) |             |
| Course_Description | VARCHAR(255) |             |
| Credits            | INT          |             |

## Enrolled_Course Table

The `Enrolled_Course` table contains information about courses that students are enrolled in. Each enrolled course is associated with a unique `Enrolled_Course_ID`, a student ID, a course ID, and the enrollment and completion dates.

| Column             | Type         | Constraints                                  |
|--------------------|--------------|----------------------------------------------|
| Enrolled_Course_ID | INT          | PRIMARY KEY                                  |
| Student_ID         | INT          | FOREIGN KEY (references Student.Student_ID) |
| Course_ID          | INT          | FOREIGN KEY (references Course.Course_ID)   |
| Enrollment_Date    | DATE         |                                              |
| Completion_Date    | DATE         |                                              |

## Instructor Table

The `Instructor` table contains information about instructors in the system. Each instructor is identified by a unique `Instructor_ID`, and has an associated first name, last name, phone number, and chamber number.

| Column       | Type         | Constraints |
|--------------|--------------|-------------|
| Instructor_ID | INT          | PRIMARY KEY |
| First_Name   | VARCHAR(255) |             |
| Last_Name    | VARCHAR(255) |             |
| Phone_No     | VARCHAR(255) |             |
| Chamber_No   | VARCHAR(255) |             |

## Section Table

The `Section` table contains information about sections in the system. Each section is identified by a unique `Section_ID`, and has an associated class number.

| Column     | Type         | Constraints |
|------------|--------------|-------------|
| Section_ID | INT          | PRIMARY KEY |
| Class_number | VARCHAR(255) |             |

Here are the markdown tables for each of the given tables:

### Registered_Section Table

The Registered_Section table contains information about registered sections in the system. Each registered section is associated with a unique Section_ID, Course_ID, Student_ID, Instructor_ID, and Timing.

| Column         | Type        | Constraints                          |
| -------------- | -----------| ------------------------------------|
| Section_ID     | INT         | FOREIGN KEY, PRIMARY KEY             |
| Course_ID      | INT         | FOREIGN KEY                           |
| Student_ID     | INT         | FOREIGN KEY                           |
| Instructor_ID  | INT         | FOREIGN KEY                           |
| Timing         | VARCHAR(255)|                                       |


### Course_Instructor Table

The Course_Instructor table contains information about course instructors in the system. Each course instructor is associated with a unique Instructor_ID and Course_ID.

| Column         | Type        | Constraints                          |
| -------------- | -----------| ------------------------------------|
| Instructor_ID  | INT         | FOREIGN KEY, PRIMARY KEY             |
| Course_ID      | INT         | FOREIGN KEY                           |


### Assignment Table

The Assignment table contains information about assignments in the system. Each assignment is identified by a unique Assignment_ID and is associated with a Course_ID, Instructor_ID, Assignment_Title, Assignment_Description, and Due_Date.

| Column             | Type        | Constraints                          |
| ------------------ | -----------| ------------------------------------|
| Assignment_ID      | INT         | PRIMARY KEY                          |
| Course_ID          | INT         | FOREIGN KEY                           |
| Instructor_ID      | INT         | FOREIGN KEY                           |
| Assignment_Title   | VARCHAR(255)|                                       |
| Assignment_Description | VARCHAR(255)|                                       |
| Due_Date           | DATE        |                                       |


### AssignmentGrade Table

The AssignmentGrade table contains information about assignment grades in the system. Each assignment grade is identified by a unique Assignment_ID and Student_ID, and has an associated Grade_Value.

| Column             | Type        | Constraints                          |
| ------------------ | -----------| ------------------------------------|
| Assignment_ID      | INT         | FOREIGN KEY, PRIMARY KEY             |
| Student_ID         | INT         | FOREIGN KEY, PRIMARY KEY             |
| Grade_Value        | DECIMAL(4,2)|                                       |


### Quiz Table

The Quiz table contains information about quizzes in the system. Each quiz is identified by a unique Quiz_ID and is associated with a Course_ID, Instructor_ID, Quiz_Title, and Date.

| Column             | Type        | Constraints                          |
| ------------------ | -----------| ------------------------------------|
| Quiz_ID            | INT         | PRIMARY KEY                          |
| Course_ID          | INT         | FOREIGN KEY                           |
| Instructor_ID      | INT         | FOREIGN KEY                           |
| Quiz_Title         | VARCHAR(255)|                                       |
| Date               | DATE        |                                       |


### QuizGrade Table

The QuizGrade table contains information about quiz grades in the system. Each quiz grade is identified by a unique QuizGrade_ID and is associated with a Quiz_ID, Student_ID, and Grade_Value.

| Column             | Type        | Constraints                          |
| ------------------ | -----------| ------------------------------------|
| QuizGrade_ID       | INT         | PRIMARY KEY                          |
| Quiz_ID            | INT         | FOREIGN KEY                           |
| Student_ID         | INT         | FOREIGN KEY                           |
| Grade_Value        | DECIMAL(4,2)|                                       |


### Midsem Table

The Midsem table contains information about midsemester exams in the system. Each midsemester exam is identified by a unique Midsem_ID and is associated with a Course_ID, Instructor_ID, and Date.

| Column             | Type        | Constraints                          |
| ------------------ | -----------| ------------------------------------|
| Midsem_ID          | INT         | PRIMARY KEY                          |
| Course_ID          | INT         | FOREIGN KEY                          |
| Instructor_ID      | INT         | FOREIGN KEY                          |
| Quiz_Title         | VARCHAR(255)|                                      |
| Date               | DATE        |                                      |


### MidsemGrade Table

The MidsemGrade table contains information about compre grades in the system. Each midsem grade is identified by a unique MidsemGrade_ID and is associated with a Midsem_ID, Student_ID, and Grade_Value.

| Column             | Type        | Constraints                          |
| ------------------ | -----------| ------------------------------------|
| MidsemGrade_ID       | INT         | PRIMARY KEY                          |
| Midsem_ID            | INT         | FOREIGN KEY                           |
| Student_ID         | INT         | FOREIGN KEY                           |
| Grade_Value        | DECIMAL(4,2)|                                       |

### Compre Table

The Compre table contains information about compre exams in the system. Each compre is identified by a unique Compre_ID and is associated with a Course_ID, Instructor_ID, and Date.

| Column             | Type        | Constraints                          |
| ------------------ | -----------| ------------------------------------|
| Compre_ID            | INT         | PRIMARY KEY                          |
| Course_ID          | INT         | FOREIGN KEY                           |
| Instructor_ID      | INT         | FOREIGN KEY                           |
| Date               | DATE        |                                       |


### CompreGrade Table

The CompreGrade table contains information about compre grades in the system. Each compre grade is identified by a unique CompreGrade_ID and is associated with a Compre_ID, Student_ID, and Grade_Value.

| Column             | Type        | Constraints                          |
| ------------------ | -----------| ------------------------------------|
| CompreGrade_ID       | INT         | PRIMARY KEY                          |
| Compre_ID            | INT         | FOREIGN KEY                           |
| Student_ID         | INT         | FOREIGN KEY                           |
| Grade_Value        | DECIMAL(4,2)|                                       |