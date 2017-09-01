<p align="center">
    <img src="https://raw.githubusercontent.com/europ/dotfiles/master/other/ubuntu_logo.png"/>
</p>

# [Ubuntu](https://www.ubuntu.com/) 16.04.3 LTS configuration files

## Packages
#### My
```sh
sudo apt install htop vim vim-gnome unity-tweak-tool mc hexchat openvpn easy-rsa    \
network-manager-openvpn network-manager-openvpn-gnome curl peek git tig gitk gitg   \
cloc traceroute arp-scan
```
#### ManageIQ
```sh
sudo apt install ruby git memcached postgresql libpq-dev bzip2 libffi-dev    \
libreadline-dev libxml2-dev libxslt-dev patch libsqlite-dev libsqlite3-dev   \
nodejs nodejs-legacy npm g++ libcurl4-gnutls-dev cmake libgit2-dev libtool   \
pkg-config libssl1.0-dev
```
#### Python3.6
```sh
sudo add-apt-repository ppa:jonathonf/python-3.6
sudo apt update
sudo apt install python3.6
```
#### Php7.1
```sh
sudo apt install python-software-properties -y
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install -y php7.1
sudo apt install -y php7.1-cgi php7.1-cli php7.1-fpm php7.1-mysql php7.1-mcrypt php7.1-mbstring php7.1-common php7.1-curl php7.1-pgsql php7.1-xml php7.1-zip
```
#### TLP (battery manager)
```sh
sudo add-apt-repository ppa:linrunner/tlp
sudo apt update
sudo apt install tlp tlp-rdw tp-smapi-dkms acpi-call-dkms
sudo tlp start
```
#### PulseAudio Equalizer
```sh
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get install pulseaudio-equalizer
```
#### [NotifyOSD](https://wiki.ubuntu.com/NotifyOSD)
```sh
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update
sudo apt install notifyosdconfig
```
#### [Wire](https://wire.com/en/)
```sh
sudo apt-get install apt-transport-https
sudo apt-key adv --fetch-keys http://wire-app.wire.com/linux/releases.key
echo "deb https://wire-app.wire.com/linux/debian stable main" | sudo tee /etc/apt/sources.list.d/wire-desktop.list
sudo apt-get update
sudo apt-get install wire-desktop
```
#### [Gitter](https://gitter.im/)
[Download](https://gitter.im/apps)
```sh
sudo dpkg -i ${file.deb}
```

---

## Z shell
```sh
sudo apt install zsh git-core fonts-powerline
```
### Zsh - Preview
![Zsh](https://raw.githubusercontent.com/europ/dotfiles/master/other/zsh_preview.png)

---

## VIM - Vi IMproved
```sh
sudo apt-get install vim
```
Move `.vimrc` and `.vim/` to `$HOME/`.
### VIM - Preview
![Vim](https://raw.githubusercontent.com/europ/dotfiles/master/other/vim_preview.png)

---

## [Sublime Text 3](https://www.sublimetext.com/3)
* [Installation](https://www.sublimetext.com/docs/3/linux_repositories.html)
### Sublime Text 3 - [Package Control](https://packagecontrol.io/)
* [Installation](https://packagecontrol.io/installation)
### Sublime Text 3 - Packages
1. Ctrl + Shift + P
2. Write `Package Control: Install Package`
3. Install
    * `Colorsublime`
    * `TrailingSpaces`
    * `SublimeGit`
    * `DoxyDoxygen`
    * `A File Icon`
### Sublime Text 3 - Theme
1. Ctrl + Shift + P
2. Write `Colorsublime: Install Theme`
3. Install `Monokai-Midnight`
### Sublime Text 3 - Line Highlight
1. Preferences -> Settings
2. Edit `Preferences.sublime-settings - User` or `/home/${USER}/.config/sublime-text-3/Packages/User/Preferences.sublime-settings`
3. Add `"highlight_line": true`
### Sublime Text 3 - Highlighted Line Color
1. Open `/home/${USER}/.config/sublime-text-3/Packages/Colorsublime - Themes/Monokai-Midnight.tmTheme`
2. Find `<key>lineHighlight</key>`
3. Change to `<string>#454545</string>`
### Sublime Text 3 - [Side Bar - Dark](https://gist.github.com/umpirsky/5842174)
1. [Download File](https://gist.githubusercontent.com/umpirsky/5842174/raw/1efcc83df0cd338c6c1f54c14b30516e64bc8ff7/Default.sublime-theme)
2. Copy file to `/home/${USER}/.config/sublime-text-3/Packages`
* Black background color `"layer0.tint": [0, 0, 0]`
```
    {
        "class": "sidebar_tree",
        "row_padding": [8, 3],
        "indent": 12,
        "indent_offset": 17,
        "indent_top_level": false,
        "layer0.tint": [0, 0, 0],
        "layer0.opacity": 1.0,
        "dark_content": false
    },
```
* Grey side bar line separator `"layer0.tint": [128, 128, 128]`
```
    {
        "class": "sidebar_container",
        "layer0.tint": [128, 128, 128],
        "layer0.opacity": 1.0,
        "layer0.draw_center": false,
        "layer0.inner_margin": [0, 0, 1, 0],
        "content_margin": [0, 0, 1, 0]
    },
```
* Side bar font size `"font.size": 13`
```
    {
        "class": "sidebar_label",
        "color": [207, 207, 194],
        "font.size": 13
        // , "shadow_color": [250, 250, 250], "shadow_offset": [0, 0]
    },
```
### Sublime Text 3 - Preview
![Sublime Text 3](https://raw.githubusercontent.com/europ/dotfiles/master/other/sublime_preview.png)

---

## [Firefox](https://www.mozilla.org/en-US/firefox/)
* [Installation](https://www.mozilla.org/en-US/firefox/all/)
### Firefox - Custom color page styles
* Install [Stylish](https://addons.mozilla.org/en-US/firefox/addon/stylish/)
* [Download](https://userstyles.org/) styles
* My styles:
    * [GitHub](https://userstyles.org/styles/37035/github-dark)
    * [Wire](https://userstyles.org/styles/145434/monokai-for-wire-com)
    * [Firefox-BlankPage](https://userstyles.org/styles/44928/dark-gray-firefox-about-blank-about-newtab)
    * [Firefox-SearchBar](https://userstyles.org/styles/116570/firefox-dark-url-and-search-bar)
    * [Google-Homepage](https://userstyles.org/styles/118959/darksearch-for-google)
    * [Mozilla-Startpage](https://userstyles.org/styles/97709/dark-mozilla-firefox-start-page)

---

## Time Format

### [How to](http://ubuntuhandbook.org/index.php/2015/12/time-date-format-ubuntu-panel/)
```sh
gsettings set com.canonical.indicator.datetime time-format 'custom'
gsettings set com.canonical.indicator.datetime custom-time-format '%d.%m.%Y     %H:%M:%S'
```
### Time Format - Preview
![Time Format](https://raw.githubusercontent.com/europ/dotfiles/master/other/time_format.png)

---

## [My Weather Indicator](https://launchpad.net/my-weather-indicator)
```sh
sudo add-apt-repository ppa:atareao/atareao
sudo apt-get update
sudo apt-get install my-weather-indicator
```
### My Weather Indicator - Preview
![My_Weather_Indicator](http://ubuntuhandbook.org/wp-content/uploads/2016/04/my-weather-indicator.jpg)

---

## [Markdown](https://en.wikipedia.org/wiki/Markdown)
* [LivePreview](http://tmpvar.com/markdown.html)
* [CheatSheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

---

## How to install .rpm
```sh
sudo apt-get install alien dpkg-dev debhelper build-essential
sudo alien ${file_name}.rpm
sudo dpkg -i ${file_name}.deb
```

---

## Wallpapers
![1](https://raw.githubusercontent.com/europ/dotfiles/master/wallpapers/wallpaper.jpg)
![2](https://raw.githubusercontent.com/europ/dotfiles/master/wallpapers/wallpaper2.jpeg)
![3](https://raw.githubusercontent.com/europ/dotfiles/master/wallpapers/wallpaper3.jpg)
![4](https://raw.githubusercontent.com/europ/dotfiles/master/wallpapers/wallpaper4.jpg)
![5](https://raw.githubusercontent.com/europ/dotfiles/master/wallpapers/wallpaper5.jpg)
