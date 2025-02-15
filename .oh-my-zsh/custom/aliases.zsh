# Run scripts
alias ohmd="$HOME/scripts/open-ohmd-workspace.sh"
alias runohmd="$HOME/scripts/run-ohmd-elixir.sh"

# Elixir
alias lintelixir="mix format; mix credo --strict"

# Git
alias updatefork="git fetch upstream && git merge upstream/develop && git push"
alias amend="git commit --amend --no-edit"

# Dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
