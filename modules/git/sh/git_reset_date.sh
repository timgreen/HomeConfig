#!/bin/bash

reset_commit() {
  commit=$1
  delta=$2

  committer_date=$(git show -s --format=%ci $commit)
  author_date=$(git show -s --format=%ai $commit)

  new_committer_date=$(date "+%c" -d "$committer_date $delta")
  new_author_date=$(date "+%c" -d "$author_date $delta")

  git filter-branch -f --env-filter \
      "if [ \$GIT_COMMIT = $commit ]; then
         export GIT_AUTHOR_DATE=\"$new_author_date\"
         export GIT_COMMITTER_DATE=\"$new_committer_date\"
       fi"
}

reset_commit "$1" "$2"
