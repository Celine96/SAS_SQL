/*week4_3 
- outer qury�� work.fa�� EmpID, inner qury�� EmpID�� �񱳰� ���������� �ֱ⶧���� ���������� ����� row by row 1���ΰŰ�
- ����� workfa�� airline.flighschedule�� ������*/
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

/*��������� where EmpID= EmpID�� �ǹ� ����
- airline.flightschedule����  select�Ȱ� ��*/
proc sql;
   select LastName, FirstName, EmpID
      from work.fa 
      where not exists
        (select *
         from airline.flightschedule
            where EmpID= EmpID);
quit;


