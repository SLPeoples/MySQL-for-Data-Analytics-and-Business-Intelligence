#Insert into
INSERT INTO employees(
	emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date) #can omit, but you have to use the same order as the table
VALUES(
	999901, #Don't use quotes with ints
	'1986-04-21',
	'Robert',
	'Paulson',
	'M',
	'2011-01-01');
SELECT * FROM employees ORDER BY emp_no DESC LIMIT 10;

SELECT * FROM dept_emp ORDER BY emp_no DESC LIMIT 10;
insert into dept_emp(
    emp_no,
    dept_no,
    from_date,
    to_date)
values(
	999903,
    'd005',
    '1997-10-01',
    '9999-01-01');

#creating a table, duplicating departments
CREATE TABLE departments_dup(
	dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL);
INSERT INTO departments_dup( dept_no, dept_name) Select * FROM departments;
INSERT INTO departments VALUES ('d010', 'Business Analysis');





