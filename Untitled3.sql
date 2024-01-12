select '"telecom": [' 
       || listagg( '{ '
       ||' "system":"'||'phone'||'"'
       ||',"value":'||phone||'"'
       ||',"use":'||'"home"'
       ||'}, {'||'"system":'||'"email"'||',"value":'||'"home"}' , ',') within group (order by 1) 
       || '] 'as  json
  from   person where person_id = 891210601;
  
  select * from person;
  select * from observation2 where person = '891210601';
  
declare
c sys_refcursor;
begin
open c for select person_id, person_name, dob , sex, phone,
cursor (
select high_preasure, cursor (
select rownum , high_preasure_query.* from (
select to_char(created_on , 'yyyy-mm-dd hh:mi:ss') recording_time, high_preasure
)high_preasure_query where rownum <= 10 order by rownum
)high_preasure from dual
)observation2_high_preasure
from person where person_id = '891210601'
apex_json.open_object;
apex_json.write('person', c);
apex_json.close_object;
end;