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

-- (2) 날짜함수
-- now() = sysdate() = current_timestamp() : 현재 날짜/시간을 반환함.
--                                           (년/월/일/시/분/초)
select now(), sysdate(), current_timestamp();

-- current_date() = curdate() : 현재 날짜를 반환함.(년/월/일)
-- current_time() = curtime() : 현재 시간을 반환함.(시/분/초)
select current_date(), current_time(), now();

-- year(날짜/시간) : 날짜/시간에서 년도를 반환함.
-- month(날짜/시간) : 날짜/시간에서 월을 반환함.
-- day(날짜/시간) : 날짜/시간에서 일을 반환함.
-- hour(날짜/시간) : 날짜/시간에서 시간을 반환함.
-- minute(날짜/시간) : 날짜/시간에서 분을 반환함.
-- second(날짜/시간) : 날짜/시간에서 초를 반환함.
select year(now()), month(now()), day(now()),
       hour(now()), minute(now()), second(now());

select last_name, hire_date, year(hire_date), month(hire_date), day(hire_date)
from employees
where department_id = 90;

-- date(날짜/시간) : 날짜/시간에서 날짜를 반환함.(년/월/일)
-- time(날짜/시간) : 날짜/시간에서 시간을 반환함.(시/분/초)
select date(now()), time(now());

-- adddate(날짜, 기간) = date_add(날짜, 기간) : 날짜에 기간을 더한 날짜를 반환함.
-- subdate(날짜, 기간) = date_sub(날짜, 기간) : 날짜에 기간을 뺀 날짜를 반환함.
select adddate('2025-03-01', interval 35 day),
	   adddate('2025-03-01', interval 2 month),
       date_add('2025-03-01', interval 1 year);

select subdate('2025-03-01', interval 35 day),
	   subdate('2025-03-01', interval 2 month),
       date_sub('2025-03-01', interval 1 year);

select last_name, hire_date, 
       adddate(hire_date, interval 6 month) as "입사 6개월 후", 
       subdate(hire_date, interval 7 day) as "입사 7일전"
from employees
where department_id = 60;

-- addtime(날짜/시간, 시간) : 날짜/시간에 시간을 더한 결과를 반환함.
-- subtime(날짜/시간, 시간) : 날짜/시간에 시간을 뺀 결과를 반환함.
select addtime('2025-03-01 23:30:59', '1:20:1'),
       addtime('15:00:00', '2:10:10');

select subtime('2025-03-01 23:30:59', '1:20:1'),
       subtime('15:00:00', '2:10:10');
       
-- datediff(날짜1, 날짜2) : 날짜1에서 날짜2를 뺀 결과(일수)를 반환함.
-- timediff(시간1, 시간2) : 시간1에서 시간2를 뺀 결과(시간수)를 반환함.
select datediff(current_date(), '2025-04-03'), 
       abs(datediff('2025-04-03', current_date()));

select timediff('23:23:59', '12:11:10');

select last_name, hire_date, datediff(now( ), hire_date) as "근무한 일수" 
from employees;       

-- dayofweek(날짜) : 날짜의 요일 값을 반환함.
--                  (1-일, 2-월, 3-화, 4-수, 5-목, 6-금, 7-토)
-- monthname(날짜) : 날짜의 월의 영문 이름을 반환함.
-- dayofyear(날짜) : 날짜가 1년 중 몇 번째 날짜인지 반환함.
select dayofweek(now()), monthname(now()), dayofyear(now());

-- last_day(날짜) : 날짜가 속한 월의 마지막 날짜를 반환함.
select last_day(now());

select employee_id, last_name, hire_date, last_day(hire_date),
       datediff(last_day(hire_date), hire_date) as "입사한 월의 근무일수"
from employees;

-- quarter(날짜) : 날짜가 4분기 중에서 몇 분기인지를 반환함.
select quarter('2025-02-05'), quarter(now()), 
	   quarter('2024-08-09'), quarter('2025-12-25');
       
-- <연습문제>
-- 1.
select employee_id, last_name, salary, round(salary*1.155, 0) as "New Salary"
from employees;
       
-- 2.        
select employee_id, last_name, salary, round(salary*1.155, 0) as "New Salary",
       round(salary*0.155, 0) as "Increase"
from employees;

-- 3.
select employee_id, last_name, job_id, hire_date, department_id
from employees
where month(hire_date) = 2;
-- (==)
select employee_id, last_name, job_id, hire_date, department_id
from employees
where hire_date like '%-02-%';

-- 4.
select employee_id, last_name, hire_date, salary, department_id
from employees
where year(hire_date) between 1990 and 1995;
-- (==)
select employee_id, last_name, hire_date, salary, department_id
from employees
where hire_date between '1990-01-01' and '1995-12-31';

-- 5.
select last_name, hire_date, datediff(now(), hire_date) as "근무한 일수",
       truncate(datediff(now(), hire_date)/7, 0) as "근무한 주수"
from employees
where datediff(now(), hire_date)/7 < 1400;

-- 6. 
select employee_id, last_name, hire_date, 
       concat(quarter(hire_date), '분기') as "입사한 분기"
from employees;