" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/dotfiles/vim/Vundle
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Languages
" ========================================
Bundle "leafgarland/typescript-vim"

" Git
" ========================================

" Appearance
" ========================================
Bundle "itchyny/lightline.vim"
Bundle "ayu-theme/ayu-vim"
" Bundle "morhetz/gruvbox"
" Bundle "chriskempson/base16-vim"

" Textobjects
" ========================================
" These bundles introduce new textobjects into vim,
" For example the Ruby one introduces the 'r' text object
" such that 'var' gives you Visual Around Ruby

Bundle "kana/vim-textobj-function"
Bundle "kana/vim-textobj-user"
Bundle "thinca/vim-textobj-function-javascript"
Bundle "wellle/targets.vim"

" Search
" ========================================
" Bundle "nelstrom/vim-visual-star-search"
" Bundle "skwp/greplace.vim"
Bundle "junegunn/fzf"
Bundle "Lokaltog/vim-easymotion"
Bundle "romainl/vim-cool"

" Project
" ========================================
Bundle "scrooloose/nerdtree.git"
"Bundle "xolox/vim-misc"
"Bundle "xolox/vim-session"

" Enhancements
" ========================================
Bundle "mhinz/vim-signify"
" Bundle "AndrewRadev/splitjoin.vim"
" Bundle "Raimondi/delimitMate"
" Bundle "Shougo/neocomplete.git"
" Bundle "briandoll/change-inside-surroundings.vim.git"
" Bundle "godlygeek/tabular"
Bundle "tomtom/tcomment_vim.git"
" Bundle "vim-scripts/camelcasemotion.git"
" Bundle "vim-scripts/matchit.zip.git"
" Bundle "kristijanhusak/vim-multiple-cursors"
" Bundle "Keithbsmiley/investigate.vim"
" Bundle "chrisbra/NrrwRgn"
" Bundle "christoomey/vim-tmux-navigator"
" Bundle "MarcWeber/vim-addon-mw-utils.git"
" Bundle "bogado/file-line.git"
" Bundle "mattn/webapi-vim.git"
" Bundle "sjl/gundo.vim"
" Bundle "skwp/YankRing.vim"
" Bundle "tomtom/tlib_vim.git"
Bundle "tpope/vim-abolish"
" Bundle "tpope/vim-endwise.git"
" Bundle "tpope/vim-ragtag"
Bundle "tpope/vim-repeat.git"
Bundle "tpope/vim-surround.git"
" Bundle "tpope/vim-unimpaired"
" Bundle "vim-scripts/AnsiEsc.vim.git"
" Bundle "vim-scripts/AutoTag.git"
" Bundle "vim-scripts/lastpos.vim"
" Bundle "vim-scripts/sudo.vim"
" Bundle "goldfeld/ctrlr.vim"
" Bundle "editorconfig/editorconfig-vim"
Bundle "junegunn/goyo.vim"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
