#!/bin/sh


# Copy .dotfiles to $HOME
cp dotfiles/.* ~/


# Default python will be 3.6
sudo update-alternatives  --set python /usr/bin/python3.6


# Git
# https://launchpad.net/~git-core/+archive/ubuntu/ppa
sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install --yes git


# Sublime Text 3
# https://www.sublimetext.com/docs/3/linux_repositories.html
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install --yes sublime-text


# Oh My Zsh
# https://dev.to/mskian/install-z-shell-oh-my-zsh-on-ubuntu-1804-lts-4cm4
sudo apt-get install --yes zsh powerline fonts-powerline
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
#cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting"
#echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"
chsh -s /bin/zsh


# APT packages
sudo apt-get install --yes \
    nmon \
    htop \
    tree \
    vim \
    vim-gnome \
    tig


# Install rbenv and ruby 2.6.3
# https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04
sudo apt-get install --yes autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
source ~/.zshrc
rbenv install 2.6.3
rbenv global 2.6.3
gem install \
	bundler \
	rails \
	pp \
	awesome_print \
	pry \
	pry-byebug
