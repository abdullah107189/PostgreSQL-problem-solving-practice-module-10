-- Active: 1748101600106@@127.0.0.1@5432@practice
CREATE TABLE students(
"id" SERIAL PRIMARY KEY ,
"name" VARCHAR(50),
age SMALLINT,
score SMALLINT,
department_id INT REFERENCES departments("id")
)

CREATE TABLE departments(
    "id" SERIAL PRIMARY KEY ,
    "name" VARCHAR(50)
);

CREATE TABLE course_enrollments (
    "id" SERIAL PRIMARY KEY ,
student_id INT REFERENCES students("id"),
course_title VARCHAR(100),
enrolled_on TIMESTAMP
)

-- Insert sample data into departments
INSERT INTO departments ("name") VALUES
('Computer Science'),
('Electrical Engineering'),
('Mechanical Engineering'),
('Civil Engineering'),
('Mathematics'),
('Physics'),
('Chemistry'),
('Biology'),
('Economics'),
('Literature');

-- Insert sample data into students
INSERT INTO students ("name", age, score, department_id) VALUES
('Alice Johnson', 20, 85, 1),
('Bob Smith', 22, 90, 2),
('Charlie Brown', 19, 78, 1),
('David Wilson', 21, 92, 3),
('Eva Green', 20, 88, 4),
('Frank Harris', 23, 75, 5),
('Grace Lee', 18, 83, 1),
('Hannah Kim', 22, 89, 2),
('Ian Thompson', 20, 77, 6),
('Julia Roberts', 21, 80, 3),
('Kevin White', 19, 84, 7),
('Laura Martin', 22, 91, 4),
('Michael Scott', 20, 85, 5),
('Nina Patel', 21, 87, 8),
('Oscar Turner', 22, 79, 9);

-- Insert sample data into course_enrollments
INSERT INTO course_enrollments (student_id, course_title, enrolled_on) VALUES
(1, 'Introduction to Programming', '2023-01-15 09:00:00'),
(1, 'Circuit Analysis', '2023-02-10 10:30:00'),
(5, 'Data Structures', '2023-01-20 14:00:00'),
(2, 'Thermodynamics', '2023-03-05 11:00:00'),
(5, 'Statics and Dynamics', '2023-02-28 15:30:00'),
(8, 'Linear Algebra', '2023-01-18 08:45:00'),
(6, 'Algorithms', '2023-03-01 09:15:00'),
(8, 'Digital Logic Design', '2023-02-12 13:00:00'),
(4, 'Quantum Mechanics', '2023-01-25 10:00:00'),
(10, 'Machine Design', '2023-02-27 16:00:00'),
(10, 'Organic Chemistry', '2023-03-02 12:00:00'),
(10, 'Structural Analysis', '2023-01-22 14:30:00'),
(12, 'Probability and Statistics', '2023-03-03 09:45:00'),
(12, 'Genetics', '2023-02-18 11:15:00'),
(15, 'Microeconomics', '2023-01-30 10:30:00');

SELECT * FROM students;
SELECT * FROM departments;
SELECT * FROM course_enrollments;


-- Retrieve all students who scored higher than the average score.
SELECT * FROM students
    WHERE score > (SELECT avg(score) FROM students);
    
-- Find students whose age is greater than the average age of all students.
SELECT * FROM students
    WHERE age > (SELECT avg(age) from students);

-- Get names of students who are enrolled in any course (use IN with subquery).
SELECT * FROM students
    WHERE "id" in (SELECT student_id FROM course_enrollments);

-- প্রতিটি স্টুডেন্ট কয়টি কোর্সে এনরোল করেছে এবং তারা কোন কোন কোর্সে এনরোল করেছে?
-- 1.........
SELECT *
FROM students s
JOIN course_enrollments ce ON s.id = ce.student_id;

-- 2................
SELECT 
    s.name,
    ce.course_title
FROM 
    students s
JOIN 
    course_enrollments ce ON s.id = ce.student_id;

-- 3................
SELECT 
    s.name,
    COUNT(ce.course_title) AS total_courses
FROM 
    students s
JOIN 
    course_enrollments ce ON s.id = ce.student_id
GROUP BY 
    s.name;

-- 4................
SELECT 
    s.name,
    STRING_AGG(ce.course_title, ', ') AS enrolled_courses
FROM 
    students s
JOIN 
    course_enrollments ce ON s.id = ce.student_id
GROUP BY 
    s.name;


-- finally
SELECT s.name, string_agg(ce.course_title, ', ') 
FROM students as s
JOIN course_enrollments as ce ON s.id = ce.student_id
GROUP BY s.name;

