SELECT * FROM tabs;


-- �����ͺ��̽� ��� ����

1.�����̼� = ���̺�
2.ATTRIBUTE, ��Ʈ����Ʈ = �Ӽ� ��ä�� entity �����ϰ� ���
 --��Ʈ����Ʈ ���� �Ӽ� ���� 
3. tuple Ʃ�� = ���ڵ�
 --ī�𳯸�Ƽ Ʃ���� ���� ī�𳯸�Ƽ�� 0�� �������ִ� 
4.DOMAIN ������ : �����̼��� �Ӽ��� ���� 
 --�����̼��� �������ִ� �Ӽ����� �� ������ ���� �װ��� ��,���� �����ϰ� 
 --�������� ������ ��,�� �̿ܿ� ���� �����ϴ°� �����Ҽ��ֽ��ϴ�.

--��ҹ��� ������������

SELECT ��
���� ���� �����Ϸ��� ��Ʈ����Ʈ(�Ӽ�) ����Ʈ ����
DISTINCT ���� ����Ͽ� �ߺ� ����

FROM 
���ǿ��� �ʿ�� �ϴ� �����̼�(���̺�)�� ����Ʈ ����

WHERE 
���� ��� SELECT ���꿡 ���ǿ� �ش� 

��ø����
�ٸ������� WHERE ���� ���Ե� SELECT ���꿡 ���ǿ� �ش�

GROUP BY 
�����Ѱ��� ���� Ʃ�õ��� �� �׷����� ���´�

HAVING 
Ʃ��

SELECT ename, sal * 2
FROM EMP;

SELECT empno, ename, sal 
FROM EMP 
WHERE sal BETWEEN 400 AND 500;

SELECT empno, ename, sal, comm
FROM EMP
WHERE comm in(80,100,200);

--error
SELECT EMPNO,ENAME
FROM EMP 
WHERE ENAME LIKE = '��%'; -- = ��ȣ ��� x

SELECT empno, ename, sal, comm
FROM EMP 
WHERE ENAME LIKE '__��%';

SELECT  *
FROM EMP;

SELECT ename, job, depno
FROM EMP 
WHERE DEPTNO=30 AND (job='����' OR job='���');