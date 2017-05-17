# sh
#!/bin/sh

API="http://localhost:4741"
URL_PATH="/goals"
TOKEN="$TOKEN"
GOAL="This is an example goal"
STATUS="This is an example status"

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
