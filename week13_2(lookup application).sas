/*step 1*/
proc print data=orion.order_fact;
where customer_id=9;
var order_date order_type quantity total_retail_price;
title1 "Customer Number: 9";
title2 "Costimer NAme: Cornelia Krahl";
run;

/*step 2*/
%let customid=9;
%put &customid;

proc print data=orion.order_fact;
where customer_id=&customid;
var order_date order_type quantity total_retail_price;
title1 "Customer Number: &customid";
title2 "Costimer NAme: Cornelia Krahl";
run;

/*step 3*/
%let customid=9;


proc print data=orion.order_fact;
where customer_id=&customid;
var order_date order_type quantity total_retail_price;
title1 "Customer Number: &customid";
title2 "Costimer NAme: Cornelia Krahl";
run;

proc print data=or ion.customer;
where customer_id 
