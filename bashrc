if [ -f "${HOME}/.bashrc_local" ];
then
  . "${HOME}/.bashrc_local"
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
if [ ${BASH_VERSINFO[0]} == 4 ];
then
  shopt -s autocd
  shopt -s dirspell
  shopt -s globstar
  shopt -s histverify
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

for component in "aliases" "configs" "functions"; do
  for component_part in ~/.bash/$component/*; do
    source $component_part
  done
done
