-- [SQL문법] 4. 조인(join)
use hr;

-- 조인(join)이란?
-- 하나 이상의 테이블로부터 데이터를 검색하는 문법
-- [문법] select 컬럼1, 컬럼2, 컬럼3, ...
--       from 테이블A join 테이블B
--       on 테이블A.컬럼 = 테이블B.컬럼
--      [where 조건문]
--      [order by 컬럼명 [asc | desc]];

-- (예제1) employees, departments 테이블을 사용해서
-- 직원 정보(employee_id, last_name, salary, manager_id, department_id)와
-- 직원이 소속된 부서 정보(department_name)를 함께 출력하시오.
select employee_id, last_name, salary, employees.manager_id, 
       employees.department_id, department_name
from employees join departments
on employees.department_id = departments.department_id
order by employee_id;
-- (==)
select employees.employee_id, employees.last_name, employees.salary, 
	   employees.manager_id, employees.department_id, 
	   departments.department_name
from employees join departments
on employees.department_id = departments.department_id
order by employees.employee_id;
-- (==)
select e.employee_id, e.last_name, e.salary, e.manager_id, 
	   e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id
order by e.employee_id;

-- (예제2) departments, locations 테이블을 사용해서
-- 부서 정보(department_id, department_name, location_id)와
-- 부서의 위치 정보(city, street_address)를 함께 출력하시오.
select d.department_id, d.department_name, d.location_id,
       l.city, l.street_address
from departments d join locations l
on d.location_id = l.location_id
order by d.department_id;

-- (예제3) employees, jobs 테이블을 사용해서
-- 직원 정보(employee_id, last_name, email, job_id)와
-- 직원이 담당하고 있는 업무명(job_title)을 함께 출력하시오.
select e.employee_id, e.last_name, e.email, 
       e.job_id, j.job_title
from employees e join jobs j
on e.job_id = j.job_id
order by e.employee_id;

-- (예제4) employees, departments 테이블을 사용해서
-- 부서 정보(department_id, department_name, manager_id)와
-- 부서의 매니저 정보(first_name, last_name, email)을 함께 출력하시오.
select d.department_id, d.department_name, d.manager_id,
       e.first_name, e.last_name, e.email
from departments d join employees e
on d.manager_id = e.employee_id
order by d.department_id;

-- N개 테이블 조인하기
-- 테이블수 | 조인조건수
-- -----------------
--   2         1
--   3         2
--   N        N-1
-- (예제5) employees, departments, locations 테이블을 사용해서
-- 직원 정보(employee_id, last_name, job_id, department_id)와
-- 직원이 소속된 부서 정보(department_name, location_id)와
-- 부서의 위치 정보(city, street_address)를 함께 출력하시오.
select e.employee_id, e.last_name, e.job_id, e.department_id,
	   d.department_name, d.location_id, l.city, l.street_address
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
order by e.employee_id;
-- (==)
select e.employee_id, e.last_name, e.job_id, e.department_id,
	   d.department_name, d.location_id, l.city, l.street_address
from employees e join departments d join locations l
on e.department_id = d.department_id
and d.location_id = l.location_id
order by e.employee_id;

-- self-join
-- 하나의 테이블을 마치 다른 테이블인듯 테이블 alias를 다르게 부여해서 조인함.
-- (예제6) employees 테이블을 사용해서
-- 직원 정보(employee_id, last_name, manager_id)와
-- 직원의 매니저 이름(last_name)을 함께 출력하시오.
select e1.employee_id as "직원 사번", e1.last_name as "직원 이름",
       e1.manager_id as "직원의 매니저 사번", e2.last_name as "매니저 이름"
from employees e1 join employees e2
on e1.manager_id = e2.employee_id;
-- (==)
select e1.employee_id as "직원 사번", e1.last_name as "직원 이름",
       e2.employee_id as "직원의 매니저 사번", e2.last_name as "매니저 이름"
from employees e1 join employees e2
on e1.manager_id = e2.employee_id;

-- <연습문제>
-- 1.
select e.employee_id, e.last_name, e.salary, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;
-- (==)
select e.employee_id, e.last_name, e.salary, d.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;

-- 2.
select e1.last_name as "Employee", e1.employee_id as "Emp#", 
       e2.last_name as "Manager", e1.manager_id as "Mgr#" 
from employees e1 join employees e2
on e1.manager_id = e2.employee_id;
-- (==)
select e1.last_name as "Employee", e1.employee_id as "Emp#", 
       e2.last_name as "Manager", e2.employee_id as "Mgr#" 
from employees e1 join employees e2
on e1.manager_id = e2.employee_id;

-- [오답] 직원 정보와 직원의 매니저 이름과 매니저의 매니저 ID가 출력되는 구문임.
select e1.last_name as "Employee", e1.employee_id as "Emp#", 
       e2.last_name as "Manager", e2.manager_id as "Mgr#" 
from employees e1 join employees e2
on e1.manager_id = e2.employee_id;

-- (예제7) employees, departments 테이블을 사용해서
-- 사원 정보(employee_id, last_name, salary, hire_date)와
-- 사원이 소속된 부서 정보(department_name)를 함께 출력하되
-- 급여가 8000이상인 사원만 출력하고, 사번을 기준으로 오름차순 정렬하시오.
select e.employee_id, e.last_name, e.salary, 
       e.hire_date, d.department_name
from employees e join departments d
on e.department_id = d.department_id
where e.salary >= 8000
order by e.employee_id;

-- (예제8) employees, departments 테이블을 사용해서
-- 직원 정보(employee_id, last_name, salary)와
-- 직원이 소속된 부서 정보(department_id, department_name, manager_id)와
-- 부서의 매니저 이름(last_name)을 함께 출력하시오.
select e.employee_id, e.last_name as "사원 이름", e.salary,
       d.department_id, d.department_name, 
       d.manager_id as "부서 매니저 사번", m.last_name as "부서 매니저 이름"
from employees e join departments d
on e.department_id = d.department_id
join employees m
on d.manager_id = m.employee_id
order by e.employee_id;
-- (==)
select e.employee_id, e.last_name as "사원 이름", e.salary,
       d.department_id, d.department_name, 
       d.manager_id as "부서 매니저 사번", m.last_name as "부서 매니저 이름"
from employees e join departments d join employees m
on e.department_id = d.department_id
and d.manager_id = m.employee_id
order by e.employee_id;

-- <추가 조인 문법>
-- inner join				vs	outer join
-- 내부 조인						외부 조인
-- 조인조건을 만족하는 행만			조인조건을 만족하는 행은 물론이고
-- 반환하는 조인 유형				조인조건을 만족하지 않는 행까지
-- on절 join(기본조인유형)			반환하는 조인 유형
--                              left outer join
--                              right outer join

-- (inner join 예제1)
select e.employee_id, e.last_name, e.salary, 
       d.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id
order by e.employee_id;
-- emp 테이블 => 부서가 없는 직원 1명(178번) 출력 안됨!
-- dept 테이블 => 소속된 직원이 없는 빈 부서 16개 출력 안됨!

-- (inner join 예제2)
select e1.employee_id, e1.last_name as emp_name, 
       e1.manager_id, e2.last_name as mgr_name
from employees e1 join employees e2
on e1.manager_id = e2.employee_id
order by e1.employee_id;
-- emp(e1) 테이블 => 매니저가 없는 사장(100번) 출력 안됨!

-- (left outer join 예제1)
-- employees(왼쪽 테이블) 테이블의 부서가 없는 신입사원(178번) 출력됨.
select e.employee_id, e.last_name, e.salary, 
       d.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id
order by e.employee_id;

-- (right outer join 예제2) 
-- departments(오른쪽 테이블) 테이블의 빈 부서 16개 출력됨.
select e.employee_id, e.last_name, e.salary, 
       d.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id
order by d.department_id;

-- (left outer join 예제3)
-- employees(e1, 왼쪽 테이블) 테이블의 매니저가 없는 사장(100번) 출력됨.
select e1.employee_id, e1.last_name as emp_name, 
       e1.manager_id, e2.last_name as mgr_name
from employees e1 left outer join employees e2
on e1.manager_id = e2.employee_id
order by e1.employee_id;

-- <추가 연습문제> : "shopdb" 데이터베이스 사용
use shopdb;

select *
from members;

select *
from products;

select *
from orders;

-- 1. members, orders 테이블 사용
-- 주문 정보(order_num, member_id, order_date)와
-- 주문자의 정보(member_name, phone, address)를 함께 출력하시오.
-- 출력형식 : order_num, order_date, member_id, member_name, phone, address
select o.order_num, o.order_date, o.member_id, 
       m.member_name, m.phone, m.address
from orders o join members m
on o.member_id = m.member_id;

-- 2. products, orders 테이블 사용
-- 주문 정보(order_num, member_id, prod_id, order_date)와
-- 제품 정보(prod_name, price)를 함께 출력하시오.
-- 출력형식 : order_num, member_id, prod_id, prod_name, price, order_date
select o.order_num, o.member_id, o.prod_id,
       p.prod_name, p.price, o.order_date
from orders o join products p
on o.prod_id = p.prod_id
order by order_num;

-- 3. members, products, orders 테이블 사용
-- 주문 정보(order_num, order_date)와
-- 주문자의 정보(member_name, phone, address)와
-- 주문한 제품의 정보(prod_name, price, company)을 함께 출력하시오.
-- 출력 형식 : order_num, order_date, member_name, phone, address, 
--           prod_name, price, company
select o.order_num, o.order_date, m.member_name, m.phone, m.address,
       p.prod_name, p.price, p.company
from orders o join members m
on o.member_id = m.member_id
join products p
on o.prod_id = p.prod_id
order by o.order_num;





