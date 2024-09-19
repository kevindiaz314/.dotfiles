# Initialize Oh My Posh
oh-my-posh init fish --config ~/.config/ohmyposh/omp.toml | source

# Zoxide (smarter cd) 
zoxide init fish | source

# ---- EZA (better ls) ----
alias ls="eza -la --no-user --icons --no-time --no-permissions --no-filesize"

# Interactive neovim launch with fzf
alias invim='nvim (fzf --preview "bat --color=always {}")'

# Set up fzf key bindings
fzf --fish | source
