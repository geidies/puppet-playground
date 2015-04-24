define loadbalance::backend_instance (
    $listening_service = $name,
    $ports = '8080',
    $server_names = [],
    $ip_addresses = [],
    $options = {},
){
    haproxy::backend {$listening_service:
        options => $options,
    }
        
    haproxy::balancermember { $listening_service:
        listening_service => $listening_service,
        ports             => $ports,
        server_names      => $server_names,
        ipaddresses       => $ip_addresses,
    }
}
