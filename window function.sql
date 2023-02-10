create database if not exists win1_fun;
use win1_fun;

create table if not exists bit_students(
student_id int,
Student_batch varchar(40),
student_name varchar(40),
student_steam varchar(30),
student_marks int,
student_mail_id varchar(50)
);
insert into bit_students values(119 ,'fsds' , 'jalpa','EC',60,'jalpa@gmail.com');

select * from bit_students;

insert into bit_students values(100 ,'fsda' , 'saurabh','cs',80,'saurabh@gmail.com'),
(102 ,'fsda' , 'sanket','cs',81,'sanket@gmail.com'),
(103 ,'fsda' , 'shyam','cs',80,'shyam@gmail.com'),
(104 ,'fsda' , 'sanket','cs',82,'sanket@gmail.com'),
(105 ,'fsda' , 'shyam','ME',67,'shyam@gmail.com'),
(106 ,'fsds' , 'ajay','ME',45,'ajay@gmail.com'),
(106 ,'fsds' , 'ajay','ME',78,'ajay12@gmail.com'),
(108 ,'fsds' , 'snehal','CI',89,'snehal@gmail.com'),
(109 ,'fsds' , 'manisha','CI',34,'manisha@gmail.com'),
(110 ,'fsds' , 'rakesh','CI',45,'rakesh@gmail.com'),
(111 ,'fsde' , 'anuj','CI',43,'anuj@gmail.com'),
(112 ,'fsde' , 'mohit','EE',67,'mohit@gmail.com'),
(113 ,'fsde' , 'vivek','EE',23,'vivek@gmail.com'),
(114 ,'fsde' , 'gaurav','EE',45,'gaurav@gmail.com'),
(115 ,'fsde' , 'prateek','EE',89,'prateek@gmail.com'),
(116 ,'fsde' , 'mithun','ECE',23,'mithun@gmail.com'),
(117 ,'fsbc' , 'chaitra','ECE',23,'chaitra@gmail.com'),
(118 ,'fsbc' , 'pranay','ECE',45,'pranay@gmail.com'),
(119 ,'fsbc' , 'sandeep','ECE',65,'sandeep@gmail.com');

select * from bit_students;

select student_batch, sum(student_marks) from bit_students group by student_batch;
select student_batch, min(student_marks) from bit_students group by student_batch;
select student_batch, max(student_marks) from bit_students group by student_batch;
select student_batch, avg(student_marks) from bit_students group by student_batch;
select count(student_batch) from bit_students;
select count(distinct student_batch) from bit_students;
select student_batch,count(*) from bit_students group by student_batch;
select student_batch,sum(student_marks) from bit_students where student_batch="fsds";
select student_name, student_mail_id,student_batch, max(student_marks) from bit_students group by student_batch;

select max(student_marks), student_name from bit_students where student_batch="fsds";


#set session sql_mode='TRADITIONAL';