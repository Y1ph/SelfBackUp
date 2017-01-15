# OpenVPN
## OpenVPN安装
### 最新版本源码make
#### 安装依赖
##### 1. lzo:
```bash
mkdir /etc/lzo
cd /etc/lzo
wget http://www.oberhumer.com/opensource/lzo/download/lzo-2.09.tar.gz
```
注意2.09可能不是最新版本，可以进入[http://www.oberhumer.com/opensource/lzo/download/](http://www.oberhumer.com/opensource/lzo/download/)查看最新版本。
```bash
tar zxvf lzo-*
cd lzo-*
./configure
make & make install
```
如果缺少`libtool`，可以
```bash
apt install libtool-bin
```

##### 2. libpam:

```bash
apt install libpam0g-dev
```
#### 下载源码并安装
```bash
mkdir /etc/openvpn/build
cd /etc/openvpn/build
wget http://build.openvpn.net/downloads/releases/latest/openvpn-latest-stable.tar.gz
tar zxvf openvpn-latest-stable.tar.gz
cd openvpn-*
./configure
make & make install
```

### apt源安装
此方法与上述从源码make的方法二选一即可，但是此方法可能无法得到最新版本。
```bash
apt update
apt install openvpn
```

## 安装证书
### 安装easy-rsa:
```bash
apt update
apt install easy-rsa
```
### 生成证书:
```bash
cp -r /usr/share/easy-rsa/ /etc/openvpn/
cd /etc/openvpn/easy-rsa/
vim vars
```
在`vars`文件中修改以下内容:
```bash
export KEY_COUNTRY="YOURCOUNTRY"
export KEY_PROVINCE="YOURPROVINCE"
export KEY_CITY="YOURCITY"
export KEY_ORG="YOURORGANIZATION"
export KEY_EMAIL="me@myhost.mydomain"
export KEY_NAME="KEYSNAME"
```
保存退出后
```bash
source vars
./clean-all
./build-ca
```
服务器证书
```bash
./build-key-server SERVERNAME
./build-dh
cd /etc/openvpn/easy-rsa/keys
cp SERVERNAME.crt SERVERNAME.key ca.crt dh2048.pem /etc/openvpn
```
生成OpenVPN tls auth key
```bash
cd /etc/openvpn
openvpn --genkey --secret ta.key
```
生成客户端证书
```bash
cd /etc/openvpn/easy-rsa
source vars
./build-key CLIENTNAME
```

## 开启服务器
在`/etc/openvpn/`文件夹下创建n个`conf`文件作为服务器配置文件，其示例可通过以下命令得到:
```bash
cp /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz /etc/openvpn/
gzip -d /etc/openvpn/server.conf.gz
vim /etc/openvpn/server.conf
```
### uPNP支持
```bash
apt install linux-igd

cat <<__EOF__ > /etc/openvpn/server.up
#!/bin/sh
/usr/sbin/upnpd eth0 tun0
__EOF__
 
cat <<__EOF__ > /etc/openvpn/server.down
#!/bin/sh
/usr/bin/killall upnpd
__EOF__
 
chmod +x /etc/openvpn/server.up /etc/openvpn/server.down
```
###iptables配置
```bash
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```
其中`eth0`为你想转发的网卡名，一般默认为`eth0`。
保存配置:
```bash
iptables-save > /etc/iptables.rules
vim /etc/network/if-up.d/iptables
```
这是个新文件，应该写入
```bash
#!/bin/sh
iptables-restore < /etc/iptables.rules
```
保存后提权:
```bash
chmod +x /etc/network/if-up.d/iptables
```
### sysctl配置
```bash
vim /etc/sysctl.conf
```
在文件中使以下内容生效
```bash
net.ipv4.ip_forward=1
net.ipv6.conf.all.forwarding=1
net.ipv4.conf.all.accept_redirects = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv4.conf.all.send_redirects = 0
```
之后使文件生效:
```bash
sysctl -p
```
以上则完成了服务端的配置，此时需要重启所有相关服务，建议直接重启。

## 客户端文件
客户端文件包括`CLIENTNAME.ovpn`以及在服务器中的以下文件
```bash
/etc/openvpn/ca.crt
/etc/openvpn/ta.key
/etc/openvpn/easy-rsa/keys/CLIENTNAME.crt
/etc/openvpn/easy-rsa/keys/CLIENTNAME.key
```
其中客户端配置文件示例可由下述命令获得:
```bash
cd /etc/openvpn
cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf .
```
