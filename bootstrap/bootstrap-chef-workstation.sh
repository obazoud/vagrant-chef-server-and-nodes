#!/bin/bash
set -e
set -x

source /vagrant/bootstrap/bootstrap.sh

rpm -Uvh /vagrant/chef-11.10.0-1.el5.x86_64.rpm
chef-client -v

mkdir ~/.chef
