
if status is-interactive
    # Commands to run in interactive sessions can go here
end

export fish_greeting=""
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.config/rofi/scripts:$PATH"
export PATH="$HOME/scripts:$PATH"
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8
export EDITOR="nvim"
export BROWSER="brave"

#Aliass for fish
alias ll="eza --tree --level=2 --long --icons --git"
alias l="exa -al --color=always --group-directories-first"
alias emacs="emacsclient -c -a 'emacs'"
alias cat="bat" # using bat instaed of cat
alias v="nvim"
alias c="clear"
alias ls="error" # To get rid of my habit of running ls every time
alias vim="nvim"
#Abbrevations for fish shell
#abbr -a rc --position command --set-cursor -- "g++ %.cpp -o run.exe && ./run.exe"
function vterm_printf;
    if begin; [  -n "$TMUX" ]  ; and  string match -q -r "screen|tmux" "$TERM"; end
        # tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
    else if string match -q -- "screen*" "$TERM"
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$argv"
    else
        printf "\e]%s\e\\" "$argv"
    end
end

# Function to change current directory while using yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function fman
          complete -C | awk '{print $1}' | fzf | xargs man
end

starship init fish | source
fish_config theme choose "Dracula Official"
fzf --fish | source

# Vim for for fish
fish_vi_key_bindings
bind -M insert jk 'set fish_bind_mode default; commandline -f repaint'
function fish_mode_prompt
  # Intentionally empty to disable fish's default mode indicator
end

set -Ux TERMINAL ghostty
# fzf configuration
set -gx FZF_DEFAULT_OPTS '--height 80% --border --layout=default'
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git --exclude node_modules'
set -gx FZF_CTRL_T_OPTS '--preview "bat --color=always {}" --bind "?:toggle-preview"'
set -gx FZF_ALT_C_OPTS '--preview "eza --icons --tree --level=1 --color=always {}" --bind "?:toggle-preview"'
set -gx FZF_CTRL_R_OPTS '--preview "echo {}" --preview-window=up:3 --bind "?:toggle-preview"'
