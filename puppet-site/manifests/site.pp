Exec { path => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin' }
$confdir   = '/etc/puppet-site'

node default {
    hiera_include('classes')
}
