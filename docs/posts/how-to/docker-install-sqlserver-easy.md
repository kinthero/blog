---
date:
  created: 2025-06-07
categories:
  - how-to
---

# docker 安装 sqlserver 简易版

## TLDR

使用下面的命令

```shell
sqlcmd create mssql --accept-eula --name mssql
```

## 安装

首先需要 docker 已经安装，现在先安装 sqlcmd

```shell
winget install sqlcmd
```

sqlcmd 可以直接创建 sqlserver 容器，查看可选项

```shell
sqlcmd create mssql --help
# 查看可以安装的版本
sqlcmd create mssql get-tags
```

安装 sqlserver 2022 并且创建实例，然后还原 Wide World Importers 实例，可以不还原。

```shell
sqlcmd create mssql --accept-eula --tag 2022-latest --using https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Full.bak
```

我不想放数据，就执行了

```shell
sqlcmd create mssql --accept-eula --name mssql --hostname dog --port 1433
```

参数解释：

- --accept-eula：同意一些协议，需要
- --name：容器的名称，方便后面管理容器

使用

```shell
sqlcmd query
```

可以安装一个 azure data studio，然后在命令行中打开

```shell
sqlcmd open ads
```

如果不需要容器了，就可以删除

```shell
sqlcmd delete
```

如果想从其他工具连接，可以使用下面的命令找到连接信息

```shell
sqlcmd config connection-strings
```

## 后续使用

启动容器

```shell
docker start mssql
```

开始编辑可以使用下面的命令，或者自己已经连接的其他工具

```shell
sqlcmd open ads
```

参考：

- [sqlcmd - 使用 sqlcmd 实用工具 - SQL Server | Microsoft Learn](https://learn.microsoft.com/zh-cn/sql/tools/sqlcmd/sqlcmd-use-utility?view=sql-server-ver16#create-and-query-a-sql-server-container)
