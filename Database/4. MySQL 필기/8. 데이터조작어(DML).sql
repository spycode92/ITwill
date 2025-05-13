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

-- (4) 트랜잭션 제어 명령어(TCL)
-- 트랜잭션이란? 하나의 논리적인 작업 단위
--            하나이상의 DML이 모여서 하나의 트랜잭션이 구성됨.(insert, update, delete)
--            하나의 DDL이 하나의 트랜잭션이 되기도 함.(create, alter, drop, truncate)
--            하나의 DCL이 하나의 트랜잭션이 되기도 함.(grant, revoke)
-- 트랜잭션 제어 명령어 : commit - 트랜잭션 종료 명령어로 변경작업을 DB에 영구히 저장함.
--                   rollback - 트랜잭션 종료 명령어로 변경작업을 취소함.
--                   savepoint - 트랜잭션 진행 중 되돌아갈 지점을 생성하는 명령어
-- 트랜잭션 운영 방법
-- 1) autocommit 활성화 - 장점 : 자동 저장되므로 편함.
--                    - 단점 : 작업 실수 시 취소가 안됨.
-- 2) autocommit 비활성화 - 장점 : 작업 후 미리보기를 하고 저장, 취소를 결정함.
--                      - 단점 : 작업 후 수동으로 저장, 취소를 수행해야함.

-- 트랜잭션 운영 예제
-- 트랜잭션 시작 -> update ---;
--               select ---; (미리보기, 임시데이터 상태)
--               insert ---;
--               update ---;
-- 트랜잭션 종료 -> commit; (저장)
-- 트랜잭션 시작 -> delete ---;
--               delete ---;
-- 트랜잭션 종료 -> rollback; (취소)
-- 트랜잭션 시작/종료 -> create table ---; (DDL)
--                  (autocommit 내포됨)
-- 트랜잭션 시작/종료 -> grant ---; (DCL)
--                  (autocommit 내포됨)
-- 트랜잭션 시작 -> insert ---;
--               update ---;
--               update ---;
-- 트랜잭션 종료 -> create table ---; (DDL)
--              (autocommit 내포됨)   

-- autocommit 기능 해제하기
-- [Query] - [Autocommit Transactions] 체크 해제

-- [commit 예제] 
-- 트랜잭션 시작
update copy_emp
set salary = salary + 1000
where department_id = 30;

select employee_id, last_name, salary, department_id
from copy_emp
where department_id = 30;  -- 미리보기, 임시 data 상태

commit;
-- 트랜잭션 종료

-- [rollback 예제]
-- 트랜잭션 시작
delete from copy_emp;

select *
from copy_emp;  -- 미리보기, 임시 data 상태

rollback;
-- 트랜잭션 종료

-- 작업 취소 확인
select *
from copy_emp;

-- [savepoint 예제]
-- 트랜잭션 진행 중 되돌아갈 지점(포인트, 기점)을 생성하는 명령어
-- 트랜잭션 진행 중 savepoint를 잘 활용하면 부분 취소가 가능함.
-- savepoint는 트랜잭션 진행 중 사용하는 명령어로 트랜잭션 시작, 종료와는 상관 없음.
-- 트랜잭션 종료(commit, rollback) 시 자동으로 지워짐.
-- 트랜잭션 시작 -> update ---;
--              savepoint test1;
--              update ---; [실수]
--              savepoint test2;
--              delete ---; 
--              rollback to test1;
--              update ---;
--              update ---;
-- 트랜잭션 종료 -> commit;

-- 트랜잭션 시작
update copy_emp
set salary = salary * 1.2
where employee_id = 101;

select employee_id, last_name, salary
from copy_emp
where employee_id = 101;  -- 미리보기

savepoint up101;

update copy_emp
set salary = salary * 1.5
where employee_id = 102;

select employee_id, last_name, salary
from copy_emp
where employee_id in (101, 102);  -- 미리보기

rollback to up101;

select employee_id, last_name, salary
from copy_emp
where employee_id in (101, 102);  -- 미리보기

commit;
-- 트랜잭션 종료

-- <연습문제> : autocommit 해제 후 작업하기
-- 1. 
create table my_employee
(id int primary key,
 last_name varchar(25),
 first_name varchar(25),
 userid varchar(8),
 salary int);
 
-- 2.
desc my_employee;

-- 트랜잭션 시작
-- 3. insert(4개의 행)
INSERT INTO my_employee
VALUES (1, 'Patel', 'Ralph', 'rpatel', 895);

INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (2, 'Dancs', 'Betty', 'bdancs', 860);

INSERT INTO my_employee
VALUES (3, 'Biri', 'Ben', 'bbiri', 1100),
       (4, 'Newman', 'Chad', 'cnewman', 750);

-- 4. select(미리보기)
SELECT *
FROM my_employee;

-- 5. 저장
commit; 
-- 트랜잭션 종료

-- 트랜잭션 시작
-- 6. update
UPDATE my_employee
SET last_name = 'Drexler'
WHERE id = 3;

-- 7. update
UPDATE my_employee
SET salary = 1000 
WHERE salary < 900;

-- 8. select(미리보기)
SELECT *
FROM my_employee;

-- 9. delete
DELETE FROM my_employee 
WHERE last_name = 'Dancs';

-- 10. select(미리보기)
SELECT *
FROM my_employee;

-- 11. 저장
commit;
-- 트랜잭션 종료

-- 트랜잭션 시작
-- 12. insert
INSERT INTO my_employee
VALUES (5, 'Ropeburn', 'Audrey', 'aropebur', 1550);

-- 13. select(미리보기)
SELECT *
FROM my_employee;

-- 14. savepoint 생성
SAVEPOINT step1;

-- 15. delete(모든행)
DELETE FROM my_employee;

-- 16. select(미리보기)
SELECT *
FROM my_employee;

-- 17. savepoint 지점으로 롤백
ROLLBACK TO step1;

-- 18. select(미리보기)
SELECT *
FROM my_employee;

-- 19. 저장
commit;
-- 트랜잭션 종료

-- autocommit 기능 활성화하기
-- -[Query] - [Autocommit Transactions] 체크하기