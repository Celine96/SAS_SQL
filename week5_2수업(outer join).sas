/*�ڵ�: m05d2*/
/*liat all flights during march with corresponding delay information(if it exists)
The airline.flightdelays table does not contain delay information for all of the March flights*/

title 'All March Flights';
proc sql;
	select marchflights.Date,
				marchflights.FlightNumber
						label='Flight Number',
				marchflights.Destination
						label='Left', /*left join�� ���� ���̺�*/
				flightdelays.Destination 
						label='Right', /*right join�� ������ ���̺�*/
				Delay
from airline.marchflights left join airline.flightdelays 
		on marchflights.Date=flightdelays.Date
		and marchflights.FlightNumber = flightdelays.FlightNumber /*key�� Date�� FlightNumber*/
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
  
/*sas �� merge�� sql outer join ��*/

/*sas �� merge*/
data merged;
merge one two;
by x; /*table one �� two�� �ִ� ��� x�� ��µ�*/
run;


/*sql outer join ���� �߻�*/
proc sql;
select one.x, a, b /*two.x�� �ش��ϴ� x�� null ���� ��µ�*/
from one full join two /*table a �� b*/
on one.x = two.x;
quit;


/*sql outer join  ���� �ذ�??- �ȉ�*/
proc sql;
select one.x, two.x, a, b  /*two.x, one.x�� �ش��ϴ� x�� ���� null ���� ��µ�*/
from one full join two /*table a �� b*/
on one.x = two.x;
quit;


/*sql outer join  ���� �ذ�??- ��*/
proc sql;
select coalesce(one.x, two.x)
label = 'x', a,b
from one full join two /*table a �� b*/
on one.x = two.x;
quit;
