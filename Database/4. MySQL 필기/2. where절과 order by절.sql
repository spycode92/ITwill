-- [SQL문법] 2. where절과 order by절
use hr;

-- 2-1. where절
-- [문법] select * | 컬럼명1, 컬럼명2, ...
--       from 테이블명
--       where  좌변      =     우변;
--            (컬럼명)(비교연산자)(값) -> 숫자, '문자', '날짜'

-- 90번 부서에 소속된 직원 출력하시오.
select employee_id, last_name, salary, department_id
from employees
where department_id = 90;

-- last_name이 whalen인 직원 출력하시오.
select employee_id, first_name, last_name, job_id
from employees
where last_name = 'whalen';

-- 입사일이 1996년 2월 17일인 직원 출력하시오.
select employee_id, last_name, hire_date, job_id, email
from employees
where hire_date = '1996-02-17';

-- 급여가 3000이하인 직원 출력하시오.
select employee_id, last_name, salary, commission_pct
from employees
where salary <= 3000;

-- 비교연산자 종류
-- 단일행비교연산자 : =, >, >=, <, <=, <>, !=
-- 추가 비교연산자 : between, in, like, is null

-- [비교연산자1] between A and B
-- 범위 검색 비교연산자로 A(하한값)이상 B(상한값)이하의 값을 비교해 주는 연산자
-- 모든 데이터타입에 사용 가능함.
select employee_id, last_name, salary, department_id
from employees
where salary between 2500 and 3500;
-- (==)
select employee_id, last_name, salary, department_id
from employees
where salary >= 2500
and   salary <= 3500;

select employee_id, last_name, hire_date
from employees
where hire_date between '1998-01-01' and '1999-12-31';

select employee_id, last_name, job_id
from employees
where last_name between 'abel' and 'chen';

-- [비교연산자2] in
-- 다중행 비교연산자로 우변의 값리스트와 비교해서 하나이상 같으면 true를 반환함.
-- (=, OR)의 성격을 내포함.
select employee_id, last_name, manager_id
from employees
where manager_id in (100, 101, 201);
-- (==)
select employee_id, last_name, manager_id
from employees
where manager_id = 100
or    manager_id = 101
or    manager_id = 201;

select employee_id, last_name, job_id, department_id
from employees
where job_id in ('it_prog', 'ad_vp');

-- [비교연산자3] like
-- 패턴 일치 여부를 비교하는 연산자
-- like연산자와 함께 사용되는 기호 1) % : 0개 또는 그 이상의 문자가 올 수 있음.
--                           2) _ : 반드시 1개 문자가 와야함.
-- a로 시작되는 문자열 : 'a%'
-- a가 포함된 문자열 : '%a%'
-- a로 끝나는 문자열 : '%a'
-- 두번째 문자가 a인 문자열 : '_a%'
-- 끝에서 세번째 문자가 a인 문자열 : '%a__'
select employee_id, last_name, job_id, department_id
from employees
where job_id like '%rep';

select employee_id, last_name, job_id, department_id
from employees
where last_name like '%a%';

select employee_id, last_name, hire_date
from employees
where hire_date like '%01';

-- [비교연산자4] is null
-- 값이 null인지를 비교해 주는 연산자
-- 커미션을 받지 않는 직원들만 출력하시오.
select employee_id, last_name, salary, commission_pct
from employees
where commission_pct is null;

-- 부서가 없는 직원 출력하시오.
select employee_id, last_name, job_id, department_id
from employees
where department_id is null;

-- 논리연산자 종류 : and, or, not
-- where절에 조건문 여러 개 작성 시 and, or로 나열해야함.

-- [논리연산자1] and
select employee_id, last_name, job_id, salary
from employees
where salary >= 10000
and   job_id like '%man%';

-- [논리연산자2] or
select employee_id, last_name, job_id, salary
from employees
where salary >= 10000
or    job_id like '%man%';

-- and와 or가 함께 사용된 경우 and가 or보다 우선순위가 높다.
-- 우선순위를 지정하고자 할 경우 괄호 사용해야함.
select employee_id, last_name, salary, department_id
from employees
where department_id = 50
or    department_id = 80
and   salary >= 10000;

select employee_id, last_name, salary, department_id
from employees
where (department_id = 50
or     department_id = 80)
and   salary >= 10000;
-- (==)
select employee_id, last_name, salary, department_id
from employees
where department_id  in (50, 80)
and   salary >= 10000;

-- [논리연산자3] not
-- (비교연산자 종류)
-- =						<-->	<>, !=
-- >, >=					<-->	<, <=
-- between A and B 			<-->	not between A and B 
-- in : (=, OR)				<-->	not in : (<>, AND)
-- like						<-->	not like
-- is null					<-->	is not null

select employee_id, last_name, salary, commission_pct, department_id
from employees
where salary not between 10000 and 20000;

select employee_id, last_name, salary, commission_pct, department_id
from employees
where department_id not in (20, 40, 60);

select employee_id, last_name, salary, commission_pct, department_id
from employees
where last_name not like '%a%';

select employee_id, last_name, salary, commission_pct, department_id
from employees
where commission_pct is not null;

-- 2-2. order by절
-- [문법] select * | 컬럼명1, 컬럼명2, 컬럼명3
--       from 테이블명
--      [where 조건문]
--      [order by 컬럼명 [asc(default) | desc]];

select employee_id, last_name, job_id, department_id
from employees
order by department_id desc;

select employee_id, last_name, salary, email
from employees
order by last_name;

select employee_id, last_name, hire_date
from employees
order by hire_date desc;

select employee_id, last_name, 12*salary as annsal
from employees
order by 12*salary desc;
-- (==)
select employee_id, last_name, 12*salary as annsal
from employees
order by annsal desc;

-- 위치표기법 사용해서 정렬하기
select employee_id, last_name, department_id, salary, email
from employees
order by 3 desc;

-- 여러 컬럼을 기준으로 정렬하기
select employee_id, last_name, hire_date, department_id
from employees
order by department_id desc, hire_date desc;

-- <연습문제>
-- 1.
select last_name, hire_date
from employees
where hire_date between '2000-01-01' and '2000-12-31';
-- (==)
select last_name, hire_date
from employees
where hire_date like '2000%';

-- 2.
select last_name, salary, commission_pct
from employees
where commission_pct is null
order by salary desc;