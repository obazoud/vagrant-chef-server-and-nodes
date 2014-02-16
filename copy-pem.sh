#!/bin/bash
set -e
set -x

vagrant ssh-config chef_server > .vagrant.chef_server.ssh.config
vagrant ssh-config chef_workstation > .vagrant.chef_workstation.ssh.config
vagrant ssh-config chef_node > .vagrant.chef_node.ssh.config

vagrant ssh chef_server -c "sudo rm -f /tmp/admin.pem; sudo cp /etc/chef-server/admin.pem /tmp/admin.pem; sudo chown vagrant:vagrant /tmp/admin.pem"
vagrant ssh chef_server -c "sudo rm -f /tmp/chef-validator.pem; sudo cp /etc/chef-server/chef-validator.pem /tmp/chef-validator.pem; sudo chown vagrant:vagrant /tmp/chef-validator.pem"
scp -F .vagrant.chef_server.ssh.config chef_server:/tmp/admin.pem .
scp -F .vagrant.chef_server.ssh.config chef_server:/tmp/chef-validator.pem .

scp -F .vagrant.chef_workstation.ssh.config admin.pem chef_workstation:/tmp/admin.pem
scp -F .vagrant.chef_workstation.ssh.config chef-validator.pem chef_workstation:/tmp/chef-validator.pem
vagrant ssh chef_workstation -c "sudo chown root:root /tmp/admin.pem; sudo mv /tmp/admin.pem /root/.chef/admin.pem"
vagrant ssh chef_workstation -c "sudo chown root:root /tmp/chef-validator.pem; sudo mv /tmp/chef-validator.pem /root/.chef/chef-validator.pem"

vagrant ssh chef_node -c "sudo rm -f /tmp/chef-validator.pem; sudo rm -f /etc/chef/chef-validator.pem"
scp -F .vagrant.chef_node.ssh.config chef-validator.pem chef_node:/tmp/chef-validator.pem
vagrant ssh chef_node -c "sudo chown root:root /tmp/chef-validator.pem; sudo mv /tmp/chef-validator.pem /etc/chef/chef-validator.pem"
