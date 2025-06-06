---
date:
  created: 2025-06-07
categories:
  - how-to
---

# docker 网络代理

## 设置代理来拉取镜像

配置 `/etc/docker/daemon.json`

```json
{
  "proxies": {
    "http-proxy": "http://127.0.0.1:7890",
    "https-proxy": "http://127.0.0.1:7890",
    "no-proxy": "localhost,127.0.0.1"
  }
}
```

## 容器内使用代理

首先，使用 docker run 的时候需要添加 `--net host`，让容器使用宿主网络，也就是当前电脑的网络

然后在命令行中使用代理命令：

```bash
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=http://127.0.0.1:7890
```

查看是否配置成功

```bash
docker run --net host --rm alpine sh -c "wget -qO - ifconfig.co/country"
```
