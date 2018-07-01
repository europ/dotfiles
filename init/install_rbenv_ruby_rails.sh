#!/bin/zsh

if [[ ! -f ~/.zshrc ]]; then
    echo "~/.zshrc not found"
    exit 1
fi

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc

source ~/.zshrc

rbenv install -v 2.5.1
rbenv global 2.5.1

gem install bundler

rbenv rehash

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

bundle install

mry .rubocop.yml

exit 0
