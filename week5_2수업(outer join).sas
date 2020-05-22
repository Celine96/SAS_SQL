/*코드: m05d2*/
/*liat all flights during march with corresponding delay information(if it exists)
The airline.flightdelays table does not contain delay information for all of the March flights*/

title 'All March Flights';
proc sql;
	select marchflights.Date,
				marchflights.FlightNumber
						label='Flight Number',
				marchflights.Destination
						label='Left', /*left join의 왼쪽 테이블*/
				flightdelays.Destination 
						label='Right', /*right join의 오른쪽 테이블*/
				Delay
from airline.marchflights left join airline.flightdelays 
		on marchflights.Date=flightdelays.Date
		and marchflights.FlightNumber = flightdelays.FlightNumber /*key가 Date랑 FlightNumber*/
order by Delay;
quit;

  /* Or use table aliases */

title 'All March Flights';
proc sql;
select l.Date,
       l.FlightNumber label='Flight Number',
       l.Destination label='Left',
       r.Destination label='Right',
       Delay
   from airline.marchflights as l left join airline.flightdelays as r
   		on l.Date=r.Date and l.FlightNumber=r.FlightNumber
   order by Delay;
quit;
  
/*sas 의 merge와 sql outer join 비교*/

/*sas 의 merge*/
data merged;
merge one two;
by x; /*table one 과 two에 있는 모든 x가 출력되*/
run;


/*sql outer join 문제 발생*/
proc sql;
select one.x, a, b /*two.x에 해당하는 x는 null 값이 출력됨*/
from one full join two /*table a 와 b*/
on one.x = two.x;
quit;


/*sql outer join  문제 해결??- 안됌*/
proc sql;
select one.x, two.x, a, b  /*two.x, one.x에 해당하는 x는 각각 null 값이 출력됨*/
from one full join two /*table a 와 b*/
on one.x = two.x;
quit;


/*sql outer join  문제 해결??- 됌*/
proc sql;
select coalesce(one.x, two.x)
label = 'x', a,b
from one full join two /*table a 와 b*/
on one.x = two.x;
quit;
