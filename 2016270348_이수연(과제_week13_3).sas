/*시도1*/
/*에러: INTO clause specifies fewer host variables than columns listed in the SELECT clause.
컬럼이 2개인데 내가 만든 변수가 new하나니까 어쩔 수 없다
*/
proc sql outobs=3;
select  customer_id
		,sum(Total_Retail_Price) as total
into : new separated by ','
from orion.order_fact
group by customer_ID
order by total descending;
quit;

%put Top3 customers: &new;


proc print data=orion.customer_dim noobs;
where Customer_ID in (&new);
var Customer_ID Customer_Name Customer_Type;
title 'Top 3 Customers';
run;

