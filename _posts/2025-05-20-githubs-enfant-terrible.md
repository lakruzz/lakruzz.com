---
title: "GitHub's Enfant Terrible: Pull Requests"
author: Lars Kruse
author_profile: true
search: true
header:
  teaser: /assets/images/posts/github-enfant-terrible.png 
tags:
  - git
  - github
excerpt: Considering the fact that GitHub is the world's largest Git platform. It's a bit of a mystery how poorly GitHub managed to implement Pull Requests.
---

![image-center]({{ page.header.teaser }}){: .align-center width="80%"}

Considering the fact that GitHub is the world's largest Git platform. It's a bit of a mystery how GitHub got away with implementing Pull Requests so poorly
{: .kicker}

<!-- cspell:ignore Gitea Gerrit PVCS ˌɒ̃fɒ̃ tɛˈriːbl -->

<div>
<p>
<b>enfant terrible</b><br/>
/ˌɒ̃fɒ̃ tɛˈriːbl(ə)/<br/>
</p>
<p>
<em>noun</em><br/>
a person who behaves in an unconventional
or controversial way.
</p>
<em>"the enfant terrible of configuration management"</em>
</div>{: .fact .right .small}

A _Pull Request (PR)_ is not a core Git concept, at best it is an _interpretation_ of an original Open Source community collaboration model based on _patches_. All Git platforms implement their own — slightly different — interpretations of the concept; _GitHub, GitLab, BitBucket, Azure DevOps, Launchpad, Gitea, Gerrit_ ...all! But for some reason GitHub's implementation is still suffering from what could best be categorized as _child deceases_. But the kid is now in it's late teenage years. Why isn't it fixed?

## What is a Pull Request good for - originally?

Open source means that the source is open and _readable_ to everyone. But not everyone can _write_ to such an Open Source. Only trusted contributors can commit to the Open Source. The contributing workflow is ancient and predates _any_ existing distributed Version Control System.

**The Open Source workflow in a nutshell:**  If you're an outsider and want to contribute to the source where you can _read_, but not _write_ then you must obtain a _copy_ of the source. Since the copy is _yours_, you can now make changes to the copy. The transfer of these changes between code bases would — back in the days — rely on two standard *nix tools `diff` and `patch`.  You run `diff` to create a singel patch file, that contains _all_ the changes you created, in a format that the sibling tool `patch` would be able to read and apply to the origin.

The patch file would then be attached to a _pull request_ which would either be posted on a mail group, an IRC chat or sent directly as an email attachment to those responsible for the product, with write access to the source, and _they_ would then run the `patch` command. And _they_  would assume ownership and be responsible for releasing the update. Often relying on Semantic Versioning as the contract between the developers of the software and the users of the software.

This flow is still crisp and considered contemporary. Although today's standard is to use Git features rather than `diff` and `patch`.

A flow like this implies:

🤘 **Strong Code Ownership** - Clear responsibility governed by either _benevolent dictatorship_ (e.g. Linux) or _meritocracy_ (e.g. Apache Software Foundation) means someone who deeply understands the codebase _owns_ every change. No rubber-stamping approvals from random peers.

🤘 **Curated Commit History** - Linear, pristine `main` with only shippable commits. No intermediate work cluttering production readiness. It creates a reliable audit trail. Each commit is a valid deployment candidate and can be individually verified and reverted if needed. No "merge commits" or "squash commits" obscuring what actually changed.

🤘 **One Issue equals One Commit** - Atomic changes are easier to understand, test, and reason about. The VCS history itself reads like documentations. All changes are there for a specific reason. Reduces cognitive load during code review and debugging.

🤘 **Explicit Preparation Phase** - The ritual of creating a single packaged (then: a patch file, today: a single commit) containing all changes before submission forces developers to clean up their work, run all tests and verifications, understand and argue their changes, and to document and present them coherently.

🤘 **Graduated Responsibility** - New contributors earn write access through demonstrated competence, merits are the foundation of trust. This scales better than trying to peer-review everything from day one.

🤘 **Semantic Versioning as a Clear Contract** — Users and downstream consumers get a reliable upgrade signal; Semantic Versioning is the foundation for dependency resolution among individually releasable components. QA passes, release notes and advisories become simpler and less noisy. Overall this reduces regressions and encourages conservative, documented evolution rather than implicit, and arbitrary ad‑hoc changes.

> _We should work internally — even on our own proprietary code — as if we were contributing to Open Source_

When I argue this to my teams it is specifically these virtues listed above that we aim for. The quality should be applied at the source; the developer's workspace - not glued on as an afterthought. We should not rely on peers doing arbitrary and mostly opinionated reviews. But rather on those responsible obtaining actual _ownership_. Each individually releasable component has an undisputed owner. In our team we call this person the Module Key Responsible (MKR). It's a role I was first introduced to at Ericsson Communication Systems 25 years ago.

## Git for the win!

However, this workflow is very labor intense when it's based on `diff` and `patch` in completely detached source repositories, especially for more complex code bases. Tool support is definitely needed for assessing changes in context, rather than in patch files, for supporting the back-and-forth process of feed-back and resolving merge conflicts.

Linus is the champ in this area, right from the start of the Linux kernel the community relied on a Distributed Version Control System (DVCS). The standard tools of that time; PVCS, CVS, Subversion etc. were all discarded as inferior. Instead the Linux Kernel project used BitKeeper. Supposedly the world's first DVCS. But the story goes, that Linus was discontent with using a proprietary tool he didn't control and had no influence on developing features for, so the Linux community stated building their own.

Plural, there were more than one contenders: Mercury, Bazar, Git all has a historical off-set in Linus' quest for a new home grown, Open Source Distributed Version Control System to replace BitKeeper.

That battle has ended. Even Canonical's (Home of the Ubuntu distro) LaunchPad, which was build as a platform on top of their own DVCS Bazar is now definitively sun-setting Bazar in favor of Git.

The equivalent Open Source Contribution flow in Git is deliciously simple :

1. Create a `fork` - this is easy, since the Version Control System is distributed by nature. Repository _copies_  are not detached, but connected. Now you (and your colleagues) have write access to a copy, which is version controlled too.
2. Make you desired changes in your own fork and commit them to a dedicated branch — This is the equivalent of then `patch`.
3. Since you still can not write _(push)_ to the original repo, what you do instead is that you give those responsible for the product access to _your_ repo and ask them to _pull_ the _branch_ and _merge_ if from your fork repo to their `main`.
4. Due to the distributed nature of git, the internal workings of the heuristic diff algorithm, the direct acyclic graph architecture and the fascinatingly light-weight implementation of the branch concept. Any two branches/commits can easily be merged.

Linux kernel used this optimized flow already in BitKeeper. Once you left the work intense `diff` and `patch` workflow there was no going back.

So to summarize on the _Pull Request_ concept in Git; technically there is no _actual_ pull request implemented in git, it's more like a nick name for the Open Source contribution process flow.

## What is a Pull Request good for - in GitHub?

In GitHub a _Pull Request_ is essentially an attempt to implement some tool support around the Open Source contribution model described above. But I would claim that many PR implementations miss out on many of the desired outcomes in the process. And GitHub's Pull Requests are no exception.

Although GitHub's PR do support working with forks too, as described above I've seen close to 100% of all PR implementations in proprietary GitHub repos works within _the same_ repo. Often with a ruleset or policy around it, that makes it _behave_ almost like a fork:

- You don't have write access to `main`
- Peer reviews are required before the PR is merged in
- Tests and statuses (often automated in declarative workflows) are required

Under the hood; In essence a Pull Request in GitHub is implemented as a variant of a _Github Issue_.

These features are not Git native, they are implemented on the individual Platform, GitHub, GitLab, Bitbucket Azure DevOps etc. So you submit to a certain flavor and technically also to a vendor lock in. Moving your repos to another platform would require sucking up a new flavor.

So how do we like the GitHub flavor of PRs?

Well, PR is generally recognized as an abbreviation of _Pull Request_. But in GitHub's flavor it would probably be just as relevant to see it as an abbreviation of _Peer Review_. The entire PR process is designed around the _assumed_ need for `code reviews`.

But is that at good approach?

What If....

- **We believe task switching is evil**, it greatly increases the cognitive load. Being asked to stop an ongoing process, switch to review another and then go back to the first is indeed _task switching_.
- **We believe that hand-overs create wait states** – on top of the increased cognitive load. Idle time in the Value Stream simply. This idle time adds to the overall Change Lead Time, which is the first of the DORA metrics
- **We are committed to paired programming** or even mob programming. We claim that the four-eye-principle should be covered through the work process, not the validation process.
- **We run extensive automated verifications**; static code analysis (linting, cyclomatic complexity, spell checks), unit tests, fuzzy tests, we build, deploy and run our E2E regressions tests in a production-like environment _before_ we try to hit `main`.
- **We keep `main` pristine and always shippable** and we adhere to _Continuous Delivery_. Even if bad code style should have passed through our automated validation even cause an actual failure. Our Deployment Frequency (the second DORA metric) and our Failed Deployment Recovery Time (the fourth DORA metric) is so fast that we're not the slightest bit worried.
- **Our Change Failure Rate is low** (the third DORA metric) and also the Rework Rate (the fifth DORA metric - newly added in '24) are low — nothing indicates that our process produces poor quality.

In our situation, where this is true — without enforcing _Peer Reviews_ — the GitHub Pull request's focus stop-go wait states and task switching would only inflict pain.

## Our principles

The results mentioned above are gained from designing our own ideal development principles. They read like this:

1. We work with a kanban approach. We describe our GitHub issues so that each match a commit onto main — one issue becomes one commit.
2. We attach a dedicated development branch to each issue.
3. We keep our work-log, comments and design decisions in our issues.
4. We require our history on `main` to be strictly linear and we only allow merges onto main that can be `fast-forward`, this ensures, that the commit that is verified in the process is the _exact same_ (same SHA) as the one that ends up on `main`.
5. We keep `main` pristine – all commits on `main` are potentially _shippable_ no intermediate commits are allowed, consequently...
6. A branch that is delivered to `main` can only contain _one_ commit. This implies that contributors must always prepare their branch and make it ready for delivery; sync to `main`, collapse and run all verification steps to produce only a single commit that can be fast-forwarded. This is done by the contributors themselves, in their own workspace.
7. We do not _consistently require_ a peer review on our code before it's merged to main, instead we run extensive automated tests and static code analysis in our `ready` workflow which sets various commit statuses which must _all_ be successful for the development branch to be _deliverable_ onto `main`.
8. We do adhere to the _four-eyes_ principle. But we do this as part of the development process, not as an opinionated peer review used as a quality gate.
9. We adhere to _individually releasable components_ as opposed to a _mono-repo_. The composite product structure and dependency map is automatically maintained in a _deployment manifest_.
10. Releases are based on strict compliance with SemVer 2.0. Deploys are automated, release note generation is automated.

So — that's the process we believe in and which has proved impressively efficient.

Since we were in GitHub our first attempt to build tooling around this process was to utilize the standard GitHub features, including Pull requests. But several issues emerged, that led us to designing and build our tool support. Based on a few GitHub Cli extensions and a small repo of dedicated generic callable workflows.

These tools are all open source and available for free for everyone who would like to walk the same path as us. I'll summarize them briefly in the end – and extensively in my next blog post. But first let me finish my rant against the gitHub Pull Request and why we discarded it all together.

## So what's the problem - in GitHub?

### ⚠️ The issues are eclipsed by the pull request

When we work extensively with _issues_, we'd like the comments related to the code developed in contest of that issue, but a  GitHub Pull Request is under the hood implemented as a specialized varian of a GitHub Issue - so when using the Pull Requests we get _another issue_ on top of the original issue, so now we have two logically identical issues - they both relate to the same development branch. It's a mess. we want comments, design decisions and work logs and audit trails in context of the original issue. It felt like GitHub Pull Request were intrusive party crashers.

### ⚠️ Pull Requests don't support true linear (`fast-forward`) history

It's a git technical, somewhat nerdy, discussion, but it's well covered in this [Feature request discussion on GitHub](https://github.com/orgs/community/discussions/4618).

Supporting a true linear history is so fundamental in _Configuration Management_ for _build avoidance_, _optimization by cache utilization_ and in _compliancy_ in general. That like most others in this thread we couldn't believe our own findings and conclusions when we learned, that _none_  of the three available merge strategies in GitHubs's Pull Requests _(merge_,_rebase_,_squash)_ are capable of supporting a `fast-forward` merge. Not even if we carefully prepared it, and validated that a `fast-forward` merge was indeed possible.

**😱👎 The Pull Request will _always_ create a _new_ commit. _Never_ `fast-forward` the one presented to it**.

This discovery was as unacceptable as it was shocking. GitHub PR's are ruining and ignoring some of the most desirable features built into Git itself.

## Workon, Wrapup, Deliver

We took the decision to create our own tool. It's build as an extension to the GitHub CLI `gh`. The GitHub CLI come with a built-in package manager so the installation is easy:

```shell
gh extension install thetechcollective/gh-tt
```

The tool is called `tt` named after our internal team name `tech that`. It provides a small handful of sub commands at the core are `workon`, `wrapup` and `deliver`.

### `workon`

This command will set up a new branch for a specific issue, unless a branch for that issue already exits, then it will reuse that. It also supports an option to create a new issue on the fly and work on that.

This is the foundation of our collaboration model, if more developers run the same command, they will get the _same_ branch. So this is also how we support paired programming in a distributed team.

```shell
# This will create a new - or reuse and existing
# development branch on issue 32
gh tt workon --issue 32 
```

### `wrapup`

This command is used to commit and push the current state of the workspace to `origin`. I you haven't added _anything_ to git it will default to add all changes (`git add -A`) but if you you have explicitly added _something_ then it will just go with that.

The command takes just one parameter; the base of the commit message. The actual commit message will be suffixed with a reference to the issue it relates to, this way all individual commits will be mentioned in the issue. This is a GitHub feature that we're just exploiting. So we get that audit trail for free simply by referencing the issue in the commit message.

Developers are free to make as many commits on the issue-branch as they want, in fact we encourage them to use `wrapup` frequently when they go to lunch, share current work with a colleague (👀👀-principle), I often use it myself just to commit my dirty files before I run another AI prompt in agent mode, because I find that Git is far better at keeping track of changes than the AI agent is.

```shell
# This will create a new - or reuse and existing
# development branch on issue 32
gh tt wrapup "I´m off to lunch"
gh tt wrapup "I think that was that"
gh tt wapup "dotted the i´s and crossed the t´s"  
```

In order to support the 👀👀-principle, We have enhanced GitHub Pull Request's `CODEOWNER` concepts and created a variant of it called `REPONSIBLES`. It's a file you put in the root of the repo which use standard git glob syntax (as opposed to `CODEOWNERS` which uses an homegrown syntax) to list those responsible for different files in the repo. `wrapup` reads the `RESPONSIBLES` file and unless the current user is self listed as responsible, the change set is listed as a comment on the issue together with a mention of those responsible. They will automatically get a notification from GitHub. The responsible can then take a peak and see if all is on track and react if necessary.

We have a dedicated workflow `wrapup.yml` which runs all or our static analysis, linting and unit tests and each individual verification sets the status on each each commit utilizing GitHubs _commit statuses_ feature. At this point it's not a strict quality gate, it's more like a service to the developer.

This is how far we have come.

{% responsive_image
  path: "assets/images/posts/git-rebase-needed.png"
  alt: "A rebase is needed"
  caption: "I've started working on issue 32. I did three commits with 'wrapup', now I'm done and I'd like to deliver to main but in the meantime main is updated with stuff I haven't seen on my branch yet."
  class: "center wide"
%}

**non-compliant:** In this state I can not deliver; since my branch isn't in sync with `main`the  merge wouldn't be `fast-forward` and also my branch contains more than one commit, so even If did sync to `main` my _intermediate_ commits `a` and `b` commits would void the _pristine-ness_. of `main`.

First thing we need is to sync with `main` to enable a `fast-forward` merge:

{% responsive_image
  path: "assets/images/posts/git-rebased.png"
  alt: "Rebased"
  caption: "I run a rebase to sync to main. Technically this will rewrite history - my a, b and c commits will be given new SHAs but at this point – on my own dev branch – I don't care about the SHAs. They are not important — yet. If they were I could obtain the same result with a merge commit from main onto the issue branch. That would create a merge commit, which I don't want on my main, but which I also don't care about on my own issue branch. So developers are free to do what they want, as long as they get in sync with main and enable a fast forward merge."
  class: "center wide"
%}

### `deliver``

The `deliver` command takes no parameters, everything needed to perform the deliver can be derived from the context. It will check for fast-forward-ness and abort is it's not possible. It will also summarize the entire history of the issue branch in the commit message, so that even if we're about to soon delete the issue branch the history remains retrievable.

```shell
# Squeeze the issue branch into just one commit
# Put it on a dedicated ready branch and push that
gh tt deliver
```

The result from this is:

{% responsive_image
  path: "assets/images/posts/git-ready-branch.png"
  alt: "Ready branch"
  caption: "At this point, if a run a diff on 32-issue and ready/32-issue they are 100% identical - The process is conceptually the same as a squash merge only it doesn't happen in the merge process. But in a separate commit on a separate branch, where it can be scrutinized and verified before the merge."
  class: "center wide"
%}

The ready branch is created with a git command like this (they are slightly simplified for readability)

```shell
git checkout -b ready/32-issue main
git commit-tree 32-issue^{tree} -p main -m "close #32"
```

The `ready` verification flow now runs on the `ready/32-issue` branch and if it's successful it will `fast-forward` onto `main:

{% responsive_image
  path: "assets/images/posts/git-fast-forward.png"
  alt: "Fast-forward"
  caption: "Keeping main pristine – and always shippable, delivering only _one_ commit at a time. In a fast-forward no new commit is created, the main HEAD is simply moved to the existing abc:"
  class: "center wide"
%}

The intermediate `ready/32-issue` branch is used instead of just brutally force resetting the `32-issue` branch.

1. For one reason the individual commits on the `32-issue` branch may be referenced in the GitHub Issue's work log - so we don't want to throw them away just yet.
2. Also we don't actually know if we're done yet. The `ready` verification flow may fail. In which case I need to do more work. And I'd rather do that on my original `32-issue` branch than my _kinda_ arbitrary squashed `ready/32-issue` branch.
3. The `ready` verification flow is different then one we use on the development branch and it's different than then one that runs when `main` is updated. It's easy to trigger when you have a dedicated branch. The `ready` workflow triggers like this:

   ```yaml
   on:
     push:
       branches: 
         - 'ready/*'
   ```

## A GitHub Pull request don't support How We Work

👎 As discussed intensely in the GitHub discussions referenced above. None of the thee possible merge strategies on PR's are capable of creating a `fast-forward` merge onto main. This is basic Configuration Management Gospel!

👎 Pull Request in general violates our use of issues. PR's will make annotations on the arbitrary parallel _shadow_ issue, the PR itself. But we want top record annotations and work logs on the issues themselves, to compile a worklog that is easy to read.

👎 Pull Request notoriously creates manual verification tasks; developers are supposed to review code and _approve_ it (mura). Which creates wait states and task switching (muri). It's just wast in the value stream.
