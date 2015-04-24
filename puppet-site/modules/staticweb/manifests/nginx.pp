define staticweb::nginx (
  $vhost       = $title,
  $listen_port = '8080'
  ){
    include 'nginx'

    # there are dependency issues between the tomcat and the nginx module.
    # installation of the vhost fails - workaround: vhost definition as a
    # static file
    # 
    # nginx::resource::vhost { $vhost:
    #   ensure      => present,
    #   listen_port => $listen_port,
    #   www_root    => "/var/www/$vhost",
    # }

    file { "/etc/nginx/sites-available/$vhost.conf":
      ensure  => present,
      content => template("staticweb/vhost.conf.erb"),
      owner   => 'root',
      group   => 'root',
      notify  => Service['nginx'],
    }

    file { "/var/www/$vhost":
      ensure  => directory,
      owner   => 'nginx',
      group   => 'nginx',
    }

}
