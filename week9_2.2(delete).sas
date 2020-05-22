/*deleting rows*/

proc sql;
delete from table
where expression;
quit;

/*example1*/
proc sql;
delete from one 
where y contains '1';
quit;

/*what happens if you accidentally place a semicolon at the end of the delete clause?*/
/*sa_15.sas*/
proc sql;
create table payrollmaster as 
select *
from airline.payrollmaster;
quit;

proc sql;
delete from work.payrollmster; /*like this*/
where JobCode contains '1';
quit;

/*from airline.frequentflyers table, delete all frequent flyers who wither used all their points or used more than they have*/
proc sql; 
create table work.frequentflyers as
	select * 
		from airline.frequentflyers;

  /* now, delete rows from the temporary table */


   delete from work.frequentflyers
      where PointsEarned-PointsUsed <= 0;
quit;

proc sql;
delete from airline.frequentflyers
where PointsEarned - PointsUsed <= 0;
quit;

