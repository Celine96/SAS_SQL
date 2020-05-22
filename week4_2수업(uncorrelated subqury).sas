proc sql;
 SELECT *
 FROM airline.payrollmaster;
 quit;

 /*sas sql������ ���ǹ� subquery�ۿ� �ȵǳ���*/
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
WHERE str(DateOfBirth) LIKE '%FEB%'); /*Dateofbirth�� str�� �ƴ϶� like �� contain�� �ȵ�*/
quit;

/*������-noncorrelated*/
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


/*���������� 2���̻��ε� WHERE EMPID�� �ϳ��� row�� ���ϱ� ������ ��µ��� �ʴ� ���� �翬����!!  subquery evaluates more than onw values*/
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
