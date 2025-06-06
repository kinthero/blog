---
date:
  created: 2025-06-07
categories:
  - llm
tags:
  - llm
  - ai
  - deepseek
---

# deepseek 简单测试

使用的是 uv, 只需要运行 `uv run test.py` 就可以

```python
# /// script
# requires-python = ">=3.10"
# dependencies = [
#     "torch",
#     "transformers",
# ]
# ///

# Use a pipeline as a high-level helper
from transformers import pipeline

messages = [
    {"role": "user", "content": "Who are you?"},
]
pipe = pipeline("text-generation", model="deepseek-ai/DeepSeek-R1-Distill-Qwen-7B")
pipe(messages)
```

国内可以使用清华镜像加速一下下载安装包的速度

```shell
export UV_DEFAULT_INDEX="https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple"
```
