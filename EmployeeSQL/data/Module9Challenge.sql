-- 1. List the employee number, last name, first name, sex and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s ON e.emp_no = s.emp_no

-- 1 EX: Row quality check
SELECT count(*)
FROM salaries



-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986'



-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
LEFT JOIN departments d ON dm.dept_no = d.dept_no
LEFT JOIN employees e ON dm.emp_no = e.emp_no
GROUP BY 1,2,3,4,5

-- 3 EX: Quality check dept_manager rows
SELECT COUNT(*)
FROM dept_manager


-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN employees e ON de.emp_no = e.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
GROUP BY 1,2,3,4,5


-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'


-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE de.dept_no IN (SELECT dept_no FROM departments WHERE dept_name = 'Sales')

-- 6 EX. Row count quality check
SELECT COUNT(*)
FROM departments d
LEFT JOIN dept_emp de ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'


-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE de.dept_no IN (SELECT dept_no FROM departments WHERE dept_name IN ('Sales', 'Development'))
GROUP BY 1,2,3,4

-- 7 EX. Row count quality check
SELECT COUNT(*)
FROM departments d
LEFT JOIN dept_emp de ON d.dept_no = de.dept_no
WHERE d.dept_name IN ('Sales', 'Development')


-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS count_last_name
FROM employees
GROUP BY last_name
ORDER BY count_last_name desc



