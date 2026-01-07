#!/usr/bin/env bash

PREFIX="🐙  "

if [ -n "$GH_TOKEN" ]; then
  echo "$PREFIX  \$GH_TOKEN defined. It takes precedens over \$GITHUB_TOKEN and /home/vscode/.config/gh/hosts.yml"
elif [ -n "$_GH_TOKEN" ]; then
  echo "$PREFIX  \$_GH_TOKEN defined - decoding with base64 and storing it in /home/vscode/.config/gh/hosts.yml, can be overridden by \$GITHUB_TOKEN or \$GH_TOKEN."
  echo $_GH_TOKEN | base64 --decode | gh auth login --with-token
else
  if [[ "$CODESPACES" == "true" ]]; then
      echo "$PREFIX No \$GH_TOKEN or \$_GH_TOKEN defined - using the standard ghu_*** token injected by the codespace into \$GITHUB_TOKEN"
      echo "$PREFIX ⚠️ The TakT GitHub CLI extension may need write access to projects. If that is tha case:"
      echo "$PREFIX    1) Run 'unset GITHUB_TOKEN && gh auth login -s project -h github.com -p https' to login with OAuth and sufficient permissions"
      echo "$PREFIX    2) Grab the token with 'gh auth token' and store it as a secret named GH_TOKEN in https://github.com/settings/codespaces"
      echo "$PREFIX    3) Rebuild the codespace"
  else
      echo "$PREFIX ⚠️ No \$GH_TOKEN or \$_GH_TOKEN defined - skipping GitHub CLI login."
      echo "$PREFIX    1) Run 'gh auth login -s project -h github.com -p https' to login with OAuth and sufficient permissions"
      echo "$PREFIX    2) Grab the token with 'gh auth token' and make sure your ~/.profile or ~/.zprofile defines it raw as \$GH_TOKEN:"
      echo "$PREFIX.      or base64 encoded as \$_GH_TOKEN:"
      echo "$PREFIX         export GH_TOKEN=gho_********************" # replace with your token, the next option is better
      echo "$PREFIX       Or even better
      echo "$PREFIX         echo -e "\nexport _GH_TOKEN=$(gh auth token | base64)" >> ~/.zprofile # or ~/.profile"
      echo "$PREFIX    3) Rebuild the devcontainer"      
  fi
fi

set +e
gh auth status >/dev/null 2>&1
AUTH_OK=$?
set -e
if [ $AUTH_OK -ne 0 ]; then
  echo "$PREFIX ⚠️ Not logged into GitHub CLI"
  echo "$PREFIX    This is not going to work — we need GitHub CLI to work!"
  echo "$PREFIX ❌ FAILURE"
  exit 1
fi
echo "$PREFIX ✅ GitHub CLI is logged in"
exit 0


