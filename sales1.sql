use sales;
CREATE TABLE IF NOT EXISTS sales_data_final (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(30) NOT NULL, 
	ship_date VARCHAR(30) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	year DECIMAL(38, 0) NOT NULL
);

set session sql_mode=' ';

LOAD DATA INFILE
'D:\sales_data_final.csv' 
INTO TABLE sales_data_final
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM sales_data_final;

SELECT str_to_date(order_date,"%m/%d/%y") from sales_data_final;

alter table sales_data_final
add column order_date_new date after order_date;

update sales_data_final
set order_date_new = str_to_date(order_date,'%m/%d/%Y');

SELECT * FROM sales_data_final;

alter table sales_data_final
add column ship_date_new date after ship_date;
update sales_data_final
set ship_date_new = str_to_date(ship_date,"%m/%d/%Y");

SELECT * FROM sales_data_final;

SELECT * FROM sales_data_final WHERE ship_date_new = '2011-01-05';
SELECT * FROM sales_data_final WHERE ship_date_new > '2011-01-05';
SELECT * FROM sales_data_final WHERE ship_date_new < '2011-01-05';
SELECT * FROM sales_data_final WHERE ship_date_new BETWEEN '2011-01-05' AND '2011-08-30';

SELECT now();
SELECT curdate();
SELECT curtime();

SELECT * FROM sales_data_final WHERE ship_date_new < date_sub(now(),interval 1 week);
SELECT * FROM sales_data_final WHERE ship_date_new < date_sub('2011-08-30',interval 10 DAY);
SELECT date_sub('2011-08-30',interval 10 DAY);

SELECT year(now());
SELECT date(now());
SELECT dayname('2023-01-17 21:10:30');

ALTER TABLE sales_data_final
ADD COLUMN flag DATE AFTER order_id;

SELECT * FROM sales_data_final;

UPDATE sales_data_final
SET flag = now();

SELECT * FROM sales_data_final;

#ALTER TABLE sales_data_final
  #MODIFY COLUMN year datetime;

ALTER TABLE sales_data_final
ADD COLUMN year_new int AFTER year;
select * from sales_data_final;
update sales_data_final set year_new=year(order_date_new);
select * from sales_data_final limit 5;

#alter table sales_data_final
   #modify column year_new int;
   
ALTER TABLE sales_data_final
ADD COLUMN month_new int AFTER year_new;
update sales_data_final set month_new=month(order_date_new);
select * from sales_data_final limit 5; # display first 5 rows

ALTER TABLE sales_data_final
ADD COLUMN day_new int AFTER month_new;
update sales_data_final set day_new=day(order_date_new);
select * from sales_data_final;

select year_new , avg(sales) from sales_data_final group by year_new;
select year_new , sum(sales) from sales_data_final group by year_new;
select year_new , min(sales) from sales_data_final group by year_new;
select year_new , max(sales) from sales_data_final group by year_new;
select year_new , sum(quantity) from sales_data_final group by year_new;

select (sales*discount+shipping_cost)  as CTC from sales_data_final;

select order_id ,discount , if(discount > 0 ,'yes' , 'no') as discount_flag from sales_data_final; 

/*alter table sales_data_final
modify column discount_flag varchar(20) after discount

select * from sales_data_final ;

select discount_flag , count(*) from sales_data_final group by discount_flag 

select count(*) from  sales_data_final where discount > 0 

update sales_data_final
set discount_flag = if(discount > 0, 'yes', 'no');*/
/*---------------------------------------------------------------------------------------------*/
/*date : 30-01-2023*/

/* user defined function*/

use sales;
select * from sales_data_final;

delimiter $$
create function add_to_column(a int)
returns int
deterministic
begin
	declare b int;
    set b= a+20;
    return b;
end $$

/*call the function*/
select quantity, add_to_column(quantity) from sales_data_final;

delimiter $$
create function final_profits(profit int, discount int)
returns int
deterministic
begin
	declare final_profit int;
    set final_profit= profit-discount;
    return final_profit;
end $$

/*call the function*/
select profit, discount, final_profits(profit,discount) from sales_data_final;

delimiter $$
create function final_profits_real(profit decimal(20,4), discount decimal(10,4), sales decimal(10,4))
returns int
deterministic
begin
	declare final_profit int;
    set final_profit= profit-sales*discount;
    return final_profit;
end $$

/*call the function*/
select profit, discount, sales, final_profits_real(profit,discount,sales) from sales_data_final;

/* if else condition*/
delimiter $$
create function mark_sales2(sales int)
returns varchar(30)
deterministic
begin 
	declare flag_sales varchar(30);
    if sales <= 100 then
		set flag_sales = "super affortable product";
	elseif sales > 100 and sales < 300 then
		set flag_sales = "affortable product";
	elseif sales > 300 and sales < 600 then
		set flag_sales = "moderate price";
	else
		set flag_sales = "expensive";
end if;
return flag_sales;
end $$

select sales, mark_sales2(sales) from sales_data_final;

/************************************************************************************************************/
/*date : 31-01-2023*/
use sales;
select mark_sales2(100);
select sales,mark_sales2(sales) from sales_data_final;

/*create new table*/
create table loop_table(val int)

/*create loop*/

delimiter $$
create procedure insert_data()
begin
	set @var = 10;
    generate_data : loop
    insert into loop_table values (@var);
    set @var = @var+1;
    if @var =100 then
		leave generate_data;
	end if;
    end loop generate_data;
end $$

call insert_data()

select * from loop_table;
