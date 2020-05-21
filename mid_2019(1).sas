/*1. airline.payrollmaster ���̺��� DateOfBirth �÷��� �̿��Ͽ� ���̸� ����Ͽ� ������ ���, �ּҰ� �ִ밪�� ����Ѵ�. ���� Salary �÷��� �ּҰ�, �ִ밪, ����� ����Ͽ� ������ 
���� ����� ��µǵ��� sql ���α׷��� �ۼ��Ѵ�*/

proc sql;
select  'Salary' as Variable, min(salary) as Minimun ,max(salary) as Maximun,  avg(salary) as Average 
from airline.payrollmaster
union corr
select  'Age' as Variable, min(age) as Minimun ,max(age) as Maximun,  avg(age) as Average 
from (select int((today()-dateofbirth)/365.25) as age
		from airline.payrollmaster);
quit;
