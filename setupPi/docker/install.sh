#!/bin/bash

# Containerd
sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key --keyring /etc/apt/trusted.gpg.d/docker.gpg add -

# For raspberry
sudo curl -fsSL "https://download.docker.com/linux/raspbian/gpg" | sudo apt-key add -
sudo apt-key finger 9DC858229FC7DD38854AE2D88D81803C0EBFCD88
sudo tee /etc/apt/sources.list.d/docker.list \
   <<< "deb [arch=armhf] https://download.docker.com/linux/raspbian buster stable"


sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io