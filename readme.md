# Percona XtraDB Cluster (PXC) Demo

Quickly get a [Percona XtraDB Cluster](http://www.percona.com/software/percona-xtradb-cluster) cluster up and running with [Vagrant](http://www.vagrantup.com/) & some shell magic. The base OS is Centos 6.4 x86_64.

You'll also get an HAProxy node which will round-robin connect you to any of the three nodes configured for HA failover. Go ahead, kill -9 a server with a loop running in the background -- you'll have about 2 seconds of potential down time.

## Get'er'done

 1. Install [Vagrant](http://www.vagrantup.com/)
 2. Clone this repo
 3. `vagrant up`

## After Startup

The HAProxy node will come up first and you can watch http://127.0.0.1:8080/haproxy/stats -- it'll be a bit boring right up to the point where m1 comes online and you see it go green in the status board.

Once m2 is up, you can start using your favorite mysql client to connect to 127.0.0.1:3306 with the userpass of `cu` and `cu` to the `clusterup` database. Note how you don't have to wait for m3 to come up, neat :D 

## Notes/TODOs

 - Add some load testing harnesses for fun times
 - CHAOS MONKIES!
 - Totes' not safe for a real production deployment (Vagrant boxes come with a publicly known SSH keypair.)

## References

 * http://www.percona.com/doc/percona-xtradb-cluster/5.6/howtos/cenots_howto.html#centos-howto <-- pretty much just turned that into a few shell scripts + some vagrant
