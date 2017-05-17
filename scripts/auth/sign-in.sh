#!/bin/bash

API="https://afternoon-reef-18895.herokuapp.com"
URL_PATH="/sign-in"
EMAIL="test@test.com"
PASSWORD="test1"


curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'

echo
