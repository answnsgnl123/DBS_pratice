--그룹함수
테이블의 전채 행을 하나 이상의 컬럼을 기준으로 그룹화 하여 그룹별 
로 결과를 출력한는 함수,
그룹함수는 통계적인 결과를 출력하는데 사용 

Count
-테이블 조건을 만족하는 행을 개수를 반환하는 함수

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

--Group by 절 특정 칼럼 값을 기준으로 행을 그룹별로 나누는 절
ex) 교수 테이블에서 소속 학과별이나 직급별로 평균 급여를 구하는
경우
GROUP BY 절에서는 명시되지 않은 칼럼은 그룹 함수와 함께 사용할수 없음
그룹핑 전에는 WHERE 절을 사용하여 그룹 대상을 집합을 먼저 선택
반드시 칼럼 이름을 포함해야 하며 칼럼 별명은 사용할수없음
SELECT 절에서 나열된칼럼이름이나 표현식은 GROUP by절에 반드시 명시

err code
SELECT deptno, job, avg(sal)
FROM EMP e GROUP BY deptno;
--select 절에서 group by절에 명시하지않은 job 컬럼을 사용할수없다


SELECT deptno,count(*), count(comm)
FROM emp group BY deptno;

--다중 컬럼을 이용한 그룹핑 
하느 이상 컬럼을 사용하여 그룹을 나누고 그룹별로 다시 서브 그룹으로 나눔

SELECT deptno, avg(sal),min(sal),max(sal)
FROM PROFESSOR p GROUP BY deptno;

SELECT deptno,profno,sal 
FROM PROFESSOR p ORDER BY deptno;

SELECT deptno, grade,count(*),round(avg(weight))
FROM STUDENT s GROUP BY deptno, grade;

ROLLUP
GROUP by절의 그룹 조건에 따라 전채행을 그룹화 하고 각 그룹 에 대해
부분합을 구하는 연산자
GROUP BY절에 칼럼수가 n개이면 ROLLUP 그룹핑조합은 n+1개

CUBE
ROLLUP에 의한 그룹 결과와 GROUP BY 절에 기술된 조건에 따라 그룹 조합을 만드는 연산자
GROUP BY 절에 칼럼수가 n개이면 CUBE 그룹핑 조합은 2n개

SELECT deptno, sum(sal)
FROM PROFESSOR p 
GROUP BY rollup(deptno);

SELECT deptno,position, count(*)
FROM PROFESSOR p GROUP BY rollup(deptno,position);

SELECT deptno,POSITION,count(*)
FROM PROFESSOR p GROUP BY cube(deptno,position);

GROUPING 함수
인수로 지정된 칼럼이 ROLLUP 이나 CUBE 연산자로 생성된
그룹조합에서 사용되었는지 여부를 1 OR 0 반환

SELECT deptno, count(*),
GROUPING(deptno) grp_dno,
grouping(job) grp_job
from emp
GROUP BY rollup(deptno,job);

SELECT deptno, job, to_char(hiredate,'yyyy')입사년, count(*)
FROM EMP e WHERE job='사원' OR job='과장'
GROUP BY GROUPING sets((deptno,job), (deptno, to_char(hiredate,'yyyy')));


HAVING 절
GROUP BY 절에 의해 생성된 그룹을 대상으로 조건을 적용
테이블에서 WHERE 조건을 만족하는 행 집합을 행 집합을 GROUP BY 절에서 그룹핑
HAVING 절의해 조건을 만족하는 그룹을 선택

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
		
HAVING 절과 WHERE 절 성능차이
내부 정렬 과정에 그룹화 된 결과의 집합에 대해 검색조건
그룹화하기전에 먼저 검색 조건실행
WHERE 절을 먼저실행하는 방법이 효율적
시간단축,처리성능향상

SELECT deptno, avg(sal)
FROM PROFESSOR p GROUP BY DEPTNO 
HAVING deptno > 102;

SELECT deptno, avg(sal)
FROM PROFESSOR p 
WHERE deptno > 102
GROUP BY deptno;

WHERE 절에서 그룹함수를 사용하면 
WHERE count(*) > 4;
err: 그룹함수는 허가 되지않습니다.

SELECT deptno, avg(weight)
FROM STUDENT s GROUP BY deptno;

SELECT max(avg(weight)) max_weight
FROM student
GROUP BY deptno;

SELECT max(count(studno)) max_cnt, min(count(studno)) min_cnt
FROM STUDENT s GROUP BY deptno;