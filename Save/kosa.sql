show user;
SELECT *
FROM emp
WHERE REGEXP_LIKE(EMPNO, '^7900$|^79[0-9]{2}$|^8000$');
--USER이(가) "KOSA"입니다.
/*
RDBMS (Relational Database Management System) 정의
관계형 데이터베이스 관리 시스템(RDBMS, Relational Database Management System)은 
데이터를 테이블(Table) 형식으로 관리하는 데이터베이스 시스템입니다.

1. RDBMS 특징
테이블 기반 데이터 저장: 데이터를 행(Row)과 열(Column)로 구성된 테이블 형태로 저장

관계(Relation) 형성: 테이블 간 키(Key) 를 이용하여 관계를 설정

SQL (Structured Query Language) 사용: 데이터를 조작하고 조회하는 표준 언어 제공 : CRUD (개발자)
>> DDL (data definition lang데이터 정의어) : create , alter , drop 
>> DML (data manupluate lang데이터 조작어) : insert , update , delete , select(70%) (개발자)
>> DCL (data control lang 데이터 제어어) : grant , revoke  (DBA)
>> TCL (transaction 트랜잭션 중요) ..... (개발자)

데이터 [무결성] 유지: 제약 조건(Constraints) 을 통해 데이터의 정확성 보장
>> PK 프라이머리키 , FK 포린키 , UK 유니크키 , Check   >> Default, null

트랜잭션 지원: ACID (원자성, 일관성, 고립성, 지속성) 원칙 준수

2. RDBMS 주요 개념
테이블(Table): 데이터를 저장하는 기본 단위 (엑셀의 시트와 유사)
레코드(Record) / 행(Row): 테이블의 한 줄 (한 개의 데이터 항목)
속성(Attribute) / 열(Column): 데이터의 속성을 나타내는 필드
기본 키(Primary Key, PK): 테이블에서 각 행을 유일하게 식별하는 키
외래 키(Foreign Key, FK): 다른 테이블의 기본 키를 참조하여 관계 설정
    전세계에서 사용하는 데이터베이스는 종류가 100개가 넘는다
    한국은 고유의 데이터베이스 엔진을 가지고 있다.  티베로
    티멕스소프트의 웹서버 제우스
    

3. RDBMS의 대표적인 시스템
-MySQL: 오픈 소스 RDBMS, 웹 애플리케이션에서 널리 사용됨
    
-PostgreSQL: 강력한 기능을 제공하는 오픈 소스 RDBMS
    백터데이터 
-Oracle Database: 기업 환경에서 많이 사용되는 고성능 RDBMS
    백터데이터가능 금융권 대부분 오라클
-Microsoft SQL Server: 마이크로소프트에서 개발한 RDBMS
    벤처
-MariaDB: MySQL의 포크로 높은 성능과 안정성을 제공
ETC : DB2(IBM데이터베이스 kobol 쓰는 워크스테이션 은행권 ibm 워크스테이션 
아래에 여러 데이터 베이스 붙여서 쓴다.) , SYSBASE , 티베로 ...



4. RDBMS의 장점
 데이터 정합성 보장: 키와 관계를 통해 데이터의 일관성 유지
 중복 최소화: [정규화]를 통해 데이터 중복을 방지  >>     반정규화(역정규화)
 강력한 쿼리 기능: SQL을 사용하여 복잡한 데이터 검색 가능
 데이터 보안: 사용자 권한 관리 및 접근 제어 가능

5. RDBMS의 단점
    
 확장성 제한: 대량의 데이터를 처리하는 데 한계가 있음 (수직 확장 필요)
 복잡한 스키마: 변경이 어려워 유연성이 낮음
 고비용: 일부 상용 RDBMS는 라이선스 비용이 높음
    emp안에 객체 저장이 안됨  
 객체 형태의 데이터 관리가 안되요 ( ORDB ) >> NO SQL 
     no sql 은 json 데이터 저장이 가능하다.
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
--1. 사원 테이블 있는 모든 데이터를 가져오세요
select * from emp;

--2. 특정 컬럼의 데이터만 출력
select empno,ename,sal
from emp;

desc emp; -- 약식으로 테이블 정보 ( 컬럼명, 타입)

select ename from emp;

--3. 별명 ( 가명칭) alisa
select empno 사번, ename 이름
from emp;

--select empno 사   번, ename 이   름
--from emp;
--  공백을 인식못해서 에러

--표준문법 (AN-SI)
select empno as "사   번" , ename as "이    름"
from emp;

-- Oracle 문자열 데이터 엄격하게 대소문자 구분
/*
    JAVA: 문자 'A', 문자열 "AAAAA"
    Oracle : 문자열과 문자의 구분이 없어요 : 'A','AAAAA' , '만세' 이거다 문자열임
    Oracle : 'A' 와 'a' 다른 문자열로본다.

*/
                       -- 실행순서
select *                --3
from emp                --1
where ename = 'KING';   --2
--where ename = 'king';
-- from에서 가저온담에 where실행하고 select가 맨마지막에 실행됨 

--Oracle Query(질의어) 언어
--Java : 연산자 ( 산술, 논리 , 관계)
--   java에서는 + 하나로 결합 연산 모두

-- ORACLE
-- 결합연산자 :  ||
-- 산술연산자 :  +

--MS-SQL :  + (산술 , 결합)

--select '사원의 이름은 '  || ename || '입니다'
--from emp;

select '사원의 이름은 '  || ename || ' 입니다' as "사원정보"
from emp;

/* 
JAVA : class Emp {private int empno, private String name}
ORACLE : create table Emp(empno number ,enmae varchar2(20));

varchar2(20) 한글 10자 , 영문자 특수문자 공백은 20개가 가능 20-> 20바이트
*/

select empno || ename --empno(number) , ename(varchar2())
from emp;

desc emp;

select empno + 10000 from emp; -- 숫자 데이터  .. 연산 ok 
-- select empno + ename from emp; -- ORA-01722: invalid number

-- 7788 + 'SMITH' 안된다.

-- 사장이 개발실에와서 우리 회사에 직종이 몇개지라고 신입한테 질의
select job from emp; -- 이러면 중복제거 안되있음

--중복된 행 제거 키워드 : distinct
select distinct job from emp; --grouping 

select distinct job ,deptno -- job으로 한번 묶고  deptno로 정렬
from emp
order by job;

--Oracle SQL 언어
--JAVA ( + - * / ) 나머지 연산자 %
-- Oracle ( + - * / ) >> %를 나머지 연산자로 쓰지 않음 함수( mod())
--      % 문자열 검색( 패턴 ) 으로 사용함 > where ename like '%김%' 이름에 김자가 있다면 다 뽑아 내라

--DB (DML) : 테이블 구조 , 컬럼 구조, 문제를 많이 만들어 본다.

-- 사원테이블에서 사원의 급여를 100달라 인상한 결과를 출력
select empno, ename,sal, sal + 100 as "급여인상분" from emp;

-- 오라클 print 기능이 없어요
-- JAVA : System.out.println()
-- 임시(가상 테이블) 만들어서 PRINT기능
-- dual (임시테이블)

select 100+100 from dual;
select 100 || 100 from dual; -- 산술안하고 결합해서 100100 출력
select '100' + 100 from dual; -- 200 '100'의 껍질을 벗기면 숫자 이걸 숫자형문자라 한다
--select '100A' + 100 from dual; -- ORA-01722: invalid number

-- 비교연산자
-- <  >  <=
-- JAVA : 같다 ==, 할당(asign) =
-- ORACLE : 같다 = , 같지 않다 != 
-- JAVASCRIPT : ( ==, ===)

--논리연산 ( AND , OR , NOT)
select empno , ename , sal
from emp
where sal >= 2000;

--사번이 7788번인 사원의 사번 , 이름 , 직종 , 입사일 출력하세요
--select empno , ename , job, hiredate
--select *
select empno, ename, job , hiredate
from emp
where empno=7788;

--현재 접속한 사용자 환경
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select * from emp;
select sysdate from emp;

-- 여기서 해도 cmd로 sqlplus로 접속해도 다른 사용자로 보기 때문에 업데이트 안됨
-- 즉 현재 접속한 사용자만 적용

/*

     AND   OR
0 0   
1 0         1
0 1         1 
1 1   1     1

 초과 , 미만
 이상 , 이하 (=)
*/



-- 급여가 2000달러 이상 직종이 manager인 사원의 모든 정보를 출력
select *
from emp
where sal >= 2000 and job = 'MANAGER';

-- 급여가 2000달러 이상이거나 또는 직종이 manager인 사원의 모든 정보를 출력
select *
from emp
where sal >= 2000  or job = 'MANAGER';

-- 급여가 2000달러 초과이면서 직종이 manager인 사원의 모든 정보를 출력
select *
from emp
where sal > 2000 and job = 'MANAGER';

select sysdate from dual;

select * from nls_session_parameters;
--날짜 포멧 확인 변경가능 ... db의 허락이 있다는 가정하
/*
NLS_LANGUAGE KOREAN
NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS
NLS_DATE_LANGUAGE	KOREAN
*/
select hiredate from emp;
-- 날짜 데이터 검색 (문자열 검색과 동일하다) > '날짜'
-- 날짜 검색에 대해서 유연하다 ( 날짜 형식에 대해서 유연)
select *
from emp where hiredate='1980-12-17';

select *
from emp where hiredate='1980/12/17';

select *
from emp where hiredate='1980.12.17';
/*
select *
from emp where hiredate='80-12-17'; 
검색 : RR-MM-DD 형식이어야됨 > 지금 YYYY-MM-DD
*/

--사원의 급여가 2000 이상이면서 4000달러 이하인 사원의 모든 정보를 출력하세요
select *
from emp 
where sal >= 2000 and sal <= 4000;

select *
from emp
where sal between 2000 and 4000; -- 단점 무조건 = 을 포함하게된다.
--사원의 급여가 2000 초과이면서 4000달러 미만인 사원의 모든 정보를 출력하세요
select *
from emp where sal > 2000 and sal < 4000;

--부서번호가 10번 또는 20번 또는 30번인 사원의 사번 , 이름 , 급여 , 부서번호 출력
select *
from emp 
where deptno = 10 or deptno = 20 or deptno = 30;
--in연산자
select *
from emp 
where deptno in (10,20,30);

----부서번호가 10번 또는 20번이 아닌 사원의 사번 , 이름 , 급여 , 부서번호 출력
select *
from emp
where deptno!=10 and deptno!=20;
-- 위아래 같은 코드 다른 방식
select *
from emp
where deptno not in (10,20);
-- not in 을 풀어쓰면 != and != 이다.

--문제
-- whwere deptno not in (10,20); 풀어쓰세요
-- where deptno!=10 and deptno!=20;

/*
    Today Point
    null
    값이 없다
    필요악
    사용하는 문법
    비교 : = null(x), is null or in not null
    함수 : nvl() , nvl2() 함수 (mysql : if null())
*/

create table member(
    userid varchar2(20) not null, -- 필수 입력
    name varchar2(20) not null, -- 필수 입력
    hobby varchar2(50) -- deafult 가 null  허용
); --한번 만들어진 테이블은 영속적으로 남게된다.

desc member;

insert into member(userid, name, hobby)
values('hong', '길동', '도둑');

select * from member;

/*
    DB 에 DML(insert , update , delete)작업을 한다.
    insert , update , delete 작업수행 (기본적으로 transaction 을 동반한다.)
    트렌잭션의 정의 : 하나의 논리적인 작업 단위
    은행 업무
    A 계좌 인출 : update
    -> B계좌 이체 : update
     B계좌에 이체될때까지 하나라도 실패하면 롤백
     
     하나의 업무 (인출 -> 이체)
     begin tran
        A계좌 인출(update)
        B계좌 이체(update)
     end tran  
     
     성공 : 실반영 : commit
     실패 : rollback 시작점으로 되돌림
     
     오라클은
     default insert, update , delete 작업 트랜잭션 강제 수행
     완료 : commit , rollback 강제
     작업하던사람이 commit 하던 rollback 하던 완료를해야됨 
     안그럼 다 대기열 걸려서 작동안함
     
     트렌젝션은 짧게 잡아야된다. 길어지면 대기시간이 길어진다.
     
     대기걸렸을때 읽기모드가 된다는거 같은데 읽는 동안에 ghostdata(없어진데이터)
     읽기가 되는 등의 문제가 있다.
     
     Ms-sql
     update .. 실반영 (자동 auto-commit) ms-sql은 무조건 실반영이다 트랜젝션 걸지 않는다 auto commit 이다.
     
     트랜젝션 걸고 싶으면 
     begin tran 실행 (명시적) 해야 오라클처럼 transaction 된다.
     결론 delete 하면 자동 커밋된다는 예기
        
     
*/
-- 수당(comm) 받지 않는 모든 사원의 정보 출력 (comm 데이터 null)
--select *
--from emp
--where comm = null; -- 문법 (x)

select *
from emp
where comm is null;
--수당을 받는사람
select *
from emp
where comm is not null;
-- 0도 데이터로 보기때문에 0인 사람도 나옴

-- 사원테이블에서 사번, 이름, 급여 , 수당 , 총급여(급여 + 수당) 을 출력

select empno, ename ,sal , comm, sal+comm as "총급여"
from emp;
-- SMITH 같이 총급여가 null 이 발생한다.
/*
null 이란 녀석
1. null 과의 모든 연산 결과는 null > null + 100 > null
2. null 값을 처리하기위한 함수 : nvl(), nvl2()
    nvl(컬럼명,대체값)

*/
select empno, ename ,sal , comm, sal+nvl(comm,0) as "총급여"
from emp;

--sample
select 1000 + null from dual;
select 1000 + nvl(null,0) from dual;
select 1000 + nvl(null, 111111) from dual;
select nvl(null, 'hello world') from dual;
--사원의 급여가 1000 이상이고 수당을 받지 않는 사원의 사번 , 이름 , 직종 , 급여 , 수당
-- 총 급여(급여 + 수당)를 출력
select empno, ename, job, sal, comm, sal+nvl(comm,0) as "총급여"
from emp
where sal >= 1000 and comm is null;

--문자열 검색
--주소검색 >> 역삼 >> 역삼이라는 단어가 포함된 모든 주소
-- LIKE 문자열 패턴 검색
-- 와일드 카드 ( % 모든것 , _ 한문자 )
-- 부족 : 정규표현식 만듬
select *
from emp
where ename like '%A%'; -- A앞 뒤에 어떤문자던 상관없다 이름에 A만을 찾아라
select *
from emp
where ename like 'A%'; -- A로 시작하는 이름을 찾아라
-- 김씨성을 찾는다면 ename like "김%"
select *
from emp
where ename like '%E';
--BLAKE
select *
from emp
where ename like '%LL%'; -- allen miller
-- ALLEN MILLER
select *
from emp
where ename like '%A%A%'; --A가 떨어지던 붙어있던 2번 나오면됨
-- ADAMS
select *
from emp
where ename like '_A%'; -- _한문자 즉 첫문자는 뭐든 상관없고 그담에 A로 시작하는사람
--WARD MARTIN JAMES

--정규 표현식 : regexp like()
-- select * from emp where regexp_like(ename, '[A-C]'); 사례 5개를 만들어서 올릴것 과제
select * from emp where regexp_like(ename, '[A-C]');
--select * from emp where regexp_like(empno, '[]');

------------------------------------------------------------
/*
    데이터 정렬하기
    order by 컬럼명 : 문자열 , 숫자 , 날짜 정렬 가능
    오름차순 : asc 낮은순 : 이게 default
    내림차순 : desc 높은순 
    정렬은 서버입장에서 cost(cpu 메모리) 많이 든다
       
*/

select *
from emp
order by sal; -- default asc
-- king 이 제일 많이 받고 스미스가 제일 적게받음

select *
from emp
order by sal desc;

-- 입사일이 가장 늦은 늦은 순으로 정렬해서 사번, 이름 급여 ,입사일 출력
-- 입사일 내림차순
select empno, ename, sal, hiredate
from emp
order by hiredate desc;
/*
읽는 순서
3       select 절
1       from 절
2       where 절 
4       order by 절  --가장 느린작업이기도하니 선택후에 정렬하게됨 
   order by는 select 한 결과를 정렬한다.
*/

select empno, ename , sal, job , hiredate
from emp
where job = 'MANAGER' 
order by hiredate desc;
-- emp 테이블에서 직업이 매니저인사람을 사번 이름 연봉 직업 고용년도를 고용년도 내림차순으로 정렬하라

select job, deptno
from emp
order by job asc, deptno desc;
-- job으로 그룹화해 정렬, 그 안에서 group depno 내림차순 순으로 정렬하는것

--연산자
--합집합(union)    : 테이블과 테이블의 데이터 합쳐지는 것(중복값 배제)
--합집합(union all): 테이블과 테이블의 데이터 합쳐지는 것(중복값 허용) 
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
조인
*/
select * from uta;
select * form ut;
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
select * from uta;

select * from ut
union all
select * from uta;
/*
AAA
BBB
CCC
AAA
BBB
CCC
DDD
조건
union
1. [대응]되는 [컬럼]의 [타입]이 동일
*/
select empno , ename from emp
union
select dname , deptno from dept;
--ORA-01790: expression must have same datatype as corresponding expression
-- empno 숫자 dname 문자 이러니 에러뜨는것
select empno , ename from emp
union
select deptno , dname from dept;

-- subquery 사용해서  가상테이블 만들기
select *
from (
        select empno , ename from emp
        union
        select deptno , dname from dept
      ) m
order by m.empno desc; 

-- from ()안에 넣은게 subquery or inline view라고함 가상테이블 만들고 ()m 하고
-- order by m.empno desc; 해서 정렬시키는것

-- 2. [대응] 되는 [컬럼]의 [개수]가 동일
--select empno , ename , job , sal from emp
--union
--select deptno, dname , loc from dept;
-- ORA-01789: query block has incorrect number of result columns
-- 컬럼의 갯수가 안맞음
select empno , ename , job , sal from emp
union 
select deptno , dname , loc , null from dept;
--null 들어가는데 null 넣거나 특정 입력값 넣어도된다. 보통은 null을 쓴다.
select empno , ename , job , sal from emp
union 
select deptno , dname , loc , 10 from dept;
---------------------------------------------------
-- 자바에서 제어문 끝난 느낌
-- 초급 개발자가 단일 테이블 대상으로 쿼리문장을 쓸수 있다.
-------------------------------------------------
-- 함수
-- 오라클 pdf 48 page 단일행 함수
/*
1.2.2 단일 행 함수의 종류 
1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN할 수 있다. 
2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN한다. 
3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를 
제외하고 모두 날짜 데이터형의 값을 RETURN한다. 
4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다. 
5) 일반적인 함수 : NVL, DECODE

*/
select initcap('the super man') from dual;
select lower('AAA') ,upper('aaa') from dual;
select ename , lower(ename) as ename from emp;

select *
from emp
where lower(ename)= 'king';

select length('abcd') from dual;

select concat('a','b') from dual;
-- a b를 합쳐라 concat으로 합치는게 좋을까 연산자로 합치는게 좋을까
-- 유연성은 연산자가 좋다 concat은 오버로딩안되잇으면 2개만 합쳐짐
select 'a' || 'b' || 'c' from dual;
select concat(ename,job) from emp;

--JAVA : substring
-- Oracle : substr

select substr('ABCDE',2,3) from dual; -- BCD
select substr('ABCDE' ,1,1) from dual; --A
select substr('ABCDE' ,3,1) from dual; --C

select substr('ABCDdsfgsdfgsecdsesedf',3) from dual;
/*
사원테이블에서 ename 컬럼의 데이터에 대해서 첫 글자는 소문자로 나머지 글자는 대문자로
출력하되 하나의 컬럼으로 만들어 출력하고 컬럼의 별칭은 fullname 하고  첫 글자와 나머지
문자사이에는 공백 하나를 넣어 출력
단 위에서 배운 함수만 사용
*/

select lower(substr(ename,1,1)) from emp;
--select substr(ename,2) from emp;
select substr(ename, 2,length(ename)) from emp;



select lower(substr(ename,1,1)) || ' ' || upper(substr(ename,2,length(ename)))
as fullname
from emp;


select lpad('ABC', 10, '*') from dual;
select rpad('ABC', 10, '*') from dual;
select rpad('ABC', 10, '&') from dual;

-- 사용자의 비번 hong1004 또는 k123
-- 화면에 출력하는데 앞 두글자만 보여주고 나머지는 특수문자  처러
select substr('hong1004', 1,2) from dual;
select rpad(substr('hong1004', 1,2),length('hong1004'),'*' ) from dual;
select rpad(substr('k123', 1,2),length('k123'),'*' ) from dual;

--emp 테이블에 적용하면
select rpad(substr(ename, 1,2),length(ename),'*' ) from emp;

select rtrim('MILLER','ER') from dual;
select ltrim('MILLLLLLLLLLLLER','MIL') from dual;
-- L다잡아서 ER나옴

select '>' || rtrim('MILLER     ',' ') || '<' from dual;
-- 우측 공백을 찾아서 제거해라

--치환함수
select ename , replace(ename,'A','와우') from emp;

-------------------------------------------------------------------
--문자열 함수 end
-------------------------------------------------------
-- 숫자함수
-- round(반올림 함수)
-- trunc(절삭함수)
-- mod() 나머지 구하는 함수
-- -3 -2 -1 0 1 2 3
select round(12.345,0) from dual; -- 정수부만 남겨라 12가 남음
select round(12.567,0) from dual; -- 정수부만 남겨라 13이 남음
select round(12.345,1) from dual; -- 소수이하 첫번째 자리만 남겨라 12.3
select round(12.567,1) from dual; -- 소수이하 첫번째 자리만 남겨라 12.6
select round(12.345,-1) from dual; -- 소수이하 첫번째 자리만 남겨라 10
select round(15.345,-1) from dual; -- 20 이유 15를 반올림하니

select round(15.345,-2) from dual; -- 0 백의 자리가 되니

select trunc(12.345,0) from dual; -- 12
select trunc(12.567,0) from dual; -- 12
select trunc(12.345,1) from dual; -- 12.3
select trunc(12.567,1) from dual; -- 12.5
select trunc(12.345,-1) from dual; -- 10
select trunc(15.345,-1) from dual; -- 10

select trunc(15.345,-2) from dual; -- 0

-- 나머지
select 12/10 from dual; --1.2
--나머지 함수
select mod(12,10) from dual;

select mod(0,0) from dual;
-------------------------------------------
--날짜함수 : 연산가능
select sysdate from dual; --게시판 글쓸때 입력날짜 시간 같은거 할때 사용
--POINT
-- 1. Date + Number >> Date
-- 2. Date - Number >> Date
-- 3. Date - Date >> Number (일수로 나옴)

select sysdate + 100 from dual; --2025-12-19 15:50:05
select sysdate + 1000 from dual; --2028-06-06 15:50:22
select sysdate - 1000 from dual; --2022-12-15 15:50:39
select hiredate from emp;

select months_between('2022-01-01','2020-01-01') from dual; -- 개월의 차 

select months_between(sysdate, '2020-01-01') from dual; --68.31165957287933094384707287933094384707
select trunc(months_between(sysdate, '2020-01-01'),0) from dual; --68

--초급 개발자의 실수
--select .. where hiredate = '2025...'
--select '2025-01-01' + 100 from dual; -- select를 쓰면 문자열로봄 ORA-01722: invalid number
--답 함수를 사용해서 날짜 타입 변환 ( 조건 문자열이 형식이 있어야 한다 )
select to_date('2025-01-01') + 100 from dual; --2025-04-11 00:00:00

/*
    사원테이블에서 사원들의 입사일에서 현재 날짜까지의 근속월수를 구하시오
    사원이름 입사일 근속월수 출력
    단 근속월수는 정수만 출력 반올림 하지말기
*/
select ename, hiredate, trunc(months_between(sysdate,hiredate),0) as 근속월수 from emp;
-- select ename, hiredate, trunc(months_between(sysdate,hiredate) from emp; 기본이 0이라서 이래도 작동한다

----------------------------------------------------------
--문자함수, 숫자함수, 날짜함수 기본 end
-------------------------------------------------------
--변환함수
--오라클 데이터베이스 데이터 유형 : 숫자 , 문자열 ,날짜

-- to_char() 숫자 -> 형식문자 (1000000 -> $100,000 > format)
-- to_char() 날짜 -> 자바의 simpledateformat과 같다. -> 형식문자 ( '2025-01-01' ->
--  2025년01월01일 > format

-- to_date() : 문자열(날짜 형식) -> 날짜
-- select ('2025-01-01') + 100 format dual;

-- to_number() : 문자열 형식 숫자 -> 숫자(자동 형변환)
select '100' + 100 from dual; -- 200 암시적 형변환
select to_number('100') + 100 from dual; -- 컴파일러가 자동으로 붙인거 명시적형변환


-- format 표를 보고 찾아서 ( 오라클 pdf p70-71)
select sysdate , to_char(sysdate,'YYYY') || '년' as yyyy ,
to_char(sysdate,'YEAR') || '년' as yyyy ,
to_char(sysdate,'MM') ,
to_char(sysdate,'DD'),
to_char(sysdate,'DAY') 
from emp;



-- 입사일이 12월인 사원의 사번 , 이름 , 입사일 ,입사년도 , 입사월 출력
--select *
--from emp
--where to_char(hiredate, 'MM') ='12';

select empno, ename, hiredate , to_char(hiredate, 'YYYY') , to_char(hiredate, 'MM')
from emp
where to_char(hiredate, 'MM') ='12';

----------------------------
show user; --kosa 에서 hr로 변경함 우측상단에
-- USER이(가) "HR"입니다.
select *  from employees;


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
       
       -- 실행순서있다면 select 한 컬럼명을 사용


/*
1. EMPLOYEES 테이블을 이용하여 다음 조건에 만족하는 행을 검색하세요. 
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

이하 kosa로 다시 변경함
----------------------------------

select 'A' as a, 10 as b , null as c, empno
from emp;
---------------------------------------------------------
-- 기본 select (select from where order by)
-- 문자열 함수 > 숫자함수 > 날짜함수 > 변환함수( 이쁘게 출력하기) to_char

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
​


