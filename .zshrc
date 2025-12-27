# ==============================================================================
# 1. ENVIRONMENT & PATHS (Conditional)
# ==============================================================================

# Core Local Binaries
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# ASDF Configuration
export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
[ -d "$ASDF_DATA_DIR" ] && export PATH="$ASDF_DATA_DIR/shims:$PATH"

# Neovim
[ -d "/opt/nvim" ] && export PATH="/opt/nvim:$PATH"

# Bun Configuration
export BUN_INSTALL="$HOME/.bun"
[ -d "$BUN_INSTALL" ] && export PATH="$BUN_INSTALL/bin:$PATH"

# .NET Configuration
[ -d "$HOME/.dotnet" ] && export DOTNET_ROOT="$HOME/.dotnet" && export PATH="$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"

# ==============================================================================
# 2. OH MY ZSH CONFIGURATION
# ==============================================================================
export ZSH="$HOME/.oh-my-zsh"

# Tell OMZ to look here for custom themes/plugins (~/.zsh/themes/neo.zsh-theme)
export ZSH_CUSTOM="$HOME/.zsh" 

ZSH_THEME="neo"
plugins=(git asdf)

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
