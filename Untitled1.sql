CREATE OR REPLACE FUNCTION rowtocol( p_slct IN VARCHAR2,
     p_dlmtr IN VARCHAR2 DEFAULT ',' ) RETURN VARCHAR2
     AUTHID CURRENT_USER AS

     TYPE c_refcur IS REF CURSOR;
     lc_str VARCHAR2(4000);
     lc_colval VARCHAR2(4000);
     c_dummy c_refcur;
     l number;

     BEGIN

     OPEN c_dummy FOR p_slct;
 
     LOOP
     FETCH c_dummy INTO lc_colval;
     EXIT WHEN c_dummy%NOTFOUND;
     lc_str := lc_str || p_dlmtr || lc_colval;
     END LOOP;
     CLOSE c_dummy;
 
     RETURN SUBSTR(lc_str,2);

 
     END;
     
     select * from table (COLTOROW ( 'height,weight,bmi') );