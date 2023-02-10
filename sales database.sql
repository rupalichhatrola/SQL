create database  IF NOT EXISTS sales;
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
## in anaconda command promt
## csvsql --dialect mysql --snifflimit 100000 sales_data_final.csv > output_sales.sql 

set session sql_mode=' ';

LOAD DATA INFILE
'D:\sales_data_final.csv' 
INTO TABLE sales_data_final
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from sales_data_final;

SELECT str_to_date(order_date,"%m/%d/%y") from sales_data_final;
SELECT str_to_date(ORDER_DATE,"%M %d %Y") from sales_data_final;

select * from sales_data_final;

 
alter table sales_data_final
add column orderdate_new date after order_date;
update sales_data_final
set orderdate_new = str_to_date(order_date,"%m/%d%Y");

alter table sales_data_final
add column shipdate_new date after ship_date;
update sales_data_final
set shipdate_new = str_to_date(ship_date,"%m/%d%Y");

select * from sales_data_final;

drop table sales_data_final;
