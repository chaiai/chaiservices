#!/bin/bash

# From https://docs.docker.com/engine/install/ubuntu/

# Required dependencies
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Docker official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add repository to apt
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker engine
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Add non-root user access
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world

# Enable Docker to start on boot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

echo "Log out and in again to make sure Docker permissions go through."

# Download docker-compose binary
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions
sudo chmod +x /usr/local/bin/docker-compose

# Test
echo "Docker version: "
docker --version
echo "docker-compose version: "
docker-compose --version
