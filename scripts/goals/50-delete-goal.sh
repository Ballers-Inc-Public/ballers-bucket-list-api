#!/bin/sh
#!/bin/bash
TOKEN="yRyZD7Gfn45uS389X3hq2zin4LWCiiQAjF3hEdHm904=--o+Me17AnHbst38plQANIThafAVawmqk3lzbhoZqyVEY="
ID="591b173085c3861eabeacd9a"
API="http://localhost:4741"
URL_PATH="/goals"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo