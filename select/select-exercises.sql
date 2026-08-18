-- Write a command to describe the structure of the jobs table
DESCRIBE employees;


-- ❖ Write a query to display all columns from the employee's table.
SELECT * FROM employees;


-- ❖ Write a query to display employee ID first, then first name, then monthly
-- salary, then daily salary from the employee's table.
SELECT employee_id, first_name, salary FROM employees;


-- ❖ Write a query to display the employee's full name, job ID, and department ID
-- in one column named EMPLOYEE_DETAILS.
SELECT first_name || ' ' || last_name || ' ' || job_id || ' ' ||
department_id AS "EMPLOYEE_DETAILS" FROM employees;


-- ❖ Write a query to display employee ID, first name, and department ID. Remove
-- duplicate rows and sort the result by employee ID in descending
SELECT DISTINCT employee_id, first_name, department_id FROM employees ORDER BY 
employee_id DESC;


-- ❖ Write a query to display all employees whose first name contains the letter 'a'
-- but does not start with 'A'
SELECT first_name FROM employees WHERE first_name LIKE '_%a%';


-- ❖ Write a query to display employees who have no commission and whose
-- department is not 10,20, or 30.
SELECT first_name, commission_pct, department_id FROM employees WHERE commission_pct
IS NULL AND department_id NOT IN (10, 20, 30);


-- ❖ Write a query to display employee ID, first name, and department ID, job ID,
-- salary and annual salary (named YEARLY_SALARY) for employees who:
-- • Work in departments 30,50,60, or 90, and have a salary between 4800
-- and 17000 and have no commission and have a first name starts with
-- the letter 'A' and ends with letter 'e'.• Sort the results by department ID in ascending order and yearly
-- Salary in descending order.
SELECT employee_id, first_name, department_id, job_id, salary, salary * 12 AS "YEARLY_SALARY" FROM employees
WHERE department_id IN (30, 50, 60, 90) AND salary BETWEEN 4800 AND 17000 AND commission_pct IS NULL AND
first_name LIKE 'A%' AND first_name LIKE '%e' ORDER BY department_id ASC, salary DESC;


-- ❖ Write a query to return the employee's full name (first_name ||' '||last_name) in
-- uppercase, the first three characters of the job ID, and the salary rounded to
-- the nearest thousand.
SELECT UPPER(first_name || ' ' || last_name) "full_name", SUBSTR(job_id, 1, 3)
"first 3 chars", ROUND(salary, -3) "nearst one 1000" FROM employees;


-- ❖ Write a query to display the first name, last name and job ID of employees
-- whose job ID starts with 'IT'.
SELECT fisrt_name, last_name, job_id FROM employees WHERE job_id LIKE 'IT%';


-- ❖ Write a query to display the middle character of each employee's first name
SELECT SUBSTR(first_name, LENGTH(first_name) / 2, 1) FROM employees;


-- ❖ Write a query to display the first name and its length for employees whose
-- first name has an odd number of characters.
SELECT first_name, LENGTH(first_name) AS "length" FROM employees
WHERE MOD(LENGTH(first_name), 2) != 0;


-- ❖ Write a query to display the first names of employees whose first name has
-- the letter 'a' in the second position.
SELECT first_name FROM employees WHERE first_name LIKE '_a%';


-- ❖ Write a query to display each employee's first name with * padding on the left
-- and # padding on the right until the total length becomes 20 characters.
SELECT RPAD(LPAD(first_name, LENGTH(first_name) + 1 , '*'), 20, '#') AS "pad_name" FROM employees;


-- ❖ Write a query to replace the word 'CLERK' with 'ASSISTANT' in the job ID column
SELECT REPLACE(job_id, 'CLERK', 'ASSISTANT') FROM employees;


-- ❖ Write a query to display the first name and its length after removing the letter
-- 'A' from the beginning of the first name, if it exists.
SELECT TRIM('A' FROM first_name) AS "no_a_name", LENGTH(TRIM('A' FROM first_name))
"new_length" FROM employees;


-- ❖ Write a query to display employees who completed more than 10 years of services.
SELECT first_name || ' ' || last_name AS "Employees_full_name", TRUNC((SYSDATE - hire_date) / 365, 0)
"service" FROM employees WHERE TRUNC((SYSDATE - hire_date) / 365, 0) > 10;


-- ❖ Write a query to display employee name and the hire date, and the contract
-- end date assuming the contract duration is 24 months
SELECT first_name, hire_date, TRUNC(TRUNC(TRUNC((SYSDATE - hire_date), 0) / 12, 0) / 31, 0) 
AS "CONTRACT" FROM employees WHERE TRUNC(TRUNC(TRUNC((SYSDATE - hire_date), 0) / 12, 0) / 31, 0) > 24;


-- ❖ Write a query to display hire dates rounded to the nearest year.
SELECT ROUND(hire_date, 'YY') FROM employees;


-- ❖ Write a query to display the hire date truncated to the beginning of the year.
SELECT TRUNC(hire_date, 'YY') FROM employees;


-- ❖ Write a query to display the employee's first name and the hire date including
-- time in the format DD-MON-YYY HH24:MI: SS
SELECT first_name, TO_CHAR(hire_date, 'fmDD-MON-YYYY HH24:MI:SS') FROM employees;



-- ❖ Write a query to display employee name and the month name of the hire date.
SELECT first_name, TO_CHAR(hire_date, 'Month') spelledmonth FROM employees;


-- ❖ Write a query to display the salary with leading zero until become 8 digits.
SELECT salary, TO_CHAR(salary, '000,000,00') leadingzeros FROM employees;


-- ❖ Write a query to display the employee's first name and department ID. if the
-- department ID is NULL, display 0.
SELECT first_name, NVL(department_id, 0) FROM employees; 


-- ❖ Write a query to display the employee's first name and a status indicating
-- whether the employee has a commission. Display "has a commission " if the
-- employee has a commission; otherwise display "No Commission".
SELECT first_name, NVL2(COMMISSION_PCT, 'Has a Commission', 'NO Commission') FROM employees;


-- ❖ Write a query to display the employee's first name and salary. if the salary is
-- greater than or equal to 10000, display 'High Salary'; otherwise display 'Low Salary'.
SELECT first_name, salary,
CASE WHEN salary >= 10000 THEN 'High Salary'
ELSE 
'Low Salary'
END
FROM employees;


-- ❖ Write a query to display the employee's first name and department name based
-- on the department Id using the DECODE function.
SELECT first_name, department_id, DECODE(department_id,
90, 'CS',
100, 'IT',
60, 'IS',
'Has_no_Department') dep

FROM employees;
