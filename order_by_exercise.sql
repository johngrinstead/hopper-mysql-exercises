-- 1. Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

select first_name, last_name
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name;
	-- First observation is Irena Reutenuer
	-- Last observation is Vidya Simmen
    
-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

select first_name, last_name
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name, last_name;
	-- First observation is Irena Acton
	-- Last observation is Vidya Zweizig
    
-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

select first_name, last_name
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by last_name, first_name;
	-- First observation is Irena Acton
	-- Last Observation is Maya Zyda
    
-- 5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.

select emp_no, first_name, last_name
from employees
where last_name like 'E%' and last_name like '%e'
order by emp_no;
	-- 899 rows returned 
	-- First observation is Ramzi Erde, 10021
	-- Last observation is Tadahiro Erde, 499648
    
-- 6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.

select first_name, last_name, hire_date
from employees
where last_name like 'E%' and last_name like '%e'
order by hire_date desc;
	-- Newest employee is Teiji Eldridge, 1999-11-27
	-- Oldest employee is Sergi Erde, 1985-02-02
    
-- 7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.

select first_name, last_name, birth_date, hire_date
from employees
where birth_date like '%-12-25'
and hire_date like '199%'
order by birth_date, hire_date desc;
	-- 362 rows returned 
	-- Oldest employee hired most recently is Khun Bernini, born 1952-12-25, hired 1999-08-31
	-- Youngest employee hired the earliest is Douadi Pettis, born 1964-12-25, hired 1990-05-04
