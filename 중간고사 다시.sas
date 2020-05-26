/*1��*/

proc sql;
title '��������' ;
select JobCode, count(*) as total
from airline.payrollmaster
group by JobCode;
quit;


proc sql;
title '�� ��������' ;
select JobCode, count(*) as male
from airline.payrollmaster
where Gender='M'
group by JobCode;
quit;


proc sql;
title '�� ��������' ;
select JobCode, count(*)
from airline.payrollmaster
where Gender='F'
group by JobCode;
quit;


proc sql;
title  '���� ������ ����'; /*jobcategory��� ����� �޶� ����� �ȵǳ�*/
select JobCode
		,m/t*100 as percent format = percent8.2
from(
select JobCode, count(*) as m
from airline.payrollmaster
where Gender='M'
group by JobCode

union 

select  JobCode, count(*) as t
from airline.payrollmaster
group by JobCode )
;
quit;

/*table ���� ���� �ذ�*/
proc sql;
title '�� ��������' ;
create table male as
select JobCode, count(*) as count
from airline.payrollmaster
where Gender='M'
group by JobCode;

select *
from male;
quit;



proc sql;
title '��������' ;
create table total as
select JobCode, count(*) as count
from airline.payrollmaster
group by JobCode;

select *
from total;
quit;


proc sql;
title '���� ���� ����' ;
select  m.JobCode
		, m.count/t.count format=percent8.2 label = 'Male Ratio'
from male as m, total as t
where m.JobCode = t.JobCode;
quit;

/*sum�� ����Ѵٴ� �� */
proc sql;
select JobCode,
,count(*)
sum(Gender='M')
from airline.payrollmaster
group by JobCode;
quit;

/*������ �ڵ�-1�� = ������ �ڵ�� ����*/
proc sql;
   select jobcode,count(empid) as Total, sum(gender='M') as Male, sum(gender='F') as Female, 
      calculated Male/ calculated Total as Percentage label='Male Percent' format=percent8.2
      from airline.payrollmaster
      group by jobcode
      order by percentage;
quit;


/*2��- ����ȣ ã�� ��, Ǯ�̴� �������� */


/*������ �ڵ�-2��*/
proc sql;
   select name, 'TA' as JobCategory
      from(select trim(lastname)||', '||firstname as Name
            from airline.staffmaster
            where empid in
            (select empid
               from airline.payrollmaster
               where substr(jobcode,1,2) =  'TA'))
   where name not in
   (select name
      from airline.frequentflyers);
quit;


/*table�� �̸��� ��������- �̰� �� ���*/
proc sql;
create table total_e as
select EmpID, JobCode, Salary
from (
select *
from airline.mechanicslevel1
union all
select *
from airline.mechanicslevel2
union all
select *
from airline.mechanicslevel3 )
;

select *
from total_e;
quit;

proc sql;
select e.JobCode, s.LastName, s.FirstName, e.Salary
from total_e as e ,airline.staffmaster as s
where e.EmpId = s.EmpId;
quit;

/*4��- reward char���� ����*/

proc sql;
create table reward
(mileage num format = comma5.2
,year num
,level char(20)
,reward char(40) );
quit;

proc sql;
insert into reward(mileage, year, level, reward)
values(100000, 2020, 'Gold', '50% discount on international flight')
values(40000, 2020, 'Silver', 'one free ticket on domestic flight')
values(10000, 2020, 'Bronze', '10% discount on domestic flight');
quit;

proc sql;
select *
from reward;
quit;


/*5�� -** �ε�?*/
proc sql;
create view new1 as
select s.lastname, s.firstname
, p.salary 	format = dollar10.0
, salary*1.05*int((today()-DateOfHire)/365.25) as new_salary format = dollar10.0
from airline.staffmaster as s,
		airline.payrollmaster as p;
quit;
proc sql;
select *
from new1
where new_salary-salary>300000
order by lastname, new_salary desc
;
quit;
