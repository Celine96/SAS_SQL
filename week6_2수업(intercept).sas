/*student activity*/
/*will the addition of the all modifier have any effect on the output before all modefier?
no. not in this example. However, if there a re duplicate rows common to both tables, then it will have an effect*/
proc sql; 
select * 
from one
intersect all
select * from two;

/*intercept in real table

what are the names of the established employees who had a change in salary*/
proc sql;
select FirstName, LastName
from airline.staffmaster
intersect
select FirstName, LastName
from airline.staffchanges;
quit;

/**/
