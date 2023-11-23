source "$HOME/.zgenom/zgenom.zsh"

# Check for plugin and zgenom updates every 7 days
# This does not increase the startup time.
zgenom autoupdate

# if the init script doesn't exist
if ! zgenom saved; then

  zgenom loadall < <(
    sed 's/\s*#.*$//' $HOME/.zgen_list/*.list(N) /dev/null
  )

  # generate the init script from plugins above
  zgenom save
  # Compile your zsh files
  zgenom compile "$HOME/.zshrc"
fi
