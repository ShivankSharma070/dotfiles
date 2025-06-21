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
export EDITOR="nvim"
export BROWSER="vivaldi"
export TERM="xterm-kitty"

#list
alias ls='ls --color=auto'
alias la='ls -a'
alias ll="eza --tree --level=2 --long --icons --git"
alias l="exa -al --color=always --group-directories-first"
alias l.="ls -A | grep -E '^\.'"


#pacman
alias sps='sudo pacman -S'
alias spr='sudo pacman -R'
alias sprs='sudo pacman -Rs'
alias sprdd='sudo pacman -Rdd'
alias spqo='sudo pacman -Qo'
alias spsii='sudo pacman -Sii'

#fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'
alias udpate='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias updte='sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'
alias upqll='paru -Syu --noconfirm'
alias upal='paru -Syu --noconfirm'

#Colorise the grep command
alias grep='grep --color=auto'

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

#Aliass for fish
alias emacs="emacsclient -c -a 'emacs'"
alias cat="bat" # using bat instaed of cat
alias v="nvim"
alias c="clear"
alias vim="nvim"

#Abbrevations for fish shell
#abbr -a rc --position command --set-cursor -- "g++ %.cpp -o run.exe && ./run.exe"


# starship init fish | source
fish_config theme choose "Dracula Official"
fzf --fish | source

# Zoxide 
zoxide init fish --cmd cd | source

# Vim for for fish
fish_vi_key_bindings
bind -M insert jk 'set fish_bind_mode default; commandline -f repaint'
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
