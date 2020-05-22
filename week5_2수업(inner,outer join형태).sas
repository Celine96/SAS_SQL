/*inner join - key 설정을 where 절에 담은것 */
proc sql;
SELECT *
FROM A,B
WHERE A.id = B.id;
quit;

/*inner join- where 절 대신 on 사용하기*/
proc sql;
SELECT *
FROM A inner join B /*2개의 table join 밖에 안됌*/
on A.id - B.id;
quit;

/*outer join -where절 먼저 처*/
proc sql;
SELECT *
FROM A left join B
on A.id = B.id
WHERE A.salary > 10000;
quit;

