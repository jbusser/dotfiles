if [ -f "${HOME}/.bashrc_local" ];
then
  . "${HOME}/.bashrc_local"
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix;
then
  if [ -f /usr/share/bash-completion/bash_completion ];
  then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ];
  then
    . /etc/bash_completion
  elif [ -f $(brew --prefix)/etc/bash_completion ];
  then
    . $(brew --prefix)/etc/bash_completion
    __git_complete g __git_main
  fi
fi

for function in ~/.bash/functions/*; do
  source $function
done

for config in ~/.bash/configs/*; do
  . $config
done
