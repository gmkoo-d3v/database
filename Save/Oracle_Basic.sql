show user;
--USER이(가) "KOSA"입니다.
/*
RDBMS (Relational Database Management System) 정의
관계형 데이터베이스 관리 시스템(RDBMS, Relational Database Management System)은 
데이터를 테이블(Table) 형식으로 관리하는 데이터베이스 시스템입니다.

1. RDBMS 특징
테이블 기반 데이터 저장: 데이터를 행(Row)과 열(Column)로 구성된 테이블 형태로 저장

관계(Relation) 형성: 테이블 간 키(Key) 를 이용하여 관계를 설정

SQL (Structured Query Language) 사용: 데이터를 조작하고 조회하는 표준 언어 제공 : CRUD (개발자)
>> DDL (데이터 정의어) : create , alter , drop 
>> DML (데이터 조작어) : insert , update , delete , select(70%) (개발자)
>> DCL (데이터 제어어) : grant , revoke  (DBA)
>> TCL (트랜잭션) ..... (개발자)

데이터 [무결성] 유지: 제약 조건(Constraints) 을 통해 데이터의 정확성 보장
>> PK , FK , UK , Check  >> Default, null

트랜잭션 지원: ACID (원자성, 일관성, 고립성, 지속성) 원칙 준수

2. RDBMS 주요 개념
테이블(Table): 데이터를 저장하는 기본 단위 (엑셀의 시트와 유사)
레코드(Record) / 행(Row): 테이블의 한 줄 (한 개의 데이터 항목)
속성(Attribute) / 열(Column): 데이터의 속성을 나타내는 필드
기본 키(Primary Key, PK): 테이블에서 각 행을 유일하게 식별하는 키
외래 키(Foreign Key, FK): 다른 테이블의 기본 키를 참조하여 관계 설정

3. RDBMS의 대표적인 시스템
-MySQL: 오픈 소스 RDBMS, 웹 애플리케이션에서 널리 사용됨
-PostgreSQL: 강력한 기능을 제공하는 오픈 소스 RDBMS
-Oracle Database: 기업 환경에서 많이 사용되는 고성능 RDBMS
-Microsoft SQL Server: 마이크로소프트에서 개발한 RDBMS
-MariaDB: MySQL의 포크로 높은 성능과 안정성을 제공
ETC : DB2 , SYSBASE , 티베로 ...


4. RDBMS의 장점
 데이터 정합성 보장: 키와 관계를 통해 데이터의 일관성 유지
 중복 최소화: [정규화]를 통해 데이터 중복을 방지  >>     반정규화(역정규화)
 강력한 쿼리 기능: SQL을 사용하여 복잡한 데이터 검색 가능
 데이터 보안: 사용자 권한 관리 및 접근 제어 가능

5. RDBMS의 단점
 확장성 제한: 대량의 데이터를 처리하는 데 한계가 있음 (수직 확장 필요)
 복잡한 스키마: 변경이 어려워 유연성이 낮음
 고비용: 일부 상용 RDBMS는 라이선스 비용이 높음
 
 객체 형태의 데이터 관리가 안되요 ( ORDB ) >> NO SQL 
*/


/*
1. 오라클 소프트웨어 다운로드
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (무료설치)
   현재 최신: Oracle Database 21c Express Edition  (계정 생성 관리 .. 클라우드 환경 지원)
   
3. Oracle 설치(SYS, SYSTEM 계정의 대한 암호 : 1004)

4.Sqlplus 프로그램 제공(CMD) : GUI 환경 일반개발자 사용 불편

5.별도의 Tool 설치 무료(SqlDeveloper , https://dbeaver.io/)  ,
                  유료(토드 , 오렌지 , SqlGate) 프로젝트시 설치 활용 ^^

6. SqlDeveloper 툴을 통해서 Oracle Server 접속 ....
   >> HR 계정 : 암호 1004 , Unlock 2가지 사용가능 .... (사원관리 실습 테이블)
   >> 새로운 계정 : KOSA , 1004 

-- USER SQL
ALTER USER "HR" IDENTIFIED BY 1004 
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP"
ACCOUNT UNLOCK ;

-- QUOTAS
ALTER USER "HR" QUOTA UNLIMITED ON USERS;

-- ROLES
ALTER USER "HR" DEFAULT ROLE "RESOURCE","CONNECT";

-- SYSTEM PRIVILEGES


7. 현재 접속 계정 확인 : show user;   >> USER이(가) "KOSA"입니다.


-- USER SQL
CREATE USER "KOSA" IDENTIFIED BY "1004"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS

-- ROLES
GRANT "CONNECT" TO "KOSA" WITH ADMIN OPTION;
GRANT "RESOURCE" TO "KOSA" WITH ADMIN OPTION;
ALTER USER "KOSA" DEFAULT ROLE "CONNECT","RESOURCE";

-- SYSTEM PRIVILEGES
*/

/*
실습코드
CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;



CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;
*/
​

select * from emp;
select * from dept;
select * from salgrade;
-----------------------------------------------------------
--1일차 실습
/*
  DB분야
  개발자 : CRUD (select , insert , update , delete) + DDL + 관리
  관리자 : DBA 백업 하고 복원 , 네트워크 관리 , 자원관리 (튜닝)
  튜너   : SQL 문장 튜닝 >> 속도 >> index .... 관리 >> 자료구조 
  모델러 :  분석 설계 (요구사항 분석)   PM 
  분석가 :  석사 이상 (빅데이터 , OLAP) .... SCI 논문 ....
*/

--1. 사원테이블 있는 모든 데이터를 가져오세요

select * from emp;


--2. 특정 컬럼의 데이터만 출력
select empno,ename ,sal
from emp;

desc emp; --약식으로 테이블 정보(컬럼명 , 타입)

select ename from emp;

--3. 별칭 (가명칭) alias
select empno 사번 , ename 이름
from emp;

--select empno 사  번 , ename 이  름
--from emp;

--표준문법 (AN-SI) 
select empno as "사   번" , ename as "이   름"
from emp;

--Oracle 문자열 데이터 엄격하게 대소문자 구분
/*
JAVA : 문자 'A',   문자열 "AAAA"
Oracle : 문자열과 문자의 구분이 없어요 :  'A' , 'AAAA' , '만세'
Oracle : 'A' 와 'a' 다른 문자열
*/

select *               --3
from emp               --1
where ename ='KING';   --2  
--where ename = 'king';

--Oracle Query(질의어) 언어
--JAVA : 연산자 (산술 ,논리 , 관계)
-- + 하나 (결합 , 연산) 모두

--ORCLE
--결합연산자 : ||
--산술연산자    +

--MS-SQL : + (산술 , 결합)

select '사원의 이름은 ' || ename || ' 입니다' as "사원정보"
from emp;

/*
JAVA : class Emp {private int empno, private String name}
ORACLE : create table Emp(empno number, ename varchar2(20));

varchar2(20) 한글 10자 , 영문자 , 특수문자 ,공백 20자
*/

select empno || ename --empno(number) , ename(varchar2()) > 형변환
from emp;

desc emp;

select empno + 10000 from emp; --숫자 데이터 ..

select empno + ename from emp; --ORA-01722: invalid number
-- 7788 + 'SMITH' 안되요

--사장님 .. 우리 회사에 직종이 몇개 (신입)
select job from emp;

--중복된 행 제거 키워드 : distinct
select distinct job from emp; --grouping


select  distinct job ,deptno --job ... deptno 
from emp
order by job;


--Oracle SQL 언어
--JAVA(+ - * / ) 나머지 %
--ORACLE(+ - * /) >> % 나머지 연산자로 사용하지 않아요 .. 함수( mod())
-- % 문자열 검색(패턴) > where ename like '%김%'

--DB (DML) : 테이블 구조 , 컬럼 구조 , 문제를 많이 만들어 본다

--사원테이블에서 사원의 급여를 100달라 인상한 결과를 출력
select empno, ename,sal, sal + 100 as "급여인상분" from emp;

--오라클 print 기능이 없어요
--JAVA :System.out.println()
--임시(가상 테이블) 만들어서  PRINT기능
--dual (임시테이블)

select 100+100 from dual;
select 100 || 100 from dual; --100100
select '100' + 100 from dual; --200 숫자형 문자 '123456'
select '100A' + 100 from dual; --ORA-01722: invalid number

--비교연산자
-- <  >   <=
--JAVA 같다 (== , = 할당)
--Oracle (= 같다,  != 같지않다)
--javascript (== ,===)

--논리연산( AND ,OR , NOT)
select empno , ename , sal
from emp
where sal >= 2000;

--사번이 7788번인 사원의 사번 , 이름 , 직종 ,입사일 출력하세요
select empno, ename ,job , hiredate
from emp
where empno=7788;

--현재 접속한 사용자 환경
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select * from emp;
select sysdate from emp;

/*

     AND   OR
0 0   
1 0         1
0 1         1 
1 1   1     1

 초과 , 미만
 이상 , 이하 (=)
*/

--급여가 2000달라 이상면서 직종이 manager 인 사원의 모든 정보를 출력하세요
select *
from emp
where sal >= 2000 and job='MANAGER';

--급여가 2000달라 이상이거나(또는) 직종이 manager 인 사원의 모든 정보를 출력하세요
select *
from emp
where sal >= 2000 or job='MANAGER';

--급여가 2000달라 초과이면서 직종이 manager 인 사원의 모든 정보를 출력하세요

from emp
where sal > 2000 and job='MANAGER';

select sysdate from dual;

select * from nls_session_parameters;
--날짜 포맷 확인 변경가능 ....
/*
NLS_LANGUAGE	KOREAN
NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS
NLS_DATE_LANGUAGE	KOREAN
*/
 select hiredate from emp;
 --날짜 데이터 검색 (문자열 검색과 동일) >  '날짜'
 --유연 (날짜 형식 )
 select *
 from emp where hiredate='1980-12-17';

 select *
 from emp where hiredate='1980/12/17';
 
 select *
 from emp where hiredate='1980.12.17';
 
 select *
 from emp where hiredate='80-12-17'; --검색 : RR-MM-DD > 지금 YYYY-MM-DD
 
 --사원의 급여가 2000달러 이상이면서 4000이하인 사원의 모든 정보를 출력하세요
select *
from emp
where sal >= 2000 and sal <= 4000;