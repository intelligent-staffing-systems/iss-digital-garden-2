---
title: Docker stop and remove unwanted containers
description: 
aliases: []
tags: []
draft: true
date: 2024-09-21
---

## Stop all running containers
```bash
docker stop $(docker ps -aq)
```

## Remove all containers
```bash
docker rm $(docker ps -aq)
```

## Stop and remove all containers (combined)
```bash
docker rm -f $(docker ps -aq)
```

> Note: Use these commands with caution, especially in production environments.