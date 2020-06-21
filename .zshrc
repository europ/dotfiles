[[ $TERM != "screen" ]] && exec tmux # load TMUX

export ZSH="$HOME/.oh-my-zsh"

#######################################################
# ZSH variables

ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
HIST_STAMPS="dd.mm.yyyy"
HISTFILE=~/.zsh_history
HISTSIZE=9999999999999999
SAVEHIST=$HISTSIZE
plugins=(
  ansible
  bundler
  colored-man-pages
  git
  rails
  rbenv
  sublime
  sudo
  tig
)
source $ZSH/oh-my-zsh.sh

#######################################################
# My stuff

prompt_context() {} # remove "user@device" from prompt

update() {
  root_commads="true\
    && apt-get update -y \
    && apt-get upgrade -y \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
  "
  sudo bash -c $root_commads

  upgrade_oh_my_zsh

  git -C $ZSH pull origin master
  git -C $ZSH/custom/plugins/zsh-syntax-highlighting pull origin master
}

alias n="nautilus ."
alias D="cd $HOME/Documents"
alias ls="ls --almost-all --group-directories-first --color=always"
