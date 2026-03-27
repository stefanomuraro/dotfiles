# enable powerlevel10k instant prompt. should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- xdg compliant zsh configuration ---

export XDG_CONFIG_HOME="$HOME/.config"
export ZSH="$XDG_CONFIG_HOME/zsh/oh-my-zsh"
export ZSH_CUSTOM="$XDG_CONFIG_HOME/zsh/custom"
export ZSH_CACHE_DIR="$XDG_CONFIG_HOME/zsh/cache"
export HISTFILE="$XDG_CONFIG_HOME/zsh/.zsh_history"

# powerlevel10k theme and config
ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f "$XDG_CONFIG_HOME/zsh/.p10k.zsh" ]] || source "$XDG_CONFIG_HOME/zsh/.p10k.zsh"

# --- tool initialization (paths & env) ---

# core local binaries
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# asdf (version manager)
export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
if [ -d "$ASDF_DATA_DIR" ]; then
  export PATH="$ASDF_DATA_DIR/shims:$PATH"
  [ -f "$ASDF_DATA_DIR/asdf.sh" ] && . "$ASDF_DATA_DIR/asdf.sh"
fi

# bun (runtime & package manager)
export BUN_INSTALL="$HOME/.bun"
if [ -d "$BUN_INSTALL" ]; then
  export PATH="$BUN_INSTALL/bin:$PATH"
  [ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
fi

# nvim (default editor)
if command -v nvim >/dev/null 2>&1; then
  export EDITOR="nvim"
  export VISUAL="nvim"
fi

# --- oh-my-zsh setup ---

plugins=(
  git
  asdf
  direnv
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# load oh-my-zsh and custom files
[ -f "$ZSH/oh-my-zsh.sh" ]         && source "$ZSH/oh-my-zsh.sh"
[ -f "$ZSH_CUSTOM/aliases.zsh" ]   && source "$ZSH_CUSTOM/aliases.zsh"
[ -f "$ZSH_CUSTOM/functions.zsh" ] && source "$ZSH_CUSTOM/functions.zsh"

# --- interactive shell enhancements ---

# fzf and zoxide
source <(fzf --zsh)
eval "$(zoxide init zsh)"

