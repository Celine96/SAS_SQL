/*5_3 code 1*/
proc sql;
select Destination	
		,avg(Delay) as average
		format = 3.0 label = 'Average Delay'
		,min(Delay) as min
		format = 4.0 label = 'Minimum Delay'
		,max(Delay) as max
		format = 3.0 label = 'Maximum Delay'
from airline.flightdelays
group by Destination;

quit;

/*5_3 handling a complex qury*/

/*step 1*/
proc sql;
select EmpID
from airline.flightschedule
where Date = '04mar2000'd
and Destination = 'CPH';
quit;

/*step 2 staffmaster에서는 state를, payrollmaster에서는 category를 가져와 
*/

proc sql;
select substr(p.JobCode, 1,2) as Jobcategory
		,s.State
from airline.staffmaster as s,  /*innner join*/
airline.payrollmaster as p
where s.EmpID = p.EmpID and s.EmpID in 
(select EmpID /*step 1에서 만든 non-correlated 서브쿼리*/
from airline.flightschedule
where Date = '04mar2000'd
and Destination = 'CPH');
quit;

/*step3 : 위에서 만든 Jobcategory, State와 supervisor table의 Jobcategory, State 비교해서 
Id가져오기 */
proc sql;
select EmpID
from airline.supervisors as m,

(select substr(p.JobCode, 1,2) as Jobcategory
		,s.State
from airline.staffmaster as s,  /*innner join*/
airline.payrollmaster as p
where s.EmpID = p.EmpID and s.EmpID in 
(select EmpID /*step 1에서 만든 non-correlated 서브쿼리*/
from airline.flightschedule
where Date = '04mar2000'd
and Destination = 'CPH')) as c

where m.JobCategory = c.JobCategory
and m.State = c.State;
quit;

/*step 4 이제 EmpID로부터 staffmaster table의 이름을 가져와*/

proc sql;
select FirstName, LAstName
from airline.staffmaster where EmpID in
(select EmpID
from airline.supervisors as m,

(select substr(p.JobCode, 1,2) as Jobcategory
		,s.State
from airline.staffmaster as s,  /*innner join*/
airline.payrollmaster as p
where s.EmpID = p.EmpID and s.EmpID in 
(select EmpID /*step 1에서 만든 non-correlated 서브쿼리*/
from airline.flightschedule
where Date = '04mar2000'd
and Destination = 'CPH')) as c

where m.JobCategory = c.JobCategory
and m.State = c.State);
quit;
