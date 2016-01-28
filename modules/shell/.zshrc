# vim: set ft=zsh foldmethod=marker autoindent expandtab shiftwidth=4 :

setopt EXTENDED_GLOB
for zshrc_snipplet in ~/.zsh.d/S[0-9][0-9]*; do
    source $zshrc_snipplet
done
if [ -d ~/.zsh.ext.d/ ]; then
    for zshrc_snipplet in ~/.zsh.ext.d/S[0-9][0-9]*; do
        source $zshrc_snipplet
    done
fi
