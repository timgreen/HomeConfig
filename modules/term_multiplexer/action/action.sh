post_install() {
  mkdir -p ~/.tmux/plugins

  [ -d ~/.tmux/plugins/tpm ] || {
    echo "Installing TPM ..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  }

  [ -d ~/.tmux/tmuxifier ] || {
    echo "installing Tmuxifier ..."
    git clone https://github.com/jimeh/tmuxifier.git ~/.tmux/tmuxifier
  }
}
