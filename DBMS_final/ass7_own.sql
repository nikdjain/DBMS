create or replace procedure proc_grade(rno number,name varchar2,marks number)
is
class varchar2(20);

begin
if(marks<=1500 and marks>=990) then
class :='Distinction'

elsif(marks<=989 and marks>=900) then
class :='First'

if(marks<=899 and marks>=825) then
class :='Higher Second'

end if;

insert into stud_marks values(name,marks);
insert into result values(rno,name,class);

end;
/