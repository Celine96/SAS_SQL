/*inner join - key ������ where ���� ������ */
proc sql;
SELECT *
FROM A,B
WHERE A.id = B.id;
quit;

/*inner join- where �� ��� on ����ϱ�*/
proc sql;
SELECT *
FROM A inner join B /*2���� table join �ۿ� �ȉ�*/
on A.id - B.id;
quit;

/*outer join -where�� ���� ó*/
proc sql;
SELECT *
FROM A left join B
on A.id = B.id
WHERE A.salary > 10000;
quit;

