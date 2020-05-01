#!/bin/bash

echo Removing eventual apt locks...
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

echo Updating repositories...
if ! apt-get update
then
	echo Could not update repositories. Check your file /etc/apt/sources.list
    exit 1
fi
echo Update successfully!

echo Installing Ubuntu packages default...
if ! sudo apt install python3 python-pip wine nautilus-dropbox docker docker-compose git build-essential libssl-dev flatpak gnome-software-plugin-flatpak -y &&
then
	echo Ubuntu packages could not be installed.
    exit 1
fi
echo Ubuntu packages have been installed!

echo Installing NodeJS...
if ! sudo snap install --edge node --classic &&
then
	echo NodeJS could not be installed.
    exit 1
fi
echo NodeJS was installed!

echo Installing VisualStudioCode...
if ! sudo snap install code --classic &&
then
	echo VisualStudioCode could not be installed.
    exit 1
fi
echo VisualStudioCode was installed!

echo Installing GoogleChrome...
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
if ! sudo dpkg -i google-chrome-stable_current_amd64.deb
then
	echo GoogleChrome could not be installed.
    exit 1
fi
echo GoogleChrome was installed!

echo Installing Steam...
if ! sudo apt install steam-installer
then
	echo Steam could not be installed.
    exit 1
fi
echo Steam was installed!

echo Installing Discord...
wget https://discordapp.com/api/download?platform=linux&format=deb -O discord.deb
if ! sudo dpkg -i discord.deb && sudo apt-get install -f
then
	echo Discord could not be installed.
    exit 1
fi
echo Discord was installed!

echo Installing Spotify...
if ! sudo snap install spotify &&
then
	echo Spotify could not be installed.
    exit 1
fi
echo Spotify was installed!

echo Updating packages already installed.
if ! sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y &&
then
    echo Could not update packages.
    exit 1
fi
echo Package update successfully!

echo Installation completed!
