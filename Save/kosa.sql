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
select * from ut;
select * from uta;
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
ORDER BY department_id ASC, salary DESC ; 
----------------------------------- Sep 10 DB Day 1 end--------------------------------------------------------
----------------------------------- Sep 11 DB Day 2 start ----------------------------------------------------
--이하 kosa로 다시 변경함
----------------------------------

select 'A' as a, 10 as b , null as c, empno
from emp;
---------------------------------------------------------
-- 기본 select (select from where order by)
-- 문자열 함수 > 숫자함수 > 날짜함수 > 변환함수( 이쁘게 출력하기) to_char() , to_date() , to_number()
---------------------------------------------------------------------------
show user;
/* USER이(가) "KOSA" 입니다.
-------------------------------------------------------------------------------
SELECT USER FROM dual; 이게 오라클 공식 유저 확인 명령어 
DB
접속 :  deaver ->  Oracle Server - 
dbeaver (드라이버)설치 > IP : 1521 > SID (xe) > 계정 , 비밀번호
실무는 그냥 서버 원격 접속만하지 로컬아님 
JAVA > Oracle 접속 역시 위와 동일한 방식으로 접속함
-----------------------------------------------------------------------
SQL 변수 제어문 개념 없다
PL-SQL 변수 제어문 > 트리거 커서 프로시져 함수

일반함수
nvl () > null 을 처리하는 함수

decode > java if 문 > 통계 데이터 분석 > pivot , cube , rollup 다차원 분석 함수
case > java switch문
두 놈은 프로그래밍적 성격이 강하다.


상식

OLTP : 네이버 , 카카오 (요기) 실시간 데이터 처리
OLAP : 분석


*/
--일반함수
select comm , nvl(comm,0) from emp;

create table temp01
(
    id number(6), -- 정수 자리
    job nvarchar2(20) -- unicode(2byte) 로 모든 글자를 2바이트로 간주 한글도 20자 들어간다.
);

desc temp01;

/*
insert into temp01(id,job) values(100,'IT');
insert into temp01(id,job) values(200,'SALES');
insert into temp01(id,job) values(300,'MANAGER');
insert into temp01(id) values(400);
insert into temp01(id,job) values(500,'MANAGER');
commit;
drop table temp01;
*/
select * from temp01;

select id , decode(id,100,'아이티',
                      200,'영업',
                      300,'관리팀',
                           '기타부서') as 부서이름
from temp01;

select * from temp01;

select id, decode(nvl(id,0),100,'아이티',
                            200,'영업',
                            300,'관리팀',
                                '기타부서') as 부서이름
from temp01;




select * from emp;

select empno , ename, deptno , decode(deptno,10,'인사팀',
                                             20,'관리팀',
                                             30,'회계팀',
                                             40,'일반부서',
                                             'ETC') as 부서이름
from emp;

/*
  char(10)      고정길이 문자열 한글 5자, 영문자 10자 고정길이 char > '남' '여'
  nchar(10)     char의 가변길이버전
  varchar2(10)  가변길이 문자열 한글 5자, 영문자 10자
  navrchar2(10) 가변길이 문자열 한글10자, 영문자 10자
*/
-- 주민번호같이 고정된거는 캐릭터 써라

create table t_emp2(
    id number(2),
    jumin char(7) -- 고정길이 문자열
);
/*
insert into t_emp2(id, jumin) values(1,'1234567');
insert into t_emp2(id, jumin) values(2,'2234567');
insert into t_emp2(id, jumin) values(3,'3234567');
insert into t_emp2(id, jumin) values(4,'4234567');
insert into t_emp2(id, jumin) values(5,'5234567');
commit;
drop table t_emp2;
*/
select * from t_emp2;
/*
t_emp2 테이블에서 id, jumin 데이터를 출력하되 jumin 컬럼의 앞자리가 1이면 남성, 2 이면 여성
3이면 중성 그외는 기타 하고 출력하세요( 컬럼명은 성별)
*/

select id, decode(substr(jumin,1,1), 1,'남성',
                                     2,'여성',
                                     3,'중성',
                                     '기타') as 성별
from t_emp2;


/*
응용문제 : hint if문 안에 if문
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이라면 HELLO 문자 출력하고
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이 아니라면 WORLD 문자 출력하고
부서번호가 20번인 사원이 아니라면 ETC라는 문자를 출력하세요
EMP 테이블에서
ps.decode는 오라클 독자문법이어서 안쓰게되는 추세\
******************
case 가 표준임
******************************
*/
-- decode 사용해서
select ename, deptno,
       decode(deptno,20,decode(ename,'SMITH','HELLO','WORLD'),'ETC') as "컬럼" --depno 가 20이면 DECODE를 if문 태울것이다
from emp;
/* 
CASE (PL-SQL)

CASE 조건식 WHEN 결과1 THEN 출력1
           WHEN 결과1 THEN 출력2
           WHEN 결과1 THEN 출력3
           WHEN 결과1 THEN 출력4
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

select '0' || to_char(zipcode) , case zipcode when 2 then '서울'
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
       end 급수, empno, ename, sal
from emp;
/*
decode 는 오라클이 가지는 특수한 문법
case 표준 구문 (권장) > pivot 함수
---------------------------------------------------------------------
문자열함수, 숫자함수 , 변환 to_format( to_char to_number to_date 등등 이쁘게 보일려고 formatting 하는것), 일반함수( nvl, decode, case)
---------------------------------------------------------------------
nvl , to_char , case

[집계함수]
오라클.pdf p.76 pdf내에선 68

1. count(*) > row수 , count(컬럼) >> 데이터 건수
2. sum()
3. avg()
4. max()
5. min()
기타등등

집계함수
1. 집계함수는 group by 절과 같이 사용
2. 모든 집계함수는 null 값 무시
3. select 절에 집계함수 이외에 다른 컬림이 오면 반드시 그 컬름은 group by 절에 명시

*/
select count(*) from emp; -- row 수 체크 14건

select count(empno) from emp; -- 데이터 건수 14개

select count(comm) from emp; -- 6 집계함수는 null을 보지않기에

select comm from emp;
select * from emp;

select count(nvl(comm,0)) from emp; -- 14

--급여의 합
select sum(sal) from emp;-- 29025
select avg(sal) from emp; -- 2073.214285714285714285714285714285714286
select trunc(avg(sal),0) from emp; --2073


--사장 우리회사 총 수당
select sum(comm) from emp; --4330

select comm from emp;
--3500
--0
--300
--200
--30
--300
--3500
select (30+300+200+300+0+3500) / 6 from dual; -- 오라클은 출력기능없어서 가상으로 담는것
-- 721.66666 나옴
select (30+300+200+300+0+3500)  from dual; -- 4330 null을 빼고 하는것

--수당의 평균
select trunc(avg(comm)) from emp; --721
select (30+300+200+300+0+3500) / 6 from dual; --721.666666

select (30+300+200+300+0+3500) / 14 from dual; -- 309.28571428

-- null 값을 포함하느냐 마느냐의 문제 결국 회사에 따라 둘다 맞을수도 있고 틀릴수도 있다
-- 노사측은 전체사원수 null 포함
-- 경영측은 받는 사람수 null 제외
select trunc(avg(nvl(comm,0))) from emp; --309 사원수

select max(sal) from emp;
select min(sal) from emp;

-- 한건한건에 하나의 값만 가지면 에러 안터짐
select sum(sal), avg(sal), max(sal), min(sal), count(*), count(sal)
from emp;

-- select empno , count(empno) 
-- from emp;
-- ORA-00937: not a single-group group function
-- 사원별로 묶겠다는 의도지만 group by 안해서 작동안함

-- 부서별 평균 급여를 구하세요.

-- select deptno , avg(sal) from emp; 
--depno는 여러건이고 avg(sal)은 한건 그럼 avg(sal)을 어디다 배치할껀데 그래서 에러

select deptno, trunc(avg(sal),0)
from emp
group by deptno;

-- 직종별 평균 급여를 구하세요
select job as 직종 ,trunc(avg(sal),0) as 평균월급 
from emp 
group by job;

select job as 직종 ,trunc(avg(sal),0) as 평균월급, count(job), max(sal), min(sal) 
from emp 
group by job; -- 그룹화해서 묶어놨으니 에러 안나오는것

/*
  group
  
  distinct 컬럼명1, 컬럼명 2
  
  order by 컬럼명1, 컬럼명 2
  
  group by 컬럼명1, 컬럼명 2
    
*/
-- 부서별 ,직종별 급여의 합
select deptno, job, trunc(sum(sal),0) as 총합, count(sal) 
from emp 
group by deptno , job 
order by deptno;
-- group 을 deptno 로 먼저 그룹화해서 뭉치게 하고 각 뭉친 그룹안에서 job으로 묶음
-- deptno 로 순서별로 묶음

/*
실행순서 
4  select
1  from
2  where
3  group by
5  order by

*/

-- 직종별 평균 급여가 3000 이상인 사원의 직종과 평균 급여를 출력
/*
select job, avg(sal)
from emp
where avg(sal)>3000
group by job;
 from 절로 emp 가져오고 where 에서 sal이 선택되지도 않아서 계산불가
 실행 순서의 문제...
 조건을 group by > having(조건절)
 */
select job, avg(sal)
from emp
group by job
having avg(sal) >=3000;
--group by 절이 있어야 having 으로 연산 걸기 가능

-- from 의 조건절 where
-- group by 의 조건절 having (집계된 데이터 조건)
/*
단일 테이블 기준 실행 순서
5   select
1   from
2   where
3   group by
4   having
6   order by
*/

/* 
사원테이블에서 직종별 급여합을 출력하되 수당은 지급 받고 급여의 합이 5000 이상인 
사원들의 목록을 출력하세요  (comm 0인 놈도 받는 것으로 ....)
급여의 합이 낮은 순으로 출력하세요 
*/
select job, sum(sal) as sumsal
from emp
where comm is not null
group by job
having sum(sal) >= 5000
order by sumsal asc;

select deptno, sum(sal+comm) as 급여
from emp
where comm is not null
group by deptno 
having sum(sal+comm)>= 5000
order by 급여 asc;

/* 사원테이블에서 부서 인원이 4명보다 많은 부서의 부서번호 ,인원수 , 급여의 합을 출력하세요 */
select deptno, count(*) as 인원, sum(sal) as 합 
from emp
group by deptno 
having count(*) >4;

select  deptno, sum(sal) as sumsal, count(deptno)
from emp
group by deptno
having count(deptno) >4;



/* 사원테이블에서 직종별 급여의 합이 5000를 초과하는 직종과 급여의 합을 출력하세요
단 판매직종(salesman) 은 제외하고 급여합으로 내림차순 정렬하세요 */

select job, sum(sal) as sumsal 
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by sumsal desc;

select job, sum(sal) as 급여
from emp
where job != 'SALESMAN'
group by job
having sum(sal) >5000
order by 급여 asc;




​
/*
HR

select user from dual;
show user;
select * from employees;

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
-- kosa 전환
------------------------------------------------------------------------
--단일 테이블 END--
--select from where group by  having order by
-------------------------------------------------------------------------
/*
JAVA 
class Member (private int empno , prevate String ename)

DB
create table Member (empno number ,enmae varchar2(20))

java 1건
Member member = new Member(2000, "홍길동");

db 1건 
insert into member(empno, ename) values(2000, '홍길동');

다수의 데이터 1건 이상의 데이터

db 
select * from emp where deptno =10

Java
List<Member> list = new ArrayList();
list.add(new Member())
list.add(new Member())

db 
select * from emp where deptno =7788

java
Member memeber = new Member();
*/

------------------------------------------------------------------
--여러개의 테이블에서 원하는 데이터 가져오기
--신입 개발자 (JOIN)
--다중 테이블로부터 데이터 검색  오라클.pdf  85page 실제 p.78
/*
1. Cartesian Product 모든 가능한 행들의 Join 
2. Equijoin Join 조건이 정확히 일치하는 경우 사용(일반적으로PK와 FK사용) 
3. Non-Equijoin Join 조건이 정확히 일치하지 않는 경우에 사용(등급,학점) 
4. Outer Join Join 조건이 정확히 일치하지 않는 경우에도 모든 행들을 출력 
5. Self Join 하나의 테이블에서 행들을 Join하고자 할 경우에 사용 
6. Set Operators 여러 개의 SELECT문장을 연결하여 작성한다.
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
1. 등가조인(euqi join)
> 원테이블과 대응대는 테이블에 있는 컬럼의 데이터 1:1 매핑
> 오라클 문법 vs sql 안시문법(ANSI)
ansi가 표준임
*/
select *
from m , s 
where m.m1 = s.s1;
-- m과 s에서 m1 s1이 같다면 다가져와
select m.m1 , m.m2, s.s2
from m , s 
where m.m1 = s.s1;

--ANSI 문법 오라클 문법이 가독성이 떨어져서 안시가 표준이기도하고 좋다.
select m.m1 , m.m2, s.s2
from m join s --inner join
on m.m1 = s.s1;

select * from emp;

-- 사원번호, 사원이름, 부서번호, 부서이름을 출력하세요.
select * from emp;
select * from dept;

-- selct * 로 전부다 찍어버리는게 조인에서는 편하다
select *
from emp join dept
on emp.deptno = dept.deptno;

select emp.empno , emp.ename, emp.deptno , dept.dname
from emp join dept
on emp.deptno = dept.deptno;


-- 현업 ( 테이블에 가명칭을 줘서 그걸로 접근)
select e.empno , e.ename, e.deptno , d.dname
from emp e join dept d
on e.deptno = d.deptno;

-- join select * 하고 ... 실행다음 .. 칼럼을 골라서 사용

select s.s1 , s.s2 ,x.x2
from s join x
on s.s1 = x.x1;

-- 테이블 3개 , 4개
-- oracle 문법
select *
from m, s, x
where m.m1 = s.s1 and s.s1 = x.x1;
-- ansi 문법
select *
from m join s on m.m1 = s.s1
       join x on s.s1 = x.x1;
      
select m.m1 , m.m2 , s.s2 , x.x2
from m join s on m.m1 = s.s1
       join x on s.s1 = x.x1;
       
----------------------------------------------------
--hr
select user from dual;
select * from employees;
select * from departments;
select * from locations;

select count(*) from employees; --107 사원

-- 사번 , 이름 (last_name) , 부서번호, 부서이름을 출력
select *
from employees e join departments d
on e.department_id = d.department_id;

select e.employee_id , e.last_name , e.department_id , d.department_name
from employees e join departments d
on e.department_id = d.department_id; --106건
--원인
-- 178	Kimberely	Grant 가 department_id 가 null
select * from employees where department_id is null;

-- 사번 , 이름 , 부서번호, 부서이름 , 지역코드 , 도시명을 출력
-- 일단 테이블 3개 조인

select *
from employees e join departments d on e.department_id = d.department_id
                 join locations l on d.location_id = l.location_id;

-- 등가 조인 컬럼과 컬럼이 같다 equijoin (컬럼과컬럼이 같다)

select e.employee_id, d.DEPARTMENT_NAME
from employees e join departments d on e.department_id = d.department_id
                 join locations l on d.location_id = l.location_id;
                 
-- Non-Equi join(비등가 조인) 1:1 매핑되는 컬럼이 없다
-- 비등가 문법 (X) >> 등가조인
-- 개념만 존재

-- kosa 계정
select user from dual;
select * from emp;
select * from salgrade;

--1	700	    1200
--2	1201	1400
--3	1401	2000
--4	2001	3000
--5	3001	9999
-- sal 이 1250dls martin 의 등급은 2등급
select *
from emp e join salgrade s
on e.sal between s.losal and s.hisal;

select e.empno , e.ename , e.sal , s.grade 
from emp e join salgrade s
on e.sal between s.losal and s.hisal;

-- outer join ( equi 조인 선행되고 > 남아있는 데이터를 가져오는 방법
-- 주종관계 (주인이되는 쪽에 남아 있는 데이터를 가져오는 방법)
-- 1. left outer join
-- 2. right outer join
-- 3. full outer join(left, right 를 union 한것)

--equi 선행되고 남는 쪽의 데이터
select *
from m left outer join s
-- m 이 주인
on m.m1 = s.s1;
-- 등가조인하고 누가 메인인지 확인하고 남는것 가져옴 그리고 빈곳은 다 null

select *
from m right outer join s
on m.m1 = s.s1;

select *
from m full outer join s
on m.m1 = s.s1;
------------------------------------------
-- hr로 이동

select count(*) from employees; --107 사원
-- null 있어서 join 만족안하는 사원
select * from employees where department_id is null;
--사번 , 이름 (last_name) , 부서번호 , 부서이름을 출력하세요
select e.employee_id , e.last_name , e.department_id , d.department_name
from employees e join departments d
on e.department_id = d.department_id;  --106건


--아래 쿼리가 Kimberely 포함한 107건

select e.employee_id , e.last_name , e.department_id , d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id; 
-- 널로 빠졌으니 employees 주로해서 left outer join 하면 107건됨
--null 데이터를 항상 확인하자


-------------------------------------------------------
-- kosa 계정으로 이동
-- self join
-- 자기참조 (문법 x) -> 의미만 존재 -> 등가조인
-- 하나의 테이블에서 특정 컬럼이 자신의 테이블에 있는 특정 컬럼을 참조하는 경우를 
-- 셀프 조인이라고 한다.

-- 사원 테이블, 관리자테이블
-- 관리자도 사원중에 한명 > 중복된 데이터 > 무결성의 문제
-- 포인트 : 테이블에 가명칭 ... 하나의 테이블을 여러개로 사용가능
select * from emp; --14명

select *
from emp e join emp m  -- 가상테이블해서 같은걸 2번 메모리에 올린셈
on e.mgr = m.empno; -- 문제는 13명만 나옴

--14명
select count(*) from emp where mgr is null;
select *from emp;

select e.empno, e.ename, m.empno, m.ename
from emp e join  emp m  -- 가상테이블해서 같은걸 2번 메모리에 올린셈
on e.mgr = m.empno; --13 명만 나옴
------------------------------------------------------------
select e.empno, e.ename, m.empno, m.ename
from emp e left outer join  emp m  -- 가상테이블해서 같은걸 2번 메모리에 올린셈
on e.mgr = m.empno; --14명 나옴

--------------------------------------
select * from emp , dept; -- 조건이 없어요 
select * from emp cross join dept; -- 56 개 나옴 카테시안의 곱. 조합가능한 모든수를 곱한거 행 * 행임

-- 14건 * 4 >> 56
------------------------------------------------
-- ETC
-- NATURAL JOIN  이름이 같은건 무조건 조인거는 방식임
-- equi join과 동일한 역활
-- 두테이블 [동일한 이름]을 가는 [컬럼은 모두 조인]

select empno , ename , deptno , dname
from emp natural join dept; -- 이름이 같은건 무조건 조인거는 방식임

-- join ~using
-- natural join 단점은 동일한 이름을 가지는 컬럼은 모두 조인을 걸어버림
-- using문을 사용하면 컬럼을 선택해서 조인

select empno , ename , deptno , dname
from emp join dept using(deptno); -- 14개 on절 빠짐

------------------------------------------------------------------
--KOSA 계정에서 하세요
--JOIN 시험
--emp , dept , salgrade

-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.


SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO;

-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을
-- 출력하라.



SELECT E.ENAME, E.JOB, D.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE  D.LOC='DALLAS';
​

-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.



SELECT E.ENAME, D.DNAME
FROM EMP E  join DEPT D  on D.DEPTNO=E.DEPTNO
WHERE  E.ENAME LIKE '%A%';


-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라.



SELECT E.ENAME, D.DNAME, E.SAL 
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.SAL>=3000;

-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라.



SELECT E.JOB, E.ENAME, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.JOB='SALESMAN';
​

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
-- WHERE  E.DEPTNO<=20 당장은 맞으나 다른값 들어오면 틀어짐
WHERE E.DEPTNO IN (10,20)  -- e.deptno = 10 or 
ORDER BY E.DEPTNO ASC,  E.SAL DESC;

-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)

SELECT E.EMPNO as "사원번호", E.ENAME as "사원이름" , M.EMPNO as "관리자번호", M.ENAME as "관리자이름"
FROM EMP E  left outer join EMP M
on e.MGR = m.EMPNO;

--------------------------------------------------------
--subquery (SQL 꽃 ... 만능해결사)

-- 함수 > 단일 테이블
-- 다중 테이블 ( join, union) 
-- 해결안되요 원하는 데이터를 가진 테이블이 없다.
-- 가상  테이블 > subquery ( in line view)

-- 사원테이블에서 사원들의 평균 월급보다 더 많은 월급을 받는 사원의 사번, 이름 , 급여 출력

-- 1. 평균 월급
select avg(sal) from emp; --2073.214

select *
from emp
where sal > 2073;

-- 쿼리 두개 쓴것임 게다가 첫 쿼리값 기억해서 하는거
-- 쿼리 통합해보자
select *
from emp
where sal > (select avg(sal) from emp);
-- 서브쿼리 쿼리안에 쿼리가 들어갔다.

/*
스칼라 서브쿼리 : select 절 : 단일컬럼 , 단일행을 반환 (1개의 값)
인라인 뷰      : from   절 : view 처럼 임시테이블 (가상테이블) .....
중첩 서브쿼리   : where  절 : 다중 컬럼 또는 다중의 행을 반환
*/

/*
1. single row subquery : 실행 결과가 단일컬럼에 단일로우 (한개의 값) 
ex) select sum(sal) , avg(sal), max(sal)
연산자 : = , != , < , >

서로 연산자가 다르기 때문에 구분한다.
2. multi row subquery  : 실행 결과가 단일컬럼에 그 값이 여러개
ex) select deptno from dept; 4건
연산자 : IN , NOT IN , ANY , ALL
ALL : sal > 1000 and sal > 4000 and   :   즉 모든것을 만족해라 
ANY : sal > 1000 or sal > 4000 or     :   즉 어떤것이 와도 ok
ALL (모든 것을 만족)    : sal > 1000 and sal > 4000 and
ANY (어떤 것이 와도 OK) : sal > 1000 or sal > 4000 or

문법) 
    1. 괄호안에 있어야 한다. (쿼리문)
    2. 단일 컬럼을 가져야한다 ( 멀티컬럼을 쓰면 유추하기 힘들어짐)
        select max(sal), min(sal) from emp 이러면 나중에 헷갈림 쓰지말자
    3. 서브쿼리는 단독 실행 가능
    
    실행순서 : 서브쿼리가 먼저 실행되고 그 결과를 가지고 메인(주)쿼리가 실행된다
*/

--사원테이블에서 jones 의 급여보다 더 많은 급여를 받는 사원의 사번, 이름, 급여를 출력하세요.


select sal from emp where ename='JONES';

select e.empno , e.ename, e.sal 
from emp e
where sal > 2975;

---------------- 합친것----------------
select empno , ename, sal 
from emp
where sal > (select sal from emp where ename='JONES');
-- 일단 join 하다하다 안되면  이방식 또한 문장 2개로 한담에  합치는 방식이 직관적
 -------------------------------------
 
-- 부서번호가 30번인 사원과 같은 급여를 받는 사원의 모든 정보를 출력하세요
select sal from emp where deptno=30; -- multi row
-- 
-- select *
-- from emp
-- where sal = (select sal from emp where deptno=30);
-- ORA-01427: single-row subquery returns more than one row
  
 select *
 from emp
 where sal in (select sal from emp where deptno=30);
-- where sal=1600 or sal = 1250 or sal = 3000 ;

-- 부하직원이 있는 사원의 사번과 이름을 출력하세요
-- 내 사번이 mgr 컬럼에 있으면 나는 최소 1명 이상의 부하직원을 가진다.
select mgr from emp; -- 멀티로

select *
from emp
where empno in (select mgr from emp);

-- 부하직원이 없는 사원의 모든 정보 출력

--select *
--from emp
--where empno not in(select mgr from emp);
-- where impno !=  7902 and empno != 7698 and null 널들가게되니 널된것


select *
from emp
where empno not in(select nvl(mgr,0) from emp);


-- 20번 부서의 사원 중에서 가장 많은 월급을 받는 사원보다 더 많은 급여를 받는 
-- 사원의 사번, 이름, 급여, 부서번호 출력
select max(sal) from emp where deptno=20;  --싱글로

select empno , ename , sal
from emp
where sal > (select max(sal) from emp where deptno=20);


-------------------------------------------------------------
--스칼라 서브 쿼리  딱봐도 복잡하니 아래와 같이 조인문쓰는걸 권장
select e.empno , e.ename , e.deptno , 
       (select d.dname from dept d where d.deptno = e.deptno) as dept_name
from emp e
--where e.sal >= 3000;

-- 위 와 같은 JOIN 으로 해결 ....
--아래와 같은 JOIN 을 사용해라 
select *
from emp e join dept d
on e.deptno = d.deptno;

-- 두방식의 속도는 비슷하다고 한다 그러니 아래쪽으로 해라
------------------------------------------------------------------------------
-- 자기 부서의 평균월급다 더 많은 월급을 받는 사원의 사번 , 이름 , 부서번호 , 부서별 평균월급을 출력하세요
-- 만약에 부서와 부서별 평균월급 담고 있는 테이블 제공
--in line view

select e.empno,e.ename,e.deptno,e2.avf
from emp e join
            ( select deptno,avg(sal) as avf from emp group by deptno) e2
on e2.deptno = e.deptno
where e.sal > e2.avf;

select e.empno , e.ename, e.deptno , e.sal , s.avgsal
from emp e join 
       (select deptno , trunc(avg(sal),0) as avgsal from emp group by deptno) s
on e.deptno = s.deptno
where e.sal > s.avgsal;
--------------------------------------------Sep_11_end-------------------------
--------------------------------------------Sep_12_start-----------------------
-- 서브 쿼리 
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
-- 'BLAKE'는 빼고 출력하라. --문제를 위한 문제
SELECT DEPTNO  FROM EMP WHERE ENAME='BLAKE';

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
-- 실무에서는 맥스 쓰는게 편함
-- max 쓰는경우
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
             FROM EMP
             WHERE DEPTNO=30);
 -- all 쓰는 경우
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > ALL(SELECT SAL
                FROM EMP
                WHERE DEPTNO=30)
 
--where sal > 1600 and sal > 1250 and sal > 2850 and sal > 1500 and sal > 950
 
 
--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라.
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO    -- = 이 맞는데  IN
                FROM DEPT
                WHERE LOC='DALLAS');
                -- not in은 null 값있으면 전부 null
 
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
 
--11. 커미션을 받는(is not null) 사원과 부서번호, 월급이 같은 사원의
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

---------------------------------------------------------------------
-- 기업에서 원하는 신입 DB 역량
/*
5 select
1 from  
2 where
3 group by
4 having
6 order by
+
기본함수 (문자, 숫자 ,날짜 , 변환(to_) , 일반(decode, case) 집계함수 
+
다중테이블 (join, union) ***
+
subqury
+
DML(insert, update, delete)
*/

/*
truncate 데이터의 공간까지 없앰(데이터값빼고 할당된 공간까지 줄임)
 1 DDL (데이터 정의어) : create , alter , drop , + truncate , rename , modify
 2 DML (데이터 조작어) : insert , update , delete (트랜잭션 : commit, rollback)
 3 신입 취업 : select , insert .. 점심 ... select(O) insert , update ,delete (X)
    3.1 commit , rollback 수행하지 않아서
    3.2 log write (기록) 
        DML -> log write 선행 > DISK 반영 > log 파일이 가득찰수 있다. > write(x) > dml(x)
        해결방안 log back up > log 삭제
 4 DQL : select
 5 DCL : 제어 : 관리자가 권한을 grant , revoke 한다.
 6 TCL : 트랜잭션 commit , rollback , savepoint
 
*/

----DML
--1 . insert
SELECT * FROM tab; -- 접속 계정 KOSA 볼수 있는 테이블 목록
select * from tab where tname='BOARD';
select * from tab where tname='EMP';

CREATE TABLE temp (
	id NUMBER PRIMARY KEY , -- NOT NULL
	name varchar2(20) 
);
-- 1.1 
INSERT INTO temp(id,name)
values(100,'홍길동');
SELECT * FROM temp;

-- 의사결정
COMMIT;
-- 실반영

--1.2 컬럼목록을 생략할수 있다. 하지만 가독성 떨어지니 하지말자
insert into temp
values(200, '김유신');

select * from temp;
--100	홍길동
--200	김유신
rollback;
--100	홍길동

--1.3 문제 발생

--insert into temp(name)
--values('아무게');
--ORA-01400: cannot insert NULL into ("KOSA"."TEMP"."ID")

insert into temp(id,name)
values(100,'개똥이');
--ORA-00001: unique constraint (KOSA.SYS_C007000) violated 
-- 유니크 제약 걸어놨는데 100 key(id값 100 이미 할당된거에 또 들가니까)

insert into temp(id)
values(200);

select * from temp;
--100	홍길동
--200	null


commit;
---------------------------------------------------------

-- TIP
-- SQL 프로그래밍 적인 요소가 없다( 변수 , 제어문불가능)
-- PL-SQL 변수 , 제어문 ...

create table temp2(id varchar2(50));

desc temp2;

--PS_SQL
--JAVA : for(int i = 0  ; i < 100 ; i++){}
-- 1..100 = 자바의 i< 100 과 같다
/* 이놈은 비긴부터 엔드까지 잡고 실행하고 주석쳐서 다음꺼해야됨
BEGIN 
	FOR i IN 1.. 100 LOOP 
		INSERT INTO temp2(id) values('A' || to_char(i));
	END LOOP;
END;
*/

SELECT * FROM temp2;

CREATE TABLE temp3(
	memberid number(3) NOT NULL, -- not null 만거니 중복값 들어감 하지만 null 은 안받겠다
	name varchar2(10), --default로 null을 허용하겠다
	regdate DATE DEFAULT sysdate -- 인서트할때 날짜 안넣으면 **db 서버의 날짜** 값을 넣겠다
);
INSERT INTO temp3(memberid,name,regdate)
values(100,'홍길동','2025-09-12');

SELECT * FROM temp3;

COMMIT;

--날짜
INSERT INTO temp3(memberid,name)
values(200,'김유신');

SELECT * FROM temp3;

COMMIT;

----------------------------------------------------------------------------------------------
CREATE TABLE temp4(id number);
CREATE TABLE temp5(num number);

INSERT INTO temp4(id) values(1);
INSERT INTO temp4(id) values(2);
INSERT INTO temp4(id) values(3);
INSERT INTO temp4(id) values(4);
INSERT INTO temp4(id) values(5);
INSERT INTO temp4(id) values(6);
INSERT INTO temp4(id) values(7);
INSERT INTO temp4(id) values(8);
INSERT INTO temp4(id) values(9);
INSERT INTO temp4(id) values(10);
COMMIT;
SELECT * FROM temp4;
------------------------------------------------------------------------------------------------
 --대량 데이터 삽입하기
 -- temp4 있는 모든 데이터 한번에 temp5 넣고 싶다
 
 -- insert into 테이블명(컬럼리스트) values...
 -- insert into 테이블명(컬럼리스트) select 절
 
 INSERT INTO temp5(num)
 SELECT id FROM temp4;
 SELECT * FROM temp5;
 
 COMMIT;
 
 -- 대량 데이터 삽입하기
 -- 데이터를 담을 테이블도 없고 >> 테이블 구조 복제 ( 스키마 ) >> 데이터 삽입
 -- 제약사항 : 단 제약정보는 복제되지 않는다.
 -- 이놈은 commit; 안해도 된다.
 create table copyemp
 as 
    select empno , ename , job , sal
    from emp
    where deptno = 20;
    
select * from copyemp;
-- 이런것도 대량인서트
-- valuse 대신 select
-- 테이블도 없으면 이 방식
-------------------------------------------------------------------------

-- 1. insert ..... values >> insert ... select 절
-- 2. create table copyemp as select .... 
-- 퀴즈
create table copyemp3
as 
  select * from emp where 1=2; -- 항상 거짓이나 항상 트루값으로 해버리면 껍데기만 생성됨

select * from copyemp3;
--------------------------------[INSERT END]-------------------------------
-- update --
/*
update 테이블명
set 컬럼명 = 값 , 컬럼명 = 값...
where (subquery)

*/

select * from copyemp;

update copyemp
set sal = 0;

select * from copyemp;

rollback;

update copyemp
set sal = 1111
where empno = 7369;

select * from copyemp;

commit;

update copyemp
set sal = (select sum(sal) from emp);

select * from copyemp;

rollback;

update copyemp
set ename='AAA' , job = 'IT' , sal = 1000
where empno = 7369;

select *from copyemp
where empno=7369;

commit;
----------------------------------------------------------------------------
--update table명
--set 컬럼명 = 값
--where 컬럼명 = 값
----------------------------------------------------------------------------
-- [UPDATE END]----------------------------------------------------------
delete from copyemp;

select * from copyemp;

rollback;

delete from copyemp
where job = 'IT';

select * from copyemp;

commit;
---------------------------------------------------------------------------
-- DELETE END--
/*
개발자 (SQL)
1. CRUD ( create > insert  , read> select, update ,delete)
2. APP (JAVA) -> 표준 JDBC API -> DB 작업
3. insert , update , delete ,select (70%) : 함수 조인 서브쿼리..

JAVA DB에 있는 EMP 테이블접근해서 대해서 조회 , 수정 , 삭제...
MVC 패턴
Model      : DTO(VO) , DAO , SERVICE  > DAO(DB를 연결하고 CRUD 함수를 구현하는 객체)
View       : 화면을 보여줌 (1차 콘솔) > list.jsp list.html
Controller : 중앙통제역활 JAVA 파일 웹 사용가능하게 한것 > servlet (request, response)

DAO 클래스
기본적인 CRUD 함수 ...

1. 전체조회 : public List<Emp> getEmplist()[]; > select * from emp
2. 조건조회 : public Emp getEmpListByEmpno(int empno){} > select * from emp  where empno=7788 
3. 삽입    : public int insertEmp(Emp emp){} > insert into Emp(empno...) values(value...)
4. 삭제    : public int deleteEmp(int empno){} > delete from emp where empno=7788 
5. 수정    : public int updateEmp(Emp emp){} > update emp set ename ='aa'....

JAVA 5개 함수를 만들수 있다
DB   5개의 쿼리문을 만들수 있다.


전체조회

조건조회

insert

update

delete

*/

--tip
select * from tab;

select * from col;
--여러 접속한 kosa 계정이 간섭가능한 모든 col
select * from col where tname='EMP';

select * from user_constraints where table_name='EMP';
-- 제약정보 보기 "EMPNO" IS NOT NULL

--------------------------------------------------------------------------------
-- DDL
-- 가상컬럼(조합컬럼)
-- 학생성적테이블
-- 학번 , 국어 , 영어 , 수학 , 합계 , 평균
--       100    100   100   300
-- 수정  100    90     90   ?? 여기가 따로 수정안하면 300 유지되버림 
-- 합계 평균은 데이터 무결성이 깨진다
-- 데이터 무결성(조회) 국어점수가 변경되면  >> 평균과 합계둘다 변경되어야된다 
--                                        아니면 무결성 보장 문제 발생
create table vtab1(
    no1 number,
    no2 number,
    no3 number GENERATED ALWAYS as (no1 + no2) VIRTUAL
); --  네가 2개의 값을 넣으면 3번칸에서 가상으로 2개를 더해서 표시하겠다.

/*
INSERT INTO vtab1 (no1, no2)
values(100,50);

INSERT INTO vtab1 (no1, no2, no3)
values(100,50, 50);
SQL 오류: ORA-54013: INSERT operation disallowed on virtual columns
 가상테이블을 걸어놓으면 직접 넣을수 없다.
*/

select * from vtab1;
-- 100	50	150

update vtab1 set no1 =200;

select * from vtab1;
--200	50	250


commit;
------------------------------------------------------------------
-- 실무에서 사용하는 코드
-- 제품 ( 입고 ) : 분기별 데이터 추출(q1 q2 q3 q4)
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
/*
create table vtable2(
    no nunmber, --순번
    product_code char(4), --  제품코드 ( A001, B003)
    p_date char(8), -- 입고일 (20250101 , 20251010)
    p_qty number, -- 수량
    P_bungi number(1) GENERATED ALWAYS as (
              case when substr(p_date,5,2) in ('01' , '02' , '03') then 1
                when substr(p_date,5,2) in ('04' , '05' , '06') then 2
                when substr(p_date,5,2) in ('07' , '08' , '09') then 3
             -- when substr(p_date,5,2) in ('10' , '11' , '12') then 4
              else 4
              end
              ) VIRTUAL
);
*/
/*
insert into vtable2(p_date) values('20240101');
insert into vtable2(p_date) values('20240501');
insert into vtable2(p_date) values('20240901');
insert into vtable2(p_date) values('20241201');
commit;
*/
select * from vtable2 where p_bungi = 1;
select * from vtable2 where p_bungi = 2;
select * from vtable2 where p_bungi = 3;
select * from vtable2 where p_bungi = 4;

--------------------------------------------------------------
-- 테이블 생성 수정 문법
-- 1. 테이블 생성하기
create table temp6(id number);

desc temp6;
-- ID    NUMBER 


-- 2. 테이블 생성 후에 컬럼 추가하기
alter table temp6
add ename varchar2(20);

desc temp6;
--ID       NUMBER       
--ENAME    VARCHAR2(20) 

-- 3. 기존 테이블에 있는 컬럼이름 (ename -> username)  > TOOL 사용 문제 없다
alter table temp6
rename column ename to username;

desc temp6;
--ID          NUMBER       
--USERNAME    VARCHAR2(20) 

-- 4. 기존 테이블에 있는 기존 컬럼의 타입 크기 수정
-- 주의 크기를 줄이는건 안됨  
-- 오라클에선 modify라고함

alter table temp6
modify (username varchar2(2000));

desc temp6;
--ID          NUMBER         
--USERNAME    VARCHAR2(2000) 

-- 5. 기존 테이블에 있는 기존 컬럼 삭제
alter table temp6
drop column username; --데이터도 같이 날라감

select * from temp6;

-- 마우스 딸깍도 된다

-- 6. 고민
-- 테이블에 있는 데이터가 필요 없어요
-- delete from emp;
-- 할당된 공간에 적힌 값만 없애는거지 공간자체를 축소하는건 아님
-- emp 1mb -> 10만건 -> emp 100mb -> delete 10만건 -> 테이블 크기 -> 여전히 100mb

-- 6.1 truncate (테이블 데이터 삭제 : 크기도 줄인다 원크기)
-- truncate ( 단점 : where 사용 안됨)
-- truncate table emp;
-- 데이터 다 지우고 공간까지 축소된다.

-- drop table temp6; 깔끔하게 전부 날림
-- Table TEMP6이(가) 삭제되었습니다.
desc temp6;
--ORA-04043: temp6 객체가 존재하지 않습니다.

----------------------------------------------------------------------------
-- 기본 ddl end -----------------------------------

-- 데이터베이스 ( 무결성 ) > 제약 
-- 오라클 pdf p.143
/* 
1.2.2 데이터 무결성 제약 조건의 종류
 제 약 조 건 설 명
PRIMARY KEY(PK) 유일하게 테이블의 각행을 식별(NOT NULL 과 UNIQUE 조건을 만족)
FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다.
UNIQUE key(UK)  테이블의 모든 행을 유일하게 하는 값을 가진 열(NULL 을 허용)
NOT NULL(NN)    열은 NULL 값을 포함할 수 없습니다.
CHECK(CK)       참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정)

제약은 아니지만 default sysdate 참고로 알아야된다.
*/
/*
1. primary key (PK) : not null , unique ( 유일값 보장)
emp > empno > PK > where  empno = 7788 > 데이터 1건 보장
성능 ( pk > where empno =7788 > 성능 > index )

테이블당  pk 1개 (묶은것도 허용 1개 복합키임 어쨌던 1개를 벗어나면 안됨)

-- 언제 
1. create table 생성 PK 선행.....
2. create table 생성후 필요에 따라서 ( alter table add user_constraints ...)
3. select * from user_constraints;
DB - ar 속성 attribute identity
   ㄴ 



*/

select * from user_constraints where table_name = 'EMP';

create table temp7(
  --id number primary  key -- 단축사용법 비권장 오라클서버가 자동으로 키의 이름만드는데
                           -- 가독성(제약: SYS_C006977)이 안좋음
    id number constraint pk_temp7_id primary key,
    name varchar2(20) not null, -- 가치 없어서 굳이 이름 지정안하는거
    addr varchar2(50)
);

select * from user_constraints where table_name='TEMP7';

insert into temp7(id,name,addr) values(1,'홍길동','서울시 강남구');

-- insert into temp7(id,name,addr) values(1,'김유신','서울시 강북구');
-- ORA-00001: unique constraint (KOSA.PK_TEMP7_ID) violated

-- insert into temp7(id,name,addr) values('김유신','서울시 강북구');
-- ORA-00947: not enough values 

------------------------------------------------------------------------------
-- Unique (uk)
-- 테이블의 모든 행을 유일하게 하는 값을 가진 열(Null 허용)
-- 테이블 몇개 (컬럼 수 만큼)
-- ename not null unique 여러개 걸수 있으니 pk와는 같아보이지만 다름

create table temp8(
    --id number primary key --권장하지 않아요 (제약 SYS_C006977)
    id number constraint pk_temp8_id primary key,
    name varchar2(20) not null,
    jumin nvarchar2(6) constraint uk_temp8_jumin unique, --중복(null)
    addr varchar2(50)
);

insert into temp8(id,name,jumin,addr)
values(1,'김유신', '123456','한양');

insert into temp8(id,name,jumin,addr)
values(2,'유신', '123456','강남');
--ORA-00001: unique constraint (KOSA.UK_TEMP8_JUMIN) violated

insert into temp8(id,name,addr)
values(2,'유신', '강남');

select * from temp8;

insert into temp8(id,name,addr)
values(3,'유신', '강남');

select * from temp8;
-- null 은 중복체크 못해서 계속 받아준다.
commit;
------------------------------------------------------------------------------
-- 제약 테이블 만들고 나서 필요하면 적용
create table temp9(id number);

select * from user_constraints where table_name='TEMP9';

alter table temp9
add constraint pk_temp9_id primary key(id);
-- 만약 3개 묶어서
/*
alter table temp9
add constraint pk_temp9_id primary key(id,num,regdate);
where id = and  num = and refdate =  이런식으로 중복값이 안나올때까지 간다.
*/

drop table tmep10;
create table temp10(id number ,userid number);

alter table temp10
add constraint pk_temp10_id primary key(id, userid); -- 복합키 쓰는 순서가 중요하다

select * from user_constraints where table_name='TEMP10';
--KOSA	PK_TEMP10_ID	P	TEMP10					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2025-09-12 15:15:13	KOSA	PK_TEMP10_ID		

/*
튜닝 (복합키) : 순서가 중요
1. 성능 :  where id = 1  and userid='hong'  1
2. 성능 :  where id = 1                     2  
3. 성능 :  where userid = 'hong'            3  (index  적용 X) Table scan   

3번이 제일 느리다
성능순 1 2 3 순
3번은 아에 index 못태운다.
1번 같은경우 userid id 순서가 바껴도 상관없다.

ms-SQL 은 not null 을 제약으로 안봄
오라클 정규 방식도아님
실행안해봐도됨
alter table temp9
modify(ename not null)

*/

-- check 제약 ( 업무 규칙 정의 : where gender in('남', '여');
create table temp11(
    id number constraint pk_temp11_id primary key,
    name varchar2(20) not null,
    jumin nvarchar2(6) constraint uk_temp11_jumin unique, -- 중복(null)
    addr varchar2(50),
    age number constraints ck_temp11_age check(age >= 19)
);
select * from user_constraints where table_name='TEMP11';

insert into temp11(id,name,jumin,addr,age)
values(1,'홍길동','123456','서울시 강남구',18);
--ORA-02290: check constraint (KOSA.CK_TEMP11_AGE) viloated

insert into temp11(id,name,jumin,addr,age)
values(1,'홍길동','123456','서울시 강남구',19);

commit;
------------------------------------------------------------------------------
-- Foreign key
-- 1.  관계를 정의한다 (1:1 1:n m:n) 자바에서 연관관계
-- 2.  관계안에서 참조제약 (emp (deptno) dept(deptno) 참조


create table c_emp
as
  select empno , ename , deptno from emp where 1=2;


select * from c_emp;



create table c_dept
as
  select deptno , dname from dept where 1=2;
  
  
select * from c_emp;
select * from c_dept;

--pk (신용확보)
alter table c_dept
add constraint pk_c_dept_deptno primary key(deptno);

--fk -- c_emp 에다가 제약 fk로 검 depnto 에다 검
alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);
-- ORA-02270: no matching unique or primary key for this column-list
-- c_dept(deptno) 가 not null 해야됨 바로위 pk 신용확보 쪽에서 확인처리된거

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

---------------------------------------------------------------------------------
-- 제약 END--


--
--alter table c_dept
--add constraint pk

-----------------------------------------------------------------------------
-- 조별과제
-- 영문테이블 , 영문 컬럼명

--[학생 성적 테이블]

--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다

--이름 NULL 값을 허용하지 않는다

--국어

--영어

--수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용

--값을 입력하지 않으면 default로 0값을 갖는다

--총점 ,평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다

--학과코드는 학과 테이블에 학과코드를 참조한다

--학번 , 이름 , 국어 , 영어 , 수학 , 총점 , 평균 , 학과코드

​

​

--학과 테이블

--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,

--학과명 은 null값을 허락하지 않는다

​

--학과코드 , 학과명

​

--샘플 데이터 insert ..

--그리고 select 결과는

--학번 , 이름 , 총점, 평균 , 학과코드 , 학과명 을 출력하세요


--------------------------------------------------------------------------------
-- 개별 문제
-- USERS 테이블 (사용자)
CREATE TABLE USERS (
    USER_ID NUMBER PRIMARY KEY,
    USER_NAME VARCHAR2(50) NOT NULL,
    EMAIL VARCHAR2(100) UNIQUE NOT NULL,
    REGISTER_DATE DATE DEFAULT SYSDATE
);

-- PRODUCTS 테이블 (상품)
CREATE TABLE PRODUCTS (
    PRODUCT_ID NUMBER PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(100) NOT NULL,
    CATEGORY_ID NUMBER NOT NULL,
    PRICE NUMBER(10,2) NOT NULL CHECK (PRICE >= 0),
    STOCK_QUANTITY NUMBER NOT NULL CHECK (STOCK_QUANTITY >= 0)
);

-- ORDERS 테이블 (주문)
CREATE TABLE ORDERS (
    ORDER_ID NUMBER PRIMARY KEY,
    USER_ID NUMBER NOT NULL,
    ORDER_DATE DATE DEFAULT SYSDATE,
    TOTAL_AMOUNT NUMBER(10,2) NOT NULL CHECK (TOTAL_AMOUNT >= 0),
    CONSTRAINT FK_ORDERS_USERS FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID)
);

-- ORDER_DETAILS 테이블 (주문 상세)
CREATE TABLE ORDER_DETAILS (
    ORDER_DETAIL_ID NUMBER PRIMARY KEY,
    ORDER_ID NUMBER NOT NULL,
    PRODUCT_ID NUMBER NOT NULL,
    QUANTITY NUMBER NOT NULL CHECK (QUANTITY > 0),
    SUB_TOTAL NUMBER(10,2) NOT NULL CHECK (SUB_TOTAL >= 0),
    CONSTRAINT FK_ORDER_DETAILS_ORDERS FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    CONSTRAINT FK_ORDER_DETAILS_PRODUCTS FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);

---------------------------------------------------------------------------------
/*
INSERT INTO USERS (USER_ID, USER_NAME, EMAIL, REGISTER_DATE) VALUES (1, '김철수', 'chulsoo@example.com', TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO USERS (USER_ID, USER_NAME, EMAIL, REGISTER_DATE) VALUES (2, '이영희', 'younghee@example.com', TO_DATE('2023-02-10', 'YYYY-MM-DD'));
INSERT INTO USERS (USER_ID, USER_NAME, EMAIL, REGISTER_DATE) VALUES (3, '박민수', 'minsoo@example.com', TO_DATE('2023-03-05', 'YYYY-MM-DD'));
INSERT INTO USERS (USER_ID, USER_NAME, EMAIL, REGISTER_DATE) VALUES (4, '정지훈', 'jihoon@example.com', TO_DATE('2023-04-20', 'YYYY-MM-DD'));
INSERT INTO USERS (USER_ID, USER_NAME, EMAIL, REGISTER_DATE) VALUES (5, '최지연', 'jiyoun@example.com', TO_DATE('2023-05-25', 'YYYY-MM-DD'));


INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY_ID, PRICE, STOCK_QUANTITY) VALUES (101, '아이폰 15', 1, 1500000, 50);
INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY_ID, PRICE, STOCK_QUANTITY) VALUES (102, '갤럭시 S23', 1, 1400000, 30);
INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY_ID, PRICE, STOCK_QUANTITY) VALUES (103, '맥북 프로 16', 2, 3200000, 20);
INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY_ID, PRICE, STOCK_QUANTITY) VALUES (104, 'LG 그램 17', 2, 1900000, 15);
INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY_ID, PRICE, STOCK_QUANTITY) VALUES (105, '에어팟 프로', 3, 350000, 100);
INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY_ID, PRICE, STOCK_QUANTITY) VALUES (106, '갤럭시 버즈2', 3, 250000, 80);

INSERT INTO ORDERS (ORDER_ID, USER_ID, ORDER_DATE, TOTAL_AMOUNT) VALUES (1001, 1, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 1500000);
INSERT INTO ORDERS (ORDER_ID, USER_ID, ORDER_DATE, TOTAL_AMOUNT) VALUES (1002, 2, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 3200000);
INSERT INTO ORDERS (ORDER_ID, USER_ID, ORDER_DATE, TOTAL_AMOUNT) VALUES (1003, 3, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 1900000);
INSERT INTO ORDERS (ORDER_ID, USER_ID, ORDER_DATE, TOTAL_AMOUNT) VALUES (1004, 4, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 250000);
INSERT INTO ORDERS (ORDER_ID, USER_ID, ORDER_DATE, TOTAL_AMOUNT) VALUES (1005, 1, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 350000);

INSERT INTO ORDER_DETAILS (ORDER_DETAIL_ID, ORDER_ID, PRODUCT_ID, QUANTITY, SUB_TOTAL) VALUES (2001, 1001, 101, 1, 1500000);
INSERT INTO ORDER_DETAILS (ORDER_DETAIL_ID, ORDER_ID, PRODUCT_ID, QUANTITY, SUB_TOTAL) VALUES (2002, 1002, 103, 1, 3200000);
INSERT INTO ORDER_DETAILS (ORDER_DETAIL_ID, ORDER_ID, PRODUCT_ID, QUANTITY, SUB_TOTAL) VALUES (2003, 1003, 104, 1, 1900000);
INSERT INTO ORDER_DETAILS (ORDER_DETAIL_ID, ORDER_ID, PRODUCT_ID, QUANTITY, SUB_TOTAL) VALUES (2004, 1004, 106, 1, 250000);
INSERT INTO ORDER_DETAILS (ORDER_DETAIL_ID, ORDER_ID, PRODUCT_ID, QUANTITY, SUB_TOTAL) VALUES (2005, 1005, 105, 1, 350000);

commit;
*/
-- USERS 테이블 확인
SELECT * FROM USERS;

-- PRODUCTS 테이블 확인
SELECT * FROM PRODUCTS;

-- ORDERS 테이블 확인
SELECT * FROM ORDERS;

-- ORDER_DETAILS 테이블 확인
SELECT * FROM ORDER_DETAILS;
--------------------------------------------------------------------------------
--1. 전체 상품의 평균 가격보다 비싼 상품의 상품명, 가격을 조회하세요.
--(사용 테이블: PRODUCTS)
select PRODUCT_NAME, PRICE
from PRODUCTS
where PRICE >( select avg(PRICE) from PRODUCTS);


--2. 한 번이라도 주문한 적이 있는 사용자의 이름, 이메일을 조회하세요.
--(사용 테이블: USERS, ORDERS)

select distinct u.USER_NAME, u.EMAIL
from USERS u join (select ORDER_ID, USER_ID from ORDERS) o on u.USER_ID = o.USER_ID;



--3. 쇼핑몰에서 가장 많이 팔린 상품의 상품명, 총 판매량을 조회하세요.
--(사용 테이블: ORDER_DETAILS, PRODUCTS)


select p.PRODUCT_NAME , OD.QUANTITY
from ORDER_DETAILS od left outer join (select PRODUCT_ID, PRODUCT_NAME 
 FROM PRODUCTS) p on od.PRODUCT_ID = P.PRODUCT_ID;
 
--4. 2024년에 주문한 적이 있는 사용자의 이름, 이메일을 조회하세요.
--(사용 테이블: USERS, ORDERS)
--o.ORDER_ID o.USER_ID o.ORDER_DATE    u.USER_ID
--USERS u ORDERS o


select distinct u.USER_NAME, u.EMAIL
from USERS u left outer join (select ORDER_ID, USER_ID, ORDER_DATE from ORDERS) o
on u.USER_ID = o.USER_ID
where to_char(o.ORDER_DATE, 'YYYY') = 2024;



--5. 가장 총 주문 금액이 높은 주문을 한 사용자의 이름, 이메일, 주문 금액을 조회하세요.
--(사용 테이블: ORDERS, USERS)


select u.USER_NAME, u.EMAIL, o.TOTAL_AMOUNT
from USERS u left outer join (select TOTAL_AMOUNT, USER_ID from ORDERS) o on
u.USER_ID = o.USER_ID
where o.TOTAL_AMOUNT = (select max(TOTAL_AMOUNT) from ORDERS);




--6. 한 번도 주문한 적이 없는 사용자의 이름, 이메일을 조회하세요.
--(사용 테이블: USERS, ORDERS)

select u.USER_NAME, u.EMAIL
from USERS u left outer join (select USER_ID from ORDERS) o on
u.USER_ID = o.USER_ID
where o.USER_ID is null;




--7. 각 카테고리별로 가장 비싼 상품의 카테고리 ID, 상품명, 가격을 조회하세요.
--(사용 테이블: PRODUCTS)
--CATEGORY_ID PRODUCT_NAME PRICE

select CATEGORY_ID, PRODUCT_NAME, PRICE
from PRODUCTS p1
where PRICE = (select max(PRICE) from PRODUCTS p2 where p1.CATEGORY_ID = p2.CATEGORY_ID);



--8. 쇼핑몰에서 가장 많은 주문을 한 사용자의 이름, 총 주문 수를 조회하세요.
--(사용 테이블: USERS, ORDERS)
/*
u.USER_NAME u.USER_ID
            o.USER_ID count(o.user_ID)

select USER_NAME, USER_ID from USERS;


select USER_ID, count(USER_ID) 
from ORDERS 
group by USER_ID 
having count(USER_ID)= (
                        select max(oc)
                        from (select count(USER_ID) as oc
                              from ORDERS
                              group by USER_ID
                              )
);
*/
select u.USER_NAME as "사용자이름", count(o.ORDER_ID) as "총 주문"  
From USERS u join ORDERS o on u.USER_ID = o.USER_ID
group by u.USER_ID, u.USER_NAME
having count(o.ORDER_ID) = (select max(oc)
                            from (select count(ORDER_ID) as oc
                                  from ORDERS
                                  group by USER_ID)
                            );

--9. '아이폰 15' 상품을 구매한 적이 있는 사용자의 이름, 이메일을 조회하세요.
--(사용 테이블: USERS, ORDERS, ORDER_DETAILS, PRODUCTS)
--p.PRODUCT_ID                         p.PRODUCT_NAME =아이폰15
--od.PRODUCT_ID od.ORDER_ID
--               o.ORDER_ID o.USER_ID 

--                          u.USER_ID

--select PRODUCT_ID from PRODUCTS where PRODUCT_NAME ='아이폰 15';

--select ORDER_ID, USER_ID from ORDERS;
--select ORDER_ID, USER_ID from ORDERS o on o.ORDER_ID=od.ORDER_ID

--select PRODUCT_ID, ORDER_ID from ORDER_DETAILS od on od.ORDER_ID=o.ORDER_ID
--select * from PRODUCTS where PRODUCT_NAME ='아이폰 15';

select u.USER_NAME, u.EMAIL
from USERS u
where u.USER_ID in (
    select distinct o.USER_ID from ORDERS o join ORDER_DETAILS od on o.ORDER_ID = od.ORDER_ID 
                                            join PRODUCTS p on od.PRODUCT_ID = P.PRODUCT_ID where p.PRODUCT_NAME ='아이폰 15'
);

-----------------------------------------sep 12 end---------------------
-----------------------------------------sep 13 start----------------------------

--개발자 관점에서 FK 보기
--master - detail 관계 (FK) 
--부모 - 자식 관계 (FK)

-- c_dept , c_emp (FK : deptno) 관계
-- c_dept (master , 부모)

--1. c_emp 테이블 있는 신입이 삭제
select * from c_emp; --ok

--2. c_dept 테이블 있는 100 부서 삭제
delete from c_dept where deptno=100;  --  이미 100을 사용하고 (c_emp)
--ORA-02292: integrity constraint (KOSA.FK_C_EMP_DEPTNO) violated - child record found

delete from c_dept where deptno=200;  -- 200 는 참조당하고 있지 않아요 ...

rollback;

--2. c_dept 에 있는 100 데이터 삭제하고 싶어요
--2.1 참조하는 ... c_emp  100 데이터 삭제 , 변경 다른 값

--------------------------------------------------------------------------------
/* cascade 부모쪽 날릴때 부모쪽 참조하고 있던 자식도 같이 날림
오라클은 delete cascade 만 있고 다른 db는 update casecade가 있다.

column datatype [CONSTRAINT constraint_name]
 REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE])
column datatype,
. . . . . . . ,
[CONSTRAINT constraint_name] FOREIGN KEY (column1[,column2,..])
 REFERENCES table_name (column1[,column2,..] [ON DELETE CASCADE]


ON DELETE CASCADE 부모 테이블과 생명을 같이 하겠다

alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) 
references c_dept(deptno) ON DELETE CASCADE; 

fk 걸때 on delete cascade 하는것
원래라면 
delete from c_emp where empno=1  >> deptno >> 100번
delete from c_dept where deptno=100; 삭제 안되요 (참조 하고 있으니까)
하지만 
ON DELETE CASCADE 걸면 삭제되요 
delete from c_dept where deptno=100;  --> c_emp 1 번 사원데이터 삭제 
부모삭제 >> 참조하고 있는 자식도 삭제


MS-SQL , my-sql
ON DELETE CASCADE
ON UPDATE CASCADE
*/
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
​
-----------------------------------------------------------------------------
-- 개발자에 필요한 SQL
-- 오라클.pdf (100page)
/*
 SEQUENCE 특징 
1) 자동적으로 유일 번호를 생성합니다. 
2) 공유 가능한 객체 (여러개의 테이블이 같이 사용)
3) 주로 기본 키 값을 생성하기 위해 사용됩니다. 
4) 어플리케이션 코드를 대체합니다. 
5) 메모리에 CACHE되면 SEQUENCE 값을 액세스 하는 효율성을 향상시킵니다. 
   ex) 청원경찰이 은행 혼잡시 번호표 먼저 뽑아서 나눠주는 케이스

CREATE  SEQUENCE  sequence_name 
[INCREMENT  BY  n] 
[START  WITH  n] 
[{MAXVALUE n | NOMAXVALUE}] 
[{MINVALUE n | NOMINVALUE}] 
[{CYCLE | NOCYCLE}] 
[{CACHE | NOCACHE}];

sequence_name  
INCREMENT  BY  n 
START  WITH  n  
MAXVALUE n  
NOMAXVALUE   
MINVALUE n  
NOMINVALUE  
CYCLE | NOCYCLE 
CACHE | NOCACHE 


SEQUENCE 의 이름입니다. 
정수 값인 n으로 SEQUENCE번호 사이의 간격을 지정. 
이 절이 생략되면 SEQUENCE는 1씩 증가. 
생성하기 위해 첫번째 SEQUENCE를 지정. 
이 절이 생략되면 SEQUENCE는 1로 시작. 
SEQUENCE 를 생성할 수 있는 최대 값을 지정. 
오름차순용 10^27 최대값과 내림차순용-1의 최소값을 지정. 
최소 SEQUENCE 값을 지정. 
오름차순용 1과 내림차순용-(10^26)의 최소값을 지정. 
최대 또는 최소값에 도달한 후에 계속 값을 생성할 지의 여부를 
지정. NOCYCLE 이 디폴트. 
얼마나 많은 값이 메모리에 오라클 서버가 미리 할당하고 유지 
하는가를 지정. 디폴트로 오라클 서버는 20을 CACHE.
*/

desc board;
drop table board;

create table board( 
      boardid number constraint pk_board_boardid primary key,
      title nvarchar2(50) 
);

select * from user_constraints where table_name='BOARD';

------------- 글쓰기 작업을 한다면 ------------------
--여기서 pk 의 의미는?
-- pk not null, unique , index ( where empno = 7788 쓴다는 가정하에 인덱스 페이지로가서 빨리 찾아주겠다라는 의미로 pk나 유니크걸면 걸린다) 가 생성된다.

insert into board(boardid, title) values(1,'방가');
insert into board(boardid, title) values(2,'방가');

select * from board;

rollback;

-- 질문
-- 처음 글을 쓰면 1번 그 다음글 2, 3
-- 어떤 논리?

insert into board(boardid, title) 
values((select count(boardid)+1 from board) , '방가');

 insert into board(boardid, title) 
values((select count(boardid)+1 from board) , '방가');

insert into board(boardid, title) 
values((select count(boardid)+1 from board) , '방가');

select * from board;
--1	방가
--2	방가
--3	방가

-- 이때 글삭제
delete from board where boardid=1;

insert into board(boardid, title) 
values((select count(boardid)+1 from board) , '방가');
-- 보더 아이디1개 삭제한상태서 + 카운터 가니 터짐 ORA-00001: unique constraint (KOSA.PK_BOARD_BOARDID) violated
-- 문제 발생
-- 글 삭제 할 경우 ( 번호 생성 중복값 )

rollback;

select * from board;

insert into board(boardid, title) 
values((select max(boardid) from board) , '방가');
-- null 나옴

insert into board(boardid, title) 
values((select nvl(max(boardid),0)+1 from board) , '방가1');
insert into board(boardid, title) 
values((select nvl(max(boardid),0)+1 from board) , '방가2');
insert into board(boardid, title) 
values((select nvl(max(boardid),0)+1 from board) , '방가3');
insert into board(boardid, title) 
values((select nvl(max(boardid),0)+1 from board) , '방가4');

select * from board;

delete from board where boardid=1;


select * from board;

insert into board(boardid, title) 
values((select nvl(max(boardid),0)+1 from board) , '방가5');

select * from board;
--2	방가2
--3	방가3
--4	방가4
--5	방가5
commit;
------------------------------------------------------------
-- count , max 순번 만드는 논리
-- 시퀀스 객체 ( 순번 ) 채번기 ( 번호표 뽑기 )
-- 공유 객체

create sequence board_num;
-- 지가 알아서 시퀀스에 등록된다.

-- 채번 
select board_num.nextval from dual; -- 번호뽑기

--은행 번호표처럼 기계에 마지막에 뽑은 번호 표시기능
select board_num.currval from dual; -- 마지막 번호확인

-- 공유객체 --> 여러개의 테이블이 서로 공유 (다른 게시판이라도 전체 글 넘버링 공유되는거처럼)

/*

  A 테이블         B테이블
  in : 1            in : 3
  in : 2            in : 5
  in : 4
  
*/
commit;

create table kboard(
    num number constraint pk_kboard_num primary key,
    title nvarchar2(20)
);

create sequence kboard_num;

insert into kboard(num, title)
values(kboard_num.nextval, '1번');
insert into kboard(num, title)
values(kboard_num.nextval, '2번');
insert into kboard(num, title)
values(kboard_num.nextval, '3번');

select * from kboard;

delete from  kboard where num = 3;

insert into kboard(num, title)
values(kboard_num.nextval, '4번');
 
select * from kboard;

------------------------------------------------------------------------
-- 마리아 db는 시퀀스있음
-- sequence  채번기
/*
 오라클     (O)
 MS-SQL     (2012버전부터 O)
 My-SQL     (X)   테이블에 종속적으로 붙는건 있다
 Mariadb    (O)
 PostgreSQL (O)

순번을 생성 (테이블 종속)
Ms-SQL
        create table board(boardnum int identity(1,1)
        insert into board(title) values('제목') 
        
my-sql
        create table board(boardnum int auto_increment , title)
        insert into board(title) values('제목')

*/

-- sequence 옵션 
create sequence seq_num
start with 10
increment by 2;

select seq_num.nextval from dual;
-- 2개씩 올라가게됨
-- 게시판
/*
테이블에는 
1 , 방가1
2 , 방가2
3 , 방가3
4 , 방가4

1,2,3,4,5,6 ......... 1000
가장 나중에 쓴글 ( 최신글 )

select * from board order by num desc
*/ 
/*
 rownum
 1. 의사컬럼 : 실제 물리적으로 존재하는 컬럼은 아니고 논리적으론 존재
 create table 생성안되요
 rownum : 실제로 테이블에 컬럼으로 존재하지는 않지만 내부적으로 행 번호를 
          부여하는 컬럼

*/
select * from emp;

select rownum , empno , ename
from emp;

select rownum , empno , ename , sal
from emp --여기까지로 실행하면 rownum 정렬이됨
order by sal; -- sal 기준으로 정렬됨 그래서 rownum이 뒤죽박죽

-- from -> select -> order by  실행 순서

-- 통계데이터
-- 1. 기준데이터 만든다. 그걸가지고 다시 순번처리한다.

select * from (
               select empno, ename, sal
               from emp
               order by sal -- 기준
              );

select rownum , e.*  -- e.*면 e에 속하는 모든것 
from (
       select empno, ename, sal
       from emp
       order by sal -- 기준
       )e;  
       
-- 업무 : 우리회원 중에서 3명 (상위 3명)
-- Top-n 쿼리 (기준이 되는 데이터 생성 (정렬) ... 상위 n 개 가져오기)
-- MS-SQL : select top 10 , * from emp order by sal asc
-- 오라클은 top이라는 키워드(쿼리) 자체가 없음

-- Oracle (Top n(x))
-- 1. 정렬(선행)
-- 2. 정렬 기준 rownum 조건

-- 급여를 많이 받는 순으로 정렬된 데이터

select empno , ename , sal
from emp
order by sal desc;
              
select *
from (
        select empno , ename , sal
        from emp
        order by sal desc;
     ) e;

              
select rownum, e.empno , e.ename , e.sal
from (
        select empno , ename , sal
        from emp
        order by sal desc
     ) e;

-- 급여를 많이 받는 사원 5명
-- 정렬시켜놓고 원하는 데이터를 추출하는것

select *
from (
      select rownum as num , e.empno , e.ename , e.sal
            from (
                select empno , ename , sal
                from emp
                order by sal desc
                 ) e
      ) n where num <= 5; --이게 탑앤쿼리
-- 대용량 데이터 조회하기        
-- 페이징 처리 (Today Point)
-- or between A and B

-- 게시판 10만건
-- 10개씩 묶어서 페이징 처리하고 들고오는 방식

/*
게시판의 데이터 102건
totaldata = 102
pagesize = 10 (한 화면에 보여지는 데이터 row 수)'

pagecount > 11개 페이지

[1][2][3][4][5][6][7][8][9][10][11]
<a herf = 'list.do?page=1'>1</a>

1번 페이지 > 1~10 번글을 보겠다 > num between 1 and 10
2번 페이지 > 11~20 >> num between 11 and 20

[1][2][3][4][5][다음]
[이전][6][7][8][9][10][다음]
[이전][11][12] 
이건 자동화 안됨 코드 짜야됨

*/
------------------------- hr 계정이동--------------------------------------
select user from dual;
show user;

select * from employees; --107건

/*
total 107 건
pagesize = 10
page 개수 
[1][2][3][4][5][6][7][8][9][10][11]

[1] 번글을 클릭한 상태면 > 1~10 게시글
[11] > 나머지
*/
-- 1단계 ( 데이터 정렬의 기준을 잡는다)
-- EMPLOYEE_ID 를 기준으로 잡는다
select * from employees
order by employee_id asc;

-- 2단계 ( 기준 데이터 순번 부여하기)

select  * 
from (
      select * from employees order by employee_id asc
     ) e
     
select  rownum as num , e.* 
from (
      select * from employees order by employee_id asc
     ) e   -- 107건   
where rownum <= 50; -- 50건

-- 3단계
-- [1] 페이지 클릭
select *
from (
            select  rownum as num , e.* 
            from (
                  select * from employees order by employee_id asc
                 ) e   -- 107건   
            where rownum <= 10 -- 10건 -> 10 파라메터값 end값
      ) n where num >=1;
-- rownum <= 10 where num >= 1 (10과 1이라는 값은 자바코드 논리 생성)      
-- rownum <= ?  where num >= ?
-- 오라클db 페이징하는 탑앤쿼리 기본논리

--[2] 페이지 클릭
select *
from (
            select  rownum as num , e.* 
            from (
                  select * from employees order by employee_id asc
                 ) e      
            where rownum <= 20
      ) n where num >=2; 


select *
from (
            select  rownum as num , e.* 
            from (
                  select * from employees order by employee_id asc
                 ) e   -- 107건   
            where rownum <= 50 -- 50건 -> 50 파라메터값 end값
      ) n where num >=41;  -- 100보다 작은것 -> 50보다 작은거 -> 41보다 작은거 -> 41 파라메터 start 값   

--  rownum <= ?     where num >=?  (10 과 1이라는 값은 자바코드 논리 생성) 

SELECT *
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY employee_id ASC) AS num, e.*
    FROM employees e
) n
WHERE n.num BETWEEN 1 AND 10;
      
-- 오라클 12c 이상
select *
from employees
order by employee_id
offset 0 rows fetch next 10 row only;

-- offset : 시작 위치 지정 ( 0부터 시작)
-- fetch next : 가져올 개수
-- 예 : offset 10 rows fetch next 10 rows only : -> 11~20번째 까지
----------------------------------------------
-- view
-- 오라클 pdf 192 
/*     있으면쓰고 없으면 안쓰고 [] 정규 표현식에서 
 물리적인 테이블을 볼수 있는 가상테이블 = view
 종이로 가린상태에서 종이에 구멍 뚫어서 그 구멍으로만 보이는 개념
 
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])]
AS Subquery
[WITH CHECK OPTION [CONSTRAINT constraint ]]
[WITH READ ONLY]

OR REPLACE              이미 존재한다면 다시 생성한다.
FORCE Base Table        유무에 관계없이 VIEW 을 만든다.
NOFORCE                 기본 테이블이 존재할 경우에만 VIEW 를 생성한다.
view_name               VIEW 의 이름
Alias                   Subquery 를 통해 선택된 값에 대한 Column 명이 된다.
Subquery                SELECT 문장을 기술한다.
WITH CHECK OPTION       VIEW 에 의해 액세스 될 수 있는 행만이 입력,갱신될 수 있다.
Constraint              CHECK OPTON 제약 조건에 대해 지정된 이름이다.
WITH READ ONLY          이 VIEW 에서 DML 이 수행될 수 없게 한다.

*/

-- View 가상 테이블 ( 물리적인 테이블 볼수 있는 쿼리문을 가지고 있는 객체)
-- 사용 방법은 테이블 처럼 ^^
--  성능과는 
--목적
--1. 개발자의 편리성 (성능과는 무관) > join > subquery > view 사용 
--1.1  복잡한 쿼리(JOIN) > view > 필요한때 불러서 
--2. 보안 ( 신입사원에게 emp 테이블 권한을 주지 않고 .. view 를 통해서 특정 컬럼 데이터만 접근)
--view 통해서  select 
--view 통해서  DML( insert , update , delete) 가능 ... view 볼 수 있는 데이터 


-- 1. 보안 측면 (민감한 정보 가리기) (신입 사원이 입사하면 특정 컬럼만 볼수 있게 View를 만들어서 제공)
--      view 로 보는 내용은 원본 테이블 수정이 된다.
-- 2. 편의성 ( in line view 대신에 view 객체를 만들어서 영속적으로 등록 사용) 

--자기 부서의 평균월급다 더 많은 월급을 받는 사원의 사번 , 이름 , 부서번호 , 
--부서별 평균월급을 출력하세요
--만약에 부서와 부서별 평균월급 담고 있는 테이블 제공
--in line view
/*
select e.empno , e.ename, e.deptno , e.sal , s.avgsal
from emp e join 
       (select deptno , trunc(avg(sal),0) as avgsal from emp group by deptno) s
on e.deptno = s.deptno
where e.sal > s.avgsal;
*/      
create view view001 
as 
    select empno, ename ,sal
    from emp;
--ORA-01031: insufficient privileges
-- kosa 권한 변경  

create view deptdata
as 
 select deptno , trunc(avg(sal),0) as avgsal
 from emp group by deptno;
 
select e.empno , e.ename, e.deptno , e.sal , s.avgsal
from emp e join deptdata s
on e.deptno = s.deptno
where e.sal > s.avgsal;
--------------------------------------------------------
--  view 쿼리문장을 가지고 있는 객체
create view view 001
as
 slect empno, enmae ,sal
 from emp;
select * from view001;

select * from view001 where sal > 1000;

select comm from view001;
--ORA-00942: table or view does not exist

-- view 가 볼수 있는 데이터만 처리 가능

create or replace view v_001
as
  select empno , ename 
  from emp;

select * from v_001;


create or replace view v_001
as
  select empno , ename , job 
  from emp;

select * from v_001;

-- alter 개념 없고 or replace 있으니 그냥 추가하면 그대로 추가되서 보여줌
-- 바로바로 셀렉트 커리문이 갱신되서 뷰가 바뀌는것



create or replace view v_001
as
  select empno , ename , job 
  from emp;

select * from v_001
where empno=7788;

-- 조인
-- 부서 이름 가져오기 위해서
-- 귀찮으니 view로 가져오자
-- 이게 편리성
create or replace view view_002
as 
  select e.empno, e.ename , e.deptno , d.dname
  from emp e join dept d
  on e.deptno = d.deptno;
  
select * from view_002;  

-- 혹자는 view 는 SQL 문장 덩어리 ../
-- 테이블 처럼 사용가능

-- in line view > view 객체로 만들어서 join 하는 것이 편하다.

-- 직종별 평균급여를 볼 수 있는 뷰를 만들어라

create or replace view view_003
as
 select deptno, trunc( avg(sal))
 from emp e
 group by deptno;
 -- ORA-00998: must name this expression with a column alias
 --  trunc( avg(sal)) 컬럼이름이 원본아니니 그런것
create or replace view view_003
as
 select deptno, trunc( avg(sal)) as avgsal
 from emp e
 group by deptno;
 
select * from view_003;
 
-- view 통해서 DML (insert, update , delete)
-- 되도록이면 view 는 조회(select)

select * from copyemp;

create or replace view v_emp
as 
    select empno, ename, job ,sal
    from copyemp;
    
-- view 를 통한 DML 작업

update v_emp
set sal = 0;
-- copyemp의 sal이 0으로 변경됨
select * from v_emp;
select * from copyemp;

create or replace view v_emp
as 
    select empno, ename, sal
    from copyemp;

select * from v_emp;

update v_emp
set job='IT';
-- ORA-00904: "JOB": invalid identifier
-- view를 통해서 볼수 잇는 데이터 (select , insert , update ,delete 가능)
commit;
-------------------------------------------------------------

-- 30번 부서 사원들의 직종 , 이름 , 월급 담는 view를 만드는데,
-- 각각의 컬럼명을 직종, 사원이름 , 월급으로 ALISA를 주고 월급이
-- 300 보다 많은 사원들만 추출하도록 하라. view101
select ename, job ,sal
from emp
where deptno = 30  and sal> 300;

create or replace view view101
as
  select ename, job , sal
  from emp
  where deptno = 30  and sal> 300;
 
select * from view101;

--------------------------------------------------------------------------
-- view end ------------------------------------------------------------
----------------------------------------------------------------------
-- 분석함수
-- 통계데이터 ( 쿼리 )
-- 집계 행 데이터 -> 열 데이터 바꾸기
-- 집계 열 데이터 -> 행 데이터 바꾸기

-- decode, case ( 표준화 )
-- 11g 부터 pivot 기능 추가 ( 엑셀의 그것과 같다) 행데이터 열데이터 전환
/*
deptno, cnt
10       3
20       5 
30       6  

차트화 분석용으로 만들기 위해서는 

deptno_10  deptno_20  deptno_30 
    3          5         6

데이터 처리 용이(차트)


*/

select deptno , count(*) as cnt
from emp
group by deptno
order by deptno asc;
--10	3
--20	5
--30	6

--case 활용 
-- 행데이터를 열데이터로 전환
-- 관습적으로 컬럼명을 붙여준다.
select deptno, case when deptno = 10 then 1 else 0 end dept_10, -- 컬럼으로 데이터
               case when deptno = 20 then 1 else 0 end dept_20,
               case when deptno = 30 then 1 else 0 end dept_30
from emp
order by deptno asc;

--order by 1 asc; 첫번째 컬럼으로 하겠다

select deptno, sum(case when deptno = 10 then 1 else 0 end) as dept_10, -- 컬럼으로 데이터
               sum(case when deptno = 20 then 1 else 0 end) as dept_20,
               sum(case when deptno = 30 then 1 else 0 end) as dept_30
from emp
group by deptno
order by deptno asc;

--deptno 컬름은 의미가 없다
-- 컬럼 이름에 의미를 부여해서 집중하겠다

select  sum(case when deptno = 10 then 1 else 0 end) as dept_10, -- 컬럼으로 데이터
        sum(case when deptno = 20 then 1 else 0 end) as dept_20,
        sum(case when deptno = 30 then 1 else 0 end) as dept_30
from emp;

-------------------------
-- 통계 집계 데이터 만들기

select deptno, count(*) as count
from emp
group by deptno;

select *
from (
      select deptno, count(*) as count
      from emp
      group by deptno
     ) x;
     
select case when deptno=10 then ecount else null end dept_10,
       case when deptno=20 then ecount else null end dept_20,
       case when deptno=30 then ecount else null end dept_30
from (
      select deptno, count(*) as ecount
      from emp
      group by deptno
     ) x;  
     
     
select max(case when deptno=10 then ecount else null end) as dept_10,
       max(case when deptno=20 then ecount else null end) as dept_20,
       max(case when deptno=30 then ecount else null end) as dept_30
from (
      select deptno, count(*) as ecount
      from emp
      group by deptno
     ) x;       
     
     
-------------------------------------------------------------------------------
/*
SELECT * 
FROM (피벗 대상 쿼리문)
PIVOT (그룹함수(집계컬럼) FOR 피벗컬럼 IN (피벗컬럼값 as 별칭)

 오라클 11g부터 PIVOT 기능을 제공합니다. 
 기존 이하버전에서는 DECODE 함수를 이용하여 로우를 컬럼으로 변경하는 작업을 하였습니다. 
PIVOT 기능을 이용하면 DECODE의 복잡하고 비직관적인 코드를 조금 더 직관적으로 작성할 수 있습니다.
아쉬운 점은 PIVOT 기능을 사용하더라도 PIVOT을 할 컬럼을 미리 정의를 해 놓아야 한다는 점이다.
상황에 맞게 PIVOT를 사용할지 DECODE를 사용할지 결정해서 사용하면 될꺼 같습니다.

*/

-- 직종별 , 월별 입사 건수
/*

직종 1월 ,  2월 , 3월 , 4월 ....
IT    0      1     2     0    
MA    1      0     4     5 

*/
select job , to_char(hiredate,'FMMM') || '월' as hire_month
from emp;

select *
from (
      select job , to_char(hiredate,'FMMM') || '월' as hire_month
      from emp
     )
pivot (
       count(*) for hire_month IN('1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월')
      );
      
--CLERK    	2	0	0	0	0	0	0	0	0	1	0	1
--SALESMAN	0	2	0	0	0	0	0	0	2	0	0	0
--PRESIDENT	0	0	0	0	0	0	0	0	0	0	1	0
--MANAGER   0	0	0	2	0	1	0	0	0	0	0	0
--ANALYST   0	0	0	0	0	0	0	0	0	2	0	0