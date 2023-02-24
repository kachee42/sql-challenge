-- Join tables to list emp_no, first_name, last_name, sex, and salary and save to view
CREATE VIEW emp_salary_list AS
SELECT 
	employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	employees.sex, 
	salaries.salary
FROM employees
JOIN salaries
	on employees.emp_no = salaries.emp_no;
	
-- Display created view
SELECT * FROM emp_salary_list;
	
-- Create table view to display first name, last name and hire date for employees in 1986
CREATE VIEW emp_hire_date_1986 AS
SELECT 
	first_name, 
	last_name, 
	hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31';

-- Display created view
SELECT * FROM emp_hire_date_1986;

-- Join tables and create view to display department managers, department names, employee numbers, last names and first names
CREATE VIEW dept_mgrs AS
SELECT 
	departments.dept_no, 
	departments.dept_name, 
	employees.emp_no, 
	employees.last_name,
	employees.first_name	
FROM department_manager
JOIN employees ON employees.emp_no = department_manager.emp_no
JOIN departments ON departments.dept_no = department_manager.dept_no;

-- Test to make sure view is correct
SELECT * FROM dept_mgrs;

-- Create table view to display dept no, empl no, last name, first name, and dept name
CREATE VIEW emp_dept AS
SELECT 
	employee_department.dept_no, 
	employees.emp_no, 
	employees.last_name,
	employees.first_name, 
	departments.dept_name
FROM employee_department
JOIN employees ON employees.emp_no = employee_department.emp_no
JOIN departments ON departments.dept_no = employee_department.dept_no;

-- Display created view
SELECT * FROM emp_dept;

-- Create view selecting first, last and sex of employees named Hercules B.
CREATE VIEW hercules_b AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Display created view
SELECT * FROM hercules_b;

-- Create view of employee number, last name, first name of employees in sales
CREATE VIEW sales AS
SELECT  
	employees.emp_no, 
	employees.last_name,
	employees.first_name
FROM employee_department
JOIN employees ON employees.emp_no = employee_department.emp_no
JOIN departments ON departments.dept_no = employee_department.dept_no
WHERE departments.dept_name = 'Sales';

-- Display created view
SELECT * FROM sales;

-- Create view of employee number, last name, first name, and department name of sales and development departments
CREATE VIEW sales_dev AS
SELECT 
	employees.emp_no, 
	employees.last_name,
	employees.first_name, 
	departments.dept_name
FROM employee_department
JOIN employees ON employees.emp_no = employee_department.emp_no
JOIN departments ON departments.dept_no = employee_department.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

-- Display created view
SELECT * FROM sales_dev;

-- Create view of frequency counts of last names
CREATE VIEW last_name_counts AS
SELECT last_name, COUNT(last_name) AS "name counts"
FROM employees
GROUP BY last_name
ORDER BY "name counts" DESC;

-- Display name counts table
SELECT * FROM last_name_counts;