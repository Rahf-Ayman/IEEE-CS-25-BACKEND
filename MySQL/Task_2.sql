-- problem 1 (Revising the Select Query I)
select *
from city
where population > 100000 and countrycode='USA' ;

-- problem 2 (Revising the Select Query II)
select name 
from city 
where population> 120000 and countrycode = 'USA';

-- problem 3  (Japanese Cities' Attributes)
select *
from CITY
where COUNTRYCODE = 'JPN';

-- problem 4 (Employee Names)
select name
from  Employee
order by name asc ;

-- problem 5 (Employee Salaries)
select name
from Employee
where salary > 2000 and months <10
order by employee_id asc;

-- problem 6 (Higher Than 75 Marks)
select name 
from STUDENTS
where marks > 75
order by RIGHT(name,3)  , ID asc;

-- problem 7 (Unfinished Parts)
SELECT part ,assembly_step  
FROM parts_assembly
where finish_date is NULL;


