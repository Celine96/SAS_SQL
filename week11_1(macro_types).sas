/*resolved reference at macro processor*/
%put Today is &sysday;

/* (') �� (") ���̰� macro������ ������! literal token���� macro variable reference�� �����ϱ� ���ؼ��� (') �� �ƴ� (")�� ����ؾ���*/
proc freq data=orion.customer;
	table country/nocum;
	footnote1 "Created &systime &sysday, &sysdate9";
	footnote2 "By user &sysuserid on system &sysscpl";

run;

/*&syslast ���*/
%put &syslast;

/*unresolved reference*/

/*unresolved reference (with error)*/
proc print data=orion.banks;
title "Expenses for R&D";
run;

/*unresolved reference (without error)*/
proc print data=orion.banks;
title 'Expenses for R&D';
run;

/*sydlast�� ��� proc print�� ��µ��� �ʾ�*/
proc print data=&sydlast;
title "Listing of &syslast";
run;
