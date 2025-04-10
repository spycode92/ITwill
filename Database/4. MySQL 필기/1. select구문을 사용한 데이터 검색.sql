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