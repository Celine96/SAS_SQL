/*
7_1은 테이블을 만들었고
7_2는 inserting data in the table

방법은 3가지 

- set 여러 컬럼 한 row씩 
- values 여러 컬럼 한 rows
- query-expression (select, from)

*/

/*method1 set*/

proc sql;
	insert into discount
		set Destination = 'LHR'
			, BeginDatae = '01Mar2000'd
			, EndDatae = '05Mar2000'd
			,Discount = .33
		set Destination = 'CPH'
			, BeginDatae = '03Mar2000'd
			, EndDatae = '10Mar2000'd
			,Discount = .15 ;
quit;
		

/*method2 values 사용, set보다 편리하네*/
/*values의 갯수와 컬럼의 갯수가 일치해야함*/
proc sql;
	insert into discount (Destination, BeginDate, EndDate, Discount)
	values('LHR', '01Mar2000'd, '05Mar2000'd, .33)
	values('CPH', '03Mar2000'd, '10Mar2000'd, .15 );

	quit;

/* method 3*/
/*컬럼 갯수와 select 문의 컬럼의 갯수가 일치해야 해*/
proc sql;
	insert into discount(Destination, Discount)
		select Destination, Rate*.25
			from work.fares
			where Type = 'special';
quit;

 /* create table + insert data*/

proc sql;
	create table discount1 /*define table*/
		(Destination char(3)
		, BeginDate date label = 'BEGINS'
		, EndDate date label = 'ENDS'
		, Discount num);
	
		insert into discount1 /*insert data*/
		values('LHR', '01Mar2000'd, '05Mar2000'd, .33)
		values('CPH', '03Mar2000'd, '10Mar2000'd, .15 );

		select * /*printing out data*/
			from discount1; 
quit;  

