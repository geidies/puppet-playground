# -*- mode: ruby -*-
# vi: set ft=ruby :
#

def common_config cfg
  cfg.vm.box = "puppetlabs/centos-6.6-64-puppet"
  cfg.vm.synced_folder 'puppet-site', '/etc/puppet-site', :nfs => ENV.fetch('VAGRANT_NFS', 'true').casecmp('true') == 0
  cfg.vm.provision :shell, :inline => 'puppet apply --hiera_config /etc/puppet-site/hiera.yaml --modulepath=/etc/puppet-site/modules /etc/puppet-site/manifests/site.pp'
end

Vagrant.configure(2) do |config|

  # Loadbalancer.
  # They usually come in pairs, but they usually 
  # server more than one application. Either get
  # a hardware pair, or use heartbeat/drdb.
  config.vm.define :lb_1 do |cfg|
    common_config cfg
    cfg.vm.network "private_network", ip: "10.201.0.100"
    cfg.vm.network "forwarded_port", guest: 80, host: 8081
    cfg.vm.hostname = "vdr-pjct-dlb-001.dc.example.net"
  end

  # NFS server.
  # Never in software, except for a PoC.
  config.vm.define :nfs_1 do |cfg|
    common_config cfg
    cfg.vm.network "private_network", ip: "10.201.0.200"
    cfg.vm.hostname = "vdr-pjct-dfs-001.dc.example.net"
  end

  # Web servers.
  # One VM per file in the example task's asset zip.
  # are load-balanced round-robin, in case those unused
  # assets get onto the frontpage of hacknews. Or /. for
  # us old-schoolers.
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

  # Application servers.
  # Those can't be round-robin'd, since the development chose
  # to use a file-based persistence approach instead of a RDBMS.
  # With that, effectively and efficiently shifting the time it
  # needs to think about a scalable solution to the Operations
  # folks. Those are happy, implemented active-passive and put the
  # file onto the NFS.
  # Well played with the glob in the path, BTW: 
  # Oh my god - it's full of stars.
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
end
