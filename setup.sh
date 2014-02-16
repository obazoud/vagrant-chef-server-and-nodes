#!/bin/bash
set -e
set -x

vagrant destroy --force
vagrant up

./copy-pem.sh

vagrant ssh chef_workstation -c "sudo /vagrant/bin/setup/chef-workstation.sh"
vagrant ssh chef_node -c "sudo /vagrant/bin/setup/chef-node.sh"
