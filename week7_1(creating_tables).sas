/*loading data into a table*/

/*method 1. create an empty table and specify all column attribute*/

proc sql;
create table table_name (table�� attribute)
;
quit;
/*method 2. copying column attribute with the LIKE clause*/

proc sql;
create table table_name LIKE table_name
;
quit;

/*method 3. create a table from a query result*/

proc sql;
create table table_name AS table_name
;
quit;

/* method1 - �������� ������ ���̺� �����*/
proc sql;	
	create table airline.discount /*name of the table*/
		(destination char(3) /*table columns' attributes- column , data type - char/num */
		, BeginDate num format=date9.
		,EndDate num format=datae9.
		,Discount num);
	quit;

proc sql;
	create table discount
		(destination char(3)
		, BeginDate date label = 'Begins' /*���� num format = date0. (==) data format*/
		, EndDate data label = 'Ends'
		, Discount num);
	quit;

proc sql;
create table x
	(name char(20)
	, birthdate date
	,salary num format = comma10.2);
	quit;



/* method 2 - like ���Ŀ� ���� table�� attibute�� ������ �� */

proc sql;
	create table airline.delaycat
	(drop = DelayCategory DestinationType) /*��� python ���� drop�� �ֳ�*/
	like airline.flightdelays;

select *
from airline.delaycat;
quit;
/*method3 - as ������ table attribute �Ӹ� �ƴ϶� query result data�� ���� */
proc sql;
	create table airline.fa as /*colum heading �̿��Ҷ��� ���� as, method3 ������� table �������*/
		select lastname, firstname,salary
		from airline.payrollmaster, airline.staffmaster
		where payrollmaster.empid = staffmaster.empid
		and jobcode contains 'FA';

		select * /*������ ���� airline.fa�� ����ϱ� ���� �ۼ�*/
		from airline.fa;

quit;
