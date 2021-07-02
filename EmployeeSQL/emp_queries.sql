--- Query 1: For each employee: employee number, last name, first name, sex, salary ---
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--- Query 2: List first name, last name, hire date for employees hired in 1986 ---
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--- Query 3: List manager of each department with: department number, department name, manager's employee number, last name, first name ---
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--- Query 4: List department of each employee with: employee number, last name, first name, department name ---
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--- Query 5: List first name, last name, sex for employees whose first name is "Hercules" and last names begin with "B" ---
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--- Query 6: List all employees in Sales department, including: employee number, last name, first name, department name ---
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd007';

--- Query 7: List all employees in Sales and Development departments, including: employee number, last name, first name, department name ---
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd007' 
OR dept_emp.dept_no = 'd005';

--- Query 8: In descending order, list frequency count of employee last names ---
SELECT last_name,
COUNT(last_name) AS "frequency_count"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;