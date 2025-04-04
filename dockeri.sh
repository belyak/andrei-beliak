#!/bin/bash

echo "Updating package index..."
sudo apt-get update

echo "Installing packages to allow apt to use a repository over HTTPS..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

echo "Adding Docker's official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "Setting up the Docker stable repository..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo "Updating package index again..."
sudo apt-get update

echo "Installing the latest version of Docker..."
sudo apt-get install -y docker-ce

echo "Verifying Docker installation by running the hello-world image..."
sudo docker run hello-world

echo "Adding the current user to the docker group to allow non-root access..."
sudo usermod -aG docker $USER

echo "Docker installation and verification complete. Please log out and log back in to apply the group changes."
