/* the table names are new_employee31213 and old_employee31213 */

DECLARE

cursor c is select *  from old_employee31213;
cursor c2(id number) is select * from new_employee31213 where ne_id = id;
emp old_employee31213%rowtype;
emp2 new_employee31213%rowtype;

BEGIN
     for emp in c
      loop
       open c2(emp.oe_id);
       fetch c2 into emp2;
       if c2%notfound then
       insert into new_employee31213 values (emp.oe_id,emp.oe_name);
       else
       dbms_output.put_line('already present!!');
       end if;




      close c2;
     end loop;
   
       






END;
/
