--듀얼 테이블  산술결과를 한줄로 얻기위해서 제공해주는 테이블
--듀얼테이블의 사용용도 사용자가 (함수) 계산을 임시로 사용하는데 적합하다.
SELECT 24*40
FROM dept;

SELECT 24*40
FROM dual;

--단일행 함수 :테이블에 저장되어있는 개별 행을 대상으로 함수를 적용하여 하나의 결과를 반환하는함수
--복수행 함수 : 조건에따라 여러행을 그룹화하여 그룹별로 결과를 하나씩 반환하는 함수

FUNCTION name (COLUMN | expression [arg1,arg2,,,,])
FUNCTION 단일행 함수이름
COLUMN:컬럼이름
expression:문자열 또는 표현식 
arg1:함수 인수 

MOD:함수 m을 n으로나눈 나머지

SELECT ename, sal , comm , MOD (sal,comm)
FROM emp
WHERE deptno = 30;

INITCAP: 인수로 ㅇ입력되는 칼럼이나 표현식의 문자열 에서 첫번쨰 영문자를 대문자로 변환하는함수

SELECT name, userid, INITCAP(userid)
FROM student
WHERE  name = '김영균';

LTRIM,RTRIM 함수
LTRIM와 RTRIM 함수는 문자열에서 특정 문자를 삭제하기 위해 사용 함수의 인수에서 삭제할 문자를 지정하지않으면 문자열 앞뒤로부터 부분 공백을 삭제


SELECT dname, Rtrim(dname,'과')
FROM DEPARTMENT;

LENGTH 함수는 인수로 입력되는 칼럼이나 표혆식의 문자열 길이를 반환하는 함수이 고, (홍길동) 길이3
LENGTHB 함수는 문자열 바이트수를 반환하는 함수이다 (홍길동)= 6바이트

SELECT dname, LENGTH(dname),LENGTHB(dname)
FROM DEPARTMENT;

--명시적인 데이터 타입 변환
TO_CHAR : 숫자/날짜타입을 문자로 변환
TO_NUMBER : 문자열을 숫자 타입으로 변환 
TO_DATE: 문자열을 날짜 타입으로 변환 

SELECT empno, to_char(hiredate, 'yy-mm') 입사일
FROM emp 
WHERE ename = '김사랑';

SELECT name, grade, to_char(birthdate, 'day month dd, yyyy')생년월일
FROM  STUDENT 
WHERE deptno = 102;

SELECT ename, to_char(hiredate, 'MONTH dd, yyyy hh24:mi:ss pm')입사일
FROM emp
WHERE deptno=20;

SELECT ename, to_char(hiredate, 'mon "the" ddth "of" yyyy')입사일
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

SELECT to_char(sysdate,'yyyy-mm-dd')현재날짜
FROM dual;

ROUND,TRUNC함수 날짜를 반올림 또는 절삭

SELECT to_char(sysdate, 'yy/mm/dd hh24:mi:ss')노말,
		to_char(trunc(sysdate), 'yy/mm/dd hh24:mi:ss')TRUNC함수,
		to_char(round(sysdate), 'yy/mm/dd hh24:mi:ss')ROUND함수
		FROM dual;

SELECT to_char(hiredate, 'yy-mm-dd')입사일,
	to_char(round(hiredate,'dd'), 'yy-mm-dd')round_dd,
	to_char(round(hiredate,'mm'), 'yy-mm-dd')round_mm,
	to_char(round(hiredate,'yy'), 'yy-mm-dd')round_yy
	FROM PROFESSOR p 
	WHERE deptno = 101;


--사용안됌
SELECT empno, hiredate,
		months_between(sysdate, hiredate)TENURE,
		add_months(hiredate, 6) REVIEW
		FROM EMP
		WHERE MONTHS_BETWEEN(sysdate, hiredate) < 120;
	
SELECT sysdate, last_day(Sysdate), next_day(sysdate,'일')
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
		
	
--DECODE 함수 
	--기존 프로그래밍 if 문이나 case 문으로 표현되는 복잡한 알고리즘을 하나의 sql 명령어로 간단하게 표현할수있는 유용한 기능
	
SELECT name, deptno, sal,
	CASE WHEN deptno = 101 THEN sal*0.1
		 WHEN deptno = 102 THEN sal*0.2
		 WHEN deptno = 201 THEN sal*0.3
		 ELSE 0
		END bobus
		FROM PROFESSOR p ;