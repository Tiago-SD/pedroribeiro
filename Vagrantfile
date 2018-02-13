# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

vconfig = YAML::load_file("Vagrantconfig.yml")

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :private_network, ip:"10.0.10.16"
  config.vm.network :forwarded_port, guest:80, host:8081

  config.vm.synced_folder ".", "/vagrant", :nfs => vconfig['nfs']
  config.vm.synced_folder vconfig['shared_folders']['pedroribeiro'] , "/var/local/www/pedroribeiro", :nfs => vconfig['nfs']

  config.vm.provider :virtualbox do |vb|
      vb.customize [
	  "modifyvm", :id,
	  '--chipset', 'ich9',
	  '--natdnsproxy1' , 'on',
	  '--memory', vconfig['memory']
	  ]
  end

end
