SELECT * FROM tab;

--���̺� ���� ex)

CREATE TABLE address(
	id NUMBER(3),
	name VARCHAR(50),
	addr VARCHAR(100),
	phone VARCHAR(30),
	email VARCHAR(100));
	
SELECT * FROM tab

--���̺� ���� ���� 
DESC address


--���������� �̿��� ���̺� ����

INSERT INTO ADDRESS values(1,'hong','seoul','1234-1234','hong@naver.com');

SELECT * FROM address;

-- as������ �̸��� �÷� �̸� �ٲٰ� ����

CREATE TABLE addr_second(id,name,addr,phone,e_mail) AS SELECT * FROM address;

SELECT * FROM tab;

SELECT * FROM addr_second;

--�������̺��� ������ ���� ����

--�����ͱ��� ����
 CREATE TABLE addr_fourth AS SELECT id,name FROM address;
 
--�����͸� ������������ where ���� �׻� ������ ������ ���
 CREATE TABLE addr_fourth_01 AS SELECT id,name FROM address WHERE 1=2; 
 
 SELECT * FROM addr_fourth;

 SELECT * FROM addr_fourth_01;
 
 --���̺� �÷� �߰�
 
 ALTER TABLE address ADD (birth date);

 SELECT * FROM address 

-- DESC address why error?

 ALTER TABLE address add(comments varchar(200) DEFAULT 'NO comment');

-- �÷� ����

 ALTER TABLE address DROP COLUMN comments;

-- �÷� ������ ũ�� 50���� ����
-- ���� Į���� ũ�⸦ ������ ����� �����ͺ��� �۰� �����ϸ� error �߻�

 ALTER TABLE address MODIFY phone varchar(50);

-- ���̺� �̸� ����

 RENAME addr_second TO Re_address_second
 
 SELECT * FROM tab;

-- ���̺� ���� 

 DROP TABLE addr_fourth_01
 
-- ���̺� ������ �� ������ �����ϴ� ��ɾ�

 SELECT * FROM addr_fourth
 
 TRUNCATE TABLE addr_fourth

-- ���̺� �ּ� �߰�
 
 COMMENT ON TABLE ADDRESS IS '���� �ּҷ��� �����ϴ� ���̺�'
 
-- ������ īŻ�α� ������ ������ ��������
--------------------------------------
-- �����ͺ��̽� ������ ������ ��ü�� ���� ����
-- ����Ŭ ����� �̸��� ��Ű�� ��ü �̸�
-- ����ڿ��� �ο��� ���ٱ��Ѱ� ��
-- ���Ἲ ���� ���ǿ� ��������
-- �÷����� ������ �⺻��
-- ��Ű�� ��ü�� �Ҵ�� ������ ũ��� ������� �������� ũ�� ����
-- ��ü ���� �� ���ſ� ���� ���� ���� ����
-- �����ͺ��̽� �̸�,����,������¥,���۸��,�ν��Ͻ�,�̸�����
 
SELECT table_name FROM USER_tables;

SELECT owner, table_name FROM dba_tables;

SELECT table_name, tablespace_name, min_extents, max_extents
FROM USER_tables
WHERE table_name LIKE 'ADD%';

SELECT object_name, object_type, created
FROM user_objects
WHERE object_name LIKE 'ADD%' AND object_type = 'TABLE'

SELECT * FROM user_catalog;