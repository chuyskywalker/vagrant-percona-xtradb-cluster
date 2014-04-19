#!/bin/bash

yum install -y http://www.percona.com/downloads/percona-release/percona-release-0.0-1.x86_64.rpm
yum install -y Percona-Server-shared-51 Percona-XtraDB-Cluster-56 xinetd

echo '[mysqld]

datadir=/var/lib/mysql
user=mysql

# Path to Galera library
wsrep_provider=/usr/lib64/libgalera_smm.so

# Cluster connection URL contains the IPs of node#1, node#2 and node#3
wsrep_cluster_address=gcomm://192.168.56.31,192.168.56.32,192.168.56.33

# In order for Galera to work correctly binlog format should be ROW
binlog_format=ROW

# MyISAM storage engine has only experimental support
default_storage_engine=InnoDB

# This changes how InnoDB autoincrement locks are managed and is a requirement for Galera
innodb_autoinc_lock_mode=2

# Node address
wsrep_node_address='"$2"'

# SST method
wsrep_sst_method=xtrabackup-v2

# Cluster name
wsrep_cluster_name=demo_cluster

# Authentication for SST method
wsrep_sst_auth="sstuser:s3cret"

' > /etc/my.cnf

if [ "$1" == '1' ]; then
  /etc/init.d/mysql bootstrap-pxc
  mysql -uroot -e "GRANT RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'sstuser'@'localhost' IDENTIFIED BY 's3cret';"
  mysql -uroot -e 'GRANT PROCESS ON *.* TO "clustercheckuser"@"localhost" IDENTIFIED BY "clustercheckpassword!";'
  mysql -uroot -e 'create database clusterup;'
  mysql -uroot -e 'grant all on clusterup.* to "cu"@"%" identified by "cu";'
  mysql -uroot -e "FLUSH PRIVILEGES;"
else
  /etc/init.d/mysql start
fi

mysql -uroot -te "show status like 'wsrep%';" | egrep 'wsrep_cluster_size|wsrep_cluster_status|wsrep_connected|wsrep_local_state|Variable_name|\+'

echo 'mysqlchk 9200/tcp # mysqlchk' >> /etc/services
/etc/init.d/xinetd restart

chkconfig xinetd on
chkconfig mysql on
