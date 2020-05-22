/*output/로그화면의 global option 기능
- options msglevel = i 는 로그옵션 (Session 8)
- exec|noexec (session1)*/

/*형태*/
proc sql options;

/*종류*/
proc sql
INOBS = n
OUTOBS = n

/*NO가 default*/
PRINT|NOPRINT
NONUMBER|NUMBER 
NODOUBLE|DOUBLE
NOSTIMER|STIMER

NOFLOW|FLOW|FLOW= n|Flow= n m;
quit;

/*example:
Display the awards table with flowed character columns and double spacing*/
proc sql flow=13 double;

/*example:
read ten rows from airline.marchflights*/

proc sql inobs=10;
select FlightNumber, Date
from airline.marchflights;

/*reset options*/
/*형태*/
proc sql;
RESET options;
quit;


 /* <sa_16> Student Activity 16 */

  /* set outobs and number options */
proc sql outobs=2 number;
    select * from airline.payrollmaster;

  /* specify that row numbers be supressed */
reset nonumber;
	select * from airline.payrollmaster;

  /* alter the number of output observations */
reset outobs=10;
    select * from airline.payrollmaster;
 
quit;
