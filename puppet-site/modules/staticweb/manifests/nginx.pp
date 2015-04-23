define staticweb::nginx (
  $vhost       = $title,
  $listen_port = '8080'
  ){
    include 'nginx'

    file { "/var/www/$vhost":
      ensure => directory,
      owner  => 'nginx',
      group  => 'nginx',
    }

    nginx::resource::vhost { $vhost:
      ensure      => present,
      listen_port => $listen_port,
    }
}
