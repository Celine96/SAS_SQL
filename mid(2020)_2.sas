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

/*정답 : not exist 쿼리 사용
frquentflyer의 정보는 고객의 정보이지만 이름은 직원이름
- name은 frquentflyer table꺼고, 이걸 저 inner table의 lastname, firstname이랑 비교한거구나*/
proc sql;
select substr(jobcode, 1,2) as Jobcategory
		, lastname
		, firstname
from airline.payrollmaster as p, airline.staffmaster as s
where p.empid=s.empid
and substr(jobcode,1,2) = 'TA'
and not exists (select *
		from airline.frequentflyers
		where trim(lastname)||","||firstname=name); 
quit;


