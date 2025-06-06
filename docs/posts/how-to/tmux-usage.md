---
date:
  created: 2025-06-07
categories:
  - how-to
---

# tmux 基础使用

## 安装 tmux

```bash
sudo apt-get install tmux
```

## 启动和退出

```bash
# 进入 tmux
tmux
# 退出 tmux
exit
```

## prefix 键与帮助

tmux 使用大量快捷键操作窗口和 pane，prefix 键是所有快捷键唤醒按键。帮助的快捷键是 <kbd>Ctrl+b ?</kbd>。
如果想单独查看某个快捷键的效果，可以使用 <kbd>Ctrl+b /</kbd>，然后输入快捷键，这个时候不需要再输入 prefix 键。
如果想要输入 <kbd>Ctrl+b</kbd> 按键的话，输入两次就可以了。

## 会话 (session) 命令

使用 <kbd>d</kbd> 分离会话，也就是暂时退出了 tmux，但是会话还是存在的。这个时候可以直接 `tmux attach` 重新连接上会话

## 窗口命令

- <kbd>c</kbd> 创建新窗口
- <kbd>p</kbd> 上一个窗口
- <kbd>n</kbd> 下一个窗口
- <kbd>w</kbd> 选择窗口，可以使用 `jk` 选择
- <kbd><number\></number></kbd> 切换到指定编号的窗口
- <kbd>&</kbd> 关闭窗口
- <kbd>,</kbd> 重命令当前窗口
- <kbd>l</kbd> 上一个打开的窗口

## 窗格 (pane) 命令

- <kbd>%</kbd> 左右拆分窗格
- <kbd>"</kbd> 上下拆分窗格
- <kbd>o</kbd> 光标移动到下一个窗格
- <kbd>;</kbd> 光标移动到上一个窗格
- <kbd>Ctrl+o</kbd> 窗格轮换，只有两个就是互相交换的效果
- <kbd>x</kbd> 关闭当前窗格，有提醒
- <kbd>!</kbd> 把当前窗格拆分到独立窗口
- <kbd>z</kbd> 全屏显示当前窗格
- <kbd>q</kbd> 显示窗格编号
- <kbd>Ctrl + <arrow key\></kbd> 调整窗格大小

## 其他

- <kbd>:</kbd> 用来输入 tmux 的命令，实现其他快捷键的功能
- <kbd>i</kbd> 查看窗口信息
- <kbd>t</kbd> 显示时间
- <kbd>r</kbd> 重绘窗口
