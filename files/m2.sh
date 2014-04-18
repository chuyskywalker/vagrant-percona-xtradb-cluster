yum install -y http://www.percona.com/downloads/percona-release/percona-release-0.0-1.x86_64.rpm
yum install -y Percona-Server-shared-51 Percona-XtraDB-Cluster-56

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

# Node #1 address
wsrep_node_address=192.168.56.32

# SST method
wsrep_sst_method=xtrabackup-v2

# Cluster name
wsrep_cluster_name=demo_cluster

# Authentication for SST method
wsrep_sst_auth="sstuser:s3cret"
' > /etc/my.cnf

/etc/init.d/mysql start

mysql -uroot -te "show status like 'wsrep%';" | egrep 'wsrep_cluster_size|wsrep_cluster_status|wsrep_connected|wsrep_local_state|wsrep_local_state_comment|Variable_name|\+'
