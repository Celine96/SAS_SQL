/*update table, set, case*/

/*set으로 컬럼의 value 바꾸기*/
proc sql;
update table_name
set column1 = new_column1 , column2 = new_column2
where = condition;
quit;

proc sql;
update one
set x = x*2
where y contains 'a';
quit;

/*example : give 5% raise to all level 1 employees*/

proc sql;
create table work.payrollmaster as 
select *
from airline.payrollmaster;
quit;

proc sql;
update payrollmaster 
set Salary = Salary * 1.05
where Jobcode like '_1';

select *
from payrollmaster;
quit;

/*case when end; : case별 조건 !*/
proc sql;
update payrollmaster
set Salary = Salary * 
	case substr(Jobcode,3,1)
		when '1' then 1.05
		when '2' then 1.10
		when '3' then 1.15
		else 1.08
	end;

select *
from payrollmaster;
quit;

/*case when end;를 select 문에서 사용하기*/

proc sql;
select LastName, FirstName, JobCode,
		case substr(JobCode,3,1)
			when '1' then 'Junior'
			when '2' then 'Intermediate'
			when '3' then 'Senior'
			else 'None'
			end as Level
	from airline.payrollmaster as p 
			,airline.staffmaster as s
	where p.EmpID = s.EmpID;

quit;

