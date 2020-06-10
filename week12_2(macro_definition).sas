/*define and call a simple macro
 ����� work.sasmacr�� Ȯ���Ҽ� �ִ�*/

/*macro definition Ʋ*/
%MACRO macro-name;
macro text
%MEND <macro-name>;

/*macro text���� 
- text/ SAS statements, steps/macro variable references/macro statements, expressions,call
/���� combination�� ���Խ�ų �� �ִ�*/

/*macro compilation check option*/
options mcompilenote=all;

/*macro compilation example*/
options mcompilenote=all;
%macro time;
	%put The current time is %sysfunc(time(), timeampm.).;
%mend time;

/*macro compilation - option ��ſ� work.sasmacr�� ����ϱ�*/
proc catalog cat=work.sasmacr;
	contents;
	title "My Temporary Macros";
quit;

/*macro call Ʋ
- statement(��ɹ��� �ƴϱ� ������ ';'�� �ʿ����)*/
%macro-name 

/*macro call example*/
%time

/*simple macro*/
/*m103d03*/
options MPRINT; /*���� ��� ���*/
options mcompilenote=all; /*�̰� ������??�������� �� ������ Ȯ��*/
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

/* %calc macro �̿� #3*/
%let stats= mean;
%let vars=quantity;
%calc

/* %calc macro �̿� #4*/
%let stats= mean;
%let vars=quantity discount;
%calc


/*macro execution (MPRINT)
MPRINT option�� �α�â�� macro �������� ������ ���(�������)�� �����ش�*/

options MPRINT; 
options NOMPRINT; /*DEFAULT*/
