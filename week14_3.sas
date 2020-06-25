data _null_;
	set orion.country end=no_more;
	call symputx('Country'||left(_n_), country_name);
	if no_more then call symputx('numrows', _n_);
run;

%put _user_;

%put country1 is &country1;
%put country2 is &country2;
%put country3 is &country3;
%put country4 is &country4;

/*위의 노가다를 loop로 단순화 하는 작업*/

%macro putloop;
	%do i=1 %to &numrows;
		%put Country&i is &&country&i;
	%end;
%mend putloop;
options nomprint nomlogic;
%putloop
