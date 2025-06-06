---
date:
  created: 2025-06-07
categories:
  - how-to
---

# ubuntu 设置

## 更新

```shell
sudo apt update && sudo apt upgrade -y
```

查看系统版本

```shell
lsb_release -a
```

## 英伟达驱动

英伟达驱动默认是安装了的

```shell
nvidia-smi
```

## 使用 nala 替换 apt

```shell
sudo apt install nala
```

使用方法

```shell
# 安装软件
sudo nala install neofetch htop
# 切换镜像源，可以选择前10个使用
sudo nala fetch
```

## 使用 flatpak

~~删除 snap, [参考](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa0FFSE9yZEY2R1RFWDBjdHBTVTNLSGVoU3FRd3xBQ3Jtc0tsMEFtaUpjbExwcVYtZWktSVc1VFZ6eE5Id3laVmVnT1VnUmthR3AyYl9HLVdzRDMtUzFaLWk1M090cUk5Z2xCUG41MGxqMkc2bThwMmtFRVF1LXV1dFkxbERzRjJiclU0MXp3Znh1YU45MEpBRFRSMA&q=https%3A%2F%2Fkskroyal.com%2Fremove-snap-packages-from-ubuntu%2F&v=vLm2EHIaxOo)~~

安装 [flatpapk](https://flatpak.org/setup/Ubuntu)

```shell
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

## 安装 ollama

```shell
curl -fsSL https://ollama.com/install.sh | sh
```

使用

```shell
ollama run llama3.2
```

## 安装 docker

```shell
sudo nala install docker.io
sudo systemctl enable docker
```

## 终端设置

安装 fish

```shell
# 安装 fish
sudo nala install fish
# 切换默认 shell
chsh -s /usr/bin/fish
```

安装 starship

```shell
curl -sS https://starship.rs/install.sh | sh
vim ~/.config/fish/config.fish
# 添加到打开的文件
starship init fish | source
```

## dock 图标点击时最小化

```shell
# 最小化
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
# 多个窗口会显示预览，一个窗口就最小化
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
```

## 安装常用软件

```shell
sudo nala install flameshot gnome-tweaks eza ripgrep nodejs npm
```

安装 neovim

```shell
sudo snap install --beta nvim --classic
```

安装 grub-customer，添加不上 ppa 的时候使用 -E 参数来使用环境变量中设置的系统代理。

```shell
sudo -E add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install grub-customizer
```
