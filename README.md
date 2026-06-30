# Docker for begineer
This repository focuses on sharing a learning path for using Docker. The author is also a beginner who has just started this learning journey and hopes that more contributors will share ideas and comments so that we can learn Docker from zero to hero and apply these skills in real working environments

# What is Virtual Machine (VM)
VMs carve out and lock down a specific chunk of your local computer's physical hardware like your RAM, CPU, and storage to run a completely separate, second operating system. Because they run an entire extra OS on top of your shared local resources, VMs are heavy and take up a lot of space

# What is Container
Containers skip packing a whole operating system and just share the host machine's OS kernel instead. They only bundle the actual application code, dependencies, and libraries. This makes the setup incredibly lightweight—often just a few megabytes—so they can start up almost instantly

## What is Docker
Docker is a containerization platform that lets you package and run applications in isolated environments called containers. Containers share the host operating system kernel, making them generally more lightweight and resource-efficient than traditional virtual machines. This allows multiple applications to run independently on the same machine

## Topic
[x] [Install Docker](install-docker)

[x] [Create first Dockerfile](create-first-dockerfile)

## Install Docker
This section guides you on how to install Docker in different operating system environments

### Windows
```
# 1. Go to the Docker official website to download the installer and run it to install Docker
#    Select the installer that compatible with your computer processor (AMD64 or ARM64)

# 2. After the installation completed, required to restart computer
```

```
# 3. Normally the installation will help you to enable these two Windows features at "Turn Windows Features on or off"
#    Hyper-V
#    Windows Subsystem for Linux
#    If these two features does not enable, then open PowerShell with Administrator mode and execute these commands:

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
# For WSL 2
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
Restart-Computer
```

```
# 4. Check the Docker version, open PowerShell
docker --version

# Return: Docker version 29.5.3, build d1c06ef

# 5. Test Docker
docker run hello-world

# Result will be show like in below, if does not show then check the docker is startup
# docker run hello-world
# Unable to find image 'hello-world:latest' locally
# latest: Pulling from library/hello-world
# 4f55086f7dd0: Pull complete
# d5e71e642bf5: Download complete
# Digest: sha256:96498ffd522e70807ab6384a5c0485a79b9c7c08ca79ba08623edcad1054e62d
# Status: Downloaded newer image for hello-world:latest

# Hello from Docker!
# This message shows that your installation appears to be working correctly.

# To generate this message, Docker took the following steps:
# 1. The Docker client contacted the Docker daemon.
# 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
#    (amd64)
# 3. The Docker daemon created a new container from that image which runs the
#    executable that produces the output you are currently reading.
# 4. The Docker daemon streamed that output to the Docker client, which sent it
#    to your terminal.

# To try something more ambitious, you can run an Ubuntu container with:
# $ docker run -it ubuntu bash

# Share images, automate workflows, and more with a free Docker ID:
# https://hub.docker.com/

# For more examples and ideas, visit:
# https://docs.docker.com/get-started/

```

### Mac
```
# 1. Go to Docker official website and select the version that matches your Mac's processor

# 2. After install, Launch the Docker

# 3. Verify the installation, execute at terminal:
docker --version
```

### Linux - Ubuntu or Debian
```
# 1. Remove conflicting packages
sudo apt-get remove docker docker-engine docker.io containerd runc

# 2. Update the package index and install prerequisites
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

# 3. Add Docker’s official GPG key
# Create the keyrings directory if it doesn't exist
sudo mkdir -p /etc/apt/keyrings

# Ubuntu, Download Docker's official GPG key for Ubuntu
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Debain, Download Docker's official GPG key for Debian
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# 4. Set up the repository
# Ubuntu
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Debian
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 5. Install Docker Engine
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 6. Verify docker after install
docker --version

# 7. Start and enable the Docker service
sudo systemctl enable --now docker

# 8. Run Docker Without Sudo. Create the docker group
sudo groupadd docker

# 9. Add your current user to the group
sudo usermod -aG docker $USER

# Apply the changes: Log out of your server and log back in, or run
newgrp docker

# Test running without sudo
docker run hello-world
```

## Create first Dockerfile
```
# 1. At VS Code, open the terminal and then create a simple html file
touch index.html

# 2. Press Crtl + P, find index.html and open the file then input '!' the vs code will auto create a simple html

# 3. Change the <title>My First Docker</title>

# 4. Add a simple header between with body tag: <h1>Hello Docker</h1>, then save the file

# 5. Create the Dockerfile, do not add file extension
touch Dockerfile

# 6. Add Dockerfile Instructions or Dockerfile Directives
# Step 1: Use the ultra-lightweigh Alpine Linux image
FROM nginx:alpine

# Step 2: Copy project to Nginx's public folder
COPY index.html /usr/share/nginx/html/index.html

# Step 3: Expose port 80 to allow web traffic
EXPOSE 80

# Step 4: Run Nginx
CMD ["nginx", "-g", "daemon off;"]

# 7. Create docker image
docker build -t my-ngnix-image .

# 8. Launch the container
docker run 

# 9. Check the container is running
docker ps -a

# 10. Test the website is running, open the browser and navigate http://localhost:8080
```