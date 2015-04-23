class basic {
    include stdlib
    file { "/etc/motd":
      ensure  => present,
      content => "Hello Thoughtworks.\n${::hostgroupid}\n${::clientcert}\n"
    }
}
