#!/bin/bash -x

# 前回実行からstatusを採る
[ $? = "0" ] && STATUS="success" || STATUS="failure"
TITLE=$1

if [ ! ${CI} ]; then
  exit
fi

BASE_URL=https://api.github.com
URL=${BASE_URL}/repos/${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}/statuses/${CIRCLE_SHA1}

curl ${BASE_URL} \
  -H "Content-Type: application/json" \
  -X POST \
  -d "{\"state\": \"${STATUS}\", \"context\": \"${TITLE}\" }"

