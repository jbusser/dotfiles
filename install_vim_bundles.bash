#!/usr/bin/env bash
#
if [ ! -d ~/.vim/autoload ];
then
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

bundles=('ctrlp.vim' 'vim-coffee-script' 'vim-endwise' 'vim-rails' 'vim-ruby'
'dash.vim' 'vim-colors-solarized' 'vim-eunuch' 'vim-rake' 'vim-slim' 'vim-bundler'
'vim-emblem' 'vim-fugitive' 'vim-rspec' 'vim-surround')

repos=('kien/ctrlp.vim' 'kchmck/vim-coffee-script' 'tpope/vim-endwise'
'tpope/vim-rails' 'vim-ruby/vim-ruby' '' 'altercation/vim-colors-solarized'
'tpope/vim-eunuch' 'tpope/vim-rake' 'slim-template/vim-slim' 'tpope/vim-bundler'
'heartsentwined/vim-emblem' 'tpope/vim-fugitive' 'tpope/vim-rspec'
'tpope/vim-surround')

cd ~/.vim/bundle

bundles_total=${#bundles[*]}

for ((i=0; i <= $(($bundles_total - 1)); i++))
do
  if [ ! -d ${bundles[$i]} ];
  then
    echo "Installing ${bundles[$i]}"
    echo "Using repo ${repos[$i]}"
    git clone "https://github.com/${repos[$i]}.git"
  fi
done
