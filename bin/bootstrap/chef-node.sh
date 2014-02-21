#!/bin/bash
set -e
set -x

source /vagrant/bin/bootstrap/bootstrap.sh

echo "Installing chef-client..."
rpm -Uvh /vagrant/chef-11.10.4-1.el6.x86_64.rpm
chef-client -v

mkdir /etc/chef
