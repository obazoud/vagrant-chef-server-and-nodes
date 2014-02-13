
Vagrant.configure("2") do |config|
	config.vm.box = "opscode-centos-6.4"
	config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_centos-6.4_provisionerless.box"


	config.vm.define :chefserver do |chefserver|
		chefserver.vm.hostname = "chef-server"
	end
end
