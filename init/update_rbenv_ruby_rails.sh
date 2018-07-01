#!/bin/zsh

git -C `rbenv root` pull
git -C `rbenv root`/plugins/ruby-build pull

gem update

exit 0
