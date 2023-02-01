#!/bin/bash

sudo apt update -y 
sudo apt upgrade -y

# jq
sudo apt install jq -y

# unzip
sudo apt install unzip -y

# azure-cli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# helm
curl -sL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | sudo bash

# kubectl
curl -LO "https://dl.k8s.io/release/v1.23.12/bin/linux/amd64/kubectl"
chmod +x kubectl
mv -f kubectl /usr/bin/
echo "alias k=kubectl" | sudo tee /home/adminuser/.bash_aliases

# docker
sudo apt-get install ca-certificates curl gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# set kubectl, helm bash completion
echo "source <(helm completion bash)" >> /home/adminuser/.bashrc
echo "" >> /home/adminuser/.bashrc
echo "source <(kubectl completion bash)" >> /home/adminuser/.bashrc
echo "" >> /home/adminuser/.bashrc
