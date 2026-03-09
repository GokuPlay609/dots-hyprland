# Basic settings
setopt AUTO_CD
setopt BEEP
setopt EXTENDED_GLOB
setopt NOMATCH
setopt NOTIFY

# History settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY

# Keybindings (Vi mode or Emacs mode based on user preference, but defaulting to emacs style for common usage)
bindkey -e
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Completion
if [ ! -d "$HOME/.zcache" ]; then
    mkdir -p "$HOME/.zcache" || echo "Warning: Could not create $HOME/.zcache"
fi
autoload -Uz compinit
compinit -d "$HOME/.zcache/zcompdump"
zstyle ':completion:*' menu select

# Colors
autoload -Uz colors && colors

# Aliases
alias clear="printf '\033[2J\033[3J\033[1;1H'" # fix: kitty doesn't clear properly
alias celar="printf '\033[2J\033[3J\033[1;1H'"
alias claer="printf '\033[2J\033[3J\033[1;1H'"
alias ls='eza --icons'
alias pamcan='pacman'
alias q='qs -c ii'

# Sourcing standard plugins if they exist
# Arch
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
# Fedora
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
# Gentoo
if [ -f /usr/share/zsh/site-functions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/site-functions/zsh-autosuggestions.zsh
fi
if [ -f /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
fi
# Nix FHS/Profile paths
if [ -f ~/.nix-profile/share/zsh/site-functions/zsh-autosuggestions.zsh ]; then
    source ~/.nix-profile/share/zsh/site-functions/zsh-autosuggestions.zsh
elif [ -f ~/.nix-profile/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/.nix-profile/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
if [ -f ~/.nix-profile/share/zsh/site-functions/zsh-syntax-highlighting.zsh ]; then
    source ~/.nix-profile/share/zsh/site-functions/zsh-syntax-highlighting.zsh
elif [ -f ~/.nix-profile/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.nix-profile/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
# Nix System paths
setopt nullglob
for f in /nix/store/*/share/zsh-*/zsh-autosuggestions.zsh /run/current-system/sw/share/zsh-*/zsh-autosuggestions.zsh; do
    if [ -f "$f" ]; then
        source "$f"
        break
    fi
done
for f in /nix/store/*/share/zsh-*/zsh-syntax-highlighting.zsh /run/current-system/sw/share/zsh-*/zsh-syntax-highlighting.zsh; do
    if [ -f "$f" ]; then
        source "$f"
        break
    fi
done
unsetopt nullglob

# Optional system-level nix logic
if [ -f /etc/profile.d/nix.sh ]; then
    source /etc/profile.d/nix.sh
fi

# Quickshell sequences
if [ -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt ]; then
    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
fi

# Starship prompt
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi
