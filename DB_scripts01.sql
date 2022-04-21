--��� ���̺�  �������� ���ٷ� ������ؼ� �������ִ� ���̺�
--������̺��� ���뵵 ����ڰ� (�Լ�) ����� �ӽ÷� ����ϴµ� �����ϴ�.
SELECT 24*40
FROM dept;

SELECT 24*40
FROM dual;

--������ �Լ� :���̺� ����Ǿ��ִ� ���� ���� ������� �Լ��� �����Ͽ� �ϳ��� ����� ��ȯ�ϴ��Լ�
--������ �Լ� : ���ǿ����� �������� �׷�ȭ�Ͽ� �׷캰�� ����� �ϳ��� ��ȯ�ϴ� �Լ�

FUNCTION name (COLUMN | expression [arg1,arg2,,,,])
FUNCTION ������ �Լ��̸�
COLUMN:�÷��̸�
expression:���ڿ� �Ǵ� ǥ���� 
arg1:�Լ� �μ� 

MOD:�Լ� m�� n���γ��� ������

SELECT ename, sal , comm , MOD (sal,comm)
FROM emp
WHERE deptno = 30;

INITCAP: �μ��� ���ԷµǴ� Į���̳� ǥ������ ���ڿ� ���� ù���� �����ڸ� �빮�ڷ� ��ȯ�ϴ��Լ�

SELECT name, userid, INITCAP(userid)
FROM student
WHERE  name = '�迵��';

LTRIM,RTRIM �Լ�
LTRIM�� RTRIM �Լ��� ���ڿ����� Ư�� ���ڸ� �����ϱ� ���� ��� �Լ��� �μ����� ������ ���ڸ� �������������� ���ڿ� �յڷκ��� �κ� ������ ����


SELECT dname, Rtrim(dname,'��')
FROM DEPARTMENT;

LENGTH �Լ��� �μ��� �ԷµǴ� Į���̳� ǥ�q���� ���ڿ� ���̸� ��ȯ�ϴ� �Լ��� ��, (ȫ�浿) ����3
LENGTHB �Լ��� ���ڿ� ����Ʈ���� ��ȯ�ϴ� �Լ��̴� (ȫ�浿)= 6����Ʈ

SELECT dname, LENGTH(dname),LENGTHB(dname)
FROM DEPARTMENT;

--������� ������ Ÿ�� ��ȯ
TO_CHAR : ����/��¥Ÿ���� ���ڷ� ��ȯ
TO_NUMBER : ���ڿ��� ���� Ÿ������ ��ȯ 
TO_DATE: ���ڿ��� ��¥ Ÿ������ ��ȯ 

SELECT empno, to_char(hiredate, 'yy-mm') �Ի���
FROM emp 
WHERE ename = '����';

SELECT name, grade, to_char(birthdate, 'day month dd, yyyy')�������
FROM  STUDENT 
WHERE deptno = 102;

SELECT ename, to_char(hiredate, 'MONTH dd, yyyy hh24:mi:ss pm')�Ի���
FROM emp
WHERE deptno=20;

SELECT ename, to_char(hiredate, 'mon "the" ddth "of" yyyy')�Ի���
FROM EMP WHERE deptno=20;

SELECT name,sal,comm, to_char((sal+comm)*12, '9999') anual_sal
FROM PROFESSOR p  WHERE comm IS NOT NULL;

SELECT name,hiredate
FROM PROFESSOR p 
WHERE hiredate = to_date('06 01 01', 'mm dd yy');

SELECT TO_Number('1') num
FROM dual;

SELECT name hiredate, hiredate+30, hiredate+60
FROM PROFESSOR p 
WHERE profno= 9908;

SELECT to_char(sysdate,'yyyy-mm-dd')���糯¥
FROM dual;

ROUND,TRUNC�Լ� ��¥�� �ݿø� �Ǵ� ����

SELECT to_char(sysdate, 'yy/mm/dd hh24:mi:ss')�븻,
		to_char(trunc(sysdate), 'yy/mm/dd hh24:mi:ss')TRUNC�Լ�,
		to_char(round(sysdate), 'yy/mm/dd hh24:mi:ss')ROUND�Լ�
		FROM dual;

SELECT to_char(hiredate, 'yy-mm-dd')�Ի���,
	to_char(round(hiredate,'dd'), 'yy-mm-dd')round_dd,
	to_char(round(hiredate,'mm'), 'yy-mm-dd')round_mm,
	to_char(round(hiredate,'yy'), 'yy-mm-dd')round_yy
	FROM PROFESSOR p 
	WHERE deptno = 101;


--���ȉ�
SELECT empno, hiredate,
		months_between(sysdate, hiredate)TENURE,
		add_months(hiredate, 6) REVIEW
		FROM EMP
		WHERE MONTHS_BETWEEN(sysdate, hiredate) < 120;
	
SELECT sysdate, last_day(Sysdate), next_day(sysdate,'��')
	FROM dual;

SELECT sysdate, last_day(Sysdate), next_day(sysdate, 1)
	FROM dual;

SELECT ename, job,sal,comm, sal+comm,
	sal+nvl(comm,0)s1, nvl(sal+comm, sal)s2
	FROM EMP e 
	WHERE deptno = 20;
	
SELECT name, POSITION, sal, comm,
		NVL2(comm, sal+comm, sal) total
		FROM PROFESSOR p
		WHERE DEPTNO = 102;
		
	
--DECODE �Լ� 
	--���� ���α׷��� if ���̳� case ������ ǥ���Ǵ� ������ �˰����� �ϳ��� sql ��ɾ�� �����ϰ� ǥ���Ҽ��ִ� ������ ���
	
SELECT name, deptno, sal,
	CASE WHEN deptno = 101 THEN sal*0.1
		 WHEN deptno = 102 THEN sal*0.2
		 WHEN deptno = 201 THEN sal*0.3
		 ELSE 0
		END bobus
		FROM PROFESSOR p ;