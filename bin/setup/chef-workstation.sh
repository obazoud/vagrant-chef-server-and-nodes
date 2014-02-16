#!/bin/bash
set -e
set -x

sudo knife configure --initial << EOF
/root/.chef/knife.rb
https://chef-server.example.com:443
knife-user
admin
/root/.chef/admin.pem
chef-validator
/root/.chef/chef-validator.pem

knife-user
EOF

sudo cat /root/.chef/knife.rb

sleep 10

sudo knife client list
sudo knife user list
