#!/usr/bin/env bash

PREFIX="🔑  "

echo "$PREFIX  Checking for GPG key to import"

if [ -n "$_GPG_KEY" ]; then
  set -e #Fail on error
  
  echo "$PREFIX  Initializing GPG environment"
  # Kill any existing gpg-agents
  gpgconf --kill gpg-agent 2>/dev/null || true
  sleep 1
  
  # Clean up potentially corrupted gnupg config and start fresh
  rm -rf ~/.gnupg
  mkdir -p ~/.gnupg
  chmod 700 ~/.gnupg
  
  # Handle keys with pass phrases, so they prompt for passphrase on first use and store it for 2 hours
  echo "pinentry-mode loopback"  >> ~/.gnupg/gpg.conf
  echo "allow-loopback-pinentry" >> ~/.gnupg/gpg-agent.conf
  echo "default-cache-ttl 7200"  >> ~/.gnupg/gpg-agent.conf
  echo "nmax-cache-ttl 7200"     >> ~/.gnupg/gpg-agent.conf

  
  # Start gpg-agent
  eval $(gpg-agent --daemon --quiet 2>/dev/null || echo "")
  sleep 1
  
  echo "$PREFIX  Found \$_GPG_KEY - decoding with base64 and importing into gpg keyring"
  if [ -n "$_GPG_PASSPHRASE" ]; then
    echo "$PREFIX  Using provided passphrase for key import"
    echo $_GPG_KEY | base64 -d | gpg --batch --pinentry-mode loopback --passphrase "$_GPG_PASSPHRASE" --import --quiet 2>/dev/null || \
    echo $_GPG_KEY | base64 -d | gpg --batch --import --quiet
  else
    echo $_GPG_KEY | base64 -d | gpg --batch --pinentry-mode loopback --import --quiet
  fi

  echo "$PREFIX  Getting the KEY_ID"
  KEY_ID=$(gpg --list-secret-keys --keyid-format=long | awk '/^sec/{print $2}' | cut -d'/' -f2)

  echo "$PREFIX  Configuring git to use GPG key $KEY_ID for signing commits"
  git config --local user.signingkey $KEY_ID
  git config --local commit.gpgSign true
  git config --local gpg.program gpg
  
  echo "$PREFIX  Setting key trust to ultimate"
  echo -e "trust\n5\ny" | gpg --batch --command-fd 0 --edit-key $KEY_ID >/dev/null 2>&1 || true     
  echo -e "default-cache-ttl 3600\nmax-cache-ttl 7200" >> ~/.gnupg/gpg-agent.conf
  echo "$PREFIX ✅ GPG setup complete"
else
  echo "$PREFIX  No \$_GPG_key defined - skipping GPG key import"
fi
exit 0


