/*loading data into a table*/

/*method 1. create an empty table and specify all column attribute*/

proc sql;
create table table_name (table의 attribute)
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

/* method1 - 수동으로 데이터 테이블 만들기*/
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
		, BeginDate date label = 'Begins' /*위의 num format = date0. (==) data format*/
		, EndDate data label = 'Ends'
		, Discount num);
	quit;

proc sql;
create table x
	(name char(20)
	, birthdate date
	,salary num format = comma10.2);
	quit;



/* method 2 - like 이후에 나온 table의 attibute가 저장이 됨 */

proc sql;
	create table airline.delaycat
	(drop = DelayCategory DestinationType) /*우왕 python 같이 drop이 있네*/
	like airline.flightdelays;

select *
from airline.delaycat;
quit;
/*method3 - as 이후의 table attribute 뿐만 아니라 query result data가 들어갔어 */
proc sql;
	create table airline.fa as /*colum heading 이용할때와 같은 as, method3 방법으로 table 만들었어*/
		select lastname, firstname,salary
		from airline.payrollmaster, airline.staffmaster
		where payrollmaster.empid = staffmaster.empid
		and jobcode contains 'FA';

		select * /*위에서 만든 airline.fa를 출력하기 위해 작성*/
		from airline.fa;

quit;
