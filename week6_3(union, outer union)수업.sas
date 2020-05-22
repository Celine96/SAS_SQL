/*display all of the unque rows of same named coluns in table ONE and table TWO*/
proc sql;
select *
 from one
 union corr
select *
 from two;
 quit;

 /*union in table*/


 /*outer union*/

 /*outer union in table*/
 proc sql;
 select *
 from airline.mechanicslevel1
 outer union corr
 select *
 from airline.mechanicslevel2
 outer union corr
 select *
 from airline.mechanicslevel3;
 quit;

