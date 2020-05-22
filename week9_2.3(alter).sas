/*alter table*/

proc sql;
alter table table_name
add 컬럼 해당컬럼속성
drop 컬럼
modify 컬럼 (컬럼의 값이 아닌  속성 바꾸기);
quit; 
 
/*Bonus와 Level컬럼 추가*/
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


/*example- 내가 한거*/
proc sql;
alter table airline.payrollmaster
add Age
drop DateOfHire
modify DateOfBirth format = 'mmddyy10'd;
quit;

/*example- 정답*/
proc sql;
create table work.payrollmaster as
select * 
from airline.payrollmaster;

alter table payrollmaster
add Age num /*Age라는 컬럼만 추가*/
modify DateOfBirth date format = mmddyy10.
drop DateOfHire;

update airline.payrollmaster
set Age = int((today()-DateOfBirth)/365.25); /*Age의 value를 추가*/
quit;
