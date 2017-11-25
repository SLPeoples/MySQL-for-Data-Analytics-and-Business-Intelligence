SELECT * FROM employees WHERE emp_no = 999901;
DELETE FROM employees WHERE emp_no = 999901;

SELECT * FROM departments_dup ORDER BY dept_no;
DELETE FROM department_dup; #clears it, similar to truncate
#be careful with delete, dont forget a condition in WHERE unless you want to truncate
DELETE FROM departments WHERE dept_no = 'd010';

#auto increment values not reset with delete
