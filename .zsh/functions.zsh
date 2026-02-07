# ==============================================================================
# FUNCTIONS
# ==============================================================================

# Internal helper to edit and auto-source zsh files
edit_zsh() {
    if nvim "$1"; then
        source ~/.zshrc
        echo "Successfully reloaded: $(basename "$1")"
    else
        echo "Editor exited with an error. Config not reloaded."
    fi
}

# Kill a process running on a specific port
# Usage: kill_port 4000
kill_port() {
    if [[ -z "$1" ]]; then
        echo "Usage: kill_port <port_number>"
        return 1
    fi
    
    local pid=$(sudo lsof -t -i:"$1")
    
    if [[ -n "$pid" ]]; then
        echo "Killing process $pid on port $1..."
        echo "$pid" | xargs -I {} sudo kill -9 {}
    else
        echo "No process found on port $1"
    fi
}

# Clean up local branches that are "gone" on the remote
clean_branches() {
    echo "Fetching latest refs and pruning deleted branches..."
    git fetch --all --prune 
    echo

    local gone_branches
    gone_branches=$(git branch -vv | awk '/: gone]/{print $1}')

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
    
    if [[ "$choice" == [Yy] ]]; then
        echo "Deleting branches..."
        echo "$gone_branches" | xargs git branch -D
        echo "\nCleanup complete."
    else
        echo "Cleanup cancelled."
    fi
}

# Update current branch from upstream (or origin) develop with fork support
update_branch() {
    echo "Fetching all..."
    git fetch --all --prune 
    echo

    local target_remote="origin"
    if git remote | grep -q "^upstream$"; then
        target_remote="upstream"
    fi

    echo "Attempting to merge ${target_remote}/develop..."
    
    if git merge "${target_remote}/develop"; then
        echo "\nMerge successful. Updating your fork (origin)..."
        git push origin HEAD
    else
        echo "\n[!] Merge conflicts detected. Resolve them manually."
        echo "[!] Push aborted to prevent breaking remote."
        return 1
    fi
}

# Create a GitHub PR. Detects if it's a fork and targets upstream accordingly.
# Usage: gh_pr [base_branch_name] (defaults to develop)
gh_pr() {
    local base_branch="${1:-develop}"
    
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Error: Not a git repository"
        return 1
    fi

    local current_branch=$(git rev-parse --abbrev-ref HEAD)
    local upstream_remote=$(git remote | grep "^upstream$")
    local origin_url=$(git remote get-url origin 2>/dev/null)
    
    # Extract username from origin URL (works for SSH and HTTPS)
    local username=$(echo "$origin_url" | sed -E 's/.*[:\/](.*)\/.*/\1/')

    

    if [[ -n "$upstream_remote" ]]; then
        local upstream_url=$(git remote get-url upstream)
        echo "Fork detected. PR: [$username:$current_branch] -> [upstream/$base_branch]"
        gh pr create --repo "$upstream_url" \
                     --base "$base_branch" \
                     --head "$username:$current_branch" \
                     --fill && gh pr view --web
    else
        echo "Standard repo detected. PR: [origin/$current_branch] -> [origin/$base_branch]"
        gh pr create --base "$base_branch" --fill && gh pr view --web
    fi
}

# Run Elixir style checks: mix format and credo --strict
lint_elixir() {
    if [[ -f "mix.exs" ]]; then
        echo "Running Elixir linting (Format + Credo)..."
        mix format && mix credo --strict
    else
        echo "Not an Elixir project."
    fi
}
