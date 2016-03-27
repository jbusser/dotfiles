if [ -f "${HOME}/.bashrc_local" ];
then
  . "${HOME}/.bashrc_local"
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rk='bin/rake'
alias reportdb='heroku pg:psql HEROKU_POSTGRESQL_TEAL --app thinkcerca'
alias rebinstub='bundle exec rake rails:update:bin && bundle exec spring binstub --all'
alias v='vim'

for config in ~/.bash/configs/*; do
  . $config
done

for function in ~/.bash/functions/*; do
  source $function
done
