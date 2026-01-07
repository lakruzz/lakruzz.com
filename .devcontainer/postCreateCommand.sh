#!/usr/bin/env bash

set -e

PREFIX="🍰  "
echo "$PREFIX Running $(basename $0)"

echo "$PREFIX Setting up safe git repository to prevent dubious ownership errors"
git config --local --add safe.directory /workspace

echo "$PREFIX Setting up git configuration to support .gitconfig in repo-root"
git config --local --get include.path | grep -e ../.gitconfig >/dev/null 2>&1 || git config --local --add include.path ../.gitconfig

.devcontainer/gh-auth.sh 
echo "$PREFIX Installing the TakT gh cli extension from devx-cafe/gh-tt "
gh extension install devx-cafe/gh-tt --pin experimental
echo "$PREFIX Installing the gh shorthand aliases"    
gh alias import .devcontainer/.gh_alias.yml --clobber

.devcontainer/gpg-auth.sh 

echo "$PREFIX Installing the Ruby gems"
bundle config set frozen true
bundle install


echo "$PREFIX SUCCESS"
exit 0