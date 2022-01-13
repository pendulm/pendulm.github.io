---
layout: post
title:  "Git Cheatsheet"
date:   2021-09-07 14:48:00
categories: link
---


## Branch

delete local branch
- git branch -d  local_branch_name

delete remote branch
- git push origin -d remote_branch

checkout a remote bracnch
-  git checkout -b feature/branch_xxx origin/feature/branch_xxx

rename master to main branch
- git branch -m master main

tracking information for local branch
- git branch --set-upstream-to=<remote>/<branch> fix_rootless_ssh


## revert
[Git Revert Commit – 如何撤消最后一次提交](https://www.freecodecamp.org/news/git-revert-commit-how-to-undo-the-last-commit/)

[How to Squash Last N Commits in Git?](https://jdhao.github.io/2022/01/09/git_squash_last_n_commits/)

revert last commit, add extra commit of revert itself
- git revert HEAD

change HEAD to prev commit, and leave recent modified file uncommited
- git reset --soft HEAD~1

change HEAD to prev commit, discarding all modify
- git reset --hard HEAD~1

change last commit message
- git commit --amend


## rebase


resolv conflict when pull
- git pull --rebase && git rebase --continue

## cherry-pick

move specified commits to current branch
- git cherry-pick C2 C4


## commit

add signoff message
- git commit --signoff


## Misc

fetch submodule
- git submodule update

## staged

remove from staging area
- git rm --cached filename

show staged changes
- git diff --staged

show diff between staged and previous commit
- git diff --cached

unstage
- git restore --staged filename


## log
show modified files
- git log --stat

show changes
- git log --patch


## refrence

- [A Hacker's Guide to Git | Wildly Inaccurate](https://wildlyinaccurate.com/a-hackers-guide-to-git/)
