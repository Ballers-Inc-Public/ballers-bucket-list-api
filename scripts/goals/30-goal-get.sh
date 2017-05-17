#!/bin/sh
ID="591c8ee56a757d00120f8289"
API="https://afternoon-reef-18895.herokuapp.com"
URL_PATH="/goals"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  #  --header "Authorization: Token token=$TOKEN"

echo
