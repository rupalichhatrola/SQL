create database index1;
use index1;

create table if not exists course1(
course_id int,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id)
);

show index from course1;

insert into course1 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

select * from course1;


create table if not exists course2(
course_id int,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id,course_name)
);

show index from course2;

insert into course2 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');


create table if not exists course3(
course_id int,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id,course_name,course_tag)
);

show index from course3;

insert into course3 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

explain analyze select * from course3 where course_id=106 or course_name="fsds";
explain select * from course3 where course_id=106;
analyze table course3;
describe course3;

/*task*/
/*export csv file in output grid*/
/*union opration - two tables course & student in both (id,name)*/

/*01-02-2023*/

use index1;

create table if not exists course4(
course_id int,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
unique index(course_desc,course_name)
);

show index from course4;

with sample_students as (
select * from course1 where course_id in (101,102,106))
select * from sample_students where course_tag = 'java' 

/*cross join*/

create table if not exists course(
course_id int,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50)
);
create table if not exists student(
student_id int,
student_name varchar(50),
student_course_id int
);

insert into course values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

insert into student values(101 , 'fsda' , 101),
(102 , 'fsds' ,102 ),
(103 , 'fsds' ,103 ),
(104 , 'big data' ,104 ),
(105 , 'mern' , 105),
(106 , 'blockchain' ,106 ),
(107 , 'java' ,101 ),
(108 , 'testing' ,102 ),
(109 , 'cybersecurity' ,105 ),
(110 , 'c' ,109 ),
(111 , 'c++' , 108);

select * from course;
select * from student;

with outcoume_corss as (select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
cross  join student s ) select course_id , course_name ,student_id from outcoume_corss where student_id = 106;

select course.course_id,student.student_name
from course
cross join student;
select course.course_name,student.student_name
from course
cross join student
where course_name="big data";


/* CTE = common table expression*/

with recursive cte1 as
(select 1 as n union all select n+1 from cte1 where n<5 )
select * from cte1

with recursive cte2 as (
select 1 as n, 1 as p, -1 as q
union all
select n+1, p+2, q+4 from cte2 where n<10 )
select * from cte2
with recursive cte2 as (
select 1 as n, 11 as p, 21 as q
union all
select n+1, p+2, q+4 from cte2 where n<10 )
select * from cte2
with recursive cte2 as (
select 1 as n, 1 as p, 1 as q
union all
select n+1, p+2, q+5 from cte2 where n<10 )
select * from cte2