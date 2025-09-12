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

select *
from emp
where sal between 2000 and 4000; --단점 무조건 = 을 포함


 --사원의 급여가 2000달러 초과이면서 4000미만인 사원의 모든 정보를 출력하세요
select *
from emp
where sal > 2000 and sal < 4000;

--부서번호가 10번 또는 20번 또는 30번인 사원의 사번 , 이름 , 급여 , 부서번호 출력
select *
from emp
where deptno=10 or deptno=20 or deptno=30;
--IN 연산자
select *
from emp
where deptno in (10,20,30); --mybatis 동적쿼리 ...

--부서번호가 10번 또는 20번 아닌 사원의 사번 , 이름 , 급여 , 부서번호 출력
select *
from emp
where deptno!=10 and deptno!=20;

select *
from emp
where deptno  not in (10,20); --not in >> != and != 

--문제
--where deptno  not in (10,20); 풀어서 쓰세요
--where deptno!=10 and deptno!=20;


--Today Point
--null
--값이 없다
--필요악
--사용하는 문법
--비교 : = null(x) ,  is null or in not null
--함수 : nvl() , nvl2() 함수  (mysql : ifnull())

create table member(
    userid varchar2(20) not null, --필수입력
    name varchar2(20) not null, --필수입력
    hobby varchar2(50) --default null 허용
);

desc member;

insert into member(userid, name, hobby)
values('hong','길동','도둑');

--나 이제 실반열 할거야
commit;

select * from member;
/*
DB 에 DML(insert , update , delete)
insert , update , delete 작업수행 (transaction)
트랙잭션의 정의 : 하나의 논리적인 작업단위
은행업무
A 계좌 인출 : update
-> B계좌 이체 : update

하나의 업무 (인체 -> 이체)
begin tran
    A계좌 인출(update)
    B계좌 이체(update)
end tran

성공 : 실반영 : commit
실패 : rollback 시작점으로 

오라클은 
default insert , update , delete 작업 트랙잰션 강제 수행
완료: commit , rollback 강제

Ms-sql
update .. 실반영 (자동 auto-commit)
begin tran 실행 (명시적)
*/

--수당(comm) 받지 않는 모든 사원의 정보 출력 (comm 데이터 null)
select *
from emp
where comm = null; --문법이 (x)

select * 
from emp
where comm is null;

--수당을 받는 사람
select *
from emp
where comm is not null;

--사원테이블에서 사번 , 이름 , 급여 , 수당 ,총급여(급여+수당) 을 출력
select empno , ename , sal ,comm , sal+comm as "총급여"
from emp;
/*
null 이란 녀석 
1. null 과의 모든 연산결과는 null > null + 100 > null
2. null 값을 처리하기 위한 함수 : nvl(), nvl2()

nvl(컬럼명,대체값)
*/
select empno , ename , sal ,comm , 
       sal+nvl(comm,0) as "총급여"
from emp;

--샘플
select 1000 + null from dual;
select 1000 + nvl(null,0) from dual;
select 1000 + nvl(null,111111) from dual;
select nvl(null,'hello world') from dual;

--사원의 급여가 1000이상이고 수당을 받지 않는 사원의 사번 , 이름 , 직종 ,급여 ,수당
--총급여(급여+수당) 를 출력하세요
select empno , ename , job , sal, comm , sal+nvl(comm,0) as "총급여"
from emp
where sal >= 1000 and comm is null;

--문자열 검색 
--주소검색 >> 역삼 >> 역삼이라는 단어가 포함된 모든 주소
--LIKE 문자열 패턴 검색
--와일드 카드 (% 모든 것 , _  한문자)
--부족 : 정규표현
select *
from emp
where ename like '%A%'; --모든 이름 A 가 포함되면 ...

select *
from emp
where ename like 'A%';--A로 시작하는 

-- ename like '김%'
select *
from emp
where ename like '%E';


select *
from emp
where ename like '%LL%'; --ALLEN    MILLER

select *
from emp
where ename like '%A%A%'; --A가 두개 있으면  ADAMS

select *
from emp
where ename like '_A%';  -- _한문자 WARD   MARTIN  JAMES

--정규표현식 : regexp like()
--regexp_like(ename,'[A-C]'); 사례 5개를 만들어 올리세요
select * from emp where regexp_like(ename,'[A-C]');

----------------------------------------------------------
--데이처 정렬하기
--order by 컬럼명 : 문자열 , 숫자 , 날짜 정렬가능
--오름차순 : asc 낮은순 : default
--내림차순 : desc 높은순
--정렬 서버입장에서 cost 비용 많이 들어요

select *
from emp
order by sal;  --default asc

select *
from emp
order by sal asc; 

select *
from emp
order by sal desc; 

--입사일이 가장 늦은 순으로 정려해서 사번 , 이름 , 급여 , 입사일 출력하세요
--가장 최근에 입사한 순으로 
select empno , ename , sal , hiredate
from emp
order by hiredate desc;
/*
select 절   3
from 절     1
where 절    2
order by 절 4  (select 한 결과를 정렬)
*/

select empno, ename , sal , job , hiredate
from emp
where job='MANAGER'
order by hiredate desc;

select job ,deptno
from emp
order by job asc , deptno desc;
--job 정렬 그안에서 group detpno 정렬

--연산자 
--합집합(union)     : 테이블과 테이블의 데이터 합치는 것(중복값 배제)
--합집합(union all) : 테이블과 테이블의 데이터 합치는 것(중복값 허용)

/*
create table uta(name varchar2(20));
insert into uta(name) values('AAA');
insert into uta(name) values('BBB');
insert into uta(name) values('CCC');
insert into uta(name) values('DDD');
commit

create table ut(name varchar2(20));
insert into ut(name) values('AAA');
insert into ut(name) values('BBB');
insert into ut(name) values('CCC');
commit;
*/

select * from uta;
select * from ut;

/*
AAA
BBB
CCC
DDD

AAA
BBB
CCC
*/
select * from ut
union
select * from uta; --중복데이터 제거


select * from ut
union all
select * from uta; 

--조건
--union
--1. [대응]대는 [컬럼]의 [타입]이 동일

select empno , ename from emp
union
select dname , deptno from dept;
--ORA-01790: expression must have same datatype as corresponding expression

select empno , ename from emp
union
select deptno , dname from dept;

--subquery >> 가상테이블
select *
from (
        select empno , ename from emp
        union
        select deptno , dname from dept
      ) m
order by m.empno desc; 

--2. [대응]대는 [컬럼]의 [개수]가 동일

select empno , ename , job , sal from emp
union 
select deptno , dname , loc , null from dept;
--ORA-01789: query block has incorrect number of result columns

select empno , ename , job , sal from emp
union 
select deptno , dname , loc , 10 from dept;
------------------------------------------------------------
--자바에서 제어문 끝난 느낌
--초급 개발자가 단일 테이블 대상으로 쿼리문을 작성가능하다
------------------------------------------------------------
--함수 
--오라클 PDF 48page 단일행 함수 
/*
1.2.2 단일 행 함수의 종류 
1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN할 수 있다. 
2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN한다. 
3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를 
제외하고 모두 날짜 데이터형의 값을 RETURN한다. 
4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다. 
5) 일반적인 함수 : NVL, DECODE
*/

select initcap('the super man') from dual; --The Super Man

select lower('AAA') , upper('aaa') from dual;

select ename , lower(ename) as "ename" from emp;

select *
from emp
where lower(ename)= 'king';

select length('abcd') from dual;

select concat('a','b') from dual;

select 'a'|| 'b' || 'c' from dual;

select concat(ename,job) from emp;

--JAVA : substring
--Oracle: substr

select substr('ABCDE',2,3) from dual; --BCD
select substr('ABCDE',1,1) from dual; --A
select substr('ABCDE',3,1) from dual;  --C

select substr('ABCDdsfgsdfsdfdsfdsfasdf',3) from dual;

/*
사원테이블에서 ename 컬럼의 데이터에 대해서 첫글자는 소문자로 나머지 글자는 대문자로 
출력하되 하나의 컬럼으로 만들어 출력하고 컬럼의 별칭 fullname  하고 첫글자와 나머지
문자사이에는 공백하나를 넣어서 출력
단 위에서 배운 함수만 사용
오라클 함수는 체인이 없어요
((()))
*/
select lower(substr(ename,1,1)) from emp;
select substr(ename,2) from emp;
select substr(ename,2,length(ename)) from emp;

select lower(substr(ename,1,1)) || ' ' || upper(substr(ename,2,length(ename)))
as fullname
from emp;

select lpad('ABC',10,'*') from dual;
select rpad('ABC',10,'*') from dual;
select rpad('ABC',10,'&') from dual;

--사용자비번 hong1004 또는 k123
--화면에 출력하는데 앞에 2글자만 보여주고 나머지는 특수문자 처리

select rpad(substr('hong1004',1,2),length('hong1004'),'*') from dual;
select rpad(substr('k123',1,2),length('k123'),'*') from dual;

--emp 테이블에 적용하면 

select rpad(substr(ename,1,2),length(ename),'*') from emp;

select rtrim('MILLER','ER') from dual;
select ltrim('MILLLLLLLLLLLLER','MIL') from dual;

select '>' || rtrim('MILLER     ',' ') || '<' from dual;

--치환함수
select ename , replace(ename,'A','와우') from emp;
---------------------------------------------------------------
--문자열 함수 end
---------------------------------------------------------------
--[숫자함수]
--round(반올림 함수)
--trunc(절삭함수)
--mod() 나머지 구하는 함수
--   -3 -2 -1 0 1 2 3
select round(12.345,0) from dual; --정수부만 남겨라 12
select round(12.567,0) from dual; --13
select round(12.345,1) from dual;  --12.3
select round(12.564,1) from dual;  --12.6
select round(12.345,-1) from dual;  --10
select round(15.345,-1) from dual;  --20 

select round(15.345,-2) from dual;


select trunc(12.345,0) from dual; --정수부만 남겨라 12
select trunc(12.567,0) from dual; --12
select trunc(12.345,1) from dual;  --12.3
select trunc(12.564,1) from dual;  --12.5
select trunc(12.345,-1) from dual;  --10
select trunc(15.345,-1) from dual;  --10


--나머지
select 12/10 from dual;

--나머지 함수
select mod(12,10) from dual;

select mod(0,0) from dual;
----------------------------------------------------------
--날짜함수 : 연산가능 
select sysdate from dual;
--POINT
--1. Date + Number >> Date
--2. Date - Number >> Date
--3. Date - Date  >>  Number (일수)

select sysdate + 100 from dual;
select sysdate + 1000 from dual;
select sysdate - 1000 from dual;

select hiredate from emp;

select months_between('2022-01-01','2020-01-01') from dual; --개월의 차

select trunc(months_between(sysdate,'2020-01-01'),0) from dual;

--초급 개발자의 실수
--select .. where  hirdate = '2025..'
select '2025-01-01' + 100  from dual; --ORA-01722: invalid number

--답 함수를 사용해서 날짜 타입 변환 (조건 문자열이 형식 있어야 한다)
select to_date('2025-01-01') + 100 from dual;

/*
사원테이블에서 사원들의 입사일에서 현재 날짜까지의 근속월수를 구하세요
--사원이름 , 입사일 , 근속월수 출력
--단 근속월수는 정수만 출력(반올림 하지 마세요)
*/
select ename , hiredate , trunc(months_between(sysdate ,hiredate),0)as 근속월수
from emp;
-------------------------------------------------------------------------
--문자함수 , 숫자함수 , 날짜함수 기본 END
--------------------------------------------------------------------------

--변환함수
--오라클 데이터베이스 데이터 유형 : 숫자 , 문자열 , 날짜

--to_char() 숫자 -> 형식문자 (1000000 -> $100,000 >  format)
--to_char() 날짜 -> 형시문자 ('2025-01-01' -> 2025년01월01일) > format

--to_date() : 문자열(날짜 형식) -> 날짜
--select to_date('2025-01-01') + 100  from dual;

--to_number() : 문자열 형식 숫자 -> 숫자(자동 형변환)
select '100' + 100 from dual; --암시적 형변환
select to_number('100') + 100 from dual; --명시적 형변환

--format 표를 보고 찿아서 (오라클 PDF 70 ~ 71)
select sysdate , to_char(sysdate,'YYYY') || '년' as yyyy ,
to_char(sysdate,'YEAR') || '년' as yyyy ,
to_char(sysdate,'MM') ,
to_char(sysdate,'DD'),
to_char(sysdate,'DAY') 
from emp;

--입사일이 12월인 사원의 사번 , 이름 , 입사일 , 입사년도 , 입사월을 출력하세요
select empno, ename , hiredate , to_char(hiredate,'YYYY') ,
to_char(hiredate,'MM')
from emp
where to_char(hiredate,'MM')='12';

---------------------------------------------------------------------------
show user;
--USER이(가) "HR"입니다.

select * from employees;

select employee_id , first_name , last_name , hire_date, salary
from employees;


select '>' || to_char(12345,'9999999999999999999') || '<' from dual;
select '>' || ltrim(to_char(12345,'9999999999999999999')) || '<' from dual;
select '>' || to_char(12345,'$999,999,999,999,999,999') || '<' from dual;

select sal ,to_char(sal,'$999,999') as sal from emp;
/*
사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서 fullname 별칭 
부여해서 출력하고 입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 
연봉의 10%(연봉 * 1.1)인상한 값을
출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요
*/

SELECT LAST_NAME || FIRST_NAME AS "FULLNAME", 
       TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') AS "입사일",
       salary,
       salary*12 as "연봉",
       TO_CHAR((SALARY * 12) * 1.1, '$999,999,999') AS SAL
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') >= '2005'
ORDER BY 연봉 DESC; --실행 순서있다면 select 한 컬럼명을 사용 



/*
EMPLOYEES 테이블을 이용하여 다음 조건에 만족하는 행을 검색하세요. 
2005년이후에 입사한 사원 중에 부서번호가 있고, 급여가 5000~10000 사이인 사원을 검색합니다. 
가) 테이블 : employees 
나) 검색 : employee_id, last_name, hire_date, job_id, salary, department_id 
다) 조건
    ① 2005년 1월 1일 이후 입사한 사원
    ② 부서번호가 NULL이 아닌 사원 
    ③ 급여가 5,000보다 크거나 같고, 10,000 보다 작거나 같은 사원 
    ④ 위의 조건을 모두 만족하는 행을 검색 
라) 정렬: department_id 오름차순, salary 내림차순

*/
SELECT employee_id, last_name, hire_date, job_id, salary, department_id 
FROM employees 
WHERE hire_date > '2005/01/01' 
       AND department_id IS NOT NULL 
       AND salary BETWEEN 5000 AND 10000 
ORDER BY department_id, salary DESC ; 

---------------------------------------------------------------------------
select 'A' as a , 10 as b , null as c , empno
from emp;
---------------------------------------------------------------------------
--기본 select (select from where order by)
--문자열 함수 > 숫자함수 > 날짜함수 > 변환함수(이쁘게) to_char() , to_date() , to_number()
---------------------------------------------------------------------------
show user;
--USER이(가) "KOSA"입니다.
--------------------------------------------------------------------------
--DB
--https://dbeaver.io/ 툴 다운받아서 오라클 서버 연결해 보세요
--접속 : dbeaver  -> Oracle Server -
--dbeaver (드라이버)설치 > IP : 1521 > SID (xe) > 계정 , 비밀번호 
--JAVA > Oracle 접속
-----------------------------------------------------------------------
/*
SQL (변수 , 제어문 개념이 없어요)
PL-SQL(변수 , 제어문 > 트리거 , 커서 , 프로시져 함수)

일반함수
nvl() >  null 을 처리하는 함수

decode > java if문 > 통계 데이터 분석 > pivot , cube , rollup 다차원 분석 함수
case   > java switch
두 놈은 프로그래밍적 성격이 강하다 
상식
OLTP : 네이버 , 카카오  (요기) 실시간 데이터 처리
OLAP : 분석 통계데이터
*/

--일반함수

select comm , nvl(comm,0) from emp;

create table temp01
(
    id number(6), --정수 6자리
    job nvarchar2(20)   --unicode (2byte) > 한글한자 2byte> 한글 영문 20자
);

desc temp01;

/*
insert into temp01(id,job) values(100,'IT');
insert into temp01(id,job) values(200,'SALES');
insert into temp01(id,job) values(300,'MANAGER');
insert into temp01(id) values(400);
insert into temp01(id,job) values(500,'MANAGER');
commit;
*/
select * from temp01;

select id , decode(id,100,'아이티',
                      200,'영업',
                      300,'관리팀',
                      '기타부서') as 부서이름
from temp01;                      

select * from emp;

select empno ,ename ,deptno , decode(deptno,10,'인사팀',
                                            20,'관리팀',
                                            30,'회계팀',
                                            40,'일반부서',
                                            'ETC') as 부서이름
from emp;

/*
  char(10)      고정길이 문자열 한글 5자 , 영문자 10자 고정길이 char > '남' '여'
  nchar(10)
  varchar2(10)  가변길이 문자열 한글 5자 , 영문자 10자
  nvarchar2(10) 가변길이 문자열 한글10자 , 영문자 10자
*/

create table t_emp2(
    id number(2),
    jumin char(7) --고정길이 문자열
);

/*
insert into t_emp2(id, jumin) values(1,'1234567');
insert into t_emp2(id, jumin) values(2,'2234567');
insert into t_emp2(id, jumin) values(3,'3234567');
insert into t_emp2(id, jumin) values(4,'4234567');
insert into t_emp2(id, jumin) values(5,'5234567');
commit;
*/
select * from t_emp2;
/*
 t_emp2 테이블에서 id , jumin 데이터를 출력하되 jumin 컬럼의 앞자리가 1이면
 남성 , 2이면 여성 , 3이면 중성 그외는 기타 하고 출력하세요 (컬럼명은 성별)
*/
select id , decode(substr(jumin,1,1), 1 ,'남성' , 
                                      2 ,'여성', 
                                      3 ,'중성',
                                      '기타') as 성별
from t_emp2;

/*
응용문제 : hint) if문 안에 if문
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이라면 HELLO 문자 출력하고
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이 아니라면 WORLD 문자 출력하고
부서번호가 20번인 사원이 아니라면 ETC 라는 문자를 출력하세요
EMP 테이블에서요 ....
*/
--decode 사용해서.....
select ename ,deptno , 
       decode(deptno,20,decode(ename,'SMITH','HELLO','WORLD'),'ETC')as "컬럼"
from emp;       
       
--CASE (PL-SQL)
/*
  CASE 조건식 WHEN 결과1 THEN  출력1
             WHEN 결과2 THEN  출력2
             WHEN 결과3 THEN  출력3
             WHEN 결과4 THEN  출력4
             ELSE 출력5
  END "컬럼명"
*/

create table t_zip(
    zipcode number(10)
);

/*
insert into t_zip(zipcode) values(2);
insert into t_zip(zipcode) values(31);
insert into t_zip(zipcode) values(32);
insert into t_zip(zipcode) values(41);
commit;
*/
select * from t_zip;

select '0' || to_char(zipcode) , case zipcode when 2  then '서울'
                                              when 31 then '경기'
                                              when 41 then '제주'
                                              else '기타'
                                 end 지역이름
from t_zip; 

/*
1. case 컬럼명 when 결과 then 출력

2. case when 조건 비교식 then 출력
*/

select case when sal <= 1000 then '4급'
            when sal between 1001 and 2000 then '3급'
            when sal between 2001 and 3000 then '2급'
            when sal between 3001 and 4000 then '1급'
            else '특급'
       end 급수 , empno,ename,sal
from emp;       
/*
decode 는 오라클 가지는 특수한 문법
case 표준 구문 (권장) > pivot함수
*/
---------------------------------------------------------------------
--문자열 함수 , 숫자 함수 , 변환(to_format)이쁘게 , 일반함수(nvl ,decode , case)
----------------------------------------------------------------------
-- nvl , to_char , case 

--[집계함수]
--오라클.pdf p75
/*
  1. count(*) > row수  , count(컬럼) >> 데이터 건수
  2. sum()
  3. avg()
  4. max()
  5. min()
  기타 등등

집계함수 
1. 집계함수는 group by 절과 같이 사용
2. 모든 집계함수는 null 값 무시
3. select 절에 집계함수 이외에 다른 컬럼이 오면 반드시 그 컬름은 group by 절에 명시

*/

select count(*) from emp; --row 수 14건

select count(empno) from emp; --데이터 건수

select count(comm) from emp; --6 (null 무시)

select comm from emp;

select count(nvl(comm,0)) from emp; --14건


--급여의 합
select sum(sal) from emp;--29025

select trunc(avg(sal),0) from emp;

--사장님 우리회사 총 수당
select sum(comm) from emp; --4330

select (300 + 200 + 30 + 300 + 3500 + 0)from dual; --4330

--수당의 평균
select trunc(avg(comm)) from emp; --721
select (300 + 200 + 30 + 300 + 3500 + 0) / 6 from dual;


select (300 + 200 + 30 + 300 + 3500 + 0) / 14 from dual; -- 309
--회사의 기준
--노사측 전체 사원수
--경영축 받는 사원수 

select trunc(avg(nvl(comm,0))) from emp;


select max(sal) from emp;
select min(sal) from emp;

select sum(sal) , avg(sal) , max(sal) , min(sal), count(*) , count(sal)
from emp;

select empno , count(empno)
from emp;
--ORA-00937: not a single-group group function

--부서별 평균 급여를 구하세요 

select deptno , avg(sal)
from emp
group by deptno;

--직종별 평균 급여를 구하세요
select job , avg(sal)
from emp
group by job;


select job , avg(sal) , count(job) , max(sal) , min(sal)
from emp
group by job;

/*
group

distinct 컬럼명1 , 컬럼명2

order by 컬럼명1 , 컬럼명2

group by 컬럼명1 , 컬럼명2

*/
--부서별 , 직종별 급여의 합을 구하세요

select deptno , job , sum(sal) ,count(sal)
from emp
group by deptno , job
order by deptno;

/*
select    4 
from      1
where     2 
group by  3
order by  5
*/

--직종별 평균급여가 3000달라 이상인 사원의 직종과 평균급여를 출력하세요

/*
select job , avg(sal)
from emp
where avg(sal) > 3000
group by job;
 실행순서의 문제 ....
 
조건을 group by > having (조건절) 
*/

select job , avg(sal)
from emp
group by job
having avg(sal) >= 3000;

--from 조건절 where
--group by 조건절 having (집계된 데이터 조건)
/*
단일 테이블 기준

select     5 
from       1
where      2  
group by   3
having     4
order by   6 
*/
/* 
사원테이블에서 직종별 급여합을 출력하되 수당은 지급 받고 급여의 합이 5000 이상인 
사원들의 목록을 출력하세요  (comm 0인 놈도 받는 것으로 ....)
급여의 합이 낮은 순으로 출력하세요 
*/
select job , sum(sal) as sumsal
from emp
where comm is not null
group by job
having sum(sal) >= 5000
order by sumsal asc;
/* 
사원테이블에서 부서 인원이 4명보다 많은 부서의 부서번호 ,인원수 , 
급여의 합을 출력하세요 
*/
select deptno , count(*) as 인원 , sum(sal) as 합
from emp
group by deptno
having count(*) > 4;  

/* 
사원테이블에서 직종별 급여의 합이 5000를 초과하는 직종과 급여의 합을 출력하세요
단 판매직종(salesman) 은 제외하고 급여합으로 내림차순 정렬하세요 
*/
select job , sum(sal) as sumsal
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by sumsal desc;
---------------------------------------------------
--HR 계정으로 이동합니다
select user from dual;
show user;

select * from employees;

/*
2. EMPLOYEES 테이블을 이용하여 다음 조건에 만족하는 행을 검색하세요. 
부서번호가 있고, 부서별 근무 인원수가 2명 이상인 행을 검색하여 
부서별 최대 급여와 최소 급여를 계산하고 그 차이를 검색합니다. 
가) 테이블 : employees 
나) 검색 : department_id, MAX(salary), MIN(salary), difference 
        - MAX(salary) 와 MIN(salary)의 차이를 DIFFERENCE로 검색 
다) 조건
    ① 부서번호가 NULL이 아닌 사원 
    ② 부서별 근무 인원수가 2명 이상인 집합 
라) 그룹 : 부서번호가 같은 행
마) 정렬 : department_id 
문제 풀어 보세요
*/
SELECT department_id, MAX(salary), 
      MIN(salary) ,MAX(salary) - MIN(salary) AS difference 
FROM employees 
WHERE department_id IS NOT NULL 
GROUP BY department_id 
HAVING COUNT(*) >= 2 
ORDER BY department_id ;
------------------------------------------------------------------------
--단일 테이블 END--
--select from where group by  having order by
-------------------------------------------------------------------------
/*
  JAVA
  class Member {private int empno , private String ename}
    
  DB
  create table Member(empno number , ename varchar2(20))
  
  JAVA 1건
  Member member = new Member(2000,"홍길동");
  
  DB 1건
  insert into member(empno,ename) values(2000,'홍길동')
  
  다수의 데이터 (1건이상의 데이터)
  
  DB
  select * from emp where deptno=10
  
  JAVA
  List<Member> list = new ArrayList();
  list.add(new Memeber())
  list.add(new Memeber())
  
  DB
  select * from emp where empno=7788
  
  JAVA
  Member member = new Member();
*/
----------------------------------------------------------------------
--여러개의 테이블에서 원하는 데이터 가져오기
--신입 개발자 (JOIN)
--다중 테이블로부터 데이터 검색  오라클.pdf  85page

/*
1.Cartesian Product 모든 가능한 행들의 Join 
2.Equijoin Join 조건이 정확히 일치하는 경우 사용(일반적으로PK와 FK사용) 
3.Non-Equijoin Join 조건이 정확히 일치하지 않는 경우에 사용(등급,학점) 
4.Outer Join Join 조건이 정확히 일치하지 않는 경우에도 모든 행들을 출력 
5.Self Join 하나의 테이블에서 행들을 Join하고자 할 경우에 사용 

*/
/*
create table M (M1 char(6) , M2 char(10));
create table S (S1 char(6) , S2 char(10));
create table X (X1 char(6) , X2 char(10));

insert into M values('A','1');
insert into M values('B','1');
insert into M values('C','3');
insert into M values(null,'3');
commit;

insert into S values('A','X');
insert into S values('B','Y');
insert into S values(null,'Z');
commit;

insert into X values('A','DATA');
commit;
*/
select * from m;
select * from s;
select * from x;

/*
1. 등가조인(equi join)
>원테이블과 대응대는 테이블에 있는 컬럼의 데이터를 1:1 매핑
> 오라클 문법 : SQL 
> 안시문법(ANSI):표준
*/
select m.m1 , m.m2 , s.s2
from m , s
where m.m1 = s.s1;

--ANSI 문법
select m.m1 , m.m2 , s.s2
from m join s  --inner join
on m.m1 = s.s1;

select * from emp;

--사원번호 , 사원이름 , 부서번호 , 부서이름을 출력하세요
select * from emp;
select * from dept;

select emp.empno , emp.ename, emp.deptno , dept.dname
from emp join dept
on emp.deptno = dept.deptno;

--현업 (테이블 가명칭) 
select e.empno , e.ename, e.deptno , d.dname
from emp e join dept d
on e.deptno = d.deptno;

--JOIN select * 하고 ... 실행다음 ... 컬럼을 골라서 사용

select s.s1 , s.s2 ,x.x2
from s join x
on s.s1 = x.x1;

--테이블 3개 , 4개
--오라클 문법
select *
from m, s, x
where m.m1 = s.s1 and s.s1 = x.x1;

--ANSI문법으로
select m.m1 , m.m2 , s.s2 , x.x2
from m join s on m.m1 = s.s1
       join x on s.s1 = x.x1;
--------------------------------------------
--HR
select user from dual;
select * from employees;
select * from departments;
select * from locations;

select count(*) from employees;  --107 사원

--사번 , 이름 (last_name) , 부서번호 , 부서이름을 출력하세요
select e.employee_id , e.last_name , e.department_id , d.department_name
from employees e join departments d
on e.department_id = d.department_id;  --106건

--원인
--178	Kimberely	Grant > department_id > null

--사번 , 이름 , 부서번호 ,부서이름, 지역코드 ,도시명을 출력
--일단 테이블 3개 조인
select *
from employees e join departments d   on e.department_id = d.department_id
                 join locations l     on d.location_id = l.location_id;
select * from employees where department_id is null;

--등가 (컬럼과컬럼이 같다)
--다시 KOSA
select user from dual;

--Non-Equi join (비등가 조인) 1:1 매핑되는 컬럼이 없다
--비등가 문법 (x) >> 등가조인
--개념만 존재 
select * from emp;
select * from salgrade;
1	700	    1200
2	1201	1400
3	1401	2000
4	2001	3000
5	3001	9999


select e.empno , e.ename , e.sal, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal;

--outer join (equi 조인 선행되고 > 남아있는 데이터를 가져오는 방법
--주종관계 (주인되는 쪽에 남아있는 데이터를 가져오는 방법)
--1. left outer join
--2. right outer join
--3. full outer join (left , right > union)

--equi 선행되고 남는 쪽의 데이터 
select *
from m left outer join s
on m.m1 = s.s1;


select *
from m right outer join s
on m.m1 = s.s1;

select *
from m full outer join s
on m.m1 = s.s1;

------------------------------------------
--HR이동
select count(*) from employees;  --107 사원

--사번 , 이름 (last_name) , 부서번호 , 부서이름을 출력하세요
select e.employee_id , e.last_name , e.department_id , d.department_name
from employees e join departments d
on e.department_id = d.department_id;  --106건

select * from employees where department_id is null;
--아래 쿼리가 Kimberely 포함한 107건
select e.employee_id , e.last_name , e.department_id , d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id; 

--null 데이터 확인하기 
---------------------------------
--KOSA 계정으로 이동
--self join
--자기참조 (문법 x) -> 의미만 존재 -> 등가조인
--하나의 테이블에서 특정 컬럼이 자신의 테이블에 있는 특정 컬럼을 참조하는 경우

--사원테이블 , 관리자테이블
--관리자도 사원중에 한명 > 중복된 데이터 > 무결성의 문제 
--포인트 : 테이블에 가명칭 ... 하나의 테이블을 여러개로

select e.empno , e.ename , m.empno , m.ename
from emp e join emp m 
on e.mgr = m.empno;

--14명
select count(*) from emp where mgr is null;
select *from emp;

select e.empno , e.ename , m.empno , m.ename
from emp e left outer join emp m 
on e.mgr = m.empno;
------------------------------------------------------------
select * from emp ,dept; -- 조건이 없어요
select * from emp cross join dept;

--14건 * 4 > 56
-------------------------------------------------------------
--ETC
--NATURAL JOIN
--Equi join 동일
--두테이블 [동일한 이름]을 가는 [컬럼은 모두 조인]
select empno , ename , deptno , dname 
from emp natural join dept;

--join ~using
--NATURAL JOIN 단점은 동일한 이름을 가지는 컬럼은 모두 조인 ...
--using 문을 사용하면 컬럼을 선택해서 조인

select empno , ename , deptno , dname 
from emp join dept using(deptno);
---------------------------------------------------------------

--KOSA 계정에서 하세요
--JOIN 시험
--emp , dept , salgrade
-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO;
 
-- 2. DALLAS에서 근무하는 사원의 이름, 직종, 부서번호, 부서이름을
-- 출력하라.
SELECT E.ENAME, E.JOB, D.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE  D.LOC='DALLAS';
 
-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.
SELECT E.ENAME, D.DNAME
FROM EMP E  join DEPT D  on D.DEPTNO=E.DEPTNO
WHERE  E.ENAME LIKE '%A%';

-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라.
SELECT E.ENAME, D.DNAME, E.SAL 
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.SAL>=3000;
 
-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직종과 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라.
SELECT E.JOB, E.ENAME, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.JOB='SALESMAN';
 
-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다
SELECT         E.EMPNO AS "사원번호",
               E.ENAME AS "사원이름",
               E.SAL*12 AS "연봉",
               --E.SAL*12+NVL(COMM,0) AS "실급여",
               E.SAL*12+COMM AS "실급여",
               S.GRADE AS "급여등급"
FROM EMP E  join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.Comm is not null;
 
-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
-- 월급, 급여등급을 출력하라.
-- inner 는 생략 가능
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
            join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO=10;
 
SELECT * FROM SALGRADE;
 
 
-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로
-- 정렬하라.
-- inner 는 생략 가능
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D        on E.DEPTNO=D.DEPTNO
            join SALGRADE S    on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE  E.DEPTNO<=20 --WHERE E.DEPTNO IN (10,20)  -- e.deptno = 10 or 
ORDER BY E.DEPTNO ASC,  E.SAL DESC;
 
 
-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)
 
SELECT E.EMPNO, E.ENAME , M.EMPNO, M.ENAME
FROM EMP E  left outer join EMP M
on e.MGR = m.EMPNO;

--정답: 지수씨 ,  마리씨 , 민석씨 , 재건씨
------------------------------------------------------------------
​--subquery (SQL 꽃 ... 만능해결사)

--함수 > 단일 테이블 
--다중 테이블(join, union) 
--해결안되요 원하는 데이터를 가진 테이블이 없어요 
--가상 테이블 > subquery (in line view)

--사원테이블에서 사원들의 평균 월급보다 더 많은 월급을 받는 사원의 사번 , 이름 , 급여 출력

--1 평균월급
select avg(sal) from emp; --2073

select * 
from emp
where sal > 2073;

--위 두개의 쿼리를 통합
select *
from emp
where sal > (select avg(sal) from emp);

/*
스칼라 서브쿼리 : select 절 : 단일컬럼 , 단일행을 반환 (1개의 값)
인라인 뷰      : from   절 : view 처럼 임시테이블(가상) ....
중첩서브쿼리    : where  절 : 다중 컬럼 또는 다중 행을 반환
*/

/*
1. single row subquery : 실행 결과가 단일컬럼에 단일로우 (한개의 값)
ex) select sum(sal) , avg(sal) , max(sal)
연산자 : = , != , < , >

2. multi row subquery : 실행 결과가 단일컬럼에 그 값이 여러개
ex) select deptno from dept; 4건
연산자 : IN , NOT IN , ANY ,ALL
ALL(모든 것을 만족)     : sal > 1000 and sal > 4000 and
ANY (어떤 것이 와도 OK) : sal > 1000 or sal > 4000 or

문법)
 1. 괄호안에 있어야 한다 (쿼리문)
 2. 단일 컬럼(select max(sal) , min(sal) from emp 쓰지 마세요)
 3. 서브쿼리 단독 실행 가능
 
 실행순서 : 서브쿼리 실행되고 그 결과를 가지고 주쿼리 실행
*/
--사원테이블에서 jones 의 급여보다 더 많은 급여를 받는 사원의 사번, 이름 ,급여 출력
select sal from emp where ename='JONES';

select empno , ename , sal
from emp
where sal > (select sal from emp where ename='JONES');

--부서번호가 30번인 사원과 같은 급여를 받는 사원의 모든 정보 출력하세요
select sal from emp where deptno=30; --multi row

select *
from emp
where sal = (select sal from emp where deptno=30);
--ORA-01427: single-row subquery returns more than one row
select *
from emp
where sal in (select sal from emp where deptno=30);
--where sal=1600 or sal=1250 or sal=3000

--부하직원이 있는 사원의 사번과 이름을 출력하세요
--내 사번이 mgr 컬럼에 있으면 나는 최소 1명 부하직원
select mgr from emp; 

select * 
from emp
where empno in (select mgr from emp);

--부하직원이 없는 사원의 모든 정보 출력
select * 
from emp
where empno not in (select mgr from emp);
--where empno != 7902 and empno != 7698 and null > null

select * 
from emp
where empno not in (select nvl(mgr,0) from emp);

--20번 부서의 사원 중에서 가장 많은 월급을 받는 사원보다 더 많은 급여를 받는 사원의 
-- 사번, 이름, 급여, 부서번호를 출력하세요
select max(sal) from emp where deptno=20;

select empno , ename, sal
from emp
where sal > (select max(sal) from emp where deptno=20);
-------------------------------------------------------------
--스칼라 서브 쿼리 
select e.empno , e.ename , e.deptno , 
       (select d.dname from dept d where d.deptno = e.deptno) as dept_name
from emp e

-- 위 와 같은 JOIN 으로 해결 ....
--아래와 같은 JOIN 을 사용해라 
select *
from emp e join dept d
on e.deptno = d.deptno;
---------------------------------------------------------------
--자기 부서의 평균월급다 더 많은 월급을 받는 사원의 사번 , 이름 , 부서번호 , 
--부서별 평균월급을 출력하세요
--만약에 부서와 부서별 평균월급 담고 있는 테이블 제공
--in line view
select e.empno , e.ename, e.deptno , e.sal , s.avgsal
from emp e join 
       (select deptno , trunc(avg(sal),0) as avgsal from emp group by deptno) s
on e.deptno = s.deptno
where e.sal > s.avgsal;
----------------------------------------------------------------
--KOSA 계정으로 실습문제 .......

--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.
SELECT ENAME, SAL
FROM EMP
WHERE SAL>(SELECT SAL
           FROM EMP
           WHERE ENAME='SMITH');
 
--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,
-- 부서번호를 출력하라.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN(SELECT SAL
             FROM EMP
             WHERE DEPTNO=10);
 
--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
-- 'BLAKE'는 빼고 출력하라.
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO=(SELECT DEPTNO
              FROM EMP
              WHERE ENAME='BLAKE')
AND ENAME!='BLAKE';
 
--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT  AVG(SAL)  FROM EMP)
ORDER BY SAL DESC;
 
--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
-- 있는 사원의 사원번호와 이름을 출력하라.
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                FROM EMP
                WHERE ENAME LIKE '%T%');
--where deptno = 20 or deptno= 30


--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
             FROM EMP
             WHERE DEPTNO=30);
 
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > ALL(SELECT SAL
                FROM EMP
                WHERE DEPTNO=30)
 
--where sal > 1600 and sal > 1250 
--and sal > 2850 and sal > 1500 and sal > 950
 
 
--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라.
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO    -- = 이 맞는데  IN
                FROM DEPT
                WHERE LOC='DALLAS');
 
--8. SALES 부서에서 일하는 사원들의  같은 부서번호, 이름, 직업을 갖는 사원정보를 출력하라.
SELECT DEPTNO, ENAME, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                FROM DEPT
                WHERE DNAME='SALES')
 

 
--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번)
SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
           FROM EMP
           WHERE ENAME='KING');
 
--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는
-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,
-- 급여를 출력하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
             FROM EMP)
AND DEPTNO IN(SELECT DEPTNO
              FROM EMP
              WHERE ENAME LIKE '%S%');
 
--select * from emp
--where  deptno in  (
--                      select deptno from emp where sal > (select avg(sal) from emp)
--                      and ename like '%S%'
--                   )
 
--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의
-- 이름, 월급, 부서번호를 출력하라.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                FROM EMP
                WHERE COMM IS NOT NULL)
AND SAL IN( SELECT SAL
            FROM EMP
            WHERE COMM IS NOT NULL);
 
--12. 30번 부서 사원들과 월급과 커미션이 같지 않은
-- 사원들의 이름, 월급, 커미션을 출력하라.
SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL NOT IN(SELECT SAL
                 FROM EMP
                 WHERE DEPTNO=30)
AND COMM NOT IN(SELECT NVL(COMM, 0)
                FROM EMP
                WHERE DEPTNO=30 and comm is not null);
 
--SELECT NVL(COMM, 0)
--FROM EMP
--WHERE DEPTNO=30 and comm is not null;
 
--SELECT COMM
--FROM EMP
--WHERE DEPTNO=30 and comm is not null;
​
-------------------------------------------------------------------------
--기업에서 원하는 신입 DB역량
/*
select   5
from     1
where    2 
group by 3
having   4                   
order by 6 
+
기본함수(문자, 숫자 ,날짜 , 변환(to_) , 일반(decode,case) , 집계함수
+
다중테이블 (JOIN, UNION)
+
subquery
+
DML(insert , update , delete)
*/
-------------------------------------------------------------------------------------
--금요일
--DDL 구문 과  제약(constraint)  그리고 DML(insert , update ,delete) 
--진행하겠습니다^^

--토요일은
--개발자 필수 쿼리 와 분석함수 ...진행

------------------------------------------------------------------------
/*
1 DDL (데이터 정의어) : create , alter , drop , + truncate , rename , modify
2 DML (데이터 조작어) : insert , update , delete (트랜잭션 : commit , rollback)
3 신입 취업 : select , insert ..점심 ... select(0) insert ,update , delete

3.1 commit , rollback 수행하지 않았어요
3.2 log write (기록) 
    DML -> log write 선행 >  DISK 반영 > log 파일 full > write(x) > dml(x)
    log back up > log 삭제

4. DQL : select
5. DCL : 제어 : 관리자 > grant ,revoke
6. TCL : 트랜잭션 commit , rollback , savepoint

*/

--DML
--1. insert
select * from tab; --접속계정 KOSA 볼수 있는 테이블  목록

select * from tab where tname='BOARD';
select * from tab where tname='EMP';

create table temp(
  id number primary key , --not null , unique (회원ID ...)
  name varchar2(20)
 );
 
 1.1
 insert into temp(id,name)
 values(100,'홍길동');
 
 select * from temp;

--의사결정
commit;
--실반영

--1.2 컬럼목록을 생략가능
insert into temp
values(200,'김유신');

select * from temp;

rollback;

--1.3 문제 발생
insert into temp(name)
values('아무게');
--ORA-01400: cannot insert NULL into ("KOSA"."TEMP"."ID")

insert into temp(id,name)
values(100,'개똥이');
--ORA-00001: unique constraint (KOSA.SYS_C007002) violated

insert into temp(id)
values(200);

select * from temp;

commit;
-----------------------------------------------------------------------

--TIP
--SQL 프로그래밍 적인 요소가 없어요 (변수, 제어문 불가능)
--PL-SQL 변수 , 제어문 ..

create table temp2(id varchar2(50));

desc temp2;

--PL-SQL
--java : for(int i =0 ; i < 100 ;i++){}
/*
BEGIN
    FOR i IN 1..100 LOOP
        insert into temp2(id) values('A' || to_char(i));
    END LOOP;
END;
*/
select * from temp2;

create table temp3(
  memberid number(3) not null,
  name varchar2(10), --default null
  regdate date default sysdate --DB서버날짜
);

insert into temp3(memberid,name,regdate)
values(100,'홍길동','2025-09-12');

select * from temp3;

commit;

--날짜
insert into temp3(memberid,name)
values(200,'김유신');

select * from temp3;

commit;

---------------------------------------------------------------
create table temp4(id number);
create table temp5(num number);

insert into temp4(id) values(1);
insert into temp4(id) values(2);
insert into temp4(id) values(3);
insert into temp4(id) values(4);
insert into temp4(id) values(5);
insert into temp4(id) values(6);
insert into temp4(id) values(7);
insert into temp4(id) values(8);
insert into temp4(id) values(9);
insert into temp4(id) values(10);
commit;
---------------------------------------------------------------
--** 대량 데이터 삽입하기 
--temp4 있는 모든 데이터 한번에 temp5 넣고 싶어요

--insert into 테이블명(컬럼리스트) values..
--insert into 테이블명(컬럼리스트) select 절

insert into temp5(num)
select id from temp4;

select * from temp5;

commit;

--대량 데이터 삽입하기
--데이터를 담을 테이블도 없고 >> 테이블 구조 복제(스키마) >> 데이터 삽입
--단 제약정보는 복제 되지 않아요

create table copyemp
as
    select empno ,ename ,job ,sal
    from emp
    where deptno=20;
    
    
select * from copyemp;    
-----------------------------------------------
--1. insert ...values       > insert ...select절
--2. create table  copyemp as select ....
--퀴즈

create table copyemp3
as
  select * from emp where 1=2;

select * from copyemp3;
------------[INSERT END]---------------------------------------------
--update--
/*

update 테이블명
set 컬럼명 = 값 , 컬럼명 = 값 ......
where 조건절

update 테이블명
set 컬럼명 = (subquery) , 컬럼명 = 값 ......
where (subquery)

*/
select * from copyemp;

update copyemp
set sal = 0;

select * from copyemp;

rollback;

update copyemp
set sal=1111
where empno=7369;

select * from copyemp;

commit;

update copyemp
set sal = (select sum(sal) from emp);

select * from copyemp;

rollback;

update copyemp
set ename='AAA' , job='IT' , sal=1000
where empno=7369;

select * from copyemp
where empno=7369;

commit;
---------------------------------------------------------------------
--[UPDATE END]-------------------------------------------------------

delete from copyemp;

select * from copyemp;

rollback;

delete from copyemp
where job = 'IT';


select * from copyemp;

commit;
-----------------------------------------------------------------
--DELETE END--
/*
개발자 (SQL)
1. CRUD (creat>insert , read>select , update ,delete)
2. APP(JAVA) -> 표준 JDBC API  -> DB 작업
3. insert , update , delete , select (70%) : 함수,조인,서브쿼리...

JAVA DB에 있는 EMP 테이블접근해서 대해서 조회, 수정 ,삭제 ...
MVC 패턴
Model : DTO(VO) , DAO , SERVICE  >> DAO(DB 연결, CRUD 함수 구현)
View  : 1차 console > list.jsp ,list.html
Controller : 중앙통제 JAVA 파일 웹 사용가능 > servlet (request, response)

DAO 클래스
기본적인 CRUD 함수 ....

1. 전체조회 : public List<Emp> getEmpList(){} > select * from emp
2. 조건조회 : public Emp getEmpListByEmpno(int empno){} > select * from emp where empno=7788
3. 삽입    : public int insertEmp(Emp emp){} > insert into Emp(empno...) values(value...)
4. 삭제    : public int deleteEmp(int empno){} > delete from emp where empno=7788
5. 수정    : public int updateEmp(Emp emp){} > update emp set ename='aa'....

JAVA  5개 함수를 만들수 있다
DB    5개의 쿼리문을 만들수 있다
*/

--Tip
select * from tab;

select * from col where tname='EMP';
select * from user_constraints where table_name='EMP'; 

----------------------------------------------------------------------
--DDL
--가상컬럼(조합컬럼)
--학생성적테이블
--학번 , 국어 , 영어 , 수학 , 합계 , 평균
--데이터 무결성 (조회) : 국어점수가 변경되면 >> 평균 , 합계 변화.... 무결성 보장

create table vtab1(
    no1 number,
    no2 number,
    no3 number GENERATED ALWAYS as (no1 + no2) VIRTUAL
);

insert into vtab1(no1, no2)
values(100,50);

select * from vtab1;

/*        
insert into vtab1(no1, no2,no3)
values(100,50,50);  직접 넣을 수 없다
*/

update vtab1
set no1=200;

select * from vtab1;

commit;
-------------------------------------------------------------------
--실무에서 사용하는 코드
--제품 (입고) : 분기별 데이터 추출(1,2,3 1분기 ... 10,11,12 4분기)
create table vtable2(
  no number, --순번
  p_code char(4), --제품코드 (A001 , B003)
  p_date char(8), --입고일 (20250101 , 20251010)
  p_qty  number, --수량
  p_bungi number(1) GENERATED ALWAYS as (
                    case when substr(p_date,5,2) in ('01','02','03') then 1
                         when substr(p_date,5,2) in ('04','05','06') then 2
                         when substr(p_date,5,2) in ('07','08','09') then 3
                    else 4
                    end
                   ) VIRTUAL
);

insert into vtable2(p_date) values('20240101');
insert into vtable2(p_date) values('20240501');
insert into vtable2(p_date) values('20240601');
insert into vtable2(p_date) values('20241201');
commit;


select * from vtable2 where p_bungi =1;
----------------------------------------------------------------------
--테이블 생성 수정 문법

--1. 테이블 생성하기

create table temp6(id number);
desc temp6;

--2. 테이블 생성 후에 컬럼 추가하기

alter table temp6
add ename varchar2(20);

desc temp6;

--3. 기존 테이블에 있는 컬럼이름 (ename-> username) > TOOL 사용 문제 없다
alter table temp6
rename column ename to username;

desc temp6;

--4. 기존 테이블에 있는 기존 컬럼의 타입 크기 수정 (modify)
alter table temp6
modify (username varchar2(2000));

desc temp6;

--5. 기존 테이블에 있는 기존 컬럼 삭제
alter table temp6
drop column username;

select * from temp6;

--TOOL 써도 되요 

--6 고민
--테이블에 있는 데이터가 필요없어요
--delete from emp;
--emp 1M  > 10만건 > 100M > delete 10만건 삭제 > 테이블 크기 > 100M


--6.2 truncate(테이블 데이터 삭제 : 크기도 줄여요)
--truncate(단점 : where 사용 안되요)
--truncate table emp; 데이터 삭제 , 공간 삭제

drop table temp6;

desc temp6;
----------------------------------------------------------------
--기본 DDL END---------------------------------------------------

--데이터베이스 (무결성) > 제약 
--오라클.pdf (page 143)
/*
제 약 조 건 
설     명 
PRIMARY KEY(PK)  유일하게 테이블의 각행을 식별(NOT NULL과 UNIQUE조건을 만족) 
FOREIGN KEY(FK)  열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다. 
UNIQUE key(UK) 
                 테이블의 모든 행을 유일하게 하는 값을 가진 열(NULL을 허용) 
NOT NULL(NN) 
                 열은 NULL값을 포함할 수 없습니다. 
CHECK(CK) 
                 참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정) 

제약은 아니지만 default sysdate 참고로 ^^
*/
/*
1. primary key (PK) : not null , unique (유일값 보장)
emp > empno > PK > where empno=7788 > 데이터 1건 보장
성능 (pk > where empno=7788 > 성능 > index 

테이블당 PK 1개 복합키 

--언제
1. create table 생성 PK 선행...
2. create table 생성후 필요에 따라서 (alter table add constraint ...)
3. select * from user_constraints;
   select * from user_constraints where table_name='EMP';
*/

create table temp7(
    --id number primary key --권장하지 않아요 (제약 SYS_C006977)
    id number constraint pk_temp7_id primary key,
    name varchar2(20) not null,
    addr varchar2(50)
);

select * from user_constraints where table_name='TEMP7';

insert into temp7(id,name,addr) 
values(1,'홍길동','서울시 강남구');

insert into temp7(id,name,addr) 
values(1,'김유신','서울시 강북구');
--ORA-00001: unique constraint (KOSA.PK_TEMP7_ID) violated

insert into temp7(name,addr) 
values('김유신','서울시 강북구');
--ORA-01400: cannot insert NULL into ("KOSA"."TEMP7"."ID")

---------------------------------------------------------------
--Unique (uk)
--테이블의 모든 행을 유일하게 하는 값을 가진 열(Null 허용)
--테이블 몇개 (컬럼 수 만큼)

create table temp8(
    --id number primary key --권장하지 않아요 (제약 SYS_C006977)
    id number constraint pk_temp8_id primary key,
    name varchar2(20) not null,
    jumin nvarchar2(6) constraint uk_temp8_jumin unique, --중복(null)
    addr varchar2(50)
);

insert into temp8(id,name,jumin,addr)
values(1,'김유신','123456','한양');

insert into temp8(id,name,jumin,addr)
values(2,'유신','123456','강남');
--ORA-00001: unique constraint (KOSA.UK_TEMP8_JUMIN) violated

insert into temp8(id,name,addr)
values(2,'유신','강남');

insert into temp8(id,name,addr)
values(3,'유신','강남');

select * from temp8;

commit;
--------------------------------------------------------------
--제약 테이블 만들고 나서 필요하면 그때 적용
create table temp9(id number);

select * from user_constraints where table_name='TEMP9';

alter table temp9
add constraint pk_temp9_id primary key(id);
--만약 3개 묶어서

/*
alter table temp9
add constraint pk_temp9_id primary key(id,num,regdate);
where id= and num= and refdate=
*/

drop table temp10;

create table temp10(id number ,userid number);

alter table temp10
add constraint pk_temp10_id primary key(id,userid); --복합키

select * from user_constraints where table_name='TEMP10';
/*
튜닝 (복합키) : 순서가 중요 
1. 성능 : where id=1 and userid='hong'   1
2. 성능 : where id=1 0  2
3. 성능 : where userid='hong' 3 (index 적용 x) Table scan
*/
/*
alter table temp9
modify(ename not null)
*/

--check 제약 (업무 규칙 정의 : where gender in('남','여');

create table temp11(
    id number constraint pk_temp11_id primary key,
    name varchar2(20) not null,
    jumin nvarchar2(6) constraint uk_temp11_jumin unique, --중복(null)
    addr varchar2(50),
    age number constraints ck_temp11_age check(age >= 19)
);
select * from user_constraints where table_name='TEMP11';

insert into temp11(id,name,jumin,addr,age)
values(1,'홍길동','123456','서울시 강남구',18);
--ORA-02290: check constraint (KOSA.CK_TEMP11_AGE) violated

insert into temp11(id,name,jumin,addr,age)
values(1,'홍길동','123456','서울시 강남구',19);

commit;
-------------------------------------------------------------
--Foreign key
--1. 관계를 정의 합니다 (1:1 . 1:N  M:N)
--2. 관계안에서 참조제약 (emp (deptno) dept(deptno) 참조

create table c_emp
as
  select empno , ename , deptno from emp where 1=2;

select * from c_emp;

create table c_dept
as
  select deptno , dname from dept where 1=2;
  
select * from c_emp;
select * from c_dept;


--PK (신용확보)
alter table c_dept
add constraint pk_c_dept_deptno primary key(deptno);

--FK
alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);


select * from user_constraints where table_name='C_DEPT';
select * from user_constraints where table_name='C_EMP';

--부서
insert into c_dept(deptno,dname) values(100,'인사팀');
insert into c_dept(deptno,dname) values(200,'관리팀');
insert into c_dept(deptno,dname) values(300,'회계팀');
commit;

select * from c_dept;

--신입 입사
insert into c_emp(empno,ename,deptno)
values(1,'신입이',400);
--ORA-02291: integrity constraint (KOSA.FK_C_EMP_DEPTNO) violated - parent key not found

insert into c_emp(empno,ename,deptno)
values(1,'신입이',100);

select * from c_emp;
commit;


/* 사원 */
CREATE TABLE EMP (
	empno NUMBER NOT NULL, /* 사번 */
	ename VARCHAR2(20), /* 이름 */
	sal NUMBER, /* 급여 */
	deptno NUMBER /* 부서번호 */
);

/* 부서 */
CREATE TABLE DEPT (
	deptno NUMBER, /* 부서번호 */
	dname VARCHAR2(20) /* 부서명 */
);

ALTER TABLE EMP
ADD CONSTRAINT PK_EMP_EMPNO	PRIMARY KEY (empno);

ALTER TABLE DEPT
ADD CONSTRAINT PK_DEPT_DEPTNO 	PRIMARY KEY (deptno);

ALTER TABLE EMP
ADD CONSTRAINT FK_DEPT_TO_EMP 	FOREIGN KEY (deptno)	REFERENCES DEPT (deptno);
-----------------------------------------------------------------------------
--제약 END--