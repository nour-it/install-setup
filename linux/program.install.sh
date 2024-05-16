sudo apt update
sudo apt upgrade -y

# executables .deb
sudo dpkg -i ./programs/*.deb
sudo apt --fix-broken install

# jdk
sudo apt install -y openjdk-17-jdk

# Nodejs
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
sudo apt install -y nodejs
sudo npm install -g yarn pnpm expo-cli firebase-tools

# docker
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce -y
sudo usermod -aG docker ${USER}

# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# PHP
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update 
sudo apt install -y php8.3
sudo update-rc.d apache2 disable

# Obs studio 
sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo apt update
sudo apt -y update
sudo apt -y install ffmpeg obs-studio

# Audacity
sudo apt install -y fuse libfuse2
sudo modprobe fuse
sudo groupadd fuse
user="$(whoami)"
sudo usermod -a -G fuse $user
sudo cp ./programs/audacity-linux-3.5.1-x64.AppImage /usr/local/bin/audacity

# Kdenlive
sudo cp ./programs/kdenlive-24.02.2-x86_64.AppImage /usr/local/bin/kdenlive

# fix broken packages
sudo apt --fix-broken install