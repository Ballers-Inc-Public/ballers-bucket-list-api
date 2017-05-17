# sh
#!/bin/sh

API="https://afternoon-reef-18895.herokuapp.com"
URL_PATH="/goals"
GOAL="I Made a BOOK2"
TOKEN="XyN9BwEZrHZSZmgk8hc+DlYTyfO7QQRkMfkedR41F0o=--0o7zpMh8tGxaKPPTWJ9ak36nkjJvnl9pAtJmhLwCHOU="
# STATUS="YOU WROT IT"
STATUS="NOT"

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
