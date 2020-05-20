  /*4/7ÀÏ ¼ö¾÷  Instructor Demo */

  /* Step 1: Get average salary number from query.*/
proc sql;
select avg(Salary) as MeanSalary
      from airline.payrollmaster;
quit;

  /* Step 2: Manually change xxxxx.xx to average
     salary from Step1 above. */
proc sql;
 select JobCode,avg(Salary) as MeanSalary
      from airline.payrollmaster
      group by JobCode
      having avg(Salary) > 54376.96 ;
quit;

  /* Step 3: Use a noncorrelated subquery to return the average
     salary for the having clause. */
proc sql;
 select JobCode, avg(Salary) as MeanSalary
      from airline.payrollmaster
      group by JobCode
      having avg(Salary) > 
         (select avg(Salary) as MeanSalary
            from airline.payrollmaster);
quit;
