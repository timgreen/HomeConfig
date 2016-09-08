post_install() {
  [ -d ~/.tmux/plugins/tpm ] || {
    echo "Installing TPM ..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  }
}
