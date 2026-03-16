if status is-interactive
    set fish_cursor_default block
    set fish_cursor_insert block
    set fish_cursor_replace_one block
    set fish_cursor_visual block
    set fish_vi_force_cursor 1
end

export fish_greeting=""
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.config/rofi/scripts:$PATH"
export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export EDITOR="nvim"
export BROWSER="zen-browser"
# export TERM="xterm-ghostty"
export DEV_PATH="$HOME/OneDrive/dev/"

#list
# alias ls='ls --color=auto'
# alias la='ls -a'
alias ll="eza --tree --level=2 --long --icons --git"
alias l="exa -al --color=always --group-directories-first"
alias l.="ls -A | grep -E '^\.'"

#fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'

#Colorise the grep command
alias grep='grep --color=auto'

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

alias emacs="emacsclient -c -a 'emacs'"
alias cat="bat" # using bat instaed of cat
alias v="nvim"
alias vim="nvim"
alias nvim.="nvim ."
alias vim.="nvim ."
alias c="/bin/clear"
alias hypr="start-hyprland"
alias brave="/usr/bin/brave --force-device-scale-factor=0.7"

#Abbrevations for fish shell
abbr -a _rc --position command --set-cursor -- "g++ %.cpp -o run && ./run"
abbr -a _nvim --position command --set-cursor -- "neovide &"
abbr -a tm --position command --set-cursor -- "tmux-sessionizer.sh"

# starship init fish | source
fzf --fish | source

# Zoxide 
zoxide init fish --cmd cd | source

function fish_mode_prompt
    # Intentionally empty to disable fish's default mode indicator
end


# fzf configuration
set -gx FZF_DEFAULT_OPTS '--height 80% --border --layout=default'
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git --exclude node_modules --exclude .cache --exclude go --exclude .local'
set -gx FZF_CTRL_T_OPTS '--preview "bat --color=always {}" --bind "?:toggle-preview"'
set -gx FZF_CTRL_T_COMMAND 'fd --type f --hidden --follow --exclude .git --exclude node_modules --exclude .cache --exclude go --exclude .local' 
set -gx FZF_ALT_C_OPTS '--preview "eza --icons --tree --level=1 --color=always {}" --bind "?:toggle-preview"'
set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git --exclude node_modules --exclude .cache --exclude go --exclude .local' 
set -gx FZF_CTRL_R_OPTS '--preview "echo {}" --preview-window=up:3 --bind "?:toggle-preview"'

# carapace for completion
set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
carapace _carapace | source


# opencode
fish_add_path /home/shivank/.opencode/bin
