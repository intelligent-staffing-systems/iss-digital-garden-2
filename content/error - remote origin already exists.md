---
title: error - remote origin already exists
---

The following seems to help debug or fix:
```bash
ssh -T git@github.com
git remote set-url origin git@github.com:ldraney/fullstack-template-next-rb-pg.git
git push -u origin main
history | tail -n 20
```