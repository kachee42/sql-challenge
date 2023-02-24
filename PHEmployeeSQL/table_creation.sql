-- Create titles table and verify data imported correctly
CREATE TABLE titles (
	title_id VARCHAR(10) NOT NULL,
	title VARCHAR(20) NOT NULL,
	PRIMARY KEY (title_id)
);

SELECT * from titles;

-- Create departments table and verify data imported correctly
CREATE TABLE departments (
	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * from departments;

-- Create employees table and verify data imported correctly
DROP TABLE employees;

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(10) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(10) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT * FROM employees;

-- Create table employee_department and verify data imported correctly
CREATE TABLE employee_department (
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM employee_department;

-- Create table department_manager and verify data imported correctly
CREATE TABLE department_manager (
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM department_manager;

-- Create table salaries and verify data imported correctly
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;