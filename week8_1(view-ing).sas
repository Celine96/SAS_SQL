/*형태*/
proc sql;
create view view_name as 
query expression;
quit;

/*라이브러리에 대한 수업*/
/* view에만 해당: from절의 table이 view와 같은 라이브러리에 있다면, 라이브러리를 지운다*/

proc sql;
	create view sasdata.master as /* library = sasdata, view name = master*/
	select *
	from sasdata.payrollmaster;
quit;

/*omit the library name!! 이유를 19:34까지 설명했는데 이해 못함*/
/* from sasdata.payrollmaster 가 아닌 from payrollmaster!!*/

proc sql;
	create view sasdata.master as 
	select *
	from payrollmaster; /*work library가 아니라 master table을 만든 sasdata library로 인식한다!! */
quit;

/*헤깔리면 alternative: embed the libname statement within USING CLAUSE*/
proc sql;
create view proc-sql-view as 
query-expression

using staement <libname-clause>;
quit;

/*실습 -이해 안됨........ㅠㅠ*/

libname sasdata 'airline_2';
libname airline 'airline_UE';

proc sql;

create view sasdata.journeymen as 
select 
from airline.payrollmaster
where JobCode like '_2'
using libname airline 'airline_UE(renew)';
quit;

proc print data = sasdata.journeymen;
run;

/*activity- view로 만들자*/

proc sql;
create view manager.info as 
select *
from fa1.info
outer union corr
select *
from fa2.info
outer union corr
select *
from fa3.info;
