# SQL_Challenge
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

------------

--Joining two TABLES
SELECT employees.emp_no, employees.emp_title_id, employees.birth_date, employees.first_name, employees.last_name, employees.sex, employees.hire_date, titles.title
FROM employees
INNER JOIN titles ON
employees.emp_title_id = titles.title_id;

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

------------
-----Fifth table

--Delete the old table for dept_manager
DROP TABLE dept_manager;

--Create a new table for dept_manager
CREATE TABLE dept_manager(
    dept_no VARCHAR(30),
    emp_no INT
);
--Populate the table data
SELECT * FROM dept_manager;--Delete the old table

-------------
--Joining two TABLES
SELECT departments.dept_name, dept_employment.emp_no
FROM departments
INNER JOIN dept_employment ON
departments.dept_no = dept_employment.dept_no;

------------
-----Sixth table

DROP TABLE salaries;
--Create a new table
CREATE TABLE salaries(
    emp_no INT,
    salary INT
);
--Populate the table data
SELECT * FROM salaries;



------------


--Create a new table
CREATE TABLE titles(
    title_id VARCHAR (20),
    title  VARCHAR (20)
);
--Populate the table data
SELECT * FROM titles;

----------

--Joining two TABLES
SELECT dept_manager.sa, dept_employment.emp_no
FROM departments
INNER JOIN dept_employment ON
departments.dept_no = dept_employment.dept_no;


--Create a new table
CREATE TABLE salaries(
    emp_no INT,
    salary INT
);
--Populate the table data
SELECT * FROM salaries;
----

DROP TABLE departments;
--Create a new table
CREATE TABLE departments(
    dept_no VARCHAR(30),
    dept_name VARCHAR (30)
);
--Populate the table data
SELECT * FROM departments;

--Joining two TABLES
SELECT departments.dept_name, dept_employment.emp_no
FROM departments
INNER JOIN dept_employment ON
departments.dept_no = dept_employment.dept_no;

--Create a new table
CREATE TABLE dept_employment(
    emp_no INT,
    dept_no  VARCHAR (20)
);
--Populate the table data
SELECT * FROM dept_employment;

-------


-------------
--Create a new table
CREATE TABLE dept_manager(
    dept_no VARCHAR(30),
    emp_no INT
);
--Populate the table data
SELECT * FROM dept_manager;

