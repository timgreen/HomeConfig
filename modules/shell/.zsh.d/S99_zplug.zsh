source ~/.zplug/zplug

zplug "b4b4r07/zplug"
zplug "supercrabtree/k"
# zsh-syntax-highlighting must be loaded after executing compinit command and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", nice:10

# fzf & fzf-tmux
zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:fzf, \
    use:"*linux*amd64*"
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

# load
zplug load --verbose
