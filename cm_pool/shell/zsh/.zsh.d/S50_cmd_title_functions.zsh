declare -a cmd_title_functions

function cmd_title_99_default {
  if [[ $1:t == "ssh" ]]; then
      echo "@"$2
  elif [[ $1:t == "sleep" ]]; then
      echo "aaaaaaaaaaaaaa" ""
  elif [[ $1:t == "sudo" ]]; then
      echo "#"$2:t
  elif [[ $1:t == "for" ]]; then
      echo "()"$7
  elif [[ $1:t == "svn" ]] || [[ $1:t == "git" ]]; then
      echo "$1 $2"
  else
      echo $1:t
  fi
}

cmd_title_functions+="cmd_title_99_default"
