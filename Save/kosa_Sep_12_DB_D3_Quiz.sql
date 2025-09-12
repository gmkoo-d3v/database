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

select u.USER_NAME, u.EMAIL
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


select u.USER_NAME, u.EMAIL, to_char(o.ORDER_DATE, 'YYYY') as "2024주문"
from USERS u left outer join (select ORDER_ID, USER_ID, ORDER_DATE from ORDERS) o
on u.USER_ID = o.USER_ID
where to_char(o.ORDER_DATE, 'YYYY') =2024;



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
CATEGORY_ID PRODUCT_NAME PRICE

select CATEGORY_ID, PRODUCT_NAME, PRICE
from PRODUCTS
where PRICE = (select max(PRICE) from PRODUCTS);


--8. 쇼핑몰에서 가장 많은 주문을 한 사용자의 이름, 총 주문 수를 조회하세요.
--(사용 테이블: USERS, ORDERS)
u.USER_NAME o.count(o.USER_ID)  o&u USER_ID

select u.USER_NAME, count(o.USER_ID) as '총 주문 수'
from USERS u left outer join ORDERS o
on u.USER_ID = o.USER_ID
having count(o.USER_ID) = (select count(USER_ID) from (select count(USER_ID) from ORDERS group by USER_ID)) 
group by u.USER_NAME, U.USER_ID;




--9. '아이폰 15' 상품을 구매한 적이 있는 사용자의 이름, 이메일을 조회하세요.
--(사용 테이블: USERS, ORDERS, ORDER_DETAILS, PRODUCTS)
od.PRODUCT_ID od.ORDER_ID
               o.ORDER_ID o.USER_ID 
p.PRODUCT_ID                         p.PRODUCT_NAME =아이폰15
                           u.USER_ID

select u.USER_NAME, u.EMAIL
from USERS left join 
