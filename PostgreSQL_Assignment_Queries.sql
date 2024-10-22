/*  --* QUERY 1 --
Query 1 purpose is to insert a new student record in the students database. 
For inserting we can use "INSERT" property. The INSERT operation format is
INSERT INTO database_name (column_name1, column_name2, ....)
VALUES (value1, value2, ....); 
*/
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, "status")
    VALUES ('Rabby' , 22, 'rabby@gmail.com', 75, 100, NULL);





/* -- * Query 2 --
Q. Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
1. For this query I used the Select opetation & join the enrollment table with both courses & students table.
2. Because here need combine student_name & course_name for this query but both column are present in different table. 
3. But they are connected with each other with enrollment table as Referance Key. 
4. So Simply select the enrollment table & join both tables. 
5. After that using WHERE condition takes those rows where course_name is nextJS. Here used ILike to ignored case sensitivity
*/
SELECT student_name FROM enrollment
    JOIN courses  USING(course_id)
    JOIN students USING(student_id)
    WHERE course_name ILIKE 'nextjs';





/* -- * Query 3 --
Q. Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
1. At first I used to SELECT operator to determine top mark obtained student/students which frontend_mark + backend_mark is maximum. 
    a. At determining time at first I was find out first those students with a fixed number like 180.
    b. After that using another query I was find out the max number from the database.
    c. Then using this query as subquery & match then with total marks finding out the top marks obtained student or students.
2. Then Simply using UPDATE function update the top mark obtained student / students status & add where function here which i used 
   in select operation to find out the students.
-- SELECT * FROM students WHERE frontend_mark + backend_mark = 180;
-- SELECT MAX(frontend_mark + backend_mark) FROM students;
-- SELECT * FROM students WHERE frontend_mark + backend_mark = (SELECT MAX(frontend_mark + backend_mark) FROM students);
*/

UPDATE students
    SET status = 'Awarded'
    WHERE frontend_mark + backend_mark = (
        SELECT MAX(frontend_mark + backend_mark) FROM students
    )





/* -- * Query 4 --
Q. Delete all courses that have no students enrolled.
1. At first find out those courses in enrollment table which have no students enrolled.
2. For this operation I used the right join function to join the enrollment & courses table. The right join function basically used
   for if any enrolled course has no enrollment student_id & enrollment_id then it will shows NULL.
3. Now if null present in enrollment_id & student_id then simply delete those rows.
-- SELECT DISTINCT(course_name) from enrollment JOIN courses  USING(course_id);
-- SELECT * from courses ORDER BY course_id DESC;
-- INSERT INTO courses (course_name, credits) VALUES ('Dummy Course', 1);
*/

DELETE FROM courses
    WHERE course_id IN (
        SELECT course_id FROM enrollment
            RIGHT JOIN courses USING(course_id)
            WHERE enrollment_id IS NULL AND student_id is NULL
    );





/* -- * Query 5 --
Q. Retrieve the names of students using a limit of 2, starting from the 3rd student.
Here used the Select operation with LIMIT & OFFSET. 
If limit is 10 then the database returns 10 data. If the offset is 10 that means the database will skip first 10 data & return next of them.
*/

SELECT student_name FROM students LIMIT 2 OFFSET 2;





/* -- * Query 6 --
Q. Retrieve the course names and the number of students enrolled in each course.
1. Here at first need to join the courses table with enrollment table because of we need the course name with number of student enrolled. 
2. Then simply make grouping the table with course_name
3. Then for finding the student total enrollment simply used the count(*)
*/

SELECT course_name, count(*) AS "students_enrolled" FROM enrollment 
    JOIN courses USING(course_id)
    GROUP BY course_name;





/* -- * Query 7 --
Q. Calculate and display the average age of all students.
Simply run the avg function on age field while working select operation on students table. For get 2 number after pointer used the Round operator. 
*/

SELECT ROUND(AVG(age),2) AS "average_age" FROM students;





/* -- * Query 8 --
Q. Retrieve the names of students whose email addresses contain 'example.com'.
Simply run a select opeaton & used ILIKE operator tor check that any email contain the 'example.com' or not. Also used % before string that any string can be possible before the 'example.com' & email must be ends with the 'example.com' text
*/

SELECT student_name from students 
    WHERE email ILIKE '%example.com';
