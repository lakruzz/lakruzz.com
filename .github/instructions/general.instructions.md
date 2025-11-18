---
applyTo: '**'
---

# General Instructions

## Temp folder and temp files

**When in agent mode**, creating intermediate or temporary test files, always create them in the `./temp` folder. If it doesn't exist create the `temp` folder and and make sure it's ignored by git. If it's not already mentioned in the `.gitignore` file in the repo root, then add a `./temp/.gitignore` file containing only an asterisk (`*`).

## Branch names and the process we use

We do not use pull requests.

We generally use the GitHub CLI extension [gh-tt](https://github.com/thetechcollective/gh-tt) to manage our issues and branches. Most impotantly it supports `workon`, `wrapup` and `deliver`.

``` shell
usage: gh tt workon [-i ISSUE | -t TITLE]

options:
  -i ISSUE              Issue number for an existing issue
  -t TITLE              Title for the new issue, will create a new issue
```

This will create a new branch named with the issue number as prefix (e.g. `321-Update_summary_instructions`) and switch to that branch. The branch name is part of the zsh prompt in the @terminal, and can be directly accessed; The `$PS1` is set up to show the branch name too (e.g. `vscode ➜ /workspaces/gh-tt (321-Update_summary_instructions) $` means that we're working on issue 321).

IMPORTANT: When asked to annotate issue summaries or perform other issue-related tasks, ALWAYS extract the issue number directly from the terminal prompt (the number before the hyphen in the branch name shown in parentheses). DO NOT run additional git commands like `git branch --show-current` to determine this information.

``` shell
usage: gh tt wrapup [message]

positional arguments:
  message               Message for the commit 
```

This will stage all changes, commit them with the provided message and push the branch to origin. This will trigger the `.github/workflows/wrapup.yml` workflow which will run unittests and linting. `wrapup` is also subject to pre-commit hooks, which roughly mimic the `wrapup.yml` flow locally.

``` shell
usage: gh tt deliver
```

`deliver` squeezes all the commits on the issue branch into one commit (using `git commit-tree HEAD^{tree}` since `main`) and pushes it to the remote on a new `ready/<ISSUE_BRANCH>` branch. A seperate workflow `.github/workflows/ready.yml` is defined to pick this up, run additional tests and fast-forward onto `main`

When an issue branch is `delivered` the issue is automatically closed. there is a git alias defined `git sweep` which will prune and delete all local branches that are deliverd and reset to `main`.

## Code style and design principles

## CLI output and print statements

In general avoid adding print statements. When a CLI tool we usually do not like verbose informative statements. If nothing happened, then nothing should be printed. I'll let you know explicitly when print statements are needed.

## DRY - Don't Repeat Yourself

Avoid code duplication. If you find yourself copy-pasting code, then it's a sign that you should refactor the code into a function or class that can be reused.

## Keep changesets small and focused

When working on an issue,  keep the changeset small and focused on the issue at hand. Do not add unrelated changes or refactorings.

## Suggest new issues

Feel free to point out code smells and suggest improvements, but do not implement them unless they are directly related to the issue. If they are severe and important enough, then offer to create a new issue for them. Follow the same approach as when you annotate summaries (see ./summary.instructions.md) to issues comments (create a `*.md` file in the `temp` folder. create the issue using the `--body-file` flag).

## Favor testable code

When writing code, favor testable code. This means that you should write code that can be easily tested with unit tests. Avoid writing code that is tightly coupled or has side effects that are hard to mock or stub.

## Offer to write tests

If you find that the code you're working on is not well tested, then offer to write tests for it. But do not write the tests unless I explicitly ask you to do so.
