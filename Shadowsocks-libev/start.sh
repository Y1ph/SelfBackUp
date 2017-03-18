#!/bin/bash


### BEGIN INIT INFO
# Provides:          Yiph_Goth
# Required-Start:    $local_fs $network
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: shadowsocks
# Description:       shadowsocks-libev autostart
### END INIT INFO


cd /etc/shadowsocks-libev
ss-server -c config.json -u -d 8.8.8.8 --fast-open -a nobody 2>&1 &
