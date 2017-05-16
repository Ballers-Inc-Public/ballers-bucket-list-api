#!/bin/sh
ID="591b173085c3861eabeacd9a"
API="http://localhost:4741"
URL_PATH="/goals"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  #  --header "Authorization: Token token=$TOKEN"

echo
