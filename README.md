# [Ubuntu](https://www.ubuntu.com/) 16.04.2 LTS configuration files
## Packages
My:
```sh
sudo apt install htop vim vim-gnome git mc hexchat openvpn easy-rsa network-manager-openvpn network-manager-openvpn-gnome npm curl peek
```

ManageIQ stuff:
```sh
sudo apt install ruby git memcached postgresql libpq-dev bzip2 libffi-dev libreadline-dev libxml2-dev libxslt-dev patch libsqlite-dev libsqlite3-dev nodejs nodejs-legacy npm g++ libcurl4-gnutls-dev cmake libgit2-dev pkg-config libtool libssl1.0-dev 
```

---

## Z shell
```sh
sudo apt install zsh git-core fonts-powerline
```

---

## [Sublime Text 3](https://www.sublimetext.com/3)
* [Installation](https://www.sublimetext.com/docs/3/linux_repositories.html)
### Sublime Text 3 - Package Control
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
![Sublime Text 3](https://github.com/europ/dotfiles/blob/master/sublime_text_3/Sublime_preview.png)

---

## [Markdown](https://en.wikipedia.org/wiki/Markdown)
* [LivePreview](http://tmpvar.com/markdown.html)
* [CheatSheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
