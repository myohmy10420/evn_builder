# DEFAULT_USER=""

DEFAULT_USER="Kurt"
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.git.zsh
source ~/.asdf/asdf.sh

if [ "$TMUX" = "" ]; then
  WHOAMI=$(whoami)
  if tmux has-session -t $WHOAMI 2>/dev/null; then
    tmux -2 attach-session -t $WHOAMI
  else
    tmux -2 new-session -s $WHOAMI
  fi
fi

