## 动态 Title
function title {
  if [[ $TERM == "screen" || $TERM == "screen.linux" || $TERM == "screen-256color" ]]; then
    # Use these two for GNU Screen:
    print -nR $'\033k'$1$'\033'\\\

    print -nR $'\033]0;'$2$'\a'
  elif [[ $TERM == "xterm" || $TERM == "urxvt" ]]; then
    # Use this one instead for XTerms:
    print -nR $'\033]0;'$*$'\a'
    #trap 'echo -ne "\e]0;$USER@$HOSTNAME: $BASH_COMMAND\007"' DEBUG
  fi
}

# Set screen title if not connected remotely
function precmd_title {
  local dir; dir=$(print -Pn "%~")
  dir=$(smartdir_title "$dir")

  title "$dir" "$TERM $PWD"
  echo -ne '\033[?17;0;127c'
}
precmd_functions+='precmd_title'

function preexec_title {
  local -a cmd; cmd=(${=*})

  for func in ${(@o)cmd_title_functions[@]}; do
    output=$($func "${cmd[@]}")
    if [[ "$output" != "" ]]; then
      title "$output"
      break
    fi
  done
}

preexec_functions+='preexec_title'
