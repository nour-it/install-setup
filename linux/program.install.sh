sudo apt update
sudo apt upgrade -y

# requires
sudo apt install gcc make vagrant zeal -y 

# executables .deb
sudo dpkg -i ./programs/*.deb
sudo apt --fix-broken install

# jdk
sudo apt install -y openjdk-17-jdk

# Nodejs
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
sudo apt install -y nodejs
sudo npm install -g yarn pnpm expo-cli firebase-tools heroku

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
sudo apt install -y php-json php-mbstring php-tokenizer php-xml php-mysql php-pgsql

echo '
  alias composer="docker run --rm --interactive --tty --volume ./:/app --user (id -u):(id -g) composer "
' >> "${home}/.config/fish/config.fish"

# Python 
sudo apt install python3.8-venv python3-tk -y 

# Obs studio 
sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo apt update
sudo apt -y update
sudo apt -y install ffmpeg obs-studio

# FileZilla
sudo apt install -y filezilla

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

# Insomnia | Postman
sudo snap install -y insomnia postman

# discord
sudo snap install discord

# Gcloud
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-475.0.0-linux-x86_64.tar.gz
tar -xf google-cloud-cli-475.0.0-linux-x86_64.tar.gz
cp google-cloud-sdk/ ~/
bash ~/google-cloud-sdk/install.sh
rm -rf google-cloud-sdk/
rm google-cloud-cli-475.0.0-linux-x86_64.tar.gz

echo '
    if [ -f '~/google-cloud-sdk/path.fish.inc' ]; 
        . '~/google-cloud-sdk/path.fish.inc'; 
    end
' >> "${home}/.config/fish/config.fish"

# Zed code editor
curl https://zed.dev/install.sh | sh