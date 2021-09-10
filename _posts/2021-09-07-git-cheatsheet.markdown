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

- checkout a remote bracnch
-  git checkout -b feature/branch_xxx origin/feature/branch_xxx


## revert
[Git Revert Commit – 如何撤消最后一次提交](https://www.freecodecamp.org/news/git-revert-commit-how-to-undo-the-last-commit/)

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






