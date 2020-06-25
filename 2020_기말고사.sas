/*1*/
proc sql;
select memname
from dictionary.columns
where libname='ORION'  and upcase(name)='STATE' AND 'EMPOLYEEID';
quit;

/*2*/
options msglevel=i;
proc sql;
create unique index test2
on orion2.employees(Empolyee_ID, State);

select *
from orion2.employees
where Employee_ID=121077 and State="FL";
quit;

/*3*/
%put &syslast &systime &sysdate9.;
%let my_birthday= 16mar1996;
%put &my_birthday;


%sysfunc(my_birthday, weekday.)


/*4(a)*/
%let month=05;
%let year=2010;

proc print data=orion.order_fact;
	where month(order_date)=&month and year(order_date)=&year;
	var customer_id order_date total_retail_price;
	title "Orders in &year &month.." ;
run;

/*4(b)*/
%macro mac(year,month);
proc print data=orion.order_fact;
	where month(order_date)=&month and year(order_date)=&year;
	var customer_id order_date total_retail_price;
	title "Orders in &year &month.." ;
run;
%mend mac;

%mac(2010,05)

/*4(c)*/
%let date1=201005;
%let year1=%substr(%quote(&date1),1,4);
%let month1=%substr(%quote(&date1),5,2);
%put _automatic_;

proc print data=orion.order_fact;
	where month(order_date)=&month1 and year(order_date)=&year1;
	var customer_id order_date total_retail_price;
	title "Orders in &year1 &month1.." ;
run;

/*4(d)-*/
%macro mac(year,month);
proc print data=orion.order_fact;
	where month(order_date)=&month and year(order_date)=&year;
	var customer_id order_date total_retail_price;
	title "Orders in &year &month.." ;
run;
%mend mac;

%mac(&year1,&month1)


/*5*/
proc sql;
create table test5 as
select salary, emplyoee_id
from orion.employee_payroll
order by salary desc;

select *
from test5;
quit;

data _null_;
	set test5 end=no_more;
	call symput('employee'||left(_n_), salary);
	if no_more then call symputx('numrows', _n_);
	run;

%macro putloop;
	%do i=1 %to &numrows;
		%put level&i &&level&i;
	%end;
%mend putloop;


%putloop;


/*5*/
/*(a)*/
proc sql;
   create table work.temporary as
      select employee_id, salary
      from orion2.employee_payroll
      having salary=max(salary);
quit;

data _null_;
   set work.temporary;
   call symputx('Empid',employee_id);
   call symputx('Sal',salary);
run;

proc print data=orion2.employee_addresses;
   var street_name city state country street_id street_number ;
   where employee_id = &Empid;
run;

/*(b)*/
proc sql;
   select employee_id, salary
   into :id , :sal
   from orion2.employee_payroll
   having salary=max(salary);
quit;

proc sql;
   select street_id, street_name, city, state, country, street_number
   from orion2.employee_addresses
   where employee_id = &id;
quit;

/*(c)*/
proc sql outobs=5 double;
   select employee_id, salary
   into :ids separated by ', ' , :sals separated by ', '
   from orion2.employee_payroll
   order by salary;
quit;

proc sql;
   select street_id, street_name, city, state, country, street_number
   from orion2.employee_addresses
   where employee_id in (&ids);
quit;
