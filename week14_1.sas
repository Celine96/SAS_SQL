options mlogic mprint;
%macro daily;
	proc print data=orion.order_fact_new;
		where order_date = "&sysdate9"d;
		var product_id total_retail_price;
		title "Daily sales: &sysdate9";
	run;
%mend daily;

%macro weekly;
	proc means data=orion.order_fact_new;
		where order_date between 
		 "&sysdate9"d-4 and  "&sysdate9"d;
		 var quantity total_retail_price;
		 title "Weekly slaes: &sysdate9";
	run;
%mend weekly;

/*2020년 해당 데이터가 없어서 출력결과 없어  */
%macro reports;
	%daily
	%if &sysday=Wednesday %then %weekly;
%mend reports;

%reports

%put _automatic_;
 
/*위의 작업 매크로 하나에 담기*/
%macro reports;
 proc print data=orion.order_fact;
 	where order_date="&sysdate9"d;
	var product_id total_retail_price;
	title "Daily sales: &sysdate9";

	%if &sysday=Friday %then %do;
	proc means data=orion.order_fact n sum mean;
	where order_date between "&sysdate9"d-6 and "&sysdate"d;
	var quantity total_retail_price;
	title "Weekly sales: &sysdate9";
	run;
	%end;
%mend reports;

%reports

/*실습 : macro/data step에서의 else then do - else do*/
%macro cust(place)
	%let place=%upcase(&place);
	data customer;
		set orion.customer;
		%if &place =US %then %do;
			where country='US';
			keep customer_name customer_address country;
		%end;
		%else %do;
			where county ne 'US';
			keep customer_name customer_address country location;
			length location $12;
			if country="AU" then location ="Australia";
			else if country="CA" then location="Canada";
			else if country="DE" then location="Germany";
			else if country="IL" then location="Israel";
			else if country="TR" then location="Turkey";
			else if country="ZA" then location="South Africa";
		%end;
	run;
%mend cust;

options mprint mlogic;

%cust(us);
%cust(international);
			
