/*Inner Join
example : Display the names, job codes, and ages of all NY employees
- employee names are found in the airline.staffmaster table
- employee job codes and birth dates are found in the airline.payrollmaster*/

proc sql;
SELECT LastName /*substr(FirstName,1,1)||'.' || LastName as Name*/
			, FirstName
			, JobCode
			, int((today()-DateOfBirth)/365.25)  as Age
FROM airline.staffmaster , airline.payrollmaster
WHERE staffmaster.EmpID = payrollmaster.EmpID AND /*key 설정을 where절에 그냥 담았네*/
staffmaster.State = 'NY';
QUIT;
