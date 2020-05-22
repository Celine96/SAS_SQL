/*updating views
- View ���� , insert, delete, update �� �� �ִ�.
- only single table is allowed through a view. it cannot be joined or linked to another table nore subquery
- �̹� ����� �÷��� update�� �� �ִ�
- summary query�� order by�� update�� �Ұ����ϴ� */

/*view �����*/

proc sql;
create view airline.raise as 
select EmpID, JobCode, Salary,
Salary/12 as MonthlySalary format = dollar12.
from airline.payrollmaster;

/*view update �ϱ�*/
proc sql;
update airline.raise
set Salary = Salary *1.20
where JobCode = 'PT3';
quit;
