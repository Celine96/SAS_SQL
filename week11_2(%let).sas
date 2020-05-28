/*%let statement example-numeric */
%let units=4;
%put &units; /*unit에 4가 들어감 확인*/

proc print data=orion.Order_Fact;
	where Quantity > &units; /*literal로 4를 인식하지만 이런 연산은 가능. 다만 연산은 안된다*/
	var Order_Date Product_ID Quantity;
	title "Orders exceeding &units units";
run;

/*%let statement example- character value */
%let office=Sydney;
%put &office;

proc print data=orion.Employee_Addresses;
	where City="&office"; /*character*/
	var Employee_Name;
	title "&office Employees";
run;

/*macro 참조할때는 (" ")*/
%let date1=25may2017;
%let date2=15jun2017;

/*displaying macro variables 내가만든 macro variables 확인
- %put _user_
- options symbolgen*/
%put _user_;

/*deleting user-defined macro variables*/
%symdel macro-variables;
