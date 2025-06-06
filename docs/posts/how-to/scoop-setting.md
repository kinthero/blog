---
date:
  created: 2025-06-07
categories:
  - how-to
---

# scoop 安装配置和常用软件安装

## 安装 [scoop](https://scoop.sh/)

```shell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

## 基础使用

```shell
# 查看命令的帮助
scoop help [scoop命令]
# 查看可安装的软件
scoop search [软件名]
# 安装软件
scoop install [软件名]
# 查看已安装的软件
scoop list
# 更新软件
scoop update [软件名]
# 卸载软件
scoop uninstall [软件名]
# 清理软件
scoop cleanup [软件名]
```

## 添加软件源

```shell
# 查看可以添加的软件源
scoop bucket known
# 添加软件源
scoop bucket add [软件源名]
# 查看已经添加的软件源
scoop bucket list
# 移除软件源
scoop bucket rm [软件源名]
```

## 常用软件

```shell
scoop install 7zip git aria2 sudo `
vim neovim emacs helix `
starship fd ripgrep fzf bat eza zoxide clink wget curl which bottom touch `
alacritty wezterm cmder pwsh nu `
gcc nodejs make openjdk rustup `
obsidian logseq zotero xmind `
sumatrapdf potplayer vlc screentogif rufus qbittorrent trafficmonitor fiddler \
localsend
```

## scoop search 加速

有两个方法加速查找软件，第一种是使用 sqlite 缓存

```shell
scoop config use_sqlite_cache true
```

还有一个办法是使用 scoop-search，安装 scoop-search

```shell
scoop install scoop-search
```

然后在 profile 中添加

```shell
Invoke-Expression (&scoop-search --hook)
```

## 小坑

更新 pwsh

```shell
powershell.exe -Command scoop update pwsh
```
