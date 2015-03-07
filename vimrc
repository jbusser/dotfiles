runtime bundle/vim-pathogen/autoload/pathogen.vim
" Bundle: tpope/vim-pathogen
" Bundle: 'ctrlpvim/ctrlp.vim'
" Bundle: 'rizzatti/dash.vim'
" Bundle: 'tpope/vim-bundler'
" Bundle: 'kchmck/vim-coffee-script'
" Bundle: 'altercation/vim-colors-solarized'
" Bundle: 'heartsentwined/vim-emblem'
" Bundle: 'tpope/vim-commentary'
" Bundle: 'tpope/vim-endwise'
" Bundle: 'tpope/vim-eunuch'
" Bundle: 'tpope/vim-fugitive'
" Bundle: 'tpope/vim-rails'
" Bundle: 'tpope/vim-rake'
" Bundle: 'thoughtbot/vim-rspec'
" Bundle: 'vim-ruby/vim-ruby'
" Bundle: 'slim-template/vim-slim'
" Bundle: 'tpope/vim-surround'
" call pathogen#infect()
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

set textwidth=90

" Include Git branch and revision on status line courtesy of
" Fugitive.vim
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%y%=%-14.(%l,%c%V%)\ %P

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

let g:rspec_command='!rspec {spec}'
let coffee_lint_options='-f config/coffeelint.json'

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

" refactoring
" replace hashrockets with 1.9 hash style syntax
nnoremap <Leader>: :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<CR>
