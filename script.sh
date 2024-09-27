#!/bin/bash
sudo mkfs.xfs /dev/sdb && sudo mount /dev/sdb /opt
sudo chmod -Rf 777 /opt
sudo echo "UUID=$(ls -l /dev/disk/by-uuid/ | grep sdb | awk '{print $9}')       /opt   xfs     defaults        0       1" >> /etc/fstab
sudo mkdir /opt/docker
sudo chmod -Rf 777 /opt
cd /var/lib
sudo ln -s /opt/docker/ .
cd /home/ubuntu
##docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl enable docker
sudo apt-get update && sudo apt-get upgrade -y && sudo apt install nano net-tools
