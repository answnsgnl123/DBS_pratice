--�׷��Լ�
���̺��� ��ä ���� �ϳ� �̻��� �÷��� �������� �׷�ȭ �Ͽ� �׷캰 
�� ����� ����Ѵ� �Լ�,
�׷��Լ��� ������� ����� ����ϴµ� ��� 

Count
-���̺� ������ �����ϴ� ���� ������ ��ȯ�ϴ� �Լ�

SELECT count(comm)
FROM emp
WHERE deptno = 30;

SELECT count(*)
FROM EMP e 
WHERE deptno =30;

SELECT avg(weight), sum(weight)
FROM STUDENT s WHERE deptno =101;

SELECT max(height), min(height)
FROM STUDENT s WHERE deptno = 102;

SELECT studno , name, height,deptno 
FROM student s WHERE deptno = 102 ORDER BY height;

SELECT stddev(sal), variance(sal)
FROM professor;

--Group by �� Ư�� Į�� ���� �������� ���� �׷캰�� ������ ��
ex) ���� ���̺��� �Ҽ� �а����̳� ���޺��� ��� �޿��� ���ϴ�
���
GROUP BY �������� ��õ��� ���� Į���� �׷� �Լ��� �Բ� ����Ҽ� ����
�׷��� ������ WHERE ���� ����Ͽ� �׷� ����� ������ ���� ����
�ݵ�� Į�� �̸��� �����ؾ� �ϸ� Į�� ������ ����Ҽ�����
SELECT ������ ������Į���̸��̳� ǥ������ GROUP by���� �ݵ�� ���

err code
SELECT deptno, job, avg(sal)
FROM EMP e GROUP BY deptno;
--select ������ group by���� ����������� job �÷��� ����Ҽ�����


SELECT deptno,count(*), count(comm)
FROM emp group BY deptno;

--���� �÷��� �̿��� �׷��� 
�ϴ� �̻� �÷��� ����Ͽ� �׷��� ������ �׷캰�� �ٽ� ���� �׷����� ����

SELECT deptno, avg(sal),min(sal),max(sal)
FROM PROFESSOR p GROUP BY deptno;

SELECT deptno,profno,sal 
FROM PROFESSOR p ORDER BY deptno;

SELECT deptno, grade,count(*),round(avg(weight))
FROM STUDENT s GROUP BY deptno, grade;

ROLLUP
GROUP by���� �׷� ���ǿ� ���� ��ä���� �׷�ȭ �ϰ� �� �׷� �� ����
�κ����� ���ϴ� ������
GROUP BY���� Į������ n���̸� ROLLUP �׷��������� n+1��

CUBE
ROLLUP�� ���� �׷� ����� GROUP BY ���� ����� ���ǿ� ���� �׷� ������ ����� ������
GROUP BY ���� Į������ n���̸� CUBE �׷��� ������ 2n��

SELECT deptno, sum(sal)
FROM PROFESSOR p 
GROUP BY rollup(deptno);

SELECT deptno,position, count(*)
FROM PROFESSOR p GROUP BY rollup(deptno,position);

SELECT deptno,POSITION,count(*)
FROM PROFESSOR p GROUP BY cube(deptno,position);

GROUPING �Լ�
�μ��� ������ Į���� ROLLUP �̳� CUBE �����ڷ� ������
�׷����տ��� ���Ǿ����� ���θ� 1 OR 0 ��ȯ

SELECT deptno, count(*),
GROUPING(deptno) grp_dno,
grouping(job) grp_job
from emp
GROUP BY rollup(deptno,job);

SELECT deptno, job, to_char(hiredate,'yyyy')�Ի��, count(*)
FROM EMP e WHERE job='���' OR job='����'
GROUP BY GROUPING sets((deptno,job), (deptno, to_char(hiredate,'yyyy')));


HAVING ��
GROUP BY ���� ���� ������ �׷��� ������� ������ ����
���̺��� WHERE ������ �����ϴ� �� ������ �� ������ GROUP BY ������ �׷���
HAVING ������ ������ �����ϴ� �׷��� ����

SELECT grade, count(*), round(avg(height)) avg_height,
round(avg(weight)) avg_weight
FROM STUDENT s 
GROUP BY GRADE 
ORDER BY avg_height DESC;

SELECT grade, count(*), round(avg(height)) avg_height,
						round(avg(weight)) avg_weight
		FROM STUDENT s GROUP BY GRADE 
		HAVING count(*) > 4
		ORDER BY avg_height DESC;
		
HAVING ���� WHERE �� ��������
���� ���� ������ �׷�ȭ �� ����� ���տ� ���� �˻�����
�׷�ȭ�ϱ����� ���� �˻� ���ǽ���
WHERE ���� ���������ϴ� ����� ȿ����
�ð�����,ó���������

SELECT deptno, avg(sal)
FROM PROFESSOR p GROUP BY DEPTNO 
HAVING deptno > 102;

SELECT deptno, avg(sal)
FROM PROFESSOR p 
WHERE deptno > 102
GROUP BY deptno;

WHERE ������ �׷��Լ��� ����ϸ� 
WHERE count(*) > 4;
err: �׷��Լ��� �㰡 �����ʽ��ϴ�.

SELECT deptno, avg(weight)
FROM STUDENT s GROUP BY deptno;

SELECT max(avg(weight)) max_weight
FROM student
GROUP BY deptno;

SELECT max(count(studno)) max_cnt, min(count(studno)) min_cnt
FROM STUDENT s GROUP BY deptno;