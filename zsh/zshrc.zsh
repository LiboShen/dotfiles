export EDITOR="nvim"
export DOTFILES="$HOME/dotfiles"

# Fast interation
alias sz='source ~/.zshrc'
alias ez='$EDITOR ~/.zshrc'
alias ea='$EDITOR ~/dotfile/zsh/aliases.zsh'

# Load zsh plugins
source ~/.zsh_plugins.sh

# History
HISTFILESIZE=8000
HISTSIZE=80000
HISTFILE=~/.zsh_history
SAVEHIST=8000
setopt  appendhistory
setopt sharehistory
setopt incappendhistory

# Load aliases
source "$DOTFILES/zsh/aliases.zsh"
