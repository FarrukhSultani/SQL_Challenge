# SQL_Challenge

-----Creating first table
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
-----Creating the second table
--Delete the old table for dept_manager
DROP TABLE dept_manager;

--Create a new table for dept_manager
CREATE TABLE dept_manager(
    dept_no VARCHAR(30),
    emp_no INT
);
--Populate the table data
SELECT * FROM dept_manager;

------------
-----Creating the third table

--Delete the old table
DROP TABLE salaries;
--Create a new table
CREATE TABLE salaries(
    emp_no INT,
    salary INT
);
--Populate the table data
SELECT * FROM salaries;

------------
-----Creating the fourth table

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
-----Creating the fifth table

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
-----Creating the sixth table

--Delete the old table
DROP TABLE titles;
--Create a new table
CREATE TABLE titles(
    title_id VARCHAR (20),
    title  VARCHAR (20)
);
--Populate the table data
SELECT * FROM titles;
