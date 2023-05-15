
CREATE TABLE titles (
    title_id VARCHAR(6) PRIMARY KEY NOT NULL,
    title VARCHAR(25) NOT NULL
);

CREATE TABLE employees (
    emp_no int PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(6) NOT NULL,
    birth_date VARCHAR(10),
    first_name VARCHAR(15),
    last_name VARCHAR(30),
    sex VARCHAR(1),
    hire_date VARCHAR(10),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary int NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE departments (
    dept_no VARCHAR(6) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(20) NOT NULL
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(6) NOT NULL,
    emp_no int   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no VARCHAR(6) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);


SELECT * 
FROM titles;

SELECT * 
FROM employees;

SELECT * 
FROM salaries;

SELECT * 
FROM departments;

SELECT * 
FROM dept_manager;

SELECT * 
FROM dept_emp;