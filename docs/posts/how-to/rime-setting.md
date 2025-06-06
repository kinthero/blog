---
date:
  created: 2025-06-07
categories:
  - how-to
---

# rime 输入法配置

## 安装

在官网可以下载安装 [rime](https://rime.im/download/)。

ubuntu 安装 rime

```bash
sudo apt-get install ibus-rime
# 安装双拼
sudo apt-get install librime-data-double-pinyin
```

## 配置

rime 有两种配置文件需要注意。

- `*.schema.yaml`: 这是输入法文件，可以理解成默认配置
- `*.custom.yaml`，这是配置文件，用来覆盖默认配置，覆盖的时候一定要有 patch 开头表示替换

这里我需要配置小鹤双拼输入法，默认的配置文件是 `double_pinyin_flypy.schema.yaml`，现在创建一个文件用来修改默认配置：`double_pinyin_flypy.custom.yaml`。

```yaml
patch:
  switches:
    - name: ascii_mode
      reset: 0
      states: [中文, 西文]
    - name: full_shape
      states: [半角, 全角]
    - name: simplification
      reset: 1
      states: [漢字, 汉字]
    - name: ascii_punct
      states: [。，, ．，]

  # 输入双拼码的时候不转化为全拼码
  translator/preedit_format: {}

  ascii_composer:
    switch_key:
      Shift_L: commit_code
      Shift_R: commit_code

  # 使用 / 希腊字母，数学符号，特殊符号等
  punctuator/import_preset: symbols
  recognizer/patterns/punct: "^/([A-Z|a-z]*|[0-9]|10)$"
```

但是现在还是不可以直接使用的，因为现在小鹤输入法还没有添加到输入法列表，`default.yaml` 就是用来配置这个的，通用我们应该用 `default.custom.yaml` 来进行覆盖

```yaml
patch:
  schema_list:
    - schema: double_pinyin_flypy

  menu:
    page_size: 9
```

还有一个 `ibus-rime.yaml` 文件，可以修改一些样式

```yaml
# ibus-rime configuration

config_version: "1.0"

style:
  # candidate list orientation (false|true).
  horizontal: true

  # embed preedit text in the input field (false|true).
  inline_preedit: true

  # `preedit_style` specifies what to display as inline preedit text.
  # display inline the input under conversion.
  preedit_style: composition
  # preview the converted text.
  # preedit_style: preview

  # `cursor_type` specifies where the inline cursor is located.
  # inline cursor is at the insertion point.
  cursor_type: insert
  # inline cursor is at the beginning of text under conversion.
  # cursor_type: select

  # built-in color schemes for highlighting the portion of inline preedit text
  # that needs focus. (null|aqua|azure|ink|luna)
  # by default highlighting color is not used.
  color_scheme: ~
  # color_scheme: aqua
```
