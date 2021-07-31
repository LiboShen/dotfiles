export EDITOR="nvim"
export DOTFILES="$HOME/dotfiles"

# Fast interation
alias sz='source ~/.zshrc'
alias ez='$EDITOR ~/.zshrc'
alias ea='$EDITOR $DOTFILES/zsh/aliases.zsh'

# Load zsh plugins
source ~/.zsh_plugins.sh

# vim mode keybinding
bindkey -v
export KEYTIMEOUT=15 # Reduce the lag
bindkey '^P' up-history
bindkey '^N' down-history
bindkey -M vicmd -s 'L' '$'
bindkey -M vicmd -s 'H' '0'
bindkey jk vi-cmd-mode # switch normal mode, like the vim setting.

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
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.emacs.d/bin
eval $(opam env)

# TypeScript Settings
NODE_PATH=$NODE_PATH:$HOME/node_modules

if [ -f "$DOTFILES/private/zshrc.zsh" ]; then
  source "$DOTFILES/private/zshrc.zsh"
fi

export GOPATH=$HOME/go
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin

# Elixir/Erlang REPL history.
export ERL_AFLAGS="-kernel shell_history enabled"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

typeset -U PATH # Remove duplicates in $PATH

fpath=("$DOTFILES/zsh" "${fpath[@]}")

autoload -Uz kp ks ll
eval "$(/opt/homebrew/bin/brew shellenv)"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh) # add autocomplete permanently to your zsh shell

