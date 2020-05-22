/*integrity constraints*/

/*general 

- not null : data is required non-missing values in each row
- check : 특정값 (특수 문자)가 안들어 가도록 체크
- unique : 중복 체크. 아이디 같은거  */

/*referential

- primary key : 테이블에서 not null + unique의 특성을 가지는 컬럼. 학번
- foreign key : 링크를 하는 테이블 */




/*Rollbacks- insert 나 update에서 문제가 생길때 어떻게 processing 할껀지

- undo_policy = required (default 값)
- undo_policy = none
- undo_policy = optional */

/*student activity
에러 :  파일 'WORK.DISCOUNT.DATA'이(가) 존재하지 않습니다.
undo_policy = required로 인해 successful data도 같이 지워져 버렸어
 
*/
proc sql undo_policy = required; /*솔직히 이거 이해 못한거 같기도*/
create table discount;
(Destination char(3)
, BeginDate date label = 'Begins'
, EndDate date label = 'Ends'
, Discount num
, constraint ok_discount check /*constraint의 check 사용*/
(Discount le .5)); /*discount <= 0.5*/

insert into discount
		values('LHR', '01Mar2000'd, '05Mar2000'd, .33)
		values('CPH', '03Mar2000'd, '10Mar2000'd, .15 );

select *
from discount;
quit;

/*student activity
에러 :  
undo_policy = none로 인해 조건을 만족하는 row 하나는 나와야 하는 상황
*/
proc sql undo_policy = none; 
create table discount;
(Destination char(3)
, BeginDate date label = 'Begins'
, EndDate date label = 'Ends'
, Discount num
, constraint ok_discount check /*constraint의 check 사용*/
(Discount le .5)); /*discount <= 0.5*/

insert into discount
		values('LHR', '01Mar2000'd, '05Mar2000'd, .33)
		values('CPH', '03Mar2000'd, '10Mar2000'd, .15 );

select *
from discount;
quit;
