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

help() {
  cat << EOF
Usage: $(basename "$0") <commit_id> <delta>
       Example delta: "12 hours ago"
EOF
}

if (( $# != 2 )); then
  help
  exit 1
fi
reset_commit "$1" "$2"
