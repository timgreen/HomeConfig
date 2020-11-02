# prompt_subst is not set by default. It allows variable substitution to
# take place in the prompt, so I can just change the contents of certain
# variables without recreating the prompt every time.
setopt prompt_subst

# See if we can use colors.
autoload colors zsh/terminfo
if (( $terminfo[colors] >= 8 )); then
  colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  #eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
  #eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
  eval PR_$color='%{$fg[${(L)color}]%}'
  eval PR_LIGHT_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
done
PR_NO_COLOUR="%{$terminfo[sgr0]%}"

## Prepare variables
function precmd_prompt {
  local TERM_WIDTH
  (( TERM_WIDTH = ${COLUMNS} - 1 ))

  # Truncate the path if it's too long.
  PR_FILLBAR=""
  PR_PWDLEN=""

  # TODO(timgreen): should be zero?
  local prompt_size=2
  local pwd_placeholder="$(echo "${(%):-%~}" | LC_ALL=C sed "s/[\x80-\xff]\{3\}/xx/g")"
  local pwd_size=${#pwd_placeholder}
  local hostname_size=$((${#${(%):-%2m}} + 1))
  local git_info_size
  local git_current_branch="$(parse_git_branch)"
  if (( ${#git_current_branch} )); then
    PR_GIT_INFO=" $PR_LIGHT_GREEN● $PR_CYAN$git_current_branch"
    git_info_size=$((3 + ${#git_current_branch}))
  else
    PR_GIT_INFO=''
    git_info_size=0
  fi

  if (( $prompt_size + $pwd_size + $git_info_size > $TERM_WIDTH )); then
    ((PR_PWDLEN = $TERM_WIDTH - $prompt_size - $git_info_size))
    if (( PR_PWDLEN <= 3 )); then
      PR_GIT_INFO=''
      git_info_size=0
      ((PR_PWDLEN = $TERM_WIDTH - $prompt_size))
    fi
  else
    PR_FILLBAR="\${(l.(($TERM_WIDTH - ($prompt_size + $pwd_size + $git_info_size + $hostname_size)))..━.)}"
  fi
}
precmd_functions+='precmd_prompt'

set_prompt () {
  # See if we can use extended characters to look nicer.
  # http://www.tedmontgomery.com/tutorial/altchrc.html
  typeset -A altchar
  set -A altchar ${(s..)terminfo[acsc]}
  PR_SET_CHARSET="%{$terminfo[enacs]%}"
  PR_SHIFT_IN="%{$terminfo[smacs]%}"
  PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
  PR_HBAR=${altchar[q]:--}
  PR_ULCORNER=${altchar[l]:--}
  PR_LLCORNER=${altchar[m]:--}
  PR_LRCORNER=${altchar[j]:--}
  PR_URCORNER=${altchar[k]:--}


  local SNIPPET_PWD='%$PR_PWDLEN<...<%~%<<'
  local SNIPPET_FILLBAR='${(e)PR_FILLBAR}'
  local SNIPPET_EXIT_CODE='%(?..$PR_LIGHT_RED✖ $(nice_exit_code))'
  local SNIPPET_TIME='%D{%H:%M %b %d}'
  local SNIPPET_HOSTNAME=' %2m'

  # Finally, the prompt.
  # prompt will looks like:
  # [ pwd ]----------------------
  # OR
  # [ pwd : git_branch ]----------------------
  PROMPT="${PR_LIGHT_GREEN} $PR_LIGHT_YELLOW$SNIPPET_PWD\$PR_GIT_INFO$PR_LIGHT_GREEN $SNIPPET_FILLBAR$PR_LIGHT_RED$SNIPPET_HOSTNAME
$SNIPPET_EXIT_CODE$PR_NO_COLOUR\$ "

  # Show time at right e.g
  # (19:32)
  RPROMPT=" $PR_BLUE($PR_LIGHT_YELLOW$SNIPPET_TIME$PR_BLUE)$PR_NO_COLOUR"
  ## e.g in if statement display:
  ## - if -
  PS2='$PR_LIGHT_GREEN- $PR_LIGHT_CYAN%_$PR_LIGHT_GREEN -$PR_NO_COLOUR '

}

set_prompt

# # run TRAPALRM every $TMOUT seconds
# TMOUT=30
# TRAPALRM() {
#   # reset-prompt - this will update the prompt
#   # TODO(timgreen): when in menu select, menu will gone after reset
#   zle reset-prompt
# }
