/*1. Using airline.payrollmaster table, create report that display the columns of total number of employees total number of male employees, total 
number of female employee, percent of male employees by jobcode. Order the report according to the percent of male order.
Add label and format to the percent of male employees column. (10pt)
1. airline.payrollmaster 테이블을 이용하여 다음의 컬럼을 출력한다. 총 직원수, 총 남자직원수, 총 여자직원수, 남자직원의 비율을 jobcode 별로 계산하여 출력한다. 4
이때 계산된 남자직원의 비율에 따라 오름차순으로 정렬한다. 남자직원의 비율 컬럼에 적절한 label과 format을 할당한다. (10점)*/

proc sql;
select jobcode, count(empid) as Total, sum(gender='M') as Male, sum(gender='F') as Female, 
		calculated Male/calculated Total as percent label = 'Male Percentage' format=percent8.2 
		from airline.payrollmaster
		group by jobcode
		order by percent;
		quit;
