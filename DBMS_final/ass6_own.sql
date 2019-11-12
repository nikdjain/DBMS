declare

cursor cur1 is
select roll_no,name from O_RollCall;

cursor cur2 is
select roll_no from N_RollCall;

r number(3);
rno number(3);
nm varchar2(10);

begin
open cur1;
open cur2;
loop
fetch cur1 into rno,nm;
fetch cur2 into r;

exit when cur1%found=false;
if r<> rno then
insert into N_RollCall values(rno,nm);
end if;

end loop;
close cur1;
end;
/