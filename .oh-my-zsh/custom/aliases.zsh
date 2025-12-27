# Run scripts
alias ohmd="$HOME/scripts/open-ohmd-workspace.sh"
alias runohmd="$HOME/scripts/run-ohmd-elixir.sh"

# Elixir
alias lintelixir="mix format; mix credo --strict"

# Git
alias updatefork="git fetch upstream && git merge upstream/develop && git push"
alias amend="git commit --amend --no-edit"

# Dotfiles
alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# Github
alias ghpr="gh pr create --base develop && gh pr view --web"
alias ghprui="gh pr create --repo mbahealthgroup/ohmd-ui --base develop && gh repo set-default mbahealthgroup/ohmd-ui && gh pr view --web"

