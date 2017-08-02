# [Ubuntu](https://www.ubuntu.com/) 16.04.2 LTS configuration files
## Z shell
Run:
```sh
sudo apt install zsh git-core fonts-powerline
```
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
### Sublime Text 3 - Theme
1. Ctrl + Shift + P
2. Write `Colorsublime: Install Theme`
3. Write `Monokai-Midnight`
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
## [Markdown](https://en.wikipedia.org/wiki/Markdown)
* [LivePreview](http://tmpvar.com/markdown.html)
* [CheatSheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
