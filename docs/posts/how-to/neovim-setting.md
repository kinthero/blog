---
date:
  created: 2025-06-07
categories:
  - how-to
---

# neovim 配置

直接安装 [lazyvim](https://www.lazyvim.org)，使用 <kbd>Leader f c</kbd> 可以打开配置文件。

## Config

在 Config 目录下，编辑下面的文件

keymaps.lua

```lua
vim.keymap.set("i", "jk", "<esc>", { silent = true })
```

autocmd.lua

```lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = false
  end,
})
```

## Plugin

在 plugins 目录下，创建写入下面的文件。

pangu.lua

```lua
return {
  "hotoo/pangu.vim",
  ft = { "markdown", "vimwiki", "text" }, -- 仅在这些文件类型下加载
  config = function()
    vim.g.pangu_rule_date = 1
  end,
}
```

theme.lua

```lua
return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
}
```

## 其他

- <kbd>Leader c m</kbd> 安装 prettier，配置格式化工具
