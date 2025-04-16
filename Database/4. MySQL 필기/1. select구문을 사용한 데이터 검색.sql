-- [SQL문법] 1. select구문을 사용한 데이터 검색
use hr;

-- 테이블 구조 조회하기
-- [문법] desc[ribe] 테이블명;
desc countries;
desc departments;
desc employees;
desc job_history;
desc jobs;
desc locations;
desc regions;

-- select구문 사용해서 데이터 검색하기
-- [문법] select * | 컬럼명1, 컬럼명2, 컬럼명3, ...
--       from 테이블명;

-- 테이블로부터 모든 컬럼 출력하기
select *
from employees;

select *
from departments;

select *
from locations;

-- 테이블로부터 특정 컬럼 출력하기
desc employees;
select employee_id, first_name, last_name, salary, job_id, department_id
from employees;

desc departments;
select department_id, department_name
from departments;

-- 산술연산자 : *, /, +, -
-- 산술연산자를 활용한 산술식이 포함된 예제
select last_name, salary, 12*salary+100
from employees;

select last_name, salary, 12*(salary+100)
from employees;

-- null값이란?
-- 모르는 값, 알 수 없는 값, 정의되지 않은 값 등
-- 0(숫자)와 공백(문자)과는 다른 하나의 특수한 값
-- 모든 데이터타입에 사용 가능함.

-- 커미션을 받지 않는 사원들 null값 저장되어 있음.
select employee_id, last_name, salary, commission_pct
from employees;

-- 신입사원인 178번 사원은 부서가 결정되지 않아서 null값 저장되어 있음.
select employee_id, last_name, job_id, department_id
from employees;

-- 사장인 100번 사원은 매니저가 없으므로 null값 저장되어 있음.
select employee_id, last_name, manager_id
from employees;

-- 100 + null = null
-- 100 - null = null
-- 100 * null = null
-- 100 / null = null
-- 12*24000+null/7*3 = null
-- 산술식에 null값이 포함된 경우 결과는 null이다!
select employee_id, last_name, salary, commission_pct,
	   (12*salary)+(12*salary*commission_pct) as "연봉"
from employees;

-- column alias : 출력 시 컬럼명을 재지정하는 방법
-- [문법] 컬럼명 [as] alias
--       컬럼명 [as] "별명" => 공백 포함, 한글 포함, 특수문자 포함
select employee_id as emp_number, last_name as lname,
       salary "급여", commission_pct "수당 비율"
from employees;

-- distinct 키워드 : 중복 값을 제거해 주는 문법
-- employees 테이블에서 직원들이 소속된 부서 종류(부서 리스트)를 출력하시오.
select distinct department_id
from employees;

-- <연습문제>
-- 1.
select employee_id as "Emp #", last_name as "Employee", 
       job_id as "Job", hire_date as "Hire Date"
from employees;

-- 2. 
select distinct job_id
from employees;