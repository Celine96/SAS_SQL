/*drop*/
proc sql;
drop table ;
drop view ;
drop index 

from table_name;
quit;

/*activity
Delete the index EmpID from the airline.payrollmaster table
and delete the tempory table */
proc sql;
drop index EmpID 
from airline.payrollmaster; /*drop index 场车栏聪鳖 ';'*/

drop table Discount;/*drop talbe 场车栏聪鳖 ';'*/
quit;
