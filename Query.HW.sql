--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees 
JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT department.dept_no, department.dept_name, department_manager.emp_no,
employees.last_name, employees.first_name
FROM department
JOIN department_manager ON department.dept_no = department_manager.dept_no
JOIN employees ON department_manager.emp_no = employees.emp_no;

-- List the department of each employee with the following information: employee number
--last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM employees
JOIN department_emp ON employees.emp_no = department_emp.emp_no
JOIN department ON department_emp.dept_no = department.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT employees.first_name, employees.Last_name, employees.sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM employees
JOIN department_emp ON employees.emp_no = department_emp.emp_no 
JOIN department ON department_emp.dept_no = department.dept_no WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number
-- last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM employees
JOIN department_emp ON employees.emp_no = department_emp.emp_no 
JOIN department ON department_emp.dept_no = department.dept_no WHERE dept_name = 'Sales' OR dept_name= 'Development';


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name 
ORDER BY COUNT DESC;
