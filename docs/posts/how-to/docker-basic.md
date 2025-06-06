---
date:
  created: 2025-06-07
categories:
  - how-to
---

# docker 基础

## 基本概念

- 镜像是将一些工具环境的打包
- 容器是镜像的实例化

## Docker 仓库

- [Docker hub](https://www.hub.docker.com)

## Dockerfile

Dockerfile 可以用来创建镜像，文件名叫做 Dockerfile。

DockerFile 关键指令

- FROM：制定基础镜像，所有镜像都基于一个基础镜像
- RUN：在镜像构建的过程中执行命令（如安装依赖）
- COPY/ADD：将文件从主机复制到镜像中
- WORKDIR：设置容器内的工作目录
- ENV：设置环境变量
- EXPOSE：声明容器开放的端口
- CMD/ENTRYPOINT：指定容器启动时的默认命令

## Docker Compose

可以管理多个容器环境。
