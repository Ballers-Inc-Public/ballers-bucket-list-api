#!/bin/sh
#!/bin/sh
#!/bin/bash

#!/bin/sh
#!/bin/bash

TOKEN="XyN9BwEZrHZSZmgk8hc+DlYTyfO7QQRkMfkedR41F0o=--0o7zpMh8tGxaKPPTWJ9ak36nkjJvnl9pAtJmhLwCHOU="
TITLE="Updated title"
STATUS="Updated status"
ID="591c8ee56a757d00120f8289"
API="https://afternoon-reef-18895.herokuapp.com"
URL_PATH="/goals"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "goal": {
      "title": "'"${TITLE}"'"
    }
  }'

echo
