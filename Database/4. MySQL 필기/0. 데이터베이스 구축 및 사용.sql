-- [데이터베이스 구축 및 사용]
-- 1. Database 생성
-- 2. Table 생성
-- 3. Data 삽입/수정/삭제
-- 4. Data 검색

-- 1. Database 생성
-- 데이터베이스 생성하기
create schema shopdb;

-- 데이터베이스 리스트 확인
show databases;

-- 사용할 데이터베이스 선택하기
use shopdb;

-- 2. Table 생성
-- [문법] create table 테이블명
--      (컬럼1 데이터타입(컬럼사이즈),
--       컬럼2 데이터타입(컬럼사이즈) [제약조건],
--       컬럼n 데이터타입(컬럼사이즈) [default 기본값]);

-- 데이터타입 종류
-- 숫자 - 정수형 : smallint, int, bigint
--     - 실수형 : float, double
-- 문자 - char, varchar
-- 날짜 - 년/월/일 : date
--     - 년/월/일/시/분/초 : datetime

-- 제약조건 종류
-- not null : 컬럼에 null값이 삽입/수정되는 것을 막아줌.
-- unique : 컬럼에 중복값이 삽입/수정되는 것을 막아줌.
-- primary key : not null + unique의 성격을 모두 가짐.
--               단, 테이블에 한번만 선언 가능함.
-- [ex] stu 테이블
-- stu_no | stu_name | jumin | phone | grade | email 
-- ----------------------------------------------------
--   pk        nn       nn      nn       nn 
--                      uk      uk              uk
-- foreign key : 다른 테이블의 특정 컬럼(pk, uk)을 참조하는 제약조건
-- check : 컬럼이 만족해야하는 조건문을 자유롭게 지정하는 제약조건
--        (ex1) salary int check(salary > 0)
--        (ex2) jumin char(13) check(length(jumin) = 13)

-- members 테이블 생성하기
create table members
(member_id int primary key,
 member_name varchar(8) not null,
 birth date not null,
 job varchar(20),
 phone varchar(20) unique,
 address varchar(80));

-- members 테이블 구조 확인하기
desc members;

-- products 테이블 생성하기
create table products
(prod_id int primary key,
 prod_name varchar(20) not null,
 price int check(price > 0),
 make_date date,
 company varchar(10) not null);
 
-- products 테이블 구조 확인하기
desc products;

-- now() 함수 : DB의 현재 날짜와 시간을 반환함.
select now()
from dual;

-- orders 테이블 생성하기
create table orders
(order_num int,
 member_id int,
 prod_id int,
 order_date datetime default now(),
 primary key(order_num),
 foreign key(member_id) references members(member_id),
 foreign key(prod_id) references products(prod_id));

-- orders 테이블 구조 확인하기
desc orders;

-- auto_increment 속성이란?
-- 테이블 생성 시 특정 컬럼에 auto_increment 속성을 부여하면
-- 해당 컬럼에 1부터 시작해서 1씩 증가하는 값을 자동으로 반환해 주는 속성
-- 시작값, 증가값(증가사이즈) 수정 가능함.
-- 사용 조건 : (숫자) 데이터타입 + (pk, uk) 제약조건인 컬럼에만 선언 가능함.
-- [문법] create table 테이블명
--      (컬럼1 int auto_increment primary key,
--       컬럼2 데이터타입(컬럼사이즈),
--       컬럼n 데이터타입(컬럼사이즈));

-- stu20 테이블 생성하기
create table stu20
(stu_id int auto_increment primary key,
 stu_name varchar(5) not null,
 age int check (age > 19));
 
-- stu20 테이블 구조 확인하기
desc stu20;

-- 3. Data 삽입/수정/삭제
-- (1) Data 삽입(insert)
-- [문법] insert into 테이블명[(컬럼1, 컬럼2, 컬럼3, ...)]
--       values (값1, 값2, 값3, ...);

-- members 테이블에 데이터 삽입하기
desc members;
insert into members
values (100, '홍길동', '1991-12-30', '학생', '010-1111-1111', '부산 부산진구 부전동');

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

-- (2) Date 수정(update)

-- (3) Data 삭제(delete)


