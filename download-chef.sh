#!/bin/bash
set -e
set -x

wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
wget https://opscode-omnibus-packages.s3.amazonaws.com/el/5/x86_64/chef-11.10.0-1.el5.x86_64.rpm
wget https://opscode-omnibus-packages.s3.amazonaws.com/el/5/x86_64/chef-server-11.0.10-1.el5.x86_64.rpm
