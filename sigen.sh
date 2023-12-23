#!/bin/bash
proxycheck() {
if [ /usr/bin/proxychains ] #proxychains check
then
echo $'\e[1;36mproxychains is installed.. continuing\e[0m'
else
echo -en '\n'
sudo apt install proxychains && clear
echo -en '\n'
fi
}
proxysig() {
echo $'\e[1;31mProxychains must be configured properly for this script to work! \e[0m'
echo -en '\n'
read -p $'\e[1;36mUsername?: \e[0m' user
echo -en '\n'
read -p $'\e[1;36mBrowser?: \e[0m' br
echo -en '\n'
sudo systemctl stop tor &&
sudo service tor start
echo -en '\n'
sudo -u $user proxychains $br https://www.calligrapher.ai/?ref=upstract.com
}
no_prox() {
read -p $'\e[1;36mBrowser?: \e[0m' br
echo -en '\n'
read -p  $'\e[1;36mUsername?: \e[0m' user
echo -en '\n'
sudo -u $user $br https://www.calligrapher.ai/?ref=upstract.com
}
read -p $'\e[1;36mProxychains?(yes/no): \e[0m' chk
echo -en '\n'
if [ "$chk" == "yes" ]; then
proxycheck
proxysig
elif [ "$chk" == "y" ]; then
proxycheck
proxysig
elif [ "$chk" == "ye" ]; then
proxycheck
proxysig
elif [ "$chk" == "Y" ]; then
proxycheck
proxysig
elif [ "$chk" == "YE" ]; then
proxycheck
proxysig
elif [ "$chk" == "YES" ]; then
proxycheck
proxysig
elif [ "$chk" == "n" ]; then
no_prox
elif [ "$chk" == "no" ]; then
no_prox
elif [ "$chk" == "N" ]; then
no_prox
elif [ "$chk" == "NO" ]; then
no_prox
fi
