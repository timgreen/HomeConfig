declare -a smartdir_functions
declare -a smartdir_title_only_functions

function do_smartdir {
  local dir="$1"
  shift

  for func in ${(@o)*}; do
    tmp=$($func "$dir")
    if [[ "$tmp" != "" ]]; then
      dir="$tmp"
      break
    fi
  done

  echo "$dir"
}

function smartdir {
  do_smartdir "$1" ${smartdir_functions[@]}
}

function smartdir_title {
  do_smartdir "$1" ${smartdir_functions[@]} ${smartdir_title_only_functions[@]}
}

function smartdir_99_compress_to_20 {
  local dir="$1"
  local odir

  # 自动压缩目录名到小于 20 个字符
  while (( ${#dir} > 20 )) && [[ $dir != $odir ]]; do
    odir=$dir
    dir=$(echo $dir | sed "s:\([~/][^/]\)[^/]\+:\1:")
  done

  [[ "$1" != "$dir" ]] && echo "$dir"
}


#smartdir_title_only_functions+="smartdir_99_compress_to_20"

