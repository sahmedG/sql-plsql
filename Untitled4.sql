declare
c sys_refcursor;
begin
open c for select person_id, person_name, dob , sex, phone,
cursor (
select 'HIGH_PREASURE' , cursor (
select rownum , high_preasure_query.* from (
select to_char(created_on , 'yyyy-mm-dd hh:mi:ss') recording_time from OBSERVATION2 where person = '891210601'
)high_preasure_query where rownum <= 10 order by rownum
)high_preasure from dual
)observation2_high_preasure
from person where person_id = '891210601';
apex_json.open_object;
apex_json.write('person', c);
apex_json.close_object;
end;


CREATE TABLE PhoneCalls
(
   ID NUMBER (9) NOT NULL,
   CallTime timestamp NOT NULL,
   CallerPhoneNumber CHAR(10) NOT NULL
);



CREATE TABLE Tickets
(
   ID number(9) NOT NULL,
   CreatedTime timestamp NOT NULL,
   Subject VARCHAR2(250) NOT NULL,
   Notes VARCHAR2(2000) NOT NULL,
   Completed number(9) NOT NULL
)


CREATE TABLE PhoneCalls_Tickets
(
   PhoneCallID number(9) NOT NULL,
   TicketID number(9) NOT NULL
)