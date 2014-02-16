#!/bin/bash
set -e
set -x

echo "Installing /etc/hosts"
echo "10.1.1.10 chef-server.example.com" >> /etc/hosts
echo "10.1.1.11 chef-workstation.example.com" >> /etc/hosts
echo "10.1.1.12 chef-node.example.com" >> /etc/hosts

echo "Installing rpmforge..."
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
rpm -Uvh /vagrant/rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm

echo "Installing somes packages..."
yum install wget curl git vim-common vim-enhanced vim-minimal -y

echo "Coping ssh keys..."
mkdir /root/.ssh
cp -f /vagrant/keys/vagrant /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
echo /vagrant/keys/vagrant.pub > /root/.ssh/authorized_keys
