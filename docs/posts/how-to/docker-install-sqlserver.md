---
date:
  created: 2025-06-07
categories:
  - how-to
---

# docker 安装 sqlserver

## 安装

拉取 sqlserver 镜像

```shell
docker pull mcr.microsoft.com/mssql/server:2022-latest
```

运行容器，将`MSSQL_SA_PASSWORDS`设置自己的密码

```shell
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Kilos.123" -p 1433:1433 --name sql1 --hostname sql1 -d mcr.microsoft.com/mssql/server:2022-latest
```

参数解释：

- -e "ACCEPT_EULA=Y"：接受用户许可
- -e "MSSQL_SA_PASSWORD=<YourStrong@Passw0rd>" 设置密码
- -e "MSSQL_COLLATION=<SQL_Server_collation>" 指定排序规则
- -p 1433:1433 端口映射
- --name sql1 容器名称
- --hostname sql1 设置容器主机名称
- -d 容器后台运行
- mcr.microsoft.com/mssql/server:2022-latest 容器镜像

运行的时候发现端口被占用，但是没有找到，解决方法是 WinNAT 服务重启一下，需要管理员权限

```shell
net stop winnat // 停止WinNAT服务
net start winnat // 重新启动WinNAT服务
```

安装一个 sqlcmd

```shell
winget install sqlcmd
```

修改系统管理员密码，我不修改了

```shell
docker exec -it sql1 /opt/mssql-tools/bin/sqlcmd `
   -S localhost -U SA -P "<YourStrong@Passw0rd>" `
   -Q "ALTER LOGIN SA WITH PASSWORD='<YourNewStrong@Passw0rd>'"
```

连接到 sqlserver

```shell
docker exec -it sql1 "bash"
```

在容器内部进行连接

```shell
sudo /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Kilos.123"
```

从外部进行连接

```shell
sqlcmd -S localhost,1433 -U SA -P "Kilos.123"
```

不使用的时候关掉容器

```shell
docker stop sql1
```

## 后续使用

启动容器

```shell
docker start sql1
```

正常连接使用就可以了，后面不想要了就可以删除关闭

```shell
docker stop sql1
docker rm sql1
docker rmi mcr.microsoft.com/mssql/server:2022-latest
```
