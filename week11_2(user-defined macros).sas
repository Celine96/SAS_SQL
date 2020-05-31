/*user-defined macro variables
- vaiable name�� _,���ڷ� �����ϰ� ���Ĵ� ���� ��밡��
- global option�� ����ϸ� �ѱ��� ��� �� ���� �ִ�(6:00)*/


/*%let statement example-numeric */
%let units=4;
%put &units; /*unit�� 4�� �� Ȯ��*/

proc print data=orion.Order_Fact;
	where Quantity > &units; /*literal�� 4�� �ν������� �̷� ������ ����. �ٸ� ������ �ȵȴ�*/
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

/*macro �����Ҷ��� (" ")*/
%let date1=25may2017;
%let date2=15jun2017;

/*displaying macro variables �������� macro variables Ȯ��
- %put _user_
- options symbolgen*/
%put _user_;

/*deleting user-defined macro variables*/
%symdel macro-variables;
