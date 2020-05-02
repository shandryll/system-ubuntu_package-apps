#!/bin/bash

echo Removing eventual apt locks...
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;
echo

echo Updating repositories...
if ! apt-get update
then
	echo Could not update repositories. Check your file /etc/apt/sources.list
    exit 1
fi
echo Update successfully!
echo

echo Install prerequisite packages to use packages over HTTPS:
sudo apt install apt-transport-https ca-certificates curl software-properties-common
echo Packages have been installed!
echo

echo Installing Ubuntu packages default...
sudo apt install python3 python-pip wine nautilus-dropbox docker docker-compose git build-essential libssl-dev flatpak gnome-software-plugin-flatpak -y &&
echo Ubuntu packages have been installed!
echo

echo Installing NodeJS...
sudo snap install --edge node --classic &&
echo NodeJS was installed!
echo

echo Installing DockerCompose...
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo dpkg -i google-chrome-stable_current_amd64.deb
echo DockerCompose was installed!
echo

echo Installing VisualStudioCode...
sudo snap install code --classic &&
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
wget https://discordapp.com/api/download?platform=linux&format=deb -O discord.deb
sudo dpkg -i discord.deb && sudo apt-get install -f
echo Discord was installed!
echo

echo Installing Spotify...
sudo snap install spotify &&
echo Spotify was installed!
echo

echo Updating packages already installed.
sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y &&
echo Package update successfully!
echo

echo Installation completed!
