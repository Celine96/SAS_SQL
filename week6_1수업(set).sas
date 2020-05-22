  /* SET 연습*/

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

/*CORR은 position 차례로 붙치는게 아니랑 공통인 컬럼만 위아래로 붙치는 것
ALL은 SET특성을 버리고 duplicate을 허용하는 것*/
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

/*문제풀이*/
proc sql;
select count(*)
from 
(select EmpId
from airline.staffmaster
except all
select EmpId
from airline.staffchanges);
quit;


