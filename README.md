# DBS_pratice
## DBMS 언어
- DLL
1.데이터 모델 데이터 구조 생성
-CREATE
2.데이터 구조 변경
-ALTER TABLE
3.데이터 구조 삭제
-DROP TABLE
4.데이터 접근을 위해 특정 애트리뷰트 위에 인덱스 정의
-CREATE INDEX

-기본
```
  SELECT
  WHERE
  ORDER BY
```

```
-ORACLE IMPORTENT FUNTION
DUAL
숫자 함수
문자 처리함수
형변환 함수
날짜 함수
NULL을 다른 값으로 변환하는 NVL
DECODE 함수
조건따라 서로 다른 처리가 가능한 CASE
```
```
-GROUP
GROUP BY
HAVING
```

```
-DDL Table Commend
CREATE TABLE  //생성
ALTER TABLE   
RENAME        //이름변경
DROP TABLE    //삭제
TRUNCATE TABLE

-DML 트랜잭션
INSERT
UPDATE
DELETE
```
-데이터 무결성 제약 조건

## 데이터베이스 설계



## 정규화
-비정규 릴레이션

>>도메인의 원자값
-1NF

>>부분함수종속제거
-2NF

>>이행적종속함수제거
-3NF

>>결정자이면서 후보키 아닌것 제거
-BCNF

>>다치 종속 제거
-4NF

>>조인 종속성 이용
-5NF

## 개념적 설계


## 논리적 설계
1.정규 Entity 찾기
2.약한 Entity 찾기
3.정규 1:1
4.1:N
5.N:M
6.3진 관게 타입
7.다치 애트리뷰트
