a) Display the Number of rows in a table 
 
SQL> SELECT COUNT(*) FROM EMP; 
 
  COUNT(*) ---------- 
        14 
 
b) Write a query to find the minimum,maximum,average & total salary? 
 
SQL> SELECT MIN(SAL),MAX(SAL),AVG(SAL),SUM(SAL) FROM EMP; 
 
  MIN(SAL)   MAX(SAL)   AVG(SAL)   SUM(SAL) ---------- ---------- ---------- ---------- 
       800       5000 2073.21429      29025 
 
 
c) Display the maximum salary being paid to CLERK 
 
SQL> SELECT MAX(SAL) FROM EMP WHERE JOB='CLERK'; 
 
  MAX(SAL) ---------- 
      1300 
 
d) Display the total salary drawn by analyst working in deptno 20 
SQL> SELECT SUM(SAL) FROM EMP WHERE DEPTNO=20 AND JOB='ANALYST'; 
 
  SUM(SAL) ---------- 
      6000 
 
e) Display Department numbers and total number of employees working in each Department? 
 
SQL> SELECT DEPTNO,COUNT(*) FROM EMP 
 2  GROUP BY DEPTNO;
  DEPTNO   COUNT(*) ---------- ---------- 
        30          6 
        20          5 
  10          3 
 
f) Display the various jobs and total number of employees working in each job group? 
SQL> SELECT JOB,COUNT(*) FROM EMP  
     GROUP BY JOB; 
 
JOB          COUNT(*) --------- - --------- 
CLERK                   4 
SALESMAN           4 
PRESIDENT           1 
MANAGER            3 
      ANALYST             2 
 
g) Display each job along with min of salary being paid in each job group? 
 
SQL> SELECT JOB,MIN(SAL), FROM EMP  
       GROUP BY JOB; 
 
JOB          MIN(SAL) ---------  ---------- 
CLERK            800 
SALESMAN    1250 
PRESIDENT    5000 
MANAGER     2450 
       ANALYST         3000 
 
h) Display the minimum,maximum,sum and the average salary for each job type. 
SQL> SELECT JOB,MIN(SAL),MAX(SAL),AVG(SAL),SUM(SAL) FROM EMP 
   GROUP BY JOB; 
 
JOB         MIN(SAL)   MAX(SAL)   AVG(SAL)   SUM(SAL) --------- ---------- ---------- ---------- ---------- 
CLERK            800       1300     1037.5       4150 
SALESMAN        1250       1600       1400       5600 
PRESIDENT       5000       5000       5000       5000 
MANAGER         2450       2975 2758.33333       8275 
ANALYST         3000       3000       3000       6000
g)  Display the deptno,job and number of employees working in each deptno & in each job? 
SQL> SELECT DEPTNO,JOB,COUNT(*) FROM EMP  
  2  GROUP BY DEPTNO,JOB; 
 
    DEPTNO  JOB               COUNT(*) ----------  ---------          ---------- 
        20  CLERK               2 
        30  SALESMAN            4 
        20  MANAGER             1 
        30  CLERK               1 
        10  PRESIDENT           1 
        30  MANAGER             1 
        10  CLERK               1 
        10  MANAGER             1 
        20  ANALYST             2 
 
i) Display the deptno,job and number of employees  working  each job in deptno 20 ? 
 
SQL> SELECT DEPTNO,JOB,COUNT(*) FROM EMP  
  2  WHERE DEPTNO=20  
  3  GROUP BY DEPTNO,JOB; 
 
    DEPTNO JOB          COUNT(*) ----------  ---------  ---------- 
        20 CLERK               2 
        20 MANAGER             1 
 20 ANALYST             2 
 
j) Display the deptno,job and number of employees  working  each job in deptno 20 & restrict the
count more than 1 ? 
 
SQL> SELECT DEPTNO,JOB,COUNT(*) FROM EMP  
      WHERE DEPTNO=20  
      GROUP BY DEPTNO,JOB 
      HAVING COUNT(*)>1 
     ORDER BY JOB; 
 
    DEPTNO JOB          COUNT(*) ---------- ---------   ---------- 
        20 ANALYST             2 
  20 CLERK                2
