
Vagrant.require_version ">= 1.4.3"

Vagrant.configure("2") do |config|
  config.vm.box = "opscode-centos-5.9"
  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_centos-5.9_provisionerless.box"

  config.vm.define :chef_server do |chef_server|
    chef_server.vm.hostname = "chef-server.example.com"
    chef_server.vm.network :private_network, ip: "10.1.1.10", netmask: "255.255.255.0"
    chef_server.ssh.forward_agent = true

    chef_server.vm.provision :shell do |shell|
      shell.path = "bootstrap/bootstrap-chef-server.sh"
    end

  end

  config.vm.define :chef_workstation do |chef_workstation|
    chef_workstation.vm.hostname = "chef-workstation.example.com"
    chef_workstation.vm.network :private_network, ip: "10.1.1.11", netmask: "255.255.255.0"
    chef_workstation.ssh.forward_agent = true

    chef_workstation.vm.provision :shell do |shell|
      shell.path = "bootstrap/bootstrap-chef-workstation.sh"
    end

  end

  config.vm.define :chef_node do |chef_node|
    chef_node.vm.hostname = "chef-node.example.com"
    chef_node.vm.network :private_network, ip: "10.1.1.12", netmask: "255.255.255.0"

    chef_node.vm.provision :shell do |shell|
      shell.path = "bootstrap/bootstrap-chef-node.sh"
    end

  end

end
