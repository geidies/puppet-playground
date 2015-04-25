class basic {
    include stdlib
    file { "/etc/motd":
      ensure  => present,
      content => "Hello Thoughtworks.\n${::hostgroupid}\n${::clientcert}\n"
    }

    # turn off iptables. For the sake of this excercise, we can assume proper VLan isolation with a firewall in between.
    # vagrant can "randomly" assign ports for ssh, and that should not be closed by aggressive firewalling.
    service { "iptables":
      ensure => stopped,
    }
}
