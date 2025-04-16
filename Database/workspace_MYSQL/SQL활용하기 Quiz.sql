use hr;

-- Quiz - 문제
-- 1. employees 테이블에서 급여가 $12,000 이상인 사원의 last_name, salary를 출력하는 구문을 작성하시오.

select last_name, salary
from employees
where salary >= 12000;

-- 2. employees 테이블에서 176번 사원의 last_name과 department_id를 출력하는 구문을 작성하시오.

select last_name, department_id
from employees
where employee_id = 176;

-- 3. employees 테이블에서 급여가 $5,000 ~ $12,000 범위에 속하지 않는 사원의
--    last_name과 salary를 출력하는 구문을 작성하시오.

select last_name, salary
from employees
where salary not BETWEEN 5000 and 12000;

-- 4. Matos 및 Taylor라는 last_name을 가진 사원의 last_name, job_id, hire_date
--    를 출력하는 구문을 출력하되, 채용 날짜를 기준으로 오름차순으로 정렬하시오.
select last_name, job_id, hire_date
from employees
where last_name in('Matos', 'Taylor');

-- 5. employees테이블에서 20 또는 50번 부서에 소속된 사원의 last_name과
--    department_id를 출력하는 구문을 작성하되, department_id를 기준으로 오름차순 정렬하시오.

select last_name, department_id
from employees
where department_id in (20, 50)
order by department_id;

-- 6. employees테이블에서 $5,000 ~ $12,000의 급여를 받고, 부서 20 또는 50에 속하는 사원의
--    last_name과 salary를 출력하시오. 또한 각 컬럼명을 각각 Employee 및 Monthly Salary로 지정하시오.

select last_name as Employee, salary as "Monthly Salary"
from employees
where salary between 5000 and 12000
and department_id in(20, 50);

-- 7. employees테이블로부터 담당 관리자가 없는 모든 사원의 last_name과 job_id를 출력하시오.

desc employees;
select last_name, job_id
from employees
where manager_id is null;

-- 8. employees테이블로부터 커미션을 받는 모든 사원의 last_name, salary, commission_pct를 
--    출력하되 급여와 커미션을 기준으로 내림차순 정렬도 하시오

select last_name, salary, commission_pct
from employees
where commission_pct is not null 
order by salary desc, commission_pct desc;

-- 9. employees테이블에서 last_name의 세 번째 문자가 ‘a’인 사원들의 last_name을 출력하시오.

select last_name
from employees
where last_name like '__a%';

-- 10. employees테이블에서 last_name에 ‘a’와 ‘e’가 모두 포함된 사원들의 last_name을 출력하시오

select last_name
from employees
where last_name like '%a%' or '%e%';

-- 11. 커미션 금액이 20%인 모든 사원의 last_name, salary, commission_pct를 출력하되 
--     컬럼 제목줄 또한 다음과 같이 출력하시오.

select last_name as Employee, salary as "Monthly Salary", commission_pct as "COMMISSION_PCT"
from employees
where commission_pct = 0.2;

