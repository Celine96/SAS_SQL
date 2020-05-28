
/*반복작업을 할때 */
proc print data = orion.year2008;
run;

proc print data = orion.year2009;
run;

proc print data = orion.year2010;
run;

/*data driven application*/
data AU CA DE IL TR US ZA;
	set orion.customer; /*if then*/
	select(country);
		when("AU") output AU;
		when("CA") output CA;
		when("DE") output DE;
		when("IL") output IL;
		when("TR") output TR;
		when("US") output US;
		when("ZA") output ZA;
		otherwise; end; run;

		/*token이라는 개념*/
