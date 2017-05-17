#!/bin/sh

API="https://afternoon-reef-18895.herokuapp.com"
URL_PATH="/goals"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  # --header "Authorization: Token token=$TOKEN"

echo
