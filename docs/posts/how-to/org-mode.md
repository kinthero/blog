---
date:
  created: 2025-06-07
categories:
  - how-to
---

# org-mode 基础

org 是一个大纲视图，大纲允许以分层结构组织文档。可以通过折叠只显示一般文档结构和当前正在处理的部分。
使用 <kbd>Tab</kbd> 可以切换折叠和展开，使用 <kbd>Shift-Tab</kbd>可以全局展开和折叠。

## 文档结构

### 标题

```org
* 一级标题
** 二级标题
*** 三级标题
    一些文档内容
*** 三级标题
    其他内容
* 另一个一级标题
```

### 移动快捷键

- <kbd>C-c C-n</kbd> 下一个标题
- <kbd>C-c C-p</kbd> 上一个标题
- <kbd>C-c C-f</kbd> 同级别下一个标题
- <kbd>C-c C-b</kbd> 同级别上一个标题
- <kbd>C-c C-u</kbd> 回到上一级标题

### 结构编辑快捷键

- <kbd>M-RET</kbd> 插入当前级别相同的新标题或者列表行
- <kbd>M-S-RET</kbd> 插入当前级别相同的 TODO 标题或者列表行
- <kbd>TAB</kbd> 在一个新的条目中，可以在合理的级别之间循环，也就是切换标题级别或者列表行缩进
- <kbd>M-LEFT</kbd> 将当前标题提升一个级别
- <kbd>M-RIGHT</kbd> 将当前标题下降一个级别
- <kbd>M-UP</kbd> 向上同级别移动标题内容
- <kbd>M-DOWN</kbd> 向下同级别移动标题内容
- <kbd>C-c C-w</kbd> 将当前级别标题内容移动到其他更高级别下
- <kbd>C-x n s</kbd> 当前缓冲区只显示当前标题级别，进入到 narrow 模式
- <kbd>C-x n w</kbd> 退出 narrow 模式

### 列表

列表可以分成

- 无序列表，以 `-`, `+`, `*` 开头
- 有序列表，以 `1.`, `1)` 开头
- 描述列表，以 `::` 开头

比如

```org
* 列表
  做饭
  1. 买菜
    + 土豆
    + 猪肉
  2. 做饭
  出门要带
  - 钥匙 :: 不然怎么开门
  - 手机 :: 不然怎么买菜
```

快捷键

- <kbd>TAB</kbd> 折叠或者展开列表行
- <kbd>M-RET</kbd> 插入同级别新列表行
- <kbd>M-S-RET</kbd> 插入带有复选框的新列表行
- <kbd>M-UP</kbd> 向上移动列表行
- <kbd>M-DOWN</kbd> 向下移动列表行
- <kbd>M-S-LEFT</kbd> 减少缩进
- <kbd>M-S-RIGHT</kbd> 增加缩进
- <kbd>C-c C-c</kbd> 切换复选框状态
- <kbd>C-c -</kbd> 切换列表符号，如 `-`, `+`, `*` 和 `1.`, `1)`

## 表格

表格基本写法如下

```org
| Name  | Phone | Age |
|-------+-------+-----|
| Peter |  1234 |  17 |
| Anna  |  4321 |  25 |
```

每次表格中按下 <kbd>TAB</kbd>, <kbd>RET</kbd>, <kbd>C-c C-c</kbd> 的时候，表格都会重新对齐。分隔线只需要输入 `|-` 之后，TAB 补全就可以。
更快的是输入 `| Name | Phone | Age` 之后输入快捷键 <kbd>C-c RET</kbd>。

### 快捷键

- <kbd>C-c |</kbd> 将活动区域转换成表，如果没有活动区域，创建一个空的 org 表
- <kbd>C-c C-c</kbd> 重新对齐表格
- <kbd>TAB</kbd> 重新对齐表格，移动到下一个字段，如果有必要，创建新行
- <kbd>S-TAB</kbd> 重新对齐表格，移动到上一个字段
- <kbd>RET</kbd> 重新对齐表格，移动到下一行，如果有必要，创建新行
- <kbd>S-UP</kbd> 向上移动单元格
- <kbd>S-DOWN</kbd> 向下移动单元格
- <kbd>S-LEFT</kbd> 向左移动单元格
- <kbd>S-RIGHT</kbd> 向右移动单元格
- <kbd>M-LEFT</kbd> 向左移动当前列
- <kbd>M-RIGHT</kbd> 向右移动当前列
- <kbd>M-UP</kbd> 向上移动当前行
- <kbd>M-DOWN</kbd> 向下移动当前行
- <kbd>M-S-UP</kbd> 删除当前行
- <kbd>M-S-DOWN</kbd> 在当前行上方插入行
- <kbd>C-c -</kbd> 在当前行下方插入一条水平线
- <kbd>C-c ^</kbd> 对表格进行行排序，基于光标所在的列

## 超链接

基本使用格式

```org
[[链接][描述]]
[[链接]]
```

编写完成之后，会只显示描述，可以使用 <kbd>C-c C-l</kbd> 编辑。

### 内部链接

如果链接看起来不是 URL，那么它在当前文件中是内部链接，比如 `[[my-custom-id]]` , `[[My Target]]`, `[[My Target][Find my Target]]`

### 快捷键

- <kbd>C-c C-l</kbd> 创建或者编辑链接
- <kbd>C-c C-o</kbd> 打开链接

## TODO

基本使用

```org
*** TODO 早睡早起
```

快捷键

- <kbd>C-c C-t</kbd> 切换 TODO 状态
- <kbd>S-LEFT</kbd> 切换 TODO 状态
- <kbd>S-RIGHT</kbd> 切换 TODO 状态
- <kbd>C-c / t</kbd> 查看 TODO 稀疏树
- <kbd>org-agenda t</kbd> 显示全局 TODO 列表
- <kbd>S-M-RET</kbd> 插入新的 TODO

把 TODO 设置多个状态

```lisp
(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "VERYFY" "|" "DONE" "DELEGATED")))
```

设置多个系列的 TODO

```lisp
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")))
```

如果是在单个文件中定义多个系列的 TODO

```org
#+TODO: TODO(t) | DONE(d)
#+TODO: REPORT(r) BUG(b) KNOWNCAUSE(k) | FIXED(f)
#+TODO: | CANCELED(c)
```

### 优先级

基础写法

```org
*** TODO [#A] 学习emacs
```

默认有三个优先级，A 是最高的，B 是默认值，C 是最低的

快捷键

- <kbd>C-c ,</kbd> 设置当前标题的优先级
- <kbd>C-UP</kbd> 增加优先级
- <kbd>C-DOWN</kbd> 降低优先级

### 分解子任务

在标题任意位置插入 `[/]` 或 `[%]` 都可以添加任务进度

```org
* Organize Party [33%]
** TODO Call people [1/2]
*** TODO Peter
*** DONE Sarah
** TODO Buy food
** DONE Talk to neighbor
```

### 复选框

普通列表可以转换成复选框，复选框不包含在全局 TODO 列表中

```org
* TODO Organize party [2/4]
  - [-] call people [1/2]
    - [ ] Peter
    - [X] Sarah
  - [X] order food
```

快捷键

- <kbd>C-c C-c</kbd> 切换复选框状态
- <kbd>C-u C-c C-c</kbd> 切换是否包含复选框
- <kbd>M-S-RET</kbd> 插入带有复选框的新列表行

## 标签

基本写法，可以 `C-c C-c` 添加标签

```org
* my task        :work:urgent:
```

### 标签继承

如果标题具有标签，所有的副标题也会继承标签

```org
* Meeting with the French group      :work:
** Summary by Frank                  :boss:notes:
*** TODO Prepare slides for him      :action:
```

可以定义文件级别的标签

```org
#+FILETAGS:  :Peter:Boss:Secret:
```

### 设置标签

- <kbd>C-c C-c</kbd> 为标题设置标签
- <kbd>C-c C-q</kbd> 为标题设置标签

### 标签搜索

- <kbd>C-c / m</kbd> or <kbd>C-c \</kbd> 创建稀疏树来搜索匹配项，使用 C-u 前缀，只选中 TODO
- <kbd>M-x org-agenda m</kbd> 从所有议程文件创建标记匹配的全局列表
- <kbd>M-x org-agenda m</kbd> 从所有议程文件创建标记匹配的全局列表，但是仅仅选中 TODO

## 属性

快捷键

- <kbd>C-c C-x p</kbd> 设置属性
- <kbd>C-c C-c d</kbd> 删除属性
