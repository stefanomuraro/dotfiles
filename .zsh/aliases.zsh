# ==============================================================================
# ALIASES
# ==============================================================================

# --- Development Workflow ---
alias v="nvim"

# Only run lint if mix.exs exists to avoid errors in non-elixir folders
alias lintelixir='[ -f "mix.exs" ] && mix format && mix credo --strict || echo "Not an Elixir project"'

# --- Ohmd Scripts ---
# Changed -d to -f to check for the specific script files
[ -f "$HOME/scripts/open-ohmd-workspace.sh" ] && alias ohmd="$HOME/scripts/open-ohmd-workspace.sh"
[ -f "$HOME/scripts/run-ohmd-elixir.sh" ] && alias runohmd="$HOME/scripts/run-ohmd-elixir.sh"

# --- Git ---
alias updatefork="git fetch upstream && git merge upstream/develop && git push"
alias amend="git commit --amend --no-edit"

# --- Dotfiles Management (Bare Repo) ---
alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias zshcfg="nvim ~/.zshrc"
alias aliascfg="nvim ~/.zsh/aliases.zsh"
alias funccfg="nvim ~/.zsh/functions.zsh"
alias sourcezsh="source ~/.zshrc"
