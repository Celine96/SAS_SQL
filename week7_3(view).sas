/*view : virtual table�� ����� ���̺��� Ȯ�� �� �� �ִ�
����ϴ� ����: 
- ���� ����.  ������ ���̽��� �뷮�� ���� ���� �ʰ� �����͸� Ȯ�� �� �� �־
- �ٸ�������� qury ������ �Ұ�����

- order by caluse�� �ִٸ� view�� ������� ���� �׳� qury�� ����Ͽ���
*/

/*����*/
proc sql;
create view view_name as 
query expression;
quit;

/*activity*/
proc sql; /*view create��*/
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


/*view table���� describe ����*/
proc sql;
describe view airline.faview2;
quit;
