#slef join
SELECT e1.* FROM emp_manager e1 JOIN emp_manager e2 ON e1.emp_no = e2.manager_no;
SELECT e1.* FROM emp_manager e1 JOIN emp_manager e2 ON e1.emp_no = e2.manager_no
	WHERE e2.emp_no IN(
		SELECT manager_no FROM emp_manager);
