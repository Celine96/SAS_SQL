proc sql;
create view new1 as 
	select s.lastname, s.firstname, 
	p.salary, p.salary*(1.05)**int((today()-dateofhire)/365.25) as new_salary  format=dollar10.3
	from airline.staffmaster as s, airline.payrollmaster as p
	where s.empid=p.empid;
quit;

proc sql;
select lastname, firstname, salary, new_salary label = 'New Salary' format=dollar10.3
from new1
where new_salary-salary>300000
order by lastname, new_salary desc;
quit;
