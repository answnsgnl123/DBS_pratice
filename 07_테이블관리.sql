SELECT * FROM tab;

--테이블 생성 ex)

CREATE TABLE address(
	id NUMBER(3),
	name VARCHAR(50),
	addr VARCHAR(100),
	phone VARCHAR(30),
	email VARCHAR(100));
	
SELECT * FROM tab

--테이블 구조 보기 
DESC address


--서브쿼리를 이용한 테이블 생성

INSERT INTO ADDRESS values(1,'hong','seoul','1234-1234','hong@naver.com');

SELECT * FROM address;

-- as문으로 이메일 컬럼 이름 바꾸고 생성

CREATE TABLE addr_second(id,name,addr,phone,e_mail) AS SELECT * FROM address;

SELECT * FROM tab;

SELECT * FROM addr_second;

--기존테이블의 구조만 복사 가능

--데이터까지 복사
 CREATE TABLE addr_fourth AS SELECT id,name FROM address;
 
--데이터를 복사하지않음 where 절에 항상 거짓을 조건을 명시
 CREATE TABLE addr_fourth_01 AS SELECT id,name FROM address WHERE 1=2; 
 
 SELECT * FROM addr_fourth;

 SELECT * FROM addr_fourth_01;
 
 --테이블에 컬럼 추가
 
 ALTER TABLE address ADD (birth date);

 SELECT * FROM address 

-- DESC address why error?

 ALTER TABLE address add(comments varchar(200) DEFAULT 'NO comment');

-- 컬럼 삭제

 ALTER TABLE address DROP COLUMN comments;

-- 컬럼 데이터 크기 50으로 변경
-- 변경 칼럼의 크기를 기존에 저장된 데이터보다 작게 지정하면 error 발생

 ALTER TABLE address MODIFY phone varchar(50);

-- 테이블 이름 변경

 RENAME addr_second TO Re_address_second
 
 SELECT * FROM tab;

-- 테이블 삭제 

 DROP TABLE addr_fourth_01
 
-- 테이블 데이터 와 공간을 삭제하는 명령어

 SELECT * FROM addr_fourth
 
 TRUNCATE TABLE addr_fourth

-- 테이불 주석 추가
 
 COMMENT ON TABLE ADDRESS IS '고객님 주소록을 관리하는 테이블'
 
-- 데이터 카탈로그 데이터 사전의 관리정보
--------------------------------------
-- 데이터베이스 물리적 구조와 객체의 논리적 구조
-- 오라클 사용자 이름과 스키마 객체 이름
-- 사용자에게 부여된 접근권한과 룰
-- 무결성 제약 조건에 대한정보
-- 컬럼별로 지정된 기본값
-- 스키마 객체에 할당된 공간의 크기와 사용중인 공가느이 크기 정보
-- 객체 접근 및 갱신에 대한 정보 감사 정보
-- 데이터베이스 이름,버전,생성날짜,시작모드,인스턴스,이름정보
 
SELECT table_name FROM USER_tables;

SELECT owner, table_name FROM dba_tables;

SELECT table_name, tablespace_name, min_extents, max_extents
FROM USER_tables
WHERE table_name LIKE 'ADD%';

SELECT object_name, object_type, created
FROM user_objects
WHERE object_name LIKE 'ADD%' AND object_type = 'TABLE'

SELECT * FROM user_catalog;