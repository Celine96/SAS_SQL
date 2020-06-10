/*Delimiting Macro variable refernece*/

/*macro 참조는 어느 위치에서나 가능하다*/
text&variable
&variabletext
text&variabletext

&variable&variable

/*combining macro varables with text*/
Yyyyymon
Y&year&month 

%let month = JAN;
%let year = 2000;


%let month=jan;
proc chart data=orion.y2000&month;
	hbar week / sumvar=sale;
run;

proc plot data=orion.y2000&month;
	plot sale*day;
run;

/*year과 month 연결해서 참조
-y&year&month*/
proc chart data=orion.y&year&month;
	hbar week / sumvar=sale;
run;

proc plot data=orion.y&year&month;
	plot sale*day;
run;


/*you can place text after a macro variable reference
- &var*day*/
%let var = sale;

proc chart data=orion.y&year&month;
	hbar week / sumvar=&var;
run;

proc plot data=orion.y&year&month;
	plot &var*day;
run;

/*quiz*/

%let graphics=g;
%let month = JAN;
%let year = 2000;
%let var = sale;


/*&graphicschart, &graphicsplot가 의도한 바는
(gplot, gchart)
에러가 나는 이유: ;와 같이 special token이 없으니까 name token으로 인식해서 에러가 발생

proc gchart data=orion.y&year&month;
	hbar week / sumvar=&var;
run;

proc gplot data=orion.y&year&month;
	plot &var*day;
run;

*/

proc &graphicschart data=orion.y&year&month;
	hbar week / sumvar=&var;
run;

proc &graphicsplot data=orion.y&year&month;
	plot &var*day;
run;


/* solution -> '.'  
사용된 후에 delimiter로 사라진데!!*/

proc &graphics.chart data=orion.y&year&month;
	hbar week / sumvar=&var;
run;

proc &graphics.plot data=orion.y&year&month;
	plot &var*day;
run;

/*교수님 팁? macro variable 참조가 끝날때마다 '.' 찍기*/

proc &graphics.chart data=orion.y&year.&month.;
	hbar week / sumvar=&var.;
run;

proc &graphics.plot data=orion.y&year.&month.;
	plot &var.*day;
run;

/*이럴 경우엔 문제가 없을까??
- lib..y&year&month : 첫번째 '.' 는 delimiter로의 . 두번째 '.'는 text의 .*/
%let lib=orion;

libname &lib 'SAS-data-library';
proc &graphics.chart data=&lib..y&year&month;
	hbar week / sumvar=&var;
run;

proc &graphics.plot data=&lib..y&year&month;
	plot &var*day;
run;
