if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then #eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/powerlevel10k_rainbow.omp.json')" 
    eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/omp.toml)" 
fi

# Set Neovim as the default text editor
export EDITOR="nvim"
export VISUAL="$EDITOR"

# Interactive neovim launch with fzf
alias invim='nvim $(fzf --preview "bat --color=always {}")'

# ZSH auto suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Setup fzf keybindings and fuzzy completion
# source <(fzf --zsh)

# ---- EZA (better ls) ----
alias ls="eza -la --no-user --icons --no-time --no-permissions --no-filesize" 

# Zoxide (smarter cd) 
eval "$(zoxide init zsh)"

# Atuin plugin
eval "$(atuin init zsh)"

# ----- Neovim isolated configurations -----
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
    items=("default" "LazyVim" "AstroNvim")
    config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
    if [[ -z $config ]]; then
        echo "Nothing selected"
        return 0
    elif [[ $config == "default" ]]; then
        config=""
    fi
    NVIM_APPNAME=$config nvim $@
}

# Shell wrapper: changes the current working directory when exiting Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
