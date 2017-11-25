#Select
SELECT dept_no FROM departments;
SELECT * FROM departments;

#AND
SELECT * FROM employees WHERE first_name = 'Denis' AND gender = 'M';

#OR
SELECT * FROM employees WHERE first_name = 'Denis' OR first_name = 'Elvis';

#AND OR
SELECT * FROM employees WHERE first_name = 'Denis' AND (gender = 'M' OR gender = 'F');

#OR
SELECT * FROM employees WHERE first_name = 'Cathie'
	OR first_name = 'Mark'
    OR first_name = 'Nathan';

#IN / NOT IN
SELECT * FROM employees WHERE first_name IN ('Cathie', 'Mark', 'Nathan'); #FASTER

#Using regex %,_,*
#% : sequence of characters
SELECT * FROM employees WHERE first_name LIKE ('Mar%'); #mark, marshall, maria, etc
SELECT * FROM employees WHERE first_name LIKE ('%ar%'); #mark, marshall, maria, barry, etc
SELECT * FROM employees WHERE hire_date LIKE ('%2000%');
#_ : single character
SELECT * FROM employees WHERE first_name LIKE ('Mar_'); #mark, mara, mars, etc
SELECT * FROM employees WHERE emp_no LIKE ('1000_');
#* delivers all columns in a table.

#BETWEEN - AND
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01';
SELECT * FROM employees WHERE hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';
SELECT * FROM salaries WHERE salary BETWEEN '66000' AND '70000';
SELECT * FROM employees WHERE emp_no NOT BETWEEN '10004' AND '10012';
SELECT * FROM departments WHERE dept_no BETWEEN 'd003' AND 'd006';

#NULL / NOT NULL
SELECT * FROM employees WHERE first_name IS NULL;
SELECT * FROM employees WHERE first_name IS NOT NULL;

#Comparison operators
SELECT * FROM employees WHERE first_name != 'Mark';
SELECT * FROM employees WHERE first_name = 'Mark';
SELECT * FROM employees WHERE hire_date > '1995-01-01';
SELECT * FROM employees WHERE birth_date <= '1980-01-01';
SELECT * FROM employees WHERE gender = 'F' AND hire_date >= '2000-01-01';
SELECT * FROM salaries WHERE salary >= '150000';

#distinct
SELECT DISTINCT gender FROM employees;
SELECT DISTINCT hire_date FROM employees;

#count
SELECT count(emp_no) FROM employees;
SELECT count(*) FROM salaries WHERE salary > 100000;
SELECT COUNT(*) FROM dept_manager;

#order by
SELECT * FROM employees ORDER BY first_name;
SELECT * FROM employees ORDER BY hire_date DESC;

#group by
SELECT first_name FROM employees GROUP BY first_name; #Similar to select distinct
#always include field you have grouped SELECT, FROM, WHERE, GROUP BY, ORDER BY
SELECT first_name, count(*) first_name 
	FROM employees GROUP BY  first_name ORDER BY first_name DESC; 

#alias
SELECT first_name, count(first_name) as names_count 
	FROM employees GROUP BY  first_name ORDER BY first_name DESC; 
SELECT salary, COUNT(emp_no) AS emps_with_same_salary
	FROM salaries WHERE salary > 80000 GROUP BY salary ORDER BY salary;

#having
SELECT first_name, count(first_name) as names_count 
	FROM employees GROUP BY  first_name HAVING COUNT(first_name) > 250
    ORDER BY first_name;
#If you need to use an aggregate function, you need to use HAVING, such as count()
SELECT emp_no, AVG(salary) FROM salaries GROUP BY emp_no
	HAVING AVG(salary) > 120000 ORDER BY emp_no;
#Extract a list of all names that are encountered less than 200 times, referencing
#individuals hired after the first of 1999.
SELECT first_name, count(first_name) as names_count FROM employees
	WHERE hire_date > '1999-01-01' GROUP BY first_name 
	HAVING COUNT(first_name) < 200 ORDER BY first_name DESC;

#limit
#Please show me the employee numbers of the 10 highest paid employees in the database.
SELECT * FROM salaries ORDER BY salary DESC LIMIT 10;

