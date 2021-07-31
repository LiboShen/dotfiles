ln -s ~/dotfiles/doom  ~/.doom
if ! test -f ~/.config; then
  mkdir ~/.config
fi
ln -s ~/dotfiles/vim ~/.config/nvim
ln -s ~/dotfiles/zsh/zshrc.zsh ~/.zshrc
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/dotfiles/git/gitignore_global ~/.gitignore_global

brew install antibody
