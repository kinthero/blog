---
date:
  created: 2025-06-07
categories:
  - how-to
---

# python 环境配置

本文只讲 windows 的 python 环境配置

## 安装 python(旧的方法)

安装 python 的方法有很多，目前个人比较喜欢用 scoop 安装 python，主要原因有以下几点：

- 方便的切换不同版本的 python
- 占用空间小，相比较于 conda

scoop 安装和切换 python 命令

```powershell
# 添加其他版本的python的仓库
scoop bucket add versions
# 查看可以安装的python版本
scoop bucket search python
# 安装某个版本的python
scoop install python310
# 安装较新版本的python
scoop install python
# 切换python的版本
scoop reset python310
```

## 安装 python(新)

经常会写很多小测试 demo，如果每次都创建一个虚拟环境的话，会浪费很多磁盘空间。所以还是有个 conda 环境好点。最近发现一个新的 conda 发行版：miniforge。比 miniconda 相对大一点，但是默认包含的包也多一点。
从[项目地址](https://github.com/conda-forge/miniforge)下载对应的安装包进行安装就可以。

在 windows 上安装完成了之后，会发现只有 cmd 的命令行版本，打开`Miniforge Prompt`，然后运行

```shell
conda init powershell
```

然后用下面的配置加速一下 conda，但是好像现在默认就是 libmamba，可以不用设置可以先查看一下。

```shell
conda config --show solver
conda config --set solver libmamba
```

conda 环境管理

```shell
# 创建环境
conda create -n [env_name] python=x.xx
# 激活环境
conda activate [env_name]
# 退出环境
conda deactivate
# 删除环境
conda remove -n [env_name] --all
```

## 虚拟环境管理

目前感觉速度最快的 python 环境管理工具是 [uv](https://github.com/astral-sh/uv)

安装 uv，这里使用 powershell 安装，后面提到的 pipx 也可以安装，但是好像不能自我更新

```powershell
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
```

基本使用

```powershell
# 创建虚拟环境
uv venv
# 激活虚拟环境
.venv\Scripts\Activate
# 安装包
uv pip install mkdocs-material -i https://pypi.tuna.tsinghua.edu.cn/simple
# 推出虚拟环境
deactivate
```

常用功能

```powershell
# 导出requirements文件
uv pip freeze | uv pip compile - -o requirements.txt
# 同步requirements文件
uv pip sync requirements.txt
```

为了方便使用，在 powershell 中添加命令别名，powershell 中执行`code $profile`添加以下命令：

```powershell
New-Alias -Name av -Value '.\.venv\Scripts\Activate.ps1'
New-Alias -Name dav -Value 'deactivate'
```

之后，`av`启动虚拟环境，`dav`退出虚拟环境

uv 使用清华镜像

临时使用可以这样子

```shell
ux add --default-index https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple requests
```

也可以设置环境变量，添加到 `.bashrc` 文件中

```shell
export UV_DEFAULT_INDEX="https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple"
```

## 安装 python 工具

有一些 python 写的工具需要使用，比如 ruff，mypy 等，或者是 UV，这里 使用 pipx 进行安装。pipx 安装后每个程序都是独立的虚拟环境中运行，很好的实现隔离，方便调用

这里使用 scoop 安装 [pipx](https://github.com/pypa/pipx)

```powershell
scoop install pipx
```

使用 pipx 安装一些常用的工具

```powershell
pipx install ruff
pipx install mypy
pipx install cowsay
```
