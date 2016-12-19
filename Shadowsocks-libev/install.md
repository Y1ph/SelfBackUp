# Shadowsocks-libev
## 从Source编译
首先创建工作文件夹：
```bash
mkdir /etc/shadowsocks-libev/
cd /etc/shadowsocks-libev/
```

安装依赖：
```bash
apt-get install --no-install-recommends build-essential autoconf libtool libssl-dev \
	gawk debhelper dh-systemd init-system-helpers pkg-config asciidoc xmlto apg libpcre3-dev
```
下载源码：
```bash
git clone https://github.com/shadowsocks/shadowsocks-libev.git
```

编译：
```bash
dpkg-buildpackage -b -us -uc -i
```
运行：
```bash
cd ..
dpkg -i shadowsocks-libev*.deb
```
## 从库中安装
此方法得到的版本较低，不推荐。
```bash
apt update
apt install shadowsocks-libev
```

## 配置与启动
采用config文件方式配置。
```bash
vim /etc/shadowsocks/config.json
```
启动选项见：
```bash
vim /etc/default/shadowsocks-libev
```
启动：
```bash
/etc/init.d/shadowsocks-libev start
```
