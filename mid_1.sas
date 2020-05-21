/*1. Using airline.payrollmaster table, create report that display the columns of total number of employees total number of male employees, total 
number of female employee, percent of male employees by jobcode. Order the report according to the percent of male order.
Add label and format to the percent of male employees column. (10pt)
1. airline.payrollmaster ���̺��� �̿��Ͽ� ������ �÷��� ����Ѵ�. �� ������, �� ����������, �� ����������, ���������� ������ jobcode ���� ����Ͽ� ����Ѵ�. 4
�̶� ���� ���������� ������ ���� ������������ �����Ѵ�. ���������� ���� �÷��� ������ label�� format�� �Ҵ��Ѵ�. (10��)*/

proc sql;
select jobcode, count(empid) as Total, sum(gender='M') as Male, sum(gender='F') as Female, 
		calculated Male/calculated Total as percent label = 'Male Percentage' format=percent8.2 
		from airline.payrollmaster
		group by jobcode
		order by percent;
		quit;
