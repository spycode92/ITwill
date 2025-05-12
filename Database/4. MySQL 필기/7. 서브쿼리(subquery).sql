-- [SQL문법] 7. 서브쿼리(subquery)
use hr;

-- 서브쿼리란?
-- 쿼리구문 안에 또 다시 쿼리구문이 포함된 형태
-- select구문에서 group by절을 제외한 모든 절에 서브쿼리 사용 가능함.
-- 서브쿼리 유형 : 단일행 서브쿼리, 다중행 서브쿼리,
--             단일컬럼 서브쿼리, 다중컬럼 서브쿼리
-- [문법] select 컬럼1, 컬럼2, 컬럼3
--       from 테이블명
--       where 컬럼명 =  (select 컬럼
-- 						from 테이블명
--              		where 조건문);
--       order by 컬럼명;

-- employees 테이블에서 last_name이 'Abel'인 사원보다 
-- 급여를 더 많이 받는 사원들의 사번, 이름, 급여를 출력하시오.
select employee_id, last_name, salary
from employees
where salary > (select salary
                from employees
                where last_name = 'abel');

-- (1) 단일행 서브쿼리
-- 서브쿼리로부터 메인쿼리로 한 행(단일값)이 반환되는 유형
-- 메인쿼리에 단일행 비교연산자 사용하면 됨.
-- 단일행 비교연산자 : =, >, >=, <, <=, <>, !=

-- employees 테이블에서 141번 사원과 같은 업무를 담당하는 사원들의
-- employee_id, last_name, job_id를 출력하시오.
select employee_id, last_name, job_id
from employees
where job_id = (select job_id
				from employees
                where employee_id = 141);

-- employees 테이블에서 최소 급여를 받는 사원의 employee_id, last_name,
-- salary를 출력하시오.
select employee_id, last_name, salary
from employees
where salary = (select min(salary)
                from employees);
                
-- employees 테이블에서 last_name이 'Lee'인 직원과 동일 업무를 담당하면서
-- 급여는 더 많이 받는 사원을 출력하시오.
SELECT last_name, job_id, salary
FROM employees
WHERE job_id = (SELECT job_id
				FROM employees
				WHERE last_name = 'Lee')
AND salary > (SELECT salary
			  FROM employees
			  WHERE last_name = 'Lee');
              
-- having절에 서브쿼리 사용 예제
-- 부서별 최소 급여를 출력하되, 30번 부서의 최소 급여보다 큰 부서만 출력하시오.
SELECT department_id, MIN(salary)
FROM employees
WHERE department_id is not null
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary) 
					  FROM employees
                      WHERE department_id = 30);

-- 오류 원인은? 
-- 단일행 비교연산자가 작성되어 있는데 서브쿼리로부터 여러 행이 반환됨.
SELECT employee_id, last_name
FROM employees
WHERE salary = (SELECT MIN(salary) 
			    FROM employees
			    GROUP BY department_id);

-- [수정] 
SELECT employee_id, last_name
FROM employees
WHERE salary in (SELECT MIN(salary) 
			     FROM employees
			     GROUP BY department_id);
                 
-- 결과가 나오지 않는 원인은? haas라는 직원이 없음.
-- 단일행 서브쿼리로부터 null값이 반환되는 경우 메인쿼리 결과도 무조건 null이다!
SELECT last_name, job_id
FROM employees
WHERE job_id = (SELECT job_id
			    FROM employees
				WHERE last_name = 'Haas');
                
-- (2) 다중행 서브쿼리
-- 서브쿼리로부터 메인쿼리로 다중 행(여러 값)이 반환되는 유형
-- 다중행 서브쿼리인 경우에는 메인쿼리에 다중행 비교연산자 사용해야함.
-- 다중행 비교연산자 : in(=, or), not in(<>, and), any(or), all(and)
-- =any		: (=, or)		(==) in : (=, or)
-- >any		: (>, or)	--> 최소값보다 크면 된다.
-- >=any	: (>=, or)  --> 최소값보다 크거나 같으면 된다.
-- <any		: (<, or)	--> 최대값보다 작으면 된다.
-- <=any	: (<=, or)	--> 최대값보다 작거나 같으면 된다.
-- <>any	: (<>, or)  --> 우변에 값이 하나일때 의미가 있고, 
-- =all		: (=, and)  --> 값이 2개 이상일 경우에는 의미가 없다.
-- >all		: (>, and)	--> 최대값보다 크면 된다.
-- >=all	: (>=, and) --> 최대값보다 크거나 같으면 된다.
-- <all		: (<, and)  --> 최소값보다 작으면 된다.
-- <=all	: (<=, and) --> 최소값보다 작거나 같으면 된다.
-- <>all    : (<>, and) 	(==) not in : (<>, and)

-- in 다중행 비교연산자 사용 예제
SELECT employee_id, last_name, manager_id, department_id 
FROM employees 
WHERE manager_id IN (SELECT manager_id 
					 FROM employees 
					 WHERE employee_id IN (174, 141)) 
AND department_id IN (SELECT department_id 
					  FROM employees 
					  WHERE employee_id IN (174, 141)) 
AND employee_id NOT IN(174, 141);

-- any 다중행 비교연산자 사용 예제
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary <ANY (SELECT salary
				   FROM employees
				   WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

-- all 다중행 비교연산자 사용 예제
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary <ALL (SELECT salary
				   FROM employees
				   WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

-- (3) 단일컬럼 서브쿼리
-- 서브쿼리로부터 하나의 컬럼을 기준으로 값이 반환되는 유형
-- 메인쿼리 좌변에도 단일 컬럼을 작성하면 됨.(비쌍 비교)

-- 단일컬럼 서브쿼리 + 다중행 서브쿼리 예제
-- employees 테이블에서 last_name이 king인 사원과
-- 동일한 부서에 소속된 사원들을 출력하시오.
select employee_id, last_name, salary, department_id
from employees
where department_id in (select department_id
                        from employees
                        where last_name = 'king');

-- (4) 다중컬럼 서브쿼리
-- 서브쿼리로부터 여러 컬럼을 기준으로 값이 반환되는 유형
-- 메인쿼리 좌변과 서브쿼리 select절의 컬럼리스트가 맞아야 함.(쌍비교)

-- 다중컬럼 서브쿼리 + 다중행 서브쿼리 예제
-- 부서에서 최소급여를 받는 사원의 정보를 출력하시오.
SELECT employee_id, first_name, department_id, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, min(salary) 
                                  FROM employees
                                  GROUP BY department_id)
ORDER BY department_id;

-- 결과가 나오지 않는 원인? 
-- 다중행 서브쿼리로부터 반환되는 값리스트에 null값이 포함되어 있는데
-- 메인쿼리에 and의 성격을 가지는 비교연산자를 사용하면 메인쿼리 결과도 null이다!

-- employees 테이블에서 자기 자신이 매니저가 아닌 
-- 즉, 최하위 직원의 정보를 출력하시오.
select employee_id, last_name
from employees
where employee_id not in (select manager_id
                          from employees
                          where manager_id is not null);

-- <연습문제>
-- 1. 
SELECT last_name, hire_date
FROM employees
WHERE department_id = (SELECT department_id
					   FROM employees
					   WHERE last_name = 'Abel')
AND last_name <> 'Abel';

-- 2.
SELECT employee_id, last_name, salary
FROM employees
WHERE salary >= (SELECT AVG(salary)
 	             FROM employees)
ORDER BY salary;

-- 3.
SELECT employee_id, last_name
FROM employees
WHERE department_id IN (SELECT department_id
						FROM employees
						WHERE last_name like '%u%');

-- 4. 
SELECT employee_id, last_name, department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id
                        FROM departments
                        WHERE location_id = 1700);

-- 5. 
SELECT employee_id, last_name, salary
FROM employees
WHERE department_id IN (SELECT department_id
                        FROM employees
                        WHERE last_name like '%u%')
AND salary >= (SELECT AVG(salary)
               FROM employees);

-- 6. 
SELECT employee_id, last_name
FROM employees
WHERE employee_id IN (SELECT manager_id
                      FROM employees);

-- 7. 
SELECT department_id, department_name
FROM departments
WHERE department_id NOT IN (select department_id
                            from employees
                            where department_id is not null);