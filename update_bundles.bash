#!/usr/bin/env bash
#
cd ~/.vim/bundle

for d in `ls`
do
  cd $d
  git pull
  cd ..
done
