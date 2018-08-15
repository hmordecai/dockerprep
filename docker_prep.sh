#!/bin/sh
sudo apt-get update
echo ------Preparing Respositories------
sudo apt-get install -y apt-transport-https
sudo apt-get install -y ca-certificates
sudo apt-get install -y curl
sudo apt-get install -y software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo ------Installing Docker------
sudo apt-get update   
sudo apt-get install -y docker-ce
echo ------Installing Docker compose------
sudo apt-get install -y docker-compose
echo ------Setting to run docker as non-priv------
sudo gpasswd -a $USER docker
echo ------Adding Aliases------
echo alias docker-enter="docker-compose run --rm --service-ports app /bin/bash" >> $HOME/.bash_aliases
echo alias docker-enter-again="docker-compose run --rm app /bin/bash" >> $HOME/.bash_aliases
echo ------DONE------
echo ******Please Manually Execute To Confirm
echo ******----------------------------------
echo ******newgrp docker
echo ******docker run hello-world
echo ******nano $HOME/.bash_aliases
