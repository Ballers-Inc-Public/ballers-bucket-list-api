#!/bin/sh
#!/bin/sh
#!/bin/bash

#!/bin/sh
#!/bin/bash
TOKEN="$TOKEN"
TITLE="Updated title"
STATUS="Updated status"
ID="591c65f4b0b6727a315b7bbf"
API="http://localhost:4741"
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
