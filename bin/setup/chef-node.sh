#!/bin/bash
set -e
set -x

echo "Installing chef-server..."
sudo chef-client -S https://chef-server.example.com -K /etc/chef/chef-validator.pem

sudo rm -f /etc/chef/client.rb
sudo touch /etc/chef/client.rb
echo "log_level        :info" | sudo tee -a /etc/chef/client.rb
echo "log_location     STDOUT" | sudo tee -a /etc/chef/client.rb
echo "chef_server_url  'https://chef-server.example.com'" | sudo tee -a /etc/chef/client.rb

sudo chef-client
