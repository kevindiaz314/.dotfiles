# Overwrite fish_greeting
set fish_greeting

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

# Set up Atuin
atuin init fish | source

# Shell wrapper: changes the current working directory when exiting Yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# ----- Neovim isolated configurations -----
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims
    set -l items default LazyVim AstroNvim
    set -l config (printf "%s\n" $items | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
    
    if test -z "$config"
        echo "Nothing selected"
        return 0
    else if test "$config" = "default"
        set config ""
    end
    
    env NVIM_APPNAME=$config nvim $argv
end
