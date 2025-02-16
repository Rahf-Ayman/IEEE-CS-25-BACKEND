-- Problem 1 (Type of Triangle)
select case when a+b<=c or c+b<=a or c+a<=b  then 'Not A Triangle' 
                   when a=b and b=c  then 'Equilateral'
                  when a=b or b=c or a=c then 'Isosceles'
                  else 'Scalene'  end
 from TRIANGLES;
 
 -- problem 2 (The PADS)
 SELECT CONCAT(Name, '(', SUBSTRING(Occupation, 1, 1), ')') 
FROM OCCUPATIONS
ORDER BY Name ASC;

SELECT CONCAT('There are a total of',' ',COUNT(Occupation),' ' ,LOWER(Occupation),'s','.' )
FROM OCCUPATIONS
group by Occupation
order by COUNT(Occupation) ASC ,Occupation ASC;

-- problem 3 (New Companies)
select c.company_code ,c.founder ,COUNT(DISTINCT l.lead_manager_code )
,COUNT(DISTINCT s.senior_manager_code),COUNT(DISTINCT m.manager_code), COUNT(DISTINCT e.employee_code)
from Company c JOIN Lead_Manager l
on c.company_code = l.company_code
 JOIN Senior_Manager s
on c.company_code = s.company_code
 JOIN Manager m
on c.company_code = m.company_code
 JOIN Employee e
on c.company_code = e.company_code
GROUP BY c.company_code, c.founder  
ORDER BY c.company_code ASC;

-- problem 4 (SQL Project Planning)
WITH ProjectGroups AS (
    SELECT 
        Start_Date,
        End_Date,
        DATE_SUB(Start_Date, INTERVAL ROW_NUMBER() OVER (ORDER BY Start_Date) DAY) AS GroupID
    FROM Projects
)
SELECT 
    MIN(Start_Date) AS Project_Start, 
    MAX(End_Date) AS Project_End
FROM ProjectGroups
GROUP BY GroupID
ORDER BY DATEDIFF(MAX(End_Date), MIN(Start_Date)), MIN(Start_Date);

-- problem 5 (Average Population)
SELECT  FLOOR(AVG(population))
FROM city;

-- problem 6 (Ollivander's Inventory)
SELECT w.id , p.age , w.coins_needed , w.power
FROM Wands w JOIN Wands_Property p
ON w.code = p.code
WHERE p.is_evil = 0
AND w.coins_needed = (
    SELECT MIN(w1.coins_needed)
    FROM Wands w1
    JOIN Wands_Property p1 ON w1.code = p1.code
    WHERE p1.is_evil = 0
    AND w1.power = w.power
    AND p1.age = p.age
)
order by w.power DESC , p.age DESC;
 
 -- problem 7 (The Report)
 select case when grade <8 then 'NULL'
                   else name end, grade, marks
from   Students join Grades on Students.marks between Grades.Min_Mark and Max_mark
order by grade desc , name   asc ;

-- problem 8 (Symmetric Pairs) 
WITH left_t AS (
    SELECT f1.X, f1.Y, ROW_NUMBER() OVER (ORDER BY f1.X, f1.Y) AS num
    FROM Functions f1   
),
right_t AS (
    SELECT f1.X, f1.Y, ROW_NUMBER() OVER (ORDER BY f1.X, f1.Y) AS num
    FROM Functions f1
)
SELECT f1.X, f1.Y
FROM left_t f1
JOIN right_t f2 
ON f1.X = f2.Y AND f1.Y = f2.X
WHERE f1.num < f2.num AND f1.num <> f2.num
ORDER BY f1.X;

-- problem 9 (Weather Observation Station 15)
select  cast(round(LONG_W,4) as decimal(18,4))
from STATION
where LAT_N =(select max(LAT_N) from STATION where LAT_N<137.2345);

-- problem 10 (Placements)
with salary_friend as(
    SELECT f.ID , f.friend_ID , s.Salary 
    from Friends f join Packages s
    on s.ID = f.friend_ID
)
, salary_student as(
    SELECT st.ID ,  s.Salary , st.Name
    from Students st join Packages s
    on st.ID = s.ID
)

SELECT s.Name
FROM salary_student s LEFT JOIN salary_friend f
on s.ID = f.ID
WHERE f.Salary > s.Salary
ORDER by f.Salary;