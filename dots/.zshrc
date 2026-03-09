# Source .config/zshrc.d configs
if [ -d "$HOME/.config/zshrc.d" ]; then
    setopt nullglob
    for f in "$HOME/.config/zshrc.d/"*.zsh; do
        [ -r "$f" ] && source "$f"
    done
    unsetopt nullglob
fi
