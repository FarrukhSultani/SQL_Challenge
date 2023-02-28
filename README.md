# **SQL_Challenge
## EmployeeSQL. 
The EmployeeSQL is an attempt to set company's data structured. Below is an overview of the process in order to extract the desired datasets. 

-----
- Run Postgres and pgAdmin.
- Created a SQL database and its tables by using pgAdmin.
- Defined SQL data types, primary keys, and unique values.
- Loaded the data from CSV files into a database and then query the data.
- Explained the four basic functions of persistent storage—create, read, update, delete (CRUD)—and apply them to a database.
- Combined the data from multiple tables by using JOIN clauses. 

Note: The ables information are commented next to every single statement. I copied them here to make it easier to read and accessible.  

    * List the employee number, last name, first name, sex, and salary of each employee.

    * List the first name, last name, and hire date for the employees who were hired in 1986.

    * List the manager of each department along with their department number, department name, employee number, last name, and first name.

    * List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

    * List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

    * List each employee in the Sales department, including their employee number, last name, and first name.

    * List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

    * List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

### The diagram for tables came out as below which shows the relationship between tables


<img src="https://github.com/FarrukhSultani/SQL_Challenge/blob/main/EmployeeSQL/QuickDBD-EmployeeSQL.png"alt="Image Link">


-----

## Data Analysis

--Employees worked between '1980-01-01' AND '1990-12-31' 
SELECT * FROM employees WHERE hire_date BETWEEN '1980/01/01' AND '1990/12/31';

--List the first name, last name, and hire date for the employees who were hired in 1986. 
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the employee number, last name, first name, sex, and salary of each employee
SELECT employees. emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;


--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_employment de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_employment de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_employment de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

To come up with these analysis, I had to first normalize data, run the process of data modeling and then run specific statements for each code. 


-----

