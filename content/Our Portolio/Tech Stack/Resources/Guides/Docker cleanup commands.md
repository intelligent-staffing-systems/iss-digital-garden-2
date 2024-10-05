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


## A more complete cleanup of all resources
```bash
#!/bin/bash

# Docker Cleanup Script

# Stop all running containers
echo "Stopping all running containers..."
docker stop $(docker ps -aq)

# Remove all stopped containers
echo "Removing all stopped containers..."
docker container prune -f

# Remove all unused images
echo "Removing all unused images..."
docker image prune -af

# Remove all unused volumes
echo "Removing all unused volumes..."
docker volume prune -f

# Remove all unused networks
echo "Removing all unused networks..."
docker network prune -f

# Remove everything unused (containers, images, volumes, networks)
echo "Removing all unused Docker resources..."
docker system prune -af

# Remove dangling images (untagged images)
echo "Removing dangling images..."
docker image prune -f

# Remove containers older than 24 hours
echo "Removing containers older than 24 hours..."
docker container prune -f --filter "until=24h"

echo "Docker cleanup completed!"

# Optional: Display current Docker disk usage
echo "Current Docker disk usage:"
docker system df

# Note: This script uses the -f flag to force removal without prompting.
# Be cautious when running this script, as it will remove resources without confirmation.
```