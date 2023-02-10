# stored procedure

/* Procedure to find out square root of any number */
create database n1;
use n1;

/* square root of qny number # $$ or // both are used */
delimiter $$ 			
create procedure sqrt_root(a int, out b float)
begin
	set b = sqrt(a);
end $$
delimiter ;

call sqrt_root(64, @b);
select @b;

/* INOUT procedure*/

delimiter $$
create procedure setcounter(inout counter int, in inc int)
begin
	set counter = counter + inc;
end $$
set @counter = 1;
call setcounter(@counter, 1);
call setcounter(@counter, 3);
select @counter

/* user variable */
delimiter //
create procedure user_var()
begin
	set @x = 15;
    set @y = 10;
    select @x,@y, @x-@y;
end //
call user_var();

/* other database*/
use sakila;
select * from customer;

delimiter //
create procedure getactive(in Active varchar(25))
begin
	select * from customer where active = Active;
end //
delimiter //
call getactive(20);

select distinct active from customer;
select first_name, last_name from customer where address_id=9;
select distinct store_id from customer;
select min(address_id) from customer;
select first_name, last_name, address_id from customer where address_id in(select min(address_id) from customer);