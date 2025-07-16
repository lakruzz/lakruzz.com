# Git Hooks

Git hooks for this repo are in `.githooks` repo.

They are automatically configured when setting up the development environment.

## How it works

The `.devcontainer/postCreateCommand.sh` script is run on devcontainer creation. Among other things it instructs git to include `.gitconfig` in the configuration.

`.gitconfig` redirects the git `hooksPaths` (default is `.git/hooks/`) like this:

```ini
[core]
    hooksPath = .githooks
```

## Available hooks

- **pre-commit**: Runs cspell and markdownlint checks the exact same way that the `wrapup` workflow runs them. It's takes 2 seconds, and it prevents you from committing stuff that will fail.

## Hooks in combination with [tt](https://github.com/thetechcollective/gh-tt) GitHub CLI extension

`tt` is delibertely non-verbose, so you will not get an output to `STDOUT` if it passes - but you _will_ get an error if it doesn't.

`tt` supports a `--verbose|-v` switch you can apply to get the chatty output.

## Manual setup

If you're not using the devcontainer, you can set this up manually:

```bash
git config core.hooksPath .githooks
```

## Adding more hooks

Remember to make any new hook executable:

```shell
chmod +x .githooks/*
```

Look in the `.git/hooks/` folder for samples and inspiration

## Disabling hooks temporarily

If you need to bypass the hooks for a specific commit use the `--no-verify` switch:

```bash
git commit --no-verify -m "Your commit message"
```
