create database satish;
use satish;
CREATE TABLE EMPY
       (EMPNO int ,
        ENAME VARCHAR(10),
        JOB VARCHAR(9),
        MGR int,
        HIREDATE date,
        SAL int,
        COMM int,
        DEPTNO int);


INSERT INTO EMPY VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        CAST('1980-12-17' as DATE),  800, NULL, 20);
INSERT INTO EMPY VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        CAST('1981-02-20' as DATE), 1600,  300, 30);
INSERT INTO EMPY VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        CAST('1981-02-22' as DATE), 1250,  500, 30);
INSERT INTO EMPY VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        CAST('1981-04-02' as DATE),  2975, NULL, 20);
INSERT INTO EMPY VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        CAST('1981-09-28' as DATE), 1250, 1400, 30);
INSERT INTO EMPY VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        CAST('1981-05-01' as DATE),  2850, NULL, 30);
INSERT INTO EMPY VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        CAST('1981-06-09' as DATE),  2450, NULL, 10);
INSERT INTO EMPY VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        CAST('1982-12-09' as DATE), 3000, NULL, 20);
INSERT INTO EMPY VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        CAST('1981-11-17' as DATE), 5000, NULL, 10);
INSERT INTO EMPY VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        CAST('1981-09-08' as DATE),  1500, NULL, 30);
INSERT INTO EMPY VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        CAST('1983-01-12' as DATE), 1100, NULL, 20);
INSERT INTO EMPY VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        CAST('1981-12-03' as DATE),   950, NULL, 30);

INSERT INTO EMPY VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        CAST('1981-12-03' as DATE),  3000, NULL, 20);
INSERT INTO EMPY VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        CAST('1982-01-23' as DATE), 1300, NULL, 10);

use satish;

CREATE TABLE DEPT
       (DEPTNO INT,
        DNAME VARCHAR(14),
        LOC VARCHAR(13) );
       
        

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

 #DISPLAY UNIQUE JOB FROM EMPY TABLE;
        select distinct job FROM EMPY;
        SELECT ENAME,SAL FROM EMPY ORDER BY SAL ASC;
        SELECT ENAME,DEPTNO,JOB FROM EMPY ORDER BY DEPTNO ASC,JOB DESC;
       
       SELECT MGR FROM EMPY;
       SELECT*FROM EMPY WHERE HIREDATE<'1981-01-01';
       SELECT ENAME, HIREDATE FROM EMPY WHERE HIREDATE<'1981-01-01';
       SELECT EMPNO,ENAME,SAL,SAL/30 DAILYSAL,12*SAL ANSAL FROM EMPY
       ORDER BY ANSAL ASC;
       SELECT EMPNO, ENAME, JOB, HIREDATE,datediff('2022-02-25',HIREDATE)/365 EXP
       FROM EMPY;
        List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369
        SELECT EMPNO, ENAME,SAL,DATEDIFF('2022-02-25',HIREDATE)/365 EXP FROM EMPY
        WHERE MGR=7902;
        
        SELECT*FROM EMPY WHERE COMM>SAL;
        
        SELECT ENAME,JOB,HIREDATE FROM EMPY WHERE HIREDATE>'1981-06-01'and empno>7368
        order by job asc;
        
        select ename,job,DATEDIFF('2022-02-25',HIREDATE)/365,sal,SAL/30 DAILYSAL 
        from empy 
        order by dailysal>100;
        select*from empy where ('salary'/30)>100;
        select ename,job from empy where job='clerk' or job='analyst'
        order by job desc;
        select*from empy 
        where hiredate in('1980-06-19','1981-12-17','1981-05-01','1981-12-03')
        order by hiredate asc;
        
        select * from dept where deptno=10 or deptno=20;
     
     select*from empy where 12*sal between 22000 and 40000 ;
     
     select * from empy where ename like 's%'and length(ename)=5;
     select*from empy where length(ename)=4 and ename like '__r(3)%';
     select*from empy where length(ename)=5 and ename like 's%h';
     
      select*from empy where to_char(hiredate,'mon')='jan';  
select * from empy where ename  like '%ll%';
        select*from empy where hiredate between '1980-01-01' and '1980-12-31';
        select*from empy where hiredate like '%80%';
        Select*from empy where not deptno=20;
SELECT * FROM EMPY WHERE DEPTNO <>20;
SELECT ENAME,JOB,EMPNO FROM EMPY WHERE MGR=(SELECT DISTINCT(MGR)) AND LOWER(JOB)='MANAGER';
SELECT*FROM EMPY WHERE HIREDATE NOT LIKE'%03%';
SELECT*FROM EMPY WHERE JOB='CLERK' AND DEPTNO=20;
SELECT*FROM EMPY WHERE DEPTNO=30 OR DEPTNO=10 BETWEEN '1981-01-01' AND '1981-12-31';
SELECT*FROM EMPY WHERE ENAME='SMITH';
SELECT E.ENAME,D.LOC FROM EMPY E INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO
WHERE E.ENAME='SMITH'; 
SELECT* FROM EMPY E LEFT JOIN DEPT D ON  
E.DEPTNO=D.DEPTNO WHERE D.DNAME IN ('ACCOUNTING','RESEARCH') ORDER BY D.DEPTNO ASC;
 select * from empY e ,dept d where d.dname in
('ACCOUNTING','RESEARCH') and e.deptno = d.deptno order by e.deptno
asc;
SELECT E.EMPNO,E.ENAME,E.SAL,D.DNAME,E.HIREDATE,DATEDIFF('2022-02-26',HIREDATE)/365 
AS EXP FROM EMPY E INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO
 WHERE JOB IN ('MANAGER,ANALYST') AND LOC IN('NEWYORK','DALLAS') AND HIREDATE<7
 ORDER BY LOC ASC;
	select e.empno,e.ename,e.sal,d.dname,d.loc,e.deptno,e.job 
    from empy e ,dept d where 
    (d.loc='chicago' or d.dname='accounting') and 
    e.deptno=d.deptno and e.empno in (select e.empno from empy e where
    (12*e.sal)>28000 AND E.SAL NOT IN (3000,28000)AND E.JOB!='MANAGER' AND 
    (E.EMPNO LIKE' 7%' OR EMPNO LIKE ' 8%')) ORDER BY E.DEPTNO ASC,E.JOB DESC;

        
        
        
        


