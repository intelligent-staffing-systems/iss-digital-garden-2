---
title: Update ownership of project files
description: 
aliases: []
tags: []
draft: true
date: 2024-09-09
---

You may have noticed all the files in our frontend directory are now owned by the root user. 
This is due to Docker running processes as root by default.
We need to change this in order to not need admin permissions to edit our files natively. 

To fix this simply:

```
sudo chown -R $USER:$USER .
```

This command changes ownership of all files to your user.
It's a good practice for local development, improving security and avoiding permission issues.
After changing ownership, the setup should still work as expected for our following tests. 