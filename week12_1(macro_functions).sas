data orders;
	set orion.Order_fact;
	where year(Order_Date)=2007;
	Lag=Delivery_Date - Order_Date;
run;

proc means data=orders maxdec=2 min max mean;
	class Order_Type;
	var Lag;
	title "Report based on ORDERS data";
run;

%put sysdate9=&sysdate9;
%put year=%substr(sysdate9, 6);
 

data orders;
	set orion.Order_fact;
	where year(Order_Date)=%substr(&sysdate9,6);
	Lag=Delivery_Date - Order_Date;
run;

proc means data=orders maxdec=2 min max mean;
	class Order_Type;
	var Lag;
	title "Report based on ORDERS data";
run;


 
/*m102d06- (%EVAL )*/
options symbolgen;

%let thisyr=%substr(&sysdate9,6);
%let lastyr=%eval(&thisyr-1);

proc means data=orion.order_fact maxdec=2 min max mean;
	class order_type;
	var total_Retail_price;
	where year(order_date) between &lastyr and &thisyr;
	title1 "Orders for &lastyr and &thisyr";
	title2 "(as of &sysdate9)";
run;

title;

/*m102d07- (%SYSFUNC )
- array processing(dim, hbound, lbound)
- variable information(vname, vlabel, missing)
- macro interface(resolve, symget)
- data conversion (input/inputn/inputc, put/putc/putn)
- other functions(iorcmsg, lag, dif)
*/
title1 "%sysfunc(today(), weekdate.)";
title2 "%sysfunc(time(), timeAMPM8.)";

proc print data=sashelp.class;

run;

title;

/*quiz
- what is the potential problem with the value of statement??
- 이 코드에서 내가 사실상 의도한 바는 title "Payroll Report" ; 즉 ';'도 포함시키는 것이었어

solution!! : (%STR)
- (+, -, *, /, <, > , = , ; , ', " ,  not , blank )와 같은 special token의 의미를 없앤다*/


%let statement=title "Payroll Report";
%put &statement; 

%let statement = %str(title "Payroll Report" ;);
%put &statement;

/*m102d08*/
%let statement = title "S&P 500" ;
%put &statement;

%let statement = %str(title "S&P 500" ;);
%put &statement;

%let statement = %nrstr(title "S&P 500" ;);
%put &statement;

