USE MYSQL
use information_schema;
show tables;
show databases;
select * from character_sets;
select distinct maxlen from character_sets;
select maxlen from character_sets where character_set_name="big5";
select * from character_sets where character_set_name="latin2";
select * from character_sets where maxlen="3";
select character_set_name,description from character_sets where character_set_name="ujis" and maxlen="3";
