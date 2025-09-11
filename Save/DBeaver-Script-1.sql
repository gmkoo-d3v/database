-- 오라클 공식명령어 아니어서  안되는 것 show USER;
SELECT USER FROM dual; -- 이게 공식명령어
SELECT employee_id, last_name, hire_date, job_id, salary, department_id 
FROM employees 
WHERE hire_date > '2005/01/01' 
       AND department_id IS NOT NULL 
       AND salary BETWEEN 5000 AND 10000 
ORDER BY department_id, salary DESC ; 

SELECT * FROM emp;


