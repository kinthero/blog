---
date:
  created: 2025-06-07
categories:
  - how-to
---

# zed 编辑器

[zed](https://zed.dev/) 是一个据说更加现代化的编辑器，稍微看看如何。

## 安装

使用下面的命令在 linux 安装

```bash
curl -f https://zed.dev/install.sh | sh
```

## 使用

Zed 感觉开箱即用，甚至直接可以让我使用 vim Mode，也可以配置按键风格，我就选择 vscode 看看。
主题也是一开始就可以设置的。
第一眼的感觉是非常精简的，看起来比 vscode 最开始的界面更加精简，可以是因为菜单栏被藏起来了。
它也类似于 vscode，可以 <kbd>Ctrl-,</kbd> 开始配置设置文件，同样也是一个 json 文件，编辑体验和 vscode 是比较像的。
比较贴心的是它在注释里面还告诉了我们配置文件信息的[网址](https://zed.dev/docs/configuring-zed)。
下面是我简单的配置文件。

```json
{
  "vim_mode": true,
  "relative_line_numbers": true,
  "telemetry": {
    "metrics": false,
    "diagnostics": false
  },
  "ui_font_size": 16,
  "buffer_font_size": 16,
  "theme": {
    "mode": "system",
    "light": "Ayu Mirage",
    "dark": "One Dark"
  },
  "scrollbar": {
    "show": "never"
  },
  "tab_bar": { "show_nav_history_buttons": false },
  "toolbar": { "breadcrumbs": false, "quick_actions": false },
  "git": {
    "git_gutter": "hide",
    "inline_blame": { "enabled": false }
  },
  "terminal": { "toolbar": { "breadcrumbs": false } },
  "indent_guides": { "show": "never" },
  "gutter": {
    "code_actions": false,
    "folds": false,
    "runnables": false
  }
}
```

Zed 默认有很多好用的功能，比如保存的时候自动格式化之类的。
还有 REPL，看起来听不错的。
