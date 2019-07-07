#!/bin/sh


# exit immediately if a simple command exits with a nonzero exit value
set -e


# Print bold yellow message (empty-line,message-line,empty-line)
notify(){echo -e "\n\033[1;33m${1}\033[0m\n"}


# update and upgrade
notify "updating and upgrading ..."
sudo apt update -y
sudo apt upgrade -y


# APT packages
notify "Installing custom apt packages ..."
APT_PACKAGES=(
	htop
	vim
	tig
	tree
	net-tools # ifconfig, see https://askubuntu.com/questions/1031640/ifconfig-missing-after-ubuntu-18-04-install
	traceroute
)
sudo apt-get install -y ${APT_PACKAGES}


# Git
# https://launchpad.net/~git-core/+archive/ubuntu/ppa
notify "Installing Git ..."
sudo apt-add-repository ppa:git-core/ppa -y
sudo apt-get update -y
sudo apt-get install -y git


# Sublime Text 3
# https://www.sublimetext.com/docs/3/linux_repositories.html
notify "Installing Sublime Text 3 ..."
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update -y
sudo apt-get install -y sublime-text


# Docker
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
notify "Installing Docker ..."
sudo apt update -y
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" -y
sudo apt update -y
sudo apt install -y docker-ce
sudo usermod -a -G docker ${USER}


# VirtualBox 6.0
# https://tecadmin.net/install-virtualbox-on-ubuntu-18-04/
# TODO: https://askubuntu.com/questions/1029198/skipping-acquire-of-configured-file-contrib-binary-i386-packages-as-repository
notify "Installing VirtualBox 6.0 ..."
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib" -y
sudo apt update -y
sudo apt install -y virtualbox-6.0


# ClamAV (antivirus)
# https://www.clamav.net/
notify "Installing ClamAV ..."
sudo apt-get install -y clamav clamav-daemon clamtk
sudo service clamav-daemon start
sudo service clamav-freshclam start


# Oh My Zsh
# https://dev.to/mskian/install-z-shell-oh-my-zsh-on-ubuntu-1804-lts-4cm4
notify "Installing Oh My Zsh ..."
sudo apt-get install -y zsh powerline fonts-powerline
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting"
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"
# TODO: solve the password promt
chsh -s /bin/zsh


# Install rbenv and ruby 2.6.3
# https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04
# rbenv
notify "Installing rbenv ..."
sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev  \
						libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev \
						libgdbm5 libgdbm-dev
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
# ruby
notify "Installing Ruby 2.6.3 ..."
rbenv install 2.6.3
rbenv global 2.6.3
gem install --no-document \
	bundler \
	rails \
	pp \
	awesome_print \
	pry \
	pry-byebug


# Copy .dotfiles to $HOME
notify "Copying .dotfiles ..."
find dotfiles -type f -exec cp -v {} $HOME \;


# Cleaning apt
notify "Cleaning apt ..."
sudo apt-get autoremove -y
sudo apt-get autoclean -y


# The end
notify "... finished."
exit 0
