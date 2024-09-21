---
title: Docker stop and remove unwanted containers
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