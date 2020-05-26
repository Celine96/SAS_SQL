/*2�� ����: jobcode�� TA�� ������ ����ȣ�� ���� ������ �̸��� jobcategory�� ����ض�
- ������ ����: staffmaster(�̸�), payrollmaster(jobcode) - ������ empid
- ���� ����: frequentflyer - ������ phonenumber*/

proc sql;
select lastname, firstname, substr(jobcode,1,2) as JobCategory
	from airline.staffmaster as s, airline.payrollmaster as p
	where s.empid=p.empid 
	and substr(jobcode,1,2)='TA' 
	and exists 
	(select phonenumber
	from airline.frequentflyers);
quit;

