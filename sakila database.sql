show databases;
use sakila;
show tables;
select * from customer;
select first_name, last_name, address_id from customer;
select distinct active from customer;
select first_name from customer where last_name='perry';
select * from customer where last_name='perry';
select first_name from customer where last_name='davis';
select first_name, last_name from customer where active=0;
select first_name, last_name from customer where active=1;
select * from customer;
select first_name, last_name,email from customer where address_id<20;
select first_name, last_name,email from customer where address_id>=20 and address_id<=25;
select first_name, last_name,email from customer where address_id between 20 and 25;
select first_name, last_name,email from customer where first_name='ian' and last_name='still';
select first_name, last_name,email from customer where first_name='ian' or last_name='still';
update customer set first_name="RUPALI" where last_name="grey";
select * from customer where last_name="grey";
select first_name, last_name, email, store_id, address_id from customer where not store_id=2;
select first_name, last_name, email from customer order by first_name DESC;
select first_name, last_name, email from customer order by first_name;
select first_name, last_name, email from customer order by first_name asc;
select first_name, last_name,email from customer where active=1 limit 20;
select min(address_id) from customer;
select max(address_id) from customer;
SELECT *  FROM customer where address_id=(select MIN(address_id) from customer);
SELECT first_name, last_name, email  FROM customer where address_id=(select MIN(address_id) from customer);
SELECT first_name, last_name, email  FROM customer where address_id=(select max(address_id) from customer);

SELECT COUNT(EMAIL) FROM CUSTOMER;
SELECT AVG(ACTIVE) FROM CUSTOMER;
SELECT SUM(ACTIVE) FROM CUSTOMER;
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE 'R%';
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE '%R';
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE '%OR%';
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE 'A__%';
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE 'A_%';
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE 'A___%';
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE 'A____%';
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE 'R___';
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE 'A%O';
SELECT * FROM CUSTOMER WHERE ACTIVE=1 AND FIRST_NAME LIKE 'A%';
SELECT * FROM CUSTOMER WHERE CUSTOMER_ID IN (1,2,3);
SELECT * FROM CUSTOMER WHERE CUSTOMER_ID NOT IN (1,2,3);
SELECT * FROM CUSTOMER WHERE CUSTOMER_ID BETWEEN 1 AND 20;
SELECT * FROM CUSTOMER WHERE CUSTOMER_ID NOT BETWEEN 1 AND 570;
SELECT FIRST_NAME AS FIRST, LAST_NAME AS LAST FROM CUSTOMER;

SELECT COUNT(CUSTOMER_ID) FROM CUSTOMER GROUP BY ACTIVE;



USE WORLD;
SELECT * FROM COUNTRY;
SELECT * FROM COUNTRY GROUP BY(Continent) HAVING COUNT(Population)>60000;
SELECT DISTINCT continent from country;

/*joins*/

use sakila;
select count(customer_id) from customer group by customer_id having count(customer_id)>101;
select * from city;
select * from country;

# INNER JOIN
select city.city_id, city.country_id from city
inner join country
on city.country_id=country.country_id;

# LEFT JOIN
select city.city_id, city.country_id, city.last_update, country.last_update from city
left join country
on city.country_id=country.country_id;

# RIGHT JOIN
select city.city_id, city.country_id, city.last_update, country.last_update from city
right join country
on city.country_id=country.country_id;

# FULL OUTER JOIN
select * from city
left join country
on city.country_id=country.country_id
union
select * from city
right join country
on city.country_id=country.country_id;