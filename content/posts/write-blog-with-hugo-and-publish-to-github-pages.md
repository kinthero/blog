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
3. 找到 **Build and deployment** 区域，选择 `GitHub Actions`

编辑 hugo.toml，添加

```toml
[caches]
  [caches.images]
    dir = ':cacheDir/images'
```

添加github workflow文件

```bash
mkdir -p .github/workflows
touch .github/workflows/hugo.yaml
```

在 `.github/workflows/hugo.yaml` 中写入

```yaml
# Sample workflow for building and deploying a Hugo site to GitHub Pages
name: Deploy Hugo site to Pages

on:
  # Runs on pushes targeting the default branch
  push:
    branches:
      - main

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# Sets permissions of the GITHUB_TOKEN to allow deployment to GitHub Pages
permissions:
  contents: read
  pages: write
  id-token: write

# Allow only one concurrent deployment, skipping runs queued between the run in-progress and latest queued.
# However, do NOT cancel in-progress runs as we want to allow these production deployments to complete.
concurrency:
  group: "pages"
  cancel-in-progress: false

# Default to bash
defaults:
  run:
    # GitHub-hosted runners automatically enable `set -eo pipefail` for Bash shells.
    shell: bash

jobs:
  # Build job
  build:
    runs-on: ubuntu-latest
    env:
      DART_SASS_VERSION: 1.89.2
      HUGO_VERSION: 0.148.0
      HUGO_ENVIRONMENT: production
      TZ: America/Los_Angeles
    steps:
      - name: Install Hugo CLI
        run: |
          wget -O ${{ runner.temp }}/hugo.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb
          sudo dpkg -i ${{ runner.temp }}/hugo.deb
      - name: Install Dart Sass
        run: |
          wget -O ${{ runner.temp }}/dart-sass.tar.gz https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz
          tar -xf ${{ runner.temp }}/dart-sass.tar.gz --directory ${{ runner.temp }}
          mv ${{ runner.temp }}/dart-sass/ /usr/local/bin
          echo "/usr/local/bin/dart-sass" >> $GITHUB_PATH
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: recursive
          fetch-depth: 0
      - name: Setup Pages
        id: pages
        uses: actions/configure-pages@v5
      - name: Install Node.js dependencies
        run: "[[ -f package-lock.json || -f npm-shrinkwrap.json ]] && npm ci || true"
      - name: Cache Restore
        id: cache-restore
        uses: actions/cache/restore@v4
        with:
          path: |
            ${{ runner.temp }}/hugo_cache
          key: hugo-${{ github.run_id }}
          restore-keys:
            hugo-
      - name: Configure Git
        run: git config core.quotepath false
      - name: Build with Hugo
        run: |
          hugo \
            --gc \
            --minify \
            --baseURL "${{ steps.pages.outputs.base_url }}/" \
            --cacheDir "${{ runner.temp }}/hugo_cache"
      - name: Cache Save
        id: cache-save
        uses: actions/cache/save@v4
        with:
          path: |
            ${{ runner.temp }}/hugo_cache
          key: ${{ steps.cache-restore.outputs.cache-primary-key }}
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./public

  # Deployment job
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

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
