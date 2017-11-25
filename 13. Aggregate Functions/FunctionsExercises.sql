#count()
SELECT * FROM salaries ORDER BY salary DESC LIMIT 10;
SELECT COUNT(salary) FROM salaries;
SELECT COUNT(DISTINCT from_date) FROM salaries;
#How many departments are in the employee database?
SELECT COUNT(DISTINCT dept_no) FROM  dept_emp;

#sum() CANT USE *
SELECT sum(salary) from salaries;

#min()
SELECT min(birth_date) FROM employees;
#Lowest employee number?
SELECT MIN(emp_no) FROM employees;

#max()
SELECT max(salary) FROM salaries;
#Highest employee number?
SELECT MAX(emp_no) FROM employees;

#avg() Can't use on dates
SELECT avg(salary) from salaries;

#round()
SELECT round(avg(salary),2) from salaries;

#ifnull(), coalesce()
#coalesce is like ifnull, but will iterate through arguments
SELECT dept_no, IFNULL(dept_name, 'Department Name not provided.') 
	as dept_name FROM departments_dup;
SELECT dept_no, coalesce(dept_name, 'Department Name not provided.') 
	as dept_name FROM departments_dup;
SELECT dept_no, dept_name, coalesce(dept_manager, dept_name, 'N/A')
	as dept_manager FROM departments_dup ORDER BY dept_no ASC;
#prefer coalesce over ifnull
SELECT dept_no, dept_name, coalesce('dept manager name') as fake_column FROM departments_dup;