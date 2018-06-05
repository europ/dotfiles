#!/bin/zsh

git -C `rbenv root` pull
git -C `rbenv root`/plugins/ruby-build pull

gem update rails awesome_print bundler gem-path pry pry-byebug

exit 0
