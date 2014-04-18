# Percona XtraDB Cluster (PXC) Demo

Quickly get a [Percona XtraDB Cluster](http://www.percona.com/software/percona-xtradb-cluster) cluster up and running with [Vagrant](http://www.vagrantup.com/) & some shell magic. The base OS is Centos 6.4 x86_64.

## Get'er'done

 1. Install [Vagrant](http://www.vagrantup.com/)
 2. Clone this repo
 3. `vagrant up`

## Notes/TODOs

 - Add HAProxy
 - Add some load testing harnesses for fun times
 - CHAOS MONKIES!
 - Totes' not safe for a real production deployment (Vagrant boxes come with a
   publicly known SSH keypair.)

## References

 * http://www.percona.com/doc/percona-xtradb-cluster/5.6/howtos/cenots_howto.html#centos-howto <-- pretty much just turned that into a few shell scripts + some vagrant
