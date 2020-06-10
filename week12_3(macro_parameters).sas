/*define and call macro with macro parameters

-macro variable�� ������
%let macro variable

%let stats=min max;
&stats

- macro parameters (���� ���� ��ũ�� �ȿ����� �۵��ϴ� ������� �����ϸ� ��
)

������ 2����!
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

/* %calc macro �̿� #1*/
%let stats=min max;
%let vars=quantity;
%calc

/* %calc macro �̿� #2*/
%let stats=n mean;
%let vars=discount;
%calc

/*3�پ� �ۼ��ϴ� ���� �۾��� macro parameter�� ����� ���� �� �ִ�*/
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
		table order_type/ &opts; /*table �ɼ��� ��跮�� ���õ� �ɼ�;opts,nopercent ,nocum*/
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
		table order_type/ &opts; /*table �ɼ��� ��跮�� ���õ� �ɼ�;opts,nopercent ,nocum*/
		title1 "Orders from &start to &stop";
	run;
%mend count;

options mprint;
%count(opts=nocum);
%count(stop=01jul04, opts=nocum nopercent);
%count();

/*m103d06b�ǽ�(����-28:00, p47�ٽ� )*/
