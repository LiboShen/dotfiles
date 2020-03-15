filetype off
" ================ General Config ====================
set number
set history=1000
set novisualbell  " Don't flash.
set autoread
set mouse=n  " Mouse is good in normal moed.

"turn on syntax highlighting
syntax on

let mapleader = ","
let $VIMRCDIR = fnamemodify(expand("$MYVIMRC"), ":p:h")

" ================== plugins ========================
call plug#begin('~/.vim/plugged')

" General
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'Lokaltog/vim-easymotion'
Plug 'romainl/vim-cool'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'kamykn/spelunker.vim'

" Languages
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'andys8/vim-elm-syntax'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git
" ========================================

" Appearance
" ========================================
Plug 'itchyny/lightline.vim'
" Plug 'ayu-theme/ayu-vim'
Plug 'nikitavoloboev/vim-monokai-night' " Theme
" Plug 'morhetz/gruvbox'
" Plug 'chriskempson/base16-vim'

" Textobjects
" ========================================
" These bundles introduce new textobjects into vim,
" For example the Ruby one introduces the 'r' text object
" such that 'var' gives you Visual Around Ruby

" Plug 'kana/vim-textobj-function'
" Plug 'kana/vim-textobj-user'
" Plug 'thinca/vim-textobj-function-javascript'
Plug 'wellle/targets.vim'

" Search
" ========================================
" Plug 'nelstrom/vim-visual-star-search'
Plug 'rking/ag.vim'
" Plug 'skwp/greplace.vim'

" Project
" ========================================
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'

" Enhancements
" ========================================
Plug 'mhinz/vim-signify'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'Raimondi/delimitMate'
" Plug 'Shougo/neocomplete'
" Plug 'briandoll/change-inside-surroundings.vim'
" Plug 'godlygeek/tabular'
" Plug 'vim-scripts/camelcasemotion'
" Plug 'vim-scripts/matchit.zip'
" Plug 'kristijanhusak/vim-multiple-cursors'
" Plug 'Keithbsmiley/investigate.vim'
" Plug 'chrisbra/NrrwRgn'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'bogado/file-line'
" Plug 'mattn/webapi-vim'
" Plug 'sjl/gundo.vim'
" Plug 'skwp/YankRing.vim'
" Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-unimpaired'
" Plug 'vim-scripts/AnsiEsc.vim'
" Plug 'vim-scripts/AutoTag'
" Plug 'vim-scripts/lastpos.vim'
" Plug 'vim-scripts/sudo.vim'
" Plug 'goldfeld/ctrlr.vim'
" Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/goyo.vim'
Plug 'chaoren/vim-wordmotion'

" All of your Plugins must be added before the following line
call plug#end()            " required


" ================ Spell Check ================
set nospell

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]
nnoremap P P=`]

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Theme ==================
set termguicolors
set background=dark
" let ayucolor="dark"
" let ayucolor="mirage"
" let ayucolor="light"
" colorscheme ayu
colorscheme monokai-night

" ================ Custom Settings ==================
so $VIMRCDIR/settings.vim

" -----------------------------------------------------------------------------
" Basic mappings
" -----------------------------------------------------------------------------
" Edit Vim config file in a new tab.
nnoremap <Leader>ev :tabnew $MYVIMRC<CR>

" Source Vim config file.
nnoremap <Leader>sv :source $MYVIMRC<CR>

nnoremap <leader>ea :sp ~/dotfiles/vim/settings/abbr.vim<cr>

nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>nn :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>o :FZF<cr>

noremap H ^
noremap L $
inoremap jk <esc>`^
inoremap kj <esc>
inoremap <esc> <nop>
" inoremap <c-j> <esc>
noremap <F4> :call Term_toggle()<cr>

nnoremap <leader>b :GoBuild<cr>
nnoremap <leader>r :GoRun<cr>
nnoremap <leader>t :GoTest<cr>
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>jr :YcmCompleter GoToReferences<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap <C-s> :w<CR>

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview

" -----------------------------------------------------------------------------
" coc.nvim configs
" -----------------------------------------------------------------------------

" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
nmap <leader>f  <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" -----------------------------------------------------------------------------
" Basic autocommands
" -----------------------------------------------------------------------------

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

" Unset paste on InsertLeave.
autocmd InsertLeave * silent! set nopaste

" =============== Private Initialization ===============
if filereadable(expand("~/dotfiles/private/init.vim"))
  source ~/dotfiles/private/init.vim
endif
