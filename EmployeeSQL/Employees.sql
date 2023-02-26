----- first table
--Delete the old table
DROP TABLE employees;
--Create a new table
CREATE TABLE employees(
    emp_no INT,
    emp_title_id VARCHAR(30),
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
    dept_no PRIMARY_KEY VARCHAR(30),
    dept_name VARCHAR (30)
);

--Populate the table data
SELECT * FROM departments;

--Third Table
--Delete the old table
DROP TABLE dept_employment;
--Create a new table
CREATE TABLE dept_employment(
    emp_no INT,
    dept_no  VARCHAR (20)
);
--Populate the table data
SELECT * FROM dept_employment;

-----Fourth table
--Delete the old table for dept_manager
DROP TABLE dept_manager;

--Create a new table for dept_manager
CREATE TABLE dept_manager(
    dept_no VARCHAR(30),
    emp_no INT
);
--Populate the table data
SELECT * FROM dept_manager;


-----Fifth table
--Delete the old table
DROP TABLE titles;
--Create a new table
CREATE TABLE titles(
    title_id VARCHAR (20),
    title  VARCHAR (20)
);
--Populate the table data
SELECT * FROM titles;

------sixth table
DROP TABLE salaries;
--Create a new table
CREATE TABLE salaries(
    emp_no INT,
    salary INT
);
--Populate the table data
SELECT * FROM salaries;


---Data Modeling
---The diagram is available in the EmployeeSQL Folder


--Data Engineering 

--Data Analysis

--Employees worked between '1980-01-01' AND '1990-12-31' 
SELECT * FROM employees WHERE hire_date BETWEEN '1980/01/01' AND '1990/12/31';

----List the first name, last name, and hire date for the employees who were hired in 1986. 
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the employee number, last name, first name, sex, and salary of each employee
SELECT employees. emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;


--List the manager of each department along with their department number, department name, employee number, last name, and first name.



--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

--List each employee in the Sales department, including their employee number, last name, and first name.

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).



--Joining two TABLES
SELECT departments.dept_no, employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM departments
INNER JOIN employees ON employees.emp_title_id = departments.dept_no

SELECT departments.dept_no, employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM departments
--INNER JOIN employees ON departments.emp_no = employees.emp_no
INNER JOIN employees ON employees.dept_no = departments.dept_no;



--Create a new table
CREATE TABLE employees(
    emp_no INT,
    emp_title_id VARCHAR(30),
    birth_date DATE,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    sex VARCHAR (10), 
    hire_date DATE
);
--Populate the table data
SELECT * FROM employees;


-----Second table
--Delete the old table
DROP TABLE titles;
--Create a new table
CREATE TABLE titles(
    title_id VARCHAR (20),
    title  VARCHAR (20)
);
--Populate the table data
SELECT * FROM titles;


-----Third table

--Delete the old table
DROP TABLE departments;

--Create a new table for departments 
CREATE TABLE departments(
    dept_no VARCHAR(30),
    dept_name VARCHAR (30)
);

--Populate the table data
SELECT * FROM departments;

------------
--Joining two TABLES
SELECT departments.dept_name, dept_employment.emp_no, 
FROM departments
INNER JOIN dept_employment ON
departments.dept_no = dept_employment.dept_no;


------Fourth table

--Delete the old table
DROP TABLE dept_employment;
--Create a new table
CREATE TABLE dept_employment(
    emp_no INT,
    dept_no  VARCHAR (20)
);
--Populate the table data
SELECT * FROM dept_employment;


--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
  d.dept_no, 
  d.dept_name, 
  dm.emp_no, 
  e.last_name, 
  e.first_name
FROM 
  departments d 
  INNER JOIN (
    SELECT 
      dept_no, 
      emp_no 
    FROM 
      dept_manager 
    WHERE 
      to_date = '9999-01-01'
  ) dm 
    ON d.dept_no = dm.dept_no 
  INNER JOIN employees e 
    ON dm.emp_no = e.emp_no;

--Joining two TABLES
SELECT departments.dept_name, dept_employment.emp_no
FROM departments
INNER JOIN dept_employment ON
departments.dept_no = dept_employment.dept_no;

