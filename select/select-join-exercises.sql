-- ❖ Write a query to display departments whose average employee salary is
-- greater than 7000.

SELECT department_name FROM departments d JOIN employees e 
ON (d.department_id = e.department_id)
GROUP BY department_name HAVING AVG(e.salary) > 7000;


-- ❖ Write a query to display the department ID and the difference between the
-- maximum and minimum salary in each department.
SELECT department_id, (MAX(salary) - MIN(salary)) FROM employees
GROUP BY department_id;


-- ❖ Write a query to display the department ID , number of employees and
-- average salary for employees who work in departments 10,20,or 30 .whose
-- salaries are between 5000 and 12000 .Display only departments having at
-- least 2 employees and an average salary greater than 7000
SELECT department_id, COUNT(employee_id) Number_of_Employees, TRUNC(AVG(salary))
AVG_Salary FROM employees 
WHERE department_id IN(10, 20, 30) AND salary between 5000 AND 12000
GROUP BY department_id HAVING COUNT(employee_id) >= 2 AND AVG_Salary > 7000;


-- ❖ Write a query to display department names having 5 or more employees
-- ,along with the number of employees and their average salary.
SELECT department_name, COUNT(employee_id), TRUNC(AVG(salary)) FROM
departments d JOIN employees e ON (d.department_id = e.department_id) GROUP BY
(department_name) HAVING COUNT(employee_id) >= 5;


-- ❖ Write a query to display department name, number of employees and average
-- salary for each department using JOIN …ON.
SELECT department_name, COUNT(employee_id) Number_of_Employees, TRUNC(AVG(salary))
AVG_Salary FROM departments d JOIN employees e 
ON(d.department_id = e.department_id) GROUP BY department_name;


-- ❖ Write a query using NATURAL JOIN to display the department name and city
-- for departments located in the country with the country code US.
SELECT department_name, city FROM departments NATURAL JOIN locations
NATURAL JOIN countries
WHERE country_id = 'US';


-- ❖ Write a query using USING to display employee names and department
-- names for employees working in departments 10,20,or 30 whose salaries are
-- greater than 6000.
SELECT first_name || ' ' || last_name AS "full_name", department_name
FROM employees JOIN departments USING(department_id)
WHERE department_id IN(10, 20, 30) AND salary > 6000;
