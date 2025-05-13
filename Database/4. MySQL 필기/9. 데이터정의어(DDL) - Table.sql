-- [SQL문법] 9. 데이터정의어(DDL) - Table
use hr;

-- 데이터정의어(DDL)란?
-- 데이터베이스에 객체(object)를 생성, 수정, 삭제하는 명령어
-- 객체 종류 : table, view, index, function 등
-- table 관련 DDL : create table, alter table,
--                 drop table, truncate table

-- 9-1. 테이블 생성(create table)
-- [문법] create table 테이블명
--      (컬럼명1 데이터타입(컬럼사이즈),
--       컬럼명2 데이터타입(컬럼사이즈) [제약조건],
--       컬럼명3 데이터타입(컬럼사이즈) [default 기본값],
--       컬럼명n 데이터타입(컬럼사이즈));

-- (1) 데이터타입
-- 숫자 - 정수형 : int, bigint
--     - 실수형 : double, float
-- 문자 - 고정형 : char(n)
--     - 가변형 : varchar(n)
-- 날짜 - 년/월/일 : date
--     - 년/월/일/시/분/초 : datetime

-- (2) default값 선언하기
create table dept
(deptno int,
 dname varchar(14),
 loc varchar(13),
 create_date datetime default now());
 
desc dept;

insert into dept
values (10, 'AAA', 'A100', '2025-03-10 13:30');

-- 컬럼 생략 시 default가 선언된 컬럼은 자동으로 default값 삽입됨.
insert into dept(deptno, dname)
values (20, 'BBB');

-- 수동으로 default값 삽입하는 방법
insert into dept
values (30, 'CCC', 'C100', default);

insert into dept
values (40, 'DDD', null, null);

insert into dept
values (50, 'EEE', default, default);

update dept
set create_date = default
where deptno = 40;

select *
from dept;

-- (3) 제약조건
-- 테이블의 특정 컬럼에 부적합한 데이터가 삽입/수정되는 것을 막기 위함.
-- 제약조건 종류 : not null, unique, primary key, foreign key, check
-- 제약조건 선언 문법 : 컬럼 레벨 문법(nn, uk, pk, ck)
--                  테이블 레벨 문법(fk, uk, pk, ck)

-- 1) not null
-- 컬럼에 null값이 삽입/수정되는 것을 막아주는 제약조건
-- 주로 필수 컬럼에 선언함. 
create table test1
(id int not null,
 name varchar(30) not null,
 jumin varchar(13) not null,
 job varchar(20),
 email varchar(20),
 phone varchar(20) not null,
 start_date date);

desc test1;

-- 2) unique
-- 컬럼에 중복값이 삽입/수정되는 것을 막아주는 제약조건
-- 고유한 값만 들어와야하는 컬럼에 주로 사용됨.
-- 단, null값은 여러 개 삽입될 수 있음.
create table test2
(id int not null unique,			-- 컬럼 레벨 문법
 name varchar(30) not null, 		-- 컬럼 레벨 문법
 jumin char(13) not null unique,	-- 컬럼 레벨 문법
 job varchar(20),
 email varchar(20),
 phone varchar(20) not null,  	    -- 컬럼 레벨 문법
 start_date date,
 unique(email),                     -- 테이블 레벨 문법
 unique(phone));                    -- 테이블 레벨 문법

desc test2;

-- (3) primary key(기본키)
-- not null과 unique의 성격을 모두 가지는 제약조건
-- 테이블에 한번만 선언할 수 있음!!!
-- [stu] 테이블
-- stu_no | stu_name | level | jumin | phone | email
-- -------------------------------------------------
--   pk        nn       nn      nn      nn      uk
--                              uk      uk
create table test3
(id int primary key,	-- 컬럼 레벨 문법
 name varchar(30) not null,
 jumin varchar(13) not null unique,
 job varchar(20),
 email varchar(20) unique,
 phone varchar(20) not null unique,
 start_date date);
-- (==)
create table test3
(id int,
 name varchar(30) not null,
 jumin varchar(13) not null unique,
 job varchar(20),
 email varchar(20) unique,
 phone varchar(20) not null unique,
 start_date date,
 primary key(id));	   -- 테이블 레벨 문법
 
desc test3;

-- (4) foreign key(외래키)

-- (5) check




