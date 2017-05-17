# sh
#!/bin/sh

API="http://localhost:4741"
URL_PATH="/goals"
GOAL="I Made a BOOK2"
TOKEN="lfDiWVEi4GvqmoCtQzfbSbVXt7MJHLoRUb1p9ufXKzQ=--PokJihZ5wPbZTJzpsMnTzP8Y7u+joMftAYx6uk+9ZIo="
# STATUS="YOU WROT IT"
STATUS="Finished"

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
