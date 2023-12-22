#!/bin/bash
if [ /usr/bin/proxychains ] #proxychains check
then
echo $'\e[1;36mproxychains is installed.. continuing\e[0m'
else
echo -en '\n'
sudo apt install proxychains && clear
echo -en '\n'
fi
echo -en '\n'
echo $'\e[1;31mProxychains must be configured properly for this script to work!\e[0m'
echo -en '\n'
read -p $'\e[1;31mBrowser?: \e[0m' br
echo -en '\n'
sudo systemctl stop tor &&
sudo service tor start &&
sudo -k | proxychains $br https://www.calligrapher.ai/?ref=upstract.com
