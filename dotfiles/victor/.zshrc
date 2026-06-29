# zmodload zsh/zprof

# History
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS

# Zinit bootstrap
source ~/.local/share/zinit/zinit.zsh

# Completions plugin (before compinit)
# zinit ice blockf
# zinit light zsh-users/zsh-completions

# Initialize completion system
# zmodload zsh/complist
# autoload -Uz compinit
# compinit -C -d ~/.cache/zsh/zcompdump

# zstyle (safe anywhere, but keep near compinit for readability)
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' squeeze-slashes true
# zstyle ':completion:*' use-cache yes
# zstyle ':completion:*' cache-path ~/.cache/zsh

# Plugins
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid wait'0'
zinit light Aloxaf/fzf-tab

# HSS must come after syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# menuselect bindings
# bindkey '^I' end-of-line
# bindkey '^I' expand-or-complete
# bindkey '^I' autosuggest-accept
# bindkey '^F' expand-or-complete
# bindkey -M menuselect '^j' down-line-or-select
# bindkey -M menuselect '^k' up-line-or-select

# Evals
eval "$(atuin init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Aliases
alias cd='z'
alias cat='bat'
alias grep='rg'
alias find='fd'
alias ls='eza --icons'

# [[ -n "$TERM" ]] && fastfetch

# zprof
