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

/*step 2 staffmaster������ state��, payrollmaster������ category�� ������ 
*/

proc sql;
select substr(p.JobCode, 1,2) as Jobcategory
		,s.State
from airline.staffmaster as s,  /*innner join*/
airline.payrollmaster as p
where s.EmpID = p.EmpID and s.EmpID in 
(select EmpID /*step 1���� ���� non-correlated ��������*/
from airline.flightschedule
where Date = '04mar2000'd
and Destination = 'CPH');
quit;

/*step3 : ������ ���� Jobcategory, State�� supervisor table�� Jobcategory, State ���ؼ� 
Id�������� */
proc sql;
select EmpID
from airline.supervisors as m,

(select substr(p.JobCode, 1,2) as Jobcategory
		,s.State
from airline.staffmaster as s,  /*innner join*/
airline.payrollmaster as p
where s.EmpID = p.EmpID and s.EmpID in 
(select EmpID /*step 1���� ���� non-correlated ��������*/
from airline.flightschedule
where Date = '04mar2000'd
and Destination = 'CPH')) as c

where m.JobCategory = c.JobCategory
and m.State = c.State;
quit;

/*step 4 ���� EmpID�κ��� staffmaster table�� �̸��� ������*/

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
(select EmpID /*step 1���� ���� non-correlated ��������*/
from airline.flightschedule
where Date = '04mar2000'd
and Destination = 'CPH')) as c

where m.JobCategory = c.JobCategory
and m.State = c.State);
quit;
