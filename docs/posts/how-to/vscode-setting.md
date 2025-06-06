---
date:
  created: 2025-06-07
categories:
  - how-to
---

# vscode 配置

本文主要涉及 vscode 的 vim 配置和 python 配置

## 完整的 vim 配置

<details>
<summary>settings.json</summary>

```json
// vim settings
"vim.leader": "<Space>",
"vim.useSystemClipboard": true,
"vim.foldfix": true,
"vim.hlsearch": true,
"vim.shell": "C:\\Users\\kilos\\scoop\\apps\\git\\current\\git-bash.exe",
"vim.autoSwitchInputMethod.enable": true,
"vim.autoSwitchInputMethod.defaultIM": "1033",
"vim.autoSwitchInputMethod.obtainIMCmd": "C:\\Users\\kilos\\app\\im-select.exe",
"vim.autoSwitchInputMethod.switchIMCmd": "C:\\Users\\kilos\\app\\im-select.exe {im}",
"vim.handleKeys": {
  "<C-k>": false,
  "<C-b>": false,
  "<C-j>": false,
  "<C-s>": false
},
"vim.insertModeKeyBindingsNonRecursive": [
  {
    "before": ["j", "k"],
    "after": ["<Esc>"]
  }
],
"vim.normalModeKeyBindingsNonRecursive": [
  // functional
  {
    // execute python file
    "before": ["<leader>", "c", "e"],
    "commands": ["python.execInDedicatedTerminal"]
  },
  // personal habit
  {
    // reundo
    "before": ["U"],
    "commands": ["<C-r>"],
  },
  {
    // split line, correspond to J for join line
    "before": ["K"],
    "commands": ["lineBreakInsert"],
    "silent": true
  },
  {
    // save file
    "before": ["<leader>", "w"],
    "commands": ["workbench.action.files.save"]
  },
  {
    // close file
    "before": ["<leader>", "q"],
    "commands": ["workbench.action.closeActiveEditor"]
  },
  {
    // no highlight
    "before": ["<leader>", "/"],
    "commands": [":noh"]
  },
  // group control
  {
    // move to left group
    "before": ["<C-h>"],
    "after": ["<C-w>", "h"]
  },
  {
    // move to right group
    "before": ["<C-l>"],
    "after": ["<C-w>", "l"]
  },
  // useful setting
  {
    // show command line
    "before": ["<leader>", "p"],
    "commands": ["workbench.action.showCommands"]
  },
  {
    // go to file
    "before": ["<leader>", "f"],
    "commands": ["workbench.action.quickOpen"]
  },
  {
    // go to buffer
    "before": ["<leader>", "b"],
    "commands": ["workbench.action.showAllEditors"]
  },
  {
    // go to symbol
    "before": ["<leader>", "o"],
    "commands": ["workbench.action.gotoSymbol"]
  }
],
```

</details>

## python 配置

需要安装的插件：

- ms-python.python
- ms-python.black-formatter
- ms-python.autopep8
- charliermarsh.ruff

安装插件的方法：

- 按住`ctrl+p`
- 输入`ext install 插件名`
- 回车

打开 vscode 的`settings.json`文件，可以直接输入`ctrl+shift+p`查找，添加下面的配置
实现的功能是：

- 使用 black-formatter 进行格式化，也可以设置为 autopep8
- 代码保存的时候自动格式化
- 基于 ruff 实现一些修复

```json
"[python]": {
"editor.defaultFormatter": "ms-python.black-formatter",
"editor.formatOnSave": true,
"editor.codeActionsOnSave": {
  "source.fixAll": true
},
}
```

### vim 配置

需要安装的插件`vscodevim.vim`有需要可以安装`vintharas.learn-vim`学习一下。

在`keybindings.json`中添加这个，输入`:`命令的时候，会在在上面以命令面板的方式显示

```json
{
"key": "shift+;",
"command": "vim.showQuickpickCmdLine",
"when": "editorTextFocus && vim.mode != 'Insert'"
},
```

vim 中有一些插件功能可以开启，在`settings.json`开启的部分功能如下：

- 将 leader 按键设为空格，默认为`\`
- 使用系统剪切板
- 解决 jk 移动的时候折叠的代码自动展开的问题
- 查找结果保持高亮

```json
{
"vim.leader": "<space>",
"vim.useSystemClipboard": true,
"vim.foldfix": true,
"vim.hlsearch": true,
},
```

vim 的案件配置有几种

- vim.insertModeKeyBindings - 插入模式按键绑定
- vim.normalModeKeyBindings - 普通模式按键绑定
- vim.visualModeKeyBindings - 视图模式按键绑定
- vim.operatorPendingModeKeyBindings - 算子模式按键绑定
  以及非递归形式，就是防止 i 改成 j，j 改成 i 这种情况后出现 ijijij 递归执行的情况
- vim.insertModeKeyBindingsNonRecursive
- normalModeKeyBindingsNonRecursive
- visualModeKeyBindingsNonRecursive
- operatorPendingModeKeyBindingsNonRecursive

首先配置插入模式下退出的按键，将`jk`改成退出插入模式

```json
"vim.insertModeKeyBindingsNonRecursive": [
{
"before": [
  "j",
  "k"
],
"after": [
  "<ESC>"
]
}
],
```

后面的配置都是在`vim.normalModeKeyBindingsNonRecursive`设置的，
更改一些按键习惯，让使用更加舒适

```json
{
// reundo
"before": ["U"],
"commands": ["<C-r>"],
},
{
// split line, correspond to J for join line
"before": ["K"],
"commands": ["lineBreakInsert"],
"silent": true
},
  {
// save file
"before": ["<leader>", "w"],
"commands": ["workbench.action.files.save"]
},
{
// close file
"before": ["<leader>", "q"],
"commands": ["workbench.action.closeActiveEditor"]
},
{
// no highlight
"before": ["<leader>", "/"],
"commands": [":noh"]
},
```

文件跳转和命令面板等功能

- 打开命令行
- 打开文件
- 打开 buffer
- 跳到函数

```json
{
// show command line
"before": ["<leader>", "p"],
"commands": ["workbench.action.showCommands"]
},
{
// go to file
"before": ["<leader>", "f"],
"commands": ["workbench.action.quickOpen"]
},
{
// go to buffer
"before": ["<leader>", "b"],
"commands": ["workbench.action.showAllEditors"]
},
{
// go to symbol
"before": ["<leader>", "o"],
"commands": ["workbench.action.gotoSymbol"]
}
```

窗格跳转，实现窗格的左右跳转，因为我不用上下，

- 命令行面板使用 ctrl+j
- 左边活动栏使用 ctrl+b

```json
{
// move to left group
"before": ["<C-h>"],
"after": ["<C-w>", "h"]
},
{
// move to right group
"before": ["<C-l>"],
"after": ["<C-w>", "l"]
},
```
