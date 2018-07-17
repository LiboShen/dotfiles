export EDITOR="nvim"
export DOTFILES="$HOME/dotfiles"

# Fast interation
alias sz='source ~/.zshrc'
alias ez='$EDITOR ~/.zshrc'
alias ea='$EDITOR $DOTFILES/zsh/aliases.zsh'

# Load zsh plugins
source ~/.zsh_plugins.sh

# History
HISTFILESIZE=8000
HISTSIZE=80000
HISTFILE=~/.zsh_history
SAVEHIST=8000
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Load aliases
source "$DOTFILES/zsh/aliases.zsh"

# Basic PATH
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

# TypeScript Settings
NODE_PATH=$NODE_PATH:$HOME/node_modules

if [ -f "$DOTFILES/private/zshrc.zsh" ]; then
  source "$DOTFILES/private/zshrc.zsh"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

typeset -U PATH # Remove duplicates in $PATH
