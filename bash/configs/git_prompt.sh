if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PROMPT_THEME=Solarized
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi
