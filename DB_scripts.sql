SELECT * FROM tabs;


-- 데이터베이스 용어 정리

1.릴레이션 = 테이블
2.ATTRIBUTE, 애트리뷰트 = 속성 개채를 entity 저장하고 사용
 --애트리뷰트 차수 속성 개수 
3. tuple 튜플 = 레코드
 --카디날리티 튜플의 개수 카디날리티는 0을 가질수있다 
4.DOMAIN 도메인 : 릴레이션읠 속성의 집합 
 --릴레이션이 가질수있는 속성들의 값 성별을 정의 그값을 남,여로 저장하고 
 --도메인을 가져와 남,여 이외에 값을 저장하는걸 방지할수있습니다.

--대소문자 구분하지않음

SELECT 절
질의 결고랄 포함하려는 애트리뷰트(속성) 리스트 열거
DISTINCT 절을 사용하여 중복 제거

FROM 
질의에서 필요로 하는 릴레이션(테이블)의 리스트 열거

WHERE 
관계 대수 SELECT 연산에 조건에 해당 

중첩질의
다른질의의 WHERE 절에 포함된 SELECT 연산에 조건에 해당

GROUP BY 
동일한값을 갖는 튜플들을 한 그룹으로 묶는다

HAVING 
튜플

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
WHERE ENAME LIKE = '박%'; -- = 기호 사용 x

SELECT empno, ename, sal, comm
FROM EMP 
WHERE ENAME LIKE '__성%';

SELECT  *
FROM EMP;

SELECT ename, job, depno
FROM EMP 
WHERE DEPTNO=30 AND (job='과장' OR job='사원');