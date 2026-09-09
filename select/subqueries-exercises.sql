SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM manager;

-- ❖ Write a query to display employees who have the same department and job as
-- the highest -paid employee in the company.
SELECT first_name || ' ' ||  last_name AS "employee" 
FROM employees 
WHERE (department_id, job_id) IN (
    SELECT department_id, job_id 
    FROM employees 
    WHERE salary = (SELECT MAX(salary) FROM employees)
);


-- ❖ Write a query to display employees whose job has more than 5 employees
SELECT first_name || ' ' || last_name AS "employee" FROM employees WHERE job_id IN 
(SELECT job_id AS "employee" FROM employees GROUP BY job_id HAVING COUNT(employee_id) > 5);


-- ❖ Write a query to display managers who have more than 3 employees .
SELECT first_name || ' ' || FROM manager WHERE employee_id IN (SELECT manager_id
FROM employees
GROUP BY manager_id HAVING COUNT(employee_id) > 3);


-- ❖ Display employees who work in departments containing more than 10 employees.
SELECT first_name || ' ' || last_name AS "employee" 
FROM employees 
WHERE department_idIN (SELECT department_id
FROM employees
GROUP BY department_id HAVING COUNT(employee_id) > 10);


-- ❖ Display employees whose salary equals the average salary of employees
-- having the same job as employee 101.
SELECT first_name || ' ' || last_name AS "employee"
FROM employees
WHERE salary = (SELECT TRUNC(AVG(salary))
FROM employees
GROUP BY job_id
HAVING job_id = (SELECT job_id FROM employees WHERE employee_id = 101));


-- ❖ Display employees who have the same job as employee 107 ,excluding employee 107.
SELECT first_name || ' ' || last_name AS "employee"
FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 107)
AND employee_id <> 107;

