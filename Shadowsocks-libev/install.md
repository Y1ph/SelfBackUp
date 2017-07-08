# Shadowsocks-libev

## 从Source编译

首先创建工作文件夹：

```bash
mkdir /etc/shadowsocks-libev/
cd /etc/shadowsocks-libev/
```

安装依赖：

```bash
sudo apt-get install --no-install-recommends gettext build-essential autoconf libtool libpcre3-dev asciidoc xmlto libev-dev libudns-dev automake libmbedtls-dev libsodium-dev
```
下载源码并解压（假设最新版本为3.0.4，详见[https://github.com/shadowsocks/shadowsocks-libev/releases](https://github.com/shadowsocks/shadowsocks-libev/releases)）：

```bash
export SHADOWSOCKS_VER=3.0.4
wget https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$SHADOWSOCKS_VER/shadowsocks-libev-$SHADOWSOCKS_VER.tar.gz
tar xvf shadowsocks-libev-$SHADOWSOCKS_VER.tar.gz
cd shadowsocks-libev-$SHADOWSOCKS_VER
```

编译安装：

```bash
sudo autoreconf --install --force
./configure && make
sudo make install
```

## 从库中安装
此方法得到的版本较低，不推荐。
```bash
apt update
apt install shadowsocks-libev
```

## 优化
参见 [https://shadowsocks.org/en/config/advanced.html](https://shadowsocks.org/en/config/advanced.html)

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

## 在线PAC
https://raw.githubusercontent.com/Zheart/SelfBackUp/master/Shadowsocks-libev/pac-new.txt
