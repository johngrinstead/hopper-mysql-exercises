-- 1. Create a new file named group_by_exercises.sql

-- 2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.

select distinct title
from titles;
	-- 7 rows returned 
    
-- 3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.

select last_name
from employees
where last_name like 'E%e'
group by last_name;

-- 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.

select concat(first_name , ' ', last_name) as full_name
from employees
where last_name like 'E%e'
group by full_name;

-- 5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.

select last_name
from employees
where (last_name like '%q%' or last_name like 'Q%')
and (last_name not like '%qu%' and last_name not like 'Qu%')
group by last_name;
	-- Chelq
	-- Lindqvist
	-- Qiwen
    
-- 6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name.

select last_name, count(last_name)
from employees
where (last_name like '%q%' or last_name like 'Q%')
and (last_name not like '%qu%' and last_name not like 'Qu%')
group by last_name;

-- 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

select first_name, count(first_name)
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
group by first_name;

-- 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?

select lower(concat(substr(first_name, 1, 1), substr(last_name, 1, 4), '_', substr(birth_date, 6, 2), substr(birth_date, 3, 2))) as username, count(*) as user_count
from employees
group by username
having user_count > 1
order by user_count desc;
	-- 13251 rows returned 
    
-- 9. More practice with aggregate functions:

    -- Find the historic average salary for all employees. Now determine the current average salary.
    
select avg(salary) as historical_avg, (
	select avg(salary)
	from salaries
	where to_date > curdate()
	) as current_avg
from salaries;

    -- Now find the historic average salary for each employee. Reminder that when you hear "for each" in the problem statement, you'll probably be grouping by that exact column.
    
select emp_no, avg(salary) as historical_avg 
from salaries
group by emp_no;

    -- Find the current average salary for each employee.
    
select emp_no, avg(salary) as current_avg
from salaries
where to_date > curdate()
group by emp_no;

    -- Find the maximum salary for each current employee.
    
select emp_no, max(salary) as highest_salary 
from salaries
group by emp_no;

    -- Now find the max salary for each current employee where that max salary is greater than $150,000.
    
select emp_no, max(salary) as highest_salary 
from salaries
group by emp_no
having highest_salary > 150000;

    -- Find the current average salary for each employee where that average salary is between $80k and $90k.
    
select emp_no, avg(salary) as current_avg
from salaries
where to_date > curdate()
group by emp_no
having current_avg > 80000 and current_avg < 90000;

