  /* SET ����*/

data alpha;
input X $ A $;
cards;
1	x
1	y
3	z
4	v
5	w
;


data beta; 
input X $ B $;
cards;
1	x
2	y
3	z
3	v
5	w
;

/*CORR�� position ���ʷ� ��ġ�°� �ƴ϶� ������ �÷��� ���Ʒ��� ��ġ�� ��
ALL�� SETƯ���� ������ duplicate�� ����ϴ� ��*/
proc sql;
select *
   from alpha 
except corr all
select *
   from beta;
quit;

proc sql;
select *
   from alpha 
except corr 
select *
   from beta;
quit;

proc sql;
select *
   from alpha 
except all
select *
   from beta;
quit;

/*����Ǯ��*/
proc sql;
select count(*)
from 
(select EmpId
from airline.staffmaster
except all
select EmpId
from airline.staffchanges);
quit;


