/*0619-parameter validation*/

%macro customers(place);
	%let place = %upcase(&place);
	%if &place=AU
	 or &place=CA
	 or &place=DE
	 or &place=IL
	 or &place=TR
	 or &place=US
	 or &place=ZA %then %do;
	 	proc print data=orion.customer;
			var customer_name customer_address country;
			where upcase(country)="&place";
			title "Customers from &place";
		run;
	%end;
	%else %put Sorry, no customers from &place..;
%mend customers;

options mprint mlogic;
 
%customers(de)
%customers(au)
%customers(aa)

options nomprint nomlogic;


/*or 반복-> in */

%macro customers(place)/ minoperator;
	%let place = %upcase(&place);
	%if &place in AU CA DE IL TR US ZA  %then %do;
	 	proc print data=orion.customer;
			var customer_name customer_address country;
			where upcase(country)="&place";
			title "Customers from &place";
		run;
	%end;
	%else %put Sorry, no customers from &place..;
%mend customers;

options mprint mlogic;
 
%customers(de)
%customers(au)
%customers(aa)

/*sql 결과 macro variable list 안에 넣기*/

%macro customers(place)/ minoperator;
	%let place = %upcase(&place);
	proc sql noprint;
		select distinct country into :list separated by ' '
		from orion.customer;
	quit;
	%if &place in &list %then %do;
	 	proc print data=orion.customer;
			var customer_name customer_address country;
			where upcase(country)="&place";
			title "Customers from &place";
		run;
	%end;
	%else %do;
		%put Sorry, no customers from &place..;
		%put Valid countries are: &list..;
	%end;
%mend customers;

%put &list;

%customers(de)
%customers(au)
