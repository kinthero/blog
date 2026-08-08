# 博客工作流

## 写作

创建文章：

```bash
hugo new content posts/title.md
```

本地预览：

```bash
make
```

`make` 默认执行：

```bash
hugo server
```

---

## Git 工作流

本仓库使用 `dev` 作为日常工作分支，`main` 用于发布。

正常情况下，只需要：

```bash
make sync
```

`make sync` 会自动完成：

1. 检查当前是否位于 `dev`
2. 自动保存当前修改
3. 更新本地 `main`
4. 将 `dev` rebase 到最新的 `main`
5. 将 `dev` 合并到 `main`
6. 推送到 GitHub
7. 返回 `dev`

因此，日常写完文章后不需要手动执行 `git add`、`git commit`、`git pull` 或 `git push`。

### 提交

`make sync` 自动保存时使用通用的 commit message：

```text
update blog
```

如果需要添加特定的 commit message，可以手动提交：

```bash
git add .
git commit -m "your message"
```

然后继续使用：

```bash
make sync
```

### 冲突处理

如果 `make sync` 在 rebase 时发生冲突，命令会停止。

首先查看状态：

```bash
git status
```

手动修改冲突文件，然后：

```bash
git add .
```

继续同步：

```bash
make continue
```

如果仍然存在冲突，继续解决冲突并执行：

```bash
git add .
make continue
```

直到 rebase 完成。

`make continue` 完成后会自动将 `dev` 发布到 `main` 并推送到 GitHub。

---

## 常用命令

查看 Git 状态：

```bash
make status
```

本地预览：

```bash
make
```

或者：

```bash
make serve
```

同步并发布：

```bash
make sync
```

继续处理冲突：

```bash
make continue
```

本地构建测试：

```bash
make build
```

清理构建文件：

```bash
make clean
```

---

## 新电脑初始化

在新电脑上第一次使用本仓库时，先克隆仓库：

```bash
git clone git@github.com:kinthero/blog.git
cd blog
```

确认远程仓库：

```bash
git remote -v
```

确认 `main` 是最新状态：

```bash
git switch main
git pull --ff-only
```

创建并切换到 `dev`：

```bash
git switch -c dev
```

之后日常工作都在 `dev` 分支进行。

检查：

```bash
git status
```

应该显示当前位于：

```text
On branch dev
```

之后正常使用：

```bash
make
make sync
```

即可。

---

## Hugo 主题

本博客使用 Hugo Modules 管理主题。

更新主题：

```bash
hugo mod get -u
```

查看依赖：

```bash
hugo mod graph
```

---

## 部署

博客使用 GitHub Actions 自动部署到 GitHub Pages。

将修改推送到 `main` 后，GitHub Actions 会自动构建 Hugo 网站并部署。

