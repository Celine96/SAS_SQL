/*resolved reference at macro processor*/
%put Today is &sysday;

/* (') 와 (") 차이가 macro에서는 존재해! literal token에서 macro variable reference를 참조하기 위해서는 (') 이 아닌 (")을 사용해야해*/
proc freq data=orion.customer;
	table country/nocum;
	footnote1 "Created &systime &sysday, &sysdate9";
	footnote2 "By user &sysuserid on system &sysscpl";

run;

/*&syslast 출력*/
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

/*sydlast가 없어서 proc print는 출력되지 않아*/
proc print data=&sydlast;
title "Listing of &syslast";
run;
