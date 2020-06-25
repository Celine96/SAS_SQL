%let foot=some internet orders;
%put &foot; 

data _null_;
	call symputx('foot', 'No internet orders');
	%let foot=some internet orders;
run;
%put &foot; 

