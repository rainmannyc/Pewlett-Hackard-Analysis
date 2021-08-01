--Creating tables for PH-EmployeeDB
CREATE TABLE departments (	
		dept_no VARCHAR(4) NOT NULL,
		dept_name VARCHAR(40) NOT NULL,
		PRIMARY KEY (dept_no),
		UNIQUE (dept_name)
);

CREATE TABLE employees (
		emp_no INT NOT NULL,
		birth_date DATE NOT NULL,
		first_name VARCHAR NOT NULL,
		last_name VARCHAR NOT NULL,
		gender VARCHAR NOT NULL,
		hire_date DATE NOT NULL,
		PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
  	emp_no INT NOT NULL,
  	salary INT NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
PRIMARY KEY (emp_no)
);


CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		t.title,
		t.from_date,
		t.to_date
INTO retiring_emps
FROM Employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
ORDER BY e.emp_no;

SELECT * FROM retiring_emps;

SELECT emp_no,
		first_name,
		last_name,
		title,
		from_date,
		to_date
INTO retiring_emp
FROM retiring_emps as re
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (to_date = '9999-01-01')
ORDER BY re.emp_no;

SELECT * FROM retiring_emp;

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (to_date) emp_no, first_name, last_name, title
FROM retiring_emp
WHERE to_date = '9999-01-01'
ORDER BY retiring_emp.to_date, retiring_emp.emp_no ASC

SELECT emp_no, first_name, last_name, title
INTO unique_titles
FROM retiring_emp;

SELECT * FROM unique_titles

SELECT COUNT (unique_titles) title
from unique_titles;

SELECT COUNT (unique_titles) title as 'ut', title
FROM unique_titles
GROUP BY title, 'ut'
ORDER BY unique_titles.title ASC, unique_titles.title DESC;

SELECT COUNT (title) as ut, title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY ut DESC;

SELECT * FROM retiring_titles;

--CREATING A QUERY FOR THE MENTORSHIP ELIGIBILITY PROGRAM

SELECT emp_no, first_name, last_name, birth_date
FROM employees

SELECT from_date, to_date
FROM Dept_Emp

SELECT title
from titles

SELECT e.emp_no, e.first_name, e.last_name, e.birth_date, de.dept_no, de.from_date,
de.to_date
INTO emp_dept
FROM employees as e
RIGHT JOIN dept_emp as de
ON e.emp_no = de.emp_no;

SELECT * FROM emp_dept

SELECT e.emp_no, e.first_name, e.last_name, e.birth_date, t.from_date, t.to_date, t.title
INTO emp_t
FROM employees as e
RIGHT JOIN titles as t
ON e.emp_no = t.emp_no

SELECT * FROM emp_t

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, birth_date, from_date, to_date, title
INTO mentorship_eligibility
FROM emp_t
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (to_date = '9999-01-01')
ORDER BY emp_t.emp_no ASC;


--ADDITIONAL QUERIES


SELECT COUNT (mentorship_eligibility) title
FROM mentorship_eligibility

--CURRENT ENGINEERS WORKING
SELECT * FROM emp_t
WHERE to_date = '9999-01-01'

SELECT COUNT (emp_t) title
FROM emp_t
WHERE to_date = '9999-01-01'

SELECT * FROM emp_t
WHERE title = 'Senior Engineer' AND to_date = '9999-01-01'

SELECT COUNT (emp_t) title
FROM emp_t
WHERE title = 'Senior Engineer' AND to_date = '9999-01-01'

SELECT * FROM emp_t
WHERE title = 'Engineer' AND to_date = '9999-01-01'

SELECT COUNT (emp_t) title FROM emp_t
WHERE title = 'Engineer' AND to_date = '9999-01-01'

SELECT * FROM emp_t
WHERE title = 'Assistant Engineer' AND to_date = '9999-01-01'

SELECT COUNT (emp_t) title FROM emp_t
WHERE title = 'Assistant Engineer' AND to_date = '9999-01-01'
