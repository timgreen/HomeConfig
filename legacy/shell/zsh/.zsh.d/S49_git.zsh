# TODO(timgreen): change to vcs_info introduced in zsh 4.3.6.
# get the name of the branch we are on
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
