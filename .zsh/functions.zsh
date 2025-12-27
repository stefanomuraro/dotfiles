# ==============================================================================
# FUNCTIONS
# ==============================================================================

# Kill a process running on a specific port
# Usage: killport 4000
killport() {
    if [[ -z "$1" ]]; then
        echo "Usage: killport <port_number>"
        return 1
    fi
    sudo lsof -t -i:"$1" | xargs -r sudo kill -9
}

# Clean up local branches that are "gone" on the remote
cleanrepo() {
    echo "Fetching and pruning..."
    git fetch --all --prune   # gfa

    # List local branches whose upstream is gone
    local gone_branches
    gone_branches=$(git branch -vv | awk '/: gone]/{print $1}')   # gbg

    if [[ -z "$gone_branches" ]]; then
        echo "✅ No branches to delete"
        return
    fi

    echo "Branches to be removed:"
    echo "$gone_branches"

    read -r "?Do you want to delete all gone branches? [Y/n]: "
    local choice=${REPLY:-Y}

    if [[ "$choice" == [Yy] ]]; then
        echo "$gone_branches" | xargs git branch -D   # gbgD
        echo "Done."
    else
        echo "Operation cancelled."
    fi
}

# Create a PR based on the current repository context
ghpr() {
    local base_branch="develop"
    local top_level=$(git rev-parse --show-toplevel 2>/dev/null)
    
    if [[ -z "$top_level" ]]; then
        echo "❌ Error: Not a git repository"
        return 1
    fi

    local current_repo=$(basename "$top_level")
    echo "Checking repository: $current_repo"

    if [[ "$current_repo" == "ohmd-ui" ]]; then
        echo "Using OhmD-UI settings..."
        gh pr create --repo mbahealthgroup/ohmd-ui --base "$base_branch" && gh pr view --web
    else
        echo "Using default repository settings..."
        gh pr create --base "$base_branch" && gh pr view --web
    fi
}
