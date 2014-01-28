CMD_START_TIME=-1;
function preexec_notify_long_process {
  local -a cmd; cmd=(${=*})

  CMD_START_TIME=$SECONDS
  CMD_NAME="$1"
}
preexec_functions+='preexec_notify_long_process'

function precmd_notify_long_process {
  elapsed=$((SECONDS - CMD_START_TIME))
  if (($CMD_START_TIME > 0)) && (($elapsed > 10)); then
    # bell
    echo -n ""
    # desktop notification
    type -p notify-send &> /dev/null && notify-send -t 10000 -c cmd "Command Complete" "$CMD_NAME"
  fi
  CMD_START_TIME=-1;
}
precmd_functions+='precmd_notify_long_process'
