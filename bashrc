if [ -f "${HOME}/.bashrc_local" ];
then
  . "${HOME}/.bashrc_local"
fi

# include staged/unstaged status in PS1
GIT_PS1_SHOWDIRTYSTATE=1

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias gco='git co'
alias gci='git ci'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias gs='git status'
alias gm='git merge'
alias gp='git push'

alias rk='bin/rake'

alias reportdb='heroku pg:psql HEROKU_POSTGRESQL_AQUA --app thinkcerca'

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
  fi
fi
