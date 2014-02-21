#!/bin/bash
set -e
set -x

wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
wget https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-11.10.4-1.el6.x86_64.rpm
wget https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-server-11.0.11-1.el6.x86_64.rpm
