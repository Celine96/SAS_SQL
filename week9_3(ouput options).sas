/*output/�α�ȭ���� global option ���
- options msglevel = i �� �α׿ɼ� (Session 8)
- exec|noexec (session1)*/

/*����*/
proc sql options;

/*����*/
proc sql
INOBS = n
OUTOBS = n

/*NO�� default*/
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
/*����*/
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
