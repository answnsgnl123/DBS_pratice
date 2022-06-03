-- ���̺� ���۾� DML

INSERT INTO STUDENT values(10110,'ȫ�浿','hong','1','1111111111111','11/11/11','010-111-1111'
   ,170,70,101,9903);
   
SELECT *
FROM STUDENT
WHERE studno = 10110;

-- null �� �Է�

INSERT INTO department(deptno,dname)
values(300,'������к�');

COMMIT

SELECT * FROM department WHERE deptno = 300;

INSERT INTO professor(profno,name,position, hiredate,deptno)
values(9929,'������','������',to_date('2013/03/01','yyyy/mm/dd'),102);

COMMIT;

SELECT * FROM PROFESSOR p
WHERE profno = 9929;

INSERT INTO PROFESSOR 
values(9910,'������','gagusu','����',200,sysdate,10,101);

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

-- ���ڵ�(Ʃ��) ���� 

DELETE FROM height_info;

COMMIT;

SELECT * FROM height_info;

-- ���� first insert ex)

INSERT FIRST
WHEN height > 170 THEN
	INTO height_info values(studno,name,height)
SELECT studno,name,height
	FROM STUDENT 
WHERE grade >= '2';

SELECT * FROM height_info

-- PIVOTING insert ��ɹ�
-- OLTP �������� ���Ǵ� �����͸� ������ �����Ͽ콺 �������� ���Ǵ� �м��� �����͸� ��ȯ�ϴ� ��쿡 ����
-- �ϳ��� ���� �������� ������ ����� �Է��ϴ� ���

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

-- ������ ����

SELECT profno,name,POSITION 
FROM PROFESSOR p 
WHERE PROFNO = 9903;

UPDATE PROFESSOR 
SET POSITION = '�α���'
WHERE name = '������'

-- merge �ϴ¹�

MERGE INTO ���̺�1 
USING ���̺�2
ON 1.�÷� = 2.�÷�