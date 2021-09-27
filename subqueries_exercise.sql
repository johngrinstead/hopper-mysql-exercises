-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

	-- find hire date of employe 101010
	
select hire_date
from employees
where emp_no = 101010;
	
	-- 1990/10/22
	
select *
from employees
join dept_emp using(emp_no)
where hire_date = (
	select hire_date
	from employees
	where emp_no = 101010
)
and dept_emp.to_date > curdate();

-- 2. Find all the titles ever held by all current employees with the first name Aamod.


	-- find all current employees named Aamod
	
select emp_no
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
where first_name = 'Aamod'
and to_date > curdate();

	-- now find all their titles
	
select title 
from titles
join employees using (emp_no)
where titles.emp_no in (
	select employees.emp_no
	from employees
	join dept_emp on employees.emp_no = dept_emp.emp_no
	where first_name = 'Aamod'
	and to_date > curdate()
)
group by title;

-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

	-- find all the employees who are not current
	
select emp_no 
from dept_emp
where to_date < curdate();

	-- use this query to filter for all employees
	
select count(emp_no)
from employees
where emp_no not in (
	select emp_no 
	from dept_emp
	where to_date > curdate()
);
	-- 85108
    
-- 4. Find all the current department managers that are female. List their names in a comment in your code.


	-- find all employees who are female
	
select emp_no
from employees
where gender = 'F';

	-- now use this query to filter all current managers
	
select concat(first_name, ' ', last_name) as manager
from dept_manager
join employees using (emp_no)
where emp_no in (
	select emp_no
	from employees
	where gender = 'F'
)
and to_date > curdate();
	-- Isamu Legleitner
	-- Karsten Sigstam
	-- Leon DasSarma
	-- Hilary Kambil
    
-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.


	-- find the historical average salary
	
select avg(salary)
from salaries;

	-- find all current employees whose salary is greate than $63,810.75

select *
from employees
join salaries using (emp_no)
where salaries.to_date > curdate()
and salary > (
	select avg(salary)
	from salaries
);

-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

select
 (Select count(salary)
 from salaries
 where salary > (
        Select 
        max(salary) - STDDEV(salary)
        from salaries
        Where to_date > curdate())
 AND to_date > curdate())
 /
 (select
 count(salary)
 from salaries
 Where to_date > curdate())
 *100;
 
 -- BONUS!!!!!!!!!!!!!!!!



-- Find all the department names that currently have female managers.

select *
from departments
where dept_no in (
	select dept_no
	from dept_manager
	where emp_no in (
		select emp_no
		from employees
		where gender = 'F'
	)
	and to_date > curdate()
);

-- Find the first and last name of the employee with the highest salary.

select first_name, last_name
from employees
where emp_no in (
	select emp_no
	from salaries
	where salary in(
		select max(salary)
		from salaries
	)
	and to_date > curdate()
);

-- Find the department name that the employee with the highest salary works in.

select concat(first_name, ' ', last_name) as employee_name, dept_name
from employees
join dept_emp using (emp_no)
join departments using (dept_no)
where emp_no in (
	select emp_no
	from salaries
	where salary in(
		select max(salary)
		from salaries
	)
	and to_date > curdate()
);