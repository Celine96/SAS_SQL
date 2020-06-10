/*define and call a simple macro
 결과는 work.sasmacr에 확인할수 있다*/

/*macro definition 틀*/
%MACRO macro-name;
macro text
%MEND <macro-name>;

/*macro text에는 
- text/ SAS statements, steps/macro variable references/macro statements, expressions,call
/위의 combination를 포함시킬 수 있다*/

/*macro compilation check option*/
options mcompilenote=all;

/*macro compilation example*/
options mcompilenote=all;
%macro time;
	%put The current time is %sysfunc(time(), timeampm.).;
%mend time;

/*macro compilation - option 대신에 work.sasmacr을 출력하기*/
proc catalog cat=work.sasmacr;
	contents;
	title "My Temporary Macros";
quit;

/*macro call 틀
- statement(명령문이 아니기 때문에 ';'이 필요없어)*/
%macro-name 

/*macro call example*/
%time

/*simple macro*/
/*m103d03*/
options MPRINT; /*참조 결과 출력*/
options mcompilenote=all; /*이거 뭐였지??ㅋㅋㅋㅋ 아 컴파일 확인*/
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

/* %calc macro 이용 #3*/
%let stats= mean;
%let vars=quantity;
%calc

/* %calc macro 이용 #4*/
%let stats= mean;
%let vars=quantity discount;
%calc


/*macro execution (MPRINT)
MPRINT option은 로그창에 macro 실행으로 생성된 결과(참조결과)를 보여준다*/

options MPRINT; 
options NOMPRINT; /*DEFAULT*/
