#!/bin/bash --login

bundle update
bundle install

npm install cspell --global

git config --local --get include.path | grep -e ../.gitconfig || git config --local --add include.path ../.gitconfig