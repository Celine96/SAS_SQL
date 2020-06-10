/*define and call macro with macro parameters

-macro variable과 유사함
%let macro variable

%let stats=min max;
&stats

- macro parameters (내가 만든 메크로 안에서만 작동하는 변수라고 생각하면 됨
)

종류는 2가지!
- positional parameters
- keyword parameters
*/

/*positional parameters use a one to one correspondence between the following:
- parameter names supplied on the macro definition
- parameter values supplied o the macro call*/

%macro calc;
	proc means data=orion.order_item &stats;
		var &vars;
	run;
%mend calc;

/* %calc macro 이용 #1*/
%let stats=min max;
%let vars=quantity;
%calc

/* %calc macro 이용 #2*/
%let stats=n mean;
%let vars=discount;
%calc

/*3줄씩 작성하는 위의 작업을 macro parameter를 만들면 줄일 수 있다*/
/*positional parameter*/
%macro calc(stats,vars); 
	proc means data=orion.order_item &stats;
		var &vars;
	run;
%mend calc(min max, quantity);


/*examples of positional parameters*/
/*m103d06a*/
%macro count(opts, start, stop);
	proc freq data=orion.Orders;
		where order_Date between "&start"d and "&stop"d;
		table order_type/ &opts; /*table 옵션은 통계량과 관련된 옵션;opts,nopercent ,nocum*/
		title1 "Orders from &start to &stop";
	run;
%mend count;

options mprint;
%count(nocum, 01jan2014, 31dec2014);
%count(,01jul2014, 31dec2014);
%count(nopercent, 01jan2014, 31dec2014);

/*keyword parameters*/
%macro count(opts=, start=01jan04, stop=31dec04);
	proc freq data=orion.Orders;
		where order_Date between "&start"d and "&stop"d;
		table order_type/ &opts; /*table 옵션은 통계량과 관련된 옵션;opts,nopercent ,nocum*/
		title1 "Orders from &start to &stop";
	run;
%mend count;

options mprint;
%count(opts=nocum);
%count(stop=01jul04, opts=nocum nopercent);
%count();

/*m103d06b실습(수업-28:00, p47다시 )*/
