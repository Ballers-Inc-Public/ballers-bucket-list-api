# sh
#!/bin/sh

API="http://localhost:4741"
URL_PATH="/goals"
GOAL="I Made a BOOK2"
TOKEN="yRyZD7Gfn45uS389X3hq2zin4LWCiiQAjF3hEdHm904=--o+Me17AnHbst38plQANIThafAVawmqk3lzbhoZqyVEY="
STATUS="YOU WROT IT"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "goal": {
      "title": "'"${GOAL}"'",
      "status": "'"${STATUS}"'"
    }
  }'

echo
