/*2번 문제: jobcode가 TA인 직원중 고객번호가 없는 직원의 이름과 jobcategory를 출력해라
- 직원의 정보: staffmaster(이름), payrollmaster(jobcode) - 연결은 empid
- 고객의 정보: frequentflyer - 연결은 phonenumber*/

proc sql;
select lastname, firstname, substr(jobcode,1,2) as JobCategory
	from airline.staffmaster as s, airline.payrollmaster as p
	where s.empid=p.empid 
	and substr(jobcode,1,2)='TA' 
	and exists 
	(select phonenumber
	from airline.frequentflyers);
quit;

