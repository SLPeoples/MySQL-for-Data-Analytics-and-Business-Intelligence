#update
UPDATE employees
SET
	first_name = 'Setlla',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
	emp_no = 999901;
SELECT * FROM employees where emp_no = 999901;
COMMIT;
UPDATE departments SET dept_name = 'Data Analysis' WHERE dept_no = 'd010';

