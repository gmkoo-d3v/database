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
--금요일
--DDL 구문 과  제약(constraint)  그리고 DML(insert , update ,delete) 
--진행하겠습니다^^

--토요일은
--개발자 필수 쿼리 와 분석함수 ...진행



