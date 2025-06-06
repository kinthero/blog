---
date:
  created: 2025-06-07
categories:
  - how-to
---

# doom-emacs

## doom emacs 安装

```shell
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
```

同步一下

```shell
~/.config/emacs/bin/doom sync
```

把 doom 添加到路径，在 `~/.bashrc` 中添加

```shell
export PATH="$PATH:~/.config/emacs/bin"
```

解决字体问题，<kbd>M-x nerd-icons-install-fonts</kbd>
