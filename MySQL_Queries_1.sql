create database powerbi;

select * from hr ;


alter table hr
rename column ï»¿id to emp_id; 

select birthdate from hr;

update hr
set birthdate=case
when birthdate like "%/%" then date_format(str_to_date(birthdate,"%m/%d/%Y"),"%Y-%m-%d")
when birthdate like "%-%" then date_format(str_to_date(birthdate,"%m-%d-%Y"),"%Y-%m-%d")
end;

alter table hr
modify column  birthdate date;

update hr
set hire_date=case
when hire_date like "%/%" then date_format(str_to_date(hire_date,"%m/%d/%Y"),"%Y-%m-%d")
when hire_date like "%-%" then date_format(str_to_date(hire_date,"%m-%d-%Y"),"%Y-%m-%d")
end;

alter table hr
modify column hire_date date;

select hire_date from hr
limit 5;

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;


describe hr;

alter table hr
add column age int;

update hr
set age=timestampdiff(Year,birthdate,curdate());

select birthdate,age from hr;













