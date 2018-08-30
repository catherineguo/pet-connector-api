#!/bin/bash

curl "http://localhost:4741/checklists" \
  --include \
  --request POST \
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
