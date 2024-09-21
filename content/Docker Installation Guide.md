---
title: Docker Installation Guide
description: 
aliases: []
tags: []
draft: true
date: 2024-08-25
---
This guide sets up docker with the `compose` plugin, as is recommended by docker.  `docker-compose` has been deprecated.

In other words, if you are reading this guide, be sure to use `docker compose` and not `docker-compose`

```
sudo -v
sudo apt-get -y install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" |  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
exec su -l $USER
docker --version
docker run hello-world

```


## Add to Docker Group (may need to run twice in automation):

```
# Create the Docker group
sudo groupadd docker

# Add your user to the Docker group
sudo usermod -aG docker $USER

# Log out and log back in to apply the group changes
# Alternatively, use the following command to apply the new group membership without logging out and back in
newgrp docker

# Verify that your user is added to the Docker group
groups $USER
```

```

sudo usermod -aG docker $USER
exec su -l $USER
```