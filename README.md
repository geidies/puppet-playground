Example full environment setup
==============================

This repository has definitions for vagrant VMs and a puppet repository that can be used to configure the machines. It is just an example for a complex environment with load balancer, web servers and application servers.

Spinning up
-----------

You'll need Virtualbox (http://virtualbox.org/) and Vagrant (https://vagrantup.com). you'd also need to have a package installed to enable the NFS server vagrant uses - 
On redhat flavors, use:

    yum install nfs-utils nfs-utils-lib
On debian based systems, use:

    apt-get install nfs-server

Use ```spin_up.sh``` to create the full environment, or see the Vagrantfile for the single machine definitions. The load balancer's port will be forwarded to 127.0.0.1:8081 (IPv6 for vagrant is currently not used).


