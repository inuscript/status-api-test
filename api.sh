#! /bin/bash

RESULT = $? ? "failure" : "success"
[!$CI] && echo "exit" && exit;

URL=https://api.github.com/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/statuses/$CIRCLE_SHA1
