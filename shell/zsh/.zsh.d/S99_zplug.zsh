export ZPLUG_HOME="$HOME/.zplug/zplug"

# Check if zplug is installed
if [[ ! -d $ZPLUG_HOME ]]; then
  mkdir -p $(dirname $ZPLUG_HOME)
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source $ZPLUG_HOME/init.zsh
fi

source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "supercrabtree/k"
# zsh-syntax-highlighting must be loaded after executing compinit command and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# fzf & fzf-tmux
zplug "junegunn/fzf", use:"shell/*.zsh"

zplug "zsh-users/zaw"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "bric3/nice-exit-code"
zplug "nviennot/zsh-vim-plugin" # support vi file:123

# # Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# Then, source plugins and add commands to $PATH
zplug load
