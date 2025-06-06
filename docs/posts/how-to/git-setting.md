---
date:
  created: 2025-06-07
categories:
  - how-to
---

# git 配置

## 连接 github

设置用户信息

```shell
git config --global user.name "name"
git config --global user.email "email"
git config --global --list
```

生成密钥

```shell
ssh-keygen -t rsa -b 4096 -C "email"
```

复制公钥，粘贴到 github -> settings -> SSH and GPG keys -> New SSH key

```shell
cat .ssh/id_rsa.pub
```

测试是否可以连接

```shell
ssh -T git@github.com
```

## git 的一些别名

使用命令`git config --global -e`编辑 git 配置文件

```property
[core]
    # 防止中文乱码
    quotepath = false
    editor = nvim

[alias]
    ge = config --global -e
    aa = add --all
    bv = branch -vv
    ba = branch -ra
    bd = branch -d
    ca = commit --amend
    cb = checkout -b
    cm = commit -a --amend -C HEAD
    ci = commit -a -v
    co = checkout
    di = diff
    ll = log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat
    ld = log --pretty=format:"%C(yellow)%h\\ %C(green)%ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short --graph
    ls = log --pretty=format:"%C(green)%h\\ %C(yellow)[%ad]%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative
    mm = merge --no-ff
    st = status --short --branch
    tg = tag -a
    pu = push --tags
    un = reset --hard HEAD
    uh = reset --hard HEAD^
[color]
    diff = auto
    status = auto
    branch = auto
[branch]
    autosetuprebase = always
```
