/*meta_data ; dictionary tables

- created at initialization
- updated automatically
- limited to read_only */

/*m09d1
: from dictionary.tables
*/
proc sql;
options nolabel nocenter;
select memname format = $20., nobs, nvar, crdate
from dictionary.tables
where libname = 'AIRLINE';
quit;


/* example : use sashelp.vmember to extract information
from dictionary.members in proc tabulate step
tabulate:≈Î∞Ë«•
*/

proc tabulate data = sashelp.vmember format = 8.;
class libname memtype;
keylabel N=' ';
table libname, memtype/rts=10
misstex='None';
run;

