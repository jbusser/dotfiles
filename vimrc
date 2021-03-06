runtime bundle/vim-pathogen/autoload/pathogen.vim
" Bundle: 'altercation/vim-colors-solarized'
" Bundle: 'vim-airline/vim-airline'
" Bundle: 'vim-airline/vim-airline-themes'
" Bundle: 'ctrlpvim/ctrlp.vim'
" Bundle: 'elzr/vim-json'
" Bundle: 'guns/vim-sexp'
" Bundle: 'kchmck/vim-coffee-script'
" Bundle: 'kxcrl/vim-emblem'
" Bundle: 'rizzatti/dash.vim'
" Bundle: 'slim-template/vim-slim'
" Bundle: 'thoughtbot/vim-rspec'
" Bundle: 'tpope/vim-bundler'
" Bundle: 'tpope/vim-commentary'
" Bundle: 'tpope/vim-endwise'
" Bundle: 'tpope/vim-eunuch'
" Bundle: 'tpope/vim-fireplace'
" Bundle: 'tpope/vim-fugitive'
" Bundle: 'tpope/vim-pathogen'
" Bundle: 'tpope/vim-rails'
" Bundle: 'tpope/vim-rake'
" Bundle: 'tpope/vim-repeat'
" Bundle: 'tpope/vim-sexp-mappings-for-regular-people'
" Bundle: 'tpope/vim-surround'
" Bundle: 'tpope/vim-unimpaired'
" Bundle: 'vim-ruby/vim-ruby'
execute pathogen#infect()
execute pathogen#helptags()
" enhances % matcher to include ruby keywords
runtime macros/matchit.vim
set nocompatible
set nobackup

"syntax on
filetype on
filetype indent on
filetype plugin indent on
filetype plugin on
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab
set relativenumber
set number
set smarttab

" Set incremental search
set incsearch
" Highlight search terms
set hlsearch

" Open new split panes to right and bottom
set splitbelow
set splitright

set textwidth=80
set colorcolumn=+1

" Include Git branch and revision on status line courtesy of
" Fugitive.vim
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%y%=%-14.(%l,%c%V%)\ %P

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
syntax enable
set background=dark
let g:solarized_hitrail=1
let g:solarized_italic=1

if has('gui_running') && $TERM_PROGRAM == 'Apple_Terminal'
  let g:solarized_termcolors=&t_Co
  let g:solarized_termtrans=1
endif

colorscheme solarized

let ruby_operators = 1

let g:sql_type_default = 'postgresql'

let g:rspec_command='!rspec {spec}'
let coffee_lint_options='-f .coffeelint.json'

let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

ab dbg debugger

" ------------------------------------------------------------------
"  Undo
" ------------------------------------------------------------------
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

" refactoring
" replace hashrockets with 1.9 hash style syntax
nnoremap <Leader>: :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<CR>
