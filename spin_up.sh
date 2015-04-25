#/bin/sh

# make sure git modules are synched.

echo "initializing git modules"
git submodule init

echo "checking out git modules"
git submodule update


# spin up VMs.
# the second provision is because I wasn't able to set all puppet class dependencies correctly,
# and for some combination of classes, the second installs before the first.

echo "spinning up nfs server and loadbalancer."
vagrant up nfs_1 lb_1
vagrant provision nfs_1 lb_1
vagrant provision nfs_1 lb_1

echo "spinning up app servers. Please be patient."
vagrant up app_1 app_2
vagrant provision app_1 app_2
vagrant provision app_1 app_2

echo "spinning up web servers. A bit quicker than app, but still takes a while."
vagrant up web_1 web_2
vagrant provision web_1 web_2
vagrant provision web_1 web_2


