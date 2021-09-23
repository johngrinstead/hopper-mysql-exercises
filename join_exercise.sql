-- Join Example Database

-- 1. Use the join_example_db. Select all the records from both the users and roles tables.

select * 
from users
join roles on roles.id = users.role_id;

-- 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

select * 
from users
left join roles on roles.id = users.role_id;

select * 
from users
right join roles on roles.id = users.role_id;

-- 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.

select roles.name, count(*)
from users
join roles on roles.id = users.role_id
group by roles.name;

-- Employees Database

-- 1. Use the employees database.

use employees;

-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

'''
  Department Name    | Department Manager
 --------------------+--------------------
  Customer Service   | Yuchang Weedman
  Development        | Leon DasSarma
  Finance            | Isamu Legleitner
  Human Resources    | Karsten Sigstam
  Marketing          | Vishwani Minakawa
  Production         | Oscar Ghazalie
  Quality Management | Dung Pesch
  Research           | Hilary Kambil
  Sales              | Hauke Zhang
'''

select departments.dept_name, concat(employees.first_name, ' ', employees.last_name) as current_manager
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no and dept_manager.to_date > curdate()
join employees on dept_manager.emp_no = employees.emp_no;

-- 3. Find the name of all departments currently managed by women.

'''
Department Name | Manager Name
----------------+-----------------
Development     | Leon DasSarma
Finance         | Isamu Legleitner
Human Resources | Karsetn Sigstam
Research        | Hilary Kambil
'''

select departments.dept_name, concat(employees.first_name, ' ', employees.last_name) as current_manager
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no and dept_manager.to_date > curdate()
join employees on dept_manager.emp_no = employees.emp_no and employees.gender = 'F';

-- 4. Find the current titles of employees currently working in the Customer Service department.

'''
Title              | Count
-------------------+------
Assistant Engineer |    68
Engineer           |   627
Manager            |     1
Senior Engineer    |  1790
Senior Staff       | 11268
Staff              |  3574
Technique Leader   |   241
'''

select titles.title, count(titles.title)
from dept_emp
join departments on dept_emp.dept_no = departments.dept_no and departments.dept_no = 'd009'
join titles on titles.emp_no = dept_emp.emp_no and titles.to_date > curdate()
group by titles.title;

-- 5. Find the current salary of all current managers.

'''
Department Name    | Name              | Salary
-------------------+-------------------+-------
Customer Service   | Yuchang Weedman   |  58745
Development        | Leon DasSarma     |  74510
Finance            | Isamu Legleitner  |  83457
Human Resources    | Karsten Sigstam   |  65400
Marketing          | Vishwani Minakawa | 106491
Production         | Oscar Ghazalie    |  56654
Quality Management | Dung Pesch        |  72876
Research           | Hilary Kambil     |  79393
Sales              | Hauke Zhang       | 101987
'''

select departments.dept_name, concat(employees.first_name, ' ', employees.last_name) as current_manager, salaries.salary
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no and dept_manager.to_date > curdate()
join employees on dept_manager.emp_no = employees.emp_no
join salaries on salaries.emp_no = employees.emp_no and salaries.to_date > curdate();

-- 6. Find the number of current employees in each department.

'''
+---------+--------------------+---------------+
| dept_no | dept_name          | num_employees |
+---------+--------------------+---------------+
| d001    | Marketing          | 14842         |
| d002    | Finance            | 12437         |
| d003    | Human Resources    | 12898         |
| d004    | Production         | 53304         |
| d005    | Development        | 61386         |
| d006    | Quality Management | 14546         |
| d007    | Sales              | 37701         |
| d008    | Research           | 15441         |
| d009    | Customer Service   | 17569         |
+---------+--------------------+---------------+
'''

select departments.dept_no, departments.dept_name, count(departments.dept_no)
from departments
join dept_emp on dept_emp.dept_no = departments.dept_no and dept_emp.to_date > curdate()
group by departments.dept_no;

-- 7. Which department has the highest average salary? Hint: Use current not historic information.

'''
+-----------+----------------+
| dept_name | average_salary |
+-----------+----------------+
| Sales     | 88852.9695     |
+-----------+----------------+
'''

select departments.dept_name, avg(salaries.salary) as avg_salary
from departments
join dept_emp on dept_emp.dept_no = departments.dept_no and dept_emp.to_date > curdate()
join salaries on salaries.emp_no = dept_emp.emp_no and salaries.to_date > curdate()
group by departments.dept_name
order by avg_salary desc
limit 1;

-- 8. Who is the highest paid employee in the Marketing department?

'''
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Akemi      | Warwick   |
+------------+-----------+
'''

select concat(employees.first_name, ' ', employees.last_name) as employee_name, max(salaries.salary) as max_salary
from departments
join dept_emp on dept_emp.dept_no = departments.dept_no and dept_emp.to_date > curdate() and departments.dept_no = 'd001'
join salaries on salaries.emp_no = dept_emp.emp_no and salaries.to_date > curdate()
join employees on employees.emp_no = dept_emp.emp_no
group by employee_name
order by max_salary desc
limit 1;

-- 9. Which current department manager has the highest salary?

'''
+------------+-----------+--------+-----------+
| first_name | last_name | salary | dept_name |
+------------+-----------+--------+-----------+
| Vishwani   | Minakawa  | 106491 | Marketing |
+------------+-----------+--------+-----------+

'''

select departments.dept_name, concat(employees.first_name, ' ', employees.last_name) as current_manager, salaries.salary
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no and dept_manager.to_date > curdate()
join employees on dept_manager.emp_no = employees.emp_no
join salaries on salaries.emp_no = employees.emp_no and salaries.to_date > curdate()
order by salaries.salary desc
limit 1;

