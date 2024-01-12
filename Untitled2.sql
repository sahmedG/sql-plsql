select * from
(
  select height,weight,bmi,bsa,observation_id
  from OBSERVATION2
)
PIVOT 
(
  LISTAGG
  (
      unpivot 
          (
            value 
            for observation_id in (height,weight,bmi,bsa)
          )
  ) 
  WITHIN GROUP (ORDER BY observation_id) 
  FOR observation_id IN ('20', '27','32','33')
);


select '{"items": { "emp":[' 
       || listagg( '{ '
       ||' "empno":"'||empno||'"'
       ||',"ename":'||ename
       ||'} ', ',') within group (order by 1) 
       || ']} }'as  json
  from   emp
  
  
  
 
 
 function ref_cursor_to_json (p_ref_cursor in sys_refcursor,
p_max_rows in number := null,
p_skip_rows in number := null) return clob
as
l_ctx         dbms_xmlgen.ctxhandle;
l_num_rows    pls_integer;
l_xml         xmltype;
l_json        xmltype;
l_returnvalue clob;
begin
 
/*
 
Purpose:    generate JSON from REF Cursor
 
Remarks:
 
Who     Date        Description
------  ----------  -------------------------------------
MBR     30.01.2010  Created
 
*/
 
l_ctx := dbms_xmlgen.newcontext (p_ref_cursor);
 
dbms_xmlgen.setnullhandling (l_ctx, dbms_xmlgen.empty_tag);
 
-- for pagination
if p_max_rows is not null then
dbms_xmlgen.setmaxrows (l_ctx, p_max_rows);
end if;
 
if p_skip_rows is not null then
dbms_xmlgen.setskiprows (l_ctx, p_skip_rows);
end if;
 
-- get the XML content
l_xml := dbms_xmlgen.getxmltype (l_ctx, dbms_xmlgen.none);
 
l_num_rows := dbms_xmlgen.getnumrowsprocessed (l_ctx);
 
dbms_xmlgen.closecontext (l_ctx);
 
close p_ref_cursor;
 
if l_num_rows > 0 then
-- perform the XSL transformation
l_json := l_xml.transform (xmltype(get_xml_to_json_stylesheet));
l_returnvalue := l_json.getclobval();
else
l_returnvalue := g_json_null_object;
end if;
 
l_returnvalue := dbms_xmlgen.convert (l_returnvalue, dbms_xmlgen.entity_decode);
 
return l_returnvalue;
 
end ref_cursor_to_json;
commit;

declare
l_json clob;
begin
l_json := json_util_pkg.sql_to_json ('select d.deptno, d.dname,
cursor (select e.*
from emp e
where e.deptno = d.deptno) as the_emps
from dept d');
dbms_output.put_line (substr(l_json, 1, 10000));
end;




create table ex01_person_tb (
  id number,
  name varchar2(50)
);
insert into ex01_person_tb values (1, 'Roger Waters');
insert into ex01_person_tb values (2, 'David Gilmour');
create table ex01_phone_tb (
  id number,
  person_id number,
  phone_number varchar2(50)
);
insert into ex01_phone_tb values (1, 1, '543 454433');
insert into ex01_phone_tb values (2, 1, '512 4776443');
insert into ex01_phone_tb values (3, 1, '521 6454423');
insert into ex01_phone_tb values (4, 2, '212 8332464');
insert into ex01_phone_tb values (5, 2, '312 6736423');


select a.id, a.name,
     cursor (select b.id, b.phone_number
               from ex01_phone_tb b
              where b.person_id = a.id) as phone_numbers
 from ex01_person_tb a; 
 
 
 
 
 declare
  l_sql_string varchar2(2000);
  l_xml        xmltype;
begin
  l_sql_string := 'select a.id, a.name, ' ||
                  '   cursor (select b.id, b.phone_number ' ||
                  '     from ex01_phone_tb b ' ||
                  '     where b.person_id = a.id ' ||
                  '     ) as phone_numbers ' || '  from ex01_person_tb a ';
  -- Create the XML aus SQL
  l_xml := itstar_xml_util.sql2xml(l_sql_string);
  -- Display the XML
  dbms_output.put_line(l_xml.getclobval());
end;
