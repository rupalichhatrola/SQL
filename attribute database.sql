# FOR CSV FILE IMPORT

create database if not exists attributes;
use attributes;
create table if not exists attribute_data(
Dress_ID int,
Style varchar(30),
Price varchar(30),
Rating varchar(30),
Size varchar(30),	
Season	varchar(30),
NeckLine varchar(30),	
SleeveLength varchar(30),	
waiseline varchar(30),	
Material varchar(30),	
FabricType varchar(30),	
Decoration varchar(30),
Pattern_Type varchar(30),	
Recommendation int
);

### drop table attribute_data

LOAD DATA INFILE
'D:\AttributeDataSet.csv' 
INTO TABLE attribute_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS

show tables;
SELECT * FROM attribute_data;

# CREATE NEW TABLE
CREATE TABLE IF NOT EXISTS test(
test_id int auto_increment,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30),
primary key (test_id));

insert into test values(101,'Rupali','Rupali@gmail.com','Baroda');
insert into test values(102,'Manya','Manya@gmail.com','Surat');
insert into test values(103,'Ketul','Ketul@gmail.com','Ahmedabad');
insert into test values(104,'Netal','Netal@gmail.com','Bharuch');
insert into test values(105,'Dev','Dev@gmail.com','Rajkot');

select * from test;

CREATE TABLE IF NOT EXISTS test1(
test_id int,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30),
test_salary int check(test_salary > 10000));

insert into test1 values(101,'Rupali','Rupali@gmail.com','Baroda',45000);
insert into test1 values(102,'Manya','Manya@gmail.com','Surat',80000);
insert into test1 values(103,'Ketul','Ketul@gmail.com','Ahmedabad',65000);
insert into test1 values(104,'Netal','Netal@gmail.com','Bharuch',12000);
insert into test1 values(105,'Dev','Dev@gmail.com','Rajkot',20000);

CREATE TABLE IF NOT EXISTS test2(
test_id int NOT NULL auto_increment,
test_name varchar(30) NOT NULL default 'unknown',
test_mailid varchar(30) unique NOT NULL,
test_address varchar(30) CHECK(test_address='Baroda') NOT NULL,
test_salary int check(test_salary > 10000) NOT NULL,
primary key(test_id));

insert into test2 values(101,'Rupali','Rupali@gmail.com','Baroda',45000);
insert into test2 values(102,'Manya','Manya@gmail.com','Surat',80000);
insert into test2 values(103,'Ketul','Ketul@gmail.com','Ahmedabad',65000);
insert into test2 values(104,'Netal','Netal@gmail.com','Bharuch',12000);
insert into test2 values(105,'Dev','Dev@gmail.com','Rajkot',20000);
