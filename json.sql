select '{'||'
       "resourceType":"Patient",
       "id": "5454",
       "meta": {
        "versionId": "191610",
        "lastUpdated": "2016-01-30T02:29:13.555+00:00"
           },
           "text": {
    "status": "generated",
    "div": "<div>\n        \n            <p>Allen Vitalis</p>\n      \n          </div>"
  },
  "identifier": [
    {
      "use": "usual",
      "type": {
        "coding": [
          {
            "system": "http://hl7.org/fhir/v2/0203",
            "code": "MR",
            "display": "Medical record number"
          }
        ],
        "text": "Medical record number"
      },
      "system": "http://hospital.smarthealthit.org",
      "value": "99912345"
    }
  ],
  "telecom":[' 
       || listagg( '{ '
       ||'"system":"'||'phone'||'"'
       ||',"value":"'||phone||'"'
       ||',"use":"'||'home'||'"'
       ||'}, {'||'"system":'||'"email"'||',"value":'||'"home"}],"geneder":"'||sex||'","birthDate":"'||DOB||'","address":[{"use":'||'"home","line":["'||ROAD_NO||'"],
       "city":"'||area||'","state":'||'"none","postalCode":'||'"0187","country":'||'"Bahrain"}],"photo":[{"contentType":'||'"image/jpeg","url":'||'"something","hash":"5465464","title":"Head photograph of the patient"}]') within group (order by 1) 
       || '}' as  json
  from   person where person_id = :id;
  
  
  
  
  insert into fall_risk (ID,FALL_RISK_SCORE_INTERVENTION,FALL_RISK_INTERVENTION) values ('1','present','Safety');
  commit;
  select * from fall_risk order by id;
  delete fall_risk where id = 1;