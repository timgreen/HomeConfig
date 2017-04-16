CMD_START_TIME=-1
typeset -A CMD_ELAPSED_THRESHOLD

function preexec_notify_long_process {
  local -a cmd; cmd=(${=*})

  CMD_START_TIME=$SECONDS
  CMD_LAST_NAME="$cmd[1]:t"
  CMD_LAST="$1"
}
preexec_functions+='preexec_notify_long_process'

function precmd_notify_long_process {
  elapsed=$((SECONDS - CMD_START_TIME))
  threshold=60
  if [[ $CMD_ELAPSED_THRESHOLD["$CMD_LAST_NAME"] != "" ]]; then
    threshold=$CMD_ELAPSED_THRESHOLD["$CMD_LAST_NAME"]
  fi

  if (($CMD_START_TIME > 0)) && (($threshold > 0)) && (($elapsed > $threshold)); then
    # bell
    echo -n ""
    # desktop notification
    type -p notify-send &> /dev/null && notify-send -t 10000 -c cmd "Command Complete" "$CMD_LAST"
  fi
  CMD_START_TIME=-1;
}
precmd_functions+='precmd_notify_long_process'

CMD_ELAPSED_THRESHOLD["vim"]=-1
CMD_ELAPSED_THRESHOLD["tig"]=-1
