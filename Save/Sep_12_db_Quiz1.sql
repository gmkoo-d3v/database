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
---------------------------------------------------------------------------------------------
CREATE TABLE department_score(
    studentid NUMBER CONSTRAINT pk_student_id PRIMARY KEY, -- 학번 (중복/NULL 불허)
    studentname VARCHAR2(50) NOT NULL, -- 이름 (NULL 불허)
    korean NUMBER(3) DEFAULT 0, -- 국어 성적
    english NUMBER(3) DEFAULT 0, -- 영어 성적
    math NUMBER(3) DEFAULT 0, -- 수학 성적
    totalscore NUMBER(3) GENERATED ALWAYS AS (korean + english + math), -- 총점
    average NUMBER(5,2) GENERATED ALWAYS AS ((korean + english + math)/3), -- 평균
    deptcode VARCHAR2(10), -- 학과코드
    CONSTRAINT fk_deptcode FOREIGN KEY (deptcode) REFERENCES department(deptcode)
);
​
CREATE TABLE department(
    deptcode VARCHAR2(20) CONSTRAINT pk_department_id PRIMARY KEY,
    deptname VARCHAR2(20) NOT NULL
);


-- 샘플 데이터
INSERT INTO department_score(studentid, studentname, korean, english, math, deptcode) 
VALUES(20240001, '김철수', 85, 90, 78, 'A001');

INSERT INTO department_score(studentid, studentname, korean, english, math, deptcode) 
VALUES(20240002, '이영희', 92, 88, 95, 'C002');

INSERT INTO department_score(studentid, studentname, korean, english, math, deptcode) 
VALUES(20240003, '박민수', 78, 82, 88, 'B021');

INSERT INTO department_score(studentid, studentname, korean, english, math, deptcode) 
VALUES(20240004, '최지은', 95, 93, 87, 'A001');

INSERT INTO department_score(studentid, studentname, korean, english, math, deptcode) 
VALUES(20240005, '정다은', 88, 76, 92, 'C002');

COMMIT;


-- select문
SELECT 
    ds.studentid AS 학번,
    ds.studentname AS 이름,
    ds.totalscore AS 총점,
    ds.average AS 평균,
    ds.deptcode AS 학과코드,
    d.deptname AS 학과명
FROM department_score ds
JOIN department d ON ds.deptcode = d.deptcode;



--------------------------------------------------
--영문테이블 , 영문 컬럼명
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
--학과 테이블
--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,
--학과명 은 null값을 허락하지 않는다

--학과코드 , 학과명


--샘플 데이터 insert ..
--그리고 select 결과는
--학번 , 이름 , 총점, 평균 , 학과코드 , 학과명 을 출력하세요



create table Eng(
    id number,
    name varchar2(5) not null,
    korean number default 0,
    english number default 0,
    math number default 0,
    total number GENERATED ALWAYS as (korean + english + math) VIRTUAL,
    avg number GENERATED ALWAYS as ((korean + english + math) / 3) VIRTUAL,
    deptno number default 0
);

create table dept1(
    deptno number,
    deptname varchar2(20) not null
);

alter table Eng
add constraint pk_Eng_id primary key(id);​


alter table dept1
add constraint pk_dept1_deptno primary key(deptno);

select * from user_constraints where table_name = 'ENG';
select * from user_constraints where table_name = 'DEPT1';

alter table Eng
add constraint fk_Eng_deptno foreign key(deptno) references dept1(deptno);

insert into dept1(deptno, deptname) values(100, 'IT');
insert into dept1(deptno, deptname) values(200, 'MATH');


insert into Eng(id, name, korean, english, math, deptno)
values(1, '배', 50, 25, 25, 100);

select e.id, e.name, e.total, trunc(e.avg), e.deptno, d.deptname
from Eng e join dept1 d
on e.deptno = d.deptno;
-------------------------------------------------------------------
--영문테이블 , 영문 컬럼명

--[학생 성적 테이블] 생성하기
--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다
--이름 NULL 값을 허용하지 않는다
--국어--영어--수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용
--값을 입력하지 않으면 default로 0값을 갖는다
--총점 ,평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다
--학과코드는 학과 테이블에 학과코드를 참조한다
--학번 , 이름 , 국어 , 영어 , 수학 , 총점 , 평균 , 학과코드
create table student_grades(
    id      number   constraint pk_stu_grades primary key, -- not null + unique해도 됨
    name    varchar2(10 char)   not null,
    korean_score   number(3) default 0,
    english_score  number(3) default 0,
    math_score     number(3) default 0,
    total_score    number(3)  GENERATED ALWAYS as
         (korean_score + english_score + math_score) VIRTUAL,
    score_avg number(5)  GENERATED ALWAYS AS 
        ((korean_score + english_score + math_score) / 3) -- 이거 3넣은게 맘에 안듬
        VIRTUAL,
    dept_code   number
);

--학과 테이블
--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,
--학과명 은 null값을 허락하지 않는다
--학과코드 , 학과명
create table department(
    code        number  constraint pk_dept_code primary key,
    dept_name   varchar2(30 char)   not null
);


-- 참조 제약 조건 추가
alter table student_grades
add constraint fk_stu_grades_dept_code foreign key(dept_code)
references department(code);


--샘플 데이터 insert ..
-- 학과 테이블 insert
insert into department(code, dept_name) values(10, '컴퓨터공학과');
insert into department(code, dept_name) values(20, '영어영문학과');
insert into department(code, dept_name) values(30, '중어중문학과');
commit;

--학생 성적 테이블 insert
insert into student_grades(id, name, dept_code) values(1, '홍길동', 10);
insert into student_grades(id, name, dept_code, korean_score , english_score, math_score) 
values(2, '김유신', 20, 50, 100, 10);
insert into student_grades(id, name, dept_code, korean_score , english_score, math_score) 
values(3, '춘향이', 10, 100, 100, 100);
insert into student_grades(id, name, dept_code, korean_score , english_score, math_score) 
values(4, '이몽룡', 30, 80, 70, 50);
insert into student_grades(id, name, dept_code, korean_score , english_score, math_score) 
values(5, '변사또', 20, 20, 10, 10);


--그리고 select 결과는
--학번 , 이름 , 총점, 평균 , 학과코드 , 학과명 을 출력하세요
select s.id, s.name, s.total_score, s.score_avg, s.dept_code, d.dept_name 
from student_grades s join department d
on s.dept_code = d.code;
-----------------------------------------------------------------------------------
create table student(
                        student_id number constraint pk_student_id primary key,
                        student_name varchar2(50) not null,
                        korean number,
                        english number,
                        math number,
                        total_score GENERATED ALWAYS as (nvl(korean,0) + nvl(english,0) + nvl(math,0)) VIRTUAL,
                        average_score GENERATED ALWAYS as (trunc((nvl(korean,0) + nvl(english,0) + nvl(math,0))/3, 0)) VIRTUAL,
                        department_code number not null
)

--학과테이블
create table department(
                           department_code number constraint pk_department_code primary key,
                           department_name varchar2(50) not null
)

--FK설정
alter table student
    add constraint fk_student_department_code foreign key(department_code) references department(department_code);


--샘플데이터
insert into department (department_code, department_name) values (1,  '학과1');
insert into department (department_code, department_name) values (2,  '학과2');

insert into student (student_id, student_name, korean, english, math, department_code)
values (1, 'name1', 90, 70, 50, 1);
insert into student (student_id, student_name, korean, english, math, department_code)
values (2, 'name2', 80, 60, 40, 2);


--select결과
select
    s.student_id,
    s.student_name,
    s.total_score,
    s.average_score,
    s.department_code,
    d.department_name
from student s
         join department d
              on d.department_code = s.department_code;