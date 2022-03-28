#!/bin/bash

# From https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04

# Add NodeSource PPA
cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh

# Run automated setup script
sudo bash /tmp/nodesource_setup.sh

# Install nodejs
sudo apt -y install nodejs

# Version check
echo "Node version: "
node -v
echo "npm version: "
npm -v
