#!/bin/bash

tmp_new_timestamps="/dev/shm/.tmp_git_reset_new_timestamps.txt"
declare -A timestamp_map

list_all_logs() {
  # commit_id timestamps [parents_commit_ids]
  git log --all --format="%H %at %P" --topo-order --reverse
}

generate_new_timestamp() {

  while IFS='' read -r line; do
    IFS=', ' read -r -a array <<< "$line"
    commit_id="${array[0]}"
    timestamp="${array[1]}"
    parents=("${array[@]:2}")

    new_timestamp=$(get_new_timestamps $timestamp ${parents[@]})
    new_timestamp=$(fix_timestamps $new_timestamp)
    timestamp_map[$commit_id]=$new_timestamp
    [[ $timestamp != $new_timestamp ]] && echo "$commit_id $new_timestamp $(date --date="@$timestamp") $(date --date="@$new_timestamp")" >> "$tmp_new_timestamps"
  done
}

get_new_timestamps() {
  {
    echo $1
    shift

    for parent in "$@"
    do
      inc=$RANDOM
      let "inc %= 1000"
      echo $(( ${timestamp_map[$parent]} + $inc ))
    done
  } | sort -rn | head -1
}

fix_timestamps() {
  timestamp=$1

  while true; do
    weekday=$(date --date="@$timestamp" +"%u")
    (( $weekday >= 6 )) && break
    hour=$(date --date="@$timestamp" +"%H" | sed 's/^0//')
    (( $hour <= 6 )) && break
    (( $hour >= 20 )) && break
    timestamp=$(($timestamp + 60 * 60)) # plus 1 hour
  done

  echo $timestamp
}

reset_commit() {
  git filter-branch -f --env-filter \
    "
      if grep \"^\$GIT_COMMIT\" \"$tmp_new_timestamps\" > /dev/null; then
        t=\$(grep \"^\$GIT_COMMIT\" \"$tmp_new_timestamps\" | cut -d' ' -f 2)
        export GIT_AUTHOR_DATE=\"\$(date --date=\"@\$t\" \"+%c\")\"
        export GIT_COMMITTER_DATE=\"\$(date --date=\"@\$t\" \"+%c\")\"
      fi
    " \
    -- \
    master
}

main() {
  # set seed
  RANDOM=0

  rm -f "$tmp_new_timestamps"
  list_all_logs | generate_new_timestamp
  if [ -r "$tmp_new_timestamps" ]; then
    echo "Need reset"
    reset_commit
  else
    echo "No reset needed!"
  fi
}

main
