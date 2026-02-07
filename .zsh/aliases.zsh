# ==============================================================================
# ALIASES
# ==============================================================================

# --- Ohmd Scripts ---
[ -f "$HOME/scripts/open-ohmd-workspace.sh" ] && alias ohmd="$HOME/scripts/open-ohmd-workspace.sh"
[ -f "$HOME/scripts/run-ohmd-elixir.sh" ] && alias runohmd="$HOME/scripts/run-ohmd-elixir.sh"

# --- Git ---
alias gcane="git commit --amend --no-edit"

# --- Dotfiles Management (Bare Repo) ---
alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# --- Zsh Management (Auto-reload on close) ---
alias zr="edit_zsh ~/.zshrc"
alias za="edit_zsh ~/.zsh/aliases.zsh"
alias zf="edit_zsh ~/.zsh/functions.zsh"

# --- Shortcuts ---
alias v="nvim"

# --- Custom Function Mappings ---
alias le=lint_elixir
alias kp=kill_port
alias ub=update_branch
alias cb=clean_branches
