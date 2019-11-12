create or replace trigger t1
before update or delete on library
for each row

begin
insert into library_audit values(:new.bno,:old.allowed_days,:new.allowed_days);
end;
/