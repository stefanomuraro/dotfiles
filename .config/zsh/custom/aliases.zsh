# ==============================================================================
# ALIASES
# ==============================================================================

# --- Dotfiles Management (Bare Repo) ---
alias cfg="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# --- Scripts ---
[ -f "$HOME/scripts/open-ohmd-workspace.sh" ] && alias ohmd="$HOME/scripts/open-ohmd-workspace.sh"

# --- Git ---
alias gcane="git commit --amend --no-edit"

# --- Zsh Management (Auto-reload on close) ---
alias zr="edit_zsh $ZDOTDIR/.zshrc"
alias za="edit_zsh $ZSH_CUSTOM/aliases.zsh"
alias zf="edit_zsh $ZSH_CUSTOM/functions.zsh"
alias zs="source $ZDOTDIR/.zshrc"

alias ls="eza -lh --group-directories-first --icons=auto"
alias lsa="ls -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias lta="lt -a"

alias cd="z"

# --- Misc ---
alias v="nvim"
alias t="tmux"
alias c="clear"

alias rps="iex -S mix phx.server" # run phoenix server

alias le="mix format && mix credo --strict" # lint elixir

alias kp=kill_port
alias ub=update_branch
alias cg=clean_gone

