if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then #eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/powerlevel10k_rainbow.omp.json')" 
    eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/omp.toml)" 
fi

alias invim='nvim $(fzf --preview "bat --color=always {}")'

# ZSH auto suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Setup fzf keybindings and fuzzy completion
source <(fzf --zsh)

# ---- EZA (better ls) ----
alias ls="eza -la --no-user --icons --no-time --no-permissions --no-filesize" 

# Zoxide (smarter cd) 
eval "$(zoxide init zsh)"
