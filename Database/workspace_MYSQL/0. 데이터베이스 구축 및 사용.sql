-- [데이터베이스 구축 및 사용]
-- 1. Database 생성
-- 2. Table 생성
-- 3. Data 삽입/수정/삭제
-- 4. Data 검색 

-- 1. 데이터 베이스 생성 : 쇼핑몰 DB
-- 데이터 베이스 생성하기
create schema shopdb; -- ctrl + enter 로 실행해야 생성

-- 데이터베이스 리스트 확인
show databases;

-- 사용할 데이터베이스 선택하기
use shopdb; -- ctrl + enter 로 작업할 db선택

-- 2. Table 생성
-- [문법] create table 테이블명 
--       (컬럼1 데이터타입(컬럼사이즈),
--        컬럼2 데이터타입(컬럼사이즈) [제약조건],
--        컬럼n 데이터타입(컬럼사이즈) [default 기본값]);			

-- 데이터타입 종류 
-- 정수 : int, bigint, smallint, 
-- 실수 : float, double
-- 문자 : char, varchar
-- 년/월/일 : date
-- 년/월/일/시/분/초 : datetime

-- 제약조건
-- not null : 컬럼에 null값이 삽입/수정되는 것을 막아줌. 필수컬럼에 사용
-- unique : 컬럼에 중복값이 삽입/수정되는 것을 막아줌
-- primary key : not null + unique 의 성격을 모두 가짐
--               단, 테이블에 한번만 선언가능하다
-- [ex] stu 테이블 
-- stu_no | stu_name | jumin | phone | grade | email
--  nn        nn         nn      nn     nn            notnull
--  uk                   uk      uk              uk   unique
--  Pk        or         Pk  or  Pk                    primary key 

-- foreign key : 다른 테이블의 특정 컬럼(pk, uk)을 참조하는 제약조건 
-- check : 컬럼이 만족해야하는 조건문을 자유롭게 지정하는 제약조건
--        (ex1) salary int check (salary >0)
--        (ex2) jumin char(13) check(length(jumin) = 13)

-- members 테이블 생성하기
create table members
	(member_id int primary key,
     member_name varchar(8) not null,
     birth date not null,
     job varchar(20),
     phone varchar(20) unique,
     address varchar(80) );
     
-- 테이블 구조 확인하기
desc members;
     
-- products 테이블 생성하기
     create table products
		(prod_id int primary key,
        prod_name varchar(20) not null,
        price int check(price >0),
        make_date date,
        company varchar(10) not null);
-- products 테이블 확인
desc products;

-- now ()함수 : DB의 현재 날짜와 시간을 반환함
select now()
from dual;

-- orders 테이블생성
create table orders
	( order_num int primary key,
    member_id int ,
    prod_id int ,
    order_date datetime default now(),
    foreign key(member_id) references members(memeber_id),
    foreign key(prod_id) references products(prod_id) );
-- orders 테이블 구조 확인
desc orders;

-- auto_increment 속성이란? 
-- 테이블 생성 시 특정 컬럼에 auto_increment 속성을 부여하면 
-- 해당 컬럼에 1부터 시작해서 1씩 증가하는 값을 자동으로 반환해 주는 속성 
-- 시작값, 증가값(증가사이즈)은 수정 가능함. 
-- 사용 조건 : 숫자 데이터타입 + (pk or uk) 제약조건인 컬럼에만 선언가능 
-- [문법] create table 테이블명
--       (컬럼1 int auto_increment primary key,
-- 		  컬럼2 데이터타입(컬럼사이즈),
--        컬럼n 데이터타입(컬럼사이즈));

-- stu20 테이블 생성
create table stu20
	(stu_id int primary key auto_increment,
    stu_name varchar(5) not null,
    age int check(age>19) );
desc stu20;

-- 3. Data 삽입/수정/삭제
-- (1) Data 삽입(insert)
-- [문법] insert into 테이블명[(컬럼1, 컬럼2, 컬럼3, ...)]
--       values (값1, 값2, 값3, ...);

-- members 테이블에 데이터 삽입하기
desc members;
insert into members
values(100, '홍길동', '1991-12-30', '학생', '010-1111-1111', '부산 부산진구 부전동');
-- insert 작업 시 생략된 컬럼에는 자동으로 null값 삽입됨.
insert into members(member_id, member_name, birth, phone)
values (101, '김민수', '1990-03-05', '010-2222-2222');

insert into members(member_id, member_name, phone, address, birth)
values (102, '최아영', '010-3333-3333', '서울 강남구 선릉로', '1987-11-23');

insert into members(member_id, member_name, birth, job, phone)
values (103, '홍길동', '1988-05-10', '회사원', '010-4444-4444');

insert into members(member_id, member_name, birth, job)
values (104, '강주영', '1998-08-09', '대학생');

insert into members(member_name, birth, job, phone, address, member_id)
values ('고승현', '1995-07-10', '트레이너', '010-5555-5555', '경기도 부천시 원미구', 105);

-- 추가 데이터 삽입하기
insert into members(member_id, member_name, birth, job, phone)
values (106, '정유빈', '1970-02-04', '회사원', '010-6666-6666');

insert into members(member_id, member_name, birth, phone)
values (107, '이영수', '1988-12-06', '010-7777-7777');

insert into members(member_id, member_name, birth, phone, address)
values (108, '김철수', '1999-01-15', '010-8888-8888', '부산 해운대구 센텀로');

insert into members
values (109, '최승현', '1995-04-22', '간호사', '010-9999-9999', '서울 강북구 수유동'),
       (110, '한주연', '2001-08-24', '승무원', '010-1010-1010', '대구 수성구 수성로');

select *
from members;

-- products 테이블에 데이터 삽입하기
desc products;

insert into products
values (10, '냉장고', 500, null, '삼성'),
		(20, '컴퓨터', 150, '2022-01-13', '애플'),
		(30, '세탁기', 250, '2020-03-10', 'LG'),
		(40, 'TV', 200, '2021-09-30', 'LG'),
		(50, '전자렌지', 50, '2019-06-20', '삼성'),
		(60, '건조기', 300, '2021-07-09', 'LG');

select *
from products;

-- orders 테이블에 데이터 삽입하기 
desc orders;

insert into orders
values (1, 101, 20, '2022-02-01');

insert into orders
values (2, 107, 40, '2022-02-05 17:51');

insert into orders
values (3, 106, 50, now());

-- 자동으로 default 값 삽입하는 방법
insert into orders(order_num, member_id, prod_id)
values (4, 103, 10);

-- 수동으로 default 값 삽입하는 방법
insert into orders
values(5, 108, 50, default);

insert into orders
values(6, 103, 30, default);

insert into orders
values (7, 105, 50, default);

-- 추가 데이터 삽입하기
insert into orders
values (8, 110, 40, '2021-12-30 10:39:45');
insert into orders
values (9, 107, 30, default);
insert into orders
values (10, 101, 60, now());

select *
from orders;

-- stu20 테이블에 데이터 삽입하기
desc stu20;

insert into stu20
values (null,'김온달', 28);

insert into stu20
values(null, '이평강', 24);

-- 시작값 변경
alter table stu20 auto_increment = 100;

insert into stu20
values(null, '최찬미', 29);

insert into stu20
values(null, '김동희', 31);

-- 증가값(증가 사이즈) 변경
set @@auto_increment_increment=5;

insert into stu20
values(null, '박혜경',22);

insert into stu20
values(null, '문진원', 27);

select *
from stu20;


-- (2) Data 수정(update)
-- [문법] update 테이블명
-- 		 set 컬럼명 = 값
-- 	     [where 조건문];
-- products 테이블의 모든 상품 가격을 50씩 인상하시오
update products
set price = price + 50;

-- products 테이블의 tv 제품 가격을 30 인상하시오.
update products
set price = price + 30
where prod_name = 'tv';

select *
from products;


-- members 테이블의 105번 회원 전화번호를 010-5050-5050으로 변경하시오
update members
set phone = '010-5050-5050'
where member_id = 105;

select *
from members;

-- orders 테이블의 2번 주문의 주문자(member_id)를 120으로 변경하시오
update orders
set member_id = 109
where order_num = 2;

select *
from orders;

-- (3) Data 삭제(delete)
-- [문법] delete from 테이블명
--       [where 조건문];
-- 테이블의 특정 행이 삭제되는 명령어

-- stu20 테이블에서 나이가 25세 이하인 학생을 삭제하시오
delete from stu20
where age <= 25;

-- stu20 테이블의 모든 학생을 삭제하시오
delete from stu20;

select *
from stu20;

-- 4. 데이터 검색
-- [문법] select * | 컬럼1, 컬럼2, 컬럼3, ...
--       from 테이블명 
--       [where 조건문];

-- 테이블의 모든 컬럼, 모든 행 검색하기
select *
from members;

select *
from products;

select*
from orders;

-- 테이블의 특정 컬럼 검색하기 
select member_id, member_name, phone
from members;

select company, prod_name, price
from products;

-- 테이블의 특정 행 검색하기
-- 테이블의 특정 행 검색을 원하는 경우에는 where절을 작성해야함.
-- [문법] select * | 컬럼1, 컬럼2, 컬럼3,...
--       from 테이블명
-- 		 where  좌변       =    우변;
--             (컬럼명)(비교연산자)(값) -> 숫자, '문자', '날짜'

-- members 테이블에서 member_id가 105번인 회원 정보만 조회
select *
from members
where member_id = 105;

-- members 테이블에서 이름이 '홍길동'인 회원만 검색하시오
select*
from members
where member_name='홍길동';

-- members 테이블에서 '회사원'이 아닌 회원만 검색하시오. 
select *
from members
where job <> '회사원';

-- products 테이블에서 가격이 300이상인 제품의 이름, 가격, 제조사를 출력하시오
select prod_name, price, company
from products
where price >= 300;
-- members 테이블에서 생년월일이 1990년 이전인 회원들의 이름,생년월일, 전화번호, 
-- 주소를 검색하시오
select member_name, birth, phone, address
from members
where birth < '1990-01-01';

-- where 절에 여러 조건문 작성하기
-- where절에 조건문을 여러개 작성할 경우 AND, or로 나열해야함

-- products 테이블에서 가격이 300이상 500이하인 제품만 검색하시오. 
select *
from products
where price >= 300 and price <= 500;

-- products 테이블에서 lg 제품이면서 가격이 300이하인 제품만 검색하시오

select *
from products
where price >= 300 and company = 'lg';

-- members 테이블에서 생년월일이 1990년 이전이거나 1991년 이후인
-- 회원을 검색하시오.

select *
from members
where birth < '1990-01-01' or birth > '1990-12-31';

-- where절에 and와 or를 함께 사용한 예제
-- (예제1)  and가 or보다 우선순위가 높다.
select *
from products
where company = 'lg'or company = '삼성' and price <= 300;
-- (예제2) or를 먼저 사용하고 싶다면 괄호 사용해야함. 
select *
from products
where (company = 'lg'or company = '삼성') and price <= 300;

-- 데이터 검색 시 정렬하기
-- [문법] SELECT * | 컬럼1, 컬럼2, 컬럼3....
--      from 테이블명
--      [where 조건문]
--      [order by 컬럼명 ASC(default) | DESC]
--                   오른차순  내림차순

-- 숫자 컬럼 기준으로 정렬하기 
select *
from products
order by price ;

select *
from products
order by price desc;

select *
from orders
order by member_id;

-- 날짜 컬럼 기준으로 정렬 
select *
from products
where make_date is not null
order by make_date desc; 

select *
from orders
order by order_date;

-- 문자 컬럼 기준으로 정렬된 결과 출력
select *
from members
order by member_name;

select *
from members
order by member_name desc;

-- 여러 컬럼을 기준으로 정렬된 결과 출력하기
select *
from products
order by company, price desc;

select *
from products
order by company desc, price desc;








