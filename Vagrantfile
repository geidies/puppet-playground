# -*- mode: ruby -*-
# vi: set ft=ruby :
#

def common_config cfg
  # cfg.vm.box = "puppetlabs/centos-6.6-64-puppet"
  cfg.vm.box = 'mw-centos6-64-8'
  cfg.vm.synced_folder 'puppet-site', '/etc/puppet-site', :nfs => ENV.fetch('VAGRANT_NFS', 'true').casecmp('true') == 0
  cfg.vm.provision :shell, :inline => 'puppet apply --hiera_config /etc/puppet-site/hiera.yaml --modulepath=/etc/puppet-site/modules /etc/puppet-site/manifests/site.pp'
end

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.define :lb_1 do |cfg|
    common_config cfg
    cfg.vm.network "private_network", ip: "10.201.0.100"
    cfg.vm.hostname = "vdr-pjct-dlb-001.dc.example.net"
  end

  config.vm.define :web_1 do |cfg|
    common_config cfg
    cfg.vm.network "private_network", ip: "10.201.0.2"
    cfg.vm.hostname = "vdr-pjct-dws-001.dc.example.net"
  end

  config.vm.define :web_2 do |cfg|
    common_config cfg
    cfg.vm.network "private_network", ip: "10.201.0.3"
    cfg.vm.hostname = "vdr-pjct-dws-002.dc.example.net"
  end

  config.vm.define :app_1 do |cfg|
    common_config cfg
    cfg.vm.network "private_network", ip: "10.201.0.12"
    cfg.vm.hostname = "vdr-pjct-das-001.dc.example.net"
  end

  config.vm.define :app_2 do |cfg|
    common_config cfg
    cfg.vm.network "private_network", ip: "10.201.0.13"
    cfg.vm.hostname = "vdr-pjct-das-002.dc.example.net"
  end
    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # core.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
