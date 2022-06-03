-- 테이블 조작어 DML

INSERT INTO STUDENT values(10110,'홍길동','hong','1','1111111111111','11/11/11','010-111-1111'
   ,170,70,101,9903);
   
SELECT *
FROM STUDENT
WHERE studno = 10110;

-- null 값 입력

INSERT INTO department(deptno,dname)
values(300,'생명공학부');

COMMIT

SELECT * FROM department WHERE deptno = 300;

INSERT INTO professor(profno,name,position, hiredate,deptno)
values(9929,'나교수','조교수',to_date('2013/03/01','yyyy/mm/dd'),102);

COMMIT;

SELECT * FROM PROFESSOR p
WHERE profno = 9929;

INSERT INTO PROFESSOR 
values(9910,'가교수','gagusu','교수',200,sysdate,10,101);

COMMIT;

SELECT * FROM PROFESSOR WHERE profno = 9910;

CREATE TABLE height_info (
	studno number(5),
	name varchar2(10),
	height number(5,2)
);

CREATE TABLE weight_info(
	studno number(5),
	name varchar2(10),
	height number(5,2)
);


INSERT ALL 
INTO height_info values(studno,name,height)
INTO weight_info values(studno,name,weight)
SELECT studno, name, height, weight
FROM STUDENT 
WHERE grade >= '2';

SELECT * FROM height_info;

-- 레코드(튜플) 삭제 

DELETE FROM height_info;

COMMIT;

SELECT * FROM height_info;

-- 다중 first insert ex)

INSERT FIRST
WHEN height > 170 THEN
	INTO height_info values(studno,name,height)
SELECT studno,name,height
	FROM STUDENT 
WHERE grade >= '2';

SELECT * FROM height_info

-- PIVOTING insert 명령문
-- OLTP 업무에서 사용되는 데이터를 데이터 웨어하우스 업무에서 사용되는 분석용 데이터를 변환하는 경우에 유용
-- 하나의 행을 여러개의 행으로 나누어서 입력하는 기능

CREATE TABLE sales(
	sales_no number(4),
	week_no number(2),
	sales_mon number(7,2),
	sales_tue number(7,2),
	sales_wed number(7,2),
	sales_thu number(7,2),
	sales_fri number(7,2));

INSERT INTO sales values(1101,4,100,150,80,60,120);

INSERT INTO sales values(1102,5,300,300,230,120,150);

CREATE TABLE sales_date (
 sale_no number(4),
 week_no number(2),
 day_no number(2),
 sales number(7,2));

INSERT ALL 
INTO sales_data values(sales_no,week_no,'1',sales_mon)
INTO sales_data values(sales_no,week_no,'2',sales_tue)
INTO sales_data values(sales_no,week_no,'3',sales_wed)
INTO sales_data values(sales_no,week_no,'4',sales_thu)
INTO sales_data values(sales_no,week_no,'5',sales_fri)
SELECT sales_no,week_no,sales_mon,sales_tue,
       sales_wed,sales_thu,sales_fri
FROM sales;

-- 데이터 수정

SELECT profno,name,POSITION 
FROM PROFESSOR p 
WHERE PROFNO = 9903;

UPDATE PROFESSOR 
SET POSITION = '부교수'
WHERE name = '성연희'

-- merge 하는법

MERGE INTO 테이블1 
USING 테이블2
ON 1.컬럼 = 2.컬럼