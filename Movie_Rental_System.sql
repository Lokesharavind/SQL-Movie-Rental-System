/*Creating a Database*/
create database movie_db;

/*Using the Database*/
use movie_db;

/*Select the Table*/
select * from customers;
select * from movies;
select * from rentals;
select * from rental_history;


/*Creating table1(CUSTOMERS)*/
create table customers(customer_id INT Primary Key, name varchar(255),age int, email varchar(255) UNIQUE, phone int); 
select * from customers;
alter table customers modify phone varchar(15);/*ALTER METHOD(MODIFY)*/
alter table customers modify age int check(age>=18);/*Check Constraint Using*/
INSERT INTO customers (customer_id, name, age, email, phone) /*inserting values in customers table*/
VALUES
    (1, 'Aravind', 12, 'lokesharavind2003@gmail.com', '9791184279');/*checking the age using check constraint*/
    
INSERT INTO customers (customer_id, name, age, email, phone) /*inserting values in customers table*/
VALUES
    (1, 'Lokesh Aravind.R', 21, 'lokesharavind2003@gmail.com', '9791184279'),
    (2, 'Hafeeludeen.V.B.T', 22, 'hafeel21@gmail.com', '9791184579'),
    (3, 'Cindurasri.T.L', 21, 'cindu2002@gmail.com', '9891174276'),
    (4, 'Monisha.B', 22, 'monishab@gmail.com', '7611898279'),
    (5, 'Dasari Swetha', 21, 'swethachoudry@gmail.com', '9891176234');
    

alter table customers add aadhar varchar(255) unique;/*ALTER METHOD (ADD) WITH UNIQUE CONSTRAINT*/
alter table customers add country varchar(50);
alter table customers modify country varchar(50) default 'INDIA';/*ALTER METHOD (ADD) WITH DEFAULT CONSTRAINT*/

update customers/*UPDATING THE VALUES*/
set aadhar = case 
	WHEN customer_id=1 THEN '576553987604'
    WHEN customer_id=3 THEN '376553987604'
    WHEN customer_id=2 THEN '276553987604'
    WHEN customer_id=4 THEN '476553987604'
    WHEN customer_id=5 THEN '476553987605'
    WHEN customer_id=6 THEN '476876987605'
    else aadhar
end;

update customers
set country = 'INDIA'
where country is null;

update customers
set country = case
when customer_id=5 then 'AUSTRALIA'
else country
end;

INSERT INTO customers(customer_id, name, age, email, phone) 
VALUES (6, 'Venmathi.B', 23, 'venu@gmai.com', '576554387505');
delete from customers where customer_id=6;/*DELETE THE ID USING DELETE QUERRY*/
INSERT INTO customers (customer_id, name, age, email, phone, aadhar, country) /*INSERTING NEW VALUES IN TABLE*/
VALUES (6, 'Venmathi.B', 23, 'venu@gmai.com','9898403457','774568593028', 'UK');
INSERT INTO customers (customer_id, name, age, email, phone, aadhar, country) 
VALUES (7, 'Dhoni.M.S', 42, 'mahi7781@gmai.com','9962841981','778153857605', 'Switzerland');
INSERT INTO customers (customer_id, name, age, email, phone, aadhar, country) 
VALUES (8, 'Raina.S', 37, 'raina03@gmai.com','9903071981','778153857603', 'DUBAI'),(9, 'Senthamarai Kannnan.S', 20, 'kannan01@gmai.com','8955010103','778153010103', 'COIMBATORE'),
(10, 'Gokul Raj.S', 19, 'gokulraj08@gmai.com','7891184237','778687682345', 'CANADA');

/*DELETE QUERRY IS IN LINE 56*/
truncate table customers;/*TRUNCATING THE TABLE*/
drop table customers;/*DROPPING THE TABLE FROM DATABASE*/

/*Creating table2(MOVIES)*/
create table movies(movie_id int primary key, title varchar(255), genere varchar(100),release_year int);
insert into movies(movie_id,title,genere,release_year) values (1,'M.S Dhoni The Untold Story','Bio Graphy',2016),(2,'Happy New Year','Comedy Thriller',2014),
(3,'Harry Potter','Mystery',2002),(4,'Greatest Of All Time','Action',2024),(5,'MeesaiMuruku','Comedy',2018);
select * from movies;
alter table movies add rating float;/*ALTER METHOD(ADD) WITH FLOAT(RATING)*/

update movies/*UPDATING VALUES*/
set rating = case
when movie_id=1 then 9.57
when movie_id=2 then 8.54
when movie_id=3 then 9.02
when movie_id=4 then 8.75
when movie_id=5 then 7.85
else rating
end;

/*creating table 3(RENTALS) with Primary and Foreign Key */
create table rentals(rental_id int primary key,customer_id int,movie_id int,rental_date DATE,return_date Date, 
Foreign key(customer_id) references customers(customer_id),
Foreign key(movie_id) references movies(movie_id)
);

select * from rentals;
insert into rentals(rental_id,customer_id,movie_id,rental_date,return_date) values 
(1, 1, 1, '2016-05-29', '2015-06-30'),
(2, 2, 2, '2014-02-01', '2014-08-14'),
(3, 3, 3, '2002-03-01', '2002-05-30'),
(4, 4, 4, '2024-07-29', NULL),
(5, 5, 5, '2018-09-27', '2018-11-30');

/*creating table 4(Rentalhistory) with Primary and Foreign Key & AUTO INCREMENT*/
create table rental_history(history_id int auto_increment primary key,rental_id int,customer_id int,movie_id int, rental_date date, return_date date,
Foreign key(rental_id) references rentals(rental_id),
Foreign key(customer_id) references customers(customer_id),
Foreign key(movie_id) references movies(movie_id));

select * from rental_history;

alter table rental_history modify history_id int not null;/*ALTER METHOD(MODIFY) USING NOT NULL CONSTRAINT*/

insert into rental_history(history_id,rental_id,customer_id,movie_id,rental_date,return_date) values 
(1, 1, 1, 1, '2016-05-29', '2015-06-30'),
(2, 2, 2, 2, '2014-02-01', '2014-08-14'),
(3, 3, 3, 3, '2002-03-01', '2002-05-30'),
(4, 4, 4, 4, '2024-07-29', NULL),
(5, 5, 5, 5, '2018-09-27', '2018-11-30');

create index idx_email on customers(name,country);/*USING CREAT INDEX*/
select * from idx_email;
show index from customers;
drop index idx_emai on customers;/*DELETEING INDEX*/

select distinct country from customers;/*DISTINCT*/
select name,age,country from customers where country ='INDIA';
select name,age,country from customers where country ='UK';

select customer_id,name,age from customers order by age;/*ORDER BY*/
select customer_id,name,age from customers order by age desc;

select * from customers where age>=18 and country = 'INDIA';/*AND OPERATOR*/
select * from customers where age>=42 or country ='SSwizzerland';/*OR OPERATOR*/
select * from customers where NOT country ='Australia';/*NOT OPERATOR*/

select * from rentals where return_date is null; /*IS NULL*/
select rental_id,rental_date,return_date from rentals where return_date is not null;/*IS NOT NULL*/

select * from customers where customer_id limit 5;/*LIMIT CLAUSE*/
select * from customers order by age desc limit 5;/*LIMIT CLAUSE IN DESCENDING ORDER*/

/*AGGREGATE FUNCTIONS*/
select max(age) from customers;/*MAX()*/
select min(age) from customers;/*MIN()*/
select count(*) from movies;/*COUNT()*/
select avg(age) from customers;/*AVG()*/
select sum(rating) from movies;/*SUM()*/

/*LIKE OPERATOR(PATTERN SEARCH)*/
/*PERCENTAGE*/
select movie_id,title,genere,release_year,rating from movies where title like 'h%';
select * from movies where genere like '%y';
select * from movies where genere like '%y' or genere like 'h%';/*PERCENTAGE USING OR*/
select * from movies where genere like '%y' and genere like 'h%';/*PERCENTAGE USING AND*/
select * from movies where genere not like 'action';/*PERCENTAGE USING NOT*/

/*underscore*/
select * from movies where title like 'H___________';
select * from movies where title like 'M_____M____U';

/*COMBINED WILDCARDS*/
select * from movies where genere like 'M_____y%';

/*WITHOUT WILDCARDS*/
select * from movies where genere like 'Comedy';

select * from customers where customer_id IN(1,3,7);/*SQL IN OPERATOR*/
select * from customers where customer_id BETWEEN 1 and 10;/*SQL BETWEEN OPERATOR*/
select * from customers where customer_id NOT BETWEEN 4 and 8;/*SQL NOT BETWEEN OPERATOR*/
select * from customers where customer_id BETWEEN 1 and 10 and customer_id in (2,6);/*SQL BETWEEN AND IN  OPERATOR*/

/*JOINS*/
select c.name,c.age,c.phone,c.email,c.country,
	    m.title,m.genere,m.release_year,m.rating,
        r.rental_date,rh.return_date 
from customers c 
INNER JOIN rentals r ON r.customer_id = c.customer_id 
INNER JOIN movies m ON r.movie_id = m.movie_id 
INNER JOIN rental_history rh ON r.rental_id = rh.rental_id;

/*LEFT JOIN*/
select c.name,c.age,c.phone,c.email,c.country,m.title,m.genere,m.release_year,m.rating,r.rental_date,rh.return_date 
from customers c
LEFT JOIN rentals r ON r.customer_id = c.customer_id
LEFT JOIN movies m ON r.movie_id = m.movie_id
LEFT JOIN rental_history rh ON r.rental_id = rh.rental_id;

/*RIGHT JOIN*/
select c.name,c.age,c.phone,c.email,c.country,m.title,m.genere,m.release_year,m.rating,r.rental_date,rh.return_date
from customers c
RIGHT JOIN rentals r ON r.customer_id = c.customer_id
RIGHT JOIN movies m ON r.movie_id = m.movie_id
RIGHT JOIN rental_history rh ON r.rental_id = rh.rental_id;

/*FULL JOIN*/
(select c.customer_id,c.name,c.age,c.phone,c.email,c.country,m.title,m.genere,m.release_year,m.rating,r.rental_date,rh.return_date 
from customers c
LEFT JOIN rentals r ON r.customer_id = c.customer_id
LEFT JOIN movies m ON r.movie_id = m.movie_id
LEFT JOIN rental_history rh ON r.rental_id = rh.rental_id
)
UNION
(select c.customer_id,c.name,c.age,c.phone,c.email,c.country,m.title,m.genere,m.release_year,m.rating,r.rental_date,rh.return_date
from customers c
RIGHT JOIN rentals r ON r.customer_id = c.customer_id
RIGHT JOIN movies m ON r.movie_id = m.movie_id
RIGHT JOIN rental_history rh ON r.rental_id = rh.rental_id);

/*SELF JOIN(REFER LATER)*/
select c1.customer_id as customer1_id,
c1.name as customer1_name,
c2.customer_id as customer2_id,
c2.name as customer2_name,
c1.country FROM customers c1 JOIN customers c2
ON c1.country = c2.country AND c1.customer_id < c2.customer_id;

/*ROUND() FUNCTION*/
select round(9.57);
select round(8.23);
select movie_id, round(923.567) as rounded_rating from movies;

/*TRUNCATE() FUNCTION*/
select truncate(923.57,0);
select truncate(123.456,1);
select truncate(123.456,2);
select movie_id, truncate(movie_id,3) as truncated_rating from movies;

/*MOD() FUNCTION*/
select mod(57,5);
select mod(movie_id,5) as mod_rating from movies;

select year(rental_date) as year from rentals;/*extracting year*/
select month(rental_date) as month from rentals;/*extracting months*/
select day(rental_date) as day from rentals;/*extracting day*/

select date_add(rental_date, interval 7 day) as new_date from rentals;/*ADDING INTERVALS*/

select date_Sub(rental_date, interval 7 day) as new_date from rentals;/*SUBTRACTING INTERVALS*/
select datediff('2024-12-31','2024-10-30') as difference from rentals;/*DATE DIFFERENCE*/

select '2003-05-29' +7 as '2024-10-16' from rentals;/*DATE ARITHMETIC*/

select customer_id,rental_date from rentals/*Union*/
UNION 
select customer_id,rental_date from rental_history;

select customer_id,rental_date from rentals /*Union All*/
Union all
select customer_id,rental_date from rental_history;

select age from customers group by age order by age;/*GROUP BY*/
select age, sum(age) from customers group by age having sum(age);/*Having*/

select name from customers where EXISTS(select name from customers where country='UK');/*Exists*/

select * from customers where customer_id = any(select customer_id from customers where country='INDIA');/*ANY*/
select * from customers where customer_id >= ALL(select customer_id from customers where age<=22);/*ALL*/

select ifnull(return_date, 'not null') from rentals;/*IF NULL*/

select max(age) from customers where age < (select max(age) from customers);/*Single Row Sub Querry*/
select name,email,country from customers where country <= all (select distinct country from customers where age<25);/*Multi Row Subquerry*/
select * from movies where movie_id in (select movie_id from movies where rating>=9.0);/*Multi Column Subquery*/

 /*CORRELATED SUBQUERY*/
select title from movies m 
where exists (select 1 from rentals r where r.movie_id = m.movie_id and rental_date >= '2024-01-01');

/*NON CORRELATED SUBQUERY*/
select title from movies 
where movie_id in (select movie_id from rentals where rental_date >='2003-05-29');

/*SUBQUERRY WITH SELECT*/ 
select * from movies where rating IN (select rating from movies where rating >= 9.0);
update movies set rating = rating * 1 where release_year in(SELECT release_year 
    FROM (SELECT release_year FROM movies WHERE release_year > 2014) AS temp_table
);

/*Create User*/
create user 'LARentertainment'@'localhost' identified by 'lokesh29r';
/*Grant Permission to user*/
grant select,insert,update on movie_db.customers TO LARentertainment@localhost;

/*CREATING A COMPLEX VIEW*/
create view movie_rental_summary as 
select c.customer_id,c.name as customer_name,c.age,c.email,c.phone,c.aadhar,c.country as customer_country, 
	   m.title,m.genere,m.release_year,m.rating as movie_rating,
       r.rental_date,rh.return_date as rentals_details
FROM customers c
Join rentals r ON r.customer_id = c.customer_id
JOIN movies m ON  r.movie_id = m.movie_id
JOIN rental_history rh ON r.rental_id = rh.rental_id;

/*RUN A COMPLEX VIEW*/
select * from movie_rental_summary;

/*Dropping a view*/
drop view movie_rental_summary; 

/*ROLL BACK*/
start  Transaction;
delete from customers where customer_id=9;
ROLLBACK;
COMMIT;
call flims_detail; /*or*/ select * from customers;

/*Current Datetime*/
select now() as current_datetime;
select current_time();/*Current Time*/
select current_timestamp();/*Timestamp*/
set global time_zone = 'Asia/Kolkata';
select @@global.time_zone;/*Global Time Zone*/
select @@session.time_zone;/*Seession Time Zone*/
select @@global.time_zone as global_time_zone, @@session.time_zone as session_time_zone;/*Time Zone Offset*/
select convert_tz('1999-09-10 12:00:00', 'UTC','America/NewYork')as timestamp_with_time_zone;/*From TZ(converting)*/
select str_to_date('1999-09-10 12:00:00', '%Y-%m-%d %h:%i:%s')as timestamp_value;/*Str ---> Date timestamp*/
select now() + interval 3 year + interval 4 month as new_datetime; /*TO_YEAR-MONTH INTERVAL*/
select now() + interval '3 4:30:15' day_second as new_datetime;/*TO_DAY-SECOND INTERVAL*/

/*REGULAR EXPRESSION*/
/*1)REGEXP_LIKE*/
select * from customers where regexp_like(name,'^l[a-z]+');
/*2)REGEXP_SUBSTR*/
select regexp_substr(email, '[^@]+', 1) as username from customers;
select name, regexp_substr(name, '[a-zA-Z]') as username from customers;
/*3)REGEXP_INSTR*/
select name, regexp_instr(name, '[on]') as username from customers;
select name, regexp_instr(phone, '[0-9]') as username from customers;
/*4)REGEXP_REPLACE*/
select name, regexp_replace(phone, '[^0-9]', '') as new_phoneno from customers;

/*Stored Procedure*/
DELIMITER //
create procedure flims_detail()
BEGIN
	select * from customers;
END//
DELIMITER ;

call flims_detail();/*Calling Procedure*/ 


