#setup
DROP TABLE IF EXISTS departments_dup;
CREATE TABLE departments_dup(
	dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NOT NULL);
INSERT INTO departments_dup(
    dept_no,
    dept_name)
SELECT * FROM departments_dup;
INSERT INTO departments_dup (dept_name, dept_no)
VALUES ('Public Relations', 'd011');
INSERT INTO departments_dup (dept_name, dept_no)
VALUES ('Public Relations', 'd010');

INSERT INTO departments_dup (dept_name, dept_no)
VALUES ('Marketing', 'd001');
INSERT INTO departments_dup (dept_name, dept_no)
VALUES ('Human Resources', 'd003');
INSERT INTO departments_dup (dept_name, dept_no)
VALUES ('Production', 'd004');
INSERT INTO departments_dup (dept_name, dept_no)
VALUES ('Development', 'd005');
INSERT INTO departments_dup (dept_name, dept_no)
VALUES ('Quality Management', 'd006');
INSERT INTO departments_dup (dept_name, dept_no)
VALUES ('Sales', 'd007');
INSERT INTO departments_dup (dept_name, dept_no)
VALUES ('Research', 'd008');
INSERT INTO departments_dup (dept_name, dept_no)
VALUES ('Customer Service', 'd009');



truncate table departments_dup;
INSERT INTO departments_dup(dept_no) VALUES ('d010');

DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );
INSERT INTO dept_manager_dup
select * from dept_manager_dup;
INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES(999904, '2017-01-01'),
      (999905, '2017-01-01'),
      (999906, '2017-01-01'),
      (999907, '2017-01-01');
DELETE FROM dept_manager_dup WHERE dept_no = 'd001';
INSERT INTO departments_dup (dept_name) VALUES ('Public Relations');
DELETE FROM departments_dup WHERE dept_no = 'd002';

#inner joins
select * from departments_dup;
SELECT * FROM dept_manager_dup;

SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
	INNER JOIN departments_dup d ON m.dept_no = d.dept_no
	GROUP BY m.emp_no #this prevents duplicates!
	ORDER BY m.dept_no;

#duplicates
INSERT INTO dept_manager_dup
VALUES ('110228','d003','1992-03-21','9999-01-01');
INSERT INTO departments_dup
VALUES ('d009', 'Customer Service');

SELECT * from dept_manager_dup;
SELECT * from departments_dup;

#left join
DELETE FROM dept_manager_dup WHERE emp_no = '110228';
DELETE FROM departments_dup WHERE dept_no = 'd009';
INSERT INTO dept_manager_dup VALUES ('110228','d003','1992-03-21','9999-01-01');
INSERT INTO departments_dup VALUES ('d009','Customer Service');
SELECT m.dept_no, m.emp_no, d.dept_name FROM dept_manager_dup m
	LEFT JOIN departments_dup d ON m.dept_no = d.dept_no
    GROUP BY m.emp_no
    ORDER BY m.dept_no;
	#order in which you join tables matters, left joins first table

#right join (inverse left join)
SELECT m.dept_no, m.emp_no, d.dept_name FROM departments_dup d
	RIGHT JOIN dept_manager_dup m ON m.dept_no = d.dept_no
    GROUP BY m.emp_no
    ORDER BY m.dept_no;
	#order in which you join tables matters, right joins second table
	#notice left and right joins are the same output!

#join + where and aggregate functions
SELECT e.emp_no, e.first_name, e.last_name, s.salary FROM employees e
	JOIN salaries s ON e.emp_no = s.emp_no WHERE s.salary >145000;
#find the average salaries of men and women in the company
SELECT e.gender, AVG(s.salary) AS average_salary FROM employees e
	JOIN salaries s ON e.emp_no = s.emp_no
	GROUP BY gender;

#join more than two tables
SELECT e.first_name, e.last_name, e.hire_date, m.from_date, d.dept_name FROM employees e
	JOIN dept_manager m ON e.emp_no = m.emp_no
    JOIN departments d ON m.dept_no = d.dept_no;

#unions
DROP TABLE IF EXISTS employees_dup;
CREATE TABLE employees_dup(
	emp_no int(11),
    birth_date date,
    first_name varchar(14),
    last_name varchar(16),
    gender enum('M','F'),
    hire_date date);
INSERT INTO employees_dup SELECT e.* FROM employees e LIMIT 20;
INSERT INTO employees_dup VALUES ('10001','1953-09-02','Georgi', 'Facello','M','1986-06-26');
#Union will only show distinct values, union all will include duplicates
SELECT e.emp_no, e.first_name, e.last_name, NULL AS dept_no, NULL as from_date FROM employees_dup e
	WHERE e.emp_no =10001 UNION ALL SELECT NULL AS emp_no, NULL AS first_name, NULL AS last_name, m.dept_no, m.from_date
	FROM dept_manager m;
SELECT e.emp_no, e.first_name, e.last_name, NULL AS dept_no, NULL as from_date FROM employees_dup e
	WHERE e.emp_no =10001 UNION SELECT NULL AS emp_no, NULL AS first_name, NULL AS last_name, m.dept_no, m.from_date
	FROM dept_manager m;

