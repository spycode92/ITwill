-- [SQL문법] 5-2. 단일행함수 - 숫자함수, 날짜함수
use hr;

-- (1) 숫자함수
-- round(숫자, 반올림할 자리) : 숫자를 반올림할 자리까지 반올림함.
-- truncate(숫자, 버림할 자리) : 숫자를 버림할 자리까지 남기고 버림함.
-- 숫자 :  1  2  3 . 4  5  6
-- 자리 : -2 -1  0   1  2  3 
select round(45.923, 2), round(45.923, 0), round(45.923, -1);
select truncate(45.923, 2), truncate(45.923, 0), truncate(45.923, -1);

-- ceil(숫자) : 일의 자리까지 올림을 해주는 함수
-- floor(숫자) : 일의 자리까지 남기고 버림을 해주는 함수 (=) truncate(숫자, 0)
select ceil(45.923), ceil(52.1), ceil(38.0);
select floor(45.923), floor(52.1), floor(38.0);

-- mod(숫자1, 숫자2) : 숫자1을 숫자2로 나눈 나머지를 반환함.
select mod(157, 10), 157 mod 10, 157 % 10, 157 / 10;

select last_name, salary, mod(salary, 5000)
from employees
where job_id = 'SA_REP';

-- 값이 짝수인지 홀수인지를 확인하는 용도로도 활용됨.
select employee_id, mod(employee_id, 2)
from employees;

-- abs(숫자) : 숫자의 절대값을 반환해 주는 함수
select abs(-5), abs(5), abs(-4.5);

-- power(숫자, 제곱값) : 숫자의 제곱값을 계산해 주는 함수
select power(2, 3), power(4, 2), power(8, 4);

-- sign(숫자) : 숫자가 양수면 1, 음수면 -1, 0이면 0을 반환함.
select sign(3), sign(-3), sign(4.26), sign(-4.26), sign(0);




