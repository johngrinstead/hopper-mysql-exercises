-- 1. Open Sequel Ace and login to the database server

-- 2. Save your work in a file named tables_exercises.sql

-- 3. Use the employees database

use employees;

select database();

-- 4. List all the tables in the database

show tables;

-- 5. Explore the employees table. What different data types are present on this table?

describe employees;

    -- INT : emp_no
    -- DATE: birth_date & hire_date
    -- VARCHAR: first_name & last_name
    -- ENUM: gender
    
-- 6. Which table(s) do you think contain a numeric type column?

    -- employees
    -- dept_emp
    -- dept_manager
    -- salary
    -- titles
    
-- 7. Which table(s) do you think contain a string type column?

    -- departments
    -- dept_emp
    -- dept_manager
    -- employees
    -- titles
    
-- 8. Which table(s) do you think contain a date type column?
    
    -- dept_emp
    -- dept_manager
    -- employees
    -- salaries
    -- titles
    
-- 9. What is the relationship between the employees and the departments tables?

    -- The employees table shows each individual employee and their employee id info
    -- The departments table shows each dept name and dept number
    -- the dept_emp table shows which emp_no belong to which dept_no
    
-- 10. Show the SQL that created the dept_manager table.

show create table dept_manager;

