
-- -----------------
-- Q1 List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, last_name, first_name, gender, salary
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no;

-- -----------------
-- Q2 List employees who were hired in 1986

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'
ORDER BY hire_date ASC;

-- -----------------
-- Q3 List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
-- first name, and start and end employment dates.

SELECT departments.dept_no, dept_name, dept_manager.emp_no, last_name, first_name, dept_emp.from_date, dept_emp.to_date
FROM departments
LEFT JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no
LEFT JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
;

-- -----------------
-- Q4 List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
;

-- -----------------
-- Q5 List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- -----------------
-- Q6 List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, last_name, first_name, dept_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales'
;

-- -----------------
-- Q7 List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, last_name, first_name, dept_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'
;

-- -----------------
-- Q8 In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC
;
