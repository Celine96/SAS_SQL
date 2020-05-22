/*integrity constraints*/

/*general 

- not null : data is required non-missing values in each row
- check : Ư���� (Ư�� ����)�� �ȵ�� ������ üũ
- unique : �ߺ� üũ. ���̵� ������  */

/*referential

- primary key : ���̺��� not null + unique�� Ư���� ������ �÷�. �й�
- foreign key : ��ũ�� �ϴ� ���̺� */




/*Rollbacks- insert �� update���� ������ ���涧 ��� processing �Ҳ���

- undo_policy = required (default ��)
- undo_policy = none
- undo_policy = optional */

/*student activity
���� :  ���� 'WORK.DISCOUNT.DATA'��(��) �������� �ʽ��ϴ�.
undo_policy = required�� ���� successful data�� ���� ������ ���Ⱦ�
 
*/
proc sql undo_policy = required; /*������ �̰� ���� ���Ѱ� ���⵵*/
create table discount;
(Destination char(3)
, BeginDate date label = 'Begins'
, EndDate date label = 'Ends'
, Discount num
, constraint ok_discount check /*constraint�� check ���*/
(Discount le .5)); /*discount <= 0.5*/

insert into discount
		values('LHR', '01Mar2000'd, '05Mar2000'd, .33)
		values('CPH', '03Mar2000'd, '10Mar2000'd, .15 );

select *
from discount;
quit;

/*student activity
���� :  
undo_policy = none�� ���� ������ �����ϴ� row �ϳ��� ���;� �ϴ� ��Ȳ
*/
proc sql undo_policy = none; 
create table discount;
(Destination char(3)
, BeginDate date label = 'Begins'
, EndDate date label = 'Ends'
, Discount num
, constraint ok_discount check /*constraint�� check ���*/
(Discount le .5)); /*discount <= 0.5*/

insert into discount
		values('LHR', '01Mar2000'd, '05Mar2000'd, .33)
		values('CPH', '03Mar2000'd, '10Mar2000'd, .15 );

select *
from discount;
quit;
