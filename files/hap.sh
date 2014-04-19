#!/bin/bash

yum install -y haproxy.x86_64

echo '

global
    log 127.0.0.1 local0
    log 127.0.0.1 local1 notice
    maxconn 4096
    chroot /usr/share/haproxy
    user haproxy
    group haproxy
    daemon

defaults
    log global
    mode http
    option tcplog
    option dontlognull
    retries 3
    option redispatch
    maxconn 2000
    contimeout 5000
    clitimeout 50000
    srvtimeout 50000

frontend pxc-front
    bind *:3306
    mode tcp
    default_backend pxc-back

backend pxc-back
    mode tcp
    balance leastconn
    option httpchk
    server m1 192.168.56.31:3306 check port 9200 inter 2s rise 3 fall 3
    server m2 192.168.56.32:3306 check port 9200 inter 2s rise 3 fall 3
    server m3 192.168.56.33:3306 check port 9200 inter 2s rise 3 fall 3

frontend stats-front
    bind *:80
    mode http
    default_backend stats-back

backend stats-back
    mode http
    balance roundrobin
    stats uri /haproxy/stats
    stats auth pxcstats:secret

' > /etc/haproxy/haproxy.cfg

/etc/init.d/haproxy restart

chkconfig haproxy on
