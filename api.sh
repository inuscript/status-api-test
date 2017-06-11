#!/bin/bash -x

# 前回実行からstatusを採る
TITLE=$1
BEFORE_RESULT=$2

[ $BEFORE_RESULT = "0" ] && STATUS="success" || STATUS="failure"

if [ ! ${CI} ]; then
  exit
fi

BASE_URL=https://api.github.com
URL=${BASE_URL}/repos/${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}/statuses/${CIRCLE_SHA1}?access_token=${GITHUB_TOKEN}

curl ${URL} \
  -H "Content-Type: application/json" \
  -X POST \
  -d "{\"state\": \"${STATUS}\", \"context\": \"${TITLE}\" }"

exit $BEFORE_RESULT