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
