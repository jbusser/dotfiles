if [ -d /usr/local/heroku ];
then
  PATH="/usr/local/heroku/bin:${PATH}"
fi

export MANPATH="${MANPATH}:/usr/local/man"

if [ -f "${HOME}/.bashrc" ];
then
  . "${HOME}/.bashrc"
fi

if [ -d "$HOME/bin" ];
then
  PATH="${HOME}/bin:${PATH}"
fi

#
# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
