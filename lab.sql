select distinct
person_id , 
FIRST_NAME ,
MIDDLE_NAME_1,
MIDDLE_NAME_2,
MIDDLE_NAME_3,
MIDDLE_NAME_4,
LAST_NAME,
FIRST_NAME_LOCAL,
MIDDLE_NAME_LOCAL_1,
MIDDLE_NAME_LOCAL_2,
MIDDLE_NAME_LOCAL_3,
MIDDLE_NAME_LOCAL_4,
LAST_NAME_LOCAL,
DOB,
person.GENDER,
CONTACT_CELL_1,
CONTACT_CELL_2,
COUNTRY_CODE_ICAO,
CONTACT_EMAIL_1,
bed_occupancy.visit,
bed_occupancy.updated_on,
bed_name
--from person inner join bed_occupancy bed_occupancy on bed_occupancy.occupant = person_id,COUNTRY2 where person_id =:PATIENT_ID and nationality = COUNTRY_CODE_BH;
from person , bed_occupancy , country2 ,provider_order_admission , bed where nationality = country_code_bh and person_id = :P 
and (bed_occupancy.occupant = person_id)
and FULLFILLED_BY_VISIT = bed_occupancy.visit and current_admission_order 
= provider_order_id ;-- or bed_occupancy.occupant is null);
select * from bed order by current_admission_order desc;
select * from provider_order_admission where provider_order_id = 39439;
select * from provider_order_admission where FULLFILLED_BY_VISIT = 71990;

select * from bed where bed_id in (226,227,228,229,230,231,232,233,234,235,236,237,345,346 )and bed_status = 3;
select * from bed_status;
select * from bed where BED_STATUS = 3;
select * from bed_type;
select * from visit where visit_id = 71990;



select person_id , 
FIRST_NAME ,
MIDDLE_NAME_1,
MIDDLE_NAME_2,
MIDDLE_NAME_3,
MIDDLE_NAME_4,
LAST_NAME,
FIRST_NAME_LOCAL,
MIDDLE_NAME_LOCAL_1,
MIDDLE_NAME_LOCAL_2,
MIDDLE_NAME_LOCAL_3,
MIDDLE_NAME_LOCAL_4,
LAST_NAME_LOCAL,
DOB,
GENDER,
CONTACT_CELL_1,
CONTACT_CELL_2,
COUNTRY_CODE_ICAO,
CONTACT_EMAIL_1,
provider_order_admission.FULLFILLED_BY_VISIT
from person inner join bed_occupancy bed_occupancy on bed_occupancy.occupant = person_id 
join country2 on nationality = COUNTRY_CODE_BH
join visit visit on patient = person_id

,provider_order_admission provider_order_admission
join visit visit on visit_id =provider_order_admission.FULLFILLED_BY_VISIT
where person_id = :P;