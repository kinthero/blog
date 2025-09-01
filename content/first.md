+++
title="first blog"
date = 2025-09-01
[taxonomies]
tags = ["markdown", "zola"]

[extra]
mermaid = true
+++

# 测试博客功能

这是第一个博客，用来测试各个功能是否正常

## 基础

*斜体* **粗体** `行内引用`

这是[github](https://github.com)的链接，这是另一个链接[github][github]，还是一个链接[github]

这是一个脚注[^1]


下面是一个随机的图片

![图片](https://picsum.photos/300/200)

> 这是一段引用

## 列表

- Apple
  1. aaa
  2. bbb
- Orange
- Banana
  - bbb
  - nana
  
## 表格

|name|age|
|--|--|
|Bob|27|
|Alice|23|

## 代码

```python
for i in range(10):
    print("hello")
```

## 公式

$$
E = m c^2
$$

## mermaid 


```mermaid
graph TD;
A-->B;
A-->C;
B-->D;
C-->D;
```


[github]: https://github.com
[^1]: 这是脚注内容
