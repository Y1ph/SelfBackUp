# shadowsocks

## 安装
```bash
apt update
apt install python-pip
pip install shadowsocks
```

## 启动
```bash
ssserver -c shadowsocks.json -d start
```

## 优化
参见 [https://shadowsocks.org/en/config/advanced.html](https://shadowsocks.org/en/config/advanced.html)

## chacha20支持
安装`libsodium`:
```bash
wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz
tar -zxf LATEST.tar.gz
cd libsodium-1.0.10
# 编译安装
./configure && make && make install
# 关联
echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf
ldconfig
``` 
