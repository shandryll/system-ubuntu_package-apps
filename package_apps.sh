#!/bin/bash

echo Removing eventual apt locks...
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;
echo

echo Updating repositories...
sudo apt-get update
echo Update successfully!
echo

echo Installing git...
sudo apt-get install git-all -y
echo git was installed!
echo

echo Installing python-pip...
sudo apt install python3-pip -y
echo python-pip was installed!
echo

echo Installing nodeJS...
sudo sudo apt install nodejs -y
echo nodeJS was installed!
echo

echo Installing docker...
sudo apt install docker.io -y
echo docker was installed!
echo

echo Installing docker-compose...
sudo apt install docker-compose -y
echo docker-compose was installed!
echo

echo Installing VisualStudioCode...
sudo snap install code -classic
echo VisualStudioCode was installed!
echo

echo Installing GoogleChrome...
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
echo GoogleChrome was installed!
echo

echo Installing Flameshot...
wget https://github.com/lupoDharkael/flameshot/releases/download/v0.6.0/flameshot_0.6.0_bionic_x86_64.deb -O flameshot.deb
sudo dpkg -i flameshot.deb && sudo apt-get install -f
echo Flameshot was installed!
echo

echo Installing Steam...
sudo apt install steam-installer
echo Steam was installed!
echo

echo Installing Discord...
sudo snap install discord
echo Discord was installed!
echo

echo Installing Spotify...
sudo snap install spotify
echo Spotify was installed!
echo

echo Updating packages already installed.
sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y &&
echo Package update successfully!
echo

echo Installation completed!
