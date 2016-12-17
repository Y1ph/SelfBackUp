# Kcptun

## 安装

即下载与解压：
```bash
wget https://github.com/xtaci/kcptun/releases/download/vLATEST/kcptun-linux-amd64-LATEST.tar.gz
```

将`LATEST`改为最新版本号。

```bash
tar –zxf kcptun–linux–amd64-*.tar.gz
```

## 启动与停止

启动：
创建`start.sh`，并写入：
```bash
#!/bin/sh
cd KCPTUNDIR
./server_linux_amd64 -c kcptun.cfg 2>&1 &
```

其中`KCPTUNDIR`为`server_linux_amd64`和`kcptun.cfg`共同存在的文件夹。

停止：
创建`stop.sh`，并写入：
```bash
#!/bin/sh
PID=`ps -ef | grep server_linux_amd | grep -v grep | awk '{print $2}'`
if [["" != "$PID" ]]; then
echo "killing $PID"
kill -9 $PID
fi
```

重启：
创建`restart.sh`，并写入：
```bash
#!/bin/sh
cd KCPTUNDIR
echo "Stopping Kcptun..."
sh stop.sh
sh start.sh
echo "Kcptun started."
```

添加执行权限：
```bash
chmod +x *.sh
```

启动：
```bash
sh start.sh
```
