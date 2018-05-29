#!/bin/sh

if [ `id -u` -ne 0 ]; then
    echo "`tput setaf 1``tput bold`Root privileges required!`tput sgr0`"
    exit 1
fi

echo "`tput setaf 3`PID=$$`tput sgr0`"

apt update
apt upgrade -y

add-apt-repository ppa:linrunner/tlp #R1
add-apt-repository ppa:jonathonf/python-3.6 #R2
add-apt-repository ppa:webupd8team/sublime-text-3 #R3
add-apt-repository ppa:nilarimogard/webupd8 #R4
add-apt-repository ppa:nilarimogard/webupd8 #R5
add-apt-repository ppa:peek-developers/stable #R6
add-apt-repository ppa:ondrej/php #R7

apt update

apt install -f -y tlp tlp-rdw tp-smapi-dkms acpi-call-dkms #R1
apt install -f -y python3.6 #R2
apt install -f -y sublime-text-installer #R3
apt install -f -y pulseaudio-equalizer #R4
apt install -f -y notifyosdconfig #R5
apt install -f -y peek #R6
apt install -f -y php7.1 php7.1-cgi php7.1-cli php7.1-fpm php7.1-mysql php7.1-mcrypt php7.1-mbstring php7.1-common php7.1-pgsql php7.1-xml php7.1-zip #R7

# Other
apt install -f -y                                         \
    vim git git-core tig htop curl cloc tree mc nmon zsh  \
    traceroute arp-scan unity-tweak-tool openvpn easy-rsa \
    fonts-powerline python-software-properties apt-transport-https

# SKYPE
apt install apt-transport-https -y
curl https://repo.skype.com/data/SKYPE-GPG-KEY | apt-key add -
echo "deb https://repo.skype.com/deb stable main" | tee /etc/apt/sources.list.d/skypeforlinux.list
apt update 
apt install skypeforlinux -y

# WIRE
sudo apt-key adv --fetch-keys http://wire-app.wire.com/linux/releases.key
echo "deb https://wire-app.wire.com/linux/debian stable main" | sudo tee /etc/apt/sources.list.d/wire-desktop.list
sudo apt-get update
sudo apt-get install wire-desktop

# GITTER
wget -O gitter_amd64.deb https://update.gitter.im/linux64/latest
dpkg -i gitter_amd64.deb
rm -f gitter_amd64.deb

# Linux / Windows dual boot
timedatectl set-local-rtc 1

# Time customization
gsettings set com.canonical.indicator.datetime time-format 'custom'
gsettings set com.canonical.indicator.datetime custom-time-format '%d.%m.%Y     %H:%M:%S'

# copy hidden files
cp -r `ls -d .* | grep -v ^.git$` ~/

echo "`tput setaf 2``tput bold`Please, reboot.`tput sgr0`"
exit 0
