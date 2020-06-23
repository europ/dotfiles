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
  pip
  pyenv
)
source $ZSH/oh-my-zsh.sh

#######################################################
# My stuff

prompt_context() {} # remove "user@device" from prompt

update() {
  root_commads="true \
    && apt-get update -y \
    && apt-get upgrade -y \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && snap refresh \
  "
  sudo bash -c $root_commads

  upgrade_oh_my_zsh

  git -C $ZSH pull origin master
  git -C $ZSH/custom/plugins/zsh-syntax-highlighting pull origin master

  git -C "$(rbenv root)" pull origin master
  git -C "$(rbenv root)"/plugins/ruby-build pull origin master

  git -C "$(pyenv root)" pull origin master
  git -C "$(pyenv root)"/plugins/pyenv-doctor pull origin master
  git -C "$(pyenv root)"/plugins/pyenv-virtualenv pull origin master
}

alias n="nautilus ."
alias D="cd $HOME/Documents"
alias ls="ls --almost-all --group-directories-first --color=always"

# ruby
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# keep this line as the last one
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
