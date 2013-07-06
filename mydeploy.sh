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
