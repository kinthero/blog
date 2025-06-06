---
date:
  created: 2025-06-07
categories:
  - how-to
---

# 深蓝词库使用

这里在 ubuntu 下为自带的输入法添加词库。

首先，下载深蓝转换器，[地址](https://github.com/studyzy/imewlconverter/releases)，然后进入目录。

```bash
# 下载词库
git clone https://github.com/liuhuanyong/DomainWordsDict.git
# 安装dotnet
sudo apt-get update && \
  sudo apt-get install -y aspnetcore-runtime-8.0
# 转换词库
dotnet ImeWlConverterCmd.dll -i:word ./DomainWordsDict/data/*.txt -o:libpy ./output.txt
```

然后在自带输入法的首选项中，找到用户数据，用户词典中找到导入这个 output.txt。
