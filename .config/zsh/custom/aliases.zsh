# ==============================================================================
# ALIASES
# ==============================================================================

# dotfiles bare repo
alias cfg="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# scripts
[ -f "$HOME/scripts/open-ohmd-workspace.sh" ] && alias ohmd="$HOME/scripts/open-ohmd-workspace.sh"

# git
alias gcane="git commit --amend --no-edit"
alias gcm="git commit -m"
alias gsou="git stash --keep-index -u" # only unstaged (incl untracked)
alias gsos="git stash --staged" # only staged
alias gsa="git stash -u" # all (staged + unstaged + untracked)

# zsh
alias zr="edit_zsh $ZDOTDIR/.zshrc"
alias za="edit_zsh $ZSH_CUSTOM/aliases.zsh"
alias zf="edit_zsh $ZSH_CUSTOM/functions.zsh"
alias zs="source $ZDOTDIR/.zshrc"

# overrides
alias ls="eza -lh --group-directories-first --icons=auto"
alias lsa="ls -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias lta="lt -a"
alias cd="z"
alias grep="rg"
alias find="fd"

# shortcuts
alias v="nvim"
alias t="tmux"
alias c="clear"

# elixir
alias rps="iex -S mix phx.server" # run phoenix server
alias le="mix format && mix credo --strict" # lint elixir

# utils
alias kp=kill_port
alias ub=update_branch
alias cg=clean_gone

