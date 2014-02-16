#!/bin/bash
set -e
set -x

source /vagrant/bin/bootstrap/bootstrap.sh

echo "Installing chef-server..."
rpm -Uvh /vagrant/chef-server-11.0.10-1.el5.x86_64.rpm

echo "Configuring chef-server..."
chef-server-ctl reconfigure 2>&1 | grep -vE "INFO"

sleep 10

chef-server-ctl test 2>&1 | grep -E "Finished|failures"
