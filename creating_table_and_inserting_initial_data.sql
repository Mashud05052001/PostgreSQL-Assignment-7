-- Active: 1729194579963@@127.0.0.1@5432@postgresql_assignment


-- Creating Table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    age INT CHECK (age > 0),
    email VARCHAR(50),
    frontend_mark INT,
    backend_mark INT,
    status VARCHAR(50) DEFAULT NULL
);
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT
);
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id)
);

-- DROP table incase
DROP TABLE  students;
DROP TABLE  courses;
DROP TABLE  enrollment;

-- Shows all table data
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollment;

-- Inserting data into TABLE
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark) 
    VALUES  ('Alice Johnson', 21, 'alice@example.com', 85, 90),
        ('Bob Smith', 22, 'bob.smith@example.com', 78, 82),
        ('Charlie Brown', 23, 'charlie@example.com', 92, 88),
        ('David Wilson', 20, 'david@example.com', 76, 80),
        ('Emma Davis', 21, 'emma.doe@example.com', 89, 85),
        ('Fiona Garcia', 24, 'fiona@example.com', 91, 90),
        ('George Miller', 25, 'george@example.com', 84, 87),
        ('Hannah Taylor', 22, 'hannah@gmail.com', 95, 92),
        ('Ivy Anderson', 20, 'ivy@hotmail.com', 88, 90),
        ('Jack Martinez', 21, 'jack@yahoo.com', 80, 84),
        ('Kelly White', 22, 'kelly@example.com', 79, 75),
        ('Liam Thomas', 23, 'liam@example.com', 82, 83),
        ('Mia Lewis', 24, 'mia@example.com', 86, 91),
        ('Noah Clark', 25, 'noah@example.com', 90, 94),
        ('Olivia Hall', 21, 'olivia@example.com', 87, 89),
        ('Peter Lee', 22, 'peter@gmail.com', 80, 85),
        ('Quinn Young', 23, 'quinn@example.com', 75, 78),
        ('Ryan Hernandez', 24, 'ryan@yahoo.com', 84, 80),
        ('Sophie King', 22, 'sophie@example.com', 88, 91),
        ('Tommy Scott', 20, 'tommy@hotmail.com', 91, 85),
        ('Uma Johnson', 21, 'uma@example.com', 86, 89);

INSERT INTO courses (course_name, credits) 
    VALUES ('NextJS' , 3),
        ('ReactJS' , 4),
        ('Databases' , 3),
        ('Prisma' , 4),
        ('Typescript' , 2),
        ('Javascript' , 4);

INSERT INTO enrollment (student_id, course_id) 
    VALUES (1, 1),
        (1, 2),
        (2, 1),
        (2, 3),
        (3, 2),
        (3, 4),
        (4, 5),
        (5, 1),
        (6, 6),
        (7, 2),
        (8, 3),
        (9, 4),
        (10, 5);
