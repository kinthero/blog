# Blog Workflow

## Writing

创建文章：

```bash
hugo new content posts/title.md
```

本地预览：

```bash
make serve
```

发布：

```bash
make
```

`make` 会自动执行：

```bash
git add .
git commit -m "update blog"
git push
```

提交后 GitHub Actions 会自动构建 Hugo 并部署到 GitHub Pages。

---

## Theme

本博客使用 Hugo Modules 管理主题。

更新主题：

```bash
hugo mod get -u
```

查看依赖：

```bash
hugo mod graph
```

