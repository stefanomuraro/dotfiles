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
alias zr="edit_zsh ~/.zshrc"
alias za="edit_zsh ~/.zsh/aliases.zsh"
alias zf="edit_zsh ~/.zsh/functions.zsh"
alias zs="source ~/.zshrc"

# --- Other Shortcuts ---
alias v="nvim"

alias run_phx_server="iex -S mix phx.server"
alias rps=run_phx_server

alias lint_elixir="mix format && mix credo --strict"
alias le=lint_elixir

alias kp=kill_port
alias ub=update_branch
alias cg=clean_gone

