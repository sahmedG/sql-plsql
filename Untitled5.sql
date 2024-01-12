select listagg ( 'resourceType": "'||'patient'||'",
       "id": "'||:id||'",
       "meta": {
        "versionId": "191610",
        "lastUpdated": "2016-01-30T02:29:13.555+00:00"
           },
           "text": {
    "status": "generated",
    "div": "<div>\n        \n            <p>'||person_name||'</p>\n      \n          </div>"
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
      "value": "'||:id||'"
    }
  ],
  "active": "true",
  "name": [
    {
      "use": "official",
      "family": [
        "'||person_name||'"
      ],
      "given": [
        "'||person_name||'"
      ]
    }
  ],
  "telecom":[ { '
       ||'"system":"'||'phone'||'"'
       ||',"value":"'||phone||'"'
       ||'}, {'||'"system":'||'"email"'||',"value":'||'"home"}],"geneder":"'||sex||'","birthDate":"'||DOB||'","address":[{"use":'||'"home","line":["'||ROAD_NO||'"],
       "city":"'||area||'","state":'||'"none","postalCode":'||'"0187","country":'||'"Bahrain"}],
       "photo":[{"contentType":'||'"image/jpeg","url":'||'"something","hash":"5465464","title":"Head photograph of the patient"}]}' ) within group (order by 1) 
         as  json
  from   person where person_id = :id;