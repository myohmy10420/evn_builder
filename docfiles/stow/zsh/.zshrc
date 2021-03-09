# DEFAULT_USER=""

DEFAULT_USER="Kurt"
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.git.zsh
source ~/.asdf/asdf.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

tt() {
  if ! tmux has-session -t work 2> /dev/null; then
    tmux new -s $(whoami) -d;
  fi
  tmux attach -t $(whoami);
}
