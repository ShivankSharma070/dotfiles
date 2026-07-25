# ─── History ──────────────────────────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY HIST_VERIFY

# ─── Completion (cached, only rebuilds every 24h) ─────────────────────────────
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then compinit
else compinit -C; fi

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:descriptions' format '%F{#eb9a96}── %d ──%f'
zstyle ':completion:*:warnings' format '%F{#FF8A80}no matches%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true

# ─── VI Mode ──────────────────────────────────────────────────────────────────
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

# Cursor shape: \e[2 q for block, and \e[6 q for line
 echo -ne '\e[2 q'

# ─── Keybindings ──────────────────────────────────────────────────────────────
bindkey '^D' undefined-key
bindkey -s '^F' 'tmux-sessionizer.sh\n'
bindkey -s '^N' 'nvim\n'
bindkey -s '^g' 'gh repo list --json name,url --jq ".[].url" | fzf | xargs $BROWSER --new-window\n'
bindkey '^[[1;5C' forward-word
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Fix backspace and Ctrl-W in vi insert mode
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char
bindkey -M viins '^W' backward-kill-word

# Fix Home/End keys in both vi modes
bindkey -M viins '^[[H' beginning-of-line
bindkey -M viins '^[[F' end-of-line
bindkey -M vicmd '^[[H' beginning-of-line
bindkey -M vicmd '^[[F' end-of-line

# ─── Edit Command Line in EDITOR ──────────────────────────────────────────────
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^[v" edit-command-line

# ─── Environment ──────────────────────────────────────────────────────────────
export EDITOR=nvim
export BROWSER=brave
export DEV_PATH="$HOME/OneDrive/dev/"

path=(
    $HOME/.opencode/bin
    $HOME/.config/emacs/bin
    $HOME/.config/rofi/scripts
    $HOME/.scripts
    $HOME/.bin
    $HOME/.local/bin
    $HOME/go/bin
    $path
)

# ─── Aliases ──────────────────────────────────────────────────────────────────
alias ll="eza --tree --level=2 --long --icons --git"
alias l="exa -al --color=always --group-directories-first"
alias l.="ls -A | grep -E '^\\.'"
alias cd..='cd ..'
alias pdw='pwd'
alias grep='grep --color=auto'
alias emacs="emacsclient -c -a 'emacs'"
alias cat="bat"
alias vim="nvim"
alias nvim.="nvim ."
alias vim.="nvim ."
alias c="/bin/clear"
alias hypr="start-hyprland"
alias y="/bin/yazi"

# ─── Tools ────────────────────────────────────────────────────────────────────
eval "$(fzf --zsh)"
eval "$(zoxide init zsh --cmd cd)"

# ─── FZF ──────────────────────────────────────────────────────────────────────
export FZF_DEFAULT_OPTS=' --style full --layout reverse --height 80% --min-height 20  --margin 5%,10% --ansi '
export _FD_BASE='fd --hidden --follow --no-ignore-vcs --exclude .git --exclude node_modules --exclude .cache --exclude go --exclude .local --exclude __pycache__ --exclude .cargo --exclude dist --exclude build '
export FZF_CTRL_T_COMMAND="$_FD_BASE --type f"
export FZF_CTRL_T_OPTS=" --preview 'bat -n --color=always {}' --preview-window 'right:55%:wrap' "
export FZF_ALT_C_COMMAND="$_FD_BASE --type d"
export FZF_ALT_C_OPTS=" --preview 'eza --icons --tree --level=2 --color=always {}' --preview-window 'right:45%' "
export FZF_CTRL_R_OPTS=" --preview 'echo {}' --preview-window 'up:3:wrap' --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -selection clipboard)+abort' "
export FZF_DEFAULT_COMMAND="$_FD_BASE --type f"

# ─── Carapace (lazy loaded — only triggers on first tab) ──────────────────────
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
function _carapace_lazy() {
    unfunction _carapace_lazy
    source <(carapace _carapace)
    zle reset-prompt
}
zle -N _carapace_lazy
# trigger carapace on first tab press
function _lazy_carapace_completion() {
    if (( ! $+functions[carapace] )); then
        source <(carapace _carapace)
    fi
    zle expand-or-complete
}
zle -N _lazy_carapace_completion
bindkey '^I' _lazy_carapace_completion

# ─── Plugins (zinit, deferred loading) ───────────────────────────────────────
if [[ ! -d "$HOME/.local/share/zinit/zinit.git" ]]; then
    bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# load after first prompt — doesn't block startup
zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting

# zinit ice wait lucid atload'_zsh_autosuggest_start'
# zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search

# ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6e6a86"
# ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# ZSH_AUTOSUGGEST_MANUAL_REBIND=1         # perf: skip rebind on every precmd

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=#3e8fb0,fg=white,bold"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="bg=#FF8A80,fg=white,bold"

# ─── Options ──────────────────────────────────────────────────────────────────
setopt AUTO_CD INTERACTIVE_COMMENTS NO_BEEP PROMPT_SUBST
# removed CORRECT — it adds latency on mistyped commands

# ─── Prompt ───────────────────────────────────────────────────────────────────
autoload -Uz colors && colors

function fish_prompt_zsh() {
    local arrow="%F{#89dceb}➜ %f"  # Sky
    local dir
    if [[ "$PWD" == "$HOME" ]]; then
        dir="%F{#cba6f7}shivank%f"  # Mauve
    else
        dir="%F{#cba6f7}$(basename "$PWD")%f"  # Mauve
    fi
    local branch="" in_git_repo=0
    if git rev-parse --is-inside-work-tree 2>/dev/null | grep -q "true"; then
        in_git_repo=1
        branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    fi
    local git_branch_part
    if [[ $in_git_repo -eq 1 ]]; then
        git_branch_part="%F{#f38ba8}${branch}%f"  # Red
    else
        git_branch_part="%B%F{#f38ba8}╭∩╮(•̀_·́)╭∩╮%f%b"  # Red
    fi
    local git_status_symbol=""
    if [[ $in_git_repo -eq 1 ]]; then
        local git_status git_staged="" git_modified="" git_untracked="" git_deleted="" git_renamed=""
        git_status=$(git status --porcelain 2>/dev/null)
        while IFS= read -r line; do
            local status_code="${line:0:2}"
            case "${status_code:0:1}" in
                A|M|C) git_staged="✚" ;;
                D)     git_staged="✖" ;;
                R)     git_renamed="➜" ;;
            esac
            case "${status_code:1:1}" in
                M) git_modified="✖" ;;
                D) git_deleted="✱" ;;
                \?) git_untracked="?" ;;
            esac
        done <<< "$git_status"
        local ahead="" behind=""
        local ahead_behind
        ahead_behind=$(git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null)
        if [[ -n "$ahead_behind" ]]; then
            local ahead_count="${ahead_behind%%$'\t'*}"
            local behind_count="${ahead_behind##*$'\t'}"
            [[ $ahead_count  -gt 0 ]] && ahead="⇡${ahead_count}"
            [[ $behind_count -gt 0 ]] && behind="⇣${behind_count}"
        fi
        local stashed=""
        git rev-parse --verify refs/stash >/dev/null 2>&1 && stashed="📦"
        if   [[ -z "$git_status" && -z "$ahead" && -z "$behind" && -z "$stashed" ]]; then
            git_status_symbol="%F{#a6e3a1}✔ %f"   # Green
        elif [[ -n "$git_untracked" ]]; then  git_status_symbol="%F{#fab387}? %f"   # Peach
        elif [[ -n "$git_modified"  ]]; then  git_status_symbol="%F{#f38ba8}✖ %f"   # Red
        elif [[ -n "$git_deleted"   ]]; then  git_status_symbol="%F{#f38ba8}✱ %f"   # Red
        elif [[ -n "$git_staged"    ]]; then  git_status_symbol="%F{#a6e3a1}✚ %f"   # Green
        elif [[ -n "$git_renamed"   ]]; then  git_status_symbol="%F{#cba6f7}➜ %f"   # Mauve
        elif [[ -n "$ahead"         ]]; then  git_status_symbol="%F{#89dceb}⇡ %f"   # Sky
        elif [[ -n "$behind"        ]]; then  git_status_symbol="%F{#fab387}⇣ %f"   # Peach
        elif [[ -n "$stashed"       ]]; then  git_status_symbol="%F{#b4befe}📦 %f"  # Lavender
        else git_status_symbol="%F{#f38ba8}%f"  # Red
        fi
    fi
    PROMPT="${arrow}${dir} %F{#74c7ec}git:(%f${git_branch_part}%F{#74c7ec}) %f${git_status_symbol}"
}
precmd() { fish_prompt_zsh }

### make yazi change directory
function yazi() {
    local tmp=$(mktemp -t "yazi-cwd.XXXXXX")
    /usr/bin/yazi "$@" --cwd-file="$tmp"
    if cwd=$(cat -- "$tmp") && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

