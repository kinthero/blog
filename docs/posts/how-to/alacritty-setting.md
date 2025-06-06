---
date:
  created: 2025-06-07
categories:
  - how-to
---

# alacritty 设置

配置文件

```toml
live_config_reload = true

[shell]
program = "ubuntu"

[window]
# dimensions = {columns = 100, lines = 40}
position = { x = 400, y = 300}
padding = { x = 8, y = 0}
startup_mode = "Fullscreen"
decorations = "Full"
title = "ubuntu"
dynamic_title = false
opacity = 0.8


[scrolling]
history = 10000
multiplier = 3

[font]
normal = { family = "Hack Nerd Font Mono", style = "Regular" }
size = 12
builtin_box_drawing = true

[mouse]
hide_when_typing = true
```
