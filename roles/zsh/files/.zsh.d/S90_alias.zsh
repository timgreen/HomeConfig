# For safe
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias rm='nocorrect rm -i'

# General
alias ..='cd ..'
alias cd..='cd ..'

if [ $IS_MACOX ]; then
  alias ls='ls -G'
elif [ $IS_LINUX ]; then
  alias ls='ls --color'
fi
alias l='ls -al'
alias ll='ls -l'

# Tools
alias less='less -R'
alias grep='grep --color=auto'
alias rscp='rsync -aHAXxv -v -P -e "ssh -T -o Compression=no -x"' # http://www.commandlinefu.com/commands/view/11690/the-fastest-remote-directory-rsync-over-ssh-archival-i-can-muster-40mbs-over-1gb-nics

#
alias ri='ri -T -f ansi'
