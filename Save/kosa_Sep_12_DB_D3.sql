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
SELECT * FROM tab WHERE tname ="BOARD";
SELECT * FROM tab WHERE tname="EMP";

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
) --  네가 2개의 값을 넣으면 3번칸에서 가상으로 2개를 더해서 표시하겠다.

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
    id number constraint pk_temp7_id primary key,
    name varchar2(20) not null,
    jumin nvarchar2(6) constraint uk_temp8_jumin unique, -- 중복(null)
    addr varchar2(50)
);

insert into temp8(id,name,jumin,addr)
values(1,'김유신', '123456','한양');

insert into temp8(id,name,jumin,addr)
values(2,'유신', '123456','강남');
-- unique constraint (KOSA.IK_TEMP9)JUMIN) violated
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
  select empno , ename , deptno from emp where 1 = 2;

select * from c_emp;

create table c_dept
as 
  select deptno , dname from dept where 1 = 2;
  
select * from c_dept;

--pk (신용확보)
alter table c_dept
add constraint pk_c_dept_deptno primary key(deptno);

--fk -- c_emp 에다가 제약 fk로 검 depnto 에다 검
alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);
-- ORA-02270: no matching unique or primary key for this column-list
-- c_dept(deptno) 가 not null 해야됨 바로위 pk 신용확보 쪽에서 확인처리된거
select * from user_constraints from where table_name='C_DEPT';
select * from user_constraints from where table_name='C_EMP';

-- 부서
insert into c_dept(deptno,dname) values(100,'인사팀');
insert into c_dept(deptno,dname) values(100,'인사팀');
insert into c_dept(deptno,dname) values(100,'인사팀');
commit;
select * from c_dept;
-- 신입 입사
insert into c_emp(empno,ename,deptno)
values(1, '신입이', 400);
-- 무결성 에러 부모키 발견안됨
insert into c_emp(empno, ename,deptno)
values(1, '신입이',100);

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