--List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, 
		e.last_name, 
		e.first_name, 
		e.sex, 
		s.salary 
FROM employees e
JOIN salaries s ON
e.emp_no = s.emp_no
ORDER BY last_name ASC;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, 
		last_name, 
		hire_date
FROM employees
WHERE hire_date LIKE '%1986'
ORDER BY last_name ASC; 

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT e.last_name, 
		e.first_name, 
		e.emp_no, 
		d.dept_name, 
		dm.dept_no
FROM employees e
JOIN dept_manager dm ON
e.emp_no = dm.emp_no
JOIN departments d ON
dm.dept_no = d.dept_no
ORDER BY last_name ASC;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT e.last_name, 
		e.first_name, 
		e.emp_no, 
		d.dept_name, 
		de.dept_no
FROM employees e
JOIN dept_emp de ON
e.emp_no = de.emp_no
JOIN departments d ON
de.dept_no = d.dept_no
ORDER BY last_name ASC;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, 
		last_name, 
		sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY last_name ASC;

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT emp_no, last_name, first_name
FROM employees 
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'))
ORDER BY last_name ASC;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM employees e
JOIN dept_emp de ON
e.emp_no = de.emp_no
JOIN departments d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development'
ORDER BY dept_name ASC , last_name ASC;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS "Name Frequency"
FROM employees 
GROUP BY last_name
ORDER BY "Name Frequency" DESC, last_name ASC;
