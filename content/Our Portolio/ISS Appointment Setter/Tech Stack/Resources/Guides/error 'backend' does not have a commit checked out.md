---
title: error 'backend' does not have a commit checked out
---

This error is due to having a git repo within the project you are trying to initialize, and may be a result of creating a project with a `docker run` command. 

The approach to this is finding any .git/ directories from the current repo:
```
find . -name ".git" -type d
```
and then to delete any unwanted .git directory.