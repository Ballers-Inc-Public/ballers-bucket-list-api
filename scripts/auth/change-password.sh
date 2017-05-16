#!/bin/bash

API="http://localhost:4741"
URL_PATH="/change-password"
OLDPW="test1"
NEWPW="test12"
ID="5919fb0907f34d7bfc7c920f"
TOKEN="lNJ+J8auYjT9utNxLEUXv/eZkAzNk86lzVdJpZb2J5s=--CDlyOoxisVxI4x5icOMlLf6FB7bEAWIim94K+U0CZ+o="

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'

echo
