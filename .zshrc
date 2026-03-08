# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==============================================================================
# 1. ENVIRONMENT & PATHS
# ==============================================================================

# Core Local Binaries
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# ASDF Configuration
export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
[ -d "$ASDF_DATA_DIR" ] && export PATH="$ASDF_DATA_DIR/shims:$PATH"

# Neovim
if command -v nvim >/dev/null 2>&1; then
  export EDITOR="nvim"
  export VISUAL="nvim"
fi

# Bun Configuration
export BUN_INSTALL="$HOME/.bun"
[ -d "$BUN_INSTALL" ] && export PATH="$BUN_INSTALL/bin:$PATH"

# ==============================================================================
# 2. OH MY ZSH CONFIGURATION
# ==============================================================================
export ZSH="$HOME/.oh-my-zsh"

# Tell OMZ to look here for custom themes/plugins (~/.zsh/themes/neo.zsh-theme)
export ZSH_CUSTOM="$HOME/.zsh" 

ZSH_THEME="powerlevel10k/powerlevel10k"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

plugins=(
    git
    asdf
    direnv
    zsh-autosuggestions
    zsh-syntax-highlighting
    vi-mode
)

# Load Oh My Zsh
[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# ==============================================================================
# 3. TOOL INITIALIZATION & CUSTOM LOGIC
# ==============================================================================

# ASDF initialization (Enables 'asdf' command and completions)
[ -f "$ASDF_DATA_DIR/asdf.sh" ] && . "$ASDF_DATA_DIR/asdf.sh"

# Bun completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# Load Custom Aliases and Functions
[ -f "$ZSH_CUSTOM/aliases.zsh" ] && source "$ZSH_CUSTOM/aliases.zsh"
[ -f "$ZSH_CUSTOM/functions.zsh" ] && source "$ZSH_CUSTOM/functions.zsh"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

eval "$(zoxide init zsh)"

