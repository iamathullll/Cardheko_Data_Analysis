select * from mydb.Customer_Details1;
use car_dheko;
select count(*) from car_table;
#Rows -7927
describe car_table;
select * from car_table;
select distinct(transmission) from car_table;
set sql_safe_updates=0;
update car_table set transmission='Automatic' where transmission=' Automatic';
select distinct(seats) from car_table;
select * from car_table where seats=14; 
update car_table set name=trim(name);
select * from car_table where fuel='Diesel' order by name;
#4307 diesel vehicle
select fuel,count(fuel) as cnt from car_table group by fuel  order by cnt desc;
# ele 1
#lpg 35
#cng 53
#petrol 3534 
#diesel 4304
select * from car_table order by km_driven limit 10;
select fuel,avg(selling_price) as avg_price from car_table group by fuel order by avg_price desc limit 1;
select fuel,min(selling_price) as avg_price from car_table group by fuel order by avg_price desc;
select substring_index(name,' ',1) as brands from car_table; 
alter table car_table add column Brand varchar(100);
update car_table set brand=substring_index(name,' ',1);
alter table car_table modify column name varchar(100) after seats;
update car_table set torque=substring_index(torque,'.',1); #substring indexing
update car_table set mileage=trim(mileage);
describe car_table;
alter table car_table modify column max_power int;
select count(brand) as count,brand from car_table group by brand order by count desc limit 6;#maruti has the most number of cars in the list
select count(brand) as count,brand from car_table group by brand order by count desc limit 5; #top 5 brands which have the most number of cars
select max(selling_price) from car_table where brand='maruti';
select * from car_table where selling_price='1200000' and brand='maruti';#most expensive car of maruti is Maruti Ertiga ZDI Plus
select * from car_table order by mileage desc limit 10;#top mileage given car
select * from car_table where brand='maruti' and fuel='petrol' order by mileage desc limit 10;#Top 10 maruti petrol cars which give high mileage 
select * from car_table where brand='bmw' and fuel='petrol' order by mileage desc;#bmw cars which give high mileage
select * from car_table order by engine desc limit 10;#Top 10 higher cc cars in the list
select * from car_table where fuel='diesel' order by mileage desc limit 10; #Top diesel mileage cars
select distinct brand,name,selling_price from car_table where selling_price<200000 limit 10; #10 cars under the price 200000 
select distinct brand,name,selling_price from car_table where selling_price<100000 limit 10; #10 cars under the price 100000
select count(brand) as count1,brand from car_table group by brand order by count1 desc; # number of cars in brands
select count(year),year from car_table group by year;#number of cars in a year
select distinct(year) from  car_table;
describe car_table;
select * from car_table limit 7885,1;
delete from car_table where name='Maruti Omni CNG' and km_driven=100000;
alter table car_table modify column max_power int;
alter table car_table modify column torque int;
select * from car_table limit 6228,1;
update car_table set torque=substring_index(torque,' ',1);
select torque from car_table;
select min(mileage) from car_table;
delete from car_table where mileage=0;
select mileage,case when mileage<=10 then 'Low mileage' 
when mileage>10 and mileage<=19 then 'Average mileage'
else 'High mileage'end as mileage_category from car_table;
alter table car_table add mileage_category varchar(25);
update car_table set mileage_category=case when mileage<=10 then 'Low mileage' 
when mileage>10 and mileage<=19 then 'Average mileage'
else 'High mileage'end;
select km_driven,case  when km_driven<=10000 then 'Less than 10k'
when km_driven>10000 and km_driven<=100000 then 'Between 10k and 100k'
else 'Above 100k'end as km_category from car_table;
alter table car_table add km_category varchar(50);
update car_table set km_category=case  when km_driven<=10000 then 'Less than 10k'
when km_driven>10000 and km_driven<=100000 then 'Between 10k and 100k'
else 'Above 100k'end;
select count(mileage_category),mileage_category from car_table group by mileage_category;
select engine,case when engine<=1000 then 'Low powered'
when engine>1000 and engine<=2000 then 'Avg Powered'
else 'High powered'end as power_category from car_table;
alter table car_table add column power_category1 varchar(50);
update car_table set power_category=case when engine<=1000 then 'Low powered'
when engine>1000 and engine<=2000 then 'Avg Powered'
else 'High powered'end;
describe car_table; 
alter table car_table drop column power_category1;
select count(power_category),power_category from car_table group by power_category;#low avg high powerd engines
select count(fuel),fuel from car_table group by fuel;
create temporary table new_table select Brand, year, selling_price, km_driven, fuel, seller_type, transmission, owner, mileage, engine, max_power, torque, seats, name, mileage_category, km_category, power_category from car_table group by Brand, year, selling_price, km_driven, fuel, seller_type, transmission, owner, mileage, engine, max_power, torque, seats, name, mileage_category, km_category, power_category;
delete from car_table;
insert into car_table select * from new_table;
select * from car_table;
CREATE TABLE car_table1 (brand VARCHAR(50),year INT,fuel VARCHAR(20),mileage INT);
insert into car_table1 select brand,year,fuel,mileage from car_table;
select year(current_date1) from car_table;#Day month year
alter table car_table drop current_table;
update car_table set current_date1=current_date();
describe car_table;
select fuel,avg(selling_price) as avg1 from car_table group by fuel order by avg1 desc;#Q2
select transmission,avg(selling_price) as avg1 from car_table group by transmission order by avg1 desc;
select year,avg(selling_price) as avg1 from car_table group by year order by avg1 desc;
select km_category,avg(selling_price) as avg1 from car_table group by km_category order by avg1 desc;
select fuel,avg(selling_price) as avg1 from car_table group by fuel order by avg1 desc;#Q2
select owner,avg(selling_price) as avg1 from car_table group by owner order by avg1 desc;#Q2















