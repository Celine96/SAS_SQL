

  /* Correlated subqueries rely on values from the outer query to 
		be passed to the inner query.  In this example, the values of EmpID
		from the staffmaster table are supplied to the inner query for comparison */

/*m04p2  subquery의 output row는 한개야?!! outer qury와 inner qury가 왔다갔다! 
내 생각에는 outerquery table 인 airline.staffmster table이랑 inner query의 supervisors table이랑 비교해야되서 inner qury output row가  하나씩 나오는것 같아 */

proc sql;
   select LastName, FirstName, State
      from airline.staffmaster
	 where 'NA'=
	    (select JobCategory
             from airline.supervisors
             where staffmaster.EmpID= supervisors.EmpID) ;
quit;  

/*
-   from airline.supervisors이어서 where 조건이 실행이 안되*/
proc sql;
  select JobCategory
  from airline.supervisors
  where staffmaster.EmpID= supervisors.EmpID;
quit;

