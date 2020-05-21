/*1. airline.payrollmaster 테이블의 DateOfBirth 컬럼을 이용하여 나이를 계산하여 나이의 평균, 최소값 최대값을 계산한다. 또한 Salary 컬럼의 최소값, 최대값, 평균을 계산하여 다음과 
같이 결과가 출력되도록 sql 프로그램을 작성한다*/

proc sql;
select  'Salary' as Variable, min(salary) as Minimun ,max(salary) as Maximun,  avg(salary) as Average 
from airline.payrollmaster
union corr
select  'Age' as Variable, min(age) as Minimun ,max(age) as Maximun,  avg(age) as Average 
from (select int((today()-dateofbirth)/365.25) as age
		from airline.payrollmaster);
quit;
