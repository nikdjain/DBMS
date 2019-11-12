


create or replace procedure proc_Grade
is
cursor c is select *  from customer31213;
cursor c2(id number) is select * from category31213 where cust_id = id;
emp customer31213%rowtype;
emp2 category31213%rowtype;
BEGIN

       for emp in c
      loop
       open c2(emp.cust_id);
       fetch c2 into emp2;
       if c2%notfound then
               if emp.total_purchase>=10000 and emp.total_purchase<=20000 then
               insert into category31213 values (emp.cust_id,'aa','platinum');

              elsif emp.total_purchase>=5000 and emp.total_purchase<=9999 then
               insert into category31213 values (emp.cust_id,'aa','gold');

               elsif emp.total_purchase>=2000 and emp.total_purchase<=4999 then
               insert into category31213 values (emp.cust_id,'aa','silver');

               else
               dbms_output.put_line(' cannot be categorized !!');
   
             end if;
      else
           dbms_output.put_line(' the customer is already present!!');
      end if;
    
      close c2;
     end loop;
              
      
  




END;
/
