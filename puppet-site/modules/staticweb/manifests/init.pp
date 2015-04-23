#doc
class staticweb {
    Class['monit'] -> Class['staticweb']
    file { '/var/www':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
    }
}
