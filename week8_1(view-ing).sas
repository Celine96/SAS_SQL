/*����*/
proc sql;
create view view_name as 
query expression;
quit;

/*���̺귯���� ���� ����*/
/* view���� �ش�: from���� table�� view�� ���� ���̺귯���� �ִٸ�, ���̺귯���� �����*/

proc sql;
	create view sasdata.master as /* library = sasdata, view name = master*/
	select *
	from sasdata.payrollmaster;
quit;

/*omit the library name!! ������ 19:34���� �����ߴµ� ���� ����*/
/* from sasdata.payrollmaster �� �ƴ� from payrollmaster!!*/

proc sql;
	create view sasdata.master as 
	select *
	from payrollmaster; /*work library�� �ƴ϶� master table�� ���� sasdata library�� �ν��Ѵ�!! */
quit;

/*��򸮸� alternative: embed the libname statement within USING CLAUSE*/
proc sql;
create view proc-sql-view as 
query-expression

using staement <libname-clause>;
quit;

/*�ǽ� -���� �ȵ�........�Ф�*/

libname sasdata 'airline_2';
libname airline 'airline_UE';

proc sql;

create view sasdata.journeymen as 
select 
from airline.payrollmaster
where JobCode like '_2'
using libname airline 'airline_UE(renew)';
quit;

proc print data = sasdata.journeymen;
run;

/*activity- view�� ������*/

proc sql;
create view manager.info as 
select *
from fa1.info
outer union corr
select *
from fa2.info
outer union corr
select *
from fa3.info;
