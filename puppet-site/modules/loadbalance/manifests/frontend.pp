class loadbalance::frontend {
    $real_instance = hiera_hash(loadbalance::frontend::instance)
    create_resources(loadbalance::frontend_instance, $real_instance)
}
