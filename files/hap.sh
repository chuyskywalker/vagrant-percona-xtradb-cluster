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
    # The config lets you set up 1-9 nodes, so we cover them all here just in case
    server m1 192.168.56.31:3306 check port 9200 inter 5s rise 3 fall 3
    server m2 192.168.56.32:3306 check port 9200 inter 5s rise 3 fall 3
    server m3 192.168.56.33:3306 check port 9200 inter 5s rise 3 fall 3
    server m4 192.168.56.34:3306 check port 9200 inter 5s rise 3 fall 3
    server m5 192.168.56.35:3306 check port 9200 inter 5s rise 3 fall 3
    server m6 192.168.56.36:3306 check port 9200 inter 5s rise 3 fall 3
    server m7 192.168.56.37:3306 check port 9200 inter 5s rise 3 fall 3
    server m8 192.168.56.38:3306 check port 9200 inter 5s rise 3 fall 3
    server m9 192.168.56.39:3306 check port 9200 inter 5s rise 3 fall 3

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


# Install newer sysbench
yum install -y bzr mysql-devel gcc gcc-c++ autoconf automake make libtool
bzr branch lp:sysbench
cd sysbench
./autogen.sh
./configure --prefix=/usr --mandir=/usr/share/man
make
make install

# install the oltp lua test
mkdir /usr/share/sysbench/tests/db -p
cp sysbench/tests/db/* /usr/share/sysbench/tests/db

## sysbench --test=/usr/share/sysbench/tests/db/oltp.lua --db-driver=mysql --mysql-engine-trx=yes --mysql-table-engine=innodb --mysql-host=127.0.0.1 --mysql-port=3306 --mysql-user=cu --mysql-password=cu --mysql-db=clusterup --oltp-table-size=10000 prepare
## sysbench --test=/usr/share/sysbench/tests/db/oltp.lua --db-driver=mysql --mysql-engine-trx=yes --mysql-table-engine=innodb --mysql-host=127.0.0.1 --mysql-port=3306 --mysql-user=cu --mysql-password=cu --mysql-db=clusterup --oltp-table-size=10000 --num-threads=16 run