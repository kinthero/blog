---
title: 使用 Hugo 写博客发布到 GitHub Pages
date: 2025-08-07
---

## 安装 hugo
```bash
sudo snap install hugo
```

## 创建本地项目

```bash
hugo new site blog
cd blog
git init
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
echo "theme = 'ananke'" >> hugo.toml
```

## 写第一篇博客
```bash
hugo new posts/my-first-post.md
```

输入内容

```markdown
---
title: "My First Post"
date: 2025-08-07
draft: True
---

# First Post

Hi, this is my first post.

$$
E = mc^2
$$
```

## 查看博客

```bash
hugo server -D
```
这里的 `-D` 是包含草稿内容
打开 [http://localhost:1313](http://localhost:1313)就可以访问了

## 创建github项目

打开 [github](https://www.github.com)，进入个人页面，创建 new repository。输入 仓库名称 repository name，然后创建库 create repository。

## 连接到远程仓库

```bash
git add .
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:username/blog.git
git push -u origin main
```


## 设置GitHub Pages 发布源

1. 打开仓库 `blog`
2. 点击右上角的 Settings -> 左侧点击 Pages
3. 找到 **Build and deployment** 区域，设置：
	- Source: Deploy from a branch
	- Branch: main
	- Folder: docs

保存之后，就可以访问，`https://youname.github.io/blog/` 。

## 后续发布

创建 Makefile，后面写完了只需要运行 make 就可以了

```bash
.PHONY: build deploy clean

default: deploy

build:
	hugo -d docs

deploy: build
	git add .
	git commit -m "🚀 auto deploy"
	git push

clean:
	rm -rf docs/
```





