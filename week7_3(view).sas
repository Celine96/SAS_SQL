/*view : virtual table을 만들어 테이블을 확인 할 수 있다
사용하는 이유: 
- 공간 절약.  데이터 베이스의 용량을 차지 하지 않고 데이터를 확인 할 수 있어서
- 다른사람들의 qury 접근이 불가능해

- order by caluse가 있다면 view를 사용하지 말고 그냥 qury를 사용하여라
*/

/*형태*/
proc sql;
create view view_name as 
query expression;
quit;

/*activity*/
proc sql; /*view create함*/
	create view airline.faview2 as 
	select LastName, FirstName, Gender,
	int (today()-DateOfBirth/365.25) as Age,
	substr(JobCode, 3,1) as Level,
	Salary

	from airline.payrollmaster as p,
			airline.staffmaster as s
	where JobCode contains 'FA' 
	and p.EmpID = s.empid;

	quit; 

	proc sql;
	select * 
	from airline.faview2;
	quit;

proc tabulate data=airline.faview2;
class Level;
var Age;
table Level*Age*mean;
run;


/*view table에도 describe 가능*/
proc sql;
describe view airline.faview2;
quit;
