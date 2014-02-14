#!/bin/bash
set -e
set -x

source /vagrant/bootstrap/bootstrap.sh

rpm -Uvh /vagrant/chef-server-11.0.10-1.el5.x86_64.rpm

chef-server-ctl reconfigure
sleep 10
chef-server-ctl test
