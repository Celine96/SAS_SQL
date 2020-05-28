/*automatic macro varible*/
proc print data = orion.customer;
title 'customer list';
footnote1 'created 10:24 monday, 31mar2008';
footnote2 'on the win system using sas 9.2';
run;

/*user-defined macro variables*/
proc freq data=orion.order_fact;
where year(order_date)=2008;
table order_type;
title "Order Types for 2008"; run;
proc means data=orion.order_fact;
where year(order_date)=2008;
class order_type;
var Total_Retail_Price;
title "Price Statistics for 2008"; run;

/*�ʿ伺 ���� : daily report, weekly report �ۼ��� �� macro����ϸ� ���ڴ�*/

/*daily report*/
proc print data = orion.orders;
run;

/*weekly report -> ���� : is it friday? (automatic macro variable�� 'weekday sas function') */
proc means data = orion.orders;
run;
