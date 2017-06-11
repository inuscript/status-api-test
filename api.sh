#!/bin/bash -x

# 前回実行からstatusを採る
[ $? = "0" ] && RESULT="success" || RESULT="failure"

post(){
  if [ ! ${CI} ]; then
    exit
  fi

  BASE_URL=https://api.github.com
  URL=${BASE_URL}/repos/${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}/statuses/${CIRCLE_SHA1}
}

post(RESULT)