set nocompatible
execute pathogen#infect()
execute pathogen#helptags()
" enhances % matcher to include ruby keywords
runtime macros/matchit.vim
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
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
let g:solarized_hitrail=1    "default value is 0
syntax enable
set background=dark
colorscheme solarized

if !has('gui_running') && $TERM_PROGRAM == 'Apple_Terminal'
  let g:solarized_termcolors = &t_Co
  let g:solarized_termtrans = 1
  colorscheme solarized
endif

let g:rspec_command='bin/rspec {spec}'
let coffee_lint_options='-f config/coffeelint.json'

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

" refactoring
" replace hashrockets with 1.9 hash style syntax
nnoremap <Leader>: :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<CR>
