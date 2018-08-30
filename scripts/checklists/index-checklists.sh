#!/bin/bash

curl "http://localhost:4741/checklists" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \

echo
