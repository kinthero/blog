---
date:
  created: 2025-06-07
categories:
  - how-to
---

# 树莓派设置

## 网络问题

### 下载 mihomo

mihomo 这里就直接使用命令行版本，可以从 [github](https://github.com/MetaCubeX/mihomo/releases) 下载，下载的版本是 xxx-linux-arm64-xxx.deb
将文件通过 scp 复制到树莓派

```shell
scp .\mihomo-linux-arm64-alpha-xx.deb kilos@192.168.101.xx:~/
```

### 安装文件

```shell
sudo dpkg -i mihomo-linux-arm64-alpha-xx.deb
```

### 配置文件

编辑 `/etc/mihomo/config.yaml` 文件，如果不存在就创建
具体内容查看这两个链接

- [快捷配置 - 虚空终端 Docs](https://wiki.metacubex.one/example/conf/)
- [代理集合配置 - 虚空终端 Docs](https://wiki.metacubex.one/config/proxy-providers/)

创建完成配置文件可以测试一下

```shell
mihomo -t
```

创建服务启动可以参考[创建运行服务 - 虚空终端 Docs](https://wiki.metacubex.one/startup/service/)

```shell
# 开启 mihomo 服务
systemctl start mihomo

# 重新加载
systemctl reload mihomo

# 查看状态
systemctl status mihomo

# 停止服务
systemctl stop mihomo

# 关闭自启动服务
systemctl disable mihomo

# 查看运行日志
journalctl -u mihomo -o cat -e
```
