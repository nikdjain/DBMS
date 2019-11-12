
Declare 
rno number(3) := &roll_no;
bname varchar2(10) :='&book_name';
no_of_days number(7);
issueDate date;
fineamount number(5):=0;

begin

	select DateofIssue into issueDate from Customer where roll_no=rno;
	select sysdate-to_date(issueDate) days into no_of_days from dual;

	if(no_of_days>15 and no_of_days<=30) then
		fineamount := no_of_days*5;

	elsif(no_of_days>30) then
		fineamount := no_of_days*50;

	end if;
	update Customer set status='R' where roll_no=rno;

	if(fineamount>=0) then
		insert into fine values(rno,sysdate,fineamount);
	end if;

	EXCEPTION
		WHEN no_data_found then
			dbms_output.put_line('Record Not Found');
		end;

		/