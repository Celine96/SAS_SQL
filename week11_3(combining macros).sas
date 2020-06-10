/*Delimiting Macro variable refernece*/

/*macro ������ ��� ��ġ������ �����ϴ�*/
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

/*year�� month �����ؼ� ����
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


/*&graphicschart, &graphicsplot�� �ǵ��� �ٴ�
(gplot, gchart)
������ ���� ����: ;�� ���� special token�� �����ϱ� name token���� �ν��ؼ� ������ �߻�

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
���� �Ŀ� delimiter�� �������!!*/

proc &graphics.chart data=orion.y&year&month;
	hbar week / sumvar=&var;
run;

proc &graphics.plot data=orion.y&year&month;
	plot &var*day;
run;

/*������ ��? macro variable ������ ���������� '.' ���*/

proc &graphics.chart data=orion.y&year.&month.;
	hbar week / sumvar=&var.;
run;

proc &graphics.plot data=orion.y&year.&month.;
	plot &var.*day;
run;

/*�̷� ��쿣 ������ ������??
- lib..y&year&month : ù��° '.' �� delimiter���� . �ι�° '.'�� text�� .*/
%let lib=orion;

libname &lib 'SAS-data-library';
proc &graphics.chart data=&lib..y&year&month;
	hbar week / sumvar=&var;
run;

proc &graphics.plot data=&lib..y&year&month;
	plot &var*day;
run;
