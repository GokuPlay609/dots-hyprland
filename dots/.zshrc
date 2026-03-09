# Source .config/zshrc.d configs
if [ -d "$HOME/.config/zshrc.d" ]; then
    for f in "$HOME/.config/zshrc.d/"*.zsh; do
        [ -r "$f" ] && source "$f"
    done
fi
