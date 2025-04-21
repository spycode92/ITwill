-- [SQL문법] 5-1. 단일행함수 - 문자함수
use hr;

-- 함수란? 
-- 인수를 받아서 정해진 조작을 한 후 반드시 하나의 결과 값을 반환함.
-- SQL함수 유형 : 단일행함수, 다중행함수(=그룹함수)

-- 단일행함수란?
-- 행당 조작해서 하나의 결과값을 반환함.
-- 단일행함수 유형 : 문자함수, 숫자함수, 날짜함수, 변환함수,
--                제어흐름함수, 시스템정보함수

-- ascii(문자) : 해당 문자의 아스키코드값을 반환함.
-- char(숫자) : 숫자(아스키코드값)에 해당하는 문자를 반환함.
select ascii('A'), ascii('B'), ascii('a');
select char(65), char(97);

-- length(문자열) : 문자열의 byte수를 반환함.
-- bit_length(문자열) : 문자열의 bit수를 반환함.
-- char_length(문자열) : 문자열의 문자 개수를 반환함.
select length('busan'), bit_length('busan'), char_length('busan');
select length('아이티윌'), bit_length('아이티윌'), char_length('아이티윌');

select employee_id, last_name, email, length(email)
from employees;

-- concat(인수1, 인수2, ..., 인수n) : n개 인수를 연결해서 하나의 문자열로 반환함.
-- concat_ws(구분자, 인수1, ..., 인수n) : n개 인수를 구분자와 함께 연결해 주는 함수.
select employee_id, concat(first_name, last_name) as name, 
       salary, email
from employees;

select employee_id, concat(first_name, '-', last_name) as name, 
       salary, email
from employees;

select employee_id, 
       concat(first_name, '/', last_name, '/', job_id, '/', email)
       as emp_info
from employees;
-- (==)
select employee_id, 
       concat_ws('/', first_name, last_name, job_id, email)
       as emp_info
from employees;

-- instr(문자열, 특정문자) : 문자열에서 특정 문자의 첫번째 위치값을 반환함.
select employee_id, last_name, instr(last_name, 'a')
from employees;

-- upper(문자열) : 문자열을 대문자로 변환함.
-- lower(문자열) : 문자열을 소문자로 변환함.
select employee_id, upper(first_name) as fname, 
       upper(last_name) as lname, lower(email) as email, salary
from employees;

 select concat('The job id for ' , upper(last_name) , ' is ' , lower(job_id))
 from employees;

-- left(문자열, 길이) : 문자열의 왼쪽부터 길이만큼 반환해 주는 함수
-- right(문자열, 길이) : 문자열의 오른쪽부터 길이만큼 반환해 주는 함수
-- substr(문자열, 시작위치, 길이) : 문자열에서 시작위치부터 길이만큼 반환해 주는 함수
select left('9012231122345', 6) as "생년월일";
select employee_id, last_name, 
       concat(left(phone_number, 3), '-****-', right(phone_number, 4))
       as phone
from employees;

select employee_id, last_name, job_id, substr(job_id, 2, 3) as test
from employees;

select employee_id, last_name, 
       concat('010-', substr(phone_number, 5, 3), '-****') as phone,
       concat('**', substr(email, 2, 3), '**') as email
from employees;

select employee_id, last_name, phone_number,
       left(phone_number, 5) as test1
from employees;
-- (==)
select employee_id, last_name, phone_number,
       substr(phone_number, 1, 5) as test1
from employees;

select employee_id, last_name, phone_number,
	   right(phone_number, 4) as test2
from employees;
-- (==)
select employee_id, last_name, phone_number,
	   substr(phone_number, -4, 4) as test2
from employees;

-- lpad(문자열, 전체자리수, 채울문자) : 문자열을 전체자리수만큼 늘려서 출력하되
--                                남는 자리가 있다면 채울 문자로 왼쪽부터 
--                                채워서 반환함. 오른쪽 정렬 함수.
-- rpad(문자열, 전체자리수, 채울문자) : 문자열을 전체자리수만큼 늘려서 출력하되
--                                남는 자리가 있다면 채울 문자로 오른쪽부터 
--                                채워서 반환함. 왼쪽 정렬 함수.
select lpad(last_name, 20, '_') as lname,
       rpad(first_name, 20, '_') as fname
from employees;

-- ltrim(문자열) : 문자열의 왼쪽 공백을 제거함.
-- rtrim(문자열) : 문자열의 오른쪽 공백을 제거함.
-- trim(문자열) : 문자열의 양쪽 공백을 제거함.
-- trim(방향 자를문자 from 문자열) : 방향 - leading(앞), trailing(뒤), both(양쪽)
--                              문자열로부터 해당 방향의 자를 문자를 제거해 주는 함수
select ltrim('     SQL 문법   ') test1,  rtrim('     SQL 문법   ') test2,
	   trim('     SQL 문법   ') test3;
select trim(both '_' from '___SQL_문법______') as test;

-- replace(문자열, 특정문자, 다른문자) : 문자열로부터 특정문자를 다른문자로 교체해 주는 함수
select employee_id, last_name, 
       replace(phone_number, '.', '-') as phone
from employees;

-- space(길이) : 길이만큼의 공백을 반환함.
select concat('MySQL', '          ', 'DBMS') as test;
-- (==)
select concat('MySQL', space(10), 'DBMS') as test;

-- <연습문제>
-- 1.
SELECT last_name as "Name", LENGTH(last_name) as "Length"
FROM employees
WHERE left(last_name, 1) in ('J', 'M', 'A')
ORDER BY last_name;
-- (==)
SELECT last_name as "Name", LENGTH(last_name) as "Length"
FROM employees
WHERE substr(last_name, 1, 1) in ('J', 'M', 'A')
ORDER BY last_name;
-- (==)
SELECT last_name as "Name", LENGTH(last_name) as "Length"
FROM employees
WHERE last_name LIKE 'J%'
OR 	  last_name LIKE 'M%'
OR    last_name LIKE 'A%'
ORDER BY last_name;

-- 2.
SELECT last_name, LPAD(salary, 15, '$') as SALARY
FROM employees;

-- 3. 
-- [오답] lpad/rpad 함수는 두번째 인수(전체 자리수)에 실수가 들어온 경우
--       반올림을 하는 성격을 내포함.
SELECT salary, CONCAT(last_name, ' ', RPAD('*', salary/1000, '*'))
       as EMPLOYEES_AND_THEIR_SALARIES
FROM employees
ORDER BY salary DESC;

-- [정답]
SELECT salary, CONCAT(last_name, ' ', RPAD('*', truncate(salary/1000,0), '*')) 
       as EMPLOYEES_AND_THEIR_SALARIES
FROM employees
ORDER BY salary DESC;
-- (==)
SELECT salary, CONCAT(last_name, ' ', LPAD('*', truncate(salary/1000,0), '*')) 
       as EMPLOYEES_AND_THEIR_SALARIES
FROM employees
ORDER BY salary DESC;
-- (==)
SELECT salary, CONCAT(last_name, RPAD(' ', truncate(salary/1000,0)+1, '*')) 
       as EMPLOYEES_AND_THEIR_SALARIES
FROM employees
ORDER BY salary DESC;
