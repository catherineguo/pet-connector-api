#!/bin/bash

curl "http://localhost:4741/checklists/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "checklist": {
      "title": "'"${TITLE}"'",
      "start_date": "'"${STARTDATE}"'",
      "end_date": "'"${ENDDATE}"'",
      "pet_name": "'"${PETNAME}"'",
      "instructions": "'"${INSTRUCTIONS}"'"
    }
  }'

echo
