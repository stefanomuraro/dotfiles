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
    echo "Fetching latest refs and pruning deleted branches..."
    git fetch --all --prune   # gfa
    echo

    # List local branches whose upstream is gone
    local gone_branches
    gone_branches=$(git branch -vv | awk '/: gone]/{print $1}')   # gbg

    if [[ -z "$gone_branches" ]]; then
        echo "No branches to clean. Everything is up to date."
        return
    fi

    echo "The following branches no longer exist upstream:"
    echo "-----------------------------------------------"
    echo "$gone_branches"
    echo "-----------------------------------------------"
    echo

    read -r "?Delete ALL of these branches? [Y/n]: "
    local choice=${REPLY:-Y}
    echo

    if [[ "$choice" == [Yy] ]]; then
        echo "Deleting branches..."
        echo "$gone_branches" | xargs git branch -D   # gbgD
        echo
        echo "Cleanup complete."
    else
        echo "Cleanup cancelled. No branches were deleted."
    fi
}

# Create a PR based on the current repository context
ghpr() {
    local base_branch="develop"
    local top_level=$(git rev-parse --show-toplevel 2>/dev/null)
    
    if [[ -z "$top_level" ]]; then
        echo "Error: Not a git repository"
        return 1
    fi

    local current_repo=$(basename "$top_level")
    echo "Checking repository: $current_repo"
    echo

    if [[ "$current_repo" == "ohmd-ui" ]]; then
        gh pr create --repo mbahealthgroup/ohmd-ui --base "$base_branch" && gh pr view --web
    else
        gh pr create --base "$base_branch" && gh pr view --web
    fi
}
