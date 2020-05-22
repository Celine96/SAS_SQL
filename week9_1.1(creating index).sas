/* 
module 8: managing tables
8.1 creating indexes
8.2 maintaining tables

- create ad use an index
- update or delete data values in an existing table
- add, drop, or alter the attribute of columns in a table
- delete tables, views, and indexes

Creating Indexes 
인덱스: 데이터의 키로 활용되는 컬럼 
*/


/*indexs provide fast access to small subsets of data*/
proc sql;
select *
from airline.payrollmaster
where JobCode = 'NA1';

/*also enhance join performance*/
proc sql;
select *
from airline.payrollmaster, airline.flightschedule
where payrollmaster.EmpID = flightschdule.EmpID;

/*There are two types of indexes which are 
- simple : based on values of only one column
(simple index must match the name of the column being indexed)

- composite : based on values of more than one column concatenated to form a single value
, for example Date and FlightNUmber 
(즉 결합된 두 컬럼에 대해서 인덱스를 걸어준다)

*/


/*Creating Indexes forms*/

/*simple index*/
proc sql;
create index column1
on table (column1); 
quit;

/*select a name for the index. a simple index must have the same name as the column*/
/*specify whether the index is to be "unique"*/
proc sql;
create unique index EmpId 
on airline.payrollmaster (EmpId); /*designate the key columns*/

/*composite index
-composite index cannot be the same as a column name in the table
-한 테이블에 여러개의 인덱스를 만들 수 있다
*/
proc sql;
create index index_name
on table (column1, column2); 
quit;

/*SAS global 옵션!! message level 
- n : default
- i : index사용 여부 확인. print additional notes pertaining to index merge process */
options msglevel=i; 


/*sa_14 실습!! column name 순서 의미 있나? yes 결과가 다름!!

인덱스 daily가 선택될때는 where 조건에 첫번째 column(flightnumber가 있을때나, 두 컬럼이 있을 때임)이 */
proc sql;
create unique index daily /*specify whether the index(combination of Flightnumber and date) is to be "unique" */
on airline.marchflights(FlightNumber,Date); /*column name 순서 의미 있나? yes 결과가 다름!!*/
/*index "daily" is based on FlightNumber and Date*/

select *
from airline.marchflights
where date between '01MAR2000'd and '15MAR2000'd;

select *
from airline.marchflights 
where Flightnumber = '982';

select *
from airline.marchflights
where flightnumber = '982' and 
Date between '01MAR2000'd and '15MAR2000'd;
quit;

/*
index usage in where expression
- IDXWHERE = YES/NO
- IDXNAME = index_name (implies IDXWHERE = YES)
*/





