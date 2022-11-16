#! /bin/sh

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose
sudo systemctl start docker
sudo usermod -aG docker $USER
newgrp docker

