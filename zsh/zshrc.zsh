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

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh-history-substring-search key binding
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
