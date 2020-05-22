/*week4_3 
- outer qury의 work.fa의 EmpID, inner qury의 EmpID의 비교가 서브쿼리에 있기때문에 서브쿼리의 결과는 row by row 1개인거고
- 결과는 workfa와 airline.flighschedule의 차집합*/
proc sql;
	SELECT LastName
				,FirstName
				,EmpID
	from work.fa
		where not exists
		(select  *
			from airline.flightschedule
			where fa.EmpID = flightschedule.EmpID);
quit;

/*결과적으로 where EmpID= EmpID는 의미 없어
- airline.flightschedule에서  select된거 임*/
proc sql;
   select LastName, FirstName, EmpID
      from work.fa 
      where not exists
        (select *
         from airline.flightschedule
            where EmpID= EmpID);
quit;


