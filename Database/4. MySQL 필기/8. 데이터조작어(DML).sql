-- [SQL문법] 8. 데이터조작어(DML)
use hr;

-- 데이터조작어(DML)란?
-- 테이블에 데이터 삽입/수정/삭제하는 명령어
-- 데이터 삽입 : insert
-- 데이터 수정 : update
-- 데이터 삭제 : delete

-- (1) 데이터 삽입(insert)
-- [문법] insert into 테이블명[(컬럼1, 컬럼2, 컬럼3, ...)]
--       values (값1, 값2, 값3, ...);

-- departements 테이블 구조 및 현재 데이터 확인
desc departments;

select *
from departments;

-- insert 작업 시 테이블명 뒤에 컬럼리스트 생략하면
-- values절 뒤에 기본 컬럼 순서대로 모든 값 나열해야함.
insert into departments
values (280, 'Java', 107, 1700);

-- insert 작업 시 테이블명 뒤에 컬럼리스트를 나열한 경우에는
-- values절의 값리스트와 일치(개수, 순서, 데이터타입 등)해야함.
insert into departments(department_name, location_id,
						manager_id, department_id)
values ('Mysql', 1700, 120, 290);

-- insert 작업 시 null값을 자동으로 삽입하는 방법
insert into departments(department_id, department_name)
values (300, 'Jsp');

-- insert 작업 시 null값을 수동으로 삽입하는 방법
insert into departments
values (310, 'CSS', null, null);

select *
from departments;

-- [예제1] insert + 서브쿼리(subquery)
-- sales_resp 테이블 생성하기
create table sales_resp
(id int,
 name varchar(50),
 salary int,
 commission_pct double(10,2));
 
desc sales_resp;
select *
from sales_resp;

-- 서브쿼리 구문을 활용한 insert 작업(데이터 복사)
insert into sales_resp
	select employee_id, last_name, salary, commission_pct
	from employees
	where job_id like '%rep%';

select *
from sales_resp;

-- [예제2] insert + 서브쿼리(subquery)
-- copy_emp(employees 테이블과 구조가 동일한 테이블) 테이블 생성하기
create table copy_emp
as select *
   from employees
   where 1=2;
   
desc copy_emp;
select *
from copy_emp;

-- copy_emp 테이블로 employees 테이블의 107명 사원 정보 복사하기
insert into copy_emp
	select *
    from employees;
    
select *
from copy_emp;

-- 다중행 삽입하기
insert into departments
values (320, 'Oracle', 178, 1700),
       (330, 'Html', null, 1700),
       (340, 'AWS', 123, null);

select *
from departments;

-- (2) 데이터 수정(update)
-- [문법] update 테이블명
--       set 컬럼1 = 값1[, 컬럼2 = 값2, 컬럼3 = 값3, ...]
--      [where 조건문];

-- 113번 사원의 부서를 100에서 50으로 변경하시오.
update employees
set department_id = 50
where employee_id = 113;

select employee_id, last_name, department_id
from employees
where employee_id = 113;

-- 114번 사원의 급여는 100$ 인상시키고, 메일주소는 'abc@gmail.com'으로
-- 변경하시오.
update employees
set salary = salary+100, email = 'abc@gmail.com'
where employee_id = 114;

select employee_id, last_name, salary, email, department_id
from employees
where employee_id = 114;

-- [예제1] update + 서브쿼리 활용 예제
 update copy_emp
 set job_id = (select job_id
			   from employees
			   where employee_id = 205),
	salary = (select salary
			  from employees
			  where employee_id = 205)
where employee_id = 113;

select employee_id, last_name, job_id, salary
from employees
where employee_id = 205;

select employee_id, last_name, job_id, salary
from copy_emp
where employee_id = 113;

-- [예제2] update + 서브쿼리 활용 예제
-- copy_emp 테이블의 직원들 중 location_id가 1800인 부서에 
-- 소속된 직원들의 급여를 10% 인상하시오.
update copy_emp
set salary = salary * 1.1
where department_id = (select department_id
                       from departments
                       where location_id = 1800);

select employee_id, last_name, salary, department_id
from copy_emp
where department_id = (select department_id
					   from departments
                       where location_id = 1800);

-- (3) 데이터 삭제(delete)
-- 테이블로부터 특정 행 또는 모든 행을 삭제하는 명령어
-- [문법] delete from 테이블명
--      [where 조건문];

-- departments 테이블로부터 310번 부서를 삭제하시오.
-- delete 작업 시 where절 작성하면 특정 행 삭제됨.
delete from departments
where department_id = 310;

select *
from departments;

-- sales_resp 테이블의 모든 행 삭제하시오.
-- delete 작업 시 where절 생략하면 모든 행 삭제됨.
delete from sales_resp;

select *
from sales_resp;

-- delete + 서브쿼리 활용 예제
-- copy_emp 테이블에서 location_id가 1800인 부서에 
-- 소속된 사원들을 삭제하시오.
delete from copy_emp
where department_id = (select department_id
                       from departments
                       where location_id = 1800);







