if status is-interactive
    # Commands to run in interactive sessions can go here
end

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

# Shell wrapper: changes the current working directory when exiting Yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
