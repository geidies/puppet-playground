define loadbalance::frontend_instance (
    $listening_service = $name,
    $ipaddress = '*',
    $ports = '80',
    $mode = 'http',
    $acls = [],
    $rules = [],
    $default_backend = 'servers',
    $balance = 'roundrobin'
){
    haproxy::frontend {$name:
      ports             => $ports,
      ipaddress         => $ipaddress,
      mode              => $mode,
      options           => {
        balance         => $balance,
        acl             => $acls,
        use_backend     => $rules,
        default_backend => $default_backend,
      }
    }
        
}
