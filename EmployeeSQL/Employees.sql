----- first table
--Delete the old table
DROP TABLE employees;
--Create a new table
CREATE TABLE employees(
    emp_no INT PK,
    emp_title_id VARCHAR(30) FK,
    birth_date DATE,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    sex VARCHAR (10), 
    hire_date DATE
);
--Populate the table data
SELECT * FROM employees;
----- Second table

--Second Table
--Create a new table for departments 
CREATE TABLE departments(
    dept_no VARCHAR(30) PK,
    dept_name VARCHAR (30) FK
);

--Populate the table data
SELECT * FROM departments;

--Third Table
--Delete the old table
DROP TABLE dept_employment;
--Create a new table
CREATE TABLE dept_employment(
    emp_no INT PK,
    dept_no  VARCHAR (20)FK
);
--Populate the table data
SELECT * FROM dept_employment;

-----Fourth table
--Delete the old table for dept_manager
DROP TABLE dept_manager;

--Create a new table for dept_manager
CREATE TABLE dept_manager(
    dept_no VARCHAR(30) PK,
    emp_no INT FK
);
--Populate the table data
SELECT * FROM dept_manager;


-----Fifth table
--Delete the old table
DROP TABLE titles;
--Create a new table
CREATE TABLE titles(
    title_id VARCHAR (20) PK,
    title  VARCHAR (20)FK
);
--Populate the table data
SELECT * FROM titles;

------sixth table
DROP TABLE salaries;
--Create a new table
CREATE TABLE salaries(
    emp_no INT FK,
    salary INT PK
);
--Populate the table data
SELECT * FROM salaries;

---Data Normalization
--The data was clean and didn't require any clean up. 

---Data Modeling
---The diagram is available in the EmployeeSQL Folder

---Data Engineering 
--All required columns were defined for each table (10 points)
--Columns are set to the correct data type (10 points)
--Primary Keys set for each table (10 points)
--Correctly references related tables (10 points)
--Tables are correctly related using Foreign Keys (10 points)
--Correctly uses NOT NULL condition on necessary columns (10 points)
--Accurately defines value length for columns (10 points)

---Data Analysis
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

