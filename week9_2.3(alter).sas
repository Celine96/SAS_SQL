/*alter table*/

proc sql;
alter table table_name
add �÷� �ش��÷��Ӽ�
drop �÷�
modify �÷� (�÷��� ���� �ƴ�  �Ӽ� �ٲٱ�);
quit; 
 
/*Bonus�� Level�÷� �߰�*/
proc sql;
alter table airline.payrollmaster
add Bonus num format = comma10.2
	  ,Level char(3); 
quit;

/*drop DestinationType*/
proc sql;
 alter table airline.flightdelays
 drop DestinationType;
 quit;

/*modify attributes(len, informat, format, label) of cloumns*/
proc sql;
alter table airline.payrollmaster
modify Bonus num format=comma8.2
			,Level char(1) label = 'Empolyee Level';
quit;


/*example- ���� �Ѱ�*/
proc sql;
alter table airline.payrollmaster
add Age
drop DateOfHire
modify DateOfBirth format = 'mmddyy10'd;
quit;

/*example- ����*/
proc sql;
create table work.payrollmaster as
select * 
from airline.payrollmaster;

alter table payrollmaster
add Age num /*Age��� �÷��� �߰�*/
modify DateOfBirth date format = mmddyy10.
drop DateOfHire;

update airline.payrollmaster
set Age = int((today()-DateOfBirth)/365.25); /*Age�� value�� �߰�*/
quit;
