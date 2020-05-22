proc sql;
 SELECT *
 FROM airline.payrollmaster;
 quit;

 /*sas sql에서는 조건문 subquery밖에 안되나봐*/
 proc sql;
 SELECT
 			LastName
			,FirstName
			,City
			, (SELECT EmpID
			FROM airline.payrollmaster
			WHERE month(DateOfBirth)=2) 
FROM airline.staffmaster;
quit;



 proc sql;
 SELECT EmpID
 			,LastName
			,FirstName
			,City
FROM airline.staffmaster
WHERE EmpID IN  (SELECT EmpID
FROM airline.payrollmaster
WHERE str(DateOfBirth) LIKE '%FEB%'); /*Dateofbirth는 str이 아니라서 like 나 contain이 안돼*/
quit;

/*수업답-noncorrelated*/
 proc sql;
	 SELECT 
	 			LastName
				,FirstName
				,City
				,State
		FROM airline.staffmaster
		WHERE EmpID IN  
			(SELECT EmpID
			FROM airline.payrollmaster
			WHERE month(DateOfBirth)=2);  
quit;


  /* Student Activity 7 */
  /* Change the comparison operator (IN) to an equal sign (=), 
     submit the program and review the results */


/*서브쿼리는 2개이상인데 WHERE EMPID는 하나의 row랑 비교하기 때문에 출력되지 않는 것은 당연지사!!  subquery evaluates more than onw values*/
/*Problematic code*/
proc sql;
   select LastName, FirstName, City, State
   from airline.staffmaster
   where EmpID =
     (select EmpID 
      from airline.payrollmaster
      where month(DateOfBirth)=2);
quit;

/*solution code- use `ANY`*/
proc sql;
   select LastName, FirstName, City, State
   from airline.staffmaster
   where EmpID = ANY
     (select EmpID 
      from airline.payrollmaster
      where month(DateOfBirth)=2);
quit;


/*m04d2- any keyword*/
