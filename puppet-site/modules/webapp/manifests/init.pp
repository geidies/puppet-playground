#doc
class webapp {
    Class['monit'] -> Class['webapp']
    file { '/opt/apps':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
    }
    file { '/opt/apps/web':
      ensure  => directory,
      owner   => 'root',
      group   => 'root',
      require => File['/opt/apps'],
    }
    file { '/opt/apps/tomcat':
      ensure  => directory,
      owner   => 'tomcat',
      group   => 'tomcat',
      require => File['/opt/apps'],
    }

    package { 'redhat-lsb':
      ensure => present,
    }

}
