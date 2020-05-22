

  /* Correlated subqueries rely on values from the outer query to 
		be passed to the inner query.  In this example, the values of EmpID
		from the staffmaster table are supplied to the inner query for comparison */

/*m04p2  subquery�� output row�� �Ѱ���?!! outer qury�� inner qury�� �Դٰ���! 
�� �������� outerquery table �� airline.staffmster table�̶� inner query�� supervisors table�̶� ���ؾߵǼ� inner qury output row��  �ϳ��� �����°� ���� */

proc sql;
   select LastName, FirstName, State
      from airline.staffmaster
	 where 'NA'=
	    (select JobCategory
             from airline.supervisors
             where staffmaster.EmpID= supervisors.EmpID) ;
quit;  

/*
-   from airline.supervisors�̾ where ������ ������ �ȵ�*/
proc sql;
  select JobCategory
  from airline.supervisors
  where staffmaster.EmpID= supervisors.EmpID;
quit;

