/*updating views
- View 또한 , insert, delete, update 할 수 있다.
- only single table is allowed through a view. it cannot be joined or linked to another table nore subquery
- 이미 저장된 컬럼만 update할 수 있다
- summary query나 order by절 update가 불가능하다 */

/*view 만들기*/

proc sql;
create view airline.raise as 
select EmpID, JobCode, Salary,
Salary/12 as MonthlySalary format = dollar12.
from airline.payrollmaster;

/*view update 하기*/
proc sql;
update airline.raise
set Salary = Salary *1.20
where JobCode = 'PT3';
quit;
