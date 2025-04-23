-- [SQL문법] 6. 그룹함수와 group by절
use hr;

-- (1) 그룹함수
-- 행그룹을 조작해서 하나의 결과값을 반환함.
-- 그룹함수 특징 : 모든 그룹함수는 null값 제외하고 작업함.
-- 그룹함수 종류 : min, max, sum, avg, count

-- min(행그룹) : 행그룹에서 최소값을 반환함.
-- max(행그룹) : 행그룹에서 최대값을 반환함.
select min(salary), max(salary)
from employees;

select min(hire_date), max(hire_date)
from employees;

select min(last_name), max(last_name)
from employees;

-- sum(행그룹) : 행그룹의 합계를 반환함.
-- avg(행그룹) : 행그룹의 평균을 반환함.
select sum(salary), round(avg(salary), 2) 
from employees;

select sum(salary), avg(salary)
from employees
where job_id like '%REP%';

-- (Quiz) 전 직원의 커미션 평균을 구하시오.
-- [결과] avg_comm
--      ----------
--         OOO

-- [오답] 커미션을 받는 사원들의 커미션 평균
select avg(commission_pct) as avg_comm
from employees;

-- [정답] 
select avg(ifnull(commission_pct, 0)) as avg_comm
from employees;

-- count(행그룹) : 행그룹에서 행의 개수를 반환함.
-- employees 테이블에서 전 직원의 수를 출력하시오.
select count(employee_id) as "전체 직원 수"
from employees;
-- (=)
select count(*) as "전체 직원 수"
from employees;

-- employees 테이블에서 커미션을 받는 직원의 수를 출력하시오.
select count(commission_pct) as "커미션 받는 직원 수"
from employees;
-- (==)
select count(commission_pct) as "커미션 받는 직원 수"
from employees
where commission_pct is not null;
-- (==)
select count(employee_id) as "커미션 받는 직원 수"
from employees
where commission_pct is not null;

-- employees 테이블에서 커미션을 받지 않는 직원의 수를 출력하시오.
select count(employee_id) as "커미션을 받지 않는 직원 수"
from employees
where commission_pct is null;

-- employees 테이블에서 부서가 있는 직원의 수를 출력하시오.
select count(department_id)
from employees;

-- employees 테이블에서 직원들이 소속된 부서의 수를 출력하시오.
select count(distinct department_id)
from employees;

-- employees 테이블에서 직원들이 담당하고 있는 업무의 수를 출력하시오.
select count(distinct job_id)
from employees;

-- (2) group by절
-- [문법] select 컬럼1, 컬럼2, 컬럼3, ...
--       from 테이블명
--      [where 조건문]
--      [group by 컬럼명]
--      [order by 컬럼명 [asc | desc]];
-- 그룹함수와 group by절 사용 시 규칙(문법)
-- select절의 컬럼 리스트 중 그룹함수에 포함된 컬럼과 그룹함수에 포함되지 않는 컬럼이
-- 함께 출력되려면 반드시 그룹함수에 포함되지 않는 컬럼은 빠짐없이 group by절에
-- 포함되어 있어야 문법 오류가 발생하지 않는다!!!

-- employees 테이블에서 부서별 평균 급여를 출력하시오.
select department_id, avg(salary)
from employees
group by department_id
order by department_id;

-- employees 테이블에서 업무별 급여 합계를 출력하시오.
select job_id, sum(salary)
from employees
group by job_id;




