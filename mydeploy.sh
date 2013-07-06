#!/bin/bash
echo "installing required things:"
rpm -Uvh http://ftp.linux.ncsu.edu/pub/epel/6/i386/epel-release-6-8.noarch.rpm
yum install salt-master salt-cloud python-pip sshpass
python-pip install apache-libcloud
salt-cloud --update-bootstrap
echo "Moving the required files into place"
cp -a ./salt /srv/salt
cp -a ./pillar /srv/pillar
cp -a ./cloud /etc/salt/cloud
cp -a ./cloud.profiles /etc/salt/cloud.profiles
iptables -I INPUT -p tcp --dport 4505 -j ACCEPT
iptables -I INPUT -p tcp --dport 4506 -j ACCEPT
service iptables save
echo "You will now need to edit the /etc/csalt/cloud and the etc/salt/cloud.providers to set the correct settings. "
echo "You can then run a command like this to build a new server:"
echo " salt-cloud -p cent_512 web-servername"

