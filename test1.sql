create database test1;
use test1;

create table if not exists test1_data(
id int,
`name` varchar(30),
city varchar(30)
);

insert into test1_data values(101,"Rupali","Jamnagar"),
(102,"Manya","Vadodara"),
(103,"Ketul","Anand");

select * from test1_data;
explain analyze select * from test1_data where id=102;
explain select * from test1_data where id=102;
analyze table test1_data;
describe test1_data;


/*union opration*/

use test1;

create table if not exists student(
stud_id int,
stud_name varchar(30)
);
create table if not exists course(
course_id int,
course_name varchar(30)
);

insert into student values(1,"Ruapli"),(2,"Manya"),(3,"Ketul");
insert into course values(1,"Data Science"),(2,"Data Analysis"),(3,"Python");

select * from student;
select * from course;

/* FULL OUTER JOIN*/
select * from student
left join course
on student.stud_id=course.course_id
union
select * from student
right join course
on student.stud_id=course.course_id

/*01-02-2023*/

/*union*/
select stud_id, stud_name from student
union
select course_id,course_name from course

use index1;
with sample_students as (select * from course1 where course_id in (101,102,106))
select * from sample_students where course_tag = 'java' 


